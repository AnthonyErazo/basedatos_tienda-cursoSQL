CREATE DATABASE  IF NOT EXISTS `tienda_ropa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tienda_ropa`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda_ropa
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL,
  `nombre_categoria` varchar(100) NOT NULL,
  `descripcion_categoria` text,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Ropa Casual','Ropa cómoda y versátil para uso diario.'),(2,'Ropa Formal','Ropa elegante y sofisticada para ocasiones especiales.'),(3,'Ropa Deportiva','Ropa diseñada para actividades físicas y deportivas.'),(4,'Accesorios','Complementos que agregan estilo a tus outfits.'),(5,'Ropa de Baño','Trajes de baño y accesorios para la playa y piscina.');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_producto` (
  `id_categoria_producto` int NOT NULL,
  `id_categoria` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  PRIMARY KEY (`id_categoria_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `categoria_producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `categoria_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_producto`
--

LOCK TABLES `categoria_producto` WRITE;
/*!40000 ALTER TABLE `categoria_producto` DISABLE KEYS */;
INSERT INTO `categoria_producto` VALUES (1,1,1),(2,1,2),(3,3,3),(4,1,4),(5,1,5),(6,1,6),(7,2,7),(8,2,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,2,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30);
/*!40000 ALTER TABLE `categoria_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nombre_cliente` varchar(50) NOT NULL,
  `apellido_cliente` varchar(50) NOT NULL,
  `telefono_cliente` varchar(20) NOT NULL,
  `dni_cliente` varchar(20) NOT NULL,
  `direccion_cliente` varchar(100) NOT NULL,
  `usuario_cliente` varchar(100) NOT NULL,
  `contrasena_cliente` varchar(100) NOT NULL,
  `pais_cliente` varchar(50) NOT NULL,
  `correo_cliente` varchar(50) NOT NULL,
  `fecha_nacimiento_cliente` date NOT NULL,
  `genero_cliente` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `dni_cliente` (`dni_cliente`),
  UNIQUE KEY `usuario_cliente` (`usuario_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Ana','García','+1234567890','1234567890','Calle 123, Ciudad A','ana123','contrasena123','País A','ana@example.com','1990-05-15','Femenino'),(2,'Juan','Rodríguez','+9876543210','9876543210','Avenida 456, Ciudad B','juan456','contrasena456','País B','juan@example.com','1988-11-30','Masculino'),(3,'María','López','+4567890123','4567890123','Plaza 789, Ciudad C','maria789','contrasena789','País C','maria@example.com','1995-02-20','Femenino'),(4,'Carlos','Martínez','+2345678901','2345678901','Calle 567, Ciudad D','carlos234','contrasena234','País D','carlos@example.com','1992-08-10','Masculino'),(5,'Laura','Hernández','+8765432109','8765432109','Avenida 678, Ciudad E','laura678','contrasena678','País E','laura@example.com','1998-04-25','Femenino'),(6,'Pablo','Gómez','+3456789012','3456789012','Plaza 890, Ciudad F','pablo890','contrasena890','País F','pablo@example.com','1991-09-12','Masculino'),(7,'Sofía','Pérez','+1234567890','1234567896','Calle 123, Ciudad G','sofia123','contrasena124','País G','sofia@example.com','1994-07-03','Femenino'),(8,'Diego','Díaz','+9876543210','9876543214','Avenida 456, Ciudad H','diego456','contrasena458','País H','diego@example.com','1987-12-18','Masculino'),(9,'Valentina','Torres','+4567890123','4567890127','Plaza 789, Ciudad I','valentina789','contrasena781','País I','valentina@example.com','1993-03-07','Femenino'),(10,'Andrés','Ruíz','+2345678901','2345678957','Calle 567, Ciudad J','andres234','contrasena236','País J','andres@example.com','1997-10-22','Masculino'),(101,'Nuevo','Cliente1','+1234567890','2234567815','Calle 123, Ciudad A','nuevo1','contrasena1','País 1','nuevo1@example.com','1990-01-01','Género 1'),(102,'Nuevo','Cliente2','+2345678901','4345678815','Calle 234, Ciudad B','nuevo2','contrasena2','País 2','nuevo2@example.com','1990-02-02','Género 2'),(103,'Nuevo','Cliente3','+3456789012','5456783214','Calle 345, Ciudad C','nuevo3','contrasena3','País 3','nuevo3@example.com','1990-03-03','Género 3'),(104,'Nuevo','Cliente4','+4567890123','6567894213','Calle 456, Ciudad D','nuevo4','contrasena4','País 4','nuevo4@example.com','1990-04-04','Género 4');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes_log`
--

DROP TABLE IF EXISTS `clientes_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `accion` varchar(50) NOT NULL,
  `detalle` text,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_log`
--

LOCK TABLES `clientes_log` WRITE;
/*!40000 ALTER TABLE `clientes_log` DISABLE KEYS */;
INSERT INTO `clientes_log` VALUES (1,'root@localhost','2023-09-19','16:33:21','INSERCIÓN','Nuevo cliente insertado con ID 101'),(2,'root@localhost','2023-09-19','16:33:21','INSERCIÓN','Nuevo cliente insertado con ID 102'),(3,'root@localhost','2023-09-19','16:33:21','INSERCIÓN','Nuevo cliente insertado con ID 103'),(4,'root@localhost','2023-09-19','16:33:21','INSERCIÓN','Nuevo cliente insertado con ID 104'),(5,'root@localhost','2023-09-19','16:33:21','INSERCIÓN','Nuevo cliente insertado con ID 105'),(6,'root@localhost','2023-09-19','16:33:21','INSERCIÓN','Nuevo cliente insertado con ID 106'),(7,'root@localhost','2023-09-19','16:33:21','INSERCIÓN','Nuevo cliente insertado con ID 107'),(8,'root@localhost','2023-09-19','16:33:21','INSERCIÓN','Nuevo cliente insertado con ID 108'),(12,'root@localhost','2023-09-19','17:19:01','INSERCIÓN','Nuevo cliente insertado con ID 101'),(13,'root@localhost','2023-09-19','17:19:01','INSERCIÓN','Nuevo cliente insertado con ID 102'),(14,'root@localhost','2023-09-19','17:19:01','INSERCIÓN','Nuevo cliente insertado con ID 103'),(15,'root@localhost','2023-09-19','17:19:01','INSERCIÓN','Nuevo cliente insertado con ID 104'),(16,'root@localhost','2023-09-19','17:19:01','INSERCIÓN','Nuevo cliente insertado con ID 105'),(17,'root@localhost','2023-09-19','17:19:01','INSERCIÓN','Nuevo cliente insertado con ID 106'),(18,'root@localhost','2023-09-19','17:19:01','INSERCIÓN','Nuevo cliente insertado con ID 107'),(19,'root@localhost','2023-09-19','17:19:01','INSERCIÓN','Nuevo cliente insertado con ID 108'),(20,'root@localhost','2023-09-19','17:38:12','INSERCIÓN','Nuevo cliente insertado con ID 101'),(21,'root@localhost','2023-09-19','17:38:12','INSERCIÓN','Nuevo cliente insertado con ID 102'),(22,'root@localhost','2023-09-19','17:38:12','INSERCIÓN','Nuevo cliente insertado con ID 103'),(23,'root@localhost','2023-09-19','17:38:12','INSERCIÓN','Nuevo cliente insertado con ID 104');
/*!40000 ALTER TABLE `clientes_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL,
  `id_proveedor` int DEFAULT NULL,
  `fecha_compra` date NOT NULL,
  `detalle_compra` text,
  `total_compra` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,'2023-08-01','Compra de productos para la temporada de verano.',227.26),(2,3,'2023-08-02','Compra de sweaters y hoodies para la temporada de otoño.',206.02),(3,2,'2023-08-05','Compra de camisas y blusas de moda.',201.23),(4,5,'2023-08-07','Compra de shorts deportivos para actividades físicas.',237.19),(5,4,'2023-08-10','Compra de tank tops y crop tops.',198.10),(6,6,'2023-08-12','Compra de hoodies y cardigans elegantes.',105.58),(7,7,'2023-08-15','Compra de vestidos y faldas elegantes para ocasiones especiales.',183.34),(8,8,'2023-08-18','Compra de blazers y chaquetas modernas.',88.02),(9,10,'2023-08-20','Compra de ponchos y túnicas con estilo bohemio.',113.93),(10,9,'2023-08-23','Compra de jeans clásicos y básicos.',271.49),(11,1,'2023-08-25','Compra de shorts de verano y hoodies casuales.',419.47),(12,3,'2023-08-28','Compra de sweaters y hoodies para la temporada de otoño.',113.93),(13,2,'2023-08-30','Compra de camisas y blusas de moda.',94.15),(14,5,'2023-09-02','Compra de shorts deportivos para actividades físicas.',44.23),(15,4,'2023-09-05','Compra de tank tops y crop tops.',96.31),(16,6,'2023-09-08','Compra de hoodies y cardigans elegantes.',116.15),(17,7,'2023-09-11','Compra de vestidos y faldas elegantes para ocasiones especiales.',235.92),(18,8,'2023-09-14','Compra de blazers y chaquetas modernas.',113.93),(19,10,'2023-09-17','Compra de ponchos y túnicas con estilo bohemio.',88.02),(20,9,'2023-09-20','Compra de jeans clásicos y básicos.',136.49),(21,1,'2023-09-23','Compra de shorts de verano y hoodies casuales.',82.10),(22,3,'2023-09-26','Compra de sweaters y hoodies para la temporada de otoño.',44.23),(23,2,'2023-09-29','Compra de camisas y blusas de moda.',96.31),(24,5,'2023-10-02','Compra de shorts deportivos para actividades físicas.',113.93),(25,4,'2023-10-05','Compra de tank tops y crop tops.',94.15),(26,6,'2023-10-08','Compra de hoodies y cardigans elegantes.',44.23),(27,7,'2023-10-11','Compra de vestidos y faldas elegantes para ocasiones especiales.',96.31),(28,8,'2023-10-14','Compra de blazers y chaquetas modernas.',113.93),(29,10,'2023-10-17','Compra de ponchos y túnicas con estilo bohemio.',94.15),(30,9,'2023-10-20','Compra de jeans clásicos y básicos.',44.23);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_producto`
--

DROP TABLE IF EXISTS `compra_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_producto` (
  `id_compra_producto` int NOT NULL,
  `id_compra` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad_compra_producto` int NOT NULL,
  `precio_unitario_compra_producto` decimal(5,2) NOT NULL,
  `subtotal_compra_producto` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_compra_producto`),
  KEY `id_compra` (`id_compra`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `compra_producto_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  CONSTRAINT `compra_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_producto`
--

LOCK TABLES `compra_producto` WRITE;
/*!40000 ALTER TABLE `compra_producto` DISABLE KEYS */;
INSERT INTO `compra_producto` VALUES (1,1,1,4,40.00,160.00),(2,1,4,6,11.21,67.26),(3,2,2,3,43.79,131.37),(4,2,5,5,14.93,74.65),(5,3,3,2,72.37,144.74),(6,3,6,3,18.83,56.49),(7,4,10,4,26.80,107.20),(8,4,12,1,129.99,129.99),(9,5,9,5,12.05,60.25),(10,5,14,3,45.95,137.85),(11,6,4,4,11.21,44.84),(12,6,15,1,60.76,60.76),(13,7,1,3,48.56,145.68),(14,7,6,2,18.83,37.66),(15,8,9,4,12.05,48.20),(16,8,11,1,39.82,39.82),(17,9,5,3,14.93,44.79),(18,9,8,1,69.14,69.14),(19,10,2,5,52.29,261.45),(20,10,7,1,10.04,10.04),(21,11,3,4,72.37,289.48),(22,11,12,1,129.99,129.99),(23,12,5,3,14.93,44.79),(24,12,8,1,69.14,69.14),(25,13,9,4,12.05,48.20),(26,13,14,1,45.95,45.95),(27,14,4,2,11.21,22.42),(28,14,13,1,21.81,21.81),(29,15,6,3,18.83,56.49),(30,15,11,1,39.82,39.82),(31,16,1,2,40.00,80.00),(32,16,9,3,12.05,36.15),(33,17,2,4,43.79,175.16),(34,17,15,1,60.76,60.76),(35,18,5,3,14.93,44.79),(36,18,8,1,69.14,69.14),(37,19,9,4,12.05,48.20),(38,19,11,1,39.82,39.82),(39,20,1,2,40.00,80.00),(40,20,6,3,18.83,56.49),(41,21,9,3,12.05,36.15),(42,21,14,1,45.95,45.95),(43,22,4,2,11.21,22.42),(44,22,13,1,21.81,21.81),(45,23,6,3,18.83,56.49),(46,23,11,1,39.82,39.82),(47,24,5,3,14.93,44.79),(48,24,8,1,69.14,69.14),(49,25,9,4,12.05,48.20),(50,25,14,1,45.95,45.95),(51,26,4,2,11.21,22.42),(52,26,13,1,21.81,21.81),(53,27,6,3,18.83,56.49),(54,27,11,1,39.82,39.82),(55,28,5,3,14.93,44.79),(56,28,8,1,69.14,69.14),(57,29,9,4,12.05,48.20),(58,29,14,1,45.95,45.95),(59,30,4,2,11.21,22.42),(60,30,13,1,21.81,21.81);
/*!40000 ALTER TABLE `compra_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `compras_ultimo_mes`
--

DROP TABLE IF EXISTS `compras_ultimo_mes`;
/*!50001 DROP VIEW IF EXISTS `compras_ultimo_mes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `compras_ultimo_mes` AS SELECT 
 1 AS `fecha_compra`,
 1 AS `nombre_proveedor`,
 1 AS `ruc_proveedor`,
 1 AS `cantidad_productos`,
 1 AS `total_compra`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `id_entrega` int NOT NULL,
  `id_venta` int DEFAULT NULL,
  `id_repartidor` int DEFAULT NULL,
  `fecha_entrega` date NOT NULL,
  `detalle_entrega` text,
  PRIMARY KEY (`id_entrega`),
  KEY `id_venta` (`id_venta`),
  KEY `id_repartidor` (`id_repartidor`),
  CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`),
  CONSTRAINT `entrega_ibfk_2` FOREIGN KEY (`id_repartidor`) REFERENCES `repartidor` (`id_repartidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (1,1,1,'2023-08-15','Entrega de productos de compra de ropa veraniega'),(2,2,3,'2023-08-15','Entrega de productos para un look elegante'),(3,3,5,'2023-08-15','Entrega de productos de compra casual'),(4,4,2,'2023-08-15','Entrega de productos de ropa cómoda para el día a día'),(5,5,4,'2023-08-15','Entrega de productos para entrenamiento'),(6,6,6,'2023-08-15','Entrega de productos de ropa casual'),(7,7,8,'2023-08-15','Entrega de productos para look profesional'),(8,8,10,'2023-08-15','Entrega de productos de compra con estilo'),(9,9,7,'2023-08-15','Entrega de productos de ropa femenina'),(10,10,9,'2023-08-15','Entrega de productos bohemios'),(11,11,1,'2023-08-15','Entrega de productos de compra de sweaters'),(12,12,3,'2023-08-15','Entrega de productos elegantes'),(13,13,5,'2023-08-15','Entrega de productos de compra casual'),(14,14,2,'2023-08-15','Entrega de productos de ropa cómoda'),(15,15,4,'2023-08-15','Entrega de productos para actividades activas');
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `entregas_ultimo_mes`
--

DROP TABLE IF EXISTS `entregas_ultimo_mes`;
/*!50001 DROP VIEW IF EXISTS `entregas_ultimo_mes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `entregas_ultimo_mes` AS SELECT 
 1 AS `dni_repartidor`,
 1 AS `repartidor`,
 1 AS `fecha_entrega`,
 1 AS `detalle_entrega`,
 1 AS `id_venta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `info_producto`
--

DROP TABLE IF EXISTS `info_producto`;
/*!50001 DROP VIEW IF EXISTS `info_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_producto` AS SELECT 
 1 AS `stock_producto`,
 1 AS `nombre_producto`,
 1 AS `precio_producto`,
 1 AS `marca_producto`,
 1 AS `fecha_lanzamiento`,
 1 AS `nombre_categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `precio_producto` decimal(10,2) NOT NULL,
  `stock_producto` int NOT NULL,
  `descripcion_producto` text,
  `marca_producto` varchar(50) NOT NULL,
  `descuento_producto` decimal(10,2) DEFAULT NULL,
  `fecha_lanzamiento` date DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `nombre_producto` (`nombre_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Shorts de Verano',48.56,33,'Shorts cómodos y frescos para disfrutar del verano.','SunStyle',40.80,'2023-03-21'),(2,'Camisa a Rayas',52.29,45,'Camisa a rayas de alta calidad con un diseño elegante.','ClothMasters',9.74,'2023-05-22'),(3,'Sweater Clásico',72.37,23,'Sweater suave y cálido perfecto para los días frescos.','CozyKnits',46.96,'2022-09-29'),(4,'Tank Top Básico',11.21,29,'Tank top versátil y cómodo para cualquier ocasión.','EssentialWear',29.56,'2023-04-22'),(5,'Hoodie Casual',14.93,70,'Hoodie informal con capucha ajustable y diseño moderno.','UrbanChic',4.12,'2022-10-01'),(6,'Hoodie Acogedor',18.83,7,'Hoodie con tejido suave y acogedor para días relajados.','ComfyCloth',3.78,'2022-11-11'),(7,'Vestido Elegante',10.04,46,'Vestido elegante y versátil para eventos especiales.','EleganceAffair',21.80,'2022-10-30'),(8,'Blazer Moderno',69.14,-2,'Blazer moderno y sofisticado para un estilo profesional.','SharpLooks',23.02,'2022-10-05'),(9,'Crop Top Veraniego',12.05,59,'Crop top con diseño fresco ideal para el verano.','SummerVibes',2.05,'2023-02-15'),(10,'Poncho Bohemio',26.80,51,'Poncho con estilo bohemio y colores vibrantes.','BohoChic',14.65,'2023-06-10'),(11,'Falda de Flores',39.82,-2,'Falda con estampado floral y diseño femenino.','BlossomStyle',10.29,'2022-10-27'),(12,'Chamarra de Cuero',129.99,7,'Chamarra de cuero genuino con un estilo audaz y moderno.','LeatherCraft',15.00,'2023-08-14'),(13,'Top Casual',21.81,3,'Top casual y versátil para combinar con cualquier outfit.','EverydayChic',3.80,'2023-05-18'),(14,'Romper de Verano',45.95,9,'Romper ligero y fresco perfecto para el verano.','SummerEscape',49.85,'2023-05-24'),(15,'Sweater Cálido',60.76,44,'Sweater cálido y suave para mantenerte abrigado.','WarmEssentials',6.44,'2023-06-30'),(16,'Abrigo Elegante',14.70,9,'Abrigo elegante y sofisticado para los días fríos.','ElegantCoat',48.53,'2022-11-12'),(17,'Chaqueta de Moda',77.41,60,'Chaqueta de moda con diseño moderno y versátil.','TrendyStyle',48.95,'2023-07-09'),(18,'Jeans Clásicos',32.94,59,'Jeans clásicos y cómodos para el uso diario.','ClassicDenim',39.23,'2023-01-24'),(19,'Top Elegante',77.25,6,'Top elegante y sofisticado para ocasiones especiales.','ElegantTouches',33.15,'2022-08-29'),(20,'Hoodie con Estilo',23.28,40,'Hoodie con estilo único y detalles modernos.','StyleFusion',12.33,'2023-02-18'),(21,'Túnica Bohemia',46.48,55,'Túnica con inspiración bohemia y colores vibrantes.','BohoVibes',18.13,'2023-02-03'),(22,'Chaleco de Moda',63.21,29,'Chaleco de moda para un look urbano y actual.','UrbanStyle',18.37,'2023-07-02'),(23,'Halter Top Veraniego',71.68,72,'Halter top fresco y versátil para los días soleados.','SunriseVibes',38.51,'2023-01-22'),(24,'Shorts de Playa',31.48,9,'Shorts de playa cómodos y perfectos para relajarse.','BeachLife',47.63,'2023-05-19'),(25,'Shorts Deportivos',58.50,76,'Shorts deportivos para entrenamientos y actividades activas.','ActiveGear',14.87,'2023-07-16'),(26,'Cardigan Elegante',44.04,13,'Cardigan elegante con detalles sofisticados para un look refinado.','Sophisticate',35.93,'2023-06-21'),(27,'Blusa de Moda',51.66,69,'Blusa de moda con diseño vanguardista y atractivo.','FashionEdge',45.29,'2023-05-02'),(28,'Vestido Estampado',42.50,13,'Vestido con estampado único y fresco para el verano.','PrintSensation',20.00,'2023-07-28'),(29,'Blazer Elegante',75.79,1,'Blazer elegante y sofisticado para ocasiones especiales.','ElegantAffairs',12.62,'2023-07-20'),(30,'Poncho de Otoño',12.39,52,'Poncho de otoño con colores cálidos y texturas suaves.','AutumnHues',20.22,'2022-10-19');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_log`
--

DROP TABLE IF EXISTS `productos_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `accion` varchar(50) NOT NULL,
  `detalle` text,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_log`
--

LOCK TABLES `productos_log` WRITE;
/*!40000 ALTER TABLE `productos_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL,
  `nombre_proveedor` varchar(50) NOT NULL,
  `correo_proveedor` varchar(50) NOT NULL,
  `telefono_proveedor` varchar(20) NOT NULL,
  `direccion_proveedor` varchar(100) NOT NULL,
  `pais_proveedor` varchar(50) NOT NULL,
  `ruc_proveedor` varchar(20) NOT NULL,
  `cuenta_bancaria_proveedor` varchar(20) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Proveedor A','proveedora@example.com','+1234567890','Calle 123, Ciudad A','País A','12345678901','ES123456789012345678'),(2,'Proveedor B','proveedorb@example.com','+9876543210','Avenida 456, Ciudad B','País B','98765432109','DE987654321098765432'),(3,'Proveedor C','proveedorc@example.com','+4567890123','Plaza 789, Ciudad C','País C','45678901234','FR456789012345678901'),(4,'Proveedor D','proveedord@example.com','+2345678901','Calle 567, Ciudad D','País D','23456789012','IT234567890123456789'),(5,'Proveedor E','proveedore@example.com','+8765432109','Avenida 678, Ciudad E','País E','87654321023','UK876543210987654321'),(6,'Proveedor F','proveedorf@example.com','+3456789012','Plaza 890, Ciudad F','País F','34567890123','JP345678901234567890'),(7,'Proveedor G','proveedorg@example.com','+1234567890','Calle 123, Ciudad G','País G','12345678934','RU123456789012345678'),(8,'Proveedor H','proveedorh@example.com','+9876543210','Avenida 456, Ciudad H','País H','98765432156','CH987654321098765432'),(9,'Proveedor I','proveedori@example.com','+4567890123','Plaza 789, Ciudad I','País I','45678901267','AU456789012345678901'),(10,'Proveedor J','proveedorj@example.com','+2345678901','Calle 567, Ciudad J','País J','23456789078','CA234567890123456789');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repartidor`
--

DROP TABLE IF EXISTS `repartidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repartidor` (
  `id_repartidor` int NOT NULL,
  `nombre_repartidor` varchar(50) NOT NULL,
  `apellido_repartidor` varchar(50) NOT NULL,
  `usuario_repartidor` varchar(100) NOT NULL,
  `contrasena_repartidor` varchar(100) NOT NULL,
  `dni_repartidor` varchar(20) NOT NULL,
  `direccion_repartidor` varchar(100) NOT NULL,
  `telefono_repartidor` varchar(20) NOT NULL,
  `correo_repartidor` varchar(50) NOT NULL,
  `fecha_nacimiento_repartidor` date NOT NULL,
  PRIMARY KEY (`id_repartidor`),
  UNIQUE KEY `usuario_repartidor` (`usuario_repartidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartidor`
--

LOCK TABLES `repartidor` WRITE;
/*!40000 ALTER TABLE `repartidor` DISABLE KEYS */;
INSERT INTO `repartidor` VALUES (1,'Luis','Gómez','luis123','contrasena123','1234567890','Calle 123, Ciudad A','+1234567890','luis@example.com','1995-05-15'),(2,'Ana','Rodríguez','ana456','contrasena456','9876543210','Avenida 456, Ciudad B','+9876543210','ana@example.com','1990-11-30'),(3,'Juan','López','juan789','contrasena789','4567890123','Plaza 789, Ciudad C','+4567890123','juan@example.com','1993-02-20'),(4,'María','Martínez','maria234','contrasena234','2345678901','Calle 567, Ciudad D','+2345678901','maria@example.com','1992-08-10'),(5,'Carlos','Hernández','carlos678','contrasena678','8765432109','Avenida 678, Ciudad E','+8765432109','carlos@example.com','1988-04-25'),(6,'Laura','Gómez','laura890','contrasena890','3456789012','Plaza 890, Ciudad F','+3456789012','laura@example.com','1991-09-12'),(7,'Pablo','Pérez','pablo123','contrasena123','1234567890','Calle 123, Ciudad G','+1234567890','pablo@example.com','1994-07-03'),(8,'Sofía','Díaz','sofia456','contrasena456','9876543210','Avenida 456, Ciudad H','+9876543210','sofia@example.com','1987-12-18'),(9,'Diego','Torres','diego789','contrasena789','4567890123','Plaza 789, Ciudad I','+4567890123','diego@example.com','1993-03-07'),(10,'Valentina','Ruíz','valentina234','contrasena234','2345678901','Calle 567, Ciudad J','+2345678901','valentina@example.com','1997-10-22');
/*!40000 ALTER TABLE `repartidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `stock_bajo_producto`
--

DROP TABLE IF EXISTS `stock_bajo_producto`;
/*!50001 DROP VIEW IF EXISTS `stock_bajo_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `stock_bajo_producto` AS SELECT 
 1 AS `nombre_proveedor`,
 1 AS `stock_producto`,
 1 AS `nombre_producto`,
 1 AS `precio_producto`,
 1 AS `marca_producto`,
 1 AS `fecha_lanzamiento`,
 1 AS `nombre_categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `total_venta` decimal(10,2) NOT NULL,
  `fecha_venta` date NOT NULL,
  `detalle_venta` text,
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,92.63,'2023-08-14','Compra de ropa veraniega'),(2,3,127.19,'2023-08-14','Productos para un look elegante'),(3,5,47.30,'2023-08-14','Compra casual'),(4,2,90.11,'2023-08-14','Ropa cómoda para el día a día'),(5,4,154.78,'2023-08-14','Productos para entrenamiento'),(6,6,33.60,'2023-08-14','Ropa casual'),(7,8,129.46,'2023-08-14','Look profesional'),(8,10,57.20,'2023-08-14','Compra con estilo'),(9,7,61.58,'2023-08-14','Ropa femenina'),(10,9,95.42,'2023-08-14','Productos bohemios'),(11,1,72.37,'2023-08-14','Compra de sweaters'),(12,3,33.63,'2023-08-14','Productos elegantes'),(13,5,27.38,'2023-08-14','Compra casual'),(14,2,67.79,'2023-08-14','Ropa cómoda'),(15,4,119.55,'2023-08-14','Productos para actividades activas');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_producto`
--

DROP TABLE IF EXISTS `venta_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_producto` (
  `id_venta_producto` int NOT NULL,
  `id_venta` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `precio_unitario_venta_producto` decimal(5,2) NOT NULL,
  `subtotal_venta_producto` decimal(5,2) NOT NULL,
  `cantidad_venta_producto` int NOT NULL,
  PRIMARY KEY (`id_venta_producto`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `venta_producto_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`),
  CONSTRAINT `venta_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_producto`
--

LOCK TABLES `venta_producto` WRITE;
/*!40000 ALTER TABLE `venta_producto` DISABLE KEYS */;
INSERT INTO `venta_producto` VALUES (1,1,1,43.70,87.40,2),(2,1,3,64.13,128.26,2),(3,2,5,13.44,26.88,2),(4,2,8,53.50,107.00,2),(5,3,10,22.52,45.04,2),(6,3,13,21.29,42.58,2),(7,4,15,54.69,109.38,2),(8,4,18,29.82,59.64,2),(9,5,20,20.95,41.90,2),(10,5,25,49.53,99.06,2),(11,6,28,36.63,73.26,2),(12,6,30,22.44,44.88,2),(13,7,1,39.07,78.14,2),(14,7,4,6.34,12.68,2),(15,8,6,15.05,30.10,2),(16,8,9,10.65,21.30,2),(17,9,11,35.75,71.50,2),(18,9,14,22.98,45.96,2),(19,10,16,6.63,13.26,2),(20,10,19,69.53,139.06,2),(21,11,21,41.83,83.66,2),(22,11,23,34.25,68.50,2),(23,12,26,23.89,47.78,2),(24,12,28,25.89,51.78,2),(25,13,29,47.92,95.84,2),(26,13,30,23.10,46.20,2),(27,14,2,47.06,94.12,2),(28,14,5,13.44,26.88,2),(29,15,7,8.02,16.04,2),(30,15,10,25.48,50.96,2),(31,1,12,116.99,233.98,2),(32,1,15,54.69,109.38,2),(33,2,18,20.04,40.08,2),(34,2,21,46.97,93.94,2),(35,3,24,14.99,29.98,2),(36,3,26,41.80,83.60,2),(37,4,28,36.63,73.26,2),(38,4,30,18.07,36.14,2),(39,5,3,58.83,117.66,2),(40,5,6,15.05,30.10,2);
/*!40000 ALTER TABLE `venta_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ventas_ultimo_mes`
--

DROP TABLE IF EXISTS `ventas_ultimo_mes`;
/*!50001 DROP VIEW IF EXISTS `ventas_ultimo_mes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventas_ultimo_mes` AS SELECT 
 1 AS `fecha_venta`,
 1 AS `cliente`,
 1 AS `usuario_cliente`,
 1 AS `cantidad_productos`,
 1 AS `total_venta`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `compras_ultimo_mes`
--

/*!50001 DROP VIEW IF EXISTS `compras_ultimo_mes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `compras_ultimo_mes` AS select `c`.`fecha_compra` AS `fecha_compra`,`p`.`nombre_proveedor` AS `nombre_proveedor`,`p`.`ruc_proveedor` AS `ruc_proveedor`,sum(`cp`.`cantidad_compra_producto`) AS `cantidad_productos`,`c`.`total_compra` AS `total_compra` from ((`compra` `c` join `proveedor` `p` on((`c`.`id_proveedor` = `p`.`id_proveedor`))) join `compra_producto` `cp` on((`c`.`id_compra` = `cp`.`id_compra`))) where ((`c`.`fecha_compra` >= ((last_day(now()) - interval 1 month) + interval 1 day)) and (`c`.`fecha_compra` < (last_day(now()) + interval 1 day))) group by `c`.`id_compra` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `entregas_ultimo_mes`
--

/*!50001 DROP VIEW IF EXISTS `entregas_ultimo_mes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `entregas_ultimo_mes` AS select `r`.`dni_repartidor` AS `dni_repartidor`,concat(`r`.`nombre_repartidor`,' ',`r`.`apellido_repartidor`) AS `repartidor`,`e`.`fecha_entrega` AS `fecha_entrega`,`e`.`detalle_entrega` AS `detalle_entrega`,`e`.`id_venta` AS `id_venta` from (`entrega` `e` join `repartidor` `r` on((`e`.`id_repartidor` = `r`.`id_repartidor`))) where (`e`.`fecha_entrega` between (curdate() - interval 1 month) and curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_producto`
--

/*!50001 DROP VIEW IF EXISTS `info_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_producto` AS select `p`.`stock_producto` AS `stock_producto`,`p`.`nombre_producto` AS `nombre_producto`,`p`.`precio_producto` AS `precio_producto`,`p`.`marca_producto` AS `marca_producto`,`p`.`fecha_lanzamiento` AS `fecha_lanzamiento`,`c`.`nombre_categoria` AS `nombre_categoria` from ((`producto` `p` join `categoria_producto` `cp` on((`p`.`id_producto` = `cp`.`id_producto`))) join `categoria` `c` on((`cp`.`id_categoria` = `c`.`id_categoria`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stock_bajo_producto`
--

/*!50001 DROP VIEW IF EXISTS `stock_bajo_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stock_bajo_producto` AS select `pr`.`nombre_proveedor` AS `nombre_proveedor`,`p`.`stock_producto` AS `stock_producto`,`p`.`nombre_producto` AS `nombre_producto`,`p`.`precio_producto` AS `precio_producto`,`p`.`marca_producto` AS `marca_producto`,`p`.`fecha_lanzamiento` AS `fecha_lanzamiento`,`c`.`nombre_categoria` AS `nombre_categoria` from (((((`producto` `p` join `compra_producto` `cop` on((`p`.`id_producto` = `cop`.`id_producto`))) join `compra` `co` on((`cop`.`id_compra` = `co`.`id_compra`))) join `proveedor` `pr` on((`co`.`id_proveedor` = `pr`.`id_proveedor`))) join `categoria_producto` `cp` on((`p`.`id_producto` = `cp`.`id_producto`))) join `categoria` `c` on((`cp`.`id_categoria` = `c`.`id_categoria`))) where (`p`.`stock_producto` < 10) order by `p`.`fecha_lanzamiento` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ventas_ultimo_mes`
--

/*!50001 DROP VIEW IF EXISTS `ventas_ultimo_mes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_ultimo_mes` AS select `v`.`fecha_venta` AS `fecha_venta`,concat(`c`.`nombre_cliente`,' ',`c`.`apellido_cliente`) AS `cliente`,`c`.`usuario_cliente` AS `usuario_cliente`,sum(`vp`.`cantidad_venta_producto`) AS `cantidad_productos`,`v`.`total_venta` AS `total_venta` from ((`venta` `v` join `cliente` `c` on((`v`.`id_cliente` = `c`.`id_cliente`))) join `venta_producto` `vp` on((`v`.`id_venta` = `vp`.`id_venta`))) where ((`v`.`fecha_venta` >= ((last_day(now()) - interval 1 month) + interval 1 day)) and (`v`.`fecha_venta` < (last_day(now()) + interval 1 day))) group by `v`.`id_venta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-23 17:28:23
