/*Ejercicio 2
Nivel de dificultad: Fácil*/

/*1. Crea una base de datos llamada "MiBaseDeDatos".*/

CREATE DATABASE MiBaseDeDatos;

/*2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).*/

CREATE TABLE IF NOT EXISTS Usuarios(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	edad INT
)

/*3. Inserta dos registros en la tabla "Usuarios".*/

INSERT INTO MiBaseDeDatos.Usuarios(id, nombre, edad)
VALUES (1, 'Pedro', 20)
VALUES (2, 'Juan', 30)

/*4. Actualiza la edad de un usuario en la tabla "Usuarios".*/

UPDATE  MiBaseDeDatos.Usuarios
SET edad = 25
WHERE id = 1;

/*5. Elimina un usuario de la tabla "Usuarios".*/

DELETE FROM MiBaseDeDatos.Usuarios
WHERE id = 2;

/*Nivel de dificultad: Moderado
1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).*/

CREATE TABLE IF NOT EXISTS Ciudades(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	pais VARCHAR(255)
)

/*2. Inserta al menos tres registros en la tabla "Ciudades".*/

INSERT INTO MiBaseDeDatos.Ciudades(id, nombre, pais)
VALUES (1, 'Madrid', 'España')
VALUES (2, 'Oslo', 'Noruega')
VALUES (3 , 'París', 'Francia')

/*3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".*/

ALTER TABLE Usuarios
ADD COLUMN Usuarios_pais INT
CONSTRAINT FK_ciudades_id FOREIGN KEY (Usuarios_pais) REFERENCES Ciudades(id)

/*4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).*/

SELECT * FROM MiBaseDeDatos.Usuarios
LEFT JOIN MiBaseDeDatos.Ciudades
ON MiBaseDeDatos.Usuarios.Usuarios_pais = MiBaseDeDatos.Ciudades.id

/*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN). */

SELECT * FROM MiBaseDeDatos.Usuarios
INNER JOIN MiBaseDeDatos.Ciudades
ON MiBaseDeDatos.Usuarios.Usuarios_pais = MiBaseDeDatos.Ciudades.id
