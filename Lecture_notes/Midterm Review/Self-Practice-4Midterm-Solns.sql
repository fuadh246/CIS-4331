--Solution to Self-Practice for Midterm Preparation

--Run these queries as user UV

--Q1.
select id
       || ' '
       || name biology_instructors
  from instructor
 where dept_name = 'Biology';

--Q2.
select title "3-Credit CS Courses"
  from course
 where dept_name = 'Comp. Sci.'
   and credits = 3;

--Q3.
select c.course_id,
       title
  from takes t
  join course c
on ( t.course_id = c.course_id )
 where id = '12345';

--Q4.
select sum(credits) total_credits
  from takes t
  join course c
on ( t.course_id = c.course_id )
 where id = '12345';

--Q5
select id,
       sum(credits) total_credits
  from takes t
  join course c
on ( t.course_id = c.course_id )
 group by id;

--Q6
select distinct s.name
  from takes t
  join student s
on ( t.id = s.id )
  join course c
on ( t.course_id = c.course_id )
 where c.dept_name = 'Comp. Sci.';

select distinct s.name,
                s.dept_name
  from takes t
  join student s
on ( t.id = s.id )
  join course c
on ( t.course_id = c.course_id )
 where c.dept_name = 'Comp. Sci.';

--Q7
select i.id,
       name,
       course_id
  from instructor i
  left join teaches t
on ( i.id = t.id )
 where dept_name = 'Physics';

--Q8a
select i.id,
       name
  from instructor i
  left join teaches t
on ( i.id = t.id )
 where t.course_id is null;
 
--Q8b
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
 
--Q9
select name,
       count(*) how_many_courses
  from instructor i
  join teaches t
on ( i.id = t.id )
 group by name
 order by name;

--Q10
select name,
       count(*) how_many_courses
  from instructor i
  join teaches t
on ( i.id = t.id )
 group by name
having count(*) >= 2
 order by name;

--Run this query as user ap

--Q11
select distinct gl.account_number,
                account_description
  from general_ledger_accounts gl
  join invoice_line_items il
on ( gl.account_number = il.account_number )
 where account_description like '%Advertising'
 order by gl.account_number;