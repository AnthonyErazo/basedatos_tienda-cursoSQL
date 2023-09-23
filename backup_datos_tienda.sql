-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda_ropa
-- ------------------------------------------------------
-- Server version	8.0.32

# Datos de la tabla cliente, producto y venta

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
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Ana','García','+1234567890','1234567890','Calle 123, Ciudad A','ana123','contrasena123','País A','ana@example.com','1990-05-15','Femenino'),(2,'Juan','Rodríguez','+9876543210','9876543210','Avenida 456, Ciudad B','juan456','contrasena456','País B','juan@example.com','1988-11-30','Masculino'),(3,'María','López','+4567890123','4567890123','Plaza 789, Ciudad C','maria789','contrasena789','País C','maria@example.com','1995-02-20','Femenino'),(4,'Carlos','Martínez','+2345678901','2345678901','Calle 567, Ciudad D','carlos234','contrasena234','País D','carlos@example.com','1992-08-10','Masculino'),(5,'Laura','Hernández','+8765432109','8765432109','Avenida 678, Ciudad E','laura678','contrasena678','País E','laura@example.com','1998-04-25','Femenino'),(6,'Pablo','Gómez','+3456789012','3456789012','Plaza 890, Ciudad F','pablo890','contrasena890','País F','pablo@example.com','1991-09-12','Masculino'),(7,'Sofía','Pérez','+1234567890','1234567896','Calle 123, Ciudad G','sofia123','contrasena124','País G','sofia@example.com','1994-07-03','Femenino'),(8,'Diego','Díaz','+9876543210','9876543214','Avenida 456, Ciudad H','diego456','contrasena458','País H','diego@example.com','1987-12-18','Masculino'),(9,'Valentina','Torres','+4567890123','4567890127','Plaza 789, Ciudad I','valentina789','contrasena781','País I','valentina@example.com','1993-03-07','Femenino'),(10,'Andrés','Ruíz','+2345678901','2345678957','Calle 567, Ciudad J','andres234','contrasena236','País J','andres@example.com','1997-10-22','Masculino'),(101,'Nuevo','Cliente1','+1234567890','2234567815','Calle 123, Ciudad A','nuevo1','contrasena1','País 1','nuevo1@example.com','1990-01-01','Género 1'),(102,'Nuevo','Cliente2','+2345678901','4345678815','Calle 234, Ciudad B','nuevo2','contrasena2','País 2','nuevo2@example.com','1990-02-02','Género 2'),(103,'Nuevo','Cliente3','+3456789012','5456783214','Calle 345, Ciudad C','nuevo3','contrasena3','País 3','nuevo3@example.com','1990-03-03','Género 3'),(104,'Nuevo','Cliente4','+4567890123','6567894213','Calle 456, Ciudad D','nuevo4','contrasena4','País 4','nuevo4@example.com','1990-04-04','Género 4');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Shorts de Verano',48.56,33,'Shorts cómodos y frescos para disfrutar del verano.','SunStyle',40.80,'2023-03-21'),(2,'Camisa a Rayas',52.29,45,'Camisa a rayas de alta calidad con un diseño elegante.','ClothMasters',9.74,'2023-05-22'),(3,'Sweater Clásico',72.37,23,'Sweater suave y cálido perfecto para los días frescos.','CozyKnits',46.96,'2022-09-29'),(4,'Tank Top Básico',11.21,29,'Tank top versátil y cómodo para cualquier ocasión.','EssentialWear',29.56,'2023-04-22'),(5,'Hoodie Casual',14.93,70,'Hoodie informal con capucha ajustable y diseño moderno.','UrbanChic',4.12,'2022-10-01'),(6,'Hoodie Acogedor',18.83,7,'Hoodie con tejido suave y acogedor para días relajados.','ComfyCloth',3.78,'2022-11-11'),(7,'Vestido Elegante',10.04,46,'Vestido elegante y versátil para eventos especiales.','EleganceAffair',21.80,'2022-10-30'),(8,'Blazer Moderno',69.14,-2,'Blazer moderno y sofisticado para un estilo profesional.','SharpLooks',23.02,'2022-10-05'),(9,'Crop Top Veraniego',12.05,59,'Crop top con diseño fresco ideal para el verano.','SummerVibes',2.05,'2023-02-15'),(10,'Poncho Bohemio',26.80,51,'Poncho con estilo bohemio y colores vibrantes.','BohoChic',14.65,'2023-06-10'),(11,'Falda de Flores',39.82,-2,'Falda con estampado floral y diseño femenino.','BlossomStyle',10.29,'2022-10-27'),(12,'Chamarra de Cuero',129.99,7,'Chamarra de cuero genuino con un estilo audaz y moderno.','LeatherCraft',15.00,'2023-08-14'),(13,'Top Casual',21.81,3,'Top casual y versátil para combinar con cualquier outfit.','EverydayChic',3.80,'2023-05-18'),(14,'Romper de Verano',45.95,9,'Romper ligero y fresco perfecto para el verano.','SummerEscape',49.85,'2023-05-24'),(15,'Sweater Cálido',60.76,44,'Sweater cálido y suave para mantenerte abrigado.','WarmEssentials',6.44,'2023-06-30'),(16,'Abrigo Elegante',14.70,9,'Abrigo elegante y sofisticado para los días fríos.','ElegantCoat',48.53,'2022-11-12'),(17,'Chaqueta de Moda',77.41,60,'Chaqueta de moda con diseño moderno y versátil.','TrendyStyle',48.95,'2023-07-09'),(18,'Jeans Clásicos',32.94,59,'Jeans clásicos y cómodos para el uso diario.','ClassicDenim',39.23,'2023-01-24'),(19,'Top Elegante',77.25,6,'Top elegante y sofisticado para ocasiones especiales.','ElegantTouches',33.15,'2022-08-29'),(20,'Hoodie con Estilo',23.28,40,'Hoodie con estilo único y detalles modernos.','StyleFusion',12.33,'2023-02-18'),(21,'Túnica Bohemia',46.48,55,'Túnica con inspiración bohemia y colores vibrantes.','BohoVibes',18.13,'2023-02-03'),(22,'Chaleco de Moda',63.21,29,'Chaleco de moda para un look urbano y actual.','UrbanStyle',18.37,'2023-07-02'),(23,'Halter Top Veraniego',71.68,72,'Halter top fresco y versátil para los días soleados.','SunriseVibes',38.51,'2023-01-22'),(24,'Shorts de Playa',31.48,9,'Shorts de playa cómodos y perfectos para relajarse.','BeachLife',47.63,'2023-05-19'),(25,'Shorts Deportivos',58.50,76,'Shorts deportivos para entrenamientos y actividades activas.','ActiveGear',14.87,'2023-07-16'),(26,'Cardigan Elegante',44.04,13,'Cardigan elegante con detalles sofisticados para un look refinado.','Sophisticate',35.93,'2023-06-21'),(27,'Blusa de Moda',51.66,69,'Blusa de moda con diseño vanguardista y atractivo.','FashionEdge',45.29,'2023-05-02'),(28,'Vestido Estampado',42.50,13,'Vestido con estampado único y fresco para el verano.','PrintSensation',20.00,'2023-07-28'),(29,'Blazer Elegante',75.79,1,'Blazer elegante y sofisticado para ocasiones especiales.','ElegantAffairs',12.62,'2023-07-20'),(30,'Poncho de Otoño',12.39,52,'Poncho de otoño con colores cálidos y texturas suaves.','AutumnHues',20.22,'2022-10-19');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,92.63,'2023-08-14','Compra de ropa veraniega'),(2,3,127.19,'2023-08-14','Productos para un look elegante'),(3,5,47.30,'2023-08-14','Compra casual'),(4,2,90.11,'2023-08-14','Ropa cómoda para el día a día'),(5,4,154.78,'2023-08-14','Productos para entrenamiento'),(6,6,33.60,'2023-08-14','Ropa casual'),(7,8,129.46,'2023-08-14','Look profesional'),(8,10,57.20,'2023-08-14','Compra con estilo'),(9,7,61.58,'2023-08-14','Ropa femenina'),(10,9,95.42,'2023-08-14','Productos bohemios'),(11,1,72.37,'2023-08-14','Compra de sweaters'),(12,3,33.63,'2023-08-14','Productos elegantes'),(13,5,27.38,'2023-08-14','Compra casual'),(14,2,67.79,'2023-08-14','Ropa cómoda'),(15,4,119.55,'2023-08-14','Productos para actividades activas');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-23 17:45:29
