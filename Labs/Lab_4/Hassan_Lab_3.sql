--Lab 4
--Fuad Hassan

-- Q1
SELECT category_id,category_name,product_id,product_name 
FROM categories_mgs JOIN products_mgs 
USING (category_id) 
ORDER BY category_id, product_id;

-- Q2
SELECT category_id,category_name,product_id,product_name 
FROM categories_mgs LEFT OUTER JOIN products_mgs 
USING (category_id) 
ORDER BY category_id, product_id;
-- Q3
-- SELECT  category_id,category_name FROM categories_mgs LEFT OUTER JOIN products_mgs USING (category_id) WHERE products_mgs.category_id IS NULL;

SELECT categories_mgs.category_id, categories_mgs.category_name 
FROM categories_mgs 
LEFT OUTER JOIN products_mgs ON categories_mgs.category_id = products_mgs.category_id
WHERE products_mgs.category_id IS NULL;

-- Q4
SELECT c.customer_id,c.first_name, c.last_name 
FROM customers_mgs c
WHERE c.email_address LIKE '%@gmail.com'
INTERSECT
SELECT a.CUSTOMER_ID, a.first_name,
a.last_name FROM customers_mgs a JOIN
orders_mgs b ON a.CUSTOMER_ID=b.CUSTOMER_ID
WHERE b.ship_address_id = b.billing_address_id
ORDER BY customer_id ASC;

-- Q5
SELECT c.customer_id,c.first_name, c.last_name 
FROM customers_mgs c
WHERE c.email_address NOT LIKE '%@gmail.com'
INTERSECT
SELECT a.CUSTOMER_ID, a.first_name,
a.last_name FROM customers_mgs a JOIN
orders_mgs b ON a.CUSTOMER_ID=b.CUSTOMER_ID
WHERE b.ship_address_id = b.billing_address_id
ORDER BY customer_id ASC;

-- Q6
SELECT c.customer_id,c.first_name, c.last_name 
FROM customers_mgs c
WHERE c.email_address LIKE '%@gmail.com'
UNION
SELECT a.CUSTOMER_ID, a.first_name,
a.last_name FROM customers_mgs a JOIN
orders_mgs b ON a.CUSTOMER_ID=b.CUSTOMER_ID
WHERE b.ship_address_id = b.billing_address_id
ORDER BY customer_id ASC;

-- Q7
SELECT o.order_id, o.customer_id, 'Shipped' as ship_status, o.order_date
FROM orders_mgs o
WHERE o.ship_date IS NOT NULL
UNION
SELECT o.order_id, o.customer_id, 'Not shipped' as ship_status, o.order_date
FROM orders_mgs o
WHERE o.ship_date IS NULL;