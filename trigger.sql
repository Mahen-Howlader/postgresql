-- CREATE TRIGGER trigger_name
-- {BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE}
-- ON table_name
-- [FOR EACH ROW]
-- EXECUTE FUNCTION function_name();

CREATE TABLE my_user (
    user_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO
    my_user (user_name, email)
VALUES (
        'mahin howlader',
        'mahinhowlader123@gmail.com'
    ),
    ('Hasan', 'hasan123@gmail.com'),
    ('Anik', 'Anik123@gmail.com');

DROP Table my_user;


CREATE Table deleted_user_audit (
    delete_User_name VARCHAR(50),
    deletedAt TIMESTAMP
)


-- tigger function 
CREATE OR REPLACE Function save_deleted_user()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
BEGIN
    INSERT INTO deleted_user_audit VALUES(OLD.user_name, now());
    RAISE NOTICE 'user audit log created';
    RETURN OLD;
END
$$;

CREATE OR REPLACE Trigger save_delete_user_tigger
BEFORE DELETE
on my_user
for each ROW
EXECUTE FUNCTION save_deleted_user();


DELETE FROM my_user WHERE user_name = 'mahin howlader';


SELECT * FROM deleted_user_audit;
SELECT * FROM my_user;
