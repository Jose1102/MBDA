--CRUDE
CREATE OR REPLACE PACKAGE PC_SANCIONES AS
    PROCEDURE adicionarSancion(Xidsancion IN NUMBER, Xtipo IN VARCHAR, Xarticulo IN VARCHAR, Xagente IN NUMBER, Xciudad IN NUMBER);
END;



--CRUDI
CREATE OR REPLACE PACKAGE BODY PC_SANCIONES AS
    PROCEDURE adicionarSancion(Xidsancion IN NUMBER, Xtipo IN VARCHAR, Xarticulo IN VARCHAR, Xagente IN NUMBER, Xciudad IN NUMBER) IS
    BEGIN
        INSERT INTO sancion(idsancion,tipo,articulo,agente,ciudad) VALUES (Xidsancion,Xtipo,Xarticulo,Xagente,Xciudad);
        COMMIT; 
        EXCEPTION
            WHEN OTHERS THEN            
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'No se pudo insertar la sanción');
    END;  
END PC_SANCIONES;

-- XCrud--

DROP PACKAGE PC_SANCIONES;
