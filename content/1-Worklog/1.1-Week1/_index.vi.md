---
title: "Nhật ký tuần 1"
date: 2026-07-30
weight: 1
chapter: false
pre: " <b> 1.1. </b> "
---
### Mục tiêu tuần 1:

* Nắm cấu trúc báo cáo FCAJ và các đầu mục cần hoàn thành.
* Hiểu source code, vai trò người dùng và phạm vi triển khai AWS phù hợp với QuickBite.

### Các công việc đã thực hiện trong tuần:

| Ngày làm việc | Công việc | Ngày bắt đầu | Ngày hoàn thành | Tài liệu tham khảo |
|---:|---|---|---|---|
| 1 | Đọc quy định workshop và đối chiếu các mục bắt buộc: song ngữ, worklog, blog, event, workshop, hình ảnh, code snippet và file đính kèm. | 04/06/2026 | 05/06/2026 | Quy định workshop FCAJ |
| 2 | Khảo sát repository QuickBite; ghi lại stack React/Vite, FastAPI, PostgreSQL, Docker Compose, Mailpit, SQL migration và bộ test. | 04/06/2026 | 06/06/2026 | [QuickBite repository](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 3 | Tham gia First Cloud Journey Community Day; ghi chú các chủ đề Docker, AWS WAF, GraphRAG, WebSocket, Cloud/DevOps và teamwork. | 06/06/2026 | 06/06/2026 | Ghi chú và slide Event 1 |
| 4 | Chạy QuickBite bằng Docker; kiểm tra frontend, Swagger, endpoint /health, PostgreSQL và Mailpit. | 07/06/2026 | 09/06/2026 | [QuickBite README](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db#readme) |
| 5 | Kiểm tra luồng customer, admin, kitchen và delivery; đối chiếu trạng thái đơn hàng từ lúc tạo đến hoàn tất. | 08/06/2026 | 09/06/2026 | [QuickBite source](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 6 | Chốt phạm vi demo AWS gồm S3, CloudFront, EC2, RDS PostgreSQL, CloudWatch, IAM và AWS Budgets; tách riêng các hạng mục future. | 07/06/2026 | 09/06/2026 | [AWS Well-Architected Framework](https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html) |

### Kết quả đạt được tuần 1:

* Hiểu rõ cấu trúc của báo cáo FCAJ và xác định được các phần cần chuẩn bị:
  * Nội dung song ngữ Việt - Anh.
  * Worklog, Proposal, Blog Post, Events Participated, Workshop, Self-evaluation và Sharing and Feedback.
  * Hình ảnh minh họa, sơ đồ kiến trúc, code snippet và file triển khai đi kèm.
* Khảo sát được cấu trúc source code QuickBite và nắm vai trò của từng thành phần:
  * React, TypeScript và Vite cho frontend.
  * FastAPI cho backend.
  * PostgreSQL cho dữ liệu.
  * Docker Compose cho môi trường local và Mailpit cho email thử nghiệm.
* Chạy được QuickBite trên máy local và biết cách kiểm tra:
  * Giao diện người dùng.
  * Swagger API.
  * Endpoint `/health`.
  * Kết nối PostgreSQL và email trong Mailpit.
* Kiểm tra được luồng nghiệp vụ của bốn nhóm người dùng: customer, admin, kitchen staff và delivery staff.
* Ghi nhận được các bài học từ Community Day ngày 06/06 về Docker, AWS WAF, GraphRAG, WebSocket, Cloud/DevOps và teamwork.
* Xác định được phạm vi AWS phù hợp với bản demo QuickBite gồm S3, CloudFront, EC2, RDS PostgreSQL, CloudWatch, IAM và AWS Budgets.
* Phân biệt rõ thành phần sẽ dùng trong demo với các cải tiến tương lai để tránh mô tả quá mức trong báo cáo.
