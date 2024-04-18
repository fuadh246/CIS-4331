--Lab6
-- Fuad Hassan

--Q1
SELECT DISTINCT category_name
FROM categories_mgs cm WHERE
cm.category_id IN
(SELECT pm.category_id FROM products_mgs pm) -- subquery
ORDER BY category_name;

--Q2
SELECT pm.product_name,
(pm.list_price * (1 - pm.discount_percent/100)) AS "ACTUAL_PRICE"
FROM products_mgs pm
WHERE (pm.list_price * (1 - pm.discount_percent/100)) > 
(SELECT AVG((pm.list_price * (1 - pm.discount_percent/100))) FROM products_mgs pm) -- subquery
ORDER BY(pm.list_price * (1 - pm.discount_percent/100)) DESC;

--Q3
SELECT * FROM categories_mgs cm -- we dont need to metion the col name beacuse id and name. which are the only 2 exist
WHERE cm.category_id NOT IN (SELECT DISTINCT pm.category_id FROM products_mgs pm);

--Q4
SELECT * FROM (SELECT pm.product_id, pm.product_code, pm.product_name,
(pm.list_price * (1 - pm.discount_percent/100)) AS "ACTUAL_PRICE"
FROM products_mgs pm 
WHERE ROWNUM<=3
ORDER BY (pm.list_price * (1 - pm.discount_percent/100)) DESC);

SELECT sub.product_id, sub.product_code, sub.product_name, sub.ACTUAL_PRICE FROM 
(SELECT pm.product_id, pm.product_code, pm.product_name,
(pm.list_price * (1 - pm.discount_percent/100)) AS ACTUAL_PRICE,
ROW_NUMBER() OVER (ORDER BY (pm.list_price * (1 - pm.discount_percent/100)) DESC) AS rn
FROM products_mgs pm) sub
WHERE sub.rn <= 3;

--Q5

SELECT * FROM (SELECT a.product_id, a.product_code, a.product_name, 
b.category_name, (a.list_price*((100 - a.discount_percent)/100)) ACTUAL_PRICE
FROM products_mgs a INNER JOIN categories_mgs b 
ON a.category_id=b.category_id
WHERE rownum<=3
ORDER BY (a.list_price*((100 - a.discount_percent)/100)) DESC);

SELECT sub.product_id, sub.product_code, sub.product_name,sub.category_name, sub.ACTUAL_PRICE FROM 
(SELECT pm.product_id, pm.product_code, pm.product_name,cm.category_name,
(pm.list_price * (1 - pm.discount_percent/100)) AS ACTUAL_PRICE,
ROW_NUMBER() OVER (ORDER BY (pm.list_price * (1 - pm.discount_percent/100)) DESC) AS rn
FROM products_mgs pm INNER JOIN categories_mgs cm ON (cm.category_id=pm.category_id)) sub
WHERE sub.rn <= 3;

--Q6
SELECT * FROM 
(SELECT pm.category_id, COUNT(*) Product_count FROM
products_mgs pm GROUP BY pm.category_id
ORDER BY COUNT(*) DESC, pm.category_id ASC);


--Q7
SELECT pm.product_name, pm.discount_percent FROM products_mgs pm
WHERE pm.discount_percent IN (
SELECT sub.discount_percent
FROM products_mgs sub GROUP BY sub.discount_percent
HAVING COUNT(*)=1)
ORDER BY pm.product_name ASC;

--Q8
-- a.
SELECT cm.email_address, om.order_id, SUM(om2.item_price-om2.discount_amount) ORDER_TOTAL
FROM customers_mgs cm JOIN
orders_mgs om ON 
(cm.customer_id=om.customer_id)JOIN
order_items_mgs om2 ON (om.order_id=om2.order_id)
GROUP BY cm.email_address, om.order_id;

-- b
SELECT email_address, MAX(ORDER_TOTAL) AS MAX_ORDER_TOTAL
FROM (SELECT cm.email_address, om.order_id, SUM(om2.item_price-om2.discount_amount) AS ORDER_TOTAL
FROM customers_mgs cm JOIN orders_mgs om ON cm.customer_id=om.customer_id
JOIN order_items_mgs om2 ON om.order_id=om2.order_id
GROUP BY cm.email_address, om.order_id
) sub GROUP BY email_address ORDER BY email_address;