-- FUNCTION: public.fnpccmgrabacmimemorandumsdestino(integer, integer, integer, character)

-- DROP FUNCTION IF EXISTS public.fnpccmgrabacmimemorandumsdestino(integer, integer, integer, character);

CREATE OR REPLACE FUNCTION public.fnpccmgrabacmimemorandumsdestino(
	integer,
	integer,
	integer,
	character)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
 
DECLARE
  nFolioMemorandum ALIAS FOR $1;
  nCentroDestino ALIAS FOR $2;
  nEmpleadoDestino ALIAS FOR $3;
  cPuestoEmpleadoDestino ALIAS FOR $4;

  cIpusuario bpchar;
    
BEGIN
	SELECT cast(client_addr as char(16)) AS  cIpusuario FROM pg_stat_activity WHERE PID = INT4( pg_backend_pid() );
	SELECT substr(cIpusuario, 1, (strpos(cIpusuario, '/')-1)) into cIpusuario;
		
	--SELECT cast(client_addr as char(16)) into  cIpusuario FROM pg_stat_activity WHERE PID = INT4( pg_backend_pid() );
	
	INSERT INTO cmimemorandumsdestino( foliomemorandum,centrodestino, fechahoralectura, fechahoraimpresion, flaglectura,flagimpresion, flagborrado, empleadodestino,puestoempleadodestino, ipusuario, claveOrigen )
	VALUES (nFoliomemorandum, nCentroDestino, '19800101', '19800101', 0, 0, 0, nEmpleadoDestino, cPuestoEmpleadoDestino, cIpusuario, 1);
	
/*	INSERT INTO cmimovreplicacionmemo
	(statusmovimiento, tipocorreo, clavemovimiento, foliocentro,foliomemorandum, fechahoracreacion, centroorigen, empleadoorigen, contenidocorreo,grupo, centrodestino, 
	fechahoralectura, fechahoraimpresion, flaglectura, flagimpresion, empleadodestino, flagborrado, personalizado, anexo, EmpleadoIngreso, puestoempleadodestino, ipusuario, claveorigen )
	select 0, 3, 'A' ,foliocentro, foliomemorandum, fechahoracreacion, centroorigen, empleadoorigen, contenidocorreo, 0, nCentroDestino, 
	'19800101', '19800101', 0, 0, nEmpleadoDestino, 0, personalizado, anexo, EmpleadoIngreso, cPuestoEmpleadoDestino, ipusuario, claveorigen
	from  cmimemorandums 
	WHERE foliomemorandum = nFolioMemorandum;*/
END;
$BODY$;
