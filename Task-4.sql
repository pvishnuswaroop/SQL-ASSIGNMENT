--1.Calculate the average number of students enrolled in each course:
SELECT AVG(course_enrollment_counts.enrollment_count) AS average_enrollment
FROM (
    SELECT c.course_id, COUNT(e.student_id) AS enrollment_count
    FROM Courses c
    LEFT JOIN Enrollments e ON c.course_id = e.course_id
    GROUP BY c.course_id
) AS course_enrollment_counts;



--2.Identify the student(s) who made the highest payment:
SELECT s.student_id, s.first_name, s.last_name, p.amount
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE p.amount = (SELECT MAX(amount) FROM Payments);



--3.Retrieve a list of courses with the highest number of enrollments:
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS enrollment_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING COUNT(e.student_id) = (
    SELECT MAX(enrollment_count) FROM (
        SELECT COUNT(e.student_id) AS enrollment_count
        FROM Courses c
        LEFT JOIN Enrollments e ON c.course_id = e.course_id
        GROUP BY c.course_id
    ) AS enrollment_counts
);


--4.Calculate the total payments made to courses taught by each teacher:
SELECT t.teacher_id, t.first_name, t.last_name, SUM(p.amount) AS total_payments
FROM Teacher t
JOIN Courses c ON t.teacher_id = c.teacher_id
JOIN Enrollments e ON c.course_id = e.course_id
JOIN Payments p ON e.student_id = p.student_id
GROUP BY t.teacher_id, t.first_name, t.last_name;

--5.Identify students who are enrolled in all available courses:
SELECT s.student_id, s.first_name, s.last_name
FROM Students s
WHERE (SELECT COUNT(*) FROM Enrollments e WHERE e.student_id = s.student_id) = 
      (SELECT COUNT(*) FROM Courses c);


--6.Retrieve the names of teachers who have not been assigned to any courses:
SELECT t.teacher_id, t.first_name, t.last_name
FROM Teacher t
WHERE t.teacher_id NOT IN (
    SELECT c.teacher_id
    FROM Courses c
);


--7.Calculate the average age of all students:
SELECT AVG(DATEDIFF(YEAR, s.date_of_birth, GETDATE())) AS average_age
FROM Students s;

--8.Identify courses with no enrollments:
SELECT c.course_id, c.course_name
FROM Courses c
WHERE c.course_id NOT IN (
    SELECT e.course_id
    FROM Enrollments e
);


--9.Calculate the total payments made by each student for each course:
SELECT s.student_id, s.first_name, s.last_name, 
       c.course_id, c.course_name,
       (SELECT SUM(p.amount)
        FROM Payments p
        JOIN Enrollments e ON p.student_id = e.student_id
        WHERE e.course_id = c.course_id AND e.student_id = s.student_id) AS total_payment
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
GROUP BY s.student_id, s.first_name, s.last_name, c.course_id, c.course_name;


--10.Identify students who have made more than one payment:
SELECT s.student_id, s.first_name, s.last_name
FROM Students s
WHERE s.student_id IN (
    SELECT p.student_id
    FROM Payments p
    GROUP BY p.student_id
    HAVING COUNT(p.amount) > 1
);


--11.calculates the total payments made by each student by summing the payment amounts for every student.
SELECT s.student_id, s.first_name, s.last_name, 
       SUM(p.amount) AS total_payments
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name;



--12.retrieves a list of courses and the number of students enrolled in each by counting student enrollments per course.
SELECT c.course_name, COUNT(e.student_id) AS enrolled_students
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;


--13.calculates the average payment amount made by students by averaging the amount field in the Payments table.
SELECT s.student_id, s.first_name, s.last_name, AVG(p.amount) AS average_payment
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name;













