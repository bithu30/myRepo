LIBNAME mydata "/courses/d1406ae5ba27fe300 " access=readonly;

DATA new; set mydata.treeaddhealth;
PROC SORT; BY AID;


PROC HPFOREST;
target TREG1/level=nominal;
input BIO_SEX HISPANIC WHITE BLACK NAMERICAN ASIAN alcevr1 MARever1 cocever1 inhever1 
	Cigavail PASSIST EXPEL1 /level=nominal;
input age DEVIANT1 VIOL1 DEP1 ESTEEM1 PARPRES PARACTV 
  	FAMCONCT schconn1 GPA1 /level=interval;
   
RUN;

