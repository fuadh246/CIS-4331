SELECT * FROM vendors;

SELECT first_name, last_name FROM employees;

SELECT first_name, last_name FROM employees WHERE department_number = 2;

SELECT * FROM invoices;

SELECT invoice_number, invoice_date, invoice_total, invoice_total - payment_total - credit_total
AS balance_due
FROM invoices;

SELECT invoice_number, invoice_date, invoice_total, balance_due
FROM (
    SELECT 
        invoice_number, 
        invoice_date, 
        invoice_total, 
        invoice_total - payment_total - credit_total AS balance_due
    FROM invoices
) subquery
WHERE balance_due != 0;


SELECT invoice_number, invoice_date, invoice_total, invoice_total - payment_total - credit_total
AS balance_due
FROM invoices WHERE invoice_total - payment_total - credit_total>0 ORDER BY balance_due DESC;

SELECT VENDOR_NAME, VENDOR_STATE, vendor_city FROM vendors;

SELECT VENDOR_NAME, VENDOR_STATE, vendor_city FROM vendors ORDER BY vendor_state ASC, VENDOR_CITY DESC;


SELECT  invoice_number "Invoice Number"
FROM  invoices;


