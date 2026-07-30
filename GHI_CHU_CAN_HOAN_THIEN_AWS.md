# Các phần phải hoàn thiện trước khi ghi QuickBite đã triển khai trên AWS

## Baseline source

Báo cáo dùng `QuickBite-final-v3` và các file triển khai được đồng bộ trong
`static/attachments`.

## Chỉ xác nhận “đã triển khai” khi có bằng chứng

- CloudFront domain và private S3 web bucket;
- EC2 `quickbite-app` chạy Docker/FastAPI;
- `/health` và `/docs`;
- private RDS `quickbite-db`, SG 5432 từ EC2 SG;
- `psql \dt` và dữ liệu order trên RDS;
- S3 `quickbite-menu-images-<env>/menu/*`;
- CloudWatch log group `quickbite/backend`;
- CPU alarm `quickbite-cpu-high`;
- SNS alarm subscription;
- AWS Budget và Cost Explorer;
- E2E customer → admin → kitchen → delivery;
- clean-up evidence.

## Không thuộc demo hiện tại

- Route 53/custom domain;
- API Gateway;
- ALB/ACM;
- Auto Scaling Group;
- RDS Multi-AZ;
- WAF;
- Secrets Manager;
- AWS Backup/cross-region DR;
- EventBridge/SQS;
- Lambda + SES production email;
- IaC/CI-CD.

## Technical debt nên xử lý

- đồng bộ status history/email sau mock payment;
- enforce state transition chặt;
- kiểm tra production build ẩn demo credentials;
- chuyển secret khỏi `.env` khi lên production;
- thêm restore test và IaC trong giai đoạn sau.

Xem `static/attachments/AWS_COMPLETION_CHECKLIST.md` để đánh dấu evidence.
