CREATE DATABASE  IF NOT EXISTS `ludoteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ludoteca`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ludoteca
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `attivita`
--

DROP TABLE IF EXISTS `attivita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attivita` (
  `nome` varchar(20) NOT NULL,
  `sala` varchar(20) NOT NULL,
  `numIscritti` int NOT NULL DEFAULT '0',
  `costo` int NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attivita`
--

LOCK TABLES `attivita` WRITE;
/*!40000 ALTER TABLE `attivita` DISABLE KEYS */;
INSERT INTO `attivita` VALUES ('disegno','creatività',4,30),('gonfiabili','gioco',5,50),('ristorazione','pranzo',3,200),('teatro','creatività',4,40);
/*!40000 ALTER TABLE `attivita` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `attivita_BEFORE_INSERT` BEFORE INSERT ON `attivita` FOR EACH ROW BEGIN
IF( new.costo<=0) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Errore! Costo negativo o nullo';
END IF;

IF( new.sala NOT IN ('pranzo','creatività','gioco')) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Errore! Sala inesistente';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bambino`
--

DROP TABLE IF EXISTS `bambino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bambino` (
  `CF` char(16) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `eta` int NOT NULL,
  `genitore_CF` char(16) NOT NULL,
  PRIMARY KEY (`CF`),
  KEY `fk_bambino_genitore_idx` (`genitore_CF`),
  CONSTRAINT `fk_bambino_genitore` FOREIGN KEY (`genitore_CF`) REFERENCES `genitore` (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bambino`
--

LOCK TABLES `bambino` WRITE;
/*!40000 ALTER TABLE `bambino` DISABLE KEYS */;
INSERT INTO `bambino` VALUES ('BSCVLI17A41C351E','Viola','Boscarino',6,'GRDRSO83A41C351T'),('FNCCHR15C51C351S','Chiara','Finocchiaro',7,'FNCMRA68T24C351J'),('FNCCRL18M41C351S','Carla','Finocchiaro',7,'VRSGPP70B63C351D'),('GLISPN17S55C351A','Giulia','Spina',5,'SPNFPP85R18C351G'),('MMERSS14C49C351E','Emma','Rossi',6,'RBRRSS80D09C351V'),('NDRGGL18A07C351Z','Andrea','Giglio',5,'GGLFNC83S52C351G'),('RDLMTT18T16C351I','Mattia','Rodolico',4,'RCDMRA82R58C351A'),('VRDSMN14S18C351D','Simone','Verdi',9,'VRDLGU77L19C351O');
/*!40000 ALTER TABLE `bambino` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bambino_BEFORE_INSERT` BEFORE INSERT ON `bambino` FOR EACH ROW BEGIN
IF (new.eta<4 OR new.eta>10) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Eta non compresa tra i 4 e i 10 anni';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `calendario`
--

DROP TABLE IF EXISTS `calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendario` (
  `giorno` varchar(10) NOT NULL,
  `oraInizio` int NOT NULL,
  `oraFine` int NOT NULL,
  `attivita` varchar(20) NOT NULL,
  PRIMARY KEY (`giorno`,`attivita`),
  KEY `fk_calendario_attivita1_idx` (`attivita`),
  CONSTRAINT `fk_calendario_attivita1` FOREIGN KEY (`attivita`) REFERENCES `attivita` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
INSERT INTO `calendario` VALUES ('giovedì',15,17,'disegno'),('giovedì',17,20,'gonfiabili'),('giovedì',13,15,'ristorazione'),('lunedì',13,15,'ristorazione'),('lunedì',15,17,'teatro'),('martedì',15,17,'disegno'),('martedì',17,20,'gonfiabili'),('martedì',13,15,'ristorazione'),('mercoledì',15,17,'teatro'),('sabato',13,15,'ristorazione'),('venerdì',13,15,'ristorazione'),('venerdì',15,17,'teatro');
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `calendario_BEFORE_INSERT` BEFORE INSERT ON `calendario` FOR EACH ROW BEGIN
IF((new.oraInizio IN( SELECT oraInizio
                     FROM calendario
                     where giorno=new.giorno)) OR(new.oraInizio NOT IN (13,15,17)) OR (new.oraFine NOT IN (15,17,20)))THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Orario non disponibile';
        END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dipendente`
--

DROP TABLE IF EXISTS `dipendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dipendente` (
  `CF` varchar(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `stipendio` int NOT NULL,
  `tipo` varchar(15) NOT NULL,
  PRIMARY KEY (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dipendente`
--

LOCK TABLES `dipendente` WRITE;
/*!40000 ALTER TABLE `dipendente` DISABLE KEYS */;
INSERT INTO `dipendente` VALUES ('BSIFRC02D58C351W','Federica','Biuso',800,'animatore'),('LCCDRA96S16C351N','Dario','Licciardello',800,'animatore'),('PGLFRC90S57C351T','Federica','Puglisi',800,'animatore'),('SLVLSI02B43C351O','Lisa','Silvi',800,'animatore'),('TRVLGU98A01C351B','Luigi','Trovato',600,'cuoco'),('VGISMN00P58C351W','Simona','Vigo',600,'cuoco'),('VNTGDI90P55C351K','Giada','Ventura',600,'cuoco');
/*!40000 ALTER TABLE `dipendente` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `dipendente_BEFORE_INSERT` BEFORE INSERT ON `dipendente` FOR EACH ROW BEGIN
IF(new.stipendio<=0 )  THEN
SIGNAL SQLSTATE '45000' set message_text='Errore! Stipendio negativo';
END IF;

IF (new.tipo NOT IN ('cuoco','animatore'))THEN
SIGNAL SQLSTATE '45000' set message_text='Errore!Il tipo inserito non esiste';
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `genitore`
--

DROP TABLE IF EXISTS `genitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genitore` (
  `CF` char(16) NOT NULL,
  `cellulare` char(10) DEFAULT NULL,
  PRIMARY KEY (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genitore`
--

LOCK TABLES `genitore` WRITE;
/*!40000 ALTER TABLE `genitore` DISABLE KEYS */;
INSERT INTO `genitore` VALUES ('FNCMRA68T24C351J','3386272110'),('GGLFNC83S52C351G','3472605454'),('GRDRSO83A41C351T','3456679011'),('RBRRSS80D09C351V','3397225531'),('RCDMRA82R58C351A','3567714629'),('SPNFPP85R18C351G','2688935314'),('VRDLGU77L19C351O','3627827730'),('VRSGPP70B63C351D','3333877491');
/*!40000 ALTER TABLE `genitore` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `genitore_BEFORE_INSERT` BEFORE INSERT ON `genitore` FOR EACH ROW BEGIN
IF (new.CF IN (select g.CF from genitore g)) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Genitore già presente';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `gestione`
--

DROP TABLE IF EXISTS `gestione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestione` (
  `attivita` varchar(20) NOT NULL,
  `dipendente` varchar(20) NOT NULL,
  PRIMARY KEY (`attivita`,`dipendente`),
  KEY `fk_attivita_has_dipendente_dipendente1_idx` (`dipendente`),
  KEY `fk_attivita_has_dipendente_attivita1_idx` (`attivita`),
  CONSTRAINT `fk_attivita_has_dipendente_attivita1` FOREIGN KEY (`attivita`) REFERENCES `attivita` (`nome`),
  CONSTRAINT `fk_attivita_has_dipendente_dipendente1` FOREIGN KEY (`dipendente`) REFERENCES `dipendente` (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestione`
--

LOCK TABLES `gestione` WRITE;
/*!40000 ALTER TABLE `gestione` DISABLE KEYS */;
INSERT INTO `gestione` VALUES ('disegno','BSIFRC02D58C351W'),('teatro','LCCDRA96S16C351N'),('gonfiabili','PGLFRC90S57C351T'),('gonfiabili','SLVLSI02B43C351O'),('ristorazione','TRVLGU98A01C351B'),('ristorazione','VGISMN00P58C351W'),('ristorazione','VNTGDI90P55C351K');
/*!40000 ALTER TABLE `gestione` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gestione_BEFORE_INSERT` BEFORE INSERT ON `gestione` FOR EACH ROW BEGIN
IF ( (new.attivita NOT IN ('ristorazione')) AND (new.dipendente IN (SELECT d.CF FROM dipendente d where d.tipo='cuoco' ))) THEN
 SIGNAL SQLSTATE '45000' SET message_text='I cuochi gestiscono solo la ristorazione';
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `iscrizione`
--

DROP TABLE IF EXISTS `iscrizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iscrizione` (
  `bambino` char(16) NOT NULL,
  `attivita` varchar(20) NOT NULL,
  PRIMARY KEY (`bambino`,`attivita`),
  KEY `fk_bambino_has_attivita_attivita1_idx` (`attivita`),
  KEY `fk_bambino_has_attivita_bambino1_idx` (`bambino`),
  CONSTRAINT `fk_bambino_has_attivita_attivita1` FOREIGN KEY (`attivita`) REFERENCES `attivita` (`nome`),
  CONSTRAINT `fk_bambino_has_attivita_bambino1` FOREIGN KEY (`bambino`) REFERENCES `bambino` (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iscrizione`
--

LOCK TABLES `iscrizione` WRITE;
/*!40000 ALTER TABLE `iscrizione` DISABLE KEYS */;
INSERT INTO `iscrizione` VALUES ('BSCVLI17A41C351E','gonfiabili'),('FNCCHR15C51C351S','ristorazione'),('FNCCHR15C51C351S','teatro'),('FNCCRL18M41C351S','ristorazione'),('FNCCRL18M41C351S','teatro'),('GLISPN17S55C351A','disegno'),('GLISPN17S55C351A','gonfiabili'),('GLISPN17S55C351A','teatro'),('MMERSS14C49C351E','ristorazione'),('MMERSS14C49C351E','teatro'),('NDRGGL18A07C351Z','disegno'),('NDRGGL18A07C351Z','gonfiabili'),('RDLMTT18T16C351I','disegno'),('RDLMTT18T16C351I','gonfiabili'),('VRDSMN14S18C351D','disegno'),('VRDSMN14S18C351D','gonfiabili');
/*!40000 ALTER TABLE `iscrizione` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `iscrizione_AFTER_INSERT` AFTER INSERT ON `iscrizione` FOR EACH ROW BEGIN
UPDATE attivita
set numIscritti=numIscritti+1
WHERE nome=new.attivita;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'ludoteca'
--

--
-- Dumping routines for database 'ludoteca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-23 18:01:14
