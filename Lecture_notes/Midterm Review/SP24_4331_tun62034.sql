SELECT vendor_id, vendor_state, vendor_contact_last_name
FROM vendors
WHERE vendor_state = 'WI'

UNION

SELECT vendor_id, vendor_state, vendor_contact_last_name
FROM vendors
WHERE vendor_state = 'CA' 
  AND vendor_contact_last_name LIKE '%ren';






SELECT vendors.vendor_contact_first_name  , vendors.vendor_contact_last_name FROM vendors;


| productName | Department |
| Product1    | Department1|
| Product2    | Department2|
| Product3    | Department1|
| Product4    | NULL       |






--Use the tables in AP account in the course database

-- For each vendor whose city name starts with the upper case letter A, print its name, city, and total invoice amount (in terms of money). 
-- Prin all vendors. If a vendor has no invoices, then report the invoice information as null. Use the heading TOTAL_INVOICE_AMOUNT in the result. 
-- Sort the result in the increasing order of the vendors' cities.
-- 21


SELECT v.vendor_name,
       v.vendor_city,
       COALESCE(SUM(i.invoice_total), NULL) AS "TOTAL INVOICE AMOUNT"
FROM vendors v
LEFT JOIN invoices i ON v.vendor_id = i.vendor_id
WHERE v.vendor_city LIKE 'A%'
GROUP BY v.vendor_name, v.vendor_city
ORDER BY v.vendor_city;


-- OR CAN USED THIS IF U HAVENT LEARNED COALESCE

SELECT v.vendor_name,
       v.vendor_city,
       SUM(i.invoice_total) AS TOTAL_INVOICE_AMOUNT
FROM vendors v
LEFT JOIN invoices i ON v.vendor_id = i.vendor_id
WHERE v.vendor_city LIKE 'A%'
GROUP BY v.vendor_name, v.vendor_city
ORDER BY v.vendor_city;


-- For the items in the invoice with id 100, print the descriptions, costs, and general ledger accounts used in the following format. 


SELECT it.invoice_id, it.line_item_description, it.line_item_amt, it.account_number 
FROM invoice_line_items it JOIN invoices i  
ON(it.invoice_id = i.invoice_id)
WHERE it.invoice_id = 100;


SELECT 'Item: '|| it.line_item_description || ', Cost: '|| it.line_item_amt ||', Paid from acounnt: '|| it.account_number
FROM invoice_line_items it JOIN invoices i  
ON(it.invoice_id = i.invoice_id)
WHERE it.invoice_id = 100;




SELECT * FROM invoices;

