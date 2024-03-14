--ej 1--
select c.* from cliente c 
left join pago p on p.codigo_cliente = c. codigo_cliente
where p.codigo_cliente is null

--ej 2--
select c.* from cliente c
left join pedido p on c.codigo_cliente = p.codigo_cliente
where p.codigo_cliente is null

--ej 3--
select c.* from cliente c
left join pedido p on c.codigo_cliente = p.codigo_cliente
left join pago a on a.codigo_cliente = c. codigo_cliente
where p.codigo_cliente is null and a.codigo_cliente is null

--ej 4--
select e.* from empleado e
left join oficina o on e.codigo_oficina = o.codigo_oficina
where o.codigo_oficina is null

--ej 5--
select e.* from empleado e
left join cliente c on c.codigo_empleado_rep_ventas = e.codigo_empleado
where c.codigo_cliente is null 

--ej 6
select e.codigo_empleado, o.* from empleado e
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
left join oficina o on e.codigo_oficina = o.codigo_oficina
where c.codigo_empleado_rep_ventas is null

--ej 7
SELECT e.*, o.*, c.*
FROM empleado e
LEFT JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE o.codigo_oficina IS NULL and c.codigo_empleado_rep_ventas IS NULL;

--ej 8
select p.codigo_producto from producto p
left join detalle_pedido dp on p.codigo_producto = dp.codigo_producto
where dp.codigo_producto is null

--ej 9
select p.nombre, gm.descripcion_texto, gm.imagen  from producto p
left join detalle_pedido dp on p.codigo_producto = dp.codigo_producto
left join gama_producto gm on p.gama = gm.gama
where dp.codigo_producto is null

--ej 10--
select distinct o.* from oficina o
left join empleado e on o.codigo_oficina = e.codigo_oficina
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
left join pedido p on c.codigo_cliente = p.codigo_cliente
left join detalle_pedido d on p.codigo_pedido = d.codigo_pedido
left join producto p2 on d.codigo_producto = p2.codigo_producto
where p2.gama = 'Frutal'


--ej 11
select distinct c.codigo_cliente from cliente c
left join pedido p on c.codigo_cliente = p.codigo_cliente
left join pago pa on c.codigo_cliente = pa.codigo_cliente
where pa.codigo_cliente is null and p.codigo_cliente is not null

--ej 12
select e.codigo_empleado, e.codigo_jefe from empleado e
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
where c.codigo_empleado_rep_ventas is null

SELECT e.*, jefe.nombre AS nombre_jefe
FROM empleado e
LEFT JOIN empleado jefe ON e.codigo_jefe = jefe.codigo_empleado
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE c.codigo_empleado_rep_ventas IS NULL;
