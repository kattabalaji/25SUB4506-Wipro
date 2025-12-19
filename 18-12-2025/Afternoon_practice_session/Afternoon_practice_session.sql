use companydb2;
 
 
CREATE TABLE dbwiprodec (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    email VARCHAR(100),
    salary INT,
    dept VARCHAR(30)
);
 
INSERT INTO dbwiprodec VALUES
(101, 'Arun', 'arun@gmail.com', 50000, 'HR'),
(102, 'Bala', 'bala@gmail.com', 60000, 'IT'),
(103, 'Chitra', 'chitra@gmail.com', 55000, 'IT'),
(104, 'Divya', 'divya@gmail.com', 45000, 'HR'),
(105, 'Eshan', 'eshan@gmail.com', 70000, 'Finance');
 
 
create index idx_dept
on dbwiprodec(dept);
 
-- applhy the index 
select * from dbwiprodec where dept='IT';
 
show index from dbwiprodec;
 
drop index idx_dept on dbwiprodec;