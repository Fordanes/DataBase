select * from countries;
select * from countries_new;
drop table countries;
drop table countries_new;

--Task 1
create database lab2;

--Task 2
create table countries(
    country_id serial primary key,
    country_name varchar(255),
    region_id int,
    population int
);

--Task 3
insert into countries (country_name, region_id, population)
values('Spain', '13', '9000000');

--Task 4
insert into countries (country_id, country_name)
values (default , 'Spain');

--Task 5
insert into countries (region_id) values(null);

--Task 6
insert into countries (country_name, region_id, population)
values('Russia', 8, 13000000),
      ('Canada', 4, 2000000),
      ('China', 25, 24000000);

--Task 7
alter table countries alter column country_name set default 'KAZAKHSTAN';

--Task 8
insert into countries(country_name) values(default);

--Task 9
insert into countries values (default, default, default, default);

--Task 10
create table countries_new(
    like countries
);

--Task 11
insert into countries_new select*from countries;

--Task 12
update countries_new set region_id=1 where region_id is NULL;

--Task 13
update countries_new set population = population * 1.1 returning  country_name, population as "New Population";

--Task 14
delete from countries where population < 100000;

--Task 15
delete from countries_new as c using countries as cn where c.country_id = cn.country_id returning*;

--Task 16
delete from countries returning*;