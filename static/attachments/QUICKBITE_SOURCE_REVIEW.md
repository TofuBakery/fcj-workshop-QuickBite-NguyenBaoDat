# QuickBite-final-v3 Source Review

## Verified local baseline
- React/Vite frontend
- FastAPI backend
- PostgreSQL
- Docker Compose
- Mailpit for local email simulation
- four roles: customer, admin, kitchen, delivery
- menu/cart/order/payment/tracking/dashboard/report/audit flows
- PostgreSQL schema, seed, views, and Alembic migration
- backend tests and local E2E script

## AWS-ready files
- `docker-compose.aws.yml`: backend only; no local database
- S3 upload endpoint `/uploads/image`
- S3/region/menu image environment variables
- Docker `awslogs` integration for `quickbite/backend`
- deployment walkthrough
- IAM/S3/CloudWatch documentation
- optional Lambda + SES sample
- clean-up guide

## Current demo architecture
- CloudFront + private S3 web
- one EC2 t3.micro with Docker/FastAPI
- private Single-AZ RDS PostgreSQL db.t3.micro
- S3 menu images
- CloudWatch Logs + EC2 CPU alarm
- SNS only for alarm email
- EC2 IAM role
- AWS Budgets and Cost Explorer

## Explicitly future/optional
- Route 53/custom domain
- API Gateway
- ALB/ACM
- Auto Scaling Group
- RDS Multi-AZ
- WAF
- Secrets Manager
- AWS Backup/cross-region DR
- EventBridge/SQS
- Lambda + SES production email
- IaC and CI/CD

## Technical debt to keep transparent
- mock e-wallet is not a real gateway
- status history/email after mock payment should be made fully consistent
- order transitions should be enforced with a stricter state machine
- demo credentials must remain hidden in production builds
- secrets are still passed through EC2 `.env` in the demo
