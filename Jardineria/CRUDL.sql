create procedure insertarCliente
	@codigo_cliente int ,
	@nombre_cliente varchar(50) ,
	@nombre_contacto varchar(30) ,
	@apellido_contacto varchar(30),
	@telefono varchar(15) ,
	@fax varchar(15) ,
	@linea_direccion1 varchar(50),
	@linea_direccion2 varchar(50),
	@ciudad varchar(50) ,
	@region varchar(50) ,
	@pais varchar(50) ,
	@codigo_postal varchar(10) ,
	@codigo_empleado_rep_ventas int ,
	@limite_credito numeric(15, 2)
	as
	begin
	insert into cliente values (@codigo_cliente ,
	@nombre_cliente, 
	@nombre_contacto ,
	@apellido_contacto ,
	@telefono ,
	@fax,
	@linea_direccion1 ,
	@linea_direccion2 ,
	@ciudad,
	@region ,
	@pais ,
	@codigo_postal ,
	@codigo_empleado_rep_ventas ,
	@limite_credito)
	end 
	go

	exec insertarCliente 101,'Mati', 'Lautaro', 'Romero', '123456789', '5431650', 'usasrsadf', 'asdfads', 'marin', 'new zeland', 'nene', '2345', '17' , '12'

	select * from cliente


create procedure eleiminarCliente 
	@codigo_cliente int
	as
	begin 
	delete from cliente
	where codigo_cliente =  @codigo_cliente;
	end;
	go
	
	exec eleiminarCliente 101

create procedure modificarCliente 
    @codigo_cliente int ,
	@nombre_cliente varchar(50) ,
	@apellido_contacto varchar(30)
	as 
	begin
	update cliente 
	set nombre_cliente = @nombre_cliente,
	    apellido_contacto = @apellido_contacto
	where codigo_cliente = @codigo_cliente;
	end 
	go
	exec modificarCliente 100,'Enzo','Romero'