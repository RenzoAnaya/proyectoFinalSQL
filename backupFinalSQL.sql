CREATE DATABASE  IF NOT EXISTS `compra` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `compra`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: compra
-- ------------------------------------------------------
-- Server version	8.0.29

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
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `descripcionCategoria` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Fruta'),(2,'Verdura'),(3,'Fruto Seco');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clientesdestacados`
--

DROP TABLE IF EXISTS `clientesdestacados`;
/*!50001 DROP VIEW IF EXISTS `clientesdestacados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clientesdestacados` AS SELECT 
 1 AS `nombre`,
 1 AS `idOrder`,
 1 AS `telefono`,
 1 AS `totalPedidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `idDelivery` int NOT NULL AUTO_INCREMENT,
  `deliveryDate` date NOT NULL,
  PRIMARY KEY (`idDelivery`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'2023-02-08'),(2,'2023-02-09'),(3,'2023-02-10');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estacionalidad`
--

DROP TABLE IF EXISTS `estacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estacionalidad` (
  `idEstacionalidad` int NOT NULL AUTO_INCREMENT,
  `descripcionEstacionalidad` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idEstacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacionalidad`
--

LOCK TABLES `estacionalidad` WRITE;
/*!40000 ALTER TABLE `estacionalidad` DISABLE KEYS */;
INSERT INTO `estacionalidad` VALUES (1,'Sí está en temporada'),(2,'No está en temporada');
/*!40000 ALTER TABLE `estacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `idStatus` int NOT NULL AUTO_INCREMENT,
  `descripcionStatus` varchar(40) NOT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'pendiente'),(2,'terminado'),(3,'con problemas');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `madurez`
--

DROP TABLE IF EXISTS `madurez`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `madurez` (
  `idMadurez` int NOT NULL AUTO_INCREMENT,
  `descripcionMadurez` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idMadurez`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `madurez`
--

LOCK TABLES `madurez` WRITE;
/*!40000 ALTER TABLE `madurez` DISABLE KEYS */;
INSERT INTO `madurez` VALUES (1,'Por madurar'),(2,'Madura');
/*!40000 ALTER TABLE `madurez` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `idOrder` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `idDelivery` int NOT NULL,
  `idStatus` int NOT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idDelivery` (`idDelivery`),
  KEY `idStatus` (`idStatus`),
  CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`idDelivery`) REFERENCES `delivery` (`idDelivery`),
  CONSTRAINT `orden_ibfk_3` FOREIGN KEY (`idStatus`) REFERENCES `estado` (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (1,2,1,1),(2,1,1,2),(3,3,2,3),(4,4,2,3),(5,5,2,2),(6,3,2,2),(7,3,2,3),(8,4,2,2),(9,4,2,1),(10,2,2,2);
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pedidosconproblemas`
--

DROP TABLE IF EXISTS `pedidosconproblemas`;
/*!50001 DROP VIEW IF EXISTS `pedidosconproblemas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pedidosconproblemas` AS SELECT 
 1 AS `usuario`,
 1 AS `idOrder`,
 1 AS `deliveryDate`,
 1 AS `descripcionStatus`,
 1 AS `telefono`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `presentacion`
--

DROP TABLE IF EXISTS `presentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presentacion` (
  `idPresentacion` int NOT NULL AUTO_INCREMENT,
  `descripcionPresentacion` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idPresentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentacion`
--

LOCK TABLES `presentacion` WRITE;
/*!40000 ALTER TABLE `presentacion` DISABLE KEYS */;
INSERT INTO `presentacion` VALUES (1,'1 kilo'),(2,'500gr'),(3,'250gr'),(4,'100gr');
/*!40000 ALTER TABLE `presentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(40) NOT NULL,
  `imagenProducto` varchar(500) NOT NULL,
  `precioProducto` decimal(10,2) NOT NULL,
  `costoProducto` decimal(10,2) NOT NULL,
  `idCategoria` int NOT NULL,
  `idEstacionalidad` int NOT NULL,
  `idPresentacion` int NOT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `idCategoria` (`idCategoria`),
  KEY `idEstacionalidad` (`idEstacionalidad`),
  KEY `idPresentacion` (`idPresentacion`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idEstacionalidad`) REFERENCES `estacionalidad` (`idEstacionalidad`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`idPresentacion`) REFERENCES `presentacion` (`idPresentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Fresa','fkjdsnfkljsdhflk32497h',10.00,5.00,1,2,2),(2,'Melón','fdkjnsf987423nklj',10.00,4.00,2,1,1),(3,'Camote','dnmsa9d93whndojkw',2.00,1.00,2,1,1),(4,'Palta','dnsaidnas8dnlanm',17.00,10.00,1,1,1),(5,'Maní','dñasmd9swdsja9sdn',20.00,13.00,3,1,4);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `productosdisponibles`
--

DROP TABLE IF EXISTS `productosdisponibles`;
/*!50001 DROP VIEW IF EXISTS `productosdisponibles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productosdisponibles` AS SELECT 
 1 AS `nombreProducto`,
 1 AS `numeroStock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `productosestacionales`
--

DROP TABLE IF EXISTS `productosestacionales`;
/*!50001 DROP VIEW IF EXISTS `productosestacionales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productosestacionales` AS SELECT 
 1 AS `nombreProducto`,
 1 AS `descripcionEstacionalidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `productosmascomprados`
--

DROP TABLE IF EXISTS `productosmascomprados`;
/*!50001 DROP VIEW IF EXISTS `productosmascomprados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productosmascomprados` AS SELECT 
 1 AS `idProduct`,
 1 AS `nombreProducto`,
 1 AS `cantidadPedidaTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productosorden`
--

DROP TABLE IF EXISTS `productosorden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productosorden` (
  `idProductosOrden` int NOT NULL AUTO_INCREMENT,
  `idOrder` int NOT NULL,
  `idProduct` int NOT NULL,
  `idTamano` int DEFAULT NULL,
  `idMadurez` int DEFAULT NULL,
  `cantidad` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idProductosOrden`),
  KEY `idOrder` (`idOrder`),
  KEY `idProduct` (`idProduct`),
  KEY `idTamano` (`idTamano`),
  KEY `idMadurez` (`idMadurez`),
  CONSTRAINT `productosorden_ibfk_1` FOREIGN KEY (`idOrder`) REFERENCES `orden` (`idOrder`),
  CONSTRAINT `productosorden_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `producto` (`idProduct`),
  CONSTRAINT `productosorden_ibfk_3` FOREIGN KEY (`idTamano`) REFERENCES `tamano` (`idTamano`),
  CONSTRAINT `productosorden_ibfk_4` FOREIGN KEY (`idMadurez`) REFERENCES `madurez` (`idMadurez`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productosorden`
--

LOCK TABLES `productosorden` WRITE;
/*!40000 ALTER TABLE `productosorden` DISABLE KEYS */;
INSERT INTO `productosorden` VALUES (1,1,1,NULL,NULL,1),(2,1,2,2,NULL,2),(3,1,3,NULL,NULL,6),(4,1,4,2,1,5),(5,2,1,NULL,NULL,1),(6,2,3,NULL,NULL,4),(7,2,4,3,2,1),(8,3,2,1,NULL,3),(9,3,1,NULL,NULL,1),(10,4,3,NULL,NULL,2),(11,4,5,NULL,NULL,1);
/*!40000 ALTER TABLE `productosorden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `idStock` int NOT NULL AUTO_INCREMENT,
  `idProduct` int NOT NULL,
  `numeroStock` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idStock`),
  KEY `idProduct` (`idProduct`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `producto` (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,5),(2,2,7),(3,3,4),(4,4,5),(5,5,3);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamano`
--

DROP TABLE IF EXISTS `tamano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tamano` (
  `idTamano` int NOT NULL AUTO_INCREMENT,
  `descripcionTamano` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idTamano`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamano`
--

LOCK TABLES `tamano` WRITE;
/*!40000 ALTER TABLE `tamano` DISABLE KEYS */;
INSERT INTO `tamano` VALUES (1,'Pequeño'),(2,'Mediano'),(3,'Grande');
/*!40000 ALTER TABLE `tamano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `telefono` decimal(10,0) NOT NULL,
  `mail` varchar(70) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Juan','Dominguez',947888444,'reree@gmail.com','Avenida Juan chavez 543'),(2,'Juana','Martinez',987654622,'dfdfdf@gmail.com','Jiron calua 333'),(3,'Elsa','Bordelmar',987654322,'sdsdsd@gmail.com','Calle gamarra 1010'),(4,'Jaime','Perez',987654623,'hola@gmail.com','Calle humberto cienaga 870'),(5,'Raul','Lopez',987654323,'gfgdsf@gmail.com','Avenida San Cristobal 2010');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `checkMail` BEFORE INSERT ON `usuario` FOR EACH ROW begin
	if new.mail not like '%@%.%' then
    signal sqlstate'45000'
    set MESSAGE_TEXT="Correo inválido";
    end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `checkSimilarMail` BEFORE INSERT ON `usuario` FOR EACH ROW begin
	if new.mail IN(select mail from usuario) then
    signal sqlstate'45000'
    set MESSAGE_TEXT="Correo ya existente";
    end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `checkPhoneNum` BEFORE INSERT ON `usuario` FOR EACH ROW begin
	if new.telefono < 900000000 then
    signal sqlstate'45000'
    set MESSAGE_TEXT="Número inválido";
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validPhone` BEFORE INSERT ON `usuario` FOR EACH ROW begin
	if new.telefono not like '9%' then
    signal sqlstate'45000'
    set MESSAGE_TEXT="Número no válido en Perú";
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `checkPhone` BEFORE INSERT ON `usuario` FOR EACH ROW begin
	if new.telefono IN(select telefono from usuario) then
    signal sqlstate'45000'
    set MESSAGE_TEXT="Número ya registrado";
    end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'compra'
--

--
-- Dumping routines for database 'compra'
--
/*!50003 DROP FUNCTION IF EXISTS `actualizarStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `actualizarStock`(num numeric(10)) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
begin
declare a numeric(10);
declare mensaje varchar(20);
declare min numeric(10);
set min = 3;
set a = num-min;

IF a>0
THEN
set mensaje = "Stock suficiente" ;
ELSE
set mensaje = "Comprar más" ;
END IF;
return mensaje;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `diferenciaPrecio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `diferenciaPrecio`(costo numeric(10,2), precio numeric(10,2)) RETURNS decimal(10,2)
    DETERMINISTIC
begin
declare dif numeric(10,2);
SET dif = precio-costo;

return dif;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarAgregarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarAgregarProducto`(
	IN procesoAEjecutar VARCHAR(6),
	IN idOrder tinyint,
	IN idProduct tinyint)
procesoEtiquetado: BEGIN
	IF UPPER(procesoAEjecutar) LIKE "DELETE" THEN
		-- DELETE 
		SET @result_query = CONCAT_WS(" ", "DELETE FROM productosOrden WHERE idOrder =", idOrder, "AND idProduct =", idProduct);
	ELSEIF UPPER(procesoAEjecutar) LIKE "INSERT" THEN
		-- INSERT 
		SET @result_query = CONCAT_WS(" ", "INSERT INTO productosOrden VALUES (", idCategoria, ",", id_book, ")");
	ELSE
		-- NULL 
		LEAVE procesoEtiquetado;
	END IF;

    PREPARE resultStatement FROM @result_query;
    EXECUTE resultStatement; 
    DEALLOCATE PREPARE resultStatement; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ordenesOrdenadas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ordenesOrdenadas`(IN columnaAOrdenar VARCHAR(30), IN formaDeOrdenamiento VARCHAR(4))
begin
	IF columnaAOrdenar <> "" THEN
		SET @order_query = CONCAT_WS(" ", "ORDER BY", columnaAOrdenar, formaDeOrdenamiento); 
	ELSE
		SET @order_query = "";
	END IF;
    SET @result_query = CONCAT_WS(" ", "SELECT * FROM orden", @order_query);
    PREPARE resultadoObtenido FROM @result_query;
    EXECUTE resultadoObtenido; 
    DEALLOCATE PREPARE resultadoObtenido; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pedidosPendientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pedidosPendientes`()
begin
select * from orden WHERE idStatus = 1 ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `clientesdestacados`
--

/*!50001 DROP VIEW IF EXISTS `clientesdestacados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clientesdestacados` AS select `t1`.`nombre` AS `nombre`,`t2`.`idOrder` AS `idOrder`,`t1`.`telefono` AS `telefono`,count(`t2`.`idOrder`) AS `totalPedidos` from (`usuario` `t1` left join `orden` `t2` on((`t1`.`idUsuario` = `t2`.`idUsuario`))) group by `t1`.`nombre` order by count(`t2`.`idOrder`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pedidosconproblemas`
--

/*!50001 DROP VIEW IF EXISTS `pedidosconproblemas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pedidosconproblemas` AS select concat(`t1`.`nombre`,' ',`t1`.`apellido`) AS `usuario`,`t4`.`idOrder` AS `idOrder`,`t2`.`deliveryDate` AS `deliveryDate`,`t3`.`descripcionStatus` AS `descripcionStatus`,`t1`.`telefono` AS `telefono` from (((`orden` `t4` left join `usuario` `t1` on((`t1`.`idUsuario` = `t4`.`idUsuario`))) left join `delivery` `t2` on((`t2`.`idDelivery` = `t4`.`idDelivery`))) left join `estado` `t3` on((`t3`.`idStatus` = `t4`.`idStatus`))) where (`t3`.`idStatus` = 3) order by `t2`.`deliveryDate` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productosdisponibles`
--

/*!50001 DROP VIEW IF EXISTS `productosdisponibles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productosdisponibles` AS select `t1`.`nombreProducto` AS `nombreProducto`,`t2`.`numeroStock` AS `numeroStock` from (`producto` `t1` left join `stock` `t2` on((`t1`.`idProduct` = `t2`.`idProduct`))) where (`t2`.`numeroStock` > 0) group by `t1`.`nombreProducto` order by `t1`.`nombreProducto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productosestacionales`
--

/*!50001 DROP VIEW IF EXISTS `productosestacionales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productosestacionales` AS select `t1`.`nombreProducto` AS `nombreProducto`,`t2`.`descripcionEstacionalidad` AS `descripcionEstacionalidad` from (`estacionalidad` `t2` join `producto` `t1` on((`t1`.`idEstacionalidad` = `t2`.`idEstacionalidad`))) where (`t1`.`idEstacionalidad` = 1) order by `t1`.`nombreProducto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productosmascomprados`
--

/*!50001 DROP VIEW IF EXISTS `productosmascomprados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productosmascomprados` AS select `t1`.`idProduct` AS `idProduct`,`t1`.`nombreProducto` AS `nombreProducto`,sum(`t2`.`cantidad`) AS `cantidadPedidaTotal` from (`producto` `t1` left join `productosorden` `t2` on((`t1`.`idProduct` = `t2`.`idProduct`))) group by `t1`.`idProduct` order by `t2`.`cantidad` desc */;
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

-- Dump completed on 2023-04-04  0:54:52
