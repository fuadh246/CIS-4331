select vendor_name,
       invoice_number,
       invoice_total
  from vendors
  full outer join invoices
on vendors.vendor_id = invoices.vendor_id
 order by vendor_name;


select department_name as dept_name,
       d.department_number as d_dept_no,
       e.department_number as e_dept_no,
       last_name
  from departments_ex d
  full outer join employees e
on d.department_number = e.department_number
 order by department_name;
 

SELECT V1.vendor_name as vendor_1, V2.vendor_name as vendor_2
FROM vendors V1 JOIN vendors V2
ON(V1.vendor_city = V2.vendor_city and v1.vendor_state = v2.vendor_state and v1.vendor_zip_code = v2.vendor_zip_code)
where v1.vendor_id <> v2.vendor_id;