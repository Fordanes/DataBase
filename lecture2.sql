drop table films;
create table films
(
    id     serial primary key,
    title  varchar(8),
    genre  varchar(255),
    length varchar(255),
    constraint title_unique unique (title)
);

insert into films (title, genre, length)
VALUES ('Some film3', 'Drama', '120 mins');

select * from films;

create table comedy_films
(
    count_of_jokes integer
)
    inherits (films);

create table horror_films
(
    count_horror_scenes integer
)
    inherits (films);



alter table films
    add column country varchar(255);

alter table only films
    add column date_of_prod date;

alter table only films
    alter column country set data type varchar(100);

alter table films
    drop column country;

alter table films
    alter column length set data type varchar(100);

alter table films
    alter column length set data type integer using length::integer;
alter table films
    alter column length type integer using length::integer;

alter table films
    alter column genre set default 'Comedy';
alter table films
    alter column genre drop default;

alter table films
    alter column genre set not null;
alter table films
    alter column genre drop not null;


alter table films
    add constraint genre_unq unique (genre);



select *
from films;
update films
set length='120';



create table session
(
    id      integer primary key,
    film_id integer references films,
    time    timestamp
);


insert into session (id, film_id, time) VALUES (1, 1, now());


select * from session;

drop table session;
drop table comedy_films restrict;
drop table films cascade;


insert into films (id, title, genre, length)
VALUES (1, 'Some film', 'Drama', '120 mins');

select *
from films;

select *
from comedy_films;

select *
from horror_films;

insert into comedy_films (id, title, genre, length, count_of_jokes)
VALUES (1, 'Some film', 'Comedy', '120 mins', 15);


insert into horror_films (id, title, genre, length, count_horror_scenes)
VALUES (1, 'Some film', 'Horror', '120 mins', 10);



create table films_copy
(
    like films
);

drop tablespace fastspace;

create tablespace fastspace
    location '/Users/aibekkuralbayev/Desktop/data';

create database ts_sample
    tablespace fastspace;


create tablespace space_table
    location '/Users/aibekkuralbayev/Desktop/table';

drop table films;

create table films
(
    id     integer
        constraint films_pkey primary key,
    title  varchar(255) default 'Some title',
    genre  varchar(255),
    length varchar(255),
    constraint title_unique unique (title)
)
    tablespace space_table;



insert into films (id, genre, length)
VALUES (3, 'Comedy', '120 min');

insert into films (id, title, genre, length)
VALUES (2, null, 'Comedy', '120 min');

select *
from films;




alter table films drop column length;
alter table films add column length interval hour to minute;
alter table films alter column length type interval minute;


insert into films (title, genre, length) VALUES
('Titanic2', 'Drama', '2 hours 5 minutes');

select EXTRACT(EPOCH FROM films.length::INTERVAL)/60 from films;

select *
from films;



