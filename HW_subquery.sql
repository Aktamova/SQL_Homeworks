use W3Resource

-- task 1
select * from Inventory.Orders
where salesman_id = 
(select salesman_id from inventory.Salesman where name = 'PAul adam')


-- task 2
select * from Inventory.Orders
where salesman_id = 
(select salesman_id from Inventory.Salesman where city = 'London')


-- task 3
select ord_no,purch_amt,ord_date,customer_id,salesman_id from Inventory.Orders
where salesman_id = (select salesman_id from Inventory.Orders where customer_id = 3007)


-- task 4
select * from Inventory.Orders
where purch_amt > (select avg(purch_amt) from Inventory.Orders
where ord_date = '2012-10-10')


-- task 5
select * from Inventory.Orders
where salesman_id = (select salesman_id from Inventory.Salesman
where city = 'New York')


--task 6
select commission from Inventory.Salesman
where salesman_id in (select salesman_id from Inventory.Customer
where city = 'Paris')


-- task 7
select * from Inventory.Customer
where customer_id = (select salesman_id - 2001 from inventory.salesman
where name = 'Mc Lyon' )


-- task 8
select grade, count(*) from Inventory.Customer
group by grade
having grade > (select avg(grade) from Inventory.Customer
where city = 'New York')


-- task 9
select ord_no,purch_amt, ord_date, salesman_id from Inventory.Orders
where salesman_id = (select salesman_id from Inventory.Salesman
where commission = (select max(commission) from Inventory.Salesman))


-- task 10
select o.*, c.city from Inventory.Orders as o
join Inventory.Customer as c on o.customer_id = c.customer_id
where ord_date = '2012-08-17'

-- task 11
select salesman_id, name from inventory.Salesman as s 
where 1 < 
    (select COUNT(*) from Inventory.Customer where salesman_id = s.salesman_id);


