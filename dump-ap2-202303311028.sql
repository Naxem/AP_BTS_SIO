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
INSERT INTO `couverture_sociale` VALUES (111,'CPAM',1,0,'viaMedis','44848451782',0),(1112,'CPAM',1,1,'viaMedis','44846644644',1);
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
  `Etat` tinyint NOT NULL,
  PRIMARY KEY (`NumSecu`),
  KEY `hospi_FK_1` (`IdPersonnel`),
  CONSTRAINT `hospi_FK` FOREIGN KEY (`NumSecu`) REFERENCES `couverture_sociale` (`NumSecu`),
  CONSTRAINT `hospi_FK_1` FOREIGN KEY (`IdPersonnel`) REFERENCES `personnel` (`IdPersonnel`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospi`
--

LOCK TABLES `hospi` WRITE;
/*!40000 ALTER TABLE `hospi` DISABLE KEYS */;
INSERT INTO `hospi` VALUES (111,2,'1','09:09:00','2024-05-26',0),(1112,2,'1','09:09:00','2024-05-26',0);
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
  CONSTRAINT `logs_FK_1` FOREIGN KEY (`idRole`) REFERENCES `roles` (`IdRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES ('Tentative de conexion de l\'utilisateur (Capchat non conforme)','2023-03-31',2,'08:54:27',3),('Conexion de l\'utilisateur','2023-03-31',2,'08:54:51',3),('Conexion de l\'utilisateur','2023-03-31',2,'09:01:08',3),('Tentative de conexion de l\'utilisateur (Capchat non conforme)','2023-03-31',2,'09:26:04',3),('Tentative de conexion de l\'utilisateur (Capchat non conforme)','2023-03-31',2,'09:27:13',3),('Tentative de conexion de l\'utilisateur (Capchat non conforme)','2023-03-31',2,'09:29:35',3),('Conexion de l\'utilisateur','2023-03-31',2,'09:29:53',3),('Conexion de l\'utilisateur','2023-03-31',2,'09:33:50',3);
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
INSERT INTO `patients` VALUES (1,'Depond','Moulin','Mathéo','2003-06-26','10 rue de france',789695030,24879,'trouville','max@gmail.com',0,1,2,111),(2,'Bourst','','Marie','2015-05-22','5 rue des hirondelles',650307850,24879,'trouville','b.marie@hotmail.fr',1,3,3,1112);
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
  `roles` int NOT NULL,
  PRIMARY KEY (`IdPersonnel`),
  KEY `personnel_FK` (`IdService`),
  KEY `personnel_FK_1` (`roles`),
  CONSTRAINT `personnel_FK` FOREIGN KEY (`IdService`) REFERENCES `services` (`idService`),
  CONSTRAINT `personnel_FK_1` FOREIGN KEY (`roles`) REFERENCES `roles` (`IdRole`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel`
--

LOCK TABLES `personnel` WRITE;
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
INSERT INTO `personnel` VALUES (1,1,'Moulin','JF',3),(2,2,'Arthur','Bourst',3);
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
INSERT INTO `piecesjointes` VALUES (111,'Id_Card_111','mutuel_Card_111','mutuel_Card_111','0','0','0'),(1112,'Id_Card_1112','mutuel_Card_1112','mutuel_Card_1112','Livret_Famille_1112','Id_Card_1112','Id_Card_1112');
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
INSERT INTO `proche` VALUES ('Max','Tel','20 rue du lila',785986540,1),('Nicolas','Dupond','5 rue des champignion',650620444,2),('Audrey','Dupond','5 rue des champignion',650320477,3);
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
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `idService` int NOT NULL,
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idService`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'neurologue'),(2,'medecin');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `IdUser` int NOT NULL AUTO_INCREMENT,
  `Login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MDP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IdPersonnel` int NOT NULL,
  `IdRole` int DEFAULT NULL,
  PRIMARY KEY (`IdUser`),
  KEY `user_FK` (`IdRole`),
  CONSTRAINT `user_FK` FOREIGN KEY (`IdRole`) REFERENCES `roles` (`IdRole`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'yassine.verriez','$argon2id$v=19$m=65536,t=4,p=1$V2hmdi94cXJLQ0hKcnRXUg$Tv96Kl1z+2wCr9RERR4jntM8EhX0/vJwI2DMkYjsmms',3,1),(2,'maxens.telle','$argon2id$v=19$m=65536,t=4,p=1$N3VPalZ5bmRVZnhQWlMxSg$xx+eSkqG6/kMvXVAfEv4k3RK/hTylQlSyBjbQEhCz0Y',1,3),(3,'JF.moulin','$argon2id$v=19$m=65536,t=4,p=1$VnNlWHVTUDRrTFRQY2hJYg$b9Eeuqfo83B61FIAMBRwB1argvxlGBny7MCQnSN4HSw',2,2);
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

-- Dump completed on 2023-03-31 10:28:03
