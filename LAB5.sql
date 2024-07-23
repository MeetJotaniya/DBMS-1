--Lab 5
--Part A:

CREATE TABLE STUDENT(

		StuID INT,
		FirstName VARCHAR(25),
		LastName VARCHAR(25),
		Website VARCHAR(50),
		City VARCHAR(25),
		Address VARCHAR(100)
);

INSERT INTO STUDENT VALUES(1011, 'Keyur', 'Patel', 'techonthenet.com', 'Rajkot', 'A-303 ‘Vasant Kunj’, Rajkot');
INSERT INTO STUDENT VALUES(1022, 'Hardik', 'Shah', 'digminecraft.com', 'Ahmedabad', '“Ram Krupa", Raiya Road');
INSERT INTO STUDENT VALUES(1033, 'Kajal', 'Trivedi', 'bigactivities.com', 'Baroda', 'Raj bhavan plot, near garden');
INSERT INTO STUDENT VALUES(1044, 'Bhoomi', 'Gajera', 'checkyourmath.com', 'Ahmedabad', ' “Jig’s Home”, Narol');
INSERT INTO STUDENT VALUES(1055, 'Harmit', 'Patel', '@me.darshan.com', 'Rajkot', ' B-55, Raj Residency');
INSERT INTO STUDENT VALUES(1066, 'Ashok', 'Jani', NULL, 'Baroda', 'A502, Club House Building');
Select * FROM STUDENT;

--1. Display the name of students whose name starts with ‘k’.
SELECT FirstName FROM STUDENT WHERE FirstName Like 'K%';

--2. Display the name of students whose name consists of five characters.
SELECT FirstName From STUDENT WHERE FirstName LIKE '_____';

--3. Retrieve the first name & last name of students whose city name ends with a & contains six characters.
SELECT FirstName, LastName From STUDENT WHERE City LIKE '_____a';

--4. Display all the students whose last name ends with ‘tel’.
SELECT FirstName From STUDENT WHERE LastName LIKE '%tel';

--5. Display all the students whose first name starts with ‘ha’ & ends with‘t’.
SELECT FirstName From STUDENT WHERE FirstName LIKE 'ha%t';

--6. Display all the students whose first name starts with ‘k’ and third character is ‘y’.
SELECT FirstName From STUDENT WHERE FirstName LIKE 'K_y%';

--7. Display the name of students having no website and name consists of five characters.
SELECT FirstName From STUDENT WHERE Website not LIKE '%.com' and FirstName like '_____';

--8. Display all the students whose last name consist of ‘jer’. 
SELECT FirstName From STUDENT WHERE LastName LIKE '%jer%';

--9. Display all the students whose city name starts with either ‘r’ or ‘b’.
SELECT FirstName From STUDENT WHERE City LIKE '[rb]%';

--10. Display all the name students having websites.
SELECT FirstName From STUDENT WHERE Website like '%.com';

--12. Display all the students whose name’s second character is vowel.
SELECT FirstName From STUDENT WHERE FirstName LIKE '_[aeiou]%';

--11. Display all the students whose name starts from alphabet A to H.
SELECT FirstName From STUDENT WHERE FirstName LIKE '[A-H]%';

--13. Display the name of students having no website and name consists of minimum five characters.
SELECT FirstName From STUDENT WHERE Website like null and FirstName like '_____%'; 

--14. Display all the students whose last name starts with ‘Pat’. 
SELECT FirstName From STUDENT WHERE LastName LIKE 'Pat%';


--15. Display all the students whose city name does not starts with ‘b’.
SELECT FirstName From STUDENT WHERE City NOT LIKE 'B%';

--PART B :

--1. Display all the students whose name starts from alphabet A or H.
SELECT * FROM STUDENT WHERE FirstName like '[AH]%';

--2. Display all the students whose name’s second character is vowel and of and start with H.
SELECT * FROM STUDENT WHERE FirstName like 'H[aeiou]%';

--3. Display all the students whose last name does not ends with ‘a’.
SELECT * FROM STUDENT WHERE LastName not like '%a';

--4. Display all the students whose first name starts with consonant.
SELECT * FROM STUDENT WHERE FirstName not like '[aeiou]%';

--5. Display all the students whose website contains .net
SELECT * FROM STUDENT WHERE Website like '%.net%';

--Part – C:

--1. Display all the students whose address consist of -.
Select * from STUDENT WHERE Address like '%-%';

--2. Display all the students whose address contains single quote or double quote.
Select * from STUDENT WHERE Address like '%''%''%' or Address like '%"%"%'; 

--3. Display all the students whose website contains @.
select * from STUDENT where Website like '%@%';

--4. Display all the names those are either four or five characters.
select FirstName from STUDENT where FirstName like '____' or FirstName like '_____';
