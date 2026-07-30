---
title: "Week 8 Worklog"
date: 2026-07-30
weight: 8
chapter: false
pre: " <b> 1.8. </b> "
---
### Week 8 Objectives:

* Validate the end-to-end flow and the evidence required for AWS deployment.
* Complete CloudWatch, event reports, blogs, and references.

### Tasks carried out during the week:

| Workday | Task | Start Date | Completion Date | Reference Material |
|---:|---|---|---|---|
| 1 | Reviewed the EC2 and RDS checklist: instance, IAM Role, Security Group, Docker, /health, /docs, port 5432 connectivity, and database tables. | 23/07/2026 | 26/07/2026 | [Amazon EC2 troubleshooting](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-troubleshoot.html) |
| 2 | Tested the flow in which the customer creates an order, the admin confirms it, the kitchen prepares it, delivery completes it, and the customer tracks the status. | 24/07/2026 | 28/07/2026 | [QuickBite E2E flow](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 3 | Attended First Cloud Journey AI and took notes on Agentic AI, cost estimation, hackathons, and architecture presentation. | 25/07/2026 | 25/07/2026 | Event 3 slides and notes |
| 4 | Checked the quickbite/backend log group, Docker awslogs, CPU Alarm, and SNS email notification flow. | 27/07/2026 | 29/07/2026 | [CloudWatch alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html) |
| 5 | Edited the three AWS blogs, completed the three event reports, and added reference materials to each section. | 28/07/2026 | 31/07/2026 | [AWS Architecture Blog](https://aws.amazon.com/blogs/architecture/) |
| 6 | Reviewed bilingual content, links, code snippets, attachments, evidence images, and the cleanup order before closing the report. | 29/07/2026 | 31/07/2026 | [QuickBite repository](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |

### Week 8 Achievements:

* Completed the verification checklist for the main QuickBite architecture components:
  * EC2, IAM Role, and Security Group.
  * Private RDS PostgreSQL and TCP 5432 connectivity.
  * S3 web bucket, S3 menu-image bucket, and CloudFront.
  * CloudWatch Logs, CPU Alarm, and SNS email.
* Rechecked the end-to-end business flow from customer order creation through admin, kitchen, and delivery processing.
* Defined the evidence to collect during a real deployment: `/health`, Swagger, RDS tables, S3 objects, CloudFront URL, log group, and alarm.
* Completed the backend monitoring design with Docker awslogs and CloudWatch Alarm.
* Edited three AWS blog posts on Event-Driven Architecture, Disaster Recovery, and Least Privilege.
* Completed three bilingual event reports with the correct event photographs.
* Reviewed the menu order, bilingual links, code snippets, Docker/SQL/script attachments, and Workshop content.
* Prepared the cleanup order for CloudFront, S3, EC2, RDS, log groups, alarms, SNS, and IAM resources.
* Learned from Event 3 about MVP scope, cost estimation, teamwork, rehearsal, and honest architecture communication.
