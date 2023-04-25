--drop table cmcatalogoempleados
--drop table cat_derechosutileriacorreomicro

create table cmcatalogoempleados
(
	numemp integer,
	nombre varchar(20),
	apellidopaterno varchar(15),
	apellidomaterno varchar(15),
	centro integer,
	numeropuesto smallint,
	cancelado character(1),
	tipoempresa smallint
)

select * from cmcatalogoempleados
select * from stmpsapcatalogopuestos


insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597287,'MARIA FERNANDA','MEDINA','CAÑEDO',250590,77,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597288,'MARYFER','MEDINA','CAÑEDO',230399,171,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597289,'FERNANDA','MEDINA','CAÑEDO',230399,100,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597290,'MARIA','MEDINA','CAÑEDO',230390,17,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597291,'MAR FER','MEDINA','CAÑEDO',230399,171,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597292,'MAR','MEDINA','CAÑEDO',250595,77,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597293,'FER','MEDINA','CAÑEDO',230399,77,'',2);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597294,'MAFER','MEDINA','CAÑEDO',230399,171,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597295,'MARI','MEDINA','CAÑEDO',230399,100,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597296,'MARI FE','MEDINA','CAÑEDO',250595,105,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597297,'MARIAFER','MEDINA','CAÑEDO',230390,17,'',1);

TRUNCATE TABLE cmcatalogoempleados

create table cat_derechosmemocorreomicro
(
	numemp integer,
	passw varchar(4)
)

drop table cat_derechosmemocorreomicro

select * from cat_derechosmemocorreomicro

insert into cat_derechosmemocorreomicro (numemp, passw) values(97597287,'7904');
insert into cat_derechosmemocorreomicro (numemp, passw) values(97597288,'8802');

create table cmcatalogocentros(
	numerocentro integer,
	nombrecentro varchar
)

select numerocentro, nombrecentro from cmcatalogocentros where numerocentro = 250595

insert into cmcatalogocentros (numerocentro, nombrecentro) values(230399,'SOLUCION DE OPERACIONES');
insert into cmcatalogocentros (numerocentro, nombrecentro) values(250595,'COMUNICACION INTERNA');
insert into cmcatalogocentros (numerocentro, nombrecentro) values(230390,'DESARROLLO COS');
insert into cmcatalogocentros (numerocentro, nombrecentro) values(250590,'DBA ATENCION');

select * from cmcatalogocentros
--drop table cmcatalogocentros
-- SEQUENCE: public.cmifoliounico_seq

-- DROP SEQUENCE IF EXISTS public.cmifoliounico_seq;

CREATE SEQUENCE IF NOT EXISTS public.cmifoliounico_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
ALTER SEQUENCE public.cmifoliounico_seq
OWNER TO postgres;
GRANT SELECT ON SEQUENCE public.cmifoliounico_seq TO "97597287";

select * from cmifoliounico_seq

CREATE TABLE tbEmpleados(
	numemp  integer,
	nombre	varchar,
	numerocentro varchar(6),
	centro	varchar,
	puesto  varchar,
	empresa smallint,
	enviado smallint default 0
)

select * from tbEmpleados

--drop TABLE tbEmpleados

SELECT * FROM cmcatalogoempleados 

SELECT * FROM cmcatalogocentros


SELECT * FROM stmp_empleadosmemomasivo

--DROP TABLE IF EXISTS sapcatalogopuestos;

-- Table: public.stmp_empleadosmemomasivo

-- DROP TABLE IF EXISTS public.stmp_empleadosmemomasivo;

CREATE TABLE IF NOT EXISTS stmp_empleadosmemomasivo
(
    numemp integer NOT NULL DEFAULT 0,
    centro integer NOT NULL DEFAULT 0,
    puesto integer NOT NULL DEFAULT 0,
    empresa integer NOT NULL DEFAULT 0
)

CREATE TABLE IF NOT EXISTS stmpsapcatalogopuestos
(
    numero varchar(3),
    nombre character (30)
)

--drop table stmpsapcatalogopuestos  

insert into stmpsapcatalogopuestos(numero,nombre)values('77','PROGRAMADOR');
insert into stmpsapcatalogopuestos(numero,nombre)values('171','ANALISTA');
insert into stmpsapcatalogopuestos(numero,nombre)values('100','SCRUM MASTER');
insert into stmpsapcatalogopuestos(numero,nombre)values('17','ARQUITECTO DE SOFTWARE');
insert into stmpsapcatalogopuestos(numero,nombre)values('105','LIDER DE PROYECTO');


select * from stmpsapcatalogopuestos

-- Table: public.cmimemorandums

-- DROP TABLE IF EXISTS public.cmimemorandums;

CREATE TABLE IF NOT EXISTS public.cmimemorandums
(
    foliocentro integer DEFAULT 0,
    foliomemorandum integer DEFAULT 0,
    fechahoracreacion timestamp without time zone DEFAULT 'now()',
    centroorigen integer DEFAULT 0,
    empleadoorigen integer DEFAULT 0,
    contenidocorreo character varying COLLATE pg_catalog."default" DEFAULT ' '::character varying,
    grupo integer DEFAULT 0,
    personalizado smallint DEFAULT 0,
    anexo smallint DEFAULT 0,
    empleadoingreso integer DEFAULT 0,
    ipusuario character(16) COLLATE pg_catalog."default" DEFAULT ''::bpchar,
    ipservidor character(16) COLLATE pg_catalog."default" DEFAULT ''::bpchar,
    claveorigen integer DEFAULT 0,
    des_asuntomemo character varying(100) COLLATE pg_catalog."default" NOT NULL DEFAULT ''::character varying,
    fol_sa integer NOT NULL DEFAULT 0,
    des_contenidocorreo character varying COLLATE pg_catalog."default" NOT NULL DEFAULT ''::character varying,
    opc_enviarcomocentro character(1) COLLATE pg_catalog."default" DEFAULT ''::bpchar,
    num_centrodeenvio integer
)


SELECT * FROM cmimemorandums

-- DROP TABLE IF EXISTS public.cmimemorandumsdestino;

CREATE TABLE IF NOT EXISTS public.cmimemorandumsdestino
(
    foliomemorandum integer DEFAULT 0,
    centrodestino integer DEFAULT 0,
    fechahoralectura timestamp without time zone DEFAULT '1980-01-01 00:00:00'::timestamp without time zone,
    fechahoraimpresion timestamp without time zone DEFAULT '1980-01-01 00:00:00'::timestamp without time zone,
    flaglectura smallint DEFAULT 0,
    flagimpresion smallint DEFAULT 0,
    empleadodestino integer DEFAULT 0,
    flagborrado smallint DEFAULT 0,
    puestoempleadodestino character(3) COLLATE pg_catalog."default",
    ipusuario character(16) COLLATE pg_catalog."default" DEFAULT ''::bpchar,
    ipservidor character(16) COLLATE pg_catalog."default" DEFAULT ''::bpchar,
    claveorigen integer DEFAULT 0,
    fechahoracreacion timestamp without time zone DEFAULT 'now()'
)


--DROP TABLE cmimemorandumsdestino

SELECT * FROM cmimemorandumsdestino

-- FUNCTION: public.fnpccmincrementarfoliocentro(integer)

-- DROP FUNCTION IF EXISTS public.fnpccmincrementarfoliocentro(integer);

CREATE OR REPLACE FUNCTION public.fnpccmincrementarfoliocentro(integer)
    RETURNS integer
    LANGUAGE 'sql'
    COST 100
    --VOLATILE PARALLEL UNSAFE
    DECLARE
	iCentro ALIAS FOR $1;
AS $BODY$
RAISE NOTICE 'FOLIO%',$1;
    UPDATE cmifolioscentros SET folio = folio+1 WHERE centro = $1;
    
    SELECT folio FROM cmifolioscentros WHERE centro = $1 FOR UPDATE;
$BODY$;


select * from fnpccmincrementarfoliocentro(230590)
 nFolioCentro = select * from fnpccmincrementarfoliocentro(230590);

 select fnpccmincrementarfoliocentro as nFolioCentro from fnpccmincrementarfoliocentro(230590);

-- Table: cmifolioscentros

-- DROP TABLE cmifolioscentros;

CREATE TABLE cmifolioscentros
(
  centro integer DEFAULT 0,
  folio integer DEFAULT 0
)
WITH (
  OIDS=FALSE
);
--ALTER TABLE cmifolioscentros
 -- OWNER TO '97597287';

 select * from cmifolioscentros
 
 insert into cmifolioscentros (centro,folio) values (13204,1); 
 insert into cmifolioscentros (centro,folio) values (26504,2); 
 insert into cmifolioscentros (centro,folio) values (327101,2);  
 insert into cmifolioscentros (centro,folio) values (58704,4); 
 insert into cmifolioscentros (centro,folio) values (230399,801);  
 insert into cmifolioscentros (centro,folio) values (230590,100); 
 insert into cmifolioscentros (centro,folio) values (250595,99);

