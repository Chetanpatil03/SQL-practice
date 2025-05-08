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
-- que 1: find the student who got higher marks than  class average marks

-- my way :  
select name,marks from students where marks >= (select avg(marks) from students);

-- her way : 
-- find average marks
select avg(marks) from students;

-- names
select name,marks from students where marks >  87.6667;

-- combined way (dynamic way ) : if it increases or decreases avgerage it doesn't affect
select name,marks from students where marks > (select avg(marks) from students);

-- Que 2 : find the students who have even roll numbers

-- my way :  

select rollno,name from students where rollno % 2 = 0;  -- even numbers 
select rollno,name from students where not rollno % 2 = 0;  -- odd numberes

-- her way :
-- 1 step :
SELECT 
    rollno
FROM
    student
WHERE
    rollno % 2 = 0;
    
-- step 2 :

SELECT 
    rollno, name
FROM
    students
WHERE
    rollno IN (102 , 104, 106);


-- combined way (dynamic )

select rollno,name
from students
where rollno in (select rollno from students where rollno % 2 = 0);


   





