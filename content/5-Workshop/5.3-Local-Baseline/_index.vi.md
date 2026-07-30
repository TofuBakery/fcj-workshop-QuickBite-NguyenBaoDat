---
title: "Môi trường local"
date: 2026-07-30
weight: 3
chapter: false
pre: " <b> 5.3. </b> "
---
# Baseline local

Trước khi tạo tài nguyên AWS, QuickBite phải chạy ổn định ở local. Việc này giúp phân biệt lỗi ứng dụng với lỗi cloud configuration.

## 1. Khởi động từ dữ liệu sạch

```bash
docker compose down -v
docker compose up --build
```

Các địa chỉ dự kiến:

```text
Frontend: http://127.0.0.1:5173
Backend:  http://127.0.0.1:8000
Swagger:  http://127.0.0.1:8000/docs
Health:   http://127.0.0.1:8000/health
Mailpit:  http://127.0.0.1:8025
```

## 2. Kiểm tra health

```bash
curl http://127.0.0.1:8000/health
```

Kết quả mong đợi:

```json
{"status":"ok"}
```

## 3. Automated tests

```bash
docker compose exec   -e DATABASE_URL=sqlite:///./quickbite.db   -e EMAIL_ENABLED=false   backend pytest -q
```

E2E script:

```bash
docker compose exec   -e DATABASE_URL=sqlite:///./quickbite.db   -e EMAIL_ENABLED=false   backend python scripts/e2e_local.py
```

## 4. Manual business-flow test

1. customer đăng nhập;
2. thêm món vào giỏ;
3. tạo đơn COD;
4. tạo đơn mock e-wallet và thanh toán mô phỏng;
5. admin xác nhận;
6. kitchen chuyển preparing → ready;
7. delivery hoàn thành;
8. customer xem lịch sử/tracking;
9. kiểm tra Mailpit;
10. kiểm tra dashboard, reports và operation logs.

## 5. Điểm cần ghi minh bạch

- mock e-wallet là mô phỏng, không tích hợp cổng thanh toán thật;
- Mailpit là email mock local;
- status transition và audit trail sau mock payment cần tiếp tục siết chặt;
- upload S3 chỉ hoạt động khi có bucket/role AWS;
- tài khoản demo phải ẩn trong production build.

## 6. Evidence local

- Docker containers đang healthy;
- frontend bốn role;
- Swagger và `/health`;
- PostgreSQL tables;
- Mailpit email;
- pytest/E2E output.

Các ảnh local không thay thế bằng chứng AWS.
