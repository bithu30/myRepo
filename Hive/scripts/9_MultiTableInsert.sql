

CREATE TABLE stores_product_data
(
StoreLocation VARCHAR(30),
Product VARCHAR(30));

CREATE TABLE product_data
(
Product VARCHAR(30));

CREATE TABLE revenue_per_day
(
OrderDate DATE,
Revenue DECIMAL(10,2));

from Sales_Data_without_Partition
insert overwrite table stores_product_data
select StoreLocation,Product
insert overwrite table product_data
select distinct Product;

from Sales_Data_without_Partition
insert overwrite table stores_product_data
select StoreLocation,Product
insert overwrite table revenue_per_day
select OrderDate, sum(Revenue) as Revenue
group by OrderDate;

create table reviews_text
(
ReviewID BIGINT,
Review VARCHAR(100)
);

create table movie_reviews_count
(
ReviewID BIGINT,
no_of_reviews INT
);

from reviews 
insert overwrite table reviews_text
select ReviewID,Review 
insert overwrite table movie_reviews_count
select MovieID,count(ReviewID) as no_of_reviews 
group by MovieID;


