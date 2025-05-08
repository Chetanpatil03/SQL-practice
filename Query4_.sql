CREATE DATABASE demo;
use demo;


CREATE TABLE students(
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

INSERT INTO students (rollno, name, marks) VALUES (101, 'anil', 78),
(102, 'bhumika', 93),
(103, 'chetan', 85),
(104, 'dhruv', 96),
(105, 'emanuel', 92),
(106, 'farah', 82);

select * from students;


-- SubQueries : nested/inner queries
--  query inside query (outer query)

-- ex:


