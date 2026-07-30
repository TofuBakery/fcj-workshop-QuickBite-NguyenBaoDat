---
title: "First Cloud Journey AI - 11 July 2026"
date: 2026-07-30
weight: 2
chapter: false
pre: " <b> 4.2. </b> "
---
# Summary Report: “First Cloud Journey AI – AWS Certification, SLA Monitoring, and Web Application Security”

| Information | Details |
|---|---|
| **Participation date** | **11 July 2026** |
| **Format** | In person |
| **Location** | AWS-branded event space; the exact address was not provided |
| **Organizer** | First Cloud Journey (FCJ) |
| **Role** | Attendee |
| **Topics** | AWS Cloud Practitioner, SLA and monitoring, and web application security with AWS Security Agent |

## Event Objectives

- Help learners understand the structure, knowledge scope, and preparation strategy for the **AWS Certified Cloud Practitioner (CLF-C02)** exam.
- Clarify the difference between infrastructure that appears healthy and the actual user experience.
- Introduce the use of SLAs, metrics, logs, CloudWatch Alarms, and Amazon SNS in operational risk management.
- Present how an AI agent can support architecture review, source-code review, and web application security testing.
- Encourage attendees to connect certification knowledge with the design and operation of a real AWS project.

## Speakers and Topics

- **Ngo Le Tan Huy** – *Inside the Exam: AWS Cloud Practitioner*.
- **Nguyen Huynh Son** – *SLA and Monitoring: From SLA to Monitoring What Really Matters*.
- **Nguyen Tuan Thinh (Thinh Nguyen)** – *Securing Your Web Apps With AWS Security Agent*.

## Key Highlights

### 1. Preparing for the AWS Cloud Practitioner exam

The first session introduced AWS Certified Cloud Practitioner as a foundational certification focused on the big picture of cloud computing rather than deep programming or system configuration. The presented exam structure included **65 questions in 90 minutes**, a score range from 100 to 1,000, and a passing score of **700**.

The four knowledge domains were presented as:

- **Cloud Concepts – 24%**;
- **Security and Compliance – 30%**;
- **Cloud Technology and Services – 34%**;
- **Billing, Pricing, and Support – 12%**.

Important areas included cloud benefits, the AWS Well-Architected Framework, the AWS Cloud Adoption Framework, the Shared Responsibility Model, IAM, Security Groups and NACLs, global infrastructure, EC2, Lambda, S3, RDS, DynamoDB, VPC, Route 53, EC2 pricing models, Cost Explorer, Budgets, and Support Plans.

The study strategy emphasized three practical approaches:

- associate each service with memorable keywords or use cases;
- review why each mock-exam answer is correct or incorrect instead of only counting the score;
- combine theory with hands-on practice in the AWS Free Tier.

Exam techniques included eliminating irrelevant answers, highlighting decisive wording such as “least cost,” “most scalable,” or “not,” using the flag-for-review function, and avoiding unnecessary overthinking in a foundational exam.

### 2. SLA and monitoring what really matters

Nguyen Huynh Son opened with a common situation: the AWS Console can be green, EC2 can be running, and CPU can remain low while users are still unable to log in. This led to the core message:

> **Healthy infrastructure does not necessarily mean a healthy user experience.**

The session explained an SLA as a formal service-level commitment between a provider and a customer. However, an AWS SLA covers the relevant AWS service under its published conditions; the final user experience still depends on the architecture, application code, database, and operational practices owned by the development team.

A layered monitoring model was presented:

1. **Cloud provider:** EC2, RDS, ALB, and S3;
2. **Infrastructure:** CPU, memory, disk, and network;
3. **Application:** latency, errors, requests, and dependencies;
4. **Business:** login success, orders, and revenue;
5. **Customer experience:** whether users can log in, search, check out, or complete payment.

In the demonstration, `/health` still returned `200 OK` because the application process remained available, while `/login` failed when database access was blocked. The infrastructure dashboard remained green even though the real user journey was broken. This was a clear example of why a simple health check cannot fully represent system health.

The alerting flow was presented as:

```text
Custom metric (LoginFailure)
        ↓
CloudWatch Alarm
        ↓
Amazon SNS
        ↓
Email or an operations notification channel
```

Monitoring was therefore framed as an operational risk loop: **identify risk → monitor signals → respond → improve**.

### 3. Securing applications with AWS Security Agent

The third session presented an AI-agent approach to support security activities that are often expensive and time-consuming when performed entirely by hand. According to the session, AWS Security Agent was described as an agent capable of planning and executing security tasks, with Amazon Bedrock supporting its reasoning capabilities.

Three groups of capabilities were introduced:

- **Design Security Review:** analyzing architecture documents or Terraform before code is deployed;
- **Code Security Review:** integrating with GitHub/GitLab pull requests, identifying issues, and suggesting patches;
- **Automated Pentesting:** attempting multi-step exploit chains and producing verifiable evidence.

The presentation also highlighted important limitations:

- MFA, biometric authentication, or mTLS can block the agent’s test path;
- business-logic flaws are difficult to detect without deep domain context;
- complex tasks can consume significant task-hours and require cost monitoring;
- automation does not fully replace human review and risk governance.

My main takeaway was that security should be shifted earlier in the development lifecycle—from architecture review and pull-request review to testing a running application—instead of being treated only as a final-stage activity.

## Key Takeaways

### AWS foundations

- Cloud Practitioner provides a useful knowledge map, but it should be reinforced through labs and real projects.
- The Shared Responsibility Model separates AWS responsibilities from the responsibilities of the workload owner.
- The AWS Well-Architected Framework is a tool for explaining architecture decisions, not merely a list to memorize for an exam.

### Monitoring and operations

- Low CPU or a successful health check does not prove that users can complete their journey.
- Monitoring should cover infrastructure metrics, application errors, dependencies, and business metrics.
- An alarm is valuable only when it is connected to a notification channel and a clear response runbook.
- A useful dashboard should answer whether users can complete the system’s critical tasks.

### Security

- Security review should begin with architecture and source code rather than waiting for a final pentest.
- IAM least privilege, secret management, network controls, and pull-request review remain essential even when an AI agent is used.
- AI tools can accelerate review, but their findings must be verified and interpreted in the real business context.

## Applying the Lessons to QuickBite and My Work

After the event, I connected the sessions to QuickBite as follows:

- **Cloud Practitioner:** use the exam domains to review the project across cloud concepts, security, service selection, and cost management.
- **Shared responsibility:** clearly distinguish AWS responsibility for cloud infrastructure from QuickBite’s responsibility for IAM configuration, Security Groups, application code, data, and the ordering experience.
- **Current monitoring:** keep CloudWatch Logs and a CPU alarm as planned demo evidence, while avoiding the claim that these are sufficient to guarantee a healthy user experience.
- **Future monitoring:** consider custom metrics for login failures, order-creation failures, and successful-order rates. These are future improvements and are not presented as already deployed.
- **RDS dependency:** distinguish a basic `/health` endpoint from database connectivity checks; a separate readiness check could be added later to detect when the process is running but the business flow is unavailable.
- **Network security:** allow PostgreSQL access to RDS only from the EC2 Security Group on port 5432.
- **IAM:** use an EC2 IAM role with least-privilege access to the required S3 bucket/prefix and CloudWatch Logs, without hard-coded access keys.
- **Security review:** document AWS Security Agent as a possible future experiment for architecture or pull-request review rather than a component currently running in QuickBite.
- **Runbooks:** add a checklist for login or order failures covering application logs, RDS connectivity, Security Groups, database metrics, and recent changes.

The monitoring session had the strongest direct connection to QuickBite. Before the event, I mainly thought about CPU, logs, and instance status. After the demonstration, I understood that a convincing project should also prove the complete business journey: a customer logs in and creates an order, the kitchen receives it, delivery updates the status, and the customer can see the result.

## Event Experience

The second event was more focused than the first one. The three sessions formed a coherent learning sequence: AWS foundations and certification, workload operations, and application security supported by an AI agent.

The SLA and monitoring session made the strongest impression because the example closely matched real operational problems. A system can look healthy on a dashboard while failing at the user’s most important step. This changed how I evaluate evidence for the QuickBite report: screenshots showing EC2 as “Running” or RDS as “Available” are useful but not sufficient; I should also capture successful login, order creation, database read/write behavior, and the corresponding logs.

The Cloud Practitioner session helped me organize the AWS services used in the project and explain why EC2, S3, RDS, CloudFront, CloudWatch, IAM, and Budgets were selected. The AWS Security Agent session introduced a DevSecOps perspective while also reinforcing that modern tools cannot replace foundational knowledge, human review, or an understanding of business logic.

The in-person environment also allowed me to observe how the speakers used demonstrations, examples, and problem framing. This was useful for how I plan to present the QuickBite Workshop later.

## Lessons Learned

- Certification study is most effective when each concept is connected to a real workload or scenario.
- An AWS SLA does not automatically guarantee a good end-to-end experience for my application users.
- Monitoring must progress from cloud resources to the application, business metrics, and customer journey.
- Health checks must be designed for their intended purpose; an overly simple endpoint can hide dependency failures.
- Security should be integrated throughout the development lifecycle, but automated findings must still be verified.
- A technical report should remain honest by separating deployed features, experiments, and future improvements.

## Some Event Photos

{{< report-image src="event-photo.jpg" alt="First Cloud Journey AI event space on 11 July 2026" >}}

The photo was taken during the in-person event on 11 July 2026. A speaker was presenting a Tips & Tricks section to attendees in a venue featuring AWS and First Cloud Journey AI branding.
