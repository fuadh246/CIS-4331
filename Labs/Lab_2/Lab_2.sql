-- Lab 2 
-- Fuad Hassan 


-- Q1
SELECT product_id, product_name, discount_percent
FROM products_mgs 
ORDER BY discount_percent, product_id;

-- Q2
SELECT last_name || ', ' || first_name  AS "Customer Name" 
FROM customers_mgs
where last_name >= 'B' and last_name <='T'
Order by last_name DESC;

-- Q3
SELECT product_code, discount_percent, date_added 
FROM products_mgs
WHERE 20<=discount_percent AND discount_percent<=30
ORDER BY date_added DESC;

-- Q4
SELECT product_name || ' was ' || list_price || ', now is ' || (list_price-(list_price*(discount_percent/100))) 
FROM products_mgs 
WHERE rownum<=3 
ORDER BY (list_price-(list_price*(discount_percent/100))) DESC;

-- Q5
SELECT item_id, item_price,discount_amount, item_price*quantity TOTAL_PRICE_BEFORE_DISCOUNT, discount_amount*quantity TOTAL_DISCOUNT_AMOUNT
FROM order_items_mgs 
WHERE  discount_amount*quantity > 600;

-- Q6
SELECT order_id, customer_id, order_date, ship_amount 
FROM orders_mgs 
WHERE ship_date IS NULL;

-- Q7
SELECT 'Hello! Today is ' || TO_CHAR(SYSDATE,'Mon-dd-yyyy') AS GREETING 
FROM dual;

-- Q8
SELECT 
799.99 PRICE_BEFORE_TAX, 
0.08 TAX_RATE, 
799.99*0.08 TAX_AMOUNT, 
799.99+(799.99*0.08) PRICE_AFTER_TAX 
FROM dual;

-- Q9
SELECT DISTINCT product_id, item_price, discount_amount 
FROM order_items_mgs 
ORDER BY item_price DESC;