---
title: "Nhật ký tuần 7"
date: 2026-07-30
weight: 7
chapter: false
pre: " <b> 1.7. </b> "
---
### Mục tiêu tuần 7:

* Chuẩn bị frontend HTTPS và static hosting cho QuickBite.
* Hoàn thiện CORS, SPA fallback và luồng ảnh món trên S3.

### Các công việc đã thực hiện trong tuần:

| Ngày làm việc | Công việc | Ngày bắt đầu | Ngày hoàn thành | Tài liệu tham khảo |
|---:|---|---|---|---|
| 1 | Rà soát production build React/Vite và cách cấu hình VITE_API_BASE cho môi trường AWS. | 10/07/2026 | 12/07/2026 | [QuickBite frontend](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |
| 2 | Tham gia First Cloud Journey AI; ghi chú về Cloud Practitioner, SLA/monitoring và AWS Security Agent. | 11/07/2026 | 11/07/2026 | Ghi chú và slide Event 2 |
| 3 | Thiết kế bucket quickbite-web-<env> private và CloudFront Origin Access Control. | 10/07/2026 | 13/07/2026 | [CloudFront OAC](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html) |
| 4 | Cấu hình default root object, SPA fallback 403/404 về /index.html và cache invalidation. | 12/07/2026 | 14/07/2026 | [CloudFront custom error pages](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html) |
| 5 | Phân tích lỗi mixed content; chọn CloudFront reverse proxy cho các API path và cập nhật CORS theo domain CloudFront. | 13/07/2026 | 15/07/2026 | [CORS on Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/cors.html) |
| 6 | Kiểm tra endpoint /uploads/image, prefix menu/ và cách backend trả URL ảnh từ S3 hoặc CloudFront. | 13/07/2026 | 15/07/2026 | [QuickBite upload endpoint](https://github.com/edrictrn/quickbite/tree/6c79b99049949e8cd28ae196c9792f4abff2e3db) |

### Kết quả đạt được tuần 7:

* Hiểu quy trình tạo production build của React/Vite và đồng bộ thư mục `dist` lên S3.
* Thiết kế bucket web private và sử dụng CloudFront Origin Access Control để giới hạn truy cập trực tiếp.
* Cấu hình được các yêu cầu của Single Page Application:
  * Default root object là `index.html`.
  * Chuyển lỗi 403/404 về `index.html`.
  * Invalidate cache sau khi cập nhật frontend.
* Phân tích được nguyên nhân mixed content khi frontend HTTPS gọi backend HTTP.
* Chọn phương án CloudFront reverse proxy cho các API path để frontend và API dùng cùng origin HTTPS.
* Xác định cách cập nhật CORS theo đúng domain CloudFront thay vì dùng wildcard.
* Kiểm tra luồng upload ảnh qua `/uploads/image`, prefix `menu/` và cách trả URL S3 hoặc CloudFront.
* Từ Event 2, hiểu rằng CPU và health check chưa đủ phản ánh trải nghiệm người dùng; login và order success mới là các tín hiệu nghiệp vụ quan trọng.
