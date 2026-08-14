/* ======================================================================
DQL (Data Query Languaje) en SQLSERVER

Archivo: 01-create-database-sql

Descripcion: Crear la base de datos para la practica de las consultas
========================================================================*/

USE master;
IF OBJECT_ID('comercial_db') IS NOT NULL
BEGIN 
  ALTER DATABASE comercial_db
  SET SINGLE_USER -- cierra todas las conexiones a solo 1
  WITH ROLLBACK IMMEDIATE; -- Elimina las transacciones

  DROP DATABASE comercial_db;
END
GO

CREATE DATABASE comercial_db;
GO

USE comercial_db;
GO

PRINT 'La base de datos comercial_db se creo correctamente';
GO
-- SELECT OBJECT_ID('comercial_db')