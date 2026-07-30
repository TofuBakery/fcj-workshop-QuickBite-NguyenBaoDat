# QuickBite — AWS Deployment Guide

Target architecture (topic: *Application Development on AWS*):

```
Customer browser
      │
      ▼
CloudFront ──► S3 (static React build)         S3 (menu images)
      │                                              ▲
      ▼  /api                                        │ presigned/public read
Application on EC2 (Docker: FastAPI backend) ────────┘
      │
      ▼
Amazon RDS (PostgreSQL)          CloudWatch Logs + Alarms
```

Region used throughout: `ap-southeast-1` (Singapore). Adjust as needed.

---

## 0. Prerequisites

- AWS account with billing alerts enabled.
- AWS CLI configured locally (`aws configure`).
- A key pair for EC2 SSH.
- This repository built and tested locally (`docker compose up`).

> Cost control: everything below fits roughly in Free Tier if you use
> `t3.micro`/`db.t3.micro` and delete resources afterwards (see `cleanup.md`).

---

## 1. RDS PostgreSQL

1. RDS ▸ Create database ▸ **PostgreSQL**, template **Free tier**.
2. DB instance: `quickbite-db`, class `db.t3.micro`, 20 GB gp3.
3. Master username `quickbite`, set a strong password (store it, you'll put it in `.env`).
4. Connectivity: same VPC as the EC2 you'll create; **Public access = No**.
5. Create a security group `quickbite-rds-sg` that allows inbound TCP **5432** only
   from the EC2 security group (`quickbite-ec2-sg`), not from `0.0.0.0/0`.
6. After it becomes **Available**, copy the endpoint, e.g.
   `quickbite-db.xxxx.ap-southeast-1.rds.amazonaws.com`.

Load schema, seed and views. Because the RDS instance is **private** (Public access = No),
your laptop on the public internet cannot reach it even if the security group allows your
IP — a private RDS has no route from outside the VPC. So run these **from the EC2 box**
(after Phase 3, once the EC2 → RDS security-group rule is in place):

```bash
# on the EC2 instance
sudo apt install -y postgresql-client
export DB="postgresql://quickbite:<db-password>@<rds-endpoint>:5432/quickbite"
psql "$DB" -f backend/sql/schema_postgres.sql
psql "$DB" -f backend/sql/seed_postgres.sql
psql "$DB" -f backend/sql/views_postgres.sql
```

> Quick-but-less-secure alternative: temporarily set RDS **Public access = Yes** with the
> SG open to *My IP only*, load from your laptop, then turn public access back off. Prefer
> the from-EC2 approach for a cleaner security story in the report.

> For repeatable schema changes prefer Alembic instead of the raw SQL:
> `DATABASE_URL="$DB" alembic upgrade head` (see `backend/README.md`).

**Report screenshot:** RDS *Available* + endpoint + a successful `\dt` listing.

---

## 2. S3 — menu images

1. S3 ▸ Create bucket `quickbite-menu-images-<unique>` in `ap-southeast-1`.
2. Keep "Block all public access" **on** and serve images via CloudFront (recommended),
   or, for a simple demo, allow public read with a bucket policy scoped to `menu/*`:

   ```json
   {
     "Version": "2012-10-17",
     "Statement": [{
       "Sid": "PublicReadMenuImages",
       "Effect": "Allow",
       "Principal": "*",
       "Action": "s3:GetObject",
       "Resource": "arn:aws:s3:::quickbite-menu-images-<unique>/menu/*"
     }]
   }
   ```

3. The backend uploads to `menu/<uuid>.<ext>` via `POST /uploads/image` and stores the
   resulting URL in `items.image_url`.

**Report screenshot:** an uploaded object under `menu/` + the image rendering in the admin menu page.

---

## 3. EC2 — backend (Docker)

1. EC2 ▸ Launch instance `quickbite-app`, Ubuntu 24.04, `t3.micro`.
2. Security group `quickbite-ec2-sg`: inbound **22** (your IP), **80** (0.0.0.0/0),
   **8000** (0.0.0.0/0 for the demo API, or restrict to CloudFront later).
3. Attach an **IAM role** (`quickbite-ec2-role`) with a policy allowing S3 writes to the
   bucket and CloudWatch Logs — so no access keys live on the box:

   ```json
   {
     "Version": "2012-10-17",
     "Statement": [
       { "Effect": "Allow",
         "Action": ["s3:PutObject","s3:GetObject"],
         "Resource": "arn:aws:s3:::quickbite-menu-images-<unique>/*" },
       { "Effect": "Allow",
         "Action": ["logs:CreateLogGroup","logs:CreateLogStream","logs:PutLogEvents"],
         "Resource": "*" }
     ]
   }
   ```

4. SSH in and install Docker:

   ```bash
   sudo apt update && sudo apt install -y docker.io docker-compose-plugin git
   sudo usermod -aG docker ubuntu && newgrp docker
   git clone <your-repo> quickbite && cd quickbite
   ```

5. Create `.env` (never committed):

   ```env
   POSTGRES_PASSWORD=<db-password>
   SECRET_KEY=<long-random-string>
   CORS_ALLOW_ORIGINS=https://<cloudfront-domain>
   AWS_REGION=ap-southeast-1
   S3_BUCKET_NAME=quickbite-menu-images-<unique>
   VITE_API_BASE=http://<ec2-public-ip>:8000
   ```

6. Run **only the backend**, pointed at RDS. Use `docker-compose.aws.yml`, which has no
   `db` service and no `depends_on` — so Docker never starts a local Postgres — and ships
   logs to CloudWatch:

   ```bash
   # .env must contain DATABASE_URL (the RDS string), SECRET_KEY, CORS_ALLOW_ORIGINS, S3_BUCKET_NAME
   docker compose -f docker-compose.aws.yml up --build -d
   curl http://localhost:8000/health     # {"status":"ok",...}
   ```

**Report screenshot:** `GET /health` from the EC2 public IP + `/docs` (Swagger).

---

## 4. Frontend — S3 + CloudFront

```bash
cd frontend
VITE_API_BASE=http://<ec2-public-ip>:8000 npm run build
aws s3 mb s3://quickbite-web-<unique>
aws s3 sync dist/ s3://quickbite-web-<unique> --delete
```

1. Create a CloudFront distribution with the S3 bucket as origin (OAC recommended).
2. Set **Default root object** = `index.html`.
3. Add a custom error response: HTTP 403 and 404 → response `/index.html`, code 200
   (so `BrowserRouter` deep links resolve).
4. Put the CloudFront domain into the backend `CORS_ALLOW_ORIGINS` and redeploy.

**Report screenshot:** the app loading from the CloudFront URL + a deep link refresh working.

---

## 5. CloudWatch — logs & alarms

1. Logging is already wired in `docker-compose.aws.yml` via the `awslogs` driver
   (log group `quickbite/backend`), so if you started the backend with that file the logs
   ship to CloudWatch automatically — no separate `docker run` needed. The EC2 IAM role
   must allow `logs:CreateLogGroup / CreateLogStream / PutLogEvents`.

2. CloudWatch ▸ Alarms ▸ Create:
   - **CPU** — metric `EC2 CPUUtilization` for the instance, threshold `> 70%` for 5 min.
   - **Health** — a Route 53 / CloudWatch Synthetics canary hitting `/health`, alarm on failures,
     or alarm on `5xx` count if you add an ALB.
3. Send alarm notifications to an SNS topic + your email.

**Report screenshot:** the log group receiving entries + the CPU alarm in *OK/ALARM* state.

---

## 6. Email — Lambda + SES (replaces local Mailpit)

Local uses `FastAPI → SMTP → Mailpit`. On AWS switch to `FastAPI → SNS/Lambda → SES`.
See `docs/lambda-ses.md` and `lambda/send_order_email.py`.

If you keep Mailpit for the demo, state clearly in the report:
> Email is simulated locally with Mailpit; SES/Lambda is the AWS-phase equivalent.

---

## Checklist for the report

- [ ] RDS available + endpoint + tables loaded
- [ ] S3 bucket + uploaded menu image rendering
- [ ] EC2 backend `/health` + `/docs` reachable
- [ ] Frontend on CloudFront + deep-link refresh
- [ ] CloudWatch log group + CPU alarm
- [ ] (Optional) Lambda + SES real email
- [ ] Cost cleanup done (`docs/cleanup.md`)
