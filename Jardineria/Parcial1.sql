
create table Sucursal(
ID_sucursal int identity,
Descripcion varchar (50) NOT NULL,
Direccion varchar (50) NOT NULL,
primary key (ID_sucursal)
);

create table Gama_Sucu(
ID int identity,
ID_sucursal int,
gama varchar (50) NOT NULL,
primary key (ID),
foreign key (ID_sucursal) references Sucursal (ID_sucursal),
foreign key (gama) references gama_producto (gama)
);

create table Forma_Pago(
ID int identity,
nombre varchar (50) NOT NULL,
imgen image,
primary key (ID)
);

insert into Forma_Pago (nombre) values ('Cheque');
insert into Forma_Pago (nombre) values ('PayPal');
insert into Forma_Pago (nombre) values ('Transferencia');

select * from Forma_Pago

alter table pago
add Forma_Pago_ID int;

alter table pago
add foreign key (Forma_Pago_ID) references Forma_Pago(ID);

update pago
set  Forma_Pago_ID = 1
where Forma_Pago = 'Cheque'
update pago
set  Forma_Pago_ID = 2
where Forma_Pago = 'PayPal'
update pago
set  Forma_Pago_ID = 3
where Forma_Pago = 'Transferencia'

alter table pago
drop column forma_pago;

create procedure Insertar_Sucursal
	 @Descripcion varchar(50),
	 @Direccion varchar (50)
as 
begin
	insert into Sucursal (Descripcion, Direccion)
	values (@Descripcion, @Direccion)
end
go

exec Insertar_Sucursal 'Virtual','www.Jardineria.com.ar'
exec Insertar_Sucursal 'Presencial','Av. Libertador 2515'

select * from Sucursal

create procedure ModificarFormaPago
	@forma_pago_ID int,
	@nombre varchar (50)
as
begin
update Forma_Pago
set nombre = @nombre
where ID = @forma_pago_ID;
end 
go

exec ModificarFormaPago 2, 'Mercado pago'


--ej 5
select  c.* from cliente c
left join pedido p on c.codigo_cliente = p.codigo_cliente
order by c.apellido_contacto, c.nombre_contacto, c. nombre_cliente asc

--ej 6


--ej 7
create view VistaClienteAño as
select c.*, p.* from cliente c
join pedido p on c.codigo_cliente = p.codigo_cliente
where year(p.fecha_pedido) = '2007'

--


select * from pago

