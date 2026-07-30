---
title: "First Cloud Journey AI - 25/07/2026"
date: 2026-07-30
weight: 3
chapter: false
pre: " <b> 4.3. </b> "
---
# Summary Report: “First Cloud Journey AI – Agentic AI Projects and Hackathon Journey”

| Information | Details |
|---|---|
| **Participation date** | **25 July 2026** |
| **Format** | In person |
| **Location** | AWS event space; the exact address was not provided |
| **Organizer** | First Cloud Journey / AWS community |
| **Role** | Attendee |
| **Focus** | Agentic AI, practical AWS projects, cloud architecture, hackathon experience, and AI support for Solution Architects |

## Event Objectives

- Share Agentic AI projects built on AWS from product, architecture, and cost perspectives.
- Show how an idea can be turned into a demonstrable MVP within a limited timeframe.
- Present lessons about teamwork, scope management, role assignment, and hackathon preparation.
- Demonstrate how Amazon Bedrock, Amazon SageMaker, AgentCore, Lambda, DynamoDB, S3, CloudWatch, and other AWS services can be combined in practical systems.
- Introduce the use of AI to support Solution Architects from requirement extraction to diagram generation, cost estimation, and Infrastructure as Code.
- Encourage participants to evaluate projects not only by their ideas, but also by operability, cost, reliability, and demo evidence.

## Speakers, Teams, and Topics

### 1. SignalScout

The team consisted of **Le Tan Luc, Do Hoang Hieu, Trieu Quoc Hao, Nguyen Van Duy Khiem, Nguyen Cong Minh, and Nguyen Tran Minh Quan**.

Their solution focused on an AI platform that helps organizations detect strategic changes early, collect evidence from multiple sources, and turn scattered signals into a transparent and verifiable narrative.

### 2. OneTeam – AI-powered Conversation Ordering

The team consisted of **Anh Duy, Tran Dong, Doan Trung, Minh Viet, and Anshul Roy**.

The presentation shared the journey of building a multi-channel ordering agent that allows customers to order through channels such as Zalo or Messenger without switching to another application.

### 3. Team 3KA – Hackathon Journey

The team consisted of **Huynh An Khuong, Nguyen Quoc Huy, Ngo Quang Khoi, Hoang Le Thanh Duc, Dang Nguyen Phuoc Loc, and Dang Truong Hung**.

The team presented its 24-hour journey building **S.H.E.P.H.E.R.D.**, a camera-analysis system for crowd-density detection, queue monitoring, congestion prediction, and proactive operational response.

### 4. Plan V – Solution Architect Professional Native App

The team consisted of **Pham Tien Thuan Phat, Huynh Hoang Long, Le Minh Nghia, Tran Dai Vi, and Nguyen An**.

The solution used AI to help Solution Architects analyze requirements, propose architectures, produce editable diagrams, generate Infrastructure as Code, and provide directional cost estimates for the `ap-southeast-1` region.

## Key Highlights

### 1. SignalScout: from scattered information to evidence-based decisions

SignalScout addressed a common problem for corporate strategy teams: they monitor many data sources but may struggle to detect early signals of restructuring, strategic change, or operational risk.

The platform’s core value propositions included:

- detecting corporate strategic changes early;
- collecting and validating evidence;
- connecting signals into timelines and understandable reports;
- supporting **Maintain, Adapt, or Accelerate** decisions;
- keeping humans in control rather than allowing AI to make final decisions autonomously.

The team also discussed the challenges of operating multiple services, including deployment, service discovery, networking, observability, scaling, and CI/CD. Cost analysis was a practical part of the presentation. The estimate included Amazon Bedrock, AgentCore, AWS WAF, Amplify Hosting, CloudWatch, Secrets Manager, DynamoDB, Lambda, Route 53, CloudTrail, S3, API Gateway, and Cognito.

A particularly useful point was that the team did not stop at its first architecture. It also presented a more cost-efficient version. This demonstrated that cloud architecture should be adjusted to actual usage, business value, and budget constraints.

### 2. OneTeam: AI ordering is more than a chatbot

OneTeam started with a problem closely related to QuickBite: a user may already be chatting when the intent to order food appears, but switching applications, logging in, and repeating the request creates friction and can cause the order to be abandoned.

The proposed solution was a multi-channel conversational ordering agent. The agent needed to:

1. understand the ordering intent;
2. plan the required steps;
3. call tools to retrieve trusted business data;
4. update the cart, promotions, and selected items;
5. verify the result against the real cart before confirmation.

The key message was:

> **A chatbot replies; an agent acts and verifies.**

The presentation emphasized that natural language is inherently ambiguous while ordering rules involving quantities, variants, vouchers, cart state, and real money are strict. Therefore, the AI should not directly invent business data. It must work through controlled tools or APIs.

The architecture was designed so that a new channel adapter, business connector, or tool could be added without rebuilding the full system. The team also presented measurable outcomes: approximately **$0.006 per order**, around **$88 per month** for the estimated infrastructure scenario, and **3–5 seconds** of end-to-end latency. These figures showed that a convincing technical pitch should include architecture, user experience, cost, and latency.

### 3. Team 3KA: real lessons from a 24-hour hackathon

Team 3KA openly presented both achievements and difficulties from building an MVP under significant time pressure. S.H.E.P.H.E.R.D. was designed to:

- detect and track people in video;
- measure crowd density;
- estimate queue conditions;
- predict overcrowding risk;
- generate proactive alerts;
- recommend actions to operators.

The technologies mentioned included **YOLO, ByteTrack, Amazon SageMaker, Amazon Bedrock AgentCore, Strands Agent, and a React monitoring dashboard**.

Two Agentic AI components were particularly interesting:

- **Autonomous Monitor:** continuously observes metrics, detects congestion signals, and creates proactive alerts;
- **Operator Copilot:** allows staff to ask natural-language questions and receive concise answers grounded in live metrics, predictions, and actions.

The most valuable part was not limited to the architecture. The team described a lack of AI background, first-time AWS usage, limited time, broken code, sleep deprivation, forgotten commits, unclear ownership, and accidentally pushing an environment file to GitHub. From these experiences, the team recommended defining “done” early, preparing starter kits, assigning clear roles, and rehearsing the demo.

Its three core takeaways were:

- showing up and starting is already half the journey;
- a small, finished solution is better than a large, broken one;
- the people and learning experience often matter more than the prize.

### 4. Plan V: AI supports Solution Architects without replacing architectural judgment

Plan V addressed the situation in which a Solution Architect must read a BRD/PRD, extract requirements, draft an architecture, create diagrams, and estimate cost under a short deadline.

The application was designed to:

- analyze natural-language and structured requirements;
- create a requirement catalogue;
- draft high-level architecture options;
- generate editable Draw.io and AWS diagrams using official icons;
- generate Infrastructure as Code;
- provide directional cost estimates for `ap-southeast-1`;
- identify assumptions, recommendations, and requirement gaps;
- refine the result through a chat interface.

Compared with a fully manual process, AI provides a grounded first draft for the Solution Architect to review instead of starting from a blank page. However, the presentation also implied that a human must still validate requirements, refine the architecture, and remain accountable for the final decision.

## Key Takeaways

### Product and architecture mindset

- Start with the user problem and business value, not with a list of AWS services.
- A good architecture should allow the product to change without requiring a complete rebuild.
- AI should access real data through controlled tools and APIs, especially for orders and payments.
- Clearly distinguish deployed features, demo components, assumptions, and future plans.

### Engineering and operations

- Observability, deployment, networking, and CI/CD become core challenges in multi-service systems.
- Every architecture should include a cost estimate and a simpler option for small-scale usage.
- Secrets and `.env` files must never be committed to GitHub.
- An MVP should optimize for an end-to-end demonstrable flow rather than the number of services.
- Technical metrics should be connected to the user journey and business outcomes.

### Teamwork and hackathons

- Clear role assignment reduces duplicated effort and conflict.
- A small but complete scope creates more value than many unfinished features.
- Accounts, repositories, starter code, and demo scripts should be prepared before the event begins.
- Demo delivery and storytelling are almost as important as implementation because the audience must understand the problem, solution, and impact within a short time.

## Applying the Lessons to QuickBite and My Work

After the event, I connected the sessions to QuickBite in the following ways:

- **Keep the demo scope realistic:** prioritize a complete customer → order → kitchen → delivery flow on CloudFront, EC2, RDS, and S3 instead of adding services without evidence.
- **Future agentic ordering:** QuickBite could later add a conversational ordering assistant, but the agent should call controlled menu, cart, order, and payment APIs rather than invent prices or order states.
- **Verify before acting:** every cart or order change must be validated by the backend against database data, roles, and allowed state transitions.
- **Extensible architecture:** frontend, backend, database, and object storage are already separated, creating a foundation for future channel adapters or asynchronous services.
- **Cost awareness:** continue using an EC2 `t3.micro`, a Single-AZ RDS `db.t3.micro`, S3, CloudFront, and CloudWatch for the demo; add Bedrock or AgentCore only when there is a clear use case and a cost estimate.
- **Monitoring:** beyond a CPU alarm, future improvements could track successful-order rate, login failures, and order API latency.
- **Security:** never commit `.env`, secrets, tokens, or private keys; use an EC2 IAM role with least privilege.
- **AI-assisted architecture:** AI may create draft diagrams, checklists, or cost estimates, but the report must be reconciled with resources that were actually deployed.
- **Presentation structure:** the QuickBite report should clearly present the problem, solution, architecture, cost, demo flow, challenges, lessons learned, and next steps.

The OneTeam presentation had the strongest direct relationship to QuickBite because both address food ordering. However, my main lesson was not to add a chatbot immediately. The APIs, business rules, cart validation, and order-state flow must first be reliable. Adding AI on top of an unreliable transaction foundation would make errors harder to control.

## Event Experience

The third event had a stronger project and hackathon focus than the previous two sessions. The teams did not discuss isolated AWS services; instead, they presented the full journey from problem and idea to architecture, cost, demo, failures, and lessons learned.

I appreciated the teams’ honesty about imperfect parts. SignalScout included a more cost-efficient architecture; Team 3KA discussed broken code, inexperience, and accidentally pushing an environment file; OneTeam emphasized that AI ordering is a real system problem rather than a simple chatbot demo; and Plan V showed that AI is most useful when it creates a draft for humans to validate and improve.

The in-person format also allowed me to observe how presenters handled live demos, explained trade-offs, and interacted with the audience. This was useful for planning the QuickBite Workshop presentation. Rather than listing too many services, I should guide the audience through a clear story—from a customer placing an order to data storage, kitchen processing, delivery, and final status updates.

## Lessons Learned

- A good cloud solution balances product value, real execution, cost, and complexity.
- Agentic AI is trustworthy only when it acts through controlled tools and verifies its results.
- Architecture should support change without being over-engineered for a small demo.
- An MVP should focus on one complete and demonstrable core flow.
- Cost estimates, latency, observability, and security are part of the product rather than optional afterthoughts.
- Teamwork, scope, version control, and rehearsal directly affect demo quality.
- AI can support Solution Architects, but assumptions and recommendations still require human validation.
- Technical reports should remain honest about what is deployed and what is only a future plan.

## Some Event Photos

{{< report-image src="event-photo.jpg" alt="First Cloud Journey AI event on 25 July 2026" >}}

The photo was taken during the in-person sharing session on 25 July 2026. A presenter was interacting with attendees in an AWS-branded event space.
