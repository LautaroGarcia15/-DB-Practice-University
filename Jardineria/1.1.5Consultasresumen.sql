--ej 1--
select COUNT(codigo_empleado) from empleado

--ej2--
select pais, count(codigo_cliente)'cantidad_clientes' from cliente
group by pais
order by cantidad_clientes desc

--ej 3--
select avg(total)'Pago_medio' from pago
where year(fecha_pago) = 2009

--ej 4--
select estado, count(codigo_pedido) from pedido
group by estado

--ej 5--
select max(precio_venta)'MAX', min(precio_venta)'MIN' from producto

--ej 6--
select  count(codigo_cliente)'can_clientes' from cliente

--ej 7--
select count(codigo_cliente) 'Cant_cliente' from cliente
where ciudad = 'Madrid'

--ej 8--
select count(codigo_cliente), ciudad from cliente
where ciudad like 'M%'
group by ciudad

--ej 9--
select c.codigo_empleado_rep_ventas, count(cl.codigo_cliente) 'cantidad_de_cliente' from cliente c 
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join cliente cl on e.codigo_empleado = cl.codigo_empleado_rep_ventas
group by c.codigo_empleado_rep_ventas

--ej 10--
select count(codigo_cliente) from cliente
where codigo_empleado_rep_ventas is null

--ej 11--
select c.nombre_cliente, c.apellido_contacto, min(p.fecha_pago) as 'PrimerPago', max(p.fecha_pago) as 'UlitimoPago' from cliente c
join pago p on c.codigo_cliente = p.codigo_cliente
group by c.nombre_cliente, c.apellido_contacto

--ej 12--
select count( distinct d.codigo_producto) as 'CantidaddeProductos' from detalle_pedido d 
group by d.codigo_pedido

--ej 13--
select sum(d.cantidad) as 'CantidadTotal' from detalle_pedido d
group by codigo_pedido

--ej 14--
select top 20 d.codigo_producto, sum(d.cantidad) as 'sumaPedido'from detalle_pedido d
group by d.codigo_producto
order by sumaPedido desc

