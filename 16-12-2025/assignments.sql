CREATE DATABASE LibraryD;
USE LibraryD;

CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Address VARCHAR(200),
    MembershipDate DATE NOT NULL,
    MemberStatus VARCHAR(10) CHECK (MemberStatus IN ('Active', 'Inactive'))
);


CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Publisher VARCHAR(100),
    PublicationYear INT CHECK (PublicationYear >= 1900),
    Genre VARCHAR(50),
    Status VARCHAR(15) CHECK (Status IN ('Available', 'Issued'))
);


CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    CheckoutDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

ALTER TABLE Loan
ADD FineAmount DECIMAL(6,2) DEFAULT 0;

DROP TABLE IF EXISTS TempBooks;

INSERT INTO Member
VALUES (1, 'Sravani', 'P', 'sravani@gmail.com', '9876543210',
        'Chennai', '2024-01-10', 'Active');
        
INSERT INTO Book
VALUES (101, '978-1234567890', 'Database Systems',
        'Elmasri', 'Pearson', 2021, 'Education', 'Available');

INSERT INTO Loan
VALUES (1001, 101, 1, '2025-02-01', '2025-02-15', NULL, 0);

UPDATE Book
SET Status = 'Issued'
WHERE BookID = 101;

UPDATE Loan
SET ReturnDate = '2025-02-18',
    FineAmount = 50
WHERE LoanID = 1001;