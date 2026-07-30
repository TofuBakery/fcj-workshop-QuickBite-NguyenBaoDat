---
title: "Báo cáo FCAJ - QuickBite"
date: 2026-07-30
weight: 1
chapter: false
pre: "<b></b>"
---
# Báo cáo thực tập / Workshop FCAJ
## Dự án: QuickBite - Nền tảng đặt món và vận hành căng-tin trên AWS

{{% notice info %}}
Bản báo cáo được rà soát lại dựa trên **QuickBite-final-v3**, repository QuickBite và hướng dẫn triển khai AWS hiện có trong source. Báo cáo phân biệt rõ ba trạng thái: **đã có trong mã nguồn/local**, **đã chuẩn bị để triển khai AWS**, và **chỉ được xác nhận hoàn thành khi có URL, log hoặc ảnh chụp thực tế**.
{{% /notice %}}

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
| Thời gian thực tập | **01/6/2026 - 15/8/2026** |

{{< report-image src="images/quickbite-cover.jpg" alt="QuickBite report cover" >}}

### Nội dung báo cáo

1. [Worklog](1-Worklog/)
2. [Proposal](2-Proposal/)
3. [Ba Blog Post](3-BlogsPosted/)
4. [Events Participated](4-EventParticipated/)
5. [Workshop - QuickBite on AWS](5-Workshop/)
6. [Self-evaluation](6-Self-evaluation/)
7. [Sharing and Feedback](7-Feedback/)
### Phạm vi kỹ thuật được trình bày trung thực

- <span class="status-done">Baseline local:</span> React/TypeScript/Vite, FastAPI, PostgreSQL, Docker Compose, Mailpit, JWT/RBAC, customer-admin-kitchen-delivery flow, COD/mock e-wallet, order tracking, dashboard, CSV report, audit log, Alembic và 17 test functions.
- <span class="status-done">Deployment assets:</span> Dockerfile, `docker-compose.aws.yml`, PostgreSQL schema/seed/views, hướng dẫn triển khai từng phase, CloudWatch logging config, Lambda + SES sample và clean-up guide.
- <span class="status-pending">Kiến trúc demo AWS:</span> CloudFront + S3 web, EC2 Docker FastAPI, RDS PostgreSQL private Single-AZ, S3 menu images, CloudWatch Logs + CPU Alarm, IAM role, SNS email cho alarm, AWS Budgets và Cost Explorer.
- <span class="status-pending">Optional/Future:</span> Lambda + SES cho email đơn hàng; IaC; Auto Scaling; Multi-AZ; WAF; Secrets Manager và chiến lược DR nâng cao.

### Repository

- [QuickBite repository](https://github.com/edrictrn/quickbite)
