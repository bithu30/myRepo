LIBNAME mydata "/courses/d1406ae5ba27fe300 " access=readonly;
/*proc contents data=mydata.gapminder;run;

proc print data=mydata.gapminder;
var  incomeperperson  urbanrate relectricperperson;
run;


/*mean incomeperperson - 8740.97 urbanrate - 56.77 internetuserate - 35.63
proc means data=mydata.gapminder;
var  incomeperperson  urbanrate Internetuserate;
run; 

proc glm data=mydata.gapminder;
model relectricperperson = incomeperperson;
run;

proc glm data=mydata.gapminder;
model relectricperperson = urbanrate;
run;

proc glm data=mydata.gapminder;
model relectricperperson = employrate;
run;

proc glm data=mydata.gapminder;
model relectricperperson = Internetuserate;
run;*/

proc means data=mydata.gapminder;
var  incomeperperson  urbanrate Internetuserate;
run;
proc sql;
create table  elec_consumption as
select country,
relectricperperson as elec_consumption,
(incomeperperson - 8740.97) as income,
(urbanrate - 56.77) as urban_rate,
(Internetuserate - 35.63) as internet_usage
from mydata.gapminder;
quit;

/*proc print data=elec_consumption;
var  country income  urban_rate internet_usage;
run;*/

proc glm;
model elec_consumption = income;
run;

proc glm;
model elec_consumption = urban_rate;
run;
/* example of confounding */
proc glm;
model elec_consumption = urban_rate internet_usage;
run;

ods graphics on;
proc glm plots(unpack)=all;
model elec_consumption = income urban_rate internet_usage/clparm;
output residual=res student=stdres out=results;
run;

proc gplot;
label stdres="Standardized Residual" country="Country";
plot stdres*country/vref=0; 
run;
/*partial plot */

proc reg plots= partial;
model elec_consumption = income urban_rate internet_usage/partial;
run;
