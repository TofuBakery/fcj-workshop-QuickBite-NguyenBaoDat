---
title: "Workshop"
date: 2026-07-30
weight: 5
chapter: false
pre: " <b> 5. </b> "
includeInReport: false
---
# Workshop: Triển khai QuickBite trên AWS

Workshop này hướng dẫn đưa QuickBite từ môi trường local lên AWS theo kiến trúc demo có thể kiểm chứng.

## Cấu trúc workshop

1. **Overview:** bài toán, phạm vi và kiến trúc;
2. **Prerequisites:** tài khoản, công cụ, quyền, naming và checklist;
3. **Local Baseline:** chạy QuickBite bằng Docker trước khi deploy;
4. **AWS Deployment:** triển khai S3, CloudFront, EC2, RDS, IAM và CloudWatch theo từng phase;
5. **Validation:** kiểm thử chức năng, bảo mật, log, alarm và evidence;
6. **Security & Cost:** least privilege, secret handling, Budget và right-sizing;
7. **Clean-up:** xóa tài nguyên đúng thứ tự và kiểm tra chi phí.

## Phạm vi trung thực

### Demo/implemented scope

- CloudFront + private S3 cho React;
- một EC2 t3.micro chạy Docker/FastAPI;
- RDS PostgreSQL private, db.t3.micro, Single-AZ;
- S3 `quickbite-menu-images-<env>`;
- CloudWatch Logs và CPU Alarm;
- SNS chỉ dùng gửi email alarm;
- IAM role cho EC2;
- AWS Budgets và Cost Explorer.

### Optional/future

- Lambda + SES cho email;
- Route 53, ALB/ACM, Auto Scaling;
- RDS Multi-AZ;
- WAF, Secrets Manager, AWS Backup;
- EventBridge/SQS và cross-region DR;
- Infrastructure as Code.

> Workshop không sử dụng API Gateway. Backend là FastAPI chạy trên EC2.
