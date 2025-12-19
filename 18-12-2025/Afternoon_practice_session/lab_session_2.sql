use customer;

CREATE TABLE sales (
 sale_id INT, 
 customer_id INT, 
 product VARCHAR(30), 
 category VARCHAR(30), 
 sale_amount INT, 
 sale_date DATE 
 ); 
 INSERT INTO sales VALUES 
 (1, 101, 'Laptop', 'Electronics', 50000, '2024-01-10'), 
 (2, 101, 'Mouse', 'Electronics', 1500, '2024-01-15'),
 (3, 102, 'Chair', 'Furniture', 7000, '2024-02-05'), 
 (4, 102, 'Table', 'Furniture', 12000, '2024-02-20'), 
 (5, 103, 'Phone', 'Electronics', 30000, '2024-01-25'),
 (6, 104, 'Desk', 'Furniture', 10000, '2024-03-05'),
 (7, 101, 'Keyboard', 'Electronics', 3000, '2024-03-10'), 
 (8, 105, 'Tablet', 'Electronics', 25000, '2024-02-15');
 
 select * from sales;
 
 -- Customers who made more than 2 purchases
 
 select customer_id
 from sales group by customer_id having count(sale_id)>2;
 
 -- Products with total sales amount > 30,000
 
 select product, sum(sale_amount) as total_sale
 from sales group by product having sum(sale_amount)>3000;
 
 -- Categories with more than 3 sales transactions
 
 select category 
 from sales group by category having count(sale_id)>3;
 
 -- Customers whose average purchase amount > 20,000
 
 select customer_id 
 from sales group by customer_id having avg(sale_amount)>20000;
 
 -- Months having total sales > 50,000
 
 select month(sale_date) as sale_month, sum(sale_amount) as total_sale
 from sales group by month(sale_date) having sum(sale_amount)>50000;

-- Categories where minimum sale amount > 2,000
 
 select category from sales group by category having min(sale_amount)>2000;

 -- Customers whose total sales amount is between 20,000 and 80,000

 select customer_id, sum(sale_amount) as total_amount
 from sales group by customer_id having sum(sale_amount) between 20000 and 80000;	