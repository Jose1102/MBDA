--------CICLO 1--------
/* CREACI�N DE TABLAS SIN RESTRICCIONES- */
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
FECHA DATE NOT NULL,
PAGO NUMBER(10) NOT NULL  
);


CREATE TABLE SITIO(
IDSITIO NUMBER(20) NOT NULL,
DEPARTAMENTO VARCHAR(20) NOT NULL,
CIUDAD VARCHAR(20) NOT NULL,
DIRECCION VARCHAR(20) NOT NULL
);

------------------PK---------------

ALTER TABLE VEHICULO ADD CONSTRAINT PK_VEHICULO PRIMARY KEY(PLACA);
ALTER TABLE AGENTETRANSITO ADD CONSTRAINT PK_AGENTETRANSITO PRIMARY KEY(IDAGENTE);
ALTER TABLE CIUDADANO ADD CONSTRAINT PK_CIUDADANO PRIMARY KEY(NUMEROID);
ALTER TABLE SANCION ADD CONSTRAINT PK_SANCION PRIMARY KEY(IDSANCION);
ALTER TABLE TIENE ADD CONSTRAINT PK_TIENE PRIMARY KEY(SANCION,CIUDADANO);
ALTER TABLE SITIO ADD CONSTRAINT PK_SITIO PRIMARY KEY(IDSITIO);

------------------FK---------------

ALTER TABLE VEHICULO ADD CONSTRAINT FK_VEHICULO_AGENTETRANSITO FOREIGN KEY(AGENTE) REFERENCES AGENTETRANSITO(IDAGENTE) ;
ALTER TABLE VEHICULO ADD CONSTRAINT FK_VEHICULO_CIUDADANO FOREIGN KEY(CIUDADANO) REFERENCES CIUDADANO(NUMEROID) ;

ALTER TABLE SANCION ADD CONSTRAINT FK_SANCION_AGENTETRANSITO FOREIGN KEY(AGENTE) REFERENCES AGENTETRANSITO(IDAGENTE) ;
ALTER TABLE SANCION ADD CONSTRAINT FK_SANCION_SITIO FOREIGN KEY(CIUDAD) REFERENCES SITIO(IDSITIO);

ALTER TABLE TIENE ADD CONSTRAINT FK_TIENE_SANCION FOREIGN KEY(SANCION) REFERENCES SANCION(IDSANCION);
ALTER TABLE TIENE ADD CONSTRAINT FK_TIENE_CIUDADANO FOREIGN KEY(CIUDADANO) REFERENCES CIUDADANO(NUMEROID);


------------------UK---------------

ALTER TABLE CIUDADANO ADD CONSTRAINT UK_CIUDADANO UNIQUE(TELEFONO);

----------CICLO 1: Atributos
ALTER TABLE AGENTETRANSITO MODIFY(CORREO CHECK(CORREO LIKE '%@%.%'));
ALTER TABLE AGENTETRANSITO MODIFY(IDENTIFICACION CHECK(IDENTIFICACION='CC' OR IDENTIFICACION='CE'));
ALTER TABLE CIUDADANO MODIFY(CORREO CHECK(CORREO LIKE '%@%.%'));
ALTER TABLE CIUDADANO MODIFY(IDENTIFICACION CHECK(IDENTIFICACION='CC' OR IDENTIFICACION='CE'));
ALTER TABLE CIUDADANO MODIFY(TELEFONO CHECK(TELEFONO LIKE'3%'));
ALTER TABLE SANCION MODIFY(TIPO CHECK(TIPO='A' OR TIPO='M' OR TIPO='I' OR TIPO='S' OR TIPO='R' OR TIPO='C'));
ALTER TABLE VEHICULO MODIFY(TIPOVEHICULO CHECK(TIPOVEHICULO='GRUA' OR TIPOVEHICULO='REVISI�N' OR TIPOVEHICULO='CAPACITACI�N' OR TIPOVEHICULO='RESCATE' OR TIPOVEHICULO='PATRULLA' OR TIPOVEHICULO='MOTOCICLETA' OR TIPOVEHICULO='PARTICULAR' OR TIPOVEHICULO='CARGA' OR TIPOVEHICULO='PASAJEROS'));
ALTER TABLE VEHICULO MODIFY(TIPOVEHICULO CHECK(REGEXP_LIKE(TIPOVEHICULO,'^([A-Z0-9]*)$')AND UPPER(TIPOVEHICULO)=TIPOVEHICULO));

------------------------POBLARNOOK-------------------------------------------

/*
 *Se est� insertando una identificaci�n incorrecta
 */
 
INSERT INTO AGENTETRANSITO VALUES(1,'TI',1012554,'Cuadrante1','zara@hotmail.com');
/*
 *Se est� insertando un correo incorrecto
 */
 
INSERT INTO AGENTETRANSITO VALUES(1,'CE',1012447022,'Cuadrante2','santihotmail.com');
 
/*
 *Se est� insertando un telefono que no empieza por 3
 */
 
INSERT INTO CIUDADANO VALUES(1,'CE','Jennifer Sandoval','jenn222@gmail.com','4567890321');

/*
 *Se est� insertando un correo incorrecto
 */
 
INSERT INTO CIUDADANO VALUES(2,'CC','Cristina Diaz','cristina@gmailcom','3214567890');

/*
 *Se est� insertando una identificaci�n incorrecta
 */
 
INSERT INTO CIUDADANO VALUES(3,'NIT','Felipe Diaz','felipe234@gmail.com','3216543217');

DESC AGENTETRANSITO;

------------------------POBLAROK-------------------------------------------

INSERT INTO AGENTETRANSITO VALUES(4,'CE',101244702,1,'santi@hotmail.com');
INSERT INTO CIUDADANO VALUES(1,'CE','Jennifer Sandoval','jenn222@gmail.com',null);
INSERT INTO CIUDADANO VALUES(2,'CC','Cristina Diaz','cristina@gmail.com','3214567890');
INSERT INTO CIUDADANO VALUES(3,'CC','Felipe Diaz','felipe234@gmail.com','3216543217');

SELECT * FROM AGENTETRANSITO;

DESC CIUDADANO;

--------POBLANDO-----------


INSERT INTO AGENTETRANSITO VALUES(1,'CE',5567501056,1,'cbasinigazzi0@yolasite.com');
INSERT INTO AGENTETRANSITO VALUES(2,'CE',5350506987,2,'nroxbee1@intel.com');
INSERT INTO AGENTETRANSITO VALUES(3,'CC',5048107089,3,'jdurston2@cdbaby.com');
INSERT INTO AGENTETRANSITO VALUES(4,'CE',4799163118,4,'bbielby3@senate.gov');
INSERT INTO AGENTETRANSITO VALUES(5,'CE',4057420949,5,'fpettko4@istockphoto.com');
INSERT INTO AGENTETRANSITO VALUES(6,'CC',8444615995,6,'wpearne5@stanford.edu');
INSERT INTO AGENTETRANSITO VALUES(7,'CC',5108133939,7,'rloody6@telegraph.co.uk');
INSERT INTO AGENTETRANSITO VALUES(8,'CC',2838465045,8,'tmcclurg7@sakura.ne.jp');
INSERT INTO AGENTETRANSITO VALUES(9,'CE',0986576600,9,'gmetzel8@cloudflare.com');
INSERT INTO AGENTETRANSITO VALUES(10,'CE',4155122974,10,'gkoppel9@google.com.br');
INSERT INTO AGENTETRANSITO VALUES(11,'CE',6056212352,11,'jcrocia@illinois.edu');
INSERT INTO AGENTETRANSITO VALUES(12,'CC',2034926987,12,'jdavauxb@bizjournals.com');
INSERT INTO AGENTETRANSITO VALUES(13,'CC',9844561604,13,'cmchirriec@upenn.edu');
INSERT INTO AGENTETRANSITO VALUES(14,'CE',6140713827,14,'lchristescud@soundcloud.com');
INSERT INTO AGENTETRANSITO VALUES(15,'CC',3778765973,15,'fjimee@dell.com');
INSERT INTO AGENTETRANSITO VALUES(16,'CE',4276941565,16,'jdolemanf@rakuten.co.jp');
INSERT INTO AGENTETRANSITO VALUES(17,'CC',5781476494,17,'bquineyg@amazon.co.jp');
INSERT INTO AGENTETRANSITO VALUES(18,'CE',4096394519,18,'klantiffh@eepurl.com');
INSERT INTO AGENTETRANSITO VALUES(19,'CE',0752634983,19,'fmcclarencei@bbc.co.uk');
INSERT INTO AGENTETRANSITO VALUES(20,'CE',2513678454,20,'apetraitisj@cafepress.com');


INSERT INTO CIUDADANO VALUES(3997653385,'CE','Ardenia Matelyunas','amatelyunas0@indiatimes.com',3319556435);
INSERT INTO CIUDADANO VALUES(6399594244,'CC','Penelopa Tamas','ptamas1@walmart.com',3593730541);
INSERT INTO CIUDADANO VALUES(5350037666,'CE','Tabatha Raftery','traftery2@istockphoto.com',3729549818);
INSERT INTO CIUDADANO VALUES(4513108631,'CC','Otha Pembridge','opembridge3@ow.ly',3257523098);
INSERT INTO CIUDADANO VALUES(9593391050,'CC','Sherwood Whale','swhale4@youtu.be',3368314144);
INSERT INTO CIUDADANO VALUES(9398876501,'CC','Claiborn Chatt','cchatt5@deviantart.com',3742225796);
INSERT INTO CIUDADANO VALUES(1024817936,'CC','Orsa Cassidy','ocassidy6@aol.com',3933054302);
INSERT INTO CIUDADANO VALUES(6888656427,'CE','Kakalina Espinay','kespinay7@shop-pro.jp',3847590930);
INSERT INTO CIUDADANO VALUES(6567734270,'CC','Wenda Burbudge','wburbudge8@ow.ly',3932344492);
INSERT INTO CIUDADANO VALUES(2988905034,'CC','Colman Groveham','cgroveham9@examiner.com',3779415565);
INSERT INTO CIUDADANO VALUES(6086046400,'CE','Shoshana Leahey','sleaheya@topsy.com',3292718443);
INSERT INTO CIUDADANO VALUES(1129935380,'CE','Carolyne Mannin','cmanninb@marketwatch.com',3162218474);
INSERT INTO CIUDADANO VALUES(6511959139,'CC','Mayor Suarez','msuarezc@exblog.jp',3769973764);
INSERT INTO CIUDADANO VALUES(7655296485,'CC','Maddie Rowson','mrowsond@accuweather.com',3025466168);
INSERT INTO CIUDADANO VALUES(0461409332,'CE','Darbie McCree','dmccreee@buzzfeed.com',3847222501);
INSERT INTO CIUDADANO VALUES(6612033965,'CC','Jeddy Malimoe','jmalimoef@upenn.edu',3467672735);
INSERT INTO CIUDADANO VALUES(0991388830,'CC','Arnold Kahane','akahaneg@deliciousdays.com',3239176961);
INSERT INTO CIUDADANO VALUES(8345489412,'CC','Kristine Stienton','kstientonh@studiopress.com',3242584573);
INSERT INTO CIUDADANO VALUES(9687114949,'CE','Latashia Swedeland','lswedelandi@washingtonpost.com',3301983718);
INSERT INTO CIUDADANO VALUES(9453430086,'CE','Herbert Challiner','hchallinerj@amazon.co.jp',3393658595);



INSERT INTO VEHICULO VALUES('VYD832','PARTICULAR','Porsche 1998 Blue',1,3997653385);
INSERT INTO VEHICULO VALUES('DWF142','CARGA','Pontiac 1964 Turquoise',2,6399594244);
INSERT INTO VEHICULO VALUES('DEF241','PARTICULAR','Buick 1991 Maroon',3,5350037666);
INSERT INTO VEHICULO VALUES('BTS355','GRUA','Mitsubishi 2004 Indigo',4,4513108631);
INSERT INTO VEHICULO VALUES('GRS123','REVISI�N','Chevrolet 1995 Goldenrod',5,9593391050);
INSERT INTO VEHICULO VALUES('TTS512','PATRULLA','Dodge 1984 Green',6,9398876501);
INSERT INTO VEHICULO VALUES('RGS411','PARTICULAR','Chevrolet 2011 Blue',7,1024817936);
INSERT INTO VEHICULO VALUES('GRS547','PATRULLA','Mazda 1995 Maroon',8,6888656427);
INSERT INTO VEHICULO VALUES('JKY864','PATRULLA','Lotus 1986 Turquoise',9,6567734270);
INSERT INTO VEHICULO VALUES('UJF973','PATRULLA','Mazda 2003 Fuscia',10,2988905034);
INSERT INTO VEHICULO VALUES('DEX732','CARGA','Hyundai 2011 Orange',11,6086046400);
INSERT INTO VEHICULO VALUES('FVD683','CAPACITACI�N','Mercury 1999 Goldenrod',12,1129935380);
INSERT INTO VEHICULO VALUES('XWE584','PASAJEROS','Chevrolet 2002 Khaki',13,6511959139);
INSERT INTO VEHICULO VALUES('XQW513','CAPACITACI�N','Audi 1990 Indigo',14,7655296485);
INSERT INTO VEHICULO VALUES('XQX327','CARGA','Honda 2007 Puce',15,0461409332);
INSERT INTO VEHICULO VALUES('WFK135','PASAJEROS','Volkswagen 1985 Red',16,6612033965);
INSERT INTO VEHICULO VALUES('RFA164','CAPACITACI�N','Dodge 2007 Goldenrod',17,0991388830);
INSERT INTO VEHICULO VALUES('ACR235','MOTOCICLETA','Jaguar 2011 Aquamarine',18,8345489412);
INSERT INTO VEHICULO VALUES('AEG351','PATRULLA','Volkswagen 2003 Blue',19,9687114949);
INSERT INTO VEHICULO VALUES('AWG642','CARGA','Toyota 2009 Mauv',20,9453430086);

DESC SITIO;

INSERT INTO SITIO VALUES(1,'Erie','Pennsylvania','2821 Pine View Hill');
INSERT INTO SITIO VALUES(2,'Chattanooga','Tennessee','740 Kim Trail');
INSERT INTO SITIO VALUES(3,'Topeka','Kansas','49907 Sauthoff Lane');
INSERT INTO SITIO VALUES(4,'Alhambra','California','9 Brickson ParkPlaza');
INSERT INTO SITIO VALUES(5,'Brockton','Massachusetts','8 Starling Place');
INSERT INTO SITIO VALUES(6,'Lakeland','Florida','7683 Pierstorff Pass');
INSERT INTO SITIO VALUES(7,'Minneapolis','Minnesota','40 Fordem Alley');
INSERT INTO SITIO VALUES(8,'Orlando','Florida','89 Monterey Junction');
INSERT INTO SITIO VALUES(9,'Hialeah','Florida','1 Linden Park');
INSERT INTO SITIO VALUES(10,'Tampa','Florida','0 Daystar Hill');
INSERT INTO SITIO VALUES(11,'Philadelphia','Pennsylvania','Riverside Circle');
INSERT INTO SITIO VALUES(12,'Houston','Texas','231 Lakewood Garden');
INSERT INTO SITIO VALUES(13,'Buffalo','New York','159 GolfParkway');
INSERT INTO SITIO VALUES(14,'Nashville','Tennessee','9 Rowland Street');
INSERT INTO SITIO VALUES(15,'Fort Worth','Texas','600 1st Plaza');
INSERT INTO SITIO VALUES(16,'Cincinnati','Ohio','6580 Junction');
INSERT INTO SITIO VALUES(17,'Bellevue','Washington','56 Portage Place');
INSERT INTO SITIO VALUES(18,'Washington','District of Columbia','87030 Eagan Point');
INSERT INTO SITIO VALUES(19,'Montgomery','Alabama','8497 Morrow Parkway');
INSERT INTO SITIO VALUES(20,'Dallas','Texas','506 Roxbury Park');

DESC SANCION;

INSERT INTO SANCION VALUES(1,'A','ART.03',1,1);
INSERT INTO SANCION VALUES(2,'S','ART.45',2,2);
INSERT INTO SANCION VALUES(3,'S','ART.74',3,3);
INSERT INTO SANCION VALUES(4,'M','ART.24',4,4);
INSERT INTO SANCION VALUES(5,'C','ART.78',5,5);
INSERT INTO SANCION VALUES(6,'R','ART.77',6,6);
INSERT INTO SANCION VALUES(7,'S','ART.48',7,7);
INSERT INTO SANCION VALUES(8,'I','ART.20',8,8);
INSERT INTO SANCION VALUES(9,'R','ART.38',9,9);
INSERT INTO SANCION VALUES(10,'M','ART.63',10,10);
INSERT INTO SANCION VALUES(11,'A','ART.50',11,11);
INSERT INTO SANCION VALUES(12,'A','ART.33',12,12);
INSERT INTO SANCION VALUES(13,'C','ART.97',13,13);
INSERT INTO SANCION VALUES(14,'C','ART.51',14,14);
INSERT INTO SANCION VALUES(15,'C','ART.76',15,15);
INSERT INTO SANCION VALUES(16,'C','ART.34',16,16);
INSERT INTO SANCION VALUES(17,'R','ART.70',17,17);
INSERT INTO SANCION VALUES(18,'C','ART.75',18,18);
INSERT INTO SANCION VALUES(19,'R','ART.39',19,19);
INSERT INTO SANCION VALUES(20,'I','ART.62',20,20);


INSERT INTO TIENE VALUES(1,3997653385,TO_DATE('11/18/2007','mm,dd,yyyy'),3694366);
INSERT INTO TIENE VALUES(2,6399594244,TO_DATE('03/22/2013','mm,dd,yyyy'),3044278);
INSERT INTO TIENE VALUES(3,5350037666,TO_DATE('11/19/2005','mm,dd,yyyy'),5755206);
INSERT INTO TIENE VALUES(4,4513108631,TO_DATE('06/24/2012','mm,dd,yyyy'),9996714);
INSERT INTO TIENE VALUES(5,9593391050,TO_DATE('02/09/2008','mm,dd,yyyy'),349620);
INSERT INTO TIENE VALUES(6,9398876501,TO_DATE('08/18/2006','mm,dd,yyyy'),852922);
INSERT INTO TIENE VALUES(7,1024817936,TO_DATE('01/10/2014','mm,dd,yyyy'),3325938);
INSERT INTO TIENE VALUES(8,6888656427,TO_DATE('05/11/2017','mm,dd,yyyy'),8996272);
INSERT INTO TIENE VALUES(9,6567734270,TO_DATE('05/18/2015','mm,dd,yyyy'),7487532);
INSERT INTO TIENE VALUES(10,2988905034,TO_DATE('10/17/2011','mm,dd,yyyy'),6843745);
INSERT INTO TIENE VALUES(11,6086046400,TO_DATE('04/29/2007','mm,dd,yyyy'),4084128);
INSERT INTO TIENE VALUES(12,6511959139,TO_DATE('08/18/2011','mm,dd,yyyy'),7269132);
INSERT INTO TIENE VALUES(13,1129935380,TO_DATE('08/14/2004','mm,dd,yyyy'),7059204);
INSERT INTO TIENE VALUES(14,7655296485,TO_DATE('12/21/2004','mm,dd,yyyy'),9603962);
INSERT INTO TIENE VALUES(15,0461409332,TO_DATE('09/05/2005','mm,dd,yyyy'),9698859);
INSERT INTO TIENE VALUES(16,6612033965,TO_DATE('02/04/2013','mm,dd,yyyy'),2314866);
INSERT INTO TIENE VALUES(17,0991388830,TO_DATE('08/07/2016','mm,dd,yyyy'),5536847);
INSERT INTO TIENE VALUES(18,8345489412,TO_DATE('07/28/2001','mm,dd,yyyy'),9830844);
INSERT INTO TIENE VALUES(19,9687114949,TO_DATE('08/05/2017','mm,dd,yyyy'),3844016);
INSERT INTO TIENE VALUES(20,9453430086,TO_DATE('04/18/2003','mm,dd,yyyy'),827037);



-----Consultas-----


SELECT CIUDADANO.NOMBRE,CIUDADANO.NUMEROID,SANCION.TIPO FROM CIUDADANO JOIN TIENE ON CIUDADANO.NUMEROID=TIENE.CIUDADANO JOIN SANCION ON TIENE.SANCION=SANCION.IDSANCION ORDER BY SANCION.TIPO;

SELECT VEHICULO.PLACA,CIUDADANO.NUMEROID,CIUDADANO.NOMBRE FROM CIUDADANO JOIN VEHICULO ON CIUDADANO.NUMEROID=VEHICULO.CIUDADANO;

SELECT CIUDADANO.NOMBRE,CIUDADANO.NUMEROID,SANCION.IDSANCION,SANCION.TIPO,SANCION.ARTICULO,TIENE.FECHA FROM CIUDADANO JOIN TIENE ON CIUDADANO.NUMEROID=TIENE.CIUDADANO JOIN SANCION ON TIENE.SANCION=SANCION.IDSANCION ORDER BY SANCION.ARTICULO;

SELECT CIUDADANO.NOMBRE,CIUDADANO.NUMEROID,SANCION.ARTICULO,TIENE.FECHA,TIENE.PAGO FROM CIUDADANO JOIN TIENE ON CIUDADANO.NUMEROID=TIENE.CIUDADANO JOIN SANCION ON TIENE.SANCION=SANCION.IDSANCION;

SELECT SITIO.CIUDAD,COUNT(SANCION.CIUDAD) FROM SITIO JOIN SANCION ON SITIO.IDSITIO=SANCION.CIUDAD GROUP BY SITIO.CIUDAD;
---------CICLO 1: XPoblar(Eliminar los datos)

DELETE FROM VEHICULO;
DELETE FROM TIENE;
DELETE FROM CIUDADANO;
DELETE FROM SANCION;
DELETE FROM AGENTETRANSITO;
DELETE FROM SITIO;

------XTABLAS-------

DROP TABLE VEHICULO;
DROP TABLE TIENE;
DROP TABLE SANCION;
DROP TABLE SITIO;
DROP TABLE CIUDADANO;
DROP TABLE AGENTETRANSITO;
----------Disparadores------------
CREATE OR REPLACE TRIGGER ID_AGENTE
BEFORE INSERT ON AGENTETRANSITO
FOR EACH ROW
DECLARE
    consec NUMBER;
BEGIN
    SELECT (MAX(IDAGENTE)) INTO consec FROM AGENTETRANSITO;
    IF consec IS NULL THEN
        :NEW.IDAGENTE := 1;
    ELSE
        :NEW.IDAGENTE := consec+1;
    END IF;
END;
/*Disparador OK*/
INSERT INTO AGENTETRANSITO VALUES(NULL,'CC',1030384590,1,'MBDA@GMAIL.COM');
INSERT INTO AGENTETRANSITO VALUES(NULL,'CC',1050876345,1,'BASES@GMAIL.COM');


CREATE OR REPLACE TRIGGER ID_SANCION
BEFORE INSERT ON SANCION
FOR EACH ROW
DECLARE
    consec NUMBER;
BEGIN
    SELECT (MAX(IDSANCION)) INTO consec FROM SANCION;
    IF consec IS NULL THEN
        :NEW.IDSANCION := 1;
    ELSE
        :NEW.IDSANCION := consec+1;
    END IF;
END;
/*Disparador OK*/
INSERT INTO SANCION VALUES(NULL,'A',24,1,'BOGOT�');


CREATE OR REPLACE TRIGGER ID_SITIO
BEFORE INSERT ON SITIO
FOR EACH ROW
DECLARE
    consec NUMBER;
BEGIN
    SELECT (MAX(IDSITIO)) INTO consec FROM SITIO;
    IF consec IS NULL THEN
        :NEW.IDSITIO := 1;
    ELSE
        :NEW.IDSITIO := consec+1;
    END IF;
END;
/*Disparador OK*/
INSERT INTO SITIO VALUES(NULL,'CUNDINAMARCA','BOGOT�','CALLE 200');

CREATE OR REPLACE TRIGGER CIUDADANO_TEL
AFTER INSERT ON CIUDADANO
FOR EACH ROW
BEGIN
     
     IF :NEW.TELEFONO IS NULL THEN
        UPDATE CIUDADANO SET TELEFONO='NO TIENE'; 
    END IF;
END;
/*DISPARADOR OK*/
INSERT INTO CIUDADANO VALUES(1090876456,'CC','FELIPE','FERRARI@GMAIL.COM',NULL);
/*DISPARADOR NOOK*/
INSERT INTO CIUDADANO VALUES(1090876456,'CC','FELIPE','FERRARI@GMAIL.COM',3116723465);

CREATE OR REPLACE TRIGGER ELI_SANCION
BEFORE DELETE ON SANCION
FOR EACH ROW
BEGIN 
    raise_application_error(-20007,'No se pueden eliminar las sanciones');
END;
/*DISPARADOR OK*/
DELETE SANCION;

CREATE OR REPLACE TRIGGER ELI_CIUDADANO
BEFORE DELETE ON CIUDADANO
FOR EACH ROW
BEGIN 
    raise_application_error(-20007,'No se pueden eliminar los ciudadanos');
END;
/*DISPARADOR OK*/
DELETE CIUDADANO;

CREATE OR REPLACE TRIGGER FECHA_SANCION
BEFORE INSERT ON TIENE
FOR EACH ROW
BEGIN
    :NEW.FECHA :=SYSDATE;
END;
/*DISPARADOR OK*/
INSERT INTO SANCION VALUES(1,1040987450,NULL,30000);