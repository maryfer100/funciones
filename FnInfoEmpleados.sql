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
	--TRUNCATE TABLE stmp_empleadosmemomasivo;

	iFilas = array_length(aEmpleados,1);
	
	IF(iFilas > 0)THEN--Verificamos si hay algun dato
		FOR i IN 1..iFilas 
		LOOP
                   IF EXISTS(SELECT numemp FROM cmcatalogoempleados WHERE numemp = aEmpleados[i]) THEN
			FOR iRegistro IN 
				SELECT emp.numemp, emp.nombre||' '|| emp.apellidopaterno||' '||emp.apellidomaterno AS nombrecompleto, cen.nombrecentro , cen.numerocentro,emp.numeropuesto,pue.nombre,emp.tipoempresa FROM cmcatalogoempleados emp 
				INNER JOIN sapcatalogocentros cen ON (emp.centro = cen.numerocentro)
				INNER JOIN sapcatalogopuestos pue ON (cast(emp.numeropuesto as char(3)) = pue.numeropuesto)
				WHERE emp.numemp = aEmpleados[i]
			LOOP	
				IF NOT EXISTS(SELECT numemp FROM tbEmpleados WHERE numemp = iRegistro.numemp) THEN			
				 	nemp   := iRegistro.numemp;
					nombre := iRegistro.nombrecompleto;
					centro := iRegistro.nombrecentro;
					puesto := iRegistro.nombre;
					
					INSERT INTO tbEmpleados(numemp, nombre, numcentro, centro, puesto)
					VALUES(iRegistro.numemp, iRegistro.nombrecompleto, iRegistro.numerocentro, iRegistro.nombrecentro, iRegistro.nombre);

					/*INSERT INTO stmp_empleadosmemomasivo(numemp,centro,puesto,empresa)
					VALUES(iRegistro.numemp,iRegistro.numerocentro,iRegistro.numeropuesto,iRegistro.tipoempresa);*/
				END IF;	
			   RETURN NEXT; 		 
			END LOOP;
		  END IF;		 		 
		END LOOP;		
	END IF;  		
END;
$BODY$
 LANGUAGE plpgsql VOLATILE
 COST 100;
ALTER FUNCTION FnInfoEmpleados(integer[])
OWNER TO postgres;

--SELECT  * FROM FnInfoEmpleados('{97597287,97597288,97597289,97597290,97597291,97597292,97597293,97597294,97597295,97597296,97597297}');
--SELECT  * FROM FnInfoEmpleados('{97597287,97597233,97597282,97597250,97597252,97597242,97597243,97597244,97597255,97597246,97597247}');

--select * from cmcatalogoempleados 
--select * from stmp_empleadosmemomasivo 
--select * from tbEmpleados

--truncate table tbEmpleados
--truncate table stmp_empleadosmemomasivo