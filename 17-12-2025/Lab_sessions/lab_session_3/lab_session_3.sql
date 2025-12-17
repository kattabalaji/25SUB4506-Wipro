use shopDB;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
drop table orders;
SELECT * FROM orders;
START TRANSACTION;


INSERT INTO orders VALUES (1, 3,'2024-01-15', 5000);
SAVEPOINT sp1;

INSERT INTO orders VALUES (2,1, '2024-01-15', 7000);
SAVEPOINT sp2;

INSERT INTO orders VALUES (3, 2,'2024-01-15', 6000);
SAVEPOINT sp3;


ROLLBACK TO sp2;

COMMIT;
