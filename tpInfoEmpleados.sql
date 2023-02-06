--DROP TYPE tpInfoEmpleados;

CREATE TYPE tpInfoEmpleados AS
(   numemp      	INTEGER,
    nombre      	VARCHAR(60),
    centro		VARCHAR(100),
    puesto    		VARCHAR(30)
);

