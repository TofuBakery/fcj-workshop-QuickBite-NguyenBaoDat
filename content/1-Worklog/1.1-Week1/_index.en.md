---
title: "Week 1 Worklog"
date: 2026-07-30
weight: 1
chapter: false
pre: " <b> 1.1. </b> "
---
### Week 1 Objectives:

* Understand the FCAJ report structure and required deliverables.
* Review the source code, user roles, and a practical AWS deployment scope for QuickBite.

### Tasks carried out during the week:

| Workday | Task | Start Date | Completion Date | Reference Material |
|---:|---|---|---|---|
| 1 | Reviewed the workshop rules and listed the mandatory sections: bilingual content, worklog, blogs, events, workshop, images, code snippets, and attachments. | 04/06/2026 | 05/06/2026 | FCAJ workshop requirements |
| 2 | Reviewed the QuickBite repository and documented the React/Vite, FastAPI, PostgreSQL, Docker Compose, Mailpit, SQL migration, and testing stack. | 04/06/2026 | 06/06/2026 | [QuickBite repository](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 3 | Attended First Cloud Journey Community Day and took notes on Docker, AWS WAF, GraphRAG, WebSockets, Cloud/DevOps, and teamwork. | 06/06/2026 | 06/06/2026 | Event 1 slides and notes |
| 4 | Ran QuickBite with Docker and checked the frontend, Swagger, /health endpoint, PostgreSQL, and Mailpit. | 07/06/2026 | 09/06/2026 | [QuickBite README](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db#readme) |
| 5 | Tested the customer, admin, kitchen, and delivery roles and reviewed the order-status flow from creation to completion. | 08/06/2026 | 09/06/2026 | [QuickBite source](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 6 | Defined the AWS demo scope with S3, CloudFront, EC2, RDS PostgreSQL, CloudWatch, IAM, and AWS Budgets, while separating future components. | 07/06/2026 | 09/06/2026 | [AWS Well-Architected Framework](https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html) |

### Week 1 Achievements:

* Understood the FCAJ report structure and identified the required deliverables:
  * Vietnamese and English content.
  * Worklog, Proposal, Blog Posts, Events Participated, Workshop, Self-evaluation, and Sharing and Feedback.
  * Supporting images, architecture diagrams, code snippets, and deployment files.
* Reviewed the QuickBite source structure and understood the role of each major component:
  * React, TypeScript, and Vite for the frontend.
  * FastAPI for the backend.
  * PostgreSQL for application data.
  * Docker Compose for the local environment and Mailpit for test emails.
* Ran QuickBite locally and learned how to verify:
  * The user interface.
  * Swagger API documentation.
  * The `/health` endpoint.
  * PostgreSQL connectivity and Mailpit messages.
* Tested the business flow for customer, admin, kitchen staff, and delivery staff.
* Recorded lessons from the 6 June Community Day on Docker, AWS WAF, GraphRAG, WebSockets, Cloud/DevOps, and teamwork.
* Defined a practical AWS demo scope using S3, CloudFront, EC2, RDS PostgreSQL, CloudWatch, IAM, and AWS Budgets.
* Clearly separated demo components from future improvements to avoid overstating the implementation.
