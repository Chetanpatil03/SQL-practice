create database if not exists Xyz_ltd;
show databases;
show tables;
-- Question number one 
CREATE TABLE employee(
id int,
name varchar(20),
salary float);

insert into employee values(1,"adam",25000),
(2,"bob",30000),
(3,"casey",40000);

select * from employees;
-- rename a table.
alter table employee rename employees;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer VARCHAR(100),
    mode VARCHAR(50),
    city VARCHAR(100)
);

INSERT INTO customers (customer_id, customer, mode, city) VALUES
(101, 'Olivia Barrett', 'Netbanking', 'Portland'),
(102, 'Ethan Sinclair', 'Credit Card', 'Miami'),
(103, 'Maya Hernandez', 'Credit Card', 'Seattle'),
(104, 'Liam Donovan', 'Netbanking', 'Denver'),
(105, 'Sophia Nguyen', 'Credit Card', 'New Orleans'),
(106, 'Caleb Foster', 'Debit Card', 'Minneapolis'),
(107, 'Ava Patel', 'Debit Card', 'Phoenix'),
(108, 'Lucas Carter', 'Netbanking', 'Boston'),
(109, 'Isabella Martinez', 'Netbanking', 'Nashville'),
(110, 'Jackson Brooks', 'Credit Card', 'Boston');


select * from customers;

select mode,count(mode) from customers group by mode;
select mode,city,count(mode) from customers group by mode,city;

