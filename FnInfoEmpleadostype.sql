-- FUNCTION FnInfoEmpleados(integer, varchar) 
--DROP FUNCTION FnInfoEmpleados(aEmpleados integer[]) 
CREATE OR REPLACE FUNCTION FnInfoEmpleados(integer[]) 
RETURNS SETOF tpInfoEmpleados AS
$BODY$
/*  Funcion FnInfoEmpleados
 *  Autor: Maria Fernanda Medina Cañedo
 *  Fecha creacion: 2022 -01 -04
 *  Descripcion: Funcion que devuelve la informacion de empleados a los cuales se les envia correo.
 */
DECLARE
 --Declaración de variables
	iEmpleado   	ALIAS FOR $1;
	iFilas 		INTEGER;	
	sNombre		VARCHAR;
	iRegistro	RECORD;
	tpInfoEmpleados	tpInfoEmpleados;
	  
BEGIN
	tpInfoEmpleados.numemp 		= 0;
        tpInfoEmpleados.nombre	 	= '';
        tpInfoEmpleados.centro		= '';
        tpInfoEmpleados.puesto		= '';

	iFilas = array_length(aEmpleados,1);
	
	IF(iFilas > 0)THEN--Verificamos si hay algun dato
		FOR i IN 1..iFilas 
		LOOP
                   IF EXISTS(SELECT numemp FROM cmcatalogoempleados WHERE numemp = Empleados[i]) THEN
			FOR iRegistro IN 
				SELECT emp.numemp, emp.nombre||' '|| emp.apellidopaterno||' '||emp.apellidomaterno AS nombrecompleto, cen.nombrecentro , 'PROGRAMADORA' AS puesto FROM cmcatalogoempleados emp 
				INNER JOIN sapcatalogocentros cen ON (emp.centro= cen.numerocentro)
				WHERE emp.numemp = aEmpleados[i]
			LOOP	
				tpInfoEmpleados.numemp 		= iRegistro.numemp;
				tpInfoEmpleados.nombre	 	= iRegistro.nombrecompleto;
				tpInfoEmpleados.centro		= iRegistro.nombrecentro;
				tpInfoEmpleados.puesto		= iRegistro.puesto;
				RETURN NEXT tpInfoEmpleados;		 
			END LOOP;
		  END IF;		 
		END LOOP;
	  RETURN;
	END IF;  		
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
--  COST 100;
--ALTER FUNCTION FnInfoEmpleados(aEmpleados integer[])
  --OWNER TO postgres;

--SELECT  * FROM FnInfoEmpleados('{97597287,97597288,97597289,97597290,97597291,97597292,97597293,97597294,97597295,97597296,97597297}');
--SELECT  * FROM FnInfoEmpleados('{97597287,97597281,97597282,97597250,97597252,97597242,97597243,97597244,97597255,97597246,97597247}');