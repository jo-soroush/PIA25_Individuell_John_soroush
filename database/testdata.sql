-- Insert data into Brands
INSERT INTO brands (name, country, founded_year, description)
VALUES
('Apple', 'USA', 1976, 'Leading manufacturer of consumer electronics and software'),
('Samsung', 'South Korea', 1938, 'Global leader in smartphones, TVs, and semiconductors'),
('Sony', 'Japan', 1946, 'Renowned for electronics, gaming, and entertainment products');

-- Insert data into Products
INSERT INTO products (name, brand_id, sku, release_year, price, warranty_months, category, stock_quantity)
VALUES
('iPhone 15 Pro', 1, 'APL-IP15P', 2023, 14999.00, 24, 'Smartphones', 50),
('MacBook Air M3', 1, 'APL-MBA-M3', 2024, 18999.00, 24, 'Laptops', 30),
('Galaxy S24 Ultra', 2, 'SMS-S24U', 2024, 13999.00, 24, 'Smartphones', 40),
('Galaxy Tab S9', 2, 'SMS-TABS9', 2023, 9999.00, 24, 'Tablets', 25),
('Bravia OLED TV', 3, 'SNY-TV-OLED', 2023, 17999.00, 36, 'Televisions', 20),
('PlayStation 5', 3, 'SNY-PS5', 2020, 5999.00, 24, 'Gaming Consoles', 15),
('AirPods Pro 2', 1, 'APL-APP2', 2022, 2999.00, 12, 'Accessories', 80),
('Galaxy Watch 6', 2, 'SMS-WT6', 2023, 3499.00, 12, 'Wearables', 35),
('Sony WH-1000XM5', 3, 'SNY-WHXM5', 2022, 3999.00, 12, 'Headphones', 45),
('iPad Pro 12.9', 1, 'APL-IPADP12', 2023, 12999.00, 24, 'Tablets', 25);

-- Insert data into Customers
INSERT INTO customers (first_name, last_name, email, phone, city)
VALUES
('Emma', 'Johansson', 'emma.j@example.com', '0701234567', 'Stockholm'),
('Liam', 'Andersson', 'liam.a@example.com', '0739876543', 'Göteborg'),
('Olivia', 'Karlsson', 'olivia.k@example.com', '0727654321', 'Malmö'),
('Noah', 'Nilsson', 'noah.n@example.com', '0765432198', 'Uppsala'),
('Ella', 'Larsson', 'ella.l@example.com', '0709988776', 'Västerås');

-- Insert data into Orders
INSERT INTO orders (customer_id, order_date, total_amount, status, shipping_city)
VALUES
(1, '2024-02-15', 14999.00, 'completed', 'Stockholm'),
(2, '2024-03-10', 9999.00, 'completed', 'Göteborg'),
(3, '2024-05-25', 18999.00, 'pending', 'Malmö'),
(4, '2023-12-01', 5999.00, 'completed', 'Uppsala'),
(5, '2024-06-18', 3499.00, 'cancelled', 'Västerås'),
(1, '2024-07-07', 3999.00, 'completed', 'Stockholm'),
(2, '2024-08-02', 17999.00, 'pending', 'Göteborg'),
(3, '2024-09-14', 12999.00, 'completed', 'Malmö'),
(4, '2024-10-09', 2999.00, 'completed', 'Uppsala'),
(5, '2024-11-01', 14999.00, 'pending', 'Västerås');

-- Insert data into Orders
INSERT INTO orders (customer_id, order_date, total_amount, status, shipping_city)
VALUES
(1, '2024-02-15', 14999.00, 'completed', 'Stockholm'),
(2, '2024-03-10', 9999.00, 'completed', 'Göteborg'),
(3, '2024-05-25', 18999.00, 'pending', 'Malmö'),
(4, '2023-12-01', 5999.00, 'completed', 'Uppsala'),
(5, '2024-06-18', 3499.00, 'cancelled', 'Västerås'),
(1, '2024-07-07', 3999.00, 'completed', 'Stockholm'),
(2, '2024-08-02', 17999.00, 'pending', 'Göteborg'),
(3, '2024-09-14', 12999.00, 'completed', 'Malmö'),
(4, '2024-10-09', 2999.00, 'completed', 'Uppsala'),
(5, '2024-11-01', 14999.00, 'pending', 'Västerås');

-- Insert data into Order_Items
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 14999.00),
(2, 2, 1, 9999.00),
(3, 3, 2, 9499.50),
(4, 4, 1, 5999.00),
(5, 5, 1, 3499.00),
(6, 6, 1, 3999.00),
(7, 7, 1, 17999.00),
(8, 8, 1, 12999.00),
(9, 9, 2, 1499.50),
(10, 10, 1, 14999.00);

-- Insert data into Reviews
INSERT INTO reviews (product_id, customer_id, rating, comment)
VALUES
(1, 1, 5, 'Fantastisk telefon! Mycket snabb.'),
(2, 2, 4, 'Bra laptop men batteritiden kunde vara bättre.'),
(3, 3, 5, 'Utrolig surfplatta! Perfekt för barn.'),
(4, 4, 3, 'Bra kamera men för dyr.'),
(5, 5, 4, 'Prisvärt och lättanvänt.'),
(6, 1, 5, 'Perfekt! Jag älskar det här headsetet.'),
(7, 2, 2, 'Inte värt priset.'),
(8, 3, 5, 'Bästa tangentbordet jag haft.'),
(9, 4, 4, 'Bra produkt, snabb leverans.'),
(10, 5, 5, 'Fantastisk skärm! Rekommenderas starkt.');
