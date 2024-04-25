CREATE TABLE zoos(
	id_zoo SERIAL PRIMARY KEY,
	pais VARCHAR(255),
	ciudad VARCHAR(255),
	nombre VARCHAR(255),
	tamanyo INTEGER,
	presupuesto_anual INTEGER
);

CREATE TABLE especie(
	id_especie SERIAL PRIMARY KEY,
	nombre_vulgar VARCHAR(255),
	nombre_cientifico VARCHAR(255),
	peligro_extinicion BOOLEAN,
	familia VARCHAR(255)
);

CREATE TABLE animal (
    id_animal SERIAL PRIMARY KEY NOT NULL,
    pais VARCHAR(255),
    sexo CHAR(1),
    continente VARCHAR(255),
    fecha_nacimiento DATE,
    id_zoo INTEGER REFERENCES zoos (id_zoo),
    id_especie INTEGER REFERENCES especie (id_especie)
);