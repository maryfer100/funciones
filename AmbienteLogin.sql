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

insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597287,'MARIA FERNANDA','MEDINA','CAÑEDO',250590,77,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597288,'MARYFER','MEDINA','CAÑEDO',230399,105,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597289,'FERNANDA','MEDINA','CAÑEDO',230399,100,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597290,'MARIA','MEDINA','CAÑEDO',230390,17,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597291,'MAR FER','MEDINA','CAÑEDO',230399,171,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597292,'MAR','MEDINA','CAÑEDO',250595,77,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597293,'FER','MEDINA','CAÑEDO',230399,77,'',2);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597294,'MAFER','MEDINA','CAÑEDO',230399,171,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597295,'MARI','MEDINA','CAÑEDO',230399,100,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597296,'MARI FE','MEDINA','CAÑEDO',250595,105,'',1);
insert into cmcatalogoempleados (numemp,nombre,apellidopaterno,apellidomaterno,centro,numeropuesto,cancelado,tipoempresa)values(97597297,'MARIAFER','MEDINA','CAÑEDO',230390,17,'',1);


create table cat_derechosutileriacorreomicro
(
	numemp integer,
	passw varchar(10)
)


select * from cat_derechosutileriacorreomicro

insert into cat_derechosutileriacorreomicro (numemp, passw) values(97597287,'holas100');
insert into cat_derechosutileriacorreomicro (numemp, passw) values(97597288,'okta2021');

create table sapcatalogocentros(
	numerocentro integer,
	nombrecentro varchar
)

select numerocentro, nombrecentro from sapcatalogocentros where numerocentro = 250595

insert into sapcatalogocentros (numerocentro, nombrecentro) values(230399,'SOLUCION DE OPERACIONES');
insert into sapcatalogocentros (numerocentro, nombrecentro) values(250595,'COMUNICACION INTERNA');
insert into sapcatalogocentros (numerocentro, nombrecentro) values(230390,'DESARROLLO COS');
insert into sapcatalogocentros (numerocentro, nombrecentro) values(250590,'DBA ATENCION');

select * from sapcatalogocentros

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

CREATE TABLE tbEmpleados(
	numemp  integer,
	nombre	varchar,
	centro	varchar,
	puesto  varchar
)

select * from tbEmpleados

TRUNCATE TABLE tbEmpleados

SELECT * FROM sapcatalogoempleados

SELECT * FROM sapcatalogopuestos


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

CREATE TABLE IF NOT EXISTS sapcatalogopuestos
(
    numeropuesto varchar(3),
    nombre varchar
)


insert into sapcatalogopuestos(numeropuesto,nombre)values('77','PROGRAMADOR');
insert into sapcatalogopuestos(numeropuesto,nombre)values('171','ANALISTA');
insert into sapcatalogopuestos(numeropuesto,nombre)values('100','SCRUM MASTER');
insert into sapcatalogopuestos(numeropuesto,nombre)values('17','ARQUITECTO DE SOFTWARE');
insert into sapcatalogopuestos(numeropuesto,nombre)values('105','LIDER DE PROYECTO');


CREATE TABLE IF NOT EXISTS cmimemorandums (
empleadoorigen INTEGER,
centroorigen INTEGER,
foliomemorandum INTEGER,
contenidocorreo TEXT,
claveorigen INTEGER,
des_asuntomemo TEXT
); 

SELECT * FROM cmimemorandums

CREATE TABLE IF NOT EXISTS cmimemorandumsdestino(
foliomemorandum INTEGER,
centrodestino INTEGER,
empleadodestino INTEGER, 
ipusuario VARCHAR,
claveorigen INTEGER
);

--DROP TABLE cmimemorandumsdestino

SELECT * FROM cmimemorandumsdestino

