---
title: "First Cloud Journey Community Day - 06 June 2026"
date: 2026-07-30
weight: 1
chapter: false
pre: " <b> 4.1. </b> "
---
# Summary Report: “First Cloud Journey Community Day – Technical Sharing Sessions”

| Information | Details |
|---|---|
| **Participation date** | **06 June 2026** |
| **Format** | In person |
| **Organizer** | First Cloud Journey (FCJ) |
| **Role** | Attendee |
| **Focus** | Technical sharing, AWS architecture, cloud-native development, security, AI, and career development |

## Event Objectives

- Create a space for First Cloud Journey members to share practical knowledge and experience.
- Introduce different AWS use cases, including AI/GraphRAG, security, serverless WebSockets, cloud operations, and DevOps.
- Explain the role of Docker and containers in application development, testing, and deployment.
- Share lessons about teamwork, self-learning, and the transition from IT infrastructure to Cloud/DevOps.
- Encourage participants to connect the presentations with their own projects rather than treating the sessions as theory only.

## Speakers and Topics

- **Trương Huy Phước** – *The Art of Effective Teamwork*.
- **Việt Phát** – *Building GraphRAG Applications Using Amazon Bedrock and Amazon Neptune*.
- **Lê Hoàng Gia Đại** – *Combining AWS WAF with Machine Learning for Cyber Attack Detection on AWS*.
- **Bảo Huỳnh** – *Docker: A Containerization Technology*.
- **Trần Trung Vinh** – *From IT Helpdesk to Senior Sysadmin and the First Steps toward Cloud/DevOps*.
- **Nguyễn Quốc Bảo** – *Multiplayer in the Cloud: Connecting Godot Clients with AWS WebSockets*.

## Key Highlights

### 1. Effective teamwork

Trương Huy Phước's session focused on individual work efficiency and overall team efficiency. The presentation emphasized that teamwork is not only about dividing tasks. A team also needs shared working rules, clear communication, and suitable collaboration tools. **Trello, ClickUp, Google Workspace, Slack, and Discord** were introduced as tools for task assignment, progress tracking, and communication.

### 2. GraphRAG with Amazon Bedrock and Amazon Neptune

Việt Phát started with traditional RAG and its limitations when answering questions that require reasoning across multiple relationships. **GraphRAG** addresses this problem by representing relationships as nodes and edges, then using graph traversal for multi-hop reasoning.

Two implementation approaches were presented:

- **Fully managed route:** Amazon Bedrock Knowledge Bases performs chunking, entity extraction, and embedding generation, while Amazon Neptune Analytics stores and analyzes the graph.
- **Custom route:** LlamaIndex is used for data preparation and knowledge graph construction, while Amazon Neptune stores the graph and supports Cypher queries.

### 3. Combining AWS WAF with a Machine Learning NIDS

Lê Hoàng Gia Đại explained how **AWS WAF** protects web applications from SQL injection, XSS, bot traffic, brute force, and abnormal requests. However, rule-based protection can be limited when facing zero-day attacks or previously unseen behavior.

The proposed solution combined WAF with a **Machine Learning-based Network Intrusion Detection System**. The presentation used the **CSE-CIC-IDS2018** dataset and covered data merging, cleaning, invalid-value handling, class balancing, and model training. The results highlighted that data quality and class-imbalance handling directly affect the detection of minority attack classes.

### 4. Docker and containerization

Bảo Huỳnh explained the difference between virtualization and containerization. Containers are lighter than virtual machines because each application does not require a separate operating system. Docker packages an application together with its dependencies and configuration so it can run consistently in different environments.

The main concepts included:

- Docker images and containers;
- Dockerfiles;
- image layers and build cache;
- basic Docker commands;
- Docker use cases in CI/CD, microservices, development/testing environments, and cloud-native applications.

### 5. From IT Helpdesk to Sysadmin and Cloud/DevOps

Trần Trung Vinh shared a practical career journey from IT Helpdesk to System Administrator. Skills developed in Helpdesk work—troubleshooting, user communication, and problem solving under pressure—became important foundations for infrastructure work.

Moving into Sysadmin and Cloud/DevOps required additional knowledge of Linux, networking, hands-on labs, automation, monitoring, runbooks, Infrastructure as Code, CI/CD, and Docker. One important message was that practical projects and problem-solving ability are often more valuable than learning too many topics or relying on certificates alone.

### 6. Multiplayer in the cloud with AWS WebSockets

Nguyễn Quốc Bảo presented a turn-based multiplayer architecture using **Amazon API Gateway WebSocket, AWS Lambda, and Amazon DynamoDB**, connected to two Godot clients.

The workflow included:

- `$connect`, `$disconnect`, and custom routes in API Gateway;
- Lambda searching for a waiting player, creating a match, and sending messages to two `connectionId` values;
- DynamoDB storing connection status, opponent information, and player choices;
- the Godot WebSocket client sending and receiving JSON messages and updating the interface based on game state.

The presentation also discussed three practical issues: stale connections causing `GoneException`, the cost of DynamoDB Scan, and the stateless nature of Lambda. AWS GameLift was introduced as a possible future option for games requiring dedicated servers and continuous real-time synchronization.

## Key Takeaways

### Design mindset

- Select an architecture based on the actual problem and scale instead of adding services only to make the system look more advanced.
- Decoupling components can improve flexibility, but operational cost and failure visibility must also be considered.
- Data, state, and communication patterns should be designed explicitly from the beginning.

### Cloud engineering

- Docker helps standardize environments and reduces differences between development and deployment machines.
- AWS managed services reduce operational work, but developers still need to understand service limitations.
- Monitoring, logging, and runbooks should be prepared before incidents happen.
- Security requires multiple layers; rule-based protection is useful for known attack patterns but does not fully replace behavior analysis.
- Serverless WebSockets can work well for turn-based applications, but stale connections, state management, and DynamoDB access patterns require careful design.

### Career development and teamwork

- Building deep knowledge in a few core areas and completing real projects is more effective than studying too many topics at once.
- Documentation, automation, and communication are core technical skills rather than secondary tasks.
- Collaboration tools are only effective when the team agrees on task ownership, progress updates, and communication practices.

## Applying the Lessons to QuickBite and My Work

After the event, I mapped the sessions to the QuickBite project:

- **Docker:** continue packaging the FastAPI backend and local environment to reduce differences when moving the application to EC2.
- **Cloud architecture:** keep the demo architecture appropriately scoped to CloudFront, S3, EC2, RDS, and CloudWatch; advanced components are documented only as future improvements.
- **Monitoring:** include CloudWatch Logs, a CPU alarm, and an incident checklist instead of validating the application through the user interface only.
- **Security:** use an EC2 IAM role with least-privilege access and restrict permissions to the required S3 bucket and prefix.
- **Event-driven design:** consider moving order email or notification processing to an asynchronous flow in a future version, without presenting it as part of the current demo.
- **Teamwork:** divide work into small tasks with clear owners, outcomes, and evidence so that the Worklog and Workshop remain consistent.
- **Operational practice:** maintain deployment, troubleshooting, and clean-up documentation so another person can reproduce the process.

GraphRAG and multiplayer architecture are outside the current QuickBite scope, but these sessions helped me understand how database models, communication patterns, and managed services should be selected for different types of workloads.

## Event Experience

This was the first event I attended during the program. The most valuable aspect was the diversity of the sessions. The presentations covered teamwork, containers, system operations, AI, cybersecurity, and real-time applications. This gave me a broader view of how a cloud product is designed, deployed, protected, and operated.

The Docker session was the most directly connected to QuickBite because the project already uses containers for the local environment and backend. The Cloud/DevOps session made me pay closer attention to monitoring, runbooks, and automation. The AWS WAF and Machine Learning session also demonstrated that effective security requires layered controls and real operational data.

I also learned that a strong technical presentation should not simply list AWS services. The sessions that included an architecture, a demonstration, challenges, and post-deployment lessons were easier to understand and more credible. I want to apply the same approach to the QuickBite Workshop: describe only what was actually implemented, provide evidence, document encountered issues, and separate future improvements from the current deployment.

## Lessons Learned

- A system should not be designed around the idea that more services automatically mean a better architecture; it must fit the goal, budget, and operating capability.
- Containerization is an important preparation step before deploying an application to the cloud.
- Monitoring and documentation should be treated as part of the product, not as final additions.
- Serverless and event-driven solutions require clear designs for retries, state, idempotency, and failure handling.
- Real projects, the ability to explain technical decisions, and lessons learned from deployment problems are highly valuable for both learning and career development.

## Some Event Photos

{{< report-image src="event-photo.jpg" alt="Photo from First Cloud Journey Community Day on 06 June 2026" >}}

The photo shows the conclusion of the “Combining AWS WAF with Machine Learning for Cyber Attack Detection on AWS” session, including results, future improvements, and lessons learned.
