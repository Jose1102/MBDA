--------CICLO 1--------
/* CREACI?N DE TABLAS SIN RESTRICCIONES- */
CREATE TABLE VEHICULO(
PLACA VARCHAR(6) NOT NULL,
TIPOVEHICULO VARCHAR(20) NOT NULL,
DESCRIPCION VARCHAR(30) NOT NULL,
AGENTE NUMBER(20) NOT NULL,
CIUDADANO NUMBER(20) NOT NULL
);

CREATE TABLE AGENTETRANSITO(
IDAGENTE NUMBER(20) NOT NULL,
IDENTIFICACION VARCHAR(2) NOT NULL,
NIDENTIFICACION NUMBER(10) NOT NULL,
CUADRANTE NUMBER(6) NOT NULL,
CORREO VARCHAR(50) NOT NULL
);

CREATE TABLE CIUDADANO(
NUMEROID NUMBER(20) NOT NULL,
IDENTIFICACION VARCHAR(2) NOT NULL,
NOMBRE VARCHAR(50) NOT NULL,
CORREO VARCHAR(50) NOT NULL,
TELEFONO VARCHAR(10)
);

CREATE TABLE SANCION(
IDSANCION NUMBER(20) NOT NULL,
TIPO VARCHAR(1) NOT NULL,
ARTICULO VARCHAR(60) NOT NULL,
AGENTE NUMBER(20) NOT NULL,
CIUDAD NUMBER(20) NOT NULL
);


CREATE TABLE TIENE(
SANCION NUMBER(20) NOT NULL,
CIUDADANO NUMBER(20) NOT NULL,
FECHASANCION DATE NOT NULL,
FECHAPAGO DATE,
VALOR NUMBER(10) NOT NULL  
);


CREATE TABLE SITIO(
IDSITIO NUMBER(20) NOT NULL,
DEPARTAMENTO VARCHAR(20) NOT NULL,
CIUDAD VARCHAR(20) NOT NULL,
DIRECCION VARCHAR(20) NOT NULL
);
