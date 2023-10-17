CREATE SCHEMA tienda_ropa;
CREATE TABLE cliente(
	id_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(50) NOT NULL,
    apellido_cliente VARCHAR(50) NOT NULL,
    telefono_cliente VARCHAR(20) NOT NULL,
    dni_cliente VARCHAR(20) NOT NULL UNIQUE,
    direccion_cliente VARCHAR(100) NOT NULL,
    usuario_cliente VARCHAR(100) UNIQUE NOT NULL,
    contrasena_cliente VARCHAR(100) NOT NULL,
    pais_cliente VARCHAR(50) NOT NULL,
    correo_cliente VARCHAR(50) NOT NULL,
    fecha_nacimiento_cliente DATE NOT NULL,
    genero_cliente VARCHAR(100) NOT NULL
);
CREATE TABLE producto(
	id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL UNIQUE,
    precio_producto DECIMAL(10,2) NOT NULL,
    stock_producto INT NOT NULL,
    descripcion_producto TEXT,
    marca_producto VARCHAR(50) NOT NULL,
    descuento_producto DECIMAL(10,2),
    fecha_lanzamiento DATE
);
CREATE TABLE categoria(
	id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL,
    descripcion_categoria TEXT
);
CREATE TABLE categoria_producto(
	id_categoria_producto INT PRIMARY KEY,
    id_categoria INT,
    id_producto INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
CREATE TABLE venta(
	id_venta INT PRIMARY KEY,
    id_cliente INT,
    total_venta DECIMAL(10,2) NOT NULL,
    fecha_venta DATE NOT NULL,
    detalle_venta TEXT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
CREATE TABLE venta_producto(
	id_venta_producto INT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    precio_unitario_venta_producto DECIMAL(5,2) NOT NULL,
    subtotal_venta_producto DECIMAL(5,2) NOT NULL,
    cantidad_venta_producto INT NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
CREATE TABLE proveedor(
	id_proveedor INT PRIMARY KEY,
    nombre_proveedor VARCHAR(50) NOT NULL,
    correo_proveedor VARCHAR(50) NOT NULL,
    telefono_proveedor VARCHAR(20) NOT NULL,
    direccion_proveedor VARCHAR(100) NOT NULL,
    pais_proveedor VARCHAR(50) NOT NULL,
    ruc_proveedor VARCHAR(20) NOT NULL,
    cuenta_bancaria_proveedor VARCHAR(20) NOT NULL
);
CREATE TABLE compra(
	id_compra INT PRIMARY KEY,
    id_proveedor INT,
    fecha_compra DATE NOT NULL,
    detalle_compra TEXT,
    total_compra DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);
CREATE TABLE compra_producto(
	id_compra_producto INT PRIMARY KEY,
    id_compra INT,
    id_producto INT,
    cantidad_compra_producto INT NOT NULL,
    precio_unitario_compra_producto DECIMAL(5,2) NOT NULL,
    subtotal_compra_producto DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES compra(id_compra),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
CREATE TABLE repartidor(
	id_repartidor INT PRIMARY KEY,
    nombre_repartidor VARCHAR(50) NOT NULL,
    apellido_repartidor VARCHAR(50) NOT NULL,
    usuario_repartidor VARCHAR(100) UNIQUE NOT NULL,
    contrasena_repartidor VARCHAR(100) NOT NULL,
    dni_repartidor VARCHAR(20) NOT NULL,
    direccion_repartidor VARCHAR(100) NOT NULL,
    telefono_repartidor VARCHAR(20) NOT NULL,
    correo_repartidor VARCHAR(50) NOT NULL,
    fecha_nacimiento_repartidor DATE NOT NULL
);
CREATE TABLE entrega(
	id_entrega INT PRIMARY KEY,
    id_venta INT,
    id_repartidor INT,
    fecha_entrega DATE NOT NULL,
    detalle_entrega TEXT,
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY (id_repartidor) REFERENCES repartidor(id_repartidor)
);

INSERT INTO producto (id_producto, nombre_producto, precio_producto, stock_producto, descripcion_producto, marca_producto, descuento_producto, fecha_lanzamiento) 
VALUES 
	(1, 'Shorts de Verano', 48.56, 45, 'Shorts cómodos y frescos para disfrutar del verano.', 'SunStyle', 40.8, '2023-03-21'),
	(2, 'Camisa a Rayas', 52.29, 49, 'Camisa a rayas de alta calidad con un diseño elegante.', 'ClothMasters', 9.74, '2023-05-22'),
	(3, 'Sweater Clásico', 72.37, 35, 'Sweater suave y cálido perfecto para los días frescos.', 'CozyKnits', 46.96, '2022-09-29'),
	(4, 'Tank Top Básico', 11.21, 33, 'Tank top versátil y cómodo para cualquier ocasión.', 'EssentialWear', 29.56, '2023-04-22'),
	(5, 'Hoodie Casual', 14.93, 78, 'Hoodie informal con capucha ajustable y diseño moderno.', 'UrbanChic', 4.12, '2022-10-01'),
	(6, 'Hoodie Acogedor', 18.83, 15, 'Hoodie con tejido suave y acogedor para días relajados.', 'ComfyCloth', 3.78, '2022-11-11'),
	(7, 'Vestido Elegante', 10.04, 50, 'Vestido elegante y versátil para eventos especiales.', 'EleganceAffair', 21.8, '2022-10-30'),
	(8, 'Blazer Moderno', 69.14, 2, 'Blazer moderno y sofisticado para un estilo profesional.', 'SharpLooks', 23.02, '2022-10-05'),
	(9, 'Crop Top Veraniego', 12.05, 63, 'Crop top con diseño fresco ideal para el verano.', 'SummerVibes', 2.05, '2023-02-15'),
	(10, 'Poncho Bohemio', 26.80, 59, 'Poncho con estilo bohemio y colores vibrantes.', 'BohoChic', 14.65, '2023-06-10'),
	(11, 'Falda de Flores', 39.82, 2, 'Falda con estampado floral y diseño femenino.', 'BlossomStyle', 10.29, '2022-10-27'),
	(12, 'Chamarra de Cuero', 129.99, 15, 'Chamarra de cuero genuino con un estilo audaz y moderno.', 'LeatherCraft', 15.00, '2023-08-14'),
	(13, 'Top Casual', 21.81, 7, 'Top casual y versátil para combinar con cualquier outfit.', 'EverydayChic', 3.8, '2023-05-18'),
	(14, 'Romper de Verano', 45.95, 13, 'Romper ligero y fresco perfecto para el verano.', 'SummerEscape', 49.85, '2023-05-24'),
	(15, 'Sweater Cálido', 60.76, 56, 'Sweater cálido y suave para mantenerte abrigado.', 'WarmEssentials', 6.44, '2023-06-30'),
	(16, 'Abrigo Elegante', 14.70, 13, 'Abrigo elegante y sofisticado para los días fríos.', 'ElegantCoat', 48.53, '2022-11-12'),
	(17, 'Chaqueta de Moda', 77.41, 60, 'Chaqueta de moda con diseño moderno y versátil.', 'TrendyStyle', 48.95, '2023-07-09'),
	(18, 'Jeans Clásicos', 32.94, 67, 'Jeans clásicos y cómodos para el uso diario.', 'ClassicDenim', 39.23, '2023-01-24'),
	(19, 'Top Elegante', 77.25, 10, 'Top elegante y sofisticado para ocasiones especiales.', 'ElegantTouches', 33.15, '2022-08-29'),
	(20, 'Hoodie con Estilo', 23.28, 44, 'Hoodie con estilo único y detalles modernos.', 'StyleFusion', 12.33, '2023-02-18'),
	(21, 'Túnica Bohemia', 46.48, 63, 'Túnica con inspiración bohemia y colores vibrantes.', 'BohoVibes', 18.13, '2023-02-03'),
	(22, 'Chaleco de Moda', 63.21, 29, 'Chaleco de moda para un look urbano y actual.', 'UrbanStyle', 18.37, '2023-07-02'),
	(23, 'Halter Top Veraniego', 71.68, 76, 'Halter top fresco y versátil para los días soleados.', 'SunriseVibes', 38.51, '2023-01-22'),
	(24, 'Shorts de Playa', 31.48, 13, 'Shorts de playa cómodos y perfectos para relajarse.', 'BeachLife', 47.63, '2023-05-19'),
	(25, 'Shorts Deportivos', 58.50, 80, 'Shorts deportivos para entrenamientos y actividades activas.', 'ActiveGear', 14.87, '2023-07-16'),
	(26, 'Cardigan Elegante', 44.04, 21, 'Cardigan elegante con detalles sofisticados para un look refinado.', 'Sophisticate', 35.93, '2023-06-21'),
	(27, 'Blusa de Moda', 51.66, 69, 'Blusa de moda con diseño vanguardista y atractivo.', 'FashionEdge', 45.29, '2023-05-02'),
	(28, 'Vestido Estampado', 42.50, 25, 'Vestido con estampado único y fresco para el verano.', 'PrintSensation', 20.00, '2023-07-28'),
	(29, 'Blazer Elegante', 75.79, 5, 'Blazer elegante y sofisticado para ocasiones especiales.', 'ElegantAffairs', 12.62, '2023-07-20'),
	(30, 'Poncho de Otoño', 12.39, 64, 'Poncho de otoño con colores cálidos y texturas suaves.', 'AutumnHues', 20.22, '2022-10-19');

INSERT INTO categoria (id_categoria, nombre_categoria, descripcion_categoria) 
VALUES 
	(1, 'Ropa Casual', 'Ropa cómoda y versátil para uso diario.'),
	(2, 'Ropa Formal', 'Ropa elegante y sofisticada para ocasiones especiales.'),
	(3, 'Ropa Deportiva', 'Ropa diseñada para actividades físicas y deportivas.'),
	(4, 'Accesorios', 'Complementos que agregan estilo a tus outfits.'),
	(5, 'Ropa de Baño', 'Trajes de baño y accesorios para la playa y piscina.');


INSERT INTO categoria_producto (id_categoria_producto, id_categoria, id_producto) 
VALUES 
	(1, 1, 1),
	(2, 1, 2),
	(3, 3, 3),
	(4, 1, 4),
	(5, 1, 5),
	(6, 1, 6),
	(7, 2, 7),
	(8, 2, 8),
	(9, 1, 9),
	(10, 1, 10),
	(11, 1, 11),
	(12, 1, 12),
	(13, 1, 13),
	(14, 1, 14),
	(15, 1, 15),
	(16, 1, 16),
	(17, 1, 17),
	(18, 1, 18),
	(19, 1, 19),
	(20, 1, 20),
	(21, 1, 21),
	(22, 1, 22),
	(23, 1, 23),
	(24, 1, 24),
	(25, 2, 25),
	(26, 1, 26),
	(27, 1, 27),
	(28, 1, 28),
	(29, 1, 29),
	(30, 1, 30);

INSERT INTO proveedor (id_proveedor, nombre_proveedor, correo_proveedor, telefono_proveedor, direccion_proveedor, pais_proveedor, ruc_proveedor, cuenta_bancaria_proveedor)
VALUES
    (1, 'Proveedor A', 'proveedora@example.com', '+1234567890', 'Calle 123, Ciudad A', 'País A', '12345678901', 'ES123456789012345678'),
    (2, 'Proveedor B', 'proveedorb@example.com', '+9876543210', 'Avenida 456, Ciudad B', 'País B', '98765432109', 'DE987654321098765432'),
    (3, 'Proveedor C', 'proveedorc@example.com', '+4567890123', 'Plaza 789, Ciudad C', 'País C', '45678901234', 'FR456789012345678901'),
    (4, 'Proveedor D', 'proveedord@example.com', '+2345678901', 'Calle 567, Ciudad D', 'País D', '23456789012', 'IT234567890123456789'),
    (5, 'Proveedor E', 'proveedore@example.com', '+8765432109', 'Avenida 678, Ciudad E', 'País E', '87654321023', 'UK876543210987654321'),
    (6, 'Proveedor F', 'proveedorf@example.com', '+3456789012', 'Plaza 890, Ciudad F', 'País F', '34567890123', 'JP345678901234567890'),
    (7, 'Proveedor G', 'proveedorg@example.com', '+1234567890', 'Calle 123, Ciudad G', 'País G', '12345678934', 'RU123456789012345678'),
    (8, 'Proveedor H', 'proveedorh@example.com', '+9876543210', 'Avenida 456, Ciudad H', 'País H', '98765432156', 'CH987654321098765432'),
    (9, 'Proveedor I', 'proveedori@example.com', '+4567890123', 'Plaza 789, Ciudad I', 'País I', '45678901267', 'AU456789012345678901'),
    (10, 'Proveedor J', 'proveedorj@example.com', '+2345678901', 'Calle 567, Ciudad J', 'País J', '23456789078', 'CA234567890123456789');

INSERT INTO compra (id_compra, id_proveedor, fecha_compra, detalle_compra, total_compra)
VALUES
    (1, 1, '2023-08-01', 'Compra de productos para la temporada de verano.', 227.26),
    (2, 3, '2023-08-02', 'Compra de sweaters y hoodies para la temporada de otoño.', 206.02),
    (3, 2, '2023-08-05', 'Compra de camisas y blusas de moda.', 201.23),
    (4, 5, '2023-08-07', 'Compra de shorts deportivos para actividades físicas.', 237.19),
    (5, 4, '2023-08-10', 'Compra de tank tops y crop tops.', 198.1),
    (6, 6, '2023-08-12', 'Compra de hoodies y cardigans elegantes.', 105.58),
    (7, 7, '2023-08-15', 'Compra de vestidos y faldas elegantes para ocasiones especiales.', 183.34),
    (8, 8, '2023-08-18', 'Compra de blazers y chaquetas modernas.', 88.02),
    (9, 10, '2023-08-20', 'Compra de ponchos y túnicas con estilo bohemio.', 113.93),
    (10, 9, '2023-08-23', 'Compra de jeans clásicos y básicos.', 271.49),
    (11, 1, '2023-08-25', 'Compra de shorts de verano y hoodies casuales.', 419.47),
    (12, 3, '2023-08-28', 'Compra de sweaters y hoodies para la temporada de otoño.', 113.93),
    (13, 2, '2023-08-30', 'Compra de camisas y blusas de moda.', 94.15),
    (14, 5, '2023-09-02', 'Compra de shorts deportivos para actividades físicas.', 44.23),
    (15, 4, '2023-09-05', 'Compra de tank tops y crop tops.', 96.31),
    (16, 6, '2023-09-08', 'Compra de hoodies y cardigans elegantes.', 116.15),
    (17, 7, '2023-09-11', 'Compra de vestidos y faldas elegantes para ocasiones especiales.', 235.92),
    (18, 8, '2023-09-14', 'Compra de blazers y chaquetas modernas.', 113.93),
    (19, 10, '2023-09-17', 'Compra de ponchos y túnicas con estilo bohemio.', 88.02),
    (20, 9, '2023-09-20', 'Compra de jeans clásicos y básicos.', 136.49),
    (21, 1, '2023-09-23', 'Compra de shorts de verano y hoodies casuales.', 82.10),
    (22, 3, '2023-09-26', 'Compra de sweaters y hoodies para la temporada de otoño.', 44.23),
    (23, 2, '2023-09-29', 'Compra de camisas y blusas de moda.', 96.31),
    (24, 5, '2023-10-02', 'Compra de shorts deportivos para actividades físicas.', 113.93),
    (25, 4, '2023-10-05', 'Compra de tank tops y crop tops.', 94.15),
    (26, 6, '2023-10-08', 'Compra de hoodies y cardigans elegantes.', 44.23),
    (27, 7, '2023-10-11', 'Compra de vestidos y faldas elegantes para ocasiones especiales.', 96.31),
    (28, 8, '2023-10-14', 'Compra de blazers y chaquetas modernas.', 113.93),
    (29, 10, '2023-10-17', 'Compra de ponchos y túnicas con estilo bohemio.', 94.15),
    (30, 9, '2023-10-20', 'Compra de jeans clásicos y básicos.', 44.23);

INSERT INTO cliente (id_cliente, nombre_cliente, apellido_cliente, telefono_cliente, dni_cliente, direccion_cliente, usuario_cliente, contrasena_cliente, pais_cliente, correo_cliente, fecha_nacimiento_cliente, genero_cliente)
VALUES
    (1, 'Ana', 'García', '+1234567890', '1234567890', 'Calle 123, Ciudad A', 'ana123', 'contrasena123', 'País A', 'ana@example.com', '1990-05-15', 'Femenino'),
    (2, 'Juan', 'Rodríguez', '+9876543210', '9876543210', 'Avenida 456, Ciudad B', 'juan456', 'contrasena456', 'País B', 'juan@example.com', '1988-11-30', 'Masculino'),
    (3, 'María', 'López', '+4567890123', '4567890123', 'Plaza 789, Ciudad C', 'maria789', 'contrasena789', 'País C', 'maria@example.com', '1995-02-20', 'Femenino'),
    (4, 'Carlos', 'Martínez', '+2345678901', '2345678901', 'Calle 567, Ciudad D', 'carlos234', 'contrasena234', 'País D', 'carlos@example.com', '1992-08-10', 'Masculino'),
    (5, 'Laura', 'Hernández', '+8765432109', '8765432109', 'Avenida 678, Ciudad E', 'laura678', 'contrasena678', 'País E', 'laura@example.com', '1998-04-25', 'Femenino'),
    (6, 'Pablo', 'Gómez', '+3456789012', '3456789012', 'Plaza 890, Ciudad F', 'pablo890', 'contrasena890', 'País F', 'pablo@example.com', '1991-09-12', 'Masculino'),
    (7, 'Sofía', 'Pérez', '+1234567890', '1234567896', 'Calle 123, Ciudad G', 'sofia123', 'contrasena124', 'País G', 'sofia@example.com', '1994-07-03', 'Femenino'),
    (8, 'Diego', 'Díaz', '+9876543210', '9876543214', 'Avenida 456, Ciudad H', 'diego456', 'contrasena458', 'País H', 'diego@example.com', '1987-12-18', 'Masculino'),
    (9, 'Valentina', 'Torres', '+4567890123', '4567890127', 'Plaza 789, Ciudad I', 'valentina789', 'contrasena781', 'País I', 'valentina@example.com', '1993-03-07', 'Femenino'),
    (10, 'Andrés', 'Ruíz', '+2345678901', '2345678957', 'Calle 567, Ciudad J', 'andres234', 'contrasena236', 'País J', 'andres@example.com', '1997-10-22', 'Masculino');

INSERT INTO repartidor (id_repartidor, nombre_repartidor, apellido_repartidor, usuario_repartidor, contrasena_repartidor, dni_repartidor, direccion_repartidor, telefono_repartidor, correo_repartidor, fecha_nacimiento_repartidor)
VALUES
    (1, 'Luis', 'Gómez', 'luis123', 'contrasena123', '1234567890', 'Calle 123, Ciudad A', '+1234567890', 'luis@example.com', '1995-05-15'),
    (2, 'Ana', 'Rodríguez', 'ana456', 'contrasena456', '9876543210', 'Avenida 456, Ciudad B', '+9876543210', 'ana@example.com', '1990-11-30'),
    (3, 'Juan', 'López', 'juan789', 'contrasena789', '4567890123', 'Plaza 789, Ciudad C', '+4567890123', 'juan@example.com', '1993-02-20'),
    (4, 'María', 'Martínez', 'maria234', 'contrasena234', '2345678901', 'Calle 567, Ciudad D', '+2345678901', 'maria@example.com', '1992-08-10'),
    (5, 'Carlos', 'Hernández', 'carlos678', 'contrasena678', '8765432109', 'Avenida 678, Ciudad E', '+8765432109', 'carlos@example.com', '1988-04-25'),
    (6, 'Laura', 'Gómez', 'laura890', 'contrasena890', '3456789012', 'Plaza 890, Ciudad F', '+3456789012', 'laura@example.com', '1991-09-12'),
    (7, 'Pablo', 'Pérez', 'pablo123', 'contrasena123', '1234567890', 'Calle 123, Ciudad G', '+1234567890', 'pablo@example.com', '1994-07-03'),
    (8, 'Sofía', 'Díaz', 'sofia456', 'contrasena456', '9876543210', 'Avenida 456, Ciudad H', '+9876543210', 'sofia@example.com', '1987-12-18'),
    (9, 'Diego', 'Torres', 'diego789', 'contrasena789', '4567890123', 'Plaza 789, Ciudad I', '+4567890123', 'diego@example.com', '1993-03-07'),
    (10, 'Valentina', 'Ruíz', 'valentina234', 'contrasena234', '2345678901', 'Calle 567, Ciudad J', '+2345678901', 'valentina@example.com', '1997-10-22');

INSERT INTO compra_producto (id_compra_producto, id_compra, id_producto, cantidad_compra_producto, precio_unitario_compra_producto, subtotal_compra_producto)
VALUES
    (1, 1, 1, 4, 40.00, 160.00),
    (2, 1, 4, 6, 11.21, 67.26),
    (3, 2, 2, 3, 43.79, 131.37),
    (4, 2, 5, 5, 14.93, 74.65),
    (5, 3, 3, 2, 72.37, 144.74),
    (6, 3, 6, 3, 18.83, 56.49),
    (7, 4, 10, 4, 26.80, 107.20),
    (8, 4, 12, 1, 129.99, 129.99),
    (9, 5, 9, 5, 12.05, 60.25),
    (10, 5, 14, 3, 45.95, 137.85),
    (11, 6, 4, 4, 11.21, 44.84),
    (12, 6, 15, 1, 60.76, 60.76),
    (13, 7, 1, 3, 48.56, 145.68),
    (14, 7, 6, 2, 18.83, 37.66),
    (15, 8, 9, 4, 12.05, 48.20),
    (16, 8, 11, 1, 39.82, 39.82),
    (17, 9, 5, 3, 14.93, 44.79),
    (18, 9, 8, 1, 69.14, 69.14),
    (19, 10, 2, 5, 52.29, 261.45),
    (20, 10, 7, 1, 10.04, 10.04),
    (21, 11, 3, 4, 72.37, 289.48),
    (22, 11, 12, 1, 129.99, 129.99),
    (23, 12, 5, 3, 14.93, 44.79),
    (24, 12, 8, 1, 69.14, 69.14),
    (25, 13, 9, 4, 12.05, 48.20),
    (26, 13, 14, 1, 45.95, 45.95),
    (27, 14, 4, 2, 11.21, 22.42),
    (28, 14, 13, 1, 21.81, 21.81),
    (29, 15, 6, 3, 18.83, 56.49),
    (30, 15, 11, 1, 39.82, 39.82),
    (31, 16, 1, 2, 40.00, 80.00),
    (32, 16, 9, 3, 12.05, 36.15),
    (33, 17, 2, 4, 43.79, 175.16),
    (34, 17, 15, 1, 60.76, 60.76),
    (35, 18, 5, 3, 14.93, 44.79),
    (36, 18, 8, 1, 69.14, 69.14),
    (37, 19, 9, 4, 12.05, 48.20),
    (38, 19, 11, 1, 39.82, 39.82),
    (39, 20, 1, 2, 40.00, 80.00),
    (40, 20, 6, 3, 18.83, 56.49),
    (41, 21, 9, 3, 12.05, 36.15),
    (42, 21, 14, 1, 45.95, 45.95),
    (43, 22, 4, 2, 11.21, 22.42),
    (44, 22, 13, 1, 21.81, 21.81),
    (45, 23, 6, 3, 18.83, 56.49),
    (46, 23, 11, 1, 39.82, 39.82),
    (47, 24, 5, 3, 14.93, 44.79),
    (48, 24, 8, 1, 69.14, 69.14),
    (49, 25, 9, 4, 12.05, 48.20),
    (50, 25, 14, 1, 45.95, 45.95),
    (51, 26, 4, 2, 11.21, 22.42),
    (52, 26, 13, 1, 21.81, 21.81),
    (53, 27, 6, 3, 18.83, 56.49),
    (54, 27, 11, 1, 39.82, 39.82),
    (55, 28, 5, 3, 14.93, 44.79),
    (56, 28, 8, 1, 69.14, 69.14),
    (57, 29, 9, 4, 12.05, 48.20),
    (58, 29, 14, 1, 45.95, 45.95),
    (59, 30, 4, 2, 11.21, 22.42),
    (60, 30, 13, 1, 21.81, 21.81);
    
INSERT INTO venta (id_venta, id_cliente, total_venta, fecha_venta, detalle_venta)
VALUES
    (1, 1, 92.63, '2023-08-14', 'Compra de ropa veraniega'),
    (2, 3, 127.19, '2023-08-14', 'Productos para un look elegante'),
    (3, 5, 47.30, '2023-08-14', 'Compra casual'),
    (4, 2, 90.11, '2023-08-14', 'Ropa cómoda para el día a día'),
    (5, 4, 154.78, '2023-08-14', 'Productos para entrenamiento'),
    (6, 6, 33.60, '2023-08-14', 'Ropa casual'),
    (7, 8, 129.46, '2023-08-14', 'Look profesional'),
    (8, 10, 57.20, '2023-08-14', 'Compra con estilo'),
    (9, 7, 61.58, '2023-08-14', 'Ropa femenina'),
    (10, 9, 95.42, '2023-08-14', 'Productos bohemios'),
    (11, 1, 72.37, '2023-08-14', 'Compra de sweaters'),
    (12, 3, 33.63, '2023-08-14', 'Productos elegantes'),
    (13, 5, 27.38, '2023-08-14', 'Compra casual'),
    (14, 2, 67.79, '2023-08-14', 'Ropa cómoda'),
    (15, 4, 119.55, '2023-08-14', 'Productos para actividades activas');

INSERT INTO venta_producto (id_venta_producto, id_venta, id_producto, precio_unitario_venta_producto, subtotal_venta_producto, cantidad_venta_producto)
VALUES
    (1, 1, 1, 43.70, 87.40, 2),
    (2, 1, 3, 64.13, 128.26, 2),
    (3, 2, 5, 13.44, 26.88, 2),
    (4, 2, 8, 53.50, 107.00, 2),
    (5, 3, 10, 22.52, 45.04, 2),
    (6, 3, 13, 21.29, 42.58, 2),
    (7, 4, 15, 54.69, 109.38, 2),
    (8, 4, 18, 29.82, 59.64, 2),
    (9, 5, 20, 20.95, 41.90, 2),
    (10, 5, 25, 49.53, 99.06, 2),
    (11, 6, 28, 36.63, 73.26, 2),
    (12, 6, 30, 22.44, 44.88, 2),
    (13, 7, 1, 39.07, 78.14, 2),
    (14, 7, 4, 6.34, 12.68, 2),
    (15, 8, 6, 15.05, 30.10, 2),
    (16, 8, 9, 10.65, 21.30, 2),
    (17, 9, 11, 35.75, 71.50, 2),
    (18, 9, 14, 22.98, 45.96, 2),
    (19, 10, 16, 6.63, 13.26, 2),
    (20, 10, 19, 69.53, 139.06, 2),
    (21, 11, 21, 41.83, 83.66, 2),
    (22, 11, 23, 34.25, 68.50, 2),
    (23, 12, 26, 23.89, 47.78, 2),
    (24, 12, 28, 25.89, 51.78, 2),
    (25, 13, 29, 47.92, 95.84, 2),
    (26, 13, 30, 23.10, 46.20, 2),
    (27, 14, 2, 47.06, 94.12, 2),
    (28, 14, 5, 13.44, 26.88, 2),
    (29, 15, 7, 8.02, 16.04, 2),
    (30, 15, 10, 25.48, 50.96, 2),
    (31, 1, 12, 116.99, 233.98, 2),
    (32, 1, 15, 54.69, 109.38, 2),
    (33, 2, 18, 20.04, 40.08, 2),
    (34, 2, 21, 46.97, 93.94, 2),
    (35, 3, 24, 14.99, 29.98, 2),
    (36, 3, 26, 41.80, 83.60, 2),
    (37, 4, 28, 36.63, 73.26, 2),
    (38, 4, 30, 18.07, 36.14, 2),
    (39, 5, 3, 58.83, 117.66, 2),
    (40, 5, 6, 15.05, 30.10, 2);

INSERT INTO entrega (id_entrega, id_venta, id_repartidor, fecha_entrega, detalle_entrega)
VALUES
    (1, 1, 1, '2023-08-15', 'Entrega de productos de compra de ropa veraniega'),
    (2, 2, 3, '2023-08-15', 'Entrega de productos para un look elegante'),
    (3, 3, 5, '2023-08-15', 'Entrega de productos de compra casual'),
    (4, 4, 2, '2023-08-15', 'Entrega de productos de ropa cómoda para el día a día'),
    (5, 5, 4, '2023-08-15', 'Entrega de productos para entrenamiento'),
    (6, 6, 6, '2023-08-15', 'Entrega de productos de ropa casual'),
    (7, 7, 8, '2023-08-15', 'Entrega de productos para look profesional'),
    (8, 8, 10, '2023-08-15', 'Entrega de productos de compra con estilo'),
    (9, 9, 7, '2023-08-15', 'Entrega de productos de ropa femenina'),
    (10, 10, 9, '2023-08-15', 'Entrega de productos bohemios'),
    (11, 11, 1, '2023-08-15', 'Entrega de productos de compra de sweaters'),
    (12, 12, 3, '2023-08-15', 'Entrega de productos elegantes'),
    (13, 13, 5, '2023-08-15', 'Entrega de productos de compra casual'),
    (14, 14, 2, '2023-08-15', 'Entrega de productos de ropa cómoda'),
    (15, 15, 4, '2023-08-15', 'Entrega de productos para actividades activas');
    
    
    
-- Creacion de las vistas:
-- 1. Vista para poder visualizar las ultimas entregas del mes que realizo cada repartidor
CREATE OR REPLACE VIEW entregas_ultimo_mes AS (
	SELECT r.dni_repartidor,concat(r.nombre_repartidor,' ',r.apellido_repartidor) as repartidor, e.fecha_entrega, e.detalle_entrega, e.id_venta
	FROM entrega e
	INNER JOIN repartidor r ON e.id_repartidor = r.id_repartidor
	WHERE e.fecha_entrega BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
);
-- 2. Compras realizadas el ultimo mes
CREATE OR REPLACE VIEW compras_ultimo_mes AS (
	SELECT c.fecha_compra,p.nombre_proveedor, p.ruc_proveedor , SUM(cp.cantidad_compra_producto) AS cantidad_productos,
       c.total_compra
	FROM compra c
	INNER JOIN proveedor p ON c.id_proveedor=p.id_proveedor
	INNER JOIN compra_producto cp ON c.id_compra = cp.id_compra
	WHERE c.fecha_compra >= DATE_SUB(LAST_DAY(NOW()), INTERVAL 1 MONTH) + INTERVAL 1 DAY
	  AND c.fecha_compra < LAST_DAY(NOW()) + INTERVAL 1 DAY
	GROUP BY c.id_compra
);
-- 3. Stock de todos los productos, con informacion de la categoria y fecha de lanzamiento
CREATE OR REPLACE VIEW info_producto AS(
	SELECT stock_producto,nombre_producto,precio_producto,marca_producto,fecha_lanzamiento,nombre_categoria
	FROM producto p
	INNER JOIN categoria_producto cp ON p.id_producto=cp.id_producto
	INNER JOIN categoria c ON cp.id_categoria=c.id_categoria
);
-- 4. Ventas realizadas el ultimo mes
CREATE OR REPLACE VIEW ventas_ultimo_mes AS(
	SELECT v.fecha_venta,CONCAT(c.nombre_cliente,' ',c.apellido_cliente) AS cliente, c.usuario_cliente, SUM(vp.cantidad_venta_producto) AS cantidad_productos,
		   v.total_venta
	FROM venta v
	INNER JOIN cliente c ON v.id_cliente = c.id_cliente
	INNER JOIN venta_producto vp ON v.id_venta = vp.id_venta
	WHERE v.fecha_venta >= DATE_SUB(LAST_DAY(NOW()), INTERVAL 1 MONTH) + INTERVAL 1 DAY
	  AND v.fecha_venta < LAST_DAY(NOW()) + INTERVAL 1 DAY
	GROUP BY v.id_venta
);
-- 5. Productos con menos de 10 de stock, y los proveedores que venden dicho producto
CREATE OR REPLACE VIEW stock_bajo_producto AS(
	SELECT nombre_proveedor,stock_producto,nombre_producto,precio_producto,marca_producto,fecha_lanzamiento,nombre_categoria
	FROM producto p
	INNER JOIN compra_producto cop ON p.id_producto=cop.id_producto
	INNER JOIN compra co ON cop.id_compra=co.id_compra
	INNER JOIN proveedor pr ON co.id_proveedor=pr.id_proveedor
	INNER JOIN categoria_producto cp ON p.id_producto=cp.id_producto
	INNER JOIN categoria c ON cp.id_categoria=c.id_categoria
	WHERE p.stock_producto<10
    ORDER BY p.fecha_lanzamiento DESC
);


select*from entregas_ultimo_mes;
select*from compras_ultimo_mes;
select*from info_producto;
select*from ventas_ultimo_mes;
select*from stock_bajo_producto;

-- Funciones:
-- 1. calcular el total de dinero y compras que un cliente tiene ingresando el dni
USE `tienda_ropa`;
DROP function IF EXISTS `total_compras_cliente`;

USE `tienda_ropa`;
DROP function IF EXISTS `tienda_ropa`.`total_compras_cliente`;
;

DELIMITER $$
USE `tienda_ropa`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `total_compras_cliente`(dni_cliente VARCHAR(20)) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE total DECIMAL(10,2);
    DECLARE cantidad_comprada INT;
    DECLARE result VARCHAR(100);
    
    DECLARE dni_exists INT;
    SELECT id_cliente INTO dni_exists FROM cliente c WHERE c.dni_cliente = dni_cliente;
    
     IF dni_exists IS NULL THEN
        SET result = 'DNI no existe en la base de datos.';
    ELSE
        SELECT SUM(total_venta), COUNT(id_venta) INTO total, cantidad_comprada
        FROM cliente c
        INNER JOIN venta v ON c.id_cliente = v.id_cliente
        WHERE c.dni_cliente = dni_cliente;

        SET result = CONCAT('Total: ', IFNULL(total, 0.00), ' - Cantidad Comprada: ', IFNULL(cantidad_comprada, 0));
    END IF;

    RETURN result; 
END$$

DELIMITER ;
;
SELECT total_compras_cliente('1234567890'); -- Ejemplo dni existente
SELECT total_compras_cliente('123456789'); -- Ejemplo dni NO existente

-- 2. calcular el monto total vendido y la cantidad en un rango de fecha
USE `tienda_ropa`;
DROP function IF EXISTS `total_ventas_fecha_determinada`;

USE `tienda_ropa`;
DROP function IF EXISTS `tienda_ropa`.`total_ventas_fecha_determinada`;
;

DELIMITER $$
USE `tienda_ropa`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `total_ventas_fecha_determinada`(fecha_inicio DATE, fecha_fin DATE) RETURNS VARCHAR(100)
    DETERMINISTIC
BEGIN
	DECLARE total DECIMAL(10,2);
    DECLARE cantidad INT;
    IF fecha_inicio>fecha_fin THEN
		SELECT COUNT(id_venta),SUM(total_venta) INTO cantidad,total
		FROM venta
		WHERE fecha_venta BETWEEN fecha_fin AND fecha_inicio;
	ELSE
		SELECT COUNT(id_venta),SUM(total_venta) INTO cantidad,total
		FROM venta
		WHERE fecha_venta BETWEEN fecha_inicio AND fecha_fin;
	END IF;
    RETURN CONCAT('MONTO TOTAL: ',IFNULL(total, 0.00),'-CANTIDAD TOTAL: ',IFNULL(cantidad, 0.00));
END$$

DELIMITER ;

SELECT total_ventas_fecha_determinada('2023-08-10','2023-08-31');
SELECT total_ventas_fecha_determinada('2023-08-31','2023-08-10');

-- Stored Procedures:
-- 1.Calcular ventas por dia:
USE `tienda_ropa`;
DROP procedure IF EXISTS `total_venta_dia`;

DELIMITER $$
USE `tienda_ropa`$$
CREATE PROCEDURE `total_venta_dia` (
	IN dia_venta VARCHAR(10))
BEGIN
	IF dia_venta='' THEN
		SELECT 'ERROR: no se pudo crear el producto indicado';
	ELSE
		SELECT SUM(total_venta)
		FROM venta v
		WHERE v.fecha_venta = dia_venta;
	END IF;
END$$

DELIMITER ;

CALL total_venta_dia('2023-08-14');
CALL total_venta_dia('2023-09-10');



-- 2. Actualizar stock despues de realizar una venta:
USE `tienda_ropa`;
DROP procedure IF EXISTS `actualizar_stock_venta`;

DELIMITER $$
USE `tienda_ropa`$$
CREATE PROCEDURE `actualizar_stock_venta`(
	IN id_venta_realizada INT
)
BEGIN
	DECLARE producto_id INT;
	DECLARE cantidad INT;
	DECLARE productos_cursor CURSOR FOR SELECT id_producto, cantidad_venta_producto FROM venta_producto WHERE id_venta = id_venta_realizada;

	OPEN productos_cursor;

	productos_loop: LOOP
		FETCH productos_cursor INTO producto_id, cantidad;
		IF producto_id IS NULL THEN
			LEAVE productos_loop;
		END IF;

		UPDATE producto
		SET stock_producto = stock_producto - cantidad
		WHERE id_producto = producto_id;
	END LOOP;

	CLOSE productos_cursor;
END$$

DELIMITER ;

SELECT*
FROM venta v
INNER JOIN venta_producto vp ON v.id_venta=vp.id_venta
WHERE v.id_venta=1;

SELECT stock_producto
FROM producto
WHERE id_producto=1;

CALL actualizar_stock_venta(1);



-- 3. Ordenar tabla:
USE `tienda_ropa`;
DROP procedure IF EXISTS `actualizar_stock_venta`;

DELIMITER $$
USE `tienda_ropa`$$
CREATE PROCEDURE `ordenar_tabla`(
    IN nombre_tabla VARCHAR(255),
    IN campo_ordenamiento VARCHAR(255),
    IN orden VARCHAR(4)
)
BEGIN
    SET @consulta = CONCAT('SELECT * FROM ', nombre_tabla, ' ORDER BY ', campo_ordenamiento, ' ', orden, ';');
    PREPARE stmt FROM @consulta;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$

DELIMITER ;

CALL ordenar_tabla('venta','total_venta','ASC');

-- Triggers:
-- Tabla de registro para clientes
CREATE TABLE clientes_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    accion VARCHAR(50) NOT NULL,
    detalle TEXT
);
-- Tabla de registro para productos
CREATE TABLE productos_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    accion VARCHAR(50) NOT NULL,
    detalle TEXT
);
-- 1. Trigger para tabla clientes:
/* se ejecutará antes y después de cada operación de inserción, 
actualización o eliminación en la tabla clientes. Registrará el 
usuario que realizó la acción, la fecha, la hora y el tipo de acción 
(inserción, actualización o eliminación) junto con los detalles relevantes.*/
DELIMITER $$

-- Trigger AFTER para clientes
CREATE TRIGGER after_clientes_insert
AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO clientes_log (usuario, fecha, hora, accion, detalle)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME(), 'INSERCIÓN', CONCAT('Nuevo cliente insertado con ID ', NEW.id_cliente));
END;

$$

DELIMITER ;

DELIMITER $$

-- Trigger AFTER para clientes (después de una actualización)
CREATE TRIGGER after_clientes_update
AFTER UPDATE ON cliente
FOR EACH ROW
BEGIN
    DECLARE cambio_detalle TEXT DEFAULT '';
    IF OLD.nombre_cliente != NEW.nombre_cliente THEN
        SET cambio_detalle = CONCAT(cambio_detalle,'(', OLD.nombre_cliente, ' -> ', NEW.nombre_cliente, ')');
    END IF;
    IF OLD.apellido_cliente != NEW.apellido_cliente THEN
        SET cambio_detalle = CONCAT(cambio_detalle,'(', OLD.apellido_cliente, ' -> ',NEW.apellido_cliente, ')');
    END IF;
    IF OLD.telefono_cliente != NEW.telefono_cliente THEN
        SET cambio_detalle = CONCAT(cambio_detalle,'(', OLD.telefono_cliente, ' -> ', NEW.telefono_cliente, ')');
    END IF;
    IF OLD.dni_cliente != NEW.dni_cliente THEN
        SET cambio_detalle = CONCAT(cambio_detalle,'(', OLD.dni_cliente, ' -> ',NEW.dni_cliente, ')');
    END IF;
    IF OLD.direccion_cliente != NEW.direccion_cliente THEN
        SET cambio_detalle = CONCAT(cambio_detalle,'(', OLD.direccion_cliente, ' -> ', NEW.direccion_cliente, ')');
    END IF;
    IF OLD.pais_cliente != NEW.pais_cliente THEN
        SET cambio_detalle = CONCAT(cambio_detalle,'(', OLD.pais_cliente, ' -> ',NEW.pais_cliente, ')');
    END IF;
    IF OLD.correo_cliente != NEW.correo_cliente THEN
        SET cambio_detalle = CONCAT(cambio_detalle,'(', OLD.correo_cliente, ' -> ',NEW.correo_cliente, ')');
    END IF;
    IF OLD.usuario_cliente != NEW.usuario_cliente THEN
        SET cambio_detalle = CONCAT(cambio_detalle,'(', OLD.usuario_cliente, ' -> ',NEW.usuario_cliente, ')');
    END IF;
    
    INSERT INTO clientes_log (usuario, fecha, hora, accion, detalle)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME(), 'ACTUALIZACIÓN', CONCAT('id:',NEW.id_cliente,' ',cambio_detalle));
END;
$$

DELIMITER ;


-- 2. Trrigger para la tabla productos:
/*se ejecutará antes y después de cada operación de actualización en 
la tabla productos. Registrará el usuario que realizó la acción, la fecha, 
la hora y el tipo de acción (actualización) junto con los detalles relevantes.*/
DELIMITER $$

-- Trigger BEFORE para productos 
CREATE TRIGGER before_productos_update
BEFORE INSERT ON producto
FOR EACH ROW
BEGIN
    INSERT INTO productos_log (usuario, fecha, hora, accion, detalle)
    VALUES (CURRENT_USER(),CURDATE(), CURTIME(), 'INSERCION', CONCAT('Producto insertado de ID',NEW.id_producto));
END;
$$

DELIMITER ;
DELIMITER $$

-- Trigger AFTER para productos (después de una actualización)
CREATE TRIGGER after_productos_update
AFTER UPDATE ON producto
FOR EACH ROW
BEGIN
    DECLARE cambio_detalle TEXT DEFAULT '';
    IF OLD.nombre_producto != NEW.nombre_producto THEN
        SET cambio_detalle = CONCAT(cambio_detalle,'(', OLD.nombre_producto, ' -> ', NEW.nombre_producto, ')');
    END IF;
    IF OLD.precio_producto != NEW.precio_producto THEN
        SET cambio_detalle = CONCAT(cambio_detalle,'(', OLD.precio_producto, ' -> ',NEW.precio_producto, ')');
    END IF;
    IF OLD.stock_producto != NEW.stock_producto THEN
        SET cambio_detalle = CONCAT(cambio_detalle,'(', OLD.stock_producto, ' -> ', NEW.stock_producto, ')');
    END IF;
    IF OLD.marca_producto != NEW.marca_producto THEN
        SET cambio_detalle = CONCAT(cambio_detalle,'(', OLD.marca_producto, ' -> ',NEW.marca_producto, ')');
    END IF;
    IF OLD.descuento_producto != NEW.descuento_producto THEN
        SET cambio_detalle = CONCAT(cambio_detalle,'(', OLD.descuento_producto, ' -> ', NEW.descuento_producto, ')');
    END IF;
    IF OLD.fecha_lanzamiento != NEW.fecha_lanzamiento THEN
        SET cambio_detalle = CONCAT(cambio_detalle,'(', OLD.fecha_lanzamiento, ' -> ',NEW.fecha_lanzamiento, ')');
    END IF;
    
    INSERT INTO productos_log (usuario, fecha, hora, accion, detalle)
    VALUES (CURRENT_USER(),CURDATE(), CURTIME(), 'ACTUALIZACIÓN', CONCAT('id:',NEW.id_producto,' ',cambio_detalle));
END;
$$

DELIMITER ;


INSERT INTO cliente (id_cliente, nombre_cliente, apellido_cliente, telefono_cliente, dni_cliente, direccion_cliente, usuario_cliente, contrasena_cliente, pais_cliente, correo_cliente, fecha_nacimiento_cliente, genero_cliente)
VALUES
    (11, 'Ana', 'García', '+1234567890', '1234567816', 'Calle 123, Ciudad A', 'ana126', 'contrasena120', 'País A', 'ana12@example.com', '1990-05-15', 'Femenino');
Update cliente set nombre_cliente='Lara' where id_cliente=11;
Update cliente set apellido_cliente='Rodriguez' where id_cliente=11;
Update cliente set nombre_cliente='Laura',apellido_cliente='Martinez' where id_cliente=11;
SELECT*FROM clientes_log;

INSERT INTO producto (id_producto, nombre_producto, precio_producto, stock_producto, descripcion_producto, marca_producto, descuento_producto, fecha_lanzamiento) 
VALUES 
	(31, 'Pantalones largos', 50.56, 45, 'Pantalones cómodos.', 'SunStyle', 40.8, '2023-03-21');
Update producto set nombre_producto='Pantalones' where id_producto=31;
Update producto set precio_producto=50.80 where id_producto=31;
Update producto set nombre_producto='shorts',precio_producto=30.80 where id_producto=31;
SELECT*FROM productos_log;

#Informe 1: Informe de ventas por cliente
SELECT c.nombre_cliente, COUNT(v.id_venta) AS total_ventas, SUM(v.total_venta) AS monto_total_gastado
FROM cliente c
LEFT JOIN venta v ON c.id_cliente = v.id_cliente
GROUP BY c.nombre_cliente;

#Informe 2: Top 5 de productos más vendidos
SELECT p.nombre_producto, SUM(vp.cantidad_venta_producto) AS cantidad_total_vendida
FROM producto p
LEFT JOIN venta_producto vp ON p.id_producto = vp.id_producto
GROUP BY p.nombre_producto
ORDER BY cantidad_total_vendida DESC
LIMIT 5;





