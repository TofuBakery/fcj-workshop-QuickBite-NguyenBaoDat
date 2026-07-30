---
title: "FCAJ Report - QuickBite"
date: 2026-07-30
weight: 1
chapter: false
pre: "<b></b>"
---
# FCAJ Internship / Workshop Report
## Project: QuickBite - AWS-based canteen ordering and operations platform

{{% notice info %}}
This revision is grounded in **QuickBite-final-v3**, the QuickBite repository, and the AWS deployment guides included in the source. It separates **available in source/local**, **prepared for AWS deployment**, and **completed only after real URLs, logs, or screenshots are collected**.
{{% /notice %}}

### Student information

| Field | Value |
|---|---|
| Full name | **Nguyễn Bảo Đạt** |
| Student ID | **2352232** |
| Phone number | **[TO BE UPDATED]** |
| Email | **dat.nguyenbaodat1410@hcmut.edu.vn** |
| University | **Ho Chi Minh City University of Technology - VNU-HCM (HCMUT)** |
| Major | **Computer Engineering** |
| FCAJ class / cohort | **[UPDATE FROM OFFICIAL RECORDS]** |
| Internship program | **First Cloud Journey (FCAJ) / AWS Study Group** |
| Internship position | **Cloud / Software Engineering Intern - [confirm official title]** |
| Worklog period | **4 June 2026 - 31 July 2026 (8 weeks, 6 working days per week)** |

{{< report-image src="images/quickbite-cover.svg" alt="QuickBite report cover" >}}

### Report structure

1. [Eight-week Worklog](1-Worklog/)
2. [Proposal](2-Proposal/)
3. [Three Blog Posts](3-BlogsPosted/)
4. [Events Participated](4-EventParticipated/)
5. [Workshop - QuickBite on AWS](5-Workshop/)
6. [Self-evaluation](6-Self-evaluation/)
7. [Sharing and Feedback](7-Feedback/)
### Technical scope presented honestly

- <span class="status-done">Local baseline:</span> React/TypeScript/Vite, FastAPI, PostgreSQL, Docker Compose, Mailpit, JWT/RBAC, role flow, COD/mock e-wallet, tracking, dashboards, CSV reports, audit logs, Alembic, and 17 test functions.
- <span class="status-done">Deployment assets:</span> Dockerfiles, `docker-compose.aws.yml`, PostgreSQL files, phase-by-phase deployment guide, CloudWatch logging configuration, Lambda + SES sample, and clean-up guide.
- <span class="status-pending">AWS demo architecture:</span> CloudFront + S3, EC2 Docker FastAPI, private Single-AZ RDS PostgreSQL, S3 images, CloudWatch Logs + CPU Alarm, IAM role, SNS alarm email, Budgets, and Cost Explorer.
- <span class="status-pending">Optional/Future:</span> Lambda + SES order email, IaC, Auto Scaling, Multi-AZ, WAF, Secrets Manager, and advanced DR.
- <span class="status-missing">Evidence still required:</span> demo URL, AWS Console screenshots, real logs/metrics/alarms, published blog links, names/evidence for three events, demo video, and clean-up evidence.

### Repository

- [QuickBite repository](https://github.com/edrictrn/quickbite)
- [Pinned snapshot used for comparison (`6c79b99`)](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db)
