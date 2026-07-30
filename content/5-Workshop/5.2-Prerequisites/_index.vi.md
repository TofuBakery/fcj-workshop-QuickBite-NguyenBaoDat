---
title: "Điều kiện tiên quyết"
date: 2026-07-30
weight: 2
chapter: false
pre: " <b> 5.2. </b> "
---
# Điều kiện tiên quyết

## 1. Tài khoản và Region

- tài khoản AWS có quyền tạo EC2, RDS, S3, CloudFront, IAM role, CloudWatch, SNS và Budget;
- không sử dụng root account cho công việc hằng ngày;
- bật MFA cho tài khoản quan trọng;
- Region: `ap-southeast-1`;
- tạo AWS Budget trước khi tạo tài nguyên.

## 2. Công cụ local

```text
Git
Docker Desktop / Docker Engine
Docker Compose plugin
Node.js và npm
AWS CLI
SSH client
PostgreSQL client (có thể cài trên EC2)
Hugo Extended để xem báo cáo
```

Kiểm tra:

```bash
git --version
docker --version
docker compose version
node --version
npm --version
aws --version
hugo version
```

## 3. Source code

```bash
git clone https://github.com/edrictrn/quickbite.git
cd quickbite
```

Không commit:

```text
.env
*.pem
database password
AWS access key
application secret
```

## 4. Naming convention

| Resource | Tên đề xuất |
|---|---|
| EC2 | `quickbite-app` |
| EC2 IAM role | `quickbite-ec2-role` |
| EC2 security group | `quickbite-ec2-sg` |
| RDS | `quickbite-db` |
| RDS security group | `quickbite-rds-sg` |
| Web bucket | `quickbite-web-<env>` |
| Image bucket | `quickbite-menu-images-<env>` |
| Log group | `quickbite/backend` |
| CPU alarm | `quickbite-cpu-high` |

Thay `<env>` bằng giá trị duy nhất như tên viết tắt hoặc môi trường.

## 5. Quyền và network

- EC2 role: `s3:GetObject`, `s3:PutObject` cho đúng bucket/prefix và quyền ghi CloudWatch Logs;
- port 22: chỉ My IP;
- RDS 5432: source là EC2 security group;
- RDS Public access: `No`;
- web S3 bucket: private, truy cập bằng CloudFront OAC.

## 6. File triển khai cần có

- `docker-compose.aws.yml`;
- backend `Dockerfile`;
- frontend production Dockerfile/build config;
- `.env.example`;
- SQL schema/seed/views;
- `docs/deploy-walkthrough.md`;
- `docs/cleanup.md`.

## 7. Checklist trước khi bắt đầu

- [ ] AWS Budget đã tạo;
- [ ] key pair `.pem` được lưu an toàn;
- [ ] region đúng;
- [ ] source không chứa secret;
- [ ] local E2E đã chạy;
- [ ] đã hiểu phạm vi demo/future;
- [ ] có thư mục lưu screenshot và terminal output.
