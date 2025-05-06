create database college;
use college;

create database  if not exists college;

create table students(
	id int primary key,
    name varchar(20),
    age int not null    
);

desc students;

insert into students values(1,"Chetan",22);
insert into students values(2,"Prakash",25);

show tables;
desc stud;



create table stud(
	roll_no int primary key,
    name varchar(20) not null,
    marks int not null,
    grade varchar(2),
    city varchar(20)
);

insert into stud(roll_no,name,marks,grade,city) values
(101,"Prakash",70,'B',"Shahada"),
(102,"Dipak",80,'A',"Dhule"),
(103,"Chetan",85,'A',"Nandurbar"),
(104,"Bhavesh",75,'B+',"Shahada"),
(105,"Navjit",70,'B',"Jalgoan");

select * from stud;
select city from stud;

select distinct city from stud;

select * from stud where marks >= 75;
select * from stud where city = "Shahada";

select * from stud where city = "Shahada" AND marks >=75;
select * from stud where city = "Shahada" OR marks >=75;

select * from stud where marks  between 80 and 90;

select * from stud where city in ("Nandurbar","Mumbai","Delhi");

select * from stud where city not in ("Nandurbar","Mumbai","Delhi");

select * from stud where marks not between 80 and 90;

select * from stud limit 3; -- sets the limit of 3

select * from stud where marks >= 75 limit 3; -- sets the limit of 3

select * from stud order by marks desc limit 3; -- sets the limit of 3

select * from stud order by name;  

select * from stud where marks in (select max(marks) from stud);-- finding who has highest marks.
select count(name) from stud;

select city ,count(name) from stud group by city;

-- select * from stud group by city order by asc;
 
select city,avg(marks) from stud group by city;

select city,avg(marks) from stud group by city order by city;

select city,name, count(name) from stud group by city,name order by city asc;


select * from stud;

select grade,count(roll_no) from stud group by grade order by grade;

select city, count(name) from stud group by city;
select city, count(name) from stud group by city having max(marks) >= 80; 







  
