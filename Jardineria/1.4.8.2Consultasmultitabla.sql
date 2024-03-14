--ej 8
select nombre_cliente from cliente
where limite_credito >= all (select limite_credito from cliente)

--ej 9
select nombre from producto
where precio_venta >= all (select precio_venta from producto)

--ej 10
select nombre from producto
where cantidad_en_stock <= all (select cantidad_en_stock from producto)
