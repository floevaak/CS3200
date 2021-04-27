-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: amusement_design
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `rides`
--

DROP TABLE IF EXISTS `rides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rides` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `height_rq` int NOT NULL,
  `capacity_per_ride` int NOT NULL,
  `operation_status` bit(1) NOT NULL,
  `park_id` int NOT NULL,
  `thrill_id` int NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `park_id` (`park_id`),
  KEY `thrill_id` (`thrill_id`),
  CONSTRAINT `rides_ibfk_1` FOREIGN KEY (`park_id`) REFERENCES `parks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rides_ibfk_2` FOREIGN KEY (`thrill_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rides`
--

LOCK TABLES `rides` WRITE;
/*!40000 ALTER TABLE `rides` DISABLE KEYS */;
INSERT INTO `rides` VALUES (1,'Flight Sim',54,24,_binary '',1,5,'2021-04-16 00:00:00','2021-04-17 00:00:00'),(2,'Animal Carousel',36,40,_binary '',1,1,'2021-04-27 13:44:00','2021-04-27 13:44:00'),(3,'Coaster Express',46,15,_binary '\0',1,3,'2021-04-16 00:00:00','2021-04-17 00:00:00'),(4,'Goliath',60,24,_binary '',2,5,'2021-04-27 13:45:05','2021-04-27 13:45:05'),(5,'Defiance',48,40,_binary '',2,4,'2021-04-27 13:45:21','2021-04-27 13:45:21'),(6,'Lazy River',0,80,_binary '',2,2,'2021-04-27 13:45:21','2021-04-27 13:45:21'),(7,'Krentzman',36,35,_binary '\0',3,2,'2021-04-27 13:45:21','2021-04-27 13:45:21'),(8,'Huntington',48,25,_binary '',3,4,'2021-04-27 13:45:21','2021-04-27 13:45:21'),(9,'Hockey',36,30,_binary '',3,3,'2021-04-27 13:45:21','2021-04-27 13:45:21');
/*!40000 ALTER TABLE `rides` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-27 14:12:59
