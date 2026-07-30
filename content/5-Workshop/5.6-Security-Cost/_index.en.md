---
title: "Security and Cost"
date: 2026-07-30
weight: 6
chapter: false
pre: " <b> 5.6. </b> "
---
# Security and cost optimization

## 1. Shared Responsibility

AWS protects cloud infrastructure; the QuickBite implementer remains responsible for IAM, networking, data, secrets, operating system/container configuration, and the application.

## 2. IAM Least Privilege

EC2 uses `quickbite-ec2-role`, not long-term access keys.

Expected permissions:

- `s3:ListBucket` for the exact bucket and `menu/*` prefix;
- `s3:GetObject`/`s3:PutObject` on `menu/*`;
- `logs:CreateLogStream`, `logs:DescribeLogStreams`, and `logs:PutLogEvents` on `quickbite/backend`.

Do not grant:

```json
{
  "Action": "*",
  "Resource": "*"
}
```

except in a controlled temporary test, and remove it immediately afterward.

## 3. Network security

- RDS `Public access = No`;
- RDS SG accepts PostgreSQL 5432 only from the EC2 SG;
- SSH 22 is restricted to the administrator IP;
- port 8000 is opened only temporarily for direct testing;
- the frontend bucket is private and uses OAC;
- CORS allows only the real CloudFront domain;
- a future production backend should use ALB/ACM for an HTTPS origin.

## 4. Secret management

### Current demo

Secrets are stored in `.env` on EC2:

```text
DATABASE_URL
SECRET_KEY
database password
```

Minimum controls:

```bash
chmod 600 .env
openssl rand -hex 32
```

- `.env` is ignored by Git;
- screenshots do not expose passwords;
- `.pem` is never stored in the repository;
- AWS access keys are not placed in `.env`.

### Future

- AWS Systems Manager Parameter Store or Secrets Manager;
- rotation;
- access auditing;
- separate secrets for dev/staging/prod.

Do not show Secrets Manager as deployed without evidence.

## 5. Application security

- password hashing;
- JWT authentication;
- role checks;
- rate limiting;
- file type/size validation;
- lookup tokens;
- server-side price calculation;
- Decimal/NUMERIC for money;
- audit/operation logs;
- hidden demo accounts in production.

Remaining improvements:

- a strict order-transition state machine;
- consistent status history/email after mock payment;
- CSRF/cookie strategy if the authentication mode changes;
- dependency/image scanning;
- production origin HTTPS.

## 6. Logging and audit

- container logs → `quickbite/backend`;
- never log passwords, tokens, or full connection strings;
- configure appropriate retention;
- use operation logs for administrative actions;
- CloudTrail can audit AWS API activity but should not be confused with application logs.

## 7. Cost Optimization

### Demo right-sizing

| Resource | Size |
|---|---|
| EC2 | t3.micro |
| RDS | db.t3.micro, Single-AZ, 20 GB |
| S3 | actual usage |
| CloudFront | pay as used |
| CloudWatch | control ingestion and retention |

### Controls

1. create a Budget before deployment;
2. tag resources by project/environment/owner;
3. monitor Cost Explorer;
4. use a suitable log-retention period;
5. avoid NAT Gateway/ALB/ASG when the demo does not require them;
6. delete resources immediately after evidence is captured;
7. review Cost Explorer/Billing the next day;
8. do not keep snapshots when disposable demo data is not needed.

## 8. Reliability versus cost

Single-AZ RDS and one EC2 instance reduce cost but do not provide high availability. The report states the trade-off:

- **demo:** low cost and accepted interruption;
- **production:** Multi-AZ, ALB, Auto Scaling, backup/restore, secrets management, and IaC.

## 9. Sustainability

- use appropriate managed services;
- right-size;
- delete unused environments;
- avoid retaining unnecessary logs/files;
- prefer sufficient architecture over over-provisioning.

## 10. Checklist

- [ ] MFA;
- [ ] scoped IAM role;
- [ ] private RDS;
- [ ] SSH from My IP;
- [ ] `.env` not committed;
- [ ] no secret in screenshots;
- [ ] CloudWatch log retention;
- [ ] Budget and email alert;
- [ ] tags;
- [ ] clean-up plan;
- [ ] Cost Explorer review.
