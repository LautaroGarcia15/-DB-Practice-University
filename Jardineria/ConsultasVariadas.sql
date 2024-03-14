--ej 1--
select c.codigo_cliente, COUNT(p.codigo_pedido) as 'cantidadPedidos' from cliente c
right join pedido p on c.codigo_cliente = p.codigo_cliente
group by c.codigo_cliente

--ej 2--
select c.nombre_cliente, sum (p.total) as 'Total' from cliente c
right join pago p on c.codigo_cliente = p.codigo_cliente
group by c.nombre_cliente

--ej 3--
select distinct c.codigo_cliente ,c.nombre_cliente from cliente c
right join pedido p on c.codigo_cliente = p.codigo_cliente
where year(p.fecha_pedido) = '2008'
order by c.nombre_cliente asc

--ej 4--
select c.nombre_cliente, e.nombre, e.apellido1, o.telefono from cliente c
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join oficina o on e.codigo_oficina = o.codigo_oficina
where c.codigo_cliente not in (select codigo_cliente from pago)

--ej 5--
select c.nombre_cliente, e.nombre, e.apellido1, o.ciudad from cliente c
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join oficina o on e.codigo_oficina = o.codigo_oficina

--ej 6-- 
select e.nombre, e.apellido1, e.apellido2, e.puesto, o.telefono from empleado e
join oficina o on e.codigo_oficina = o.codigo_oficina
where e.codigo_empleado not in (select codigo_empleado_rep_ventas from cliente)

--ej 7--
select distinct o.ciudad, count(e.codigo_empleado) as 'CantidadEmpleados' from oficina o
join empleado e on o.codigo_oficina = e.codigo_oficina
group by o.ciudad


