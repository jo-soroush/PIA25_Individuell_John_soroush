-- 1. Hämta alla produkter sorterade efter namn
SELECT * FROM products
ORDER BY name ASC;

-- 2. Hämta alla produkter som kostar mer än 5000 kr
SELECT * FROM products
WHERE price > 5000
ORDER BY price DESC;

-- 3. Hämta alla beställningar från 2024
SELECT * FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2024
ORDER BY order_date;

-- 4. Hämta alla beställningar med status 'pending'
SELECT * FROM orders
WHERE status = 'pending'
ORDER BY order_date DESC;

-- 5. Visa alla produkter med deras tillverkares namn
SELECT p.name AS product_name, b.name AS brand_name
FROM products p
JOIN brands b ON p.brand_id = b.id
ORDER BY b.name, p.name;

-- 6. Visa alla beställningar med kundens namn och totalt belopp
SELECT o.id AS order_id,
       c.first_name || ' ' || c.last_name AS customer_name,
       o.total_amount,
       o.status
FROM orders o
JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_date DESC;

-- 7. Visa vilka produkter varje kund har köpt
SELECT c.first_name || ' ' || c.last_name AS customer_name,
       p.name AS product_name,
       oi.quantity,
       oi.unit_price
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
ORDER BY customer_name, product_name;

-- 8. Räkna antal produkter per tillverkare
SELECT b.name AS brand_name,
       COUNT(p.id) AS product_count
FROM brands b
LEFT JOIN products p ON b.id = p.brand_id
GROUP BY b.name
ORDER BY product_count DESC;

-- 9. Hitta kunder som har spenderat mest totalt
SELECT c.first_name || ' ' || c.last_name AS customer_name,
       SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY customer_name
ORDER BY total_spent DESC;

-- 10. Visa produkter med genomsnittligt betyg från recensioner
SELECT p.name AS product_name,
       ROUND(AVG(r.rating), 2) AS average_rating
FROM products p
JOIN reviews r ON p.id = r.product_id
GROUP BY p.name
ORDER BY average_rating DESC;
