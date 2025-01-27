
declare @age date = '2002-03-03'


-- Lesson 3
/* homework: give exact time of my life (how many years I lived, months, days) */

--declare @birth date = '2003-03-26'
--select DATEDIFF(DAY, @birth, GETDATE()) as [Days],
--		DATEDIFF (MONTH, @birth, GETDATE()) as Months, 
--		DATEDIFF(year, @birth, GETDATE()) as Years

declare @birth date = '2003-03-26'
select 
	DATEDIFF(year, @birth, GETDATE()) as Years

	with cte as
(
	select ascii('A') as n
	union all 
	select n + 1 from cte where n < ascii('Z')
)
select char(n) from cte 







--Lesson 2
-- Homeworks
	--1) Capitalize first letters 

	Create table Employees
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10),
    Salary int,
    DepartmentId int 
)
Go

Insert into Employees values (1, 'mark', 'Male', 50000, 1)
Insert into Employees values (2, 'mary', 'Female', 60000, 3)
Insert into Employees values (3, 'steve', 'Male', 45000, 2)
Insert into Employees values (4, 'john', 'Male', 56000, 1)
Insert into Employees values (5, 'sara', 'Female', 39000, 2)
Go

select *, concat(upper(substring(name, 1, 1)), lower(substring(name, 2, len(name)))) as Result from Employees

-- 2) Capitalize last letters
select *, lower(substring(name, 1, len(name)-1)) + upper(substring(name, len(name), 1)) as Result from employees

-- 3) Find me longest string

CREATE TABLE StringData1 (
   id INT PRIMARY KEY,
   original_string VARCHAR(100)
);
 
INSERT INTO StringData1 (id, original_string) VALUES
(1, 'apple'),
(2, 'banana'),
(3, 'cherry'),
(4, 'date');

select *  from StringData1
where len(original_string) = (select (max(len(original_string)))from StringData1)


-- 4) Split names to first name and last name 

CREATE TABLE [dbo].[TestMultipleColumns] 
(
    [Id] [int] NULL,
    [Name] [varchar](20) NULL
);
INSERT INTO [TestMultipleColumns] 
VALUES 
(1,    'Pawan,Kumar'), 
(2,    'Sandeep,Goyal'), 
(3,    'Isha,Mattoo'), 
(4,    'Gopal,Ranjan'),
(5,    'Neeraj,Garg'), 
(6,    'Deepak,Sharma'), 
(7,    ' Mayank,Tripathi');


select id, SUBSTRING (name, 1, CHARINDEX(',', name) - 1) as FirstName,
		SUBSTRING(name, CHARINDEX(',', name) + 1, len(name)) as LastName
from TestMultipleColumns

