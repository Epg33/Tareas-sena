drop database if exists gym;
create database gym;
use gym;

create table membresia(
	id_membresia varchar(10) primary key not null,
    costo_membresia int not null
);

create table cliente (
	id_cliente varchar(10) primary key not null,
	nombre varchar(15) not null,
    direccion varchar(50)  not null,
    telefono varchar(10) not null, 
    id_membresia varchar(10) not null,
    foreign key (id_membresia) references membresia(id_membresia)
);

create table instructores (
	id_instructor varchar(10) primary key not null,
    nombre_instructor varchar(15) not null
);

create table horario(
	id_horario varchar(2) primary key not null,
    hora_comienzo time not null,
    hora_final time not null,
    horas_totales int as(hour(hora_final)-hour(hora_comienzo))
);

create table maquinas (
	id_maquina varchar(10) primary key not null,
    nombre_maquina varchar(30) not null,
    estado varchar(20) not null,
    horario_disponible varchar(2) not null,
    horario_disponible2 varchar(2) not null,
    horario_disponible3 varchar(2) not null
);

create table reserva (
	id_reserva varchar(10) primary key not null,
    costo int not null,
    id_cliente varchar(10) not null,
    id_instructor varchar(10) not null,
    id_maquina varchar(10) not null,
    id_horario varchar(2) not null,
    foreign key (id_cliente) references cliente(id_cliente),
    foreign key (id_instructor) references instructores(id_instructor),
    foreign key (id_maquina) references maquinas(id_maquina),
    foreign key (id_horario) references horario(id_horario)
);

insert membresia(id_membresia, costo_membresia) values("1", 50000);
insert membresia(id_membresia, costo_membresia) values("2", 50000);
insert membresia(id_membresia, costo_membresia) values("3", 40000);
insert membresia(id_membresia, costo_membresia) values("4", 40000);
insert membresia(id_membresia, costo_membresia) values("5", 60000);
insert membresia(id_membresia, costo_membresia) values("6", 60000);
insert membresia(id_membresia, costo_membresia) values("7", 55000);
insert membresia(id_membresia, costo_membresia) values("8", 55000);
insert membresia(id_membresia, costo_membresia) values("9", 70000);
insert membresia(id_membresia, costo_membresia) values("10", 75000);

insert cliente(id_cliente, nombre, direccion, telefono, id_membresia) value("1", "Jhon", "calle 1 #1-1a", "3101111111", "1");
insert cliente(id_cliente, nombre, direccion, telefono, id_membresia) value("2", "Mary", "calle 2 #3-3b", "3101111112", "2");
insert cliente(id_cliente, nombre, direccion, telefono, id_membresia) value("3", "Alex", "calle 3 #4-1a", "3101111113", "3");
insert cliente(id_cliente, nombre, direccion, telefono, id_membresia) value("4", "Lucas", "calle 4 #5-1b", "3101111114", "4");
insert cliente(id_cliente, nombre, direccion, telefono, id_membresia) value("5", "Johana", "calle 5 #6-4a", "3101111115", "5");
insert cliente(id_cliente, nombre, direccion, telefono, id_membresia) value("6", "Luisa", "calle 6 #7-1b", "3101111116", "6");
insert cliente(id_cliente, nombre, direccion, telefono, id_membresia) value("7", "Leo", "calle 7 #8-7a", "3101111117", "7");
insert cliente(id_cliente, nombre, direccion, telefono, id_membresia) value("8", "Ivan", "calle 8 #9-1b", "3101111118", "8");
insert cliente(id_cliente, nombre, direccion, telefono, id_membresia) value("9", "Paola", "calle 9 #11-8a", "3101111119", "9");
insert cliente(id_cliente, nombre, direccion, telefono, id_membresia) value("10", "Liz", "calle 1 #10-1b", "3101111110", "10");

insert instructores(id_instructor, nombre_instructor) value("1", "Gerardo");
insert instructores(id_instructor, nombre_instructor) value("2", "Jose");
insert instructores(id_instructor, nombre_instructor) value("3", "Pedro");
insert instructores(id_instructor, nombre_instructor) value("4", "Roberto");
insert instructores(id_instructor, nombre_instructor) value("5", "Luis");
insert instructores(id_instructor, nombre_instructor) value("6", "Jon");
insert instructores(id_instructor, nombre_instructor) value("7", "Lupe");
insert instructores(id_instructor, nombre_instructor) value("8", "Sofia");
insert instructores(id_instructor, nombre_instructor) value("9", "Pedro Alberto");
insert instructores(id_instructor, nombre_instructor) value("10", "Alberto");

insert horario(id_horario, hora_comienzo, hora_final) values ('1', '08:00:00', '12:00:00');
insert horario(id_horario, hora_comienzo, hora_final) values ('2', '09:00:00', '13:00:00');
insert horario(id_horario, hora_comienzo, hora_final) values ('3', '10:00:00', '14:00:00');
insert horario(id_horario, hora_comienzo, hora_final) values ('4', '11:00:00', '15:00:00');
insert horario(id_horario, hora_comienzo, hora_final) values ('5', '12:00:00', '16:00:00');
insert horario(id_horario, hora_comienzo, hora_final) values ('6', '13:00:00', '17:00:00');
insert horario(id_horario, hora_comienzo, hora_final) values ('7', '14:00:00', '18:00:00');
insert horario(id_horario, hora_comienzo, hora_final) values ('8', '15:00:00', '19:00:00');
insert horario(id_horario, hora_comienzo, hora_final) values ('9', '07:00:00', '11:00:00');
insert horario(id_horario, hora_comienzo, hora_final) values ('10', '06:00:00', '10:00:00');

insert maquinas(id_maquina, nombre_maquina, estado, horario_disponible, horario_disponible2, horario_disponible3) value("1", "caminadora", "disponible", "1", "2", "3");
insert maquinas(id_maquina, nombre_maquina, estado, horario_disponible, horario_disponible2, horario_disponible3) value("2", "Barra estatica", "no disponible", "2", "3", "4");
insert maquinas(id_maquina, nombre_maquina, estado, horario_disponible, horario_disponible2, horario_disponible3) value("3", "Polea dual", "disponible", "1", "3", "4");
insert maquinas(id_maquina, nombre_maquina, estado, horario_disponible, horario_disponible2, horario_disponible3) value("4", "Bicicleta estatica", "no disponible", "2", "4", "5");
insert maquinas(id_maquina, nombre_maquina, estado, horario_disponible, horario_disponible2, horario_disponible3) value("5", "Banco de sentadillas", "no disponible", "4", "6", "7");
insert maquinas(id_maquina, nombre_maquina, estado, horario_disponible, horario_disponible2, horario_disponible3) value("6", "Maquina remadora", "disponible", "1", "3", "6");
insert maquinas(id_maquina, nombre_maquina, estado, horario_disponible, horario_disponible2, horario_disponible3) value("7", "Multiestacion 1", "disponible", "2", "3", "7");
insert maquinas(id_maquina, nombre_maquina, estado, horario_disponible, horario_disponible2, horario_disponible3) value("8", "Multiestacion 2", "no disponible", "1", "4", "8");
insert maquinas(id_maquina, nombre_maquina, estado, horario_disponible, horario_disponible2, horario_disponible3) value("9", "Multiestacion 3", "disponible", "1", "4", "8");
insert maquinas(id_maquina, nombre_maquina, estado, horario_disponible, horario_disponible2, horario_disponible3) value("10", "Multiestacion 4", "no disponible", "1", "4", "8");

insert reserva(id_reserva, costo, id_cliente, id_instructor, id_maquina, id_horario) value("1", 5000, "1", "1", "1", "1");
insert reserva(id_reserva, costo, id_cliente, id_instructor, id_maquina, id_horario) value("2", 5000, "2", "2", "2", "2");
insert reserva(id_reserva, costo, id_cliente, id_instructor, id_maquina, id_horario) value("3", 5000, "3", "3", "3", "4");
insert reserva(id_reserva, costo, id_cliente, id_instructor, id_maquina, id_horario) value("4", 5000, "4", "4", "4", "5");
insert reserva(id_reserva, costo, id_cliente, id_instructor, id_maquina, id_horario) value("5", 5000, "5", "5", "5", "7");
insert reserva(id_reserva, costo, id_cliente, id_instructor, id_maquina, id_horario) value("6", 5000, "6", "1", "6", "6");
insert reserva(id_reserva, costo, id_cliente, id_instructor, id_maquina, id_horario) value("7", 5000, "7", "2", "7", "2");
insert reserva(id_reserva, costo, id_cliente, id_instructor, id_maquina, id_horario) value("8", 5000, "8", "3", "8", "8");
insert reserva(id_reserva, costo, id_cliente, id_instructor, id_maquina, id_horario) value("9", 5000, "9", "4", "1", "2");
insert reserva(id_reserva, costo, id_cliente, id_instructor, id_maquina, id_horario) value("10", 5000, "10", "5", "2", "3");

/*1*/
select * from maquinas where estado="disponible";

/*2*/
select maquinas.nombre_maquina, maquinas.horario_disponible, maquinas.horario_disponible2, maquinas.horario_disponible3 from maquinas;

/*3*/
select cliente.nombre, maquinas.nombre_maquina, instructores.nombre_instructor, horario.hora_comienzo, horario.hora_final from cliente inner join maquinas inner join instructores inner join horario inner join reserva where reserva.id_cliente=cliente.id_cliente and reserva.id_instructor=instructores.id_instructor and reserva.id_maquina=maquinas.id_maquina and reserva.id_horario=horario.id_horario; 

/*4*/
select cliente.nombre, instructores.nombre_instructor from cliente inner join instructores inner join reserva where reserva.id_cliente=cliente.id_cliente and reserva.id_instructor=instructores.id_instructor;

