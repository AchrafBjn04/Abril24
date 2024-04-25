CREATE TABLE socio(
	id_socio SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	apellido VARCHAR(255),
	direccion VARCHAR(255),
);
 
CREATE TABLE barco(
	matricula SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	num_amarre INTEGER,
	cuota INTEGER,
	id_socio INTEGER REFERENCES socio (id_socio)
);
 
CREATE TABLE patron(
	dni SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	apellidos VARCHAR(255),
	direccion VARCHAR(255)
);
 
CREATE TABLE salida(
	id_salida SERIAL PRIMARY KEY,
	fecha DATE,
	hora TIME,
	detino VARCHAR(255),
	matricula_barco INTEGER REFERENCES barco (matricula),
	dni_patron INTEGER REFERENCES patron (dni)
);