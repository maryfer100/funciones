-- FUNCTION FnInfoEmpleados(); 
-- DROP FUNCTION FnInfoEmpleados(); 

CREATE OR REPLACE FUNCTION FnInfoEmpleados() 

  RETURNS integer AS
$BODY$
/*  Funcion FnInfoEmpleados
 *  Autor: Maria Fernanda Medina Cañedo
 *  Fecha creacion: 2022 -01 -04
 *  Descripcion: Funcion que devuelve la informacion a mostrar en grid de empleados a los cuales se les envia correo.
 */
DECLARE
 --DeclaraciOn de variables
	
	iEmpleado	INTEGER;
	iRegistro	RECORD;
	iCont 		INTEGER;
	nemp  		INTEGER;
	nombre		VARCHAR;
	centro		VARCHAR;
	puesto		VARCHAR;
	  
BEGIN

   iCont = 0;
			
      truncate table tbEmpleados;
	
	FOR iRegistro IN 
		SELECT emp.numemp, emp.nombre||' '|| emp.apellidopaterno||' '||emp.apellidomaterno AS nombrecompleto, cen.nombrecentro , cen.numerocentro,emp.numeropuesto, pue.nombre,emp.tipoempresa FROM cmcatalogoempleados emp 
		INNER JOIN cmcatalogocentros cen ON (emp.centro = cen.numerocentro)
		INNER JOIN stmpsapcatalogopuestos pue ON (cast(emp.numeropuesto as char(3)) = pue.numero)
		INNER JOIN tbEmpleadosExcel tbemp ON (emp.numemp = tbemp.numemp)
		--WHERE emp.numemp = iEmpleado
	LOOP	
			nemp   := iRegistro.numemp;
			nombre := iRegistro.nombrecompleto;
			centro := iRegistro.nombrecentro;
			puesto := iRegistro.nombre;
			raise notice 'empleado %',  iRegistro.numemp;
			
			INSERT INTO tbEmpleados(numemp, nombre, numerocentro, centro, puesto, empresa,enviado)
			VALUES(iRegistro.numemp, iRegistro.nombrecompleto, iRegistro.numerocentro, iRegistro.nombrecentro, iRegistro.nombre,iRegistro.tipoempresa,0);
			iCont = iCont + 1;		 
	END LOOP;
	RETURN iCont;	 		   		
END;
$BODY$
 LANGUAGE plpgsql VOLATILE
 COST 100;
--ALTER FUNCTION FnInfoEmpleados()
-- OWNER TO postgres;

--SELECT  * FROM FnInfoEmpleados('{97597287,97597288,97597289,97597290,97597291,97597292,97597293,97597294,97597295,97597296,97597297}');
--SELECT  * FROM FnInfoEmpleados();

--select centro,numeropuesto,* from cmcatalogoempleados --250590 230399 230399 230390 230399 250595 230399 230399 230399 250595 230390

--select numerocentro,* from cmcatalogocentros 
--select numero,* from stmpsapcatalogopuestos

--select *  from tbEmpleadosExcel
--select * from tbEmpleados
select numemp,nombre,centro,puesto from tbEmpleados

--select * from tbEmpleadosExcel
--truncate table tbEmpleadosExcel
--truncate table tbEmpleados
--select fun_cargaempleados as valor from fun_cargaempleados(97597287);

