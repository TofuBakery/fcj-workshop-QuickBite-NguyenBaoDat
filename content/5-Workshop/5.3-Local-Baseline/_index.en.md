---
title: "Local Baseline"
date: 2026-07-30
weight: 3
chapter: false
pre: " <b> 5.3. </b> "
---
# Local baseline

Before creating AWS resources, QuickBite must run reliably locally. This separates application defects from cloud-configuration defects.

## 1. Start from clean data

```bash
docker compose down -v
docker compose up --build
```

Expected addresses:

```text
Frontend: http://127.0.0.1:5173
Backend:  http://127.0.0.1:8000
Swagger:  http://127.0.0.1:8000/docs
Health:   http://127.0.0.1:8000/health
Mailpit:  http://127.0.0.1:8025
```

## 2. Health check

```bash
curl http://127.0.0.1:8000/health
```

Expected result:

```json
{"status":"ok"}
```

## 3. Automated tests

```bash
docker compose exec   -e DATABASE_URL=sqlite:///./quickbite.db   -e EMAIL_ENABLED=false   backend pytest -q
```

E2E script:

```bash
docker compose exec   -e DATABASE_URL=sqlite:///./quickbite.db   -e EMAIL_ENABLED=false   backend python scripts/e2e_local.py
```

## 4. Manual business-flow test

1. customer signs in;
2. adds menu items to the cart;
3. creates a COD order;
4. creates a mock e-wallet order and completes simulated payment;
5. admin confirms;
6. kitchen moves preparing → ready;
7. delivery completes;
8. customer views history/tracking;
9. Mailpit is checked;
10. dashboards, reports, and operation logs are reviewed.

## 5. Transparent limitations

- mock e-wallet is simulated and is not a real payment gateway;
- Mailpit is a local email mock;
- status transitions and the audit trail after mock payment need further hardening;
- S3 upload works only after AWS bucket/role configuration;
- demo accounts must be hidden in the production build.

## 6. Local evidence

- healthy Docker containers;
- four-role frontend;
- Swagger and `/health`;
- PostgreSQL tables;
- Mailpit email;
- pytest/E2E output.

Local evidence does not replace AWS evidence.
