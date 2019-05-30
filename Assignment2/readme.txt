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
	EMAIL VARCHAR(20),
	PASSWORD VARCHAR(20)
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

Database insert data
note. Usable Staff account need to set staffposition = 'Admin' and status = 'Activated'
insert into staff (firstname, lastname, email, staffposition, address, status, password) values('Asif', 'Gill', 'email@email.com', 'Admin', 'address', 'Activated', 'password');
