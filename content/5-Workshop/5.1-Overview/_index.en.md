---
title: "Overview"
date: 2026-07-30
weight: 1
chapter: false
pre: " <b> 5.1. </b> "
---
# Workshop Overview

## What problem does QuickBite solve?

QuickBite digitizes ordering and fulfillment among customers, administrators, kitchen staff, and delivery staff. Transactions are stored in PostgreSQL; frontend and backend responsibilities are separated; menu images use object storage.

## Business flow

```text
1. Customer places an order
2. FastAPI/EC2 validates data and creates the order
3. RDS PostgreSQL stores orders, line items, and payment
4. Kitchen processes the order
5. Delivery delivers the order
6. Customer receives and tracks the order
```

## Local architecture

```text
React/Vite :5173
      |
FastAPI :8000
      |
PostgreSQL :5432
      |
Mailpit :8025 (email mock)
```

## AWS demo architecture

```text
Users
  |
  v
CloudFront
  |----------------------> Private S3: quickbite-web-<env>
  |
  +-- API path ----------> EC2 t3.micro: Docker + FastAPI
                                  |
                         TCP 5432 | /uploads/image
                                  v
                    Private RDS PostgreSQL       S3 menu images

EC2 logs --> CloudWatch Logs --> CPU Alarm --> SNS email
EC2 IAM role --> scoped S3 + CloudWatch permissions
Budgets / Cost Explorer --> cost control
```

## Why this architecture?

- it matches the current source structure;
- it uses multiple AWS services in a complete use case;
- private RDS avoids direct Internet exposure;
- CloudFront suits a static frontend;
- S3 suits image storage;
- EC2 preserves the Dockerized backend and remains easy to inspect;
- CloudWatch provides demonstrable logs and alarms;
- Single-AZ and one EC2 control demo cost.

## Limitations

The demo does not provide full high availability. EC2 and Single-AZ RDS remain single points of failure. Advanced services are documented as Future, not as deployed.

## Source

- [Repository](https://github.com/edrictrn/quickbite)
- [Snapshot commit](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db)
