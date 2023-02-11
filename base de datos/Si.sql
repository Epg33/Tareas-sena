use jardineria;

/*1.	Escribe un procedimiento que reciba el nombre de un país como parámetro de entrada y realice una consulta sobre la tabla cliente para obtener todos los clientes que existen en la tabla de ese país.*/

DELIMITER $$
drop procedure if exists paises;
create procedure paises (in nombre varchar (50), out output varchar (50))
begin 
	

$$ 

