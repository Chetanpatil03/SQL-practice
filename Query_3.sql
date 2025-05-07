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
teacher join dept
where 
teacher.department_id = dept.dept_id;

-- example 
-- printing the name of teachers with its appropriate departments.
select teacher.t_name, dept.dept_name from
teacher join dept
where 
teacher.department_id = dept.dept_id;



