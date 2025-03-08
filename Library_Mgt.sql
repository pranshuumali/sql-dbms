create database Library_Mgt;
use Library_Mgt;
select database();


#CREATE TABLE - Publisher
create table Publisher
		      (name varchar (40),
               address varchar(30),
               phone int);
show tables;
desc Publisher;

#ADD PRIMARY KEY CONSTRAINT
alter table Publisher
add primary key(name);
desc Publisher;

#CHANGE DATATYPE OF ATTRIBUTE
alter table Publisher
change phone phone bigint;
desc Publisher;

#ADD NOT NULL CONSTRAINT (ADDRESS) 
alter table Publisher
change address address varchar(30) not null;

#ADD NOT NULL CONSTRAINT (PHONE) 
alter table Publisher
change phone phone bigint not null;
desc Publisher;


#CREATE TABLE - Book
create table Book
             ( book_id int primary key,
              title varchar(40),
              pub_year varchar(20),
              publisher_name varchar(40));
              
show tables;
desc Book;

#ADD FOREIGN KEY CONSTRAINT
alter table book add foreign key (publisher_name) references Publisher(name) on delete cascade;
desc Book;


#CREATE TABLE - Book_Authors
create table Book_Authors
             (book_id int,
             author_name varchar(30),
             primary key(book_id,author_name),
             foreign key(book_id) references Book(book_id) on delete cascade);
             
show tables;
desc Book_Authors;


#CREATE TABLE - Library_Branch
create table Library_Branch
                (branch_id int primary key,
                branch_name varchar (40),
                address varchar(30));

show tables;
desc Library_Branch;

#ADD UNIQUE CONSTRAINT AND NOT NULL CONSTRAINT SIMULTANEOUSLY ON branch_name
alter table Library_Branch
change branch_name branch_name varchar(40) not null unique;


#CREATE TABLE - Book_Copies
create table Book_Copies
			( book_id int,
             branch_id int,
             no_of_copies int,
             primary key(book_id, branch_id),
             foreign key(book_id) references Book(book_id) on delete cascade,
             foreign key(branch_id) references Library_Branch(branch_id) on delete cascade);
             
show tables;
desc Book_Copies;
 
 #ADD CHECK CONSTRAINT
 alter table Book_Copies add check (no_of_copies>0);
 
 
#CREATE TABLE - Card
 create table Card
               ( card_no int primary key);
               
show tables;
desc Card;


 #CREATE TABLE - Book_Lending
 create table Book_Lending
				  (book_id int,
                  branch_id int,
                  card_no int not null,
                  date_out date,
                  due_date date,
                  primary key(book_id, branch_id, card_no),
                  foreign key(book_id) references Book(book_id) on delete cascade,
                  foreign key(branch_id) references Library_Branch(branch_id) on delete cascade);
                  
show tables;
desc Book_Lending;

#TO INSERT RECORDS INTO PUBLISHER TABLE
insert into Publisher values ('Mcgraw-Hill', 'Bangalore', 9989076587);
insert into Publisher values ('Pearson', 'NewDelhi', 9889076565);
insert into Publisher values ('Random House', 'Hyderabad', 7455679345);
insert into Publisher values ('Hachette Livre', 'Chennai', 8970862340);
insert into Publisher values ('Grupo Planeta', 'Bangalore', 7756120238);
insert into Publisher values ('Wiley India', 'New Delhi', 01143630000);
insert into Publisher values ('S Chand', 'Noida', 7291975264);
insert into Publisher values ('Technical Publications', 'Pune', 9763719464);
insert into Publisher values ('Nirali Prakashan', 'Pune', 02025512336);
insert into Publisher values ('Prakash Publication', 'Jalgaon', 9272514482);
insert into Publisher values ('Galgotia Publications', 'New Delhi', 01123263334);
select * from Publisher;


#TO INSERT RECORDS INTO BOOK TABLE
insert into book values (1,'DBMS','2017', 'Mcgraw-Hill');
insert into book values (2,'ADBMS','2016', 'Mcgraw-Hill');
insert into book values (3,'CN','2016', 'Pearson');
insert into book values (4,'CG','2015', 'Grupo Planeta');
insert into book values (5,'OS','2016', 'Pearson');
insert into book values (6,'CO','2008', 'Nirali Prakashan');
insert into book values (7,'CO','2005', 'Galgotia Publications');
insert into book values (8,'DBMS','2022', 'Technical Publications');
insert into book values (9,'DBMS for Distributed System','2022', 'Pearson');
select * from Book;

insert into book values (10,'Recent Trends in DBMS','2022', 'Vasant'); #ERROR 
select * from Book;


#TO INSERT RECORDS INTO BOOK_AUTHORS TABLE
insert into book_authors values (1, 'Navathe');
insert into book_authors values (2, 'Navathe');
insert into book_authors values (3, 'Tanenbaum');
insert into book_authors values (4, 'Edward Angel');
insert into book_authors values (5, 'Galvin');
insert into book_authors values (6, 'K. P. Adhiya');
insert into book_authors values (7, 'Navin Kumar');
insert into book_authors values (8, 'A. A. Puntambekar');
select * from Book_Authors;


#TO INSERT RECORDS INTO LIBRARY_BRANCH TABLE
insert into library_branch values (10,'RR Nagar','Bangalore');
insert into library_branch values (11,'RNSIT','Bangalore');
insert into library_branch values (12,'Rajaji Nagar', 'Bangalore');
insert into library_branch values (13,'NITTE','Mangalore');
insert into library_branch values (14,'Manipal','Udupi');
insert into library_branch values (15,'SSBT','Jalgaon');
insert into library_branch values (16,'SPIT','Mumbai');
select * from Library_Branch;


#TO INSERT RECORDS INTO BOOK_COPIES TABLE
insert into book_copies values (1, 10, 10);
insert into book_copies values (1, 11, 5);
insert into book_copies values (2, 12, 2);
insert into book_copies values (2, 13, 5);
insert into book_copies values (3, 14, 7);
insert into book_copies values (5, 10, 1);
insert into book_copies values (4, 11, 3);
insert into book_copies values (6, 15, 13);
insert into book_copies values (6, 16, 10);
select * from Book_Copies;


#TO INSERT RECORDS INTO CARD TABLE
insert into card values (100);
insert into card values (101);
insert into card values (102);
insert into card values (103);
insert into card values (104);
insert into card values (105);
select * from Card;


#TO INSERT RECORDS INTO BOOK_LENDING TABLE
insert into book_lending values (1, 10, 101, '2017-01-10', '2017-06-17'); 
insert into book_lending values (3, 14, 101, '2017-03-18', '2017-07-17'); 
insert into book_lending values (2, 13, 101, '2017-02-11', '2017-04-21'); 
insert into book_lending values (4, 11, 101, '2017-03-15', '2017-07-15'); 
insert into book_lending values (1, 11, 104, '2017-04-12', '2017-05-12');
select * from Book_Lending;


#QUERIES
#1.LIST THE NAMES OF ALL PUBLISHERS.
select name from Publisher;

#2.LIST THE NAMES OF ALL PUBLISHERS WITH CONTACT NUMBER.
select name,phone from Publisher;

#3.LIST THE NAMES OF ALL PUBLISHERS FROM NEW DELHI.
select name from Publisher
where address='New Delhi';

#4.NEWDELHI--> NEW DELHI
select * from Publisher;
update Publisher
set address='New Delhi'
where address='NewDelhi';
select * from Publisher;

#5.LIST THE UNIQUE TITLES OF BOOKS PUBLISHED BY PUBLISHERS.
select title from book;
select distinct title from book;

#6.USE ORDER BY CLAUSE
select * from publisher
order by name desc;
select * from book
order by title asc;
select * from Book_Copies
order by book_id desc;

#7.FIND THE LATEST PUBLICATION YEAR FOR DBMS BOOK.
select pub_year from book
where title='DBMS'
order by pub_year desc
limit 1;

#8.
select title, pub_year from book
where pub_year>=2015 and pub_year<=2022
order by pub_year desc;