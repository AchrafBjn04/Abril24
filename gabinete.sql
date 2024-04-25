CREATE TABLE cliente(
	dni SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	direccion VARCHAR(255)
);

CREATE TABLE procurador(
	dni SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	direccion VARCHAR(255)
);

CREATE TABLE asunto(
	num_expediente SERIAL PRIMARY KEY,
	tramite VARCHAR(20) CHECK (tramite IN ('En tramite', 'Archivado')),
	fecha_inicio DATE,
	fecha_fin DATE,
	dni_cliente INTEGER REFERENCES cliente (dni),
	dni_procurador INTEGER REFERENCES procurador (dni)
);

CREATE TABLE asuntoProcurador(
	num_expediente INTEGER,
	dni_procurador VARCHAR(9),
	PRIMARY KEY (num_expediente, dni_procurador),
	FOREIGN KEY (num_expediente) REFERENCES asunto (num_expediente),
	FOREIGN KEY (dni_procurador) REFERENCES procurador (dni)
);