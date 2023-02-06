--DROP FUNCTION fun_generamemos_masivos(emporigen integer,centro integer,sAsunto text,sTextoMemo text)

CREATE OR REPLACE FUNCTION fun_generamemos_masivos(emporigen integer,centro integer,sAsunto text,sTextoMemo text)
  RETURNS integer AS
$BODY$

	DECLARE
	iFolioMemo integer;
	rDatos record;
	iContador integer;
	
BEGIN

        iFolioMemo =0;
        iContador = 0;

                                                           
	FOR  rDatos IN SELECT numcentro,numemp FROM tbEmpleados WHERE numemp != 0  AND enviado = 0
	    
	LOOP
                --Texto que se envia para los centros que se reenviara la contraseña  sTextoMemo='Prueba';
                 
                iFolioMemo= CAST(nextval('cmifoliounico_seq') AS INTEGER  );
               
                INSERT INTO cmimemorandums (empleadoorigen,centroorigen,foliomemorandum,contenidocorreo,claveorigen,des_asuntomemo) VALUES (emporigen, centro, iFolioMemo, sTextoMemo, 80,sAsunto);
                INSERT INTO cmimemorandumsdestino (foliomemorandum,centrodestino,empleadodestino, ipusuario, claveorigen) VALUES (iFolioMemo, rDatos.numcentro, rDatos.numemp, '10.27.82.170', 80);

                UPDATE tbEmpleados SET enviado = 1 WHERE numcentro = rDatos.numcentro;

                 iContador = iContador+1;
	END LOOP;
RETURN iContador;	
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION fun_generamemos_masivos(emporigen integer,centro integer,sAsunto text,sTextoMemo text)
OWNER TO postgres;


--SELECT fun_generamemos_masivos(97597287,250590,'Felices Fiestas','<p><img src="http://intranet.cln/comunicacion_acciones/EdicionMazatlan2memo.png"/>Si no puedes ver la imagen, ingresa al Correo Micro desde red interna.')


--select * from cmimemorandums
--select * from cmimemorandumsdestino