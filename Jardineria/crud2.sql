--insert
create procedure nombremetodo
 	@nombre_cliente varchar(50) ,
	@nombre_contacto varchar(30) ,
	@apellido_contacto varchar(30) ,
	@telefono varchar(15) ,
	@fax varchar(15) ,
	@linea_direccion1 varchar(50) ,
	@linea_direccion2 varchar(50) ,
	@ciudad varchar(50) ,
	@region varchar(50) ,
	@pais varchar(50) ,
	@codigo_postal varchar(10) ,
    @codigo_empleado_rep_ventas int,
	@limite_credito numeric(15, 2) 
	as 
	begin
	insert into cliente (nombre_cliente ,
	nombre_contacto ,
	apellido_contacto ,
	telefono ,
	fax ,
	linea_direccion1 ,
	linea_direccion2 ,
	ciudad ,
	region ,
	pais ,
	codigo_postal ,
    codigo_empleado_rep_ventas ,
	limite_credito)values
	(@nombre_cliente ,
	@nombre_contacto ,
	@apellido_contacto ,
	@telefono ,
	@fax ,
	@linea_direccion1 ,
	@linea_direccion2 ,
	@ciudad ,
	@region ,
	@pais ,
	@codigo_postal ,
    @codigo_empleado_rep_ventas ,
	@limite_credito)
	 end 
	 go
	
--modificar
create procedure modificar
    @codigo_cliente int ,
 	@nombre_cliente varchar(50) ,
	@nombre_contacto varchar(30) ,
	@apellido_contacto varchar(30) 
	as 
	begin
	update cliente
	set nombre_cliente = @nombre_cliente,
	nombre_contacto = @nombre_contacto,
    apellido_contacto = @apellido_contacto
	where codigo_cliente = @codigo_cliente
	end 
	go

	exec modificar 1,'Lautaro', 'luti', 'Garcia'

--eliminar-- 
alter procedure EliminarClientito(@pais varchar)
as 
begin 
delete from cliente
where pais = @pais
end; 
go

exec EliminarClientito 'Miami'

select * from cliente