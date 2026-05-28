
-- Crear base de datos pruebag1

-- Permite crear una base de datos (SQL-LDD)

CREATE DATABASE prueba1;

--Utilizar la base de datos
USE prueba1;

-- Crear una tabla (SQL-LDD)

CREATE TABLE alumno (
id int NOT NULL,
nombre VARCHAR (20) NOT NULL,
edad INT NOT NULL,
matricula INT NOT NULL, 
direccion VARCHAR(30) NULL,

CONSTRAINT pk_alumno
PRIMARY KEY (id),
CONSTRAINT unique_matricula
UNIQUE (matricula)
);

-- AGREGAR DOS ALUMNOS ()

INSERT INTO alumno (id, nombre, edad , matricula, direccion)
VALUES (1, 'ARCADIA', 65, 1234567, 'Calle del infierno'),
	   (2, 'A', 19, 12334566, 'aaaaaa');
	   
-- Seleccionar los alumnos 

SELECT * 
FROM alumno;

-- Cambiar el nombre de ARCADIA a MONICO

UPDATE alumno
SET nombre = 'MONICO'
WHERE id = 1; 




CREATE DATABASE pruebaAtributos;

CREATE TABLE alumno(
	num_alumno INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	apellido_1 VARCHAR(30) NOT NULL,
	apellido_2 VARCHAR(30) NULL,
	fecha_naci DATE NOT NULL);
	
	INSERT INTO alumno 
	VALUES (1, 'Angel Patricio','Perez','Hernandez','1998-09-08');
	INSERT INTO alumno 
	VALUES (2, 'Ian Uriel','Rizo',NULL,'2007-07-25');
	
	SELECT * FROM alumno;
	
	SELECT nombre, apellido_1,apellido_2, 
		YEAR(fecha_naci),
		MONTH(fecha_naci), 
		DAY(fecha_naci),
		(DATEDIFF(year, fecha_naci, GETDATE())) AS edad
	FROM alumno;