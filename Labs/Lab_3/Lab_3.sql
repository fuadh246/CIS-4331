-- Lab 3
-- Fuad Hassan

--Q1
select customer_id,
       line1,
       line2,
       city,
       state
  from addresses_mgs
 where line1 like ( '%wood%' )
 order by state,
          city;

--Q2
select first_name,
       last_name,
       email_address
  from customers_mgs
 where first_name like ( '__r%' )
 order by first_name;

--Q3
select pm.product_name,
       pm.list_price,
       cm.category_name
  from products_mgs pm
 inner join categories_mgs cm
on ( pm.category_id = cm.category_id )
 order by cm.category_name,
          pm.product_name;

--Q4
select cm.first_name,
       cm.last_name,
       am.line1,
       am.line2,
       am.city,
       am.state,
       am.zip_code
  from customers_mgs cm
 inner join addresses_mgs am
on ( cm.customer_id = am.customer_id )
 where cm.email_address in ( 'heatheresway@mac.com' );

--Q5
select cm.first_name,
       cm.last_name,
       am.line1,
       am.line2,
       am.city,
       am.state,
       am.zip_code
  from customers_mgs cm
 inner join addresses_mgs am
on ( cm.billing_address_id = am.address_id )
 order by state,
          city;

--Q6
select cm.first_name,
       cm.last_name,
       to_char(
	       om.order_date,'mm/dd/yyyy'
       ) as "ORDER_DATE",
       to_char(
	       om.ship_date,'mm/dd/yyyy'
       ) as "SHIP_DATE"
  from customers_mgs cm
 inner join orders_mgs om
on ( cm.customer_id = om.customer_id );


--Q7 oim.PRODUCT_ID, oim.ITEM_PRICE 
select cm.email_address,
       to_char(
	       om.ship_date,'DD-MON-YY'
       ) as "SHIP_DATE",
       oim.product_id,
       ( item_price * quantity ) - discount_amount actural_price
  from customers_mgs cm
 inner join orders_mgs om
on ( cm.customer_id = om.customer_id )
 inner join order_items_mgs oim
on ( om.order_id = oim.order_id )
 order by cm.email_address,
          om.ship_date desc,
          oim.product_id desc;

--Q8
select distinct pm.product_code,
                pm.product_name,
                pm.discount_percent
  from products_mgs pm
  join products_mgs pm2
on ( pm.discount_percent = pm2.discount_percent
   and pm.product_id != pm2.product_id )
 order by pm.product_code;