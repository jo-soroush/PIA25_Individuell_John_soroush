REPORT – Database Optimization and Design
1. Database Design

The database contains six main tables: brands, products, customers, orders, order_items, and reviews.
Each table uses proper primary keys and foreign keys with ON DELETE CASCADE where logical.
Data integrity is protected with CHECK constraints:

price and unit_price > 0

quantity > 0

stock_quantity ≥ 0

rating between 1 and 5

Foreign keys have indexes to improve join performance.

2. Indexes and Optimization
Index 1: idx_products_price

Used to speed up range queries on product prices.

CREATE INDEX idx_products_price ON products(price);


Effect:
EXPLAIN ANALYZE showed reduced cost and faster filtering when using price > 5000.

Index 2: idx_orders_customer_id

Used to optimize joins between orders and customers.

CREATE INDEX idx_orders_customer_id ON orders(customer_id);


Effect:
Join performance improved; sequential scans were replaced by index scans.

3. Summary

Both indexes improved query performance measurably.
The schema design ensures data integrity and good normalization.
All advanced queries from Del 2 run efficiently after these optimizations.