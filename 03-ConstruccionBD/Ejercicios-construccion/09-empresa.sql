CREATE DATABASE empresa;
GO

USE empresa;
GO

-- TABLA PUESTO
CREATE TABLE puesto (
    puesto_id INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(30) NOT NULL,
    nivel_jerarquico VARCHAR(20) NOT NULL,
    salario_min DECIMAL(10,2) NOT NULL,
    salario_max DECIMAL(10,2) NOT NULL,

    CONSTRAINT pk_puesto
    PRIMARY KEY (puesto_id),
    CONSTRAINT uq_puesto_nombre
    UNIQUE (nombre),
    CONSTRAINT ck_puesto_salario_min
    CHECK (salario_min > 0),
    CONSTRAINT ck_puesto_salario_max
    CHECK (salario_max >= salario_min)
);
GO

-- TABLA SUCURSAL
CREATE TABLE sucursal (
    sucursal_id INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(30) NOT NULL,
    ciudad VARCHAR(30) NOT NULL,
    estado VARCHAR(30) NOT NULL,

    CONSTRAINT pk_sucursal
    PRIMARY KEY (sucursal_id)
);
GO

-- TABLA TELEFONO
CREATE TABLE telefono (
    tel_id INT NOT NULL IDENTITY(1,1),
    sucursal_id INT NOT NULL,
    telefono VARCHAR(15) NOT NULL,

    CONSTRAINT pk_telefono
    PRIMARY KEY (tel_id, sucursal_id),
    CONSTRAINT fk_telefono_sucursal
    FOREIGN KEY (sucursal_id)
    REFERENCES sucursal(sucursal_id)
);
GO

-- TABLA DEPARTAMENTO
CREATE TABLE departamento (
    depto_id INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(30) NOT NULL,
    ubicacion VARCHAR(30) NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL,
    administrador INT NULL,
    sucursal_id INT NOT NULL,

    CONSTRAINT pk_departamento
    PRIMARY KEY (depto_id),
    CONSTRAINT uq_departamento_nombre
    UNIQUE (nombre),
    CONSTRAINT ck_departamento_presupuesto
    CHECK (presupuesto > 0)
);
GO

-- TABLA EMPLEADO
CREATE TABLE empleado (
    empleado_id INT NOT NULL IDENTITY(1,1),
    curp CHAR(18) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20) NOT NULL,
    sueldo DECIMAL(10,2) NOT NULL,
    jefe INT NULL,
    puesto_id INT NOT NULL,
    depto_id INT NOT NULL,

    CONSTRAINT pk_empleado
    PRIMARY KEY (empleado_id),
    CONSTRAINT uq_empleado_curp
    UNIQUE (curp),
    CONSTRAINT ck_empleado_sueldo
    CHECK (sueldo > 0),
    CONSTRAINT fk_empleado_empleado
    FOREIGN KEY (jefe)
    REFERENCES empleado(empleado_id),
    CONSTRAINT fk_empleado_puesto
    FOREIGN KEY (puesto_id)
    REFERENCES puesto(puesto_id),
    CONSTRAINT fk_empleado_departamento
    FOREIGN KEY (depto_id)
    REFERENCES departamento(depto_id)
);
GO

-- AGREGAR FK DE ADMINISTRADOR
ALTER TABLE departamento
ADD CONSTRAINT fk_departamento_empleado
FOREIGN KEY (administrador)
REFERENCES empleado(empleado_id);
GO

ALTER TABLE departamento
ADD CONSTRAINT fk_departamento_sucursal
FOREIGN KEY (sucursal_id)
REFERENCES sucursal(sucursal_id);
GO

-- TABLA PROYECTO
CREATE TABLE proyecto (
    proyecto_id INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(40) NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL,
    fecha_ini DATE NOT NULL,
    fecha_term DATE NOT NULL,

    CONSTRAINT pk_proyecto
    PRIMARY KEY (proyecto_id),
    CONSTRAINT uq_proyecto_nombre
    UNIQUE (nombre),
    CONSTRAINT ck_proyecto_presupuesto
    CHECK (presupuesto > 0),
    CONSTRAINT ck_proyecto_fechas
    CHECK (fecha_term >= fecha_ini)
);
GO

-- TABLA CAPACITACION
CREATE TABLE capacitacion (
    capacitacion_id INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(40) NOT NULL,

    CONSTRAINT pk_capacitacion
    PRIMARY KEY (capacitacion_id),
    CONSTRAINT uq_capacitacion_nombre
    UNIQUE (nombre)
);
GO

-- TABLA PARTICIPA
CREATE TABLE participa (
    empleado_id INT NOT NULL,
    proyecto_id INT NOT NULL,
    rol VARCHAR(30) NOT NULL,
    horas DECIMAL(6,2) NOT NULL,
    fecha_asignacion DATETIME2 NOT NULL
    CONSTRAINT df_participa_fecha_asignacion
    DEFAULT SYSDATETIME(),

    CONSTRAINT pk_participa
    PRIMARY KEY (empleado_id, proyecto_id),
    CONSTRAINT ck_participa_horas
    CHECK (horas > 0),
    CONSTRAINT fk_participa_empleado
    FOREIGN KEY (empleado_id)
    REFERENCES empleado(empleado_id),
    CONSTRAINT fk_participa_proyecto
    FOREIGN KEY (proyecto_id)
    REFERENCES proyecto(proyecto_id)
);
GO

-- TABLA ASISTE
CREATE TABLE asiste (
    empleado_id INT NOT NULL,
    capacitacion_id INT NOT NULL,
    fecha_inscripcion DATETIME2 NOT NULL
    CONSTRAINT df_asiste_fecha_inscripcion
    DEFAULT SYSDATETIME(),
    estatus VARCHAR(20) NOT NULL,
    calificacion DECIMAL(4,2) NULL,

    CONSTRAINT pk_asiste
    PRIMARY KEY (empleado_id, capacitacion_id),
    CONSTRAINT ck_asiste_calificacion
    CHECK (calificacion BETWEEN 0 AND 10),
    CONSTRAINT fk_asiste_empleado
    FOREIGN KEY (empleado_id)
    REFERENCES empleado(empleado_id),
    CONSTRAINT fk_asiste_capacitacion
    FOREIGN KEY (capacitacion_id)
    REFERENCES capacitacion(capacitacion_id)
);
GO