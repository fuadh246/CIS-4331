--Lab 5
-- Fuad Hassan
--Q1
SELECT COUNT(*) order_count , 
SUM(tax_amount) Total_tax 
FROM  orders_mgs;

--Q2

SELECT COUNT(*) VISA_ORDER_COUNT, 
SUM(tax_amount) VISA_TOTAL_TAX 
FROM orders_mgs GROUP BY CARD_TYPE HAVING card_type IN 'Visa';

--Q3
SELECT card_type, 
count(*) CARD_ORDER_COUNT, 
SUM(tax_amount) CARD_TOTAL_TAX 
FROM orders_mgs GROUP BY CARD_TYPE;

--Q4
SELECT c.category_name, 
count(*) PRODUCT_COUNT, 
MAX(p.list_price) HIGHEST_LISTING_PRICE, 
MIN(list_price) LOWEST_LISTING_PRICE
FROM categories_mgs c JOIN products_mgs p ON (c.category_id = p.category_id)
GROUP BY c.category_name;

--Q5
SELECT c.category_name, 
count(*) PRODUCT_COUNT_OVER$400, 
MAX(p.list_price) HIGHEST_LISTING_PRICE_OVER$400, 
MIN(list_price) LOWEST_LISTING_PRICE_OVER$400
FROM categories_mgs c JOIN products_mgs p ON (c.category_id = p.category_id) 
WHERE p.list_price>400
GROUP BY c.category_name;

--Q6
SELECT card_type, 
count(*) HOT_CARD_ORDER_COUNT, 
SUM(tax_amount) HOT_CARD_TOTAL_TAX 
FROM orders_mgs GROUP BY CARD_TYPE HAVING count(*)>2;

--Q7
SELECT c.category_name, 
count(*) HOT_CAT_PRODUCT_COUNT, 
MAX(p.list_price) HOT_CAT_HIGHEST_LISTING_PRICE, 
MIN(list_price) HOT_CAT_LOWEST_LISTING_PRICE
FROM categories_mgs c JOIN products_mgs p ON (c.category_id = p.category_id)
GROUP BY c.category_name HAVING count(*)>3;

--Q8
SELECT card_type, 
count(*) HOT_CARD_ORDER_COUNT, 
SUM(tax_amount) HOT_CARD_TOTAL_TAX 
FROM orders_mgs WHERE order_date>'30-MAR-2012' 
GROUP BY CARD_TYPE HAVING COUNT(*)>2;