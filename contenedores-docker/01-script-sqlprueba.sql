
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


