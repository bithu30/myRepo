LIBNAME mydata "/courses/d1406ae5ba27fe300 " access=readonly;
DATA new; set mydata.gapminder;
IF incomeperperson eq . THEN incomegroup=.;
ELSE IF incomeperperson LE 744.239 THEN incomegroup=1;
ELSE IF incomeperperson LE 2553.496 THEN incomegroup=2;
ELSE IF incomeperperson LE 9425.236 THEN incomegroup=3;
ELSE IF incomeperperson GT 9425.236 THEN incomegroup=3;

PROC SORT; by COUNTRY;

PROC CORR; VAR urbanrate incomeperperson internetuserate;

RUN;
