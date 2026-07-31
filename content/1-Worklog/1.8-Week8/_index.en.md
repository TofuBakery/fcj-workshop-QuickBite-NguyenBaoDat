---
title: "Week 8 Worklog"
date: 2026-07-31
weight: 8
chapter: false
pre: " <b> 1.8. </b> "
---
### Week 8 Objectives:

* Complete the two-Availability-Zone QuickBite infrastructure with Terraform.
* Deploy the application, validate the end-to-end flow, and collect AWS evidence.

### Tasks carried out during the week:

| Workday | Task | Start Date | Completion Date | Reference Material |
|---:|---|---|---|---|
| 1 | Completed the Terraform bootstrap for S3 remote state, DynamoDB locking, and the ECR repository. | 23/07/2026 | 26/07/2026 | Terraform bootstrap source |
| 2 | Completed the network, data, and app modules for two-AZ VPC, ALB, ASG, Multi-AZ RDS, S3, CloudFront, IAM, and monitoring. | 24/07/2026 | 29/07/2026 | Terraform main stack |
| 3 | Attended First Cloud Journey AI and recorded lessons on Agentic AI, cost estimation, hackathons, and architecture presentation. | 25/07/2026 | 25/07/2026 | Event 3 notes |
| 4 | Built and pushed the backend image, applied 58 resources, and loaded schema/seed/views into RDS through SSM. | 27/07/2026 | 31/07/2026 | QuickBite source and AWS Console evidence |
| 5 | Built the frontend with the CloudFront API URL, synchronized it to S3, and tested menu, admin dashboard, image upload, and health check. | 28/07/2026 | 31/07/2026 | AWS Console and QuickBite demo |
| 6 | Verified two EC2 instances across two AZs, CloudWatch alarms, SNS email, and completed Proposal, Workshop, and evidence images. | 29/07/2026 | 31/07/2026 | AWS Console evidence |

### Week 8 Achievements:

* Completed Terraform validate and plan; the main apply created 58 resources.
* Created versioned remote state, DynamoDB locking, and an ECR repository.
* Deployed a two-Availability-Zone VPC with public, private application, and isolated database subnets.
* Deployed an ALB and Auto Scaling Group with min 2, desired 2, max 4.
* Verified two t3.micro EC2 instances in ap-southeast-1a and ap-southeast-1b.
* Deployed Multi-AZ RDS PostgreSQL and stored the database secret in Secrets Manager.
* Deployed two CloudFront distributions, a private web bucket, and a private menu-images bucket.
* Verified that the API health response returned status ok, service quickbite-api, version 1.4.0.
* Tested the storefront, admin dashboard, image upload, and RDS-backed data flow.
* Verified the CloudWatch CPU alarm, target-tracking alarms, and SNS email.
* Completed the deployment, testing, and AWS evidence documentation for the full system.
* Completed the Proposal and Workshop based on the actual deployed infrastructure.
