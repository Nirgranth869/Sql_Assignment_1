

		# Table 1
create table Department(
Code int not null primary key auto_increment,
Name character(30),
Budget int(10)
);
insert into Department(Code,Name,Budget)
values(14,"IT",6500),
(37,"Accounting",15000),
(59,"Human Resources",240000),
(77,"Research",55000);
select * from Department;

			# Table 2
create table Employee(
Id int not null primary key auto_increment,
Name character(15),
Last_Name character(15),
Department int(3)
);
insert into Employee(Id,Name,Last_Name,Department)
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
select * from Employee;

# 2.1 Select the last name of all employees.
select Last_Name from Employee; # Ans = 12 Employee

# 2.2 Select the last name of all employees, without duplicates.
select distinct(Last_Name) from Employee;	# Ans = 10 Employee

# 2.3 Select all the data of employees whose last name is "Smith".
select * from Employee where Last_Name = "Smith";	# Ans = 2 Employee

# 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
select * from Employee where Last_Name in ("Smith","Doe"); # Ans= 4 Employee 

select * from employee where Last_Name="Smith" or Last_Name="Doe";

# 2.5 Select all the data of employees that work in department 14.
select * from Employee where Department=14;	# Ans = 5 Employee

# 2.6 Select all the data of employees that work in department 37 or department 77.
select * from Employee where Department in (37,77);	# Ans = 7 Employee	

select * from employee where department=37 or department=77;

# 2.7 Select all the data of employees whose last name begins with an "S".
select *  from Employee where Last_Name like "S%";	# Ans = Employee 

# 2.8 Select the sum of all the departments' budgets.
select sum(Budget) from Department;	# Ans = 3,16,500.

select Name,sum(budget) from department group by name;

# 2.9 Select the number of employees in each department 
	#(you only need to show the department code and the number of employees).
select Department,count(Name) as Total_Name
from Employee group by Department;

select Department,count(*) as Total_Name
from Employee group by Department;

# 2.10 Select all the data of employees, including each employee's department's data.
select * from employee join department on Department.Code = employee.Department; 

select a.*,B.* from employee a join department b on a.`Department`=b.`Code`;

# 2.11 Select the name and last name of each employee, 
	# along with the name and budget of the employee's department.
select employee.Name as Emp_name,Employee.Last_Name,
department.Name as Dep_Name,Department.Budget from employee 
join department on Department.Code = employee.Department;

select a.name Emp_Name,a.Last_name,b.name as Dep_Name,b.budget from employee a join department b 
on a.`Department`=b.`Code`;

# 2.12 Select the name and last name of employees working for 
	#departments with a budget greater than $60,000.
select employee.Name as Emp_name,Employee.Last_Name,department.Name as Dep_Name,
Department.Budget from employee
join department on Department.Code = employee.Department
where Department.Budget > 60000;

select a.name Emp_Name,a.Last_Name,b.budget from employee a join department b 
on a.`Department`=b.`Code` and b.`Budget`>60000;

select Name,Last_Name from employee
where Department in (select code from department where budget>60000); 

# *2.13 Select the departments with a budget larger than the 
		# average budget of all the departments.
select Employee.Department,avg(Department.Budget) as Avg_Bud
from hiren_sql_2.employee
join department on Department.Code = employee.Department
group by employee.department order by Avg_Bud desc limit 1;

select * from department where budget > (select avg(budget) from department);

# 2.14 Select the names of departments with more than two employees.
select 	b.name from employee a join department b 
on a.`Department`=b.`Code` group by b.name having count(*)>2;

select b.name from department b where Code in (select Departmnet from employee
group by Department having count(*)>2);

select name from department where code in (select department from employee 
group by department having count(*)>2);

# *2.15 Very Important - Select the name and last name of employees working for departments 
	# with second lowest budget.
select employee.Name as Emo_Name,employee.Last_Name,min(department.Budget) from employee
join department on Department.Code = employee.Department where department.Budget not in (select min(Budget) from Department)
order by Budget desc;

select E.name,E.last_name,D.`Budget` from employee E inner join department D on E.department=D.code 
where D.budget=(select budget from department order by budget limit 1,1);


# 2.16 Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11.
	# And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
insert into Department(Code,Name,Budget)
values(11,"Quality Assurance",40000);
select * from hiren_sql_2.department;
insert into Employee(Id,Name,Last_Name,Department)
values(847219811,"Mary","Moore",11);
select * from Employee;

# 2.17 Reduce the budget of all departments by 10%.
select concat(employee.Name," ",employee.Last_Name) as Emp_Name,Department.Name as Dep_Name,Department.Budget,
Budget*10/100 as Discount,Budget-Budget*10/100 as Act_Budget
from Employee join department on department.Code=employee.Department;

select *,Budget*10/100 as Red_Budget,Budget-Budget*10/100 as Act_Budget from Department;

# *2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
update employee set department=14 where department=77;

# 2.19 Delete from the table all employees in the IT department (code 14).
delete from Employee where Department=14;

# 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
delete employee from employee join department on employee.Department=department.Code
where department.budget >= 60000;

delete from employee where `Department` in (select code from department where budget>=60000);

# 2.21 Delete from the table all employees.
delete from employee;
select * from employee;