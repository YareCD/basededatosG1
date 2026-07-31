-- crear base de datos
 CREATE DATABASE hospital;

 -- usar la base de datos
 USE hospital;
 GO

 -- crear tabla paciente

 CREATE TABLE paciente(
	paciente_id INT NOT NULL,
	nombre VARCHAR(40) NOT NULL,
	apellido_1 VARCHAR(20) NOT NULL,
	apellido_2 VARCHAR(20),
	fecha_naci DATE NOT NULL,

	CONSTRAINT pk_paciente
	PRIMARY KEY (paciente_id)
 );
 GO

 -- tabla expediente

 CREATE TABLE expediente(
	expediente_id INT NOT NULL,
	fecha_apertura DATE NOT NULL,
	tipo_sangre CHAR(3) NOT NULL,
	paciente_id INT NOT NULL,

	CONSTRAINT pk_expediente
	PRIMARY KEY (expediente_id),
	CONSTRAINT fk_expediente_paciente
	FOREIGN KEY (paciente_id)
	REFERENCES paciente(paciente_id)
 );
 GO