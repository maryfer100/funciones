-- FUNCTION: public.fnpccmgrabacmimemorandums(integer, integer, integer, character varying, integer, integer, integer, integer, character)

-- DROP FUNCTION IF EXISTS public.fnpccmgrabacmimemorandums(integer, integer, integer, character varying, integer, integer, integer, integer, character);

CREATE OR REPLACE FUNCTION public.fnpccmgrabacmimemorandums(
	integer,
	integer,
	integer,
	character varying,
	integer,
	integer,
	integer,
	integer,
	character)
    RETURNS integer
    LANGUAGE 'plpgsql'
    COST 100
    --VOLATILE PARALLEL UNSAFE
AS $BODY$
 
DECLARE
  nFolioMemorandum ALIAS FOR $1;
  nCentroorigen ALIAS FOR $2;
  nEmpleadoorigen ALIAS FOR $3;
  cContenidocorreo ALIAS FOR $4;
  nGrupo ALIAS FOR $5;
  nPersonalizado ALIAS FOR $6;
  nAnexo ALIAS FOR $7;
  nEmpleadoIngreso ALIAS FOR $8;
  cIpusuarioPar ALIAS FOR $9;
  nFolioCentro integer;
  nClaveOrigen integer;

  cIpusuario bpchar;
 
BEGIN
	nFolioCentro := fnpccmincrementarfoliocentro(nCentroorigen);
	nClaveOrigen := 1;

	SELECT cast(client_addr as char(16)) into  cIpusuario FROM pg_stat_activity WHERE PID = INT4( pg_backend_pid() );
	SELECT substr(cIpusuario, 1, (strpos(cIpusuario, '/')-1)) into cIpusuario;
        
	
	INSERT INTO cmimemorandums( Foliocentro,Foliomemorandum, Centroorigen, Empleadoorigen, Contenidocorreo, Grupo, Personalizado, Anexo, EmpleadoIngreso, ipUsuario, claveorigen )
	VALUES (nFoliocentro,nFoliomemorandum, nCentroorigen, nEmpleadoorigen, cContenidocorreo, nGrupo, nPersonalizado, nAnexo, nEmpleadoIngreso, cIPUsuario, nClaveorigen);
	
RETURN nFolioCentro;

END;
$BODY$;


--select * from pg_stat_activity limit 10

--ALTER FUNCTION public.fnpccmgrabacmimemorandums(integer, integer, integer, character varying, integer, integer, integer, integer, character)
    --OWNER TO syscorreoprog;

--GRANT EXECUTE ON FUNCTION public.fnpccmgrabacmimemorandums(integer, integer, integer, character varying, integer, integer, integer, integer, character) TO PUBLIC;

--GRANT EXECUTE ON FUNCTION public.fnpccmgrabacmimemorandums(integer, integer, integer, character varying, integer, integer, integer, integer, character) TO syscorreomicrobodegam;

--GRANT EXECUTE ON FUNCTION public.fnpccmgrabacmimemorandums(integer, integer, integer, character varying, integer, integer, integer, integer, character) TO syscorreomicroprog;

--GRANT EXECUTE ON FUNCTION public.fnpccmgrabacmimemorandums(integer, integer, integer, character varying, integer, integer, integer, integer, character) TO syscorreoprog;

