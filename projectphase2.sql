create database lostfound;
use lostfound;
-- table 1 
-- TASK1
create table userr(
userID int primary key,
ublock varchar(50),
ustreet int(10),
ucity varchar(50),
ufirst_Name varchar(50) not null,
ulast_name varchar(50) not null
);
describe userr;
-- table 2
create table userEmail(
userID int, 
pEmail varchar(30) UNIQUE,
sEmail varchar(30) UNIQUE,
TEmail varchar(30) UNIQUE,
FOREIGN KEY (userID) REFERENCES userr(userID)
);
describe userEmail;
-- table 3
create table userPhone(
userID int, 
pNumber int not null,
sNumber int not null,
foreign key(userID) References userr(userID)
);
describe userPhone;
-- table 4
create table category(
categoryID int primary key,
categoryName varchar(60) not null
);
describe category;
-- table 5
create table item(
itemID int primary key,
Ilocation varchar(50),
IName varchar(100) not null,
Idescription varchar(500),
ItStatus varchar(200),
IReportedDate Date not null,
userID int,
CONSTRAINT item_ibfk_1 foreign key(userID) references userr(userID),
categoryID int,
CONSTRAINT item_ibfk_2 foreign key(categoryID) references category(categoryID)

);
describe item;
-- table 6
create table Adminn(
AdminID int primary key,
AdFristN varchar(200) not null,
AdlastN varchar(200) not null
);
describe Adminn;
-- table 7
create table claim(
claimID int primary key,
clDate Date not null,
claimStatus varchar(200),
itemID int,
userID int,
AdminID int,
CONSTRAINT claim_ibfk_1 foreign key (itemID) references item(itemID),
CONSTRAINT claim_ibfk_2 foreign key(userID) references userr(userID),
CONSTRAINT claim_ibfk_3 foreign key(AdminID) references Adminn(AdminID)
);
describe claim;
-- table 8
create table admPhone(
pNumber int not null,
sNumber int not null,
AdminID int,
foreign key(AdminID)references Adminn(AdminID)

);
describe admPhone;
-- table 9
create table admEmail(
pEmail varchar(50) unique,
sEmail varchar(50) unique,
AdminID int,
foreign key(AdminID)references Adminn(AdminID)
);
describe admEmail;
-- table 10
create table Message(
MessageID int primary key,
Mscontent varchar(500),
Mstime datetime,
userID int,
foreign key(userID) references userr(userID)
);
describe Message;
-- table 11
create table Notifications(
NotifID int primary key,
NotificContent varchar(500),
NdateTime datetime not null,
userID int,
CONSTRAINT fk_userID foreign key(userID) references userr(userID)
);
describe Notifications;
-- TASK2
drop table Notifications;
drop table Message;
show tables;
-- Task3
-- using item table 
show create table claim;
-- dropping foreign keys
Alter table item drop foreign key item_ibfk_1;
Alter table item drop foreign key item_ibfk_2;
Alter table claim drop foreign key claim_ibfk_1; 
-- dropping primary key
Alter table item drop primary key;
-- Adding new column in item table 
ALTER TABLE item ADD COLUMN itemID2 INT;
-- Adding primary key again
Alter table item add primary key(itemID);
show create table item;
-- Adding foreign keys again
Alter table item add constraint item_ibfk_1 foreign key(userID) references userr(userID);
Alter table item add constraint item_ibfk_2 foreign key(categoryID) references category (categoryID);
Alter table claim add constraint item_ibfk  foreign key(itemID) references item(itemID);
-- changing name of column
Alter table item change itemID2 itemID3 int;
-- changing datatype of column itemID3
Alter table item change itemID3 itemID3 varchar(20);
-- adding unique costraints
Alter table item add constraint unique_itemID3 unique(itemID3);
show create table item;
-- Adding default constraint
Alter table item Alter itemID3 set default 0;
show create table item;
-- Adding not null 
Alter table item modify itemID3 varchar(20) not null;
show create table item;
-- dropping index
ALTER TABLE item DROP INDEX unique_itemID3;
-- dropping default
ALTER TABLE item ALTER itemID3 DROP DEFAULT;
-- modifying to null
ALTER TABLE item MODIFY itemID3 INT(11) NULL;
-- Dropping table  
Alter table item drop column itemID3;
show create table item;
show create table claim;

drop database lostfound;
show databases;

--  shows foreign key
/*SHOW CREATE TABLE Notifications;
SHOW CREATE TABLE Message;*/
