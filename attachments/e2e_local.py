"""Local end-to-end smoke test for QuickBite.

Run after installing requirements:
    python scripts/e2e_local.py

This test initializes quickbite.db from raw SQL files first:
    sql/schema_sqlite.sql
    sql/seed_sqlite.sql
"""

from pathlib import Path
import sys

PROJECT_ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(PROJECT_ROOT))

from fastapi.testclient import TestClient  # noqa: E402
from scripts.init_db_sqlite import main as init_db_from_sql  # noqa: E402


def auth_headers(client: TestClient, email: str, password: str) -> dict:
    response = client.post("/auth/login", json={"email": email, "password": password})
    assert response.status_code == 200, response.text
    token = response.json()["access_token"]
    return {"Authorization": f"Bearer {token}"}


def run():
    init_db_from_sql()

    from main import app  # noqa: E402

    client = TestClient(app)

    root = client.get("/")
    assert root.status_code == 200

    admin_headers = auth_headers(client, "admin@quickbite.com", "Admin@123")
    customer_headers = auth_headers(client, "customer@quickbite.com", "Customer@123")
    kitchen_headers = auth_headers(client, "kitchen@quickbite.com", "Customer@123")

    me = client.get("/auth/me", headers=customer_headers)
    assert me.status_code == 200
    assert me.json()["role"] == "customer"

    menu = client.get("/menu/")
    assert menu.status_code == 200
    menu_items = menu.json()
    assert len(menu_items) >= 1

    first_item_id = menu_items[0]["id"]
    order = client.post(
        "/orders/",
        json={"items": [{"item_id": first_item_id, "quantity": 2}], "note": "E2E local test", "payment_method": "mock_ewallet"},
        headers=customer_headers,
    )
    assert order.status_code == 201, order.text
    order_data = order.json()
    order_id = order_data["id"]
    order_code = order_data["order_code"]
    assert order_code.startswith("QB-")
    assert order_data["payment"]["status"] == "pending"
    # breakdown persisted (cluster A) and lookup token issued (cluster B)
    assert order_data["subtotal"] + order_data["delivery_fee"] + order_data["tax_amount"] == order_data["total"]
    lookup_token = order_data["lookup_token"]
    assert lookup_token
    # creation history recorded (cluster D)
    assert any(h["new_status"] == "pending" for h in order_data["status_history"])

    # public lookup now requires the token
    assert client.get(f"/orders/lookup/{order_code}").status_code == 422
    assert client.get(f"/orders/lookup/{order_code}", params={"token": "wrong"}).status_code == 404
    lookup = client.get(f"/orders/lookup/{order_code}", params={"token": lookup_token})
    assert lookup.status_code == 200
    assert lookup.json()["id"] == order_id

    my_orders = client.get("/orders/my", headers=customer_headers)
    assert my_orders.status_code == 200
    assert any(item["id"] == order_id for item in my_orders.json())

    admin_orders = client.get("/orders/admin/all", headers=admin_headers)
    assert admin_orders.status_code == 200
    assert any(item["id"] == order_id for item in admin_orders.json())

    settings = client.get("/settings/public")
    assert settings.status_code == 200
    assert any(row["key"] == "delivery_fee" for row in settings.json())

    staff_queue = client.get("/orders/staff/queue", headers=kitchen_headers)
    assert staff_queue.status_code == 200

    export_orders = client.get("/reports/export?type=orders", headers=admin_headers)
    assert export_orders.status_code == 200
    assert "order_code" in export_orders.text

    dashboard = client.get("/orders/admin/dashboard", headers=admin_headers)
    assert dashboard.status_code == 200
    assert dashboard.json()["total_orders"] >= 1

    updated = client.patch(
        f"/orders/{order_id}/status",
        json={"status": "preparing"},
        headers=admin_headers,
    )
    assert updated.status_code == 200, updated.text
    assert updated.json()["status"] == "preparing"

    logs = client.get("/logs/admin", headers=admin_headers)
    assert logs.status_code == 200

    print("E2E local test passed.")


if __name__ == "__main__":
    run()
