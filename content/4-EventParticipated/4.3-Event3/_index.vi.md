---
title: "First Cloud Journey AI - 25/07/2026"
date: 2026-07-30
weight: 3
chapter: false
pre: " <b> 4.3. </b> "
---
# Báo cáo tóm tắt: “First Cloud Journey AI – Agentic AI Projects và Hackathon Journey”

| Thông tin | Nội dung |
|---|---|
| **Ngày tham gia** | **25/07/2026** |
| **Hình thức** | Trực tiếp |
| **Địa điểm** | Không gian tổ chức sự kiện AWS; địa chỉ cụ thể chưa được cung cấp |
| **Đơn vị tổ chức** | First Cloud Journey / cộng đồng AWS |
| **Vai trò** | Người tham dự |
| **Nội dung** | Agentic AI, dự án AWS thực tế, kiến trúc cloud, hành trình hackathon và ứng dụng AI cho Solution Architect |

## Mục tiêu sự kiện

- Chia sẻ những dự án Agentic AI được xây dựng trên AWS từ góc nhìn sản phẩm, kiến trúc và chi phí.
- Giúp người tham dự hiểu quá trình biến một ý tưởng thành MVP có thể demo trong thời gian ngắn.
- Trình bày các bài học về teamwork, quản lý phạm vi, phân chia vai trò và chuẩn bị cho hackathon.
- Minh họa cách Amazon Bedrock, Amazon SageMaker, AgentCore, Lambda, DynamoDB, S3, CloudWatch và các dịch vụ AWS khác có thể kết hợp trong các hệ thống thực tế.
- Giới thiệu cách AI hỗ trợ công việc của Solution Architect, từ thu thập yêu cầu đến tạo sơ đồ, ước tính chi phí và Infrastructure as Code.
- Khuyến khích người học đánh giá một dự án không chỉ qua ý tưởng mà còn qua khả năng vận hành, chi phí, độ tin cậy và bằng chứng demo.

## Diễn giả, nhóm trình bày và chủ đề

### 1. SignalScout

Nhóm gồm **Lê Tấn Lực, Đỗ Hoàng Hiếu, Triệu Quốc Hào, Nguyễn Văn Duy Khiêm, Nguyễn Công Minh và Nguyễn Trần Minh Quân**.

Chủ đề tập trung vào một nền tảng AI hỗ trợ doanh nghiệp phát hiện sớm các thay đổi chiến lược, thu thập bằng chứng từ nhiều nguồn và chuyển các tín hiệu rời rạc thành một câu chuyện có thể kiểm chứng.

### 2. OneTeam – AI-powered Conversation Ordering

Nhóm gồm **Anh Duy, Trần Đông, Đoàn Trung, Minh Việt và Anshul Roy**.

Bài trình bày chia sẻ quá trình xây dựng một agent đặt món đa kênh, cho phép khách hàng thực hiện hội thoại đặt hàng trên các kênh như Zalo hoặc Messenger mà không phải chuyển sang một ứng dụng khác.

### 3. Team 3KA – Hackathon Journey

Nhóm gồm **Huỳnh An Khương, Nguyễn Quốc Huy, Ngô Quang Khôi, Hoàng Lê Thành Đức, Đặng Nguyễn Phước Lộc và Đặng Trường Hưng**.

Nhóm chia sẻ hành trình 24 giờ xây dựng dự án **S.H.E.P.H.E.R.D.**, một hệ thống phân tích camera nhằm phát hiện mật độ người, theo dõi hàng đợi, dự đoán ùn tắc và hỗ trợ người vận hành phản ứng sớm.

### 4. Plan V – Solution Architect Professional Native App

Nhóm gồm **Phạm Tiến Thuận Phát, Huỳnh Hoàng Long, Lê Minh Nghĩa, Trần Đại Vĩ và Nguyễn An**.

Giải pháp sử dụng AI để hỗ trợ Solution Architect phân tích yêu cầu, đề xuất kiến trúc, tạo sơ đồ có thể chỉnh sửa, tạo Infrastructure as Code và đưa ra ước tính chi phí định hướng cho region `ap-southeast-1`.

## Nội dung nổi bật

### 1. SignalScout: từ dữ liệu rời rạc đến quyết định có bằng chứng

SignalScout giải quyết bài toán các nhóm chiến lược doanh nghiệp phải theo dõi nhiều nguồn dữ liệu, nhưng thường khó nhận ra sớm những tín hiệu như tái cấu trúc, thay đổi định hướng hoặc rủi ro vận hành.

Giá trị cốt lõi của nền tảng gồm:

- phát hiện sớm các thay đổi chiến lược của doanh nghiệp;
- thu thập và kiểm tra bằng chứng;
- liên kết các tín hiệu thành timeline và báo cáo dễ hiểu;
- hỗ trợ quyết định **Maintain, Adapt hoặc Accelerate**;
- giữ con người trong vòng kiểm soát thay vì để AI tự đưa ra quyết định cuối cùng.

Bài trình bày cũng đề cập thách thức khi vận hành nhiều dịch vụ: triển khai, service discovery, networking, observability, scaling và CI/CD. Phần chi phí là một điểm thực tế, vì nhóm không chỉ trình bày kiến trúc mà còn so sánh nhiều mức sử dụng. Các dịch vụ được đưa vào phân tích gồm Amazon Bedrock, AgentCore, AWS WAF, Amplify Hosting, CloudWatch, Secrets Manager, DynamoDB, Lambda, Route 53, CloudTrail, S3, API Gateway và Cognito.

Điểm đáng chú ý là nhóm không dừng ở kiến trúc đầu tiên mà tiếp tục đưa ra một phiên bản tiết kiệm hơn. Điều này cho thấy kiến trúc cloud cần được điều chỉnh theo quy mô sử dụng, giá trị kinh doanh và ngân sách thực tế.

### 2. OneTeam: AI đặt món không chỉ là một chatbot

OneTeam bắt đầu từ một bài toán rất gần với QuickBite: người dùng đang trò chuyện trên một kênh nhắn tin và phát sinh nhu cầu đặt món, nhưng việc chuyển sang ứng dụng khác, đăng nhập và lặp lại yêu cầu làm tăng ma sát và có thể khiến đơn hàng bị bỏ dở.

Giải pháp được mô tả là một agent đặt món đa kênh. Agent cần:

1. hiểu ý định đặt món;
2. lập kế hoạch xử lý;
3. gọi công cụ để đọc dữ liệu đáng tin cậy;
4. cập nhật giỏ hàng, voucher và lựa chọn món;
5. xác minh lại với trạng thái giỏ hàng thật trước khi xác nhận.

Thông điệp quan trọng là:

> **Một chatbot chỉ trả lời; một agent phải hành động và kiểm chứng kết quả.**

Bài trình bày cũng nhấn mạnh rằng ngôn ngữ tự nhiên không chính xác tuyệt đối, trong khi quy tắc đặt hàng liên quan đến số lượng, biến thể, voucher, trạng thái giỏ và tiền thật. Vì vậy, AI không nên trực tiếp tự tạo dữ liệu nghiệp vụ mà phải làm việc thông qua các tool hoặc API có kiểm soát.

Kiến trúc được thiết kế theo hướng có thể thêm channel adapter, business connector hoặc tool mới mà không phải xây lại toàn bộ hệ thống. Phần đo lường trình bày chi phí khoảng **$0.006 cho mỗi đơn**, tổng hạ tầng khoảng **$88 mỗi tháng** trong kịch bản được nhóm ước tính, cùng độ trễ end-to-end khoảng **3–5 giây**. Các con số này cho thấy một pitch kỹ thuật thuyết phục cần có cả kiến trúc, trải nghiệm, chi phí và latency.

### 3. Team 3KA: bài học thật từ 24 giờ hackathon

Team 3KA trình bày trung thực cả thành công lẫn khó khăn khi xây dựng MVP trong thời gian giới hạn. Dự án S.H.E.P.H.E.R.D. được thiết kế để:

- phát hiện và theo dõi người trong video;
- đo mật độ đám đông;
- đánh giá tình trạng hàng đợi;
- dự đoán nguy cơ quá tải;
- tạo cảnh báo chủ động;
- đề xuất hành động cho nhân sự vận hành.

Các công nghệ được đề cập gồm **YOLO, ByteTrack, Amazon SageMaker, Amazon Bedrock AgentCore, Strands Agent và React monitoring dashboard**.

Hai thành phần Agentic AI đáng chú ý:

- **Autonomous Monitor:** liên tục theo dõi metric, phát hiện dấu hiệu ùn tắc và tạo cảnh báo;
- **Operator Copilot:** cho phép nhân viên đặt câu hỏi bằng ngôn ngữ tự nhiên và nhận câu trả lời dựa trên dữ liệu, prediction và action thật.

Phần giá trị nhất không chỉ là kiến trúc mà là những bài học về quá trình làm việc: thiếu nền tảng AI, lần đầu dùng AWS, thời gian ngắn, lỗi code, thiếu ngủ, quên commit, phân vai chưa rõ và vô tình đưa file môi trường lên GitHub. Nhóm rút ra rằng cần xác định sớm tiêu chí “done”, chuẩn bị starter kit, chia vai trò và rehearsal demo.

Ba thông điệp chính của nhóm gồm:

- xuất hiện và bắt đầu đã là một nửa chặng đường;
- một tính năng nhỏ nhưng hoàn chỉnh tốt hơn một hệ thống lớn nhưng không chạy;
- những người gặp được và trải nghiệm học hỏi có giá trị lớn hơn giải thưởng.

### 4. Plan V: AI hỗ trợ Solution Architect nhưng không thay thế tư duy kiến trúc

Plan V giải quyết tình huống một Solution Architect phải đọc BRD/PRD, trích xuất yêu cầu, tạo kiến trúc, vẽ sơ đồ và ước tính chi phí trong thời gian ngắn.

Ứng dụng được thiết kế để:

- phân tích yêu cầu ngôn ngữ tự nhiên và dữ liệu có cấu trúc;
- tạo requirement catalogue;
- đề xuất nhiều phương án kiến trúc ở mức high-level;
- tạo sơ đồ Draw.io và sơ đồ AWS bằng icon chính thức;
- sinh Infrastructure as Code;
- đưa ra ước tính chi phí định hướng cho `ap-southeast-1`;
- nêu rõ assumption, recommendation và requirement gap;
- cho phép người dùng refine kết quả qua giao diện chat.

So với quy trình thủ công, AI tạo ra một bản nháp có căn cứ để Solution Architect review thay vì phải bắt đầu từ trang trắng. Tuy nhiên, bài trình bày cũng gián tiếp cho thấy con người vẫn phải xác minh yêu cầu, điều chỉnh kiến trúc và chịu trách nhiệm cho quyết định cuối cùng.

## Bài học chính

### Tư duy sản phẩm và kiến trúc

- Bắt đầu từ vấn đề và giá trị người dùng, không bắt đầu từ danh sách dịch vụ AWS.
- Một kiến trúc tốt phải cho phép sản phẩm thay đổi mà không phải xây lại toàn bộ hệ thống.
- AI cần truy cập dữ liệu thật thông qua tool/API được kiểm soát, đặc biệt khi liên quan đến đơn hàng hoặc tiền.
- Cần tách rõ tính năng đang chạy, phần demo, giả định và kế hoạch tương lai.

### Kỹ thuật và vận hành

- Observability, deployment, networking và CI/CD là vấn đề cốt lõi khi hệ thống có nhiều service.
- Mọi kiến trúc nên có ước tính chi phí và một phương án đơn giản hơn khi quy mô nhỏ.
- Dữ liệu bí mật và file `.env` không được commit lên GitHub.
- Một MVP cần được tối ưu cho khả năng demo end-to-end, không phải số lượng dịch vụ.
- Metric kỹ thuật cần gắn với hành trình người dùng và kết quả kinh doanh.

### Teamwork và hackathon

- Phân vai rõ ràng giúp tránh trùng việc và giảm xung đột.
- Scope nhỏ nhưng hoàn chỉnh tạo ra giá trị lớn hơn nhiều feature chưa xong.
- Cần chuẩn bị tài khoản, repository, starter code và demo script trước khi bắt đầu.
- Demo và storytelling quan trọng gần như phần code, vì người xem cần hiểu vấn đề, giải pháp và tác động trong thời gian ngắn.

## Ứng dụng vào QuickBite và công việc

Sau sự kiện, em liên hệ các bài trình bày với QuickBite theo các hướng sau:

- **Giữ phạm vi demo thực tế:** ưu tiên luồng customer → order → kitchen → delivery chạy hoàn chỉnh trên CloudFront, EC2, RDS và S3 thay vì thêm nhiều dịch vụ chưa có bằng chứng.
- **Agentic ordering trong tương lai:** QuickBite có thể bổ sung một conversational ordering assistant, nhưng agent chỉ nên gọi các API menu, cart, order và payment đã được kiểm soát; không được tự tạo giá hoặc trạng thái đơn hàng.
- **Xác minh trước khi hành động:** mọi thay đổi giỏ hàng hoặc đơn hàng phải được backend kiểm tra lại theo dữ liệu database, role và state transition.
- **Kiến trúc mở rộng:** frontend, backend, database và object storage đã được tách thành các thành phần riêng, tạo nền tảng để thêm channel adapter hoặc service bất đồng bộ trong tương lai.
- **Chi phí và độ tin cậy:** kiến trúc cuối sử dụng hai EC2 **t3.micro**, RDS **db.t3.micro Multi-AZ**, ALB, S3, CloudFront và CloudWatch; em theo dõi Budget/Cost Explorer và chỉ thêm Bedrock hoặc AgentCore khi có use case cùng cost estimate rõ.
- **Monitoring:** ngoài CPU Alarm, hướng phát triển nên theo dõi tỷ lệ tạo đơn thành công, login failure và latency của order API.
- **Security:** không commit `.env`, secret, token hoặc private key; EC2 dùng IAM role theo least privilege.
- **AI hỗ trợ kiến trúc:** có thể dùng AI để tạo bản nháp diagram, checklist và cost estimate, nhưng báo cáo phải được đối chiếu với resource đã deploy thật.
- **Cách trình bày:** báo cáo QuickBite cần nêu rõ problem, solution, architecture, cost, demo flow, challenges, lessons learned và next steps giống cấu trúc của các đội trình bày tốt tại sự kiện.

Phần OneTeam có liên hệ trực tiếp nhất với QuickBite vì cùng xử lý bài toán đặt món. Tuy nhiên, bài học em nhận được không phải là cần thêm chatbot ngay lập tức, mà là phải làm chắc API, business rule, xác minh giỏ hàng và luồng trạng thái trước. Khi nền tảng giao dịch chưa đáng tin cậy, việc thêm AI chỉ làm lỗi trở nên khó kiểm soát hơn.

## Trải nghiệm sự kiện

Sự kiện thứ ba mang màu sắc dự án và hackathon rõ hơn hai buổi trước. Các nhóm không chỉ nói về một dịch vụ AWS riêng lẻ mà trình bày toàn bộ hành trình: vấn đề, ý tưởng, kiến trúc, chi phí, demo, lỗi gặp phải và bài học sau quá trình xây dựng.

Em ấn tượng với cách các nhóm thẳng thắn nói về những phần chưa hoàn hảo. SignalScout có cả phương án kiến trúc tiết kiệm hơn; Team 3KA kể về lỗi code, thiếu kinh nghiệm và việc vô tình push file môi trường; OneTeam nhấn mạnh rằng AI ordering là một bài toán hệ thống thật chứ không phải demo chatbot đơn giản; Plan V cho thấy AI hữu ích nhất khi tạo bản nháp để con người kiểm tra và cải tiến.

Không khí trực tiếp giúp em quan sát cách diễn giả trình bày live demo, giải thích trade-off và tương tác với người tham dự. Đây cũng là một bài học cho phần Workshop QuickBite: thay vì liệt kê quá nhiều dịch vụ, em cần dẫn người xem theo một câu chuyện rõ ràng từ khách hàng đặt món đến dữ liệu được lưu, bếp xử lý và đơn được giao.

## Bài học rút ra

- Một giải pháp cloud tốt cần cân bằng giữa giá trị sản phẩm, khả năng chạy thật, chi phí và độ phức tạp.
- Agentic AI chỉ đáng tin cậy khi hành động thông qua tool có kiểm soát và có bước xác minh kết quả.
- Kiến trúc phải hỗ trợ thay đổi, nhưng không nên thiết kế quá mức cho một demo nhỏ.
- MVP nên tập trung vào một luồng chính hoàn chỉnh và có thể chứng minh end-to-end.
- Cost estimate, latency, observability và security là một phần của sản phẩm, không phải nội dung bổ sung sau cùng.
- Teamwork, scope, version control và rehearsal có ảnh hưởng trực tiếp đến chất lượng demo.
- AI có thể hỗ trợ Solution Architect, nhưng assumption và recommendation vẫn phải được con người kiểm chứng.
- Báo cáo kỹ thuật cần trung thực về những gì đã triển khai và những gì chỉ là future plan.

## Một số hình ảnh sự kiện

{{< report-image src="event-photo.jpg" alt="Sự kiện First Cloud Journey AI ngày 25 tháng 7 năm 2026" >}}

Ảnh được ghi lại trong buổi chia sẻ trực tiếp ngày 25/07/2026. Người trình bày đang trao đổi với khán giả tại không gian có nhận diện AWS.
