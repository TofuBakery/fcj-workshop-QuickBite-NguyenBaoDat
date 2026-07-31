---
title: "Nhật ký tuần 8"
date: 2026-07-31
weight: 8
chapter: false
pre: " <b> 1.8. </b> "
---
### Mục tiêu tuần 8:

* Hoàn thiện hạ tầng QuickBite bằng Terraform trên hai Availability Zone.
* Triển khai application, kiểm thử end-to-end và thu thập bằng chứng AWS.

### Các công việc đã thực hiện trong tuần:

| Ngày làm việc | Công việc | Ngày bắt đầu | Ngày hoàn thành | Tài liệu tham khảo |
|---:|---|---|---|---|
| 1 | Hoàn thiện Terraform bootstrap cho S3 remote state, DynamoDB lock và ECR repository. | 23/07/2026 | 26/07/2026 | Terraform bootstrap source |
| 2 | Hoàn thiện ba module network, data và app cho VPC hai AZ, ALB, ASG, RDS Multi-AZ, S3, CloudFront, IAM và monitoring. | 24/07/2026 | 29/07/2026 | Terraform main stack |
| 3 | Tham gia First Cloud Journey AI; ghi chú về Agentic AI, cost estimation, hackathon và cách trình bày kiến trúc. | 25/07/2026 | 25/07/2026 | Ghi chú Event 3 |
| 4 | Build backend image, push ECR, apply 58 resources và nạp schema/seed/views vào RDS bằng SSM. | 27/07/2026 | 31/07/2026 | QuickBite source và bằng chứng AWS Console |
| 5 | Build frontend với CloudFront API URL, sync lên S3, kiểm tra menu, admin dashboard, upload ảnh và health check. | 28/07/2026 | 31/07/2026 | AWS Console và QuickBite demo |
| 6 | Xác thực hai EC2 ở hai AZ, CloudWatch alarms, SNS email, hoàn thiện proposal, workshop và ảnh minh chứng. | 29/07/2026 | 31/07/2026 | AWS Console evidence |

### Kết quả đạt được tuần 8:

* Terraform validate và plan hoàn tất; main apply tạo đủ 58 resources.
* Tạo remote state có versioning, DynamoDB locking và ECR repository.
* Triển khai VPC hai Availability Zone với public, private application và isolated database subnets.
* Triển khai ALB và Auto Scaling Group min 2, desired 2, max 4.
* Xác nhận hai EC2 t3.micro hoạt động tại ap-southeast-1a và ap-southeast-1b.
* Triển khai RDS PostgreSQL Multi-AZ và lưu database secret trong Secrets Manager.
* Triển khai hai CloudFront distributions, S3 web private và S3 menu-images private.
* Xác nhận API health trả status ok, service quickbite-api, version 1.4.0.
* Kiểm tra storefront, admin dashboard, upload ảnh và luồng dữ liệu qua RDS.
* Xác nhận CloudWatch CPU alarm, target tracking alarms và SNS email.
* Hoàn thiện tài liệu triển khai, kiểm thử và bộ bằng chứng AWS cho toàn bộ hệ thống.
* Hoàn thiện Proposal và Workshop dựa trên hạ tầng đã triển khai thực tế.
