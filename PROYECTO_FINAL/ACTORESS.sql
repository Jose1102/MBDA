--ACTORESE
CREATE OR REPLACE PACKAGE PC_AGENTE AS
    PROCEDURE adicionarAgente(Xidagente IN NUMBER, Xidentificacion IN VARCHAR, Xnidentificacion IN NUMBER, Xcuadrante IN NUMBER, Xcorreo IN VARCHAR);
    PROCEDURE adicionarSitio(Xidsitio IN NUMBER, Xdepartamento IN VARCHAR, Xciudad IN VARCHAR, Xdireccion IN VARCHAR);
    PROCEDURE adicionarVehiculo(Xplaca IN VARCHAR, Xtipovehiculo IN VARCHAR, Xdescripcion IN VARCHAR, Xagente IN NUMBER,Xciudadano IN NUMBER);
    PROCEDURE modificarVehiculo(Xplaca IN VARCHAR, Xtipovehiculo IN VARCHAR, Xdescripcion IN VARCHAR, Xagente IN NUMBER, Xciudadano IN NUMBER);
    FUNCTION consultarSanciones RETURN SYS_REFCURSOR;
    FUNCTION consultarPropiedad RETURN SYS_REFCURSOR;
END;

CREATE OR REPLACE PACKAGE PC_CIUDADANO AS
    PROCEDURE adicionarCiudadano(Xnumeroid IN NUMBER, Xidentificacion IN VARCHAR, Xnombre IN VARCHAR, Xcorreo IN VARCHAR, Xtelefono IN VARCHAR);
    PROCEDURE modificarVehiculo(Xplaca IN VARCHAR, Xtipovehiculo IN VARCHAR, Xdescripcion IN VARCHAR, Xagente IN NUMBER, Xciudadano IN NUMBER);
    FUNCTION consultarSancionesCiudadano RETURN SYS_REFCURSOR;
    FUNCTION consultarPrecioSancion RETURN SYS_REFCURSOR;
    FUNCTION consultarSitioSancion RETURN SYS_REFCURSOR;
END;

-- ACTORESI

CREATE OR REPLACE PACKAGE BODY PC_AGENTE AS
    PROCEDURE adicionarAgente(Xidagente IN NUMBER, Xidentificacion IN VARCHAR, Xnidentificacion IN NUMBER, Xcuadrante IN NUMBER, Xcorreo IN VARCHAR) IS
    BEGIN
        INSERT INTO AGENTETRANSITO (idagente,identificacion,nidentificacion,cuadrante,correo) VALUES (Xidagente,Xidentificacion,Xnidentificacion,Xcuadrante,Xcorreo);
        COMMIT; 
        EXCEPTION
            WHEN OTHERS THEN            
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'No se pudo insertar el agente');
    END;
    PROCEDURE adicionarVehiculo(Xplaca IN VARCHAR, Xtipovehiculo IN VARCHAR, Xdescripcion IN VARCHAR, Xagente IN NUMBER,Xciudadano IN NUMBER) IS
    BEGIN
        INSERT INTO VEHICULO (placa,tipovehiculo,descripcion,agente,ciudadano) VALUES (Xplaca,Xtipovehiculo,Xdescripcion,Xagente,Xciudadano);
        COMMIT; 
        EXCEPTION
            WHEN OTHERS THEN            
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'No se pudo insertar el vehiculo');
    END;
    PROCEDURE adicionarSitio(Xidsitio IN NUMBER, Xdepartamento IN VARCHAR, Xciudad IN VARCHAR, Xdireccion IN VARCHAR) IS
    BEGIN
        INSERT INTO SITIO (idsitio,departamento,ciudad,direccion) VALUES (Xidsitio,Xdepartamento,Xciudad,Xdireccion);
        COMMIT; 
        EXCEPTION
            WHEN OTHERS THEN            
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'No se pudo insertar el s');
    END;
    PROCEDURE modificarVehiculo(Xplaca IN VARCHAR, Xtipovehiculo IN VARCHAR, Xdescripcion IN VARCHAR, Xagente IN NUMBER, Xciudadano IN NUMBER) IS
    BEGIN 
        UPDATE VEHICULO SET agente = Xagente WHERE placa = Xplaca;
        UPDATE VEHICULO SET descripcion = Xdescripcion WHERE placa = Xplaca;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'No se pudo modificar el vehículo');
    END;
    FUNCTION consultarSanciones RETURN SYS_REFCURSOR IS CO_sanciones SYS_REFCURSOR;
    BEGIN
    OPEN CO_sanciones FOR
        SELECT CIUDADANO.NOMBRE,CIUDADANO.NUMEROID,SANCION.TIPO FROM CIUDADANO JOIN TIENE ON CIUDADANO.NUMEROID=TIENE.CIUDADANO JOIN SANCION ON TIENE.SANCION=SANCION.IDSANCION ORDER BY SANCION.TIPO;
    RETURN CO_sanciones;
    END;
    FUNCTION consultarPropiedad RETURN SYS_REFCURSOR IS CO_propiedad SYS_REFCURSOR;
    BEGIN
    OPEN CO_propiedad FOR
        SELECT VEHICULO.PLACA,CIUDADANO.NUMEROID,CIUDADANO.NOMBRE FROM CIUDADANO JOIN VEHICULO ON CIUDADANO.NUMEROID=VEHICULO.CIUDADANO;
    RETURN CO_propiedad;
    END;
END PC_AGENTE;

CREATE OR REPLACE PACKAGE BODY PC_CIUDADANO AS
    PROCEDURE adicionarCiudadano(Xnumeroid IN NUMBER, Xidentificacion IN VARCHAR, Xnombre IN VARCHAR, Xcorreo IN VARCHAR, Xtelefono IN VARCHAR) IS
    BEGIN
        INSERT INTO CIUDADANO (numeroid,identificacion,nombre,correo,telefono) VALUES (Xnumeroid,Xidentificacion,Xnombre,Xcorreo,Xtelefono);
        COMMIT; 
        EXCEPTION
            WHEN OTHERS THEN            
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'No se pudo insertar el ciudadano');
    END;
    PROCEDURE modificarVehiculo(Xplaca IN VARCHAR, Xtipovehiculo IN VARCHAR, Xdescripcion IN VARCHAR, Xagente IN NUMBER, Xciudadano IN NUMBER) IS
    BEGIN 
        UPDATE VEHICULO SET ciudadano = Xciudadano WHERE placa = Xplaca;
        UPDATE VEHICULO SET descripcion = Xdescripcion WHERE placa = Xplaca;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'No se pudo modificar el vehículo');
    END;
    FUNCTION consultarSancionesCiudadano RETURN SYS_REFCURSOR IS CO_SancionesCiudadano SYS_REFCURSOR;
    BEGIN
    OPEN CO_SancionesCiudadano FOR
        SELECT CIUDADANO.NOMBRE,CIUDADANO.NUMEROID,SANCION.IDSANCION,SANCION.TIPO,SANCION.ARTICULO,TIENE.FECHASANCION,TIENE.FECHAPAGO FROM CIUDADANO JOIN TIENE ON CIUDADANO.NUMEROID=TIENE.CIUDADANO JOIN SANCION ON TIENE.SANCION=SANCION.IDSANCION ORDER BY SANCION.ARTICULO;
    RETURN CO_SancionesCiudadano;
    END;
    FUNCTION consultarPrecioSancion RETURN SYS_REFCURSOR IS CO_PrecioSancion SYS_REFCURSOR;
    BEGIN
    OPEN CO_PrecioSancion FOR
        SELECT CIUDADANO.NOMBRE,CIUDADANO.NUMEROID,SANCION.ARTICULO,TIENE.FECHASANCION,TIENE.FECHAPAGO FROM CIUDADANO JOIN TIENE ON CIUDADANO.NUMEROID=TIENE.CIUDADANO JOIN SANCION ON TIENE.SANCION=SANCION.IDSANCION;
    RETURN CO_PrecioSancion;
    END;
    FUNCTION consultarSitioSancion RETURN SYS_REFCURSOR IS CO_SitioSancion SYS_REFCURSOR;
    BEGIN
    OPEN CO_SitioSancion FOR
        SELECT SITIO.CIUDAD,COUNT(SANCION.CIUDAD) FROM SITIO JOIN SANCION ON SITIO.IDSITIO=SANCION.CIUDAD GROUP BY SITIO.CIUDAD;
    RETURN CO_SitioSancion;
    END;
END PC_CIUDADANO;

---XActores---


DROP PACKAGE PC_AGENTE;
DROP PACKAGE PC_CIUDADANO;