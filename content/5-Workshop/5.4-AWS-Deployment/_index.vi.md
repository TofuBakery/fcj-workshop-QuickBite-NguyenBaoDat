---
title: "Triển khai AWS"
date: 2026-07-30
weight: 4
chapter: false
pre: " <b> 5.4. </b> "
---
# Triển khai AWS từng bước

**Region:** `ap-southeast-1`  
**Kiến trúc:** S3 + CloudFront frontend · EC2 Docker/FastAPI backend · private RDS PostgreSQL · S3 menu images · CloudWatch Logs/Alarm.

> Không sử dụng API Gateway. Các giá trị dạng `<...>` phải được thay bằng tài nguyên thật.

## Phase 0 — Budget, CLI và key pair

1. Tạo AWS Budget, ví dụ ngưỡng nhỏ phù hợp demo, và nhập email cảnh báo.
2. Cấu hình CLI:

```bash
aws configure
aws sts get-caller-identity
aws configure get region
```

3. Chọn region `ap-southeast-1`.
4. Tạo key pair `quickbite-key.pem`.
5. Linux/macOS:

```bash
chmod 400 quickbite-key.pem
```

6. Kiểm tra `.env` và `.pem` không nằm trong Git.

**Evidence:** Budget, identity command, region, key pair metadata.

## Phase 1 — Tạo S3 bucket ảnh món

Tạo:

```text
quickbite-menu-images-<env>
```

Khuyến nghị:

- giữ Block Public Access;
- EC2 IAM role chỉ được thao tác trên `menu/*`;
- dùng CloudFront URL hoặc policy thiết kế riêng nếu cần public read;
- không cấp `s3:*` trên `*`.

Backend sử dụng:

```env
AWS_REGION=ap-southeast-1
S3_BUCKET_NAME=quickbite-menu-images-<env>
MENU_IMAGE_BASE_URL=https://<image-delivery-domain>
```

**Evidence:** bucket properties, IAM policy, object dưới `menu/`.

## Phase 2 — Tạo private RDS PostgreSQL

1. Tạo security group `quickbite-rds-sg`, chưa mở inbound.
2. Tạo RDS:

```text
Identifier: quickbite-db
Engine: PostgreSQL
Class: db.t3.micro
Storage: 20 GB
Public access: No
Availability: Single-AZ for demo
Database user: quickbite
```

3. Ghi lại endpoint, không chụp password.

**Quan trọng:** RDS private không thể nạp schema trực tiếp từ laptop. Schema sẽ được nạp từ EC2.

**Evidence:** RDS `Available`, connectivity private, class/storage, endpoint.

## Phase 3 — EC2, IAM role và security group

### IAM role

Tạo `quickbite-ec2-role` với trust entity EC2. Policy cần giới hạn:

- S3 list/get/put đúng bucket/prefix;
- CloudWatch Logs create stream/put events đúng log group.

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

| Port | Source | Mục đích |
|---:|---|---|
| 22 | My IP | SSH |
| 80 hoặc port demo | theo phương án truy cập | backend/origin |
| 8000 | chỉ dùng khi test trực tiếp, sau đó siết lại | FastAPI test |

Không mở SSH cho toàn Internet nếu không cần.

**Evidence:** EC2 instance, attached role, SG rules.

## Phase 4 — Nối EC2 đến RDS

Trong `quickbite-rds-sg`, thêm:

```text
Type: PostgreSQL
Port: 5432
Source: quickbite-ec2-sg
```

Không dùng `0.0.0.0/0`.

**Evidence:** inbound rule theo security group ID.

## Phase 5 — SSH vào EC2 và nạp database

```bash
ssh -i quickbite-key.pem ubuntu@<ec2-public-ip>
sudo apt update
sudo apt install -y docker.io docker-compose-plugin git postgresql-client
sudo usermod -aG docker ubuntu
newgrp docker
git clone https://github.com/edrictrn/quickbite.git
cd quickbite
```

Tạo chuỗi kết nối runtime:

```bash
export DB="postgresql://quickbite:<db-password>@<rds-endpoint>:5432/quickbite"
```

Nạp dữ liệu từ EC2:

```bash
psql "$DB" -f backend/sql/schema_postgres.sql
psql "$DB" -f backend/sql/seed_postgres.sql
psql "$DB" -f backend/sql/views_postgres.sql
psql "$DB" -c "\dt"
```

**Evidence:** terminal `\dt`, sample query và RDS connections.

## Phase 6 — Chạy backend bằng `docker-compose.aws.yml`

Tạo `.env` trên EC2:

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

Có thể tạo secret:

```bash
openssl rand -hex 32
```

Khởi chạy:

```bash
docker compose -f docker-compose.aws.yml up --build -d
docker ps
curl http://localhost:8000/health
```

`docker-compose.aws.yml` chỉ có backend; không khởi chạy PostgreSQL local.

**Evidence:** `docker ps`, health output, container config không lộ secret.

## Phase 7 — Test backend

```text
http://<ec2-public-ip>:8000/health
http://<ec2-public-ip>:8000/docs
```

Kiểm thử:

- login;
- GET menu;
- tạo order;
- đổi trạng thái theo role;
- query RDS xác nhận dữ liệu;
- report endpoints;
- invalid token/permission cases.

> Port 8000 public chỉ phù hợp kiểm thử ngắn. Kiến trúc production nên dùng ALB + ACM hoặc reverse proxy được bảo vệ.

## Phase 8 — Test upload ảnh

1. đăng nhập admin;
2. gọi `/uploads/image`;
3. xác nhận object nằm ở:

```text
s3://quickbite-menu-images-<env>/menu/<object>
```

4. kiểm tra frontend hiển thị URL ảnh;
5. kiểm tra file type/size validation;
6. thử upload khi role không đủ quyền.

**Evidence:** request, S3 object và ảnh hiển thị.

## Phase 9 — Build frontend và upload S3

Trên máy local:

```bash
cd frontend
npm ci
VITE_API_BASE="" npm run build
aws s3 sync dist/ s3://quickbite-web-<env> --delete
```

Tạo CloudFront distribution:

- origin: private S3 web bucket;
- Origin Access Control;
- Default root object: `index.html`;
- custom error 403 → `/index.html` status 200;
- custom error 404 → `/index.html` status 200.

**Evidence:** distribution domain, OAC, bucket policy và deep-link refresh.

## Phase 10 — API path, CORS và mixed content

CloudFront HTTPS không thể để browser gọi trực tiếp HTTP EC2 mà không gặp mixed content.

Phương án demo:

1. thêm EC2 làm origin thứ hai;
2. tạo behaviors cho các path backend, ví dụ:

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

3. frontend dùng relative path với `VITE_API_BASE=""`;
4. backend CORS cho đúng CloudFront domain;
5. restart backend sau khi sửa `.env`.

Phương án production future: ALB + ACM cho backend HTTPS.

**Evidence:** browser network tab, CORS headers và app không có mixed-content error.

## Phase 11 — CloudWatch Logs và CPU Alarm

`docker-compose.aws.yml` dùng Docker `awslogs`, log group:

```text
quickbite/backend
```

Kiểm tra CloudWatch Logs có request/startup/error logs.

Tạo alarm:

```text
Name: quickbite-cpu-high
Metric: EC2 CPUUtilization
Threshold: > 70%
Period/evaluation: 5 minutes, theo cấu hình demo
Action: SNS email
```

SNS ở đây chỉ phục vụ alarm.

Không ghi 5xx alarm là đã có nếu chưa sử dụng ALB hoặc custom metric.

**Evidence:** log events, alarm configuration/state, SNS subscription confirmation.

## Phase 12 — Optional Lambda + SES

Source có tài liệu và code mẫu Lambda/SES, nhưng đây là phần optional/future.

Luồng dự kiến:

```text
OrderCreated (future event)
    -> Lambda
    -> Amazon SES
```

Local vẫn dùng Mailpit. Chỉ đánh dấu hoàn thành khi có function, trigger, SES identity, log và email thật.

## Phase 13 — Evidence và clean-up

Trước clean-up, thu thập:

- RDS Available và `\dt`;
- `/health` và `/docs`;
- frontend CloudFront;
- order flow end-to-end;
- S3 menu image;
- CloudWatch logs;
- CPU alarm;
- Budget;
- CORS/mixed-content test.

Sau đó thực hiện quy trình ở trang Clean-up.

## Các lỗi thường gặp

| Triệu chứng | Nguyên nhân/khắc phục |
|---|---|
| `psql` từ laptop timeout | RDS private; chạy từ EC2 |
| Compose chạy DB local | dùng sai file; chuyển sang `docker-compose.aws.yml` |
| backend `could not connect to server` | kiểm tra SG 5432, endpoint và `DATABASE_URL` |
| frontend lỗi CORS | domain CloudFront chưa nằm trong allow list hoặc backend chưa restart |
| browser chặn mixed content | dùng CloudFront API origin/behavior |
| refresh route bị 403/404 | cấu hình error response về `/index.html` |
| ảnh không hiển thị | kiểm tra bucket/prefix, IAM và `MENU_IMAGE_BASE_URL` |
| CloudWatch không có log | kiểm tra IAM role, region, log group và `awslogs` config |
