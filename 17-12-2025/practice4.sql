CREATE DATABASE logicDB;
USE logicDB;
 
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    salary INT,
    bonus INT,
    dept VARCHAR(20)
);
 
INSERT INTO employees VALUES
(1, 'Amit', 25000, NULL, 'HR'),
(2, 'Ravi', 40000, 5000, 'IT'),
(3, 'Neha', 60000, NULL, 'Finance'),
(4, 'Meena', 80000, 10000, 'IT');
 
SELECT * FROM employees;
 
 
select emp_name, salary,
case
	when salary < 30000 then 'low'
    when salary between 30000 and 60000 then 'Medium'
    else 'high'
END as salary_level
from employees;
 
select * 
from employees
where
case 
	when dept = 'IT' then salary > 50000
    else salary > 30000
END;
 SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET bonus =
CASE
    WHEN salary >= 60000 THEN 10000
    ELSE 5000
END;

SET SQL_SAFE_UPDATES = 1;
SELECT * FROM employees;
 
select emp_name,
if(salary >= 50000, 'Eligible' , 'Not eligible')  as status
from employees;
 
select emp_name,
IF (bonus is null, salary * 0.05 , bonus) as final_bonus
from employees;
 
select emp_name,
ifnull(bonus, 0 ) as  bonus_amount
from employees;