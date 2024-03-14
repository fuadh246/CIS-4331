-- 1.
SELECT id ||' '|| name biology_instructors FROM instructor WHERE dept_name ='Biology';

-- 2.
SELECT title "3Credit CS Courses" FROM course WHERE dept_name = 'Comp. Sci.' and credits=3;

-- 3.
SELECT t.course_id, c.title FROM takes t JOIN course c ON(t.course_id = c.course_id) WHERE t.id = '12345';


-- 4
SELECT SUM(c.credits) total_credits  FROM takes t JOIN course c ON(t.course_id = c.course_id) WHERE t.id = '12345';

-- 5
SELECT SUM(c.credits) total_credits  FROM takes t JOIN course c ON(t.course_id = c.course_id) GROUP BY id;

-- 6
SELECT DISTINCT s.name from takes t join student s on(t.id=s.id) join course c on (t.course_id=c.course_id) where c.dept_name = 'Comp. Sci.';

select distinct s.name
  from takes t
  join student s
on ( t.id = s.id )
  join course c
on ( t.course_id = c.course_id )
 where c.dept_name = 'Comp. Sci.';

select distinct s.name, s.dept_name
  from takes t
  join student s
on ( t.id = s.id )
  join course c
on ( t.course_id = c.course_id )
 where c.dept_name = 'Comp. Sci.';
 
-- 7
SELECT i.id, i.name, COALESCE(t.course_id, 'Not Taught') AS course_id
FROM instructor i
LEFT JOIN teaches t ON (i.id = t.id)
WHERE i.dept_name = 'Physics'
ORDER BY i.id, t.id;

-- 8
-- a
select i.id,
       name
  from instructor i
  left join teaches t
on ( i.id = t.id )
 where t.course_id is null;
 

-- b
(
	select id,
	       name
	  from instructor
)
minus
(
	select i.id,
	       i.name
	  from teaches t
	  join instructor i
	on ( t.id = i.id )
);

-- 9 
select name,
       count(*) how_many_courses
  from instructor i
  join teaches t
on ( i.id = t.id )
 group by name
 order by name;
 
 
-- 10 
select name,
       count(*) how_many_courses
  from instructor i
  join teaches t
on ( i.id = t.id )
 group by name
  HAVING count(*)>1
 order by name;
 
 
 
 
 
 
 select distinct gl.account_number,
                account_description
  from general_ledger_accounts gl
  join invoice_line_items il
on ( gl.account_number = il.account_number )
 where account_description like '%Advertising'
 order by gl.account_number;
 
 
 
 
 
 



