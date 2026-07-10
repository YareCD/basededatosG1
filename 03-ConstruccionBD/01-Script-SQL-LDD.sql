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
drop table categoria;

-- Restriccion check
-- Restriccion default
-- Restriccion de Foreign key

CREATE TABLE producto(
	producto_id INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL UNIQUE,
	precio DECIMAL(10,2)
);
GO
drop table categoria;

-- Restriccion check
-- Primera forma de construcción

CREATE TABLE producto (
	producto_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL UNIQUE,
	precio DECIMAL(10,2) NOT NULL CHECK(precio>0.0),
	existencia INT NOT NULL CHECK(existencia>0 AND existencia <=100),
	activo BIT NOT NULL DEFAULT 1
);
GO

INSERT INTO producto 
VALUES ('Pitufo',450,98,DEFAULT);

INSERT INTO producto 
VALUES ('Quemadito',12,89,DEFAULT);

INSERT INTO producto (nombre, existencia, precio)
VALUES ('Pantera rosa',76,123);

TRUNCATE TABLE producto;

SELECT * FROM producto;
GO
DROP TABLE producto;
-- Segunda forma de construccion (Restricciones por columna)

CREATE TABLE producto(
	producto_id INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_producto
	PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL
	CONSTRAINT uq_producto_nombre
	UNIQUE,
	precio DECIMAL (10,2) NOT NULL
	CONSTRAINT ck_producto_precio
	CHECK(precio>0.0),
	existencia INT NOT NULL
	CONSTRAINT ck_producto_existencia
	CHECK(existencia BETWEEN 1 AND 100),
	tipo CHAR(1)NOT NULL
	CONSTRAINT ck_producto_tipo
	CHECK(tipo= 'R' OR tipo = 'P'),
	activo BIT NOT NULL
	CONSTRAINT df_producto_activo
	DEFAULT 1
);
GO

-- Tercera forma de Construcción (al final de las instrucciones)

CREATE TABLE producto(
	producto_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL,
	precio DECIMAL (10,2) NOT NULL,
	existencia INT NOT NULL,
	tipo CHAR(1)NOT NULL,
	activo BIT NOT NULL
	CONSTRAINT df_producto_activo
	DEFAULT 1, -- EL default siempre va en columna

	CONSTRAINT pk_producto
	PRIMARY KEY (producto_id),
	CONSTRAINT uq_producto_nombre
	UNIQUE (nombre),
	CONSTRAINT ck_producto_precio
	CHECK (precio>0.0),
	CONSTRAINT ck_producto_existencia
	CHECK(existencia BETWEEN 1 AND 100),
	CONSTRAINT ck_producto_tipo
	CHECK(tipo IN ('R','P'))
);
GO

INSERT INTO producto 
VALUES ('Pitufo',450,98,DEFAULT);

-- Creacion de la empresa_yoda

CREATE DATABASE empresa_yoda;
GO
USE empresa_yoda;
GO

CREATE TABLE categoria (
	categoria_id INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id),
	nombre VARCHAR (20) NOT NULL
	CONSTRAINT uq_categoria_nombre
	UNIQUE,
	activo BIT NOT NULL
	CONSTRAINT df_categoria_activo
	DEFAULT 1

);
GO

CREATE TABLE producto(
	producto_id INT NOT NULL,
	fabricante_id CHAR(3) NOT NULL,
	nombre VARCHAR(25) NOT NULL,
	existencia INT NOT NULL,
	precio NUMERIC(10,2) NOT NULL,
	activo BIT NOT NULL
	CONSTRAINT df_producto_activo
	DEFAULT 1,
	categoria_id INT NOT NULL,

	CONSTRAINT pk_producto
	PRIMARY KEY (producto_id, fabricante_id), -- Llave compuesta
	CONSTRAINT uq_producto_nombre
	UNIQUE(nombre),
	CONSTRAINT ck_producto_existencia
	CHECK (existencia > 0),
	CONSTRAINT ck_producto_precio
	CHECK (precio BETWEEN 1 AND 10000),
	CONSTRAINT fk_producto_categoria
	FOREIGN KEY (categoria_id)
	REFERENCES categoria (categoria_id)
);
GO

INSERT INTO categoria (nombre)
VALUES ('Front end'),
('Back end'),
('Cloud');

SELECT * FROM categoria;

INSERT INTO producto
VALUES (1, 'ff1','tailmind',987.34, 45, DEFAULT, 1);

INSERT INTO producto
VALUES (2, 'ff1','boostrap',567.8, 24, 0, 1);

INSERT INTO producto
VALUES (1, 'ff2','aws', 34.5, 12, DEFAULT, 3)

SELECT * FROM producto;

CREATE TABLE proveedor (
	proveedor_id INT NOT NULL
	CONSTRAINT pk_proveedor_id
	PRIMARY KEY,
	empresa VARCHAR(30) NOT NULL,
	direccion VARCHAR (60),
	limite_credito DECIMAL (10,2) NOT NULL
);
GO


CREATE TABLE contacto_proveedor(
	contacto_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno vARCHAR(15) NOT NULL,
	apellido_materno vARCHAR(15),
	telefono VARCHAR(15) NOT NULL,
	proveedor_id INT
	CONSTRAINT pk_contracto_proveedor
	PRIMARY KEY (contacto_id),
	CONSTRAINT fk_contacto_proveedor
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor (proveedor_id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
GO

drop table contacto_proveedor;

INSERT INTO proveedor 
VALUES (1,'patito de hule', null, 67888.01),
(2,'bimbo', null, 67888.01),
(3,'Drugs Kevin', null, 67888.01);

INSERT INTO contacto_proveedor
VALUES (1,'Laura', 'no esta', 'comiendo', '1212323',1);

TRUNCATE TABLE contacto_proveedor;
TRUNCATE TABLE proveedor;

SELECT * FROM proveedor;
SELECT * FROM contacto_proveedor;

DELETE FROM proveedor
WHERE proveedor_id = 2;

UPDATE proveedor SET proveedor_id = 10
WHERE proveedor_id = 2;

DROP TABLE contacto_proveedor;
DROP TABLE proveedor;

--Integridad referencial ON DELETE, ON UPDATE y SET NULL

CREATE TABLE proveedor (
	proveedor_id INT NOT NULL
	CONSTRAINT pk_proveedor_id
	PRIMARY KEY,
	empresa VARCHAR(30) NOT NULL,
	direccion VARCHAR (60),
	limite_credito DECIMAL (10,2) NOT NULL
);
GO


CREATE TABLE contacto_proveedor(
	contacto_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno vARCHAR(15) NOT NULL,
	apellido_materno vARCHAR(15),
	telefono VARCHAR(15) NOT NULL,
	proveedor_id INT
	CONSTRAINT pk_contracto_proveedor
	PRIMARY KEY (contacto_id),
	CONSTRAINT fk_contacto_proveedor
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor (proveedor_id)
	ON DELETE SET NULL
	ON UPDATE SET NULL
);
GO

INSERT INTO proveedor 
VALUES (1,'patito de hule', null, 67888.01),
(2,'bimbo', null, 67888.01),
(3,'Drugs Kevin', null, 67888.01);

INSERT INTO contacto_proveedor
VALUES ('Laura', 'no esta', 'comiendo', '1212323',1),
	('Paquito', 'Bimbuñuelo', 'Perez', '1212323',2),
	('Soyla', 'Ponzoña', 'Audi', '1212323',1);

SELECT * 
FROM proveedor AS p
INNER JOIN contacto_proveedor AS cp
ON p.proveedor_id = cp.proveedor_id;

DELETE FROM proveedor 
WHERE proveedor_id = 2;

SELECT * FROM proveedor;
SELECT * FROM contacto_proveedor;


DROP TABLE contacto_proveedor;
DROP TABLE proveedor;


-- Integridad referencial ON DELETE y ON UPDATE SET DEFAULT

CREATE TABLE proveedor (
	proveedor_id INT NOT NULL
	CONSTRAINT pk_proveedor_id
	PRIMARY KEY,
	empresa VARCHAR(30) NOT NULL,
	direccion VARCHAR (60),
	limite_credito DECIMAL (10,2) NOT NULL
);
GO


CREATE TABLE contacto_proveedor(
	contacto_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno vARCHAR(15) NOT NULL,
	apellido_materno vARCHAR(15),
	telefono VARCHAR(15) NOT NULL,
	proveedor_id INT
	CONSTRAINT df_contacto_proveeedor_proveedor_id
	DEFAULT 0,
	CONSTRAINT pk_contracto_proveedor
	PRIMARY KEY (contacto_id),
	CONSTRAINT fk_contacto_proveedor
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor (proveedor_id)
	ON DELETE SET DEFAULT
	ON UPDATE SET DEFAULT
);
GO

INSERT INTO proveedor 
VALUES (1,'patito de hule', null, 67888.01),
(2,'bimbo', null, 67888.01),
(3,'Drugs Kevin', null, 67888.01),
(0,'TodasMias','Engañifas', 666.69);

INSERT INTO contacto_proveedor
VALUES ('Laura', 'no esta', 'comiendo', '1212323',1),
	('Paquito', 'Bimbuñuelo', 'Perez', '1212323',2),
	('Soyla', 'Ponzoña', 'Audi', '1212323',2);

SELECT * FROM proveedor;
SELECT * FROM contacto_proveedor;

DELETE proveedor 
WHERE proveedor_id = 2;

UPDATE contacto_proveedor
SET proveedor_id = 1
WHERE proveedor_id = 0;

-- TO DO, realizar ejercicio completo de construccion de un diagrama relacional 
-- aplicando las restricciones y se continua con alter y drop