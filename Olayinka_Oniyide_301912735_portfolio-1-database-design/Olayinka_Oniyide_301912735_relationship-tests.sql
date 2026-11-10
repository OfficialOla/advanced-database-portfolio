SELECT
    s.matric_no,
    s.full_name,
    d.name AS department
FROM student s
JOIN department d
    ON s.department_id = d.department_id;