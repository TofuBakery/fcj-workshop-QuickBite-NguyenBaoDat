---
title: "Tổng quan"
date: 2026-07-30
weight: 1
chapter: false
pre: " <b> 5.1. </b> "
---
# Tổng quan Workshop

## QuickBite giải quyết vấn đề gì?

QuickBite số hóa quy trình đặt món và xử lý đơn giữa khách hàng, quản trị viên, bếp và nhân viên giao hàng. Dữ liệu giao dịch được lưu trong PostgreSQL; frontend và backend được tách riêng; ảnh món được lưu ở object storage.

## Business flow

```text
1. Customer tạo đơn
2. FastAPI/EC2 kiểm tra dữ liệu và ghi đơn
3. RDS PostgreSQL lưu order, order items và payment
4. Kitchen xử lý đơn
5. Delivery giao đơn
6. Customer nhận và theo dõi trạng thái
```

## Kiến trúc local

```text
React/Vite :5173
      |
FastAPI :8000
      |
PostgreSQL :5432
      |
Mailpit :8025 (email mock)
```

## Kiến trúc AWS demo

```text
Users
  |
  v
CloudFront
  |----------------------> S3 private: quickbite-web-<env>
  |
  +-- API path ----------> EC2 t3.micro: Docker + FastAPI
                                  |
                         TCP 5432 | /uploads/image
                                  v
                    RDS PostgreSQL private       S3 menu images

EC2 logs --> CloudWatch Logs --> CPU Alarm --> SNS email
EC2 IAM role --> scoped S3 + CloudWatch permissions
Budgets / Cost Explorer --> cost control
```

## Vì sao chọn kiến trúc này?

- bám sát cấu trúc source hiện tại;
- sử dụng ít nhất ba dịch vụ AWS và thể hiện một use case hoàn chỉnh;
- RDS private giúp database không mở trực tiếp ra Internet;
- CloudFront phù hợp frontend static;
- S3 phù hợp lưu ảnh;
- EC2 cho phép giữ backend Docker và dễ quan sát trong workshop;
- CloudWatch cung cấp log/alarm có thể chụp bằng chứng;
- Single-AZ và một EC2 giúp kiểm soát chi phí demo.

## Giới hạn

Kiến trúc demo chưa có high availability đầy đủ. EC2 và RDS Single-AZ vẫn là single points of failure. Các dịch vụ nâng cao được ghi ở phần Future, không trình bày như đã triển khai.

## Source

- [Repository](https://github.com/edrictrn/quickbite)
- [Snapshot commit](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db)
