LIBNAME mydata "/courses/d1406ae5ba27fe300 " access=readonly;
proc sql;
create table obama_approval as
select
case
	when ppethm = 4 then 0
	when ppethm ne 4 then 1 
end as ethnicity,
case
	when PPMARIT ne 1 then 0
	when PPMARIT = 1 then 1
end as marital_status,
case 
	when W1_A12 ne 1 then 0
	when W1_A12 = 1 then 1
end as approval,
case 
	when PPGENDER = 1 then 0
	when PPGENDER = 2 then 1
end as gender
from mydata.oll_pds;
quit;

/*proc print data=obama_approval;
var approval marital_status;
run;
proc glm;
class ethnicity (ref="0");
model approval = ethnicity edu_level/solution;
run;
proc glm;
class ethnicity (ref="1");
model approval = ethnicity edu_level/solution;
run;

proc glm;
class edu_level (ref="0");
model approval = ethnicity edu_level/solution;
run;

proc glm;
class edu_level (ref="1");
model approval = ethnicity edu_level/solution;
run;
*/

/*proc print data=obama_approval;
var approval ethnicity edu_level;
run;
proc glm;
class ethnicity (ref="0");
model approval = ethnicity edu_level/solution;
run;
proc glm;
class ethnicity (ref="1");
model approval = ethnicity edu_level/solution;
run;

proc glm;
class edu_level (ref="0");
model approval = ethnicity edu_level/solution;
run;

proc glm;
class edu_level (ref="1");
model approval = ethnicity edu_level/solution;
run;

proc logistic descending;
model approval = gender;
run;

proc logistic descending;
model approval = gender ethnicity ;
run;
proc logistic descending;
model approval = gender marital_status ;
run;*/
/* gender becomes insignificant when marital_status and ethnicity is added to the model,confounding case*/
proc logistic descending;
model approval = gender;
run;
proc logistic descending;
model approval = gender ethnicity ;
run;
proc logistic descending;
model approval = gender ethnicity marital_status;
run;