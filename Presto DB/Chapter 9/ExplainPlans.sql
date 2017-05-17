explain select regionkey, count(*) from nation group by 1;

explain (type distributed) select regionkey, count(*) from nation group by 1;

explain select region.regionkey, count(*) from nation, region where nation.regionkey=region.regionkey group by 1;



