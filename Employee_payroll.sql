#uc1
CREATE DATABASE payroll_service;
USE payroll_service
SELECT DATABASE();
#UC2
CREATE TABLE employee_payroll
(
id  int unsigned not null auto_increment,
name varchar (150) not null,
salary double not null,
start date not null,
primary key(id)
);

#uc3
insert into  employee_payroll (name ,salary,start) values
('Bill' ,12345,'2018-01-03'),
('Terisa',20000,'2018-11-13'),
('charlie',3940309,'2018-12-21');

#UC4
select *  from employee_payroll;

#UC5
select salary from employee_payroll where name='Bill';

select * from employee_payroll where start between date '2018-01-03'
 and date(NOW());