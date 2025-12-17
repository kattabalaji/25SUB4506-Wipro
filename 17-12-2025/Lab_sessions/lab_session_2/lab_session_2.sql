CREATE DATABASE shopDB;
USE shopDB;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO customers VALUES
(1, 'Arjun', 'arjun@gmail.com', 'Chennai'),
(2, 'Meera', 'meera@gmail.com', 'Bangalore'),
(3, 'Ravi', 'ravi@gmail.com', 'Chennai');


SELECT * FROM customers;
SELECT customer_name, email
FROM customers
WHERE city = 'Chennai';