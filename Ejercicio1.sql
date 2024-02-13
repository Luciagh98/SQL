/* Ejercicio 1
1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto). */

CREATE TABLE IF NOT EXISTS Clientes(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	email VARCHAR(255)
)

/* 2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y email="juan@example.com".*/

INSERT INTO public.Clientes(id, nombre, email)
VALUES (1,'Juan',"juan@example.com")

/*3. Actualizar el email del cliente con id=1 a "juan@gmail.com".*/

UPDATE public.Clientes
SET email = "juan@gmail.com"
WHERE id = 1;

/*4. Eliminar el cliente con id=1 de la tabla "Clientes".*/

DELETE FROM public.Clientes
WHERE id = 1;

/*5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero).*/

CREATE TABLE IF NOT EXISTS Pedidos(
	id SERIAL PRIMARY KEY,
	cliente_id VARCHAR(255) NO NULL,
  producto VARCHAR(255) NOT NULL
	cantidad INT NOT NULL,
	CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
)

/*6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2.*/

INSERT INTO public.Pedidos(id, cliente_id, producto, cantidad)
VALUES (1, 1 , 'Camiseta',2)

/*7. Actualizar la cantidad del pedido con id=1 a 3.*/

UPDATE public.Pedidos
SET cantidad = 3
WHERE id = 1;

/*8. Eliminar el pedido con id=1 de la tabla "Pedidos".*/

DELETE FROM public.Pedidos
WHERE id = 1;

/*9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal).*/

CREATE TABLE IF NOT EXISTS Productos(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NO NULL,
  precio DECIMAL NOT NULL,
)

/*10. Insertar varios productos en la tabla "Productos" con diferentes valores.*/

INSERT INTO public.Productos(id, name, precio)
VALUES (1, "Camiseta", 15.5)
VALUES (1, "Pantalón", 12.7)
VALUES (1, "Falda", 5.74)

/*11. Consultar todos los clientes de la tabla "Clientes".*/

SELECT * FROM public.Clientes

/*12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes.*/

SELECT * FROM public.Clientes
LEFT JOIN public.Pedidos
ON public.Clientes.id = public.Pedidos.cliente_id

/*13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.*/

SELECT * FROM public.productos
WHERE precio > 50

/*14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5.*/

SELECT * FROM public.Pedidos
WHERE cantidad >= 5

/*15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A".*/

SELECT * FROM public.Clientes
WHERE name ILIKE "A%"

/*16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente.*/

SELECT Clientes.nombre AS nombre_cliente,
    COUNT(Pedidos.id) AS total_pedidos
FROM Clientes
INNER JOIN Pedidos ON Clientes.id = Pedidos.cliente_id

/*17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto.*/

SELECT Productos.nombre AS nombre_producto,
    SUM(DP.cantidad) AS cantidad_total_pedidos
FROM Productos p
INNER JOIN DetallesPedidos DP ON p.id = DP.producto_id

/*18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/

ALTER TABLE Pedidos
ADD COLUMN fecha DATE;

/*19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto".*/

ALTER TABLE Pedidos
ADD COLUMN producto_pedido INT

ALTER TABLE Pedidos
CONSTRAINT FK_producto_pedido FOREIGN KEY (producto_pedido) REFERENCES Pedidos(producto)

/*20. Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa. */

SELECT Clientes.nombre AS nombre_cliente,
    Productos.nombre AS nombre_producto,
    DP.cantidad AS cantidad_pedido
FROM Pedidos PD
JOIN Clientes C ON PD.cliente_id = C.id
JOIN Productos P ON PD.producto_id = P.id
JOIN DetallesPedidos DP ON PD.id = DP.pedido_id;