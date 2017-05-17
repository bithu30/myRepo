LIBNAME mydata "/courses/d1406ae5ba27fe300 " access=readonly;
proc sql;
create table obama_approval as
select
case 
	when W1_A12 ne 1 then 2
	when W1_A12 = 1 then 1
end as approval,
ppethm as ethnicity,
ppeducat as education,
PPINCIMP as income,
PPGENDER as gender
from mydata.oll_pds;
quit;

PROC HPFOREST;
/*response variable*/
target approval/level = nominal;
/*categorical explanatory variables */
input ethnicity education gender /level=nominal ;
/*Quantitative explanatory variables */
input income/level=interval;
run;