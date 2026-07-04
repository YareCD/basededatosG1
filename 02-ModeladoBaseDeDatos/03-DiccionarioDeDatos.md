# Diccionario de datos de la base de datos de Control Escolar

1. Información General

| Elemento | Valor |
|-----------|-----------|
| Proyecto    | Control Escolar    | 
| Version    | 1.0    | 
| Fecha    | Junio 2026    | 
| Elaboro    | Tec. Yaretzi Castro Díaz    |
| SGBD    | SQLServer    |

2. Descripción del Sistema de Base de Datos

El sistema admistra:
- Carreras
- Alumnos
- Materias
- Grupos
- Inscripciones

Permite controlar la oferta academica y la incripción de estudiantes.

3. Catalogo de Restricciones utilizadas.

| Código | Significado |
|-----------|-----------|
| PK    | Primary Key    |
| FK    | Foreign Key    |
| NN    | NOT NULL    |
| UQ    | UNIQUE    |
| AI    | AUTO INCREMENT    |
| CK    | CHECK    |
| DF    | DEFAULT    |

4. Diccionario de Datos

## Tabla: CARRERA

**Descripción**
Almacena las carreras ofertadas por la universidad

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| id_carrerra    | INT    | -  | PK,AI,NN    | Identificador único de la carrera    |
| nombre    | VARCHAR    | 100    | UQ,NN    | Nombre de la carrera    |
| duracion_cuatrimestre    | INT    | -    | NN,CK(>0)    | Nombre de la carrera   |

--

## Tabla: ALUMNO

**Descripción**
Almacena información de los estudiantes

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| id_alumno    | INT    | -  | PK,AI,NN    | Identificador único del alumno    |
| matricula    | VARCHAR    | 10    | UQ,NN    | Matricula Institucional    |
| nombre    | VARCHAR    | 30    | NN   | Almacena el nombre del alumno    |
| apellido_paterno    | VARCHAR    | 50    | NN   | Almacena apellido paterno    |
| apellido_materno    | VARCHAR    | 50    | NULL   | Almacena apellido materno    |
| Correo   | VARCHAR    | 100    | UQ,NN   | Almacena el correo institucional    |
| fecha_nacimiento    | DATE    | -    | NN   | Almacena la fecha de nacimiento del alumno    |
| id_carrera    | INT    | -    | FK,NN   | Carrera a la que pertenece    |

--

5. Relaciones en la base de datos

| Relacion | Cardinalidad | Descripción |
|-----------|-----------|-----------|
| Carrera -> Alumno    | 1 : N    | Una carrera tiene muchos alumnos    |
| Carrera -> Materia    | 1 : N    | Una carrera tiene muchas materias    |
| Profesor -> Grupo   | 1 : N    | Una carrera puede impartir varios grupos    |
| Materia -> Grupo   | 1 : N    | Una materia puede abrirse a varios grupos    |
| Alumno -> Inscripción   | 1 : N    | Un alumno puede tener varias inscripciones    |
| Grupo -> Inscripcion   | 1 : N    | Un grupo puede tener muchos alumnos    |


6. Matriz de Claves Foraneas

| Tabla | Campo Fk | Referencia |
|-----------|-----------|-----------|
| alumno   | id_carrera   | Carrera (id_carrera)    |
| Materia   | id_carrera   | Carrera (id_carrera)    |
| Grupo   | id_profesor   | Profesor (id_profesor)    |
| Grupo   | id_materia   | Materia (id_materia)    |
| Inscripcion   | id_alumno   | Alumno (id_alumno)    |
| Inscripcion   | id_grupo  | Grupo (id_grupo)    |

7. Integridad Referencial

| Regla | Descripción |
|-----------|-----------|
| IR-01    | No se puede registrar un alumno con una carrera inexistente    |
| IR-02    | No se puede crear un grupo para una materia inexistente |
| IR-03    | No se puede crear un grupo para un profesor inexistente |
| IR-04    | No se puede inscribir un alumno en un grupo inexistente |
| IR-05    | No se puede eliminar una carrera que tenga alumnos asociados sin antes reasignarlos o eliminarlos |

8. Reglas del negocio

| Regla | Descripción |
|-----------|-----------|
| RN-01    | Un alumno permite a una sola carrera |
| RN-02    | Una carrera puede tener muchos alumnos |
| RN-03    | Una carrera puede tener muchas materias |
| RN-04    | Un profesor puede impartir varios grupos |
| RN-05    | Un grupo solo puede tener un profesor asignado |
| RN-06    | La calificación debe estar entre 0.0 y 10.0 |

# 9. Diagrama relacional
![HOSPITAL](/img/Relacional/Eje1_RE.jpg)

# Diccionario de Datos de la Base de Datos de Profesores

## 1. Información General

| Elemento | Valor |
|-----------|-----------|
| Proyecto | Gestión de Profesores |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Tec. Yaretzi Castro Díaz |
| SGBD | SQL Server |

---

# 2. Descripción del Sistema de Base de Datos

El sistema administra la información relacionada con los profesores, los cursos que imparten y sus especialidades.

Permite:

- Registrar profesores.
- Registrar cursos.
- Registrar especialidades.
- Asignar cursos a un profesor.
- Registrar múltiples especialidades para un profesor.

---

# 3. Catálogo de Restricciones Utilizadas

| Código | Significado |
|-----------|-----------|
| PK | Primary Key |
| FK | Foreign Key |
| NN | NOT NULL |
| UQ | UNIQUE |
| AI | AUTO INCREMENT |
| CK | CHECK |
| DF | DEFAULT |

---

# 4. Diccionario de Datos

## Tabla: PROFESOR

**Descripción**

Almacena la información de los profesores registrados en el sistema.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| IdProfesor | INT | - | PK, AI, NN | Identificador único del profesor. |
| Nombre | VARCHAR | 50 | NN | Nombre del profesor. |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido del profesor. |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido del profesor. |

---

## Tabla: CURSO

**Descripción**

Almacena la información de los cursos impartidos por los profesores.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| IdCurso | INT | - | PK, AI, NN | Identificador único del curso. |
| Nombre | VARCHAR | 100 | NN | Nombre del curso. |
| Creditos | INT | - | NN, CK (>0) | Número de créditos del curso. |
| IdProfesor | INT | - | FK, NN | Profesor encargado de impartir el curso. |

---

## Tabla: ESPECIALIDAD

**Descripción**

Almacena las especialidades que posee cada profesor.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| IdEspecialidad | INT | - | PK, AI, NN | Identificador único de la especialidad. |
| Nombre | VARCHAR | 100 | NN | Nombre de la especialidad. |
| IdProfesor | INT | - | FK, NN | Profesor al que pertenece la especialidad. |

---

# 5. Relaciones en la Base de Datos

| Relación | Cardinalidad | Descripción |
|-----------|-----------|-----------|
| Profesor → Curso | 1 : N | Un profesor puede impartir varios cursos. |
| Profesor → Especialidad | 1 : N | Un profesor puede tener varias especialidades. |

---

# 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
|-----------|-----------|-----------|
| Curso | IdProfesor | Profesor(IdProfesor) |
| Especialidad | IdProfesor | Profesor(IdProfesor) |

---

# 7. Integridad Referencial

| Regla | Descripción |
|-----------|-----------|
| IR-01 | No se puede registrar un curso para un profesor inexistente. |
| IR-02 | No se puede registrar una especialidad para un profesor inexistente. |
| IR-03 | No se puede eliminar un profesor que tenga cursos registrados sin antes eliminarlos o reasignarlos. |
| IR-04 | No se puede eliminar un profesor que tenga especialidades registradas sin antes eliminarlas o reasignarlas. |

---

# 8. Reglas del Negocio

| Regla | Descripción |
|-----------|-----------|
| RN-01 | Cada profesor debe tener un identificador único. |
| RN-02 | Un profesor puede impartir uno o varios cursos. |
| RN-03 | Cada curso es impartido únicamente por un profesor. |
| RN-04 | Un profesor puede tener una o varias especialidades. |
| RN-05 | Cada especialidad pertenece a un solo profesor. |
| RN-06 | Los créditos de un curso deben ser mayores que cero. |
| RN-07 | El nombre de un profesor es obligatorio para su registro. |
| RN-08 | El nombre de un curso es obligatorio. |
| RN-09 | El nombre de la especialidad es obligatorio. |

# 9. Diagrama relacional
![NEGOCIO](/img/Relacional/Eje2_RE.jpg)

# Diccionario de Datos de la Base de Datos de Inscripción de Alumnos

## 1. Información General

| Elemento | Valor |
|-----------|-----------|
| Proyecto | Sistema de Inscripción de Alumnos |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Tec. Yaretzi Castro Díaz |
| SGBD | SQL Server |

---

# 2. Descripción del Sistema de Base de Datos

El sistema administra la información de los alumnos, las materias ofertadas y las inscripciones realizadas.

Permite:

- Registrar alumnos.
- Registrar materias.
- Inscribir alumnos en diferentes materias.
- Registrar la fecha de inscripción.
- Almacenar la calificación final obtenida por el alumno.

---

# 3. Catálogo de Restricciones Utilizadas

| Código | Significado |
|-----------|-----------|
| PK | Primary Key |
| FK | Foreign Key |
| NN | NOT NULL |
| UQ | UNIQUE |
| AI | AUTO INCREMENT |
| CK | CHECK |
| DF | DEFAULT |

---

# 4. Diccionario de Datos

## Tabla: ALUMNO

**Descripción**

Almacena la información de los estudiantes registrados en el sistema.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| IdAlumno | INT | - | PK, AI, NN | Identificador único del alumno. |
| Matricula | VARCHAR | 15 | UQ, NN | Matrícula institucional del alumno. |
| Nombre | VARCHAR | 50 | NN | Nombre del alumno. |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido del alumno. |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido del alumno. |
| Semestre | INT | - | NN, CK (>=1) | Semestre que cursa el alumno. |

---

## Tabla: MATERIA

**Descripción**

Almacena la información de las materias disponibles para inscripción.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| IdMateria | INT | - | PK, AI, NN | Identificador único de la materia. |
| Nombre | VARCHAR | 100 | NN | Nombre de la materia. |
| Creditos | INT | - | NN, CK (>0) | Número de créditos asignados a la materia. |

---

## Tabla: INSCRIBE

**Descripción**

Representa la inscripción de un alumno a una materia. Resuelve la relación muchos a muchos entre alumnos y materias.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| IdAlumno | INT | - | PK, FK, NN | Alumno inscrito en la materia. |
| IdMateria | INT | - | PK, FK, NN | Materia inscrita por el alumno. |
| FechaInicio | DATE | - | NN | Fecha en que se realizó la inscripción. |
| Califinal | DECIMAL | 4,2 | CK (0-10), NULL | Calificación final obtenida por el alumno. |

---

# 5. Relaciones en la Base de Datos

| Relación | Cardinalidad | Descripción |
|-----------|-----------|-----------|
| Alumno → Inscribe | 1 : N | Un alumno puede realizar varias inscripciones. |
| Materia → Inscribe | 1 : N | Una materia puede ser cursada por muchos alumnos. |
| Alumno ↔ Materia | N : M | Un alumno puede cursar varias materias y una materia puede tener varios alumnos. |

---

# 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
|-----------|-----------|-----------|
| Inscribe | IdAlumno | Alumno(IdAlumno) |
| Inscribe | IdMateria | Materia(IdMateria) |

---

# 7. Integridad Referencial

| Regla | Descripción |
|-----------|-----------|
| IR-01 | No se puede registrar una inscripción para un alumno inexistente. |
| IR-02 | No se puede registrar una inscripción para una materia inexistente. |
| IR-03 | No se puede eliminar un alumno que tenga inscripciones registradas sin antes eliminarlas o reasignarlas. |
| IR-04 | No se puede eliminar una materia que tenga alumnos inscritos sin antes eliminar las inscripciones correspondientes. |
| IR-05 | No puede existir una inscripción duplicada para el mismo alumno y la misma materia. |

---

# 8. Reglas del Negocio

| Regla | Descripción |
|-----------|-----------|
| RN-01 | Cada alumno debe tener una matrícula única. |
| RN-02 | Un alumno puede inscribirse en varias materias. |
| RN-03 | Una materia puede tener inscritos varios alumnos. |
| RN-04 | Un alumno no puede inscribirse dos veces en la misma materia. |
| RN-05 | La combinación de IdAlumno e IdMateria identifica de forma única cada inscripción. |
| RN-06 | La fecha de inscripción es obligatoria al registrar una inscripción. |
| RN-07 | La calificación final debe estar entre 0.0 y 10.0. |
| RN-08 | Los créditos de una materia deben ser mayores que cero. |
| RN-09 | El semestre del alumno debe ser mayor o igual a 1. |
| RN-10 | Toda inscripción debe corresponder a un alumno y una materia existentes. |

# 9. Diagrama relacional
![ESCUELA](/img/Relacional/Eje3_RE.jpg)

# Diccionario de Datos de la Base de Datos de Ventas

## 1. Información General

| Elemento | Valor |
|-----------|-----------|
| Proyecto | Sistema de Gestión de Ventas |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Tec. Yaretzi Castro Díaz |
| SGBD | SQL Server |

---

# 2. Descripción del Sistema de Base de Datos

El sistema administra la información relacionada con los clientes, los productos, los pedidos realizados y el detalle de cada pedido.

Permite:

- Registrar clientes.
- Registrar productos.
- Generar pedidos.
- Asociar uno o varios productos a cada pedido.
- Registrar la cantidad solicitada de cada producto.

---

# 3. Catálogo de Restricciones Utilizadas

| Código | Significado |
|-----------|-----------|
| PK | Primary Key |
| FK | Foreign Key |
| NN | NOT NULL |
| UQ | UNIQUE |
| AI | AUTO INCREMENT |
| CK | CHECK |
| DF | DEFAULT |

---

# 4. Diccionario de Datos

## Tabla: CLIENTE

**Descripción**

Almacena la información de los clientes registrados en el sistema.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| IdCliente | INT | - | PK, AI, NN | Identificador único del cliente. |
| Nombre | VARCHAR | 50 | NN | Nombre del cliente. |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido del cliente. |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido del cliente. |
| RFC | VARCHAR | 13 | UQ, NN | Registro Federal de Contribuyentes del cliente. |

---

## Tabla: PEDIDO

**Descripción**

Almacena la información de los pedidos realizados por los clientes.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| IdPedido | INT | - | PK, AI, NN | Identificador único del pedido. |
| FechaPedido | DATE | - | NN | Fecha en que se realizó el pedido. |
| IdCliente | INT | - | FK, NN | Cliente que realizó el pedido. |

---

## Tabla: PRODUCTO

**Descripción**

Almacena la información de los productos disponibles para la venta.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| IdProducto | INT | - | PK, AI, NN | Identificador único del producto. |
| Nombre | VARCHAR | 100 | NN | Nombre del producto. |
| Precio | DECIMAL | 10,2 | NN, CK (>0) | Precio unitario del producto. |
| Existencia | INT | - | NN, CK (>=0) | Cantidad disponible en inventario. |

---

## Tabla: DETALLE

**Descripción**

Representa el detalle de los productos incluidos en cada pedido. Resuelve la relación muchos a muchos entre pedidos y productos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| IdPedido | INT | - | PK, FK, NN | Pedido al que pertenece el detalle. |
| IdProducto | INT | - | PK, FK, NN | Producto incluido en el pedido. |
| Cantidad | INT | - | NN, CK (>0) | Cantidad solicitada del producto. |

---

# 5. Relaciones en la Base de Datos

| Relación | Cardinalidad | Descripción |
|-----------|-----------|-----------|
| Cliente → Pedido | 1 : N | Un cliente puede realizar varios pedidos. |
| Pedido → Detalle | 1 : N | Un pedido puede contener varios productos. |
| Producto → Detalle | 1 : N | Un producto puede aparecer en varios pedidos. |
| Pedido ↔ Producto | N : M | Un pedido puede incluir varios productos y un producto puede pertenecer a varios pedidos. |

---

# 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
|-----------|-----------|-----------|
| Pedido | IdCliente | Cliente(IdCliente) |
| Detalle | IdPedido | Pedido(IdPedido) |
| Detalle | IdProducto | Producto(IdProducto) |

---

# 7. Integridad Referencial

| Regla | Descripción |
|-----------|-----------|
| IR-01 | No se puede registrar un pedido para un cliente inexistente. |
| IR-02 | No se puede registrar un detalle para un pedido inexistente. |
| IR-03 | No se puede registrar un detalle con un producto inexistente. |
| IR-04 | No se puede eliminar un cliente que tenga pedidos registrados sin antes eliminarlos o reasignarlos. |
| IR-05 | No se puede eliminar un pedido que tenga productos asociados en el detalle. |
| IR-06 | No se puede eliminar un producto que forme parte de algún pedido registrado. |

---

# 8. Reglas del Negocio

| Regla | Descripción |
|-----------|-----------|
| RN-01 | Cada cliente debe tener un identificador único. |
| RN-02 | El RFC de cada cliente debe ser único. |
| RN-03 | Un cliente puede realizar uno o varios pedidos. |
| RN-04 | Cada pedido pertenece únicamente a un cliente. |
| RN-05 | Un pedido debe contener al menos un producto. |
| RN-06 | Un producto puede formar parte de varios pedidos. |
| RN-07 | La cantidad de un producto en el detalle debe ser mayor que cero. |
| RN-08 | El precio de un producto debe ser mayor que cero. |
| RN-09 | La existencia de un producto no puede ser negativa. |
| RN-10 | No puede existir un mismo producto repetido dentro del mismo pedido. |
| RN-11 | Toda fila de la tabla Detalle debe corresponder a un pedido y un producto existentes. |

# 9. Diagrama relacional
![COMPAÑIA](/img/Relacional/Eje4-RE.jpg)

# Diccionario de Datos de la Base de Datos de Gestión Empresarial

## 1. Información General

| Elemento | Valor |
|-----------|-----------|
| Proyecto | Sistema de Gestión Empresarial |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Tec. Yaretzi Castro Díaz |
| SGBD | SQL Server |

---

# 2. Descripción del Sistema de Base de Datos

El sistema administra la información de los empleados, departamentos, proyectos y sus dependientes.

Permite:

- Registrar empleados.
- Registrar departamentos.
- Asignar un gerente a cada departamento.
- Registrar las ubicaciones de los departamentos.
- Registrar proyectos.
- Asignar empleados a proyectos.
- Registrar dependientes de los empleados.

---

# 3. Catálogo de Restricciones Utilizadas

| Código | Significado |
|-----------|-----------|
| PK | Primary Key |
| FK | Foreign Key |
| NN | NOT NULL |
| UQ | UNIQUE |
| AI | AUTO INCREMENT |
| CK | CHECK |
| DF | DEFAULT |

---

# 4. Diccionario de Datos

## Tabla: EMPLOYEE

**Descripción**

Almacena la información general de los empleados de la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| SSN | CHAR | 9 | PK, NN | Número de Seguro Social del empleado. |
| Fname | VARCHAR | 30 | NN | Nombre del empleado. |
| Minit | CHAR | 1 | NULL | Inicial del segundo nombre. |
| Lname | VARCHAR | 30 | NN | Apellido del empleado. |
| Bdate | DATE | - | NN | Fecha de nacimiento. |
| Address | VARCHAR | 120 | NN | Dirección del empleado. |
| Sex | CHAR | 1 | NN, CK ('M','F') | Sexo del empleado. |
| Salary | DECIMAL | 10,2 | NN, CK (>0) | Salario del empleado. |
| SuperSSN | CHAR | 9 | FK, NULL | Supervisor del empleado. |
| Dno | INT | - | FK, NN | Departamento al que pertenece. |

---

## Tabla: DEPARTMENT

**Descripción**

Almacena la información de los departamentos de la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| Dnumber | INT | - | PK, NN | Identificador del departamento. |
| Dname | VARCHAR | 50 | UQ, NN | Nombre del departamento. |
| MgrSSN | CHAR | 9 | FK, NN | Empleado que administra el departamento. |
| MgrStartDate | DATE | - | NN | Fecha de inicio como gerente. |

---

## Tabla: DEPT_LOCATIONS

**Descripción**

Almacena las ubicaciones físicas de cada departamento.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| Dnumber | INT | - | PK, FK, NN | Departamento al que pertenece la ubicación. |
| Dlocation | VARCHAR | 50 | PK, NN | Ubicación del departamento. |

---

## Tabla: PROJECT

**Descripción**

Almacena los proyectos desarrollados por la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| Pnumber | INT | - | PK, NN | Identificador del proyecto. |
| Pname | VARCHAR | 80 | UQ, NN | Nombre del proyecto. |
| Plocation | VARCHAR | 50 | NN | Ubicación donde se desarrolla el proyecto. |
| Dnum | INT | - | FK, NN | Departamento responsable del proyecto. |

---

## Tabla: WORKS_ON

**Descripción**

Registra las horas que un empleado dedica a un proyecto.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| Essn | CHAR | 9 | PK, FK, NN | Empleado asignado al proyecto. |
| Pno | INT | - | PK, FK, NN | Proyecto asignado. |
| Hours | DECIMAL | 4,1 | NN, CK (>=0) | Horas trabajadas en el proyecto. |

---

## Tabla: DEPENDENT

**Descripción**

Almacena la información de los dependientes de cada empleado.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| Essn | CHAR | 9 | PK, FK, NN | Empleado al que pertenece el dependiente. |
| DependentName | VARCHAR | 50 | PK, NN | Nombre del dependiente. |
| Sex | CHAR | 1 | NN, CK ('M','F') | Sexo del dependiente. |
| Bdate | DATE | - | NN | Fecha de nacimiento del dependiente. |
| Relationship | VARCHAR | 30 | NN | Parentesco con el empleado. |

---

# 5. Relaciones en la Base de Datos

| Relación | Cardinalidad | Descripción |
|-----------|-----------|-----------|
| Department → Employee | 1 : N | Un departamento tiene varios empleados. |
| Employee → Employee | 1 : N | Un empleado puede supervisar a varios empleados. |
| Department → Project | 1 : N | Un departamento administra varios proyectos. |
| Department → Dept_Locations | 1 : N | Un departamento puede tener varias ubicaciones. |
| Employee → Works_On | 1 : N | Un empleado puede trabajar en varios proyectos. |
| Project → Works_On | 1 : N | Un proyecto puede tener varios empleados asignados. |
| Employee → Dependent | 1 : N | Un empleado puede registrar varios dependientes. |
| Employee ↔ Project | N : M | Los empleados pueden participar en varios proyectos y un proyecto puede tener varios empleados. |

---

# 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
|-----------|-----------|-----------|
| Employee | SuperSSN | Employee(SSN) |
| Employee | Dno | Department(Dnumber) |
| Department | MgrSSN | Employee(SSN) |
| Dept_Locations | Dnumber | Department(Dnumber) |
| Project | Dnum | Department(Dnumber) |
| Works_On | Essn | Employee(SSN) |
| Works_On | Pno | Project(Pnumber) |
| Dependent | Essn | Employee(SSN) |

---

# 7. Integridad Referencial

| Regla | Descripción |
|-----------|-----------|
| IR-01 | Todo empleado debe pertenecer a un departamento existente. |
| IR-02 | Todo gerente debe ser un empleado registrado. |
| IR-03 | No se puede registrar un proyecto para un departamento inexistente. |
| IR-04 | No se puede asignar un empleado a un proyecto inexistente. |
| IR-05 | No se puede registrar un dependiente para un empleado inexistente. |
| IR-06 | No se puede eliminar un departamento que tenga empleados o proyectos asociados sin antes reasignarlos. |
| IR-07 | No se puede eliminar un empleado que sea gerente o supervisor sin actualizar las referencias correspondientes. |

---

# 8. Reglas del Negocio

| Regla | Descripción |
|-----------|-----------|
| RN-01 | Cada empleado pertenece a un solo departamento. |
| RN-02 | Un departamento puede tener muchos empleados. |
| RN-03 | Cada departamento tiene un único gerente. |
| RN-04 | Un empleado puede supervisar a varios empleados. |
| RN-05 | Un departamento puede administrar varios proyectos. |
| RN-06 | Un empleado puede trabajar en varios proyectos. |
| RN-07 | Un proyecto puede tener varios empleados asignados. |
| RN-08 | Las horas trabajadas deben ser mayores o iguales a cero. |
| RN-09 | El salario del empleado debe ser mayor que cero. |
| RN-10 | Un empleado puede registrar varios dependientes. |
| RN-11 | Un departamento puede tener una o varias ubicaciones físicas. |
| RN-12 | El nombre de cada departamento y proyecto debe ser único. |

# 9. Diagrama relacional
![COMPANY](/img/Relacional/Eje5-RE.jpg)

# Diccionario de Datos de la Base de Datos de Gestión de Empleados

## 1. Información General

| Elemento | Valor |
|-----------|-----------|
| Proyecto | Sistema de Gestión de Empleados |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Tec. Yaretzi Castro Díaz |
| SGBD | SQL Server |

---

# 2. Descripción del Sistema de Base de Datos

El sistema administra la información de los empleados de una empresa, los departamentos a los que pertenecen, los proyectos en los que participan y los dependientes registrados.

Permite:

- Registrar empleados.
- Registrar departamentos.
- Asignar un gerente a cada departamento.
- Registrar proyectos.
- Asignar empleados a proyectos.
- Registrar dependientes de los empleados.

---

# 3. Catálogo de Restricciones Utilizadas

| Código | Significado |
|-----------|-----------|
| PK | Primary Key |
| FK | Foreign Key |
| NN | NOT NULL |
| UQ | UNIQUE |
| AI | AUTO INCREMENT |
| CK | CHECK |
| DF | DEFAULT |

---

# 4. Diccionario de Datos

## Tabla: EMPLOYEE

**Descripción**

Almacena la información de los empleados de la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| EmployeeID | INT | - | PK, AI, NN | Identificador único del empleado. |
| Name | VARCHAR | 80 | NN | Nombre completo del empleado. |
| Address | VARCHAR | 120 | NN | Dirección del empleado. |
| Salary | DECIMAL | 10,2 | NN, CK (>0) | Salario del empleado. |
| Sex | CHAR | 1 | NN, CK ('M','F') | Sexo del empleado. |
| BirthDate | DATE | - | NN | Fecha de nacimiento. |
| SupervisorID | INT | - | FK, NULL | Supervisor directo del empleado. |
| DepartmentID | INT | - | FK, NN | Departamento al que pertenece. |

---

## Tabla: DEPARTMENT

**Descripción**

Almacena la información de los departamentos de la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| DepartmentID | INT | - | PK, AI, NN | Identificador único del departamento. |
| Name | VARCHAR | 60 | UQ, NN | Nombre del departamento. |
| ManagerID | INT | - | FK, NN | Empleado responsable del departamento. |

---

## Tabla: PROJECT

**Descripción**

Almacena la información de los proyectos de la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| ProjectID | INT | - | PK, AI, NN | Identificador único del proyecto. |
| Name | VARCHAR | 80 | UQ, NN | Nombre del proyecto. |
| Location | VARCHAR | 60 | NN | Ubicación donde se desarrolla el proyecto. |
| DepartmentID | INT | - | FK, NN | Departamento responsable del proyecto. |

---

## Tabla: WORKS_ON

**Descripción**

Registra la participación de los empleados en los proyectos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| EmployeeID | INT | - | PK, FK, NN | Empleado asignado al proyecto. |
| ProjectID | INT | - | PK, FK, NN | Proyecto asignado al empleado. |
| Hours | DECIMAL | 5,2 | NN, CK (>=0) | Horas trabajadas en el proyecto. |

---

## Tabla: DEPENDENT

**Descripción**

Almacena la información de los dependientes de cada empleado.

| Campo | Tipo | Longitud | Restricciones | Descripción |
|-----------|-----------|-----------|-----------|-----------|
| DependentID | INT | - | PK, AI, NN | Identificador único del dependiente. |
| EmployeeID | INT | - | FK, NN | Empleado al que pertenece el dependiente. |
| Name | VARCHAR | 60 | NN | Nombre del dependiente. |
| Sex | CHAR | 1 | NN, CK ('M','F') | Sexo del dependiente. |
| BirthDate | DATE | - | NN | Fecha de nacimiento del dependiente. |
| Relationship | VARCHAR | 30 | NN | Parentesco con el empleado. |

---

# 5. Relaciones en la Base de Datos

| Relación | Cardinalidad | Descripción |
|-----------|-----------|-----------|
| Department → Employee | 1 : N | Un departamento puede tener varios empleados. |
| Employee → Employee | 1 : N | Un empleado puede supervisar a varios empleados. |
| Department → Project | 1 : N | Un departamento administra varios proyectos. |
| Employee → Works_On | 1 : N | Un empleado puede participar en varios proyectos. |
| Project → Works_On | 1 : N | Un proyecto puede tener varios empleados asignados. |
| Employee → Dependent | 1 : N | Un empleado puede registrar varios dependientes. |
| Employee ↔ Project | N : M | Un empleado puede trabajar en varios proyectos y un proyecto puede tener varios empleados. |

---

# 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
|-----------|-----------|-----------|
| Employee | SupervisorID | Employee(EmployeeID) |
| Employee | DepartmentID | Department(DepartmentID) |
| Department | ManagerID | Employee(EmployeeID) |
| Project | DepartmentID | Department(DepartmentID) |
| Works_On | EmployeeID | Employee(EmployeeID) |
| Works_On | ProjectID | Project(ProjectID) |
| Dependent | EmployeeID | Employee(EmployeeID) |

---

# 7. Integridad Referencial

| Regla | Descripción |
|-----------|-----------|
| IR-01 | Todo empleado debe pertenecer a un departamento existente. |
| IR-02 | Todo gerente debe estar registrado como empleado. |
| IR-03 | No se puede registrar un proyecto para un departamento inexistente. |
| IR-04 | No se puede asignar un empleado a un proyecto inexistente. |
| IR-05 | No se puede registrar un dependiente para un empleado inexistente. |
| IR-06 | No se puede eliminar un departamento que tenga empleados o proyectos asociados. |
| IR-07 | No se puede eliminar un empleado que sea gerente, supervisor o tenga dependientes sin actualizar las referencias. |

---

# 8. Reglas del Negocio

| Regla | Descripción |
|-----------|-----------|
| RN-01 | Cada empleado tiene un identificador único. |
| RN-02 | Cada empleado pertenece a un solo departamento. |
| RN-03 | Un departamento puede tener muchos empleados. |
| RN-04 | Cada departamento tiene un solo gerente. |
| RN-05 | Un empleado puede supervisar a varios empleados. |
| RN-06 | Un proyecto pertenece a un solo departamento. |
| RN-07 | Un empleado puede participar en varios proyectos. |
| RN-08 | Un proyecto puede tener varios empleados asignados. |
| RN-09 | Un empleado puede registrar varios dependientes. |
| RN-10 | El salario debe ser mayor que cero. |
| RN-11 | Las horas trabajadas deben ser mayores o iguales a cero. |
| RN-12 | Los nombres de los departamentos y proyectos deben ser únicos. |

# 9. Diagrama relacional
![COMPANY](/img/Relacional/Eje6-RE.jpg)

# Diccionario de Datos de la base de datos de Control Escolar

1. Información General:

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Control Escolar |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboro | Yaretzi Castro Díaz |
| SGBD | SQLServer |

2. Descripción del Sistema de Base de Datos

El sistema administra:
- Alumnos
- Teléfonos
- Credenciales
- Inscripciones de materias (Cursa)
- Materias
- Profesores
- Dependientes de profesores
- Departamentos
- Participación en proyectos
- Proyectos

Permite controlar de manera integral el historial académico de los estudiantes, la asignación de credenciales institucionales, la plantilla docente distribuida por departamentos, sus dependientes económicos y la asignación laboral en proyectos de investigación o desarrollo.

3. Catalogo de Restricciones utilizados

| Código | Significado |
| :--- | :--- |
| PK | Primary key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |

4 Diccionario de Datos

## Tabla: ALUMNO

**Descripción**

Almacena la información de control escolar e identificativos de los estudiantes matriculados.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 15 | PK, NN | Matrícula única e institucional asignada al estudiante. |
| Nombre | VARCHAR | 50 | NN | Nombre o nombres de pila del alumno. |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido (paterno) del alumno. |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido (materno) del alumno. |
| Carrera | VARCHAR | 50 | NN | Carrera profesional a la que pertenece el alumno. |
| Fechanaci | DATE | - | NN | Fecha de nacimiento del alumno. |

## Tabla: TELEFONO

**Descripción**

Almacena los números de contacto telefónico asociados a cada estudiante matriculado.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Idtelefono | INT | - | PK, NN | Identificador único del registro telefónico. |
| Matricula | VARCHAR | 15 | FK, NN | Referencia de la matrícula del alumno propietario del número. |
| Telefono | VARCHAR | 20 | NN | Número telefónico de contacto. |

## Tabla: CREDENCIAL

**Descripción**

Registra los datos de emisión, vigencia y control de las credenciales de identificación estudiantil.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numcredencial | INT | - | PK, NN | Número identificador único de la credencial física. |
| Matricula | VARCHAR | 15 | FK, UQ, NN | Vinculo directo con la matrícula del alumno asignado. |
| Fechains | DATE | - | NN | Fecha de expedición o alta del documento de identidad. |
| Vigencia | DATE | - | NN | Fecha límite de validez de la credencial. |

## Tabla: CURSA

**Descripción**

Tabla asociativa que detalla la inscripción y rendimiento definitivo de los alumnos en sus materias correspondientes.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 15 | PK, FK1, NN | Parte de la PK; vincula la matrícula del estudiante inscrito. |
| Clavemateria | INT | - | PK, FK2, NN | Parte de la PK; vincula el código de la materia cursada. |
| Fechainsc | DATE | - | NN | Fecha formal en que se dio de alta la materia. |
| Califfinal | DECIMAL(4,2) | - | NULL | Calificación o nota final obtenida en el curso. |

## Tabla: MATERIA

**Descripción**

Catálogo oficial de las asignaturas estructuradas en los planes de estudio institucionales.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Clavemateria | INT | - | PK, NN | Identificador numérico único de la materia. |
| Numprof | INT | - | FK, UQ, NN | Código del profesor titular que imparte de forma exclusiva la materia. |
| Nombremat | VARCHAR | 100 | NN | Nombre descriptivo oficial de la asignatura. |
| Creditos | INT | - | NN | Valor o carga crediticia del curso. |

## Tabla: PROFESOR

**Descripción**

Catálogo general de los docentes que integran la planta académica de la institución.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numprof | INT | - | PK, NN | Número de empleado o ficha identificativa del profesor. |
| Numdep | INT | - | FK, NN | Código del departamento de adscripción institucional. |
| nombre | VARCHAR | 50 | NN | Nombre o nombres de pila del profesor. |
| ap1 | VARCHAR | 50 | NN | Primer apellido (paterno) del docente. |
| ap2 | VARCHAR | 50 | NULL | Segundo apellido (materno) del docente. |

## Tabla: DEPARTAMENTO

**Descripción**

Unidades académicas y operativas que organizan las diversas áreas del conocimiento.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numdepto | INT | - | PK, NN | Código numérico identificador del departamento. |
| Edificio | VARCHAR | 50 | NN | Nombre o bloque estructural donde se ubica el departamento. |
| Nombre | VARCHAR | 100 | NN | Nombre oficial de la división departamental. |

## Tabla: DEPENDIENTE

**Descripción**

Entidad dependiente que registra los familiares directos de los docentes amparados bajo seguros o prestaciones.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Nombre | VARCHAR | 50 | PK, NN | Nombre propio del familiar; parte de la PK compuesta. |
| Numprof | INT | - | PK, FK, NN | Código del profesor del cual depende; parte de la PK compuesta. |
| Fechanac | DATE | - | NN | Fecha de nacimiento completa del dependiente. |
| PArentesco | VARCHAR | 30 | NN | Tipo de lazo familiar con el docente (Cónyuge, Hijo, etc.). |

## Tabla: PARTICIPA

**Descripción**

Registro histórico y de control sobre los proyectos donde colabora el personal docente.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numproy | INT | - | PK, FK1, NN | Código del proyecto de asignación; compone la PK. |
| Numprof | INT | - | PK, FK2, NN | Código del profesor participante; compone la PK. |
| Rol | VARCHAR | 50 | NN | Función o cargo desempeñado por el docente dentro del proyecto. |
| Fechainicio | DATE | - | NN | Fecha oficial de incorporación al equipo de trabajo. |

## Tabla: Proyecto

**Descripción**

Catálogo operativo de proyectos institucionales de investigación o gestión técnica.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numproy | INT | - | PK, NN | Identificador de control numérico único del proyecto. |
| Nombreproy | VARCHAR | 100 | NN | Título o nombre formal de la investigación. |
| Presupuesto | DECIMAL(12,2) | - | NN | Recursos financieros asignados para el desarrollo del proyecto. |

--

5. Relaciones del sistema

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Alumno -> Telefono | 1:N | Un alumno puede asociar varios números de teléfono móvil o fijo. |
| Alumno -> Credencial | 1:1 | Un alumno posee una única credencial de estudiante válida. |
| Alumno -> Cursa | 1:N | Un estudiante puede cursar y matricularse en diversas asignaturas. |
| Materia -> Cursa | 1:N | Una asignatura puede ser cursada por una lista de varios alumnos. |
| Profesor -> Materia | 1:1 | Un profesor se asigna como titular exclusivo de una materia en este diseño. |
| Departamento -> Profesor | 1:N | Un departamento cobija e integra a múltiples profesores. |
| Profesor -> Dependiente | 1:N | Un profesor puede tener múltiples beneficiarios económicos directos. |
| Profesor -> Participa | 1:N | Un profesor puede colaborar activamente en diferentes proyectos simultáneos. |
| Proyecto -> Participa | 1:N | Un proyecto agrupa las actividades de múltiples docentes del plantel. |

6. Matriz de claves franeas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| TELEFONO | Matricula | ALUMNO(Matricula) |
| CREDENCIAL | Matricula | ALUMNO(Matricula) |
| CURSA | Matricula | ALUMNO(Matricula) |
| CURSA | Clavemateria | MATERIA(Clavemateria) |
| MATERIA | Numprof | PROFESOR(Numprof) |
| PROFESOR | Numdep | DEPARTAMENTO(Numdepto) |
| DEPENDIENTE | Numprof | PROFESOR(Numprof) |
| PARTICIPA | Numproy | Proyecto(Numproy) |
| PARTICIPA | Numprof | PROFESOR(Numprof) |

7. Integridad Referencial

| Código | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un teléfono si la matrícula del estudiante no existe en el sistema. |
| IR-02 | No se puede emitir una credencial ligada a un código de matrícula inexistente. |
| IR-03 | No se puede inscribir o calificar un curso en la tabla `CURSA` si el alumno o la materia no son válidos. |
| IR-04 | No se puede vincular un profesor como titular de materia si no se encuentra dado de alta en la planta docente. |
| IR-05 | No se puede dar de alta un profesor dentro de un código de área departamental que no exista. |
| IR-06 | No se permite dar de alta dependientes si el código del docente asociado no coincide con un registro real. |
| IR-07 | No se puede registrar una participación en un proyecto si el identificador del proyecto o el del profesor no existen. |

8. Reglas del negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un estudiante se identifica de forma única bajo su matrícula institucional de control. |
| RN-02 | Una credencial pertenece de forma estricta y exclusiva a un único alumno registrado. |
| RN-03 | Un profesor está adscrito únicamente a un departamento matriz dentro de la organización de la escuela. |
| RN-04 | Cada materia cuenta únicamente con un profesor titular a cargo de su impartición. |
| RN-05 | Los dependientes económicos no pueden persistir en el sistema de seguros si el profesor titular es dado de baja. |
| RN-06 | Un proyecto puede operar con un presupuesto asignado el cual debe ser un monto financiero definido. |

## Modelo Relacional

![Escuela](/img/Relacional/Eje7-RE.jpg)