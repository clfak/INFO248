CREATE DATABASE lagj;

USE lagj;

CREATE TABLE usuario(
rutusuario VARCHAR(9) NOT NULL,
nombreusuario VARCHAR(20) NOT NULL,
apellidousuario VARCHAR(20),
email VARCHAR(30) NOT NULL,
contraseña VARCHAR(10) NOT NULL,
tipo BOOLEAN,
PRIMARY KEY (rut));

CREATE TABLE receptor(
rutdestinatario VARCHAR(9) NOT NULL,
nombredestinatario VARCHAR(20) NOT NULL,
apellidodestinatario VARCHAR(20), 
fechaentrega DATETIME NOT NULL,
observacion VARCHAR(50),
PRIMARY KEY(rutdestinatario));


-- REVISAR ORDEN. no toma clave foranea
CREATE TABLE orden(
idorden INT NOT NULL,
estado BOOLEAN,
fechallegada DATETIME NOT NULL,
nombrecalle VARCHAR(20),
numerocalle INT,
ciudad VARCHAR(20) NOT NULL,
detalleorden VARCHAR(50),
PRIMARY KEY (idorden));
-- FOREIGN KEY (rutdestinatario) REFERENCES receptor(rutdestinatario));

CREATE TABLE transporte(
listadoorden INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(listadoorden));
-- FOREIGN KEY (idorden) REFERENCES orden(idorden));

CREATE TABLE historialorden(
cartolaorden INT NOT NULL AUTO_INCREMENT,
fechainiciood DATETIME NOT NULL,
fechafin DATETIME NOT NULL,
PRIMARY KEY(cartolaorden),
FOREIGN KEY (listadoorden) REFERENCES transporte(listadoorden));

CREATE TABLE evento(
idevento INT NOT NULL AUTO_INCREMENT,
hora DATETIME NOT NULL,
fechaevento DATETIME NOT NULL,
detalleevento VARCHAR(50),
lugar VARCHAR(30),
PRIMARY KEY(idevento));

CREATE TABLE recordatorio(
listadoevento INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(listadoevento),
FOREIGN KEY (idevento) REFERENCES evento(idevento));

CREATE TABLE historialevento(
cartolaev INT NOT NULL AUTO_INCREMENT,
fechainicioev DATETIME NOT NULL,
fechafinev DATETIME NOT NULL,
PRIMARY KEY(cartolaev),
FOREIGN KEY (listadoevento) REFERENCES recordatorio(listadoevento));

CREATE TABLE monto(
idmonto INT NOT NULL AUTO_INCREMENT,
valor INT NOT NULL,
detallemonto VARCHAR(50),
fechamonto DATETIME,
PRIMARY KEY(idmonto));

CREATE TABLE ingreso(
listadoingreso INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(listadoingreso),
FOREIGN KEY (idmonto) REFERENCES monto(idmonto));

CREATE TABLE egreso(
listadoegreso INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(listadoegreso),
FOREIGN KEY (idmonto) REFERENCES monto(idmonto));

CREATE TABLE factura(
listadofactura INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(listadofactura),
FOREIGN KEY (idmonto) REFERENCES monto(idmonto));

CREATE TABLE historialingreso(
cartolaingreso INT NOT NULL AUTO_INCREMENT,
fechainicioingr DATETIME NOT NULL,
fechafiningr DATETIME NOT NULL,
PRIMARY KEY(cartolaingreso),
FOREIGN KEY (listadoingreso) REFERENCES ingreso(listadoingreso));

CREATE TABLE historialegreso(
cartolaegreso INT NOT NULL AUTO_INCREMENT,
fechainicioegr DATETIME NOT NULL,
fechafinegr DATETIME NOT NULL,
PRIMARY KEY(cartolaegreso),
FOREIGN KEY (listadoegreso) REFERENCES egreso(listadoegreso));

CREATE TABLE historialfactura(
cartolafactura INT NOT NULL AUTO_INCREMENT,
fechainiciofact DATETIME NOT NULL,
fechafinfact DATETIME NOT NULL,
PRIMARY KEY(cartolafactura),
FOREIGN KEY (listadofactura) REFERENCES factura(listadofactura));

CREATE TABLE pagos(
acumingreso INT NOT NULL,
acumegreso INT NOT NULL,
acumfactura INT NOT NULL,
FOREIGN KEY (listadoingreso) REFERENCES ingreso(listadoingreso),
FOREIGN KEY (listadoegreso) REFERENCES egreso(listadoegreso),
FOREIGN KEY (listadofactura) REFERENCES factura(listadofactura));