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
alter table factura add constraint fk_descuento foreign key (descuento) references descuento(id_descuento);

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

insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(1, "2021-08-15 1:00:00", "2021-08-15 4:00:00", 1);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(2, "2021-09-12 1:00:00", "2021-09-12 7:00:00", 2);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(3, "2021-08-01 1:00:00", "2021-08-01 4:00:00", 3);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(4, "2021-09-18 1:00:00", "2021-09-18 7:00:00", 4);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(5, "2021-08-24 20:00:00", "2021-08-24 23:00:00", 5);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(6, "2021-09-06 20:00:00", "2021-09-06 23:00:00", 6);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(7, "2021-08-30 20:00:00", "2021-08-30 23:00:00", 7);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(8, "2021-09-15 20:00:00", "2021-09-15 23:00:00", 8);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(9, "2021-08-20 1:00:00", "2021-08-20 4:00:00", 9);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(10, "2021-09-05 1:00:00", "2021-09-05 7:00:00", 10);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(11, "2021-08-07 1:00:00", "2021-08-07 4:00:00", 11);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(12, "2021-09-30 1:00:00", "2021-09-30 7:00:00", 12);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(13, "2021-08-16 20:00:00", "2021-08-16 23:00:00", 13);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(14, "2021-09-04 20:00:00", "2021-09-04 23:00:00", 14);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(15, "2021-08-26 20:00:00", "2021-08-26 23:00:00", 15);
insert checkOut(id_check_out, hora_entrada, hora_salida, id_ticket) values(16, "2021-09-17 20:00:00", "2021-09-17 23:00:00", 16);

insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(1, 7500, 1500, 1, 1500, 1, 1);
insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(2, 15000, 2850, 2, 17850, 2, 2);
insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(3, 7500, 1500, 3, 1500, 3, 3);
insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(4, 15000, 2850, 4, 17850, 4, 4);
insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(5, 10500, 1995, 5, 6995, 5, 5);
insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(6, 10500, 1995, 6, 12495, 6, 6);
insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(7, 10500, 1995, 7, 6995, 7, 7);
insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(8, 10500, 1995, 8, 12495, 8, 8);
insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(9, 4500, 855, 9, 855, 9, 9);
insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(10, 9000, 1710, 10, 10710, 10, 10);
insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(11, 4500, 855, 11, 855, 11, 11);
insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(12, 9000, 1710, 12, 10710, 12, 12);
insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(13, 7500, 1500, 13, 4500, 13, 13);
insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(14, 7500, 1500, 14, 9000, 14, 14);
insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(15, 7500, 1500, 15, 4500, 15, 15);
insert factura(id_factura, sub_total, impuestos, descuento, total_pago, id_ticket, id_check_out) values(16, 7500, 1500, 16, 9000, 16, 16);

select tipo_vehiculo, costo_tarifa, recargo_nocturno from tarifa;
select ticket.placa_vehiculo as vehiculo, ticket.fecha_entrada as "fecha de entrada" from ticket inner join checkOut where checkOut.id_ticket=ticket.id_ticket and month(checkOut.hora_entrada)=08 and month(checkOut.hora_salida)=08;
select ticket.placa_vehiculo as vehiculo, ticket.fecha_entrada as "fecha de entrada", checkOut.hora_entrada, checkOut.hora_salida  from ticket inner join checkOut where checkOut.id_ticket=ticket.id_ticket and hour(checkOut.hora_salida)-hour(checkOut.hora_entrada)>=5;
select ticket.placa_vehiculo as vehiculo, ticket.fecha_entrada as "fecha de entrada", checkOut.hora_entrada, checkOut.hora_salida, factura.total_pago from ticket inner join checkOut inner join factura where checkOut.id_ticket=ticket.id_ticket and factura.id_ticket=ticket.id_ticket and factura.total_pago>= 20000;
select ticket.placa_vehiculo as vehiculo, ticket.fecha_entrada as "fecha de entrada", checkOut.hora_entrada, checkOut.hora_salida, hour(checkOut.hora_salida)-hour(checkOut.hora_entrada) as "Horas de estadia",factura.total_pago from ticket inner join checkOut inner join factura where checkOut.id_ticket=ticket.id_ticket and factura.id_ticket=ticket.id_ticket and month(checkOut.hora_entrada)=09 and month(checkOut.hora_salida)=09;