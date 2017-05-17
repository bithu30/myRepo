-- display catalogs
show catalogs;

-- Display schemas and tables in the TPCH catalog
show schemas in tpch;
show tables in tpch.sf1;

-- Run some queries and explore Presto
select * from tpch.sf1.nation;
select count(*) from tpch.sf1.lineitem;
select count(*) from tpch.sf10.lineitem;

-- set default catalog and schema so you don't have to fully qualifiy the table name
use tpch.sf1;
select count(*) from lineitem;

-- describe tables to figure out what to join
describe nation;
describe region;

select * from nation, region where nation.regionkey = region.regionkey;


-- Let's try from TPC-H Queries — http://www.tpc.org/tpch/
 -- TPCH q6
presto:sf1> select sum(l.extendedprice * l.discount) as revenue
from
  lineitem l
where
  l.shipdate >= date '1994-01-01'
  and l.shipdate < date '1994-01-01' + interval '1' year
and l.discount between 0.06 - 0.01 and 0.06 + 0.01
and l.quantity < 24;
