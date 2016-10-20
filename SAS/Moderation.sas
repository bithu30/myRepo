LIBNAME mydata "/courses/d1406ae5ba27fe300 " access=readonly;
/*proc contents data=mydata.gapminder;run;
proc corr data=mydata.gapminder;var alcconsumption incomeperperson lifeexpectancy;run;
proc corr data=mydata.gapminder;var Internetuserate incomeperperson urbanrate;run;
proc corr data=mydata.gapminder;var relectricperperson incomeperperson urbanrate;run;
proc corr data=mydata.gapminder;var alcconsumption incomeperperson suicideper100TH;run;

proc corr data=mydata.gapminder;var Internetuserate incomeperperson urbanrate;run;*/
proc corr data=mydata.gapminder;var oilperperson  urbanrate;run;
DATA GM;set mydata.gapminder;
IF incomeperperson EQ . THEN income_group = .;
IF incomeperperson LE 744.239 THEN income_group = '1';
ELSE IF incomeperperson LE 9425.326 THEN income_group = '2';
ELSE IF incomeperperson GT 9425.326 THEN income_group = '3';
IF income_group NE .;
run;
/*proc contents data=GM;run;*/

proc sort; by country;
proc sort; by income_group;
proc corr; var oilperperson urbanrate;by income_group;
run;