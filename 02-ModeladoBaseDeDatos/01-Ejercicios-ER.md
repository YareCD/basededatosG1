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

![Escuela](../img/E-R/Ejercicio%202.drawio.png)

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

![Escuela](../img/E-R/Ejercicio%203.jpg)

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

