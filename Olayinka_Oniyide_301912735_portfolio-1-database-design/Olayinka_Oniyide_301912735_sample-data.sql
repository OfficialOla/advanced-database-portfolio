
-- MIT 8103
-- Portfolio 1: Sample University Data

BEGIN;

-- 1. Departments
INSERT INTO department (name)
VALUES
('Computer Science'),
('Information Technology');

-- 2. Students
INSERT INTO student
(matric_no, full_name, email, department_id)
SELECT
    v.matric_no,
    v.full_name,
    v.email,
    d.department_id
FROM (VALUES
    ('AEU001', 'John Mensah', 'john@aeu.edu', 'Computer Science'),
    ('AEU002', 'Mary James', 'mary@aeu.edu', 'Computer Science'),
    ('AEU003', 'Peter Okoro', 'peter@aeu.edu', 'Information Technology')
) AS v(matric_no, full_name, email, department_name)
JOIN department d ON d.name = v.department_name;

-- 3. Lecturers
INSERT INTO lecturer (full_name, department_id)
SELECT v.full_name, d.department_id
FROM (VALUES
    ('Dr. Samuel Ade', 'Computer Science'),
    ('Dr. Grace Bello', 'Information Technology')
) AS v(full_name, department_name)
JOIN department d ON d.name = v.department_name;

-- 4. Courses
INSERT INTO course
(course_code, course_title, credit_unit, department_id)
SELECT
    v.course_code,
    v.course_title,
    v.credit_unit,
    d.department_id
FROM (VALUES
    ('CSC401', 'Advanced Database Systems', 3, 'Computer Science'),
    ('CSC402', 'Distributed Computing', 3, 'Computer Science'),
    ('IT401', 'Cloud Computing', 2, 'Information Technology')
) AS v(course_code, course_title, credit_unit, department_name)
JOIN department d ON d.name = v.department_name;

-- 5. Semester
INSERT INTO semester (name, academic_year)
VALUES ('First Semester', '2026/2027');

-- 6. Course Offerings
INSERT INTO course_offering
(course_id, lecturer_id, semester_id)
SELECT
    c.course_id,
    l.lecturer_id,
    s.semester_id
FROM (VALUES
    ('CSC401', 'Dr. Samuel Ade'),
    ('CSC402', 'Dr. Samuel Ade'),
    ('IT401', 'Dr. Grace Bello')
) AS v(course_code, lecturer_name)
JOIN course c ON c.course_code = v.course_code
JOIN lecturer l ON l.full_name = v.lecturer_name
JOIN semester s
    ON s.name = 'First Semester'
   AND s.academic_year = '2026/2027';

-- 7. Student Enrollments
INSERT INTO enrollment
(student_id, offering_id, ca_score, exam_score)
SELECT
    st.student_id,
    o.offering_id,
    v.ca_score,
    v.exam_score
FROM (VALUES
    ('AEU001', 'CSC401', 35, 55),
    ('AEU001', 'CSC402', 30, 50),
    ('AEU002', 'CSC401', 32, 48),
    ('AEU002', 'CSC402', 35, 55),
    ('AEU003', 'IT401', 30, 45)
) AS v(matric_no, course_code, ca_score, exam_score)
JOIN student st ON st.matric_no = v.matric_no
JOIN course c ON c.course_code = v.course_code
JOIN semester s
    ON s.name = 'First Semester'
   AND s.academic_year = '2026/2027'
JOIN course_offering o
    ON o.course_id = c.course_id
   AND o.semester_id = s.semester_id;

COMMIT;
