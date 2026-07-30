---
title: "Week 7 Worklog"
date: 2026-07-30
weight: 7
chapter: false
pre: " <b> 1.7. </b> "
---
### Week 7 Objectives:

* Prepare HTTPS frontend delivery and static hosting for QuickBite.
* Complete CORS, SPA fallback, and the S3 menu-image flow.

### Tasks carried out during the week:

| Workday | Task | Start Date | Completion Date | Reference Material |
|---:|---|---|---|---|
| 1 | Reviewed the React/Vite production build and VITE_API_BASE configuration for AWS. | 10/07/2026 | 12/07/2026 | [QuickBite frontend](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 2 | Attended First Cloud Journey AI and took notes on Cloud Practitioner, SLA/monitoring, and AWS Security Agent. | 11/07/2026 | 11/07/2026 | Event 2 slides and notes |
| 3 | Designed the private quickbite-web-<env> bucket and CloudFront Origin Access Control. | 10/07/2026 | 13/07/2026 | [CloudFront OAC](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html) |
| 4 | Configured the default root object, 403/404 SPA fallback to /index.html, and cache invalidation. | 12/07/2026 | 14/07/2026 | [CloudFront custom error pages](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html) |
| 5 | Analyzed mixed-content issues, selected CloudFront reverse proxying for API paths, and updated CORS for the CloudFront domain. | 13/07/2026 | 15/07/2026 | [CORS on Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/cors.html) |
| 6 | Checked /uploads/image, the menu/ prefix, and the S3 or CloudFront URL returned by the backend. | 13/07/2026 | 15/07/2026 | [QuickBite upload endpoint](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |

### Week 7 Achievements:

* Understood the React/Vite production-build process and how to synchronize the `dist` directory to S3.
* Designed a private web bucket with CloudFront Origin Access Control.
* Configured the requirements for the Single Page Application:
  * `index.html` as the default root object.
  * 403/404 responses redirected to `index.html`.
  * Cache invalidation after frontend updates.
* Analyzed the mixed-content issue caused by an HTTPS frontend calling an HTTP backend.
* Selected CloudFront reverse proxy behaviors so that frontend and API requests use the same HTTPS origin.
* Defined CORS using the CloudFront domain instead of a wildcard.
* Reviewed the `/uploads/image` flow, the `menu/` prefix, and S3 or CloudFront image URLs.
* Learned from Event 2 that CPU and health checks alone do not represent user experience; login and order success are important business signals.
