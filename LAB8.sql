--LAB 8 

CREATE TABLE SALES_DATA(

		Region VARCHAR(25),
		Product VARCHAR(25),
		Sales_Amount INT,
		Year VARCHAR(25),
);

INSERT INTO SALES_DATA VALUES('North America', 'Watch', 1500, '2023');
INSERT INTO SALES_DATA VALUES('Europe', 'Mobile', 1200, '2023');
INSERT INTO SALES_DATA VALUES('Asia', 'Watch', 1800, '2023');
INSERT INTO SALES_DATA VALUES('North America', 'TV', 900, '2024');
INSERT INTO SALES_DATA VALUES('Europe', 'Watch', 2000, '2024');
INSERT INTO SALES_DATA VALUES('Asia', 'Mobile', 1000, '2024');
INSERT INTO SALES_DATA VALUES('North America', 'Mobile', 1600, '2023');
INSERT INTO SALES_DATA VALUES('Europe', 'TV', 1500, '2023');
INSERT INTO SALES_DATA VALUES('Asia', 'tv', 1100, '2024');
INSERT INTO SALES_DATA VALUES('North America', 'Watch', 1700, '2024');

Select * FROM SALES_DATA;

--Part – A:
--1. Display Total Sales Amount by Region.
SELECT SUM(SALES_AMOUNT) AS TOTAl_SALES
FROM SALES_DATA
GROUP BY Region;

--2. Display Average Sales Amount by Product
SELECT AVG(SALES_AMOUNT) AS AVG_SALES
FROM SALES_DATA
GROUP BY Product;

--3. Display Maximum Sales Amount by Year
SELECT MAX(SALES_AMOUNT) AS MAX_SALES
FROM SALES_DATA
GROUP BY Year;

--4. Display Minimum Sales Amount by Region and Year
SELECT MIN(SALES_AMOUNT) AS MIN_SALES
FROM SALES_DATA
GROUP BY Region,Year;

--5. Count of Products Sold by Region
SELECT COUNT(Product) AS COUNT_PRODUCT
FROM SALES_DATA
GROUP BY Region;

--6. Display Sales Amount by Year and Product
SELECT Sum(Sales_Amount) as toatl,Product,Year
FROM SALES_DATA
GROUP BY Year,Product;

--7. Display Regions with Total Sales Greater Than 5000
SELECT Region,SUM(SALES_AMOUNT) AS Total_SALES
FROM SALES_DATA
GROUP BY Region
Having SUM(Sales_Amount)>5000;

--8. Display Products with Average Sales Less Than 10000
SELECT Product,avg(SALES_AMOUNT) AS AVG_SALES
FROM SALES_DATA
GROUP BY Product
Having SUM(Sales_Amount)<10000;

--9. Display Years with Maximum Sales Exceeding 500
SELECT Year,MAX(SALES_AMOUNT) AS MAX_SALES
FROM SALES_DATA
GROUP BY Year
Having MAX(Sales_Amount)>500;

--10. Display Regions with at Least 3 Distinct Products Sold.
SELECT Region,count(DISTINCT Product) AS Distinct_Products
FROM SALES_DATA
GROUP BY Region
Having count(DISTINCT Product)>2;

--11. Display Years with Minimum Sales Less Than 1000
SELECT Year,Min(SALES_AMOUNT) AS Min_SALES
FROM SALES_DATA
GROUP BY Year
Having Min(Sales_Amount)<1000;

--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount
SELECT Region,sum(SALES_AMOUNT) AS Total_SALES
FROM SALES_DATA
Where year = 2023
GROUP BY Region
ORDER by Sum(sales_amount);

--Part – B:
--1. Display Count of Orders by Year and Region, Sorted by Year and Region
SELECT Year,Region,Count(Product) AS Total_orders
FROM SALES_DATA
GROUP BY Region,Year
ORDER by Year,Region;

--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region
SELECT Region,max(SALES_AMOUNT) AS max_SALES
FROM SALES_DATA
GROUP BY Region
Having Max(sales_amount) > 1000
ORDER by Region;


--3. Display Years with Total Sales Amount Less Than 1000, Sorted by Year Descending
SELECT Year,sum(SALES_AMOUNT) AS Total_SALES
FROM SALES_DATA
GROUP BY Year
Having sum(sales_amount)<1000
ORDER by Year DESC;


--4. Display Top 3 Regions by Total Sales Amount in Year 2024
SELECT TOP 3 Region, SUM(SALES_AMOUNT)
FROM SALES_DATA
WHERE YEAR = 2024
GROUP BY Region

--Part – C:
--1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name
SELECT Product,AVG(SALES_AMOUNT) AS AVg_SALES
FROM SALES_DATA
GROUP BY Product
Having AVG(SALES_AMOUNT) Between 1000 and 2000
ORDER by Product;

--2. Display Years with More Than 5 Orders from Each Region
SELECT Count(Product),Region,Year
FROM SALES_DATA
GROUP BY Region,Year
Having Count(Product)>5


--3. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending.
SELECT Region,AVG(SALES_AMOUNT) AS AVg_SALES
FROM SALES_DATA
where year = 2023
GROUP BY Region
Having AVG(SALES_AMOUNT) > 1500
ORDER by AVG(Sales_Amount)DESC;


--4. Find out region wise duplicate product.
SELECT Region,count(Product) AS Products
FROM SALES_DATA
GROUP BY Region
Having count(Product)>1;


--5. Find out region wise highest sales amount.
SELECT Region,max(Sales_Amount) AS Highest
FROM SALES_DATA
GROUP BY Region;
