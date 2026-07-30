---
title: "Nhật ký tuần 2"
date: 2026-07-30
weight: 2
chapter: false
pre: " <b> 1.2. </b> "
---
### Mục tiêu tuần 2:

* Làm quen với AWS Management Console và AWS CLI.
* Thiết kế quyền truy cập tối thiểu cho backend QuickBite chạy trên EC2.

### Các công việc đã thực hiện trong tuần:

| Ngày làm việc | Công việc | Ngày bắt đầu | Ngày hoàn thành | Tài liệu tham khảo |
|---:|---|---|---|---|
| 1 | Tìm hiểu các nhóm dịch vụ AWS cơ bản và Shared Responsibility Model; phân biệt trách nhiệm của AWS và người sử dụng. | 10/06/2026 | 11/06/2026 | [AWS Overview](https://docs.aws.amazon.com/whitepapers/latest/aws-overview/introduction.html) |
| 2 | Cài đặt AWS CLI, cấu hình region ap-southeast-1 và kiểm tra thông tin caller identity. | 10/06/2026 | 12/06/2026 | [AWS CLI User Guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html) |
| 3 | Ôn IAM User, Group, Role và Policy; xác định EC2 nên dùng IAM Role thay vì lưu access key trong source code. | 11/06/2026 | 13/06/2026 | [IAM identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id.html) |
| 4 | Soạn policy cho quickbite-ec2-role, chỉ cho phép đọc/ghi prefix menu/ trong bucket ảnh và ghi log lên CloudWatch. | 12/06/2026 | 14/06/2026 | [IAM best practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html) |
| 5 | Rà soát file .env, .env.example và .gitignore; kiểm tra không có secret, token hoặc private key bị commit. | 13/06/2026 | 15/06/2026 | [QuickBite .env examples](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 6 | Chuẩn bị AWS Budget, quy tắc đặt tên và tag Project/Environment để theo dõi tài nguyên QuickBite. | 14/06/2026 | 15/06/2026 | [AWS Budgets](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-managing-costs.html) |

### Kết quả đạt được tuần 2:

* Hiểu được các nhóm dịch vụ AWS cơ bản và cách liên hệ chúng với QuickBite:
  * Compute: Amazon EC2.
  * Storage: Amazon S3.
  * Database: Amazon RDS.
  * Networking và phân phối nội dung: VPC và CloudFront.
  * Monitoring và quản lý chi phí: CloudWatch và AWS Budgets.
* Làm quen với AWS Management Console và biết cách tìm, mở và kiểm tra thông tin của các dịch vụ cần dùng.
* Cài đặt và cấu hình AWS CLI với default Region là `ap-southeast-1`.
* Thực hiện được các lệnh kiểm tra cấu hình, tài khoản hiện tại, danh sách Region và thông tin dịch vụ từ CLI.
* Phân biệt được IAM User, Group, Role và Policy; hiểu vì sao EC2 nên dùng IAM Role thay cho access key lưu trong source code.
* Soạn được policy theo nguyên tắc Least Privilege, giới hạn quyền vào đúng bucket ảnh, prefix `menu/` và CloudWatch Logs.
* Rà soát `.env`, `.env.example` và `.gitignore`; xác nhận secret, token và private key không nên xuất hiện trong repository.
* Chuẩn bị quy tắc đặt tên, tag Project/Environment và AWS Budget để quản lý tài nguyên và chi phí của QuickBite.
