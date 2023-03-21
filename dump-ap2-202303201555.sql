-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: ap2
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `civ`
--

DROP TABLE IF EXISTS `civ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `civ` (
  `IdCiv` int NOT NULL AUTO_INCREMENT,
  `Labelle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`IdCiv`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `civ`
--

LOCK TABLES `civ` WRITE;
/*!40000 ALTER TABLE `civ` DISABLE KEYS */;
INSERT INTO `civ` VALUES (1,'Mr'),(2,'Mme'),(3,'Autre');
/*!40000 ALTER TABLE `civ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `couverture_sociale`
--

DROP TABLE IF EXISTS `couverture_sociale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `couverture_sociale` (
  `NumSecu` bigint NOT NULL,
  `NomSecu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Assurance` tinyint(1) NOT NULL,
  `ALD` tinyint(1) NOT NULL,
  `NomMutu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NumAdherent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TypeChambre` tinyint(1) NOT NULL,
  PRIMARY KEY (`NumSecu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couverture_sociale`
--

LOCK TABLES `couverture_sociale` WRITE;
/*!40000 ALTER TABLE `couverture_sociale` DISABLE KEYS */;
INSERT INTO `couverture_sociale` VALUES (787878,'ji',1,1,'kik','',1),(852963,'sxsxsxsssxsxsxsxsxxxxxxxxsx',1,0,'fvfvfvvfv','1231313131313',1),(55554545,'nbvcx',0,1,'kjhgf','4123',0),(123123123,'gfds',1,1,'azerftgh','789456',1),(1234567890,'jsp',1,0,'nbvcxw','789456',0),(44444444444,'hgfd',1,1,'hgfds','624551',1),(77777777755,'ccccccc',1,1,'hhhh','145454',1),(99999999999,'gy',1,1,'d','444',1),(741085209630,'vutuf',1,1,',nn','8778',1),(785412364785,'wxcvb',1,0,'hgfdghjk','789641230',1),(9688888888899,'555lllll',1,1,'vgvgvg','77777',1);
/*!40000 ALTER TABLE `couverture_sociale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospi`
--

DROP TABLE IF EXISTS `hospi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospi` (
  `NumSecu` bigint NOT NULL,
  `IdPersonnel` int DEFAULT NULL,
  `PreAdd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HeureHospi` time NOT NULL,
  `DateHospi` date NOT NULL,
  PRIMARY KEY (`NumSecu`),
  CONSTRAINT `hospi_FK` FOREIGN KEY (`NumSecu`) REFERENCES `couverture_sociale` (`NumSecu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospi`
--

LOCK TABLES `hospi` WRITE;
/*!40000 ALTER TABLE `hospi` DISABLE KEYS */;
INSERT INTO `hospi` VALUES (787878,3,'2','10:00:00','2023-03-14'),(852963,4,'2','10:05:00','2023-03-31'),(55554545,3,'2','09:09:00','0009-09-09'),(123123123,4,'2','09:09:00','0218-05-20'),(1234567890,3,'1','10:02:00','2003-10-23'),(44444444444,4,'1','09:09:00','0999-09-09'),(77777777755,4,'2','20:55:00','2009-05-26'),(99999999999,3,'1','09:09:00','2023-03-31'),(741085209630,4,'2','09:09:00','2023-03-15'),(785412364785,3,'1','09:09:00','0777-07-07'),(9688888888899,3,'1','09:09:00','9999-09-09');
/*!40000 ALTER TABLE `hospi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `Label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Date` date NOT NULL,
  `IdUser` int NOT NULL,
  `heure` time NOT NULL,
  `idRole` int NOT NULL,
  KEY `logs_FK` (`IdUser`),
  KEY `logs_FK_1` (`idRole`),
  CONSTRAINT `logs_FK` FOREIGN KEY (`IdUser`) REFERENCES `user` (`IdUser`),
  CONSTRAINT `logs_FK_1` FOREIGN KEY (`idRole`) REFERENCES `roles` (`IdRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES ('Tentative de conexion de l\'utilisateur (Capchat non conforme)','2023-03-06',3,'13:44:06',3),('Conexion de l\'utilisateur','2023-03-06',3,'13:44:17',3),('Tentative de conexion de l\'utilisateur (Capchat non conforme)','2023-03-06',3,'13:44:17',3),('Tentative de conexion de l\'utilisateur (Capchat non conforme)','2023-03-06',3,'13:44:35',3),('Conexion de l\'utilisateur','2023-03-10',3,'09:02:13',3),('Tentative de conexion de l\'utilisateur (Capchat non conforme)','2023-03-10',3,'09:02:13',3),('Conexion de l\'utilisateur','2023-03-10',3,'11:04:27',3),('Tentative de conexion de l\'utilisateur (Capchat non conforme)','2023-03-10',3,'11:04:27',3),('Conexion de l\'utilisateur','2023-03-20',2,'15:55:26',1),('Tentative de conexion de l\'utilisateur (Capchat non conforme)','2023-03-20',2,'15:55:26',1);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `Civ` int DEFAULT NULL,
  `NomNaissance` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NomEpouse` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PrenomPatient` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NaissancePatient` date NOT NULL,
  `AdressePatient` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TelPatient` int NOT NULL,
  `CPPatient` int NOT NULL,
  `VillePatient` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MailPatient` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Mineur` tinyint(1) DEFAULT NULL,
  `IdProcheConf` int DEFAULT NULL,
  `IdProchePre` int DEFAULT NULL,
  `NumSecu` bigint NOT NULL,
  PRIMARY KEY (`NumSecu`),
  KEY `patients_FK` (`Civ`),
  KEY `patients_FK_pre` (`IdProchePre`),
  KEY `patients_FK_conf` (`IdProcheConf`),
  CONSTRAINT `patients_FK` FOREIGN KEY (`Civ`) REFERENCES `civ` (`IdCiv`),
  CONSTRAINT `patients_FK_1` FOREIGN KEY (`NumSecu`) REFERENCES `couverture_sociale` (`NumSecu`),
  CONSTRAINT `patients_FK_conf` FOREIGN KEY (`IdProcheConf`) REFERENCES `proche` (`IdProche`),
  CONSTRAINT `patients_FK_pre` FOREIGN KEY (`IdProchePre`) REFERENCES `proche` (`IdProche`),
  CONSTRAINT `patients_FK_Proche` FOREIGN KEY (`IdProchePre`) REFERENCES `proche` (`IdProche`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'hhh','','hhhh','1999-03-12','hh',666,888,'hnbhbhbh','kkj@jj',0,100,99,787878),(1,'a','z','h','2002-03-21','55 ff',8080808,59599,'ffvfvfvvf','m@f.fr',0,94,93,852963),(2,'fcghj','fcgvhbjn','n','2003-09-09','gffg',55555,48848,'hbgfcd','dfcgv@kjhg',0,50,49,55554545),(1,'k','kkk','ttttt','2022-03-17','5 ttt',7887,77777,'treza','mm@llll.fr',1,92,91,123123123),(3,'poi','az','gg','2003-10-23','hhjj',2147483647,59980,'treza','max@outlook.fr',0,NULL,NULL,1234567890),(1,'aaa','aaa','aaaa','2008-10-23','sss',78787,7777,'ggg','gg@oo',1,46,45,44444444444),(1,'g','g','g','1986-03-13','hh',8888,666,'lkk','5jj@dd',0,98,97,99999999999),(1,'b','b','b','2000-05-04','rdrd',555555,44444,'hgygy','uhu@ju',0,96,95,741085209630),(1,'lkjhgf','juhg','hghjhj','0999-09-09','huggjgy5hygygy',808080880,59805,'azzer','jhuhu@kjuh',0,1,1,785412364785);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personnel` (
  `IdPersonnel` int NOT NULL AUTO_INCREMENT,
  `IdService` int DEFAULT NULL,
  `NomPersonnel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PrenomPersonnel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`IdPersonnel`),
  KEY `personnel_FK` (`IdService`),
  CONSTRAINT `personnel_FK` FOREIGN KEY (`IdService`) REFERENCES `roles` (`IdRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel`
--

LOCK TABLES `personnel` WRITE;
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
INSERT INTO `personnel` VALUES (1,1,'Telle','Maxens'),(2,3,'Moulin','Jean-Francois'),(3,2,'Verriez','Yassine'),(4,2,'Arthur','Bourst');
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piecesjointes`
--

DROP TABLE IF EXISTS `piecesjointes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piecesjointes` (
  `NumSecu` bigint NOT NULL,
  `CarteId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CarteVitale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CarteMutuel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LivretFamille` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AutorisationSoin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DecisionJuge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`NumSecu`),
  CONSTRAINT `piecesjointes_FK` FOREIGN KEY (`NumSecu`) REFERENCES `couverture_sociale` (`NumSecu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piecesjointes`
--

LOCK TABLES `piecesjointes` WRITE;
/*!40000 ALTER TABLE `piecesjointes` DISABLE KEYS */;
INSERT INTO `piecesjointes` VALUES (787878,'Id_Card_787878','mutuel_Card_787878','mutuel_Card_787878','0','0','0'),(123123123,'Id_Card_123123123','mutuel_Card_123123123','mutuel_Card_123123123','Livret_Famille_123123123','Id_Card_123123123','Id_Card_123123123');
/*!40000 ALTER TABLE `piecesjointes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proche`
--

DROP TABLE IF EXISTS `proche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proche` (
  `Prenom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Adresse` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Tel` int NOT NULL,
  `IdProche` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`IdProche`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proche`
--

LOCK TABLES `proche` WRITE;
/*!40000 ALTER TABLE `proche` DISABLE KEYS */;
INSERT INTO `proche` VALUES ('5 rue','70707070','Max',0,1),('78988','fgfgf','ggugy',0,39),('ghghg','gggy','jhygy',9899889,40),('qs','qs','555ffff',2020200,45),('xcxcxccxcxc','xcxcxccxcx','99oiiiiii',808228828,46),('5 rue','70707070','Max',0,47),('Max','Tel','5 rue',7070707,48),('5 rue','70707070','Max',0,49),('Max','tel','5 rue',7770,50),('d','d','d',7878,51),('54','78','78',45,52),('d','d','d',7878,53),('54','78','78',45,54),('d','d','d',7878,55),('54','78','78',45,56),('d','d','d',7878,57),('54','78','78',45,58),('d','d','d',7878,59),('54','78','78',45,60),('d','d','d',7878,61),('54','78','78',45,62),('d','d','d',7878,63),('54','78','78',45,64),('d','d','d',7878,65),('54','78','78',45,66),('d','d','d',7878,67),('54','78','78',45,68),('d','d','d',7878,69),('54','78','78',45,70),('d','d','d',7878,71),('54','78','78',45,72),('d','d','d',7878,73),('54','78','78',45,74),('d','d','d',7878,75),('54','78','78',45,76),('d','d','d',7878,77),('54','78','78',45,78),('d','d','d',7878,79),('54','78','78',45,80),('d','d','d',7878,81),('54','78','78',45,82),('d','d','d',7878,83),('54','78','78',45,84),('d','d','d',7878,85),('54','78','78',45,86),('d','d','d',7878,87),('54','78','78',45,88),('d','d','d',7878,89),('54','78','78',45,90),('d','d','d',7878,91),('54','78','78',45,92),('g','g','ubyb58',888888,93),('juij','jhuhu','gg5',555,94),('ft','tft','huh',88,95),('vc','hb','44hh',44,96),('rr','rrr','r7',88,97),('rrr','rrr','rr7',777,98),('','','',0,99),('nn','nnnnn','vv8',888,100);
/*!40000 ALTER TABLE `proche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `IdRole` int NOT NULL,
  `Libelle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`IdRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin'),(2,'Medecin'),(3,'Secretaire');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `IdUser` int NOT NULL,
  `Login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MDP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IdPersonnel` int NOT NULL,
  `IdRole` int DEFAULT NULL,
  PRIMARY KEY (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'yass','$argon2id$v=19$m=65536,t=4,p=1$Q0FHQXIyWk8yTGM4UmZJRA$DLlqvKBEWhA2iC1ZFp81utAsIvgb/XYPK6z1s/g6Wvk',3,2),(2,'max','$argon2id$v=19$m=65536,t=4,p=1$Q0FHQXIyWk8yTGM4UmZJRA$DLlqvKBEWhA2iC1ZFp81utAsIvgb/XYPK6z1s/g6Wvk',1,1),(3,'jf','$argon2id$v=19$m=65536,t=4,p=1$Q0FHQXIyWk8yTGM4UmZJRA$DLlqvKBEWhA2iC1ZFp81utAsIvgb/XYPK6z1s/g6Wvk',2,3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ap2'
--

--
-- Dumping routines for database 'ap2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-20 15:55:44
