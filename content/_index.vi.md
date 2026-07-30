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
| Số điện thoại | **[CẬP NHẬT]** |
| Email | **dat.nguyenbaodat1410@hcmut.edu.vn** |
| Trường | **Trường Đại học Bách khoa - ĐHQG TP.HCM (HCMUT)** |
| Chuyên ngành | **Kỹ thuật Máy tính** |
| Lớp / Cohort FCAJ | **[CẬP NHẬT THEO HỒ SƠ CHÍNH THỨC]** |
| Công ty / chương trình thực tập | **First Cloud Journey (FCAJ) / AWS Study Group** |
| Vị trí thực tập | **Cloud / Software Engineering Intern - [xác nhận tên trên giấy tờ]** |
| Thời gian Worklog | **04/06/2026 - 31/07/2026 (8 tuần, 6 ngày làm việc/tuần)** |

{{< report-image src="images/quickbite-cover.svg" alt="QuickBite report cover" >}}

### Nội dung báo cáo

1. [Worklog 8 tuần](1-Worklog/)
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
- <span class="status-missing">Bằng chứng cần bổ sung:</span> URL demo, ảnh AWS Console, log/metric/alarm thực tế, link ba bài đã đăng, tên/ảnh ba event, video demo và bằng chứng clean-up.

### Repository

- [QuickBite repository](https://github.com/edrictrn/quickbite)
- [Pinned snapshot used for comparison (`6c79b99`)](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db)
