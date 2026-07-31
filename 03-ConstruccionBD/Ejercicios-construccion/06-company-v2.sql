
CREATE DATABASE company_v2;
GO

USE company_v2;
GO

-- TABLA EMPLOYEE
CREATE TABLE employee (
    employeeid INT NOT NULL IDENTITY(1,1),
    ssn CHAR(9) NOT NULL,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    address VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    birthday DATE NOT NULL,
    namedep VARCHAR(20) NOT NULL,
    numberdep INT NOT NULL,
    jefe INT NOT NULL, 

    CONSTRAINT pk_employee
    PRIMARY KEY (employeeid),
    CONSTRAINT ck_employee_salary
    CHECK (salary > 0),
    CONSTRAINT fk_employee_employee
    FOREIGN KEY (jefe)
    REFERENCES employee (employeeid)
);
GO

-- TABLA DEPARTMENT
CREATE TABLE department (
    numberdep INT NOT NULL IDENTITY(1,1),
    namedep VARCHAR(20) NOT NULL,
    manager INT NOT NULL,
    startdate DATETIME2 NOT NULL
    CONSTRAINT df_department_startdate
    DEFAULT SYSDATETIME(),

    CONSTRAINT pk_department
    PRIMARY KEY (numberdep),
    CONSTRAINT fk_department_employee
    FOREIGN KEY (manager)
    REFERENCES employee (employeeid)
);
GO

-- AGREGAR LA FOREIGN KEY DE EMPLOYEE HACIA DEPARTMENT
ALTER TABLE employee
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (numberdep)
REFERENCES department (numberdep);
GO

-- TABLA LOCATIONS
CREATE TABLE locations (
    numlocation INT NOT NULL IDENTITY(1,1),
    namelocations VARCHAR(30) NOT NULL,
    numberdep INT NULL,

    CONSTRAINT pk_locations
    PRIMARY KEY (numlocation),
    CONSTRAINT fk_locations_department
    FOREIGN KEY (numberdep)
    REFERENCES department (numberdep)
);
GO

-- TABLA PROJECT
CREATE TABLE project (
    numberproj INT NOT NULL IDENTITY(1,1),
    nameproj VARCHAR(20) NOT NULL,
    location VARCHAR(30) NOT NULL,
    numberdep INT NOT NULL,

    CONSTRAINT pk_project
    PRIMARY KEY (numberproj),
    CONSTRAINT uq_project_nameproj
    UNIQUE (nameproj),
    CONSTRAINT fk_project_department
    FOREIGN KEY (numberdep)
    REFERENCES department (numberdep)
);
GO

-- TABLA WORKS_ON
CREATE TABLE works_on (
    employeeid INT NOT NULL,
    numberproj INT NOT NULL,
    hours DECIMAL(5,2) NOT NULL
    CONSTRAINT ck_works_on_hours
    CHECK (hours > 0),

    CONSTRAINT pk_works_on
    PRIMARY KEY (employeeid, numberproj),
    CONSTRAINT fk_works_on_employee
    FOREIGN KEY (employeeid)
    REFERENCES employee (employeeid),
    CONSTRAINT fk_works_on_project
    FOREIGN KEY (numberproj)
    REFERENCES project (numberproj)
);
GO

-- TABLA DEPENDENT (entidad debil: llave parcial dependentid + employeeid)
CREATE TABLE dependent (
    dependentid INT NOT NULL,
    employeeid INT NOT NULL,
    sex CHAR(1) NOT NULL
    CONSTRAINT ck_dependent_sex
    CHECK (sex IN ('M','F')),
    birthdate DATE NOT NULL,
    name VARCHAR(20) NOT NULL,
    relationship VARCHAR(20) NOT NULL,

    CONSTRAINT pk_dependent
    PRIMARY KEY (employeeid, dependentid),
    CONSTRAINT fk_dependent_employee
    FOREIGN KEY (employeeid)
    REFERENCES employee (employeeid)
);
GO