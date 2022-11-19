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

insert into persona (id, nombre, apellido, email, ciudad) values (1, "alex","lopez", "a@gmail.com","cali");


delimiter //
create procedure sp_registro_persona (id_p int, nombre_p varchar(15), apellido_p varchar(15), email_p varchar(30), ciudad_p varchar(20))
begin 
	insert into persona (id, nombre, apellido, email, ciudad) values (id_p, nombre_p, apellido_p, email_p, ciudad_p);
end; //
delimiter;

call sp_registro_persona(2, "alexxx","lopez", "a@gmail.com","cali");

DELIMITER // 
create trigger registrar_persona_bi before insert on persona for each row
begin
declare id_p int;
declare nombre_p varchar(15);
declare apellido_p varchar(15);
declare email_p varchar(30);
declare ciudad_p varchar(20);
insert into persona(id, nombre, apellido, email, ciudad) values(id_p, nombre_p, apellido_p, email_p, ciudad_p);
end; //

call sp_registro_persona(3, "alexxx","lopezzzz", "a@gmail.com","cali");
