CREATE DATABASE  IF NOT EXISTS `heroku_48f0b55a01c5202` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `heroku_48f0b55a01c5202`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: us-cdbr-east-05.cleardb.net    Database: heroku_48f0b55a01c5202
-- ------------------------------------------------------
-- Server version	5.6.50-log

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
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form` (
  `idForm` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `answer1` varchar(30) NOT NULL,
  `answer2` varchar(30) NOT NULL,
  `answer3` varchar(30) NOT NULL,
  PRIMARY KEY (`idForm`)
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
INSERT INTO `form` VALUES (224,'Yes','Yes','Some of them'),(234,'No','Some of them','Yes'),(244,'No','Some of them','Some of them'),(254,'Yes','No','Yes'),(274,'Yes','Yes','Yes'),(284,'No','Some of them','No'),(294,'Yes','Yes','Yes'),(304,'Yes','Yes','Yes'),(314,'No','Some of them','Some of them'),(324,'Yes','No','Some of them'),(334,'Yes','Some of them','Some of them'),(344,'No','No','No'),(354,'Yes','Yes','Yes'),(364,'Yes','Yes','Yes'),(374,'Yes','Yes','Yes'),(384,'Yes','No','No'),(394,'No','No','No'),(404,'Yes','Some of them','Some of them'),(414,'No','Some of them','Some of them'),(424,'Yes','Some of them','No'),(434,'Yes','Yes','Yes');
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamerun`
--

DROP TABLE IF EXISTS `gamerun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamerun` (
  `idGameRun` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` int(10) unsigned NOT NULL,
  `idLevel` int(10) unsigned NOT NULL,
  `score` float NOT NULL,
  `deaths` int(11) NOT NULL,
  `tries` int(11) NOT NULL,
  PRIMARY KEY (`idGameRun`),
  KEY `idUser` (`idUser`),
  KEY `idLevel` (`idLevel`),
  CONSTRAINT `gamerun_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`),
  CONSTRAINT `gamerun_ibfk_2` FOREIGN KEY (`idLevel`) REFERENCES `level` (`idLevel`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamerun`
--

LOCK TABLES `gamerun` WRITE;
/*!40000 ALTER TABLE `gamerun` DISABLE KEYS */;
INSERT INTO `gamerun` VALUES (24,84,4,80,5,3),(44,94,14,100,2,4),(54,94,24,60,9,5),(64,164,24,70,3,6),(74,194,4,30,5,1),(84,274,14,70,2,5),(94,144,4,80,7,8),(104,154,24,90,1,6),(114,154,24,20,8,2),(124,184,4,40,5,3),(134,214,14,50,5,3),(144,264,14,20,8,4),(154,294,24,10,9,7),(164,174,4,60,4,3),(184,84,4,70,3,6),(194,94,24,80,2,6),(204,134,14,80,2,9),(214,204,4,60,4,2),(224,184,24,90,1,6),(234,154,4,100,1,9),(244,164,14,90,4,3);
/*!40000 ALTER TABLE `gamerun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level` (
  `idLevel` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `levelName` varchar(30) NOT NULL,
  `avgScore` float NOT NULL,
  `totalDeaths` int(11) NOT NULL,
  `totalTries` int(11) NOT NULL,
  `amountGameRuns` int(11) NOT NULL,
  PRIMARY KEY (`idLevel`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (4,'Mountains',65,34,38,8),(14,'The City',64,19,25,5),(24,'North Pole',60,33,38,7);
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(30) NOT NULL,
  `userType` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` char(1) NOT NULL,
  `idForm` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `email` (`email`),
  KEY `idForm` (`idForm`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`idForm`) REFERENCES `form` (`idForm`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (84,'Marco','Torres','marcotorres258@gmail.com','123123','Player',19,'M',224),(94,'Alvaro','García','alvarogarcia@gmail.com','123123','Player',19,'M',234),(104,'Salo','Dabbha','salodabbha@gmail.com','123123','Player',20,'M',244),(114,'Diego','Araque','diegoaraque@gmail.com','123123','Player',20,'M',254),(134,'Sandra','Castro','sandracastro@gmail.com','123123','PAS Admin',22,'F',274),(144,'Paul','Fernandez','paulfernandez@hotmail.com','60360924','Player',18,'M',284),(154,'Pablo','Hernandez','pablohernandez@yahoo.com','n983-ryhus','PAS Admin',25,'O',294),(164,'Jorge','DeSousa','JorgeSousa@hotmail.com','936ey02yh','PAS Admin',30,'M',304),(174,'Cristina ','Vazquez','cristinavazquez@gmail.com','893yf97db','Player',27,'F',314),(184,'Ana','Herrero','anaherrero@gmail.com','08ghdpadb-d','Player',19,'F',324),(194,'Sergio','Villalobos','sergiovillalobos@hotmail.com','bdiybeiyb72','Player',22,'M',334),(204,'Cristiano','Ronaldo','cr7@gmail.com','cr7-bchebc','Player',37,'M',344),(214,'Javier','villanueva','javiVilla@hotmail.com','nb8370d','Player',21,'O',354),(224,'Iker','Torres','ikersin@hotmail.com','98duuda','PAS Admin',27,'M',364),(244,'Diego','Fernandez','diego234@gmail.com','ibbdyibe291e','Player',21,'M',384),(254,'Luis','Ocampo','lucho@icloud.com','inodun212e','Player',21,'O',394),(264,'Carlos','Orfao','carlitosOrfao@gmail.com','kbhebhb23','Player',24,'M',404),(274,'Maria','Alvarez','mariaA@icloud.com','jkndij3b2i','Player',24,'F',414),(284,'Adriana','Schneider','adrianaSchneider@gmail.com','jneib3hi24b','Player',19,'F',424),(294,'Claudia','Martin','claudiaMartin@hotmai.com','jneib3i2rb','PAS Admin',28,'F',434);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'heroku_48f0b55a01c5202'
--

--
-- Dumping routines for database 'heroku_48f0b55a01c5202'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-22 19:45:29
