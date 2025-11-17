-- Optimization 1: Improve range filter on products.price
-- Target query (from Del 1): products with price > 5000

-- BEFORE: measure current plan/cost
EXPLAIN ANALYZE
SELECT id, name, price
FROM products
WHERE price > 5000
ORDER BY price DESC;

-- Create supporting index on price (helps range scans and ordering)
CREATE INDEX IF NOT EXISTS idx_products_price
ON products(price);

-- AFTER: measure again to verify improvement
EXPLAIN ANALYZE
SELECT id, name, price
FROM products
WHERE price > 5000
ORDER BY price DESC;


-- Optimization 2: Improve join between orders and customers
-- Target query (from Del 1): show orders with customer name and total amount

-- BEFORE: check current execution plan
EXPLAIN ANALYZE
SELECT o.id, o.order_date, o.total_amount, c.first_name, c.last_name
FROM orders o
JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_date DESC;

-- Create index on orders.customer_id to speed up the join
CREATE INDEX IF NOT EXISTS idx_orders_customer_id
ON orders(customer_id);

-- AFTER: check the improved plan
EXPLAIN ANALYZE
SELECT o.id, o.order_date, o.total_amount, c.first_name, c.last_name
FROM orders o
JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_date DESC;
