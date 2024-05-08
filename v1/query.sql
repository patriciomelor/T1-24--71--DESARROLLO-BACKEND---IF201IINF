CREATE DATABASE EV1_BACKEND_SEC71;
CREATE USER 'PatricioMelo-Sec71'@'localhost' IDENTIFIED BY 'PMR-Ciisa-71';
GRANT ALL PRIVILEGES ON EV1_BACKEND_SEC71 . * TO 'PatricioMelo-Sec71'@'localhost';
FLUSH PRIVILEGES;

USE EV1_BACKEND_SEC70;

---------- CREAR TABLA PARA EVALUACIÓN 1 BACKEND----------------
CREATE TABLE mantenedor (
    id INT PRIMARY KEY,
    nombre_completo VARCHAR(50) NOT NULL UNIQUE, -- COSTRAINT
    direccion VARCHAR (60),
    numero_telefono VARCHAR (15),
    correo VARCHAR (50),
    solicitud_procesada BOOLEAN NOT NULL DEFAULT FALSE
)

---------------METODOS---------------------------
-- GET / ALL
SELECT id, nombre_completo,direccion,numero_telefono,correo,solicitud_procesada FROM mantenedor;

-- GET / BY ID
SELECT id, nombre_completo,direccion,numero_telefono,correo,solicitud_procesada FROM mantenedor WHERE id = 1;

-- POST
INSERT INTO mantenedor (nombre_completo, direccion, numero_telefono, correo, solicitud_procesada) 
VALUES 
('Patricio López', 'Calle Luna 123', '+56950402984', 'patricio.lopez@example.com', TRUE),
('Camila Silva Rojas', 'Avenida del Sol 456', '+56950371928', 'camila.silva@example.com', FALSE),
('Juan Pérez González', 'Calle Estrella 789', '+56950817263', 'juan.perez@example.com', TRUE),
('María Sánchez Torres', 'Avenida Central 321', '+56950783642', 'maria.sanchez@example.com', FALSE),
('Andrés Rodríguez Díaz', 'Calle Luna 987', '+56950283461', 'andres.rodriguez@example.com', TRUE);


-----------HABILITAR Y DESHABILITAR-------------------

-- PATCH / ENABLE
UPDATE mantenedor SET solicitud_procesada = true WHERE id = 2;
-- PATCH / DISABLE
UPDATE mantenedor SET solicitud_procesada = false WHERE id = 3;


------------ACTUALIZAR-----------------------------------
-- PUT
UPDATE mantenedor SET nombre_completo = 'Pablo Gandolfo Bustos' WHERE id =4 ;


----------BORRAR-------------------------------------

-- DELETE
DELETE FROM mantenedor WHERE id = 5;
