---
title: "Blogs Posted"
date: 2026-07-30
weight: 3
chapter: false
pre: " <b> 3. </b> "
includeInReport: false
---
This section introduces the three AWS articles I prepared while developing QuickBite. Each article is available in both English and Vietnamese.

### [Blog 1 - Event-Driven Architecture on AWS](3.1-Blog1/)
This article explains how Amazon EventBridge, Amazon SQS, Amazon SNS, and AWS Lambda can decouple secondary tasks such as email, notification, and reporting from the main order-creation request. It also discusses retry, idempotency, ordering, dead-letter queues, and monitoring, then relates these concepts to a possible future expansion of QuickBite.

### [Blog 2 - Disaster Recovery on AWS](3.2-Blog2/)
This article introduces RTO, RPO, Backup and Restore, Pilot Light, Warm Standby, and Multi-site Active/Active. It connects disaster-recovery planning with QuickBite through RDS backups, S3 data protection, restoration runbooks, and the distinction between a short-lived demo and a production workload.

### [Blog 3 - Least Privilege on AWS](3.3-Blog3/)
This article discusses the principle of least privilege, IAM roles for workloads, resource-level permissions, and regular access reviews. The QuickBite example limits the EC2 role to the required S3 menu-image prefix and CloudWatch Logs permissions instead of granting broad administrative access.

## 3 posts have been published

{{< report-image src="images/3-BlogsPosted/evidence/blog-post-event-driven.png" alt="Event-Driven Architecture on AWS post in AWS Study Group VN" >}}

{{< report-image src="images/3-BlogsPosted/evidence/blog-post-disaster-recovery.png" alt="Disaster Recovery on AWS post in AWS Study Group VN" >}}

{{< report-image src="images/3-BlogsPosted/evidence/blog-post-least-privilege.png" alt="Least Privilege on AWS post in AWS Study Group VN" >}}

