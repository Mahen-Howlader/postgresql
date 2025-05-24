CREATE Table student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL, 
    age  INT,
    great CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dot DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
)

INSERT INTO student (first_name, last_name, age, great, course, email, dot, blood_group, country)
VALUES
('John', 'Doe', 20, 'A', 'Computer Science', 'john.doe@example.com', '2025-05-01', 'O+', 'USA'),
('Jane', 'Smith', 22, 'B', 'Mathematics', 'jane.smith@example.com', '2025-05-02', 'A-', 'Canada'),
('Ali', 'Khan', 21, 'A+', 'Engineering', 'ali.khan@example.com', '2025-05-03', 'B+', 'Pakistan'),
('Rahul', 'Jha', 24, 'A', 'Information Technology', '', '2025-05-05', 'O-', 'Arua');
('Maria', 'Garcia', 23, 'B-', 'Biology', 'maria.garcia@example.com', '2025-05-04', 'AB+', 'Spain'),
('Rahul', 'Jha', 24, 'A', 'Information Technology', 'rahul.jha@example.com', '2025-05-05', 'O-', 'India');
('Rahul', 'Jha', 24, 'A', 'Information Technology', 'rahul.jha@example.com', '2025-05-05', 'O-', 'Andia');
('Rahul', 'Jha', 24, 'A', 'Information Technology', 'rahul.jha@example.com', '2025-05-05', 'O-', 'Arua');


SELECT email as "student_email" FROM student;

-- ASSERTION
SELECT * FROM student ORDER BY age DESC;

-- DESCNDING
SELECT * FROM student ORDER BY age ASC;


SELECT country FROM student ORDER BY country ASC; 


SELECT DISTINCT country FROM student; 
SELECT DISTINCT blood_group FROM student; 


SELECT * FROM student
    WHERE country = 'USA';


SELECT * FROM student
    WHERE great = 'A' AND course = 'Computer Science';


SELECT * FROM student;


SELECT * FROM student
    WHERE blood_group = 'O+';


SELECT * FROM student
    WHERE country = 'USA' OR country = 'Pakistan' AND age = '20';

SELECT * FROM student
    WHERE age > 20;

SELECT * FROM student
    WHERE age < 22;

SELECT * FROM student
    WHERE age != 20;
SELECT * FROM student
    WHERE age <> 20;



-- FUNCTION
SELECT upper(first_name) FROM student;

SELECT concat(first_name , ' ', last_name) FROM student;


SELECT sum(age) FROM student;


SELECT max(length(first_name)) FROM student;

INSERT INTO student (first_name, last_name, age, great, course, email, dot, blood_group, country)
VALUES
('John', 'Doe', 20, 'A', 'Computer Science', 'john.doe@example.com', '2025-05-01', 'O+', 'USA'),
('Jane', 'Smith', 22, 'B', 'Mathematics', 'jane.smith@example.com', '2025-05-02', 'A-', 'Canada'),
('Ali', 'Khan', 21, 'A+', 'Engineering', 'ali.khan@example.com', '2025-05-03', 'B+', 'Pakistan'),
('Rahul', 'Jha', 24, 'A', 'Information Technology', NULL, '2025-05-05', 'O-', 'Arua'),
('Maria', 'Garcia', 23, 'B-', 'Biology', 'maria.garcia@example.com', '2025-05-04', 'AB+', 'Spain'),
('Rahul', 'Jha', 24, 'A', 'Information Technology', 'rahul.jha@example.com', '2025-05-05', 'O-', 'India'),
('Rahul', 'Jha', 24, 'A', 'Information Technology', 'rahul.jha@example.com', '2025-05-05', 'O-', 'Andia'),
('Rahul', 'Jha', 24, 'A', 'Information Technology', 'rahul.jha@example.com', '2025-05-05', 'O-', 'Arua');

SELECT * FROM student
    WHERE NOT country = 'USA';


SELECT * FROM student
    WHERE email IS  NULL;

SELECT * FROM student
    WHERE email IS NOT  NULL;


    SELECT COALESCE(email, 'Email is not provide -------')  FROM student;

    SELECT COALESCE(email, 'Email is not provide -------') as "EMAIL NAME"  FROM student;
    

    SELECT * FROM student
WHERE country IN ('India', 'Canada', 'USA');


SELECT * FROM student
WHERE dot BETWEEN '2025-01-01' and '2025-05-01' ORDER BY dot;


SELECT * FROM student LIMIT 5 OFFSET 0;
SELECT * FROM student LIMIT 5 OFFSET 5 * 1;
SELECT * FROM student LIMIT 5 OFFSET 5 * 2;
SELECT * FROM student LIMIT 5 OFFSET 5 * 3;


SELECT * FROM student 
    WHERE country IN('USA', 'UK', 'Canada') LIMIT 5;



DELETE FROM student
    WHERE great = 'C' AND country = 'USA';
