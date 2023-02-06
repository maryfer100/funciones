-- FUNCTION fnpccmincrementarfoliounico() 
-- DROP FUNCTION fnpccmincrementarfoliounico();

CREATE OR REPLACE FUNCTION fnpccmincrementarfoliounico() 
RETURNS SETOF VARCHAR AS
$BODY$
/*  Funcion fnpccmincrementarfoliounico
 *  Autor: Maria Fernanda Medina Cañedo
 *  Fecha creacion: 2022 -01 -04
 *  Descripcion: Funcion genera la secuencia del folio unico para el envio de correo masivo.
 */
DECLARE
 --Declaracion de variables
	cRespuesta	CHARACTER(16);
	iFolio		INTEGER;
	cFolio 		VARCHAR;
	  
BEGIN

	cRespuesta = '';
	iFolio = 0;

	SELECT CAST(nextval('cmifoliounico_seq') AS INTEGER INTO iFolio);
	--SELECT CAST(fnpccmincrementarfoliounico AS CHAR(16)) INTO  iFolio FROM fnpccmincrementarfoliounico();
	SELECT CAST(iFolio AS CHAR(16)) INTO  cFolio;

		IF cFolio != '' THEN
			cRespuesta = cFolio;
		ELSE
			cRespuesta = 'Error';
		END IF;	
		
	RETURN NEXT cRespuesta;
END;
$BODY$ LANGUAGE 'plpgsql'

--SELECT fnpccmincrementarfoliounico AS folio FROM fnpccmincrementarfoliounico();
--DROP SEQUENCE cmifoliounico_seq;

-- FUNCTION: public.fnpccmincrementarfoliounico()

-- DROP FUNCTION IF EXISTS public.fnpccmincrementarfoliounico();

CREATE OR REPLACE FUNCTION public.fnpccmincrementarfoliounico(
	)
    RETURNS integer
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$

	select CAST(nextval('cmifoliounico_seq') AS INTEGER  ) 
$BODY$;

ALTER FUNCTION public.fnpccmincrementarfoliounico()
    OWNER TO syscorreoprog;
	