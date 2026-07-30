---
title: "Nhật ký tuần 6"
date: 2026-07-30
weight: 6
chapter: false
pre: " <b> 1.6. </b> "
---
### Mục tiêu tuần 6:

* Chuẩn bị backend và database cho môi trường AWS.
* Đảm bảo RDS private có thể được khởi tạo và backend không kéo theo PostgreSQL local.

### Các công việc đã thực hiện trong tuần:

| Ngày làm việc | Công việc | Ngày bắt đầu | Ngày hoàn thành | Tài liệu tham khảo |
|---:|---|---|---|---|
| 1 | Rà soát docker-compose.aws.yml; giữ lại backend và bỏ service db cùng depends_on dùng cho local. | 04/07/2026 | 06/07/2026 | [docker-compose.aws.yml](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 2 | Chuẩn hóa DATABASE_URL, SECRET_KEY, CORS_ALLOW_ORIGINS, AWS_REGION, S3_BUCKET_NAME và SHOW_DEMO_ACCOUNTS. | 04/07/2026 | 07/07/2026 | [QuickBite environment configuration](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 3 | Viết bước tạo quickbite-rds-sg và chỉ cho phép PostgreSQL 5432 từ quickbite-ec2-sg. | 05/07/2026 | 07/07/2026 | [Security groups for RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.RDSSecurityGroups.html) |
| 4 | Chuẩn bị EC2 Ubuntu, key pair, IAM instance profile, Docker, Git và PostgreSQL client. | 06/07/2026 | 08/07/2026 | [Amazon EC2 User Guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html) |
| 5 | Viết lệnh clone source và nạp schema_postgres.sql, seed_postgres.sql, views_postgres.sql từ EC2 vào RDS private. | 07/07/2026 | 09/07/2026 | [RDS PostgreSQL](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html) |
| 6 | Cấu hình Docker awslogs, lệnh kiểm tra /health, /docs và checklist cleanup cho tài nguyên AWS. | 07/07/2026 | 09/07/2026 | [CloudWatch Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html) |

### Kết quả đạt được tuần 6:

* Hoàn thiện `docker-compose.aws.yml` chỉ dành cho backend, không kéo theo PostgreSQL local khi chạy trên EC2.
* Chuẩn hóa các biến môi trường cần thiết:
  * `DATABASE_URL`.
  * `SECRET_KEY`.
  * `CORS_ALLOW_ORIGINS`.
  * `AWS_REGION`.
  * `S3_BUCKET_NAME`.
  * `SHOW_DEMO_ACCOUNTS`.
* Mô tả được cách tạo Security Group cho EC2 và RDS, trong đó RDS chỉ nhận TCP 5432 từ EC2 Security Group.
* Chuẩn bị được các bước cấu hình EC2 Ubuntu gồm key pair, IAM instance profile, Docker, Git và PostgreSQL client.
* Viết được quy trình clone source và nạp schema, seed và SQL view từ EC2 vào RDS private.
* Hiểu vì sao schema không nên được nạp trực tiếp từ laptop khi RDS không public.
* Chuẩn bị cấu hình Docker `awslogs` để gửi log backend đến CloudWatch Logs.
* Hoàn thiện runbook kiểm tra container, `/health`, `/docs`, kết nối database và cleanup tài nguyên.
