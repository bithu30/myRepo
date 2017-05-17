-- SOURCE:  Data used can be downloaded from:
http://hortonworks.com/hadoop-tutorial/hello-world-an-introduction-to-hadoop-hcatalog-hive-and-pig/

-- create external table with data located in S3
-- You need to upload the data into an S3 bucket for this to work
create table geolocation(
       truckid string,
       driverid string,
       event string,
       latitude double,
       longitude double,
       city string,
       state string,
       velocity bigint,
       event_ind bigint,
       idling_ind bigint)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
location '<S3 Location>'
tblproperties ("skip.header.line.count"="1");

-- see first 10 rows from each data source table
select * from hive.default.geolocation limit 10;
select * from postgres.public.trucks limit 10;

-- Federated Query!
select t.model, t.truckid, g.event, from posgres.public.trucks t, hive.default.geolocation g where t.truckid = g.truckid limit 10;

-- Explain Plan showing data coming from different data sources
explain select t.model, t.truckid, g.event, from posgres.public.trucks t, hive.default.geolocation g where t.truckid = g.truckid limit 10;
