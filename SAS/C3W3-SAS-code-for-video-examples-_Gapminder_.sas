libname mydata "/courses/d1406ae5ba27fe300/c_3054" access=readonly;

data new; set mydata.gapminder;
run;

*************************************************************************************************
POLYNOMIAL REGRESSION
*************************************************************************************************;

* scatterplot with linear regression line femaleemployrate response variable;
proc sgplot;
  reg x=urbanrate y=femaleemployrate / lineattrs=(color=blue thickness=2) clm;
  yaxis label="Female Employment Rate";
  xaxis label="Urbanization Rate";
run;
* scatterplot with linear and quadratic regression line;
proc sgplot;
  reg x=urbanrate y=femaleemployrate / lineattrs=(color=blue thickness=2) degree=1 clm;
  reg x=urbanrate y=femaleemployrate / lineattrs=(color=green thickness=2) degree=2 clm;
  yaxis label="Female Employment Rate";
  xaxis label="Urbanization Rate";
run;


* centering quantitative explanatory variables;
data new2; set new;
if urbanrate ne . and femaleemployrate ne . and internetuserate ne .;
urbanrate_c=urbanrate-56.8410778;
internetuserate_c=internetuserate-34.2204688;
run;
proc means; var urbanrate internetuserate;
run;
* check coding;
proc means; var urbanrate_c internetuserate_c;
run;

* linear regression model;
PROC glm; 
model femaleemployrate=urbanrate_c/solution clparm;
run;

* polynomial regression model;
PROC glm; 
model femaleemployrate=urbanrate_c urbanrate_c*urbanrate_c/solution clparm;
run;

*************************************************************************************************
EVALUATING MODEL FIT
*************************************************************************************************;

* multiple regression adding internet use rate;
PROC glm; 
model femaleemployrate=urbanrate_c urbanrate_c*urbanrate_c internetuserate_c/solution clparm;
run;

* request regression diagnostic plots;
PROC glm PLOTS(unpack)=all;
 model femaleemployrate=urbanrate_c urbanrate_c*urbanrate_c 
 internetuserate_c/solution clparm;
 output residual=res student=stdres out=results;
run;


* plot of standardized residuals for each observation;
proc gplot;
label stdres="Standardized Residual" country="Country";
plot stdres*country/vref=0; 
run;


* using proc reg to get a partial regression plot;
* calculate quadratic terms;
data partial;
set new2;
urbanrate2=urbanrate_c*urbanrate_c;
run;

*partial regression plot;
PROC reg plots=partial;
 model femaleemployrate=urbanrate urbanrate2 
 internetuserate/partial;
 run;










