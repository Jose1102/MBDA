--                                Pruebas de aceptaci�n

--              PRIMERA PRUEBA

--- Agente de tr�nsito

-- Un agente de tr�nsito encontr� a un motorizado comentiendo una infracci�n en la Carrera 45 en la ciudad de Bogot�, se hab�a pasado un sem�foro en rojo.
--esto hizo que el agente de tr�nsito le registrara una multa para este ciudadano, pidiendole a este todo los papeles respectivos tanto de la moto como personales.
--Se coloc� en el registro de la sanci�n el tipo de multa y en la ciudad en la que el ciudadano infringi� las normas.

/* Se adiciona el agente que gener� la multa */
EXECUTE PC_AGENTE.adicionarAgente (1,'CE',2513678454,20,'apetraitisj@cafepress.com');
/*Se adiciona el sitio donde se realiz� la multa */
EXECUTE PC_AGENTE.adicionarSitio (1,'Cundinamarca','Bogot�','Carrera 45 nqs 30');
/* Se registra la sanci�n */
EXECUTE PC_SANCIONES.adicionarSancion(1,'M','ART.06',1,1);

SELECT * FROM SANCION;

--              SEGUNDA PRUEBA
-- Ciudadano

-- Un ciudadano se registra en el sistema de la base de datos de la policia nacional de tr�nsito y transporte para ello va a la oficina de 
-- atenci�n al ciudadano y la agente de atenci�n le realiza el respectivo resgistro de datos, necesitando el nombre del ciudadano, nombre, correo electronico,
-- tel�fono y n�mero de identificaci�n

EXECUTE  PC_CIUDADANO.adicionarCiudadano (3997653385,'CE','Ardenia Matelyunas','amatelyunas0@indiatimes.com',3319556435);

--- Ya habiendo sido registrado el ciudadano, el ciudadano registra que tiene un veh�culo

EXECUTE PC_AGENTE.adicionarVehiculo ('VYD832','PARTICULAR','Porsche 1998 Blue',1,3997653385);

--- Pasados  4 a�os se realizaron modificaciones en el veh�culo donde el ciudadano pide realizar la modificacion de la descripcion de ese veh�culo

EXECUTE PC_AGENTE.modificarVehiculo('VYD832','PARTICULAR','Porsche 1998 RED',1,3997653385);

