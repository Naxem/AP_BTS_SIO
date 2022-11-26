-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: ap
-- ------------------------------------------------------
-- Server version	8.0.27

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
  `idCiv` int NOT NULL AUTO_INCREMENT,
  `Labelle` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idCiv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
-- Table structure for table `couverturesociale`
--

DROP TABLE IF EXISTS `couverturesociale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `couverturesociale` (
  `NomSecu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NumSecu` bigint NOT NULL,
  `Assurance` tinyint(1) DEFAULT NULL,
  `ALD` tinyint(1) DEFAULT NULL,
  `NomMutu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NumAdherent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TypeChambre` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`NumSecu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couverturesociale`
--

LOCK TABLES `couverturesociale` WRITE;
/*!40000 ALTER TABLE `couverturesociale` DISABLE KEYS */;
INSERT INTO `couverturesociale` VALUES ('hvfuovbubvfuiovbbvfiub',161616161,0,NULL,'bducbibubdubc','8489454584',0),('cddccdcdcdccdccd',559595959,0,NULL,'cdcdcccdcdcdcdcdccddcdcdcd','7878778788778',0),('jsp',1515478963,NULL,0,'uubu','899445456545',1),('jsp',1515478969,NULL,0,'uubu','899445456545',1);
/*!40000 ALTER TABLE `couverturesociale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospi`
--

DROP TABLE IF EXISTS `hospi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospi` (
  `DateHospi` date DEFAULT NULL,
  `HeureHospi` time DEFAULT NULL,
  `PreAdd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IdPersonnel` int DEFAULT NULL,
  `NumSecu` bigint DEFAULT NULL,
  KEY `Hospi_FK_1` (`IdPersonnel`),
  KEY `hospi_FK` (`NumSecu`),
  CONSTRAINT `hospi_FK` FOREIGN KEY (`NumSecu`) REFERENCES `couverturesociale` (`NumSecu`),
  CONSTRAINT `Hospi_FK_1` FOREIGN KEY (`IdPersonnel`) REFERENCES `personnel` (`IdPersonnel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospi`
--

LOCK TABLES `hospi` WRITE;
/*!40000 ALTER TABLE `hospi` DISABLE KEYS */;
INSERT INTO `hospi` VALUES (NULL,NULL,'nn',1,NULL),('0000-00-00','00:20:22','09:10',2,NULL);
/*!40000 ALTER TABLE `hospi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `Civ` int DEFAULT NULL,
  `NomNaissance` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NomEpouse` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PrenomPatient` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NaissancePatient` date DEFAULT NULL,
  `AdressePatient` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TelPatient` int DEFAULT NULL,
  `CPPatient` int DEFAULT NULL,
  `VillePatient` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MailPatient` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Mineur` tinyint(1) DEFAULT NULL,
  `IdProcheConf` int DEFAULT NULL,
  `NumSecu` bigint NOT NULL,
  `idProchePre` int DEFAULT NULL,
  PRIMARY KEY (`NumSecu`),
  KEY `patients_FK_4` (`idProchePre`),
  KEY `patients_FK_2` (`IdProcheConf`),
  KEY `patients_FK_1` (`Civ`),
  CONSTRAINT `patients_FK` FOREIGN KEY (`NumSecu`) REFERENCES `couverturesociale` (`NumSecu`),
  CONSTRAINT `patients_FK_1` FOREIGN KEY (`Civ`) REFERENCES `civ` (`idCiv`),
  CONSTRAINT `patients_FK_2` FOREIGN KEY (`IdProcheConf`) REFERENCES `proche` (`IdProche`),
  CONSTRAINT `patients_FK_4` FOREIGN KEY (`idProchePre`) REFERENCES `proche` (`IdProche`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'tel','telle','maxens',NULL,'ffg',808440,NULL,NULL,NULL,0,1,1515478963,1),(1,'telle','telle','max','0000-00-00','fefe',78808058,59,'trois','max@out.fr',0,1,1515478969,1);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personnel` (
  `IdServices` int DEFAULT NULL,
  `NomPersonnel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PrenomPersonnel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IdPersonnel` int NOT NULL,
  PRIMARY KEY (`IdPersonnel`),
  KEY `Personnel_FK` (`IdServices`),
  CONSTRAINT `personnel_FK` FOREIGN KEY (`IdServices`) REFERENCES `services` (`IdServices`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel`
--

LOCK TABLES `personnel` WRITE;
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
INSERT INTO `personnel` VALUES (1,'telle','maxens',1),(1,'azerty','ytreza',2);
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piecesjointes`
--

DROP TABLE IF EXISTS `piecesjointes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piecesjointes` (
  `CarteId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CarteVitale` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CarteMutuel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `LivretFamille` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AutorisationSoin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DecisionJuge` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NumSecu` bigint NOT NULL,
  PRIMARY KEY (`NumSecu`),
  CONSTRAINT `piecesjointes_FK` FOREIGN KEY (`NumSecu`) REFERENCES `couverturesociale` (`NumSecu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piecesjointes`
--

LOCK TABLES `piecesjointes` WRITE;
/*!40000 ALTER TABLE `piecesjointes` DISABLE KEYS */;
INSERT INTO `piecesjointes` VALUES ('img','img2','img3','img4','img5','',1515478963);
/*!40000 ALTER TABLE `piecesjointes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proche`
--

DROP TABLE IF EXISTS `proche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proche` (
  `Tel` int DEFAULT NULL,
  `Adresse` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Prenom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IdProche` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`IdProche`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proche`
--

LOCK TABLES `proche` WRITE;
/*!40000 ALTER TABLE `proche` DISABLE KEYS */;
INSERT INTO `proche` VALUES (0,'gf','455555555','fghjk',1),(782927930,'10 du bouleet','tel','max',2),(0,'po','85858585','qsdfghj',3),(0,'aqaqaqaqaaqa','28727827828','vfdfvgbhgngtrf',4),(0,'bgtbgtrbttbtr','1417328','bgbgbfvbfbfbf',5),(0,'ssz','559',' fvfvv',6),(0,'vfvfvr','59559595','vfvrvrvrv95',7),(444444,'','','',8),(0,'','','',9),(0,'bgbg','bgbggfgf g','bgbthbtbty',10),(0,'bgbgbyt','96969','gbbyhyu',11);
/*!40000 ALTER TABLE `proche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `IdServices` int NOT NULL AUTO_INCREMENT,
  `NomService` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`IdServices`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Test');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `login` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MDP` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('test','1','az');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ap'
--

--
-- Dumping routines for database 'ap'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-26 16:04:40
