-----Consultas-----


SELECT CIUDADANO.NOMBRE,CIUDADANO.NUMEROID,SANCION.TIPO FROM CIUDADANO JOIN TIENE ON CIUDADANO.NUMEROID=TIENE.CIUDADANO JOIN SANCION ON TIENE.SANCION=SANCION.IDSANCION ORDER BY SANCION.TIPO;

SELECT VEHICULO.PLACA,CIUDADANO.NUMEROID,CIUDADANO.NOMBRE FROM CIUDADANO JOIN VEHICULO ON CIUDADANO.NUMEROID=VEHICULO.CIUDADANO;

SELECT CIUDADANO.NOMBRE,CIUDADANO.NUMEROID,SANCION.IDSANCION,SANCION.TIPO,SANCION.ARTICULO,TIENE.FECHASANCION,TIENE.FECHAPAGO FROM CIUDADANO JOIN TIENE ON CIUDADANO.NUMEROID=TIENE.CIUDADANO JOIN SANCION ON TIENE.SANCION=SANCION.IDSANCION ORDER BY SANCION.ARTICULO;

SELECT CIUDADANO.NOMBRE,CIUDADANO.NUMEROID,SANCION.ARTICULO,TIENE.FECHASANCION,TIENE.FECHAPAGO FROM CIUDADANO JOIN TIENE ON CIUDADANO.NUMEROID=TIENE.CIUDADANO JOIN SANCION ON TIENE.SANCION=SANCION.IDSANCION;

SELECT SITIO.CIUDAD,COUNT(SANCION.CIUDAD) FROM SITIO JOIN SANCION ON SITIO.IDSITIO=SANCION.CIUDAD GROUP BY SITIO.CIUDAD;