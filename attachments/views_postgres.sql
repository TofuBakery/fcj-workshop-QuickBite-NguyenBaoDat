-- QuickBite reporting VIEWs (PostgreSQL / AWS RDS).
-- Run after schema + seed:
--   psql "postgresql://postgres:password@<rds-endpoint>:5432/quickbite" -f sql/views_postgres.sql
-- Cancelled orders are excluded from revenue (they were never fulfilled).

DROP VIEW IF EXISTS v_daily_revenue;
DROP VIEW IF EXISTS v_item_sales;
DROP VIEW IF EXISTS v_order_status_counts;

CREATE VIEW v_daily_revenue AS
SELECT created_at::date        AS day,
       COUNT(*)                AS order_count,
       COALESCE(SUM(total), 0) AS revenue
FROM orders
WHERE status <> 'cancelled'
GROUP BY created_at::date;

CREATE VIEW v_item_sales AS
SELECT i.id   AS item_id,
       i.name AS item_name,
       COALESCE(SUM(CASE WHEN o.status <> 'cancelled' THEN oi.quantity END), 0)           AS total_sold,
       COALESCE(SUM(CASE WHEN o.status <> 'cancelled' THEN oi.quantity * oi.price END), 0) AS total_revenue
FROM items i
LEFT JOIN order_items oi ON oi.item_id = i.id
LEFT JOIN orders o       ON o.id = oi.order_id
GROUP BY i.id, i.name;

CREATE VIEW v_order_status_counts AS
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status;
