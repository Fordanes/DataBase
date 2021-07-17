--Task 1
create database lab3;

--Task 2
CREATE TABLE departments (
  code INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  budget DECIMAL NOT NULL
);

CREATE TABLE employees (
  ssn INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  department INTEGER NOT NULL ,
  city VARCHAR(255),
  FOREIGN KEY (department) REFERENCES departments(code)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  city VARCHAR(255)
);

INSERT INTO departments(code,name,budget) VALUES(14,'IT',65000);
INSERT INTO departments(code,name,budget) VALUES(37,'Accounting',15000);
INSERT INTO departments(code,name,budget) VALUES(59,'Human Resources',240000);
INSERT INTO departments(code,name,budget) VALUES(77,'Research',55000);
INSERT INTO departments(code,name,budget) VALUES(45,'Management',155000);
INSERT INTO departments(code,name,budget) VALUES(11,'Sales',85000);

INSERT INTO employees(ssn,name,lastname,department, city) VALUES('123234877','Michael','Rogers',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('152934485','Anand','Manikutty',14, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('222364883','Carol','Smith',37, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('326587417','Joe','Stevens',37, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332154719','Mary-Anne','Foster',14, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332569843','George','ODonnell',77, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('546523478','John','Doe',59, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('631231482','David','Smith',77, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('654873219','Zacary','Efron',59, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('745685214','Eric','Goldsmith',59, 'Atyrau');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657245','Elizabeth','Doe',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657246','Kumar','Swamy',14, 'Almaty');



INSERT INTO customers(name,lastname, city) VALUES('John','Wills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Garry','Foster', 'London');
INSERT INTO customers(name,lastname, city) VALUES('Amanda','Hills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('George','Doe', 'Tokyo');
INSERT INTO customers(name,lastname, city) VALUES('David','Little', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Shawn','Efron', 'Astana');
INSERT INTO customers(name,lastname, city) VALUES('Eric','Gomez', 'Shymkent');
INSERT INTO customers(name,lastname, city) VALUES('Elizabeth','Tailor', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Julia','Adams', 'Astana');

-- Task 3
select lastname from employees;

-- Task 4
select distinct lastname from employees;

-- Task 5
select * from employees where lastname = 'Smith';

-- Task 6
select * from employees where lastname = 'Smith' or lastname = 'Doe';

-- Task 7
select * from employees where department = 14;

-- Task 8
select * from employees where department = 37 or department = 77;

-- Task 9
select sum(budget) from departments;

-- Task 10
select department, count(*) from employees group by department;

-- Task 11
select department, count(*) from employees group by department having count(*) > 2;

-- Task 12
select name, budget from departments order by budget desc offset 1 limit 1;

-- Task 13
select name, lastname from employees where department = (select code from departments order by budget asc offset 0 limit 1);

-- Task 14
select name from employees where city = 'Almaty' union select name from customers where city = 'Almaty';

-- Task 15
select * from departments where budget > 60000 order by code asc;
select * from departments where budget > 60000 order by code desc;

-- Task 16
update departments set budget = budget * 0.90
where budget = (select budget from departments order by budget asc offset 0 limit 1);
select budget from departments;

-- Task 17
update employees set department = (select code from departments where name = 'IT')
where department = (select code from departments where name = 'Research');
select name from departments;

-- Task 18
delete from employees where department = (select code from departments where name = 'IT');
select * from departments;

-- Task 19
delete from employees where name = 'IT';
delete from employees;