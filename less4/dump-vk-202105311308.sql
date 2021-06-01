-- MySQL dump 10.13  Distrib 8.0.25, for macos11.3 (x86_64)
--
-- Host: localhost    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(145) NOT NULL,
  `description` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'quae','A nam et illo ducimus tempora doloremque. Repudiandae autem accusantium est non consequuntur. Quod nulla ut aut eum doloremque. Vel voluptas dignissimos aut error quos voluptas.'),(2,'facilis','Nostrum reprehenderit quaerat nesciunt et dolores exercitationem sit. Numquam sit quidem dolorem quis eos eum ut. Commodi neque perferendis sint et quisquam pariatur.'),(3,'aut','Et sed earum ratione veritatis aperiam nemo. Autem officiis error illo sint fuga sunt. Reiciendis iure nobis eum mollitia. Magni soluta consequatur nobis dignissimos doloribus.'),(4,'voluptas','Sint in nisi molestiae. Ullam ratione sint dolores suscipit nobis. Consequatur modi qui voluptatem delectus ut magnam.'),(5,'ut','Quia impedit impedit dolorum iusto et. Nihil qui odit ipsum animi quidem. Architecto nihil eaque dolores culpa. Atque voluptatem aspernatur sed ea qui.'),(6,'quis','Magnam itaque sequi omnis autem. A numquam et dolore blanditiis odio consequuntur. Perspiciatis quisquam earum expedita aut quibusdam in facere neque.'),(7,'ad','Fuga quae sit iste beatae. Molestiae corrupti ipsum laudantium consequuntur cumque aspernatur non. Perspiciatis et voluptatem necessitatibus occaecati assumenda reprehenderit. Ratione modi veniam laudantium eum id tempore sint.'),(8,'aut','Minus deleniti quia laudantium quis minus. Vel voluptatem nemo hic qui eum non consequatur. Optio totam quidem numquam repellendus quo pariatur provident saepe. Excepturi ut at velit optio consequatur maxime ea.'),(9,'consectetur','Minima omnis nihil ea numquam sit dicta excepturi. Sapiente sit illo eum. Quas rerum omnis aut necessitatibus voluptates. Sequi perspiciatis nam aut blanditiis.'),(10,'corporis','Magnam quia sed temporibus odio. Perspiciatis vero non et ex magnam iusto. Vitae quia itaque labore consequatur ipsum.');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_users`
--

DROP TABLE IF EXISTS `communities_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_users` (
  `community_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `communities_users_comm_idx` (`community_id`),
  KEY `communities_users_users_idx` (`user_id`),
  CONSTRAINT `communities_users_ibfk_1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `communities_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_users`
--

LOCK TABLES `communities_users` WRITE;
/*!40000 ALTER TABLE `communities_users` DISABLE KEYS */;
INSERT INTO `communities_users` VALUES (1,1,'1981-10-21 09:05:14'),(1,11,'1987-10-24 14:33:34'),(1,21,'1983-09-11 19:41:06'),(1,31,'2015-08-28 06:04:29'),(1,41,'1971-09-18 11:20:32'),(1,51,'2012-12-30 15:45:01'),(1,61,'2016-06-07 06:30:12'),(1,71,'1983-03-09 05:24:28'),(1,81,'1971-07-17 02:46:35'),(1,91,'2019-09-03 00:11:17'),(2,2,'2001-03-11 19:02:08'),(2,12,'1998-10-20 22:54:09'),(2,22,'1998-02-13 22:55:42'),(2,32,'1977-12-29 06:10:44'),(2,42,'1978-03-16 20:41:04'),(2,52,'2004-11-08 21:09:14'),(2,62,'2011-06-01 15:39:09'),(2,72,'2007-07-13 19:28:42'),(2,82,'1983-02-03 14:17:03'),(2,92,'1986-05-26 06:26:10'),(3,3,'1982-06-28 05:38:55'),(3,13,'2002-01-02 01:14:04'),(3,23,'2018-04-27 23:31:59'),(3,33,'2013-05-16 08:28:27'),(3,43,'2002-06-16 15:51:59'),(3,53,'1992-12-07 10:41:53'),(3,63,'1991-07-22 10:07:50'),(3,73,'2003-08-28 03:19:06'),(3,83,'1994-01-27 09:31:44'),(3,93,'1971-12-08 08:06:18'),(4,4,'2005-09-25 05:45:13'),(4,14,'2015-07-30 16:01:08'),(4,24,'1978-07-04 16:48:15'),(4,34,'1982-04-18 10:42:12'),(4,44,'1995-08-13 06:49:36'),(4,54,'1985-01-04 17:59:57'),(4,64,'1970-02-23 18:04:30'),(4,74,'1975-06-14 02:24:14'),(4,84,'2018-01-09 10:47:04'),(4,94,'1980-04-11 16:25:39'),(5,5,'1987-06-20 19:30:11'),(5,15,'2015-05-08 05:18:13'),(5,25,'2006-11-13 17:04:14'),(5,35,'1974-01-21 16:52:17'),(5,45,'1972-09-04 23:58:30'),(5,55,'1985-11-23 21:28:47'),(5,65,'2016-03-19 11:40:14'),(5,75,'1973-01-12 01:42:50'),(5,85,'2013-01-25 15:05:51'),(5,95,'2018-03-04 16:47:12'),(6,6,'1991-05-30 19:38:43'),(6,16,'2013-05-08 16:24:49'),(6,26,'1981-07-29 21:37:37'),(6,36,'2013-03-16 06:01:56'),(6,46,'2003-11-11 20:41:15'),(6,56,'1977-09-30 02:24:49'),(6,66,'2001-01-14 20:36:36'),(6,76,'1971-08-05 21:37:09'),(6,86,'1995-12-03 01:43:05'),(6,96,'2008-04-06 16:49:53'),(7,7,'1995-09-17 18:19:23'),(7,17,'1992-03-21 06:24:29'),(7,27,'1988-08-19 18:15:40'),(7,37,'1984-07-16 09:59:55'),(7,47,'1981-03-19 22:34:22'),(7,57,'1979-09-16 11:25:44'),(7,67,'1984-01-18 16:39:50'),(7,77,'1996-03-06 11:21:13'),(7,87,'1984-04-08 21:52:32'),(7,97,'2009-11-30 00:19:58'),(8,8,'1980-09-04 21:22:12'),(8,18,'1973-11-15 05:12:11'),(8,28,'2011-02-17 16:00:40'),(8,38,'2002-10-07 17:23:16'),(8,48,'2021-02-25 23:19:34'),(8,58,'2015-10-17 00:17:54'),(8,68,'1986-07-15 00:47:39'),(8,78,'1986-10-25 00:15:32'),(8,88,'2019-03-10 02:47:43'),(8,98,'1996-06-04 15:16:46'),(9,9,'2010-12-10 03:05:51'),(9,19,'2019-10-25 16:02:34'),(9,29,'1988-12-14 19:20:44'),(9,39,'2011-07-31 10:57:12'),(9,49,'1987-04-30 16:19:30'),(9,59,'2011-04-24 16:08:33'),(9,69,'1971-03-04 10:37:40'),(9,79,'2020-12-13 03:09:31'),(9,89,'1984-02-01 01:21:21'),(9,99,'1988-05-06 07:30:56'),(10,10,'1989-04-27 14:09:24'),(10,20,'2010-05-16 08:33:02'),(10,30,'1975-04-16 23:49:08'),(10,40,'1974-07-10 17:44:16'),(10,50,'2009-10-15 23:50:10'),(10,60,'2020-10-26 11:39:41'),(10,70,'1990-10-29 13:39:29'),(10,80,'1978-08-20 16:07:01'),(10,90,'1975-11-06 22:08:56'),(10,100,'1989-08-04 21:58:28');
/*!40000 ALTER TABLE `communities_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_requests` (
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `accepted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `fk_friend_requests_from_user_idx` (`from_user_id`),
  KEY `fk_friend_requests_to_user_idx` (`to_user_id`),
  CONSTRAINT `fk_friend_requests_users_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_friend_requests_users_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (5,29,1),(7,26,1),(9,30,0),(11,25,0),(16,16,0),(23,6,0),(23,18,1),(26,17,0),(31,4,0),(35,14,1),(45,11,1),(47,1,1),(61,2,0),(61,21,0),(61,23,0),(62,12,0),(63,3,0),(69,15,0),(71,20,0),(74,8,0),(75,24,1),(80,27,1),(82,28,1),(85,13,1),(86,10,0),(88,22,1),(90,5,1),(92,7,1),(95,9,1),(100,19,0);
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `media_types_id` int unsigned NOT NULL,
  `file_name` varchar(245) DEFAULT NULL COMMENT '/files/folder/img.png',
  `file_size` bigint unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `media_users_idx` (`user_id`),
  KEY `media_media_types_idx` (`media_types_id`),
  CONSTRAINT `fk_media_media_types` FOREIGN KEY (`media_types_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `fk_media_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'/ca35ac44fcacd7c691cfe12d6659b3b0.jpg',4505,'2016-01-25 08:09:04'),(2,2,2,'/b8789558980d4654222bd1cdb5744caf.jpg',2301,'2004-09-21 00:06:15'),(3,3,3,'/675a284ac5de554de635500a78b6f833.jpg',830,'1987-11-10 16:09:09'),(4,4,4,'/fbe431b6b43df766054d9b126cd030d6.jpg',5171,'1999-07-11 05:09:15'),(5,5,5,'/618bbd64cabb115f5396d12b18088f99.jpg',8503,'1999-08-05 19:16:05'),(6,6,6,'/e9073652e1ba94e680cbd3341247f0be.jpg',3045,'1991-01-25 01:14:04'),(7,7,7,'/c450a17796afbc360c7d2f69a58566a1.jpg',7902,'2004-10-22 10:46:55'),(8,8,8,'/4472019e0bf955645f8f4a6d727b3d14.jpg',2016,'2004-02-28 07:05:23'),(9,9,9,'/6596689c265d619c0cf08a2d85d1a84f.jpg',7938,'2018-12-24 04:03:31'),(10,10,10,'/ff654999021b9705cbcaf7375774a97b.jpg',5198,'2010-07-21 18:46:21'),(11,11,1,'/6192929b96fa77c7c574c93fdfe66f25.jpg',1171,'2019-07-15 06:19:38'),(12,12,2,'/216ce1dd6acf0aa3da9954a7b8f03bca.jpg',3335,'2015-01-15 02:47:27'),(13,13,3,'/de22183696a41f48e4ff545d6bff3b24.jpg',9880,'2021-03-07 14:38:19'),(14,14,4,'/cac666eb2a931eabcd24589cd8508c4c.jpg',3091,'1978-05-02 20:54:57'),(15,15,5,'/69be2f2b627f6c3250d0b088be0ce20d.jpg',8722,'1990-04-10 04:17:25'),(16,16,6,'/b7a891719cd51724a06359c51b88e9dd.jpg',7791,'1976-03-21 12:59:46'),(17,17,7,'/65a3c4fc6a02329ce29a6a2ea1d413f9.jpg',3597,'1970-12-02 09:45:32'),(18,18,8,'/7e6445be11342b8eca4e6b22fd7a58d7.jpg',1071,'2020-06-24 04:51:20'),(19,19,9,'/a867529ddd6f607536f22e3f77a0a91a.jpg',1008,'1993-10-03 14:40:14'),(20,20,10,'/8cd7ec49596ad0c0426326fe5662720d.jpg',8212,'2003-02-27 18:41:41'),(21,21,1,'/32c6516c0feaf28df80339b96c123dc2.jpg',7914,'1977-10-16 16:16:19'),(22,22,2,'/26384792b307eb29cf4c2063f674e39c.jpg',1370,'2005-04-16 14:53:49'),(23,23,3,'/514ada60deb06320912126727e20335b.jpg',9447,'1998-03-20 10:42:39'),(24,24,4,'/875d3c43a03552bc680b034ba22d02f7.jpg',2106,'1989-12-15 23:49:38'),(25,25,5,'/5d300256b54c69cbec7a8e2f8b2456a1.jpg',8542,'2007-07-09 23:44:38'),(26,26,6,'/2e838279ba5e28070538489a5a73f479.jpg',4105,'1995-07-02 13:44:31'),(27,27,7,'/fe80a6c8c3e00461acf3a20aac143422.jpg',6049,'1982-10-09 00:42:11'),(28,28,8,'/d8fc84ff26e090050717eb5ca6e68d2b.jpg',2523,'1981-05-19 19:45:55'),(29,29,9,'/c62e0e0020281e5d8e8e5c31e6d43d93.jpg',8695,'1996-07-31 22:41:51'),(30,30,10,'/4777873b2cfc4a157803db2aa86fae47.jpg',993,'1997-02-21 17:05:33'),(31,31,1,'/4fe55c8f94232e623afa341cb79b7fc6.jpg',8815,'1983-09-06 21:34:14'),(32,32,2,'/26d15827f573449ea155e25674ce8a49.jpg',3163,'1972-02-18 16:14:16'),(33,33,3,'/3f5ce98dc06533ca0ee60f5da202bc9e.jpg',2934,'2006-11-22 18:08:41'),(34,34,4,'/41208d41a8a24c3fe16f21e66509b3fc.jpg',8133,'1979-03-14 16:22:51'),(35,35,5,'/6910a63ca22e55988532108ae8334c55.jpg',5455,'1970-04-09 14:53:04'),(36,36,6,'/b8f799b8d2ff2c78d046db06e0c91ce8.jpg',590,'1985-11-19 20:06:45'),(37,37,7,'/b1823e041c36d55009c18e0e39572354.jpg',6657,'1994-06-15 11:34:36'),(38,38,8,'/88f88713670f72da09b57055980b343d.jpg',7466,'1971-09-29 12:53:29'),(39,39,9,'/4a3bbfa5b415482a42dbc7d33c90d37d.jpg',732,'1974-03-16 15:38:17'),(40,40,10,'/5487043669a4bf1e70ca20cc78dad5b7.jpg',5596,'2017-01-03 14:27:57');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_liked`
--

DROP TABLE IF EXISTS `media_liked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_liked` (
  `user_id` bigint unsigned NOT NULL,
  `is_liked` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`),
  CONSTRAINT `media_liked_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_liked`
--

LOCK TABLES `media_liked` WRITE;
/*!40000 ALTER TABLE `media_liked` DISABLE KEYS */;
INSERT INTO `media_liked` VALUES (13,1,'2015-11-25 16:34:06'),(26,0,'2001-02-02 11:42:01'),(22,1,'1982-04-25 00:08:36'),(21,0,'2005-06-06 07:47:45'),(22,0,'2009-09-29 10:21:37'),(18,0,'1979-11-28 00:05:41'),(30,1,'1982-12-27 02:17:56'),(16,1,'1979-06-08 20:18:01'),(1,1,'2003-01-12 12:55:40'),(23,0,'1973-02-02 11:15:54'),(25,0,'1972-08-19 15:58:55'),(34,1,'2011-02-11 02:40:51'),(19,1,'1976-09-22 16:25:36'),(36,0,'2007-05-31 05:37:15'),(13,0,'2010-05-02 13:04:54'),(36,0,'1995-07-05 17:40:54'),(25,0,'1975-07-01 17:21:44'),(4,1,'2002-11-03 08:14:02'),(21,0,'1987-01-24 07:36:11'),(28,1,'1975-06-12 18:07:52'),(34,0,'2003-11-12 10:06:55'),(22,0,'1972-10-25 05:56:33'),(2,0,'1988-06-11 03:33:54'),(10,0,'1974-10-15 01:56:36'),(3,1,'2004-05-04 05:30:22'),(1,1,'2011-02-07 17:21:01'),(1,0,'2017-09-17 09:13:33'),(8,1,'1990-03-16 02:01:12'),(27,1,'1980-10-08 03:58:52'),(9,0,'1987-07-26 04:00:20'),(30,0,'1992-04-03 22:34:17'),(40,0,'2016-12-19 06:56:21'),(35,1,'2012-12-06 22:44:14'),(11,0,'2006-10-31 16:53:05'),(20,0,'2018-12-30 15:33:46'),(16,0,'1972-07-22 08:17:27'),(29,0,'1988-02-12 21:03:45'),(10,1,'2019-12-23 03:04:33'),(32,1,'1999-10-31 16:34:04'),(30,0,'1985-12-11 20:55:20');
/*!40000 ALTER TABLE `media_liked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (9,'ad'),(8,'consequuntur'),(3,'et'),(4,'iste'),(1,'non'),(7,'optio'),(2,'provident'),(10,'qui'),(6,'recusandae'),(5,'veniam');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `txt` text NOT NULL,
  `is_delivered` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_messages_from_user_idx` (`from_user_id`),
  KEY `fk_messages_to_user_idx` (`to_user_id`),
  CONSTRAINT `fk_messages_users_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_messages_users_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,1,'Earum expedita eligendi fugiat qui dolorem rerum sed.',0,'1989-01-16 14:50:12','1995-03-13 23:33:28'),(2,2,2,'Soluta sit cumque dolor rerum.',0,'1975-11-15 06:42:58','1993-09-19 04:38:05'),(3,3,3,'Commodi sed commodi rerum enim.',1,'1980-06-22 21:34:08','1978-11-10 19:25:46'),(4,4,4,'Suscipit ducimus et praesentium debitis nam.',0,'2005-04-09 11:01:17','1976-08-23 02:47:30'),(5,5,5,'Facilis voluptates aliquid qui perspiciatis debitis fugit dicta fugiat.',0,'2020-02-11 11:57:02','2004-11-05 22:45:34'),(6,6,6,'Nesciunt perspiciatis provident quae perferendis ut aut nesciunt.',1,'2015-04-09 13:06:24','1972-08-05 15:27:14'),(7,7,7,'Doloribus qui totam ad accusantium.',1,'1977-12-23 04:29:13','1973-09-18 09:41:10'),(8,8,8,'Quos ex magnam officiis est minima est.',0,'2000-10-14 16:38:38','1982-11-13 19:11:36'),(9,9,9,'Consequatur exercitationem minus sit voluptate numquam quaerat consequatur.',0,'1977-10-05 01:16:22','1999-11-20 13:09:33'),(10,10,10,'Reiciendis ea ut ex rem qui doloremque expedita.',0,'2012-10-29 13:40:00','2017-05-13 22:44:19'),(11,11,11,'Cumque earum minima qui minima commodi aut.',1,'1980-11-29 01:22:21','2012-07-26 18:13:54'),(12,12,12,'Animi voluptatem in quia id distinctio.',0,'2015-07-04 10:20:52','1978-07-21 17:13:32'),(13,13,13,'In sit aspernatur iste rem.',1,'2013-01-31 02:34:00','1986-04-07 03:19:35'),(14,14,14,'Repudiandae qui quos praesentium et et accusamus labore.',1,'1997-06-12 11:57:07','2008-05-29 20:20:10'),(15,15,15,'Dolores quis earum voluptatem alias.',1,'2017-01-04 13:33:04','2016-08-30 07:35:21'),(16,16,16,'Ut rerum exercitationem debitis iusto molestiae.',1,'1989-11-26 05:10:19','1994-03-12 13:44:24'),(17,17,17,'A voluptate enim est repellendus ducimus.',1,'2018-12-06 09:20:22','1979-07-14 17:23:55'),(18,18,18,'Molestiae ut ex est necessitatibus.',1,'2016-08-16 21:45:12','1993-05-02 05:54:44'),(19,19,19,'Ut fugit omnis porro ab.',1,'2021-03-02 05:21:52','1996-05-09 02:26:34'),(20,20,20,'Amet veritatis incidunt eaque voluptatem.',0,'1998-04-08 22:24:15','2020-02-03 21:04:38'),(21,21,21,'Sit at dignissimos error voluptas vitae quas.',1,'2011-03-19 09:25:52','2006-07-04 14:39:06'),(22,22,22,'Ab quibusdam tempora earum dolorum sint quaerat quasi.',1,'2013-08-10 23:02:24','1972-05-27 22:25:18'),(23,23,23,'Eveniet quo officia ipsam quo similique doloribus officiis doloremque.',0,'2012-10-27 01:31:25','1992-07-19 11:45:34'),(24,24,24,'Iusto recusandae nihil autem molestiae magnam.',0,'1995-11-13 02:23:38','2002-04-01 05:34:51'),(25,25,25,'Unde autem distinctio ea quod a laborum ea itaque.',1,'1991-08-29 09:19:51','2004-04-22 10:34:11'),(26,26,26,'Mollitia omnis atque recusandae rem laborum reprehenderit enim.',1,'1996-06-11 02:21:40','1978-02-28 02:29:15'),(27,27,27,'In excepturi reprehenderit facere iure vitae tenetur qui.',0,'2002-12-02 18:18:51','1994-09-02 09:08:25'),(28,28,28,'Facilis incidunt repellendus beatae non.',1,'2005-11-08 11:52:50','1990-05-11 23:43:49'),(29,29,29,'Illum in ipsam non.',1,'2012-05-30 01:09:30','1996-05-21 21:50:06'),(30,30,30,'Error vel et occaecati nemo.',0,'2007-04-20 20:06:11','2006-11-01 15:51:36'),(31,31,31,'Corrupti eum alias asperiores officia sunt corrupti.',1,'2018-06-13 05:14:59','2020-06-04 07:54:41'),(32,32,32,'Necessitatibus nihil inventore animi ipsam quas aperiam.',1,'2010-05-01 20:51:14','1998-10-25 08:51:29'),(33,33,33,'Et molestiae suscipit sint et non.',0,'1978-02-18 08:52:11','1976-07-12 03:00:44'),(34,34,34,'Velit dolorem facere non.',0,'1992-04-04 10:55:14','1983-07-04 21:21:53'),(35,35,35,'Vel tenetur at doloribus quia reiciendis commodi.',1,'2020-03-13 01:59:05','2000-06-28 12:57:50'),(36,36,36,'Sint laboriosam facere laborum qui.',0,'1990-08-22 08:24:36','1997-12-17 17:01:39'),(37,37,37,'Dolor reiciendis delectus suscipit omnis et et tempora.',1,'2008-02-09 22:46:21','1998-07-15 07:54:10'),(38,38,38,'Sint dolor et quas et vel consectetur vero.',0,'1979-01-14 23:08:00','1993-12-01 05:06:15'),(39,39,39,'Itaque id tempora eos voluptatem.',1,'1987-11-26 07:47:35','2018-01-21 19:52:09'),(40,40,40,'Ratione nihil natus optio tempora.',0,'2003-07-19 00:06:22','2013-08-28 17:41:27'),(41,41,41,'Qui eum voluptatum sed qui maiores ut molestiae.',1,'1977-01-23 19:31:39','1998-09-09 04:06:27'),(42,42,42,'Perspiciatis quisquam et molestiae omnis quis sequi.',1,'2010-10-31 14:40:57','2011-03-28 02:42:57'),(43,43,43,'Laboriosam eligendi quibusdam beatae reiciendis eos voluptatum voluptatibus consequuntur.',0,'1996-06-18 10:25:10','1993-04-20 05:43:42'),(44,44,44,'Ut atque voluptatem in aliquam inventore nostrum.',0,'2017-11-02 08:21:32','1973-03-27 09:50:11'),(45,45,45,'Fuga odit et illo.',0,'1981-02-14 07:58:28','2007-09-03 10:22:57'),(46,46,46,'Quos dolorem saepe vel culpa sit temporibus.',1,'1997-08-03 06:27:29','1997-11-05 07:40:26'),(47,47,47,'Et aut qui consequatur iste odio.',1,'1997-12-04 19:10:29','1972-09-23 15:10:16'),(48,48,48,'Dolor sit provident voluptates dolore est at error et.',0,'2014-06-01 03:35:04','2020-05-14 04:58:47'),(49,49,49,'Consequatur et enim voluptatem ab.',1,'1991-01-12 07:34:38','2001-03-20 12:34:17'),(50,50,50,'Ipsam quia beatae quis accusantium amet eligendi.',0,'1974-01-16 21:48:13','2002-05-28 20:07:55');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `posts_txt` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,79,'Saepe nihil amet iusto rem.','2012-12-16 20:37:50','2017-04-22 13:57:17'),(2,23,'Natus illo ut ut temporibus quos ut.','2008-03-25 23:10:57','1972-04-24 20:43:43'),(3,65,'Quis vitae iure ad quam ratione qui fugiat.','2016-03-10 11:01:28','2003-07-22 22:16:22'),(4,32,'Esse enim expedita et necessitatibus consequatur.','1970-11-16 13:04:39','2019-09-17 03:13:00'),(5,66,'Quam rerum perferendis et tenetur quaerat sunt sint.','2005-02-14 10:52:33','2017-09-09 02:54:13'),(6,71,'Dolorem eveniet magnam sequi.','1976-05-01 23:18:54','1982-08-02 12:22:31'),(7,37,'Ducimus labore quaerat assumenda nisi odio.','1986-12-02 11:08:36','1970-05-24 11:44:28'),(8,65,'Maiores vel sit officia harum odio.','1991-03-17 15:10:04','1992-02-20 11:57:42'),(9,82,'Amet delectus aperiam possimus et ut et.','1976-05-03 17:02:47','2013-07-03 04:40:44'),(10,40,'Excepturi sunt distinctio unde sed repudiandae delectus.','2009-09-02 03:09:24','1996-04-13 10:33:33'),(11,95,'Qui provident ipsam nesciunt alias aspernatur enim deserunt.','1980-10-18 12:48:59','2002-05-03 07:05:13'),(12,83,'Sequi et aperiam quia repellendus.','2001-09-13 02:29:07','2011-05-11 11:44:28'),(13,44,'Qui recusandae nostrum nihil nihil sequi.','1988-09-25 14:37:27','2019-02-15 10:51:51'),(14,62,'Expedita eligendi facilis eum fuga.','2013-09-04 13:47:47','1995-06-17 18:35:18'),(15,75,'Voluptas et non velit quam.','1995-03-02 05:13:07','2018-03-27 23:00:41'),(16,17,'Aut et consequuntur fugit molestias nam.','1978-09-02 16:26:02','2002-08-23 14:06:18'),(17,62,'Eum tempora doloribus amet dignissimos nulla.','2000-12-08 13:57:01','2002-03-16 16:30:41'),(18,68,'Qui pariatur culpa similique asperiores dolores et.','1980-11-08 10:05:20','1996-12-22 04:27:14'),(19,82,'Aliquid expedita et cumque quia optio corrupti dicta.','1992-04-14 06:22:26','1998-02-21 01:54:09'),(20,14,'Autem aut nihil maxime nam culpa ea.','2000-05-17 08:32:17','2006-04-08 23:35:10'),(21,54,'Ut excepturi reiciendis voluptate error qui soluta.','1994-06-06 07:52:05','1986-09-06 07:55:05'),(22,83,'Enim vitae earum vero quae.','1993-05-06 15:45:33','1987-05-02 07:03:14'),(23,32,'Impedit expedita dolorem alias.','1980-08-25 15:32:28','1970-02-11 11:55:21'),(24,13,'Accusantium nostrum officia libero quasi.','2005-12-29 16:26:58','2016-08-17 11:32:21'),(25,79,'Aspernatur iure corrupti ratione quis et molestias tempore.','1991-09-07 12:20:08','1972-01-21 18:14:10'),(26,75,'Dolor nam sed totam omnis libero ut nisi.','1995-05-06 02:31:04','1992-10-06 00:07:11'),(27,83,'Facilis repellendus consequatur impedit eos.','2008-10-25 12:54:23','1989-11-14 01:06:06'),(28,19,'Ipsa aliquam omnis ipsum at sed.','1972-04-30 05:33:39','1988-06-18 05:05:49'),(29,14,'Perferendis laudantium repellendus est.','2007-08-10 08:16:28','1976-10-15 19:34:04'),(30,20,'Nesciunt qui maxime aut iste id eligendi doloribus.','2009-08-16 17:27:11','2003-08-14 10:46:44'),(31,94,'Modi et nihil rerum esse et rem.','1987-04-22 03:11:49','1999-10-31 14:59:23'),(32,93,'Et officia qui asperiores repellat aut.','1977-06-28 22:00:54','1995-12-31 18:33:06'),(33,42,'Rerum harum dolores deserunt nostrum rem.','1985-10-28 21:43:27','1995-06-02 21:59:20'),(34,58,'Ut quibusdam eum velit sequi ab sapiente sint.','2017-03-04 13:14:09','1992-11-10 05:50:23'),(35,25,'Sequi alias laboriosam sed officiis numquam.','2011-01-08 22:19:09','2010-01-15 16:35:02'),(36,7,'Labore dolorum culpa id necessitatibus vero.','1988-05-26 08:20:42','1995-11-27 02:59:13'),(37,29,'Totam voluptate facere voluptas suscipit.','2004-09-18 13:02:45','2004-12-18 17:10:20'),(38,61,'Voluptatum quo amet beatae.','1991-12-15 09:53:08','2003-07-19 14:10:31'),(39,72,'Tempora dignissimos laudantium assumenda ea perspiciatis.','1981-08-07 14:45:26','2006-05-26 21:44:38'),(40,11,'Nulla assumenda voluptatem qui ipsam dolores corrupti.','1999-10-09 20:38:02','1979-12-23 21:40:03'),(41,1,'Sit possimus aperiam rerum corrupti repudiandae in.','1995-07-05 06:26:07','1973-04-23 12:50:48'),(42,67,'Quisquam suscipit laboriosam quo qui totam dignissimos nostrum.','2005-08-29 08:38:01','1976-06-05 03:43:49'),(43,94,'Est dolorum aut explicabo.','2007-10-29 13:34:16','2011-10-20 12:55:14'),(44,45,'Unde qui sed pariatur est rem doloribus.','1973-10-05 16:43:51','1992-10-06 06:19:19'),(45,29,'Quos eius laboriosam totam et molestiae deleniti.','2003-12-31 12:13:23','1986-08-27 18:20:29'),(46,68,'Vero et provident tempore et ut eligendi qui deserunt.','1973-08-29 20:13:01','2018-01-17 23:03:42'),(47,62,'Autem autem ipsum in et officia eius laudantium.','2005-01-23 19:36:18','2019-07-31 23:17:17'),(48,90,'Non odio alias praesentium minus.','1978-11-22 19:02:19','2006-02-08 03:03:21'),(49,36,'Culpa esse dolorem amet.','1998-06-13 00:03:59','1975-04-14 20:36:07'),(50,43,'Quia rem voluptates nostrum provident.','2014-08-27 14:44:59','2006-10-22 03:16:58');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_liked`
--

DROP TABLE IF EXISTS `posts_liked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_liked` (
  `user_id` bigint unsigned NOT NULL,
  `is_liked` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_liked_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_liked`
--

LOCK TABLES `posts_liked` WRITE;
/*!40000 ALTER TABLE `posts_liked` DISABLE KEYS */;
INSERT INTO `posts_liked` VALUES (15,0,'1998-12-29 02:19:24'),(49,0,'1997-08-07 00:40:52'),(17,0,'2016-09-21 06:47:28'),(48,1,'1993-05-20 20:43:40'),(27,1,'2016-09-27 04:03:36'),(22,1,'1987-05-16 21:44:28'),(6,1,'2005-12-29 15:59:26'),(19,1,'1972-09-13 12:18:25'),(15,1,'1973-05-16 06:19:18'),(5,0,'1974-07-30 08:42:05'),(19,1,'1977-11-15 03:50:02'),(25,0,'2015-11-07 15:04:48'),(7,0,'2019-10-26 09:48:13'),(45,0,'1974-01-25 16:48:13'),(15,0,'1998-08-27 17:10:56'),(10,1,'2015-05-25 04:15:40'),(44,1,'1984-01-31 13:37:22'),(15,0,'1999-09-21 05:16:44'),(46,0,'1986-08-05 15:20:25'),(31,0,'1987-05-28 23:49:32'),(1,0,'1984-06-06 11:16:22'),(38,1,'1995-04-22 16:21:46'),(32,0,'2006-08-02 23:16:09'),(49,0,'2009-08-01 09:35:37'),(12,1,'1993-02-14 02:26:10'),(2,0,'2015-12-26 22:26:23'),(23,1,'1995-08-02 06:42:30'),(20,1,'1990-02-24 17:02:55'),(12,1,'2004-01-26 05:11:10'),(23,1,'1979-06-04 15:46:18'),(30,1,'2012-04-09 03:28:30'),(27,1,'1974-12-31 00:48:50'),(22,1,'2015-08-03 13:54:12'),(46,0,'1987-06-04 17:26:16'),(25,1,'2016-10-09 16:15:07'),(48,1,'1980-05-21 14:22:57'),(18,1,'2016-11-05 16:45:10'),(30,1,'1979-08-31 17:15:27'),(17,0,'2005-02-03 14:41:14'),(32,1,'1990-05-11 11:45:47');
/*!40000 ALTER TABLE `posts_liked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL,
  `gender` enum('f','m','x') DEFAULT NULL,
  `birthday` date NOT NULL,
  `photo_id` int unsigned DEFAULT NULL,
  `city` varchar(130) DEFAULT NULL,
  `country` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'f','1970-10-31',38412,'Port Chasityshire','Armenia'),(2,'x','1991-07-13',26900,'South Marionbury','Sierra Leone'),(5,'m','2018-12-18',28201,'Port Wilmaview','Colombia'),(6,'m','2016-03-10',22901,'Brennanside','Bulgaria'),(7,'x','1983-07-15',28263,'South Matt','Armenia'),(12,'f','2012-01-17',24162,'West Gwendolyntown','Jersey'),(13,'x','2007-05-29',21648,'Davisville','Kyrgyz Republic'),(14,'m','1996-03-22',36078,'Freidafort','Dominica'),(15,'x','1985-03-02',12639,'West Stanley','Madagascar'),(16,'x','2020-12-15',37480,'South Elwin','Faroe Islands'),(17,'x','1995-07-19',22380,'Swiftstad','Norfolk Island'),(18,'f','1986-04-11',17218,'New Keatonport','Togo'),(19,'f','1983-11-04',35151,'Katrinaland','Marshall Islands'),(20,'m','1980-01-17',10336,'Tannerstad','Norfolk Island'),(22,'f','2001-03-31',30994,'Arvelland','Gibraltar'),(23,'x','2017-12-21',11542,'East Allenside','Korea'),(25,'m','2012-05-07',31352,'Geovannymouth','Barbados'),(26,'f','1996-10-29',37173,'New Sally','Macao'),(28,'m','2009-04-05',23457,'North Dallas','Guinea'),(29,'x','1986-09-10',14412,'Balistreritown','Honduras'),(31,'m','2001-07-31',20925,'West Lexi','Spain'),(32,'x','2005-10-22',24353,'South Bettye','Ghana'),(34,'m','1977-05-02',19753,'Lockmanstad','Bulgaria'),(35,'m','1990-07-02',28882,'South Alfborough','French Southern Territories'),(36,'x','2020-01-29',34762,'Kohlerside','South Georgia and the South Sandwich Islands'),(38,'x','2016-03-25',29483,'Winifredbury','Cote d\'Ivoire'),(39,'m','1977-03-08',32083,'Joannystad','Solomon Islands'),(40,'m','1983-08-18',23923,'North Deborah','Rwanda'),(41,'m','1973-01-17',38534,'Port Oswald','Belgium'),(44,'m','2007-11-13',28602,'Dellville','New Zealand'),(45,'f','1990-01-31',12253,'New Camdenview','Ghana'),(46,'x','1974-05-31',34521,'Kinghaven','France'),(47,'x','1971-02-19',37650,'South Natalialand','Philippines'),(48,'m','2019-07-18',23242,'New Adalbertoville','Vanuatu'),(51,'f','1980-03-27',30039,'Gerardhaven','Israel'),(52,'x','2021-04-13',26876,'Sylvanfort','Turkmenistan'),(55,'m','2007-05-14',17402,'Jaylonstad','Cambodia'),(57,'x','1985-05-27',30541,'Port Clintbury','Puerto Rico'),(58,'m','2004-08-15',32432,'Harveyfort','Burkina Faso'),(59,'f','1983-02-05',33761,'New Ludie','Norway'),(60,'m','1970-01-15',25232,'Jacquesborough','El Salvador'),(61,'f','2012-09-27',26671,'Torptown','Cocos (Keeling) Islands'),(63,'x','1994-11-22',27711,'South Celia','Gibraltar'),(65,'f','1975-05-30',11359,'North Adellmouth','Venezuela'),(67,'m','1997-07-16',37113,'New Saul','Cocos (Keeling) Islands'),(70,'f','2017-08-11',34161,'New Aracelihaven','Turkey'),(73,'m','2014-06-16',22738,'North Craigfurt','Malawi'),(75,'x','2018-11-08',16226,'West Claudborough','Jordan'),(76,'m','1973-12-18',15638,'East Georgeborough','Botswana'),(77,'x','2019-10-23',34153,'Citlallibury','Luxembourg'),(78,'f','2007-01-03',26732,'North Alvis','Belgium'),(82,'x','1990-07-17',38344,'Port Lisandromouth','Nepal'),(86,'f','2018-12-10',24304,'East Jeniferborough','Cape Verde'),(87,'m','1975-06-13',16979,'Port Ladarius','Pitcairn Islands'),(88,'m','1992-07-02',10561,'Kautzerburgh','Hungary'),(89,'f','2008-11-02',28715,'Trystanshire','Cook Islands'),(91,'m','2015-06-14',35364,'Cartwrightmouth','Brazil'),(92,'m','2016-12-08',37134,'Mohrstad','Panama'),(93,'f','2012-10-22',36177,'Port Elsie','United States of America'),(94,'m','1980-05-06',35345,'Schneiderside','Belarus'),(95,'m','1988-11-07',38135,'Port Araport','Bouvet Island (Bouvetoya)'),(96,'m','1971-12-24',38941,'O\'Konside','Slovakia (Slovak Republic)'),(97,'f','2000-01-02',33013,'Lake Buddy','Dominica'),(98,'m','2016-10-08',10209,'Halhaven','Azerbaijan');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL COMMENT 'ФАМИЛИЯ',
  `email` varchar(120) NOT NULL,
  `phone` char(11) NOT NULL,
  `password_hash` char(65) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_email_idx` (`email`),
  KEY `users_phone_idx` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Buster','Quitzon','elise87@example.net','(089)415-04','7b86057cbd97da0e29c9e8d1c69223c2f68a35af','2015-03-03 00:11:50'),(2,'Joyce','Heidenreich','wilburn.kautzer@example.net','(672)414-54','3bb0f59e1d2d4ff74f71ed0d1917e99aa796aad6','1977-12-24 04:05:56'),(3,'Lacy','Witting','spinka.queenie@example.net','1-047-265-6','72e8db93e211c4e4d3785858f811e5ae4a803afe','2014-07-05 12:45:37'),(4,'Catalina','Runolfsdottir','carolina84@example.com','1-288-871-0','ae73b3fc00d734669508461386654d68ab5e7f95','1986-03-05 06:44:50'),(5,'Brian','Tromp','albertha37@example.com','1-001-300-3','45ca37229e782c687d3298e4e0b56590226c1278','1988-08-22 01:08:34'),(6,'Julio','Boyle','leonora.cormier@example.com','(454)595-59','7c1087fcf27c4af4071712505cd24d41478b7002','2001-11-01 22:17:50'),(7,'Ernestina','Predovic','eladio.marquardt@example.net','+93(2)12891','975d046054a8c12250e7bac3077cffcd1a2c88ed','1974-01-05 06:04:06'),(8,'Drake','Bednar','doug81@example.com','1-553-286-6','a684c4c8f837c118dcd9818c7b304c4f91016734','1990-05-21 03:46:10'),(9,'Kimberly','Feest','cesar07@example.net','350-806-145','3db461aa0432a5346cc37118ebab2f88a68ba442','2016-04-03 06:09:15'),(10,'Rosetta','Bergstrom','ward.august@example.net','045.201.823','30baab86ff3c1905ef579f4aa55e44e3bbe53399','2020-09-03 16:54:57'),(11,'Madalyn','Rutherford','karley.lindgren@example.com','845.896.865','01a6e3f892e8af6e7bc34fb7910bd592ac55bb61','1985-02-15 18:23:44'),(12,'Michale','Wehner','ernie25@example.net','(355)393-86','0f4b8f63d64ebebf4bb42b5c8c1583edf8dcc75a','1975-11-01 11:03:28'),(13,'Lucio','Beier','emacejkovic@example.org','423-412-675','d95f329a27b423a8465c1e419085f16cd8b49dd5','1978-12-29 18:16:45'),(14,'Gonzalo','Brown','qpowlowski@example.com','(436)625-12','0840bad28ca44f46133fdb2b6b794b4627309ec0','2013-06-07 00:18:27'),(15,'Noel','Torphy','rhett.zieme@example.org','301.161.728','6dea9635ca4ee6539182b0c30928432c929da96f','2000-07-14 08:16:40'),(16,'Stefanie','White','schiller.megane@example.com','(523)382-74','e5d636f698a26316c1a251fe7eeeb91be033dc76','1996-09-09 06:05:08'),(17,'Rico','Haag','vmante@example.net','270.512.191','9c46c938a9b53e65c8816db66b2eaf7bd7bde822','1973-04-03 05:29:27'),(18,'Ibrahim','Gusikowski','rosenbaum.johnathon@example.org','446.384.727','8f541f120e356eb19b05684f658021ab09532108','1999-03-01 20:48:13'),(19,'Darian','Borer','jay.kassulke@example.net','1-386-439-7','30af6cb6ae9133cb449bcd62841a2e2d16e689b9','1992-02-11 14:56:49'),(20,'Laila','McLaughlin','reymundo.rosenbaum@example.net','1-165-164-9','7d78933b27901bdf1ede9937c36f17dfefeab9a0','1990-09-17 01:47:34'),(21,'Steve','Pagac','maeve44@example.net','(495)016-79','16298326e0d2c92d4bc123d772fdff65f1cc788c','2009-03-01 15:59:10'),(22,'Alvis','Kling','mitchell.sawayn@example.net','007-439-099','940cf8eec013a065230861b6b3af86a65dde5cfb','1989-05-17 01:44:31'),(23,'Callie','Wyman','cmorissette@example.org','06392998470','9492746113e0f36acb06b3882cd6a2fd338d4286','1982-05-12 04:25:25'),(24,'Melody','Kirlin','america42@example.com','(254)871-67','600e4b4ed670e4f97320e62a27688c4cee1a7014','1973-02-06 18:51:08'),(25,'Isac','Rau','tia.hamill@example.net','+08(7)93530','81823598be29b7b83e9c6621c61655b1abb3efdc','2018-03-23 02:03:53'),(26,'Samara','Johnston','kovacek.joshuah@example.org','06412179730','bd36438cc779f0c85f1588f6801abb973df98140','1978-08-19 22:15:56'),(27,'Carey','Hettinger','blanda.maxime@example.com','1-722-468-2','b67d9605d0b5881289801c7120cba429f9dd1dfa','2011-11-24 09:42:55'),(28,'Geovanni','Hamill','nshanahan@example.com','1-634-226-5','438bb78c212d26d19760ebf730f8532013e608fc','1974-11-03 19:09:50'),(29,'Chaim','Lueilwitz','jadyn37@example.org','01935597071','26f3d49bf2efdc66d284466ec0b08828e566440f','1990-06-26 08:29:20'),(30,'Melvin','Bins','ziemann.lucienne@example.net','(071)252-97','603ae5db14e230ab2dd9122d3dc2d72beeb6bf98','1995-04-22 21:23:49'),(31,'Caterina','Ebert','esmeralda.nitzsche@example.org','655.929.025','bdca03029eea035067f4e5bdd258d57e733c5d20','1988-11-25 20:50:29'),(32,'Darby','Effertz','akeem03@example.com','463.031.198','40de564e41b860183e6027eee43a4799257c821d','2013-06-21 12:54:21'),(33,'Lauren','Kuphal','herzog.minerva@example.com','(720)346-87','6bf4e4cc1a9d287c6c4d389a215c34f4f6f6d81f','1979-12-15 20:30:06'),(34,'Clair','Goodwin','flavie91@example.net','1-609-893-6','8c2f77d77bc3707d8f4334278ae04d0bcd64e5a8','1970-04-03 20:24:06'),(35,'Ellen','Bergnaum','kendrick55@example.net','165.635.830','2363d4d79a9534fddd41f38b78e291e18163d8e4','2003-07-12 09:31:24'),(36,'Jackeline','Walker','nina73@example.com','+96(4)86631','cd288cf876d94c30ce624377a0bd5f26b9f6b2c3','2000-11-10 20:33:12'),(37,'Amari','Kuvalis','littel.jana@example.com','324-671-336','709f1254861e1358944a4feb625045f96cfb4e1a','2011-08-27 21:54:17'),(38,'Kamille','Lindgren','wkirlin@example.net','1-218-543-0','9423672a469f33d86ccf51f12df243cb48cc9bcc','1978-07-29 12:15:37'),(39,'Joanne','Reichel','nannie.howe@example.org','840.276.496','b49b5a40f5578c4cf2f396ab6d09fd6429c1f562','2011-10-26 15:40:42'),(40,'Stan','Dickens','makenna.champlin@example.com','(071)668-90','ee46446d9fb7c3a56311cb207b3761a083c2438b','2018-02-14 00:38:53'),(41,'Bernice','Davis','schiller.evie@example.org','(774)898-25','36e60632e39da900841267a56cecde1529cd1f91','1997-03-21 19:15:55'),(42,'Jenifer','Upton','arely10@example.net','(315)380-35','c27000aadbe8716c7b6a2d5f947d390325d18847','1978-07-25 04:50:46'),(43,'Gabriella','Streich','nrosenbaum@example.com','1-539-379-3','46630ac863cf93daccd55f47b73c39a9c1a4cb7d','1977-07-31 17:36:32'),(44,'Arlie','Dickinson','jacobs.anabelle@example.org','(309)036-86','ff845827b3dd0d9b43441f1fdde93b1e86f8ac4f','2008-12-17 10:21:33'),(45,'Krystel','Gleason','jalon.rippin@example.org','557-454-109','f5805eb3baebefde433b7cebf505bbd16665db13','2001-10-02 08:43:12'),(46,'Meaghan','Willms','louisa.steuber@example.net','06943456439','6f5c30f86c53779e7f76695754adae6579b197c2','1989-10-17 04:39:12'),(47,'Graham','Klocko','aurore.harris@example.com','291-291-168','a39aca91f5918f63819bdb2357f5a703840c8d4c','1976-11-16 14:30:17'),(48,'Violette','O\'Reilly','langosh.kenny@example.com','1-864-111-5','b1bcb0fb9895f19989306926fa0a809449750355','2013-08-16 12:56:36'),(49,'Delores','Miller','svandervort@example.net','02593333616','ebf687f4489e275fd00d464b4c785c9e218f93d7','1976-08-28 10:30:04'),(50,'Edwardo','Stanton','bernie87@example.net','1-212-058-3','c663922a1c32f8420435afde68c466b8f4c99412','1984-09-14 05:41:14'),(51,'Noe','Morissette','tiana67@example.net','032-462-319','467e47d51c278ad906ae5bdcb33fe0927d10e511','1982-03-28 00:54:50'),(52,'Jessyca','Nicolas','vgrant@example.net','+41(7)60796','d4b5609df465886b7b1606655357143df6f3c626','1997-01-19 17:36:26'),(53,'Shawna','Satterfield','bchristiansen@example.org','401.114.666','e7370246cfa69be16a17f45c86dd608cdb1c5c4f','1976-03-20 08:22:31'),(54,'Deontae','Zieme','letitia92@example.com','1-042-567-0','d5eacfa4dc5836c2ee7d09edf81ee4cfa9530cae','2011-09-29 04:12:57'),(55,'Valentina','Wilderman','rodriguez.shania@example.org','06583176920','bca764455e497254d375b4379e467f2ab748ded9','1992-09-26 13:22:58'),(56,'Tito','Padberg','luettgen.katheryn@example.org','07473629105','3324d068a46107a18aa5d24d2fac57baa776047f','1975-04-27 02:39:38'),(57,'Zelma','Howe','halvorson.lloyd@example.net','252.597.745','09963510f97ff4cab8184ff43fb94ff5c92835d4','1989-05-06 23:18:07'),(58,'Heber','Ritchie','hessel.al@example.org','531.359.747','ed8a10e234f78e6cd7ba71e39cdc5ef9c7c01c66','1973-06-04 10:30:10'),(59,'Ron','Parker','bmayer@example.com','1-471-793-0','6214cbadef93235fde52c2da762ef41a00fcbbb6','2012-02-18 05:13:04'),(60,'Audrey','Kassulke','sylvia.hammes@example.net','1-448-427-7','650e3abf0c79d55a804d678aa40bd7d108ce860d','1981-06-13 17:43:51'),(61,'Hayden','Feil','russel.edyth@example.net','255-725-923','942ac1e79c81806b705c7bd74a717279ed2b0d7a','1989-08-16 08:46:44'),(62,'Lolita','Jakubowski','west.brielle@example.com','503-968-187','b680a5ad6e12d868b501b6f7c1a7ac08439de67b','1985-06-25 15:58:58'),(63,'Katharina','Hand','lmorissette@example.com','1-818-358-5','9d0448df032db8695071e380d43dee6d496c079e','1990-03-16 20:27:42'),(64,'Lula','Abernathy','uo\'reilly@example.com','885-210-588','ad4f74ece02c5bde07b8e45117b84c9897cea4f5','2015-04-14 16:41:51'),(65,'Rollin','Will','batz.sid@example.net','(616)394-14','12b8cede3e887be319eed5cf2ece7a30e12e43f1','2004-06-19 14:18:03'),(66,'Nova','Mueller','liliana.hoeger@example.org','(745)379-84','39bb6a4b1bbf03734a9223705e7d499a1cc46516','2004-11-12 14:09:51'),(67,'Berneice','Nienow','pollich.baby@example.org','+05(6)67287','c836b663468ec06106afa146ff5a3d43293b95e9','1988-07-17 23:15:57'),(68,'Jacinto','Hilpert','tyrell22@example.net','303.345.796','6e24e8db189b783e4241a049621362806c2724ad','2002-09-08 09:53:45'),(69,'Pat','Buckridge','predovic.wilton@example.net','1-200-418-9','3dcb56dfcd18d1d9799d19d0e20e0e175cc93940','1995-02-04 15:20:57'),(70,'Rickie','Mohr','ora58@example.com','766-547-890','baa138e88f7ecc42fac97ba101b9dd4656b8b5b1','2008-08-10 16:09:41'),(71,'Wilhelmine','Turner','jessie23@example.com','1-764-354-5','6da79c6d91665abb321ea37ce8e34662953ed1fd','1991-01-29 07:10:07'),(72,'Brennan','Rowe','vivienne.doyle@example.com','+13(9)71942','48d1ce66bcae2e256c0fa57574ef04c7e08c5991','1971-08-18 19:47:10'),(73,'Ewell','Grady','ojohnson@example.com','383-794-341','41374ea953d500fa8477169216cd512aba349fb4','1994-05-26 08:16:42'),(74,'Lilla','Pollich','walton59@example.net','392-126-739','872de6cc908f4deb6cafda7d45269650692754ce','1972-09-05 05:03:04'),(75,'Irma','Pacocha','arnoldo60@example.org','03206457584','baea334869ff4d2549dcd808e08f59444e7adff8','2020-07-01 17:15:18'),(76,'Dora','Boyer','kwilderman@example.org','442.775.358','f2b9481e1ed8afdfa035644970acf9e200028b32','1983-04-06 21:56:16'),(77,'Letha','Vandervort','floy.davis@example.com','+79(0)15459','3ce011ad870a439dada65100267eff2ae0b96eac','1993-11-17 21:00:12'),(78,'Anabelle','Dibbert','belle30@example.org','(448)274-18','57b1b4a1526df48b837c34330fcb3fae4bae6ae8','2010-08-24 19:42:43'),(79,'Hassie','McCullough','kameron.hackett@example.org','03256812147','dabc95cd6fe2f2161b5951afad2cfef6be866e42','2009-07-25 17:09:37'),(80,'Paige','Cole','vhauck@example.com','1-688-389-3','cdbccb3784ce18f1619e740420f797a8f8b6b0f8','2000-05-20 01:28:36'),(81,'Margaretta','Kiehn','mireya.sporer@example.org','(112)719-21','d9e707a339393dbf082f0eb81a4f6abf48aec464','2014-04-04 07:34:37'),(82,'Westley','Kovacek','gbreitenberg@example.net','1-577-863-4','f57d3e79c1027cd5fc9d1ad8c5e6de7d49f2ae30','2000-04-18 10:24:20'),(83,'Dedric','Wolf','sheridan.hoppe@example.net','1-306-702-0','ce5c4187814eb726abed6d0d3335bb00c694a803','1986-05-27 04:06:40'),(84,'Darius','Watsica','mhahn@example.com','1-061-991-8','aeb9f4be7258f7ee44e471e3449b9a023421b1f0','2009-06-02 19:48:41'),(85,'Durward','Jacobson','aurelio21@example.org','267-309-557','245efe336bcea6e925859c9a1335d8bf5dd38a29','1979-02-07 01:41:13'),(86,'Vicente','Crooks','amaya.barton@example.net','410.349.171','7ec1d49edf43dd35400742b029ed5188ea62e440','1970-03-13 11:59:15'),(87,'Yoshiko','Funk','yasmeen36@example.net','151.595.797','21809e71f6f8fde17f5a8ec5837d1d669e41b3a4','1975-11-24 15:43:46'),(88,'Kiana','Waelchi','xmueller@example.net','1-635-993-5','3a7a926a8070cbc06a58ad6a2f7b695b417c7d09','2001-06-04 16:13:30'),(89,'Sydnie','Zemlak','javonte.marks@example.org','+01(1)47593','ac8d490d6019abf8766315112ed6ceb7bff14934','1991-12-02 16:11:14'),(90,'Yessenia','Wuckert','casper.makayla@example.org','555.339.660','b0fdbe33d1c29be077b6ce14deaa0ca292850f92','1970-11-27 14:50:05'),(91,'Raegan','Hammes','franecki.andreane@example.com','+82(9)93288','dace2861f14a7199e43e11b94f3c353727a5d3cc','1986-06-26 12:28:12'),(92,'Adalberto','Baumbach','iratke@example.net','+90(0)99844','b3a8803b6051e417c1e30bfec038456e4c240ebc','1974-09-14 09:23:42'),(93,'Jordyn','Volkman','lacy24@example.org','1-196-302-9','3394365d6b1f59e1b70b94d9f1e36cc1bae5e4c5','2015-12-01 13:26:42'),(94,'Jany','Deckow','mccullough.corene@example.net','1-117-272-3','34fe83b0a9691291394b2d048f5300d212dead7a','1982-06-19 21:18:28'),(95,'Hosea','Harris','co\'kon@example.com','+02(5)25623','a4cf44f9d0a1651a58d57fee4de5684a42155bb1','1982-08-20 08:23:22'),(96,'Bradley','Strosin','wdavis@example.com','301.390.315','8c9f18013a919ac5f68d974572b95cf34aba7b42','1980-10-23 01:40:27'),(97,'Reece','Roob','lsteuber@example.org','00207459387','99fb163b19823936df3117f051f8947e4830ff7e','2020-05-30 23:41:16'),(98,'Bertha','Hintz','webster.rippin@example.com','882-013-758','7e4d1e483241d1221e1abf76be219d2d60967e51','1983-08-11 07:27:42'),(99,'Hannah','Wunsch','fay.german@example.net','478.237.783','8e91adc944a71a78270b86a1f2aeeaaca7f07e7b','2019-10-23 10:33:49'),(100,'Chanel','Roberts','cerdman@example.org','1-925-149-5','f1d5f106971b6bd3b573859ae03e07b61d22d3e5','1986-01-31 10:34:17');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_liked`
--

DROP TABLE IF EXISTS `users_liked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_liked` (
  `user_id` bigint unsigned NOT NULL,
  `is_liked` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`),
  CONSTRAINT `users_liked_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_liked`
--

LOCK TABLES `users_liked` WRITE;
/*!40000 ALTER TABLE `users_liked` DISABLE KEYS */;
INSERT INTO `users_liked` VALUES (20,0,'1984-12-18 04:03:53'),(91,0,'1979-04-24 23:21:23'),(60,1,'2006-02-28 18:11:47'),(70,0,'1998-12-08 22:28:02'),(54,0,'1982-07-05 13:56:38'),(56,0,'1978-02-15 19:46:37'),(96,0,'1990-02-04 19:16:28'),(35,0,'2007-08-21 06:52:46'),(68,0,'1973-03-23 09:06:07'),(37,0,'2018-09-12 09:04:09'),(79,1,'1988-09-20 00:04:32'),(13,1,'2005-06-17 02:05:02'),(88,1,'1971-08-03 22:07:39'),(32,0,'2008-02-02 14:11:45'),(28,0,'1996-12-02 11:53:23'),(96,1,'2016-11-17 21:48:58'),(96,0,'2011-10-14 02:26:37'),(89,0,'2018-09-03 21:03:57'),(27,0,'2006-03-09 00:40:22'),(83,0,'1982-08-05 18:46:08');
/*!40000 ALTER TABLE `users_liked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'vk'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-31 13:08:48
