CREATE External TABLE Campus_Housing_external(StudentID INT, 
DormitoryName VARCHAR(50), AptNumber INT) 
location '/user/externalTables/';


load data local inpath'/Users/swethakolalapudi/Desktop/campus_housing.txt'
overwrite into table Campus_Housing_external;


alter table Campus_Housing_external
set SERDEPROPERTIES ('field.delim'=',');