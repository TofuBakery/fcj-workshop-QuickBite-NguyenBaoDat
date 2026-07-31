---
title: "Các bài blogs đã đăng"
date: 2026-07-30
weight: 3
chapter: false
pre: " <b> 3. </b> "
includeInReport: false
---
Phần này giới thiệu ba bài viết về AWS được em biên soạn trong quá trình phát triển QuickBite. Mỗi bài đều có phiên bản tiếng Việt và tiếng Anh.

### [Blog 1 - Event-Driven Architecture trên AWS](3.1-Blog1/)
Bài viết trình bày cách Amazon EventBridge, Amazon SQS, Amazon SNS và AWS Lambda có thể tách các tác vụ phụ như gửi email, thông báo và cập nhật báo cáo khỏi request tạo đơn hàng. Nội dung cũng đề cập retry, idempotency, thứ tự xử lý, dead-letter queue và monitoring, sau đó liên hệ với hướng mở rộng tương lai của QuickBite.

### [Blog 2 - Disaster Recovery trên AWS](3.2-Blog2/)
Bài viết giới thiệu RTO, RPO, Backup and Restore, Pilot Light, Warm Standby và Multi-site Active/Active. Nội dung được liên hệ với QuickBite thông qua backup RDS, bảo vệ dữ liệu S3, runbook phục hồi và sự khác nhau giữa một bản demo ngắn hạn với workload production.

### [Blog 3 - Least Privilege trên AWS](3.3-Blog3/)
Bài viết phân tích nguyên tắc least privilege, IAM role cho workload, quyền theo từng resource và việc rà soát quyền định kỳ. Ví dụ QuickBite chỉ cấp cho EC2 role quyền cần thiết đối với prefix ảnh món ăn trên S3 và CloudWatch Logs, thay vì sử dụng quyền quản trị rộng.
