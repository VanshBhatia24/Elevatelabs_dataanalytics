select count(distinct JobTitle) from salaries;

select AVG (BasePay) from salaries;
select EmployeeName, TotalPay from salaries order by TotalPay desc limit 10;

select EmployeeName, (BasePay + OvertimePay + OtherPay)/3 as "Average Pay" from salaries;

select EmployeeName, JobTitle from salaries where JobTitle like '%Manager%';

select EmployeeName, JobTitle, TotalPay from salaries where TotalPay between 125000 and 150000 and JobTitle like '%Director%';

select JobTitle, sum(TotalPay) as TotalSalary from salaries group by JobTitle;
select * from salaries;

CREATE TABLE departments (
  JobTitle VARCHAR(255),
  DepartmentName VARCHAR(255)
);

INSERT INTO departments (JobTitle, DepartmentName)
VALUES 
('Manager', 'Management'),
('Director', 'Executive Board'),
('Engineer', 'Engineering'),
('Analyst', 'Business Intelligence'),
('Technician', 'Maintenance'),
('Clerk', 'Administration');

select * from departments;

Select s.EmployeeName, s.JobTitle, d.DepartmentName, s.TotalPay from salaries s
inner join departments d ON s.JobTitle like CONCAT('%', d.JobTitle, '%');

select EmployeeName, JobTitle from salaries where BasePay> (select avg(BasePay) from salaries);

create view TopManagers as
Select EmployeeName, JobTitle, TotalPay
from salaries where JobTitle LIKE '%Manager%'
order by TotalPay DESC
LIMIT 10;

select * from TopManagers;

Create INDEX idx_TotalPay on salaries (TotalPay);
select d.DepartmentName from departments d Join salaries s on s.JobTitle like concat('%', d.JobTitle, '%')
where s.TotalPay > (select AVG(TotalPay) from salaries);