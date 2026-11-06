
-- MIT 8103 Advanced Database Systems
-- AEU Student Result Management System
-- Portfolio 1: Database Design and Modelling

-- 1. Department
CREATE TABLE department (
    department_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Student
CREATE TABLE student (
    student_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    matric_no VARCHAR(30) NOT NULL UNIQUE,
    full_name VARCHAR(120) NOT NULL,
    email VARCHAR(120) UNIQUE,
    department_id INTEGER NOT NULL,
    CONSTRAINT fk_student_department
        FOREIGN KEY (department_id)
        REFERENCES department(department_id)
);

-- 3. Lecturer
CREATE TABLE lecturer (
    lecturer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    department_id INTEGER NOT NULL,
    CONSTRAINT fk_lecturer_department
        FOREIGN KEY (department_id)
        REFERENCES department(department_id)
);

-- 4. Course
CREATE TABLE course (
    course_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_code VARCHAR(15) NOT NULL UNIQUE,
    course_title VARCHAR(120) NOT NULL,
    credit_unit INTEGER NOT NULL
        CHECK (credit_unit BETWEEN 1 AND 6),
    department_id INTEGER NOT NULL,
    CONSTRAINT fk_course_department
        FOREIGN KEY (department_id)
        REFERENCES department(department_id)
);

-- 5. Semester
CREATE TABLE semester (
    semester_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    academic_year VARCHAR(15) NOT NULL,
    CONSTRAINT uq_semester UNIQUE (name, academic_year)
);

-- 6. Course Offering
CREATE TABLE course_offering (
    offering_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_id INTEGER NOT NULL,
    lecturer_id INTEGER NOT NULL,
    semester_id INTEGER NOT NULL,

    CONSTRAINT fk_offering_course
        FOREIGN KEY (course_id)
        REFERENCES course(course_id),

    CONSTRAINT fk_offering_lecturer
        FOREIGN KEY (lecturer_id)
        REFERENCES lecturer(lecturer_id),

    CONSTRAINT fk_offering_semester
        FOREIGN KEY (semester_id)
        REFERENCES semester(semester_id),

    CONSTRAINT uq_course_semester
        UNIQUE (course_id, semester_id)
);

-- 7. Enrollment
CREATE TABLE enrollment (
    enrollment_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id INTEGER NOT NULL,
    offering_id INTEGER NOT NULL,
    ca_score NUMERIC(5,2) NOT NULL DEFAULT 0,
    exam_score NUMERIC(5,2) NOT NULL DEFAULT 0,

    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (student_id)
        REFERENCES student(student_id),

    CONSTRAINT fk_enrollment_offering
        FOREIGN KEY (offering_id)
        REFERENCES course_offering(offering_id),

    CONSTRAINT chk_ca_score
        CHECK (ca_score BETWEEN 0 AND 40),

    CONSTRAINT chk_exam_score
        CHECK (exam_score BETWEEN 0 AND 60),

    CONSTRAINT uq_student_offering
        UNIQUE (student_id, offering_id)
);
