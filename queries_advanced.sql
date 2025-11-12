-- Subquery 1: Find all customers who have placed more than 5 orders
SELECT id, name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products)
ORDER BY price DESC;

-- Subquery 2:
SELECT c.id, c.first_name, c.last_name, COUNT(o.id) AS order_count
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.first_name, c.last_name
HAVING COUNT(o.id) > (
    SELECT AVG(order_per_customer)
    FROM (
        SELECT COUNT(*) AS order_per_customer
        FROM orders
        GROUP BY customer_id
    ) AS sub
)
ORDER BY order_count DESC;

-- Window 1: Rank products per brand by price (highest first)
SELECT
    b.name  AS brand_name,
    p.name  AS product_name,
    p.price,
    ROW_NUMBER() OVER (
        PARTITION BY b.id
        ORDER BY p.price DESC
    ) AS price_rank_within_brand
FROM products p
JOIN brands b ON p.brand_id = b.id
ORDER BY b.name, price_rank_within_brand;

-- Window 2: Show each customer's total spending and their rank among all customers
SELECT
    c.id AS customer_id,
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spending,
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS spending_rank
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY spending_rank;

-- CASE 1: Categorize products by price
-- Budget (<1000), Medium (1000-5000), Premium (>5000)
SELECT
    id,
    name,
    price,
    CASE
        WHEN price < 1000 THEN 'Budget'
        WHEN price BETWEEN 1000 AND 5000 THEN 'Medium'
        ELSE 'Premium'
    END AS price_category
FROM products
ORDER BY price DESC;


-- CASE 2: Categorize customers by number of orders
-- VIP (>3 orders), Regular (2–3 orders), New (1 order)
SELECT
    c.id AS customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.id) AS order_count,
    CASE
        WHEN COUNT(o.id) > 3 THEN 'VIP'
        WHEN COUNT(o.id) BETWEEN 2 AND 3 THEN 'Regular'
        ELSE 'New'
    END AS customer_category
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY order_count DESC;

