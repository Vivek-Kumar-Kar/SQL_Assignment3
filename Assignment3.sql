Create database Exercise3Db
Use Exercise3Db
------------------------------------------------------------------------------------------
--Part1

Create table CompanyInfo(
CId int primary key,
CName varchar(50) not null)

insert into CompanyInfo(CId,CName) values (1,'Samsung')
insert into CompanyInfo(CId,CName) values (2,'Hp')
insert into CompanyInfo(CId,CName) values (3,'Apple')
insert into CompanyInfo(CId,CName) values (4,'dell')
insert into CompanyInfo(CId,CName) values (5,'Toshiba')
insert into CompanyInfo(CId,CName) values (6,'Redmi')


Create table ProductInfo(
PId int primary key,
PName varchar(50),
PPrice decimal,
PMDate date,
CId int,
foreign key(CId) references  CompanyInfo(CId))

insert into ProductInfo(Pid, PName, PPrice, PMDate, Cid) values (101, 'Laptop', 55000.90, '12/12/2023', 1)
insert into ProductInfo(Pid, PName, PPrice, PMDate, Cid) values (102, 'Laptop', 35000.90, '12/12/2012', 2)
insert into ProductInfo(Pid, PName, PPrice, PMDate, Cid) values (103, 'Mobile', 15000.90, '12/03/2012', 2)
insert into ProductInfo(Pid, PName, PPrice, PMDate, Cid) values (104, 'Laptop', 135000.90, '12/12/2012', 3)
insert into ProductInfo(Pid, PName, PPrice, PMDate, Cid) values (105, 'Mobile', 65000.90, '12/12/2012', 3)
insert into ProductInfo(Pid, PName, PPrice, PMDate, Cid) values (106, 'Laptop', 35000.90, '12/12/2012', 5)
insert into ProductInfo(Pid, PName, PPrice, PMDate, Cid) values (107, 'Mobile', 35000.90, '12/01/2012', 5)
insert into ProductInfo(Pid, PName, PPrice, PMDate, Cid) values (108, 'Earpod', 1000.90, '12/01/2022', 3)
insert into ProductInfo(Pid, PName, PPrice, PMDate, Cid) values (109, 'Laptop', 85000.90, '12/12/2021', 6)
insert into ProductInfo(Pid, PName, PPrice, PMDate, Cid) values (110, 'Mobile', 55000.70, '12/12/2020', 1)
    
select c.CName, p.PName, P.PPrice,p.PMDate
from CompanyInfo c
join ProductInfo p 
on c.CId = p.CId

select p.PName, c.CName, p.PMDate
from ProductInfo p
join CompanyInfo c on p.CId = c.CId

select c.CName,p.PName,p.PMDate
from CompanyInfo c
cross join ProductInfo p
    
-------------------------------------------------------------------------------------------------
--Part 2

create table Products
(PId int primary key ,
PQ int not null,
PPrice float not null,
Discount float not null)

insert into Products (Pid, PQ, PPrice, Discount) values 
(1, 10, 100.00, 10),
(2, 5, 50.00, 40),
(3, 20, 200.00, 30)
select * from Products

create function CalculateDiscount
(
@price float,
@discountPercentage float
)
returns float
as
begin
declare @discountedValue float
set @discountedValue = @price - (@price * (@discountPercentage / 100.0))
return @discountedValue
end

select PId, PPrice Price, Discount, dbo.CalculateDiscount(PPrice, Discount) as 'Price after Discount' from Products










