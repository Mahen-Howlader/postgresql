SHOW timezone;


SELECT now();

CREATE table timez(ts TIMESTAMP without time zone, tsx TIMESTAMP with time zone);

INSERT into timez VALUES('20024-01-12 10:45:00', '2025-01-12 10:45:00');

SELECT * from timez;


SELECT CURRENT_DATE;

SELECT now()::date;

SELECT now()::time;

SELECT to_char(now(), 'yyyy/mm/dd');


SELECT CURRENT_DATE - INTERVAL '1 year '; 

SELECT age(CURRENT_DATE, '2004-07-29');


SELECT *, age(CURRENT_DATE, dot) from student;

SELECT EXTRACT(MONTH FROM '2025-05-21'::date);

SELECT NOW() AT TIME ZONE 'Asia/Dhaka';

CREATE TABLE eventss (
  id SERIAL PRIMARY KEY,
  name TEXT,
  event_date DATE
);


-- GROUP BY


-- কোন কোন কান্ট্রি ছাত্র আছে সেটা দেখা যাবে
-- তার সাথে কোন কোন কান্ট্রির কয়জন ছাত্র আছে সেটা দেখা যাবে count(*)

SELECT country, count(*) from student
    GROUP BY country;



SELECT country, count(*), avg(age) from student
    GROUP BY country
    HAVING avg(age) > 23;


SELECT * FROM student;

SELECT extract(YEAR FROM dot) as birth_day , count(*)
    FROM student
    GROUP BY birth_day;