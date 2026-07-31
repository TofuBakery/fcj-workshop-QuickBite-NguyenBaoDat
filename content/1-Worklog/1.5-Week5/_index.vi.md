---
title: "Nhật ký tuần 5"
date: 2026-07-30
weight: 5
chapter: false
pre: " <b> 1.5. </b> "
---
### Mục tiêu tuần 5:

* Đánh giá QuickBite theo sáu trụ cột AWS Well-Architected.
* Phân biệt rõ kiến trúc demo hiện tại và các cải tiến dành cho tương lai.

### Các công việc đã thực hiện trong tuần:

| Ngày làm việc | Công việc | Ngày bắt đầu | Ngày hoàn thành | Tài liệu tham khảo |
|---:|---|---|---|---|
| 1 | Đánh giá Operational Excellence: runbook, health check, log, alarm, evidence và cleanup. | 28/06/2026 | 29/06/2026 | [Operational Excellence Pillar](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/welcome.html) |
| 2 | Đánh giá Security: IAM least privilege, Security Group, RDS private, CORS và quản lý secret bằng .env. | 28/06/2026 | 30/06/2026 | [Security Pillar](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/welcome.html) |
| 3 | Đánh giá Reliability: backup/restore là hướng phát triển; phương án ban đầu dùng Single-AZ; sau review em chuyển sang HA hai Availability Zone. | 29/06/2026 | 01/07/2026 | [Reliability Pillar](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/welcome.html) |
| 4 | Đánh giá Performance Efficiency: CloudFront cho static content, cấu hình instance nhỏ và theo dõi CPU. | 30/06/2026 | 02/07/2026 | [Performance Efficiency Pillar](https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/welcome.html) |
| 5 | Đánh giá Cost Optimization và Sustainability: Budgets, Cost Explorer, right-sizing và xóa tài nguyên sau demo. | 01/07/2026 | 03/07/2026 | [Cost Optimization Pillar](https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/welcome.html) |
| 6 | Chỉnh sơ đồ thành hai lớp Deployed/Demo và Target/Future; dùng nét đứt cho ASG, Multi-AZ, WAF và Secrets Manager. | 30/06/2026 | 03/07/2026 | [Sustainability Pillar](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/welcome.html) |

### Kết quả đạt được tuần 5:

* Đánh giá được QuickBite theo sáu trụ cột AWS Well-Architected:
  * Operational Excellence.
  * Security.
  * Reliability.
  * Performance Efficiency.
  * Cost Optimization.
  * Sustainability.
* Xác định các biện pháp vận hành cần có cho demo: runbook, health check, log, alarm, checklist kiểm thử và cleanup.
* Áp dụng các nguyên tắc bảo mật phù hợp với phạm vi hiện tại: IAM Least Privilege, RDS private, Security Group, CORS và không hard-code key.
* Hiểu giới hạn Reliability của phương án Single-AZ và dùng kết quả review để chuyển sang Multi-AZ cùng Auto Scaling.
* Giải thích được vai trò của CloudFront trong phân phối static content và giảm tải cho origin.
* Xây dựng kế hoạch kiểm soát chi phí bằng AWS Budgets, Cost Explorer, right-sizing và xóa tài nguyên không sử dụng.
* Tách sơ đồ thành hai lớp:
  * Deployed/Demo: những gì có thể triển khai và chứng minh.
  * Target/Future: Auto Scaling, Multi-AZ, WAF, Secrets Manager và backup nâng cao.
* Chuẩn hóa tên tài nguyên để tránh sai khác giữa sơ đồ, file cấu hình và báo cáo.
