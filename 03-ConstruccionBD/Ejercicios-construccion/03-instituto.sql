-- crear base de datos

CREATE DATABASE instituto;

-- usar la base de datos

USE instituto;

-- tabla alumno

CREATE TABLE alumno(
	alumno_id INT NOT NULL IDENTITY(1,1),
	matricula VARCHAR(10) NOT NULL
	CONSTRAINT uq_alumno_matricula
	UNIQUE,
	nombre VARCHAR(40) NOT NULL,
	apelllido1 VARCHAR(20) NOT NULL,
	apellido2 VARCHAR(20),
	semestre VARCHAR(10) NOT NULL,

	CONSTRAINT pk_alumno
	PRIMARY KEY (alumno_id)

);
GO

-- tabla materia
CREATE TABLE materia (
	materia_id INT NOT NULL,
	nombre VARCHAR(30) NOT NULL 
	CONSTRAINT uq_materia_nombre
	UNIQUE,
	creditos INT NOT NULL,

	CONSTRAINT pk_materia
	PRIMARY KEY (materia_id),
	CONSTRAINT ck_materia_credito
	CHECK (creditos > 0)
);
GO

-- tabla inscribe

CREATE TABLE inscribe (
    alumno_id INT NOT NULL,
    materia_id INT NOT NULL,
    fecha_inicio DATETIME2 NOT NULL
    CONSTRAINT df_inscribe_fecha_inicio
    DEFAULT SYSDATETIME(),
    calificacion_final DECIMAL(10,2) NOT NULL,

    CONSTRAINT pk_inscribe
    PRIMARY KEY (alumno_id, materia_id),

    CONSTRAINT fk_inscribe_alumno
    FOREIGN KEY (alumno_id)
    REFERENCES alumno(alumno_id),
    CONSTRAINT fk_inscribe_materia
    FOREIGN KEY (materia_id)
    REFERENCES materia(materia_id),

    CONSTRAINT ck_inscribe_calificacion
    CHECK (calificacion_final BETWEEN 0.00 AND 10.00)
);
GO