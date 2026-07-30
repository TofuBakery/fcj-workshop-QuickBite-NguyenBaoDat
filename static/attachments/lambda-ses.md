# Lambda + SES (AWS email phase)

Local development sends order emails through SMTP to Mailpit. On AWS, replace this
with SES, invoked by a small Lambda (`lambda/send_order_email.py`).

## Steps

1. **Verify a sender** in Amazon SES (an email address or a domain). In the SES
   sandbox you must also verify each recipient, or request production access.
2. **Create the Lambda** `quickbite-send-order-email` (Python 3.12), paste
   `lambda/send_order_email.py`, set handler `send_order_email.handler`.
3. **Environment variables:** `SES_SENDER=<verified-identity>`, `SES_REGION=ap-southeast-1`.
4. **Execution role:** attach a policy allowing `ses:SendEmail` / `ses:SendRawEmail`.
5. **Wire the backend** to invoke it. Two common patterns:
   - Direct: backend calls `boto3.client("lambda").invoke(FunctionName=..., Payload=...)`.
   - Decoupled: backend publishes an order event to an SNS topic; the Lambda subscribes.
6. In the backend, keep the current email module for local Mailpit and switch to the
   Lambda/SES path when `EMAIL_BACKEND=ses` (extend `email_utils.py` accordingly).

## Test event

```json
{ "to": "you@verified.com", "order_code": "QB-20260610-0010", "status": "confirmed", "total": 105000 }
```

Expect a `200` with an SES `MessageId` and the email in the recipient inbox.

> If you do not implement this for the demo, state in the report that Mailpit is the
> local simulation and SES/Lambda is the intended AWS equivalent.
