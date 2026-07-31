---
title: "FCAJ Report - QuickBite"
date: 2026-07-31
weight: 1
chapter: false
pre: "<b></b>"
---
# FCAJ Internship / Workshop Report
## Project: QuickBite - AWS-based canteen ordering and operations platform


### Student information

| Field | Value |
|---|---|
| Full name | **Nguyễn Bảo Đạt** |
| Student ID | **2352232** |
| Phone number | **0888456586** |
| Email | **dat.nguyenbaodat1410@hcmut.edu.vn** |
| University | **Ho Chi Minh City University of Technology - VNU-HCM (HCMUT)** |
| Major | **Computer Engineering** |
| FCAJ class / cohort | **AWS062026** |
| Internship Company | **Amazon Web Services Viet Nam Company Limited** |
| Internship position | **Workforce Bootcamp - First Cloud AI Journey** |
| Worklog period | **04/06/2026 - 31/07/2026** |

{{< report-image src="images/quickbite-cover.jpg" alt="QuickBite report cover" >}}

### Report structure

1. [Worklog](1-Worklog/)
2. [Proposal](2-Proposal/)
3. [Three Blog Posts](3-BlogsPosted/)
4. [Events Participated](4-EventParticipated/)
5. [Workshop - QuickBite on AWS](5-Workshop/)
6. [Self-evaluation](6-Self-evaluation/)
7. [Sharing and Feedback](7-Feedback/)

### Completed technical scope

- <span class="status-done">Application:</span> React/TypeScript/Vite, FastAPI, PostgreSQL, Docker, JWT/RBAC, customer-admin-kitchen-delivery flow, COD/mock e-wallet, tracking, dashboards, CSV reports, audit logs, Alembic, and automated tests.
- <span class="status-done">AWS infrastructure:</span> two CloudFront distributions, private S3, ALB, a two-Availability-Zone EC2 Auto Scaling Group, Multi-AZ RDS PostgreSQL, ECR, Secrets Manager, SSM, IAM, CloudWatch, SNS, Budgets, and Cost Explorer.
- <span class="status-done">Infrastructure as Code:</span> a Terraform bootstrap stack for remote state, locking, and ECR; a modular main stack divided into network, data, and app.
- <span class="status-done">Evidence:</span> architecture, two EC2 instances, CloudFront, S3, ECR, health check, customer menu, admin dashboard, image upload, CloudWatch alarms, and SNS email.

### Repository

- [QuickBite repository](https://github.com/edrictrn/quickbite)
