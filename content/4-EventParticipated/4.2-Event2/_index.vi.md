---
title: "First Cloud Journey AI - 11/07/2026"
date: 2026-07-30
weight: 2
chapter: false
pre: " <b> 4.2. </b> "
---
# Báo cáo tóm tắt: “First Cloud Journey AI – AWS Certification, SLA Monitoring và Web Application Security”

| Thông tin | Nội dung |
|---|---|
| **Ngày tham gia** | **11/07/2026** |
| **Hình thức** | Trực tiếp |
| **Địa điểm** | Không gian tổ chức sự kiện AWS; địa chỉ cụ thể chưa được cung cấp |
| **Đơn vị tổ chức** | First Cloud Journey (FCJ) |
| **Vai trò** | Người tham dự |
| **Nội dung** | AWS Cloud Practitioner, SLA và monitoring, bảo mật ứng dụng web với AWS Security Agent |

## Mục tiêu sự kiện

- Giúp người học hiểu cấu trúc, phạm vi kiến thức và cách chuẩn bị cho kỳ thi **AWS Certified Cloud Practitioner (CLF-C02)**.
- Làm rõ sự khác nhau giữa việc hạ tầng “đang chạy” và trải nghiệm thật của người dùng.
- Giới thiệu cách sử dụng SLA, metric, log, CloudWatch Alarm và Amazon SNS trong quản trị rủi ro vận hành.
- Trình bày cách AI agent có thể hỗ trợ review thiết kế, review mã nguồn và kiểm thử bảo mật ứng dụng web.
- Khuyến khích người tham dự liên hệ kiến thức chứng chỉ với quá trình xây dựng và vận hành một project AWS thực tế.

## Diễn giả và chủ đề

- **Ngô Lê Tấn Huy** – *Inside the Exam: AWS Cloud Practitioner*.
- **Nguyễn Huỳnh Sơn** – *SLA and Monitoring: From SLA to Monitoring What Really Matters*.
- **Nguyễn Tuấn Thịnh (Thinh Nguyen)** – *Securing Your Web Apps With AWS Security Agent*.

## Nội dung nổi bật

### 1. Lộ trình chuẩn bị AWS Cloud Practitioner

Phần trình bày đầu tiên giới thiệu kỳ thi AWS Certified Cloud Practitioner như một chứng chỉ nền tảng, tập trung vào bức tranh tổng thể của cloud thay vì yêu cầu lập trình hoặc cấu hình hệ thống quá sâu. Cấu trúc được trình bày gồm **65 câu hỏi trong 90 phút**, thang điểm từ 100 đến 1.000 và mức đạt là **700 điểm**.

Bốn nhóm kiến thức chính gồm:

- **Cloud Concepts – 24%**;
- **Security and Compliance – 30%**;
- **Cloud Technology and Services – 34%**;
- **Billing, Pricing, and Support – 12%**.

Những nội dung cần nắm gồm lợi ích của cloud, AWS Well-Architected Framework, AWS Cloud Adoption Framework, Shared Responsibility Model, IAM, Security Group và NACL, hạ tầng global, EC2, Lambda, S3, RDS, DynamoDB, VPC, Route 53, các mô hình giá EC2, Cost Explorer, Budgets và Support Plans.

Phần kinh nghiệm ôn tập nhấn mạnh ba phương pháp thực tế:

- gắn mỗi dịch vụ với một số keyword hoặc use case dễ nhớ;
- không chỉ làm đề thử mà phải phân tích vì sao từng đáp án đúng hoặc sai;
- kết hợp học lý thuyết với thao tác thực tế trên AWS Free Tier.

Các kỹ thuật làm bài gồm loại trừ đáp án, chú ý từ khóa như “least cost”, “most scalable” hoặc “not”, dùng chức năng flag for review và tránh suy diễn quá phức tạp đối với một kỳ thi nền tảng.

### 2. SLA và monitoring những gì thật sự quan trọng

Phần của anh Nguyễn Huỳnh Sơn bắt đầu từ một tình huống dễ gặp: AWS Console có thể hiển thị xanh, EC2 vẫn chạy và CPU vẫn thấp, nhưng người dùng lại không đăng nhập được. Điều này dẫn tới thông điệp chính:

> **Healthy infrastructure không đồng nghĩa với healthy user experience.**

Bài trình bày giải thích SLA là cam kết mức dịch vụ giữa nhà cung cấp và khách hàng. Tuy nhiên, SLA của AWS chỉ bao phủ dịch vụ AWS theo điều kiện công bố; trải nghiệm cuối của người dùng vẫn phụ thuộc vào kiến trúc, mã nguồn, database và cách vận hành của hệ thống do đội phát triển chịu trách nhiệm.

Một mô hình monitoring theo nhiều tầng được trình bày:

1. **Cloud provider:** EC2, RDS, ALB, S3;
2. **Infrastructure:** CPU, memory, disk, network;
3. **Application:** latency, error, request và dependency;
4. **Business:** tỷ lệ đăng nhập thành công, đơn hàng và doanh thu;
5. **Customer experience:** người dùng có đăng nhập, tìm kiếm, checkout hoặc thanh toán được hay không.

Trong phần demo, endpoint `/health` vẫn trả `200 OK` vì application process còn hoạt động, nhưng `/login` thất bại khi kết nối database bị chặn. Dashboard hạ tầng vẫn “xanh” trong khi hành trình thật của người dùng đã hỏng. Đây là ví dụ rõ ràng cho việc health check đơn giản chưa đủ để phản ánh tình trạng hệ thống.

Luồng cảnh báo được trình bày theo hướng:

```text
Custom metric (LoginFailure)
        ↓
CloudWatch Alarm
        ↓
Amazon SNS
        ↓
Email hoặc kênh thông báo của đội vận hành
```

Monitoring vì thế không chỉ là quan sát biểu đồ mà là một vòng lặp quản trị rủi ro: **xác định rủi ro → theo dõi tín hiệu → phản hồi → cải tiến**.

### 3. Bảo mật ứng dụng với AWS Security Agent

Phần thứ ba trình bày một cách tiếp cận sử dụng AI agent để hỗ trợ các hoạt động bảo mật vốn thường tốn nhiều thời gian và chi phí nếu thực hiện hoàn toàn thủ công. Theo nội dung của diễn giả, AWS Security Agent được mô tả là một agent có khả năng lập kế hoạch và thực hiện tác vụ bảo mật, với Amazon Bedrock hỗ trợ khả năng reasoning.

Ba nhóm khả năng được giới thiệu:

- **Design Security Review:** phân tích tài liệu kiến trúc hoặc Terraform trước khi viết hoặc triển khai code;
- **Code Security Review:** tích hợp với pull request trên GitHub/GitLab, phát hiện vấn đề và gợi ý bản sửa;
- **Automated Pentesting:** mô phỏng chuỗi khai thác nhiều bước và đưa ra bằng chứng có thể kiểm tra.

Bài trình bày cũng nhấn mạnh các giới hạn quan trọng:

- MFA, biometric authentication hoặc mTLS có thể khiến agent không đi tiếp được trong luồng kiểm thử;
- lỗi business logic khó phát hiện nếu thiếu ngữ cảnh nghiệp vụ;
- tác vụ phức tạp có thể tiêu tốn nhiều task-hour nên cần theo dõi chi phí;
- công cụ tự động không thay thế hoàn toàn review của con người và quy trình quản trị rủi ro.

Điểm quan trọng nhất tôi rút ra là bảo mật nên được đưa vào sớm trong vòng đời phát triển: từ review kiến trúc, review pull request đến kiểm thử ứng dụng đang chạy, thay vì chỉ kiểm tra vào cuối dự án.

## Bài học chính

### Kiến thức nền tảng AWS

- Chứng chỉ Cloud Practitioner cung cấp một bản đồ kiến thức tốt, nhưng cần được kết hợp với lab và project thực tế.
- Shared Responsibility Model giúp phân biệt trách nhiệm của AWS với trách nhiệm của người xây dựng workload.
- AWS Well-Architected Framework là khung để giải thích quyết định kiến trúc, không chỉ là nội dung để học thuộc khi thi.

### Monitoring và vận hành

- CPU thấp hoặc health check thành công chưa chứng minh rằng người dùng đang sử dụng được hệ thống.
- Cần quan sát cả infrastructure metric, application error, dependency và business metric.
- Alarm chỉ có giá trị khi gắn với một kênh thông báo và runbook phản hồi rõ ràng.
- Một dashboard tốt phải giúp trả lời câu hỏi “người dùng có hoàn thành được tác vụ chính không?”.

### Bảo mật

- Review bảo mật nên bắt đầu từ kiến trúc và mã nguồn, không đợi đến giai đoạn pentest cuối cùng.
- IAM least privilege, quản lý secret, kiểm soát network và review pull request vẫn là nền tảng dù có sử dụng AI agent.
- Công cụ AI có thể tăng tốc quá trình review, nhưng kết quả phải được xác minh và đặt trong ngữ cảnh nghiệp vụ thật.

## Ứng dụng vào QuickBite và công việc

Sau sự kiện, tôi liên hệ các nội dung với QuickBite như sau:

- **Cloud Practitioner:** dùng các domain của chứng chỉ để rà soát lại project theo bốn nhóm: cloud concept, security, service selection và cost management.
- **Shared Responsibility:** phân biệt rõ AWS chịu trách nhiệm cho hạ tầng cloud, còn QuickBite chịu trách nhiệm về cấu hình IAM, Security Group, mã nguồn, dữ liệu và trải nghiệm đặt món.
- **Monitoring hiện tại:** giữ CloudWatch Logs và CPU Alarm như bằng chứng demo đã lên kế hoạch, nhưng không mô tả chúng là đủ để bảo đảm trải nghiệm người dùng.
- **Monitoring tương lai:** xem xét custom metric cho login failure, order creation failure hoặc tỷ lệ đơn hàng thành công. Các metric này là hướng phát triển, chưa phải thành phần đã triển khai trong demo.
- **RDS dependency:** endpoint `/health` nên được phân biệt với kiểm tra kết nối database; khi cần có thể bổ sung một readiness check riêng để tránh tình trạng application process còn chạy nhưng nghiệp vụ đã lỗi.
- **Network security:** Security Group của RDS chỉ cho phép kết nối PostgreSQL từ Security Group của EC2 qua cổng 5432.
- **IAM:** EC2 sử dụng IAM role theo least privilege để truy cập đúng S3 bucket/prefix và gửi log lên CloudWatch, không hard-code access key.
- **Security review:** AWS Security Agent được ghi nhận như một lựa chọn thử nghiệm trong tương lai cho review kiến trúc hoặc pull request, không được mô tả là thành phần đang chạy trong QuickBite.
- **Runbook:** bổ sung checklist khi login hoặc tạo đơn thất bại: kiểm tra log ứng dụng, kết nối RDS, Security Group, database metric và các thay đổi gần nhất.

Phần monitoring là nội dung liên hệ trực tiếp nhất với QuickBite. Trước sự kiện, tôi chủ yếu nghĩ đến CPU, log và trạng thái instance. Sau phần demo, tôi hiểu rằng một project thuyết phục hơn cần chứng minh được cả luồng nghiệp vụ: khách hàng đăng nhập, tạo đơn, bếp nhận đơn, giao hàng cập nhật trạng thái và khách hàng xem kết quả.

## Trải nghiệm sự kiện

Sự kiện thứ hai mang tính tập trung hơn sự kiện đầu tiên. Ba bài trình bày tạo thành một chuỗi kiến thức khá hợp lý: bắt đầu từ nền tảng AWS và định hướng chứng chỉ, chuyển sang cách vận hành workload, sau đó mở rộng sang bảo mật ứng dụng bằng AI agent.

Phần SLA và monitoring để lại ấn tượng mạnh nhất vì ví dụ rất gần với tình huống thực tế. Một hệ thống có thể trông ổn trên dashboard nhưng vẫn thất bại ở bước quan trọng nhất đối với người dùng. Điều này giúp tôi thay đổi cách nhìn về bằng chứng trong báo cáo QuickBite: ảnh EC2 “Running” hoặc RDS “Available” là cần thiết, nhưng chưa đủ; tôi còn phải chụp kết quả đăng nhập, tạo đơn, đọc/ghi database và log tương ứng.

Phần Cloud Practitioner giúp tôi hệ thống hóa lại nhiều dịch vụ đã sử dụng trong project, đồng thời hiểu rõ hơn cách giải thích lý do chọn EC2, S3, RDS, CloudFront, CloudWatch, IAM và Budgets. Phần AWS Security Agent cho tôi thêm góc nhìn về DevSecOps, nhưng cũng nhắc rằng công cụ hiện đại không thể thay thế kiến thức nền tảng, review thủ công và hiểu biết về business logic.

Không khí sự kiện trực tiếp cũng tạo cơ hội quan sát cách các diễn giả trình bày demo, giải thích vấn đề và dẫn dắt người nghe từ một tình huống đơn giản đến bài học kiến trúc. Đây là kinh nghiệm hữu ích cho cách tôi trình bày phần Workshop QuickBite sau này.

## Bài học rút ra

- Học chứng chỉ hiệu quả nhất khi mỗi khái niệm được liên hệ với một workload hoặc tình huống thật.
- AWS SLA không tự bảo đảm rằng toàn bộ ứng dụng của mình mang lại trải nghiệm tốt cho người dùng.
- Monitoring phải đi từ tài nguyên hạ tầng đến application, business metric và customer journey.
- Health check cần được thiết kế đúng mục đích; một endpoint quá đơn giản có thể che giấu lỗi dependency.
- Bảo mật nên được tích hợp xuyên suốt vòng đời phát triển, nhưng mọi kết quả tự động vẫn cần được xác minh.
- Báo cáo kỹ thuật nên trung thực: phân biệt rõ nội dung đã triển khai, nội dung đang thử nghiệm và nội dung chỉ là hướng phát triển.

## Một số hình ảnh sự kiện

{{< report-image src="event-photo.jpg" alt="Không gian sự kiện First Cloud Journey AI ngày 11/07/2026" >}}

Ảnh chụp tại sự kiện trực tiếp ngày 11/07/2026. Diễn giả đang trình bày phần Tips & Tricks trước người tham dự trong không gian có nhận diện AWS và First Cloud Journey AI.
