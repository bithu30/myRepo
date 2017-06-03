SELECT SIZE(ARRAY(1,2,3));

SELECT SIZE(MAP(“NAME”,”SWETHA”,”AGE”,30)); 


select explode(subordinates) from employees where firstname='Vitthal';

select firstname, exp.subordinates from employees 
LATERAL VIEW explode(subordinates) exp as subordinates where firstname='Vitthal';