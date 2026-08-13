/* ======================================================================
DQL (Data Query Languaje) en SQLSERVER

Archivo: 06-filtrado.registros.where.sql

Descripcion: Se recuperan unicamente las filas que cumplen determinadas 
condiciones mendiante la clausula where

ORDER DE EJECUCIÓN:
+ FROM / JOINS
+ WHERE
+ GROUP BY
+ HAVING
+ DISTINCT
+ ORDER BY
+ TOP

ORDEN SINTÁCTICO

SELECT
FROM
JOIN/ON (INNER, LEFT RIGHT CROSS FULL SELF)
WHERE
GROUP BY
HAVING
ORDER BY

OPERADORES RELACIONALES

= Igual que
< Menor que
> Mayor que
<= Menor o igual que
>= Mayor o igual que
<> Diferente que
!= Diferente que (menos utilizado)

OPERADORES LÓGICOS
NOT
AND
OR

========================================================================*/

/*======================================================================
sintaxis:

SELECT 
 columna_1,
 columna_2,
 columna_n

 FROM nombre_tabla
 WHERE condicion;

 nota: condicion puede ser relacional y a combinacion de esta con lógica
 NOTA: EL SELECT NO FILTRA REGISTROS

==========================================================================*/

-- Seleccionar el producto cuyo precio es $200

SELECT 
	p.codigo AS [Código],
	p.nombre AS [Producto],
	p.precio AS [Precio]
FROM productos AS p
WHERE precio = 200;

-- Seleccionar el cliente cuyo identificador es 25

SELECT 
	c.id_cliente,
	CONCAT (c.nombre, '',
	c.apellido_paterno, '',
	c.apellido_materno) AS nombre_completo,
	c.correo
FROM clientes AS c
WHERE c.id_cliente = 25;

-- comparacion de cadenas de texto
-- los valores de texto deben escribirse entre comillas simples

-- seleccionar las categorias donde el nombre sea Cómputo

SELECT
	c.nombre AS [Categoria]
FROM categorias AS c
WHERE c.nombre = 'Cómputo';

-- Seleccionar los datos del cliente con nombre Cliente1

SELECT
	c.nombre AS [Nombre del cliente]
FROM clientes AS c
WHERE c.nombre = 'Cliente1';

-- Seleccionar los datos del empleado que no pertenezcan al departamento 1
SELECT 
	e.id_empleado AS [Empleado ID],
	e.id_departamento AS [Departamento ID]
FROM empleados AS e
WHERE e.id_departamento !=1;

-- Seleccionar los datos de los productos donde el precio sea superior a $490

SELECT 
	p.codigo AS [Código],
	p.nombre AS [Producto],
	p.precio AS [Precio]
FROM productos AS p
WHERE precio > 490;

-- Seleccionar los datos de los productos con existencia critica inferior a
-- 10 unidades
SELECT 
	p.codigo AS [Código],
	p.nombre AS [Producto],
	p.existencia AS [Existencia]
FROM productos AS p
WHERE p.existencia < 10;
	
-- Seleccionar los datos de los empleados donde su salario sea de $30,000 en adelante
SELECT 
	e.id_empleado AS [Empleado ID],
	e.nombre AS [Nombre],
	e.salario AS [Salario]
FROM empleados AS e
WHERE e.salario >= 30000;


-- Seleccionar los datos de los productos donde sus precios sean de $10 o menos
SELECT 
	p.codigo AS [Código],
	p.nombre AS [Producto],
	p.precio AS [Precio]
FROM productos AS p
WHERE p.precio <= 10;

-- comparacion de fecha
-- las fechas deben escribirse entre comillas simples

-- se recomienda el formato AAAA-MM-DD

-- seleccionar los datos de las ventas realizadas el 24 de dic de 2025

SELECT 
	v.id_venta,
	v.fecha,
	v.id_cliente,
	v.id_empleado

FROM ventas as v
WHERE fecha = '2025-12-24';

-- seleccionar los datos de las ventas realizadas en el mes de abril
SELECT 
	v.id_venta,
	v.fecha,
	YEAR(v.fecha) AS [Año],
	MONTH(v.fecha) AS [Mes],
	DAY(v.fecha) AS [Dia],
	v.id_cliente,
	v.id_empleado

FROM ventas as v
WHERE MONTH (fecha) = 4;

-- Seleccionar todas las ventas anteruores al 1° de febrero del 2025
SELECT 
	v.id_venta,
	v.fecha,
	YEAR(v.fecha) AS [Año],
	MONTH(v.fecha) AS [Mes],
	DAY(v.fecha) AS [Dia],
	v.id_cliente,
	v.id_empleado

FROM ventas as v
WHERE MONTH (fecha) = 1;

SELECT
	v.id_venta,
	v.fecha,
	YEAR (v.fecha) AS [Año],
	MONTH (v.fecha) AS [Mes],
	FORMAT (v.fecha, 'MMMM') AS [mes_ingles],
	FORMAT (v.fecha, 'MMMM', 'es-ES') AS [mes español],
	DAY (v.fecha) AS [Dia],
	FORMAT(v.fecha, 'dddd') AS [Dia ingles],
	UPPER(FORMAT (v.fecha, 'dddd', 'es-ES')) AS [dia español],
	UPPER(FORMAT (v.fecha, 'ddd', 'es-ES')) AS [dia abreviatura],
	v.id_cliente,
	v.id_empleado
FROM ventas as V
WHERE MONTH (fecha) = '2025-12-24';

-- Seleccionar las ventas anteriores al 1ro de febrero de 2025

SELECT
	v.id_venta,
	v.fecha,
	YEAR (v.fecha) AS [Año],
	MONTH (v.fecha) AS [Mes],
	DAY (v.fecha) AS [Dia],
	FORMAT (v.fecha, 'MMMM') AS [mes_ingles],
	FORMAT (v.fecha, 'MMMM', 'es-ES') AS [mes español],
	FORMAT (v.fecha, 'MMM') AS [mes abreviado],
	FORMAT (v.fecha, 'MMM', 'es-ES') AS [mes abreviado],
	FORMAT(v.fecha, 'dddd') AS [Dia ingles],
	UPPER(FORMAT (v.fecha, 'dddd', 'es-ES')) AS [dia español],
	UPPER(FORMAT (v.fecha, 'ddd', 'es-ES')) AS [dia abreviatura],
	v.id_cliente,
	v.id_empleado
FROM ventas as V
WHERE v.fecha < '2025-02-01';

-- seleccionar los datos de los productos mostrando el codigo y el valor del inventario
-- donde el valor del inventario debe ser mayor a $50000

SELECT
	p.codigo AS codigo_producto,
	p.existencia AS esxistencia,
	p.precio AS precio,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE (p.precio * p.existencia) > 50000;

-- Instruccion BETWEEN

SELECT
	p.codigo AS codigo_producto,
	p.existencia AS esxistencia,
	p.precio AS precio,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE precio BETWEEN 200 AND 300;

-- mostrar los productos con precio que este entre $200 y $300 

SELECT
	p.codigo AS codigo_producto,
	p.existencia AS esxistencia,
	p.precio AS precio,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE precio >= 200.0
AND precio <=300.0;

-- DISTINCT
-- quita elementos repetidos de una o la combinacion de columnas 

-- Muestrame los sexos de los clientes
SELECT DISTINCT
	sexo
FROM clientes AS c;

SELECT DISTINCT
	id_ciudad	
FROM clientes;

SELECT COUNT(*)
FROM ciudades;

SELECT DISTINCT
	cu.nombre
FROM clientes AS c
INNER JOIN ciudades AS cu
ON c.id_ciudad = cu.id_ciudad;

-- seleccionar los descuentos unicos de las ventas

SELECT DISTINCT
	dv.descuento
FROM detalle_ventas AS dv
ORDER BY dv.descuento DESC;
GO

SELECT DISTINCT
	p.id_categoria,
	p.id_proveedor
FROM productos AS p;
GO

-- TOP
-- Limita la cantidad de filas de vueltas por una consulta

SELECT TOP (54)
	dv.id_venta,
	dv.precio,
	dv.cantidad,
	dv.descuento
FROM detalle_ventas AS dv;

SELECT TOP (10) PERCENT
	dv.id_venta,
	dv.precio,
	dv.cantidad,
	dv.descuento
FROM detalle_ventas AS dv;

-- Mostrar los productos con precio que estén entre $200 y $300

SELECT
	p.codigo AS [codigo_producto],
	p.existencia AS [existencia],
	p.precio AS [precio],
	p.existencia * p.precio AS [valor_inventario]
FROM productos AS p
WHERE precio BETWEEN 200 AND 300;

-- Mostrar los productos con precio que estén entre $200 y $300 que además tengan menos de 50 u.

SELECT
	p.codigo AS [codigo_producto],
	p.existencia AS [existencia],
	p.precio AS [precio],
	p.existencia * p.precio AS [valor_inventario]
FROM productos AS p
WHERE (p.precio >=200
		AND
		p.precio<=300)
	AND (p.existencia<50)
ORDER BY precio DESC;

-- Mostrar productos con existencia <10 o superior a 190

SELECT
	p.codigo AS [codigo_producto],
	p.existencia AS [existencia],
	p.precio AS [precio],
	p.existencia * p.precio AS [valor_inventario]
FROM productos AS p
WHERE p.existencia<10 
	OR
	p.existencia >190
ORDER BY precio DESC;

--NOT
--Mostrar los productos que no sean mayores a 400
SELECT
	p.codigo AS [codigo_producto],
	p.existencia AS [existencia],
	p.precio AS [precio],
	p.existencia * p.precio AS [valor_inventario]
FROM productos AS p
WHERE NOT p.existencia > 400
ORDER BY precio DESC;

SELECT
	p.codigo AS [codigo_producto],
	p.existencia AS [existencia],
	p.precio AS [precio],
	p.existencia * p.precio AS [valor_inventario]
FROM productos AS p
WHERE  p.existencia <= 400
ORDER BY precio DESC;

--Mostrar los empleados de los departamentos 1 o 2 que tengan salario mayor a 25,000

SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_departamento
FROM empleados as e
WHERE	(e.id_departamento=1
		OR
		e.id_departamento=2)
	AND
	e.salario>25000
ORDER BY e.id_departamento ASC;

-- Mostrar los empleados que no tienen jefe
SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_departamento
FROM empleados as e
WHERE  e.id_jefe IS NOT NULL;
--NULL no se compara con un =, es con un IS


--OPERADOR BETWEEN
-- Permite comprobar si un valor se encuentra dentro de un rango inclusivo
/*========================================================================
WHERE columna BETWEEN limite_inferior AND limite_superior
========================================================================*/

-- Mostrar empleados con salario entre 15000 y 20,000 incluyendo ambos limites
SELECT
	e.id_empleado,
	e.nombre,
	e.salario
FROM empleados as e
WHERE salario BETWEEN 15000 AND 20000
ORDER BY 3 DESC;

-- Mostrar los productos que los precios estén en el rango de 100 y 200
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
FROM productos AS p
WHERE p.precio BETWEEN 100 AND 200;
-- Mostrar las ventas del 1 de enero de 2025 al 10 de enero de 2025
SELECT
	v.id_venta AS [numero_venta],
	v.id_cliente AS [cliente],
	v.id_empleado AS [vendedor],
	v.fecha AS [fecha_venta],
	UPPER (FORMAT(v.fecha,'MMMM','es-ES')) AS [mes_venta],
	UPPER (FORMAT (v.fecha, 'dddd', 'es-ES')) AS [dia_venta],
	DATEPART(YEAR,v.fecha) AS [año_venta]
FROM ventas AS v
WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-10'
ORDER BY [cliente] ASC;

-- Mostrar los productos que su rango de precios no estén entre 100 y 400
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
FROM productos AS p
WHERE p.precio NOT BETWEEN 100 AND 400
ORDER BY precio ASC;


--OPERADOR IN
-- Permite comparar una columna con una lista de valores

/*========================================================================
WHERE columna IN (valor_1, valor_2, valor_3)
========================================================================*/

-- Mostrar productos pertenecientes a las categorías 1,7 o 12
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	p.id_categoria
FROM productos AS p
WHERE p.id_categoria IN (1,7,12)
ORDER BY p.id_categoria ASC;

SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	p.id_categoria
FROM productos AS p
WHERE p.id_categoria =1 
	OR
	p.id_categoria =7
	OR
	p.id_categoria =12
ORDER BY p.id_categoria ASC;

-- Mostrar productos no pertenecientes a las categorías 1,7 o 12
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	p.id_categoria
FROM productos AS p
WHERE p.id_categoria NOT IN (1,7,12)
ORDER BY p.id_categoria ASC;
