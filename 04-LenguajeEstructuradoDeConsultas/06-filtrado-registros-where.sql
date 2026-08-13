/* ======================================================================
DQL (Data Query Languaje) en SQLSERVER

Archivo: 06-filtrado.registros.where.sql

Descripcion: Se recuperan unicamente las filas que cumplen determinadas 
condiciones mendiante la clausula where

ORDEN DE EJECUCIÓN:

FROM ( JOINS (INNER, LEFT, RIGHT))
WHERE
GROUP BY
HAVING
SELECT
DISTINCT
ORDER BY
TOP

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
