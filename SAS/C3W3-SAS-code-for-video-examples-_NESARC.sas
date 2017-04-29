libname mydata "/courses/d1406ae5ba27fe300/c_3054" access=readonly;


**************************************************************************************************************
DATA MANAGEMENT
**************************************************************************************************************;
data new; set mydata.NESARC_PDS;
 
if s3aq3c1=99 then s3aq3c1=.;

if tab12mdx=1 then nicotinedep=1; else nicotinedep=0;

rename s3aq3c1=numbercigsmoked;
 
/***********************************************/
/***********MORE COMPLICATED AGGREGATION********/
/***********************************************/
 
array one(*)
s3aq3b1 ever_daily s3aq51 s3aq8b12
S3AQ8B11 S3AQ8B7A S3AQ8B7B S3AQ8B7C S3AQ8B7D S3AQ8B7E S3AQ8B7F S3AQ8B7G S3AQ8B7H
S3AQ8B7J S3AQ8B13 S3AQ8B6 S3AQ8B1 S3AQ8B5 S3AQ8B2 S3AQ8B3 S3AQ8B4 S3AQ8B14;
do I=1 to dim(one);
if one(I) eq 9 then one(I)=.;
end;
 
/*array two(*)
s6q1 s6q2 s6q3 s6q61 s6q62 s6q63 s6q64 s6q65 s6q66 s6q67 s6q68 s6q69 s6q610 s6q611
s6q612 s6q613 s6q7;
do II=1 to dim (two);
if two(II) eq 9 then two(II)=.;
end;*/

/*qualifying panic aggregate variable*/ 
if s6q1=1 and s6q2=1 or s6q2=1 and s6q3=1 or s6q3=1 and s6q61=1 or s6q61=1 and s6q62=1 or s6q62=1 
and s6q63=1 or s6q63=1 and s6q64=1 or s6q64=1 and s6q65=1 or s6q65=1 and s6q66=1 or s6q66=1 
and s6q67=1 or s6q67=1 and s6q68=1 or s6q68=1 and s6q69=1 or s6q69=1 and s6q610=1 or s6q610=1 
and s6q611=1 or s6q611=1 and s6q612=1 or s6q612=1 and s6q613=1 or s6q613=1 and s6q7=1 
or s6q7=1 then panic=1; else panic=0;

if check321=1; /*SMOKED IN THE PAST YEAR*/
if s3aq3b1=1; /*USUALLY SMOKED DAILY IN THE PAST YEAR*/
if age le 25; /*AGE 18 TO 25*/


if s6q1=9 then s6q1=.;
if s6q2=9 then s6q2=.;
if s6q3=9 then s6q3=.;
if s6q61=9 then s6q61=.;
if s6q62=9 then s6q62=.;
if s6q63=9 then s6q63=.;
if s6q64=9 then s6q64=.;
if s6q65=9 then s6q65=.;
if s6q66=9 then s6q66=.;
if s6q67=9 then s6q67=.;
if s6q68=9 then s6q68=.;
if s6q69=9 then s6q69=.;
if s6q610=9 then s6q610=.;
if s6q611=9 then s6q611=.;
if s6q612=9 then s6q612=.;
if s6q613=9 then s6q613=.;
if s6q7=9 then s6q7=.;

/*Current Tolerance criteria #1 DSM-IV*/
 
if S3AQ8B11 eq 1 or S3AQ8B12 eq 1 then ctobcrit1=1;
else if S3AQ8B11 eq 2 and S3AQ8B12 eq 2 then ctobcrit1=0;
 
/*Current 8 WITHDRAWAL SUB-SYMPTOMS IN DSM-IV*/
 
CWITHDR_count=0;
      if S3AQ8B7A eq 1 then CWITHDR_count=CWITHDR_count+1; /*depressed mood*/
      if S3AQ8B7B eq 1 then CWITHDR_count=CWITHDR_count+1; /*insomnia*/
      if S3AQ8B7C eq 1 then CWITHDR_count=CWITHDR_count+1; /*difficulty concentrating*/
      if S3AQ8B7D eq 1 then CWITHDR_count=CWITHDR_count+1; /*increased appetite or weight gain*/
    if S3AQ8B7E eq 1 then CWITHDR_count=CWITHDR_count+1; /*irritability, anger and frustration*/
    if S3AQ8B7F eq 1 then CWITHDR_count=CWITHDR_count+1; /*anxiety*/
      if S3AQ8B7G eq 1 then CWITHDR_count=CWITHDR_count+1; /*anxiety*/
    if S3AQ8B7H eq 1 then CWITHDR_count=CWITHDR_count+1; /*restlessness*/
     
/*Current Withdrawal criteria #2 DSM-IV*/  
 
if CWITHDR_count>=4 or S3AQ8B7J=1 then Ctobcrit2=1;
else if CWITHDR_count lt 4 and S3AQ8B7J=2 then Ctobcrit2=0;
 
/*Current Larger amount or longer period criteria #3 DSM-IV*/
 
if S3AQ8B13 eq 1 then Ctobcrit3=1;
else if S3AQ8B13 eq 2 then Ctobcrit3=0;  
 
/*Current Cut down criteria #4 DSM-IV*/
 
if S3AQ8B6 eq 1 or S3AQ8B1 eq 1 then Ctobcrit4=1;
else if S3AQ8B6 eq 2 and S3AQ8B1 eq 2 then Ctobcrit4=0;
 
/*Current Substance activities criteria #5 DSM-IV*/
 
if S3AQ8B5 eq 1 then Ctobcrit5=1;
else if S3AQ8B5 eq 2 then Ctobcrit5=0; 
 
/*Current Reduce activities criteria #6 DSM-IV*/
 
if S3AQ8B2 eq 1 or S3AQ8B3 eq 1 then Ctobcrit6=1;
else if S3AQ8B2 eq 2 and S3AQ8B3 eq 2 then Ctobcrit6=0;   
 
/*Current use continued despite knowledge of physical or psychological problem criteria #7 DSM-IV*/
 
if S3AQ8B4=1 or S3AQ8B14=1 then Ctobcrit7=1;
else if S3AQ8B4=2 and S3AQ8B14=2 then Ctobcrit7=0;
 
/*CURRENT DSM-IV NICOTINE DEPENDENCE SYMPTOM COUNT*/
 
NDSYMPTOMS=sum (of Ctobcrit1 Ctobcrit2 Ctobcrit3 Ctobcrit4
        Ctobcrit5 Ctobcrit6 Ctobcrit7);

if ethrace2a=5 then ethrace=0; * hispanic;
if ethrace2a=1 then ethrace=1; * white;
if ethrace2a=2 then ethrace=2; * black;
if (ethrace2a=3 or ethrace2a=4) then ethrace=3; * other;

run;
****************************************************************************************************
END DATA MANAGEMENT
****************************************************************************************************;

****************************************************************************************************
MULTIPLE REGRESSION
****************************************************************************************************;

* centering quantitative number of cigarettes smoked (also age for later regression);
* print mean;
PROC MEANS;
var numbercigsmoked age;
run;

* centering (subtract mean);
data new2;
set new;
numbercigsmoked_c = numbercigsmoked - 13.3642586;
age_c = age - 21.6053030;
run;

* check coding;
PROC MEANS;
var numbercigsmoked_c age_c;
run;


* multiple regression model with centered number cigarettes smoked;
PROC GLM; model NDSymptoms=MAJORDEPLIFE numbercigsmoked_c /solution;
run;


* regression model with dysthymia;
PROC GLM; model NDSymptoms=DYSLIFE /solution;
run;

* adding depression;
PROC GLM; model NDSymptoms=DYSLIFE MAJORDEPLIFE/solution;
run;

* adding more explanatory variables;
PROC  GLM; model NDSymptoms=dyslife majordeplife numbercigsmoked_c age_c SEX/solution;
run;

* confidence intervals for parameter estimates;
PROC  GLM; model NDSymptoms=dyslife majordeplife numbercigsmoked_c age_c SEX/solution clparm;
run;

























