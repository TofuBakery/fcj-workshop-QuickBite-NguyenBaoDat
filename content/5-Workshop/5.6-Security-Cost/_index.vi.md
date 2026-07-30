---
title: "Bảo mật và chi phí"
date: 2026-07-30
weight: 6
chapter: false
pre: " <b> 5.6. </b> "
---
# Bảo mật và tối ưu chi phí

## 1. Shared Responsibility

AWS bảo vệ hạ tầng cloud; người triển khai QuickBite vẫn chịu trách nhiệm về IAM, network, dữ liệu, secret, cấu hình hệ điều hành/container và ứng dụng.

## 2. IAM Least Privilege

EC2 dùng `quickbite-ec2-role`, không dùng access key dài hạn.

Quyền dự kiến:

- `s3:ListBucket` đúng bucket và prefix `menu/*`;
- `s3:GetObject`/`s3:PutObject` trên `menu/*`;
- `logs:CreateLogStream`, `logs:DescribeLogStreams`, `logs:PutLogEvents` trên log group `quickbite/backend`.

Không cấp:

```json
{
  "Action": "*",
  "Resource": "*"
}
```

trừ trường hợp test tạm thời có kiểm soát, và phải gỡ ngay sau đó.

## 3. Network security

- RDS `Public access = No`;
- RDS SG chỉ nhận PostgreSQL 5432 từ EC2 SG;
- SSH 22 chỉ từ IP quản trị;
- port 8000 chỉ mở tạm khi test trực tiếp;
- bucket frontend private và dùng OAC;
- CORS chỉ cho domain CloudFront thật;
- backend production future nên dùng ALB/ACM để có HTTPS origin.

## 4. Secret management

### Demo hiện tại

Secret được đặt trong `.env` trên EC2:

```text
DATABASE_URL
SECRET_KEY
database password
```

Biện pháp tối thiểu:

```bash
chmod 600 .env
openssl rand -hex 32
```

- `.env` nằm trong `.gitignore`;
- screenshot không lộ password;
- không lưu `.pem` trong repository;
- không dùng AWS access key trong `.env`.

### Future

- AWS Systems Manager Parameter Store hoặc Secrets Manager;
- rotation;
- audit access;
- tách secret theo dev/staging/prod.

Không vẽ Secrets Manager như thành phần đã triển khai nếu chưa có bằng chứng.

## 5. Application security

- password hashing;
- JWT authentication;
- role checks;
- rate limiting;
- file type/size validation;
- lookup token;
- server-side price calculation;
- Decimal/NUMERIC cho tiền;
- audit/operation logs;
- ẩn tài khoản demo trong production.

Các cải tiến còn lại:

- state machine chặt cho order transition;
- status history/email nhất quán sau mock payment;
- CSRF/cookie strategy nếu chuyển auth mode;
- dependency/image scanning;
- HTTPS origin production.

## 6. Logging and audit

- container log → `quickbite/backend`;
- không log password, token hoặc full connection string;
- đặt retention phù hợp;
- dùng operation logs cho hành động quản trị;
- CloudTrail có thể dùng để audit AWS API, nhưng không cần trình bày như phần app log.

## 7. Cost Optimization

### Right-sizing demo

| Resource | Kích thước |
|---|---|
| EC2 | t3.micro |
| RDS | db.t3.micro, Single-AZ, 20 GB |
| S3 | theo dung lượng thực |
| CloudFront | pay as used |
| CloudWatch | kiểm soát log ingestion/retention |

### Controls

1. tạo Budget trước deployment;
2. tag resource theo project/environment/owner;
3. theo dõi Cost Explorer;
4. giữ log retention vừa đủ;
5. không tạo NAT Gateway/ALB/ASG nếu demo không cần;
6. xóa resource ngay sau khi thu thập evidence;
7. hôm sau kiểm tra Cost Explorer/Billing;
8. không giữ snapshot nếu dữ liệu demo hoàn toàn không cần thiết.

## 8. Reliability versus cost

Single-AZ RDS và một EC2 giảm chi phí nhưng không high availability. Báo cáo ghi rõ trade-off:

- **demo:** low cost, chấp nhận gián đoạn;
- **production:** Multi-AZ, ALB, Auto Scaling, backup/restore, secrets management và IaC.

## 9. Sustainability

- dùng managed service phù hợp;
- right-size;
- xóa môi trường không sử dụng;
- tránh giữ log/file không cần;
- ưu tiên kiến trúc đủ dùng thay vì over-provisioning.

## 10. Checklist

- [ ] MFA;
- [ ] IAM role scoped;
- [ ] RDS private;
- [ ] SSH My IP;
- [ ] `.env` không commit;
- [ ] không có secret trong screenshot;
- [ ] CloudWatch log retention;
- [ ] Budget và email alert;
- [ ] tag;
- [ ] cleanup plan;
- [ ] Cost Explorer review.
