CREATE table employeds2025 (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    depertment_id INT REFERENCES depertment2025 (depertment_id),
    salary DECIMAL(10, 2),
    hire_date DATE
);

create Table depertment2025 (
    depertment_id SERIAL PRIMARY KEY,
    depertment_name VARCHAR(50)
);

INSERT INTO
    depertment2025 (depertment_name)
VALUES ('Human Resources'),
    ('Finance'),
    ('Marketing'),
    ('Sales'),
    ('Research and Development'),
    ('Customer Support'),
    ('Information Technology'),
    ('Production'),
    ('Logistics'),
    ('Legal');

INSERT INTO
    employeds2025 (
        employee_name,
        depertment_id,
        salary,
        hire_date
    )
VALUES (
        'Hanan',
        5,
        45000.00,
        '2023-06-01'
    ),
    (
        'harun',
        10,
        52000.00,
        '2023-08-15'
    ),
    (
        'Sokina',
        10,
        48000.00,
        '2022-11-20'
    );

SELECT * FROM depertment2025;

SELECT * FROM employeds2025;

DROP TABLE depertment2025;

DROP TABLE employeds2025;

SELECT *
FROM
    employeds2025
    JOIN depertment2025 ON employeds2025.depertment_id = depertment2025.depertment_id;

SELECT *
FROM employeds2025
    JOIN depertment2025 USING (depertment_id);

SELECT depertment_name, round(avg(salary)), count(*)
FROM employeds2025
    JOIN depertment2025 USING (depertment_id)
GROUP BY
    depertment_name;

-- find the department name with heighest avrage salary
SELECT employee_name, salary
FROM employeds2025
WHERE
    salary = (
        SELECT MAX(salary)
        FROM employeds2025
    );

SELECT depertment_name, avg(salary) as avg_salary
FROM employeds2025
    JOIN depertment2025 USING (depertment_id)
GROUP BY
    depertment_name
ORDER BY avg_salary DESC
LIMIT 1
    -- LIMIT 3
;

-- count employess  hired each year
SELECT (
        YEAR
        FROM hire_date
    ) as hire_Year, count(*)
FROM employeds2025
GROUP BY
    hire_Year;

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);
-- Inserting sample data into the orders table
INSERT INTO
    orders (
        customer_id,
        order_date,
        total_amount
    )
VALUES (1, '2022-01-05', 100.50),
    (2, '2022-01-07', 200.75),
    (1, '2022-01-08', 150.25),
    (3, '2022-01-10', 300.00),
    (2, '2022-01-15', 180.50),
    (3, '2022-01-20', 220.25),
    (1, '2022-01-25', 90.00),
    (2, '2022-01-28', 120.75),
    (3, '2022-02-01', 250.50),
    (1, '2022-02-05', 180.25);

INSERT INTO
    orders (
        customer_id,
        order_date,
        total_amount
    )
VALUES (8, '2022-08-05', 100.50),
    (9, '2022-09-05', 100.50),
    (10, '2022-10-05', 100.50);

SELECT * FROM orders;

SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_spent
FROM orders
GROUP BY
    customer_id
HAVING
    count(order_id) > 2;

SELECT TO_CHAR(order_date, 'YYYY-MM') AS month,
       SUM(total_amount) AS total_amount
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2022
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY month;

SELECT TO_CHAR(order_date, 'YYYY-MM') as month, sum(total_amount) as total_sale
FROM orders
WHERE
    extract(
        year
        FROM order_date
    ) = 2022
GROUP BY
    to_char(order_date, 'YYYY-MM')
ORDER BY month;