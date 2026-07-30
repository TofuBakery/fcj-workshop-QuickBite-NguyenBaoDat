---
title: "Week 6 Worklog"
date: 2026-07-30
weight: 6
chapter: false
pre: " <b> 1.6. </b> "
---
### Week 6 Objectives:

* Prepare the backend and database for AWS.
* Ensure private RDS can be initialized and the backend does not start local PostgreSQL.

### Tasks carried out during the week:

| Workday | Task | Start Date | Completion Date | Reference Material |
|---:|---|---|---|---|
| 1 | Reviewed docker-compose.aws.yml, keeping only the backend and removing the local db service and depends_on. | 04/07/2026 | 06/07/2026 | [docker-compose.aws.yml](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 2 | Standardized DATABASE_URL, SECRET_KEY, CORS_ALLOW_ORIGINS, AWS_REGION, S3_BUCKET_NAME, and SHOW_DEMO_ACCOUNTS. | 04/07/2026 | 07/07/2026 | [QuickBite environment configuration](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 3 | Documented quickbite-rds-sg with PostgreSQL 5432 allowed only from quickbite-ec2-sg. | 05/07/2026 | 07/07/2026 | [Security groups for RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.RDSSecurityGroups.html) |
| 4 | Prepared the EC2 Ubuntu instance, key pair, IAM instance profile, Docker, Git, and PostgreSQL client. | 06/07/2026 | 08/07/2026 | [Amazon EC2 User Guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html) |
| 5 | Prepared commands to clone the source and load schema_postgres.sql, seed_postgres.sql, and views_postgres.sql from EC2 into private RDS. | 07/07/2026 | 09/07/2026 | [RDS PostgreSQL](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html) |
| 6 | Configured Docker awslogs, /health and /docs checks, and an AWS cleanup checklist. | 07/07/2026 | 09/07/2026 | [CloudWatch Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html) |

### Week 6 Achievements:

* Completed `docker-compose.aws.yml` for the backend only, preventing local PostgreSQL from starting on EC2.
* Standardized the required environment variables:
  * `DATABASE_URL`.
  * `SECRET_KEY`.
  * `CORS_ALLOW_ORIGINS`.
  * `AWS_REGION`.
  * `S3_BUCKET_NAME`.
  * `SHOW_DEMO_ACCOUNTS`.
* Documented EC2 and RDS Security Groups so that RDS only accepts TCP 5432 from the EC2 Security Group.
* Prepared the EC2 Ubuntu setup steps, including key pair, IAM instance profile, Docker, Git, and PostgreSQL client.
* Wrote the process for cloning the source and loading schema, seed data, and SQL views from EC2 into private RDS.
* Understood why schema loading should not be performed directly from a laptop when RDS is private.
* Prepared Docker `awslogs` configuration for sending backend logs to CloudWatch Logs.
* Completed a runbook for containers, `/health`, `/docs`, database connectivity, and resource cleanup.
