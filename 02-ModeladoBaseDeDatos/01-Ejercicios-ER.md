# Ejercicios MODELO E-R

1. Ejercicio 1

En un hospital se registra información de sus pacientes.

## De cada paiente se desea almacenar:

    - Algo que lo identifique
    - Nombre
    - Fecha de nacimiento

## De un expediente medico se almacena:

    - Numero de expediente
    - Fecha de Apertura
    - Tipo de sangre

## Reglas de negocio

    1.  Cada paciente debe tener exactamente un expediente médico.
    2. Cada paciente pertenece a un único paciente.
    3. No puede existir ningun paciente sin expediente.
    4. No puede existir ningun expediente sin paciente.    

## Resultado Modelo E-R
    
![Hospital](../img/E-R/Ejercicio%202.jpg)


# 2. Ejercicio 2

Una universidad administra profesores y cursos.

> De cada profesor se almacena:     
- Clave del profesor
- Nombre
-Especialidad

> De cada curso se almacena: 
- Identificación del curso
- Nombre del curso
- Créditos

> Reglas del negocio 
1. Un profesor puede impartir varios cursos
2. Un curso solamente puede ser impartido por un profesor
3. Puede existir un profesor que actualmente no imparta cursos
4. Todo curso debe ser asignado a un profesor

Se debe realizar lo siguiente: 
- Entidades 
- Identificar la Relación **IMPARTE**
- Determinar la cardinalidad
- Determinar la participación

![Escuela](../img/E-R/Eje2_ER.jpg)

# 3. Ejercicio 3
 
Una escuela administra alumnos y materias 
> de cada alumno se almacena 
- matricula 
- semestre
- nombre

> de cada materia 
- Clave
- nombre
- Creditos

> Reglas del negocio: 
1. Un alumno puede inscribirse en varias materias
2. Una materia puede tener muchos alumnos inscritos
3. Puede exisitir una materia sin alumnos inscritos
4. Todo alumno debe estar inscrito en al menos una materia
5. De cada inscripción se debe almacenar: 
 - fecha de inscripcion
 - Cal final

6. La relacion se llama **INSCRIBE**

![Escuela](../img/E-R/Eje2_ER.jpg)

# 4. EJERCICIO 4

Una empresa encargada de realizar venta de productos.
> De cada cliente se almacena: 
- Numero de cliente que lo identifique
- Nombre, el cual es una persona moral
- RFC

> La empresa realiza pedidos de los cuales se almacena lo siguiente: 
- Número de pedido
- Fecha

> La empresa también almacena productos de los cuales registra lo siguiente:
- Numero de producto
- Nombre y precio

> Al realizar los pedidos deben registrar la cantidad de productos, pedidos y su precio: 

> Reglas del negocio
1. Un cliente puede ralizar muchos pedidos
2. Cada pedido pertenece a un solo cliente 
3. Un pedido puede contener varios productos
4. Un producto puede aparecer en muchos pedidos
5. Un pedido debe contener al menos un producto
6. Un producto puede no haber sido vendido
7. El detalle del pedido no exixste sin pedido
8. El detalle de pedido no existe sin producto
9.  El detalle almacena: 
    - Cantidad 
    - Precio de venta

![Empresa](../img/E-R/Ej4-E-R.jpg)

# 5. EJERCICIO 5

Una empresa administra la información de sus empleados, departamentos, proyectos y dependientes.

> De cada empleado se almacena:
- Número de Seguro Social (SSN)
- Nombre (Nombre y Apellido)
- Dirección
- Fecha de nacimiento
- Sexo
- Salario

> De cada departamento se almacena:
- Número del departamento
- Nombre
- Una o varias ubicaciones

> La empresa administra proyectos de los cuales registra:
- Número del proyecto
- Nombre
- Ubicación

> También registra los dependientes de cada empleado, almacenando:
- Nombre
- Sexo
- Fecha de nacimiento
- Parentesco

> Además, la empresa registra:
- La fecha en que un empleado comienza a administrar un departamento.
- Las horas que un empleado trabaja en un proyecto.

> Reglas del negocio

1. Un empleado trabaja para un solo departamento.
2. Un departamento puede tener muchos empleados.
3. Cada departamento es administrado por un solo empleado.
4. Un empleado puede administrar como máximo un departamento.
5. Se registra la fecha en que inicia la administración del departamento.
6. Un departamento controla uno o varios proyectos.
7. Cada proyecto pertenece a un solo departamento.
8. Un empleado puede trabajar en varios proyectos.
9. Un proyecto puede tener asignados varios empleados.
10. Para cada asignación de un empleado a un proyecto se registran las horas trabajadas.
11. Un empleado puede tener varios dependientes.
12. Cada dependiente pertenece únicamente a un empleado.
13. Un dependiente no puede existir sin un empleado asociado.
14. Un departamento puede existir antes de tener empleados asignados.
15. Un proyecto debe estar controlado por un departamento.

![Company](../img/E-R/Ej5-ER.jpg)

# 6. EJERCICIO 6-7

Una institución educativa administra la información de alumnos, profesores, materias, departamentos, proyectos, credenciales y dependientes.

> De cada alumno se almacena:
- Matrícula
- Nombre (Nombre, Apellido Paterno y Apellido Materno)
- Fecha de nacimiento
- Correo electrónico
- Uno o varios teléfonos

> De cada materia se registra:
- Clave de la materia
- Nombre de la materia
- Créditos
- Total de materias (atributo derivado)

> De cada profesor se almacena:
- Número de profesor
- Nombre (Nombre, Apellido Paterno y Apellido Materno)

> De cada departamento se registra:
- Número de departamento
- Nombre
- Edificio

> De cada proyecto se almacena:
- Número del proyecto
- Nombre del proyecto
- Presupuesto

> Cada alumno posee una credencial.

> También se registran los dependientes de los profesores, almacenando:
- Nombre
- Fecha de nacimiento
- Parentesco

> Además, el sistema registra:
- La fecha de inscripción y la calificación final de un alumno en una materia.
- La fecha de inicio y el rol de un profesor en un proyecto.

> Reglas del negocio

1. Un alumno posee una sola credencial.
2. Una credencial pertenece únicamente a un alumno.
3. Un alumno puede inscribirse en varias materias.
4. Una materia puede tener inscritos varios alumnos.
5. Por cada inscripción se registra la fecha de inscripción y la calificación final.
6. Un profesor imparte varias materias.
7. Cada materia es impartida por un solo profesor.
8. Un profesor puede participar en varios proyectos.
9. Un proyecto puede contar con varios profesores.
10. Por cada participación se registra la fecha de inicio y el rol del profesor.
11. Un profesor pertenece a un solo departamento.
12. Un departamento puede tener varios profesores.
13. Un profesor puede tener varios dependientes.
14. Cada dependiente pertenece únicamente a un profesor.
15. Un dependiente no puede existir sin un profesor asociado.
16. Un alumno puede tener registrados uno o varios números telefónicos.
17. El total de materias es un atributo derivado calculado a partir de la información almacenada.
![Escuela](../img/E-R/Eje6-7_ER.jpg)
