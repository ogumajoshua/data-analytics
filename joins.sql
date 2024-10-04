use company;


SELECT Employees.Firstname, Employees.Lastname, Department.Departmentname
FROM Employees
inner join department on employees.departmentid = department.departmentid;
select employees.employeeid, employees.firstname, employees.lastname,
projects.projectid,projects.projectname
from employees
cross join projects;