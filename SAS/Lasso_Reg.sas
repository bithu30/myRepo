LIBNAME mydata "/courses/d1406ae5ba27fe300 " access=readonly;
/*proc means data=mydata.gapminder;
var  incomeperperson  urbanrate Internetuserate;
run;*/
data GM;
set mydata.gapminder;

* delete observations with missing data;
 if cmiss(of _all_) then delete;
 run;
proc sql;
create table  life_expect as
select country,
lifeexpectancy as life_expectancy,
incomeperperson  as income,
urbanrate as urban_rate,
Internetuserate  as internet_usage,
alcconsumption as alco_consumption,
armedforcesrate as military_service,
co2emissions as emissions,
HIVrate as hiv_rate,
oilperperson as oil_consumption
from GM;
quit;

ods graphics on;
proc surveyselect data= life_expect out=train_test_data seed=123
	samprate=0.7 method=srs outall;
run;

proc glmselect data=train_test_data plots=all seed=123;
partition role=selected(train ='1' test='0');
model life_expectancy = income urban_rate internet_usage alco_consumption
						military_service emissions hiv_rate oil_consumption
				/selection=lar(choose=cv stop=none) cvmethod=random(10);
run;
 

