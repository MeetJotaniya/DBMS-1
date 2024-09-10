--LAB 12

--PART-A: 
--1. Find all persons with their department name & code.
SELECT PERSON.PERSONNAME,DEPT.DEPARTMENTNAME,DEPT.DEPARTMENTCODE
FROM PERSON INNER JOIN DEPT
ON PERSON.DEPARTMENTID = DEPT.DEPARTMENTID

--2. Find the person's name whose department is in C-Block.
SELECT PERSON.PERSONNAME,DEPT.DEPARTMENTNAME,DEPT.DEPARTMENTCODE
FROM PERSON INNER JOIN DEPT
ON PERSON.DEPARTMENTID = DEPT.DEPARTMENTID
WHERE DEPT.LOCATION = 'C-BLOCK'


--3. Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT PERSON.PERSONNAME,DEPT.DEPARTMENTNAME,DEPT.DEPARTMENTCODE
FROM PERSON INNER JOIN DEPT
ON PERSON.DEPARTMENTID = DEPT.DEPARTMENTID
WHERE PERSON.CITY = 'JAMNAGAR'


--4. Retrieve person name, salary & department name who does not belong to Rajkot city.
SELECT PERSON.PERSONNAME,DEPT.DEPARTMENTNAME,DEPT.DEPARTMENTCODE
FROM PERSON INNER JOIN DEPT
ON PERSON.DEPARTMENTID = DEPT.DEPARTMENTID
WHERE NOT PERSON.CITY = 'RAJKOT'



--5. Retrieve person�s name of the person who joined the Civil department after 1-Aug-2001.
SELECT PERSON.PERSONNAME,DEPT.DEPARTMENTNAME,DEPT.DEPARTMENTCODE
FROM PERSON INNER JOIN DEPT
ON PERSON.DEPARTMENTID = DEPT.DEPARTMENTID
WHERE DEPT.DEPARTMENTNAME = 'CIVIL' AND PERSON.JOININGDATE > '2001-08-01'


--6. Find details of all persons who belong to the computer department.
SELECT PERSON.PERSONNAME,DEPT.DEPARTMENTNAME,DEPT.DEPARTMENTCODE
FROM PERSON INNER JOIN DEPT
ON PERSON.DEPARTMENTID = DEPT.DEPARTMENTID
WHERE DEPT.DEPARTMENTNAME = 'COMPUTER'


--7. Display all the person's name with the department whose joining date difference with the current date
--is more than 365 days.
SELECT PERSON.PERSONNAME,DEPT.DEPARTMENTNAME,DEPT.DEPARTMENTCODE
FROM PERSON INNER JOIN DEPT
ON PERSON.DEPARTMENTID = DEPT.DEPARTMENTID
WHERE GETDATE() - PERSON.JOININGDATE >365


--8. Find department wise person counts.
SELECT COUNT(PERSON.PERSONNAME),DEPT.DEPARTMENTNAME
FROM PERSON INNER JOIN DEPT
ON PERSON.DEPARTMENTID = DEPT.DEPARTMENTID
GROUP BY DEPT.DEPARTMENTNAME


--9. Give department wise maximum & minimum salary with department name.
SELECT DEPT.DEPARTMENTNAME,MAX(PERSON.SALARY),MIN(PERSON.SALARY)
FROM PERSON INNER JOIN DEPT
ON PERSON.DEPARTMENTID = DEPT.DEPARTMENTID
GROUP BY DEPT.DEPARTMENTNAME


--10. Find city wise total, average, maximum and minimum salary.
--11. Find the average salary of a person who belongs to Ahmedabad city.
--12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In
--single column)