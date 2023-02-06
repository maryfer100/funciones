CREATE OR REPLACE FUNCTION fun_generamemos_masivos_cinepolis()
  RETURNS integer AS
$BODY$

	DECLARE
	sTextoMemo text;
	sInsert text;
        iFolioMemo integer;
	rDatos record;
	iContador integer;
	
BEGIN


	sInsert='';
	sTextoMemo='';
        iFolioMemo =0;
        iContador = 0;


                                                           
	FOR  rDatos IN SELECT numcentro,numempl FROM tmpclimaencuestasrecordatorio WHERE numempl != 0  AND enviado = 0
	    
	LOOP
                
 --Texto que se envia para los centros que se reenviara la contraseña 
 sTextoMemo=
'
Prueba
';
                iContador = iContador+1;
     
                iFolioMemo= CAST(nextval('cmifoliounico_seq') AS INTEGER  );
               
                INSERT INTO cmimemorandums (empleadoorigen,centroorigen,foliomemorandum,contenidocorreo,claveorigen,des_asuntomemo) VALUES (91094998,230511,iFolioMemo, sTextoMemo, 80,'prueba');
                INSERT INTO cmimemorandumsdestino (foliomemorandum,centrodestino,empleadodestino, ipusuario, claveorigen) VALUES (iFolioMemo, rDatos.numcentro, rDatos.numempl, '10.27.82.170', 80);

                UPDATE tmpclimaencuestasrecordatorio SET enviado = 1 WHERE numcentro=rDatos.numcentro;


	END LOOP;
RETURN iContador;	
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION fun_generamemos_masivos_cinepolis()
 -- OWNER TO syscorreomicroprog;
