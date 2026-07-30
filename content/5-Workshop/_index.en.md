---
title: "Workshop"
date: 2026-07-30
weight: 5
chapter: false
pre: " <b> 5. </b> "
includeInReport: false
---
# Workshop: Deploying QuickBite on AWS

This workshop moves QuickBite from a local environment to AWS using a verifiable demo architecture.

## Workshop structure

1. **Overview:** problem, scope, and architecture;
2. **Prerequisites:** account, tools, permissions, naming, and checklist;
3. **Local Baseline:** run QuickBite with Docker before deployment;
4. **AWS Deployment:** deploy S3, CloudFront, EC2, RDS, IAM, and CloudWatch in phases;
5. **Validation:** test functionality, security, logs, alarms, and evidence;
6. **Security & Cost:** least privilege, secret handling, Budgets, and right-sizing;
7. **Clean-up:** remove resources in the correct order and review costs.

## Honest scope

### Demo/implemented scope

- CloudFront + private S3 for React;
- one EC2 t3.micro running Docker/FastAPI;
- private Single-AZ RDS PostgreSQL db.t3.micro;
- S3 `quickbite-menu-images-<env>`;
- CloudWatch Logs and a CPU Alarm;
- SNS only for alarm email;
- an EC2 IAM role;
- AWS Budgets and Cost Explorer.

### Optional/future

- Lambda + SES for email;
- Route 53, ALB/ACM, and Auto Scaling;
- RDS Multi-AZ;
- WAF, Secrets Manager, and AWS Backup;
- EventBridge/SQS and cross-region DR;
- Infrastructure as Code.

> The workshop does not use API Gateway. The backend is FastAPI running on EC2.
