--1.1.2

--ej 1
select codigo_oficina, ciudad from oficina

--ej 2
select ciudad, telefono from oficina
where pais = 'España'

--ej 3
select nombre, apellido1, apellido2, email from empleado
where codigo_jefe = 7

--ej 4 
select puesto , nombre, apellido1, apellido2, email from empleado
where codigo_jefe is null

--ej 5
select nombre, apellido1, apellido2, puesto from empleado
where puesto != 'Representante Ventas'

--ej 6
select nombre_cliente from cliente
where pais = 'Spain'

-- ej 7
select distinct estado from pedido

--ej 8
select distinct codigo_cliente from pago
where YEAR(fecha_pago) = 2008

select distinct codigo_cliente from pago
where fecha_pago >= '2008-01-01' AND fecha_pago < '2009-01-01';

-- ej 9
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido
where fecha_entrega > fecha_esperada

--ej 12
select * from pedido
where MONTH(fecha_entrega) = 01

--1.1.5
select count(codigo_empleado) as CantidadEmpleados from empleado

-- ej 2
select pais, count (codigo_cliente) as CantidadCliente from cliente
group by pais

--ej 3
select AVG(total) as PagoIntermedio from pago
where YEAR(fecha_pago) = 2009

--ej 4
select estado, count(codigo_pedido) as CantidadDePedidos from pedido
group by estado
order by CantidadDePedidos desc

--ej 5
select max(precio_venta) as MasCaro, min(precio_venta) as MasBarato from producto

--ej 6
select count(*) as CantidadClientesEmpresa from cliente

--ej 7
select count(*) as CantidadEnMadrid from cliente
where ciudad = 'Madrid'

--ej 8
select count(*) as CantidadEnMadrid from cliente
where ciudad like 'M%'

--ej 9
SELECT 
  e.nombre AS nombre_representante,
  COUNT(c.codigo_cliente) AS numero_clientes_atendidos
FROM empleado e
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE e.codigo_empleado IS NOT NULL
GROUP BY e.codigo_empleado, e.nombre

--ej 10
select COUNT(codigo_cliente) as cantidad_clientes from cliente 
where codigo_empleado_rep_ventas is null

--ej 11
SELECT
  c.nombre_cliente,
  c.nombre_contacto,
  c.apellido_contacto,
  MIN(p.fecha_pago) AS primera_fecha_pago,
  MAX(p.fecha_pago) AS ultima_fecha_pago
FROM cliente c
RIGHT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.codigo_cliente, c.nombre_cliente, c.nombre_contacto, c.apellido_contacto;

--ej 12
select codigo_pedido, COUNT(codigo_producto) as CantidadProducto from detalle_pedido
group by codigo_pedido

--ej 13
select codigo_pedido, SUM(cantidad) as CantidadProductos from detalle_pedido
group by codigo_pedido

--ej 14
select top 20 codigo_pedido, codigo_producto ,MAX(cantidad) as MasVendido from detalle_pedido
group by codigo_pedido, codigo_producto
order by codigo_pedido, MasVendido desc

create procedure InsertarCliente
	@nombre varchar(50),
	@telefono int,
	@apellido varchar (50)
as
begin 
	insert into cliente(nombre_cliente, telefono, apellido_contacto)
	values (@nombre, @telefono, @apellido)
end 
go

create procedure ModificarCliente
	@nombre varchar (50),
	@telefono int,
	@apellido varchar (50)
as 
begin
	update cliente
	set nombre_cliente = @nombre
	where codigo_cliente = @telefono


-- ej 15
select SUM(dp.cantidad * p.precio_venta) as BaseImponible, SUM(dp.cantidad * p.precio_venta * 0.21) as Iva,SUM(dp.cantidad * p.precio_venta * 1.21) as Total  
from detalle_pedido dp
join producto p on dp.codigo_producto = p.codigo_producto


--ej 16
select  dp.codigo_producto, SUM(dp.cantidad * p.precio_venta) as BaseImponible, SUM(dp.cantidad * p.precio_venta * 0.21) as Iva,SUM(dp.cantidad * p.precio_venta * 1.21) as Total  
from detalle_pedido dp
join producto p on dp.codigo_producto = p.codigo_producto
group by dp.codigo_producto

--ej 17
select  dp.codigo_producto, SUM(dp.cantidad * p.precio_venta) as BaseImponible, SUM(dp.cantidad * p.precio_venta * 0.21) as Iva,SUM(dp.cantidad * p.precio_venta * 1.21) as Total  
from detalle_pedido dp
join producto p on dp.codigo_producto = p.codigo_producto
where dp.codigo_producto like 'OR%'
group by dp.codigo_producto

--ej 18
select p.nombre, SUM(dp.cantidad) AS unidades_vendidas, SUM(dp.cantidad * p.precio_venta) as SinIVA, SUM(dp.cantidad * p.precio_venta * 1.21) as ConIVA from detalle_pedido dp
join producto p on dp.codigo_producto = p.codigo_producto
group by p.nombre
having SUM(dp.cantidad * p.precio_venta) > 3000

--ej 19
select YEAR(fecha_pago) as Años, SUM(total) as TotalAño from pago
group by YEAR(fecha_pago)

--1.4.8.1
--ej 1
SELECT nombre_cliente
FROM cliente
WHERE limite_credito = (SELECT MAX(limite_credito) FROM cliente);


--ej 3
select p.nombre from producto p
join detalle_pedido dp on p.codigo_producto = dp.codigo_producto
where dp.cantidad = (select max(cantidad) from detalle_pedido)
 
-- ej 4
select distinct c.codigo_cliente from cliente c
left join pago p on c.codigo_cliente = p.codigo_cliente
where c.limite_credito > p.total

--consultas variadas
select c.nombre_cliente, count(p.codigo_pedido) as cantidad_pedidos from cliente c
right join pedido p on c.codigo_cliente = p.codigo_cliente
group by c.nombre_cliente

--ej6 parcial
select year(p.fecha_pedido) as Años,  from pedido p
join detalle_pedido dp on p.codigo_pedido = dp.codigo_pedido
join producto pr on dp.codigo_producto = pr.codigo_producto
group by YEAR (p.fecha_pedido)

select * from detalle_pedido