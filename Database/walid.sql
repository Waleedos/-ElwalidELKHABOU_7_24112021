-- MariaDB dump 10.19  Distrib 10.5.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ewek_groupomania
-- ------------------------------------------------------
-- Server version	10.5.13-MariaDB-0ubuntu0.21.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publication_date` datetime NOT NULL DEFAULT current_timestamp(),
  `content` text NOT NULL,
  `user_id` smallint(5) unsigned DEFAULT NULL,
  `post_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Comments_Users_id` (`user_id`),
  KEY `fk_Comments_Posts_id` (`post_id`),
  CONSTRAINT `fk_Comments_Posts_id` FOREIGN KEY (`post_id`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Comments_Users_id` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES (2,'2021-12-14 21:08:43','Très belle Plage & vue',2,9),(3,'2021-12-14 21:09:01','c\'est dans quel pays ?',2,8),(4,'2021-12-14 21:09:29','waw',2,5),(5,'2021-12-14 21:09:43','Oui',2,7),(6,'2021-12-14 21:10:03','Cela veut tout dir',2,6),(7,'2021-12-30 00:44:10','Bien',1,9),(8,'2021-12-30 00:44:54','Très Bien',1,8),(9,'2021-12-30 00:45:08','Yes, I Agree',1,7),(10,'2021-12-30 00:45:23','Oui, j\"approuve',1,6),(11,'2021-12-30 00:45:44','C\'est fantastique',1,5),(12,'2021-12-30 07:36:41','Yes, I Like this',10,9),(13,'2021-12-30 08:37:32','Peut tu preciser ce graphique STP!',5,12),(14,'2021-12-30 08:37:59','HH, Yes, I Love it',5,9),(15,'2021-12-30 08:38:17','C\'est ou cet endroit ?',5,8),(16,'2021-12-30 08:38:31','Yes I Believe',5,7),(17,'2021-12-30 08:38:50','Great - Tu a tout dit',5,6),(18,'2021-12-30 08:39:06','Waw, Merveilleux',5,5),(19,'2021-12-30 08:48:58','Beautiful',8,10),(20,'2021-12-30 08:49:10','I Like it',8,9),(21,'2021-12-30 08:49:40','Where is this place ?',8,8),(23,'2021-12-30 08:50:10','of course',8,7),(24,'2021-12-30 08:50:20','YEEEEEEEESSSSSS',8,6),(25,'2021-12-30 08:50:30','Scaring',8,5);
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Likes`
--

DROP TABLE IF EXISTS `Likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` tinyint(4) NOT NULL,
  `user_id` smallint(5) unsigned NOT NULL,
  `post_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Likes_Users_id` (`user_id`),
  KEY `fk_Likes_Posts_id` (`post_id`),
  CONSTRAINT `fk_Likes_Posts_id` FOREIGN KEY (`post_id`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Likes_Users_id` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Likes`
--

LOCK TABLES `Likes` WRITE;
/*!40000 ALTER TABLE `Likes` DISABLE KEYS */;
INSERT INTO `Likes` VALUES (11,1,2,9),(12,1,2,7),(14,1,2,5),(15,1,6,6),(17,1,1,10),(18,1,1,8),(20,1,10,5),(23,-1,10,7),(25,1,10,6),(26,1,5,12),(27,-1,5,10),(28,1,5,9),(29,1,5,8),(30,1,5,7),(31,1,5,6),(32,1,5,5),(33,1,8,12),(34,1,8,10),(37,1,8,9),(38,-1,8,8),(39,1,8,7),(40,1,8,6),(41,1,8,5),(51,0,1,9),(53,0,1,12),(54,1,2,12),(55,1,2,10),(56,-1,2,8),(58,1,2,6);
/*!40000 ALTER TABLE `Likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notification_types`
--

DROP TABLE IF EXISTS `Notification_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notification_types` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notification_types`
--

LOCK TABLES `Notification_types` WRITE;
/*!40000 ALTER TABLE `Notification_types` DISABLE KEYS */;
INSERT INTO `Notification_types` VALUES (1,'reaction'),(2,'comment'),(3,'answer');
/*!40000 ALTER TABLE `Notification_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notifications`
--

DROP TABLE IF EXISTS `Notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` smallint(5) unsigned NOT NULL,
  `initiator_id` smallint(5) unsigned DEFAULT NULL,
  `post_id` mediumint(8) unsigned NOT NULL,
  `type_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Notifications_Users_id` (`user_id`),
  KEY `fk_Notifications_Initiator_id` (`initiator_id`),
  KEY `fk_Notifications_Posts_id` (`post_id`),
  KEY `fk_Notifications_Notifications_types_id` (`type_id`),
  CONSTRAINT `fk_Notifications_Initiator_id` FOREIGN KEY (`initiator_id`) REFERENCES `Users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_Notifications_Notifications_types_id` FOREIGN KEY (`type_id`) REFERENCES `Notification_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Notifications_Posts_id` FOREIGN KEY (`post_id`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Notifications_Users_id` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notifications`
--

LOCK TABLES `Notifications` WRITE;
/*!40000 ALTER TABLE `Notifications` DISABLE KEYS */;
INSERT INTO `Notifications` VALUES (11,4,2,9,1),(12,4,2,9,2),(13,5,2,8,2),(14,7,2,7,1),(15,6,2,6,1),(16,9,2,5,1),(17,9,2,5,2),(18,7,2,7,2),(19,6,2,6,2),(20,2,1,10,1),(21,4,1,9,2),(22,2,1,9,3),(23,2,1,8,3),(24,5,1,8,2),(25,7,1,7,2),(26,2,1,7,3),(27,6,1,6,2),(28,2,1,6,3),(29,9,1,5,2),(30,2,1,5,3),(31,5,1,8,1),(32,9,10,5,1),(33,6,10,6,1),(34,7,10,7,1),(35,7,10,7,1),(36,6,10,6,1),(37,6,10,6,1),(38,2,10,9,3),(39,4,10,9,2),(40,1,10,9,3),(41,1,5,12,1),(42,1,5,12,2),(43,2,5,10,1),(44,4,5,9,1),(45,2,5,9,3),(46,4,5,9,2),(47,1,5,9,3),(48,10,5,9,3),(49,2,5,8,3),(50,1,5,8,3),(51,7,5,7,1),(52,7,5,7,2),(53,2,5,7,3),(54,1,5,7,3),(55,6,5,6,1),(56,6,5,6,2),(57,2,5,6,3),(58,1,5,6,3),(59,9,5,5,2),(60,2,5,5,3),(61,1,5,5,3),(62,9,5,5,1),(63,1,8,12,1),(64,2,8,10,1),(65,2,8,10,2),(66,4,8,9,1),(67,2,8,9,3),(68,4,8,9,2),(69,1,8,9,3),(70,10,8,9,3),(71,5,8,9,3),(72,4,8,9,1),(73,4,8,9,1),(74,5,8,8,1),(75,2,8,8,3),(76,5,8,8,2),(77,1,8,8,3),(78,7,8,7,1),(79,2,8,7,3),(80,7,8,7,2),(81,1,8,7,3),(82,5,8,7,3),(83,2,8,7,3),(84,7,8,7,2),(85,1,8,7,3),(86,5,8,7,3),(87,6,8,6,1),(88,6,8,6,2),(89,2,8,6,3),(90,1,8,6,3),(91,5,8,6,3),(92,9,8,5,1),(93,9,8,5,2),(94,2,8,5,3),(95,1,8,5,3),(96,5,8,5,3),(97,4,1,9,1),(98,4,1,9,1),(99,1,2,12,1),(100,5,2,8,1),(101,6,2,6,1),(102,6,2,6,1);
/*!40000 ALTER TABLE `Notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posts`
--

DROP TABLE IF EXISTS `Posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Posts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `publication_date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` smallint(5) unsigned DEFAULT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Posts_Users_id` (`user_id`),
  CONSTRAINT `fk_Posts_Users_id` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posts`
--

LOCK TABLES `Posts` WRITE;
/*!40000 ALTER TABLE `Posts` DISABLE KEYS */;
INSERT INTO `Posts` VALUES (5,'2021-12-14 18:09:26',9,'http://localhost:3000/images/Capture_d’écran_2021-12-14_17-37-30_1639501766668.png','Voila un endroit merveilleux'),(6,'2021-12-14 18:13:55',6,'http://localhost:3000/images/11_1639502035579.png','Allez Au sommets, nous serons seuls làba'),(7,'2021-12-14 18:15:01',7,'http://localhost:3000/images/499D8D18-676E-42FA-84AB-2B883442BEFD_1639502101523.png','Une rencontre à vie'),(8,'2021-12-14 18:15:56',5,'http://localhost:3000/images/10_1639502156793.png','Le Beau vieux temps'),(9,'2021-12-14 18:17:01',4,'http://localhost:3000/images/333_1639502221004.png','le repos'),(10,'2021-12-14 18:27:23',2,'http://localhost:3000/images/777777_1639502843555.png','Aimer l\'océan'),(12,'2021-12-24 00:11:59',1,'http://localhost:3000/images/Capture_d’écran_2021-12-24_00-11-33_1640301119936.png','Juste un test apres les mises à jours des dependances');
/*!40000 ALTER TABLE `Posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pictureurl` varchar(255) DEFAULT NULL,
  `outline` varchar(255) DEFAULT NULL,
  `isadmin` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ind_uni_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Vladimirovsky','vladimirovsky@yahoo.com','U2FsdGVkX19v/T1eyyqaBr9tGcaj/nbx4wiw+4czleIa23Ehr+E+nEbokxeR7j7KvXSoT7xIlw3wRGyPiV5SlkboJqQf5zsBFchSUcO7R9I=','http://localhost:3000/images/Capture_d’écran_2021-12-31_02-57-08_1640923762929.png',NULL,1),(2,'Christophe LeGrand','christophe@paris.com','U2FsdGVkX18jQZ2n0XyqbWy6nSfk36/5VfSv/dny0EMflno0AKtVFJzTUrWVzIxw265jfJsVgIlG9i4ohB5mBUG+KiTSCRoWKW6RsCikg74=','http://localhost:3000/images/555_1639502673118.png',NULL,0),(3,'Michel Dupon','michel@le95.fr','U2FsdGVkX18q/A4Si1cqReXWutUlXUaDXzgaEzqaaaoDrsXpa5HID5k4Cg/FsB7ibDZ8R91EhpLHn7PsrvMOOXdlhUyYAujx2cR3LJdTPrs=','http://localhost:3000/images/888_1639501599053.png',NULL,0),(4,'Lucette Marenier','l.marenier@grouporama.fr','U2FsdGVkX1+kK18+9e/h+JrMOJ8rUmKJ/lqPgeKn/tAswIW+sG7fcsHeH9mY6ooFr/kspPOeqLfdixEOQYQWJ0QbjHyg2/oBn7gAfZ9RhxI=','http://localhost:3000/images/222_1639502195404.png',NULL,0),(5,'Lucie Calanne','calanne.lucie@live.fr','U2FsdGVkX1/5s/Lc4smE1Fcx5u29BUbxy402l8jFdpXP0joqUrHNs3vn/nAkcnfXKRYGfAIuIlQWlZw8DMfiEWTDRPAbweHXRHg40nn0Avo=','http://localhost:3000/images/666_1639502127011.png',NULL,0),(6,'EL-WALID EL-KHABOU','alkhabou@aol.com','U2FsdGVkX18WWsBhD7NrNSxNE37K0/EKISVUW3m4VGmOK/ReL9dtK+uwwTo3LVyRJMOIHXxewychSalDV/OJ1ZHzuz/V/BnjbE6KgR//XjQ=','http://localhost:3000/images/Walid_Photo_ID_1639577742040_1640860535774.png',NULL,1),(7,'Jean Michel SIOUD','sioud@orange.fr','U2FsdGVkX19Ii8poL102vvG1eF0iciiw7b41Km4XQU64TAGHqagcJAX3fWPNp3A+gntny7vyXSbEaGHg7Fmaw5GoCcxFD2iQb43048zPVIw=','http://localhost:3000/images/444_1639502057674.png',NULL,0),(8,'Mme Linda Osset','l.osset@gmail.com','U2FsdGVkX19IZcyymsg5ClpBZ9LjHidS2om2JeUJSLAC6q6yfCdfrFopR4mcT2P/SlZY+hcGVr4l1VeJ55FTAdIePpzE8JlcHhGQgKfmn6g=','http://localhost:3000/images/Capture_d’écran_2021-12-14_21-42-17_1639514553515.png',NULL,0),(9,'Alexandre','alexandre@email.com','U2FsdGVkX19cBjpbCjJleI+hpiIr6Nca3qKtcISW+jnBK5L3/P8MTRAwLqrLsYgHNkxW/gAE+EVXGj6I7SSciXX2urT7XyZkEfD3qOxuHxw=','http://localhost:3000/images/7787_1639501711323.png',NULL,0),(10,'Alex','alex@aol.com','U2FsdGVkX18Ank/GCLJ8h7qUrjQg7RYEnVpNJhcVI1JoN/9st7MLaHfLdKOIshzjsws8xobS/m1vDjow8dwpPXezhMfM9hZXIJxiDaQbstE=',NULL,NULL,0),(11,'LeGendre','legendre@sfr.fr','U2FsdGVkX1+gJAZqjJQX+i3FtkZQilfNHazHlCaTVp1gXwHjRLFXn2URH3EKt+MCl0+anvSoYfFeBnpUh3jy6v+rajufGRYpPl3Y3FYIdqg=','http://localhost:3000/images/5544_1640860261434.png','When there is a will, there is a well.',0);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-05  8:24:55
