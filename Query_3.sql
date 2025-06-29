create database school;
use school;

create table dept (
dept_id int primary key,
dept_name varchar(10) not null);

create table teacher(
id int primary key auto_increment,
t_name varchar(10) not null,
department_id int references dept(dept_id)
ON UPDATE CASCADE 
ON DELETE CASCADE
);

-- cascade in Foreign key is on update and on delete cascade whene something is deleted or updated in main/parent table it have to reflect to the reference/child table.
--  cascade is used to create this scenario it automatically refelects the changes into reference table.alter
-- Syntax : ON UPDATE CASCADE , ON DELETE CASCADE;  
ALTER TABLE teacher auto_increment = 1;

INSERT INTO dept (dept_id, dept_name) VALUES
(1, 'Science'),
(2, 'Math'),
(3, 'English'),
(4, 'History'),
(5, 'Arts');

select * from dept;

INSERT INTO teacher (t_name, department_id) VALUES 
('Alice', 1),
('Bob', 2),
('Carol', 3),
('David', 4),
('Eve', 5);

select * from teacher;
select * from dept;


UPDATE dept 
SET 
    dept_name = 'Social'
WHERE
    dept_name = 'Arts';
    
UPDATE dept 
SET 
    dept_id = 101
WHERE
    dept_id = 5;


DROP table teacher;

create table students(
	id int primary key,
    name varchar(20),
    age int not null    
);

desc stud;

-- renames the table 
alter table students rename to stud;

-- add a column to existing table 
alter table stud add column marks int not null default 34;

-- drop a column from table
alter table stud drop column marks;

-- rename column with constraint
alter table stud change column marks stud_marks int not null;

-- modify the existing column datatype or constraint 
alter table stud modify stud_marks varchar(25) not null;  

-- truncate is used delete the data of the table

TRUNCATE TABLE stud; 


-- joins  inner, left outer,right outer,full outer joins

insert into teacher(t_name) values ("chetan"),("Prafull");
insert into dept values (6,"Computer"),(7,"Civil");

select * from dept;
select * from teacher;

-- inner join equal values are in result table

select * from
teacher inner join dept
where 
teacher.department_id = dept.dept_id;
	
-- example 
-- printing the name of teachers with its appropriate departments.
select teacher.t_name, dept.dept_name from
teacher inner join  dept
on  
teacher.department_id = dept.dept_id;

-- at the place of on we can write where also in inner join
-- alies name like an object or temporary name

select * from teacher as t
join dept as d
on 
t.department_id = d.dept_id; 

-- Left join : it return all record from left table and matched record from right table

select * from teacher as t
left join dept as d
on t.department_id = d.dept_id; 


-- Right join : it return all record from right table and matched record from left table

select * from teacher as t
right join dept as d
on t.department_id = d.dept_id; 


-- Full join or Full outer join : return all data from both the tables

select * from teacher as t
left join dept as d
on t.department_id = d.dept_id
UNION
select * from teacher as t
right join dept as d
on t.department_id = d.dept_id; 


-- Some other types of joins that are not commanly used
-- Left exclusive and Right exclusive joins

-- Left exclusive : only shows data that are unmatched form left table
select * from teacher as t
left join dept as d
on t.department_id = d.dept_id
where d.dept_id is null; 
   
   
-- Right exclusive : only shows data that are unmatched form Right table
select * from teacher as t
Right join dept as d
on t.department_id = d.dept_id
where t.department_id is null; 

-- Full exclusive join : which is used to combine the both exclsuive joins


select * from teacher as t
left join dept as d
on t.department_id = d.dept_id
where d.dept_id is null
UNION
select * from teacher as t
Right join dept as d
on t.department_id = d.dept_id
where t.department_id is null; 

-- Self join : which join same table

create table emp(
id int primary key,
emp_name varchar(10),
manager_id int);

desc emp;

INSERT INTO emp (id, emp_name, manager_id) VALUES (101, 'adam', 103);
INSERT INTO emp (id, emp_name, manager_id) VALUES (102, 'bob', 104);
INSERT INTO emp (id, emp_name, manager_id) VALUES (103, 'casey', NULL);
INSERT INTO emp (id, emp_name, manager_id) VALUES (104, 'donald', 103);

select * from emp;

-- ex

select a.emp_name as manager_id,b.emp_name
from emp as a 
join emp as b
on a.id = b.manager_id;
 
 select * 
from emp as a 
join emp as b
on a.id = b.manager_id;


-- Union in SQL : 
-- it combines the result set of two or more tables
-- gives unique values

--  ex:

	select emp_name from emp
    union
    select emp_name from emp;
    
    
    select emp_name from emp
    union 
    select t_name from teacher;
  
  
  -- union all : gives duplicate values 
  	select emp_name from emp
    union all
    select emp_name from emp;


