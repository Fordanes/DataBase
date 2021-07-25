-- Task 1
create database lab5;
-- Task 2
create table customers (
    customer_id integer,
    cust_name varchar(50),
    city varchar(50),
    grade integer,
    salesman_id integer
);

create table orders (
    ord_no integer,
    purch_amt float,
    ord_date date,
    customer_id integer,
    salesman_id integer
);

insert into customers(customer_id, cust_name, city, grade, salesman_id) values
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3001, 'Brad Guzan', 'London', null, 5005),
    (3004, 'Fabian Johns', 'Paris', 300, 5006),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3009, 'Geoff Camero', 'Berlin', 100, 5003),
    (3008, 'Julian Green', 'London', 300, 5002);

select * from customers;

insert into orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) values
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5), '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001);

select * from orders;

-- Task 3
select sum(purch_amt) from orders;
-- Task 4
select avg(purch_amt) from orders;
-- Task 5
select count(cust_name) from customers where customers.cust_name is not null;
-- Task 6
select min(purch_amt) from orders;
-- Task 7
insert into customers(cust_name) values('Kebab');
select * from customers where cust_name like '%b%';
-- Task 8
select * from orders where orders.customer_id in (
    select customers.customer_id from customers where customers.city = 'New York'
    );
-- Task 9
select * from customers where customers.customer_id in (
    select orders.customer_id from orders where orders.purch_amt > 10
    );
-- Task 10
select sum(grade) from customers;
-- Task 11
select cust_name from customers where customers.cust_name is not null;
-- Task 12
select max(grade) from customers;
