CREATE TABLE almacenes(
	id_almacen SERIAL PRIMARY KEY,
	fecha_apertura DATE,
	direccion VARCHAR(255),
	id_provincia INTEGER
);
 
CREATE TABLE provincias(
	id_provincia SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	extension NUMERIC,
	id_almacen INTEGER REFERENCES almacenes (id_almacen)
);
 
CREATE TABLE poblaciones(
	id_poblacion SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	habitantes INTEGER,
	id_provincia INTEGER REFERENCES provincias (id_provincia)
);
 
CREATE TABLE socios(
	id_socio SERIAL PRIMARY KEY,
	dni VARCHAR(9),
	nombre VARCHAR(255),
	apellidos VARCHAR(255),
	num_telefono INTEGER,
	id_socio_avalador INTEGER REFERENCES socios (id_socio),
	id_poblacion INTEGER REFERENCES poblaciones (id_poblacion)
);
 
CREATE TABLE pedidos(
	id_pedido SERIAL PRIMARY KEY,
	forma_envio VARCHAR(255),
	forma_pago VARCHAR(255),
	id_socio INTEGER REFERENCES socios (id_socio)
);
 
CREATE TABLE detalle_pedidos(
	id_pedido SERIAL,
	consecutivo INTEGER,
	isbn VARCHAR(255),
	cantidad INTEGER,
	PRIMARY KEY(id_pedido, consecutivo),
	FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido)
);
 
CREATE TABLE colecciones(
	id_coleccion SERIAL PRIMARY KEY,
	volumen INTEGER
);
 
CREATE TABLE libros(
	isbn VARCHAR(255) PRIMARY KEY,
	titulo VARCHAR(255),
	autor VARCHAR(255),
	editorial VARCHAR(255),
	id_coleccion INTEGER REFERENCES colecciones (id_coleccion)
);
 
CREATE TABLE stock(
	cantidad INTEGER,
	isbn VARCHAR(255) REFERENCES libros (isbn),
	id_almacen INTEGER REFERENCES almacenes (id_almacen)
);