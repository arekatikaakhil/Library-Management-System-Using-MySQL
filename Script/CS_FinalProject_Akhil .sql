create database CS_Project;
use CS_Project;

-- creating tables
-- Author table
create table author(
auth_id int not null primary key,
author_name varchar(30),
auth_birthdate date,
nationality varchar(30));

-- Authorship table
create table authorship(
authorship_id int not null primary key,
author_id int,
material_id int,
foreign key(author_id) references author(auth_id),
foreign key(material_id) references material(material_id));

-- Borrow table
create table borrow(
borrow_id int not null primary key,
material_id int,
mem_id int,
staff_id int,
borrow_date date,
due_date date,
return_date date,
foreign key(material_id) references material(material_id),
foreign key(mem_id) references member(mem_id),
foreign key(staff_id) references staff(staff_id));

-- Catalog Table
create table catalog(
catalog_id int not null primary key,
catalog_name varchar(30),
location varchar(30));

-- Genre table
create table Genre(
Genre_id int not null primary key,
Genre_name varchar(30),
description varchar(500));

-- Material table
create table material(
material_id int not null primary key,
material_title varchar(100),
publication_date date,
catalog_id int,
genre_id int,
foreign key(catalog_id) references catalog(catalog_id),
foreign key(genre_id) references genre(genre_id));

-- Member table
create table member(
mem_id int not null primary key, 
mem_name varchar(30),
mem_contact varchar(30),
mem_joindate date);

-- Staff table
create table staff(
staff_id int not null primary key,
staff_name varchar(30),
staff_contact varchar(30),
job_title varchar(30),
staff_hiredate date);

-- inserted all the values into tables by importing the CSV files
select * from author;
select * from authorship;
select * from borrow;
select * from catalog;
select * from genre;
select * from material;
select * from member;
select * from staff;

-- 1
select material_id, material_title from material
where material_id not in(
select material_id from borrow
where return_date is null);

-- 2
select material.material_title, borrow.due_date, borrow.borrow_date from material , borrow 
where borrow.material_id = material.material_id and borrow.due_date < '2023-04-01' and borrow.return_date is null;

-- 3
select material.material_title, count(borrow_id) as most_borrowed
from material
join borrow on material.material_id = borrow.material_id
group by material_title
order by most_borrowed desc
limit 10;

-- 4
select count(authorship.Authorship_ID) as LucasPiki_materials,
material.material_title as book_name
from Author 
join Authorship on author.author_ID = authorship.author_ID
join Material on authorship.Material_ID = material.Material_ID
where author.author_name = 'Lucas Piki'
group by material.material_title;

-- 5
select count(*) as count_of_two_and_more_authors
from 
( select material_id
from authorship
group by material_id
having count(*) >= 2)
as authors;

-- 6
SELECT Genre.Genre_ID, Genre.genre_name,
COUNT(Borrow.Borrow_ID) AS Total_Borrowed_Times
FROM Genre
LEFT JOIN Material ON Genre.Genre_ID = Material.Genre_ID
LEFT JOIN Borrow ON Material.Material_ID = Borrow.Material_ID
GROUP BY Genre.Genre_ID, Genre.genre_name
ORDER BY Total_Borrowed_Times DESC;

-- 7
select material.material_title, count(*) as count
from borrow, material
where material.material_id = borrow.material_id
and borrow.borrow_date between '2020-09-01' and '2020-10-01'
group by material_title;

-- 8
update borrow
set return_date = '2023-04-01'
where material_id = (select material_id from material where material_title = 'Harry Potter and the Philosopher''s Stone');
select * from borrow
where material_id = (select material_id from material where material_title = 'Harry Potter and the Philosopher''s Stone');

-- 9
delete from borrow where
mem_id = ( select mem_id from member where mem_name = 'Emily Miller');
SET SQL_SAFE_UPDATES=OFF;
DELETE FROM member WHERE mem_name = 'Emily Miller';
select * from member where mem_name = 'Emily Miller';

-- 10
insert into Author (author_ID,author_name) 
values('21','Lucas Luke');
select * from Author where author_id = 21 and author_name = 'Lucas Luke';
insert into material(material_id, material_title, publication_date,catalog_id, genre_id)
values(32,  'New Book', '2020-08-01', (select catalog_id from catalog where catalog_name = 'E-Books'),
  (select genre_id from genre where genre_name = 'Mystery & Thriller'));
select * from material where material_title = 'New Book';
insert into authorship( authorship_id, author_id, material_id)
values(35, (select author_id from author where author_name = 'Lucas Luke'), 
	(select material_id from material where material_title = 'New Book'));
select * from authorship where authorship_id = 35;