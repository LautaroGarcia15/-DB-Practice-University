--ej 1--
select nombre_cliente from cliente
where limite_credito = (select max(limite_credito) from cliente)

--ej 2--
select codigo_producto from producto
where precio_venta = (select max(precio_venta) from producto)

--ej 3--
select p.nombre from producto p
join detalle_pedido d on p.codigo_producto = d.codigo_producto
where cantidad = (select max(cantidad) from detalle_pedido)

--ej 4--
select c.nombre_cliente from cliente c
left join pago p on c.codigo_cliente = p.codigo_cliente
 where (limite_credito > total)

--ej 5--
select p.* from producto p
where p.cantidad_en_stock = (select max(cantidad_en_stock) from producto)

--ej 6--
select p.* from producto p
where p.cantidad_en_stock = (select min(cantidad_en_stock) from producto)

--ej 7--
select j.nombre, j.apellido1, j.apellido2, j.email from empleado e
join empleado j on e.codigo_empleado = j.codigo_jefe
where e.nombre = 'Alberto' and e.apellido1 = 'Soria'
