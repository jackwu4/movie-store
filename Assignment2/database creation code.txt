How to run the project:
The starting point of the project is Assignment2/web/index.jsp

SQL table creation code
create table LOG
(
	ID int primary key generated always as identity,
	USERID INTEGER not null,
	DATE DATE not null,
	TIME TIME not null,
	TYPE VARCHAR(200) not null
)
create table CUSTOMER
(
	CUSTOMERID INTEGER not null primary key,
	FIRSTNAME VARCHAR(20) not null,
	LASTNAME VARCHAR(20) not null,
	ADDRESS VARCHAR(50) not null,
	GENDER CHAR(1) not null,
	DATEOFBIRTH DATE,
	PHONE VARCHAR(20)
)
create table USERS
(
	USERID INTEGER not null primary key,
	USERTYPE CHAR(10),
	EMAIL VARCHAR(50),
	PASSWORD VARCHAR(50)
)
CREATE TABLE Staff(
    	ID int primary key generated always as identity,
    	FirstName varchar(20) NOT NULL,
    	LastName varchar(20) NOT NULL,
   	Email varchar(50) NOT NULL,
    	StaffPosition varchar(30) NOT NULL,
    	Address varchar(80) NOT NULL,
    	Status varchar(12) NOT NULL,
    	Password varchar(30) NOT NULL
)
create table MOVIE
(
	MOVIEID INTEGER not null primary key,
	TITLE VARCHAR(30) not null,
	DIRECTOR VARCHAR(30) not null,
	PRICE DOUBLE not null,
	GENRE VARCHAR(16) not null,
	RATING INTEGER not null,
	RELEASEDATE DATE not null,
	STOCK INTEGER not null,
	MOVIELENGTH INTEGER not null
)

Database insert data
note. Usable Staff account need to set staffposition = 'Admin' and status = 'Activated'
insert into staff (firstname, lastname, email, staffposition, address, status, password) values('Asif', 'Gill', 'email@email.com', 'Admin', 'address', 'Activated', 'password');



Data for the Movie table, remember to add the table in first, the movie.GRAB is in the chat

INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (1, 'Finding Dory', 'Andrew Stanton', 9.99, 'Adventure', 5, '2016-06-17', 4, 97)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (2, 'Finding Nemo', 'Andrew Stanton', 8.99, 'Adventure', 5, '2003-05-30', 2, 104)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (3, 'Monsters Inc', 'Pete Doctor', 12.99, 'Adventure', 3, '2001-10-28', 6, 90)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (4, 'The Incredibles', 'Brad Bird', 6.99, 'Adventure', 3, '2004-10-27', 4, 115)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (5, 'Mulan', 'Barry Cook', 7.99, 'Adventure', 4, '1998-06-19', 3, 87)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (6, 'Shrek', 'Andrew Adamson', 4.99, 'Adventure', 4, '2001-04-18', 5, 90)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (7, 'Madagascar', 'Eric Darnell', 7.99, 'Adventure', 3, '2005-05-27', 6, 86)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (8, 'Shark Tale', 'Vicky Jenson', 4.99, 'Adventure', 3, '2004-09-10', 2, 90)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (9, 'Antz', 'Eric Darnell', 8.99, 'Adventure', 4, '1998-10-02', 7, 83)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (10, 'Mrs Doubtfire', 'Chris Columbus', 4.99, 'Comedy', 2, '1993-11-24', 4, 120)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (11, 'Forrest Gump', 'Robert Zemeckis', 4.99, 'Drama', 5, '1994-07-15', 1, 142)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (12, 'Titanic', 'James Cameron', 10.0, 'Romance', 3, '1997-12-19', 6, 195)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (13, 'Toy Story', 'John Lasseter', 12.0, 'Adventure', 4, '1995-09-22', 3, 81)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (14, 'Toy Story 2', 'John Lasseter', 5.99, 'Adventure', 5, '1999-09-24', 6, 92)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (15, 'Toy Story 3', 'Lee Unkrich', 3.0, 'Adventure', 3, '2010-06-18', 3, 103)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (16, 'Alien', 'Ridley Scott', 7.5, 'Horror', 2, '1979-09-26', 4, 117)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (17, 'Aliens', 'James Cameron', 4.99, 'Horror', 4, '1986-07-18', 4, 137)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (18, 'Alien 3', 'David Fincher', 8.99, 'Horror', 3, '1992-04-22', 2, 114)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (19, 'Alien Resurrection', 'Jean-Pierre Jeunet', 13.99, 'Horror', 5, '1997-11-26', 1, 109)
INSERT INTO MOVIEDB2.MOVIE (MOVIEID, TITLE, DIRECTOR, PRICE, GENRE, RATING, RELEASEDATE, STOCK, MOVIELENGTH) 
	VALUES (20, 'Inception', 'Christopher Nolan', 12.99, 'Sci-Fi', 3, '2010-07-22', 6, 148)
