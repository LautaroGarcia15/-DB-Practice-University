-- ej 11
select e.nombre, e.apellido1, e.puesto from empleado e
where e.codigo_empleado not in( select codigo_empleado_rep_ventas from cliente)

--ej 12
select c.* from cliente c 
where c.codigo_cliente not in (select codigo_cliente from pago)

--ej13 
select c.* from cliente c 
where c.codigo_cliente in (select codigo_cliente from pago)

--ej 14
select p.nombre from producto p
where p.codigo_producto not in(select codigo_producto from detalle_pedido)

--ej 15
select e.nombre, e.apellido1, e.apellido2, e.puesto, o.telefono from empleado e
left join oficina o on e.codigo_oficina = o.codigo_oficina
where e.codigo_empleado not in (select codigo_empleado_rep_ventas from cliente)

--ej 16
select o.codigo_oficina from oficina o
where o.codigo_oficina not in(select e.codigo_oficina from empleado e
where e.codigo_empleado not in(select c.codigo_empleado_rep_ventas from cliente c
where codigo_cliente not in(select p.codigo_cliente from pago p)))