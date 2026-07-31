-- crear la base de datos
CREATE DATABASE compras;

-- usar la base de datos
USE compras;

-- tabla cliente

CREATE TABLE cliente(
	cliente_id INT IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	rfc VARCHAR(13) NOT NULL,
	
	CONSTRAINT pk_cliente
	PRIMARY KEY (cliente_id),
	CONSTRAINT uq_cliente_rfc
	UNIQUE (rfc),
	CONSTRAINT ck_cliente_rfc
	CHECK (
    rfc LIKE '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z0-9][A-Z0-9][A-Z0-9]'
    OR
    rfc LIKE '[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z0-9][A-Z0-9][A-Z0-9]'
	)
);
GO

-- tabla pedido

CREATE TABLE pedido(
	pedido_id INT IDENTITY(1,1) NOT NULL,
	fecha_pedido DATETIME2 NOT NULL
	CONSTRAINT df_pedido_fecha_pedido
	DEFAULT SYSDATETIME(),
	cliente_id INT NOT NULL,

	CONSTRAINT pk_pedido
	PRIMARY KEY (pedido_id),
	CONSTRAINT fk_pedido_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente (cliente_id)
);
GO

-- tabla producto

CREATE TABLE producto (
	producto_id CHAR(5) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	precio DECIMAL(10,2) NOT NULL,

	CONSTRAINT pk_producto
	PRIMARY KEY (producto_id),
	CONSTRAINT ck_pedido_precio
	CHECK(precio > 0.0)
);
GO


-- tabla detalle

CREATE TABLE detalle(
	pedido_id INT NOT NULL,
	producto_id CHAR(5) NOT NULL,
	cantidad INT NOT NULL,
	precio_venta DECIMAL(10,2) NOT NULL,

	CONSTRAINT pk_detalle
	PRIMARY KEY (pedido_id,producto_id),
	CONSTRAINT fk_detalle_pedido
	FOREIGN KEY (pedido_id)
	REFERENCES pedido(pedido_id),
	CONSTRAINT fk_detalle_producto
	FOREIGN KEY (producto_id)
	REFERENCES producto(producto_id),

	CONSTRAINT ck_detalle_cantidad
	CHECK(cantidad>0),
	CONSTRAINT ck_detalle_precio_venta
	CHECK(precio_venta > 0.0)
);
GO