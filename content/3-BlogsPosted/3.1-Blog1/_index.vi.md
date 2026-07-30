---
title: "Blog 1 - Event-Driven Architecture trên AWS"
date: 2026-07-30
weight: 1
chapter: false
pre: " <b> 3.1. </b> "
---
# Event-Driven Architecture trên AWS: Khi hệ thống biết “phản ứng” thay vì chỉ “chờ lệnh”

**Trạng thái nội dung:** Hoàn thành  

Khi mới học backend, mình thường hình dung một hệ thống theo cách rất tuyến tính: người dùng gửi request, server xử lý, database lưu dữ liệu rồi trả response. Cách này dễ hiểu và hoàn toàn phù hợp với nhiều ứng dụng nhỏ.

Tuy nhiên, khi một quy trình bắt đầu có nhiều bước phụ, request–response có thể trở nên nặng nề. Với QuickBite, sau khi một đơn hàng được tạo, hệ thống có thể cần:

- ghi đơn và chi tiết món vào PostgreSQL;
- gửi email xác nhận;
- ghi operation log;
- cập nhật báo cáo doanh thu;
- gửi thông báo cho bếp;
- kích hoạt quy trình giao hàng;
- theo dõi metric và lỗi.

Nếu tất cả được thực hiện đồng bộ trong cùng request, chỉ cần email service chậm hoặc một tác vụ phụ thất bại thì thời gian phản hồi của khách hàng cũng bị ảnh hưởng. Đây là lý do mình bắt đầu quan tâm đến **Event-Driven Architecture**.

## Event-Driven Architecture là gì?

Thay vì yêu cầu service tạo đơn phải gọi trực tiếp mọi service khác, hệ thống phát ra một sự kiện để thông báo rằng một điều gì đó đã xảy ra.

Ví dụ:

```text
OrderCreated
PaymentCompleted
OrderStatusChanged
MenuImageUploaded
```

Service tạo đơn chỉ cần hoàn thành trách nhiệm chính và phát sự kiện `OrderCreated`. Các consumer khác có thể lắng nghe sự kiện và tự xử lý phần việc của mình:

- email consumer gửi xác nhận;
- reporting consumer cập nhật dữ liệu tổng hợp;
- notification consumer báo cho bếp;
- audit consumer lưu dấu vết hoạt động.

Điểm quan trọng là producer không cần biết có bao nhiêu consumer hoặc consumer được triển khai bằng công nghệ nào. Điều đó giúp giảm coupling giữa các thành phần.

## Các dịch vụ AWS thường được dùng

### Amazon EventBridge

EventBridge phù hợp khi cần định tuyến event theo rule và kết nối nhiều nguồn/đích. Ví dụ, event `OrderCreated` có thể được gửi đến một event bus rồi chuyển tới Lambda gửi email và một queue xử lý báo cáo.

### Amazon SQS

SQS cung cấp hàng đợi bền vững. Nó phù hợp khi consumer cần xử lý theo tốc độ riêng hoặc khi không muốn mất message nếu consumer tạm thời ngừng hoạt động.

Với QuickBite future architecture, một queue có thể giữ các tác vụ gửi email hoặc đồng bộ báo cáo. Nếu Lambda gặp lỗi tạm thời, message vẫn còn để retry.

### Amazon SNS

SNS phù hợp với fan-out và pub/sub. Một message có thể được đẩy tới nhiều subscriber. Trong demo hiện tại, QuickBite chỉ dùng SNS cho email thông báo từ CloudWatch Alarm, không dùng SNS cho notification đơn hàng.

### AWS Lambda

Lambda phù hợp với các consumer nhỏ, event-driven và không cần server chạy liên tục. Ví dụ: nhận `OrderCreated`, tạo nội dung email và gửi qua Amazon SES.

## Áp dụng cho QuickBite như thế nào?

Kiến trúc demo hiện tại của QuickBite vẫn xử lý chính theo request–response:

```text
Customer → FastAPI trên EC2 → RDS PostgreSQL
```

Mailpit được dùng để mô phỏng email ở local. EventBridge, SQS, Lambda và SES **chưa phải thành phần đã triển khai**.

Một hướng phát triển hợp lý sau demo là:

```text
FastAPI tạo đơn
      |
      v
EventBridge: OrderCreated
      |
      +--> SQS email queue --> Lambda --> SES
      |
      +--> SQS reporting queue --> reporting worker
      |
      +--> audit/notification consumer
```

Cách này giúp API trả kết quả sớm hơn và tránh để lỗi email làm thất bại request tạo đơn.

## Những vấn đề không thể bỏ qua

Event-driven không chỉ là “thêm Lambda cho hiện đại”. Khi chuyển sang xử lý bất đồng bộ, mình phải thiết kế nhiều vấn đề mới.

### 1. Retry và timeout

Consumer có thể gặp lỗi mạng hoặc service downstream bị gián đoạn. Cần xác định số lần retry, khoảng backoff và thời điểm chuyển message sang dead-letter queue.

### 2. Duplicate event và idempotency

Một event có thể được gửi hoặc xử lý nhiều hơn một lần. Consumer cần idempotent, nghĩa là xử lý lại cùng event không tạo hai email, hai bản ghi hoặc hai lần trừ tiền.

Một cách là lưu `event_id` đã xử lý hoặc sử dụng unique constraint.

### 3. Thứ tự xử lý

Nếu `OrderStatusChanged: ready` đến trước `OrderStatusChanged: preparing`, dữ liệu có thể không hợp lệ. Cần xác định use case có yêu cầu ordering hay không và chọn queue/partitioning phù hợp.

### 4. Dead-letter queue

Nếu một event thất bại sau nhiều lần retry, nó không nên bị mất hoặc retry vô hạn. DLQ giữ message lỗi để developer điều tra, sửa nguyên nhân và redrive sau đó.

### 5. Event schema và versioning

Event cần có schema rõ ràng, ví dụ:

```json
{
  "event_id": "uuid",
  "event_type": "OrderCreated",
  "event_version": "1.0",
  "occurred_at": "2026-08-10T09:30:00+07:00",
  "correlation_id": "order-request-uuid",
  "data": {
    "order_id": 125,
    "order_code": "QB-20260810-001",
    "customer_id": 24,
    "total": "185000.00"
  }
}
```

Khi schema thay đổi, consumer cũ vẫn cần xử lý an toàn hoặc có chiến lược nâng version.

### 6. Monitoring

Cần theo dõi số event lỗi, age của message, số message trong DLQ, Lambda errors/throttles và thời gian xử lý. Một kiến trúc “bất đồng bộ” nhưng không quan sát được sẽ rất khó debug.

## Bài học rút ra

Điều mình thấy giá trị nhất ở Event-Driven Architecture không phải là số lượng service AWS, mà là cách chia trách nhiệm. Service tạo đơn không cần biết ai gửi email hoặc ai cập nhật báo cáo. Nó chỉ cần thông báo rằng một sự kiện nghiệp vụ đã xảy ra.

Tuy vậy, event-driven chỉ thực sự đáng dùng khi hệ thống có nhu cầu tách biệt rõ ràng và đội ngũ sẵn sàng vận hành retry, idempotency, DLQ, schema và monitoring.

Với QuickBite, mô hình này phù hợp cho giai đoạn mở rộng sau khi demo EC2/RDS/S3/CloudWatch đã ổn định. Trong báo cáo hiện tại, nó được trình bày như **future architecture**, không phải bằng chứng đã triển khai.

## Nguồn tham khảo

- [Choosing between Amazon SNS, Amazon SQS, and Amazon EventBridge](https://docs.aws.amazon.com/decision-guides/latest/sns-or-sqs-or-eventbridge/sns-or-sqs-or-eventbridge.html)
- [Best practices for monitoring Amazon EventBridge events](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-monitoring-events-best-practices.html)
- [Amazon EventBridge dead-letter queues](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-rule-dlq.html)
