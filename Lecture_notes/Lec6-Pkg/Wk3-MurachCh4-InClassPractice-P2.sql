--Week 3, Part 2 
--Murach Ch4, In Class Practice

--Covered topics: Self Join, OUTER JOIN

--Continued from Lec 5.


--4
--Print the names of employees in department 30 and the names of their managers. 
select em1.ename,
       em2.mgr
  from emp em1
 inner join emp em2
on ( em1.mgr = em2.empno )
 where em1.deptno = 30;

select e.ename,
       m.ename
  from emp e
 inner join emp m
on ( e.mgr = m.empno )
 where e.deptno = 30;




--5
--Print all general ledger accounts' numbers, descriptions, the invoice ids of invoices 
--where the accounts were used.
--The query result also includes accounts that were not used in any purchase. 




--6.
--Print the account numbers and descriptions of general ledger accounts 
--   that were not used in any purchase