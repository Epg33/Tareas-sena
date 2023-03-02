/*1. Crea una base de datos llamada test que contenga una tabla llamada 
alumnos con las siguientes columnas.
Tabla alumnos:
• id (entero sin signo)
• nombre (cadena de caracteres)
• apellido1 (cadena de caracteres)
• apellido2 (cadena de caracteres)
• nota (número real)
Una vez creada la tabla escriba dos triggers con las siguientes 
características:
• Trigger 1: trigger_check_nota_before_insert
o Se ejecuta sobre la tabla alumnos.
o Se ejecuta antes de una operación de inserción.
o Si el nuevo valor de la nota que se quiere insertar es negativo, 
se guarda como 0.
o Si el nuevo valor de la nota que se quiere insertar es mayor 
que 10, se guarda como 10.
• Trigger2 : trigger_check_nota_before_update
o Se ejecuta sobre la tabla alumnos.
o Se ejecuta antes de una operación de actualización.
o Si el nuevo valor de la nota que se quiere actualizar es 
negativo, se guarda como 0.
o Si el nuevo valor de la nota que se quiere actualizar es mayor 
que 10, se guarda como 10.*/

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

select * from alumnos;

insert into alumnos(id, nombre, apellido1, apellido2, nota) values (6, 'alex', 'lopez', 'lopez', 3.4);

DELIMITER $$
drop trigger if exists trigger_check_nota_before_insert;
create trigger trigger_check_nota_before_insert before insert on alumnos for each row begin 
	declare new_note real default 0;
    if new.nota <0 then set new_note=0; 
    else if new.nota >10 then set new_note=10; 
    else set new_note=new.nota; 
    end if;
    end if;
	set new.id = new.id,
    new.nombre = new.nombre,
    new.apellido1 = new.apellido2,
    new.nota = new_note;
end$$
DELIMITER ;

DELIMITER $$
create trigger trigger_check_nota_before_update before update on alumnos for each row begin 
declare new_note real default 0;
    if new.nota <0 then set new_note=0; 
    else if new.nota >10 then set new_note=10; 
    else set new_note=new.nota; 
    end if;
    end if;
	set new.id = new.id,
    new.nombre = new.nombre,
    new.apellido1 = new.apellido2,
    new.nota = new_note;
end
$$ 
DELIMITER ;
update alumnos set nota=-5 where id=1;


/*
2. Crea una base de datos llamada test que contenga una tabla llamada 
alumnos con las siguientes columnas
Tabla alumnos:
• id (entero sin signo)
• nombre (cadena de caracteres)
• apellido1 (cadena de caracteres)
• apellido2 (cadena de caracteres)
• email (cadena de caracteres)
Escriba un procedimiento llamado crear_email que dados los parámetros 
de entrada: nombre, apellido1, apellido2 y dominio, cree una dirección de 
email y la devuelva como salida.
• Procedimiento: crear_email
• Entrada:
o nombre (cadena de caracteres)
o apellido1 (cadena de caracteres)
o apellido2 (cadena de caracteres)
o dominio (cadena de caracteres)
• Salida:
o email (cadena de caracteres)
devuelva una dirección de correo electrónico con el siguiente formato:
• El primer carácter del parámetro nombre.
• Los tres primeros caracteres del parámetro apellido1.
• Los tres primeros caracteres del parámetro apellido2.
• El carácter @.
• El dominio pasado como parámetro.
Una vez creada la tabla escriba un trigger con las siguientes 
características:
• Trigger: trigger_crear_email_before_insert
o Se ejecuta sobre la tabla alumnos.
o Se ejecuta antes de una operación de inserción.
o Si el nuevo valor del email que se quiere insertar es NULL, 
entonces se le creará automáticamente una dirección de email 
y se insertará en la tabla.
o Si el nuevo valor del email no es NULL se guardará en la tabla 
el valor del email.
*/
drop table alumnos2;
create table alumnos2(
	id int unsigned primary key auto_increment,
    nombre varchar(30) not null,
    apellido1 varchar(30) not null,
    apellido2 varchar(30) not null,
    email varchar(30)
);
select * from alumnos2;
insert into alumnos2(nombre, apellido1, apellido2, email) values ('alex', 'lopez', 'lopez', 'jijijiolas@gmail.com');

DELIMITER $$
/*drop procedure if exists crear_email;*/
create procedure crear_email(in nombre varchar(30), in apellido1 varchar(30), in apellido2 varchar(30), in dominio varchar(30), out email varchar(30))
begin
	set email = concat(substring(nombre, 1, 1), substring(apellido1, 1, 3), substring(apellido2, 1, 3), '@', dominio);
end
$$
DELIMITER ;


DELIMITER $$

create trigger trigger_crear_email_before_insert before insert on alumnos2 for each row begin
	call crear_email(new.nombre, new.apellido1, new.apellido2, 'gmail.com', @email);
    if new.email is not null then
		set @email=new.email;
	end if;
    set new.email=@email;
end

$$
DELIMITER ;

/*
3. Modifica el ejercicio anterior y añade un nuevo trigger que las siguientes 
características:
Trigger: trigger_guardar_email_after_update:
• Se ejecuta sobre la tabla alumnos.
• Se ejecuta después de una operación de actualización.
• Cada vez que un alumno modifique su dirección de email se deberá 
insertar un nuevo registro en una tabla llamada log_cambios_email.
La tabla log_cambios_email contiene los siguientes campos:
• id: clave primaria (entero autonumérico)
• id_alumno: id del alumno (entero)
• fecha_hora: marca de tiempo con el instante del cambio (fecha y 
hora)
• old_email: valor anterior del email (cadena de caracteres)
• new_email: nuevo valor con el que se ha actualizado

*/

create table log_cambios_email(
	id int primary key auto_increment,
    id_alumno int unsigned not null,
    fecha_hora datetime default now(),
    old_email varchar(30) not null,
    new_email varchar(30) not null,
    foreign key(id_alumno) references alumnos2(id)
);

DELIMITER $$
create trigger trigger_guardar_email_after_update after update on alumnos2 for each row begin 
	insert into log_cambios_email(id_alumno, old_email, new_email) values((select id from alumnos2 where id=new.id), old.email, new.email);
end
$$
DELIMITER ;



create table log_alumnos_eliminados(
	id int primary key auto_increment,
    id_alumno int unsigned,
    fecha_hora  datetime default now(),
    nombre varchar(30) not null,
    apellido1 varchar(30) not null,
    apellido2 varchar(30) not null,
    email varchar(30) not null,
    foreign key(id_alumno) references alumnos2(id)
);

DELIMITER $$
create trigger trigger_guardar_alumnos_eliminados after delete on alumnos2 for each row begin 
	insert into log_alumnos_eliminados(id_alumnos, nombre, apellido1, apellido2, email) values ((select id from alumnos2 where id=old.id), old.nombre, old.apellido1, old.apellido2, old.email);
end
$$
DELIMITER ;