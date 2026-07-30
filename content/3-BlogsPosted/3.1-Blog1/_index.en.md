---
title: "Blog 1 - Event-Driven Architecture on AWS"
date: 2026-07-30
weight: 1
chapter: false
pre: " <b> 3.1. </b> "
---
# Event-Driven Architecture on AWS: When a System Reacts Instead of Merely Waiting for Requests

**Content status:** Complete  

When I first learned backend development, I imagined systems in a very linear way: a user sends a request, the server processes it, the database stores data, and the server returns a response. This model is easy to understand and is perfectly valid for many small applications.

However, once a workflow includes many secondary tasks, request–response processing can become heavy. In QuickBite, after an order is created, the system may need to:

- store the order and line items in PostgreSQL;
- send a confirmation email;
- write an operation log;
- update revenue reporting;
- notify the kitchen;
- trigger delivery processing;
- record metrics and errors.

If all of this happens synchronously in one request, a slow email service or a failure in a secondary task can affect the customer's response time. This is why I became interested in **Event-Driven Architecture**.

## What is Event-Driven Architecture?

Instead of forcing the order service to call every other service directly, the system emits an event announcing that something happened.

Examples include:

```text
OrderCreated
PaymentCompleted
OrderStatusChanged
MenuImageUploaded
```

The order service completes its primary responsibility and emits `OrderCreated`. Other consumers independently handle their own work:

- an email consumer sends confirmation;
- a reporting consumer updates aggregates;
- a notification consumer alerts the kitchen;
- an audit consumer records activity.

The producer does not need to know how many consumers exist or how they are implemented. This reduces coupling.

## Common AWS services

### Amazon EventBridge

EventBridge is useful for rule-based event routing across multiple sources and targets. For example, `OrderCreated` can enter an event bus and be routed to an email Lambda and a reporting queue.

### Amazon SQS

SQS provides durable queues. It is appropriate when consumers must process at their own rate or when messages must survive a temporary consumer outage.

For a future QuickBite design, queues could hold email or reporting jobs. If Lambda fails temporarily, messages remain available for retry.

### Amazon SNS

SNS is useful for fan-out and pub/sub. A message can be delivered to several subscribers. In the current QuickBite demo, SNS is used only for CloudWatch Alarm email notifications, not for order notifications.

### AWS Lambda

Lambda is suitable for small event-driven consumers that do not require an always-on server. For example, it could receive `OrderCreated`, create an email, and send it through Amazon SES.

## How could this apply to QuickBite?

The current QuickBite demo still uses the main request–response path:

```text
Customer → FastAPI on EC2 → RDS PostgreSQL
```

Mailpit simulates email locally. EventBridge, SQS, Lambda, and SES are **not deployed demo components**.

A sensible post-demo roadmap is:

```text
FastAPI creates order
      |
      v
EventBridge: OrderCreated
      |
      +--> SQS email queue --> Lambda --> SES
      |
      +--> SQS reporting queue --> reporting worker
      |
      +--> audit/notification consumer
```

This lets the API respond earlier and prevents an email failure from failing the order request.

## Problems that cannot be ignored

Event-driven design is not simply “adding Lambda to look modern.” Asynchronous processing introduces new design responsibilities.

### 1. Retries and timeouts

Consumers may experience network failures or downstream outages. The design must define retry count, backoff, and when a message moves to a dead-letter queue.

### 2. Duplicate events and idempotency

An event may be delivered or processed more than once. Consumers should be idempotent so replaying the same event does not create two emails, duplicate records, or duplicate payments.

A practical approach is to store processed `event_id` values or use a unique constraint.

### 3. Ordering

If `OrderStatusChanged: ready` is processed before `OrderStatusChanged: preparing`, state may become invalid. The design must decide whether ordering is required and select queue/partitioning behavior accordingly.

### 4. Dead-letter queues

An event that repeatedly fails should not disappear or retry forever. A DLQ preserves failed messages for investigation and later redrive.

### 5. Event schema and versioning

Events need a clear schema:

```json
{
  "event_id": "uuid",
  "event_type": "OrderCreated",
  "event_version": "1.0",
  "occurred_at": "2026-08-10T09:30:00+07:00",
  "correlation_id": "order-request-uuid",
  "data": {
    "order_id": 125,
    "order_code": "QB-20260810-001",
    "customer_id": 24,
    "total": "185000.00"
  }
}
```

When the schema changes, older consumers still need a safe compatibility or versioning strategy.

### 6. Monitoring

The team should monitor failed events, message age, DLQ depth, Lambda errors/throttles, and processing latency. An asynchronous architecture without observability is very difficult to debug.

## Lesson learned

The most valuable part of Event-Driven Architecture is not the number of AWS services. It is the way responsibilities are separated. The order service does not need to know who sends email or updates reports. It only announces that a business event occurred.

However, event-driven design is justified only when decoupling is valuable and the team is prepared to operate retries, idempotency, DLQs, schemas, and monitoring.

For QuickBite, this model is appropriate after the EC2/RDS/S3/CloudWatch demo becomes stable. In the current report, it is presented as **future architecture**, not as deployed evidence.

## References

- [Choosing between Amazon SNS, Amazon SQS, and Amazon EventBridge](https://docs.aws.amazon.com/decision-guides/latest/sns-or-sqs-or-eventbridge/sns-or-sqs-or-eventbridge.html)
- [Best practices for monitoring Amazon EventBridge events](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-monitoring-events-best-practices.html)
- [Amazon EventBridge dead-letter queues](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-rule-dlq.html)
