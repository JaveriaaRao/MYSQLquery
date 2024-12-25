create database practice;
use practice;
create table product(
pNo int primary key,
pName varchar(150) ,
pPrice int(20)
);
describe product;
create table customer(
cId int primary key,
pNo int ,
foreign key(pNo) references product(pNo),
CName varchar(150)
);
describe customer;
insert into product(pNo,pName,pPrice )
            values(12,'sabun',500),
				  (80,'cake',600),
                  (120, 'soap', 700),
                 (8000, 'cake deluxe', 1200);
insert into customer(cId,pNo,CName)
			values(6,   120,'javeria'),
				  (8,   8000,'javeria'),
                  (9,NULL,'mahnoor');

-- Inner join 
 -- to get some rows
/*select product.pNo,pPrice,CName
from product inner join customer on
product.pNo=customer.pNo;*/

-- Inner join
-- to get all data from table
/*select* from product 
inner join customer on
product.pNo=customer.pNo;*/  

-- to get all data from table 
-- Applying left join        
 select* from product
 left join customer on 
 product.pNo=customer.pNo;

 -- Applying right join 
 select* from product
 right join customer on 
 product.pNo=customer.pNo;
 
 -- full outer join to get both sides values 
  select* from product
 left join customer on 
 product.pNo=customer.pNo
 union
 select* from product
 right join customer on 
 product.pNo=customer.pNo;
 
 -- full outer join to get repeated values from both sides 
  select* from product
 left join customer on 
 product.pNo=customer.pNo
 union all
 select* from product
 right join customer on 
 product.pNo=customer.pNo;
 
TRUNCATE TABLE customer;    
show databases;
drop database practice;