---
title: "Nhật ký tuần 8"
date: 2026-07-30
weight: 8
chapter: false
pre: " <b> 1.8. </b> "
---
### Mục tiêu tuần 8:

* Kiểm tra luồng end-to-end và các bằng chứng cần có khi triển khai AWS.
* Hoàn thiện CloudWatch, event report, blog và tài liệu tham khảo.

### Các công việc đã thực hiện trong tuần:

| Ngày làm việc | Công việc | Ngày bắt đầu | Ngày hoàn thành | Tài liệu tham khảo |
|---:|---|---|---|---|
| 1 | Rà soát checklist EC2 và RDS: instance, IAM Role, Security Group, Docker, /health, /docs, kết nối 5432 và bảng dữ liệu. | 23/07/2026 | 26/07/2026 | [Amazon EC2 troubleshooting](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-troubleshoot.html) |
| 2 | Kiểm thử luồng customer tạo đơn, admin xác nhận, kitchen chuẩn bị, delivery giao và customer theo dõi trạng thái. | 24/07/2026 | 28/07/2026 | [QuickBite E2E flow](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 3 | Tham gia First Cloud Journey AI; ghi chú về Agentic AI, cost estimation, hackathon và cách trình bày kiến trúc. | 25/07/2026 | 25/07/2026 | Ghi chú và slide Event 3 |
| 4 | Kiểm tra log group quickbite/backend, Docker awslogs, CPU Alarm và luồng SNS gửi email cảnh báo. | 27/07/2026 | 29/07/2026 | [CloudWatch alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html) |
| 5 | Biên tập ba blog AWS, hoàn thiện ba báo cáo event và bổ sung reference materials cho từng phần. | 28/07/2026 | 31/07/2026 | [AWS Architecture Blog](https://aws.amazon.com/blogs/architecture/) |
| 6 | Rà soát song ngữ, link, code snippet, file đính kèm, ảnh minh chứng và thứ tự cleanup trước khi đóng báo cáo. | 29/07/2026 | 31/07/2026 | [QuickBite repository](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |

### Kết quả đạt được tuần 8:

* Hoàn thiện checklist kiểm tra các thành phần chính của kiến trúc QuickBite:
  * EC2, IAM Role và Security Group.
  * RDS PostgreSQL private và kết nối TCP 5432.
  * S3 web, S3 menu images và CloudFront.
  * CloudWatch Logs, CPU Alarm và SNS email.
* Kiểm tra lại luồng nghiệp vụ end-to-end từ customer tạo đơn đến admin, kitchen và delivery xử lý đơn.
* Xác định danh sách ảnh và kết quả cần thu thập khi triển khai thật: endpoint `/health`, Swagger, bảng RDS, object S3, CloudFront URL, log group và alarm.
* Hoàn thiện phương án theo dõi backend bằng Docker awslogs và CloudWatch Alarm.
* Biên tập ba bài blog AWS theo các chủ đề Event-Driven Architecture, Disaster Recovery và Least Privilege.
* Hoàn thiện ba báo cáo event bằng cả tiếng Việt và tiếng Anh, kèm hình ảnh đúng ngày tham dự.
* Rà soát lại menu, liên kết song ngữ, code snippet, file Docker/SQL/script và nội dung Workshop.
* Lập trình tự cleanup để xóa CloudFront, S3, EC2, RDS, log group, alarm, SNS và IAM resource sau khi hoàn tất demo.
* Từ Event 3, rút ra bài học về giới hạn phạm vi MVP, cost estimation, teamwork, rehearsal và cách trình bày kiến trúc trung thực.
