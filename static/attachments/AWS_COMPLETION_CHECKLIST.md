# QuickBite AWS Completion Checklist

Only mark an item complete when real evidence exists.

## Demo architecture
- [ ] CloudFront domain serves React
- [ ] Private S3 web bucket uses OAC
- [ ] EC2 `quickbite-app` runs Docker/FastAPI
- [ ] `/health` returns `{"status":"ok"}`
- [ ] `/docs` is reachable for the demo
- [ ] RDS `quickbite-db` is private, Single-AZ, db.t3.micro
- [ ] RDS SG accepts 5432 only from EC2 SG
- [ ] schema, seed, and views were loaded from EC2
- [ ] backend reads/writes RDS
- [ ] `/uploads/image` writes to `quickbite-menu-images-<env>/menu/*`
- [ ] CloudWatch log group `quickbite/backend` contains logs
- [ ] CPU alarm `quickbite-cpu-high` exists
- [ ] SNS alarm email subscription is confirmed
- [ ] AWS Budget exists
- [ ] Cost Explorer was reviewed

## Functional evidence
- [ ] customer creates an order
- [ ] admin confirms/cancels
- [ ] kitchen prepares and marks ready
- [ ] delivery completes
- [ ] customer tracks the order
- [ ] COD and mock e-wallet are demonstrated
- [ ] dashboard/report/CSV are demonstrated
- [ ] invalid role/token cases are tested

## Report evidence
- [ ] AWS screenshots inserted
- [ ] real demo URL added
- [ ] video link added
- [ ] three AWS Study Group blog links added
- [ ] three event names/details/evidence added
- [ ] future-dated worklog reconciled with actual work
- [ ] clean-up evidence added
- [ ] next-day Billing/Cost Explorer checked

## Future, not part of the demo
- Route 53/custom domain
- API Gateway
- ALB/ACM
- Auto Scaling Group
- RDS Multi-AZ
- WAF/Secrets Manager/AWS Backup
- EventBridge/SQS
- Lambda + SES production email
- cross-region DR
- IaC/CI-CD
