-- PREENTREGA SQL - PROYECTO RETAIL
-- PARTE 1: CREACION DE TABLAS (DDL)

CREATE TABLE clientes (
    clientes_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    edad INT CHECK (edad >= 18)
);

-- PARTE 2: TABLA PRODUCTOS

CREATE TABLE productos (
    productos_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) CHECK (precio > 0),
    stock INT CHECK (stock >= 0)
);

-- PARTE 3: TABLA VENTAS

CREATE TABLE ventas (
    ventas_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL REFERENCES clientes(clientes_id),
    producto_id INT NOT NULL REFERENCES productos(productos_id),
    cantidad INT NOT NULL CHECK (cantidad > 0),
    fecha DATE NOT NULL
);

-- PARTE 4: CARGA INICIAL DE DATOS (DML)

BEGIN;

-- Insertar 5 clientes
INSERT INTO clientes (nombre, email, edad)
VALUES
    ('Lucia', 'luciajirreta2@gmail.com', 22),
    ('Facundo', 'facundobertua@gmail.com', 27),
    ('Ivana', 'ivanasc@gmail.com', 52),
    ('Marcelo', 'marcelojirreta@gmail.com', 49),
    ('Alicia', 'aliciaraquel@gmail.com', 83);

-- Insertar 5 productos
INSERT INTO productos (nombre, categoria, precio, stock)
VALUES
    ('Notebook', 'Electrónica', 1200.00, 10),
    ('Mouse', 'Electrónica', 25.50, 30),
    ('Teclado', 'Electrónica', 75.00, 15),
    ('Silla', 'Muebles', 200.00, 8),
    ('Escritorio', 'Muebles', 350.00, 5);

-- Insertar 5 ventas
INSERT INTO ventas (cliente_id, producto_id, cantidad, fecha)
VALUES
    (1, 2, 1, '2026-11-01'),
    (2, 1, 2, '2026-11-02'),
    (3, 4, 1, '2026-11-03'),
    (4, 3, 3, '2026-11-04'),
    (5, 5, 1, '2026-11-05');

COMMIT;

-- PARTE 5: ACTUALIZACION DE PRECIOS

UPDATE productos
SET precio = precio * 1.05
WHERE categoria = 'Electrónica';

-- PARTE 6: ELIMINACION DE UNA VENTA DE PRUEBA

DELETE FROM ventas
WHERE ventas_id = 5;

