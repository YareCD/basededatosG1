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

9. Diagrama relacional