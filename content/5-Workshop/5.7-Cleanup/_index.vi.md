---
title: "Dọn dẹp tài nguyên"
date: 2026-07-30
weight: 7
chapter: false
pre: " <b> 5.7. </b> "
---
# Clean-up

Clean-up là một phần bắt buộc của workshop vì EC2, RDS, CloudFront, CloudWatch và các tài nguyên liên quan có thể tiếp tục phát sinh chi phí.

> Chỉ dùng `--skip-final-snapshot` khi database chứa dữ liệu demo có thể bỏ. Môi trường cần giữ dữ liệu phải có snapshot/backup phù hợp.

## 1. Thu thập bằng chứng trước khi xóa

- CloudFront domain và frontend;
- `/health`, `/docs`;
- order flow;
- RDS `Available`, `\dt` và sample data;
- S3 image object;
- CloudWatch logs;
- CPU alarm;
- SNS subscription;
- Budget;
- Cost Explorer.

Ẩn password, token, account ID nếu cần.

## 2. Dừng traffic

- thông báo kết thúc demo;
- không tạo order mới;
- kiểm tra không còn tiến trình test;
- lưu các terminal output cần thiết.

## 3. CloudFront

1. disable distribution;
2. chờ trạng thái deployed;
3. delete distribution;
4. xóa Origin Access Control nếu không còn dùng.

CloudFront có thể cần thời gian để disable.

## 4. S3

Làm rỗng:

```bash
aws s3 rm s3://quickbite-web-<env> --recursive
aws s3 rm s3://quickbite-menu-images-<env> --recursive
```

Nếu versioning bật, cần xóa cả versions/delete markers.

Xóa bucket:

```bash
aws s3 rb s3://quickbite-web-<env>
aws s3 rb s3://quickbite-menu-images-<env>
```

## 5. EC2

Trước khi terminate, không cần lưu `.env` vào repository.

```bash
aws ec2 terminate-instances --instance-ids <instance-id>
```

Sau đó xóa:

- key pair trên AWS nếu không còn dùng;
- local `.pem` theo chính sách cá nhân;
- Elastic IP nếu có;
- volume/snapshot ngoài ý muốn;
- EC2 security group sau khi dependency đã được gỡ.

## 6. RDS

### Disposable demo

```bash
aws rds delete-db-instance   --db-instance-identifier quickbite-db   --skip-final-snapshot   --delete-automated-backups
```

### Dữ liệu cần giữ

Dùng final snapshot:

```bash
aws rds delete-db-instance   --db-instance-identifier quickbite-db   --final-db-snapshot-identifier quickbite-db-final-<date>
```

Sau khi RDS xóa xong, xóa RDS SG/subnet group nếu không còn dùng.

## 7. CloudWatch và SNS

Xóa:

- alarm `quickbite-cpu-high`;
- log group `quickbite/backend`;
- dashboard/custom metrics nếu có;
- SNS subscription/topic nếu chỉ phục vụ demo.

Ví dụ:

```bash
aws cloudwatch delete-alarms --alarm-names quickbite-cpu-high
aws logs delete-log-group --log-group-name quickbite/backend
```

## 8. IAM

- detach/delete inline policy;
- remove role khỏi instance profile;
- delete instance profile;
- delete `quickbite-ec2-role`.

Chỉ xóa role/policy do project tạo, không xóa shared organizational role.

## 9. Network

Nếu đã tạo VPC riêng:

1. xóa dependency còn lại;
2. xóa security groups;
3. xóa route table/subnet/Internet Gateway;
4. xóa VPC.

Demo không cần NAT Gateway; nếu vô tình tạo, phải xóa sớm vì đây là tài nguyên có thể tốn chi phí đáng kể.

## 10. Kiểm tra sau clean-up

- EC2 Instances: không còn running/stopped;
- RDS Databases: không còn instance;
- S3: không còn hai bucket;
- CloudFront: distribution đã xóa;
- CloudWatch: log group/alarm đã xóa;
- SNS: topic demo đã xóa;
- IAM: role/policy demo đã xóa;
- Elastic IP: không còn unattached;
- Billing/Cost Explorer: kiểm tra hôm sau.

## 11. Evidence clean-up

Chụp hoặc lưu:

- terminal delete commands;
- EC2/RDS list sau xóa;
- S3 list;
- CloudFront list;
- CloudWatch list;
- Cost Explorer ngày hôm sau.

## 12. Reflection

Clean-up không chỉ là tiết kiệm credit. Nó thể hiện Operational Excellence, Cost Optimization và Sustainability: tài nguyên có owner, lifecycle và điểm kết thúc rõ ràng.
