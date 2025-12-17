CREATE TABLE Persons (
    PersonID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(100),
    City VARCHAR(50),
    Dept VARCHAR(30)
);
INSERT INTO Persons
VALUES (1, 'Kishore', 'Kumar', 'RGG St Marry Road', 'Mumbai', 'IT');
SELECT * FROM Persons;
INSERT INTO Persons (PersonID, FirstName, LastName, Address, City, Dept)
VALUES (7889, 'Kishore', 'Kumar', 'RGG, St marry road', 'Mumbai', 'IT');

INSERT INTO Persons (PersonID, FirstName, LastName, Address, City, Dept)
VALUES (7890, 'Kishore', 'Kumar', 'RGG, St marry road', 'Mumbai', 'HR');

SELECT * FROM Persons
WHERE Dept = 'IT'
ORDER BY PersonID DESC;

SELECT *FROM Persons
ORDER BY PersonID DESC
LIMIT 3;

CREATE TABLE Staff(
Id INT,
Name VARCHAR(255),
Age INT,
Allowance VARCHAR(255),
Salary FLOAT
);
INSERT INTO Staff (Id, Name, Age, Allowance, Salary)
VALUES (7890, 'Kishore', 23, 18000, 34000);
SELECT * FROM Staff;
INSERT INTO Staff (Id, Name, Age, Allowance, Salary)
VALUES (1, 'Kamesh', 23, 2600, 25000);
INSERT INTO Staff (Id, Name, Age, Allowance, Salary)
VALUES (2, 'Kishan', 25, 500, 34000);
INSERT INTO Staff (Id, Name, Age, Allowance, Salary)
VALUES (3, 'Kiran', 20, 1500, 26000);

INSERT INTO Staff (Id, Name, Age, Allowance, Salary)
VALUES (4, 'Krishna', 21, 1700, 21000);

INSERT INTO Staff (Id, Name, Age, Allowance, Salary)
VALUES (5, 'krish', 22, 1800, 3400);
SELECT * FROM Staff;
DELETE FROM Staff
WHERE ID=1;
commit;
DELETE FROM Staff
WHERE ID=7890;
ROLLBACK;