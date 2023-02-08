CREATE DATABASE  IF NOT EXISTS `mycostco` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mycostco`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mycostco
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  `hourly_rate` int DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_warehouse_id` (`warehouse_id`),
  CONSTRAINT `fk_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Emily','Clark',9,20,41600,'2020-01-24',NULL),(2,'Sam','Smith',9,17,35360,'2021-09-04',1),(3,'Clara','Nei',10,24,49920,'2019-10-08',4),(4,'Nell','Sun',10,22,45760,'2019-12-01',NULL),(5,'Leechard','Hwang',11,14,29120,'2020-03-04',6),(6,'Susan','Mean',11,14,29120,'2021-04-05',NULL),(7,'Diana','Russel',12,17,35360,'2021-12-04',8),(8,'Michell','Nice',12,18,37440,'2018-11-11',NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `inventory` int DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_supplier_id` (`supplier_id`),
  CONSTRAINT `fk_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'TGSN sofa',1300,500,'furniture',1),(2,'Salmon',10,1520,'seafood',2),(3,'Prim ribeye',28,765,'meat',3),(4,'Hagenvan',16,840,'ice cream',4),(5,'Weathergone',13,8454,'cloth',5),(6,'Smart_dishwasher',800,450,'appliance',6),(7,'King crab',50,203,'seafood',2),(8,'Slab table',600,541,'furniture',1),(9,'Laptop',1010,125,'appliance',6),(10,'Prok belly',9,600,'meat',3),(11,'Goosequack',170,412,'cloth',5),(12,'T-shirt',6,4564,'cloth',5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipts` (
  `receipt_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  `date_of_purchase` date DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `payment_method` enum('credit','debt','cash') DEFAULT NULL,
  PRIMARY KEY (`receipt_id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_rewarehouse_id` (`warehouse_id`),
  KEY `fk_product_id` (`product_id`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `fk_rewarehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`warehouse_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipts`
--

LOCK TABLES `receipts` WRITE;
/*!40000 ALTER TABLE `receipts` DISABLE KEYS */;
INSERT INTO `receipts` VALUES (1,1000,11,'2023-01-01',1,'credit'),(2,1000,11,'2023-01-01',2,'credit'),(3,1000,11,'2023-01-01',3,'credit'),(4,1000,11,'2023-01-01',4,'credit'),(5,1000,11,'2023-01-01',5,'credit'),(6,1000,11,'2023-01-01',6,'credit'),(7,1000,11,'2023-01-01',7,'credit'),(8,1000,11,'2023-01-01',8,'credit'),(9,1000,11,'2023-01-01',9,'credit'),(10,1000,11,'2023-01-09',10,'credit'),(11,1000,11,'2023-01-09',2,'credit'),(12,1000,11,'2023-01-09',3,'credit'),(13,1000,11,'2023-01-09',4,'credit'),(14,1000,11,'2023-01-09',5,'credit'),(15,1000,11,'2023-01-09',11,'credit'),(16,1000,11,'2023-01-09',7,'credit'),(17,1000,11,'2023-01-09',8,'credit'),(18,1000,11,'2023-01-09',12,'credit'),(19,1000,11,'2023-01-19',10,'credit'),(20,1000,11,'2023-01-19',2,'credit'),(21,1000,11,'2023-01-19',1,'credit'),(22,1000,11,'2023-01-19',4,'credit'),(23,1000,11,'2023-01-19',5,'credit'),(24,1000,11,'2023-01-19',11,'credit'),(25,1000,11,'2023-01-19',3,'credit'),(26,1000,11,'2023-01-19',8,'credit'),(27,1000,11,'2023-01-19',12,'credit'),(28,1001,11,'2023-01-19',10,'cash'),(29,1001,11,'2023-01-19',2,'cash'),(30,1001,11,'2023-01-19',1,'cash'),(31,1001,11,'2023-01-19',4,'cash'),(32,1001,11,'2023-01-19',5,'cash'),(33,1001,11,'2023-01-19',11,'cash'),(34,1001,11,'2023-01-19',3,'cash'),(35,1001,11,'2023-01-21',2,'cash'),(36,1001,11,'2023-01-21',2,'cash'),(37,1001,11,'2023-01-21',1,'cash'),(38,1001,11,'2023-01-21',4,'cash'),(39,1001,11,'2023-01-21',3,'cash'),(40,1001,11,'2023-01-21',9,'cash'),(41,1001,11,'2023-01-21',3,'cash'),(42,1001,11,'2023-01-21',8,'cash'),(43,1001,11,'2023-01-21',12,'cash'),(44,1002,11,'2023-01-28',2,'debt'),(45,1002,11,'2023-01-28',2,'debt'),(46,1002,11,'2023-01-28',2,'debt'),(47,1002,11,'2023-01-28',2,'debt'),(48,1002,11,'2023-01-28',3,'debt'),(49,1002,11,'2023-01-28',3,'debt'),(50,1002,11,'2023-01-28',3,'debt'),(51,1002,11,'2023-01-28',8,'debt'),(52,1002,11,'2023-01-28',12,'debt'),(53,1003,11,'2023-01-17',2,'credit'),(54,1003,11,'2023-01-17',2,'credit'),(55,1003,11,'2023-01-17',2,'credit'),(56,1003,11,'2023-01-17',2,'credit'),(57,1004,11,'2023-01-17',6,'credit'),(58,1004,11,'2023-01-17',3,'credit'),(59,1004,11,'2023-01-17',3,'credit'),(60,1004,11,'2023-01-17',5,'credit'),(61,1005,11,'2023-01-11',4,'credit'),(62,1005,11,'2023-01-11',4,'credit'),(63,1005,11,'2023-01-11',4,'credit'),(64,1005,11,'2023-01-11',4,'credit'),(65,1005,11,'2023-01-21',2,'cash'),(66,1005,11,'2023-01-21',3,'cash'),(67,1005,11,'2023-01-21',8,'cash'),(68,1005,11,'2023-01-21',9,'cash'),(69,1005,11,'2023-01-28',3,'cash'),(70,1005,11,'2023-01-28',3,'cash'),(71,1006,9,'2023-01-21',1,'credit'),(72,1006,9,'2023-01-21',2,'credit'),(73,1006,9,'2023-01-21',3,'credit'),(74,1006,9,'2023-01-21',4,'credit'),(75,1006,9,'2023-01-28',5,'credit'),(76,1006,9,'2023-01-28',6,'credit'),(77,1006,9,'2023-01-28',1,'credit'),(78,1006,9,'2023-01-28',2,'credit'),(79,1006,9,'2023-01-28',2,'credit'),(80,1006,9,'2023-01-28',2,'credit'),(81,1006,9,'2023-01-28',12,'credit'),(82,1006,9,'2023-01-28',12,'credit'),(83,1006,9,'2023-01-28',12,'credit'),(84,1006,9,'2023-01-28',12,'credit'),(85,1006,9,'2023-01-28',12,'credit'),(86,1006,9,'2023-01-28',12,'credit'),(87,1006,9,'2023-01-28',12,'credit'),(88,1006,9,'2023-01-28',12,'credit'),(89,1006,9,'2023-01-28',12,'credit'),(90,1006,9,'2023-01-28',12,'credit'),(91,1006,9,'2023-01-28',12,'credit'),(92,1006,9,'2023-01-28',12,'credit'),(93,1006,9,'2023-01-28',12,'credit'),(94,1007,9,'2023-01-05',3,'credit'),(95,1007,9,'2023-01-05',3,'credit'),(96,1007,9,'2023-01-05',3,'credit'),(97,1007,9,'2023-01-05',3,'credit'),(98,1007,9,'2023-01-05',3,'credit'),(99,1007,9,'2023-01-05',3,'credit'),(100,1007,9,'2023-01-05',3,'credit'),(101,1007,9,'2023-01-05',3,'credit'),(102,1007,9,'2023-01-07',3,'credit'),(103,1007,9,'2023-01-07',3,'credit'),(104,1007,9,'2023-01-07',10,'credit'),(105,1007,9,'2023-01-07',10,'credit'),(106,1007,9,'2023-01-07',10,'credit'),(107,1007,9,'2023-01-07',10,'credit'),(108,1007,9,'2023-01-07',10,'credit'),(109,1007,9,'2023-01-07',10,'credit'),(110,1007,9,'2023-01-07',10,'credit'),(111,1007,9,'2023-01-07',10,'credit'),(112,1007,9,'2023-01-07',10,'credit'),(113,1007,9,'2023-01-21',10,'credit'),(114,1007,9,'2023-01-21',10,'credit'),(115,1007,9,'2023-01-21',10,'credit'),(116,1007,9,'2023-01-21',10,'credit'),(117,1008,9,'2023-01-05',11,'cash'),(118,1008,9,'2023-01-05',11,'cash'),(119,1008,9,'2023-01-05',11,'cash'),(120,1008,9,'2023-01-05',11,'cash'),(121,1008,9,'2023-01-05',11,'cash'),(122,1008,9,'2023-01-05',11,'cash'),(123,1008,9,'2023-01-05',11,'cash'),(124,1008,9,'2023-01-05',11,'cash'),(125,1008,9,'2023-01-10',12,'credit'),(126,1008,9,'2023-01-10',12,'credit'),(127,1008,9,'2023-01-10',12,'credit'),(128,1008,9,'2023-01-10',12,'credit'),(129,1008,9,'2023-01-10',12,'credit'),(130,1008,9,'2023-01-10',12,'credit'),(131,1008,9,'2023-01-10',12,'credit'),(132,1008,9,'2023-01-07',12,'credit'),(133,1008,9,'2023-01-07',12,'credit'),(134,1008,9,'2023-01-07',11,'credit'),(135,1008,9,'2023-01-07',12,'credit'),(136,1008,9,'2023-01-21',1,'credit'),(137,1008,9,'2023-01-21',1,'credit'),(138,1008,9,'2023-01-21',1,'credit'),(139,1008,9,'2023-01-21',1,'credit'),(186,1009,9,'2023-01-05',2,'debt'),(187,1009,9,'2023-01-05',3,'debt'),(188,1009,9,'2023-01-05',2,'debt'),(189,1009,9,'2023-01-05',3,'debt'),(190,1009,9,'2023-01-05',4,'debt'),(191,1009,9,'2023-01-05',4,'debt'),(192,1009,9,'2023-01-05',4,'debt'),(193,1009,9,'2023-01-05',4,'debt'),(194,1009,9,'2023-01-16',4,'credit'),(195,1009,9,'2023-01-16',2,'credit'),(196,1009,9,'2023-01-16',2,'credit'),(197,1009,9,'2023-01-16',2,'credit'),(198,1009,9,'2023-01-16',4,'credit'),(199,1009,9,'2023-01-16',4,'credit'),(200,1009,9,'2023-01-16',4,'credit'),(201,1009,9,'2023-01-16',2,'credit'),(202,1009,9,'2023-01-16',3,'credit'),(203,1009,9,'2023-01-16',3,'credit'),(204,1009,9,'2023-01-16',2,'credit'),(205,1009,9,'2023-01-16',2,'credit'),(206,1009,9,'2023-01-13',7,'credit'),(207,1009,9,'2023-01-13',7,'credit'),(208,1009,9,'2023-01-13',7,'credit'),(209,1010,9,'2023-01-05',2,'cash'),(210,1010,9,'2023-01-05',2,'cash'),(211,1010,9,'2023-01-05',2,'cash'),(212,1010,9,'2023-01-05',2,'cash'),(213,1010,9,'2023-01-05',2,'cash'),(214,1010,9,'2023-01-05',2,'cash'),(215,1010,9,'2023-01-05',2,'cash'),(216,1009,9,'2023-01-05',3,'debt'),(217,1009,9,'2023-01-05',2,'debt'),(218,1009,9,'2023-01-05',3,'debt'),(219,1009,9,'2023-01-05',4,'debt'),(220,1009,9,'2023-01-05',4,'debt'),(221,1009,9,'2023-01-05',4,'debt'),(222,1009,9,'2023-01-05',4,'debt'),(223,1009,9,'2023-01-16',4,'credit'),(224,1009,9,'2023-01-16',2,'credit'),(225,1009,9,'2023-01-16',2,'credit'),(226,1009,9,'2023-01-16',2,'credit'),(227,1009,9,'2023-01-16',4,'credit'),(228,1009,9,'2023-01-16',4,'credit'),(229,1009,9,'2023-01-16',4,'credit'),(230,1009,9,'2023-01-16',2,'credit'),(231,1009,9,'2023-01-16',3,'credit'),(232,1009,9,'2023-01-16',3,'credit'),(233,1009,9,'2023-01-16',2,'credit'),(234,1009,9,'2023-01-16',2,'credit'),(235,1009,9,'2023-01-13',7,'credit'),(236,1009,9,'2023-01-13',7,'credit'),(237,1009,9,'2023-01-13',7,'credit'),(238,1010,9,'2023-01-05',8,'cash'),(239,1010,9,'2023-01-05',8,'cash'),(240,1010,9,'2023-01-05',8,'cash'),(241,1010,9,'2023-01-05',9,'cash'),(242,1010,9,'2023-01-05',9,'cash'),(243,1010,9,'2023-01-05',9,'cash'),(244,1010,9,'2023-01-05',9,'cash'),(245,1011,12,'2023-01-05',1,'credit'),(246,1011,12,'2023-01-05',2,'credit'),(247,1011,12,'2023-01-05',3,'credit'),(248,1011,12,'2023-01-05',4,'credit'),(249,1011,12,'2023-01-05',5,'credit'),(250,1011,12,'2023-01-05',6,'credit'),(251,1011,12,'2023-01-05',7,'credit'),(252,1011,12,'2023-01-05',8,'credit'),(253,1011,12,'2023-01-05',9,'credit'),(254,1011,12,'2023-01-05',10,'credit'),(255,1011,12,'2023-01-06',11,'credit'),(256,1011,12,'2023-01-06',12,'credit'),(257,1011,12,'2023-01-06',1,'credit'),(258,1011,12,'2023-01-06',2,'credit'),(259,1011,12,'2023-01-06',3,'credit'),(260,1011,12,'2023-01-06',4,'credit'),(261,1011,12,'2023-01-06',5,'credit'),(262,1011,12,'2023-01-06',6,'credit'),(263,1011,12,'2023-01-06',7,'credit'),(264,1011,12,'2023-01-06',8,'credit'),(265,1011,12,'2023-01-06',9,'credit'),(266,1011,12,'2023-01-25',10,'credit'),(267,1011,12,'2023-01-25',11,'credit'),(268,1011,12,'2023-01-25',12,'credit'),(269,1011,12,'2023-01-25',1,'credit'),(270,1011,12,'2023-01-25',2,'credit'),(271,1011,12,'2023-01-25',3,'credit'),(272,1011,12,'2023-01-25',4,'credit'),(273,1011,12,'2023-01-25',5,'credit'),(274,1011,12,'2023-01-25',6,'credit'),(275,1012,12,'2023-01-02',5,'debt'),(276,1012,12,'2023-01-02',5,'debt'),(277,1012,12,'2023-01-02',5,'debt'),(278,1012,12,'2023-01-02',5,'debt'),(279,1012,12,'2023-01-02',5,'debt'),(280,1012,12,'2023-01-20',5,'debt'),(281,1012,12,'2023-01-20',5,'debt'),(282,1012,12,'2023-01-20',5,'debt'),(283,1012,12,'2023-01-22',5,'debt'),(284,1012,12,'2023-01-22',5,'debt'),(285,1012,12,'2023-01-22',5,'debt'),(286,1012,12,'2023-01-22',5,'debt'),(287,1012,12,'2023-01-22',5,'debt'),(288,1012,12,'2023-01-22',5,'debt'),(289,1012,12,'2023-01-22',5,'debt'),(301,1013,12,'2023-01-10',1,'credit'),(302,1013,12,'2023-01-10',1,'credit'),(303,1013,12,'2023-01-10',1,'credit'),(304,1013,12,'2023-01-10',1,'credit'),(305,1013,12,'2023-01-10',1,'credit'),(306,1013,12,'2023-01-10',1,'credit'),(307,1013,12,'2023-01-10',1,'credit'),(308,1013,12,'2023-01-10',1,'credit'),(309,1013,12,'2023-01-10',1,'credit'),(310,1013,12,'2023-01-10',1,'credit'),(311,1013,12,'2023-01-10',1,'credit'),(312,1014,12,'2023-01-01',3,'cash'),(313,1014,12,'2023-01-01',3,'cash'),(314,1014,12,'2023-01-01',3,'cash'),(315,1014,12,'2023-01-01',3,'cash'),(316,1014,12,'2023-01-01',3,'cash'),(317,1014,12,'2023-01-01',3,'cash'),(318,1014,12,'2023-01-01',3,'cash'),(319,1014,12,'2023-01-01',3,'cash'),(320,1014,12,'2023-01-11',10,'cash'),(321,1014,12,'2023-01-11',10,'cash'),(322,1014,12,'2023-01-11',10,'cash'),(323,1014,12,'2023-01-11',10,'cash'),(324,1014,12,'2023-01-11',10,'cash'),(325,1014,12,'2023-01-11',10,'cash'),(326,1014,12,'2023-01-21',10,'cash'),(327,1014,12,'2023-01-21',3,'cash'),(328,1014,12,'2023-01-21',3,'cash'),(329,1014,12,'2023-01-21',3,'cash'),(330,1014,12,'2023-01-21',3,'cash'),(331,1014,12,'2023-01-21',10,'cash'),(332,1014,12,'2023-01-21',3,'cash'),(333,1014,12,'2023-01-21',10,'cash'),(334,1015,12,'2023-01-01',7,'cash'),(335,1015,12,'2023-01-01',7,'cash'),(336,1015,12,'2023-01-01',7,'cash'),(337,1015,12,'2023-01-01',7,'cash'),(338,1015,12,'2023-01-01',7,'cash'),(339,1015,12,'2023-01-01',7,'cash'),(340,1015,12,'2023-01-01',7,'cash'),(341,1015,12,'2023-01-01',7,'cash'),(342,1015,12,'2023-01-13',2,'cash'),(343,1015,12,'2023-01-13',2,'cash'),(344,1015,12,'2023-01-13',2,'cash'),(345,1015,12,'2023-01-13',2,'cash'),(346,1015,12,'2023-01-13',2,'cash'),(347,1015,12,'2023-01-13',2,'cash'),(348,1015,12,'2023-01-21',2,'cash'),(349,1015,12,'2023-01-21',2,'cash'),(350,1015,12,'2023-01-21',7,'cash'),(351,1015,12,'2023-01-21',7,'cash'),(352,1015,12,'2023-01-21',2,'cash'),(353,1015,12,'2023-01-21',7,'cash'),(354,1015,12,'2023-01-21',2,'cash'),(355,1015,12,'2023-01-21',7,'cash'),(356,1016,12,'2023-01-17',7,'cash'),(357,1016,12,'2023-01-17',7,'cash'),(358,1016,12,'2023-01-17',7,'cash'),(359,1016,12,'2023-01-17',7,'cash'),(360,1016,12,'2023-01-17',7,'cash'),(361,1016,12,'2023-01-17',7,'cash'),(362,1016,12,'2023-01-17',7,'cash'),(363,1016,12,'2023-01-17',7,'cash'),(364,1016,12,'2023-01-03',9,'cash'),(365,1016,12,'2023-01-03',7,'cash'),(366,1016,12,'2023-01-03',7,'cash'),(367,1016,12,'2023-01-03',7,'cash'),(368,1016,12,'2023-01-03',7,'cash'),(369,1016,12,'2023-01-03',5,'cash'),(370,1016,12,'2023-01-24',4,'cash'),(371,1016,12,'2023-01-24',3,'cash'),(372,1016,12,'2023-01-24',2,'cash'),(373,1016,12,'2023-01-24',1,'cash'),(374,1016,12,'2023-01-24',6,'cash'),(375,1016,12,'2023-01-24',1,'cash'),(376,1016,12,'2023-01-24',6,'cash'),(377,1017,12,'2023-01-13',9,'credit'),(378,1017,12,'2023-01-13',9,'credit'),(379,1017,12,'2023-01-13',9,'credit'),(380,1017,12,'2023-01-13',9,'credit'),(381,1017,12,'2023-01-13',9,'credit'),(382,1017,12,'2023-01-13',9,'credit'),(383,1017,12,'2023-01-13',9,'credit'),(384,1017,12,'2023-01-13',9,'credit'),(385,1017,12,'2023-01-13',9,'credit'),(386,1017,12,'2023-01-13',9,'credit'),(387,1018,12,'2023-01-07',4,'debt'),(388,1018,12,'2023-01-07',4,'debt'),(389,1018,12,'2023-01-07',4,'debt'),(390,1018,12,'2023-01-07',4,'debt'),(391,1018,12,'2023-01-07',4,'debt'),(392,1018,12,'2023-01-07',4,'debt'),(393,1018,12,'2023-01-07',4,'debt'),(394,1019,12,'2023-01-09',1,'credit'),(395,1019,12,'2023-01-09',2,'credit'),(396,1019,12,'2023-01-09',3,'credit'),(397,1019,12,'2023-01-09',4,'credit'),(398,1019,12,'2023-01-09',5,'credit'),(399,1019,12,'2023-01-09',6,'credit'),(400,1019,12,'2023-01-09',7,'credit'),(401,1019,12,'2023-01-09',8,'credit'),(402,1019,12,'2023-01-09',9,'credit'),(403,1019,12,'2023-01-09',10,'credit'),(404,1019,12,'2023-01-19',1,'credit'),(405,1019,12,'2023-01-19',2,'credit'),(406,1019,12,'2023-01-19',2,'credit'),(407,1019,12,'2023-01-19',3,'credit'),(408,1019,12,'2023-01-19',1,'credit'),(409,1019,12,'2023-01-19',10,'credit'),(410,1019,12,'2023-01-19',10,'credit'),(411,1019,12,'2023-01-19',1,'credit'),(412,1020,12,'2023-01-08',7,'cash'),(413,1020,12,'2023-01-08',7,'cash'),(414,1020,12,'2023-01-08',7,'cash'),(415,1020,12,'2023-01-08',7,'cash'),(416,1020,12,'2023-01-08',7,'cash'),(417,1020,12,'2023-01-08',7,'cash'),(418,1020,12,'2023-01-18',7,'cash'),(419,1020,12,'2023-01-18',7,'cash'),(420,1020,12,'2023-01-18',7,'cash'),(421,1020,12,'2023-01-18',7,'cash'),(422,1020,12,'2023-01-18',7,'cash'),(423,1020,12,'2023-01-18',7,'cash'),(424,1020,12,'2023-01-18',7,'cash');
/*!40000 ALTER TABLE `receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(30) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `minimum_requirement` int DEFAULT NULL,
  `delivery_method` enum('Truck','ship','airplane') DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'WEMADEFURN','furniture',300,'Truck','UT','385-785-1543'),(2,'KINGOFSEA','seafood',400,'Truck','CA','415-203-5124'),(3,'MOOVALLEY','meat',400,'Truck','IL','309-845-1532'),(4,'LONE','ice cream',1000,'airplane','NY','917-821-2345'),(5,'Tole','cloth',10000,'ship','TX','806-754-1817'),(6,'SamLG','appliance',2000,'ship','OR','425-784-8132');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `zipcode` int DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1000,'James','Carl','13232 irvine boulvard','irvine','CA',92623,'JamesCarl@gmail.com'),(1001,'kate','Cram','12353 cypresstree','irvine','CA',92623,'kateCram@gmail.com'),(1002,'John','Crust','153 olive tree','irvine','CA',92623,'JohnCrust@gmail.com'),(1003,'Wei','Zhong','1435 mastros','irvine','CA',92623,'WeiZhong@gmail.com'),(1004,'SHAKSHA','Laiska','12512 pitchall','irvine','CA',92623,'SHAKSHALaiska@gmail.com'),(1005,'Sunny','Lee','124 landscape','irvine','CA',92623,'SunnyLee@gmail.com'),(1006,'Sul','Cas','1232 casino st','henderson','NV',89074,'SulCas@gmail.com'),(1007,'Nanacy','Lang','21322 Green valley','henderson','NV',89074,'NanacyLang@gmail.com'),(1008,'ROse','Gold','23213 sunset casino','henderson','NV',89074,'ROseGold@gmail.com'),(1009,'Missile','Crud','2453 nuclear','henderson','NV',89074,'MissileCrud@gmail.com'),(1010,'madona','Glor','432 teamor','henderson','NV',89074,'madonaGlor@gmail.com'),(1011,'Mang','oui','1232 moutainew','issaquah','WA',98074,'Mangoui@gmail.com'),(1012,'Dews','Lai','21322 anderson','issaquah','WA',98074,'DewsLai@gmail.com'),(1013,'Nuke','Tao','23213 walnut','issaquah','WA',98074,'NukeTao@gmail.com'),(1014,'Mike','Nguyen','2453 greenworld','issaquah','WA',98074,'MikeNguyen@gmail.com'),(1015,'Show','Ke','545 snoquah','issaquah','WA',98074,'ShowKe@gmail.com'),(1016,'Luke','mei','1232 stockton st','San Francisco','CA',98132,'Lukemei@gmail.com'),(1017,'Zinosoo','Kim','21322 pacific ave','San Francisco','CA',98132,'ZinosooKim@gmail.com'),(1018,'Petras','Chew','23213 mrket','San Francisco','CA',98132,'PetrasChew@gmail.com'),(1019,'Chirs','Fake','2453 San technol','San Francisco','CA',98132,'ChirsFake@gmail.com'),(1020,'Snow','Kem','545 worldfinace','San Francisco','CA',98132,'SnowKem@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses` (
  `warehouse_id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(50) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `gas` tinyint(1) DEFAULT NULL,
  `business_center` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses`
--

LOCK TABLES `warehouses` WRITE;
/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
INSERT INTO `warehouses` VALUES (9,'henderson','NV',1,0),(10,'San Francisco','CA',0,1),(11,'Irvine','CA',1,1),(12,'Issaquah','WA',1,0);
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mycostco'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-08 12:09:30
