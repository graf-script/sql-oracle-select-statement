create table customer 
(
cust_id number(8),
cust_name varchar2(100),
mobile number(10),
dob date,
city varchar2(100),
email_id varchar2(100)
);

select * from customer;

insert into customer
(cust_id, cust_name, mobile, dob, city, email_id)
values(10000,'Arun',90909090,to_date('08/04/2000','mm/dd/yyyy'), 'Yuzhne', 'arun@gmail.com');

rollback;

insert into customer
(cust_id, cust_name, mobile, dob, city, email_id)
values(10000,'John',90909090,to_date('08/04/2000','mm/dd/yyyy'), 'Odessa', 'john@gmail.com');

commit;

insert into customer
(cust_id, cust_name, dob, city, email_id)
values(10000,'Omaha',to_date('08/04/2000','mm/dd/yyyy'), 'Kiyv', 'omaha@gmail.com');

commit;


update customer
set mobile = 87878787;

rollback;

update customer
set mobile = 78787878 where cust_id = 10003;

commit;
-- add a column
alter table customer
add country varchar2(50);

SELECT * FROM rappers;

insert into rappers
(rap_id, rap_name, mobile_no, dob, city, email_id, rap_best_album)
values(6, 'Young Thug', 12341234, to_date('08/16/1991','mm/dd/yyyy'),'Poskot','thehumbleyndergod@gmail.com','So Much Fun');
-- add column
alter table rappers
add country VARCHAR(30);
-- delete column
alter table rappers
drop column mobile_no;

update rappers set country = 'America' where rap_id = 6;

alter table rappers 
modify COUNTRY NUMBER(31);

create table rappers_bkp as select * from rappers;
select * from rappers_bkp;

truncate table rappers;

select * from rappers;

rollback;

alter table rappers
modify COUNTRY number(31);

alter table rappers
modify COUNTRY varchar2(31);

desc rappers

insert into rappers (select * from rappers_bkp);

drop table rappers_bkp;

insert into rappers
(rap_id, rap_name, dob, city, email_id, rap_best_album, country)
values(7, 'Lil Uzi Vert', to_date('07/31/1995','mm/dd/yyyy'), 'Mariupol','lessgo@gmail.com', 'Eternal Atake', 'America')


select * from employees;

select employee_id as associate_id, first_name, email, hire_date, salary, department_id from employees;
-- concat column
select employee_id as associate_id, 
concat(concat(first_name,' '),last_name) full_name, 
email, hire_date, salary, department_id from employees;
-- calculate column
select employee_id, first_name, email, hire_date,salary,salary + 1000 new_salary,
department_id from employees;
-- count
select count(distinct department_id) from employees;
-- where clause
select * from employees where salary > 10000;

select * from employees order by first_name desc;
select * from employees order by salary desc;
select * from employees order by salary desc, hire_date;
select * from employees order by 8 desc, 6;
select * from employees order by 3;

select employee_id, first_name,email,salary from employees order by 4 desc;

-- SELECT STATEMENTS
-- ������� ��� � ������� employees
SELECT * FROM employees;
SELECT employee_id, first_name,
email, hire_date, salary,
department_id FROM employees;

-- column alias

SELECT employee_id AS emp_id, first_name, hire_date, 
salary, department_id FROM employees;

SELECT employee_id emp_id, first_name, email, hire_date,
salary, department_id FROM employees;

SELECT employee_id emp_id, first_name emp_name, email mail,
salary money FROM employees;

-- column concatenation

SELECT employee_id, first_name, last_name, 
CONCAT(CONCAT(first_name,' '), last_name) full_name, email,
hire_date salary, department_id FROM employees;

SELECT employee_id, first_name, last_name,
CONCAT(CONCAT(last_name,' '), email) nickname, 
hire_date salary, department_id FROM employees;

-- alternative way - pipe

SELECT employee_id emp_id, first_name, last_name,
first_name ||' '|| last_name full_name, email,
hire_date, salary, department_id FROM employees;

-- column calculation 

SELECT employee_id, first_name, email, hire_date,
salary, salary + 1000 new_salary, department_id
FROM employees;

-- unique department_id

SELECT department_id FROM employees;

SELECT COUNT (department_id) FROM employees;

SELECT DISTINCT department_id FROM employees;

SELECT COUNT(DISTINCT department_id) FROM employees;

SELECT COUNT (*) FROM (
    SELECT DISTINCT department_id, job_id FROM employees
);

-- where clause

SELECT * FROM employees WHERE salary > 10000; 

SELECT * FROM employees WHERE salary >5000 AND salary < 7000;

SELECT * FROM employees WHERE salary BETWEEN 4000 AND 8000;

SELECT * FROM employees WHERE salary NOT BETWEEN 4000 AND 6000;

SELECT * FROM employees WHERE department_id = 30;

SELECT * FROM employees WHERE department_id IN (30,60,90);

SELECT * FROM employees WHERE department_id NOT IN (30, 60, 90);

SELECT * FROM employees WHERE department_id = 80 AND salary > 10000;

SELECT * FROM employees WHERE department_id = 60 OR salary > 15000;

SELECT * FROM employees WHERE department_id = 80 
OR (department_id = 60 AND salary > 10000);

SELECT * FROM employees WHERE ROWNUM <= 5;

SELECT ROWNUM, ROWID, e.* from employees e;

SELECT COUNT(*) FROM employees;

select count(*) from employees where department_id IS NULL;

-- select with date

SELECT employee_id, hire_date, to_char(hire_date, 'yyyy') FROM employees;

SELECT employee_id, hire_date, to_number(to_char(hire_date, 'yyyy')) FROM employees;

SELECT employee_id, hire_date, to_char(hire_date, 'mon') FROM employees;

SELECT employee_id, hire_date, to_char(hire_date, 'Month') FROM employees;

SELECT employee_id, hire_date, to_char(hire_date, 'dd') FROM employees;

SELECT employee_id, hire_date, to_char(hire_date, 'dd-mm-yyyy hh24:mi:ss') 
FROM employees;

SELECT * FROM employees where to_char(hire_date, 'yyyy') = '2005';




