---
title: "Chia sẻ, đóng góp ý kiến"
date: 2026-07-30
weight: 7
chapter: false
pre: " <b> 7. </b> "
includeInReport: false
---
## Cảm nhận về chương trình

Điểm có giá trị nhất của FCAJ là chương trình không dừng ở việc yêu cầu một ứng dụng “chạy được”. Người học phải giải thích vì sao chọn service, dữ liệu đi qua đâu, quyền được cấp như thế nào, log nằm ở đâu, chi phí được kiểm soát ra sao và khi kết thúc thì xóa tài nguyên thế nào.

Với QuickBite, cách tiếp cận này giúp tôi nhìn lại toàn bộ project. React, FastAPI và PostgreSQL chỉ là phần ứng dụng. Khi lên AWS, tôi còn phải xử lý RDS private, Security Group, IAM role, S3 policy, CloudFront, CORS, mixed content, log, alarm và clean-up.

## Mức độ hài lòng

**[CẦN CẬP NHẬT: chọn mức điểm thật, ví dụ x/10]**

Tôi hài lòng với định hướng thực hành và yêu cầu report song ngữ. Phần khó nhất nhưng cũng hữu ích nhất là phải đưa ra bằng chứng thay vì chỉ mô tả kiến trúc.

## Điều chương trình có thể cải thiện

- Cung cấp một evidence checklist chuẩn ngay từ đầu: screenshot nào bắt buộc, thông tin nào phải che và tiêu chí pass/fail.
- Có một buổi architecture review trước khi học viên tạo tài nguyên có thể phát sinh chi phí.
- Minh họa rõ sự khác nhau giữa “target architecture” và “deployed architecture”.
- Cung cấp ví dụ IaC/CI-CD tối thiểu nhưng vẫn yêu cầu người học tự tùy biến.
- Đưa thêm ví dụ troubleshooting thực tế cho RDS private, CORS và CloudFront SPA.

## Tôi có giới thiệu chương trình không?

Tôi sẽ giới thiệu chương trình cho những bạn đã có nền tảng lập trình và muốn học cloud theo hướng sản phẩm thực tế. Chương trình phù hợp với người sẵn sàng tự nghiên cứu, ghi worklog đều và chịu khó kiểm chứng từng bước.

## Bài học cá nhân

Bài học lớn nhất của tôi là tính trung thực kỹ thuật. Một sơ đồ có thể thể hiện tương lai, nhưng phần “đã triển khai” phải có URL, screenshot, log hoặc test output. Nếu chưa có, cần ghi rõ optional/future. Cách trình bày này không làm project yếu đi; ngược lại, nó cho thấy người thực hiện hiểu phạm vi và rủi ro.
