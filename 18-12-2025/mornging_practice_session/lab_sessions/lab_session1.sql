CREATE DATABASE Sales;
USE Sales;


CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(30),
    commission DECIMAL(4,2)
);
INSERT INTO salesman VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

CREATE TABLE customer1 (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(30),
    grade INT,
    salesman_id INT
);
INSERT INTO customer1 VALUES
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007);

SELECT * FROM salesman;
SELECT * FROM customer1;

SELECT c.cust_name AS "Customer Name", c.city, s.name AS "Salesman", s.commission FROM customer1 c 
INNER JOIN salesman s ON c.salesman_id = s.salesman_id;

SELECT s.name AS "Salesman", c.cust_name, c.city FROM salesman s
INNER JOIN customer1 c ON s.city = c.city;
