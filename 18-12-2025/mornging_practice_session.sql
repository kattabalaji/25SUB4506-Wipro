CREATE DATABASE joinLabDB;
USE joinLabDB;

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(30)
);
 
 
CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_amount INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
 
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Ravi', 'Mumbai'),
(3, 'Neha', 'Chennai'),
(4, 'Meena', 'Bangalore');
 
INSERT INTO customers VALUES(5, 'John', 'Hyderabad');
select * from customers;
INSERT INTO orders VALUES
(101, 1, 5000),
(102, 2, 8000),
(103, 3, 6000),
(104, 4, 4000);
 
select * from orders;
 
-- Inner join
select c.customer_name , o.order_amount , c.customer_id
from customers c
INNER JOIN orders o
on c.customer_id = o.customer_id;
 
-- right join
select c.customer_name , o.order_amount , c.customer_id , o.order_id
from customers c
RIGHT JOIN orders o
on c.customer_id = o.customer_id;

-- left join
 
select c.customer_name , o.order_amount , c.customer_id , o.order_id
from customers c
LEFT JOIN orders o
on c.customer_id = o.customer_id;
 
select c.customer_name , o.order_amount , c.customer_id , o.order_id
from customers c
RIGHT JOIN orders o
on c.customer_id = o.customer_id
UNION
select c.customer_name , o.order_amount , c.customer_id , o.order_id
from customers c
LEFT JOIN orders o
on c.customer_id = o.customer_id;

select c.customer_name , o.order_id
from customers c
CROSS JOIN orders o;

CREATE TABLE employees_2023 (
    emp_id INT,
    emp_name VARCHAR(50)
);
 
CREATE TABLE employees_2024 (
    emp_id INT,
    emp_name VARCHAR(50)
);
 
INSERT INTO employees_2023 VALUES
(1, 'Arun'),
(2, 'Bala'),
(3, 'Chitra');
 
INSERT INTO employees_2024 VALUES
(2, 'Bala'),
(3, 'Chitra'),
(4, 'Divya');
 
-- Intersect Returns only common rows from both queries.
select e1.emp_id, e1.emp_name from employees_2023 e1
inner join employees_2024 e2 ON e1.emp_id = e2.emp_id;
 
select * from employees_2023;
 
select * from employees_2024;
 
-- Combines rows from both queries and removes duplicates.
select emp_id , emp_name from employees_2023
UNION
select emp_id , emp_name from employees_2024;
 
-- UNION ALL (keeps duplicates)
select emp_id , emp_name from employees_2023
UNION ALL
select emp_id , emp_name from employees_2024;

-- except - Returns rows from the first table only, excluding common rows.
select e1.emp_id, e1.emp_name from employees_2023 e1
left join employees_2024 e2 on e1.emp_id = e2.emp_id
where e2.emp_id is null;


-- next program
 
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
 
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT
);
 
INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');
 
INSERT INTO employees VALUES
(101, 'Arun', 50000, 1),
(102, 'Bala', 60000, 2),
(103, 'Chitra', 55000, 2),
(104, 'Divya', 45000, 1),
(105, 'Eshan', 70000, 3);
 
 
select * from departments;
 
select * from employees;
 
-- employee with the highest salary - returning one row  - scalar sub query
 
select emp_name , salary
from employees
where salary = (
select MAX(salary)
from employees
);
 
-- Employees Working in IT Department - return multiple rows
 
select emp_name ,dept_id
from employees
where dept_id  = (
    select dept_id 
    from departments
    where dept_name = 'IT'
 
);
-- Employees in HR or Finance - IN clause
 
select emp_name
from employees
where dept_id  IN (
 
	select dept_id 
    from departments
    where dept_name IN ('HR' , 'Finance')
 
);
 
-- average salary using group by clause  avearge salary per dept
 
select dept_id, AVG(salary) as avgsalary
from employees
group by dept_id;
 select emp_name, salary , dept_id
from employees e 
where salary = (
 
		select max(salary)
        from employees
        where dept_id = e.dept_id
 
);

SELECT emp_name, salary, dept_id
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE dept_id = e.dept_id
);
	 
	CREATE TABLE employees1 (
		emp_id INT,
		emp_name VARCHAR(50),
		salary INT,
		dept VARCHAR(30)
	);
	 
	 
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
LOAD DATA LOCAL INFILE 'file.csv'
INTO TABLE employees1
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
	 
select * from employees1;

CREATE TABLE employeeswipro (
    emp_id INT,
    emp_name VARCHAR(50),
    salary INT,
    dept VARCHAR(30)
);
 
INSERT INTO employeeswipro VALUES
(101, 'Arun', 50000, 'HR'),
(102, 'Bala', 60000, 'IT'),
(103, 'Chitra', 55000, 'IT'),
(104, 'Divya', 45000, 'HR'),
(105, 'Eshan', 70000, 'Finance'),
(106, 'Farah', 65000, 'Finance');
 
select * from employeeswipro;
 
 
-- departments with avaerage dsalary > 550000
 
select dept, avg(salary) AS avg_salary
from  employeeswipro
group by dept
having AVG(salary) > 55000;
 
-- depatrtment with more than 1 employee
 
select dept, COUNT(*) as emp_count
from  employeeswipro
group by dept
having count(*) > 1;
 
 
-- using both where and having clause
 
select dept, AVG(salary) as avg_salary
from employeeswipro
where salary > 50000
group by dept
having AVG(salary) > 60000;