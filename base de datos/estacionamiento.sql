drop database if exists estacionamiento;
create database estacionamiento;
use estacionamiento;

create table tarifa (
	id_tarifa int primary key not null,
    tipo_vehiculo varchar(20) not null,
    costo_tarifa int not null,
    recargo_nocturno int not null
);

create table ticket (
	id_ticket int primary key not null,
    id_tarifa int not null,
    placa_vehiculo varchar(7) not null,
    fecha_entrada date not null
);

create table descuento (
	id_descuento int primary key not null,
    descuento int not null,
    id_ticket int not null
);

create table checkOut(
	id_check_out int primary key not null,
    hora_entrada datetime not null,
    hora_salida datetime not null,
    id_ticket int not null
);

create table factura (
	id_factura int primary key not null,
    sub_total int not null,
    impuestos int not null,
    descuento int not null,
    total_pago int not null,
    id_ticket int not null,
    id_check_out int not null
);

alter table ticket add constraint fk_id_tarifa foreign key (id_tarifa) references tarifa(id_tarifa);
alter table descuento add constraint fk_id_ticket foreign key (id_ticket) references ticket(id_ticket);
alter table checkOut add constraint fk_id_ticket_2 foreign key (id_ticket) references ticket(id_ticket);
alter table factura add constraint fk_id_ticket_3 foreign key (id_ticket) references ticket(id_ticket);
alter table factura add constraint fk_id_check_out foreign key (id_check_out) references checkOut(id_check_out);

insert tarifa(id_tarifa, tipo_vehiculo, costo_tarifa, recargo_nocturno) values (1, "auto", 2500, 0);
insert tarifa(id_tarifa, tipo_vehiculo, costo_tarifa, recargo_nocturno) values (2, "auto", 2500, 1000);
insert tarifa(id_tarifa, tipo_vehiculo, costo_tarifa, recargo_nocturno) values (3, "moto", 1500, 0);
insert tarifa(id_tarifa, tipo_vehiculo, costo_tarifa, recargo_nocturno) values (4, "moto", 1500, 1000);

insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (1, 1,  "abc-123", "2021-08-15");
insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (2, 1,  "bbc-123", "2021-09-12");
insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (3, 1,  "cbc-123", "2021-08-01");
insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (4, 1,  "dbc-123", "2021-09-18");
insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (5, 2,  "ebc-123", "2021-08-24");
insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (6, 2,  "ebc-123", "2021-09-06");
insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (7, 2,  "gbc-123", "2021-08-30");
insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (8, 2,  "hbc-123", "2021-09-15");
insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (9, 3,  "ibc-123", "2021-08-20");
insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (10, 3,  "jbc-123", "2021-09-05");
insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (11, 3,  "kbc-123", "2021-08-07");
insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (12, 3,  "lbc-123", "2021-09-30");
insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (13, 4,  "mbc-123", "2021-08-16");
insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (14, 4,  "nbc-123", "2021-09-04");
insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (15, 4,  "ñbc-123", "2021-08-26");
insert ticket(id_ticket, id_tarifa, placa_vehiculo, fecha_entrada) values (16, 4,  "obc-123", "2021-09-17");

insert descuento(id_descuento, descuento, id_ticket) values(1, 7500, 1);
insert descuento(id_descuento, descuento, id_ticket) values(2, 0, 2);
insert descuento(id_descuento, descuento, id_ticket) values(3, 7500, 3);
insert descuento(id_descuento, descuento, id_ticket) values(4, 0, 4);
insert descuento(id_descuento, descuento, id_ticket) values(5, 7500, 5);
insert descuento(id_descuento, descuento, id_ticket) values(6, 0, 6);
insert descuento(id_descuento, descuento, id_ticket) values(7, 7500, 7);
insert descuento(id_descuento, descuento, id_ticket) values(8, 0, 8);
insert descuento(id_descuento, descuento, id_ticket) values(9, 4500, 9);
insert descuento(id_descuento, descuento, id_ticket) values(10, 0, 10);
insert descuento(id_descuento, descuento, id_ticket) values(11, 4500, 11);
insert descuento(id_descuento, descuento, id_ticket) values(12, 0, 12);
insert descuento(id_descuento, descuento, id_ticket) values(13, 4500, 13);
insert descuento(id_descuento, descuento, id_ticket) values(14, 0, 14);
insert descuento(id_descuento, descuento, id_ticket) values(15, 4500, 15);
insert descuento(id_descuento, descuento, id_ticket) values(16, 0, 16);

insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(1, "2021-08-15 12:00:00", "2021-08-15 3:00:00", 1);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(2, "2021-09-12 12:00:00", "2021-09-12 3:00:00", 2);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(3, "2021-08-01 12:00:00", "2021-08-01 6:00:00", 3);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(4, "2021-09-18 12:00:00", "2021-09-18 3:00:00", 4);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(5, "2021-08-24 20:00:00", "2021-08-24 23:00:00", 5);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(6, "2021-09-06 20:00:00", "2021-09-06 23:00:00", 6);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(7, "2021-08-30 20:00:00", "2021-08-30 23:00:00", 7);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(8, "2021-09-15 20:00:00", "2021-09-15 23:00:00", 8);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(9, "2021-08-20 12:00:00", "2021-08-20 3:00:00", 9);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(10, "2021-09-05 12:00:00", "2021-09-05 6:00:00", 10);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(11, "2021-08-07 12:00:00", "2021-08-07 3:00:00", 11);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(12, "2021-09-30 12:00:00", "2021-09-30 6:00:00", 12);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(13, "2021-08-16 20:00:00", "2021-08-16 23:00:00", 13);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(14, "2021-09-04 20:00:00", "2021-09-04 23:00:00", 14);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(15, "2021-08-26 20:00:00", "2021-08-26 23:00:00", 15);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(16, "2021-09-17 20:00:00", "2021-09-17 23:00:00", 16);

insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(1, );