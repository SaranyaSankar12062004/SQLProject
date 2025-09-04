create database SSaranya2;
use SSaranya2;
-- Create Department table
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    department_email_id varchar(50),
    department_location varchar(50)
);
insert into department(department_id,department_name,department_email_id,department_location)
values(1,"IT","aaa","Arni"),
(2,"CSE","sss","Vellore"),
(3,"AI","ddd","Ranipet"),
(4,"ML","fff","Vazhapandal"),
(5,"DS","ggg","Chennai");
select*from SSaranya2.department;
select*from department;

-- Create Employee table
CREATE TABLE Employeess(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE,
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
    ON DELETE CASCADE
);

INSERT INTO employeess (employee_id, first_name, last_name, hire_date, salary, department_id)
VALUES 
    (6, 'Saranya', 'S', '2004-06-12', 70000, 3), 
    (7, 'Sankar', 'R', '1975-08-16', 100000, 1), 
    (8, 'Komathi', 'S', '1980-12-16', 60000, 2), 
    (9, 'Lokesh', 'S', '2005-09-22', 50000, 4), 
    (10, 'Papa', 'N', '2000-10-26', 20000, "NULL");
select*from employeess where employee_id=7;
select*from employeess;
select employee_id from employeess;
select first_name from employeess;
select department_id from employeess;
select*from employeess;
select*from SSaranya2.employeess;


select employee_id,first_name,last_name from employeess 
inner join department
on employeess.department_id=department.department_id;

select *from employeess inner join department on employeess.department_id=department.department_id;


SELECT department.department_id, department.department_name, 
       employeess.employee_id, employeess.first_name, employeess.last_name
FROM department
LEFT OUTER JOIN employeess ON department.department_id = employeess.department_id;


SELECT department.department_id, department.department_name, 
       employeess.employee_id, employeess.first_name, employeess.last_name
FROM department
RIGHT OUTER JOIN employeess ON department.department_id = employeess.department_id;


select * from department cross join employeess;

SELECT Employeess.Employee_ID, Employeess.first_name, Department.Department_Name
FROM Employeess
CROSS JOIN Department;


SELECT e1.employee_id AS Employee1_ID, 
       e1.first_name AS Employee1_Name, 
       e2.employee_id AS Employee2_ID, 
       e2.first_name AS Employee2_Name, 
       e1.department_id
FROM employeess e1
JOIN employeess e2 
ON e1.department_id = e2.department_id;

select department_id,department_name from departments
union
select department_id,first_name from employeess;

select department_id,department_name from departments
union all
select department_id,first_name from employeess;

select employee_id,first_name,last_name,salary,
case
when salary>50000 then "Highest Salary"
when salary=50000 then "Moderate Salary"
when salary<=50000 then "Lowest Salary"
else "Inaccurate Salary"
end as Salary_details from employeess;
