create view primera as 
select codigo_cliente, codigo_empleado_rep_ventas from cliente
where codigo_cliente = codigo_empleado_rep_ventas

select * from primera

drop view primera