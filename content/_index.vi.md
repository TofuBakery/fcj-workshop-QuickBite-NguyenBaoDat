---
title: "Báo cáo FCAJ - QuickBite"
date: 2026-07-31
weight: 1
chapter: false
pre: "<b></b>"
---
# Báo cáo thực tập / Workshop FCAJ
## Dự án: QuickBite - Nền tảng đặt món và vận hành căng-tin trên AWS


### Thông tin sinh viên

| Thông tin | Nội dung |
|---|---|
| Họ và tên | **Nguyễn Bảo Đạt** |
| Mã số sinh viên | **2352232** |
| Số điện thoại | **0888456586** |
| Email | **dat.nguyenbaodat1410@hcmut.edu.vn** |
| Trường | **Trường Đại học Bách khoa - ĐHQG TP.HCM (HCMUT)** |
| Chuyên ngành | **Kỹ thuật Máy tính** |
| Lớp / Cohort FCAJ | **AWS062026** |
| Công ty thực tập | **Amazon Web Services Viet Nam Company Limited** |
| Vị trí thực tập | **Workforce Bootcamp - First Cloud AI Journey** |
| Thời gian Worklog | **04/06/2026 - 31/07/2026** |

{{< report-image src="images/quickbite-cover.jpg" alt="QuickBite report cover" >}}

### Nội dung báo cáo

1. [Worklog](1-Worklog/)
2. [Proposal](2-Proposal/)
3. [Ba Blog Post](3-BlogsPosted/)
4. [Events Participated](4-EventParticipated/)
5. [Workshop - QuickBite on AWS](5-Workshop/)
6. [Self-evaluation](6-Self-evaluation/)
7. [Sharing and Feedback](7-Feedback/)

### Phạm vi kỹ thuật đã hoàn thành

- <span class="status-done">Ứng dụng:</span> React/TypeScript/Vite, FastAPI, PostgreSQL, Docker, JWT/RBAC, customer-admin-kitchen-delivery flow, COD/mock e-wallet, tracking, dashboard, CSV report, audit log, Alembic và automated tests.
- <span class="status-done">Hạ tầng AWS:</span> hai CloudFront distributions, S3 private, ALB, EC2 Auto Scaling Group hai Availability Zone, RDS PostgreSQL Multi-AZ, ECR, Secrets Manager, SSM, IAM, CloudWatch, SNS, Budgets và Cost Explorer.
- <span class="status-done">Infrastructure as Code:</span> Terraform bootstrap cho remote state, lock table và ECR; main stack được module hóa thành network, data và app.
- <span class="status-done">Bằng chứng:</span> kiến trúc, hai EC2, CloudFront, S3, ECR, health check, customer menu, admin dashboard, upload ảnh, CloudWatch alarms và SNS email.

### Repository

- [QuickBite repository](https://github.com/edrictrn/quickbite)
