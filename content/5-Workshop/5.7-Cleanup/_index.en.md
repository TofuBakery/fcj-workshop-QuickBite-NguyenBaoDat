---
title: "Clean-up"
date: 2026-07-30
weight: 7
chapter: false
pre: " <b> 5.7. </b> "
---
# Clean-up

Clean-up is mandatory because EC2, RDS, CloudFront, CloudWatch, and related resources may continue generating charges.

> Use `--skip-final-snapshot` only when the database contains disposable demo data. Environments that must retain data require an appropriate snapshot/backup.

## 1. Capture evidence before deletion

- CloudFront domain and frontend;
- `/health` and `/docs`;
- order flow;
- RDS `Available`, `\dt`, and sample data;
- S3 image object;
- CloudWatch logs;
- CPU alarm;
- SNS subscription;
- Budget;
- Cost Explorer.

Hide passwords, tokens, and account IDs where appropriate.

## 2. Stop traffic

- announce the end of the demo;
- stop creating new orders;
- ensure no test process remains;
- save required terminal output.

## 3. CloudFront

1. disable the distribution;
2. wait until the change is deployed;
3. delete the distribution;
4. delete the Origin Access Control if no longer used.

Disabling CloudFront can take time.

## 4. S3

Empty buckets:

```bash
aws s3 rm s3://quickbite-web-<env> --recursive
aws s3 rm s3://quickbite-menu-images-<env> --recursive
```

If versioning is enabled, also delete versions and delete markers.

Delete buckets:

```bash
aws s3 rb s3://quickbite-web-<env>
aws s3 rb s3://quickbite-menu-images-<env>
```

## 5. EC2

Do not save `.env` into the repository before termination.

```bash
aws ec2 terminate-instances --instance-ids <instance-id>
```

Then remove:

- the AWS key pair if unused;
- the local `.pem` according to personal policy;
- any Elastic IP;
- unintended volumes/snapshots;
- the EC2 security group after dependencies are removed.

## 6. RDS

### Disposable demo

```bash
aws rds delete-db-instance   --db-instance-identifier quickbite-db   --skip-final-snapshot   --delete-automated-backups
```

### Data that must be retained

Use a final snapshot:

```bash
aws rds delete-db-instance   --db-instance-identifier quickbite-db   --final-db-snapshot-identifier quickbite-db-final-<date>
```

After RDS deletion, remove the RDS SG/subnet group if unused.

## 7. CloudWatch and SNS

Delete:

- alarm `quickbite-cpu-high`;
- log group `quickbite/backend`;
- dashboards/custom metrics if any;
- SNS subscription/topic if dedicated to the demo.

Example:

```bash
aws cloudwatch delete-alarms --alarm-names quickbite-cpu-high
aws logs delete-log-group --log-group-name quickbite/backend
```

## 8. IAM

- detach/delete the inline policy;
- remove the role from the instance profile;
- delete the instance profile;
- delete `quickbite-ec2-role`.

Delete only project-created roles/policies, not shared organizational roles.

## 9. Network

If a dedicated VPC was created:

1. remove remaining dependencies;
2. delete security groups;
3. delete route tables/subnets/Internet Gateway;
4. delete the VPC.

The demo does not require a NAT Gateway. If one was accidentally created, delete it early because it can be costly.

## 10. Post-clean-up verification

- EC2 Instances: no running/stopped instance;
- RDS Databases: no instance;
- S3: both buckets removed;
- CloudFront: distribution deleted;
- CloudWatch: log group/alarm deleted;
- SNS: demo topic deleted;
- IAM: demo role/policy deleted;
- Elastic IP: no unattached address;
- Billing/Cost Explorer: check the next day.

## 11. Clean-up evidence

Capture or save:

- delete commands;
- EC2/RDS lists after deletion;
- S3 list;
- CloudFront list;
- CloudWatch list;
- next-day Cost Explorer.

## 12. Reflection

Clean-up is not only about saving credits. It demonstrates Operational Excellence, Cost Optimization, and Sustainability: each resource has an owner, lifecycle, and explicit end.
