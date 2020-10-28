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