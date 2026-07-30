---
title: "Proposal"
date: 2026-07-30
weight: 2
chapter: false
pre: " <b> 2. </b> "
includeInReport: false
---
# QuickBite on AWS Project Proposal

## 1. Overview

QuickBite is a food-ordering platform for cafeterias, offices, or internal delivery operations. It supports four user groups:

- **Customer:** browse the menu, place orders, use COD/mock e-wallet, track and look up orders;
- **Admin:** manage items, categories, settings, orders, dashboards, and reports;
- **Kitchen:** receive and prepare orders;
- **Delivery:** receive ready orders and complete delivery.

The local baseline uses React/Vite, FastAPI, PostgreSQL, Docker Compose, and Mailpit. This proposal moves that baseline to AWS with an architecture that can be demonstrated, validated, monitored, and cleaned up within an internship budget.

## 2. Problem statement

A local-only ordering system does not address important real-environment requirements:

1. external users cannot access it reliably;
2. frontend, backend, and database responsibilities are not separated operationally;
3. menu images lack cloud object storage;
4. centralized logs, alarms, and cost controls are missing;
5. deployment, validation, and clean-up are not repeatable;
6. an oversized architecture without URLs or screenshots would not be verifiable.

Therefore, QuickBite uses an **evidence-based demo architecture** rather than claiming an undeployed enterprise platform.

## 3. Objectives

### Functional objectives

- support the complete customer → admin → kitchen → delivery flow;
- store transactional data in PostgreSQL;
- upload menu images through `/uploads/image`;
- provide dashboards, CSV reports, audit logs, and order tracking;
- expose health checks and support end-to-end testing.

### AWS objectives

- deliver React through Amazon CloudFront and private Amazon S3;
- run Dockerized FastAPI on one Amazon EC2 instance;
- use private, Single-AZ Amazon RDS for PostgreSQL for the demo;
- store menu images in Amazon S3;
- send container logs to Amazon CloudWatch Logs;
- create a CloudWatch CPU alarm with Amazon SNS email notification;
- grant permissions through a least-privilege IAM role;
- control spending with AWS Budgets and Cost Explorer;
- provide a clean-up runbook to avoid continuing charges.

## 4. Proposed demo architecture

```text
Customer / Admin / Kitchen / Delivery
                    |
                 HTTPS
                    v
             Amazon CloudFront
               /             \
              /               \ API behaviors
     Private S3 web             v
 quickbite-web-<env>      EC2 t3.micro
                         Docker + FastAPI
                          quickbite-app
                           /          \
                    TCP 5432          \ /uploads/image
                       v               v
             Private RDS             S3 menu images
       PostgreSQL db.t3.micro   quickbite-menu-images-<env>
              Single-AZ

EC2 container logs ──> CloudWatch Logs: quickbite/backend
EC2 CPU metric ──────> Alarm: quickbite-cpu-high ──> SNS email
EC2 IAM role ────────> S3 menu/* + CloudWatch Logs
Budgets / Cost Explorer ───────> cost visibility and alerts
```

### Demo components

| Component | Choice | Rationale |
|---|---|---|
| Frontend | Private S3 + CloudFront OAC | HTTPS and CDN without a dedicated web server |
| Backend | One EC2 t3.micro running Docker/FastAPI | Matches the source and remains easy to inspect in a workshop |
| Database | Private Single-AZ RDS PostgreSQL db.t3.micro, 20 GB | Managed database within the demo budget |
| Menu images | S3 `quickbite-menu-images-<env>` | Appropriate object storage for images |
| Logging | CloudWatch Logs `quickbite/backend` | Centralized logs through Docker `awslogs` |
| Alert | CloudWatch CPU alarm + SNS email | Demonstrable monitoring without an ALB |
| Identity | EC2 IAM role | No hard-coded access keys |
| Cost | Budgets + Cost Explorer | Spending alerts and visibility |

### Outside the current demo scope

The following items are **Future / Planned** and must not be presented as deployed:

- Route 53 and a custom domain;
- API Gateway;
- Application Load Balancer;
- Auto Scaling Group;
- RDS Multi-AZ;
- configured AWS WAF and AWS Shield controls;
- AWS Secrets Manager;
- AWS Backup and cross-region snapshots;
- EventBridge/SQS;
- Lambda + SES production email.

Mailpit remains the local email mock. Lambda + SES is optional/future only.

## 5. AWS Well-Architected alignment

| Pillar | Applied in the demo | Future improvement |
|---|---|---|
| Operational Excellence | runbooks, health checks, CloudWatch Logs, alarms, evidence checklist, clean-up | Infrastructure as Code and CI/CD |
| Security | private RDS, source-based SG rules, IAM role, private web bucket/OAC, no committed `.env` | Secrets Manager/Parameter Store, WAF, backend TLS via ALB/ACM |
| Reliability | health checks, managed RDS, persistent data, troubleshooting runbook | Multi-AZ, automated backups, restore drills |
| Performance Efficiency | CloudFront for static content, demo-sized t3.micro | Auto Scaling, ALB, load testing |
| Cost Optimization | t3.micro/db.t3.micro, Single-AZ, Budget, clean-up | metric-driven right-sizing and lifecycle rules |
| Sustainability | managed services and deletion of idle resources | automated shutdown and lifecycle controls |

## 6. Eight-week timeline

| Phase | Weeks | Content |
|---|---:|---|
| Discovery and scope | 1–2 | FCAJ requirements, source review, AWS CLI, IAM, and security |
| Application stabilization | 3 | Docker, PostgreSQL, role flow, and local E2E |
| Cloud design | 4–5 | Proposal, Well-Architected, VPC/RDS/EC2/S3/CloudFront |
| Deployment preparation | 6–7 | deployment files, CORS, mixed content, image upload, and clean-up |
| Validation and reporting | 8 | AWS checks, CloudWatch, alarms, blogs, references, and evidence checklist |

## 7. Estimated budget

The project uses small resources and keeps them only for the demo period:

- one EC2 t3.micro;
- one Single-AZ RDS db.t3.micro with 20 GB;
- two S3 buckets;
- one CloudFront distribution;
- CloudWatch Logs/Alarm and SNS email;
- AWS Budgets.

Actual cost must come from **Billing/Cost Explorer** after deployment. The report should not claim a number without billing evidence. Resources are removed after the demo according to `cleanup.md`.

## 8. Risks and mitigations

| Risk | Impact | Mitigation |
|---|---|---|
| Private RDS is unreachable from the laptop | schema cannot be loaded | load schema from EC2 using `psql` |
| Compose starts local PostgreSQL | backend does not use RDS | use backend-only `docker-compose.aws.yml` |
| CloudFront HTTPS calls EC2 HTTP | mixed content | CloudFront API origin/behaviors; ALB+ACM is future |
| Incorrect CORS domain | frontend cannot call API | update the CloudFront domain and restart backend |
| Overly broad IAM | larger blast radius | scope the EC2 role by action, bucket, and prefix |
| Secret committed to Git | credential exposure | `.gitignore`, placeholders, runtime secret generation |
| Resources keep charging | budget overrun | Budget, tags, clean-up checklist, Cost Explorer review |
| Unsupported claims | low report credibility | an evidence matrix for each service, URL, and test |

## 9. Success criteria

AWS completion requires evidence for all of the following:

1. CloudFront serves the frontend and deep-link refresh works;
2. backend `/health` and `/docs` work through the demo access path;
3. the backend reads/writes private RDS;
4. customer and staff roles complete the order flow;
5. image upload creates an S3 object and the image displays;
6. CloudWatch contains container logs;
7. a CPU alarm and SNS subscription are configured;
8. a Budget exists;
9. screenshots/terminal outputs cover key steps;
10. clean-up evidence and a post-deletion cost check are available.

## 10. Repository

- [QuickBite repository](https://github.com/edrictrn/quickbite)
- [Snapshot commit `6c79b99`](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db)
