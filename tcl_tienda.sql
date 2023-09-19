-- Inicio de la transacción
START TRANSACTION;

-- DELETE FROM venta WHERE id_venta = 1;
-- DELETE FROM venta WHERE id_venta = 2;

-- ROLLBACK;
-- COMMIT;

-- Inicio de la transacción
START TRANSACTION;

-- Insertar ocho nuevos registros en la tabla "cliente"
INSERT INTO cliente (id_cliente, nombre_cliente, apellido_cliente, telefono_cliente, dni_cliente, direccion_cliente, usuario_cliente, contrasena_cliente, pais_cliente, correo_cliente, fecha_nacimiento_cliente, genero_cliente)
VALUES
    (101, 'Nuevo', 'Cliente1', '+1234567890', '2234567815', 'Calle 123, Ciudad A', 'nuevo1', 'contrasena1', 'País 1', 'nuevo1@example.com', '1990-01-01', 'Género 1'),
    (102, 'Nuevo', 'Cliente2', '+2345678901', '4345678815', 'Calle 234, Ciudad B', 'nuevo2', 'contrasena2', 'País 2', 'nuevo2@example.com', '1990-02-02', 'Género 2'),
    (103, 'Nuevo', 'Cliente3', '+3456789012', '5456783214', 'Calle 345, Ciudad C', 'nuevo3', 'contrasena3', 'País 3', 'nuevo3@example.com', '1990-03-03', 'Género 3'),
    (104, 'Nuevo', 'Cliente4', '+4567890123', '6567894213', 'Calle 456, Ciudad D', 'nuevo4', 'contrasena4', 'País 4', 'nuevo4@example.com', '1990-04-04', 'Género 4');
SAVEPOINT savepoint_4;
INSERT INTO cliente (id_cliente, nombre_cliente, apellido_cliente, telefono_cliente, dni_cliente, direccion_cliente, usuario_cliente, contrasena_cliente, pais_cliente, correo_cliente, fecha_nacimiento_cliente, genero_cliente)
VALUES
    (105, 'Nuevo', 'Cliente5', '+5678901234', '4642141234', 'Calle 567, Ciudad E', 'nuevo5', 'contrasena5', 'País 5', 'nuevo5@example.com', '1990-05-05', 'Género 5'),
    (106, 'Nuevo', 'Cliente6', '+6789012345', '4784442245', 'Calle 678, Ciudad F', 'nuevo6', 'contrasena6', 'País 6', 'nuevo6@example.com', '1990-06-06', 'Género 6'),
    (107, 'Nuevo', 'Cliente7', '+7890123456', '7890142456', 'Calle 789, Ciudad G', 'nuevo7', 'contrasena7', 'País 7', 'nuevo7@example.com', '1990-07-07', 'Género 7'),
    (108, 'Nuevo', 'Cliente8', '+8901234567', '8901424567', 'Calle 890, Ciudad H', 'nuevo8', 'contrasena8', 'País 8', 'nuevo8@example.com', '1990-08-08', 'Género 8');
SAVEPOINT savepoint_8;
select*from cliente;
ROLLBACK TO SAVEPOINT savepoint_4;
COMMIT;
select*from cliente;
