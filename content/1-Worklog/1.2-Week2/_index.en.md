---
title: "Week 2 Worklog"
date: 2026-07-30
weight: 2
chapter: false
pre: " <b> 1.2. </b> "
---
### Week 2 Objectives:

* Become familiar with the AWS Management Console and AWS CLI.
* Design least-privilege access for the QuickBite backend running on EC2.

### Tasks carried out during the week:

| Workday | Task | Start Date | Completion Date | Reference Material |
|---:|---|---|---|---|
| 1 | Studied the main AWS service groups and the Shared Responsibility Model to distinguish AWS responsibilities from customer responsibilities. | 10/06/2026 | 11/06/2026 | [AWS Overview](https://docs.aws.amazon.com/whitepapers/latest/aws-overview/introduction.html) |
| 2 | Installed AWS CLI, configured ap-southeast-1, and checked the caller identity. | 10/06/2026 | 12/06/2026 | [AWS CLI User Guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html) |
| 3 | Reviewed IAM Users, Groups, Roles, and Policies and selected an IAM Role for EC2 instead of storing access keys in source code. | 11/06/2026 | 13/06/2026 | [IAM identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id.html) |
| 4 | Drafted the quickbite-ec2-role policy with access limited to the menu/ prefix in the image bucket and CloudWatch Logs. | 12/06/2026 | 14/06/2026 | [IAM best practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html) |
| 5 | Reviewed .env, .env.example, and .gitignore and checked that secrets, tokens, and private keys were not committed. | 13/06/2026 | 15/06/2026 | [QuickBite environment examples](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 6 | Prepared an AWS Budget, naming rules, and Project/Environment tags for QuickBite resources. | 14/06/2026 | 15/06/2026 | [AWS Budgets](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-managing-costs.html) |

### Week 2 Achievements:

* Understood the main AWS service groups and how they relate to QuickBite:
  * Compute: Amazon EC2.
  * Storage: Amazon S3.
  * Database: Amazon RDS.
  * Networking and content delivery: VPC and CloudFront.
  * Monitoring and cost management: CloudWatch and AWS Budgets.
* Became familiar with the AWS Management Console and learned how to find and inspect the required services.
* Installed and configured AWS CLI with `ap-southeast-1` as the default Region.
* Used CLI commands to verify configuration, caller identity, Regions, and basic service information.
* Distinguished IAM Users, Groups, Roles, and Policies, and understood why EC2 workloads should use IAM Roles instead of stored access keys.
* Drafted a Least Privilege policy scoped to the image bucket, the `menu/` prefix, and CloudWatch Logs.
* Reviewed `.env`, `.env.example`, and `.gitignore` to prevent secrets, tokens, and private keys from entering the repository.
* Prepared resource naming rules, Project/Environment tags, and an AWS Budget for QuickBite.
