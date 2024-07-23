--LAB7
--PART A:


CREATE TABLE EMP(

		EID INT,
		EName VARCHAR(25),
		Department VARCHAR(25),
		Salary INT,
		JoiningDate DATETIME,
		City VARCHAR(25)
);

INSERT INTO EMP VALUES(101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot');
INSERT INTO EMP VALUES(102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad');
INSERT INTO EMP VALUES(103, 'Bhvin', 'HR', 25000, '1991-05-14', 'Baroda');
INSERT INTO EMP VALUES(104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot');
INSERT INTO EMP VALUES(105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar');
INSERT INTO EMP VALUES(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad');
INSERT INTO EMP VALUES(107, 'Bhoomi', 'HR', 34000, '1991-12-25', 'Rajkot');

Select * FROM EMP;

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
SELECT MAX(Salary) as Highest_salary , MIN(Salary) as Lowest_salary 
FROM EMP;

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, 
--respectively.
SELECT SUM(Salary) as TOtAL_salary , AVG(Salary) as AVG_salary 
FROM EMP;

--3. Find total number of employees of EMPLOYEE table.
SELECT count(EID) 
FROM EMP;


--4. Find highest salary from Rajkot city.
SELECT MAX(Salary) as Highest_salary 
FROM EMP
where city = 'rajkot';

--5. Give maximum salary from IT department.
SELECT MAX(Salary) as Highest_salary 
FROM EMP
where Department = 'IT';


--6. Count employee whose joining date is after 8-feb-91.
SELECT COUNT(EID) 
FROM EMP
where JoiningDate > '1991-02-08';

--7. Display average salary of Admin department.
SELECT avg(Salary) as avg_salary 
FROM EMP
where Department = 'admin';

--8. Display total salary of HR department.
SELECT sum(Salary) as total_salary 
FROM EMP
where Department = 'HR';

--9. Count total number of cities of employee without duplication.
SELECT COUNT(distinct city) from EMP;

--10. Count unique departments.
SELECT COUNT(distinct Department) from EMP;

--11. Give minimum salary of employee who belongs to Ahmedabad.
SELECT max(Salary) as Highest_salary 
FROM EMP
where City = 'Ahmedabad';

--12. Find city wise highest salary.
SELECT MAX(Salary) as highest_salary 
FROM EMP
Group By City;

--14. Display city with the total number of employees belonging to each city.
SELECT city, COUNT(EID) 
FROM EMP
Group By City;

--13. Find department wise lowest salary.
SELECT Min(salary) as Lowest_salary
FROM EMP
Group By Department;

--15. Give total salary of each department of EMP table.
Select sum(salary) From EMP
Group by Department;

--16. Give average salary of each department of EMP table without displaying the respective department 
--name.
Select avg(salary) From EMP
Group by Department;

--PART B:

--1. Count the number of employees living in Rajkot.
Select Count(EID)
from EMP 
where CITY='rajkot';

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
Select Max(salary)-Min(salary)  from EMP;

--3. Display the total number of employees hired before 1st January, 1991.
select count(EID)
from EMP
where JoiningDate<'1991-01-01';

--PART C:

--1. Count the number of employees living in Rajkot or Baroda.
SELECT COUNT(EID)
from EMP
where CITY in('rajkot','baroda');

--2. Display the total number of employees hired before 1st January, 1991 in IT department.
select count(EID)
from EMP
where JoiningDate<'1991-01-01' and Department='it';

--3. Find the Joining Date wise Total Salaries.
select sum(salary)
from EMP
group by JoiningDate;

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
Select max(salary)
from EMP
where City like 'R%'
Group By Department,City;
