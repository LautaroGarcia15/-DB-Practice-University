--ej1--
select codigo_oficina, ciudad from oficina

--ej 2--
select ciudad, telefono from oficina
where pais = 'España'

--ej 3--
select nombre, apellido1, apellido1, email from empleado
where codigo_jefe = '7'

--ej 4--
select puesto, nombre, apellido1, apellido2 from empleado
where puesto = 'Director General'

--ej 5--
select nombre, apellido1, apellido2, puesto from empleado
where puesto != 'Representante Ventas'

--ej 6--
select nombre_cliente from cliente
where pais = 'Spain'

--ej 7--
select distinct estado from pedido

--ej 8--
select distinct codigo_cliente from pago 
where YEAR(fecha_pago) = 2008 

--ej 9--
select distinct codigo_pedido, codigo_cliente, fecha_entrega, fecha_esperada from pedido
where fecha_entrega >= fecha_esperada

--ej 10--
select codigo_pedido, codigo_cliente, fecha_entrega, fecha_esperada from pedido
where DATEDIFF(day, fecha_entrega, fecha_esperada) >= -2

select codigo_pedido, codigo_cliente, fecha_entrega, fecha_esperada from pedido
where fecha_entrega <= dateadd(day, 2, fecha_esperada)

--ej 11--
select * from pedido
where estado = 'Rechazado' and YEAR(fecha_esperada) = 2009

--ej 12--
select * from pedido
where estado = 'Entregado' and MONTH(fecha_entrega) = 01 

--ej 13--
SELECT * FROM pago
WHERE YEAR(fecha_pago) = 2008 AND forma_pago = 'PayPal'
ORDER BY total desc

--ej 14--
select distinct forma_pago from pago

--ej 15--
select * from producto
where gama = 'Ornamentales' and cantidad_en_stock > 100
order by precio_venta desc

--ej 16--
select * from cliente
where ciudad = 'Madrid' and (codigo_empleado_rep_ventas = '11' or codigo_empleado_rep_ventas = '30')