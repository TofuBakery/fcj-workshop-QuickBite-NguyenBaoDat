---
title: "Self-evaluation"
date: 2026-07-31
weight: 6
chapter: false
pre: " <b> 6. </b> "
includeInReport: false
---
During FCAJ, I developed QuickBite from a local application into a system deployed on AWS with Terraform. The process combined React, FastAPI, PostgreSQL, and Docker with VPC, CloudFront, S3, ALB, Auto Scaling, EC2, Multi-AZ RDS, ECR, Secrets Manager, SSM, IAM, CloudWatch, and SNS.

I learned that a cloud project is not evaluated only by whether its source code runs. Architecture, permissions, network isolation, monitoring, cost, reproducibility, and deployment evidence must remain consistent.

| No. | Criterion | Description | Good | Fair | Average |
| ---: | --- | --- | :---: | :---: | :---: |
| 1 | **Professional knowledge and skills** | Combined full-stack development, Docker, AWS, and Terraform in QuickBite | **X** |  |  |
| 2 | **Learning ability** | Independently learned AWS services, Terraform modules, and environment troubleshooting | **X** |  |  |
| 3 | **Initiative** | Proactively moved the architecture from a single-instance baseline to two-AZ HA | **X** |  |  |
| 4 | **Responsibility** | Rechecked claims through screenshots, logs, health checks, and a working demo | **X** |  |  |
| 5 | **Discipline** | Maintained the worklog, source management, and bilingual report review |  | **X** |  |
| 6 | **Growth mindset** | Accepted feedback and repeatedly improved the architecture, content, and presentation | **X** |  |  |
| 7 | **Communication** | Explained business flow, trade-offs, incidents, and deployment results |  | **X** |  |
| 8 | **Teamwork** | Exchanged knowledge during community events and collaborated on project completion |  | **X** |  |
| 9 | **Professional conduct** | Avoided root keys, protected credentials, and separated configuration from evidence | **X** |  |  |
| 10 | **Problem solving** | Resolved AWS CLI, PowerShell, Terraform, SSM, CloudFront, IAM, and frontend build issues | **X** |  |  |
| 11 | **Project contribution** | Completed the application, Terraform infrastructure, monitoring, and report | **X** |  |  |
| 12 | **Overall evaluation** | Overall FCAJ result | **X** |  |  |

### Areas for improvement

- Run controlled failure injection to produce direct evidence of ASG replacement and RDS failover.
- Add CI/CD for image build, tests, Terraform plan, and environment deployment.
- Optimize NAT Gateway and Multi-AZ RDS cost for environments that do not require full HA.
- Continue improving concise technical presentations focused on business value and measurable results.

### Personal development goal

After the program, I want to continue developing toward Cloud/DevOps and Software Engineering, with the ability to take a workload from product requirements through design, IaC, deployment, observability, security, troubleshooting, and cost control.
