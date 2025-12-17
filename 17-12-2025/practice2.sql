create database bankdb;
use bankdb;
create table bank_acc(
acc_id INT,
acc_name VARCHAR(255),
balance int);

insert into bank_acc(acc_id, acc_name,balance)
values(101,'amit',5000);

insert into bank_acc(acc_id, acc_name,balance)
values(102,'amar',4060);

insert into bank_acc(acc_id, acc_name,balance)
values(103,'amir',12500);
select * from bank_acc;
savepoint sp1;
START TRANSACTION;
update bank_acc
set balance=balance+3000
where acc_id=101;
ROLLBACK To sp1;
SET autocommit = 1;
commit;

