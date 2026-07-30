---
title: "Kiểm thử và xác thực"
date: 2026-07-30
weight: 5
chapter: false
pre: " <b> 5.5. </b> "
---
# Kiểm thử và xác thực

Mục tiêu của phần này là chứng minh QuickBite hoạt động end-to-end trên kiến trúc demo, không chỉ chứng minh từng resource tồn tại.

## 1. Evidence matrix

| Hạng mục | Cách kiểm tra | Kết quả mong đợi | Bằng chứng |
|---|---|---|---|
| CloudFront frontend | mở domain và refresh deep link | React hiển thị, không lỗi 403/404 | URL + screenshot |
| Backend health | gọi `/health` | `{"status":"ok"}` | browser/curl |
| Swagger | mở `/docs` | OpenAPI UI hiển thị | screenshot |
| RDS private | xem connectivity và SG | Public access = No, 5432 từ EC2 SG | console |
| Database | `psql ... -c "\dt"` từ EC2 | thấy tables/views | terminal |
| Order flow | customer → admin → kitchen → delivery | đơn hoàn thành đúng trạng thái | screenshots/API output |
| Image upload | `/uploads/image` | object xuất hiện dưới `menu/` | request + S3 |
| CloudWatch logs | mở `quickbite/backend` | có startup/request/error logs | screenshot |
| CPU alarm | mở `quickbite-cpu-high` | metric/alarm/action đúng | screenshot |
| SNS | xác nhận subscription | status Confirmed | screenshot |
| Budget | mở Budget | ngưỡng và email đúng | screenshot |
| Clean-up | kiểm tra resource list | tài nguyên demo đã xóa | terminal/console |

Không đánh dấu “Pass” nếu chưa có bằng chứng thật.

## 2. Functional tests

### Customer

- đăng ký/đăng nhập;
- xem và lọc menu;
- thêm/xóa/cập nhật số lượng trong giỏ;
- tạo COD order;
- tạo mock e-wallet order;
- xem subtotal, delivery fee, tax và total;
- xem lịch sử/tracking;
- lookup bằng order code/token;
- thử token sai.

### Admin

- dashboard;
- quản lý menu/category;
- upload ảnh;
- cập nhật settings;
- xác nhận/hủy đơn;
- xem reports và export CSV;
- xem operation logs.

### Kitchen

- xem đơn được giao cho bếp;
- chuyển confirmed → preparing → ready;
- kiểm tra role khác không được phép.

### Delivery

- xem đơn ready;
- chuyển ready → completed;
- kiểm tra customer thấy trạng thái mới.

## 3. Database validation

Trên EC2:

```bash
psql "$DB" -c "\dt"
psql "$DB" -c "SELECT id, order_code, status, total FROM orders ORDER BY id DESC LIMIT 5;"
psql "$DB" -c "SELECT * FROM daily_revenue LIMIT 5;"
```

Kiểm tra:

- order và order_items cùng được ghi;
- total dùng NUMERIC/Decimal;
- payment record phù hợp method/status;
- status history không thiếu bước;
- view báo cáo truy vấn được.

## 4. Security negative tests

- gọi admin endpoint bằng customer token → 403;
- upload file không phải JPEG/PNG/WebP → bị từ chối;
- upload file vượt giới hạn → bị từ chối;
- login sai nhiều lần → rate limit;
- RDS port 5432 từ Internet → không kết nối;
- EC2 role thử truy cập bucket không liên quan → AccessDenied;
- CORS request từ origin lạ → bị chặn.

## 5. Failure tests

| Tình huống | Cần quan sát |
|---|---|
| restart backend container | health phục hồi, log có restart |
| sai RDS password | backend log lỗi kết nối, không lộ password |
| đóng SG 5432 tạm thời | request DB lỗi có kiểm soát, log rõ |
| xóa quyền S3 tạm thời | upload trả lỗi phù hợp, CloudWatch có log |
| route frontend sâu | refresh vẫn về `index.html` |
| CORS sai | browser chặn và log/config được xác định |

Sau test phải khôi phục cấu hình an toàn.

## 6. Performance and cost checks

- quan sát EC2 CPU/memory ở tải demo;
- kiểm tra RDS connections;
- kiểm tra kích thước log và retention;
- xác nhận không có tài nguyên ngoài scope;
- kiểm tra Cost Explorer sau deployment và sau clean-up.

## 7. Acceptance criteria

Workshop được coi là hoàn thành khi:

- tất cả test chức năng quan trọng pass;
- không có secret trong source/screenshot;
- RDS private;
- log và alarm có bằng chứng;
- frontend/backend/database/S3 hoạt động cùng nhau;
- report có URL, screenshot và output thực tế;
- clean-up hoàn thành.

## 8. Các giới hạn cần ghi trong kết quả

- mock payment không phải payment gateway thật;
- Mailpit là local mock;
- Lambda/SES là optional;
- không có API Gateway;
- không có ASG/Multi-AZ/WAF/Secrets Manager/AWS Backup trong demo;
- alarm 5xx chưa được triển khai nếu không có ALB/custom metric.
