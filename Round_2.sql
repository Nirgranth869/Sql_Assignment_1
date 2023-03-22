show databases;

		#Table 1
create database Employ_tab;
use employ_tab;
create table employ_tab(
id int(10),
first_name varchar(12),
last_name varchar(15),
dept int(2)
);
insert into employ_tab (Id,Name,Last_Name,dept)
values(123234877,"Michael","Rogers",14),
(152934485,"Anand","Manikutty",14),
(222364883,"Carol","Smith",37),
(326587417,"Joe","Stevens",37),
(332154719,"Mary-Anne","Foster",14),
(332569843,"George","ODonnell",77),
(546523478,"John","Doe",59),
(631231482,"Devid","Smith",77),
(654873219,"Zacary","Efron",59),
(745685214,"Eric","Goldsmith",59),
(845657245,"Elizabeth","Doe",14),
(845657246,"Kumar","Swamy",14);

select * from employ_tab et ;

		#Table 2
create database dept_tab;
use dept_tab;
create table dept_tab ;
insert into dept_tab (Code,Name,Budget)
values(14,"IT",6500),
(37,"Accounting",15000),
(59,"Human Resources",240000),
(77,"Research",55000);

select * from dept_tab dt ;

#1 Select the last name of all employees, without duplicates.
select last_name from employ_tab et ;

#2 Select all the data of employees whose last name is "Smith".
select * from employ_tab et where last_name ='Smith';

#3 Select all the data of employees whose last name is "Smith" or "Doe".
select * from employ_tab et where last_name in ('Smith', 'doe');

#4 Select all the data of employees that work in department 14.
select * from employ_tab et where dept = 14;

#5 Select all the data of employees that work in department 37 or department 77.
select * from employ_tab et where dept in (37,77);

#6 Select all the data of employees whose last name begins with an "S".
select * from employ_tab et  where  last_name like  's%';

#7 Select the sum of all the departments' budgets
select name,sum(budget) from dept_tab dt group by name  ;

#8 Select the number of employees in each department (you only need to show the department code and the number of employees).
select dept, count(name) as number_of_emplyee from employ_tab et group by dept ;

#9 Select all the data of employees, including each employee's department's data
select et.id, et.name, et.last_name, et.dept, dt.code, dt.name, dt.budget
from employ_tab et join dept_tab dt on (et.dept =dt.code);

#10 Select the name and last name of each employee, along with the name and budget of the employee's department
select et.name, et.last_name, dt.name, dt.budget 
from employ_tab et join dept_tab dt on (et.dept=dt.code);

#11 .Select the name and last name of employees working for departments with a budget greater than $60,000.
select et.name, et.last_name, dt.budget 
from employ_tab et join dept_tab dt on (et.dept =dt.code) where budget>=60000

#12 Select the departments with a budget larger than the average budget of all the departments.
select * from dept_tab dt where budget  > (select avg(budget) from dept_tab dt);
select * from dept_tab dt;

#13 ** Select the names of departments with more than two employees.
select dt.name from employ_tab et join dept_tab dt  on dt.code=et.dept  group by dt.name having  count(*)>2  ;

#14 ** Very Important - Select the name and last name of employees working for departments with second lowest budget.
select et.name, et.last_name, dt.budget from employ_tab et join dept_tab dt
on (et.dept=dt.code) 
where dt.budget = (select min(budget) from dept_tab dt 
where budget > (select min(budget) from dept_tab dt)) ;

#15 Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
insert into dept_tab (code, name, budget) values
(11, 'Quality Assurance', 40000);

#16 ** And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
insert into employ_tab (id, name, last_name, dept) values
(847219811, "Mary",  "Moore",11 );

#17 Reduce the budget of all departments by 10%.
update dept_tab 
set budget = 0.9*budget; 

#18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
update dept_tab 
set code = 14
where code = 77;

#19 Delete from the table all employees in the IT department (code 14).
delete from dept_tab where name = 'it';

#20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
delete from dept_tab where budget >= 60000;

#21 Delete from the table all employees.
delete from employ_tab ;

select * from employ_tab et ;
select * from dept_tab dt ;







































drop table et;
select * from et;