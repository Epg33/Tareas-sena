use taller_procedimientos; 

/*1.8.1 Procedimientos sin sentencias SQL*/
/*1.Escribe un procedimiento que no tenga ningún parámetro de entrada ni de salida y que muestre el texto ¡Hola mundo!.*/
DELIMITER $$
drop procedure if exists hola_mundo;
create procedure hola_mundo()
begin 
	select "Hola Mundo";
end

$$

DELIMITER ;
call hola_mundo();



/*2.Escribe un procedimiento que reciba un número real de entrada y muestre un mensaje indicando si el número es positivo, negativo o cero.*/

DELIMITER $$
drop procedure if exists numeros;
create procedure numeros(IN numero int)
begin 
	case
	when  numero > 0 then select "Es positivo";
    when numero < 0 then select "Es negativo";
    when numero = 0 then select "Es cero";
end case;
end;		

$$ 

DELIMITER ;
call numeros(11);

/*3.Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada, con el valor un número real, y un parámetro de salida, con una cadena de caracteres indicando si el número es positivo, negativo o cero.*/
DELIMITER $$
drop procedure if exists numeros_salida;
create procedure numeros_salida(in numero int, out output varchar(15))
begin 
	case
	when numero > 0 then set output = "Es positivo";
    when numero < 0 then set output = "Es negativo";
    when numero = 0 then set output = "Es igual a cero";
end case;
end;
$$
DELIMITER ;

call numeros_salida(2, @si);
select @si;
/*4.Escribe un procedimiento que reciba un número real de entrada, que representa el valor de la nota de un alumno, y muestre un mensaje indicando qué nota ha obtenido teniendo en cuenta las siguientes condiciones:*/
/*•	[0,5) = Insuficiente*/
/*•	[5,6) = Aprobado*/
/*•	[6, 7) = Bien*/
/*•	[7, 9) = Notable*/
/*•	[9, 10] = Sobresaliente*/
/*•	En cualquier otro caso la nota no será válida.*/
DELIMITER $$
drop procedure if exists notas;
create procedure notas(in numero int, out output varchar(50))
begin 
	case 
		when numero > 0 and numero < 11 then set output = numero;
        else set output = "nota no valida";
	end case;
    end;
    $$

DELIMITER ;

call notas (10, @num);
select @num;

/*5.	Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada, con el valor de la nota en formato numérico y un parámetro de salida, con una cadena de texto indicando la nota correspondiente.*/
DELIMITER $$
drop procedure if exists notas;
create procedure notas(in numero int, out output varchar(50))
begin 
	case 
		when numero between 0 and 5 then set output = "Insuficiente";
        when numero between 5 and 6 then set output = "Aprobado";
        when numero between 6 and 7 then set output = "Bien";
        when numero between 7 and 9 then set output = "Notable";
        when numero between 9 and 10 then set output = "Sobresaliente";
        when numero < 0 then set output = "La nota no es válida";
        when numero > 10 then set output = "La nota no es válida";
	end case;
    end;
    $$

DELIMITER ;

call notas (11, @num);
select @num;

/*6.	Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.*/
DELIMITER $$
drop procedure if exists notas;
create procedure notas(in numero int, out output varchar(50))
begin 
	case 
		when numero between 0 and 5 then set output = "Insuficiente";
        when numero between 5 and 6 then set output = "Aprobado";
        when numero between 6 and 7 then set output = "Bien";
        when numero between 7 and 9 then set output = "Notable";
        when numero between 9 and 10 then set output = "Sobresaliente";
        when numero < 0 then set output = "La nota no es válida";
        when numero > 10 then set output = "La nota no es válida";
	end case;
    end;
    $$

DELIMITER ;

call notas (11, @num);
select @num;

/*7.	Escribe un procedimiento que reciba como parámetro de entrada un valor numérico que represente un día de la semana y que devuelva una cadena de caracteres con el nombre del día de la semana correspondiente. Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.*/
DELIMITER $$
drop procedure if exists semana;
create procedure semana (in numero int, out output varchar(50))
begin 
	case
		when numero = 1 then set output = "Lunes";
        when numero = 2 then set output = "Martes";
        when numero = 3 then set output = "Miercoles";
        when numero = 4 then set output = "Jueves";
        when numero = 5 then set output = "Viernes";
        when numero = 6 then set output = "Sábado";
        when numero = 7 then set output = "Domingo";
		else set output = "Verifique sus datos";
    end case;
end
$$


DELIMITER ;

call semana (2, @dia);
select @dia;