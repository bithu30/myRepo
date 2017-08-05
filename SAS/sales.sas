data sales_ds; set work.sales;
	format firstname $30.; 
    format lastname $30.; 
	employee_id = F1;
	firstname  = F2;
	lastname = F3;
	gender = F4;
    salary = F5;
	keep employee_id firstname lastname gender salary ;
run; 
/*proc contents data=work.sales_ds;
run;
proc print data=work.sales_ds;
var firstname lastname;
run;*/

data male_emps; set work.sales;
    where F4 = 'M';
	format firstname $30.; 
    format lastname $30.; 
    employee_id	 = F1;
	firstname  = F2;
	lastname = F3;
	gender = F4;
    label employee_id = 'EmpID';
	keep employee_id firstname lastname gender;
run; 

/*
proc print data=male_emps;
run;
*/
/* to see the lables */
proc print data=male_emps label;
run;