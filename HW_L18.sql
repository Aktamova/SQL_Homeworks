create proc usp_perfect_number @num int
as
begin
	declare @cnt int = 1;
		create table #numbers (Divisors int)
		while @cnt < @num
			begin
				if @num % @cnt = 0
					begin
						insert into #numbers (Divisors)
						values (@cnt)
					end
					set @cnt = @cnt + 1
			end
		Select case 
					when @num = sum(divisors) then  concat(@num, ' Is perfect number')
					else concat(@num, ' Is not perfect number') end as [output]
		from #numbers
		Drop table #numbers
end

exec usp_perfect_number 28