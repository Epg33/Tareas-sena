drop database if exists test;
create database test;
use test;

create table alumnos (
	id int unsigned,
    nombre varchar(30) not null,
    apellido1 varchar(30) not null,
    apellido2 varchar(30),
    nota real not null
);

DELIMITER $$
drop trigger if exists trigger_check_nota_before_insert;
create trigger trigger_check_nota_before_insert before insert on alumnos for each row begin 
	set new.id = new.id,
    new.nombre = new.nombre,
    new.apellido1 = new.apellido2,
    new.nota = if new.nota <0 then 0 else if new.nota >10 then 10 else new.nota end if;
end
$$
DELIMITER ;

