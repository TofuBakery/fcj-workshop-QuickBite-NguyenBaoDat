---
title: "Nhật ký tuần 4"
date: 2026-07-30
weight: 4
chapter: false
pre: " <b> 1.4. </b> "
---
### Mục tiêu tuần 4:

* Chuyển yêu cầu nghiệp vụ thành kiến trúc AWS có thể triển khai trong phạm vi demo.
* Viết hướng dẫn triển khai nhất quán với source code hiện tại.

### Các công việc đã thực hiện trong tuần:

| Ngày làm việc | Công việc | Ngày bắt đầu | Ngày hoàn thành | Tài liệu tham khảo |
|---:|---|---|---|---|
| 1 | Xác định người dùng, bài toán, tiêu chí thành công và giới hạn của QuickBite trong proposal. | 22/06/2026 | 24/06/2026 | [AWS Well-Architected Framework](https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html) |
| 2 | Thiết kế VPC với EC2 và RDS; chọn RDS PostgreSQL private Single-AZ để phù hợp ngân sách demo. | 22/06/2026 | 25/06/2026 | [Amazon VPC User Guide](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html) |
| 3 | Thiết kế frontend React trên S3 và CloudFront; thống nhất không dùng API Gateway khi backend chạy trực tiếp trên EC2. | 23/06/2026 | 25/06/2026 | [CloudFront with S3](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/DownloadDistS3AndCustomOrigins.html) |
| 4 | Thiết kế bucket quickbite-menu-images-<env> và endpoint /uploads/image cho ảnh món ăn. | 24/06/2026 | 26/06/2026 | [Amazon S3 User Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html) |
| 5 | Bổ sung CloudWatch Logs, CPU Alarm, SNS email, IAM Role và AWS Budgets vào sơ đồ vận hành. | 25/06/2026 | 27/06/2026 | [Amazon CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html) |
| 6 | Chia hướng dẫn triển khai thành các phase từ chuẩn bị tài khoản đến kiểm thử và cleanup. | 24/06/2026 | 27/06/2026 | [QuickBite deployment documentation](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |

### Kết quả đạt được tuần 4:

* Xác định được bài toán, nhóm người dùng, mục tiêu và tiêu chí thành công của QuickBite trong phần Proposal.
* Thiết kế được kiến trúc AWS bám sát chương trình hiện tại:
  * React static website trên S3 và CloudFront.
  * FastAPI chạy bằng Docker trên EC2.
  * PostgreSQL trên RDS private Single-AZ.
  * Ảnh món ăn lưu trong S3.
  * Log và cảnh báo qua CloudWatch.
* Hiểu được cách giới hạn kết nối RDS: chỉ Security Group của EC2 được truy cập cổng 5432.
* Thống nhất tên bucket `quickbite-web-<env>` và `quickbite-menu-images-<env>` để dùng nhất quán trong code, sơ đồ và tài liệu.
* Quyết định không đưa API Gateway vào kiến trúc demo vì backend được truy cập qua EC2/CloudFront behavior.
* Bổ sung IAM Role, CloudWatch Logs, CPU Alarm, SNS email và AWS Budgets vào phần vận hành.
* Chia hướng dẫn triển khai thành các phase rõ ràng, từ chuẩn bị tài khoản đến kiểm thử và cleanup.
* Hoàn thiện sơ đồ và nội dung Proposal theo hướng có thể giải thích được lý do lựa chọn từng dịch vụ.
