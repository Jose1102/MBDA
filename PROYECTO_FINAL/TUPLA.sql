 ----------CICLO 1: Tupla
/* La fecha de sanci�n debe ser menor a la fecha de pago*/
ALTER TABLE TIENE ADD CONSTRAINT CHK_FECHAS CHECK (FECHASANCION < FECHAPAGO);