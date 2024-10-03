CREATE DATABASE SISDB;
GO
USE SISDB;
GO

--Task-1
--2
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY IDENTITY(1,1),
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


--5
SET IDENTITY_INSERT Students ON;
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
(1, 'Amit', 'Sharma', '1997-01-12', 'amit.sharma@example.in', '9123456789'),
(2, 'Neha', 'Patel', '1996-05-22', 'neha.patel@example.in', '9876543210'),
(3, 'Ravi', 'Verma', '1998-11-30', 'ravi.verma@example.in', '9988776655'),
(4, 'Priya', 'Singh', '1997-07-15', 'priya.singh@example.in', '9123344556'),
(5, 'Rahul', 'Kumar', '1995-09-05', 'rahul.kumar@example.in', '9234567890'),
(6, 'Sneha', 'Reddy', '1999-02-25', 'sneha.reddy@example.in', '9123678901'),
(7, 'Ankit', 'Jain', '1997-03-10', 'ankit.jain@example.in', '9898771234'),
(8, 'Sonal', 'Chopra', '1998-06-14', 'sonal.chopra@example.in', '9123567890'),
(9, 'Arjun', 'Mehta', '1996-08-20', 'arjun.mehta@example.in', '9112345678'),
(10, 'Deepika', 'Gupta', '1997-10-22', 'deepika.gupta@example.in', '9876540987');
SET IDENTITY_INSERT Students OFF;

SET IDENTITY_INSERT Teacher ON;
INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
(1, 'Ravi', 'Sharma', 'ravi.sharma@example.in'),
(2, 'Anjali', 'Patel', 'anjali.patel@example.in'),
(3, 'Vikas', 'Singh', 'vikas.singh@example.in'),
(4, 'Sakshi', 'Iyer', 'sakshi.iyer@example.in'),
(5, 'Amit', 'Verma', 'amit.verma@example.in'),
(6, 'Pooja', 'Reddy', 'pooja.reddy@example.in'),
(7, 'Suresh', 'Mehta', 'suresh.mehta@example.in'),
(8, 'Nidhi', 'Nair', 'nidhi.nair@example.in'),
(9, 'Rajesh', 'Desai', 'rajesh.desai@example.in'),
(10, 'Kavita', 'Kumar', 'kavita.kumar@example.in');
SET IDENTITY_INSERT Teacher OFF;

SET IDENTITY_INSERT Courses ON;
INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
(101, 'Data Structures', 4, 1),
(102, 'Database Systems', 3, 2),
(103, 'Operating Systems', 4, 3),
(104, 'Software Engineering', 3, 4),
(105, 'Computer Networks', 3, 5),
(106, 'Artificial Intelligence', 4, 6),
(107, 'Cloud Computing', 3, 7),
(108, 'Cyber Security', 4, 8),
(109, 'Big Data Analytics', 3, 9),
(110, 'Machine Learning', 4, 10);
SET IDENTITY_INSERT Courses OFF;

SET IDENTITY_INSERT Enrollments ON;
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
(1, 1, 101, '2023-01-10'),
(2, 2, 102, '2023-01-12'),
(3, 3, 103, '2023-01-15'),
(4, 4, 104, '2023-01-17'),
(5, 5, 105, '2023-01-18'),
(6, 6, 106, '2023-01-20'),
(7, 7, 107, '2023-01-22'),
(8, 8, 108, '2023-01-23'),
(9, 9, 109, '2023-01-24'),
(10, 10, 110, '2023-01-25');
SET IDENTITY_INSERT Enrollments OFF;

SET IDENTITY_INSERT Payments ON;
INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
(1, 1, 10000, '2023-02-15'),
(2, 2, 12000, '2023-02-16'),
(3, 3, 15000, '2023-02-17'),
(4, 4, 11000, '2023-02-18'),
(5, 5, 13000, '2023-02-19'),
(6, 6, 14000, '2023-02-20'),
(7, 7, 16000, '2023-02-21'),
(8, 8, 17000, '2023-02-22'),
(9, 9, 18000, '2023-02-23'),
(10, 10, 19000, '2023-02-24');
SET IDENTITY_INSERT Payments OFF;


SELECT * FROM Students;
SELECT * FROM Teacher;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Payments;
GO