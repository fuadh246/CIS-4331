--Week 3, Part 2 
--Murach Ch4, In Class Practice
--Questions & Answers

--Covered topics: Self Join, OUTER JOIN

--Continued from Lec 5.

--All tables needed are under user AP in the document:
--   Oracle Users and Their Tables used in the Course.pdf
--If you don't have the tables emp, dept for AP, run the script: 
--    CREATE-LOAD-AP-DEPT-EMP-TABLES-CIS-DB-Server.sql (included again in Week 3 Module)

--4
--Print the names of employees in department 30 and the names of their managers. 

--Soln
--Self Join the primary key column empno with the foreign key column mgr
select e.ename "EMP",
       m.ename "MAN"
  from emp e
 inner join emp m
on ( e.mgr = m.empno )
 where e.deptno = 30;

--related query
--Q4-5
--print names of all workers and names of their managers
select e.ename "EMP",
       m.ename "MAN"
  from emp e
  left join emp m
on ( e.mgr = m.empno );

--5
--Print all general ledger accounts' numbers, descriptions, the invoice ids of invoices 
--where the accounts were used.
--The query result also includes accounts that were not used in any purchase. 

--Solution
--run as ap user
select gl.account_number,
       gl.account_description,
       invoice_id
  from general_ledger_accounts gl
  left join invoice_line_items il
on ( gl.account_number = il.account_number );



--6.
--Print the account numbers and descriptions of general ledger accounts 
--   that were not used in any purchase

--answer
--run as ap user
select gl.account_number,
       account_description
  from general_ledger_accounts gl
  left join invoice_line_items il
on ( gl.account_number = il.account_number )
 where invoice_id is null;