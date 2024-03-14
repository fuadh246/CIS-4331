--Week 3, Murach Ch4
--In Class Practice, Questions & Answers

--INNER JOIN, SELF-JOIN

--1.
--Print the vendor name, invoice number, invoice date, and balance due amount
-- for each vendor and each of its invoices that have a non-zero remaining balance.
-- Display the heading for the remaing balance as REMAINING_BALANCE,
-- Sort the query result in the increasing order of remaining balances.

SELECT vendor_name, invoice_number, invoice_date, payment_total REMAINING_BALANCE 
from invoices i inner join vendors v 
on v.vendor_id = i.vendor_id where payment_total != 0;

     



--2.
--Print all vendors' names, their invoices' invoice dates and invoice numbers, and 
--  the sequence numbers and item amounts of all items in their invoices.
-- Sort the result first by vendor name, then by invoice date, then by invoice number,
--    then by invoice sequence number. All sorting are in increasing orders.

SELECT
    V.vendor_name,
    I.invoice_date,
    I.invoice_number,
    IL.invoice_sequence,
    il.line_item_amt
FROM VENDORS V INNER JOIN invoices I ON (V.vendor_id = I.vendor_id) INNER JOIN INVOICE_LINE_ITEMS IL 
ON (I.invoice_id = IL.invoice_id)
ORDER BY invoice_number;

--3.
--Print the vendor ids, vendor names, vendor contact first and last names of vendors that 
--   share the same contact last names as another vendor.
--Print the vendor contact's first and last name in this format:
--    Steve Jobs
--Print the heading for the vendor contact's first and last name as Contact Name.

SELECT v1.vendor_id, v1.vendor_name,v1.vendor_contact_first_name || ' ' || v1.vendor_contact_last_name AS "Contact Name"
FROM  vendors v1 INNER JOIN vendors v2 ON (v1.vendor_contact_last_name = v2.vendor_contact_last_name)
where v1.vendor_id <> v2.vendor_id;
     
     
