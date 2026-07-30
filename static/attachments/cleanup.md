# QuickBite — AWS Cleanup Guide

Workshops must avoid ongoing charges. Delete resources in this order after grading.

## 1. CloudFront & S3
```bash
# Disable then delete the CloudFront distribution (console: Disable → wait → Delete).
aws s3 rm s3://quickbite-web-<unique> --recursive
aws s3 rb s3://quickbite-web-<unique>
aws s3 rm s3://quickbite-menu-images-<unique> --recursive
aws s3 rb s3://quickbite-menu-images-<unique>
```

## 2. EC2
```bash
aws ec2 terminate-instances --instance-ids <instance-id>
# delete the key pair and the quickbite-ec2-sg security group afterwards
```

## 3. RDS
```bash
# Skip the final snapshot to avoid snapshot storage cost (demo data only).
aws rds delete-db-instance --db-instance-identifier quickbite-db \
  --skip-final-snapshot --delete-automated-backups
```

## 4. CloudWatch
- Delete log group `quickbite/backend`.
- Delete the CPU / health alarms.
- Delete the SNS topic used for alarm notifications.

## 5. Lambda / SES (if used)
- Delete the `quickbite-send-order-email` Lambda function.
- Remove the SES identity if it was created only for this demo.
- Detach/delete the IAM roles/policies: `quickbite-ec2-role`, Lambda execution role.

## 6. Verify nothing is left
- Billing ▸ Cost Explorer: confirm no active EC2/RDS/CloudFront next day.
- IAM ▸ Roles/Policies: remove leftovers created for the workshop.

> Tip: put all resources in one Resource Group or tag them `project=quickbite`
> so you can review and delete them together.
