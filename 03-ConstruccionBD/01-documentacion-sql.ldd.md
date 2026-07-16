# Construcción de Base de Datos con SQL-LDD

SQL (Structured Query Language) se divide en cinco grandes categorias: 
1. **DDL (Data Definition Language)**
2. **DML (Data Manipulation Language)**
3. **DQL (Data Query Language)**
4. DCL (Data Control Lamguage)
5. TCL (Transaction Control Language)

## SQL-DDL

**Lenguaje de definicion de datos**

Se utiliza para **crear y modificar la estructura** de una base de datos

Con DDL trabajamos con los objetos de la base de datos: 
- Base de datos
- Tablas 
- Listas
- Indices
- Restricciones
- Esquemas
- Store Procedures
- Trigger
- Functions

**Comandos principales**

| Comando | Funcion |
|-----------|-----------|
| CREATE    | Crear objetos  | 
| ALTER    | Modifica objetos  | 
| DROP   | Eliminar objetos   | 
| TRUNCATE   | Vaciar una tabla    |

## SQL-DML

**Lenguaje de manipulacion de datos**

Sirver para **trabajar con la informacion almacenada** aqui no cambia la estructura sino los registros.

**Comandos principales**

| Comando | Funcion |
|-----------|-----------|
| INSERT    | Inserta los registros  | 
| UPDATE   | Actualizar registros  | 
| DELETE   | Eliminar objetos   | 

## SQL-DQL

**Lenguaje de consulta de datos**

Su función es **consultar informacion**

**comando principal** 

| Comando | Funcion |
|-----------|-----------|
| SELECT    | Consultar informacion  | 

Generalmente se combina con: 

- WHERE 
- ORDER BY
- GROUP BY
- HAVING
- JOIN (LEFT, RIGHT, INNER, CROSS Y FULL)
- DISTINCT
- TOP / LIMIT
- Funciones de Agregado (SUM, AVG, MAX, MIN, COUNT)
- Funciones de Ventana (window function)

# Nomenclatura snake_case

**snake_case** es la convención más recomendada de ahora si se busca una nomenclatura moderna, portable y alienada con buenas practicas y en distintos motores de base de datos, la razón es que funciona de forma consistente en **SQL Server, MySQL** y especialmente en **postgreSQL**. Con snake_case se evitan problemas de mayusculas y se hacen las consultas sean más legibles.

**Estandar de construcción:**

| Objeto | Convención | Ejemplo |
|-----------|-----------|-----------|
| Base de Datos   | snake_case   | control_escolar    |
| Esquema   | snake_case   | ventas, rh, seguridad    |
| Tabla   | Singular en snake_case   | cliente, pedido,detalle_pedido    |
| Columna   | snake_case   | cliente_id, fecha_registro, nombre, correro_electronico    |
| PK   | <tabla>_if   | cliente_id, categoria_id    |
| FK   | Igual que la PK referenciada   | cliente_id, producto_id    |
| Tabla puente   | <tabla1>_<tabla2>   | alumno_curso, alumno_producto   |

**Nombrar las restricciones**

- pk_cliente
- fk_pedido_cliente -> pk_tablaorigen_tablareferenciada
- uq_cliente_correo_electronico
- ck_producto_precio
- df_cliente_activo

## Alter Table 

Permite modificar una tabla existente

- Agregar columnas 
- Eliminar columnas
- Modificar columnas
- Agregar restricciones
- Eliminar restricciones
