
alter table sales_data rename to Sales_Data_without_Partition;

CREATE TABLE Sales_Data_date_partition
(
StoreLocation VARCHAR(30),
Product VARCHAR(30),
Revenue DECIMAL(10,2) partitioned by (OrderDate DATE);


Insert into Sales_Data_date_partition partition  (OrderDate ='2016-01-16')
Values
('Bellandur','Nutella',7455.67),
('Bellandur','Peanut Butter',5316.89),
('Bellandur','Milk',2433.76),
('Koramangala','Bananas',9456.01),
('Koramangala','Nutella ',3644.33),
('Koramangala','Peanut Butter', 8988.64),
('Koramangala','Milk',1621.58)
;

SET hive.exec.dynamic.partition = true;
SET hive.exec.dynamic.partition.mode = nonstrict;


CREATE TABLE Sales_Data_date_product_partition
(
StoreLocation VARCHAR(30),
Revenue DECIMAL(10,2)) partitioned by (OrderDate DATE, Product VARCHAR(30));

Insert into Sales_Data_date_product_partition partition(OrderDate,Product)
select StoreLocation,Revenue,OrderDate,Product from Sales_Data_without_Partition;






