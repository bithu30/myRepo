drop table Sales_Data;


CREATE TABLE Sales_Data
(OrderID INT,
StoreID INT,
ProductID INT,
OrderDate DATE,
Revenue DECIMAL(10,2));

insert into Sales_Data
values
(1,2,2,'2016-01-17',1299.45),
(2,1,1,'2016-01-17',2342.33),
(3,1,2,'2016-01-17',4543.98),
(4,2,4,'2016-01-17',5102.05),
(5,1,4,'2016-01-17',5673.01),
(6,1,3,'2016-01-17',6345.1),
(7,2,1,'2016-01-17',8902.65),
(8,2,3,'2016-01-17',9114.67),
(9,2,2,'2016-01-18',1621.58),
(10,1,2,'2016-01-18',2433.76),
(11,2,3,'2016-01-18',3644.33),
(12,1,4,'2016-01-18',5316.89),
(13,1,3,'2016-01-18',7455.67),
(14,1,1,'2016-01-18',8236.33),
(15,2,4,'2016-01-18',8988.64),
(16,2,1,'2016-01-18',9456.01);



from Sales_Data
select  OrderID,storeID,ProductID,OrderDate,Revenue,
sum(Revenue)over(order by OrderID rows between UNBOUNDED PRECEDING and current row) 
as Running_Total;

from Sales_Data
select  OrderID,storeID,ProductID,OrderDate,Revenue,
sum(Revenue)over(partition by OrderDate order by OrderID) 
as Running_Total;



from Sales_Data
select  OrderID,storeID,ProductID,OrderDate,Revenue,
avg(Revenue)over(partition by OrderDate order by OrderID 
rows between 3 PRECEDING and current row ) 
as Running_Total;

