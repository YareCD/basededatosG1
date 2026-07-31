
CREATE DATABASE universidad;
GO

USE universidad;
GO

-- TABLA DEPARTAMENTO
CREATE TABLE departamento (
    numdepa INT NOT NULL IDENTITY(1,1),
    edificio VARCHAR(20) NOT NULL,
    nombredepa VARCHAR(30) NOT NULL,

    CONSTRAINT pk_departamento
    PRIMARY KEY (numdepa)
);
GO

-- TABLA PROFESOR
CREATE TABLE profesor (
    numprof INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(20) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20) NOT NULL,
    numdepa INT NULL,

    CONSTRAINT pk_profesor
    PRIMARY KEY (numprof),
    CONSTRAINT fk_profesor_departamento
    FOREIGN KEY (numdepa)
    REFERENCES departamento (numdepa)
);
GO

-- TABLA MATERIA
CREATE TABLE materia (
    clavemateria CHAR(6) NOT NULL,
    creditos INT NOT NULL
    CONSTRAINT ck_materia_creditos
    CHECK (creditos > 0),
    nombremateria VARCHAR(40) NOT NULL,
    numprof INT NULL,

    CONSTRAINT pk_materia
    PRIMARY KEY (clavemateria),
    CONSTRAINT fk_materia_profesor
    FOREIGN KEY (numprof)
    REFERENCES profesor (numprof)
);
GO

-- TABLA ALUMNO
CREATE TABLE alumno (
    idalumno INT NOT NULL IDENTITY(1,1),
    matricula CHAR(8) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20) NOT NULL,
    fechanaci DATE NOT NULL,

    CONSTRAINT pk_alumno
    PRIMARY KEY (idalumno),
    CONSTRAINT uq_alumno_matricula
    UNIQUE (matricula)
);
GO

-- TABLA PROYECTO
CREATE TABLE proyecto (
    numprov INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(40) NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL
    CONSTRAINT ck_proyecto_presupuesto
    CHECK (presupuesto > 0),

    CONSTRAINT pk_proyecto
    PRIMARY KEY (numprov)
);
GO

-- TABLA TELEFONO (ENTIDAD DEBIL)
CREATE TABLE telefono (
    clavetel INT NOT NULL,
    matricula CHAR(8) NOT NULL,
    telefono VARCHAR(15) NOT NULL,

    CONSTRAINT pk_telefono
    PRIMARY KEY (matricula, clavetel),
    CONSTRAINT fk_telefono_alumno
    FOREIGN KEY (matricula)
    REFERENCES alumno (matricula)
);
GO

-- TABLA CREDENCIAL 
CREATE TABLE credencial (
    numcredencial INT NOT NULL IDENTITY(1,1),
    fechainscripcion DATETIME2 NOT NULL
    CONSTRAINT df_credencial_fechainscripcion
    DEFAULT SYSDATETIME(),
    vigencia DATE NOT NULL,
    matricula CHAR(8) NOT NULL,

    CONSTRAINT pk_credencial
    PRIMARY KEY (numcredencial),
    CONSTRAINT uq_credencial_matricula
    UNIQUE (matricula),
    CONSTRAINT fk_credencial_alumno
    FOREIGN KEY (matricula)
    REFERENCES alumno (matricula)
);
GO

-- TABLA DEPENDIENTE (entidad debil)
CREATE TABLE dependiente (
    numprof INT NOT NULL,
    nombredep VARCHAR(30) NOT NULL,
    fechanaci DATE NOT NULL,
    parentesco VARCHAR(20) NOT NULL,

    CONSTRAINT pk_dependiente
    PRIMARY KEY (numprof, nombredep),
    CONSTRAINT fk_dependiente_profesor
    FOREIGN KEY (numprof)
    REFERENCES profesor (numprof)
);
GO

-- TABLA CURSA (alumno cursa materia)
CREATE TABLE cursa (
    clavemateria CHAR(6) NOT NULL,
    matricula CHAR(8) NOT NULL,
    calificafin DECIMAL(4,2) NULL
    CONSTRAINT ck_cursa_calificafin
    CHECK (calificafin BETWEEN 0 AND 10),
    fechainscrip DATETIME2 NOT NULL
    CONSTRAINT df_cursa_fechainscrip
    DEFAULT SYSDATETIME(),

    CONSTRAINT pk_cursa
    PRIMARY KEY (clavemateria, matricula),
    CONSTRAINT fk_cursa_materia
    FOREIGN KEY (clavemateria)
    REFERENCES materia (clavemateria),
    CONSTRAINT fk_cursa_alumno
    FOREIGN KEY (matricula)
    REFERENCES alumno (matricula)
);
GO

-- TABLA PARTICIPA 
CREATE TABLE participa (
    numprof INT NOT NULL,
    numprov INT NOT NULL,
    rol VARCHAR(30) NOT NULL,
    fechainicio DATETIME2 NOT NULL
    CONSTRAINT df_participa_fechainicio
    DEFAULT SYSDATETIME(),

    CONSTRAINT pk_participa
    PRIMARY KEY (numprof, numprov),
    CONSTRAINT fk_participa_profesor
    FOREIGN KEY (numprof)
    REFERENCES profesor (numprof),
    CONSTRAINT fk_participa_proyecto
    FOREIGN KEY (numprov)
    REFERENCES proyecto (numprov)
);
GO