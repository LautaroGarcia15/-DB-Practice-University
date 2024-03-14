--ej 1--
select c.nombre_cliente, e.nombre, e.apellido1 from cliente c, empleado e

--ej 2--
select c.nombre_cliente, e.nombre from cliente c
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
where c.codigo_cliente in(select distinct codigo_cliente from pago)

--ej 3--
select c.nombre_cliente, e.nombre from cliente c
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
where c.codigo_cliente not in(select distinct codigo_cliente from pago)

--ej 4--
select c.nombre_cliente, e.nombre, o.ciudad from cliente c
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join oficina o on e.codigo_oficina = o.codigo_oficina
where c.codigo_cliente in (select distinct codigo_cliente from pago)

--ej 5--
select c.nombre_cliente, e.nombre, o.ciudad from cliente c
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join oficina o on e.codigo_oficina = o.codigo_oficina
where c.codigo_cliente not in (select distinct codigo_cliente from pago)

--ej 6--
select distinct o.linea_direccion1, o.linea_direccion2 from oficina o
join empleado e on o.codigo_oficina = e.codigo_oficina
join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
where c.ciudad = 'Fuenlabrada'

--ej 7--
select c.nombre_cliente, e.nombre, o.ciudad from cliente c
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join oficina o on e.codigo_oficina = o.codigo_oficina

--ej 8--
select e.nombre 'empleado', a.nombre 'jefe' from empleado e
join empleado a on e.codigo_jefe = a.codigo_empleado

--ej 9--
select e.nombre 'empleado', a.nombre'jefe', b.nombre'jefe de jefe' from empleado e
join empleado a on e.codigo_jefe = a.codigo_empleado
join empleado b on a.codigo_jefe = b.codigo_empleado

--ej 10--
select distinct c.nombre_cliente from cliente c
join pedido p on c.codigo_cliente = p.codigo_cliente
where fecha_entrega > fecha_esperada

--ej 11--
select distinct p.gama from producto p
join detalle_pedido d on p.codigo_producto = d.codigo_producto