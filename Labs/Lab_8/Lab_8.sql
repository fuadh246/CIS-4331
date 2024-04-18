-- Lab 8 
-- Fuad Hassan
-- Q1
INSERT INTO categories_mgs VALUES (5,'Percussion');
COMMIT;

-- Q2
UPDATE categories_mgs SET category_name='String' WHERE category_id=5;

-- Q3
DELETE categories_mgs WHERE category_name='String';

-- Q4
INSERT INTO products_mgs (product_id, category_id, product_code, product_name,description, list_price, discount_percent, date_added)
VALUES (11,4,'YDP162R','Yamaha Arius YDP162R Traditional Console Style Digital Piano','The best keyboard on the market. 
Offers excellent sound rendering that truly separates 
it from the rest of the pack.',1599.99,10,SYSDATE);

-- Q5
DELETE products_mgs WHERE category_id=4;

DELETE categories_mgs WHERE category_id =4;

rollback;

-- Q6
INSERT INTO customers_mgs (customer_id, email_address, password, first_name, last_name)
VALUES (9,'john@yahoo.com','funny','John','Oliver');

-- Q7
UPDATE customers_mgs SET password = 'hello';

-- Q8
UPDATE customers_mgs SET password='excellent'
WHERE customer_id IN 
(SELECT DISTINCT a.customer_id
FROM orders_mgs a
GROUP BY a.customer_id HAVING
COUNT(*)>1);

-- Q9
rollback;


-- Q11
DROP TABLE Event;
DROP TABLE Menu;

CREATE TABLE Menu (
menu_id INT PRIMARY KEY,
menu_description VARCHAR(1000) NOT NULL,
menu_type VARCHAR(50) NOT NULL
);


CREATE TABLE Event (
event_id INT PRIMARY KEY,
event_date DATE,
location VARCHAR(100),
    menu_id INT,
FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);

-- Q12






-- Q13

CREATE INDEX event_date_ix 
ON event(event_date);

-- Q14
CREATE SEQUENCE menu_id_seq;

--Q15
INSERT INTO Menu (menu_id, description, type)
VALUES (NEXTVAL('menu_id_seq'), 'Menu 1 for vegetarians', 'Vegetarian');