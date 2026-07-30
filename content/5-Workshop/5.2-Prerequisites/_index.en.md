---
title: "Prerequisites"
date: 2026-07-30
weight: 2
chapter: false
pre: " <b> 5.2. </b> "
---
# Prerequisites

## 1. Account and Region

- an AWS account able to create EC2, RDS, S3, CloudFront, IAM roles, CloudWatch, SNS, and Budgets;
- do not use the root account for daily work;
- enable MFA for important identities;
- Region: `ap-southeast-1`;
- create an AWS Budget before resources.

## 2. Local tools

```text
Git
Docker Desktop / Docker Engine
Docker Compose plugin
Node.js and npm
AWS CLI
SSH client
PostgreSQL client (can be installed on EC2)
Hugo Extended for viewing the report
```

Verify:

```bash
git --version
docker --version
docker compose version
node --version
npm --version
aws --version
hugo version
```

## 3. Source code

```bash
git clone https://github.com/edrictrn/quickbite.git
cd quickbite
```

Do not commit:

```text
.env
*.pem
database password
AWS access key
application secret
```

## 4. Naming convention

| Resource | Proposed name |
|---|---|
| EC2 | `quickbite-app` |
| EC2 IAM role | `quickbite-ec2-role` |
| EC2 security group | `quickbite-ec2-sg` |
| RDS | `quickbite-db` |
| RDS security group | `quickbite-rds-sg` |
| Web bucket | `quickbite-web-<env>` |
| Image bucket | `quickbite-menu-images-<env>` |
| Log group | `quickbite/backend` |
| CPU alarm | `quickbite-cpu-high` |

Replace `<env>` with a unique suffix or environment name.

## 5. Permissions and network

- EC2 role: `s3:GetObject`, `s3:PutObject` for the exact bucket/prefix and CloudWatch Logs write permissions;
- port 22: My IP only;
- RDS 5432: source is the EC2 security group;
- RDS Public access: `No`;
- web S3 bucket: private and accessed through CloudFront OAC.

## 6. Required deployment files

- `docker-compose.aws.yml`;
- backend `Dockerfile`;
- frontend production Dockerfile/build configuration;
- `.env.example`;
- SQL schema/seed/views;
- `docs/deploy-walkthrough.md`;
- `docs/cleanup.md`.

## 7. Pre-deployment checklist

- [ ] AWS Budget exists;
- [ ] the `.pem` key pair is stored securely;
- [ ] region is correct;
- [ ] source contains no secrets;
- [ ] local E2E has passed;
- [ ] demo/future scope is understood;
- [ ] a folder exists for screenshots and terminal outputs.
