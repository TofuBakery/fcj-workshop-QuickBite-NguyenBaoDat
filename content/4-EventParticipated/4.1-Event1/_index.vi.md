---
title: "First Cloud Journey Community Day - 06/06/2026"
date: 2026-07-30
weight: 1
chapter: false
pre: " <b> 4.1. </b> "
---
# Báo cáo tóm tắt: “First Cloud Journey Community Day – Technical Sharing Sessions”

| Thông tin | Nội dung |
|---|---|
| **Ngày tham gia** | **06/06/2026** |
| **Hình thức** | Trực tiếp |
| **Đơn vị tổ chức** | First Cloud Journey (FCJ) |
| **Vai trò** | Người tham dự |
| **Nội dung** | Chia sẻ kỹ thuật, kiến trúc AWS, cloud-native, bảo mật, AI và định hướng nghề nghiệp |

## Mục tiêu sự kiện

- Tạo không gian để các thành viên First Cloud Journey chia sẻ kiến thức và kinh nghiệm thực tế.
- Giới thiệu nhiều hướng ứng dụng AWS, từ AI/GraphRAG, bảo mật, WebSocket serverless đến vận hành cloud và DevOps.
- Làm rõ vai trò của Docker và container trong quá trình phát triển, kiểm thử và triển khai ứng dụng.
- Chia sẻ các bài học về teamwork, kỹ năng tự học và lộ trình phát triển từ IT infrastructure sang Cloud/DevOps.
- Khuyến khích người tham dự liên hệ kiến thức trình bày với dự án cá nhân thay vì chỉ tiếp nhận ở mức lý thuyết.

## Diễn giả và chủ đề

- **Trương Huy Phước** – *The Art of Effective Teamwork*.
- **Việt Phát** – *Building GraphRAG Applications Using Amazon Bedrock and Amazon Neptune*.
- **Lê Hoàng Gia Đại** – *Combining AWS WAF with Machine Learning for Cyber Attack Detection on AWS*.
- **Bảo Huỳnh** – *Docker: A Containerization Technology*.
- **Trần Trung Vinh** – *From IT Helpdesk to Senior Sysadmin and the First Steps toward Cloud/DevOps*.
- **Nguyễn Quốc Bảo** – *Multiplayer in the Cloud: Connecting Godot Clients with AWS WebSockets*.

## Nội dung nổi bật

### 1. Làm việc nhóm hiệu quả

Phần trình bày của anh Trương Huy Phước tập trung vào hiệu suất làm việc cá nhân và hiệu suất của cả nhóm. Nội dung nhấn mạnh rằng teamwork không chỉ là chia nhỏ công việc, mà còn cần nguyên tắc làm việc chung, cách giao tiếp rõ ràng và công cụ phù hợp. Các công cụ như **Trello, ClickUp, Google Workspace, Slack và Discord** được giới thiệu như những lựa chọn hỗ trợ phân công, theo dõi tiến độ và trao đổi trong nhóm.

### 2. GraphRAG với Amazon Bedrock và Amazon Neptune

Phần của Việt Phát bắt đầu từ RAG truyền thống và giới hạn của nó khi xử lý câu hỏi cần suy luận qua nhiều mối quan hệ. **GraphRAG** khắc phục điểm này bằng cách lưu quan hệ dưới dạng node và edge, sau đó thực hiện graph traversal để hỗ trợ multi-hop reasoning.

Hai cách triển khai chính được trình bày:

- **Fully managed:** Amazon Bedrock Knowledge Bases thực hiện chunking, trích xuất entity và tạo embedding; Amazon Neptune Analytics lưu và khai thác graph.
- **Custom route:** sử dụng LlamaIndex để chuẩn bị dữ liệu, xây knowledge graph và lưu vào Amazon Neptune để truy vấn bằng Cypher.

### 3. Kết hợp AWS WAF với Machine Learning NIDS

Lê Hoàng Gia Đại trình bày vai trò của **AWS WAF** trong việc bảo vệ ứng dụng web khỏi SQL injection, XSS, bot traffic, brute force và các request bất thường. Tuy nhiên, WAF dựa trên rule có thể gặp hạn chế trước zero-day attack hoặc hành vi chưa từng xuất hiện.

Giải pháp được đề xuất là kết hợp WAF với **Network Intrusion Detection System sử dụng Machine Learning**. Bài trình bày sử dụng bộ dữ liệu **CSE-CIC-IDS2018**, thực hiện gộp dữ liệu, làm sạch, xử lý giá trị lỗi, cân bằng lớp và huấn luyện mô hình. Phần kết quả nhấn mạnh rằng chất lượng dữ liệu và cách xử lý mất cân bằng lớp ảnh hưởng trực tiếp đến khả năng phát hiện các nhóm tấn công thiểu số.

### 4. Docker và containerization

Bảo Huỳnh giải thích sự khác nhau giữa virtualization và containerization. So với virtual machine, container nhẹ hơn vì không cần một hệ điều hành riêng cho từng ứng dụng. Docker giúp đóng gói ứng dụng cùng dependency và cấu hình để hệ thống có thể chạy nhất quán ở nhiều môi trường.

Các khái niệm chính gồm:

- Docker image và container;
- Dockerfile;
- image layer và build cache;
- các Docker command cơ bản;
- ứng dụng Docker trong CI/CD, microservices, môi trường development/testing và cloud-native application.

### 5. Từ IT Helpdesk đến Sysadmin và Cloud/DevOps

Trần Trung Vinh chia sẻ lộ trình nghề nghiệp thực tế từ IT Helpdesk lên System Administrator. Những kỹ năng hình thành từ Helpdesk như troubleshooting, giao tiếp với người dùng và xử lý vấn đề dưới áp lực là nền tảng quan trọng cho công việc hạ tầng.

Khi chuyển sang Sysadmin và Cloud/DevOps, các năng lực cần được bổ sung gồm Linux, networking, lab thực hành, automation, monitoring, runbook, Infrastructure as Code, CI/CD và Docker. Một thông điệp đáng nhớ là dự án thực tế và khả năng giải quyết vấn đề thường có giá trị hơn việc chỉ học nhiều chủ đề hoặc chỉ có chứng chỉ.

### 6. Multiplayer trên cloud với AWS WebSockets

Nguyễn Quốc Bảo trình bày kiến trúc game multiplayer theo lượt sử dụng **Amazon API Gateway WebSocket, AWS Lambda và Amazon DynamoDB**, kết nối với hai Godot client.

Luồng xử lý gồm:

- `$connect`, `$disconnect` và custom route trong API Gateway;
- Lambda tìm người chơi đang chờ, ghép cặp và gửi message đến hai `connectionId`;
- DynamoDB lưu trạng thái kết nối, đối thủ và lựa chọn của người chơi;
- Godot WebSocket client gửi/nhận JSON message và cập nhật giao diện theo trạng thái trận đấu.

Bài trình bày cũng chỉ ra ba vấn đề thực tế: stale connection gây `GoneException`, chi phí của DynamoDB Scan và việc Lambda không duy trì state giữa các request. AWS GameLift được đề cập như hướng phù hợp hơn cho game cần dedicated server và đồng bộ thời gian thực liên tục.

## Bài học chính

### Tư duy thiết kế

- Chọn kiến trúc dựa trên bài toán và quy mô thật, không thêm dịch vụ chỉ để hệ thống trông phức tạp hơn.
- Tách các thành phần giúp giảm phụ thuộc, nhưng cần hiểu chi phí vận hành và cách theo dõi lỗi.
- Dữ liệu, state và communication pattern là ba yếu tố cần được thiết kế rõ ngay từ đầu.

### Kỹ thuật cloud

- Docker giúp chuẩn hóa môi trường và giảm khác biệt giữa máy phát triển với máy triển khai.
- AWS managed services giúp giảm công việc vận hành, nhưng developer vẫn phải hiểu giới hạn của từng dịch vụ.
- Monitoring, logging và runbook nên được chuẩn bị trước khi sự cố xảy ra.
- Bảo mật cần nhiều lớp; rule-based protection hiệu quả với mẫu tấn công đã biết nhưng không thay thế hoàn toàn việc phân tích hành vi.
- Serverless WebSocket phù hợp với ứng dụng theo lượt, nhưng cần xử lý kết nối hết hạn, state và truy vấn DynamoDB cẩn thận.

### Phát triển nghề nghiệp và teamwork

- Học sâu một số kỹ năng nền tảng và xây dự án thật hiệu quả hơn việc học quá nhiều chủ đề cùng lúc.
- Documentation, automation và giao tiếp là kỹ năng kỹ thuật quan trọng, không chỉ là công việc phụ.
- Công cụ quản lý chỉ phát huy hiệu quả khi nhóm đã thống nhất cách phân công, cập nhật tiến độ và trao đổi.

## Ứng dụng vào QuickBite và công việc

Sau sự kiện, em đối chiếu các nội dung đã nghe với dự án QuickBite:

- **Docker:** tiếp tục đóng gói FastAPI backend và môi trường local để giảm khác biệt khi chuyển lên EC2.
- **Cloud architecture:** giữ kiến trúc demo ở mức phù hợp gồm CloudFront, S3, EC2, RDS và CloudWatch; các thành phần nâng cao chỉ được ghi là hướng phát triển.
- **Monitoring:** bổ sung CloudWatch Logs, CPU Alarm và checklist xử lý sự cố thay vì chỉ kiểm tra ứng dụng bằng giao diện.
- **Security:** áp dụng IAM role theo least privilege cho EC2 và giới hạn quyền truy cập đúng S3 bucket/prefix cần dùng.
- **Event-driven:** xem xét tách email hoặc notification sau khi tạo đơn thành luồng bất đồng bộ trong tương lai; không mô tả đây là chức năng đã triển khai ở bản demo.
- **Teamwork:** tổ chức task theo đầu việc nhỏ, ghi rõ người thực hiện, kết quả và bằng chứng để việc viết Worklog và Workshop nhất quán hơn.
- **Operational practice:** duy trì tài liệu triển khai, troubleshooting và clean-up để người khác có thể tái hiện quy trình.

GraphRAG và kiến trúc multiplayer không nằm trong phạm vi hiện tại của QuickBite, nhưng hai phần này giúp em hiểu rõ hơn cách lựa chọn database, communication pattern và managed service cho các bài toán khác nhau.

## Trải nghiệm sự kiện

Đây là sự kiện đầu tiên em tham gia trong chương trình. Điểm em đánh giá cao nhất là nội dung không bị giới hạn ở một công nghệ duy nhất. Các phần trình bày đi từ teamwork, container, vận hành hệ thống đến AI, cybersecurity và real-time application. Nhờ đó, em có được góc nhìn rộng hơn về cách một sản phẩm cloud được xây dựng và vận hành.

Phần Docker liên hệ trực tiếp nhất với QuickBite vì dự án đang sử dụng container cho môi trường local và backend. Phần Cloud/DevOps giúp em chú ý hơn đến monitoring, runbook và automation. Trong khi đó, phần AWS WAF kết hợp Machine Learning cho thấy một hệ thống bảo mật hiệu quả cần kết hợp nhiều lớp và phải dựa trên dữ liệu thực tế.

Em cũng nhận ra rằng một bài thuyết trình kỹ thuật tốt không chỉ liệt kê dịch vụ AWS. Các bài có demo, kiến trúc, khó khăn và bài học sau triển khai giúp người nghe hiểu rõ hơn giới hạn của giải pháp. Đây là cách trình bày em muốn áp dụng cho phần Workshop QuickBite: mô tả đúng những gì đã làm, có bằng chứng, nêu lỗi đã gặp và tách riêng phần “future improvement”.

## Bài học rút ra

- Không nên thiết kế hệ thống theo hướng “càng nhiều dịch vụ càng tốt”; kiến trúc phải phù hợp với mục tiêu, ngân sách và khả năng vận hành.
- Containerization là bước chuẩn bị quan trọng trước khi đưa ứng dụng lên cloud.
- Monitoring và documentation cần được xem là một phần của sản phẩm, không phải việc bổ sung sau cùng.
- Khi sử dụng serverless hoặc event-driven architecture, cần thiết kế retry, state, idempotency và failure handling.
- Dự án thực tế, khả năng giải thích quyết định kỹ thuật và bài học từ lỗi triển khai có giá trị lớn trong quá trình học và phát triển nghề nghiệp.

## Một số hình ảnh sự kiện

{{< report-image src="event-photo.jpg" alt="Ảnh tại First Cloud Journey Community Day ngày 06/06/2026" >}}

Ảnh chụp phần tổng kết của chủ đề “Combining AWS WAF with Machine Learning for Cyber Attack Detection on AWS”, gồm kết quả, hướng phát triển và các bài học rút ra.
