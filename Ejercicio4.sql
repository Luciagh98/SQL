/*Ejercicio 4
Nivel de dificultad: Experto*/

/*1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").*/

CREATE TABLE IF NOT EXISTS Usuarios(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	producto VARCHAR(255) NOT NULL,
)

CREATE TABLE IF NOT EXISTS Productos(
	id SERIAL PRIMARY KEY,
	producto VARCHAR(255) NOT NULL,
	precio DECIMAL,
)

CREATE TABLE IF NOT EXISTS Pedidos(
	id SERIAL PRIMARY KEY,
	id_usuario INT,
	id_producto INT

	CONSTRAINT FK_id_producto FOREIGN KEY (id_producto) REFERENCES Productos(id)
	CONSTRAINT FK_id_usuario FOREIGN KEY (id_uruario) REFERENCES Usuarios(id)
)

/*2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.*/

INSERT INTO public.Pedidos(id, id_usuario, id_producto)
VALUES (1,10,5),
        (2,1,12),
        (3,5,3);


/*3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).*/

SELECT U.nombre AS nombre_usuario,
    COALESCE(P.producto, 'Ningún pedido') AS nombre_producto
FROM Usuarios U
LEFT JOIN Pedidos PD ON U.id = PD.id_usuario
LEFT JOIN Productos P ON PD.id_producto = P.id;

/*4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).*/

SELECT U.nombre AS nombre_usuario,
    COALESCE(COUNT(PD.id), 0) AS total_pedidos
FROM Usuarios U
LEFT JOIN Pedidos PD ON U.id = PD.id_usuario
GROUP BY U.id, U.nombre;

/*5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE) */

ALTER TABLE Pedidos
ADD COLUMN cantidad INT;

UPDATE Pedidos
SET cantidad = 1;


