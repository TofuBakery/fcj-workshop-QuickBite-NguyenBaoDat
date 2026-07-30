-- QuickBite PostgreSQL seed data for local demo.
-- Passwords:
--   admin@quickbite.com    / Admin@123
--   customer@quickbite.com / Customer@123
-- Extended sample data: 8 categories, 35 menu items, 10 orders.

INSERT INTO users (id, name, email, password_hash, role) VALUES
(1, 'QuickBite Admin', 'admin@quickbite.com', '$2b$12$nD7S0yR0HG3GGzrTOTqYeuUMSnzdNL6eEEwhcsBSoQRvs0XqKZtau', 'admin'),
(2, 'Demo Customer', 'customer@quickbite.com', '$2b$12$bK5lhXaH3vnp/yrH/BRlbOWeYqFS0sNdciXQcj2DaU.R2.c4uecbq', 'customer'),
(3, 'Minh Anh', 'minhanh@quickbite.com', '$2b$12$bK5lhXaH3vnp/yrH/BRlbOWeYqFS0sNdciXQcj2DaU.R2.c4uecbq', 'customer'),
(4, 'Hoang Nam', 'hoangnam@quickbite.com', '$2b$12$bK5lhXaH3vnp/yrH/BRlbOWeYqFS0sNdciXQcj2DaU.R2.c4uecbq', 'customer'),
(5, 'Linh Chi', 'linhchi@quickbite.com', '$2b$12$bK5lhXaH3vnp/yrH/BRlbOWeYqFS0sNdciXQcj2DaU.R2.c4uecbq', 'customer'),
(6, 'Tuan Kiet', 'tuankiet@quickbite.com', '$2b$12$bK5lhXaH3vnp/yrH/BRlbOWeYqFS0sNdciXQcj2DaU.R2.c4uecbq', 'customer'),
(7, 'Bao Tran', 'baotran@quickbite.com', '$2b$12$bK5lhXaH3vnp/yrH/BRlbOWeYqFS0sNdciXQcj2DaU.R2.c4uecbq', 'customer'),
(8, 'Kitchen Staff', 'kitchen@quickbite.com', '$2b$12$bK5lhXaH3vnp/yrH/BRlbOWeYqFS0sNdciXQcj2DaU.R2.c4uecbq', 'kitchen_staff'),
(9, 'Delivery Staff', 'delivery@quickbite.com', '$2b$12$bK5lhXaH3vnp/yrH/BRlbOWeYqFS0sNdciXQcj2DaU.R2.c4uecbq', 'delivery_staff');

INSERT INTO system_config (key, value, description) VALUES
('delivery_fee', '15000', 'Default delivery/service fee in VND.'),
('tax_rate', '0.00', 'VAT/service tax rate. Example: 0.08 means 8%.'),
('min_order_value', '0', 'Minimum subtotal required before checkout.'),
('restaurant_open', 'true', 'Whether QuickBite accepts new orders.'),
('enforce_open_hours', 'false', 'If true, block orders outside the open/close time window.'),
('restaurant_open_time', '07:00', 'Daily opening time, Asia/Ho_Chi_Minh.'),
('restaurant_close_time', '21:30', 'Daily closing time, Asia/Ho_Chi_Minh.'),
('service_area', 'Campus A, Campus B, nearby offices', 'Delivery/pickup service area.');

INSERT INTO categories (id, name) VALUES
(1, 'Rice'),
(2, 'Noodles'),
(3, 'Drinks'),
(4, 'Snacks'),
(5, 'Breakfast'),
(6, 'Vegetarian'),
(7, 'Desserts'),
(8, 'Combos');

INSERT INTO items (id, name, description, price, image_url, is_available, category_id) VALUES
(1, 'Chicken Rice', 'Cơm gà văn phòng, nhiều rau, phù hợp bữa trưa.', 45000, 'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800', TRUE, 1),
(2, 'Beef Noodles', 'Mì bò nóng, có thể dùng nhanh trong giờ nghỉ.', 55000, 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=800', TRUE, 2),
(3, 'Fried Rice', 'Cơm chiên trứng và rau củ, no lâu, giá tốt.', 42000, 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=800', TRUE, 1),
(4, 'Milk Tea', 'Trà sữa size M, ít đường, dùng kèm topping.', 30000, 'https://images.unsplash.com/photo-1558857563-b371033873b8?w=800', TRUE, 3),
(5, 'Spring Rolls', 'Chả giò giòn, phù hợp ăn nhẹ hoặc thêm vào combo.', 35000, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=800', TRUE, 4),
(6, 'Grilled Pork Rice', 'Cơm sườn nướng dùng kèm đồ chua và nước mắm nhẹ.', 52000, 'https://placehold.co/800x600?text=Grilled+Pork+Rice', TRUE, 1),
(7, 'Lemongrass Chicken Rice', 'Cơm gà sả ớt thơm nhẹ, phù hợp bữa trưa văn phòng.', 48000, 'https://placehold.co/800x600?text=Lemongrass+Chicken+Rice', TRUE, 1),
(8, 'Teriyaki Chicken Bowl', 'Cơm gà sốt teriyaki, vị ngọt mặn cân bằng.', 59000, 'https://placehold.co/800x600?text=Teriyaki+Chicken+Bowl', TRUE, 1),
(9, 'Salmon Rice Bowl', 'Cơm cá hồi áp chảo, ăn kèm rau củ và sốt mè.', 79000, 'https://placehold.co/800x600?text=Salmon+Rice+Bowl', TRUE, 1),
(10, 'Braised Pork Rice', 'Cơm thịt kho trứng kiểu Việt, vị đậm đà, no lâu.', 50000, 'https://placehold.co/800x600?text=Braised+Pork+Rice', TRUE, 1),
(11, 'Chicken Pho', 'Phở gà nước dùng thanh, phù hợp bữa sáng hoặc trưa.', 50000, 'https://placehold.co/800x600?text=Chicken+Pho', TRUE, 2),
(12, 'Seafood Udon', 'Mì udon hải sản nóng, có tôm, mực và rau xanh.', 68000, 'https://placehold.co/800x600?text=Seafood+Udon', TRUE, 2),
(13, 'Spicy Ramen', 'Ramen cay cấp độ vừa, có trứng và thịt lát.', 62000, 'https://placehold.co/800x600?text=Spicy+Ramen', TRUE, 2),
(14, 'Wonton Noodles', 'Mì hoành thánh nước dùng nhẹ, dễ ăn trong giờ nghỉ.', 54000, 'https://placehold.co/800x600?text=Wonton+Noodles', TRUE, 2),
(15, 'Vegetarian Vermicelli', 'Bún chay với rau củ, đậu hũ và nước sốt nhẹ.', 43000, 'https://placehold.co/800x600?text=Vegetarian+Vermicelli', TRUE, 2),
(16, 'Lemon Tea', 'Trà chanh mát, ít ngọt, phù hợp uống kèm món chính.', 22000, 'https://placehold.co/800x600?text=Lemon+Tea', TRUE, 3),
(17, 'Vietnamese Coffee', 'Cà phê sữa đá đậm vị, dùng cho buổi sáng hoặc xế chiều.', 25000, 'https://placehold.co/800x600?text=Vietnamese+Coffee', TRUE, 3),
(18, 'Iced Peach Tea', 'Trà đào lạnh, vị trái cây nhẹ và dễ uống.', 28000, 'https://placehold.co/800x600?text=Iced+Peach+Tea', TRUE, 3),
(19, 'Fresh Orange Juice', 'Nước cam tươi, bổ sung vitamin cho bữa ăn nhanh.', 32000, 'https://placehold.co/800x600?text=Fresh+Orange+Juice', TRUE, 3),
(20, 'Bottled Water', 'Nước suối đóng chai dùng kèm mọi combo.', 12000, 'https://placehold.co/800x600?text=Bottled+Water', TRUE, 3),
(21, 'French Fries', 'Khoai tây chiên giòn, phù hợp ăn nhẹ hoặc gọi thêm.', 30000, 'https://placehold.co/800x600?text=French+Fries', TRUE, 4),
(22, 'Fried Chicken Wings', 'Cánh gà chiên giòn, sốt nhẹ, phù hợp nhóm bạn.', 45000, 'https://placehold.co/800x600?text=Fried+Chicken+Wings', TRUE, 4),
(23, 'Cheese Sticks', 'Phô mai que kéo sợi, ăn nhanh trong giờ nghỉ.', 38000, 'https://placehold.co/800x600?text=Cheese+Sticks', TRUE, 4),
(24, 'Dumplings', 'Há cảo hấp mềm, dùng kèm nước tương gừng.', 40000, 'https://placehold.co/800x600?text=Dumplings', TRUE, 4),
(25, 'Garlic Bread', 'Bánh mì bơ tỏi giòn nhẹ, phù hợp ăn kèm soup hoặc mì.', 28000, 'https://placehold.co/800x600?text=Garlic+Bread', TRUE, 4),
(26, 'Banh Mi Omelette', 'Bánh mì trứng ốp la, nhanh gọn cho bữa sáng.', 35000, 'https://placehold.co/800x600?text=Banh+Mi+Omelette', TRUE, 5),
(27, 'Breakfast Sandwich', 'Sandwich trứng, phô mai và rau, phù hợp mang đi.', 42000, 'https://placehold.co/800x600?text=Breakfast+Sandwich', TRUE, 5),
(28, 'Sticky Rice Chicken', 'Xôi gà xé, hành phi và nước sốt nhẹ.', 38000, 'https://placehold.co/800x600?text=Sticky+Rice+Chicken', TRUE, 5),
(29, 'Tofu Rice Bowl', 'Cơm đậu hũ sốt nấm, lựa chọn chay nhiều năng lượng.', 46000, 'https://placehold.co/800x600?text=Tofu+Rice+Bowl', TRUE, 6),
(30, 'Mushroom Fried Noodles', 'Mì xào nấm và rau củ, vị nhẹ, không quá dầu.', 47000, 'https://placehold.co/800x600?text=Mushroom+Fried+Noodles', TRUE, 6),
(31, 'Vegetable Salad', 'Salad rau củ tươi, sốt mè rang, phù hợp bữa ăn nhẹ.', 39000, 'https://placehold.co/800x600?text=Vegetable+Salad', TRUE, 6),
(32, 'Matcha Pudding', 'Pudding matcha mềm, vị ngọt vừa, dùng sau bữa ăn.', 29000, 'https://placehold.co/800x600?text=Matcha+Pudding', TRUE, 7),
(33, 'Chocolate Brownie', 'Brownie chocolate đậm vị, phần nhỏ cho món tráng miệng.', 35000, 'https://placehold.co/800x600?text=Chocolate+Brownie', TRUE, 7),
(34, 'Lunch Combo A', 'Combo cơm gà, nước uống và món ăn nhẹ cho bữa trưa.', 79000, 'https://placehold.co/800x600?text=Lunch+Combo+A', TRUE, 8),
(35, 'Student Combo', 'Combo tiết kiệm gồm món chính và nước uống cho sinh viên.', 69000, 'https://placehold.co/800x600?text=Student+Combo', TRUE, 8);

INSERT INTO orders (id, user_id, order_code, lookup_token, status, subtotal, delivery_fee, tax_amount, total, note, created_at) VALUES
(1, 2, 'QB-20260601-0001', 'A7K9', 'confirmed', 105000, 15000, 0, 120000, 'Demo seeded order', CURRENT_TIMESTAMP - INTERVAL '11 days'),
(2, 2, 'QB-20260602-0002', 'B3M2', 'pending', 76000, 15000, 0, 91000, 'Customer wants less ice for drink', CURRENT_TIMESTAMP - INTERVAL '10 days'),
(3, 3, 'QB-20260603-0003', 'C8P4', 'confirmed', 89000, 15000, 0, 104000, 'Deliver to study room A1', CURRENT_TIMESTAMP - INTERVAL '9 days'),
(4, 4, 'QB-20260604-0004', 'D5Q1', 'preparing', 85000, 15000, 0, 100000, 'Extra napkins please', CURRENT_TIMESTAMP - INTERVAL '7 days'),
(5, 5, 'QB-20260605-0005', 'E9R6', 'ready', 129000, 15000, 0, 144000, 'Pickup at counter 2', CURRENT_TIMESTAMP - INTERVAL '6 days'),
(6, 6, 'QB-20260606-0006', 'F2T7', 'completed', 93000, 15000, 0, 108000, 'Paid by cash', CURRENT_TIMESTAMP - INTERVAL '5 days'),
(7, 7, 'QB-20260607-0007', 'G4W8', 'cancelled', 54000, 15000, 0, 69000, 'Customer cancelled before preparation', CURRENT_TIMESTAMP - INTERVAL '4 days'),
(8, 3, 'QB-20260608-0008', 'H6X3', 'completed', 102000, 15000, 0, 117000, 'Vegetarian lunch order', CURRENT_TIMESTAMP - INTERVAL '3 days'),
(9, 4, 'QB-20260609-0009', 'J1Y5', 'completed', 103000, 15000, 0, 118000, 'Group snack order', CURRENT_TIMESTAMP - INTERVAL '1 days'),
(10, 5, 'QB-20260610-0010', 'K7Z2', 'confirmed', 48000, 15000, 0, 63000, 'Breakfast pickup', CURRENT_TIMESTAMP);

INSERT INTO order_items (id, order_id, item_id, quantity, price) VALUES
(1, 1, 1, 2, 45000),
(2, 1, 4, 1, 30000),
(3, 2, 34, 1, 79000),
(4, 2, 20, 1, 12000),
(5, 3, 7, 1, 48000),
(6, 3, 18, 2, 28000),
(7, 4, 13, 1, 62000),
(8, 4, 23, 1, 38000),
(9, 5, 11, 2, 50000),
(10, 5, 16, 2, 22000),
(11, 6, 9, 1, 79000),
(12, 6, 32, 1, 29000),
(13, 7, 35, 1, 69000),
(14, 8, 29, 1, 46000),
(15, 8, 31, 1, 39000),
(16, 8, 19, 1, 32000),
(17, 9, 22, 2, 45000),
(18, 9, 25, 1, 28000),
(19, 10, 28, 1, 38000),
(20, 10, 17, 1, 25000);


INSERT INTO payments (id, order_id, method, status, amount, provider_transaction_id, paid_at) VALUES
(1, 1, 'cod', 'cod', 120000, NULL, NULL),
(2, 2, 'mock_ewallet', 'pending', 91000, 'MOCK-QB-20260602-0002', NULL),
(3, 3, 'mock_ewallet', 'paid', 104000, 'MOCK-QB-20260603-0003', CURRENT_TIMESTAMP - INTERVAL '9 days'),
(4, 4, 'cod', 'cod', 100000, NULL, NULL),
(5, 5, 'mock_ewallet', 'paid', 144000, 'MOCK-QB-20260605-0005', CURRENT_TIMESTAMP - INTERVAL '6 days'),
(6, 6, 'cod', 'cod', 108000, NULL, NULL),
(7, 7, 'mock_ewallet', 'cancelled', 69000, 'MOCK-QB-20260607-0007', NULL),
(8, 8, 'mock_ewallet', 'paid', 117000, 'MOCK-QB-20260608-0008', CURRENT_TIMESTAMP - INTERVAL '3 days'),
(9, 9, 'cod', 'cod', 118000, NULL, NULL),
(10, 10, 'cod', 'cod', 63000, NULL, NULL);

INSERT INTO operation_logs (id, user_id, actor_email, actor_role, action, target_type, target_id, detail, created_at) VALUES
(1, 1, 'admin@quickbite.com', 'admin', 'seed_database', 'system', 'local-demo', 'Initial demo data created', CURRENT_TIMESTAMP - INTERVAL '11 days'),
(2, 1, 'admin@quickbite.com', 'admin', 'update_setting', 'system_config', 'delivery_fee', 'Configured default local delivery fee', CURRENT_TIMESTAMP - INTERVAL '10 days'),
(3, 8, 'kitchen@quickbite.com', 'kitchen_staff', 'update_order_status', 'order', 'QB-20260604-0004', 'confirmed -> preparing', CURRENT_TIMESTAMP - INTERVAL '7 days');

INSERT INTO order_status_history (order_id, old_status, new_status, changed_by, note, created_at) VALUES
(1, NULL, 'pending', 2, 'Đơn được tạo', CURRENT_TIMESTAMP - INTERVAL '11 days'),
(1, 'pending', 'confirmed', 1, 'Cập nhật trạng thái', CURRENT_TIMESTAMP - INTERVAL '11 days'),
(2, NULL, 'pending', 2, 'Đơn được tạo', CURRENT_TIMESTAMP - INTERVAL '10 days'),
(3, NULL, 'pending', 3, 'Đơn được tạo', CURRENT_TIMESTAMP - INTERVAL '9 days'),
(3, 'pending', 'confirmed', 1, 'Cập nhật trạng thái', CURRENT_TIMESTAMP - INTERVAL '9 days'),
(4, NULL, 'pending', 4, 'Đơn được tạo', CURRENT_TIMESTAMP - INTERVAL '7 days'),
(4, 'pending', 'preparing', 1, 'Cập nhật trạng thái', CURRENT_TIMESTAMP - INTERVAL '7 days'),
(5, NULL, 'pending', 5, 'Đơn được tạo', CURRENT_TIMESTAMP - INTERVAL '6 days'),
(5, 'pending', 'ready', 1, 'Cập nhật trạng thái', CURRENT_TIMESTAMP - INTERVAL '6 days'),
(6, NULL, 'pending', 6, 'Đơn được tạo', CURRENT_TIMESTAMP - INTERVAL '5 days'),
(6, 'pending', 'completed', 1, 'Cập nhật trạng thái', CURRENT_TIMESTAMP - INTERVAL '5 days'),
(7, NULL, 'pending', 7, 'Đơn được tạo', CURRENT_TIMESTAMP - INTERVAL '4 days'),
(7, 'pending', 'cancelled', 1, 'Khách huỷ đơn', CURRENT_TIMESTAMP - INTERVAL '4 days'),
(8, NULL, 'pending', 3, 'Đơn được tạo', CURRENT_TIMESTAMP - INTERVAL '3 days'),
(8, 'pending', 'completed', 1, 'Cập nhật trạng thái', CURRENT_TIMESTAMP - INTERVAL '3 days'),
(9, NULL, 'pending', 4, 'Đơn được tạo', CURRENT_TIMESTAMP - INTERVAL '1 days'),
(9, 'pending', 'completed', 1, 'Cập nhật trạng thái', CURRENT_TIMESTAMP - INTERVAL '1 days'),
(10, NULL, 'pending', 5, 'Đơn được tạo', CURRENT_TIMESTAMP),
(10, 'pending', 'confirmed', 1, 'Cập nhật trạng thái', CURRENT_TIMESTAMP);

SELECT setval(pg_get_serial_sequence('users', 'id'), COALESCE(MAX(id), 1), TRUE) FROM users;
SELECT setval(pg_get_serial_sequence('categories', 'id'), COALESCE(MAX(id), 1), TRUE) FROM categories;
SELECT setval(pg_get_serial_sequence('items', 'id'), COALESCE(MAX(id), 1), TRUE) FROM items;
SELECT setval(pg_get_serial_sequence('orders', 'id'), COALESCE(MAX(id), 1), TRUE) FROM orders;
SELECT setval(pg_get_serial_sequence('order_items', 'id'), COALESCE(MAX(id), 1), TRUE) FROM order_items;
SELECT setval(pg_get_serial_sequence('payments', 'id'), COALESCE(MAX(id), 1), TRUE) FROM payments;
SELECT setval(pg_get_serial_sequence('operation_logs', 'id'), COALESCE(MAX(id), 1), TRUE) FROM operation_logs;
SELECT setval(pg_get_serial_sequence('order_status_history', 'id'), COALESCE(MAX(id), 1), TRUE) FROM order_status_history;
