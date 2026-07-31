---
title: "Tự đánh giá"
date: 2026-07-31
weight: 6
chapter: false
pre: " <b> 6. </b> "
includeInReport: false
---
Trong chương trình FCAJ, em phát triển QuickBite từ một ứng dụng local thành một hệ thống được triển khai trên AWS bằng Terraform. Quá trình này giúp em kết hợp kiến thức React, FastAPI, PostgreSQL và Docker với VPC, CloudFront, S3, ALB, Auto Scaling, EC2, RDS Multi-AZ, ECR, Secrets Manager, SSM, IAM, CloudWatch và SNS.

Em hiểu rõ hơn rằng một dự án cloud không chỉ được đánh giá bằng việc source code chạy được. Kiến trúc, phân quyền, network isolation, monitoring, chi phí, khả năng tái tạo hạ tầng và bằng chứng triển khai đều phải nhất quán.

| STT | Tiêu chí | Mô tả | Tốt | Khá | Trung bình |
| ---: | --- | --- | :---: | :---: | :---: |
| 1 | **Kiến thức và kỹ năng chuyên môn** | Kết hợp full-stack development, Docker, AWS và Terraform trong QuickBite | **X** |  |  |
| 2 | **Khả năng học hỏi** | Tự nghiên cứu dịch vụ AWS, Terraform modules và xử lý lỗi môi trường | **X** |  |  |
| 3 | **Tính chủ động** | Chủ động chuyển kiến trúc từ baseline đơn sang HA hai Availability Zone | **X** |  |  |
| 4 | **Tinh thần trách nhiệm** | Kiểm tra lại claim bằng ảnh, log, health check và demo thực tế | **X** |  |  |
| 5 | **Kỷ luật** | Duy trì worklog, quản lý source và rà soát báo cáo song ngữ |  | **X** |  |
| 6 | **Tinh thần cầu tiến** | Tiếp nhận góp ý và sửa kiến trúc, nội dung cùng cách trình bày nhiều lần | **X** |  |  |
| 7 | **Giao tiếp** | Trình bày business flow, trade-off, sự cố và kết quả triển khai |  | **X** |  |
| 8 | **Làm việc nhóm** | Trao đổi trong các buổi community và phối hợp hoàn thiện project |  | **X** |  |
| 9 | **Tác phong chuyên nghiệp** | Không dùng root key, che credential và phân biệt cấu hình với bằng chứng | **X** |  |  |
| 10 | **Giải quyết vấn đề** | Xử lý AWS CLI, PowerShell, Terraform, SSM, CloudFront, IAM và frontend build | **X** |  |  |
| 11 | **Đóng góp cho dự án** | Hoàn thiện ứng dụng, hạ tầng Terraform, monitoring và báo cáo | **X** |  |  |
| 12 | **Đánh giá chung** | Kết quả tổng thể trong chương trình FCAJ | **X** |  |  |

### Điểm cần cải thiện

- Thực hiện failure injection có kiểm soát để xác nhận ASG replacement và RDS failover bằng bằng chứng thực tế.
- Bổ sung CI/CD tự động build image, chạy test, Terraform plan và deploy theo môi trường.
- Tối ưu chi phí NAT Gateway và RDS Multi-AZ cho các môi trường không yêu cầu HA đầy đủ.
- Tiếp tục rèn khả năng thuyết trình ngắn gọn, tập trung vào business value và kết quả đo được.

### Mục tiêu phát triển cá nhân

Sau chương trình, em muốn tiếp tục phát triển theo hướng Cloud/DevOps và Software Engineering, có khả năng xây dựng một workload từ yêu cầu sản phẩm, thiết kế, IaC, triển khai, observability, bảo mật, xử lý sự cố đến kiểm soát chi phí.
