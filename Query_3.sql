create database school;
use school;

create table dept (
dept_id int primary key,
dept_name varchar(10) not null);

create table teacher(
id int primary key auto_increment,
t_name varchar(10) not null,
department_id int references dept(dept_id)
);

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













-- printing the name of teachers with its appropriate departments.
 
select teacher.t_name, dept.dept_name from
teacher join dept
where 
teacher.department_id = dept.dept_id;



