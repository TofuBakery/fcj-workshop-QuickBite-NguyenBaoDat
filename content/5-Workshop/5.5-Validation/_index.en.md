---
title: "Testing and Validation"
date: 2026-07-30
weight: 5
chapter: false
pre: " <b> 5.5. </b> "
---
# Testing and validation

This section proves that QuickBite works end-to-end on the demo architecture rather than merely proving that individual resources exist.

## 1. Evidence matrix

| Item | Test | Expected result | Evidence |
|---|---|---|---|
| CloudFront frontend | open domain and refresh a deep link | React renders without 403/404 | URL + screenshot |
| Backend health | call `/health` | `{"status":"ok"}` | browser/curl |
| Swagger | open `/docs` | OpenAPI UI renders | screenshot |
| Private RDS | inspect connectivity and SG | Public access = No, 5432 from EC2 SG | console |
| Database | `psql ... -c "\dt"` from EC2 | tables/views are visible | terminal |
| Order flow | customer → admin → kitchen → delivery | order reaches completed state | screenshots/API output |
| Image upload | `/uploads/image` | object appears under `menu/` | request + S3 |
| CloudWatch logs | open `quickbite/backend` | startup/request/error logs exist | screenshot |
| CPU alarm | open `quickbite-cpu-high` | metric/alarm/action are correct | screenshot |
| SNS | inspect subscription | status is Confirmed | screenshot |
| Budget | open Budget | threshold and email are correct | screenshot |
| Clean-up | inspect resource list | demo resources are removed | terminal/console |

Do not mark an item “Pass” without real evidence.

## 2. Functional tests

### Customer

- register/sign in;
- browse and filter menu;
- add/remove/update cart quantities;
- create a COD order;
- create a mock e-wallet order;
- view subtotal, delivery fee, tax, and total;
- view history/tracking;
- look up with order code/token;
- test an invalid token.

### Admin

- dashboard;
- menu/category management;
- image upload;
- settings updates;
- order confirmation/cancellation;
- reports and CSV export;
- operation logs.

### Kitchen

- view kitchen orders;
- move confirmed → preparing → ready;
- verify unauthorized roles are rejected.

### Delivery

- view ready orders;
- move ready → completed;
- verify the customer sees the new status.

## 3. Database validation

From EC2:

```bash
psql "$DB" -c "\dt"
psql "$DB" -c "SELECT id, order_code, status, total FROM orders ORDER BY id DESC LIMIT 5;"
psql "$DB" -c "SELECT * FROM daily_revenue LIMIT 5;"
```

Verify:

- orders and line items are stored together;
- totals use NUMERIC/Decimal;
- payment records match method/status;
- status history contains the required transitions;
- reporting views can be queried.

## 4. Security negative tests

- call an admin endpoint with a customer token → 403;
- upload a non-JPEG/PNG/WebP file → rejected;
- upload an oversized file → rejected;
- repeatedly fail login → rate limit;
- connect to RDS port 5432 from the Internet → blocked;
- let the EC2 role access an unrelated bucket → AccessDenied;
- send CORS from an unknown origin → blocked.

## 5. Failure tests

| Scenario | Observation |
|---|---|
| restart backend container | health recovers and logs show restart |
| use an incorrect RDS password | connection failure is logged without exposing the password |
| temporarily close SG 5432 | DB requests fail in a controlled manner with clear logs |
| temporarily remove S3 permission | upload returns an appropriate error and CloudWatch logs it |
| refresh a deep frontend route | fallback returns `index.html` |
| misconfigure CORS | browser blocks and the configuration cause is identifiable |

Restore the secure configuration after testing.

## 6. Performance and cost checks

- observe EC2 CPU/memory under demo load;
- inspect RDS connections;
- review log size and retention;
- verify that no resources exist outside scope;
- check Cost Explorer after deployment and after clean-up.

## 7. Acceptance criteria

The workshop is complete when:

- critical functional tests pass;
- no secrets appear in source/screenshots;
- RDS is private;
- logs and alarms have evidence;
- frontend/backend/database/S3 work together;
- the report contains real URLs, screenshots, and outputs;
- clean-up is complete.

## 8. Limitations to disclose

- mock payment is not a real payment gateway;
- Mailpit is a local mock;
- Lambda/SES is optional;
- API Gateway is not used;
- ASG/Multi-AZ/WAF/Secrets Manager/AWS Backup are not part of the demo;
- a 5xx alarm is not deployed without an ALB/custom metric.
