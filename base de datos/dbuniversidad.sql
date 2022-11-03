create database dbuniversidad;

create table Estudiante(
	Id_Est int identity(10, 1) not null,
	Nom1 nvarchar(50) not null,
	Nom2 nvarchar(50) default ' ',
	Apell1 nvarchar(50) not null,
	Apell2 nvarchar(50) default ' ',
	Direcc nvarchar(50) not null,
	Telef nvarchar(15) not null,
	Email nvarchar(50) not null,
)

create table MATERIA(
	Id_Mat nvarchar(4) not null,
	Nombre nvarchar (50) not null,
	Cred int not null,
	Durac int default '',
	Semes int default ''
)

create table DETALLE_MAT (
	Id_Det int identity(1,1) not null,
	Id_Est int not null,
	Id_Mat nvarchar(4) not null,
	Por70 float not null,
	por30 float not null,
	total float default ' '
)

--ingresamos de la tabla estudiantes
INSERT INTO Estudiante (NOM1, NOM2, APELL1, APELL2, DIRECC, TELEF, EMAIL)
VALUES ('ANA', 'LUCIA', 'PEREZ', 'LOPEZ', 'CRA 52', '2-35-48-78', 'ANALUCIA@GMAIL.COM')
INSERT INTO Estudiante (NOM1, NOM2, APELL1, APELL2, DIRECC, TELEF, EMAIL)
VALUES ('LUCIA', 'ANDREA', 'LUJAN', 'MENDIETA', 'CLLE 105', '3-65-89-74', 'LUCIAANDREA@GMAIL.COM')
INSERT INTO Estudiante (NOM1, NOM2, APELL1, APELL2, DIRECC, TELEF, EMAIL)
VALUES ('PEDRO', '', 'LOPERA', '', 'CRA 92B', '2-65-69-87', 'PEDRO@GMAIL.COM')
INSERT INTO Estudiante (NOM1, NOM2, APELL1, APELL2, DIRECC, TELEF, EMAIL)
VALUES ('JORGE', 'ELIECER', 'DE OCCA', 'GARDEAZABAL', 'TRANSV. 32', '2-45-87-12', 'JORGEELIECER@GMAIL.COM')
INSERT INTO Estudiante (NOM1, NOM2, APELL1, APELL2, DIRECC, TELEF, EMAIL)
VALUES ('JOSE', 'ANIVAL', 'LOPEZ', '', 'CIRC. 40', '4-71-43-85', 'JOSEANIVAL@GMAIL.COM')
INSERT INTO Estudiante (NOM1, NOM2, APELL1, APELL2, DIRECC, TELEF, EMAIL)
VALUES ('AIDA', '', 'GOMEZ', 'QUINTANA', 'CRA 48', '4-78-78-12', 'AIDA@GMAIL.COM')
INSERT INTO Estudiante (NOM1, NOM2, APELL1, APELL2, DIRECC, TELEF, EMAIL)
VALUES ('CATALINA', '', 'QUINTANA', 'GUTIERREZ', 'CLLE 50', '2-67-05-05', 'CATALINA@GMAIL.COM')
INSERT INTO Estudiante (NOM1, NOM2, APELL1, APELL2, DIRECC, TELEF, EMAIL)
VALUES ('DIEGO', 'ERNESTO', 'QUIROZ', 'HERNANDEZ', 'CRA 58A', '2-34-57-80', 'DIEGOERNESTO@GMAIL.COM')
INSERT INTO Estudiante (NOM1, NOM2, APELL1, APELL2, DIRECC, TELEF, EMAIL)
VALUES ('EDWIN', '', 'MALDONADO', '', 'TRANSV. 31', '2-54-78-36', 'EDWIN@GMAIL.COM')
INSERT INTO Estudiante (NOM1, NOM2, APELL1, APELL2, DIRECC, TELEF, EMAIL)
VALUES ('NELSON', 'DE JESUS', 'MONTOYA', 'PELAEZ', 'CIRC. 3', '3-56-58-14', 'NELSONDEJESUS@GMAIL.COM')
INSERT INTO Estudiante (NOM1, NOM2, APELL1, APELL2, DIRECC, TELEF, EMAIL)
VALUES ('JAVIER', '', 'BRAND', 'LOPEZ', 'CRA 14', '3-56-78-41', 'JAVIER@GMAIL.COM')
INSERT INTO Estudiante (NOM1, NOM2, APELL1, APELL2, DIRECC, TELEF, EMAIL)
VALUES ('MATILDE', '', 'MONTES', '', 'CLLE 92C', '4-78-96-85', 'MATILDE@GMAIL.COM')

--informacion para la tabla materia
INSERT INTO MATERIA (ID_MAT, NOMBRE, CRED)
VALUES ('P100', 'MATEMATICAS', '4')
INSERT INTO MATERIA (ID_MAT, NOMBRE, CRED)
VALUES ('P101', 'PROGRAMACION 1', '6')
INSERT INTO MATERIA (ID_MAT, NOMBRE, CRED)
VALUES ('S102', 'PROGRAMACION 2', '4')
INSERT INTO MATERIA (ID_MAT, NOMBRE, CRED)
VALUES ('S103', 'BASES DE DATOS', '4')
INSERT INTO MATERIA (ID_MAT, NOMBRE, CRED)
VALUES ('T104', 'PROGRAMACION BASICA', '4')
INSERT INTO MATERIA (ID_MAT, NOMBRE, CRED)
VALUES ('T105', 'LENGUA MATERNA', '4')
INSERT INTO MATERIA (ID_MAT, NOMBRE, CRED)
VALUES ('C106', 'CALCULO I', '4')
INSERT INTO MATERIA (ID_MAT, NOMBRE, CRED)
VALUES ('Q107', 'CALCULO II', '4')
INSERT INTO MATERIA (ID_MAT, NOMBRE, CRED)
VALUES ('C108', 'CONSTRUCCION SOFTWARE', '6')
INSERT INTO MATERIA (ID_MAT, NOMBRE, CRED)
VALUES ('Q109', 'INGENIERIA DE SOFTWARE', '6')
INSERT INTO MATERIA (ID_MAT, NOMBRE, CRED)
VALUES ('Q110', 'TEORIA ADMINISTRATIVA', '2')


INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('10', 'P100', '3.0', '3.0')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('11', 'P101', '2.5', '2.0')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('12', 'S102', '4.0', '5.0')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('13', 'S103', '1.0', '1.0')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('14', 'T104', '5.0', '4.2')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('15', 'T105', '4.7', '5.0')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('16', 'C106', '1.2', '3.4')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('17', 'Q107', '5.0', '1.2')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('18', 'C108', '4.0', '3.2')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('19', 'Q109', '3.4', '2.4')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('20', 'Q110', '1.2', '5.0')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('21', 'Q107', '3.2', '5.0')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('10', 'Q107', '2.4', '4.0')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('11', 'Q109', '5.0', '1.0')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('12', 'P100', '4.0', '3.0')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('13', 'P100', '2.0', '2.5')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('14', 'P101', '2.3', '4.0')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('18', 'S102', '3.5', '1.0')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('19', 'S103', '1.2', '5.0')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('20', 'T104', '1.0', '4.7')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('18', 'T105', '4.0', '1.2')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('19', 'C106', '4.0', '5.0')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('20', 'Q107', '5.0', '4.0')
INSERT INTO DETALLE_MAT (ID_EST, ID_MAT, POR70, POR30)
VALUES ('10', 'P101', '5.0', '4.0')

--procedimientos estudiante

go
create procedure USP_RegistrarEstudiante
	@Nom1 nvarchar(50),
	@Nom2 nvarchar(50),
	@Apell1 nvarchar(50),
	@Apell2 nvarchar(50),
	@Direcc nvarchar(50),
	@Telef nvarchar(15),
	@Email nvarchar(50)
as
	begin transaction TX
	insert into Estudiante (Nom1,Nom2,Apell1,Apell2,Direcc,Telef,Email) values (@Nom1,@Nom2,@Apell1,@Apell2,@Direcc,@Telef,@Email)
	if @@ERROR >0
	begin 
	rollback transaction TX
	select 'Hubo Error' as Respuesta
	end
	else
	begin 
	commit transaction TX
	select 'Resgistro exitoso' as Respuesta
	end
go

go
create procedure USP_ActualizarEstudiante
	@Id_Est int,
	@Nom1 nvarchar(50),
	@Nom2 nvarchar(50),
	@Apell1 nvarchar(50),
	@Apell2 nvarchar(50),
	@Direcc nvarchar(50),
	@Telef nvarchar(15),
	@Email nvarchar(50)
as 
	begin transaction TX
	update Estudiante set Nom1=@Nom1, Nom2=@Nom2, Apell1=@Apell1, Apell2=@Apell2, Direcc=@Direcc, Telef=@Telef, Email=@Email where Id_Est=@Id_Est;
	if @@ERROR >0
	begin 
	rollback transaction TX
	select 'Hubo Error' as Respuesta
	end
	else
	begin 
	commit transaction TX
	select 'Actualizacion exitosa' as Respuesta
	end
go

go
create procedure USP_EliminarEstudiante
	@Id_Est int
as 
	begin transaction TX
	delete from Estudiante where Id_Est=@Id_Est;
	if @@ERROR >0
	begin 
	rollback transaction TX
	select 'Hubo Error' as Respuesta
	end
	else
	begin 
	commit transaction TX
	select 'Eliminacion exitosa' as Respuesta
	end
go

--detalle materia

go
create procedure USP_RegistrarMateria
	@Nombre nvarchar(50),
	@Cred int,
	@Durac int,
	@Semes int
as
	begin transaction TX 
	insert into MATERIA (Nombre,Cred,Durac,Semes) values (@Nombre,@Cred,@Durac,@Semes);
	if @@ERROR >0
	begin 
	rollback transaction TX
	select 'Hubo Error' as Respuesta
	end
	else
	begin 
	commit transaction TX
	select 'Registro exitoso' as Respuesta
	end
go

go 
create procedure USP_ActualizarMateria
	@Id_Mat nvarchar(4),
	@Nombre nvarchar(50),
	@Cred int,
	@Durac int,
	@Semes int
as 
	begin transaction TX
	update MATERIA set Nombre=@Nmbre, Cred=@Cred, Durac=@Durac, semes=@Semes where Id_Mat=@Id_Mat;
	if @@ERROR >0
	begin 
	rollback transaction TX
	select 'Hubo Error' as Respuesta
	end
	else
	begin 
	commit transaction TX
	select 'Actualizacion Exitosa' as Respuesta
	end
go

go 
create procedure USP_EliminarMateria
	@Id_Mat
as 
	begin transaction T
	delete from MATERIA where Id_Mat=@Id_Mat;
	if @@ERROR >0
	begin 
	rollback transaction TX
	select 'Hubo Error' as Respuesta
	end
	else
	begin 
	commit transaction TX
	select 'Eliminacion exitosa' as Respuesta
	end
go

--Detalles materia

go
create procedure USP_RegistrarDetalle
	@Id_Est int,
	@Id_Mat nvarchar(4),
	@Por70 float,
	@por30 float,
	@total float
as
	begin transaction TX
	insert into DETALLE_MAT (Id_Est,Id_Mat,Por70,por30,total) values (@Id_Est,@Id_Mat,@Por70,@por30,@total);
	if @@ERROR >0
	begin 
	rollback transaction TX
	select 'Hubo Error' as Respuesta
	end
	else
	begin 
	commit transaction TX
	select 'Resgistro exitoso' as Respuesta
	end
go

go 
create procedure USP_ActualizarDetalle
	@Id_Det int;
	@Id_Est int,
	@Id_Mat nvarchar(4),
	@Por70 float,
	@por30 float,
	@total float
as
	begin transaction TX
	update Detalle_Mat set Id_Mat=@Id_Mat, Por70=@Por70, por30=@por30, total=@total where Id_Det=@Id_Det; 
	if @@ERROR >0
	begin 
	rollback transaction TX
	select 'Hubo Error' as Respuesta
	end
	else
	begin 
	commit transaction TX
	select 'Actualizacion exitosa' as Respuesta
	end
go

go 
create procedure USP_EliminarDetalle
	@Id_Det int
as
	begin transaction TX
	delete from Detalle_Mat where Id_Det=@Id_det;
	if @@ERROR >0
	begin 
	rollback transaction TX
	select 'Hubo Error' as Respuesta
	end
	else
	begin 
	commit transaction TX
	select 'Eliminacion exitosa' as Respuesta
	end
go

create procedure usp_UActualizarTotal
AS
BEGIN TRANSACTION TX
update Detalle_Mat
set Total =(Por70 * 0.7 + Por30 * 0.3)
IF @@ERROR > 0
BEGIN
ROLLBACK TRANSACTION TX
SELECT 'HUBO ERROR ' AS RESPUESTA
END
ELSE
BEGIN
COMMIT TRANSACTION TX
SELECT 'ACTUALIZACION EXITOSA' AS RESPUESTA
END

CREATE PROCEDURE USP_UDURACIONSEMESTRE
AS
BEGIN TRANSACTION TX
	UPDATE MATERIA
	SET DURAC= (CRED * 16 ),SEMES = CASE
	WHEN (ID_MAT LIKE 'P%')
	THEN 1
	WHEN (ID_MAT LIKE 'S%')
	THEN 2
	WHEN (ID_MAT LIKE 'T%')
	THEN 3
	WHEN (ID_MAT LIKE 'C%')
	THEN 4
	WHEN (ID_MAT LIKE 'Q%')
	THEN 5
END
IF @@ERROR > 0
BEGIN
	ROLLBACK TRANSACTION TX
	SELECT ' HUBO ERROR' AS RESPUESTA
END
ELSE
BEGIN
	COMMIT TRANSACTION TX
	SELECT ' ACTUALIZCION EXITOSA' AS RESPUESTA
END