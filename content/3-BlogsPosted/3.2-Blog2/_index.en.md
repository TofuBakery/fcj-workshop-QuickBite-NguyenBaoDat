---
title: "Blog 2 - Disaster Recovery on AWS"
date: 2026-07-30
weight: 2
chapter: false
pre: " <b> 3.2. </b> "
---
# Disaster Recovery on AWS: Do Not Wait for the System to Fail Before Planning Recovery

**Content status:** Complete  

When I first learned application deployment, I focused on one question: “How do I make the system run?” As I learned more about cloud, I realized another question matters just as much: “How will the system recover when something goes wrong?”

This is where **Disaster Recovery (DR)** becomes practical.

Disaster Recovery is a plan for restoring a workload after serious failures such as database corruption, deployment errors, data loss, an Availability Zone issue, or the loss of a critical component. For a real system, simply “running” is not enough. The team must know which data matters, how long the service can be unavailable, and which recovery steps to follow.

## Two essential concepts: RTO and RPO

### Recovery Time Objective (RTO)

RTO is the maximum acceptable time to restore service after an incident.

For example, if QuickBite has a four-hour RTO, the operations team needs runbooks and resources that can restore the frontend, backend, and database within four hours.

### Recovery Point Objective (RPO)

RPO is the maximum acceptable amount of data loss, usually expressed as time.

If RPO is 24 hours, losing changes since the most recent backup within one day may be acceptable. If RPO is only a few minutes, backups or replication must occur much more frequently, increasing cost and complexity.

RTO and RPO should reflect workload criticality and budget rather than personal preference.

## Four common AWS DR strategies

### 1. Backup and Restore

This is the simplest and lowest-cost strategy. Data is backed up periodically, and the workload is rebuilt and restored after a disaster.

For a production QuickBite workload, this could include:

- automated RDS snapshots;
- S3 Versioning for image buckets;
- source and deployment runbooks in a repository;
- exported configuration or Infrastructure as Code;
- regular restore testing.

The advantage is lower cost. The disadvantage is a longer RTO because resources may need to be recreated.

### 2. Pilot Light

Core data and minimal critical infrastructure remain available in a recovery environment, while full compute capacity is not yet running. During an incident, additional resources are started.

Pilot Light improves RTO over Backup and Restore but requires data synchronization and standby infrastructure management.

### 3. Warm Standby

A reduced version of the workload runs continuously in a secondary site or Region. During an incident, the standby environment scales up.

Recovery is faster than Pilot Light, but cost is higher because resources are always running.

### 4. Multi-site Active/Active

Multiple sites or Regions actively serve traffic. If one fails, another continues.

This offers a very low RTO but is the most expensive and complex option. It is not appropriate for the QuickBite internship demo.

## Applying DR to QuickBite

### Current demo architecture

The QuickBite demo is intentionally cost-conscious:

- one EC2 t3.micro;
- one **Single-AZ** RDS PostgreSQL db.t3.micro;
- S3 for the frontend and images;
- CloudFront;
- CloudWatch Logs/Alarm;
- Budgets and Cost Explorer.

This architecture has single points of failure. If EC2 or RDS fails, the service may be interrupted. The demo also does not deploy AWS Backup, cross-region snapshots, or Multi-AZ.

It is important to state these limitations. A polished diagram is not the same as demonstrated recoverability.

### Appropriate first DR step

For QuickBite's scale, **Backup and Restore** is a sensible starting point:

1. enable automated RDS backups where data must be retained;
2. create a manual snapshot before major changes;
3. enable S3 Versioning for important image buckets;
4. keep Dockerfiles, Compose files, SQL, and runbooks in the repository;
5. document recovery configuration without storing real secrets;
6. periodically restore into a new database;
7. test the application against the restored database;
8. measure actual restore time against the RTO.

If QuickBite becomes a real product, RDS Multi-AZ and Infrastructure as Code can be added. Multi-AZ improves in-Region failover but does not replace every DR strategy.

## Demo cleanup is not Disaster Recovery

The demo guide may delete RDS with `--skip-final-snapshot` to avoid charges when the database contains only disposable seed/test data.

That should **not** be the production approach.

| Situation | Approach |
|---|---|
| Demo environment with fake data | deletion may skip the final snapshot |
| Test environment needed for investigation | create a snapshot before deletion |
| Production environment | backup policy, final snapshot, and restore testing are mandatory |

Clean-up controls cost. DR protects the ability to restore data and service. They are related but not identical.

## A backup matters only when it can be restored

A backup that has never been restored cannot be considered a verified recovery plan.

A simple QuickBite restore drill could include:

1. create an RDS snapshot;
2. restore it into a new instance;
3. connect through EC2 or another network-authorized test client;
4. run `\dt` and inspect sample orders;
5. point a test backend at the new endpoint;
6. run `/health`, login, read the menu, and create a test order;
7. record the actual recovery time;
8. delete the test resources afterward.

This can reveal incorrect credentials, missing permissions, incomplete schemas, or outdated runbooks.

## Lesson learned

Disaster Recovery is not only for banks or very large systems. Even a small project should answer:

- where important data lives;
- whether backups exist;
- who performs restoration;
- what the RTO/RPO are;
- whether the runbook has been tested;
- whether the protection level fits the budget.

The QuickBite demo prioritizes cost, so it uses Single-AZ and does not claim complete DR. The report clearly states this limitation and proposes Backup and Restore, RDS snapshots, S3 Versioning, restore testing, and Multi-AZ for production.

## References

- [Disaster recovery options in the cloud](https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/disaster-recovery-options-in-the-cloud.html)
- [Business continuity plan: RTO and RPO](https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/business-continuity-plan-bcp.html)
- [Disaster Recovery architecture on AWS: Pilot Light and Warm Standby](https://aws.amazon.com/blogs/architecture/disaster-recovery-dr-architecture-on-aws-part-iii-pilot-light-and-warm-standby/)
- [Designing sustainable disaster recovery strategies](https://aws.amazon.com/blogs/storage/designing-sustainable-disaster-recovery-strategies/)
