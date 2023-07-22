--DROP FUNCTION fun_cargaempleados(empleado integer)

CREATE OR REPLACE FUNCTION fun_cargaempleados(empleado integer)
  RETURNS integer AS
$BODY$

	DECLARE
	valor integer;
	
			
BEGIN  
	truncate table tbEmpleadosExcel;
        valor = 0;
        IF NOT EXISTS (SELECT * FROM tbEmpleadosExcel WHERE NUMEMP = empleado) THEN
		INSERT INTO tbEmpleadosExcel (numemp) VALUES(empleado);
		valor = 1;
        END IF;
        RETURN valor;
       	
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
--ALTER FUNCTION fun_generamemos_masivos(emporigen integer,centro integer,sAsunto text,sTextoMemo text)
--OWNER TO postgres;

--select * from tbEmpleadosExcel
--truncate table tbEmpleadosExcel
--truncate table tbEmpleados
--select fun_cargaempleados as valor from fun_cargaempleados(97597287);

