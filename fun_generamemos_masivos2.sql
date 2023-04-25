--DROP FUNCTION fun_generamemos_masivos(emporigen integer,centro integer,sAsunto text,sTextoMemo text)

CREATE OR REPLACE FUNCTION fun_generamemos_masivos(emporigen integer,centro integer,sAsunto text,sTextoMemo text)
  RETURNS integer AS
$BODY$

	DECLARE
	iFolioMemo integer;
	iFolioCentro integer;
	rDatos record;
	iContador integer;
	cIpusuario varchar;
			
BEGIN

        iFolioMemo = 0;
        iFolioCentro = 0;
        iContador = 0;
      
                                                           
	FOR  rDatos IN SELECT numerocentro,numemp,* FROM tbEmpleados WHERE numemp != 0  AND enviado = 0 OR enviado = null
		    
	LOOP
                --Texto que se envia para los centros que se reenviara la contraseña  sTextoMemo='Prueba';
              --raise notice 'empleado %', rDatos.numemp;
		SELECT cast(client_addr as char(16)) into  cIpusuario FROM pg_stat_activity WHERE PID = INT4( pg_backend_pid() );
		SELECT substr(cIpusuario, 1, (strpos(cIpusuario, '/')-1)) into cIpusuario;
		--'10.27.82.170' 
		   
                --iFolioCentro := select  from fnpccmincrementarfoliocentro(centro);
               -- select fnpccmincrementarfoliocentro into iFolioCentro from fnpccmincrementarfoliocentro(centro);
                raise notice 'folio centro:%',iFolioCentro;
                
                iFolioMemo = CAST(nextval('cmifoliounico_seq') AS INTEGER  );
                raise notice 'folio:%',iFolioMemo;
                
                INSERT INTO cmimemorandums (foliocentro,empleadoorigen,centroorigen,foliomemorandum,contenidocorreo,ipusuario,claveorigen,des_asuntomemo) VALUES (iFolioCentro,emporigen, centro, iFolioMemo, sTextoMemo,cIpusuario, 80, sAsunto);
                INSERT INTO cmimemorandumsdestino (foliomemorandum,centrodestino,empleadodestino, ipusuario, claveorigen) VALUES (iFolioMemo, rDatos.numerocentro, rDatos.numemp, cIpusuario, 80);

                UPDATE tbEmpleados SET enviado = 1 WHERE numerocentro = rDatos.numerocentro;

                iContador = iContador+1;
                raise notice 'contador%',iContador;
	END LOOP;
RETURN iContador;	
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
--ALTER FUNCTION fun_generamemos_masivos(emporigen integer,centro integer,sAsunto text,sTextoMemo text)
--OWNER TO postgres;


--SELECT fun_generamemos_masivos(97597287,250590,'Felices Fiestas','<p><img src="http://intranet.cln/comunicacion_acciones/EdicionMazatlan2memo.png"/>Si no puedes ver la imagen, ingresa al Correo Micro desde red interna.</p>');


--select * from cmimemorandums
--select * from cmimemorandumsdestino
--select *  from tbEmpleados
--select * from cmifolioscentros

update tbEmpleados
set enviado = 0
where numemp in (97597287,97597288,97597289,97597291,97597293,97597294,97597295,97597292,97597296,97597290,97597297);


truncate table cmimemorandums;
truncate table cmimemorandumsdestino;