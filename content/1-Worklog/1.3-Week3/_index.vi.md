---
title: "Nhật ký tuần 3"
date: 2026-07-30
weight: 3
chapter: false
pre: " <b> 1.3. </b> "
---
### Mục tiêu tuần 3:

* Ổn định QuickBite trước khi chuyển các thành phần lên AWS.
* Kiểm tra đầy đủ luồng đặt món, thanh toán và xử lý đơn.

### Các công việc đã thực hiện trong tuần:

| Ngày làm việc | Công việc | Ngày bắt đầu | Ngày hoàn thành | Tài liệu tham khảo |
|---:|---|---|---|---|
| 1 | Rà soát Dockerfile và docker-compose.yml cho frontend, backend, PostgreSQL và Mailpit; kiểm tra health check và volume. | 16/06/2026 | 18/06/2026 | [Docker Compose](https://docs.docker.com/compose/) |
| 2 | Kiểm thử đăng ký, đăng nhập, JWT và phân quyền cho customer, admin, kitchen staff và delivery staff. | 16/06/2026 | 19/06/2026 | [QuickBite authentication code](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 3 | Kiểm thử menu, giỏ hàng, COD, mock e-wallet, phí giao hàng, thuế và cách tính tổng tiền bằng Decimal/NUMERIC. | 17/06/2026 | 20/06/2026 | [QuickBite order and payment modules](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 4 | Kiểm tra state transition và order_status_history từ pending, confirmed, preparing, ready đến completed/cancelled. | 18/06/2026 | 20/06/2026 | [QuickBite order workflow](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 5 | Chạy pytest và script e2e_local.py; ghi lại lỗi, cách tái hiện và kết quả sau khi sửa. | 19/06/2026 | 21/06/2026 | [QuickBite tests](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 6 | Đối chiếu thành phần local với dịch vụ AWS tương ứng: PostgreSQL sang RDS, ảnh sang S3, log sang CloudWatch. | 20/06/2026 | 21/06/2026 | [Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html) |

### Kết quả đạt được tuần 3:

* Hiểu rõ cách các container frontend, backend, PostgreSQL và Mailpit giao tiếp trong môi trường Docker Compose.
* Rà soát được Dockerfile, health check và volume; biết thành phần nào cần giữ lại khi chuyển sang AWS.
* Kiểm tra được quá trình đăng ký, đăng nhập, JWT và quyền truy cập của customer, admin, kitchen staff và delivery staff.
* Xác nhận được các chức năng chính của luồng đặt món:
  * Hiển thị menu và quản lý giỏ hàng.
  * Thanh toán COD và mock e-wallet.
  * Tính phí giao hàng, thuế và tổng tiền.
  * Theo dõi trạng thái đơn hàng.
* Kiểm tra được state transition và bảng `order_status_history` từ pending đến completed hoặc cancelled.
* Chạy được bộ test và script E2E local; biết cách ghi lại lỗi, điều kiện tái hiện và kết quả sau khi sửa.
* Xác nhận dữ liệu tiền được xử lý bằng Decimal/NUMERIC thay vì kiểu số thực không phù hợp.
* Hoàn thiện một baseline local đủ ổn định để tiếp tục thiết kế và chuẩn bị triển khai AWS.
