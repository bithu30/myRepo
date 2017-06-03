CREATE TABLE stock_returns
(
stock_name VARCHAR(100),
trading_date DATE,
opening_value DECIMAL(10,2),
closing_value DECIMAL(10,2));

insert into table stock_returns values
('TATA','2015-01-13',24.54,23.67),
('FORD','2015-01-13',52.54,47.67),
('GM','2015-01-13',100.54,101.67),
('Volksvogen','2015-01-13',67.54,69.67),
('TATA','2015-01-14',26.54,28.67),
('FORD','2015-01-14',44.54,47.67),
('GM','2015-01-14',99.54,100.67),
('Volksvogen','2015-01-14',66.54,68.67),
('TATA','2015-01-15',23.54,24.67),
('FORD','2015-01-15',48.54,46.67),
('GM','2015-01-15',98.47,99.67),
('Volksvogen','2015-01-15',69.54,68.67);


add jar <JAR filepath>; 

create temporary function std as 'com.handbook2.hive.simpleUDAF2';

 select stock_name,std(opening_value) from stock_returns group by stock_name;
