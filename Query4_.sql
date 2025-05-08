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

alter table students add column city varchar(20) default "mumbai";

select * from students;

update students set city = "Delhi" where rollno in (104,105,106);


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

SELECT 
    rollno, name
FROM
    students
WHERE
    rollno IN (SELECT 
            rollno
        FROM
            students
        WHERE
            rollno % 2 = 0);
            
-- Que 3 : find the max marks from students of delhi

-- my way : 

select name,rollno from students where city = "Delhi" and marks in (select max(marks) from students);

-- her way : 
	-- step 1 :
    select rollno from students where city = "Delhi"; 
	
    -- step 2 : 
    select max(marks) from students where rollno in (104,105,106);
    
    
-- best way / subquery in from part

select max(marks) from (select * from students where city = "Delhi") as temp;
-- alice is must (as temp)

-- mumbai students
select max(marks) from (select * from students where city = "Mumbai") as temp;

-- easiest way to solve this question 
select max(marks) from students where city = "Mumbai";


-- Select part : 

select (select max(marks) from students) as max ,name from students;
-- not much useful
-- the subqueries are mostly used in where part/location


-- views in SQL : virtual tables which is work like sub table of an actual table without affecting the origianl values
-- can used to restrict the access of the original table and also for data hiding( abstraction).

-- ex : 
	-- creating
	create view delhi_stud as 
    select * from students where city = "Delhi";
    
    -- using 
    select * from delhi_stud;

	create view view1 as 
    select rollno,name from students;
    
    select * from view1;
    
    drop view view1;




    
    





