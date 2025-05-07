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

alter table students rename to stud;
alter table stud add column marks int not null default 34;














-- printing the name of teachers with its appropriate departments.
 
select teacher.t_name, dept.dept_name from
teacher join dept
where 
teacher.department_id = dept.dept_id;



