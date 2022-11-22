drop database if exists triggers_try;
create database triggers_try;

use triggers_try;

create table persona(
	id int primary key,
    nombre varchar(15) not null,
    apellido varchar(15) not null,
    email varchar(30) not null,
    ciudad varchar(20) not null
);

delimiter //
create procedure sp_registro_persona (id_p int, nombre_p varchar(15), apellido_p varchar(15), email_p varchar(30), ciudad_p varchar(20))
begin 
	insert into persona (id, nombre, apellido, email, ciudad) values (id_p, nombre_p, apellido_p, email_p, ciudad_p);
end//

call sp_registro_persona (1, 'alex', 'lopex', 'xd', 'szs');

delimiter //
create procedure sp_listar_persona ()
begin
	select * from persona;
end//