--Wk2 Q & A
--In Class Practice for Murach-Ch3


--Covered topics:
----WHERE, ORDER BY clauses
----Basic comparison, logical operators
----ROWNUM, ||, column alias
----LIKE, wildcard characters
----Dual table, scalar function

--Run the statements using user AP unless otherwise indicated.

--1.
--print names, dept numbers of employees supervised by manager with id 7839
--  in the increasing order of employee names


SELECT ename, deptno
FROM   emp
WHERE  mgr = 7839
ORDER BY  ename;



--2.
--For the above query, limit the query result to be at most 2 rows

SELECT ename, empno
FROM   emp
WHERE  mgr = 7839 AND ROWNUM <= 2
ORDER BY  ename;

--3.
--print all employees' work information and 
--display the heading of the query result to be Work Info
--Sample Output:
---- Work Info
---- KING works in Dept 10
---- BLAKE works in Dept 30


SELECT ename || ' works in Dept ' || deptno AS  "Work Info"
FROM  emp;

--AS optional
SELECT ename || ' works in Dept ' || deptno  "Work Info"
FROM  emp;



