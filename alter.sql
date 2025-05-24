-- Active: 1747608045198@@127.0.0.1@5432@ph
SELECT * FROM person2;

-- add COLUMN
ALTER TABLE person2
    ADD COLUMN email VARCHAR(25) NOT NULL DEFAULT 'default@gmail.com';

-- add data INSERT default value
INSERT INTO person2 VALUES(2, 'hasan', 32)

-- add data insert 
INSERT INTO person2 VALUES(3, 'test', 34, 'test@gmail.com')


-- delete COLUMN email
ALTER TABLE person2
    DROP COLUMN email;

-- colume name rename 
ALTER TABLE person2
    RENAME COLUMN age to user_age;


-- VARCHAR() vlaue change 
ALTER TABLE person2
    ALTER COLUMN user_name TYPE VARCHAR(50);


-- set CONSTRAINT
ALTER TABLE person2
    ALTER COLUMN user_age set NOT NULL;


-- remove CONSTRAINT
ALTER TABLE person2
    ALTER COLUMN user_age DROP NOT NULL;


-- UNIQUE age 
ALTER TABLE person2
    ADD constraint person_age_unique UNIQUE(user_age);


-- DROP age 
ALTER TABLE person2
    DROP constraint person_age_unique;
