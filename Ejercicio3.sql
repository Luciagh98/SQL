/*Ejercicio 3
Nivel de dificultad: Difícil*/

/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).*/

CREATE TABLE IF NOT EXISTS Productos(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	precio INT
)

/*2. Inserta al menos cinco registros en la tabla "Productos".*/

INSERT INTO public.Productos(id, nombre, precio)
VALUES (1,'Cepillo de dientes', 10)
VALUES (2,'Toalla', 12)
VALUES (3,'Alfombrilla', 3)
VALUES (4,'Crema solar', 4)
VALUES (5,'Cepillo', 15)

/*3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE public.Productos
SET precio = 32
WHERE id =3;

/*4. Elimina un producto de la tabla "Productos".*/

DELETE FROM public.Productos
WHERE id = 4;

/*5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").*/

CREATE TABLE IF NOT EXISTS Usuarios(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	producto VARCHAR(255) NOT NULL
	CONSTRAINT FK_producto_id FOREIGN KEY (producto_id) REFERENCES Productos(id)
)

SELECT * FROM public.Productos p
INNER JOIN public.Usuarios u
ON p.id = u.producto_id