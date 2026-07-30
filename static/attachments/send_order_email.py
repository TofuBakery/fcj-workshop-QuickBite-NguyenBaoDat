"""AWS Lambda: send a QuickBite order email via Amazon SES.

AWS-phase replacement for the local FastAPI -> SMTP -> Mailpit flow.
Trigger options:
  - Invoked directly by the backend (boto3 lambda.invoke), or
  - Subscribed to an SNS topic the backend publishes order events to.

Required IAM permission on the Lambda execution role: ses:SendEmail.
Environment variables: SES_SENDER (a verified SES identity), optionally SES_REGION.
Event shape (example):
{
  "to": "customer@example.com",
  "order_code": "QB-20260610-0010",
  "status": "confirmed",
  "total": 105000
}
"""
import os

import boto3
from botocore.exceptions import BotoCoreError, ClientError

SES_SENDER = os.environ.get("SES_SENDER", "no-reply@quickbite.example")
SES_REGION = os.environ.get("SES_REGION", os.environ.get("AWS_REGION", "ap-southeast-1"))

_ses = boto3.client("ses", region_name=SES_REGION)


def handler(event, _context):
    to = event.get("to")
    if not to:
        return {"statusCode": 400, "body": "missing 'to'"}

    order_code = event.get("order_code", "")
    status = event.get("status", "")
    total = event.get("total", 0)

    subject = f"QuickBite • Đơn {order_code} — {status}"
    body_text = (
        f"Xin chào,\n\nĐơn hàng {order_code} của bạn hiện ở trạng thái: {status}.\n"
        f"Tổng thanh toán: {total:,.0f} VND.\n\nCảm ơn bạn đã dùng QuickBite."
    )

    try:
        resp = _ses.send_email(
            Source=SES_SENDER,
            Destination={"ToAddresses": [to]},
            Message={
                "Subject": {"Data": subject, "Charset": "UTF-8"},
                "Body": {"Text": {"Data": body_text, "Charset": "UTF-8"}},
            },
        )
    except (BotoCoreError, ClientError) as exc:
        return {"statusCode": 502, "body": f"SES error: {exc}"}

    return {"statusCode": 200, "body": resp["MessageId"]}
