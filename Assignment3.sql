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
ppEmail varchar(300) UNIQUE,
ssEmail varchar(300) UNIQUE,
TTEmail varchar(300) UNIQUE,
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
-- Task3
-- using item table 
show create table claim;
-- dropping foreign keys
Alter table item drop foreign key item_ibfk_1;
Alter table item drop foreign key item_ibfk_2;
Alter table claim drop foreign key claim_ibfk_1; 
show create table item;
show create table claim;
-- dropping primary key
Alter table item drop primary key;
show create table item;
-- Adding new column in item table 
ALTER TABLE item ADD COLUMN itemID2 INT;
describe  item;
-- Adding primary key again
Alter table item add primary key(itemID);
show create table item;
-- Adding foreign keys again
Alter table item add constraint item_ibfk_1 foreign key(userID) references userr(userID);
Alter table item add constraint item_ibfk_2 foreign key(categoryID) references category (categoryID);
Alter table claim add constraint item_ibfk  foreign key(itemID) references item(itemID);
show create table item;
show create table claim;
-- changing name of column
Alter table item change itemID2 itemID3 int;
describe  item;
-- changing datatype of column itemID3
Alter table item change itemID3 itemID3 varchar(20);
describe  item;
-- adding unique costraints
Alter table item add constraint unique_itemID3 unique(itemID3);
show create table item;
describe item;
-- Adding default constraint
Alter table item Alter itemID3 set default 0;
show create table item;
describe item;
-- Adding not null 
Alter table item modify itemID3 varchar(20) not null;
show create table item;
describe item;
-- dropping index
ALTER TABLE item DROP INDEX unique_itemID3;
describe item;
-- dropping default
ALTER TABLE item ALTER itemID3 DROP DEFAULT;
describe item;
-- modifying to null
ALTER TABLE item MODIFY itemID3 INT(11) NULL;
describe item;
-- Dropping table  
Alter table item drop column itemID3;
describe item;
show create table item;
show create table claim;

-- task4
INSERT INTO userr (userID, ublock, ustreet, ucity, ufirst_Name, ulast_name) VALUES
(1, 'Block A', 101, 'Lahore', 'Ali', 'Khan'),
(2, 'Block B', 102, 'Karachi', 'Ayesha', 'Ahmed'),
(3, 'Block C', 103, 'Islamabad', 'Hassan', 'Butt'),
(4, 'Block D', 104, 'Peshawar', 'Fatima', 'Iqbal'),
(5, 'Block E', 105, 'Quetta', 'Zara', 'Shah');
DESCRIBE userr;
SELECT * FROM userr;
INSERT INTO userEmail (userID, ppEmail, ssEmail, TTEmail) VALUES
(1, 'ali.khan@example.com', 'ali.k.secondary@example.com', 'ali.k.tertiary@example.com'),
(2, 'ayesha.ahmed@example.com', 'ayesha.a.secondary@example.com', 'ayesha.a.tertiary@example.com'),
(3, 'hassan.butt@example.com', 'hassan.b.secondary@example.com', 'hassan.b.tertiary@example.com'),
(4, 'fatima.iqbal@example.com', 'fatima.i.secondary@example.com', 'fatima.i.tertiary@example.com'),
(5, 'zara.shah@example.com', 'zara.s.secondary@example.com', 'zara.s.tertiary@example.com');
DESCRIBE userEmail;
SELECT * FROM userEmail;
INSERT INTO userPhone (userID, pNumber, sNumber) VALUES
(1, 3001234567, 3019876543),
(2, 3002234567, 3018876543),
(3, 3003234567, 3017876543),
(4, 3004234567, 3016876543),
(5, 3005234567, 3015876543);
DESCRIBE userPhone;
SELECT * FROM userPhone;
INSERT INTO category (categoryID, categoryName) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Accessories'),
(5, 'Documents');
DESCRIBE category;
SELECT * FROM category;
INSERT INTO item (itemID, Ilocation, IName, Idescription, ItStatus, IReportedDate, userID, categoryID) VALUES
(1, 'Library', 'Mobile Phone', 'Samsung Galaxy Black', 'Lost', '2024-11-20', 1, 1),
(2, 'Cafeteria', 'Wallet', 'Brown leather wallet', 'Found', '2024-11-19', 2, 2),
(3, 'Classroom', 'Notebook', 'Physics notebook', 'Lost', '2024-11-18', 3, 3),
(4, 'Gym', 'Water Bottle', 'Steel bottle with sticker', 'Found', '2024-11-17', 4, 4),
(5, 'Parking Lot', 'ID Card', 'NADRA ID Card', 'Lost', '2024-11-16', 5, 5);
DESCRIBE item;
SELECT * FROM item;
INSERT INTO Adminn (AdminID, AdFristN, AdlastN) VALUES
(1, 'Muhammad', 'Hussain'),
(2, 'Sana', 'Ali'),
(3, 'Bilal', 'Riaz'),
(4, 'Rabia', 'Sheikh'),
(5, 'Ahmed', 'Farooq');
DESCRIBE Adminn;
SELECT * FROM Adminn;
INSERT INTO claim (claimID, clDate, claimStatus, itemID, userID, AdminID) VALUES
(1, '2024-11-21', 'Approved', 1, 1, 1),
(2, '2024-11-20', 'Pending', 2, 2, 2),
(3, '2024-11-19', 'Rejected', 3, 3, 3),
(4, '2024-11-18', 'Approved', 4, 4, 4),
(5, '2024-11-17', 'Pending', 5, 5, 5);
DESCRIBE claim;
SELECT * FROM claim;
INSERT INTO admPhone (pNumber, sNumber, AdminID) VALUES
(3031234567, 3039876543, 1),
(3032234567, 3038876543, 2),
(3033234567, 3037876543, 3),
(3034234567, 3036876543, 4),
(3035234567, 3035876543, 5);
DESCRIBE admPhone;
SELECT * FROM admPhone;
INSERT INTO admEmail (pEmail, sEmail, AdminID) VALUES
('m.hussain@admin.com', 'm.h.secondary@admin.com', 1),
('s.ali@admin.com', 's.a.secondary@admin.com', 2),
('b.riaz@admin.com', 'b.r.secondary@admin.com', 3),
('r.sheikh@admin.com', 'r.s.secondary@admin.com', 4),
('a.farooq@admin.com', 'a.f.secondary@admin.com', 5);
DESCRIBE admEmail;
SELECT * FROM admEmail;
INSERT INTO Message (MessageID, Mscontent, Mstime, userID) VALUES
(1, 'Found mobile phone in the library', '2024-11-21 10:30:00', 1),
(2, 'Lost wallet in cafeteria', '2024-11-20 14:15:00', 2),
(3, 'Notebook left in classroom', '2024-11-19 11:45:00', 3),
(4, 'Steel bottle found in gym', '2024-11-18 13:00:00', 4),
(5, 'ID card lost near parking', '2024-11-17 09:00:00', 5);
DESCRIBE Message;
SELECT * FROM Message;
INSERT INTO Notifications (NotifID, NotificContent, NdateTime, userID) VALUES
(1, 'Your claim is approved.', '2024-11-21 10:00:00', 1),
(2, 'Your claim is pending.', '2024-11-20 12:00:00', 2),
(3, 'Your claim is rejected.', '2024-11-19 14:00:00', 3),
(4, 'Your item has been found.', '2024-11-18 16:00:00', 4),
(5, 'Please contact admin for details.', '2024-11-17 18:00:00', 5);

DESCRIBE Notifications;
SELECT * FROM Notifications;

-- task5
-- Update 3 records in each table
-- userr Table
UPDATE userr
SET ublock = 'Block X', ustreet = 110, ucity = 'Faisalabad', ufirst_Name = 'Ali Updated', ulast_name = 'Khan Updated'
WHERE userID IN (1, 2, 3);
UPDATE userr
SET ublock = 'Block Y', ustreet = 120, ucity = 'Multan', ufirst_Name = 'Fatima Updated', ulast_name = 'Iqbal Updated'
WHERE userID IN (4, 5, 1);
SELECT * FROM userr WHERE userID IN (1, 2, 3);

-- userEmail Table
UPDATE userEmail
SET ppEmail = 'anotheruniqueemail@example.com', ssEmail = 'aqib.secondary@admin.com', TTEmail = 'arham.tertiary@admin.com'
WHERE userID =1;
UPDATE userEmail
SET ppEmail  = 'farzana@admin.com', ssEmail = 'saqib.secondary@admin.com', TTEmail = 'iqra.tertiary@admin.com'
WHERE userID =2;
UPDATE userEmail
SET ppEmail  = 'amin@admin.com', ssEmail = 'amina.secondary@admin.com', TTEmail = 'rehman.tertiary@admin.com'
WHERE userID =3;
SELECT * FROM userEmail WHERE userID IN (1, 2,3);
-- userPhone Table
UPDATE userPhone
SET pNumber = 3001234560, sNumber = 3019876542
WHERE userID IN (1, 2, 3);
UPDATE userPhone
SET pNumber = 3002234560, sNumber = 3018876542
WHERE userID IN (4, 5, 1);
SELECT * FROM userPhone WHERE userID IN (1, 2, 3);

-- category Table
UPDATE category
SET categoryName = 'Home Appliances'
WHERE categoryID IN (1, 2, 3);
UPDATE category
SET categoryName = 'Personal Items'
WHERE categoryID IN (4, 5, 1);
SELECT * FROM category WHERE categoryID IN (1, 2, 3);

-- item Table
UPDATE item
SET IName = 'Mobile Phone Samsung', Ilocation = 'Library Updated', IReportedDate = '2024-11-21'
WHERE itemID IN (1, 2, 3);
UPDATE item
SET IName = 'Wallet Leather', Ilocation = 'Cafeteria Updated', IReportedDate = '2024-11-22'
WHERE itemID IN (4, 5, 1);
SELECT * FROM item WHERE itemID IN (1, 2, 3);
-- Adminn Table
UPDATE Adminn
SET AdFristN = 'Updated Muhammad', AdlastN = 'Updated Hussain'
WHERE AdminID IN (1, 2, 3);
UPDATE Adminn
SET AdFristN = 'Updated Bilal', AdlastN = 'Updated Riaz'
WHERE AdminID IN (4, 5, 1);
SELECT * FROM Adminn WHERE AdminID IN (1, 2, 3);

-- claim Table
UPDATE claim
SET claimStatus = 'Approved Updated'
WHERE claimID IN (1, 2, 3);
UPDATE claim
SET claimStatus = 'Rejected Updated'
WHERE claimID IN (4, 5, 1);
SELECT * FROM claim WHERE claimID IN (1, 2, 3);

-- admPhone Table
UPDATE admPhone
SET pNumber = 3031234568, sNumber = 3039876544
WHERE AdminID IN (1, 2, 3);
UPDATE admPhone
SET pNumber = 3032234568, sNumber = 3038876544
WHERE AdminID IN (4, 5, 1);
SELECT * FROM admPhone WHERE AdminID IN (1, 2, 3);

-- admEmail Table
UPDATE admEmail
SET pEmail = 'm.hussain@adminupdated.com', sEmail = 'm.h.secondary@adminupdated.com'
WHERE AdminID =1;
UPDATE admEmail
SET pEmail = 's.ali@adminupdated.com', sEmail = 's.a.secondary@adminupdated.com'
WHERE AdminID=2;
UPDATE admEmail
SET pEmail = 'mahnoor@adminupdated.com', sEmail = 'ruqsana.secondary@adminupdated.com'
WHERE AdminID=3;
SELECT * FROM admEmail WHERE AdminID IN (1, 2, 3);

-- Message Table
UPDATE Message
SET Mscontent = 'Mobile phone found in library (Updated)', Mstime = '2024-11-22 10:30:00'
WHERE MessageID IN (1, 2, 3);
UPDATE Message
SET Mscontent = 'Lost wallet in cafeteria (Updated)', Mstime = '2024-11-23 14:15:00'
WHERE MessageID IN (4, 5, 1);
SELECT * FROM Message WHERE MessageID IN (1, 2, 3);
-- Notifications Table
UPDATE Notifications
SET NotificContent = 'Your claim has been updated and approved.'
WHERE NotifID IN (1, 2, 3);
UPDATE Notifications
SET NotificContent = 'Your claim status has been updated.'
WHERE NotifID IN (4, 5, 1);
SELECT * FROM Notifications WHERE NotifID IN (1, 2, 3);
-- task6
-- Delete 3 records from each table
-- userr Table
DELETE FROM userr WHERE userID IN (3, 4, 5);
SELECT * FROM userr WHERE userID IN (3, 4, 5);
-- userEmail Table
DELETE FROM userEmail WHERE userID IN (1, 2, 3);
SELECT * FROM userEmail WHERE userID IN (1, 2, 3,4,5);
-- userPhone Table
DELETE FROM userPhone WHERE userID IN (1, 2, 3);
SELECT * FROM userPhone WHERE userID IN (1, 2, 3,4,5);
-- category Table
DELETE FROM category WHERE categoryID IN (1, 2, 3);
SELECT * FROM category WHERE categoryID IN (1, 2, 3,4,5);
-- item Table
DELETE FROM item WHERE itemID IN (1, 2, 3);
SELECT * FROM item WHERE itemID IN (1, 2, 3,4,5);
-- Adminn Table
DELETE FROM Adminn WHERE AdminID IN (1, 2, 3);
SELECT * FROM Adminn WHERE AdminID IN (1, 2, 3,4,5);
-- claim Table
DELETE FROM claim WHERE claimID IN (1, 2, 3);
SELECT * FROM claim WHERE claimID IN (1, 2, 3,4,5);
-- admPhone Table
DELETE FROM admPhone WHERE AdminID IN (1, 2, 3);
SELECT * FROM admPhone WHERE AdminID IN (1, 2, 3,4,5);
-- admEmail Table
DELETE FROM admEmail WHERE AdminID IN (1, 2, 3);
SELECT * FROM admEmail WHERE AdminID IN (1, 2, 3,4,5);
-- Message Table
DELETE FROM Message WHERE MessageID IN (1, 2, 3);
SELECT * FROM Message WHERE MessageID IN (1, 2, 3,4,5);
-- Notifications Table
DELETE FROM Notifications WHERE NotifID IN (1, 2, 3);
SELECT * FROM Notifications WHERE NotifID IN (1, 2, 3,4,5);
-- TASK2
drop table Notifications;
drop table Message;
show tables;


-- ASSIGNMENT3
-- JOINS
-- 1 inner join
select userr.userID,ufirst_Name,ulast_name,IName,Idescription,ItStatus,categoryName
from userr inner join item on userr.userID=item .userID inner join category on category.categoryID=item.categoryID ;


-- 2 Natural join
select  AdFristN,AdlastN,claimStatus
from Adminn natural join claim 
where Adminn.AdminID=claim.AdminID;

-- left join 
select userr.userID, Mscontent,Mstime,ucity,ufirst_Name,ulast_name 
from Message left join userr on userr.userID=Message.userID; 

-- Right join 
select *from userr right join Notifications on
userr.userID=Notifications.userID;

-- full ourter join
select *from Notifications left join userr on
userr.userID=Notifications.userID
union 
select *from Notifications Right join  userr on
userr.userID=Notifications.userID
;


-- Aggregate Functions
-- 1) count
select count(userID) from userr;
select count(*) from userr;

-- 2) sum
select sum(userID) from userr;

-- 3) AVEAGE
SELECT  AVG(userID) FROM userr;

-- 4) MAX 
SELECT  max(userID) FROM userr;

-- 5) Min

select min(userID)from userr;

drop database lostfound;
show databases;
