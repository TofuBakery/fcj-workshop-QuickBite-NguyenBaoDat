---
title: "Week 4 Worklog"
date: 2026-07-30
weight: 4
chapter: false
pre: " <b> 1.4. </b> "
---
### Week 4 Objectives:

* Translate business requirements into a deployable AWS demo architecture.
* Prepare a deployment guide consistent with the current source code.

### Tasks carried out during the week:

| Workday | Task | Start Date | Completion Date | Reference Material |
|---:|---|---|---|---|
| 1 | Defined the users, problem, success criteria, and project limitations in the QuickBite proposal. | 22/06/2026 | 24/06/2026 | [AWS Well-Architected Framework](https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html) |
| 2 | Designed the VPC, EC2, and private Single-AZ RDS PostgreSQL setup for the demo budget. | 22/06/2026 | 25/06/2026 | [Amazon VPC User Guide](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html) |
| 3 | Designed the React frontend on S3 and CloudFront and kept API Gateway out because the backend runs directly on EC2. | 23/06/2026 | 25/06/2026 | [CloudFront with S3](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/DownloadDistS3AndCustomOrigins.html) |
| 4 | Designed the quickbite-menu-images-<env> bucket and /uploads/image endpoint for menu images. | 24/06/2026 | 26/06/2026 | [Amazon S3 User Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html) |
| 5 | Added CloudWatch Logs, a CPU Alarm, SNS email, an IAM Role, and AWS Budgets to the operational design. | 25/06/2026 | 27/06/2026 | [Amazon CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html) |
| 6 | Split the deployment guide into phases from account preparation through validation and cleanup. | 24/06/2026 | 27/06/2026 | [QuickBite deployment documentation](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |

### Week 4 Achievements:

* Defined the QuickBite problem, user groups, objectives, and success criteria for the Proposal.
* Designed an AWS architecture aligned with the current application:
  * React static website on S3 and CloudFront.
  * Dockerized FastAPI on EC2.
  * PostgreSQL on private Single-AZ RDS.
  * Menu images in S3.
  * Logs and alarms in CloudWatch.
* Understood how to restrict RDS connectivity so that only the EC2 Security Group can access port 5432.
* Standardized the bucket names `quickbite-web-<env>` and `quickbite-menu-images-<env>` across code, diagrams, and documentation.
* Chose not to include API Gateway in the demo architecture because the backend is reached through EC2/CloudFront behavior.
* Added IAM Role, CloudWatch Logs, CPU Alarm, SNS email, and AWS Budgets to the operating model.
* Organized the deployment guide into clear phases from account preparation to testing and cleanup.
* Completed a Proposal and architecture that explain the reason for each service choice.
