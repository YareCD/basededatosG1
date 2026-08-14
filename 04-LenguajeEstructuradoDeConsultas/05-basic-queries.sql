/* ======================================================================
DQL (Data Query Languaje) en SQLSERVER

Archivo: 05-basic-queries.sql

Descripcion: Se realizan consultas basicas con SELECT
========================================================================*/
 USE comercial_db;
 GO

-- uso de SELECT *
/*
-- sintaxis

SELECT *
FROM nombre_tabla;

Nota: el asterisco significa todas las columnas de la tabla

No se recomienda utilizarla siempre:

	1. Reduce la claridad de la consulta 
	2. Puede aumentar el consumo de recursos
	3. Puede afectar aplicaciones futuras 

*/

SELECT * 
FROM productos;

-- Proyeccion de la tabla productos

SELECT 
	codigo, 
	nombre,
	precio
FROM productos;
GO

-- Alias de columna (sobrenombre que se le pone a un campo)

SELECT 
	codigo AS codigo_producto,
	nombre AS nombre_producto,
	precio AS precio_unitario
FROM productos;

-- Alias con espacios
SELECT 
	codigo AS [codigo producto],
	nombre AS [nombre producto],
	precio AS [precio unitario]
FROM productos;

SELECT 
	codigo AS 'codigo producto',
	nombre AS 'nombre producto',
	precio AS 'precio unitario'
FROM productos;

-- Alias sin la instruccion AS (NO RECOMENDADO)
SELECT 
	codigo codigo_producto,
	nombre nombre_producto,
	precio precio_unitario
FROM productos;

SELECT 
	codigo [codigo producto],
	nombre [nombre producto],
	precio [precio unitario]
FROM productos;

-- Alias de tabla
/*
	Es útil en los joins y en nombres ambigüos
*/

SELECT 
	p.codigo, 
	p.nombre,
	p.precio
FROM productos AS p;
GO

-- Forma larga
SELECT
	categorias.id_categoria,
	categorias.nombre,
	productos.id_producto, 
	productos.nombre, 
	productos.precio
FROM categorias
INNER JOIN 
productos
ON categorias.id_categoria = productos.id_categoria;
GO

-- forma corta usando un ALIAS
SELECT
	c.id_categoria,
	c.nombre,
	p.id_producto, 
	p.nombre, 
	p.precio
FROM categorias AS c
INNER JOIN 
productos AS p
ON c.id_categoria = p.id_categoria;
GO

SELECT 
	p.codigo, 
	p.nombre,
	p.precio
FROM productos p;
GO
-- La mas recomendada
SELECT 
	p.codigo AS Código, 
	p.nombre AS [nombre del producto],
	p.precio AS 'precio unitario'
FROM productos AS p;
GO

-- Columnas calculadas, Campos Calculados y E-R (Atributo derivado)

-- seleccionar el código, nombre, precio, existencia
-- y el valor del inventario

SELECT 
	p.codigo AS codigo_producto,
	p.nombre AS nombre_producto,
	p.precio AS precio_unitario,
	p.existencia,
	(p.existencia * p.precio) AS precio_inventario --campo calculado
FROM productos AS p;

/*
 OPERADORES ARITMETICOS

	+ suma
	-  resta
	* multiplicacion 
	/ division
	% modulo - residuo de la división
*/

SELECT 
	e.nombre,
	e.apellido_paterno,
	e.salario AS salario_anual

FROM empleados AS e;
GO

-- seleccionar el detalle de las ventas, mostrando 
-- numero de venta, cantidad vendida, precio, descuento
-- calcular el importe bruto (cantidad*precio)
-- calcular el importe con descuento (importe_bruto*descuento/100)
-- calcular el importe neto, (importe bruto * 1 menos el descuento / 100)

SELECT 
	dv.id_venta AS #venta,
	dv.cantidad AS cantidad_vendida,
	dv.precio AS [precio de venta],
	dv.descuento AS 'descuento de venta',
	(dv.cantidad * dv.precio) AS importe_bruto,
	((dv.cantidad * dv.precio)/100.0) AS importe_descuento,
	dv.cantidad * dv.precio * (1 - descuento /100) AS importe_neto

FROM detalle_ventas AS dv;
GO