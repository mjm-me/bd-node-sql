CREATE VIEW ventas AS 
select 
	CONCAT_WS(' ', FirstName, LastName) as Nombre, 
    o.orderID,
    od.ProductID,
    p.ProductName,
    p.Unit,
    od.Quantity,
    p.Price,
    format(od.Quantity * p.Price, 0) as total
from employees e 
JOIN orders o
USING (EmployeeID)
join orderdetails od
on o.OrderID = od.OrderID
join products p
on od.ProductID = p.ProductID
order by e.LastName;

select Nombre, format(sum(total),0) Total from ventas group by(Nombre) order by sum(total);
select round(sum(total),2) from ventas group by Nombre;
-- set @list = (select round(sum(total),2) from ventas group by Nombre);
-- select avg(@list);
select round(avg(t)) as Total from (select round(sum(total),2) as t from ventas group by Nombre) as n;

select Nombre, format(sum(total),0) Total from ventas group by(Nombre) having sum(total) >
(select round(avg(t)) as Total from (select round(sum(total),2) as t from ventas group by Nombre) as n)
order by sum(total);


set @avg = (select round(avg(t)) as Total from (select round(sum(total),2) as t from ventas group by Nombre) as n);
select Nombre, format(sum(total),0) Total from ventas group by(Nombre) having sum(total) > @avg
order by sum(total);