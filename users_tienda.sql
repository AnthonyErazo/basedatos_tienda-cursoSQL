SELECT*
FROM mysql.user;
-- Crear el usuario solo de lectura
-- CREATE USER 'usuario_lectura'@'localhost' IDENTIFIED BY 'contraseña_lectura';

-- Crear el usuario de lectura e inserción/modificación
-- CREATE USER 'usuario_lectura_escritura'@'localhost' IDENTIFIED BY 'contraseña_lectura_escritura';

-- Conceder permisos de solo lectura para todas las tablas
-- GRANT SELECT ON tienda_ropa.* TO 'usuario_lectura'@'localhost';

-- Usuario de lectura no tiene permisos de eliminación
REVOKE DELETE ON tienda_ropa.* FROM 'usuario_lectura'@'localhost';



-- Conceder permisos de lectura, inserción y modificación para todas las tablas
-- GRANT SELECT, INSERT, UPDATE ON tienda_ropa.* TO 'usuario_lectura_escritura'@'localhost';

-- Usuario de lectura e inserción no tiene permisos de eliminación
REVOKE DELETE ON tienda_ropa.* FROM 'usuario_lectura_escritura'@'localhost';


