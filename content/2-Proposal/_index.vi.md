---
title: "Bản đề xuất"
date: 2026-07-30
weight: 2
chapter: false
pre: " <b> 2. </b> "
includeInReport: false
---
# Đề xuất dự án QuickBite trên AWS

## 1. Tổng quan

QuickBite là nền tảng đặt món dành cho căng-tin, văn phòng hoặc mô hình giao nhận nội bộ. Hệ thống hỗ trợ bốn nhóm người dùng:

- **Customer:** xem menu, tạo đơn, thanh toán COD/mock e-wallet, theo dõi và tra cứu đơn;
- **Admin:** quản lý món, danh mục, cấu hình, đơn hàng, dashboard và báo cáo;
- **Kitchen:** nhận và xử lý đơn trong bếp;
- **Delivery:** nhận đơn sẵn sàng và hoàn tất giao hàng.

Baseline local sử dụng React/Vite, FastAPI, PostgreSQL, Docker Compose và Mailpit. Mục tiêu của proposal là đưa baseline này lên AWS bằng một kiến trúc đủ thực tế để demo, kiểm thử, theo dõi và dọn dẹp trong giới hạn ngân sách thực tập.

## 2. Bài toán cần giải quyết

Một hệ thống đặt món local chưa giải quyết được các yêu cầu quan trọng của môi trường thật:

1. người dùng bên ngoài không thể truy cập ổn định;
2. frontend, backend và database chưa được tách theo trách nhiệm vận hành;
3. ảnh món ăn chưa có nơi lưu trữ cloud;
4. thiếu log tập trung, alarm và kiểm soát chi phí;
5. chưa có quy trình triển khai, kiểm thử và clean-up có thể lặp lại;
6. nếu đưa kiến trúc quá lớn vào báo cáo nhưng không có URL hoặc screenshot, project sẽ thiếu tính kiểm chứng.

Vì vậy, QuickBite chọn kiến trúc **demo có bằng chứng**, không cố mô tả một hệ thống enterprise chưa được triển khai.

## 3. Mục tiêu

### Mục tiêu chức năng

- phục vụ đầy đủ luồng customer → admin → kitchen → delivery;
- lưu dữ liệu giao dịch trên PostgreSQL;
- upload ảnh món qua endpoint `/uploads/image`;
- cung cấp dashboard, báo cáo CSV, audit log và order tracking;
- hỗ trợ health check và kiểm thử end-to-end.

### Mục tiêu AWS

- phân phối React qua Amazon CloudFront và private Amazon S3;
- chạy FastAPI trong Docker trên một Amazon EC2;
- dùng Amazon RDS for PostgreSQL private, Single-AZ cho demo;
- lưu ảnh món trong Amazon S3;
- gửi container logs đến Amazon CloudWatch Logs;
- tạo CloudWatch CPU alarm và gửi email qua Amazon SNS;
- cấp quyền bằng IAM role theo least privilege;
- kiểm soát chi phí bằng AWS Budgets và Cost Explorer;
- có hướng dẫn clean-up để tránh phát sinh chi phí.

## 4. Kiến trúc demo được đề xuất

```text
Customer / Admin / Kitchen / Delivery
                    |
                 HTTPS
                    v
             Amazon CloudFront
               /             \
              /               \ API behaviors
     Private S3 web             v
 quickbite-web-<env>      EC2 t3.micro
                         Docker + FastAPI
                          quickbite-app
                           /          \
                    TCP 5432          \ /uploads/image
                       v               v
             Private RDS             S3 menu images
       PostgreSQL db.t3.micro   quickbite-menu-images-<env>
              Single-AZ

EC2 container logs ──> CloudWatch Logs: quickbite/backend
EC2 CPU metric ──────> Alarm: quickbite-cpu-high ──> SNS email
EC2 IAM role ────────> S3 menu/* + CloudWatch Logs
Budgets / Cost Explorer ───────> cost visibility and alerts
```

### Thành phần hiện tại của demo

| Thành phần | Lựa chọn | Lý do |
|---|---|---|
| Frontend | S3 private + CloudFront OAC | HTTPS, CDN, không cần web server riêng |
| Backend | 1 EC2 t3.micro chạy Docker/FastAPI | Bám sát source và dễ quan sát trong workshop |
| Database | RDS PostgreSQL db.t3.micro, 20 GB, private, Single-AZ | Managed database, phù hợp ngân sách demo |
| Ảnh món | S3 `quickbite-menu-images-<env>` | Object storage phù hợp file ảnh |
| Logging | CloudWatch Logs `quickbite/backend` | Log tập trung từ Docker `awslogs` |
| Alert | CloudWatch CPU alarm + SNS email | Có bằng chứng monitoring mà không cần ALB |
| Identity | EC2 IAM role | Không hard-code access key |
| Cost | Budgets + Cost Explorer | Cảnh báo và theo dõi chi phí |

### Không thuộc phạm vi demo hiện tại

Các thành phần dưới đây là **Future / Planned**, không được trình bày như đã triển khai:

- Route 53 và custom domain;
- API Gateway;
- Application Load Balancer;
- Auto Scaling Group;
- RDS Multi-AZ;
- AWS WAF và AWS Shield cấu hình riêng;
- AWS Secrets Manager;
- AWS Backup và cross-region snapshot;
- EventBridge/SQS;
- Lambda + SES cho email production.

Mailpit vẫn là email mock ở local. Lambda + SES chỉ là hướng optional/future.

## 5. Liên hệ AWS Well-Architected Framework

| Trụ cột | Áp dụng trong demo | Hướng phát triển |
|---|---|---|
| Operational Excellence | runbook, health check, CloudWatch Logs, alarm, evidence checklist, cleanup | Infrastructure as Code, CI/CD |
| Security | RDS private, SG theo nguồn, IAM role, bucket web private/OAC, không commit `.env` | Secrets Manager/Parameter Store, WAF, TLS backend bằng ALB/ACM |
| Reliability | health check, managed RDS, persistent database, runbook lỗi | Multi-AZ, automated backup, restore drills |
| Performance Efficiency | CloudFront cho static content, t3.micro phù hợp demo | Auto Scaling, ALB, load testing |
| Cost Optimization | t3.micro/db.t3.micro, Single-AZ, Budget, cleanup | right-sizing theo metric, lifecycle policy |
| Sustainability | managed services, dừng/xóa tài nguyên không dùng | tự động hóa shutdown và lifecycle |

## 6. Timeline 8 tuần

| Giai đoạn | Tuần | Nội dung |
|---|---:|---|
| Khảo sát và scope | 1–2 | yêu cầu FCAJ, source review, AWS CLI, IAM và bảo mật |
| Ổn định ứng dụng | 3 | Docker, PostgreSQL, role flow và E2E local |
| Thiết kế cloud | 4–5 | Proposal, Well-Architected, VPC/RDS/EC2/S3/CloudFront |
| Chuẩn bị triển khai | 6–7 | file deploy, CORS, mixed content, upload ảnh và cleanup |
| Kiểm thử và báo cáo | 8 | AWS validation, CloudWatch, alarm, blog, references và evidence checklist |

## 7. Ngân sách dự kiến

Project sử dụng tài nguyên kích thước nhỏ và chỉ duy trì trong thời gian demo:

- 1 EC2 t3.micro;
- 1 RDS db.t3.micro Single-AZ, 20 GB;
- hai S3 bucket;
- một CloudFront distribution;
- CloudWatch Logs/Alarm và SNS email;
- AWS Budgets.

Chi phí thực tế phải được lấy từ **Billing/Cost Explorer** sau khi triển khai. Báo cáo không tự khẳng định một con số nếu chưa có dữ liệu billing. Sau demo, tài nguyên sẽ được xóa theo `cleanup.md`.

## 8. Rủi ro và biện pháp xử lý

| Rủi ro | Ảnh hưởng | Biện pháp |
|---|---|---|
| RDS private không truy cập từ laptop | không nạp được schema | nạp schema từ EC2 bằng `psql` |
| Compose khởi chạy PostgreSQL local | backend không dùng RDS | dùng `docker-compose.aws.yml` chỉ có backend |
| CloudFront HTTPS gọi EC2 HTTP | mixed content | CloudFront API origin/behaviors; ALB+ACM là future |
| CORS sai domain | frontend không gọi được API | cập nhật CloudFront domain và restart backend |
| IAM quá rộng | tăng blast radius | EC2 role giới hạn bucket/prefix/action |
| Secret bị commit | lộ credential | `.gitignore`, placeholder, tạo secret runtime |
| Chi phí tiếp tục phát sinh | vượt ngân sách | Budget, tag, cleanup checklist, kiểm tra Cost Explorer |
| Claim không có bằng chứng | báo cáo thiếu tin cậy | evidence matrix cho từng service/URL/test |

## 9. Tiêu chí thành công

Project chỉ được đánh dấu hoàn thành AWS khi có đủ bằng chứng:

1. CloudFront mở được frontend và refresh deep link thành công;
2. `/health` và `/docs` của backend hoạt động qua đường truy cập demo;
3. backend đọc/ghi RDS private;
4. customer tạo đơn và các role xử lý hết luồng;
5. upload ảnh tạo object trong S3 và ảnh hiển thị lại;
6. CloudWatch có container log;
7. CPU alarm và SNS subscription được cấu hình;
8. Budget được tạo;
9. có screenshot/terminal output cho các bước chính;
10. có clean-up evidence và kiểm tra chi phí sau khi xóa.

## 10. Repository

- [QuickBite repository](https://github.com/edrictrn/quickbite)
- [Snapshot commit `6c79b99`](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db)
