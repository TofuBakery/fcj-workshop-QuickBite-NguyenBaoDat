# QuickBite — Deploy AWS từng bước (bản đã sửa theo review)

> Kiến trúc: **Frontend → S3 + CloudFront · Backend (Docker) → EC2 · DB → RDS PostgreSQL ·
> Ảnh món → S3 · Log/Alarm → CloudWatch**. Không dùng API Gateway (nếu sơ đồ báo cáo có
> API Gateway thì bỏ đi để khỏi bị hỏi "URL đâu?").
>
> Quy ước: `<...>` là giá trị bạn tự thay. Region: **ap-southeast-1**.
>
> ⚠️ Chi phí (2026): tài khoản mới Free Plan có ~$200 credit, hết hạn sau 6 tháng hoặc khi
> hết credit. EC2/RDS trừ vào credit. Demo ngắn thì thừa, **nhớ xóa ở Phase 13**.
>
> 🔑 Hai lỗi kinh điển đã sửa trong bản này:
> 1. RDS private → **không nạp schema từ laptop được**, phải nạp **từ EC2**.
> 2. `docker compose up backend` ở file cũ kéo theo Postgres local vì `depends_on: db` →
>    dùng file mới **`docker-compose.aws.yml`** (chỉ backend, không db).

---

## Phase 0 — Chuẩn bị
1. Tạo tài khoản AWS, chọn **Free plan**.
2. **Billing → Budgets → Create budget** (Zero-spend hoặc ngưỡng $5) + email cảnh báo.
   (Đây cũng là 1 trong 5 tác vụ onboarding được thưởng credit.)
3. Cài AWS CLI: `aws configure` (region `ap-southeast-1`).
4. EC2 → **Key Pairs** → tạo `quickbite-key.pem`, `chmod 400 quickbite-key.pem`.
5. Push code lên GitHub private (`.env` KHÔNG commit).

---

## Phase 1 — S3 bucket ảnh món
1. S3 → **Create bucket** `quickbite-menu-images-<ban>` · region `ap-southeast-1`.
2. Chọn 1 trong 2 hướng:
   - **Demo nhanh:** bỏ Block public access, thêm bucket policy cho `menu/*` (xem `aws-deployment.md`). Upload trả URL S3 trực tiếp.
   - **Bảo mật (khuyến nghị báo cáo):** giữ bucket **private**, sẽ đặt CloudFront trước ảnh và set `MENU_IMAGE_BASE_URL=https://<cloudfront-images>` để backend trả CloudFront URL.

---

## Phase 2 — RDS PostgreSQL (private)
1. EC2 → **Security Groups** → tạo `quickbite-rds-sg` (inbound để trống, thêm sau).
2. RDS → **Create database** → PostgreSQL → `db.t3.micro`, 20GB.
   - identifier `quickbite-db`, user `quickbite`, password mạnh (ghi lại).
   - **Public access = No**, VPC SG = `quickbite-rds-sg`.
3. Chờ **Available**, copy **Endpoint**.
   → *Chưa nạp schema vội — sẽ nạp từ EC2 ở Phase 5.*

---

## Phase 3 — EC2 + IAM role + security group
1. IAM → **Roles** → Create role → EC2 → tên `quickbite-ec2-role`. Thêm inline policy JSON
   (S3 PutObject/GetObject cho bucket ảnh + CloudWatch Logs) — xem `aws-deployment.md` §3.1.
2. EC2 → **Launch instance** `quickbite-app`, Ubuntu 24.04, `t3.micro`, key `quickbite-key`.
3. SG mới `quickbite-ec2-sg`: inbound **22** (My IP), **80** (Anywhere), **8000** (Anywhere).
4. Advanced → **IAM instance profile** = `quickbite-ec2-role`. Launch. Copy **Public IPv4**.

---

## Phase 4 — Nối EC2 SG → RDS SG (port 5432)
- Vào `quickbite-rds-sg` → Inbound → Add rule → **PostgreSQL (5432)** →
  Source = **Custom** → chọn security group id của `quickbite-ec2-sg` → Save.
- Đây là bước làm cho EC2 (và chỉ EC2) nói chuyện được với RDS.

---

## Phase 5 — SSH vào EC2, clone, nạp schema vào RDS TỪ EC2
```bash
ssh -i quickbite-key.pem ubuntu@<ec2-public-ip>

sudo apt update && sudo apt install -y docker.io docker-compose-plugin git postgresql-client
sudo usermod -aG docker ubuntu && newgrp docker
git clone https://github.com/<you>/quickbite.git && cd quickbite

# Nạp schema/seed/views vào RDS (chạy TỪ EC2 vì RDS private)
export DB="postgresql://quickbite:<db-password>@<rds-endpoint>:5432/quickbite"
psql "$DB" -f backend/sql/schema_postgres.sql
psql "$DB" -f backend/sql/seed_postgres.sql
psql "$DB" -f backend/sql/views_postgres.sql
psql "$DB" -c "\dt"     # phải thấy các bảng
```
**📸** RDS Available + endpoint + `\dt`.

---

## Phase 6 — Chạy backend Docker (trỏ RDS) bằng docker-compose.aws.yml
Tạo `.env` trên EC2:
```bash
cat > .env << EOF
DATABASE_URL=postgresql://quickbite:<db-password>@<rds-endpoint>:5432/quickbite
SECRET_KEY=$(openssl rand -hex 32)
CORS_ALLOW_ORIGINS=http://<ec2-public-ip>
AWS_REGION=ap-southeast-1
S3_BUCKET_NAME=quickbite-menu-images-<ban>
# Nếu đi hướng ảnh private + CloudFront:
# MENU_IMAGE_BASE_URL=https://<cloudfront-images-domain>
SHOW_DEMO_ACCOUNTS=false
EOF

docker compose -f docker-compose.aws.yml up --build -d
docker ps
curl http://localhost:8000/health
```
> `docker-compose.aws.yml` **không có service db** và **không depends_on**, nên không bao
> giờ chạy Postgres local. Log tự đẩy lên CloudWatch (`logging: awslogs`).

---

## Phase 7 — Test backend
- `http://<ec2-public-ip>:8000/health` → `{"status":"ok"}`
- `http://<ec2-public-ip>:8000/docs` → Swagger.
- Thử login admin (Admin@123), GET `/menu/`, tạo 1 đơn.
**📸** `/health` + `/docs` từ IP public.

---

## Phase 8 — Test upload ảnh lên S3
- Login admin trên frontend (tạm chạy local trỏ API EC2, hoặc chờ Phase 9), vào **Quản lý món**
  → sửa 1 món → **Upload** ảnh. Kiểm tra object xuất hiện trong bucket dưới `menu/`.
**📸** object `menu/...` trong S3 + ảnh hiển thị.

---

## Phase 9 — Frontend lên S3 + CloudFront
```bash
# ở máy bạn
cd frontend
VITE_API_BASE=http://<ec2-public-ip>:8000 npm ci
VITE_API_BASE=http://<ec2-public-ip>:8000 npm run build
aws s3 mb s3://quickbite-web-<ban> --region ap-southeast-1
aws s3 sync dist/ s3://quickbite-web-<ban> --delete
```
CloudFront → Create distribution → origin = bucket web (OAC) → **Default root object**
`index.html` → **Error pages**: 403 và 404 → `/index.html` code **200** (để refresh link sâu).
Copy domain `dxxxx.cloudfront.net`.

---

## Phase 10 — Cập nhật CORS + xử lý mixed-content
Sửa `.env` trên EC2: `CORS_ALLOW_ORIGINS=https://dxxxx.cloudfront.net`, rồi
`docker compose -f docker-compose.aws.yml up -d`.

⚠️ **Mixed content:** frontend HTTPS (CloudFront) gọi backend HTTP (`http://<ec2>:8000`) sẽ
bị trình duyệt chặn. Ba hướng:

| Hướng | Độ khó | Ghi chú |
|---|---|---|
| Demo backend HTTP EC2 | Dễ | Dễ dính mixed content nếu frontend HTTPS. Chỉ hợp khi test API riêng. |
| **CloudFront reverse-proxy cả API** | Trung bình | **Khuyến nghị demo:** thêm origin thứ 2 = EC2, tạo behavior cho `/auth/*`, `/menu/*`, `/orders/*`, `/payments/*`, `/reports/*`, `/uploads/*`, `/settings/*` trỏ về EC2. Khi đó frontend gọi cùng origin HTTPS → hết mixed content. Nhớ set `VITE_API_BASE=` (rỗng) để gọi tương đối. |
| ALB + ACM cho backend HTTPS | Khó | Chuẩn production nhất. |

Nếu không kịp, ghi rõ trong báo cáo đây là giới hạn demo.
**📸** app trên CloudFront + refresh link sâu OK.

---

## Phase 11 — CloudWatch logs + alarm
- Log group `quickbite/backend` đã tự có (do `docker-compose.aws.yml`). Mở CloudWatch →
  Log groups → xem log chảy về.
- CloudWatch → Alarms → Create → EC2 `CPUUtilization` của `quickbite-app` > **70%** (5 phút)
  → SNS + email. Tên `quickbite-cpu-high`.
**📸** log group + alarm.

---

## Phase 12 — (Tùy chọn) Lambda + SES
Theo `docs/lambda-ses.md` + `lambda/send_order_email.py`. Không kịp thì ghi rõ Mailpit là
mô phỏng local.

---

## Phase 13 — Báo cáo + DỌN DẸP
Checklist bằng chứng: RDS Available + bảng đã nạp · `/health` public · backend đọc/ghi RDS ·
upload ảnh S3 hiển thị lại · frontend từ CloudFront · CORS OK · CloudWatch có log · ≥1 alarm CPU.

Dọn dẹp (theo `docs/cleanup.md`): Disable+Delete CloudFront → xóa S3 (web + images) → terminate
EC2 → delete RDS (`--skip-final-snapshot`) → xóa log group, alarm, SNS, IAM role/policy, key pair, SG.
Hôm sau check **Cost Explorer**.

---

## Bảng lỗi hay gặp
| Triệu chứng | Sửa |
|---|---|
| Nạp schema từ laptop treo/không kết nối | RDS private — nạp **từ EC2** (Phase 5). |
| `up` lại chạy Postgres local | Đang dùng `docker-compose.prod.yml`/`.yml`; đổi sang **`docker-compose.aws.yml`**. |
| Backend log `could not connect to server` | Chưa nối SG EC2→RDS 5432 (Phase 4), hoặc `DATABASE_URL` sai. |
| Frontend lỗi CORS | `CORS_ALLOW_ORIGINS` chưa đúng domain CloudFront; restart backend sau khi sửa `.env`. |
| Gọi API bị chặn mixed content | Dùng CloudFront reverse-proxy cho API (Phase 10). |
| Refresh `/admin/report` lỗi | Chưa set custom error 403/404 → `/index.html` (200). |
| Ảnh upload không hiển thị | Bucket chưa public `menu/*`, hoặc dùng private mà chưa set `MENU_IMAGE_BASE_URL` (CloudFront ảnh). |
