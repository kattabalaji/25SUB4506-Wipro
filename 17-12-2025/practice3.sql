select abs(-10);
select round(235.65,1);
select ceil(256.3);
select floor(256.9);
select power(2,5);
select mod(10,3);
select UPPER('balaji');
select lower('BALAJI');
select length('mysql');
select substring('datacom',1,4);
select concat('hello','world');
select trim(' hi ');
select replace('sql guide', 'guide', 'book');
select now();
select curdate();
select DATEDIFF('2025-01-10','2025-01-01');
select dateadd(DAY,10,'2025-01-01');
select MONTH('2025-02-15');
select YEAR('2025-12-10');

CREATE DATABASE companyDB2;
USE companyDB2;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept VARCHAR(20),
    salary INT
);

INSERT INTO employees (emp_id, emp_name, dept, salary) VALUES
(1, 'Amit', 'HR', 30000),
(2, 'Ravi', 'IT', 50000),
(3, 'Neha', 'IT', 70000),
(4, 'Meena', 'HR', 40000),
(5, 'Arjun', 'Finance', 60000);

SELECT * FROM employees;
SELECT COUNT(*) AS Total_employees
from employees;
SELECT COUNT(*) AS It_count
from employees
where dept='IT';
select sum(salary) as total_salary
from employees;
select dept, sum(salary) as dept_salary
from employees
group by dept;

select avg(salary) as dept_salary
from employees;
select dept, avg(salary) as dept_salary
from employees
group by dept;

select min(salary) as lowest_salary
from employees;

select max(salary) as max_salary
from employees;

select dept, max(salary) as max_salary
from employees
group by dept;

select dept, min(salary) as min_salary
from employees
group by dept;
