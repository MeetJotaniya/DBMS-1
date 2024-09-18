CREATE TABLE STUDENT_DATA (
    no INT ,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT
);

INSERT INTO STUDENT_DATA (no, Name, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

CREATE TABLE ACADEMIC (
    Rno INT,
    SPI DECIMAL(3, 1),
    Bklog INT
);

INSERT INTO ACADEMIC (Rno, SPI, Bklog) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

CREATE TABLE DEPARTMENT (
    DID INT ,
    DName VARCHAR(50)
);

INSERT INTO DEPARTMENT (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');

--Part – A:
--1. Display details of students who are from computer department.
SELECT * FROM STUDENT_DATA WHERE DID=(SELECT DID FROM DEPARTMENT WHERE DName='COMPUTER')

--2. Displays name of students whose SPI is more than 8.
SELECT Name FROM STUDENT_DATA WHERE no in(SELECT Rno FROM ACADEMIC WHERE SPI>8)

--3. Display details of students of computer department who belongs to Rajkot city.
select * from STUDENT_DATA
where city = 'Rajkot'
and DID in (select did from DEPARTMENT where dname = 'Computer'); 

--4. Find total number of students of electrical department.
SELECT COUNT(DID) FROM STUDENT_DATA WHERE DID=(SELECT DID FROM DEPARTMENT WHERE DName='Electrical')

--5. Display name of student who is having maximum SPI.
SELECT Name FROM STUDENT_DATA WHERE no=(Select Rno from ACADEMIC where SPi=(SELECT MAX(SPI) FROM ACADEMIC))

--6. Display details of students having more than 1 backlog.
select * from student_data where no in(Select Rno from ACADEMIC where Bklog>1) 

--Part – B:
--1. Display name of students who are either from computer department or from mechanical department.
SELECT Name FROM STUDENT_DATA WHERE DID in(SELECT DID FROM DEPARTMENT WHERE DName='Computer' or Dname='Mechanical')

--2. Display name of students who are in same department as 102 studying in.
select name
from STUDENT_DATA
where no <> 102 and DID = (select did from STUDENT_DATA where no = 102);


--Part – C:
--1. Display name of students whose SPI is more than 9 and who is from electrical department.
Select Name From STUDENT_DATA Where no =(Select Rno From Academic where SPI>9 and DID=(Select DID From DEPARTMENT where DName='Electrical'))

--2. Display name of student who is having second highest SPI.
SElect Name FRom STUDENT_DATA WHERE no in(SELECT Rno FROM ACADEMIC WHERE SPI<(Select max(spi) from ACADEMIC))  

--3. Display city names whose students branch wise SPI is 9.2
select city,name
from STUDENT_DATA
where no in (select Rno from ACADEMIC where SPI = 9.2);

--SET Operators
--Part – A:


	CREATE TABLE Computer (
		RollNo INT,
		Name VARCHAR(50)
	);

	INSERT INTO Computer (RollNo, Name) VALUES
	(101, 'Ajay'),
	(109, 'Haresh'),
	(115, 'Manish');

	CREATE TABLE Electrical (
		RollNo INT PRIMARY KEY,
		Name VARCHAR(50)
	);

	INSERT INTO Electrical (RollNo, Name) VALUES
	(105, 'Ajay'),
	(107, 'Mahesh'),
	(115, 'Manish');

--1. Display name of students who is either in Computer or in Electrical.
select name from Computer
union select name from Electrical;

--2. Display name of students who is either in Computer or in Electrical including duplicate data.
select name from Computer
union all select name from Electrical;

--3. Display name of students who is in both Computer and Electrical.
select name from Computer
intersect select name from Electrical;

--4. Display name of students who are in Computer but not in Electrical.
select name from Computer
except select name from Electrical;

--5. Display name of students who are in Electrical but not in Computer.
select name from Electrical
except select name from Computer;

--6. Display all the details of students who are either in Computer or in Electrical.
select * from Computer
union select * from Electrical;

--7. Display all the details of students who are in both Computer and Electrical.
select * from Computer
intersect select * from Electrical;

--Part – B:
	CREATE TABLE Emp_DATA (
		EID INT,
		Name VARCHAR(50)
	);

	INSERT INTO Emp_DATA (EID, Name) VALUES
	(1, 'Ajay'),
	(9, 'Haresh'),
	(5, 'Manish');

	CREATE TABLE Customer (
		CID INT,
		Name VARCHAR(50)
	);

	INSERT INTO Customer (CID, Name) VALUES
	(5, 'Ajay'),
	(7, 'Mahesh'),
	(5, 'Manish');


--1. Display name of persons who is either Employee or Customer.
Select name from Emp_DATA 
union Select name from Customer;

--2. Display name of persons who is either Employee or Customer including duplicate data.
Select name from Emp_DATA 
union all Select name from Customer;

--3. Display name of persons who is both Employee as well as Customer.
Select name from Emp_DATA 
intersect Select name from Customer;

--4. Display name of persons who are Employee but not Customer.
Select name from Emp_DATA 
except Select name from Customer;

--5. Display name of persons who are Customer but not Employee.
Select name from Customer
except Select name from Emp_DATA;

--Part – C: 
--1. Perform all the queries of Part-B but display ID and Name columns instead of Name only
--Display name of persons who is either Employee or Customer.
select * from Emp_DATA
union select * from Customer;

--Display name of persons who is either Employee or Customer including duplicate data.
select * from Emp_DATA
union all select * from Customer;

--Display name of persons who is both Employee as well as Customer.
select * from Emp_DATA
intersect select * from Customer;

--Display name of persons who are Employee but not Customer.
select * from Emp_DATA
except select * from Customer;

--Display name of persons who are Customer but not Employee.
select * from Customer
except select * from Emp_DATA;

