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
#UC6
alter table employee_payroll add gender char(1)  not null after name;
UPDATE  employee_payroll set gender ='M' WHERE name='Bill' or name='Charlie';

#UC7
SELECT sum(salary) FROM  employee_payroll WHERE gender ='M' GROUP BY gender;
SELECT avg(salary) FROM  employee_payroll WHERE gender ='M' GROUP BY gender;
SELECT min(salary) FROM  employee_payroll WHERE gender ='M' GROUP BY gender;
SELECT max(salary) FROM  employee_payroll WHERE gender ='M' GROUP BY gender;
SELECT COUNT(gender) FROM  employee_payroll WHERE gender ='F' GROUP BY gender;
SELECT COUNT(gender) FROM  employee_payroll WHERE gender ='M' GROUP BY gender;

#UC8
alter table employee_payroll add phone_number varchar(300)  not null after start;
alter table employee_payroll add address varchar(300)  default 'Katras'  after phone_number;
alter table employee_payroll add department varchar(300)  not null  after address;

#UC9
alter table employee_payroll add basic_pay varchar(200)  not null after deductions;
alter table employee_payroll add taxable_pay varchar(200)  not null after basic_pay;
alter table employee_payroll add income_tax varchar(200)  not null after taxable_pay;
alter table employee_payroll add net_pay varchar(200)  not null after income_tax;

#UC10
insert into  employee_payroll (name ,salary,start,department,gender,phone_number,deductions,basic_pay,taxable_pay,income_tax,net_pay) values
('Terisa',20000,'2018-11-13','Sales','F','0','0','0','0','0','0'),('Terisa',20000,'2018-11-13','Department','F','0','0','0','0','0','0');

#uc11
CREATE TABLE company						
(
 company_id 	INT primary key, 				
 company_name 	VARCHAR(30) NOT NULL
);


create table employee(
emp_id INT NOT NULL,
name VARCHAR(150) NOT NULL,
address VARCHAR(150) NOT NULL,
gender VARCHAR(150) NOT NULL,
start DATE NOT NULL,
PRIMARY KEY (emp_id),
company_id int,
foreign key(company_id) REFERENCES company(company_id)
);


select * from employee;
create table  Emplyee_Department
(emp_id int,
dept_id int ,
primary key(emp_id,dept_id),
foreign key(emp_id) references employee(emp_id),
foreign key(dept_id) references department(dept_id));


create table payroll(
basic_pay double not null,
taxable_pay double not null,
income_tax double not null,
deduction double not null,
emp_id int,
foreign key(emp_id) references employee(emp_id));
create table department(
dept_id int primary key,
dept_name varchar(200),
dept_hod varchar(200)
);


INSERT INTO company VALUES 	
(1,'Capgemini');


insert into  employee (emp_id,name ,address,gender,start,company_id) values
(1,'Bill' ,'jsr','M','2018-01-03',1),
(2,'Terisa','ranchi','F','2018-11-13',1),
(3,'charlie','delhi','M','2018-12-21',1);

INSERT INTO payroll(basic_pay,taxable_pay,income_tax,deduction,emp_id) VALUES 					
(52000.00,2000.00,45000.00,5000.00,1);

INSERT INTO department VALUES  					 
(100, 'Sales','abc'),
(200, 'Marketing','xyz');

INSERT INTO employee_department VALUES  				
(1,100),
(1,200);