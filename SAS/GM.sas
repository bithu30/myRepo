LIBNAME mydata "/courses/d1406ae5ba27fe300 " access=readonly;
/*Variables under consideration are all
continous variables so I'm determining the min and max of variables to bin them later*/
proc means nolabels data=mydata.gapminder Min Max;
	var incomeperperson co2emissions lifeexpectancy;
	output out= MinMaxCols;
run;

DATA GM; set mydata.gapminder;
/* increasing the length of income_level_perperson */
format income_level_perperson $30.;
label income_level_perperson='Categories of incomes';
label co2_emi_levels = 'Levels of Co2Emissins';
label life_exp_cat = 'Categories of LifeExpectancy';

/* lifeexpectancy is collapsed using the life_exp_cat variable */
if lifeexpectancy = . then life_exp_cat = 'missing';
else IF lifeexpectancy LE 45 THEN life_exp_cat = '1';
else IF lifeexpectancy GT 45 and lifeexpectancy LE 55  THEN  life_exp_cat = '2';
else IF lifeexpectancy GT 55 and lifeexpectancy LE 65  THEN  life_exp_cat = '3';
else IF lifeexpectancy GT 65 and lifeexpectancy LE 75  THEN  life_exp_cat = '4';
else IF lifeexpectancy GT 75 and  lifeexpectancy LE 85 THEN  life_exp_cat = '5';


/* incomeperperson is collapsed using the income_level_perperson variable */

IF incomeperperson LE 744.239 THEN income_level_perperson = '1';
ELSE IF incomeperperson LE 2553.496 THEN income_level_perperson = '2';
ELSE IF incomeperperson LE 9425.326 THEN income_level_perperson = '3';
ELSE IF incomeperperson GT 9425.326 THEN income_level_perperson = '4';


/* co2emissions is collapsed using the  co2_emi_levels variable */

IF co2emissions LE 33975300 THEN co2_emi_levels = '1';
ELSE IF co2emissions LE 185902000  THEN co2_emi_levels = '2';
ELSE IF co2emissions LE 1852700000 THEN co2_emi_levels = '3';
ELSE IF co2emissions GT 1852700000 THEN co2_emi_levels = '4';


proc SORT; by country;
/*proc print ; var incomeperperson income_level_perperson;run;*/
proc freq; 
tables life_exp_cat co2_emi_levels income_level_perperson  ;
run;
/* PLotting the variables using Gchart
	vbar - for vertical bars
    varname/discrete - for categorical variables
	varname/ - for continous variables
	type=pct plot for the percentage instead of frequencies
	
*/
/*Univariate graphs */
proc gchart;
	vbar life_exp_cat/Discrete type=pct width=10;
	vbar income_level_perperson/Discrete type=pct width=10;
	vbar co2_emi_levels/Discrete type=pct width=10;
run;
/* bivariate graphs */

proc gchart;
	vbar income_level_perperson/Discrete type=mean sumvar=lifeexpectancy width=10;
    vbar co2_emi_levels/Discrete type=mean sumvar=lifeexpectancy width=10;
run;


/*For pulling out the mean modian mode and sd of a quantitative variable 

*/
proc univariate;
 var  incomeperperson co2emissions lifeexpectancy;
run;

proc gplot ;
	plot  lifeexpectancy *  incomeperperson;
	plot lifeexpectancy * co2emissions;
run;
/*procedure for categorical explantory variables with 2 levels
but the variable under consideration has more than 2 levels */
proc ANOVA; class co2_emi_levels;
model lifeexpectancy = co2_emi_levels;
mean co2_emi_levels;
run;

/*procedure for categorical explantory variables with 2 levels
but the variable under consideration has more than 2 levels, so I 'm doing a Duncan post doc test */
proc ANOVA; class co2_emi_levels;
model lifeexpectancy = co2_emi_levels;
mean co2_emi_levels/duncan;
run;

/*procedure for categorical explantory variables with 2 levels
but the variable under consideration has more than 2 levels, so I 'm doing a 
Duncan post doc test - same procedure I'm conduction for the next categorical 
explanatory variable income_level_perperson
*/
proc ANOVA; class income_level_perperson;
model lifeexpectancy = income_level_perperson;
mean income_level_perperson/duncan;
run;
	
