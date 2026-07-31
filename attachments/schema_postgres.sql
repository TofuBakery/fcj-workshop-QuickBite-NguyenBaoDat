-- QuickBite PostgreSQL schema for AWS RDS.
-- Example:
--   psql "postgresql://postgres:password@<rds-endpoint>:5432/quickbite" -f sql/schema_postgres.sql

DROP TABLE IF EXISTS order_status_history CASCADE;
DROP TABLE IF EXISTS operation_logs CASCADE;
DROP TABLE IF EXISTS payments CASCADE;
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS items CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS system_config CASCADE;
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    email VARCHAR NOT NULL UNIQUE,
    password_hash VARCHAR NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'customer' CHECK (role IN ('customer', 'admin', 'kitchen_staff', 'delivery_staff'))
);

CREATE INDEX ix_users_email ON users(email);

CREATE TABLE system_config (
    key VARCHAR PRIMARY KEY,
    value VARCHAR NOT NULL,
    description VARCHAR,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE
);

CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    description VARCHAR,
    price NUMERIC(12, 2) NOT NULL CHECK (price >= 0),
    image_url VARCHAR,
    is_available BOOLEAN NOT NULL DEFAULT TRUE,
    category_id INTEGER NOT NULL REFERENCES categories(id) ON DELETE RESTRICT
);

CREATE INDEX ix_items_category_id ON items(category_id);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    order_code VARCHAR UNIQUE,
    lookup_token VARCHAR,
    status VARCHAR(12) NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'confirmed', 'preparing', 'ready', 'completed', 'cancelled')),
    subtotal NUMERIC(12, 2) NOT NULL DEFAULT 0 CHECK (subtotal >= 0),
    delivery_fee NUMERIC(12, 2) NOT NULL DEFAULT 0 CHECK (delivery_fee >= 0),
    tax_amount NUMERIC(12, 2) NOT NULL DEFAULT 0 CHECK (tax_amount >= 0),
    total NUMERIC(12, 2) NOT NULL CHECK (total >= 0),
    note VARCHAR,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX ix_orders_user_id ON orders(user_id);
CREATE INDEX ix_orders_order_code ON orders(order_code);
CREATE INDEX ix_orders_status ON orders(status);
CREATE INDEX ix_orders_created_at ON orders(created_at);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    item_id INTEGER NOT NULL REFERENCES items(id) ON DELETE RESTRICT,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    price NUMERIC(12, 2) NOT NULL CHECK (price >= 0)
);

CREATE TABLE order_status_history (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    old_status VARCHAR,
    new_status VARCHAR NOT NULL,
    changed_by INTEGER REFERENCES users(id) ON DELETE SET NULL,
    note VARCHAR,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX ix_order_items_order_id ON order_items(order_id);
CREATE INDEX ix_order_items_item_id ON order_items(item_id);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL UNIQUE REFERENCES orders(id) ON DELETE CASCADE,
    method VARCHAR(20) NOT NULL DEFAULT 'cod' CHECK (method IN ('cod', 'mock_ewallet')),
    status VARCHAR(12) NOT NULL DEFAULT 'cod' CHECK (status IN ('pending', 'paid', 'failed', 'cancelled', 'cod')),
    amount NUMERIC(12, 2) NOT NULL CHECK (amount >= 0),
    provider_transaction_id VARCHAR,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    paid_at TIMESTAMPTZ
);

CREATE INDEX ix_payments_order_id ON payments(order_id);
CREATE INDEX ix_payments_status ON payments(status);

CREATE TABLE operation_logs (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    actor_email VARCHAR,
    actor_role VARCHAR,
    action VARCHAR NOT NULL,
    target_type VARCHAR NOT NULL,
    target_id VARCHAR,
    detail TEXT,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX ix_operation_logs_user_id ON operation_logs(user_id);
CREATE INDEX ix_operation_logs_created_at ON operation_logs(created_at);
