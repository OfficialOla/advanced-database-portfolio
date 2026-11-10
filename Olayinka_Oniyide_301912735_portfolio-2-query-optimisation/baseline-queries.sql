SELECT
    s.matric_no,
    s.full_name,
    c.course_code,
    c.course_title,
    e.ca_score,
    e.exam_score,
    (e.ca_score + e.exam_score) AS total_score
FROM enrollment e
JOIN student s
    ON e.student_id = s.student_id
JOIN course_offering co
    ON e.offering_id = co.offering_id
JOIN course c
    ON co.course_id = c.course_id
ORDER BY s.matric_no, c.course_code;

SELECT
    s.matric_no,
    s.full_name,
    c.course_code,
    (e.ca_score + e.exam_score) AS total_score
FROM enrollment e
JOIN student s
    ON e.student_id = s.student_id
JOIN course_offering co
    ON e.offering_id = co.offering_id
JOIN course c
    ON co.course_id = c.course_id
WHERE (e.ca_score + e.exam_score) >= 80
ORDER BY total_score DESC;

SELECT
    c.course_code,
    c.course_title,
    ROUND(AVG(e.ca_score + e.exam_score), 2) AS average_score
FROM enrollment e
JOIN course_offering co
    ON e.offering_id = co.offering_id
JOIN course c
    ON co.course_id = c.course_id
GROUP BY c.course_code, c.course_title
ORDER BY average_score DESC;