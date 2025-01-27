use Lessons

create function udf_reverseName (@input varchar(50))
returns varchar(50)
as
begin
	declare @reverseString varchar(50) =''
	declare @length int = len(@input)
	declare @index int = @length
	while @index > 0
		begin
			set @reverseString = @reverseString + SUBSTRING(@input, @index, 1)
			set @index = @index - 1
		end
		Return @reverseString
end

Select dbo.udf_reverseName ('Umida') as name