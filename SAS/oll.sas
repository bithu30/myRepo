LIBNAME mydata "/courses/d1406ae5ba27fe300 " access=readonly;

/*proc contents data=mydata.oll_pds;run;*/
/*Doing some EDA
proc print data=mydata.oll_pds;
label ppagecat4 = 'Age Group'
var ppagect4;
run;
DATA oll_sample; set mydata.oll_pds;
/*label  = 'Age Group'
run;*/
proc sql;
create table obama_ratings as
select W1_D1 as ratings,
ppagect4 as age_group,
ppethm as ethnicity,
case
	when PPGENDER = 2 then 0
	when PPGENDER = 1 then 1
end as gender,
case
	when PPAGE < 30 then 0
	when PPAGE >=30  then 1
end as age_cat,
case
	when ppethm = 4 then 0
	when ppethm ne 4  then 1
end as eth_cat,
(PPINCIMP - 10.83) as income,
(PPAGE - 48.9) as age,

case 
	when PPEDUC <= 9 then 0
	when PPEDUC > 9  then 1
end as edu_level,
PPHHHEAD as head_of_family,
PPNET as internet_access,
PPMSACAT as msa_status
from mydata.oll_pds;
quit;

/*proc contents data=obama_ratings;run;*//*proc print data=obama_ratings;run;*/

/*fitting a simple liner regression model with one variable on obama_ratings 
this method only fits if the explanatory variables are all Quantitative but my dataset 
 
proc glm;
model ratings=gender; 
run;

proc glm;
model ratings=age_group; 
run;

proc glm;
model ratings=ethnicity; 
run;

proc print data=obama_ratings;
var gender;
run;
*/
/* fitting a model for categorical explanatory variable to quatititative response variable*/

/*proc glm;
model ratings = gender/solution;
run;

proc glm;
model ratings=gender; 
run;

proc print data= obama_ratings;
var gender age_cat eth_cat;
run;
proc freq;
tables gender;
run;
proc freq;
tables age_cat;
run;
proc freq;
tables eth_cat;
run;
proc glm;
model ratings = gender/solution;
run;

proc glm;
model ratings = age_cat/solution;
run;

proc glm;
model ratings = eth_cat/solution;
run;
proc means data=mydata.oll_pds;
var PPINCIMP;
run;
proc glm;
model ratings = gender income/solution;
run;

proc glm;
model ratings = gender/solution;
run;
ods graphics on;/*for displaying plots

proc glm;
model ratings = gender age_cat eth_cat edu_level/solution clparm;
run;
*/
/*example for quardratic term
proc glm;
model ratings = income/solution;
run;

proc sgplot;
	reg x=income y=ratings/lineattrs=(color=blue thickness=4) clm;
	yaxis label = "Ratings for Obama";
	xaxis label="Income of participants";
run;

proc glm;
model ratings = income income*income /solution;
run;

proc sgplot;
	reg x=income y=ratings/lineattrs=(color=blue thickness=4) degree=1 clm;
	reg x=income y=ratings/lineattrs=(color=blue thickness=2) degree=2 clm;
	yaxis label = "Ratings for Obama";
	xaxis label="Income of participants";
run;
*/

/*
 clparm= gives 95% confidence intervals 
 residual = res asks for a column with the unstandardized residuals 
 student = stdres, asks for a column with the standardized residuals. 
 out = results option asks for another data set that includes the regression analysis results
ex:
PROC glm PLOTS(unpack)=all;
 model femaleemployrate=urbanrate_c urbanrate_c*urbanrate_c 
 internetuserate_c/solution clparm;
 output residual=res student=stdres out=results;
run;



proc glm plots(unpack)=all;
model ratings = gender eth_cat income edu_level/solution clparm;
output residual=res student=stdres out=results;
run;




proc glm;
model ratings=gender/solution; 
run;

proc glm;
model ratings=age_cat/solution; 
run;

proc glm;
model ratings=eth_cat/solution; 
run;

proc glm;
model ratings=edu_level/solution; 
run;

proc glm;
model ratings=income/solution; 
run;
proc glm;
model ratings=income internet_access edu_level/solution; 
run;
proc glm;
model ratings= internet_access edu_level/solution; 
run;

proc glm;
model ratings=income age  edu_level/solution; 
run;
proc means data=mydata.oll_pds;
var PPAGE;
run;
proc glm;
model ratings=age/solution; 
run;
proc glm;
model ratings = head_of_family/solution;
run;
proc glm;
model ratings = msa_status/solution;
run;
proc glm;
model ratings = internet_access/solution;
run;
*/


ods graphics on;/*for displaying plots*/
proc glm plots(unpack)=all;
model ratings=income age internet_access edu_level/solution;
output residual=res student=stdres out=results; 
run;
proc gplot;
label stdres="Standardized Residual" ratings="Ratings";
plot stdres*ratings/vref=0;
run;







