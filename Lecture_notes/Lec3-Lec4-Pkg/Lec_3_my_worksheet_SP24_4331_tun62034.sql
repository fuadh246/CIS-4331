SELECT invoice_id, invoice_date, invoice_total FROM invoices ORDER BY invoice_total DESC;


SELECT invoice_id, invoice_total,
(credit_total + payment_total) AS total_credits
FROM invoices
WHERE invoice_id = 17;


SELECT invoice_number, invoice_date, invoice_total
FROM invoices
WHERE invoice_date BETWEEN '01-MAY-2014' AND '31-MAY-2014'
ORDER BY invoice_date;


SELECT invoice_number, invoice_date, invoice_total
FROM invoices
WHERE invoice_total > 5000;


SELECT invoice_number, invoice_total - payment_total - credit_total 
AS balance_due FROM invoices;


-- A string expression that derives full_name
SELECT first_name || ' '|| last_name AS full_name FROM employees;

-- Two SELECT statements that name the columns 
-- A SELECT statement that uses the AS keyword

SELECT invoice_number AS "Invoice Number",
invoice_date AS "Date",
invoice_total AS "Total"
FROM invoices;

-- A SELECT statement that omits the AS keyword
SELECT invoice_number "Invoice Number",
invoice_date "Date",
invoice_total "Total"
FROM invoices;

-- How to concatenate string data
SELECT vendor_name || ' from ' || vendor_city FROM vendors;

SELECT vendor_city,vendor_state, vendor_city|| ', ' || vendor_state FROM vendors;

-- How to format string data using literal values
SELECT vendor_name, 
vendor_city || ', ' || vendor_state || ' ' || vendor_zip_code as address FROM vendors;


--  A SELECT statement that uses SUBSTR
SELECT vendor_contact_first_name, vendor_contact_last_name,
SUBSTR(vendor_contact_first_name, 1,1) ||
SUBSTR(vendor_contact_last_name, 1,1) AS inistials
FROM vendors;


-- A SELECT statement that uses TO_CHAR
SELECT 'Invoice #' 
|| invoice_number 
|| ', dated ' 
|| TO_CHAR(payment_date,'MM/DD/YYYY') 
|| ' for $' 
|| TO_CHAR(payment_total) 
AS "Invoice Text" 
FROM invoices;


-- A SELECT statement that uses the SYSDATE and ROUND functions
SELECT invoice_date,
SYSDATE AS today,
ROUND(SYSDATE - invoice_date) AS invoice_age_in_days
FROM invoices;


-- A SELECT statement that uses the MOD function
SELECT invoice_id,
MOD(invoice_id, 10) AS Remainder
FROM invoices
ORDER BY invoice_id;


-- A SELECT statement that uses the Dual table
SELECT 'test' AS test_string,
10-7 AS test_calculation,
SYSDATE AS test_date
FROM dual;


--6. DISTINCT/ALL

--ALL keyword: all values including duplicates
SELECT ALL vendor_city
FROM vendors
ORDER BY vendor_city;

--default: same as ALL
SELECT vendor_city
FROM vendors
ORDER BY vendor_city;

--only unique values
SELECT DISTINCT vendor_city
FROM vendors
ORDER BY vendor_city;

SELECT vendor_city, vendor_state
FROM vendors
ORDER BY vendor_city;

--unique pairs
SELECT DISTINCT vendor_city, vendor_state
FROM vendors
ORDER BY vendor_city;


SELECT vendor_city, vendor_state, vendor_zip_code
FROM vendors
ORDER BY vendor_city;

--unique 3-value combos
SELECT DISTINCT vendor_city, vendor_state, vendor_zip_code
FROM vendors
ORDER BY vendor_city;

