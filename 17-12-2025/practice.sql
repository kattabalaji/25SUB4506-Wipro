CREATE DATABASE collegeDB;
USE collegeDB;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT
) ENGINE=InnoDB;

INSERT INTO students VALUES
(1, 'Arjun', 75),
(2, 'Meera', 82),
(3, 'Rohit', 68);

SELECT * FROM students;
-- 1.Increase Meera’s marks and COMMIT
SET autocommit = 0;
UPDATE students
SET marks = marks + 5
WHERE student_name = 'Meera';
-- 2.Reduce Rohit’s marks and ROLLBACK
COMMIT;
UPDATE students
SET marks = marks - 10
WHERE student_name = 'Rohit';

-- 3.Update Arjun's marks

UPDATE students
SET marks = 80
WHERE student_name = 'Arjun';

-- 4.Partial Rollback Using SAVEPOINT
ROLLBACK;

-- 5.Update Meera's marks
SAVEPOINT sp1;
UPDATE students
SET marks = 90
WHERE student_name = 'Meera';
-- 6.Rollback only second update

ROLLBACK TO sp1;
-- 7.commit
COMMIT;
SELECT * FROM students;

create user'wiprouser'@'localhosy'IDENTIFIED BY 'test123';
 
 select user, host from mysql.user;
 
GRANT SELECT ON collegeDB.students
TO 'wiprouser'@'localhost';

 
 grant insert, update
 on collegeDB.students
 to'wiprouser'@'localhost';
 
 grant all privileges
 on collegeDB.*
 to 'testuser'@'localhost';
 
 FLUSH PRIVILEGES