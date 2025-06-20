INSERT INTO student (name) VALUES ( 'BOOK-TECH-1000');
INSERT INTO student (name) VALUES ( 'BOOK-TECH-1001');
select * from student;
select * from employee;
--# to show details about the table
  desc book;

select * from employee 
where first_name like '%l_';

select * from employee 
where hire_date <='02-01-12';

select * from employee 
where first_name='Michelle' and last_name='Foster' ;
select * from employee 
where first_name='Michelle' OR last_name='Foster' ;

select * from employee 
where first_name like '%l%' OR (last_name='Foster' ANd salary >48000) ;

select * from employee 
where first_name like '%l%' OR last_name='Foster' ANd salary >48000 ;

select * from employee 
where manager_id is NULL;

select DISTINCT last_name from employee ;


select * from employee 
where last_name='Berry' OR last_name='Foster' ;

select * from employee 
where last_name in ('Berry', 'Foster') ;


select * from employee 
where hire_date <='02-01-2018' And  hire_date >='02-01-14' ;

select * from employee 
where hire_date BETWEEN '02-01-2014'  And '02-01-18' ;

select * from employee 
where hire_date not BETWEEN '02-01-2014'  And '02-01-18' ;


select * from employee 
where  salary >48000 and   salary >60000 ;

--# all  work  like and operatore ( means largest one) is not equal can be repesetn != or <>

select * from employee 
where  salary >all(48000,60000) ;

select * from employee 
where  salary != all(48000) ;

select * from employee 
where  salary <> all(48000) ;

select * from employee 
where  salary is  null;

--# any  work  like and operatore ( means smallest one) 

select * from employee 
where  salary >any(48000,60000) ;

--# match with any value
select * from employee 
where  salary = any(48000,60000) ;

--# match with all  value so not possible
select * from employee 
where  salary = all(48000,60000) ;

--# null come first in desc but asc come last
select * from employee
ORDER by salary asc, last_name DESC;


--# union give unique result from both query (removed duplicate values), unique all give all result
select first_name,last_name from employee
UNION all
select first_name,last_name from customer;

--# instersect  give common
select first_name,last_name from employee
INTERSECT 
select first_name,last_name from customer;


--# minus  remove the result set from first query present ( if not present then give as it is) from second set
select first_name,last_name from employee
MINUS 
select first_name,last_name from customer;

--# when use count it ignore null value while couting like if set contain null
--# like here with * no null set as combination so 200, but with only salary column null come as part of set
--# so ignore while counting
select * from employee;
select count(*) from employee;
select salary from employee;
select count(salary) from employee;
select  count(distinct salary) from employee;

--# group by  
select last_name, count(*) from employee
GROUP BY last_name;


select last_name, count(*) from employee
where last_name like 'Pa%'
GROUP BY last_name;


select salary, count(*) from employee
where salary >70000
GROUP BY salary
ORDER by count(*) desc;

select salary, count(*) from employee
where salary >70000
GROUP BY salary
HAVING count(*) >5
ORDER by count(*) desc;

select * from employee;
select sum(salary) from employee;

select department_id, sum(salary) from employee 
GROUP by department_id;

select department_id, sum(salary) from employee 
GROUP by department_id
ORDER by  sum(salary) DESC;


select MAX(salary) from employee;
select min(salary) from employee;
SELECT max(salary), min(salary) from employee;
select department_id, max(salary)  from employee
GROUP by department_id;
select department_id, max(salary), min(salary)  from employee
GROUP by department_id;


select avg(salary) from employee;
select department_id, avg(salary)  from employee
GROUP by department_id;

--# column alias for display purpose only
select avg(salary) as avg_salary from employee;
select department_id, salary as annual_salary,  salary/12 as monthly_salary  from employee;
select salary, e.department_id from employee e;

--# join by default inner join provide common data as 3 employee with blank dpeartment data, so
--# result will not display as it's looking for data present in both
select e.first_name, e.last_name, e.department_id, d.department_name from employee e 
join department d on d.department_id=e.department_id
order by  d.department_id desc;

select c.customer_id, c.first_name, c.last_name 
from customer  c 
join customer_order   co   on c.customer_id=co.customer_id
order by c.customer_id;

select * from employee;
--#  left join  will show common data as well all data present in left table 
--# like blank department id will also be display

select e.first_name, e.last_name, e.department_id, d.department_name from employee e 
left join department d on d.department_id=e.department_id
order by  d.department_id desc;

--# right join same logic will go with right join so we can swap query position and rgith the same

select * from employee e ORDER by e.department_id desc;
select * from department;

select e.first_name, e.last_name, e.department_id, d.department_name from department d
right join employee e on e.department_id=d.department_id
order by  d.department_id desc;

--# full join will  data both tables , if table 1 have balnk correspdoing 2 still same
--# and same goes with table 2 like department id null in department and same with 
--# shows null both side

select e.first_name, e.last_name, d.department_id, d.department_name from department d
full join employee e on e.department_id=d.department_id
order by  d.department_id desc;


