/*Example Using ANOVA*/
LIBNAME mydata "/courses/d1406ae5ba27fe300 " access=readonly;
DATA new; set mydata.diet_exercise;

PROC SORT; BY EXERCISE;

PROC ANOVA; CLASS DIET;
MODEL WEIGHTLOSS=DIET;
MEANS DIET; BY EXERCISE

RUN;


/*Example Using Chi-Square*/
LIBNAME mydata "/courses/d1406ae5ba27fe300 " access=readonly;
DATA new; set mydata.nesarc_pds;
LABEL TAB12MDX="Tobacco Dependence Past 12 Months"
	  CHECK321="Smoked Cigarettes in Past 12 Months"
	  S3AQ3B1="Usual Smoking Frequency"
	  S3AQ3C1="Usual Smoking Quantity";

/*Set appropriate missing data as needed*/
IF S3AQ3B1=9 THEN S3AQ3B1=.;
IF S3AQ3C1=99 THEN S3AQ3C1=.;

IF S3AQ3B1=1 THEN USFREQMO=30;
ELSE IF S3AQ3B1=2 THEN USFREQMO=22;
ELSE IF S3AQ3B1=3 THEN USFREQMO=14;
ELSE IF S3AQ3B1=4 THEN USFREQMO=5;
ELSE IF S3AQ3B1=5 THEN USFREQMO=2.5;
ELSE IF S3AQ3B1=6 THEN USFREQMO=1;
/*USFREQMO usual smoking days per month
1=once a month or less
2.5=2-3 days per month
5=1-2 days per week 
14=3-4 days per week
22=5-6 days per week
30=everyday*/

NUMCIGMO_EST=USFREQMO*S3AQ3C1;

PACKSPERMONTH=NUMCIGMO_EST/20;

IF PACKSPERMONTH LE 5 THEN PACKCATEGORY=3;
ELSE IF PACKSPERMONTH LE 10 THEN PACKCATEGORY=7;
ELSE IF PACKSPERMONTH LE 20 THEN PACKCATEGORY=15;
ELSE IF PACKSPERMONTH LE 30 THEN PACKCATEGORY=25;
ELSE IF PACKSPERMONTH GT 30 THEN PACKCATEGORY=58;

/*USQUAN: 0=nondaily smoking; 3=1-5 cigs/day; 8=6-10 cigs/day;
13=11-15 cigs/day; 18=16-20 cigs/day; 37=21-37 cigs/day*/
IF S3AQ3C1 NE 1 THEN USQUAN=0;
ELSE IF S3AQ3C1 GE 1 AND S3AQ3C1 LE 5 THEN USQUAN=3;
ELSE IF S3AQ3C1 GE 6 AND S3AQ3C1 LE 10 THEN USQUAN=8;
ELSE IF S3AQ3C1 GE 11 AND S3AQ3C1 LE 15 THEN USQUAN=13;
ELSE IF S3AQ3C1 GE 16 AND S3AQ3C1 LE 20 THEN USQUAN=18;
ELSE IF S3AQ3C1 GE 20 THEN USQUAN=37; 

/*subsetting data to include only past 12 month smokers, age 18-25*/
IF CHECK321=1;
IF AGE LE 25;

PROC SORT; by MAJORDEPLIFE;

PROC FREQ; TABLES TAB12MDX*USQUAN/CHISQ;
BY MAJORDEPLIFE;

/*PACKCATEGORY PACKSPERMONTH TAB12MDX CHECK321 S3AQ31 S3AQ3C1;*/

PROC GCHART; VBAR USQUAN/discrete type=mean SUMVAR=TAB12MDX;

RUN;

/*Example Using Pearson Correlaton*/
LIBNAME mydata "/courses/d1406ae5ba27fe300 " access=readonly;
DATA new; set mydata.gapminder;

IF incomeperperson EQ . THEN incomegrp=.;
ELSE IF incomeperperson LE 744.239 THEN incomegrp=1;
ELSE IF incomeperperson LE 9425.236 THEN incomegrp=2;
ELSE IF incomeperperson GE 9425.236 THEN incomegrp=3;

IF incomegrp NE .;

PROC SORT; by COUNTRY;

PROC SORT; by incomegrp;

PROC CORR; VAR urbanrate internetuserate; BY incomegrp;

RUN;
