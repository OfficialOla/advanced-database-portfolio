-- Create a partitioned student table
CREATE TABLE p5_student_partitioned (
    student_id INTEGER NOT NULL,
    matric_no VARCHAR(30) NOT NULL,
    full_name VARCHAR(120) NOT NULL,
    department_id INTEGER NOT NULL,
    PRIMARY KEY (student_id),
    FOREIGN KEY (department_id)
        REFERENCES department(department_id)
)
PARTITION BY RANGE (student_id);

-- First partition: student IDs below 1000
CREATE TABLE p5_student_partition_1
PARTITION OF p5_student_partitioned
FOR VALUES FROM (MINVALUE) TO (1000);

-- Second partition: student IDs from 1000 upwards
CREATE TABLE p5_student_partition_2
PARTITION OF p5_student_partitioned
FOR VALUES FROM (1000) TO (MAXVALUE);

-- Copy existing student records
INSERT INTO p5_student_partitioned
    (student_id, matric_no, full_name, department_id)
SELECT
    student_id, matric_no, full_name, department_id
FROM student;