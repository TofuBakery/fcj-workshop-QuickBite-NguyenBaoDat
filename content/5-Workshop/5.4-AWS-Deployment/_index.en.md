---
title: "AWS Deployment"
date: 2026-07-30
weight: 4
chapter: false
pre: " <b> 5.4. </b> "
---
# Step-by-step AWS deployment

**Region:** `ap-southeast-1`  
**Architecture:** S3 + CloudFront frontend · EC2 Docker/FastAPI backend · private RDS PostgreSQL · S3 menu images · CloudWatch Logs/Alarm.

> API Gateway is not used. Replace all `<...>` values with real resources.

## Phase 0 — Budget, CLI, and key pair

1. Create an AWS Budget with a small threshold appropriate for the demo and add an alert email.
2. Configure the CLI:

```bash
aws configure
aws sts get-caller-identity
aws configure get region
```

3. Select `ap-southeast-1`.
4. Create `quickbite-key.pem`.
5. On Linux/macOS:

```bash
chmod 400 quickbite-key.pem
```

6. Ensure `.env` and `.pem` are not tracked by Git.

**Evidence:** Budget, identity command, region, and key-pair metadata.

## Phase 1 — Create the menu-image S3 bucket

Create:

```text
quickbite-menu-images-<env>
```

Recommended:

- keep Block Public Access;
- allow the EC2 IAM role to work only under `menu/*`;
- use a CloudFront URL or a carefully designed read policy when images must be public;
- never grant `s3:*` on `*`.

Backend settings:

```env
AWS_REGION=ap-southeast-1
S3_BUCKET_NAME=quickbite-menu-images-<env>
MENU_IMAGE_BASE_URL=https://<image-delivery-domain>
```

**Evidence:** bucket properties, IAM policy, and an object under `menu/`.

## Phase 2 — Create private RDS PostgreSQL

1. Create `quickbite-rds-sg` with no inbound rule initially.
2. Create RDS:

```text
Identifier: quickbite-db
Engine: PostgreSQL
Class: db.t3.micro
Storage: 20 GB
Public access: No
Availability: Single-AZ for demo
Database user: quickbite
```

3. Record the endpoint, but never capture the password in screenshots.

**Important:** private RDS cannot be initialized directly from the laptop. Load the schema from EC2.

**Evidence:** RDS `Available`, private connectivity, class/storage, and endpoint.

## Phase 3 — EC2, IAM role, and security group

### IAM role

Create `quickbite-ec2-role` with EC2 as the trusted entity. The policy should scope:

- S3 list/get/put to the exact bucket/prefix;
- CloudWatch Logs stream/event actions to the exact log group.

### EC2

```text
Name: quickbite-app
AMI: Ubuntu 24.04
Instance type: t3.micro
IAM instance profile: quickbite-ec2-role
Key pair: quickbite-key
```

### Security group

`quickbite-ec2-sg`:

| Port | Source | Purpose |
|---:|---|---|
| 22 | My IP | SSH |
| 80 or demo origin port | based on access design | backend/origin |
| 8000 | temporary direct testing only | FastAPI test |

Do not expose SSH to the entire Internet unnecessarily.

**Evidence:** instance, attached role, and SG rules.

## Phase 4 — Connect EC2 to RDS

Add to `quickbite-rds-sg`:

```text
Type: PostgreSQL
Port: 5432
Source: quickbite-ec2-sg
```

Do not use `0.0.0.0/0`.

**Evidence:** inbound rule referencing the EC2 security group ID.

## Phase 5 — SSH to EC2 and initialize RDS

```bash
ssh -i quickbite-key.pem ubuntu@<ec2-public-ip>
sudo apt update
sudo apt install -y docker.io docker-compose-plugin git postgresql-client
sudo usermod -aG docker ubuntu
newgrp docker
git clone https://github.com/edrictrn/quickbite.git
cd quickbite
```

Create a runtime connection string:

```bash
export DB="postgresql://quickbite:<db-password>@<rds-endpoint>:5432/quickbite"
```

Load data from EC2:

```bash
psql "$DB" -f backend/sql/schema_postgres.sql
psql "$DB" -f backend/sql/seed_postgres.sql
psql "$DB" -f backend/sql/views_postgres.sql
psql "$DB" -c "\dt"
```

**Evidence:** `\dt`, a sample query, and RDS connections.

## Phase 6 — Run the backend with `docker-compose.aws.yml`

Create `.env` on EC2:

```bash
cat > .env <<'EOF'
DATABASE_URL=postgresql://quickbite:<db-password>@<rds-endpoint>:5432/quickbite
SECRET_KEY=<generate-a-long-random-secret>
CORS_ALLOW_ORIGINS=https://<cloudfront-domain>
AWS_REGION=ap-southeast-1
S3_BUCKET_NAME=quickbite-menu-images-<env>
MENU_IMAGE_BASE_URL=https://<image-delivery-domain>
SHOW_DEMO_ACCOUNTS=false
EOF
chmod 600 .env
```

Generate a secret:

```bash
openssl rand -hex 32
```

Start:

```bash
docker compose -f docker-compose.aws.yml up --build -d
docker ps
curl http://localhost:8000/health
```

`docker-compose.aws.yml` contains only the backend and never launches local PostgreSQL.

**Evidence:** `docker ps`, health output, and configuration without exposed secrets.

## Phase 7 — Test the backend

```text
http://<ec2-public-ip>:8000/health
http://<ec2-public-ip>:8000/docs
```

Test:

- login;
- GET menu;
- create an order;
- role-based status changes;
- query RDS to confirm data;
- report endpoints;
- invalid token/permission cases.

> Public port 8000 is appropriate only for short testing. A production architecture should use ALB + ACM or another protected reverse proxy.

## Phase 8 — Test image upload

1. sign in as admin;
2. call `/uploads/image`;
3. confirm the object exists at:

```text
s3://quickbite-menu-images-<env>/menu/<object>
```

4. confirm the frontend displays the image URL;
5. test file type/size validation;
6. test upload with insufficient permissions.

**Evidence:** request, S3 object, and displayed image.

## Phase 9 — Build the frontend and upload to S3

On the local machine:

```bash
cd frontend
npm ci
VITE_API_BASE="" npm run build
aws s3 sync dist/ s3://quickbite-web-<env> --delete
```

Create a CloudFront distribution:

- origin: private web S3 bucket;
- Origin Access Control;
- Default root object: `index.html`;
- custom error 403 → `/index.html` status 200;
- custom error 404 → `/index.html` status 200.

**Evidence:** distribution domain, OAC, bucket policy, and deep-link refresh.

## Phase 10 — API paths, CORS, and mixed content

CloudFront HTTPS cannot have the browser call EC2 HTTP directly without mixed-content errors.

Demo approach:

1. add EC2 as a second origin;
2. create behaviors for backend paths, for example:

```text
/auth/*
/menu/*
/orders/*
/payments/*
/reports/*
/uploads/*
/settings/*
/admin/*
/kitchen/*
/delivery/*
```

3. use relative paths with `VITE_API_BASE=""`;
4. allow the exact CloudFront domain in backend CORS;
5. restart the backend after changing `.env`.

Future production approach: ALB + ACM for backend HTTPS.

**Evidence:** browser network tab, CORS headers, and no mixed-content error.

## Phase 11 — CloudWatch Logs and CPU Alarm

`docker-compose.aws.yml` uses Docker `awslogs` with:

```text
quickbite/backend
```

Verify request/startup/error logs in CloudWatch Logs.

Create:

```text
Name: quickbite-cpu-high
Metric: EC2 CPUUtilization
Threshold: > 70%
Period/evaluation: 5 minutes, according to the demo setting
Action: SNS email
```

SNS is used only for alarm notifications.

Do not claim a 5xx alarm unless an ALB or custom metric actually exists.

**Evidence:** log events, alarm configuration/state, and SNS subscription confirmation.

## Phase 12 — Optional Lambda + SES

The source contains Lambda/SES documentation and sample code, but this remains optional/future.

Planned flow:

```text
OrderCreated (future event)
    -> Lambda
    -> Amazon SES
```

Local email remains Mailpit. Mark this complete only when the function, trigger, SES identity, logs, and real email are evidenced.

## Phase 13 — Evidence and clean-up

Before clean-up, capture:

- RDS Available and `\dt`;
- `/health` and `/docs`;
- CloudFront frontend;
- end-to-end order flow;
- S3 menu image;
- CloudWatch logs;
- CPU alarm;
- Budget;
- CORS/mixed-content test.

Then follow the Clean-up page.

## Common errors

| Symptom | Cause/fix |
|---|---|
| `psql` from the laptop times out | RDS is private; run from EC2 |
| Compose starts a local DB | wrong file; use `docker-compose.aws.yml` |
| backend says `could not connect to server` | check SG 5432, endpoint, and `DATABASE_URL` |
| frontend CORS error | CloudFront domain is missing or backend was not restarted |
| browser blocks mixed content | use CloudFront API origin/behaviors |
| route refresh returns 403/404 | map error responses to `/index.html` |
| image is missing | check bucket/prefix, IAM, and `MENU_IMAGE_BASE_URL` |
| no CloudWatch logs | check IAM role, region, log group, and `awslogs` configuration |
