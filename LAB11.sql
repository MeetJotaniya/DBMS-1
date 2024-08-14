CREATE TABLE STU_INFO (
    Rno INT PRIMARY KEY,           
    Name VARCHAR(50),              
	Branch VARCHAR(10)             
);

INSERT INTO STU_INFO (Rno, Name, Branch) VALUES
(101, 'Raju', 'CE'),
(102, 'Amit', 'CE'),
(103, 'Sanjay', 'ME'),
(104, 'Neha', 'EC'),
(105, 'Meera', 'EE'),
(106, 'Mahesh', 'ME');

CREATE TABLE RESULT (
    Rno INT,                       
    SPI DECIMAL(3, 2),             
    PRIMARY KEY (Rno),            
    FOREIGN KEY (Rno) REFERENCES STU_INFO(Rno) 
);

INSERT INTO RESULT (Rno, SPI) VALUES
(101, 8.8),
(102, 9.2),
(103, 7.6),
(104, 8.2),
(105, 7.0),
(106, 8.9);


CREATE TABLE EMPLOYEE_MASTER1 (
    EmployeeNo VARCHAR(10) PRIMARY KEY,   
    Name VARCHAR(50),                     
    ManagerNo VARCHAR(10),                
	FOREIGN KEY (ManagerNo) REFERENCES EMPLOYEE_MASTER1(EmployeeNo) 
);

INSERT INTO EMPLOYEE_MASTER1 (EmployeeNo, Name, ManagerNo) VALUES
('E01', 'Tarun', NULL),
('E02', 'Rohan', 'E02'),
('E03', 'Priya', 'E01'),
('E04', 'Milan', 'E03'),
('E05', 'Jay', 'E01'),
('E06', 'Anjana', 'E04');

--Part – A:
--1. Combine information from student and result table using cross join or Cartesian product.
SELECT * FROM STU_INFO
CROSS JOIN RESULT;

--2. Perform inner join on Student and Result tables.
SELECT * FROM STU_INFO
INNER JOIN RESULT
ON STU_INFO.Rno = RESULT.Rno;

--3. Perform the left outer join on Student and Result tables.
SELECT * FROM STU_INFO
LEFT OUTER JOIN RESULT
ON STU_INFO.Rno = RESULT.Rno;

--4. Perform the right outer join on Student and Result tables.
SELECT * FROM STU_INFO
RIGHT OUTER JOIN RESULT
ON STU_INFO.Rno = RESULT.Rno;


--5. Perform the full outer join on Student and Result tables. 
SELECT * FROM STU_INFO
FULL OUTER JOIN RESULT
ON STU_INFO.Rno = RESULT.Rno;

--6. Display Rno, Name, Branch and SPI of all students.
SELECT STU_INFO.Branch, STU_INFO.Name, RESULT.SPI,STU_INFO.Rno FROM STU_INFO
JOIN RESULT
ON STU_INFO.Rno = RESULT.Rno;

--7. Display Rno, Name, Branch and SPI of CE branch’s student only.
SELECT STU_INFO.Branch, STU_INFO.Name, RESULT.SPI, STU_INFO.Rno FROM STU_INFO
JOIN RESULT
ON STU_INFO.Rno = RESULT.Rno
WHERE STU_INFO.BRANCH = 'CE';	

--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
SELECT STU_INFO.Branch, STU_INFO.Name, RESULT.SPI,STU_INFO.Rno  FROM STU_INFO
JOIN RESULT
ON STU_INFO.Rno = RESULT.Rno
WHERE STU_INFO.BRANCH <> 'EC';


--9. Display average result of each branch.
SELECT  AVG(RESULT.SPI) AS AVG_RES,STU_INFO.Branch FROM STU_INFO
JOIN RESULT
ON STU_INFO.Rno = RESULT.Rno
GROUP BY STU_INFO.Branch;

--10. Display average result of CE and ME branch.
SELECT  AVG(RESULT.SPI) AS AVG_RES,STU_INFO.Branch FROM STU_INFO
JOIN RESULT
ON STU_INFO.Rno = RESULT.Rno
GROUP BY STU_INFO.Branch
having STU_INFO.Branch='CE'AND STU_INFO.Branch='ME';

--Part – B:

--1. Display average result of each branch and sort them in ascending order by SPI.
SELECT AVG(RESULT.SPI) AS AVG_RES, STU_INFO.Branch FROM STU_INFO
JOIN RESULT
ON STU_INFO.Rno = RESULT.Rno
GROUP BY STU_INFO.Branch
ORDER BY AVG_RES;

--2. Display highest SPI from each branch and sort them in descending order.
SELECT MAX(RESULT.SPI)AS HIGHES_RES, STU_INFO.Branch FROM STU_INFO
JOIN RESULT
ON STU_INFO.Rno = RESULT.Rno
GROUP BY STU_INFO.Branch
ORDER BY HIGHES_RES DESC;

--Part – C:

--1. Retrieve the names of employee along with their manager’s name from the Employee table.

SELECT e.Name AS EmployeeName, m.Name AS ManagerName
FROM Employee_master1 e
LEFT JOIN 
Employee_master1 m ON e.Managerno = m.Employeeno;

