create table employees 
(empid int, 
firstname varchar(30),
lastname varchar(30),
tenure int,
address struct<street:string,city:string>,
subordinates array<string>);


insert into employees 
select 1, "Vitthal","Srinivasan",1, named_struct("street","Bellandur","city","Bangalore"),array("Anuradha","Arun","Swetha")
union all select 2, "Swetha","Kolalapudi",4, named_struct("street","Bellandur","city","Bangalore"),array("Pradeep")
union all select 3, "Janani","Ravi",2, named_struct("street","Bellandur","city","Bangalore"),array("Navdeep")
union all select 4, "Navdeep","Singh",3, named_struct("street","Bellandur","city","Bangalore"),array("Shreya","Jitu");

select address.street, address.city from employees where firstname="Vitthal";
select subordinates[0] from employees where firstname="Janani";