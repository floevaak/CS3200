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
-- Table structure for table `passes`
--

DROP TABLE IF EXISTS `passes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` int NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `food_pack` bit(1) NOT NULL,
  `fast_pass` bit(1) NOT NULL,
  `user_id` int NOT NULL,
  `park_id` int NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `park_id` (`park_id`),
  CONSTRAINT `passes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `passes_ibfk_2` FOREIGN KEY (`park_id`) REFERENCES `parks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passes`
--

LOCK TABLES `passes` WRITE;
/*!40000 ALTER TABLE `passes` DISABLE KEYS */;
INSERT INTO `passes` VALUES (1,35,'Anirudh Pass','2021-04-30','2021-11-21',_binary '',_binary '\0',1,1,'2021-04-27 13:54:16','2021-04-27 13:55:40'),(2,49,'Vrushali Pass','2021-01-01','2021-06-30',_binary '',_binary '',2,2,'2021-04-27 13:54:29','2021-04-27 13:59:17'),(3,35,'Roy Pass','2021-04-30','2021-11-21',_binary '',_binary '',3,1,'2021-04-27 13:59:06','2021-04-27 13:59:17'),(4,35,'Christopher Pass','2021-04-30','2021-11-21',_binary '',_binary '',4,1,'2021-04-27 13:59:06','2021-04-27 13:59:17');
/*!40000 ALTER TABLE `passes` ENABLE KEYS */;
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
