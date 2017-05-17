use hive.default;

create table customer as select * from tpch.sf1.customer;
create table lineitem as select * from tpch.sf1.lineitem;
create table nation as select * from tpch.sf1.nation;
create table orders as select * from tpch.sf1.orders;
create table part as select * from tpch.sf1.part;
create table partsupp as select * from tpch.sf1.partsupp;
create table region as select * from tpch.sf1.region;
create table supplier as select * from tpch.sf1.supplier;

-- Run Simple Queries
select * from nation;
select * from nation, region where nation.regionkey = region.regionkey;

-- Make an error
select * form nation; /* "form" is intentional to cause syntax error */

-- TPCH Q3
SELECT
  l.orderkey,
  sum(l.extendedprice * (1 - l.discount)) AS revenue,
  o.orderdate,
  o.shippriority
FROM
  customer c,	
  orders o,
  lineitem l
WHERE
  c.mktsegment = 'BUILDING'
  AND c.custkey = o.custkey
  AND l.orderkey = o.orderkey
  AND o.orderdate < DATE '1995-03-15'
  AND l.shipdate > DATE '1995-03-15'
GROUP BY
  l.orderkey,
  o.orderdate,
  o.shippriority
ORDER BY
  revenue DESC,
  o.orderdate
LIMIT 10;


-- TPCH Q3 (modified join order to run slower in Presto)
SELECT
  l.orderkey,
  sum(l.extendedprice * (1 - l.discount)) AS revenue,
  o.orderdate,
  o.shippriority
FROM
  lineitem l,
  customer c,	
  orders o
WHERE
  c.mktsegment = 'BUILDING'
  AND c.custkey = o.custkey
  AND l.orderkey = o.orderkey
  AND o.orderdate < DATE '1995-03-15'
  AND l.shipdate > DATE '1995-03-15'
GROUP BY
  l.orderkey,
  o.orderdate,
  o.shippriority
ORDER BY
  revenue DESC,
  o.orderdate
LIMIT 10;
