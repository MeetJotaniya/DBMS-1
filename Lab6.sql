USE CSE_3B_315

CREATE TABLE EMP(
	EID INT,
	EName VARCHAR(25),
	Department VARCHAR(25),
	Salary DECIMAL,
	JoiningDate DATETIME,
	City VARCHAR(25) 
)

INSERT INTO EMP VALUES
	(101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot'),
	(102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad'),
	(103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda'),
	(104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot'),
	(105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar'),
	(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad'),
	(107, 'Bhoomi', 'HR', 34000, '1991-12-25', 'Rajkot')
	


--A


--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
SELECT MIN(Salary) AS MINIMUM, MAX(Salary) AS MAXIMUM FROM EMP 

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively.
SELECT SUM(Salary) AS Total_Sal, AVG(Salary) AS Average_Sal FROM EMP

--3. Find total number of employees of EMPLOYEE table.
SELECT COUNT(*) FROM EMP

--4. Find highest salary from Rajkot city.
SELECT MAX(Salary) FROM EMP WHERE CITY = 'Rajkot'

--5. Give maximum salary from IT department.
SELECT MAX(Salary) FROM EMP WHERE Department = 'IT'

--6. Count employee whose joining date is after 8-feb-91.
SELECT COUNT(*) FROM EMP WHERE JoiningDate > 1991-02-08

--7. Display average salary of Admin department.
SELECT AVG(Salary) FROM EMP WHERE Department = 'Admin'

--8. Display total salary of HR department.
SELECT SUM(Salary) FROM EMP WHERE Department = 'HR'

--9. Count total number of cities of employee without duplication.
SELECT COUNT(DISTINCT City) FROM EMP

--10. Count unique departments.
SELECT COUNT(DISTINCT Department) FROM EMP

--11. Give minimum salary of employee who belongs to Ahmedabad.
SELECT MIN(Salary) FROM EMP WHERE City = 'Ahmedabad'

--12. Find city wise highest salary.
SELECT City, MAX(Distinct Salary) FROM EMP GROUP BY City

--13. Find department wise lowest salary.
SELECT Department, Min(Distinct Salary) FROM EMP GROUP BY Department

--14. Display city with the total number of employees belonging to each city.
SELECT CITY, COUNT(*) FROM EMP GROUP BY City 

--15. Give total salary of each department of EMP table.
SELECT Department, SUM(Salary) FROM EMP GROUP BY Department

--16. Give average salary of each department of EMP table without displaying the respective department name.
SELECT AVG(Salary) FROM EMP GROUP BY Department



--B

--1. Count the number of employees living in Rajkot.
SELECT COUNT(*) FROM EMP WHERE City = 'Rajkot'

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE
SELECT MAX(Salary) - MIN(Salary) AS Column_Difference FROM EMP 

--3. Display the total number of employees hired before 1st January, 1991.
SELECT COUNT(EID) FROM EMP WHERE JoiningDate < '1991-01-01'



--Part – C:

--1. Count the number of employees living in Rajkot or Baroda.
SELECT COUNT(*) FROM EMP WHERE CITY = 'Rajkot' OR CITY = 'Baroda'

--2. Display the total number of employees hired before 1st January, 1991 in IT department.
SELECT COUNT(*) FROM EMP WHERE JoiningDate < '1991-01-01' AND Department = 'IT'

--3. Find the Joining Date wise Total Salaries.
SELECT SUM(Salary) FROM EMP GROUP BY JoiningDate

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
SELECT MAX(Salary) FROM EMP WHERE CITY LIKE 'R%' GROUP BY Department 

