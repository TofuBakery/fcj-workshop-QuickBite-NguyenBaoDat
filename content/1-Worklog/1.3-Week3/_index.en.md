---
title: "Week 3 Worklog"
date: 2026-07-30
weight: 3
chapter: false
pre: " <b> 1.3. </b> "
---
### Week 3 Objectives:

* Stabilize QuickBite before moving components to AWS.
* Test the ordering, payment, and order-processing flows.

### Tasks carried out during the week:

| Workday | Task | Start Date | Completion Date | Reference Material |
|---:|---|---|---|---|
| 1 | Reviewed Dockerfiles and docker-compose.yml for the frontend, backend, PostgreSQL, and Mailpit, including health checks and volumes. | 16/06/2026 | 18/06/2026 | [Docker Compose](https://docs.docker.com/compose/) |
| 2 | Tested registration, login, JWT authentication, and authorization for customer, admin, kitchen staff, and delivery staff. | 16/06/2026 | 19/06/2026 | [QuickBite authentication code](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 3 | Tested the menu, cart, COD, mock e-wallet, delivery fee, tax, and Decimal/NUMERIC total calculations. | 17/06/2026 | 20/06/2026 | [QuickBite order and payment modules](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 4 | Checked state transitions and order_status_history from pending through confirmed, preparing, ready, and completed/cancelled. | 18/06/2026 | 20/06/2026 | [QuickBite order workflow](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 5 | Ran pytest and e2e_local.py and recorded failures, reproduction steps, and results after fixes. | 19/06/2026 | 21/06/2026 | [QuickBite tests](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 6 | Mapped local components to AWS services: PostgreSQL to RDS, images to S3, and logs to CloudWatch. | 20/06/2026 | 21/06/2026 | [Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html) |

### Week 3 Achievements:

* Understood how the frontend, backend, PostgreSQL, and Mailpit containers communicate through Docker Compose.
* Reviewed Dockerfiles, health checks, and volumes, and identified what should be retained for AWS deployment.
* Tested registration, login, JWT authentication, and permissions for customer, admin, kitchen staff, and delivery staff.
* Verified the main ordering features:
  * Menu and cart operations.
  * COD and mock e-wallet payments.
  * Delivery fee, tax, and total calculation.
  * Order-status tracking.
* Checked state transitions and `order_status_history` from pending to completed or cancelled.
* Ran the automated tests and local E2E script and learned how to document reproduction steps and post-fix results.
* Confirmed that monetary values use Decimal/NUMERIC rather than unsuitable floating-point values.
* Established a stable local baseline for the AWS design and deployment preparation.
