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
) ENGINE=InnoDB AUTO_INCREMENT=584 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
INSERT INTO `form` VALUES (224,'Yes','Yes','Some of them'),(234,'No','Some of them','Yes'),(244,'No','Some of them','Some of them'),(254,'Yes','No','Yes'),(274,'Yes','Yes','Yes'),(284,'No','Some of them','No'),(294,'Yes','Yes','Yes'),(304,'Yes','Yes','Yes'),(314,'No','Some of them','Some of them'),(324,'Yes','No','Some of them'),(334,'Yes','Some of them','Some of them'),(344,'No','No','No'),(354,'Yes','Yes','Yes'),(364,'Yes','Yes','Yes'),(374,'Yes','Yes','Yes'),(384,'Yes','No','No'),(394,'No','No','No'),(404,'Yes','Some of them','Some of them'),(414,'No','Some of them','Some of them'),(424,'Yes','Some of them','No'),(434,'Yes','Yes','Yes'),(444,'A little bit','Some of them','No'),(454,'Yes','Yes','Yes'),(464,'A little bit','Some of them','Some of them'),(474,'Yes','Yes','Yes'),(484,'Yes','Yes','Yes'),(494,'Yes','No','Yes'),(504,'No','Yes','Yes'),(514,'Yes','Some of them','No'),(524,'No','No','No'),(534,'Yes','Yes','Yes'),(544,'A little bit','No','No'),(554,'A little bit','Yes','Yes'),(564,'A little bit','Yes','Yes'),(574,'A little bit','Yes','Yes');
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
) ENGINE=InnoDB AUTO_INCREMENT=1294 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamerun`
--

LOCK TABLES `gamerun` WRITE;
/*!40000 ALTER TABLE `gamerun` DISABLE KEYS */;
INSERT INTO `gamerun` VALUES (694,324,4,60,4,1),(704,324,4,70,3,1),(714,324,4,100,0,1),(724,324,4,50,5,1),(734,324,4,80,2,1),(744,324,14,10,9,1),(754,324,14,10,9,1),(764,324,14,60,4,1),(774,324,14,30,7,2),(784,324,14,20,8,2),(794,324,24,20,8,2),(804,324,24,20,8,1),(814,324,24,40,6,1),(824,324,24,10,9,1),(834,324,24,30,7,1),(844,134,4,80,2,0),(854,134,24,40,6,1),(864,134,4,80,2,1),(874,134,14,30,7,2),(884,94,14,10,9,0),(894,94,24,70,3,1),(904,134,4,30,7,1),(914,94,14,30,7,1),(924,94,14,50,5,1),(934,94,14,80,2,1),(944,324,4,100,0,1),(954,324,14,20,8,3),(964,324,24,10,9,1),(974,324,24,30,7,1),(984,324,4,100,0,4),(994,324,14,10,9,2),(1004,324,24,20,8,1),(1014,324,24,20,8,1),(1024,324,24,40,6,1),(1034,324,4,90,1,1),(1044,324,4,40,6,2),(1054,324,14,50,5,2),(1064,324,14,80,2,1),(1074,324,24,30,7,1),(1084,324,24,50,5,1),(1094,134,4,80,2,1),(1104,94,24,20,8,3),(1114,134,24,50,5,1),(1124,374,24,30,7,1),(1134,324,24,20,8,3),(1144,324,4,100,0,1),(1154,324,4,80,2,1),(1164,324,4,100,0,1),(1174,384,4,20,8,0),(1184,384,24,20,8,2),(1194,374,24,80,2,1),(1204,374,24,50,5,2),(1214,134,4,60,4,0),(1224,134,4,40,6,1),(1234,394,4,80,2,1),(1244,394,4,90,1,2),(1254,394,24,30,7,1),(1264,324,4,100,0,0),(1274,324,4,20,8,1),(1284,324,4,60,4,1);
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
INSERT INTO `level` VALUES (4,'Mountains',71.2,72,25,25),(14,'The City',35,91,20,14),(24,'North Pole',33.1818,147,29,22);
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `level1_performance`
--

DROP TABLE IF EXISTS `level1_performance`;
/*!50001 DROP VIEW IF EXISTS `level1_performance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `level1_performance` AS SELECT 
 1 AS `Name of the Level`,
 1 AS `Player`,
 1 AS `Score`,
 1 AS `Level 1 avg score`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `level2_performance`
--

DROP TABLE IF EXISTS `level2_performance`;
/*!50001 DROP VIEW IF EXISTS `level2_performance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `level2_performance` AS SELECT 
 1 AS `Name of the Level`,
 1 AS `Player`,
 1 AS `Score`,
 1 AS `Level 2 avg score`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `level3_performance`
--

DROP TABLE IF EXISTS `level3_performance`;
/*!50001 DROP VIEW IF EXISTS `level3_performance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `level3_performance` AS SELECT 
 1 AS `Name of the Level`,
 1 AS `Player`,
 1 AS `Score`,
 1 AS `Level 3 avg score`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `level_performance`
--

DROP TABLE IF EXISTS `level_performance`;
/*!50001 DROP VIEW IF EXISTS `level_performance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `level_performance` AS SELECT 
 1 AS `Name of the Level`,
 1 AS `player`,
 1 AS `Score`,
 1 AS `Avg score of the level`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `players_answers`
--

DROP TABLE IF EXISTS `players_answers`;
/*!50001 DROP VIEW IF EXISTS `players_answers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `players_answers` AS SELECT 
 1 AS `name`,
 1 AS `lastName`,
 1 AS `age`,
 1 AS `answer1`,
 1 AS `answer2`,
 1 AS `answer3`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (84,'Marco','Torres','marcotorres258@gmail.com','123123','Player',19,'M',224),(94,'Alvaro','García','alvarogarcia@gmail.com','123123','Player',19,'M',234),(104,'Salo','Dabbha','salodabbha@gmail.com','123123','Player',20,'M',244),(114,'Diego','Araque','diegoaraque@gmail.com','123123','Player',20,'M',254),(134,'Sandra','Castro','sandracastro@gmail.com','123123','PAS Admin',22,'F',274),(144,'Paul','Fernandez','paulfernandez@hotmail.com','60360924','Player',18,'M',284),(154,'Pablo','Hernandez','pablohernandez@yahoo.com','n983-ryhus','PAS Admin',25,'O',294),(164,'Jorge','DeSousa','JorgeSousa@hotmail.com','936ey02yh','PAS Admin',30,'M',304),(174,'Cristina ','Vazquez','cristinavazquez@gmail.com','893yf97db','Player',27,'F',314),(184,'Ana','Herrero','anaherrero@gmail.com','08ghdpadb-d','Player',19,'F',324),(194,'Sergio','Villalobos','sergiovillalobos@hotmail.com','bdiybeiyb72','Player',22,'M',334),(204,'Cristiano','Ronaldo','cr7@gmail.com','cr7-bchebc','Player',37,'M',344),(214,'Javier','villanueva','javiVilla@hotmail.com','nb8370d','Player',21,'O',354),(224,'Iker','Torres','ikersin@hotmail.com','98duuda','PAS Admin',27,'M',364),(244,'Diego','Fernandez','diego234@gmail.com','ibbdyibe291e','Player',21,'M',384),(254,'Luis','Ocampo','lucho@icloud.com','inodun212e','Player',21,'O',394),(264,'Carlos','Orfao','carlitosOrfao@gmail.com','kbhebhb23','Player',24,'M',404),(274,'Maria','Alvarez','mariaA@icloud.com','jkndij3b2i','Player',24,'F',414),(284,'Adriana','Schneider','adrianaSchneider@gmail.com','jneib3hi24b','Player',19,'F',424),(294,'Claudia','Martin','claudiaMartin@hotmai.com','jneib3i2rb','PAS Admin',28,'F',434),(304,'Ximena','Parra','ximeparra@gmail.com','123123','Player',27,'F',444),(314,'Salomon','Dabbah Beracha','salomondabbh@gmail.com','Beathop123','Player',20,'M',454),(324,'Diego','Arawhat','diego.araque.fernandez@hotmail.com','Pebble88.','PAS Admin',20,'M',464),(344,'Salomon','Dabbah Beracha','salomonspam@gmail.com','Beathop123','Player',20,'M',484),(354,'Diego','Álvarez','diegoalvarez@gmail.com','123123','Player',15,'M',494),(364,'Antonio','Sepúlveda','antoniosep@gmail.com','123123','Player',19,'M',504),(374,'Peter ','Johnson','test_email@gmail.com','123123','PAS Admin',25,'M',514),(384,'Uriel ','Aguilar','uriel@mail.com','1234','Player',20,'M',524),(394,'hola','test','test@gmail.com','123123','PAS Admin',20,'M',534),(414,'Sebastian','Gonzalez','a01029746@itesm.mx','12345','Player',20,'F',554);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'heroku_48f0b55a01c5202'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddGameRun` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`b48bd5b8cc1254`@`%` PROCEDURE `AddGameRun`(
	IN idUser INT,
    IN idLevel INT,
    IN score FLOAT,
    IN deaths INT,
    IN tries INT
)
BEGIN
	INSERT INTO GameRun (idUser, idLevel, score, deaths, tries) VALUES
    (idUser, idLevel, score, deaths, tries);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CountAnswers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`b48bd5b8cc1254`@`%` PROCEDURE `CountAnswers`()
BEGIN
	
	SELECT 
		-- Count answers from question 1
		COUNT(IF (answer1 = 'Yes', 1, NULL) ) 'Q1_A1',
		COUNT(IF (answer1 = 'A little bit', 1, NULL) ) 'Q1_A2',
		COUNT(IF (answer1 = 'No', 1, NULL) ) 'Q1_A3',
		-- Count answers from question 2
		COUNT(IF (answer2 = 'Yes', 1, NULL) ) 'Q2_A1',
		COUNT(IF (answer2 = 'Some of them', 1, NULL) ) 'Q2_A2',
		COUNT(IF (answer2 = 'No', 1, NULL) ) 'Q2_A3',
		-- Count answers from question 3
		COUNT(IF (answer3 = 'Yes', 1, NULL) ) 'Q3_A1',
		COUNT(IF (answer3 = 'Some of them', 1, NULL) ) 'Q3_A2',
		COUNT(IF (answer3 = 'No', 1, NULL) ) 'Q3_A3'
	FROM form;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ScoresPerAnswer1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`b48bd5b8cc1254`@`%` PROCEDURE `ScoresPerAnswer1`(
	IN answer VARCHAR(100)
)
BEGIN
	SELECT 
		u.name AS 'Player',
		score AS 'Score',
        f.answer1 AS 'Have you played any percussion instrument?'
    FROM 
		form AS f
			INNER JOIN
		user AS u on f.idForm = u.idForm
			INNER JOIN
		gamerun on gamerun.idUser = u.idUser
	WHERE
		f.answer1 = answer;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ScoresPerAnswer2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`b48bd5b8cc1254`@`%` PROCEDURE `ScoresPerAnswer2`(
	IN answer VARCHAR(100)
)
BEGIN
	SELECT 
		u.name AS 'Player',
		score AS 'Score',
        f.answer2 AS 'Can you identify musical notes?'
    FROM 
		form AS f
			INNER JOIN
		user AS u on f.idForm = u.idForm
			INNER JOIN
		gamerun on gamerun.idUser = u.idUser
	WHERE
		f.answer2 = answer;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ScoresPerAnswer3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`b48bd5b8cc1254`@`%` PROCEDURE `ScoresPerAnswer3`(
	IN answer VARCHAR(100)
)
BEGIN
	SELECT 
		u.name AS 'Player',
		score AS 'Score',
        f.answer3 AS 'Can you identify the tempo of every note?'
    FROM 
		form AS f
			INNER JOIN
		user AS u on f.idForm = u.idForm
			INNER JOIN
		gamerun on gamerun.idUser = u.idUser
	WHERE
		f.answer3 = answer;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `level1_performance`
--

/*!50001 DROP VIEW IF EXISTS `level1_performance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`b48bd5b8cc1254`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `level1_performance` AS select `l`.`levelName` AS `Name of the Level`,concat(`u`.`name`,' ',`u`.`lastName`) AS `Player`,`gr`.`score` AS `Score`,`l`.`avgScore` AS `Level 1 avg score` from ((`level` `l` join `gamerun` `gr` on((`l`.`idLevel` = `gr`.`idLevel`))) join `user` `u` on((`u`.`idUser` = `gr`.`idUser`))) where (`gr`.`idLevel` = 4) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `level2_performance`
--

/*!50001 DROP VIEW IF EXISTS `level2_performance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`b48bd5b8cc1254`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `level2_performance` AS select `l`.`levelName` AS `Name of the Level`,concat(`u`.`name`,' ',`u`.`lastName`) AS `Player`,`gr`.`score` AS `Score`,`l`.`avgScore` AS `Level 2 avg score` from ((`level` `l` join `gamerun` `gr` on((`l`.`idLevel` = `gr`.`idLevel`))) join `user` `u` on((`u`.`idUser` = `gr`.`idUser`))) where (`gr`.`idLevel` = 14) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `level3_performance`
--

/*!50001 DROP VIEW IF EXISTS `level3_performance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`b48bd5b8cc1254`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `level3_performance` AS select `l`.`levelName` AS `Name of the Level`,concat(`u`.`name`,' ',`u`.`lastName`) AS `Player`,`gr`.`score` AS `Score`,`l`.`avgScore` AS `Level 3 avg score` from ((`level` `l` join `gamerun` `gr` on((`l`.`idLevel` = `gr`.`idLevel`))) join `user` `u` on((`u`.`idUser` = `gr`.`idUser`))) where (`gr`.`idLevel` = 24) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `level_performance`
--

/*!50001 DROP VIEW IF EXISTS `level_performance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`b48bd5b8cc1254`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `level_performance` AS select `l`.`levelName` AS `Name of the Level`,concat(`u`.`name`,' ',`u`.`lastName`) AS `player`,`gr`.`score` AS `Score`,`l`.`avgScore` AS `Avg score of the level` from ((`level` `l` join `gamerun` `gr` on((`l`.`idLevel` = `gr`.`idLevel`))) join `user` `u` on((`u`.`idUser` = `gr`.`idUser`))) where ((`gr`.`idLevel` = 4) or (`gr`.`idLevel` = 14) or (`gr`.`idLevel` = 24)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `players_answers`
--

/*!50001 DROP VIEW IF EXISTS `players_answers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`b48bd5b8cc1254`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `players_answers` AS select `user`.`name` AS `name`,`user`.`lastName` AS `lastName`,`user`.`age` AS `age`,`form`.`answer1` AS `answer1`,`form`.`answer2` AS `answer2`,`form`.`answer3` AS `answer3` from (`user` join `form` on((`user`.`idForm` = `form`.`idForm`))) */;
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

-- Dump completed on 2022-05-06 14:18:40
