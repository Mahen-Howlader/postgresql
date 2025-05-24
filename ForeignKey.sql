CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(23) NOT NULL
)

CREATE Table post (
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    -- user_id INTEGER REFERENCES "user"(id) ON DELETE CASCADE
    -- user_id INTEGER REFERENCES "user"(id) ON DELETE set NULL
    user_id INTEGER REFERENCES "user" (id) ON DELETE set DEFAULT DEFAULT 2
)

-- Data Insertion

INSERT INTO
    "user" (user_name)
VALUES ('akash'),
    ('mahin'),
    ('hasan'),
    ('raju'),
    ('sagor'),
    ('ssdfr')

INSERT INTO
    post (title, user_id)
VALUES (
        'Enjoy with sunny day with Akash',
        2
    ),
    ('Learning MySQL is fun!', 1),
    (
        'Today''s weather is perfect for coding',
        3
    ),
    (
        'Exploring the beauty of nature',
        4
    );

DROP Table post;

DROP Table "user";

ALTER Table post alter COLUMN user_id set NOT NULL;

INSERT INTO
    post (title, user_id)
VALUES (
        'Enjoy with sunny day with Akash',
        NULL
    )

DELETE FROM "user" WHERE id = 4;

SELECT * FROM "user";

SELECT * FROM post;

-- Joining Tables with Inner Join
-- as name change table COLUMN
SELECT user_name, title
FROM "user" as u
    JOIN post as p on p.user_id = u.id;

INSERT INTO post (title, user_id) VALUES ('last', NULL);

-- Understanding Left and Right Joins

SELECT * FROM "user" as u JOIN post as p on p.user_id = u.id;

SELECT * FROM post left JOIN "user" on post.user_id = "user".id

SELECT * FROM post RIGHT JOIN "user" on post.user_id = "user".id

SELECT * FROM post FULL JOIN "user" on post.user_id = "user".id