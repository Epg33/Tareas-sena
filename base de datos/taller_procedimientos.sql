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

/*1.8.2 Procedimientos con sentencias SQL*/
/*1.	Escribe un procedimiento que reciba el nombre de un país como parámetro de entrada y realice una consulta sobre la tabla cliente para obtener todos los clientes que existen en la tabla de ese país.*/
DELIMITER $$
drop procedure if exists verify_pais;
create procedure verify_pais(in pais varchar(50))
begin 
	select * from cliente where cliente.pais = pais;
end
$$
DELIMITER ;

call verify_pais('USA');


/*2.	Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena de caracteres (Ejemplo: PayPal, Transferencia, etc). Y devuelva como salida el pago de máximo valor realizado para esa forma de pago. Deberá hacer uso de la tabla pago de la base de datos jardineria.*/
DELIMITER $$
drop procedure if exists maximun_payment;
create procedure maximun_payment(in metodo varchar(50))
begin 
	select * from pago where pago.forma_pago=metodo order by pago.total desc limit 1;
end

$$
DELIMITER ;

call maximun_payment('PayPal');


/*3.	Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena de caracteres (Ejemplo: PayPal, Transferencia, etc). Y devuelva como salida los siguientes valores teniendo en cuenta la forma de pago seleccionada como parámetro de entrada:
•	el pago de máximo valor,
•	el pago de mínimo valor,
•	el valor medio de los pagos realizados,
•	la suma de todos los pagos,
•	el número de pagos realizados para esa forma de pago.
Deberá hacer uso de la tabla pago de la base de datos jardineria.*/
DELIMITER $$
drop procedure if exists payment_operations;
create procedure payment_operations(in metodo varchar(50), out minimo int, out maximo int, out medio int, out suma int, out pagos int)
begin 
	set minimo = (select min(total) from pago where pago.forma_pago=metodo );
    set maximo = (select max(total) from pago where pago.forma_pago=metodo );
    set medio = (select avg(total) from pago where pago.forma_pago=metodo );
    set suma = (select sum(total) from pago where pago.forma_pago=metodo );
    set pagos = (select count(total) from pago where pago.forma_pago=metodo );
end
$$
DELIMITER ;

call payment_operations('PayPal', @minimo, @maximo, @medio, @suma, @pagos);
select @minimo as 'pago minimo', @maximo as 'pago maximo', @medio as 'promedio', @suma as 'suma de todos los pagos ', @pagos as 'cantidad de pagos realizados';

/*4.Crea una base de datos llamada procedimientos que contenga una tabla llamada cuadrados. La tabla cuadrados debe tener dos columnas de tipo INT UNSIGNED, una columna llamada número y otra columna llamada cuadrado.
Una vez creada la base de datos y la tabla deberá crear un procedimiento llamado calcular_cuadrados con las siguientes características.
 El procedimiento recibe un parámetro de entrada llamado tope de tipo INT UNSIGNED y calculará el valor de los cuadrados de los primeros números naturales hasta el valor introducido como parámetro.
 El valor del números y de sus cuadrados deberán ser almacenados en la tabla cuadrados que hemos creado previamente.
Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de la tabla antes de insertar los nuevos valores de los cuadrados que va a calcular.
Utilice un bucle WHILE para resolver el procedimiento.*/
create database procedimientos;
use procedimientos;

create table cuadrados (
	numero int unsigned,
    cuadrado int unsigned
);

DELIMITER $$
drop procedure if exists calcular_cuadrados;
create procedure calcular_cuadrados(in tope int unsigned)
begin 
	declare counter int default 0;
	delete from cuadrados;
	while counter < tope do 
		insert into cuadrados(numero, cuadrado) values (counter, counter*counter);
		set counter = counter +1;
	end while;
end
$$
DELIMITER ;

call calcular_cuadrados(10);
select * from cuadrados;


/*5.	Utilice un bucle REPEAT para.
 resolver el procedimiento del ejercicio anterior.*/
DELIMITER $$
drop procedure if exists calcular_cuadrados;
create procedure calcular_cuadrados(in tope int unsigned)
begin
	delete from cuadrados;
	declare counter int default 0;
    set counter = 0;
        repeat 
		insert into cuadrados(numero, cuadrado) values (counter, counter*counter);
        set counter = counter + 1;
		until counter > tope end repeat;
    end;
$$

DELIMITER ;

call calcular_cuadrados(10);
select * from cuadrados;    

/*6.	Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.*/
DELIMITER $$
drop procedure if exists calcular_cuadrados;
create procedure calcular_cuadrados(in tope int unsigned)
begin
    declare counter int default 0;
	delete from cuadrados;
	label1: loop
		insert into cuadrados(numero, cuadrado) values (counter, counter*counter);   
        set counter = counter + 1;
        if counter >= tope then 
			leave label1;
        end if;        
	end loop;
end;
$$

DELIMITER ;

call calcular_cuadrados(10);
select * from cuadrados;


/*7.	Crea una base de datos llamada procedimientos que contenga una tabla llamada ejercicio. La tabla debe tener una única columna llamada número y el tipo de dato de esta columna debe ser INT UNSIGNED.
Una vez creada la base de datos y la tabla deberá crear un procedimiento llamado calcular_números con las siguientes características. El procedimiento recibe un parámetro de entrada llamado valor_inicial de tipo INT UNSIGNED y deberá almacenar en la tabla ejercicio toda la secuencia de números desde el valor inicial pasado como entrada hasta el 1.
Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de las tablas antes de insertar los nuevos valores.
Utilice un bucle WHILE para resolver el procedimiento.*/
use procedimientos;
create table ejercicio(
	numero int unsigned
);

DELIMITER $$
drop procedure if exists calcular_numeros;
create procedure calcular_numeros(in valor_inicial int unsigned)
begin
	declare counter int default valor_inicial;
    while counter >= 1 do 
		insert into ejercicio(numero) values (counter);
		set counter = counter - 1;
	end while;
end
$$
DELIMITER ;

call calcular_numeros(10);
select * from ejercicio;

/*8.	Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.*/
DELIMITER $$
drop procedure if exists calcular_numeros;
create procedure calcular_numeros(in valor_inicial int unsigned)
begin
	declare counter int default valor_inicial;
    repeat
		insert into ejercicio(numero) values (counter);
		set counter = counter - 1;
	until counter <= 0 end repeat;
end
$$
DELIMITER ;

call calcular_numeros(10);
select * from ejercicio;

/*9.	Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.*/
DELIMITER $$
drop procedure if exists calcular_numeros;
create procedure calcular_numeros(in valor_inicial int unsigned)
begin
	declare counter int default valor_inicial;
    labelname: loop
		insert into ejercicio(numero) values (counter);
		set counter = counter - 1;
        if counter <=0 then leave labelname;
        end if;
	end loop;
end
$$
DELIMITER ;

call calcular_numeros(10);
select * from ejercicio;

/*10.	Crea una base de datos llamada procedimientos que contenga una tabla llamada pares y otra tabla llamada impares. Las dos tablas deben tener única columna llamada número y el tipo de dato de esta columna debe ser INT UNSIGNED.
Una vez creada la base de datos y las tablas deberá crear un procedimiento llamado calcular_pares_impares con las siguientes características. El procedimiento recibe un parámetro de entrada llamado tope de tipo INT UNSIGNED y deberá almacenar en la tabla pares aquellos números pares que existan entre el número 1 el valor introducido como parámetro. Habrá que realizar la misma operación para almacenar los números impares en la tabla impares.
Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de las tablas antes de insertar los nuevos valores.
Utilice un bucle WHILE para resolver el procedimiento.*/
create table pares(
	numero int unsigned
);

create table impares(
	numero int unsigned
);

DELIMITER $$
drop procedure if exists calcular_pares_impares;
create procedure calcular_pares_impares(in tope int unsigned)
begin
	declare counter int default 0;
	delete from pares;
    delete from impares;
    while counter <= tope do
		if counter % 2 = 0 then
			insert into pares(numero) values (counter);
		else 
			insert into impares(numero) values (counter);
		end if;
        set counter = counter + 1; 
    end while;
end

$$
DELIMITER ;

call calcular_pares_impares(10);
select * from pares;
select * from impares;

/*11.	Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.*/

DELIMITER $$
drop procedure if exists calcular_pares_impares;
create procedure calcular_pares_impares(in tope int unsigned)
begin
	declare counter int default 0;
	delete from pares;
	delete from impares;
    repeat
		if counter % 2 = 0 then
			insert into pares(numero) values (counter);
		else 
			insert into impares(numero) values (counter);
		end if;
        set counter = counter + 1; 
    until counter >= tope end repeat;
end

$$
DELIMITER ;

call calcular_pares_impares(10);
select * from pares;
select * from impares;

/*12.	Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.*/
DELIMITER $$
drop procedure if exists calcular_pares_impares;
create procedure calcular_pares_impares(in tope int unsigned)
begin
	declare counter int default 0;
	delete from pares;
    delete from impares;
    labelname: loop
		if counter % 2 = 0 then
			insert into pares(numero) values (counter);
		else 
			insert into impares(numero) values (counter);
		end if;
        set counter = counter + 1; 
        if counter >= tope then leave labelname;
        end if;
    end loop;
end

$$
DELIMITER ;

call calcular_pares_impares(10);
select * from pares;
select * from impares;