create database HOLI;
USE HOLI;
Drop DataBase DB_API_DATOS
GO
Create DataBase DB_API_DATOS;
GO
USE DB_API_DATOS;
GO
Create Table Usuario (
	ID_Usuario varchar (15) primary key,
	Nombres varchar (80),
	Telefono varchar (60),
	Correo varchar (40),
	Ciudad varchar (60),
	FechaIngreso Datetime default getdate()
);
GO
Insert Into Usuario (ID_Usuario,Nombres,Telefono,Correo,Ciudad) Values ('1','Moises pineda ','3232434412','mois@gmail.com','Armenia');
Insert Into Usuario (ID_Usuario,Nombres,Telefono,Correo,Ciudad) Values ('2','Ethiem alex','3112324415','eth@gmail.com','Armenia');
Insert Into Usuario (ID_Usuario,Nombres,Telefono,Correo,Ciudad) Values ('3','Gian carlos ','348586994','gian@gmail.com','Armenia');
Insert Into Usuario (ID_Usuario,Nombres,Telefono,Correo,Ciudad) Values ('4','Daniel  gomes ','3736485094','dani@gmail.com','Armenia');
Insert Into Usuario (ID_Usuario,Nombres,Telefono,Correo,Ciudad) Values ('5','brayan stiven medina','3184852213','bry@gmail.com','Armenia');

GO
Create procedure usp_registrar (
	@ID_Usuario varchar (15),
	@Nombres varchar (80),
	@Telefono varchar (60),
	@Correo varchar (40),
	@Ciudad  varchar (60)
)
as
begin
Insert Into Usuario (ID_Usuario,Nombres,Telefono,Correo,Ciudad)
Values
(
	@ID_Usuario,
	@Nombres,
	@Telefono, 
	@Correo, 
	@Ciudad  
)
end
GO
Create procedure usp_Actualizar (
	@ID_Usuario varchar (15),
	@Nombres varchar (80),
	@Telefono varchar (60),
	@Correo varchar (40),
	@Ciudad  varchar (60)
)
as
begin
update Usuario set
	Nombres = @Nombres,
	Telefono = @Telefono, 
	Correo = @Correo, 
	Ciudad = @Ciudad
where ID_Usuario = @ID_Usuario

end

GO
create procedure USP_Elminar (
	@ID_usuario varchar (15)
)
as
begin
delete from Usuario where ID_Usuario=@ID_usuario;
end
GO

create procedure USP_seleccionar(
	@ID_usuario varchar (15)
)
as
begin 
	select * from Usuario where ID_Usuario=@ID_usuario;
end
GO

create procedure USP_listar 
as
begin 
	select * from Usuario;
end
GO