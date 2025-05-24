CREATE Table employess (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
)

CREATE Table department (
    dept_id INT,
    dept_name VARCHAR(50)
)

-- eemployess
INSERT INTO employess VALUES (1, 'joe done', 101);

INSERT INTO employess VALUES (2, 'Dears done', 102);



-- department
-- department
INSERT INTO department
VALUES (101, 'gorurandi 101');

INSERT INTO department
VALUES (102, 'Torki 102');

DROP Table department;

SELECT * FROM department;
SELECT * FROM employess;



SELECT * FROM employess
CROSS JOIN department; 



-- Natural Joins

SELECT * FROM employess 
NATURAL JOIN department;