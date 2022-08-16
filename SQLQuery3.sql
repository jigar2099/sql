Create table EmployeeDemographics
(EmployeeID int, FirstName varchar(50),LastName varchar(50),Age int, Gender varchar(50))

create table EmployeeSalary
(
EmployeeID int,
JobTitle varchar(50),
Salary int)

Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')


Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

/*
Select statement
*,Top,Distinct, COunt, As, Max, Min, Avg
*/
-- SELECT TOP 5 *
-- SELECT FirstName,LastName

SELECT DISTINCT(Gender)
FROM EmployeeDemographics

SELECT DISTINCT(EmployeeID)
FROM EmployeeDemographics

SELECT COUNT(LastName) AS LastNameCount
FROM EmployeeDemographics

SELECT MAX(Salary)
FROM EmployeeSalary

SELECT AVG(Salary)
FROM EmployeeSalary

SELECT MIN(Salary)
FROM EmployeeSalary

SELECT *
FROM SQLTutorial..EmployeeSalary


/*
WHERE statement
=,<>,<,>,AND,OR,LIKE,NULL,NOT NULL, IN
*/

SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim'

SELECT *
FROM EmployeeDemographics
WHERE AGE<=32 OR Gender='Male'

SELECT *
FROM EmployeeDemographics
WHERE AGE<=32 AND Gender='Male'

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%o%'

SELECT * 
FROM EmployeeDemographics
WHERE FirstName is NOT NULL

SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim','Michael')


/*
Group By and Order By statements
*/

SELECT *
FROM EmployeeDemographics

SELECT Gender, Age, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender, Age


SELECT Gender, Age, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age>31
GROUP BY Gender, Age
ORDER BY CountGender

SELECT Gender, Age, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age>31
GROUP BY Gender, Age
ORDER BY Gender DESC

SELECT *
FROM EmployeeDemographics
ORDER BY Age,Gender DESC

SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC,Gender DESC

SELECT *
FROM EmployeeDemographics
ORDER BY 4 DESC,5 DESC



/*
Inner Joins, Full/Left/Right/Outer Joins
*/

SELECT *
FROM SQLTutorial..EmployeeDemographics

SELECT *
FROM SQLTutorial..EmployeeSalary

SELECT *
FROM SQLTutorial..EmployeeDemographics
Inner Join SQLTutorial..EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM SQLTutorial..EmployeeDemographics
Full Outer Join SQLTutorial..EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM SQLTutorial..EmployeeDemographics
Left Outer Join SQLTutorial..EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM SQLTutorial..EmployeeDemographics
Right Outer Join SQLTutorial..EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Insert into EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

SELECT *
FROM SQLTutorial..EmployeeDemographics
Full Outer Join SQLTutorial..WareHouseEmployeeDemographics
	ON EmployeeDemographics.EmployeeID = 
	WareHouseEmployeeDemographics.EmployeeID

/*
Topic: Union, Union All
*/

SELECT *
FROM SQLTutorial..EmployeeDemographics
UNION
SELECT *
FROM SQLTutorial..WareHouseEmployeeDemographics

SELECT *
FROM SQLTutorial..EmployeeDemographics
UNION ALL
SELECT *
FROM SQLTutorial..WareHouseEmployeeDemographics
ORDER BY EmployeeID

SELECT EmployeeID, FirstName, Age
FROM SQLTutorial..EmployeeDemographics
UNION 
SELECT EmployeeID, JobTitle, Salary
FROM SQLTutorial..EmployeeSalary
ORDER BY EmployeeID



/*
Topic: Case Statement
*/

SELECT FirstName, LastName, Age,
CASE
	WHEN Age=30 THEN 'Thirty'
	WHEN Age>30 THEN 'Old'
	ELSE 'Young'
END
FROM SQLTutorial..EmployeeDemographics
WHERE AGE is NOT NULL
ORDER BY Age

SELECT FirstName, LastName, JobTitle, Salary,
CASE 
	WHEN JobTitle='Salesman' THEN Salary+(Salary*0.10)
	WHEN JobTitle='Accountant' THEN Salary+(Salary*0.05)
	WHEN JobTitle = 'HE' THEN Salary+(Salary*0.0001)
	ELSE Salary+(Salary*0.03)
END AS SalaryAfterRaise
FROM SQLTutorial..EmployeeDemographics
JOIN SQLTutorial..EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


/*
Topic : Having Clause
*/

SELECT JobTitle, COUNT(JobTitle)
FROM SQLTutorial..EmployeeDemographics
JOIN SQLTutorial..EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle)>1

SELECT JobTitle, AVG(Salary)
FROM SQLTutorial..EmployeeDemographics
JOIN SQLTutorial..EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary)>44000
ORDER BY AVG(Salary)



/*
Topics : Updating/Deleting Data
*/

SELECT *
FROM SQLTutorial..EmployeeDemographics
UPDATE SQLTutorial..EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly' AND LastName = 'Flax'

SELECT *
FROM SQLTutorial..EmployeeDemographics
UPDATE SQLTutorial..EmployeeDemographics
SET Age = 31, Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax'

DELETE FROM SQLTutorial..EmployeeDemographics
WHERE EmployeeID = 1005



/*
Topic : Aliasing
*/

SELECT FirstName + ' ' + LastName As FullName
FROM SQLTutorial..EmployeeDemographics

SELECT Avg(Age) AS AvgAge
FROM SQLTutorial..EmployeeDemographics

SELECT Demo.EmployeeID
FROM SQLTutorial..EmployeeDemographics as Demo
JOIN SQLTutorial..EmployeeSalary AS Sal
ON Demo.EmployeeID = Sal.EmployeeID


/*
Topic : Partition By
*/
SELECT FirstName, LastName, Gender, Salary, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM SQLTutorial..EmployeeDemographics dem
JOIN SQLTutorial..EmployeeSalary Sal
	ON dem.EmployeeID = Sal.EmployeeID
GROUP BY FirstName, LastName, Gender, Salary

























































