/* Construccion de base de datos 
con SQL--LDD (CREATE, ALTER, DROP)*/

-- Crear una base de datos
CREATE DATABASE empresa_patito;
GO

-- Utilizar la bse de datos

USE empresa_patito;
GO

-- Crear tabla 
CREATE TABLE alumno(
	alumno_id INT,
	nombre VARCHAR(30),
	apellido_paterno VARCHAR(20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(25)
);
GO

INSERT INTO alumno
VALUES(1,'Martin','Edwards','Park','2008-03-20','martinillo@gmail.com');
GO
INSERT INTO alumno
VALUES(1,'Y','C','D','2007-05-28','yare@yare.com');
GO

DROP TABLE alumno;

-- 2 
CREATE TABLE alumno(
	alumno_id INT PRIMARY KEY,
	nombre VARCHAR(30),
	apellido_paterno VARCHAR(20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(25)
);
GO

INSERT INTO alumno
VALUES(1,'Martin','Edwards','Park','2008-03-20','martinillo@gmail.com');
GO
INSERT INTO alumno
VALUES(1,'Y','C','D','2007-05-28','yare@yare.com');
GO

DROP TABLE alumno;

-- 3 

CREATE TABLE alumno(
	alumno_id INT NOT NULL
	CONSTRAINT pk_alumno
	PRIMARY KEY (alumno_id),
	nombre VARCHAR(30),
	apellido_paterno VARCHAR(20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(25)
);
GO

INSERT INTO alumno
VALUES(1,'Martin','Edwards','Park','2008-03-20','martinillo@gmail.com');
GO
INSERT INTO alumno
VALUES(1,'Y','C','D','2007-05-28','yare@yare.com');
GO

DROP TABLE alumno;

-- 4

CREATE TABLE alumno(
	alumno_id INT NOT NULL,
	nombre VARCHAR(30),
	apellido_paterno VARCHAR(20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(25),
	CONSTRAINT pk_alumno
	PRIMARY KEY(alumno_id)
);
GO

-- PRIMARY kEY con IDENTITY

CREATE TABLE categoria(
categoria_id INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(25) NOT NULL UNIQUE,
activo bit NOT NULL
);
GO

INSERT INTO categoria
VALUES ('carnes frias',1);
INSERT INTO categoria
VALUES ('carnes frias',1);

SELECT * FROM categoria;
drop table categoria;

CREATE TABLE categoria(
categoria_id INT IDENTITY(1,1),
nombre VARCHAR(25) NOT NULL UNIQUE,
activo bit NOT NULL

CONSTRAINT pk_categoria
PRIMARY KEY(categoria_id)
);
GO

drop table categoria;


CREATE TABLE categoria(
categoria_id INT IDENTITY(1,1),
nombre VARCHAR(25) NOT NULL UNIQUE,
activo bit NOT NULL

CONSTRAINT uq_categoria_nombre
UNIQUE,
CONSTRAINT pk_categoria
PRIMARY KEY(categoria_id)
);
GO