CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

INSERT INTO
    employees (
        employee_name,
        department_name,
        salary,
        hire_date
    )
VALUES (
        'John Doe',
        'HR',
        60000.00,
        '2022-01-10'
    ),
    (
        'Jane Smith',
        'Marketing',
        75000.50,
        '2021-05-22'
    ),
    (
        'Bob Johnson',
        'Finance',
        80000.75,
        '2020-11-15'
    ),
    (
        'Alice Williams',
        'IT',
        90000.25,
        '2019-08-03'
    ),
    (
        'David Lee',
        'Sales',
        65000.50,
        '2020-03-18'
    ),
    (
        'Sara Brown',
        'Engineering',
        70000.00,
        '2021-09-28'
    ),
    (
        'Mike Miller',
        'Customer Support',
        55000.75,
        '2022-02-05'
    ),
    (
        'Emily Davis',
        'Administration',
        95000.00,
        '2018-12-12'
    ),
    (
        'Chris Wilson',
        'Research',
        72000.50,
        '2020-06-30'
    ),
    (
        'Amy White',
        'Quality Assurance',
        68000.25,
        '2021-11-09'
    ),
    (
        'John Johnson',
        'HR',
        62000.00,
        '2022-01-15'
    ),
    (
        'Jessica Thompson',
        'Marketing',
        78000.50,
        '2021-06-05'
    ),
    (
        'Michael Harris',
        'Finance',
        85000.75,
        '2020-11-25'
    ),
    (
        'Emma Martinez',
        'IT',
        92000.25,
        '2019-09-15'
    ),
    (
        'James Taylor',
        'Sales',
        67000.50,
        '2020-04-08'
    ),
    (
        'Sophia Anderson',
        'Engineering',
        72000.00,
        '2021-10-10'
    ),
    (
        'William Jackson',
        'Customer Support',
        56000.75,
        '2022-02-10'
    ),
    (
        'Olivia Nelson',
        'Administration',
        97000.00,
        '2018-12-20'
    ),
    (
        'Daniel White',
        'Research',
        73000.50,
        '2020-07-05'
    ),
    (
        'Ava Wilson',
        'Quality Assurance',
        69000.25,
        '2021-11-15'
    ),
    (
        'Matthew Brown',
        'HR',
        63000.00,
        '2022-01-20'
    ),
    (
        'Emily Garcia',
        'Marketing',
        76000.50,
        '2021-06-15'
    ),
    (
        'Christopher Allen',
        'Finance',
        86000.75,
        '2020-12-05'
    ),
    (
        'Madison Hall',
        'IT',
        93000.25,
        '2019-09-25'
    ),
    (
        'Andrew Cook',
        'Sales',
        68000.50,
        '2020-04-18'
    ),
    (
        'Abigail Torres',
        'Engineering',
        73000.00,
        '2021-10-20'
    ),
    (
        'Ethan Murphy',
        'Customer Support',
        57000.75,
        '2022-02-15'
    ),
    (
        'Ella King',
        'Administration',
        98000.00,
        '2018-12-28'
    ),
    (
        'Nathan Rivera',
        'Research',
        74000.50,
        '2020-07-15'
    ),
    (
        'Mia Roberts',
        'Quality Assurance',
        70000.25,
        '2021-11-20'
    );

SELECT * FROM employees;

-- HR coloume max value function
SELECT max(salary) FROM employees WHERE department_name = 'HR';

-- HR max value upore function
SELECT *
FROM employees
WHERE
    salary > (
        SELECT max(salary)
        FROM employees
        WHERE
            department_name = 'HR'
    );

SELECT *, (
        SELECT sum(salary)
        FROM employees
    ) AS total
FROM employees;

SELECT department_name, sum(salary)
FROM employees
GROUP BY
    department_name;

SELECT *
FROM (
        SELECT department_name, sum(salary)
        FROM employees
        GROUP BY
            department_name
    ) as sum_dept_salary;

-- in multiple coloume and row send

SELECT
    department_name,
    employee_id,
    salary
FROM employees
WHERE
    department_name in (
        SELECT department_name
        FROM employees
        WHERE
            department_name LIKE '%R%'
    );

-- view sql
-- 1. Simplifying comples queries
-- 2. Improved SECURITY
-- 3 Enhanced data abstaction

CREATE VIEW dep_av_salary as
SELECT department_name, avg(salary)
FROM employees
GROUP BY
    department_name;

SELECT * FROM dep_av_salary;

-- procedural approach
CREATE FUNCTION emp_count()
RETURNS INT
LANGUAGE SQL
as
$$
SELECT count(*) FROM employees;
$$

CREATE FUNCTION delete_emp(p_emp_id INT)
RETURNS void
LANGUAGE SQL
as
$$
DELETE FROM employees WHERE employee_id = p_emp_id;
$$

SELECT emp_count ();

SELECT delete_emp (28);

SELECT * FROM employees;
-- non procedural approach

-- PROCEDURE var and declar FUNCTION create and parameter pas
CREATE PROCEDURE remove_emp_var(p_emp_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    test_var INT;
BEGIN
    SELECT employee_id INTO test_var FROM employees WHERE employee_id = p_emp_id;
    DELETE FROM employees WHERE employee_id = test_var;

    RAISE NOTICE 'Employee remove SUCCEEDS';
END;
$$;

CALL remove_emp_var (3)