use company;

update employees set lastname = 'Ndegwa' where employeeid = 1;
update projects set projectname = 'Project Z' where projectid = 1005;

select * from employees;
alter table employees add email varchar(100);
select * from employees;
delete from projects where projectid=9;
delete from department where departmentid=7;
insert into employees(
employeeid, firstname, lastname,departmentid, hiiredate)
values
(12, 'Joshua', 'Okoth', 105, '2024-02-22');
alter table employees drop column email;
select employees;
