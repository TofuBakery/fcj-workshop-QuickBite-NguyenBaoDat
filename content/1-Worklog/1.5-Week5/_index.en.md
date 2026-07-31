---
title: "Week 5 Worklog"
date: 2026-07-30
weight: 5
chapter: false
pre: " <b> 1.5. </b> "
---
### Week 5 Objectives:

* Review QuickBite against the six AWS Well-Architected pillars.
* Clearly separate the current demo architecture from future improvements.

### Tasks carried out during the week:

| Workday | Task | Start Date | Completion Date | Reference Material |
|---:|---|---|---|---|
| 1 | Reviewed Operational Excellence through runbooks, health checks, logs, alarms, evidence, and cleanup. | 28/06/2026 | 29/06/2026 | [Operational Excellence Pillar](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/welcome.html) |
| 2 | Reviewed Security through IAM least privilege, Security Groups, private RDS, CORS, and .env-based secret handling. | 28/06/2026 | 30/06/2026 | [Security Pillar](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/welcome.html) |
| 3 | Reviewed Reliability and documented backup/restore as a future improvement while starting from Single-AZ and later moving to a two-Availability-Zone HA design. | 29/06/2026 | 01/07/2026 | [Reliability Pillar](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/welcome.html) |
| 4 | Reviewed Performance Efficiency through CloudFront for static content, small instance sizing, and CPU monitoring. | 30/06/2026 | 02/07/2026 | [Performance Efficiency Pillar](https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/welcome.html) |
| 5 | Reviewed Cost Optimization and Sustainability through Budgets, Cost Explorer, right-sizing, and post-demo cleanup. | 01/07/2026 | 03/07/2026 | [Cost Optimization Pillar](https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/welcome.html) |
| 6 | Separated the diagram into Deployed/Demo and Target/Future layers and used dashed styling for ASG, Multi-AZ, WAF, and Secrets Manager. | 30/06/2026 | 03/07/2026 | [Sustainability Pillar](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/welcome.html) |

### Week 5 Achievements:

* Reviewed QuickBite against the six AWS Well-Architected pillars:
  * Operational Excellence.
  * Security.
  * Reliability.
  * Performance Efficiency.
  * Cost Optimization.
  * Sustainability.
* Identified the operating practices required for the demo: runbook, health checks, logs, alarms, test checklist, and cleanup.
* Applied security controls appropriate to the current scope: IAM Least Privilege, private RDS, Security Groups, CORS, and no hard-coded keys.
* Documented the reliability limits of Single-AZ and used the review to move to Multi-AZ and Auto Scaling.
* Explained how CloudFront distributes static content and reduces origin load.
* Prepared a cost-control plan using AWS Budgets, Cost Explorer, right-sizing, and removal of unused resources.
* Split the architecture into:
  * Deployed/Demo components that can be implemented and evidenced.
  * Target/Future components such as Auto Scaling, Multi-AZ, WAF, Secrets Manager, and advanced backup.
* Standardized resource names to prevent differences between diagrams, configuration files, and the report.
