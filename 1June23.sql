create table exams(s_id int, subject varchar(20), marks int);
insert into exams value(1,'Python',95),(1,'Tableau',95),(1,'Maths',92),
(2,'Python',80),(2,'Tableau',90),
(3,'Python',80),(3,'Maths',80),
(4,'Python',71),(4,'Tableau',54),
(5,'Python',79);

select * from exams;

select s_id,marks,count(1) as t_marks from exams
where subject in('Python','Tableau') 
group by s_id,marks
having count(*) = 2;

select order_id , count(*) as No_of_Records from orders 
group by order_id
having count(*) > 1
order by No_of_Records;


create table dept(dept_id int, dept_name varchar(20));
insert into dept value(100,'Analytics'),(200,'IT'),(300,'HR'),
(400,'Finance');
select * from employees;
select * from dept;



/* Inner Join
Left join
Right join
Outer Join
Self join
Cross join */

select 
	emp.emp_name,
    dp.dept_name
from
employees as emp inner join dept as dp
on emp.dept_id = dp.dept_id;

-- INNER JOIN
select emp_name, dept_name 
from employees as emp left join dept as dp
on emp.dept_id = dp.dept_id;

-- RIGHT JOIN
select emp_name, dept_name
from employees as emp right join dept as dp
on emp.dept_id = dp.dept_id;

-- select only those orderid which are not present in return table
-- or
-- Orders which never returned
select * from returns;
select * from orders;


-- 
select distinct o.order_id , r.order_id 
from orders o left join returns r
on o.order_id = r.order_id
where r.order_id is null
order by r.order_id;

-- Self join
select * from employees;

-- Employee Name    Manager Name
--  Chris			Mark
select emp.emp_name employee_name, mgr.emp_name manager_name
from employees emp inner join employees mgr
on emp.manager = mgr.emp_id;

-- Display the list of employees whose salary is greater than their manager salary
select emp.emp_name as Employee_Name, emp.salary emp_salary, mtr.emp_name Manager_name,
mtr.salary mgr_salary
from employees emp inner join employees mtr
on emp.manager = mtr.emp_id
having emp_salary > mgr_salary;

-- Cross or Cartesion Join
use dataanalytics;
select * from employees cross join dept;

-- Query to get region wise count of return orders
select region, count(distinct ord.order_id) Return_order from orders ord inner join returns rtn
on ord.order_id = rtn.order_id
group by ord.region;

select * from orders order by order_id;

select Order_id, count(order_id) as prod_count 
 from orders 
 group by order_id
 having count(order_id) = 1;

-- Sub-Queries
select * from orders where order_id in (
										select Order_id
										 from orders 
										 group by order_id
										 having count(order_id) = 1
										);
                                        
