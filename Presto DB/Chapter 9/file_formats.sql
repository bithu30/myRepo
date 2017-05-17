create table lineitem_orc
WITH (format = 'ORC')
as select * from tpch.sf1.lineitem;

create table lineitem_text
WITH (format = 'TEXFILE')
as select * from tpch.sf1.lineitem;

-- TPCH Q1 (lineitem TEXTFILE)
SELECT
  l.returnflag,
  l.linestatus,
  sum(l.quantity)                                       AS sum_qty,
  sum(l.extendedprice)                                  AS sum_base_price,
  sum(l.extendedprice * (1 - l.discount))               AS sum_disc_price,
  sum(l.extendedprice * (1 - l.discount) * (1 + l.tax)) AS sum_charge,
  avg(l.quantity)                                       AS avg_qty,
  avg(l.extendedprice)                                  AS avg_price,
  avg(l.discount)                                       AS avg_disc,
  count(*)                                              AS count_order
FROM
  lineitem_text l
WHERE
  l.shipdate <= DATE '1998-12-01' - INTERVAL '90' DAY
GROUP BY
l.returnflag,
l.linestatus
ORDER BY
l.returnflag,
l.linestatus;

-- TPCH Q1 (lineitem ORC)
SELECT
  l.returnflag,
  l.linestatus,
  sum(l.quantity)                                       AS sum_qty,
  sum(l.extendedprice)                                  AS sum_base_price,
  sum(l.extendedprice * (1 - l.discount))               AS sum_disc_price,
  sum(l.extendedprice * (1 - l.discount) * (1 + l.tax)) AS sum_charge,
  avg(l.quantity)                                       AS avg_qty,
  avg(l.extendedprice)                                  AS avg_price,
  avg(l.discount)                                       AS avg_disc,
  count(*)                                              AS count_order
FROM
  lineitem_orc l
WHERE
  l.shipdate <= DATE '1998-12-01' - INTERVAL '90' DAY
GROUP BY
l.returnflag,
l.linestatus
ORDER BY
l.returnflag,
l.linestatus;
