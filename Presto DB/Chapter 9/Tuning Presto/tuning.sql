-- create tables
create table orders as select * from tpch.sf1.orders;
create table lineitem as select * from tpch.sf1.lineitem;
create table lineitem_10 as select * from tpch.sf10.lineitem;

-- query.max-memory-per-node = 100 MB

use hive.default;

-- will fail
select * from orders o , lineitem l where l.orderkey = o.orderkey and o.orderdate < DATE '1995-03-15';

-- will run
select * from lineitem l, orders o where l.orderkey = o.orderkey and o.orderdate < DATE '1995-03-15';

-- will fail
set session distributed_join=false;
select * from lineitem l, orders o where l.orderkey = o.orderkey and o.orderdate < DATE '1995-03-15';
set session distributed_join=true;

-- query.max-memory-per-node 6GB

use hive.default;

-- will pass
select * from orders o , lineitem l where l.orderkey = o.orderkey and o.orderdate < DATE '1995-03-15';

-- will pass
select * from lineitem l, orders o where l.orderkey = o.orderkey and o.orderdate < DATE '1995-03-15';

-- user larger lineitem
select count(*) from lineitem_10 l, orders o where l.orderkey = o.orderkey and o.orderdate < DATE '1995-03-15';

-- faster
set session distributed_join=false;
select count(*) from lineitem_10 l, orders o where l.orderkey = o.orderkey and o.orderdate < DATE '1995-03-15';	
set session distributed_join=true;
    

