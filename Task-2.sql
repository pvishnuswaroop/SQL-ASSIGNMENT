USE SISDB;
GO

--Task-2
--1

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

SELECT * FROM Students;

--2. Enroll the student in a course
INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (11, 101, '2024-09-28');

SELECT * FROM Enrollments;

--3. Update teacher email
UPDATE Teacher
SET email = 'ravi.sharma_updated@example.in'
WHERE teacher_id = 1;

SELECT * FROM Teacher;

-- 4.Delete enrollment for student_id = 1 and course_id = 101
DELETE FROM Enrollments
WHERE student_id = 1 AND course_id = 101;


SELECT * FROM Enrollments;

--5.Update course to set a teacher
UPDATE Courses
SET teacher_id = 1
WHERE course_id = 101;

-- Verify the update by selecting the updated course
SELECT * FROM Courses WHERE course_id = 101;

--6. Delete enrollments and students
DELETE FROM Enrollments
WHERE student_id = 1;

DELETE FROM Payments
WHERE student_id = 1;

DELETE FROM Students
WHERE student_id = 1;

SELECT * FROM Students;     
SELECT * FROM Enrollments;  
SELECT * FROM Payments;


--7. Update the payment amount
UPDATE Payments
SET amount = 15000.00
WHERE payment_id = 3;

-- Check updated payment
SELECT * FROM Payments WHERE payment_id = 3;

-- Final checks on all tables
SELECT * FROM Students;
SELECT * FROM Teacher;
SELECT * FROM Enrollments;
SELECT * FROM Courses;
SELECT * FROM Payments;
GO