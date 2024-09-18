--Part A: Create table as per following data.

CREATE TABLE City (
    CityID INT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE,
    Pincode INT NOT NULL,
    Remarks VARCHAR(255)
);

CREATE TABLE Village (
    VID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

INSERT INTO City (CityID, Name, Pincode, Remarks) VALUES
(1, 'Rajkot', 360005, 'Good'),
(2, 'Surat', 335009, 'Very Good'),
(3, 'Baroda', 390001, 'Awesome'),
(4, 'Jamnagar', 361003, 'Smart'),
(5, 'Junagadh', 362229, 'Historic'),
(6, 'Morvi', 363641, 'Ceramic');

INSERT INTO Village (VID, Name, CityID) VALUES
(101, 'Raiya', 1),
(102, 'Madhapar', 1),
(103, 'Dodka', 3),
(104, 'Falla', 4),
(105, 'Bhesan', 5),
(106, 'Dhoraji', 5);

select * from City;
select * from Village;

--1. Display all the villages of Rajkot city.
select v.name
from City c
join Village v
on c.CityID = v.CityID
where c.Name = 'Rajkot';

--2. Display city along with their villages & pin code.
select c.name, v.name, c.pincode
from City c
join Village v
on c.CityID = v.CityID;

--3. Display the city having more than one village.
select c.name, count(v.name)
from City c
join Village v
on c.CityID = v.CityID
group by c.Name
having COUNT(v.name) > 1;

--4. Display the city having no village.
select c.name, count(v.name)
from City c
left join Village v
on c.CityID = v.CityID
group by c.Name
having COUNT(v.name) = 0;

--5. Count the total number of villages in each city.
select c.name, count(v.name)
from City c
left join Village v
on c.CityID = v.CityID
group by c.Name;

--6. Count the number of cities having more than one village.
select count(c.CityID)
from city c
where c.CityID in (select c.CityID from City c join Village v on c.CityID = v.CityID group by c.CityID having COUNT(v.vid) > 1);


--Create below table with following constraints

--1. Do not allow SPI more than 10
--2. Do not allow Bklog less than 0.
--3. Enter the default value as �General� in branch to all new records IF no other value is specified.

create table STU_MASTER (
	Rno int primary key,
	Name varchar(50),
	Branch varchar(20) default 'General',
	SPI decimal(4,2) check (SPI >=0 and SPI <=10),
	Bklog int check (Bklog >= 0)
);

insert into STU_MASTER values
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 0),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh', default, 4.50, 3);

insert into STU_MASTER (Rno, Name, SPI, Bklog) values (106, 'Mahesh', 4.50, 3);

select * from STU_MASTER;

--4. Try to update SPI of Raju from 8.80 to 12.
update STU_MASTER
set SPI = 12
where Name = 'Raju';

--5. Try to update Bklog of Neha from 0 to -1.
update STU_MASTER
set Bklog = -1
where Name = 'Neha';

--Part B: Create table as per following schema with proper validation and try to insert data which violate your 
--validation.
--1. Emp_details(Eid, Ename, Did, Cid, Salary, Experience)
--Dept_details(Did, Dname)
--City_details(Cid, Cname)

CREATE TABLE Dept_DETAILS (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL
);

CREATE TABLE City_DETAILS(
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL
);

CREATE TABLE Emp_DETAILS (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10, 2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0), 
    FOREIGN KEY (Did) REFERENCES Dept_DETAILS(Did),
    FOREIGN KEY (Cid) REFERENCES City_DETAILS(Cid)
);

INSERT INTO Dept_DETAILS(Did, Dname) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing');

--error
INSERT INTO Dept_DETAILS(Did, Dname) VALUES (1, null);

INSERT INTO City_DETAILS(Cid, Cname) VALUES
(1, 'New York'),
(2, 'Los Angeles'),
(3, 'Chicago');

--error
INSERT INTO City_DETAILS(Cid, Cname) VALUES (2, 'california');

INSERT INTO Emp_DETAILS(Eid, Ename, Did, Cid, Salary, Experience) VALUES
(1, 'John Doe', 1, 1, 50000.00, 5),
(2, 'Jane Smith', 2, 2, 75000.00, 8),
(3, 'Mike Johnson', 3, 3, 60000.00, 3);

--error
INSERT INTO Emp_DETAILS(Eid, Ename, Did, Cid, Salary, Experience) VALUES
(1, 'John Doe', 1, 1, 50000.00, -2);


--Part C: Create table as per following schema with proper validation and try to insert data which violate your 
--validation.
--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience)
--Dept_info(Did, Dname)
--City_info(Cid, Cname, Did))
--District(Did, Dname, Sid)
--State(Sid, Sname, Cid)
--Country(Cid, Cname)
--2. Insert 5 records in each table.

CREATE TABLE Country_INFO (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL
);

CREATE TABLE State_INFO (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(100) NOT NULL,
    Cid INT,
    FOREIGN KEY (Cid) REFERENCES Country_INFO(Cid)
);

CREATE TABLE District_INFO (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL,
    Sid INT,
    FOREIGN KEY (Sid) REFERENCES State_INFO(Sid)
);

CREATE TABLE Dept_INFO (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL
);

CREATE TABLE City_INFO (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL,
    Did INT,
    FOREIGN KEY (Did) REFERENCES District_INFO(Did)
);

CREATE TABLE Emp_INFO (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10, 2) CHECK (Salary > 0), -- Salary must be positive
    Experience INT CHECK (Experience >= 0),  -- Experience cannot be negative
    FOREIGN KEY (Did) REFERENCES Dept_INFO(Did),
    FOREIGN KEY (Cid) REFERENCES City_INFO(Cid)
);

INSERT INTO Country_INFO (Cid, Cname) VALUES
(1, 'USA'),
(2, 'Canada'),
(3, 'UK'),
(4, 'Australia'),
(5, 'India');

--error
INSERT INTO Country_INFO (Cid, Cname) VALUES(1, 'USA');

INSERT INTO State_INFO (Sid, Sname, Cid) VALUES
(1, 'California', 1),
(2, 'Ontario', 2),
(3, 'London', 3),
(4, 'New South Wales', 4),
(5, 'Gujarat', 5);

--error
INSERT INTO State_INFO (Sid, Sname, Cid) VALUES (1, null, 1);

INSERT INTO District_INFO (Did, Dname, Sid) VALUES
(1, 'Los Angeles', 1),
(2, 'Toronto', 2),
(3, 'Westminster', 3),
(4, 'Sydney', 4),
(5, 'Ahmedabad', 5);

--error
INSERT INTO District_INFO (Did, Dname, Sid) VALUES (1, 'Los Angeles', 1);

INSERT INTO Dept_INFO (Did, Dname) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Sales'),
(5, 'Finance');

--error
INSERT INTO Dept_INFO (Did, Dname) VALUES (1, null);

INSERT INTO City_INFO (Cid, Cname, Did) VALUES
(1, 'Los Angeles City', 1),
(2, 'Toronto City', 2),
(3, 'London City', 3),
(4, 'Sydney City', 4),
(5, 'Ahmedabad City', 5);

--error
INSERT INTO City_INFO (Cid, Cname, Did) VALUES (1, 'Los Angeles City', 1);

INSERT INTO Emp_INFO (Eid, Ename, Did, Cid, Salary, Experience) VALUES
(1, 'John Doe', 1, 1, 50000.00, 5),
(2, 'Jane Smith', 2, 2, 75000.00, 8),
(3, 'Mike Johnson', 3, 3, 60000.00, 3),
(4, 'Alice Brown', 4, 4, 45000.00, 2),
(5, 'Bob Green', 5, 5, 40000.00, 4);

--error
INSERT INTO Emp_INFO (Eid, Ename, Did, Cid, Salary, Experience) VALUES (6, 'John Doe', 1, 1, -10000, 5);

--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all 
--employees.

select e.ename, d.dname, e.salary, e.experience, ci.cname, di.dname, s.sname, c.cname
from Emp_INFO e
join Dept_INFO d
on e.Did = d.Did
join City_INFO ci
on e.Cid = ci.Cid
join District_INFO di
on e.Did = di.Did
join Country_INFO c
on e.Cid = c.Cid
join State_INFO s
on e.cid = s.Cid;
