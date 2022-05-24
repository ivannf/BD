-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arbitro`
--

DROP TABLE IF EXISTS `arbitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitro` (
  `codigoArbitro` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `sancionesImpuestas` int DEFAULT NULL,
  `partidosArbitrados` int DEFAULT NULL,
  PRIMARY KEY (`codigoArbitro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitro`
--

LOCK TABLES `arbitro` WRITE;
/*!40000 ALTER TABLE `arbitro` DISABLE KEYS */;
INSERT INTO `arbitro` VALUES (1,'Damiano','Coult',6,5),(2,'Tallia','Gage',2,5),(3,'Natale','Canwell',4,4),(4,'Cariotta','Gantzman',1,4),(5,'Caralie','Gian',5,4),(6,'Elsbeth','Doy',2,4),(7,'Dex','Marshallsay',9,4),(8,'Durant','Everix',7,4),(9,'Kayne','Roser',0,4),(10,'Yasmeen','Kale',5,4);
/*!40000 ALTER TABLE `arbitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directiva`
--

DROP TABLE IF EXISTS `directiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directiva` (
  `codigoDirectiva` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `puesto` varchar(45) DEFAULT NULL,
  `Equipo_codigoEquipo` int NOT NULL,
  PRIMARY KEY (`codigoDirectiva`),
  KEY `fk_Directiva_Equipo1_idx` (`Equipo_codigoEquipo`),
  CONSTRAINT `fk_Directiva_Equipo1` FOREIGN KEY (`Equipo_codigoEquipo`) REFERENCES `equipo` (`codigoEquipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directiva`
--

LOCK TABLES `directiva` WRITE;
/*!40000 ALTER TABLE `directiva` DISABLE KEYS */;
INSERT INTO `directiva` VALUES (1,'Mina','Presidente',1),(2,'Ingeberg','Entrenador',1),(3,'Sibyl','Presidente',2),(4,'Ginny','Entrenador',2),(5,'Donella','Presidente',3),(6,'Elysee','Entrenador',3),(7,'Augustine','Presidente',4),(8,'Kipp','Entrenador',4),(9,'Myrtie','Presidente',5),(10,'Eugenio','Entrenador',5),(11,'Norah','Presidente',6),(12,'Wyndham','Entrenador',6),(13,'Joe','Presidente',7),(14,'Cordelie','Entrenador',7);
/*!40000 ALTER TABLE `directiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directiva_paga_arbitro`
--

DROP TABLE IF EXISTS `directiva_paga_arbitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directiva_paga_arbitro` (
  `fecha` date DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `Directiva_codigoDirectiva` int NOT NULL,
  `Arbitro_codigoArbitro` int NOT NULL,
  PRIMARY KEY (`Directiva_codigoDirectiva`,`Arbitro_codigoArbitro`),
  KEY `fk_Directiva_Paga_Arbitro_Arbitro1_idx` (`Arbitro_codigoArbitro`),
  CONSTRAINT `fk_Directiva_Paga_Arbitro_Arbitro1` FOREIGN KEY (`Arbitro_codigoArbitro`) REFERENCES `arbitro` (`codigoArbitro`),
  CONSTRAINT `fk_Directiva_Paga_Arbitro_Directiva1` FOREIGN KEY (`Directiva_codigoDirectiva`) REFERENCES `directiva` (`codigoDirectiva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directiva_paga_arbitro`
--

LOCK TABLES `directiva_paga_arbitro` WRITE;
/*!40000 ALTER TABLE `directiva_paga_arbitro` DISABLE KEYS */;
INSERT INTO `directiva_paga_arbitro` VALUES ('2022-09-24',25,1,1),('2022-06-06',25,1,2),('2021-10-30',25,1,5),('2021-04-30',25,1,6),('2021-12-17',25,1,8),('2022-06-11',25,1,9),('2021-04-01',25,2,2),('2022-07-23',25,2,3),('2021-05-16',25,2,6),('2022-02-17',25,2,7),('2022-02-12',25,2,9),('2022-02-08',25,2,10),('2021-12-14',25,3,1),('2022-08-22',25,3,3),('2021-07-03',25,3,4),('2022-09-24',25,3,7),('2021-06-20',25,3,8),('2021-07-29',25,3,10),('2021-11-20',25,4,1),('2021-12-17',25,4,2),('2021-10-13',25,4,4),('2022-04-08',25,4,5),('2022-07-24',25,4,8),('2021-11-26',25,4,9),('2022-01-14',25,5,2),('2022-05-23',25,5,3),('2021-05-20',25,5,5),('2022-01-07',25,5,6),('2022-08-13',25,5,9),('2021-12-09',25,5,10),('2021-04-20',25,6,1),('2021-12-31',25,6,3),('2021-05-12',25,6,4),('2021-10-06',25,6,6),('2021-04-14',25,6,7),('2021-12-10',25,6,10),('2021-04-27',25,7,1),('2022-08-25',25,7,2),('2021-03-16',25,7,4),('2022-03-06',25,7,5),('2022-02-27',25,7,7),('2022-08-05',25,7,8);
/*!40000 ALTER TABLE `directiva_paga_arbitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `codigoEquipo` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `capitan` int NOT NULL,
  PRIMARY KEY (`codigoEquipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'Slovenia',1),(2,'Philippines',2),(3,'China',3),(4,'Pakistan',4),(5,'Canada',5),(6,'Brazil',6),(7,'Argentina',7);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `equipo_descalificado` BEFORE DELETE ON `equipo` FOR EACH ROW begin 
	insert into equipo_descalificado values(
	old.codigoEquipo,
	old.nombre 
	);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `equipo_descalificado`
--

DROP TABLE IF EXISTS `equipo_descalificado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo_descalificado` (
  `codigoEquipo` int NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo_descalificado`
--

LOCK TABLES `equipo_descalificado` WRITE;
/*!40000 ALTER TABLE `equipo_descalificado` DISABLE KEYS */;
INSERT INTO `equipo_descalificado` VALUES (8,'Prueba');
/*!40000 ALTER TABLE `equipo_descalificado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goles`
--

DROP TABLE IF EXISTS `goles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goles` (
  `codigoPartido` int NOT NULL,
  `codigoJugador` int NOT NULL,
  `minuto` int NOT NULL,
  PRIMARY KEY (`codigoPartido`,`codigoJugador`,`minuto`),
  KEY `codigoJugador` (`codigoJugador`),
  CONSTRAINT `goles_ibfk_1` FOREIGN KEY (`codigoPartido`) REFERENCES `partido` (`codigoPartido`),
  CONSTRAINT `goles_ibfk_2` FOREIGN KEY (`codigoJugador`) REFERENCES `jugadores` (`codigoJugadores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goles`
--

LOCK TABLES `goles` WRITE;
/*!40000 ALTER TABLE `goles` DISABLE KEYS */;
INSERT INTO `goles` VALUES (1,1,5),(1,1,8),(1,1,10),(1,1,23),(1,1,34),(1,1,38),(2,1,3),(2,1,6),(2,1,7),(2,1,10),(2,1,15),(2,1,18),(2,1,21),(2,1,27),(2,1,29),(2,1,31),(2,1,36),(2,1,38),(2,1,39),(3,1,5),(3,1,7),(3,1,22),(4,1,5),(4,1,8),(5,1,3),(5,1,6),(5,1,9),(5,1,11),(5,1,15),(5,1,17),(5,1,28),(5,1,36),(6,1,3),(6,1,7),(6,1,9),(6,1,11),(6,1,14),(6,1,16),(6,1,18),(6,1,23),(6,1,28),(7,1,3),(7,1,6),(7,1,9),(7,1,14),(7,1,17),(7,1,19),(7,1,21),(7,1,24),(7,1,28),(7,1,35),(8,1,3),(8,1,6),(8,1,7),(8,1,19),(8,1,24),(8,1,27),(8,1,31),(8,1,36),(9,1,4),(9,1,7),(9,1,11),(9,1,17),(9,1,25),(9,1,36),(10,1,5),(10,1,7),(10,1,11),(10,1,26),(11,1,6),(11,1,34),(11,1,36),(12,1,5),(12,1,8),(12,1,11),(12,1,18),(12,1,25),(12,1,28),(12,1,34),(13,1,2),(13,1,8),(13,1,15),(13,1,17),(13,1,21),(13,1,25),(13,1,27),(13,1,30),(13,1,32),(13,1,35),(13,1,36),(13,1,37),(13,1,39),(14,1,3),(14,1,16),(14,1,28),(15,1,3),(15,1,5),(15,1,7),(15,1,9),(15,1,23),(15,1,26),(16,1,5),(16,1,23),(16,1,27),(16,1,28),(16,1,29),(16,1,32),(16,1,34),(16,1,35),(16,1,37),(16,1,38),(16,1,40),(17,1,4),(17,1,7),(17,1,10),(17,1,14),(17,1,17),(17,1,19),(17,1,22),(17,1,26),(17,1,28),(17,1,31),(17,1,37),(18,1,3),(19,1,5),(19,1,8),(19,1,16),(19,1,18),(19,1,22),(20,1,3),(20,1,5),(20,1,7),(20,1,10),(20,1,11),(20,1,14),(20,1,16),(20,1,17),(20,1,18),(20,1,20),(20,1,22),(20,1,23),(20,1,26),(20,1,28),(20,1,31),(20,1,35),(20,1,37),(20,1,39),(21,1,2),(21,1,4),(21,1,11),(21,1,16),(22,1,4),(22,1,6),(22,1,12),(22,1,15),(22,1,17),(22,1,19),(22,1,21),(22,1,27),(22,1,29),(22,1,31),(23,1,5),(23,1,7),(23,1,10),(23,1,13),(23,1,17),(23,1,21),(23,1,25),(23,1,28),(24,1,6),(24,1,10),(24,1,13),(24,1,18),(24,1,21),(24,1,26),(24,1,29),(25,1,6),(25,1,9),(25,1,14),(25,1,18),(26,1,4),(26,1,7),(26,1,9),(26,1,12),(26,1,37),(27,1,6),(27,1,16),(27,1,25),(27,1,27),(27,1,29),(27,1,31),(27,1,36),(28,1,5),(29,1,6),(29,1,8),(29,1,14),(29,1,17),(29,1,26),(30,1,6),(30,1,9),(30,1,12),(30,1,16),(31,1,6),(31,1,11),(31,1,15),(31,1,18),(31,1,25),(31,1,31),(32,1,6),(32,1,12),(32,1,15),(32,1,17),(32,1,20),(32,1,22),(32,1,25),(32,1,27),(32,1,28),(32,1,31),(32,1,36),(33,1,5),(33,1,8),(33,1,10),(34,1,5),(34,1,16),(34,1,18),(34,1,21),(34,1,25),(35,1,4),(35,1,7),(35,1,10),(35,1,13),(35,1,16),(35,1,19),(35,1,21),(35,1,25),(35,1,28),(35,1,32),(35,1,39),(36,1,5),(36,1,9),(36,1,11),(36,1,16),(36,1,18),(36,1,25),(36,1,28),(36,1,31),(36,1,33),(36,1,34),(36,1,36),(36,1,37),(36,1,38),(36,1,40),(37,1,5),(37,1,9),(37,1,11),(37,1,14),(37,1,16),(37,1,21),(37,1,24),(37,1,26),(37,1,31),(38,1,5),(38,1,8),(38,1,10),(38,1,13),(38,1,15),(38,1,17),(38,1,19),(38,1,33),(38,1,36),(39,1,5),(39,1,8),(39,1,11),(39,1,14),(39,1,18),(40,1,5),(40,1,18),(40,1,36),(42,1,5),(42,1,8),(42,1,20),(42,1,22),(42,1,25),(42,1,27),(42,1,29),(42,1,33),(2,2,38),(22,11,10),(29,11,12);
/*!40000 ALTER TABLE `goles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `codigoJugadores` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(45) DEFAULT NULL,
  `Equipo_codigoEquipo` int NOT NULL,
  PRIMARY KEY (`codigoJugadores`),
  KEY `fk_Jugadores_Equipo1_idx` (`Equipo_codigoEquipo`),
  CONSTRAINT `fk_Jugadores_Equipo1` FOREIGN KEY (`Equipo_codigoEquipo`) REFERENCES `equipo` (`codigoEquipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,'Janenna','Bertelmot',68,'1992-01-03','China',1),(2,'Mina','Guerreau',68,'1995-02-16','Indonesia',2),(3,'Maximilian','Harriagn',98,'1982-06-04','Peru',3),(4,'Lurline','Robertacci',57,'1986-04-02','Russia',4),(5,'Ardisj','Whorton',5,'1994-01-10','Saudi Arabia',5),(6,'Gottfried','Mewes',96,'1987-01-27','Indonesia',6),(7,'Doll','Tregea',60,'1994-12-11','Japan',7),(8,'Tomasina','Ridley',13,'1986-07-05','Pakistan',1),(9,'Jaynell','Dewsnap',63,'1991-06-30','Brazil',1),(10,'Port','Nibloe',96,'1995-01-05','Indonesia',1),(11,'Lyn','Padley',52,'1990-01-25','Tunisia',1),(12,'Cristobal','Kulis',62,'1986-10-12','Belarus',1),(13,'Bronson','Satford',73,'1985-09-11','Denmark',1),(14,'Sayre','Mussared',70,'1997-11-30','Philippines',1),(15,'Orrin','Camilli',7,'1985-07-15','Czech Republic',1),(16,'Roda','Pollington',64,'2001-08-01','Czech Republic',1),(17,'Sawyere','Phorsby',79,'1996-12-08','United Kingdom',1),(18,'Bibbye','Aggs',5,'1987-06-13','China',1),(19,'Bethany','Abrashkin',60,'2001-05-19','Syria',1),(20,'Martynne','Cunney',1,'1994-09-05','Czech Republic',1),(21,'Hollyanne','Fylan',22,'1985-01-26','China',1),(22,'Teddy','Kerrod',21,'2002-01-31','Poland',2),(23,'Benjie','Remmer',66,'1983-09-14','Poland',2),(24,'Jayson','Goodlife',87,'1981-12-06','China',2),(25,'Niles','Haugen',20,'1984-06-20','Russia',2),(26,'Idelle','Karp',6,'1989-03-07','China',2),(27,'Tallia','Egiloff',51,'2002-01-31','Mexico',2),(28,'Murial','Ciccoloi',35,'2002-02-12','China',2),(29,'Kipper','Quantick',57,'1988-09-19','Croatia',2),(30,'Shelbi','Esselen',75,'1986-07-17','Nicaragua',2),(31,'Pierre','Storr',11,'1997-12-17','Russia',2),(32,'Hugh','Fawks',65,'1982-04-19','Colombia',2),(33,'Emmye','Chattaway',47,'1994-11-27','China',2),(34,'Geoffry','Flageul',14,'1998-01-13','France',2),(35,'Abba','Rugg',74,'1989-07-06','Indonesia',2),(36,'Bevvy','Joe',55,'1990-10-19','Brazil',3),(37,'Meggie','Girtin',78,'1984-03-24','Indonesia',3),(38,'Rabbi','Maingot',7,'2000-04-24','China',3),(39,'Giulio','Hannum',34,'1983-10-20','Indonesia',3),(40,'Lucila','Gawler',89,'1987-01-18','Republic of the Congo',3),(41,'Rip','Eltune',14,'1985-01-16','Mexico',3),(42,'Gwenette','Glashby',54,'1990-04-21','Thailand',3),(43,'Bobby','Zottoli',41,'1994-06-17','Estonia',3),(44,'Rasla','Philipsson',38,'1982-02-11','Thailand',3),(45,'Ikey','Chick',49,'1993-07-09','Philippines',3),(46,'Robenia','Andriuzzi',53,'1987-03-02','Russia',3),(47,'Jessie','Gartrell',10,'1997-08-08','Sweden',3),(48,'Selena','Tetsall',91,'1980-10-04','Malaysia',3),(49,'Devina','Patchett',65,'1983-02-19','Nigeria',3),(50,'Rochell','Langrick',54,'2001-08-02','Indonesia',4),(51,'Viole','Storie',22,'1995-04-26','Bermuda',4),(52,'Rodolphe','Dreigher',86,'2002-02-19','Indonesia',4),(53,'Barrie','Botwood',8,'1999-07-21','China',4),(54,'Selia','Hagwood',88,'1995-02-05','China',4),(55,'Aldin','des Remedios',77,'2001-11-20','China',4),(56,'Glynda','Barnett',91,'1982-10-31','China',4),(57,'Evin','Corbally',99,'1981-04-27','Dominican Republic',4),(58,'Kiley','Brimfield',32,'1992-05-27','Russia',4),(59,'Cassy','Nelsen',40,'1980-04-12','China',4),(60,'Leonhard','Lethieulier',38,'1988-07-03','China',4),(61,'Gilly','Fatkin',94,'2002-03-04','Indonesia',4),(62,'Burgess','Alvarado',17,'1989-08-04','China',4),(63,'Falito','McGovern',7,'1985-11-23','Portugal',4),(64,'Maurizia','Letty',1,'2001-09-25','Cameroon',4),(65,'Fransisco','Whittick',32,'1994-02-15','Russia',5),(66,'Margery','Phizackarley',39,'2000-08-03','Slovenia',5),(67,'Drona','Roston',9,'1986-03-22','Indonesia',5),(68,'Gayler','Muldrew',31,'1986-06-03','China',5),(69,'Sherlocke','Duigan',84,'1999-11-28','United States',5),(70,'Anjanette','Vasyukhin',74,'1983-07-24','United States',5),(71,'Dreddy','Skerman',27,'1992-10-20','Russia',5),(72,'Minnnie','McDermott',81,'1990-04-04','Thailand',5),(73,'Darrelle','Jewess',90,'1999-08-28','China',5),(74,'Yevette','Clewes',47,'1984-06-25','Portugal',5),(75,'Graehme','Coenraets',87,'1986-12-19','Portugal',5),(76,'Aleece','Nizet',21,'1988-03-19','Brazil',5),(77,'Danny','Hoggins',7,'1992-04-03','China',5),(78,'Reilly','Kenton',66,'1990-08-05','United Kingdom',5),(79,'Lem','Tuffield',19,'1987-11-16','China',6),(80,'Laure','Overstone',26,'1992-06-12','Portugal',6),(81,'Wallis','Lindner',27,'1984-11-16','Cuba',6),(82,'Lindsay','Beddie',51,'1992-11-14','Guatemala',6),(83,'Cathie','Bradd',2,'1980-08-01','Indonesia',6),(84,'Jourdain','Goldsby',48,'1989-12-26','China',6),(85,'Morton','Bolt',54,'1995-04-01','China',6),(86,'Carola','Coley',62,'1982-05-19','Tunisia',6),(87,'Cordelie','Blakeston',41,'1992-06-23','Russia',6),(88,'Kurtis','MacAlinden',6,'1981-05-29','China',6),(89,'Neron','Pierse',76,'1993-03-10','Poland',6),(90,'Kippie','Brockhouse',89,'1985-01-14','Cambodia',6),(91,'Matthew','Algar',77,'1981-12-23','Philippines',6),(92,'Andra','Patershall',74,'1996-12-17','China',7),(93,'Venus','Doerrling',96,'1987-11-24','Cyprus',7),(94,'Thoma','Hansod',92,'1996-07-10','Poland',7),(95,'Adrian','Hinder',27,'1992-12-13','China',7),(96,'Noella','Kolodziejski',90,'1997-04-24','Sweden',7),(97,'Chad','Skey',42,'1985-07-21','Italy',7),(98,'Auria','Olle',35,'1999-01-06','Laos',7),(99,'Gabriello','Andino',56,'1989-04-19','Montenegro',7),(100,'Niki','Maryman',7,'1998-02-15','Pakistan',7),(101,'Tailor','Gabbotts',46,'1982-08-23','Brazil',7),(102,'Marcile','Do Rosario',62,'1982-12-22','Ukraine',7),(103,'Caleb','Gwalter',78,'1999-06-17','China',7),(104,'Earle','Turbefield',17,'1983-12-19','Australia',7),(105,'Theodor','Witsey',59,'2001-02-09','China',7);
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jugador_añadido` BEFORE INSERT ON `jugadores` FOR EACH ROW begin 
	IF(new.fechaNacimiento > "2003-12-31") then
	signal sqlstate '22000'
	set message_text = 'El nuevo jugador debe ser mayor del año 2003';
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `mayores_2002`
--

DROP TABLE IF EXISTS `mayores_2002`;
/*!50001 DROP VIEW IF EXISTS `mayores_2002`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mayores_2002` AS SELECT 
 1 AS `nombre`,
 1 AS `apellidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido` (
  `codigoPartido` int NOT NULL,
  `jornada` int DEFAULT NULL,
  `zona` varchar(45) DEFAULT NULL,
  `numeroCampo` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `golesLocales` int DEFAULT NULL,
  `golesVisitantes` int DEFAULT NULL,
  `codigoArbitro` int DEFAULT NULL,
  `equipoLocal` int DEFAULT NULL,
  `equipoVisitante` int DEFAULT NULL,
  PRIMARY KEY (`codigoPartido`),
  KEY `codigoArbitro` (`codigoArbitro`),
  KEY `equipoLocal` (`equipoLocal`),
  KEY `equipoVisitante` (`equipoVisitante`),
  CONSTRAINT `partido_ibfk_4` FOREIGN KEY (`codigoArbitro`) REFERENCES `arbitro` (`codigoArbitro`),
  CONSTRAINT `partido_ibfk_5` FOREIGN KEY (`equipoLocal`) REFERENCES `equipo` (`codigoEquipo`),
  CONSTRAINT `partido_ibfk_6` FOREIGN KEY (`equipoVisitante`) REFERENCES `equipo` (`codigoEquipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` VALUES (1,1,'Tejares',1,'2021-10-29',2,4,1,5,3),(2,1,'Tejares',2,'2021-10-29',2,12,2,6,1),(3,1,'Tejares',3,'2021-10-29',0,3,3,7,4),(4,2,'Tejares',1,'2021-11-05',1,1,4,3,2),(5,2,'Tejares',2,'2021-11-05',7,1,5,1,5),(6,2,'Tejares',3,'2021-11-05',7,2,6,4,6),(7,3,'Tejares',1,'2021-11-12',4,6,7,5,4),(8,3,'Tejares',2,'2021-11-12',7,1,8,7,6),(9,3,'Tejares',3,'2021-11-12',2,4,9,2,1),(10,4,'Tejares',1,'2021-11-19',2,2,10,4,2),(11,4,'Tejares',2,'2021-11-19',0,3,1,6,5),(12,4,'Tejares',3,'2021-11-19',3,4,2,3,7),(13,5,'Tejares',1,'2021-11-26',10,3,3,2,6),(14,5,'Tejares',2,'2021-11-26',0,3,4,7,5),(15,5,'Tejares',3,'2021-11-26',1,5,5,3,1),(16,6,'Tejares',1,'2021-12-03',3,8,6,7,1),(17,6,'Tejares',2,'2021-12-03',1,10,7,5,2),(18,6,'Tejares',3,'2021-12-03',0,1,8,4,3),(19,7,'Tejares',1,'2021-12-17',4,1,9,3,6),(20,7,'Tejares',2,'2021-12-17',11,6,10,2,7),(21,7,'Tejares',3,'2021-12-17',1,3,1,1,4),(22,8,'Tejares',1,'2022-01-14',8,3,2,3,5),(23,8,'Tejares',2,'2022-01-14',6,2,3,1,6),(24,8,'Tejares',3,'2022-01-14',1,6,4,4,7),(25,9,'Tejares',1,'2022-01-21',3,1,5,2,3),(26,9,'Tejares',2,'2022-01-21',0,5,6,5,1),(27,9,'Tejares',3,'2022-01-21',6,1,7,6,4),(28,10,'Tejares',1,'2022-01-28',0,1,8,4,5),(29,10,'Tejares',2,'2022-01-28',3,3,9,6,7),(30,10,'Tejares',3,'2022-01-28',2,2,10,1,2),(31,11,'Tejares',1,'2022-02-04',2,4,1,2,4),(32,11,'Tejares',2,'2022-02-04',6,5,2,5,6),(33,11,'Tejares',3,'2022-02-04',0,3,3,7,3),(34,12,'Tejares',1,'2022-02-11',1,4,4,6,2),(35,12,'Tejares',2,'2022-02-11',3,8,5,5,7),(36,12,'Tejares',3,'2022-02-11',13,1,6,1,3),(37,13,'Tejares',1,'2022-02-18',8,1,7,1,7),(38,13,'Tejares',2,'2022-02-18',6,3,8,2,5),(39,13,'Tejares',3,'2022-02-18',3,2,9,3,4),(40,14,'Tejares',1,'2022-03-04',1,2,10,6,3),(41,14,'Tejares',2,'2022-03-04',0,3,1,7,2),(42,14,'Tejares',3,'2022-03-04',2,6,2,4,1);
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `partido_arbitro`
--

DROP TABLE IF EXISTS `partido_arbitro`;
/*!50001 DROP VIEW IF EXISTS `partido_arbitro`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `partido_arbitro` AS SELECT 
 1 AS `codigoArbitro`,
 1 AS `nombre`,
 1 AS `apellidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `equipo_goles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `equipo_goles`(codigo int) RETURNS varchar(100) CHARSET utf8mb3
    DETERMINISTIC
begin
	declare resultado int default 0;
	
	set resultado := (select sum(p.golesLocales) from partido p inner join equipo e 
						on p.equipoLocal = e.codigoEquipo 
						where e.codigoEquipo = codigo);
					
	if (resultado > 30) then
	return ('Este equipo ha marcado mas de 20 goles como local.');
	else 
	return ('Este equipo ha marcado menos de 20 goles como local.');
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ganador_partido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ganador_partido`(codigo int) RETURNS varchar(100) CHARSET utf8mb3
    DETERMINISTIC
begin 
	declare loc int default 0;
	declare vis int default 0;

	set loc := (select p.golesLocales from partido p where p.codigoPartido = codigo);
	set vis := (select p.golesVisitantes from partido p where p.codigoPartido = codigo);

	if (loc > vis) then 
	return ('Este partido lo ha ganado el equipo local');
	elseif(loc = vis) then 
	return ('Este partido ha quedado empate');
	else 
	return ('Este partido lo ha ganado el equipo visitante');
	end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ganador_partido_jornada_equipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ganador_partido_jornada_equipo`(jornada int, equi varchar(45))
begin
	select ganador_partido(p.codigoPartido) as ganador, 
	if (p.golesLocales > p.golesVisitantes, e1.nombre, if (p.golesLocales < p.golesVisitantes, e2.nombre, '')) as nombre_equipo_ganador,
	p.jornada 
	from partido p 
	left join equipo e1 on e1.codigoEquipo = p.equipoLocal 
	left join equipo e2 on e2.codigoEquipo = p.equipoVisitante
	where if (e1.nombre is not null and (lower(e1.nombre) like lower(equi)), lower(e1.nombre), 
	if (e2.nombre is not null and (lower(e2.nombre) like lower(equi)), lower(e2.nombre), '')) like lower(equi) and p.jornada = jornada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `presidente_jugador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `presidente_jugador`(codigo int)
begin 
	select d.* from jugadores j  
	inner join equipo e 
	on j.Equipo_codigoEquipo = e.codigoEquipo
	inner join directiva d on e.codigoEquipo = d.Equipo_codigoEquipo 
	where d.puesto = "presidente" and j.codigoJugadores = codigo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sanciones_arbitros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sanciones_arbitros`()
begin 
	declare fin int default false;
	declare datos varchar(1000);
	declare cur cursor for select concat('Nombre: ',a.nombre,' |',
		' Sanciones: ',a.sancionesImpuestas,
		' |',' Partidos pitados: ',a.partidosArbitrados) 
		from arbitro a;
	declare continue handler for not found set fin = true;
	open cur;
	while fin = false do
	fetch cur into datos;
	select datos;
	end while;
	close cur;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `mayores_2002`
--

/*!50001 DROP VIEW IF EXISTS `mayores_2002`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mayores_2002` AS select `j`.`nombre` AS `nombre`,`j`.`apellidos` AS `apellidos` from `jugadores` `j` where `j`.`fechaNacimiento` in (select `j2`.`fechaNacimiento` from `jugadores` `j2` where (`j2`.`fechaNacimiento` > '2002-01-01')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `partido_arbitro`
--

/*!50001 DROP VIEW IF EXISTS `partido_arbitro`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `partido_arbitro` AS select `a`.`codigoArbitro` AS `codigoArbitro`,`a`.`nombre` AS `nombre`,`a`.`apellidos` AS `apellidos` from (`arbitro` `a` join `partido` `p` on((`a`.`codigoArbitro` = `p`.`codigoArbitro`))) where (`p`.`codigoPartido` = 5) */;
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

-- Dump completed on 2022-05-24 18:44:58
