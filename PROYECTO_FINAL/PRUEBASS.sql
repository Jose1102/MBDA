--                                Pruebas de aceptación

--              PRIMERA PRUEBA

--- Agente de tránsito

-- Un agente de tránsito encontró a un motorizado comentiendo una infracción en la Carrera 45 en la ciudad de Bogotá, se había pasado un semáforo en rojo.
--esto hizo que el agente de tránsito le registrara una multa para este ciudadano, pidiendole a este todo los papeles respectivos tanto de la moto como personales.
--Se colocó en el registro de la sanción el tipo de multa y en la ciudad en la que el ciudadano infringió las normas.

/* Se adiciona el agente que generó la multa */
EXECUTE PC_AGENTE.adicionarAgente (1,'CE',2513678454,20,'apetraitisj@cafepress.com');
/*Se adiciona el sitio donde se realizó la multa */
EXECUTE PC_AGENTE.adicionarSitio (1,'Cundinamarca','Bogotá','Carrera 45 nqs 30');
/* Se registra la sanción */
EXECUTE PC_SANCIONES.adicionarSancion(1,'M','ART.06',1,1);

SELECT * FROM SANCION;

--              SEGUNDA PRUEBA
-- Ciudadano

-- Un ciudadano se registra en el sistema de la base de datos de la policia nacional de tránsito y transporte para ello va a la oficina de 
-- atención al ciudadano y la agente de atención le realiza el respectivo resgistro de datos, necesitando el nombre del ciudadano, nombre, correo electronico,
-- teléfono y número de identificación

EXECUTE  PC_CIUDADANO.adicionarCiudadano (3997653385,'CE','Ardenia Matelyunas','amatelyunas0@indiatimes.com',3319556435);

--- Ya habiendo sido registrado el ciudadano, el ciudadano registra que tiene un vehículo

EXECUTE PC_AGENTE.adicionarVehiculo ('VYD832','PARTICULAR','Porsche 1998 Blue',1,3997653385);

--- Pasados  4 años se realizaron modificaciones en el vehículo donde el ciudadano pide realizar la modificacion de la descripcion de ese vehículo

EXECUTE PC_AGENTE.modificarVehiculo('VYD832','PARTICULAR','Porsche 1998 RED',1,3997653385);

