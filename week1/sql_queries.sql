-- in this file we will write all the sql queries that we will use to interact with the database

-- 1. select all columns from the employee table
select * from Employee;

-- 2. select name and salary from the employee table

select name,salary from Employee;

-- 3. selectemployees who are older than 30 years

 select name from Employee where age>30;

 -- 4. select names of all departments

 select name from Department;

 -- 5.select employees who work in the IT department
  select name from Employee where department_id=1;

-- 6. select emplyees whose names start with 'j'
select name from Employee where name like 'j%';

--7 select emplyees whose names end with 'e'
select name from Employee where name like '%e';

--8. select employees whose names contain 'a'
select name from Employee where name like '%a%';

--9 select employees whose names are exactly 9 characters long
select name from Employee where length(name) = 9;

--10 select emplyees whose names have 'o' as second character
select name from Employee where name like '_o%';

--11 select employees hired in the year 2020
select name from Employee where hire_date like '2020%';

--12 select employees hired in january of any year
select name from Employee where hire_date like '%-01-%';

--13 select employees hired on after  march 1 ,2021
select name from Employee where hire_date > '2021-03-01';

--14 select employees hired in last 2 years
select name from Employee where hire_date > '2024-01-01';

-- 15 select total salary of all employees
select sum(salary) from Employee;


-- 16. select the average salary for employees
select avg(salary) from Employee;

--17 select the minimum salary in employee table
select min(salary) from Employee;

--18 select number of employees in the each department
select department_id, count(*) from Employee group by department_id;

--19 select the average salary for each department
select department_id, avg(salary) from Employee group by department_id;

--20 select the total salary for each department
select department_id, sum(salary) from Employee group by department_id;

-- 21 select the average of employee age in each department
select department_id, avg(age) from Employee group by department_id;

--22 select the number of employyes hired in each year
select year(hire_date), count(*) from Employee group by year(hire_date);

--23 select the highest salary in the each department
select department_id, max(salary) from Employee group by department_id;

--24 select the departmet which has the highest average salary
select department_id, avg(salary) from Employee group by department_id order by avg(salary) desc limit 1;

--25 select departments which have more than 2 employees
select department_id, count(*) from Employee group by department_id having count(*) > 2;

--26 select depaartments with highest average salary greater than 55000
select department_id, avg(salary) from Employee group by department_id having avg(salary) > 55000;

--27 select years whith more than 1 employee hired
select year(hire_date), count(*) from Employee group by year(hire_date) having count(*) > 1;

--28 select departments with total salary expense less than 100000
select department_id, sum(salary) from Employee group by department_id having sum(salary) < 100000;

--29 select departments with maximum salary above 75000
select department_id, max(salary) from Employee group by department_id having max(salary) > 75000;

--30 select all employees ordered by their salary in descending order
select * from Employee order by salary desc;

--31 select all employees ordered by age in descending order
select * from Employee order by age desc;

--32 select employyes ordered by their department and then by their salary  ascending order
select * from Employee order by department_id, salary asc;

--33 select employees with ordered by their total salary of all employees
select department_id, sum(salary) 
from Employee 
group by department_id 
order by sum(salary);