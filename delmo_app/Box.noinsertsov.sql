CREATE DATABASE  IF NOT EXISTS `box s.a.` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `box s.a.`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: box s.a.
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `articuloproveedor`
--

DROP TABLE IF EXISTS `articuloproveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articuloproveedor` (
  `idArticuloProveedor` int NOT NULL,
  `idProveedor` int NOT NULL,
  `idArticulo` varchar(45) NOT NULL,
  `Unitario` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idArticuloProveedor`),
  KEY `FK_Proveedor_ArtProv_idx` (`idProveedor`),
  KEY `FK_Articulo_ArtProv_idx` (`idArticulo`),
  CONSTRAINT `FK_Articulo_ArtProv` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulos`),
  CONSTRAINT `FK_Proveedor_ArtProv` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articuloproveedor`
--

LOCK TABLES `articuloproveedor` WRITE;
/*!40000 ALTER TABLE `articuloproveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `articuloproveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `idArticulos` varchar(45) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `IdTipo` int NOT NULL,
  `Valor` decimal(8,2) NOT NULL,
  `idCategoria` int NOT NULL,
  `IdUnidad` varchar(8) NOT NULL,
  `Estado` varchar(1) NOT NULL,
  `Stock` decimal(8,2) NOT NULL,
  `StockMin` decimal(8,2) NOT NULL,
  `FechaAlta` date NOT NULL,
  `idUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idArticulos`),
  KEY `FK_Categoria_Articulo_idx` (`idCategoria`),
  KEY `FK_Unidades_idx` (`IdUnidad`),
  KEY `FK_Tipo_Articulo_idx` (`IdTipo`),
  KEY `FK_Empleado_Articulo_index` (`idUsuario`),
  CONSTRAINT `FK_Empleado_Articulo` FOREIGN KEY (`idUsuario`) REFERENCES `empleados` (`idEmpleados`),
  CONSTRAINT `FK_Tipo_Articulo` FOREIGN KEY (`IdTipo`) REFERENCES `tiposproducto` (`idTipoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES ('AGUA','Agua',6,100.00,25,'LTS','A',0.00,0.00,'2007-01-01',9),('BC10038-25','Base Cerejeira 100x38x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-03-10',9),('BICAZ1','Birome BIC AZUL GRUESO',5,25.00,5,'CU','A',35.00,5.00,'2007-01-01',9),('BICNG1','Birome BIC NEGRO GRUESO',5,25.00,5,'CU','A',21.00,5.00,'2007-01-01',9),('BICRO1','Birome BIC ROJO GRUESO',5,25.00,5,'CU','A',18.00,5.00,'2007-01-01',9),('BICTGAZUL','Bic trazo grueso Azul ',5,15.00,5,'CU','A',8.00,15.00,'2021-10-10',9),('BICTGNEGRA','Bic trazo grueso Negra',5,15.00,5,'CU','A',30.00,15.00,'2021-11-10',9),('BICTGROJO','Bic trazo grueso Rojo',5,15.00,5,'CU','A',55.00,15.00,'2021-10-10',9),('BOGLOGO','Logo Bogner',4,0.00,20,'CU','A',30.00,15.00,'2018-08-02',9),('BP10038-25','Base Pino 100x38x2,5',4,250.00,2,'CU','A',15.00,5.00,'2010-01-08',9),('BP11038-25','Base Pino 110x38x2,5',4,120.00,2,'CU','A',30.00,5.00,'2010-02-08',9),('BP12038-25','Base Pino 120x38x2,5',4,220.00,2,'CU','A',20.00,5.00,'2010-04-20',9),('BROCHES10','Broches 10',5,11.00,5,'CU','A',5.00,5.00,'2021-11-10',9),('BROCHES15','Broches 15',5,11.80,5,'CU','A',16.00,5.00,'2021-10-20',9),('CHAPF-P1000','Chapa Apoyo Sup. Fender P1000',4,380.00,21,'CU','A',40.00,5.00,'2010-04-10',9),('CHAPFDER-HR','Chapa Apoyo Sup. Fender HR',4,280.00,21,'CU','A',100.00,20.00,'2019-04-10',9),('CHAPMBHN','Chapa Apoyo Sup. MB Head - Negro',4,400.00,21,'CU','A',33.00,5.00,'2010-04-10',9),('COLA_MADERA','Cola Madera ',4,90.00,3,'CM3','A',16000.00,4000.00,'2013-02-08',9),('CUAD-ESPIRAL-CUA-80','CUADERNO Espiralado 80h Cuadriculado',5,80.00,5,'CU','A',10.00,10.00,'2018-08-08',9),('CUAD-ESPIRAL-RAY-80','CUADERNO Espiralado 80h Rayado',5,85.00,5,'CU','A',12.00,10.00,'2018-08-08',9),('CUEFDER-BK','Cuerina Fender Negro',4,150.00,16,'M2','A',180.00,10.00,'2010-11-03',9),('CUEMBC','Cuerina MB Caoba',4,320.00,16,'M2','A',39.00,10.00,'2010-03-08',9),('CUEMBCREAM','Cuerina MB Cream',4,350.00,16,'M2','A',45.00,10.00,'2010-10-02',9),('CUEMBN','Cuerina MB Negro',4,150.00,16,'M2','A',180.00,10.00,'2010-11-03',9),('CUEVIB SLO','Cuerina Vibora Soldano Custom 1',4,600.00,16,'M2','A',80.00,20.00,'2020-01-01',9),('ENERGIA','Energía Electrica',6,1200.00,24,'KWH','A',0.00,0.00,'2007-01-01',9),('ESQUIFDERA-BK','Esquinas Fender Acetato - Negro',4,60.00,2,'CU','A',100.00,20.00,'2018-08-04',9),('ESQUIMBAHN','Esquinas MB Acetato Head - Negro',4,600.00,2,'CU','A',100.00,20.00,'2018-08-04',9),('FC9520-25','Fondo Cerejerira 95x20x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-03-10',9),('FDERLOGO1','Logo Fender 1',4,0.00,20,'CU','A',130.00,40.00,'2018-08-02',9),('FDERLOGO2','Logo Fender 2',4,0.00,20,'CU','A',50.00,10.00,'2018-08-02',9),('FDERLOGO3','Logo Fender 3',4,0.00,20,'CU','A',1000.00,200.00,'2018-08-02',9),('FP10535-25','Fondo Pino 105x30x2,5',4,100.00,2,'CU','A',14.00,5.00,'2018-08-04',9),('FP11525-25','Fondo Pino 115x25x2,5',4,100.00,2,'CU','A',13.00,5.00,'2018-08-08',9),('FP1557225','Frente Pino 1x12 W 155x72x2,5',4,200.00,2,'CU','A',16.00,5.00,'2010-08-08',9),('FP9520-25','Fondo Pino 95x20x2,5',4,400.00,2,'CU','A',13.00,5.00,'2012-08-08',9),('FREZ1506N','Frezado 1,5x0,6 - Negro',4,0.30,1,'CU','A',98.00,150.00,'2012-08-08',9),('FREZ1506P','Frezado 1,5x0,6 - Plata',4,0.40,1,'CU','A',480.00,150.00,'2012-08-08',9),('FREZ206P','Frezado 2x0,6 - Plata',4,0.35,1,'CU','A',500.00,100.00,'2012-08-08',9),('FTEC9520-25','Frente Cerejerira 95x20x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-03-10',9),('FTEP1210545-25','Frente Pino 1x12 105x45x2,5',4,100.00,1,'CU','A',11.00,5.00,'2012-08-08',9),('FTEP1211550-25','Frente Pino 1x12 115x50x2,5',4,220.00,2,'CU','A',12.00,5.00,'2018-06-08',9),('FTEP9520-25','Frente Pino 95x20x2,5',4,130.00,2,'CU','A',19.00,5.00,'2010-07-08',9),('GAS','Gas',6,900.00,25,'CM3','A',0.00,0.00,'2007-01-01',9),('HP12A ','TONER 12A HP',5,3000.00,17,'CU','A',5.00,5.00,'2018-08-08',9),('HP78A ','TONER 78A HP',5,3000.00,17,'CU','A',5.00,1.00,'2021-10-08',9),('LACA-MR-BR','Laca Marina Brillante',4,205.00,14,'CM3','A',1920.00,4000.00,'2019-08-05',9),('LACA-MR-SM','Laca Marina Semi-Mate',4,134.00,14,'CM3','A',8000.00,4000.00,'2019-03-01',9),('LCD3840-25','Lateral Der Cerejeira Forma 38x40x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-03-10',9),('LCI3840-25','Lateral Izq Cerejerira Forma 38x40x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-03-10',9),('LPD3840-25','Lateral Der Pino Forma 38x40x2,5',4,370.00,2,'CU','A',20.00,5.00,'2010-08-08',9),('LPD3855-25','Lateral Der Pino Forma 38x55x2,5',4,300.00,2,'CU','A',19.00,5.00,'2010-09-08',9),('LPI3840-25','Lateral Izq Pino Forma 38x40x2,5',4,120.00,2,'CU','A',18.00,5.00,'2012-08-08',9),('LPI3855-25','Lateral Izq Pino Forma 38x55x2,5',4,140.00,2,'CU','A',22.00,5.00,'2012-08-08',9),('MANITFDER-BK','Manija Transp. Fender - Negro',4,140.00,8,'CU','A',60.00,20.00,'2018-08-08',9),('MANITMBCN','Manija Transp. Heavy MB - Negro',4,450.00,8,'CU','A',35.00,15.00,'2012-08-08',9),('MANITMBN','Manija Transp. MB - Negro',4,340.00,8,'CU','A',30.00,15.00,'2018-08-08',9),('MARLOGO','Logo Marshall',4,0.00,20,'CU','A',200.00,50.00,'2017-08-03',9),('MBLOGO1','Logo Boogie',4,0.00,20,'CU','A',20.00,20.00,'2018-02-06',9),('MBLOGO2','Logo Boogie Cream',4,0.00,20,'CU','A',150.00,30.00,'2013-02-08',9),('MECHAMAD10','Mecha madera 10mm',5,45.00,4,'CU','A',3.00,5.00,'2018-01-10',9),('MECHAMAD4','Mecha madera 4mm',5,35.00,4,'CU','A',12.00,5.00,'2018-08-03',9),('MECHAMAD5','Mecha madera 5mm',5,35.00,4,'CU','A',8.00,5.00,'2018-01-12',9),('MECHAMAD6','Mecha madera 6mm',5,35.00,4,'CU','A',14.00,5.00,'2018-08-03',9),('PARK205N','Parker 2x0,5 - Negro',4,400.00,1,'CU','A',220.00,100.00,'2013-08-08',9),('PARK2505N','Parker 2,5x0,5 - Negro',4,350.00,1,'CU','A',250.00,120.00,'2018-08-06',9),('PEGA-CTO','Pegamento de Contacto ',4,295.00,3,'CM3','A',12000.00,2000.00,'2020-08-12',9),('PEGA-CTO_TR','Pegamento de Contacto Tranparente',4,290.00,3,'CM3','A',20000.00,2000.00,'2020-10-03',9),('PLASTICOLA 200GRS','Plasticola 200 gramos blanca',5,145.00,5,'CU','A',12.00,10.00,'2019-08-08',9),('REGAFDERSTD-BKN','Regaton Fender STD - Negro',4,22.00,9,'CU','A',180.00,50.00,'2018-08-06',9),('REGAMBHN','Regaton MB Head - Negro',4,122.00,9,'CU','A',97.00,50.00,'2018-08-06',9),('REGUNV35','Regaton UNIV 35mm- Negro',4,75.00,9,'CU','A',650.00,100.00,'2018-08-06',9),('REGUNV40','Regaton UNIV 40mm- Negro',4,80.00,9,'CU','A',450.00,100.00,'2018-08-06',9),('RESMA-A4-75GR','Resma A4 500 x 75grs',5,455.00,5,'CU','A',25.00,20.00,'2020-08-08',9),('RESMA-CARTA-80GR','Resma CARTA 500 x 80grs',5,498.00,5,'CU','A',15.00,15.00,'2020-08-08',9),('RESMAA480G','Resma A4 80grs',5,90.00,5,'CU','A',25.00,15.00,'2021-10-10',9),('RESMALT80G','Resma LT 80grs',5,95.00,5,'CU','A',15.00,10.00,'2021-10-10',9),('RIVLOGO','Logo Rivera',4,0.00,20,'CU','A',100.00,30.00,'2020-10-03',9),('RUED 45-AZUL','Ruedas 45mm diam Azul',4,230.00,18,'CU','A',80.00,20.00,'2017-08-10',9),('RUED 60-BK','Ruedas 60mm diam Negra',4,268.00,18,'CU','A',120.00,20.00,'2017-08-10',9),('SEGURIDAD','Servicio de Seguridad',6,1050.00,25,'CU','A',0.00,0.00,'2007-01-01',9),('SEGUROS','Seguros',6,3000.00,25,'CU','A',0.00,0.00,'2007-01-01',9),('SLOLOGO','Logo Soldano',4,0.00,20,'CU','A',78.00,20.00,'2019-03-14',9),('TARM1020','Tarugos Mad. 10x20',4,8.00,19,'CU','A',405.00,150.00,'2014-02-05',9),('TARM1030','Tarugos Mad. 10x30',4,8.00,19,'CU','A',605.00,150.00,'2014-08-04',9),('TC10028-25','Tapa Cerejeira 100x28x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-03-10',9),('TELAFDER-BD','Tela Blues Deville Fender',4,125.80,13,'M2','A',100.00,40.00,'2019-08-02',9),('TOPFONC20-25x25','Tope Fondo Cerejerira 20x2,5x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-03-10',9),('TOPFONP20-25x25','Tope Fondo Pino 20x2,5x2,5',4,270.00,2,'CU','A',12.00,10.00,'2014-08-08',9),('TOPFONP25-25x25','Tope Fondo Pino 25x2,5x2,5',4,290.00,2,'CU','A',14.00,10.00,'2014-02-08',9),('TOPFONP30-25x25','Tope Fondo Pino 30x2,5x2,5',4,400.00,2,'CU','A',16.00,10.00,'2014-08-10',9),('TOPFREC20-25x25','Tope Frente Cerejerira 20x2,5x2,5',4,100.00,2,'CU','A',100.00,50.00,'2016-03-10',9),('TOPFREP20-25x25','Tope Frente Pino 20x2,5x2,5',4,300.00,2,'CU','A',12.00,10.00,'2014-08-10',9),('TOPFREP38-25x25','Tope Frente Pino 38x2,5x2,5',4,210.00,2,'CU','A',14.00,10.00,'2017-08-18',9),('TOPFREP50-25x25','Tope Frente Pino 50x2,5x2,5',4,125.00,2,'CU','A',16.00,15.00,'2017-08-10',9),('TP10028-25','Tapa Pino 100x28x2,5',4,189.00,2,'CU','A',24.00,15.00,'2017-08-04',9),('TP11028-25','Tapa Pino 110x28x2,5',4,167.00,2,'CU','A',23.00,15.00,'2017-08-03',9),('TP12038-25','Tapa Pino 120x38x2,5',4,380.00,2,'CU','A',22.00,15.00,'2017-08-03',9),('VINIL','Peg. Vinilico Contacto',4,124.00,12,'CM3','A',1350.80,1500.00,'2018-08-02',9),('VINIL-ESP','Peg. Vinilico Contacto Especial',4,450.00,12,'CM3','A',2500.30,5000.00,'2019-08-02',9),('VINIL-NG','Peg. Vinilico Contacto Negro',4,100.00,12,'CM3','A',4560.00,5000.00,'2019-08-01',9);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `articulos_AFTER_INSERT` AFTER INSERT ON `articulos` FOR EACH ROW BEGIN
	call Registrar_Movimiento(1, 'Creación de artículo', new.idusuario, 'articulos');
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `articulos_AFTER_UPDATE` AFTER UPDATE ON `articulos` FOR EACH ROW BEGIN
	call Registrar_Movimiento(3, 'Modificación de artículo', new.idusuario, 'articulos');
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `articulos_BEFORE_DELETE` BEFORE DELETE ON `articulos` FOR EACH ROW BEGIN
	call Registrar_Movimiento(2, 'Baja de artículo', old.idusuario, 'articulos');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `articulosreservados`
--

DROP TABLE IF EXISTS `articulosreservados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulosreservados` (
  `idArticulosReservados` int NOT NULL AUTO_INCREMENT,
  `idArticulo` varchar(45) NOT NULL,
  `Cantidad` decimal(8,2) NOT NULL,
  `idOrdenVenta` int NOT NULL,
  PRIMARY KEY (`idArticulosReservados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulosreservados`
--

LOCK TABLES `articulosreservados` WRITE;
/*!40000 ALTER TABLE `articulosreservados` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulosreservados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `idCargos` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Cantidad` int NOT NULL,
  `idDepartamento` int NOT NULL,
  PRIMARY KEY (`idCargos`),
  KEY `FK_Departamento_Cargo_idx` (`idDepartamento`),
  CONSTRAINT `FK_Departamento_Cargo` FOREIGN KEY (`idDepartamento`) REFERENCES `departamentos` (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'Vendedor',4,1),(2,'Jefe de Linea',6,2),(3,'Acopiador',5,2),(4,'Ensamblador',4,2),(5,'Tapicero',2,2),(6,'Controlador de calidad',2,2),(7,'Comprador',4,3),(8,'Expeditor',3,4),(9,'Cobrante',1,5);
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `idCategorias` int NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategorias`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'TORNILLOS'),(2,'MADERAS'),(3,'PEGAMENTOS'),(4,'HERRAMIENTAS'),(5,'LIBRERIA'),(6,'MAQUINAS ELECT.'),(7,'CLAVOS'),(8,'MANIJAS'),(9,'REGATONES'),(10,'ESQUINEROS'),(11,'CUERINA'),(12,'VINILICOS'),(13,'TELAS'),(14,'LACAS'),(15,'PINTURAS'),(16,'CUEROS'),(17,'TONERS'),(18,'RUEDAS'),(19,'TARUGOS'),(20,'LOGOS'),(21,'CHAPA APOYO'),(22,'CURTIEMBRE'),(23,'MADERA ESPECIAL'),(24,'ELECTRICIDAD'),(25,'VARIOS');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idClientes` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Marca` varchar(45) NOT NULL,
  `FecIng` date NOT NULL,
  `UltTrx` date DEFAULT NULL,
  `idEmpleado` int NOT NULL,
  `Estado` varchar(1) NOT NULL,
  PRIMARY KEY (`idClientes`),
  KEY `FK_Empleado_Cliente_idx` (`idEmpleado`),
  CONSTRAINT `FK_Empleado_Cliente` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Fender LLC','Fender','2015-01-01',NULL,4,'A'),(2,'Marshall Inc','Marshall','2014-02-10',NULL,5,'A'),(3,'Mesa LLC','Mesa Boogie','2014-01-08',NULL,4,'A'),(4,'Soldano','Soldano','2019-10-10',NULL,5,'A'),(5,'Bogner Amp Inc','Bogner','2018-09-10',NULL,4,'A'),(6,'Rivera Music LLC','Rivera','2017-10-01',NULL,5,'A');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactos`
--

DROP TABLE IF EXISTS `contactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactos` (
  `idContactos` int NOT NULL,
  `idEmpresa` int NOT NULL,
  `ID` int NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idContactos`),
  KEY `FK_Empresas_Contactos_idx` (`idEmpresa`),
  CONSTRAINT `FK_Empresas_Contactos` FOREIGN KEY (`idEmpresa`) REFERENCES `empresas` (`idEmpresas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos`
--

LOCK TABLES `contactos` WRITE;
/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
INSERT INTO `contactos` VALUES (1,1,1,'fenderllc@fender.com',NULL),(2,1,2,'Marshall@marshall.com',NULL),(3,1,3,'mesa@mesa.com',NULL),(4,1,4,'soldano@soldano.com',NULL),(5,1,5,'bogneramp@bogneramp.com',NULL),(6,1,6,'riverainfo@rivera.com',NULL);
/*!40000 ALTER TABLE `contactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `idDepartamento` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `CantidadEmpleados` int NOT NULL,
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Ventas',5),(2,'Produccion',25),(3,'Compras',5),(4,'Expedición',4),(5,'Administración',5);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones` (
  `idDireccion` int NOT NULL,
  `idEmpresa` int NOT NULL,
  `ID` int NOT NULL,
  `Calle` varchar(45) NOT NULL,
  `Numero` int NOT NULL,
  `CodigoPostal` int NOT NULL,
  `Localidad` varchar(45) NOT NULL,
  `IdPcia` int NOT NULL,
  PRIMARY KEY (`idDireccion`),
  KEY `FK_Direecion_Empresa_idx` (`idEmpresa`),
  KEY `FK_Provincias_Direccion_idx` (`IdPcia`),
  CONSTRAINT `FK_Empresa_Direccion` FOREIGN KEY (`idEmpresa`) REFERENCES `empresas` (`idEmpresas`),
  CONSTRAINT `FK_Provincias_Direccion` FOREIGN KEY (`IdPcia`) REFERENCES `provincias` (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,1,1,'Fleming',1234,1234,'Florida',1),(2,1,2,'Corrientes',2233,1400,'CABA',1),(3,1,3,'Larrea',2211,1405,'CABA',1),(4,1,4,'Mitre',4550,2020,'San Isidro',1),(5,1,5,'Cordoba',6080,1300,'CABA',1),(6,1,6,'Pasteur',1200,1344,'CABA',1);
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idEmpleados` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `DNI` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `Sexo` varchar(45) NOT NULL,
  `Nacimiento` date NOT NULL,
  `idCargo` int NOT NULL,
  `idDepartamento` int NOT NULL,
  `idJefe` int DEFAULT NULL,
  `Salario` int NOT NULL,
  `Comision` int NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaAlta` date DEFAULT NULL,
  PRIMARY KEY (`idEmpleados`),
  KEY `FK_Empleados_Departamentos_idx` (`idDepartamento`),
  KEY `FK_Cargo_Empleado_idx` (`idCargo`),
  CONSTRAINT `FK_Cargo_Empleado` FOREIGN KEY (`idCargo`) REFERENCES `cargos` (`idCargos`),
  CONSTRAINT `FK_Empleados_Departamentos` FOREIGN KEY (`idDepartamento`) REFERENCES `departamentos` (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Raul Trupenzo','20808123','trupenzor@gmail.com','M','1984-10-23',2,2,NULL,12000,10,'A','2018-08-10',NULL),(2,'Shauna Shipman','21341822','shaunasheep@gmail.com','F','1996-12-13',2,2,NULL,12012,10,'A','2021-10-05',NULL),(3,'Jackie Taylor','20712480','snackie666@gmail.com','F','1997-03-03',3,2,NULL,6660,10,'A','2016-05-10',NULL),(4,'Carlos Saul Menem','20600903','carlmenemito@gmail.com','M','1977-02-04',1,1,NULL,10000,10,'A','2020-05-06',NULL),(5,'Maria Elena Walsh','21732549','walshmaria@gmail.com','F','1995-07-22',1,1,NULL,7500,10,'A','2018-11-17',NULL),(6,'Rikki Chadwick','20887724','rikkimako@gmail.com','F','1993-08-08',4,2,NULL,8888,10,'A','2023-12-11',NULL),(7,'Cleo Sertori','20964855','cleopatra47@gmail.com','F','1988-06-15',5,2,NULL,8500,10,'A','2019-02-05',NULL),(8,'Emma Gilbert','20553279','emmystay@gmail.com','F','1992-02-29',6,2,NULL,9996,10,'A','2011-11-18',NULL),(9,'Taissa Turner','20537422','tailortt@gmail.com','F','1980-05-23',7,3,NULL,10116,10,'A','2011-10-18',NULL),(10,'Jeff Sadecki','21587810','jeffsito@gmail.com','M','1987-10-10',8,4,NULL,9012,10,'A','2005-10-11',NULL),(11,'Julian Werner','20696969','jwerner@hotmail.com','M','1995-11-09',9,5,NULL,10000,10,'A','2019-11-09',NULL);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `idEmpresas` int NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idEmpresas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'Cliente'),(2,'Proveedor'),(3,'Box');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturacab`
--

DROP TABLE IF EXISTS `facturacab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturacab` (
  `idFactura` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `FechaEntrega` date NOT NULL,
  `idCliente` int NOT NULL,
  `idDireccion` int NOT NULL,
  `idEmpleado` int NOT NULL,
  `idRemito` int NOT NULL,
  `Subtotal` decimal(8,2) NOT NULL,
  `Descuento` decimal(8,2) DEFAULT NULL,
  `IVA` decimal(8,0) NOT NULL,
  `Neto` decimal(8,2) NOT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `FK_Cliente_FacturaCab_idx` (`idCliente`),
  KEY `FK_Direccion_FacturaCab_idx` (`idDireccion`),
  KEY `FK_Empleado_FacturaCab_idx` (`idEmpleado`),
  KEY `FK_Remito_FacturaCab_idx` (`idRemito`),
  CONSTRAINT `FK_Cliente_FacturaCab` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `FK_Direccion_FacturaCab` FOREIGN KEY (`idDireccion`) REFERENCES `direcciones` (`idDireccion`),
  CONSTRAINT `FK_Empleado_FacturaCab` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleados`),
  CONSTRAINT `FK_Remito_FacturaCab` FOREIGN KEY (`idRemito`) REFERENCES `remitocab` (`idRemito`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacab`
--

LOCK TABLES `facturacab` WRITE;
/*!40000 ALTER TABLE `facturacab` DISABLE KEYS */;
INSERT INTO `facturacab` VALUES (1,'2024-09-06','2024-03-10',1,1,11,1,690115.00,NULL,144924,835039.00,NULL),(2,'2024-09-28','2024-03-25',1,1,11,2,690115.00,NULL,144924,835039.00,NULL);
/*!40000 ALTER TABLE `facturacab` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `facturacab_AFTER_INSERT` AFTER INSERT ON `facturacab` FOR EACH ROW BEGIN
	call Registrar_Movimiento(1, 'Creación de factura', new.idempleado, 'facturacab');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `facturadet`
--

DROP TABLE IF EXISTS `facturadet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturadet` (
  `idFacturaDet` int NOT NULL AUTO_INCREMENT,
  `idFactura` int NOT NULL,
  `CodigoProd` varchar(45) NOT NULL,
  `Cantidad` int NOT NULL,
  `Unitario` decimal(8,2) NOT NULL,
  `Importe` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idFacturaDet`),
  KEY `FK_Prod_FacturaDet_idx` (`CodigoProd`),
  KEY `FK_ProdUnitario_FichaDet_idx` (`Unitario`),
  KEY `FK_FacturaCab_FacturaDet_idx` (`idFactura`),
  CONSTRAINT `FK_FacturaCab_FacturaDet` FOREIGN KEY (`idFactura`) REFERENCES `facturacab` (`idFactura`),
  CONSTRAINT `FK_Prod_FacturaDet` FOREIGN KEY (`CodigoProd`) REFERENCES `fichasproducto` (`CodigoInterno`),
  CONSTRAINT `FK_ProdUnitario_FacturaDet` FOREIGN KEY (`Unitario`) REFERENCES `fichasproducto` (`PrecioUnitario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturadet`
--

LOCK TABLES `facturadet` WRITE;
/*!40000 ALTER TABLE `facturadet` DISABLE KEYS */;
INSERT INTO `facturadet` VALUES (1,1,'BLUED4X10',2,139194.17,278388.34),(2,1,'FHOTRODDX3',3,137242.08,411726.24),(3,2,'BLUED4X10',2,139194.17,278388.34),(4,2,'FHOTRODDX3',3,137242.08,411726.24);
/*!40000 ALTER TABLE `facturadet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fichasproducto`
--

DROP TABLE IF EXISTS `fichasproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fichasproducto` (
  `CodigoInterno` varchar(45) NOT NULL,
  `idCliente` int NOT NULL,
  `Detalle` varchar(45) NOT NULL,
  `idTipoProducto` int NOT NULL,
  `Costo` int DEFAULT NULL,
  `Porcentaje` decimal(8,2) NOT NULL,
  `PrecioUnitario` decimal(8,2) DEFAULT NULL,
  `Estado` varchar(45) NOT NULL,
  `FechaAlta` date NOT NULL,
  `FechaBaja` date DEFAULT NULL,
  `idUsuario` int DEFAULT NULL,
  PRIMARY KEY (`CodigoInterno`),
  KEY `Unitario` (`PrecioUnitario`),
  KEY `FK_Cliente_Prod_idx` (`idCliente`),
  KEY `FK_Tipo_Prod_idx` (`idTipoProducto`),
  KEY `FK_Empleados_Prod_idx` (`idUsuario`),
  CONSTRAINT `FK_Cliente_Prod` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `FK_Empleados_Prod` FOREIGN KEY (`idUsuario`) REFERENCES `empleados` (`idEmpleados`),
  CONSTRAINT `FK_Tipo_Prod` FOREIGN KEY (`idTipoProducto`) REFERENCES `tiposproducto` (`idTipoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fichasproducto`
--

LOCK TABLES `fichasproducto` WRITE;
/*!40000 ALTER TABLE `fichasproducto` DISABLE KEYS */;
INSERT INTO `fichasproducto` VALUES ('BLUED4X10',1,'Blues Deville 4x10 Reissue',1,100865,38.00,139194.17,'A','2008-10-10',NULL,4),('BOGECS-100',5,'Bogner Ecstasy 100-watt Tube Head',2,NULL,29.80,NULL,'A','2011-10-10',NULL,4),('CT1X12WIDE23',3,'California Tweed1X12 CALIFORNIA TWEED 23',3,110377,35.00,149008.55,'A','2010-02-14',NULL,4),('FHOTRODDX3',1,'Hot Rod Deluxe III',1,100177,37.00,137242.08,'A','2018-12-08',NULL,4),('MJCM900',2,'JCM900 4100',2,NULL,41.00,NULL,'A','2008-03-17',NULL,4),('MVCAB1+',3,'MARK V+ - Head',2,79516,35.00,107346.20,'A','2012-04-03',NULL,4),('MVCBO1',3,'MARK V - Combo 1x12',1,119669,30.00,155569.31,'A','2012-04-03',NULL,4),('MVS8080',2,'Marshall Valvestate 8080',1,NULL,35.50,NULL,'A','2008-01-10',NULL,4),('PERF1000',1,'Performer 1000 - Black',1,108341,40.00,151676.98,'A','2009-08-14',NULL,4),('RIV_VENUS 5x12H',6,'Rivera Venus 5 1x12\" 35-watt Tube Combo Amp',2,NULL,43.60,NULL,'A','2015-09-15',NULL,4),('SLO-100 SO',4,'Soldano SLO-100 Super Lead Overdrive',2,NULL,37.00,NULL,'A','2010-12-18',NULL,4);
/*!40000 ALTER TABLE `fichasproducto` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fichasproducto_AFTER_INSERT` AFTER INSERT ON `fichasproducto` FOR EACH ROW BEGIN
	call Registrar_Movimiento(1, 'Creación de producto', new.idusuario, 'fichaproducto');
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fichasproducto_AFTER_UPDATE` AFTER UPDATE ON `fichasproducto` FOR EACH ROW BEGIN
	call Registrar_Movimiento(3, 'Modificación de producto', new.idusuario, 'fichaproducto');
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fichasproducto_BEFORE_DELETE` BEFORE DELETE ON `fichasproducto` FOR EACH ROW BEGIN
	call Registrar_Movimiento(2, 'Baja de producto', old.idusuario, 'fichaproducto');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `formadeentrega`
--

DROP TABLE IF EXISTS `formadeentrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formadeentrega` (
  `idFormadeentrega` int NOT NULL AUTO_INCREMENT,
  `Formadeentrega` varchar(45) NOT NULL,
  PRIMARY KEY (`idFormadeentrega`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formadeentrega`
--

LOCK TABLES `formadeentrega` WRITE;
/*!40000 ALTER TABLE `formadeentrega` DISABLE KEYS */;
INSERT INTO `formadeentrega` VALUES (1,'Retira'),(2,'Envío');
/*!40000 ALTER TABLE `formadeentrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hojaderuta`
--

DROP TABLE IF EXISTS `hojaderuta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hojaderuta` (
  `idHojadeRuta` int NOT NULL,
  `CodigoProd` varchar(45) NOT NULL,
  `CodigoSecuencia` varchar(5) NOT NULL,
  `Secuencia` int NOT NULL,
  `Duracion` time NOT NULL,
  PRIMARY KEY (`idHojadeRuta`),
  KEY `CodigoSecuencia` (`CodigoSecuencia`),
  KEY `FK_CodigoProd_HojaRuta_idx` (`CodigoProd`),
  KEY `Secuencia_numerin` (`Secuencia`),
  CONSTRAINT `FK_CodigoProd_HojaRuta` FOREIGN KEY (`CodigoProd`) REFERENCES `fichasproducto` (`CodigoInterno`),
  CONSTRAINT `FK_Porcesos_Hojaderuta` FOREIGN KEY (`CodigoSecuencia`) REFERENCES `procesos` (`Codigoproc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hojaderuta`
--

LOCK TABLES `hojaderuta` WRITE;
/*!40000 ALTER TABLE `hojaderuta` DISABLE KEYS */;
INSERT INTO `hojaderuta` VALUES (1,'BLUED4X10','AC1',1,'35:00:00'),(2,'BLUED4X10','EN1',2,'45:00:00'),(3,'BLUED4X10','AC2',3,'28:00:00'),(4,'BLUED4X10','EN2',5,'25:00:00'),(5,'BLUED4X10','CC',6,'15:00:00'),(6,'MVCAB1+','AC1',1,'35:00:00'),(7,'MVCAB1+','EN1',2,'40:00:00'),(8,'MVCAB1+','AC2',3,'15:00:00'),(9,'MVCAB1+','EN2',5,'25:00:00'),(10,'MVCBO1','AC1',1,'35:00:00'),(11,'MVCBO1','EN1',2,'45:00:00'),(12,'MVCBO1','AC2',3,'28:00:00'),(13,'MVCBO1','EN2',5,'25:00:00'),(14,'MVCBO1','CC',6,'15:00:00'),(15,'FHOTRODDX3','AC1',1,'20:00:00'),(16,'FHOTRODDX3','EN1',2,'35:00:00'),(17,'FHOTRODDX3','TAP',4,'68:00:00'),(18,'FHOTRODDX3','AC2',3,'30:00:00'),(19,'FHOTRODDX3','EN2',5,'25:00:00'),(20,'BLUED4X10','TAP',4,'15:00:00'),(21,'MVCBO1','TAP',4,'78:00:00'),(22,'MVCAB1+','TAP',4,'68:00:00'),(23,'CT1X12WIDE23','AC1',1,'15:00:00'),(24,'CT1X12WIDE23','EN1',2,'35:00:00'),(25,'CT1X12WIDE23','AC2',3,'15:00:00'),(26,'CT1X12WIDE23','TAP',4,'56:00:00'),(27,'CT1X12WIDE23','EN2',5,'14:00:00'),(28,'CT1X12WIDE23','CC',6,'15:00:00');
/*!40000 ALTER TABLE `hojaderuta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infobox`
--

DROP TABLE IF EXISTS `infobox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infobox` (
  `idInfoBox` int NOT NULL AUTO_INCREMENT,
  `Telefax` varchar(45) NOT NULL,
  `CUIT` varchar(45) NOT NULL,
  `PaginaWeb` varchar(45) NOT NULL,
  `IngresosBrutos` varchar(45) NOT NULL,
  `InicioActividades` varchar(45) NOT NULL,
  `IVA` varchar(45) NOT NULL,
  PRIMARY KEY (`idInfoBox`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infobox`
--

LOCK TABLES `infobox` WRITE;
/*!40000 ALTER TABLE `infobox` DISABLE KEYS */;
/*!40000 ALTER TABLE `infobox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metododepago`
--

DROP TABLE IF EXISTS `metododepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metododepago` (
  `idMetododepago` int NOT NULL AUTO_INCREMENT,
  `Metododepago` varchar(45) NOT NULL,
  PRIMARY KEY (`idMetododepago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metododepago`
--

LOCK TABLES `metododepago` WRITE;
/*!40000 ALTER TABLE `metododepago` DISABLE KEYS */;
INSERT INTO `metododepago` VALUES (1,'Efectivo'),(2,'Cheque'),(3,'Transferencia bancaria');
/*!40000 ALTER TABLE `metododepago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos` (
  `idMov` int NOT NULL AUTO_INCREMENT,
  `Tipomov` int NOT NULL,
  `DetMov` varchar(80) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `idEmpleado` int NOT NULL,
  `Table` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMov`),
  KEY `FK_Empleado_MovStock_idx` (`idEmpleado`),
  KEY `FK_TipoMov_MovStock_index` (`Tipomov`) /*!80000 INVISIBLE */,
  CONSTRAINT `FK_Empleado_MovStock` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleados`),
  CONSTRAINT `FK_TipoMov_MovStock` FOREIGN KEY (`Tipomov`) REFERENCES `tipomov` (`idTipomov`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (1,1,'Creación de artículo','2024-08-30','21:57:42',9,'articulos'),(2,3,'Modificación de artículo','2024-08-30','21:57:51',9,'articulos'),(3,2,'Baja de artículo','2024-08-30','21:57:55',9,'articulos'),(4,1,'Creación de remito','2024-09-06','20:03:24',8,'remitocab'),(5,1,'Creación de remito','2024-09-06','20:05:17',8,'remitocab'),(6,1,'Creación de factura','2024-09-06','21:20:57',11,'facturacab'),(7,1,'Creación de factura','2024-09-06','21:30:45',11,'facturacab'),(8,1,'Creación de orden de fabricación','2024-09-27','21:25:27',1,'ordenfabricacioncab'),(9,1,'Creación de remito','2024-09-28','00:35:17',10,'remitocab'),(10,1,'Creación de factura','2024-09-28','00:38:26',11,'facturacab');
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacioncab`
--

DROP TABLE IF EXISTS `notificacioncab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacioncab` (
  `idNotificacion` int NOT NULL,
  `Fecha` date NOT NULL,
  `FechaEntrega` date NOT NULL,
  `idVendedor` int NOT NULL,
  `idJefeLinea` int NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `idCliente` int NOT NULL,
  `TipoEntrega` varchar(45) DEFAULT NULL,
  `CentroTrabajo` varchar(45) NOT NULL,
  `nItem` int NOT NULL,
  `CodigoProd` varchar(45) NOT NULL,
  `CantidadEncargada` int NOT NULL,
  `TotalHechos` int NOT NULL,
  `Pendientes` int NOT NULL,
  `idHojaRuta` int NOT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idNotificacion`),
  KEY `FK_EmpleadoVendedor_NotifCab_idx` (`idVendedor`),
  KEY `FK_EmpleadoJL_NotifCab_idx` (`idJefeLinea`),
  KEY `FK_Cliente_NotifCab_idx` (`idCliente`),
  KEY `FK_Prod_NotifCab_idx` (`CodigoProd`),
  KEY `FK_HojaRuta_NotifCab_idx` (`idHojaRuta`),
  KEY `FK_VentaDet_NotifCab_idx` (`nItem`),
  CONSTRAINT `FK_Cliente_NotifCab` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `FK_EmpleadoJL_NotifCab` FOREIGN KEY (`idJefeLinea`) REFERENCES `empleados` (`idEmpleados`),
  CONSTRAINT `FK_EmpleadoVendedor_NotifCab` FOREIGN KEY (`idVendedor`) REFERENCES `empleados` (`idEmpleados`),
  CONSTRAINT `FK_HojaRuta_NotifCab` FOREIGN KEY (`idHojaRuta`) REFERENCES `hojaderuta` (`idHojadeRuta`),
  CONSTRAINT `FK_Prod_NotifCab` FOREIGN KEY (`CodigoProd`) REFERENCES `fichasproducto` (`CodigoInterno`),
  CONSTRAINT `FK_VentaDet_NotifCab` FOREIGN KEY (`nItem`) REFERENCES `ordenventadet` (`nItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacioncab`
--

LOCK TABLES `notificacioncab` WRITE;
/*!40000 ALTER TABLE `notificacioncab` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacioncab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciondet`
--

DROP TABLE IF EXISTS `notificaciondet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciondet` (
  `idNotificacionDet` int NOT NULL,
  `idNotificacion` int NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Cantidad` int NOT NULL,
  `idOperario` int NOT NULL,
  PRIMARY KEY (`idNotificacionDet`),
  KEY `FK_NotifCab_NotifDet_idx` (`idNotificacion`),
  KEY `FK_Empleado_NotifDet_idx` (`idOperario`),
  CONSTRAINT `FK_Empleado_NotifDet` FOREIGN KEY (`idOperario`) REFERENCES `empleados` (`idEmpleados`),
  CONSTRAINT `FK_NotifCab_NotifDet` FOREIGN KEY (`idNotificacion`) REFERENCES `notificacioncab` (`idNotificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciondet`
--

LOCK TABLES `notificaciondet` WRITE;
/*!40000 ALTER TABLE `notificaciondet` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificaciondet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordencompracab`
--

DROP TABLE IF EXISTS `ordencompracab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordencompracab` (
  `idOrdenCompra` int NOT NULL,
  `Fecha` date NOT NULL,
  `FechaEntrega` date NOT NULL,
  `idProveedor` int NOT NULL,
  `idDireccion` int NOT NULL,
  `idContacto` int NOT NULL,
  `FormaPago` varchar(45) NOT NULL,
  `idPedidoCompra` int NOT NULL,
  `idEmpleadoCreador` int NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `Total` int NOT NULL,
  `FirmaCreador` varchar(45) NOT NULL,
  `AclaracionCreador` varchar(45) NOT NULL,
  `FirmaAutorizante` varchar(45) NOT NULL,
  `AclaracionAutorizante` varchar(45) NOT NULL,
  PRIMARY KEY (`idOrdenCompra`),
  KEY `FK_Proveedor_OrdenCompra_idx` (`idProveedor`),
  KEY `FK_Direccion_OrdenCompra_idx` (`idDireccion`),
  KEY `FK_Contacto_OrdenCompra_idx` (`idContacto`),
  KEY `FK_Empleado_OrdenCompra_idx` (`idEmpleadoCreador`),
  KEY `FK_PedidoCompra_OrdenCompra_idx` (`idPedidoCompra`),
  CONSTRAINT `FK_Contacto_OrdenCompra` FOREIGN KEY (`idContacto`) REFERENCES `contactos` (`idContactos`),
  CONSTRAINT `FK_Direccion_OrdenCompra` FOREIGN KEY (`idDireccion`) REFERENCES `direcciones` (`idDireccion`),
  CONSTRAINT `FK_Empleado_OrdenCompra` FOREIGN KEY (`idEmpleadoCreador`) REFERENCES `empleados` (`idEmpleados`),
  CONSTRAINT `FK_PedidoCompra_OrdenCompra` FOREIGN KEY (`idPedidoCompra`) REFERENCES `pedidocompracab` (`idPedidoCompra`),
  CONSTRAINT `FK_Proveedor_OrdenCompra` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordencompracab`
--

LOCK TABLES `ordencompracab` WRITE;
/*!40000 ALTER TABLE `ordencompracab` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordencompracab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordencompradet`
--

DROP TABLE IF EXISTS `ordencompradet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordencompradet` (
  `idOrdenCompraDet` int NOT NULL,
  `idOrdenCompra` int NOT NULL,
  `nitem` int NOT NULL,
  `idArticulo` varchar(45) NOT NULL,
  `Cantidad` varchar(45) NOT NULL,
  `IVA` varchar(45) NOT NULL,
  `Unitario` decimal(8,2) NOT NULL,
  `Importe` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idOrdenCompraDet`),
  KEY `FK_CompraCab_CompraDet_idx` (`idOrdenCompra`),
  KEY `FK_Articulo_CompraDet_idx` (`idArticulo`),
  CONSTRAINT `FK_Articulo_CompraDet` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulos`),
  CONSTRAINT `FK_CompraCab_CompraDet` FOREIGN KEY (`idOrdenCompra`) REFERENCES `ordencompracab` (`idOrdenCompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordencompradet`
--

LOCK TABLES `ordencompradet` WRITE;
/*!40000 ALTER TABLE `ordencompradet` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordencompradet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenfabricacioncab`
--

DROP TABLE IF EXISTS `ordenfabricacioncab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenfabricacioncab` (
  `idOrdenfabricacion` int NOT NULL,
  `idCliente` int NOT NULL,
  `FechaIngreso` date NOT NULL,
  `FechaEntrega` date NOT NULL,
  `Subtotal` decimal(8,2) NOT NULL,
  `idJefeDeLineaACargo` int NOT NULL,
  `Estado` varchar(3) DEFAULT NULL,
  `idEntrega` int NOT NULL,
  `idPago` int NOT NULL,
  PRIMARY KEY (`idOrdenfabricacion`),
  KEY `FK_MetodoPago_OrdenFab_idx` (`idPago`),
  KEY `FK_Entrega_OrdenFabCab_idx` (`idEntrega`),
  KEY `FK_Cliente_OrdenFabCab_idx` (`idCliente`),
  KEY `FK_Empleados_OrdenFabCab_idx` (`idJefeDeLineaACargo`),
  CONSTRAINT `FK_Cliente_OrdenFabCab` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `FK_Empleados_OrdenFabCab` FOREIGN KEY (`idJefeDeLineaACargo`) REFERENCES `empleados` (`idEmpleados`),
  CONSTRAINT `FK_Entrega_OrdenFabCab` FOREIGN KEY (`idEntrega`) REFERENCES `formadeentrega` (`idFormadeentrega`),
  CONSTRAINT `FK_MetodoPago_OrdenFabCab` FOREIGN KEY (`idPago`) REFERENCES `metododepago` (`idMetododepago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenfabricacioncab`
--

LOCK TABLES `ordenfabricacioncab` WRITE;
/*!40000 ALTER TABLE `ordenfabricacioncab` DISABLE KEYS */;
INSERT INTO `ordenfabricacioncab` VALUES (1,1,'2024-03-07','2024-03-10',690114.58,1,'FIN',1,2),(2,3,'2024-03-15','2024-03-18',633177.22,2,'ENF',2,3),(3,3,'2024-03-16','2024-03-21',298017.10,2,'ENF',2,3),(4,1,'2024-03-22','2024-03-25',690114.58,1,'FIN',1,2);
/*!40000 ALTER TABLE `ordenfabricacioncab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenfabricaciondet`
--

DROP TABLE IF EXISTS `ordenfabricaciondet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenfabricaciondet` (
  `idOrdenFabricacionDet` int NOT NULL,
  `idOrdenFabricacion` int NOT NULL,
  `nItem` int NOT NULL,
  `CodigoProducto` varchar(45) NOT NULL,
  `DetalleProd` varchar(45) NOT NULL,
  `Qty` decimal(8,2) NOT NULL,
  `PUnitario` decimal(8,2) NOT NULL,
  `Importe` decimal(8,2) NOT NULL,
  `Estado` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`idOrdenFabricacionDet`),
  KEY `FK_OrdenFabCab_OrdenFabDet_idx` (`idOrdenFabricacion`),
  KEY `FK_FichaProd_OrdenFabDet_idx` (`CodigoProducto`),
  CONSTRAINT `FK_FichaProd_OrdenFabDet` FOREIGN KEY (`CodigoProducto`) REFERENCES `fichasproducto` (`CodigoInterno`),
  CONSTRAINT `FK_OrdenFabCab_OrdenFabDet` FOREIGN KEY (`idOrdenFabricacion`) REFERENCES `ordenfabricacioncab` (`idOrdenfabricacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenfabricaciondet`
--

LOCK TABLES `ordenfabricaciondet` WRITE;
/*!40000 ALTER TABLE `ordenfabricaciondet` DISABLE KEYS */;
INSERT INTO `ordenfabricaciondet` VALUES (1,1,1,'BLUED4X10','Blues Deville 4x10 Reissue',2.00,139194.17,278388.34,'FIN'),(2,1,2,'FHOTRODDX3','Hot Rod Deluxe III',3.00,137242.08,411726.24,'FIN'),(3,2,1,'MVCAB1+','MARK V+ - Head',3.00,107346.20,322038.60,'ENF'),(4,2,2,'MVCBO1','MARK V - Combo 1x12',2.00,155569.31,311138.62,'ENF'),(5,3,1,'CT1X12WIDE23','California Tweed1X12 CALIFORNIA TWEED 23',2.00,149008.55,298017.10,'ENF'),(6,4,1,'BLUED4X10','Blues Deville 4x10 Reissue',2.00,139194.17,278388.34,'FIN'),(7,4,2,'FHOTRODDX3','Hot Rod Deluxe III',3.00,137242.08,411726.24,'FIN');
/*!40000 ALTER TABLE `ordenfabricaciondet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenventacab`
--

DROP TABLE IF EXISTS `ordenventacab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenventacab` (
  `idOrdenVenta` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `FechaEntrega` date DEFAULT NULL,
  `idEmpleado` int NOT NULL,
  `idCliente` int NOT NULL,
  `idDireccion` int NOT NULL,
  `Entrega` varchar(45) DEFAULT NULL,
  `TipodePago` varchar(45) DEFAULT NULL,
  `Subtotal` decimal(8,2) NOT NULL,
  `Descuento` decimal(8,2) NOT NULL,
  `Total` decimal(8,2) NOT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT 'NOF',
  PRIMARY KEY (`idOrdenVenta`),
  KEY `FK_Empleado_Venta_idx` (`idEmpleado`),
  KEY `FK_Cliente_Venta_idx` (`idCliente`),
  KEY `FK_Direccion_Venta_idx` (`idDireccion`),
  CONSTRAINT `FK_Cliente_Venta` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `FK_Direccion_Venta` FOREIGN KEY (`idDireccion`) REFERENCES `direcciones` (`idDireccion`),
  CONSTRAINT `FK_Empleado_Venta` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenventacab`
--

LOCK TABLES `ordenventacab` WRITE;
/*!40000 ALTER TABLE `ordenventacab` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenventacab` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ordenventacab_AFTER_INSERT` AFTER INSERT ON `ordenventacab` FOR EACH ROW BEGIN
	call Registrar_Movimiento(1, 'Creación de orden de venta', new.idempleado, 'ordenventacab');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ordenventadet`
--

DROP TABLE IF EXISTS `ordenventadet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenventadet` (
  `idOrdenVentaDet` int NOT NULL AUTO_INCREMENT,
  `idOrdenVenta` int NOT NULL,
  `nItem` int NOT NULL,
  `CodigoProd` varchar(45) NOT NULL,
  `Cantidad` int NOT NULL,
  `PrecioUnitario` decimal(8,2) NOT NULL,
  `Importe` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idOrdenVentaDet`),
  KEY `FK_Producto_VentaDet_idx` (`CodigoProd`),
  KEY `FK_Producto_VentaDet2_idx` (`PrecioUnitario`) /*!80000 INVISIBLE */,
  KEY `nitem` (`nItem`),
  KEY `FK_OrdenVenta_VentaDet_idx` (`idOrdenVenta`),
  CONSTRAINT `FK_OrdenVenta_VentaDet` FOREIGN KEY (`idOrdenVenta`) REFERENCES `ordenventacab` (`idOrdenVenta`),
  CONSTRAINT `FK_Producto_VentaDet` FOREIGN KEY (`CodigoProd`) REFERENCES `fichasproducto` (`CodigoInterno`),
  CONSTRAINT `FK_Producto_VentaDet2` FOREIGN KEY (`PrecioUnitario`) REFERENCES `fichasproducto` (`PrecioUnitario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenventadet`
--

LOCK TABLES `ordenventadet` WRITE;
/*!40000 ALTER TABLE `ordenventadet` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenventadet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidocompracab`
--

DROP TABLE IF EXISTS `pedidocompracab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidocompracab` (
  `idPedidoCompra` int NOT NULL,
  `Fecha` date NOT NULL,
  `FechaEntrega` date NOT NULL,
  `idEmpleado` int NOT NULL,
  `idDepartamento` int NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPedidoCompra`),
  KEY `FK_Empleado_PedidoCompra_idx` (`idEmpleado`),
  KEY `FK_Departamento_PedidoCompra_idx` (`idDepartamento`),
  CONSTRAINT `FK_Departamento_PedidoCompra` FOREIGN KEY (`idDepartamento`) REFERENCES `departamentos` (`idDepartamento`),
  CONSTRAINT `FK_Empleado_PedidoCompra` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidocompracab`
--

LOCK TABLES `pedidocompracab` WRITE;
/*!40000 ALTER TABLE `pedidocompracab` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidocompracab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidocompradet`
--

DROP TABLE IF EXISTS `pedidocompradet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidocompradet` (
  `idPedidoCompraDet` int NOT NULL,
  `idPedidoCompra` int NOT NULL,
  `nitem` int NOT NULL,
  `idArticulo` varchar(45) NOT NULL,
  `Cantidad` int NOT NULL,
  PRIMARY KEY (`idPedidoCompraDet`),
  KEY `FK_PedidoCab_PedidoDet_idx` (`idPedidoCompra`),
  KEY `FK_Articulos_PedidoDet_idx` (`idArticulo`),
  CONSTRAINT `FK_Articulos_PedidoDet` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulos`),
  CONSTRAINT `FK_PedidoCab_PedidoDet` FOREIGN KEY (`idPedidoCompra`) REFERENCES `pedidocompracab` (`idPedidoCompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidocompradet`
--

LOCK TABLES `pedidocompradet` WRITE;
/*!40000 ALTER TABLE `pedidocompradet` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidocompradet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procesos`
--

DROP TABLE IF EXISTS `procesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procesos` (
  `Codigoproc` varchar(5) NOT NULL,
  `Proceso` varchar(45) NOT NULL,
  `TimeProc` time NOT NULL,
  PRIMARY KEY (`Codigoproc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procesos`
--

LOCK TABLES `procesos` WRITE;
/*!40000 ALTER TABLE `procesos` DISABLE KEYS */;
INSERT INTO `procesos` VALUES ('AC1','ACOPIO 1','35:00:00'),('AC2','ACOPIO 2','28:00:00'),('CC','CONTROL CALIDAD','15:00:00'),('EN1','ENSAMBLADO 1','60:00:00'),('EN2','ENSAMBLADO 2','40:00:00'),('LUS','LUSTRADO','40:00:00'),('PIN','PINTURA','06:00:00'),('TAP','TAPICERIA','01:30:00');
/*!40000 ALTER TABLE `procesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producidos`
--

DROP TABLE IF EXISTS `producidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producidos` (
  `idproducido` int NOT NULL AUTO_INCREMENT,
  `idOrdenFabricacion` int NOT NULL,
  `OFnItem` int NOT NULL,
  `CodigoProc` varchar(5) NOT NULL,
  `Qty` int NOT NULL,
  `IdOperario` int NOT NULL,
  `Fechaprod` date NOT NULL,
  `Horaprod` time NOT NULL,
  PRIMARY KEY (`idproducido`),
  KEY `FK_OrdenFabCab_Producidos_idx` (`idOrdenFabricacion`),
  KEY `FK_Proceso_Producido_idx` (`CodigoProc`),
  KEY `FK_Empleados_Producido_idx` (`IdOperario`),
  CONSTRAINT `FK_Empleados_Producido` FOREIGN KEY (`IdOperario`) REFERENCES `empleados` (`idEmpleados`),
  CONSTRAINT `FK_OrdenFabCab_Producidos` FOREIGN KEY (`idOrdenFabricacion`) REFERENCES `ordenfabricacioncab` (`idOrdenfabricacion`),
  CONSTRAINT `FK_Proceso_Producido` FOREIGN KEY (`CodigoProc`) REFERENCES `procesos` (`Codigoproc`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producidos`
--

LOCK TABLES `producidos` WRITE;
/*!40000 ALTER TABLE `producidos` DISABLE KEYS */;
INSERT INTO `producidos` VALUES (1,1,1,'AC1',2,3,'2024-03-07','08:30:00'),(2,1,1,'EN1',2,6,'2024-03-07','09:30:00'),(3,1,1,'AC2',2,3,'2024-03-07','13:30:00'),(4,1,1,'TAP',1,7,'2024-03-07','14:30:00'),(5,1,1,'TAP',1,7,'2024-03-08','08:30:00'),(6,1,1,'EN2',2,6,'2024-03-08','10:00:00'),(7,1,1,'CC',2,8,'2024-03-08','13:00:00'),(8,1,2,'AC1',3,3,'2024-03-09','08:30:00'),(9,1,2,'EN1',3,6,'2024-03-09','10:00:00'),(10,1,2,'AC2',3,3,'2024-03-09','14:30:00'),(11,1,2,'TAP',3,7,'2024-03-10','08:30:00'),(12,1,2,'EN2',3,6,'2024-03-10','11:30:00'),(13,2,1,'AC1',3,3,'2024-03-15','08:30:00'),(14,2,1,'EN1',3,6,'2024-03-15','10:00:00'),(15,2,1,'AC2',3,3,'2024-03-15','13:00:00'),(16,2,1,'TAP',2,7,'2024-03-15','14:30:00'),(17,2,2,'AC1',2,3,'2024-03-16','08:30:00'),(18,2,2,'EN1',2,6,'2024-03-16','09:30:00'),(19,3,1,'AC1',2,3,'2024-03-16','13:00:00'),(20,3,1,'EN1',2,6,'2024-03-16','14:00:00'),(21,4,1,'AC1',2,3,'2024-03-22','08:30:00'),(22,4,1,'EN1',2,6,'2024-03-22','09:30:00'),(23,4,1,'AC2',2,3,'2024-03-22','13:30:00'),(24,4,1,'TAP',1,7,'2024-03-22','14:30:00'),(25,4,1,'TAP',1,7,'2024-03-23','08:30:00'),(26,4,1,'EN2',2,6,'2024-03-23','10:00:00'),(27,4,1,'CC',2,8,'2024-03-23','13:00:00'),(28,4,2,'AC1',3,3,'2024-03-24','08:30:00'),(29,4,2,'EN1',3,6,'2024-03-24','10:00:00'),(30,4,2,'AC2',3,3,'2024-03-24','14:30:00'),(31,4,2,'TAP',3,7,'2024-03-25','08:30:00'),(32,4,2,'EN2',3,6,'2024-03-25','11:30:00');
/*!40000 ALTER TABLE `producidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idProveedores` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `idContacto` int NOT NULL,
  PRIMARY KEY (`idProveedores`),
  KEY `FK_Contacto_Proovedor_idx` (`idContacto`),
  CONSTRAINT `FK_Contacto_Proovedor` FOREIGN KEY (`idContacto`) REFERENCES `contactos` (`idContactos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `idProvincia` int NOT NULL,
  `Nombre` varchar(75) NOT NULL,
  PRIMARY KEY (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Buenos Aires'),(2,'Catamarca'),(3,'Chaco'),(4,'Chubut'),(5,'Córdoba'),(6,'Corrientes'),(7,'Entre Rios'),(8,'Formosa'),(9,'Jujuy'),(10,'La Pampa'),(11,'La Rioja'),(12,'Mendoza'),(13,'Misiones'),(14,'Neuquén'),(15,'Río Negro'),(16,'Salta'),(17,'San Juan'),(18,'San Luis'),(19,'Santa Cruz'),(20,'Santa Fe'),(21,'Santiago del Estero'),(22,'Tierra del Fuego, Antártida e Islas del Atlántico Sur'),(23,'Tucumán');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetasdemateriales`
--

DROP TABLE IF EXISTS `recetasdemateriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetasdemateriales` (
  `idReceta` int NOT NULL,
  `CodigoProd` varchar(45) NOT NULL,
  `idArticulo` varchar(45) NOT NULL,
  `Cantidad` decimal(8,2) NOT NULL,
  `UnidadMedida` varchar(8) NOT NULL,
  `SEQ` int NOT NULL,
  PRIMARY KEY (`idReceta`),
  KEY `FK_Prod_Receta_idx` (`CodigoProd`),
  KEY `FK_Articulo_Receta_idx` (`idArticulo`),
  KEY `FK_Unidadmedida_Receta_idx` (`UnidadMedida`),
  KEY `FK_HojaRuta_Receta_idx` (`SEQ`),
  CONSTRAINT `FK_Articulo_Receta` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulos`),
  CONSTRAINT `FK_HojaRuta_Receta` FOREIGN KEY (`SEQ`) REFERENCES `hojaderuta` (`Secuencia`),
  CONSTRAINT `FK_Prod_Receta` FOREIGN KEY (`CodigoProd`) REFERENCES `fichasproducto` (`CodigoInterno`),
  CONSTRAINT `FK_Unidadmedida_Receta` FOREIGN KEY (`UnidadMedida`) REFERENCES `unidades` (`idUnidades`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetasdemateriales`
--

LOCK TABLES `recetasdemateriales` WRITE;
/*!40000 ALTER TABLE `recetasdemateriales` DISABLE KEYS */;
INSERT INTO `recetasdemateriales` VALUES (1,'MVCAB1+','TP10028-25',1.00,'CU',1),(2,'MVCAB1+','BP10038-25',1.00,'CU',1),(3,'MVCAB1+','LPD3840-25',1.00,'CU',1),(4,'MVCAB1+','LPI3840-25',1.00,'CU',1),(5,'MVCAB1+','FP9520-25',1.00,'CU',2),(6,'MVCAB1+','FTEP9520-25',1.00,'CU',2),(7,'MVCAB1+','TOPFREP20-25x25',2.00,'CU',2),(8,'MVCAB1+','TOPFONP20-25x25',2.00,'CU',2),(9,'MVCAB1+','REGAMBHN',4.00,'CU',1),(10,'MVCAB1+','ESQUIMBAHN',6.00,'CU',1),(11,'MVCAB1+','MANITMBN',1.00,'CU',2),(12,'MVCAB1+','TARM1020',8.00,'CU',2),(13,'MVCAB1+','PARK205N',4.00,'CU',2),(14,'MVCAB1+','PARK2505N',4.00,'CU',2),(15,'MVCAB1+','FREZ206P',2.00,'CU',2),(16,'MVCAB1+','CHAPMBHN',2.00,'CU',1),(17,'MVCAB1+','FREZ1506P',4.00,'CU',1),(18,'MVCAB1+','CUEMBN',2.80,'M2',1),(19,'MVCAB1+','VINIL',550.00,'CM3',1),(20,'MVCAB1+','FREZ1506N',8.00,'CU',1),(21,'MVCAB1+','MBLOGO1',1.00,'CU',1),(22,'MVCBO1','TP11028-25',1.00,'CU',1),(23,'MVCBO1','BP11038-25',1.00,'CU',1),(24,'MVCBO1','LPD3855-25',1.00,'CU',1),(25,'MVCBO1','LPI3855-25',1.00,'CU',1),(26,'MVCBO1','FP10535-25',1.00,'CU',2),(27,'MVCBO1','TOPFONP30-25x25',2.00,'CU',2),(28,'MVCBO1','FTEP1210545-25',1.00,'CU',2),(29,'MVCBO1','TOPFREP38-25x25',2.00,'CU',2),(30,'MVCBO1','REGAMBHN',4.00,'CU',1),(31,'MVCBO1','ESQUIMBAHN',5.00,'CU',1),(32,'MVCBO1','MANITMBN',1.00,'CU',2),(33,'MVCBO1','TARM1020',8.00,'CU',2),(34,'MVCBO1','PARK205N',4.00,'CU',2),(35,'MVCBO1','PARK2505N',4.00,'CU',2),(36,'MVCBO1','FREZ206P',2.00,'CU',2),(37,'MVCBO1','CHAPMBHN',2.00,'CU',1),(38,'MVCBO1','FREZ1506P',4.00,'CU',1),(39,'MVCBO1','CUEMBN',4.70,'M2',1),(40,'MVCBO1','VINIL',880.00,'CM3',1),(41,'MVCBO1','FREZ1506N',8.00,'CU',1),(42,'MVCBO1','MBLOGO1',1.00,'CU',1),(43,'CT1X12WIDE23','TP12038-25',1.00,'CU',1),(44,'CT1X12WIDE23','BP12038-25',1.00,'CU',1),(45,'CT1X12WIDE23','LPD3855-25',1.00,'CU',1),(46,'CT1X12WIDE23','LPI3855-25',1.00,'CU',1),(47,'CT1X12WIDE23','FP11525-25',1.00,'CU',2),(48,'CT1X12WIDE23','TOPFONP25-25x25',2.00,'CU',2),(49,'CT1X12WIDE23','TOPFREP50-25x25',2.00,'CU',2),(50,'CT1X12WIDE23','FTEP1211550-25',1.00,'CU',2),(51,'CT1X12WIDE23','REGAMBHN',4.00,'CU',1),(52,'CT1X12WIDE23','ESQUIMBAHN',6.00,'CU',1),(53,'CT1X12WIDE23','MANITMBCN',1.00,'CU',2),(54,'CT1X12WIDE23','TARM1020',8.00,'CU',2),(55,'CT1X12WIDE23','PARK205N',8.00,'CU',2),(56,'CT1X12WIDE23','PARK2505N',4.00,'CU',2),(57,'CT1X12WIDE23','FREZ206P',2.00,'CU',2),(58,'CT1X12WIDE23','CHAPMBHN',2.00,'CU',2),(59,'CT1X12WIDE23','FREZ1506P',4.00,'CU',1),(60,'CT1X12WIDE23','CUEMBCREAM',3.60,'M2',1),(61,'CT1X12WIDE23','VINIL',780.00,'CM3',1),(62,'CT1X12WIDE23','FREZ1506N',8.00,'CU',1),(63,'CT1X12WIDE23','FP1557225',1.00,'CU',1),(64,'CT1X12WIDE23','MBLOGO2',1.00,'CU',1),(65,'BLUED4X10','TP10028-25',1.00,'CU',1),(66,'BLUED4X10','BP10038-25',1.00,'CU',1),(67,'BLUED4X10','LPD3840-25',1.00,'CU',1),(68,'BLUED4X10','LPI3840-25',1.00,'CU',1),(69,'BLUED4X10','FP9520-25',1.00,'CU',2),(70,'BLUED4X10','FTEP9520-25',1.00,'CU',2),(71,'BLUED4X10','TOPFREP20-25x25',2.00,'CU',2),(72,'BLUED4X10','TOPFONP20-25x25',2.00,'CU',2),(73,'BLUED4X10','REGAFDERSTD-BKN',4.00,'CU',1),(74,'BLUED4X10','MANITFDER-BK',1.00,'CU',2),(75,'BLUED4X10','TARM1020',8.00,'CU',2),(76,'BLUED4X10','PARK205N',4.00,'CU',2),(77,'BLUED4X10','PARK2505N',4.00,'CU',2),(78,'BLUED4X10','FREZ206P',2.00,'CU',2),(79,'BLUED4X10','FREZ1506P',4.00,'CU',1),(80,'BLUED4X10','TELAFDER-BD',5.80,'M2',1),(81,'BLUED4X10','VINIL',760.00,'CM3',1),(82,'BLUED4X10','FREZ1506N',8.00,'CU',1),(83,'BLUED4X10','FDERLOGO1',1.00,'CU',1),(105,'FHOTRODDX3','TC10028-25',1.00,'CU',1),(106,'FHOTRODDX3','BC10038-25',1.00,'CU',1),(107,'FHOTRODDX3','LCD3840-25',1.00,'CU',1),(108,'FHOTRODDX3','LCI3840-25',1.00,'CU',1),(109,'FHOTRODDX3','FC9520-25',1.00,'CU',1),(110,'FHOTRODDX3','FTEC9520-25',1.00,'CU',1),(111,'FHOTRODDX3','TOPFREC20-25x25',2.00,'CU',1),(112,'FHOTRODDX3','TOPFONC20-25x25',2.00,'CU',1),(113,'FHOTRODDX3','REGAFDERSTD-BKN',4.00,'CU',2),(114,'FHOTRODDX3','ESQUIFDERA-BK',6.00,'CU',2),(115,'FHOTRODDX3','MANITFDER-BK',1.00,'CU',2),(116,'FHOTRODDX3','TARM1020',8.00,'CU',2),(117,'FHOTRODDX3','PARK205N',4.00,'CU',2),(118,'FHOTRODDX3','PARK2505N',4.00,'CU',2),(119,'FHOTRODDX3','FREZ206P',2.00,'CU',2),(120,'FHOTRODDX3','CHAPFDER-HR',2.00,'CU',2),(121,'FHOTRODDX3','FREZ1506P',4.00,'CU',1),(122,'FHOTRODDX3','CUEFDER-BK',4.80,'M2',2),(123,'FHOTRODDX3','VINIL',760.00,'CM3',2),(124,'FHOTRODDX3','FREZ1506N',8.00,'CU',1),(125,'FHOTRODDX3','FDERLOGO2',1.00,'CU',2),(126,'PERF1000','TP10028-25',1.00,'CU',1),(127,'PERF1000','BP10038-25',1.00,'CU',1),(128,'PERF1000','LPD3840-25',1.00,'CU',1),(129,'PERF1000','LPI3840-25',1.00,'CU',1),(130,'PERF1000','FP9520-25',1.00,'CU',1),(131,'PERF1000','FTEP9520-25',1.00,'CU',1),(132,'PERF1000','TOPFREP20-25x25',2.00,'CU',1),(133,'PERF1000','TOPFONP20-25x25',2.00,'CU',1),(134,'PERF1000','REGAFDERSTD-BKN',4.00,'CU',2),(135,'PERF1000','MANITFDER-BK',1.00,'CU',2),(136,'PERF1000','TARM1020',8.00,'CU',1),(137,'PERF1000','PARK205N',4.00,'CU',2),(138,'PERF1000','PARK2505N',4.00,'CU',2),(139,'PERF1000','FREZ206P',2.00,'CU',2),(140,'PERF1000','FREZ1506P',4.00,'CU',2),(141,'PERF1000','CUEFDER-BK',5.10,'M2',2),(142,'PERF1000','VINIL',820.00,'CM3',2),(143,'PERF1000','FREZ1506N',8.00,'CU',2),(144,'PERF1000','FDERLOGO3',1.00,'CU',2);
/*!40000 ALTER TABLE `recetasdemateriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibocab`
--

DROP TABLE IF EXISTS `recibocab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recibocab` (
  `idRecibo` int NOT NULL,
  `idCliente` int NOT NULL,
  `Total` int NOT NULL,
  `Fecha` date NOT NULL,
  `idDireccion` int NOT NULL,
  `Recibi` varchar(45) DEFAULT NULL,
  `Aclaracion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRecibo`),
  KEY `FK_Cliente_ReciboCab_idx` (`idCliente`),
  KEY `FK_Direccion_ReciboCab_idx` (`idDireccion`),
  CONSTRAINT `FK_Cliente_ReciboCab` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `FK_Direccion_ReciboCab` FOREIGN KEY (`idDireccion`) REFERENCES `direcciones` (`idDireccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibocab`
--

LOCK TABLES `recibocab` WRITE;
/*!40000 ALTER TABLE `recibocab` DISABLE KEYS */;
INSERT INTO `recibocab` VALUES (1,1,650000,'2024-09-13',1,NULL,NULL),(2,1,500000,'2024-09-30',1,NULL,NULL);
/*!40000 ALTER TABLE `recibocab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibodocumento`
--

DROP TABLE IF EXISTS `recibodocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recibodocumento` (
  `idReciboDocumento` int NOT NULL AUTO_INCREMENT,
  `idRecibo` int NOT NULL,
  `idFactura` int NOT NULL,
  `Importe` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idReciboDocumento`),
  KEY `FK_ReciboCab_ReciboDocumento_idx` (`idRecibo`),
  KEY `FK_FacturaCab_ReciboDocumento_idx` (`idFactura`),
  CONSTRAINT `FK_FacturaCab_ReciboDocumento` FOREIGN KEY (`idFactura`) REFERENCES `facturacab` (`idFactura`),
  CONSTRAINT `FK_ReciboCab_ReciboDocumento` FOREIGN KEY (`idRecibo`) REFERENCES `recibocab` (`idRecibo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibodocumento`
--

LOCK TABLES `recibodocumento` WRITE;
/*!40000 ALTER TABLE `recibodocumento` DISABLE KEYS */;
INSERT INTO `recibodocumento` VALUES (1,1,1,320000.00),(2,1,1,330000.00),(3,2,2,500000.00);
/*!40000 ALTER TABLE `recibodocumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibovalores`
--

DROP TABLE IF EXISTS `recibovalores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recibovalores` (
  `idReciboValores` int NOT NULL,
  `idRecibo` int NOT NULL,
  `FormaPago` int NOT NULL,
  `Importe` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idReciboValores`),
  KEY `FK_ReciboCab_ReciboVal_idx` (`idRecibo`),
  CONSTRAINT `FK_ReciboCab_ReciboVal` FOREIGN KEY (`idRecibo`) REFERENCES `recibocab` (`idRecibo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibovalores`
--

LOCK TABLES `recibovalores` WRITE;
/*!40000 ALTER TABLE `recibovalores` DISABLE KEYS */;
INSERT INTO `recibovalores` VALUES (1,1,3,320000.00),(2,1,3,330000.00),(3,2,3,500000.00);
/*!40000 ALTER TABLE `recibovalores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remitocab`
--

DROP TABLE IF EXISTS `remitocab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remitocab` (
  `idRemito` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `FechaEntrega` date NOT NULL,
  `idEmpleado` int NOT NULL,
  `FormaEntrega` int NOT NULL,
  `idCliente` int NOT NULL,
  `idDireccion` int NOT NULL,
  `Bultos` int DEFAULT NULL,
  `PesoTotal` int DEFAULT NULL,
  `Recibi` varchar(45) DEFAULT NULL,
  `Aclaracion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRemito`),
  KEY `FK_Empleado_Remito_idx` (`idEmpleado`),
  KEY `FK_Cliente_Remito_idx` (`idCliente`),
  KEY `FK_Direccion_Remito_idx` (`idDireccion`),
  KEY `FK_FormaEntrega_Remito_idx` (`FormaEntrega`),
  CONSTRAINT `FK_Cliente_Remito` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `FK_Direccion_Remito` FOREIGN KEY (`idDireccion`) REFERENCES `direcciones` (`idDireccion`),
  CONSTRAINT `FK_Empleado_Remito` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleados`),
  CONSTRAINT `FK_FormaEntrega_Remito` FOREIGN KEY (`FormaEntrega`) REFERENCES `formadeentrega` (`idFormadeentrega`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remitocab`
--

LOCK TABLES `remitocab` WRITE;
/*!40000 ALTER TABLE `remitocab` DISABLE KEYS */;
INSERT INTO `remitocab` VALUES (1,'2024-09-06','2024-03-10',10,1,1,1,NULL,NULL,NULL,NULL),(2,'2024-09-28','2024-03-25',10,1,1,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `remitocab` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `remitocab_AFTER_INSERT` AFTER INSERT ON `remitocab` FOR EACH ROW call Registrar_Movimiento(1, 'Creación de remito', new.idempleado, 'remitocab') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `remitodet`
--

DROP TABLE IF EXISTS `remitodet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remitodet` (
  `idRemitoDet` int NOT NULL AUTO_INCREMENT,
  `idRemito` int NOT NULL,
  `CodigoProd` varchar(45) NOT NULL,
  `Cantidad` int NOT NULL,
  `idOrdenFabricacion` int NOT NULL,
  `Peso` int DEFAULT NULL,
  PRIMARY KEY (`idRemitoDet`),
  KEY `FK_Producto_RemitoDet_idx` (`CodigoProd`),
  KEY `FK_OrdenFabricacion_RemitoDet_idx` (`idOrdenFabricacion`),
  KEY `FK_Remito_RemitoDet_idx` (`idRemito`),
  CONSTRAINT `FK_OrdenFabricacion_RemitoDet` FOREIGN KEY (`idOrdenFabricacion`) REFERENCES `ordenfabricacioncab` (`idOrdenfabricacion`),
  CONSTRAINT `FK_Producto_RemitoDet` FOREIGN KEY (`CodigoProd`) REFERENCES `fichasproducto` (`CodigoInterno`),
  CONSTRAINT `FK_Remito_RemitoDet` FOREIGN KEY (`idRemito`) REFERENCES `remitocab` (`idRemito`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remitodet`
--

LOCK TABLES `remitodet` WRITE;
/*!40000 ALTER TABLE `remitodet` DISABLE KEYS */;
INSERT INTO `remitodet` VALUES (1,1,'BLUED4X10',2,1,NULL),(2,1,'FHOTRODDX3',3,1,NULL),(3,2,'BLUED4X10',2,4,NULL),(4,2,'FHOTRODDX3',3,4,NULL);
/*!40000 ALTER TABLE `remitodet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonos`
--

DROP TABLE IF EXISTS `telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonos` (
  `idTelefono` int NOT NULL,
  `idEmpresas` int NOT NULL,
  `ID` int NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`idTelefono`),
  KEY `FK_Empresas_Telefonos_idx` (`idEmpresas`),
  CONSTRAINT `FK_Empresas_Telefonos` FOREIGN KEY (`idEmpresas`) REFERENCES `empresas` (`idEmpresas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos`
--

LOCK TABLES `telefonos` WRITE;
/*!40000 ALTER TABLE `telefonos` DISABLE KEYS */;
INSERT INTO `telefonos` VALUES (1,1,1,'1111-2222'),(2,1,1,'1111-2223'),(3,1,1,'1111-2224'),(4,1,2,'2222-1111'),(5,1,2,'2222-1112'),(6,1,2,'2222-1113'),(7,1,3,'3333-2211'),(8,1,3,'3333-2222'),(9,1,4,'1111-2254'),(10,1,4,'1111-8989'),(11,1,5,'2223-5454'),(12,1,6,'2233-4455'),(13,1,6,'2233-5544');
/*!40000 ALTER TABLE `telefonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomov`
--

DROP TABLE IF EXISTS `tipomov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipomov` (
  `idTipomov` int NOT NULL,
  `Movimiento` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipomov`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomov`
--

LOCK TABLES `tipomov` WRITE;
/*!40000 ALTER TABLE `tipomov` DISABLE KEYS */;
INSERT INTO `tipomov` VALUES (1,'ALTA'),(2,'BAJA'),(3,'MODIFICACION');
/*!40000 ALTER TABLE `tipomov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposproducto`
--

DROP TABLE IF EXISTS `tiposproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposproducto` (
  `idTipoProducto` int NOT NULL,
  `TipoProducto` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposproducto`
--

LOCK TABLES `tiposproducto` WRITE;
/*!40000 ALTER TABLE `tiposproducto` DISABLE KEYS */;
INSERT INTO `tiposproducto` VALUES (1,'COMBO'),(2,'CABEZAL'),(3,'CAJA'),(4,'COMPONENTE'),(5,'INSUMO'),(6,'SERVICIOS');
/*!40000 ALTER TABLE `tiposproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion_almacen`
--

DROP TABLE IF EXISTS `ubicacion_almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion_almacen` (
  `idubicacion` int NOT NULL AUTO_INCREMENT,
  `idArticulo` varchar(45) NOT NULL,
  `Fila` varchar(10) NOT NULL,
  `Columna` varchar(10) NOT NULL,
  `Altura` varchar(10) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idubicacion`),
  KEY `FK_Articulo_Almacen_idx` (`idArticulo`),
  CONSTRAINT `FK_Articulo_Almacen` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion_almacen`
--

LOCK TABLES `ubicacion_almacen` WRITE;
/*!40000 ALTER TABLE `ubicacion_almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubicacion_almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades` (
  `idUnidades` varchar(8) NOT NULL,
  `Detalle` varchar(45) NOT NULL,
  PRIMARY KEY (`idUnidades`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES ('CM3','CENTIMETROS CUBICOS'),('CU','CADA UNO'),('KG','KILOGRAMO'),('KWH','KILOWATS HORA'),('LTS','LITROS'),('M2','METROS CUADRADOS'),('ML','METROS LINEALES'),('MM','MILIMETROS');
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'box s.a.'
--

--
-- Dumping routines for database 'box s.a.'
--
/*!50003 DROP FUNCTION IF EXISTS `OF_FINALIZADA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `OF_FINALIZADA`(orden int) RETURNS varchar(1) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
return if (exists(
select OF_Item_Específico_Finalizado(idordenfabricacion, nitem) 
from ordenfabricaciondet 
where idordenfabricacion = orden and OF_Item_Específico_Finalizado(idordenfabricacion, nitem) = "P"
), "P", "F");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `OF_Item_Específico_Finalizado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `OF_Item_Específico_Finalizado`(orden int, item int) RETURNS varchar(1) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
return (select if(
(select sum(qty) from producidos where ofnitem = item and idordenfabricacion = orden) 
= 
(select qty * count(codigosecuencia) from ordenfabricaciondet join hojaderuta on codigoproducto = codigoprod where codigoprod = (select codigoproducto from ordenfabricaciondet where nitem = item and idordenfabricacion = orden) and idordenfabricacion = orden)
,'F', 'P'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Positivo_Negativo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Positivo_Negativo`(numero int) RETURNS varchar(10) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	if numero > 0 then
		return 'Positivo';
	else
		return 'Negativo';
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sacar numerin3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `sacar numerin3`(numerin int) RETURNS int
    DETERMINISTIC
BEGIN
declare numerin3 int;
	set numerin3 = (select numerin1 + numerin2 from temporarytable2 where numerin1 = numerin);
RETURN numerin3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Check_Stock_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Check_Stock_Producto`(in producto varchar(45), cantidadprod Decimal(8,2))
BEGIN
	if exists(select codigointerno from fichasproducto where codigointerno = producto) then
		if(cantidadprod > 0) then
			select idarticulo, cantidad * cantidadprod as 'Cantidad necesaria', stock, stock - cantidad *cantidadprod as 'Diferencia', 
            if (stock - cantidad *cantidadprod> 0, 'Stock OK', 'Sin Stock')
            from recetasdemateriales join articulos on idarticulo = idarticulos
            where codigoprod = producto
            group by idarticulos;
        else
			select 'Cantidad inválida';
        end if;
	else
		select 'Producto inválido';
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Check_Stock_Producto_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Check_Stock_Producto_2`(in producto varchar(45), cantidadprod decimal(8,2))
BEGIN
	if exists(select codigointerno from fichasproducto where codigointerno = producto) then
		if exists(select stock from articulos join recetasdemateriales on idarticulos = idarticulo where codigoprod = producto and if(Positivo_Negativo(stock - cantidad * cantidadprod) = 'Negativo', false, true) = false group by idarticulos) then
			Select producto as 'Producto', 'N' as 'Procesable';
        else
			Select producto as 'Producto', 'S' as 'Procesable';
		end if;
    else
		select 'No existe el producto';
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ECC_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ECC_Cliente`(in cliente int)
BEGIN
    drop temporary table if exists estado_cuenta_corriente;
	create temporary table estado_cuenta_corriente(
			id_ecc int not null auto_increment key,
            comprobante int not null,
            tipo varchar(2),
            fecha date not null,
            debe decimal not null,
            paga decimal not null,
            saldo decimal,
            index idx_Fecha (fecha)
    );
    
    insert into estado_cuenta_corriente(comprobante, tipo, fecha, debe, paga)
    (select idfactura, 'FC', fecha, neto, 0 from facturacab where idcliente = cliente)
    union
    (select idrecibo, 'RP', fecha, 0, total from recibocab where idcliente = cliente)
    order by fecha;
    
    call set_saldo();
    
    select * from estado_cuenta_corriente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Estado_OF_Item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Estado_OF_Item`(in idof int, item int)
BEGIN
	if exists(select idordenfabricacion from ordenfabricacioncab where idordenfabricacion = idof) then
		if exists(select nitem from ordenfabricaciondet where nitem = item and idordenfabricacion = idof) then
			select producidos.idordenfabricacion as 'Orden', ofnitem as 'Item', codigoproducto as 'Producto', ordenfabricaciondet.qty as 'Qty ordenada', estado as 'Estado', codigoproc as 'Centro', producidos.qty as 'Qty procesada', fechaprod as 'Fecha', horaprod as 'Hora', idoperario as 'Operario'
            from ordenfabricaciondet join producidos on producidos.idordenfabricacion = ordenfabricaciondet.idordenfabricacion 
            where producidos.idordenfabricacion = idof and nitem = item and ofnitem = item order by fechaprod, horaprod;
        else
			select 'No existe el item en la orden';
		end if;
    else
		select 'No existe la orden de fabricación';
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Estado_OF_Item_CT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Estado_OF_Item_CT`(in idof int)
BEGIN
	if exists(select idordenfabricacion from ordenfabricaciondet where idordenfabricacion = idof) then
		select producidos.idordenfabricacion as 'Orden', ofnitem as 'Item', codigoproducto as 'Producto', ordenfabricaciondet.qty as 'Qty ordenada', codigoproc as 'Centro', producidos.qty as 'Qty producida', ordenfabricaciondet.qty - producidos.qty as 'Pendientes'
        from producidos join ordenfabricaciondet on producidos.idordenfabricacion = ordenfabricaciondet.idordenfabricacion
        where producidos.idordenfabricacion = idof and ofnitem = nitem;
    else
		select 'No existe la orden de fabricación';
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FACTURA_REMITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FACTURA_REMITO`(in remito int, usuario int)
BEGIN
	declare vfechaentrega date;
    declare vcliente int;
    declare vdireccion int;
    declare vsubtotal decimal;
    declare vneto decimal;
    declare vidfactura int;
    declare viva int;
	if exists(select idremito from remitocab where idremito = remito) then
		if not exists(select idremito from facturacab where idremito = remito) then
			select fechaentrega, idcliente, iddireccion into vfechaentrega, vcliente, vdireccion from remitocab where idremito = remito;
            set  vsubtotal = (select sum(preciounitario * cantidad) from fichasproducto join remitodet on codigointerno = codigoprod where idremito = remito group by idremito);
            set viva = vsubtotal * 0.21;
            set vneto = vsubtotal + viva;
			if exists(select idempleados from empleados where idempleados = usuario) then
				INSERT INTO `box s.a.`.`facturacab` (`Fecha`, `FechaEntrega`, `idCliente`, `idDireccion`, `idEmpleado`, `idRemito`, `Subtotal`, IVA,`Neto`) 
                VALUES (curdate(), vfechaentrega, vcliente, vdireccion, usuario, remito, vsubtotal, viva, vneto);
                
                select max(idfactura) into vidfactura from facturacab;

				insert into facturadet (idfactura, codigoprod, cantidad, unitario, importe) (select vidfactura, codigoprod, cantidad, preciounitario, preciounitario * cantidad from remitodet join fichasproducto on codigoprod = codigointerno where idremito = remito);
                
			else
				select 'Id de empleado inválido';
            end if;
        else
			select 'Este remito ya fue facturado';
        end if;
    else
		Select 'Remito inválido';
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Costo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Costo`(in producto varchar(45))
BEGIN
	if exists(select codigoprod from recetasdemateriales where codigoprod = producto) then
		select sum(valor * cantidad) as 'Costo' 
        from articulos join recetasdemateriales on idarticulos = idarticulo 
        where codigoprod = producto;
	else
		select 'No existe el producto o no tiene receta de materiales';
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Put_Costo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Put_Costo`(in producto varchar(45))
BEGIN
	declare newcosto Decimal(8,2);
	if exists(select codigointerno from fichasproducto where codigointerno = producto) then
		select sum(valor * cantidad) into newcosto from articulos join recetasdemateriales on idarticulos = idarticulo where codigoprod = producto;
        UPDATE fichasproducto SET Costo = newcosto, preciounitario = (newcosto * (porcentaje / 100)) + newcosto WHERE (CodigoInterno = producto);
    else
		select 'No existe el producto';
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Receta_Mat_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Receta_Mat_Producto`(in producto varchar(45))
BEGIN
	if exists(select codigoprod from recetasdemateriales where codigoprod = producto) then
		select idarticulo as 'Artículo', cantidad, valor, stock 
        from recetasdemateriales join articulos on idarticulo = idarticulos
        where codigoprod = producto;
	else
		select 'El producto no existe';
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Registrar_Movimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Movimiento`(in tipomov int, in detalle varchar(80), in empleado int, in tabla varchar(45))
BEGIN
	INSERT INTO `box s.a.`.`movimientos` (`Tipomov`, `DetMov`, `Fecha`, `Hora`, `idEmpleado`, `Table`) VALUES (tipomov, detalle, curdate(), curtime(), empleado, tabla);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REMITO_OF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REMITO_OF`(in Porden int, empleado int)
BEGIN
	declare vfechaentrega DATE;
    declare vformaentrega int;
    declare vcliente int;
    declare vdireccion int;
    declare vidremito int;
    declare vproducto varchar(45);
	if exists(select idordenfabricacion from ordenfabricacioncab where idordenfabricacion = Porden) then
		if OF_FINALIZADA(Porden) = 'F' then
			if exists(select idempleados from empleados where idempleados = empleado) then
				select fechaentrega,identrega,idcliente into vfechaentrega,vformaentrega,vcliente from ordenfabricacioncab where idordenfabricacion = Porden;
                select iddireccion into vdireccion from direcciones where idempresa = 1 and id = vcliente;
                select max(idremito) + 1 into vidremito from remitocab;
                
				INSERT INTO `box s.a.`.`remitocab` (`Fecha`, `FechaEntrega`, `idEmpleado`, `FormaEntrega`, `idCliente`, `idDireccion`) 
                VALUES (curdate(), vfechaentrega, empleado, vformaentrega, vcliente, vdireccion);
                
                INSERT INTO remitodet (idRemito, CodigoProd, Cantidad, idOrdenFabricacion)  (select vidremito,codigoproducto,qty,idordenfabricacion from ordenfabricaciondet where idordenfabricacion = porden);

            else
				select 'Id de empleado inválido';
            end if;
        else
			select 'La orden de fabricación no está terminada';
        end if;
    else
		Select 'Orden de fabricación inválida';
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Saldos_Facturas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Saldos_Facturas`(in cliente int)
BEGIN
	if exists(select idclientes from clientes where idclientes = cliente) then
		select idcliente as 'Cliente', facturacab.idfactura as 'Comprobante', neto as 'Importe', sum(importe) as 'Pagos', neto - sum(importe) as 'Saldo'
        from facturacab join recibodocumento on facturacab.idfactura = recibodocumento.idfactura 
        where idcliente = cliente group by(recibodocumento.idfactura);
    else
		select 'No existe el cliente';
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_saldo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_saldo`()
BEGIN
	declare contador int;
	declare saldo_aux decimal;
	set contador = 1;
	set saldo_aux = 0;
    
     while contador <= (select max(id_ecc) from estado_cuenta_corriente) do
		set saldo_aux = saldo_aux + (select debe - paga from estado_cuenta_corriente where id_ecc = contador);
		update estado_cuenta_corriente
			set saldo = saldo_aux where id_ecc = contador;
        set contador = contador + 1;
    end while;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-26 10:49:58
