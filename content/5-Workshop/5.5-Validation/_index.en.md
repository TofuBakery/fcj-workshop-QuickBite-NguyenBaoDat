---
title: "Testing and validation"
date: 2026-07-31
weight: 5
chapter: false
pre: " <b> 5.5. </b> "
---
# Testing and validation

## 1. Infrastructure evidence

| Component | Validation result |
|---|---|
| CloudFront | Two distributions are Enabled |
| EC2 / ASG | Two t3.micro instances in ap-southeast-1a and ap-southeast-1b, 3/3 checks passed |
| API | Health endpoint returns status ok, service quickbite-api, version 1.4.0 |
| ECR | quickbite-backend repository exists with AES-256 |
| S3 | Web, menu-images, and tfstate buckets exist |
| IAM | Roles for Auto Scaling, ELB, RDS, and application instances are present |
| CloudWatch | CPU and target-tracking high/low alarms are active |
| SNS | Email received an alarm state-change notification |
| Application | Customer menu, admin dashboard, and image upload operate successfully |

## 2. API health check

{{< report-image src="images/5-Workshop/evidence/api-healthcheck.png" alt="QuickBite API health check" caption="The CloudFront API domain returns status ok, service quickbite-api, and version 1.4.0." >}}

The health request validates the complete path through the CloudFront API distribution, ALB, target group, EC2 container, and FastAPI.

## 3. Storefront and customer flow

{{< report-image src="images/5-Workshop/evidence/customer-menu.png" alt="QuickBite customer menu" caption="The CloudFront-delivered storefront supports menu browsing, search, filtering, cart, order lookup, and login." >}}

I tested menu browsing, filtering, sorting, cart actions, login, order creation, and tracking. The frontend uses the CloudFront API domain, so it does not produce mixed-content errors.

## 4. Admin dashboard

{{< report-image src="images/5-Workshop/evidence/admin-dashboard.png" alt="QuickBite admin dashboard" caption="The admin dashboard reads data from RDS through FastAPI and displays orders, revenue, status distribution, and best-selling items." >}}

The dashboard shows total orders, total revenue, daily revenue, pending orders, status charts, and top items. This validates the frontend, backend, database, and role-based authorization end to end.

## 5. Menu-image upload

{{< report-image src="images/5-Workshop/evidence/menu-image-upload.png" alt="QuickBite menu-image upload" caption="The administrator uploads an image through FastAPI; the object is stored in the private menu-images bucket and displayed through the CloudFront /menu/* behavior." >}}

I validated the upload from the admin interface. The backend uses the EC2 IAM role for PutObject, and the returned URL uses the web CloudFront distribution instead of a public S3 URL.

## 6. CloudWatch and Auto Scaling alarms

{{< report-image src="images/5-Workshop/evidence/cloudwatch-alarms.png" alt="QuickBite CloudWatch alarms" caption="CloudWatch displays the CPU alarm and the two target-tracking alarms associated with the Auto Scaling Group." >}}

The alarms include:

- **quickbite-cpu-high:** average CPU greater than 70% for 10 minutes;
- **TargetTracking AlarmHigh:** supports scale-out;
- **TargetTracking AlarmLow:** supports scale-in.

{{< report-image src="images/5-Workshop/evidence/cloudwatch-overview.png" alt="QuickBite CloudWatch overview" caption="CloudWatch Overview displays the EC2 CPU metric and alarm state." >}}

## 7. SNS email

{{< report-image src="images/5-Workshop/evidence/sns-email.png" alt="CloudWatch alarm email delivered through SNS" caption="The email records quickbite-cpu-high changing from INSUFFICIENT_DATA to OK, including its threshold and state-change time." >}}

The email confirms that the SNS subscription was accepted and that CloudWatch actions can notify outside the AWS Console.

## 8. Business-flow validation

### Customer

- browse menus and images;
- log in;
- create orders;
- use COD or mock e-wallet;
- track and look up orders.

### Admin

- view the dashboard;
- manage items and categories;
- upload images;
- confirm and monitor orders;
- export reports and view audit logs.

### Kitchen

- view confirmed orders;
- move them through preparing and ready.

### Delivery

- view ready orders;
- complete delivery.

## 9. Security validation

- direct S3 access is not used as the public delivery path;
- EC2 has no public application endpoint; workload traffic enters through the ALB;
- RDS is in isolated subnets and accepts traffic only from the App Security Group;
- secrets are not stored in Terraform source or the Docker image;
- EC2 uses an IAM role rather than an access key;
- SSM replaces SSH;
- evidence screenshots do not contain active credentials.
