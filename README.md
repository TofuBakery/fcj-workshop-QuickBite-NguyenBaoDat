# QuickBite FCAJ bilingual report

This Hugo site is a bilingual FCAJ internship/workshop report based on
QuickBite-final-v3 and the FCAJ workshop structure.

## Current revision

- Worklog: 8 weeks × 6 working days, from 04/06/2026 to 31/07/2026
- Three complete bilingual blog posts
- Three event dates currently recorded: 06/06, 11/07, 25/06
- AWS demo scope aligned with:
  - CloudFront + private S3 frontend
  - EC2 Docker/FastAPI backend
  - private Single-AZ RDS PostgreSQL
  - S3 menu images
  - CloudWatch Logs + CPU Alarm
  - IAM role, SNS alarm email, Budgets, Cost Explorer
- Advanced services are marked optional/future
- Reference screenshots supplied during editing were not inserted

## Important

Read:

- `FILL_ME_FIRST.md`
- `REPORT_REVISION_2026-07-30.md`
- `static/attachments/AWS_COMPLETION_CHECKLIST.md`

Entries dated after 30/07/2026 are planned work at the time of editing and must
be reconciled with actual work/evidence before final submission.

## Run locally

```bash
hugo server -D
```

Open the URL printed by Hugo.

## GitHub Pages

`config.toml` currently uses:

```text
https://edrictrn.github.io/quickbite-fcaj-report/
```

Change the repository path if the final report repository uses a different name.

## Report integrity

- Do not insert secrets, passwords, access keys, tokens, or private keys.
- Do not mark AWS tasks complete without URL, screenshot, log, or terminal evidence.
- Keep demo and future architecture clearly separated.
