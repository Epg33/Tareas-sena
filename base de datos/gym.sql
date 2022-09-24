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
    hora_comienzo datetime not null,
    hora_final datetime not null,
    horas_totales int as(hour(hora_final)-hour(hora_comienzo)) not null
);

create table maquinas (
	id_maquina varchar(10) primary key not null,
    nombre_maquina varchar(30) not null
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
