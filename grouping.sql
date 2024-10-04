use  company;
select departmentid, count(*) as employeecount
from employees
group by departmentid;
