CREATE SCHEMA tienda_ropa;
CREATE TABLE cliente(
	id_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(50) NOT NULL,
    apellido_cliente VARCHAR(50) NOT NULL,
    telefono_cliente VARCHAR(20) NOT NULL,
    dni_cliente VARCHAR(20) NOT NULL,
    direccion_cliente VARCHAR(100) NOT NULL,
    usuario_cliente VARCHAR(100) UNIQUE NOT NULL,
    contrasena_cliente VARCHAR(100) UNIQUE NOT NULL,
    pais_cliente VARCHAR(50) NOT NULL,
    correo_cliente VARCHAR(50) NOT NULL,
    fecha_nacimiento_cliente DATE NOT NULL,
    genero_cliente VARCHAR(100) NOT NULL
);
CREATE TABLE producto(
	id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
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
    contacto_proveedor VARCHAR(50) NOT NULL,
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
    contrasena_repartidor VARCHAR(100) UNIQUE NOT NULL,
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