-- FUNCTION FnAccesoEnvioMasivo(integer, varchar) 

CREATE OR REPLACE FUNCTION FnAccesoEnvioMasivo(integer, varchar) 
RETURNS SETOF integer AS
$BODY$
/*  Funcion FnAccesoEnvioMasivo
 *  Autor: Maria Fernanda Medina Cañedo
 *  Fecha creacion: 2022 -01 -04
 *  Descripcion: Funcion de consulta para verifcacion de acceso a empleados para envios masivo de correos.
 */
DECLARE
 --Declaración de variables
	iEmpleado   	ALIAS FOR $1;
	sPassword      	ALIAS FOR $2;
	iNumEmp		INTEGER;
	sPassw		VARCHAR;
	iRespuesta	INTEGER;
	  
BEGIN

	iRespuesta = 0;
	
	IF EXISTS(SELECT numemp FROM cmcatalogoempleados WHERE numemp = iEmpleado) THEN
		IF EXISTS(SELECT numemp FROM cat_derechosutileriacorreomicro WHERE numemp =  iEmpleado) THEN
			SELECT passw INTO sPassw FROM cat_derechosutileriacorreomicro WHERE numemp = iEmpleado;
			IF (sPassw = sPassword) THEN
				 iRespuesta = 1;--Usuario tiene permiso de acceso
			ELSE
				iRespuesta = 2;--Usuario no tiene permiso de acceso
			END IF;			
		ELSE
		 	iRespuesta = 2;--Usuario no tiene permiso de acceso
		END IF; 
	ELSE
		 iRespuesta = 2;--Usuario no tiene permiso de acceso	
	END IF;	 
	  
	RETURN NEXT iRespuesta;   
END;
$BODY$ LANGUAGE 'plpgsql'
--OWNER TO postgres;


--SELECT  FnAccesoEnvioMasivo AS respuesta FROM FnAccesoEnvioMasivo(97597287,'holas10');