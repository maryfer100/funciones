-- FUNCTION FnInfoEmpleados(integer[]); 
-- DROP FUNCTION FnInfoEmpleados(integer[]); 

CREATE OR REPLACE FUNCTION FnInfoEmpleados(integer[]) 
RETURNS TABLE (nemp INTEGER, nombre VARCHAR, centro VARCHAR, puesto VARCHAR) AS
$BODY$
/*  Funcion FnInfoEmpleados
 *  Autor: Maria Fernanda Medina Cañedo
 *  Fecha creacion: 2022 -01 -04
 *  Descripcion: Funcion que devuelve la informacion de empleados a los cuales se les envia correo.
 */
DECLARE
 --DeclaraciOn de variables
	aEmpleados   	ALIAS FOR $1;
	iFilas 		INTEGER;	
	sNombre		VARCHAR;
	iRegistro	RECORD;

	  
BEGIN
	 TRUNCATE TABLE tbEmpleados;
	
		CREATE TABLE IF NOT EXISTS tbEmpleados(
		numemp  integer,
		nombre	varchar,
		numerocentro integer,
		centro	varchar,
		puesto  varchar,
		empresa smallint,
		enviado smallint not null default 0
		);

	iFilas = array_length(aEmpleados,1);
	
	IF(iFilas > 0)THEN--Verificamos si hay algun dato
		FOR i IN 1..iFilas 
		LOOP
		raise notice 'Ciclo %', i;
		raise notice 'empleado %', aEmpleados[i];
                   IF EXISTS(SELECT numemp FROM cmcatalogoempleados WHERE numemp = aEmpleados[i]) THEN
			FOR iRegistro IN 
				SELECT emp.numemp, emp.nombre||' '|| emp.apellidopaterno||' '||emp.apellidomaterno AS nombrecompleto, cen.nombrecentro , cen.numerocentro,emp.numeropuesto, pue.nombre,emp.tipoempresa FROM cmcatalogoempleados emp 
				INNER JOIN cmcatalogocentros cen ON (emp.centro = cen.numerocentro)
				INNER JOIN stmpsapcatalogopuestos pue ON (cast(emp.numeropuesto as char(3)) = pue.numero)
				WHERE emp.numemp = aEmpleados[i]
			LOOP	
				 	nemp   := iRegistro.numemp;
					nombre := iRegistro.nombrecompleto;
					centro := iRegistro.nombrecentro;
					puesto := iRegistro.nombre;
					raise notice 'empleado %',  iRegistro.numemp;
					
					INSERT INTO tbEmpleados(numemp, nombre, numerocentro, centro, puesto, empresa,enviado)
					VALUES(iRegistro.numemp, iRegistro.nombrecompleto, iRegistro.numerocentro, iRegistro.nombrecentro, iRegistro.nombre,iRegistro.tipoempresa,0);

			   RETURN NEXT; 		 
			END LOOP;
		  END IF;		 		 
		END LOOP;		
	END IF;  		
END;
$BODY$
 LANGUAGE plpgsql VOLATILE
 COST 100;
--ALTER FUNCTION FnInfoEmpleados(integer[])
-- OWNER TO postgres;

--SELECT  * FROM FnInfoEmpleados('{97597287,97597288,97597289,97597290,97597291,97597292,97597293,97597294,97597295,97597296,97597297}');
--SELECT  * FROM FnInfoEmpleados('{97597287,97597233,97597282,97597250,97597252,97597242,97597243,97597244,97597255,97597246,97597247}');

--select centro,numeropuesto,* from cmcatalogoempleados --250590 230399 230399 230390 230399 250595 230399 230399 230399 250595 230390

--select numerocentro,* from cmcatalogocentros 
--select numero,* from stmpsapcatalogopuestos

--select *  from tbEmpleados


