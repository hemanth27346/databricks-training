--1. Display all students and the courses they are enrolled in. Include students who are not enrolled in any course
SELECT students.student_name,courses.course_name FROM students
LEFT JOIN enrollments
ON students.student_id = enrollments.student_id
LEFT JOIN courses
ON enrollments.course_id = courses.course_id;

--2 Find all courses that currently have no students enrolled
SELECT courses.course_id, courses.course_name
FROM courses
LEFT JOIN enrollments
ON courses.course_id = enrollments.course_id
WHERE enrollments.course_id IS NULL;

--3  Display all instructors and the courses they teach, including instructors who are not assigned to any course
SELECT instructors.instructor_name,courses.course_name
FROM instructors
LEFT JOIN courses
ON instructors.instructor_id = courses.instructor_id;
--4   Find all courses that do not have an instructor assigned
SELECT course_id, course_name
FROM courses
WHERE instructor_id IS NULL;
--5  Display all students and enrollment information using a RIGHT JOIN.
SELECT students.student_name,enrollments.enrollment_id,enrollments.course_id,enrollments.enrollment_date
FROM enrollments
RIGHT JOIN students
ON enrollments.student_id = students.student_id;

--6  Find students who are not enrolled in any course.
SELECT students.student_id,students.student_name
FROM students
LEFT JOIN enrollments
ON students.student_id = enrollments.student_id
WHERE enrollments.student_id IS NULL;

--7  Use a FULL OUTER JOIN to display all students and enrollments, including unmatched rows from both tables.
SELECT students.student_name,enrollments.enrollment_id,enrollments.course_id,enrollments.enrollment_date
FROM students
LEFT JOIN enrollments
ON students.student_id = enrollments.student_id

UNION

SELECT students.student_name,enrollments.enrollment_id,enrollments.course_id,enrollments.enrollment_date
FROM students
RIGHT JOIN enrollments
ON students.student_id = enrollments.student_id;

--8  Find all courses that have never appeared in the enrollments table
SELECT courses.course_id,courses.course_name
FROM courses
LEFT JOIN enrollments
ON courses.course_id = enrollments.course_id
WHERE enrollments.course_id IS NULL;
--9   Display all instructors and courses using a FULL OUTER JOIN and identify unmatched rows
SELECT instructors.instructor_name,courses.course_name
FROM instructors
LEFT JOIN courses
ON instructors.instructor_id = courses.instructor_id

UNION

SELECT instructors.instructor_name,courses.course_name
FROM instructors
RIGHT JOIN courses
ON instructors.instructor_id = courses.instructor_id;

--10 . Create a report showing: student name, course name, and instructor name. Include rows even if course or instructor information is missing
SELECT students.student_name,courses.course_name,instructors.instructor_name
FROM students
LEFT JOIN enrollments
ON students.student_id = enrollments.student_id
LEFT JOIN courses
ON enrollments.course_id = courses.course_id
LEFT JOIN instructors
ON courses.instructor_id = instructors.instructor_id;
--bonus  Write a query that lists every student and every course, even if there is no enrollment relationship between them
SELECT students.student_name,courses.course_name
FROM students
CROSS JOIN courses;