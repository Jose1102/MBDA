----ROLES----

CREATE ROLE AGENTEDETRANSITO;
CREATE ROLE CIUDADANO;

/*Establece los roles en los paquetes */ 
GRANT EXECUTE ON PC_AGENTE TO AGENTEDETRANSITO;
GRANT EXECUTE ON PC_CIUDADANO TO CIUDADANO;

/*Estableciendo los paquetes a cada rol*/

GRANT AGENTEDETRANSITO TO BD2141951;
GRANT AGENTEDETRANSITO TO BD2141142;

GRANT CIUDADANO TO BD2141951;
GRANT CIUDADANO TO BD2141142;


----XSeguridad

REVOKE EXECUTE ON PC_AGENTE FROM AGENTEDETRANSITO;
REVOKE EXECUTE ON PC_CIUDADANO FROM CIUDADANO;


DROP ROLE AGENTEDETRANSITO;
DROP ROLE CIUDADANO;