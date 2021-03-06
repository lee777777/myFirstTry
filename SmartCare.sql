CREATE DATABASE smartCareDB;
create table users(
	uname varchar(20) primary key,
	passwd varchar(20),
	role varchar(10)
);

create table clients(
	cID int not null primary key
            generated always as identity (start with 1, increment by 1), 
	cName varchar(50),
	cAddress varchar(100),
	cType varchar(10),
	uName varchar(20) references users(uname)
);

create table employee(
	eID int not null primary key
            generated always as identity (start with 1, increment by 1), 
	eName varchar(50),
	eAddress varchar(100),
	uName varchar(20) references users(uname)
);

create table operations(
    oID int not null primary key
            generated always as identity (start with 1, increment by 1), 
    eID int references employee(eID),
    cID int references clients(cID),
    oDate date,
    oTime time,
    nSlot int,
    charge float
);


create table booking_slots(
    sID int not null primary key
            generated always as identity (start with 1, increment by 1),
    eID int references employee(eID),
    cID int references clients(cID),
    sDate date,
    sTime time
);

INSERT INTO USERS (UNAME, PASSWD, "ROLE") VALUES ('meaydin', 'aydinme', 'doctor');
INSERT INTO USERS (UNAME, PASSWD, "ROLE") VALUES ('eaydin', '12345me', 'nurse');
INSERT INTO USERS (UNAME, PASSWD, "ROLE") VALUES ('caidan', '5432@10', 'client');
INSERT INTO USERS (UNAME, PASSWD, "ROLE") VALUES ('hassan', 'prince_passwd', 'client');
INSERT INTO USERS (UNAME, PASSWD, "ROLE") VALUES ('admin', 'admin_passwd', 'admin');
INSERT INTO USERS (UNAME, PASSWD, "ROLE") VALUES( 'mazhar', 'mazz', 'doctor');

INSERT INTO EMPLOYEE (ENAME, EADDRESS, UNAME) VALUES ('Mazhar Malik', 'Mazhars Address, Muscat, Oman', 'mazhar');
INSERT INTO EMPLOYEE (ENAME, EADDRESS, UNAME) VALUES ('Emin Aydin', 'Al Hail Muscat, Oman', 'eaydin');

INSERT INTO CLIENTS (CNAME, CADDRESS, CTYPE, UNAME) VALUES ('Charly Aidan', 'Bousher, Muscat, Oman', 'MoH', 'caidan');
INSERT INTO CLIENTS (CNAME, CADDRESS, CTYPE, UNAME) VALUES ('Hassan', 'Salalah Muscat, Oman', 'private', 'hassan');

