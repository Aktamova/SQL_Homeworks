/* homework 
	find weekday names using recursive cte

	Col1
	Monday
	Tuesday
	Wednesday
	Thursday
	Friday
	Saturday
	Sunday
*/

;with cte as 
(
select 0 as n, datename(w, 0) as Weekdays
union all
select n+1, datename(w, n+1) from cte where n < 6
)
select * from cte


create function udf_employee_details(@year int, @gender varchar(10))
returns table
as
return(
select [BusinessEntityID]      
      ,[JobTitle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[HireDate]
from [AdventureWorks2022].[HumanResources].[Employee]
where year(HireDate) = @year and Gender = @gender 
)
select * from udf_employee_details(2009, 'M')
go

alter function udf_reverse(@txt varchar(50))
returns varchar(50)
as
begin
return(
	reverse (@txt)
)
end

select dbo.udf_reverse('Umida')
go

create function udf_reverse1(@txt varchar(50))
returns varchar
as
begin
declare @n int = 0
	return substring(@txt, len(@txt) - @n, 1)
	select @n + 1 where @n = len(@txt)
end
select dbo.udf_reverse1('Umida')


declare @reversedName varchar(50) = ''
;with cte as
(
	select 1 as n, left('Abdulla', 1) as L
	union all
	select n + 1, substring('Abdulla', n + 1, 1) from cte where n < len('Abdulla')
)
select @reversedName = @reversedName + L from cte 
order by n desc
select @reversedName

Select left('Umida', 3)







