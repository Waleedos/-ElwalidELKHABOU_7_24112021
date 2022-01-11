-- MariaDB dump 10.19  Distrib 10.5.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: groupomania_walid
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES (2,'2021-12-14 21:08:43','Très belle Plage & vue',2,9),(3,'2021-12-14 21:09:01','c\'est dans quel pays ?',2,8),(4,'2021-12-14 21:09:29','waw',2,5),(5,'2021-12-14 21:09:43','Oui',2,7),(6,'2021-12-14 21:10:03','Cela veut tout dir',2,6),(7,'2022-01-08 23:00:13','I Got This',1,9),(8,'2022-01-08 23:00:24','Ok I Agree',1,8),(9,'2022-01-08 23:00:40','Yes I completely Agree',1,7),(10,'2022-01-08 23:01:03','From where you got the idea, that\'s perfect',1,6),(13,'2022-01-08 23:48:20','I Like thus photo',11,10),(17,'2022-01-09 00:41:18','Effectivement, Cela est vrais!',12,10),(18,'2022-01-09 00:41:43','Barba',12,9),(19,'2022-01-09 00:41:57','Which country ?',12,8),(20,'2022-01-09 00:42:08','No comment',12,7),(21,'2022-01-09 00:42:15','YES',12,6),(22,'2022-01-09 00:42:22','Wow',12,5),(23,'2022-01-09 00:50:34','Oui, I Believe also',13,12),(25,'2022-01-09 00:50:59','Not Understand',13,10),(26,'2022-01-09 00:51:11','Yes I like this',13,9),(27,'2022-01-09 00:57:06','L\'Amour Eternel',13,7),(28,'2022-01-09 01:06:49','Je confirme',18,12),(30,'2022-01-09 02:50:44','Yes, Of Cours',1,13),(31,'2022-01-09 02:53:39','Haha, Oui, Bien Evidement',15,14),(32,'2022-01-09 02:54:00','Tres belle Presentation',15,13),(33,'2022-01-09 02:54:19','Moi Aussi, je suis d\'accord',15,12),(34,'2022-01-09 02:54:36','J\'addor',15,9),(35,'2022-01-09 02:54:52','Tunisia',15,8),(36,'2022-01-09 02:55:22','Nous ne pouvons vivre sans amour',15,7),(37,'2022-01-09 02:55:52','L\'amour des etudes',15,6),(38,'2022-01-09 02:56:06','OHHHH, Fantastic',15,5),(39,'2022-01-09 23:14:25','I like this photo',15,17),(40,'2022-01-09 23:14:48','Yes I do',15,17),(41,'2022-01-09 23:34:39','Effectivement ',15,16),(42,'2022-01-09 23:36:17','Merci',1,7);
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Likes`
--

LOCK TABLES `Likes` WRITE;
/*!40000 ALTER TABLE `Likes` DISABLE KEYS */;
INSERT INTO `Likes` VALUES (11,1,2,9),(12,1,2,7),(13,1,2,6),(14,1,2,5),(15,1,6,6),(18,1,1,10),(19,1,1,9),(20,1,1,8),(22,1,1,6),(25,1,11,10),(26,1,11,8),(27,1,11,7),(29,1,12,10),(30,-1,12,9),(31,-1,12,8),(32,-1,12,7),(33,1,12,6),(34,1,12,5),(35,1,13,13),(36,1,13,12),(38,-1,13,10),(39,1,13,9),(40,1,13,7),(41,1,18,12),(42,1,18,7),(44,1,1,7),(45,1,1,13),(46,1,1,12),(47,1,1,5),(48,1,15,14),(49,1,15,13),(50,1,15,12),(51,1,15,10),(52,1,15,9),(53,1,15,8),(54,1,15,7),(55,1,15,6),(56,1,15,5),(57,1,17,14),(58,1,17,12),(59,1,17,8),(60,1,17,5),(66,-1,13,16),(67,1,15,17),(68,1,15,16),(69,1,1,17),(75,1,1,16);
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
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notifications`
--

LOCK TABLES `Notifications` WRITE;
/*!40000 ALTER TABLE `Notifications` DISABLE KEYS */;
INSERT INTO `Notifications` VALUES (11,4,2,9,1),(12,4,2,9,2),(13,5,2,8,2),(14,7,2,7,1),(15,6,2,6,1),(16,9,2,5,1),(17,9,2,5,2),(18,7,2,7,2),(19,6,2,6,2),(21,2,1,10,1),(22,4,1,9,1),(23,2,1,9,3),(24,4,1,9,2),(25,5,1,8,1),(26,5,1,8,2),(27,2,1,8,3),(28,7,1,7,1),(29,7,1,7,2),(30,2,1,7,3),(31,6,1,6,1),(32,6,1,6,2),(33,2,1,6,3),(36,2,11,10,1),(37,2,11,10,2),(38,5,11,8,1),(39,2,11,8,3),(40,1,11,8,3),(41,5,11,8,2),(42,7,11,7,1),(43,2,11,7,3),(44,7,11,7,2),(45,1,11,7,3),(49,2,12,10,1),(50,2,12,10,2),(51,11,12,10,3),(52,4,12,9,1),(53,4,12,9,2),(54,2,12,9,3),(55,1,12,9,3),(56,5,12,8,1),(57,5,12,8,2),(58,2,12,8,3),(59,1,12,8,3),(60,11,12,8,3),(61,7,12,7,1),(62,7,12,7,2),(63,2,12,7,3),(64,1,12,7,3),(65,11,12,7,3),(66,6,12,6,1),(67,6,12,6,2),(68,2,12,6,3),(69,1,12,6,3),(70,9,12,5,1),(71,9,12,5,2),(72,2,12,5,3),(73,12,13,12,1),(74,12,13,12,2),(79,2,13,10,1),(80,2,13,10,2),(81,11,13,10,3),(82,12,13,10,3),(83,4,13,9,1),(84,4,13,9,2),(85,2,13,9,3),(86,1,13,9,3),(87,12,13,9,3),(88,7,13,7,1),(89,7,13,7,2),(90,2,13,7,3),(91,1,13,7,3),(92,11,13,7,3),(93,12,13,7,3),(94,12,18,12,2),(95,13,18,12,3),(96,12,18,12,1),(101,7,18,7,1),(102,7,1,7,1),(103,7,1,7,1),(104,13,1,13,1),(105,13,1,13,2),(106,12,1,12,1),(107,9,1,5,1),(108,18,15,14,1),(109,18,15,14,2),(110,13,15,13,1),(111,13,15,13,2),(112,1,15,13,3),(113,12,15,12,1),(114,13,15,12,3),(115,12,15,12,2),(116,18,15,12,3),(117,2,15,10,1),(118,4,15,9,1),(119,4,15,9,2),(120,2,15,9,3),(121,1,15,9,3),(122,12,15,9,3),(123,13,15,9,3),(124,5,15,8,1),(125,5,15,8,2),(126,2,15,8,3),(127,1,15,8,3),(128,12,15,8,3),(129,7,15,7,1),(130,2,15,7,3),(131,7,15,7,2),(132,1,15,7,3),(133,12,15,7,3),(134,13,15,7,3),(135,6,15,6,1),(136,2,15,6,3),(137,6,15,6,2),(138,1,15,6,3),(139,12,15,6,3),(140,9,15,5,1),(141,9,15,5,2),(142,2,15,5,3),(143,12,15,5,3),(144,18,17,14,1),(145,12,17,12,1),(146,5,17,8,1),(147,9,17,5,1),(148,1,13,16,1),(149,1,13,16,1),(150,1,13,16,1),(151,1,13,16,1),(152,1,13,16,1),(153,1,15,16,1),(154,1,15,16,2),(155,15,1,17,1),(156,7,1,7,2),(157,2,1,7,3),(158,12,1,7,3),(159,13,1,7,3),(160,15,1,7,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posts`
--

LOCK TABLES `Posts` WRITE;
/*!40000 ALTER TABLE `Posts` DISABLE KEYS */;
INSERT INTO `Posts` VALUES (5,'2021-12-14 18:09:26',9,'http://localhost:3000/images/Capture_d’écran_2021-12-14_17-37-30_1639501766668.png','Voila un endroit merveilleux'),(6,'2021-12-14 18:13:55',6,'http://localhost:3000/images/11_1639502035579.png','Allez Au sommets, nous serons seuls làba'),(7,'2021-12-14 18:15:01',7,'http://localhost:3000/images/499D8D18-676E-42FA-84AB-2B883442BEFD_1639502101523.png','Une rencontre à vie'),(8,'2021-12-14 18:15:56',5,'http://localhost:3000/images/10_1639502156793.png','Le Beau vieux temps'),(9,'2021-12-14 18:17:01',4,'http://localhost:3000/images/333_1639502221004.png','le repos'),(10,'2021-12-14 18:27:23',2,'http://localhost:3000/images/777777_1639502843555.png','Aimer l\'océan'),(12,'2022-01-09 00:40:14',12,'http://localhost:3000/images/2_1641685214885.png','Quelque soit la longueure du chemin, La perseverance atteindra la fin'),(13,'2022-01-09 00:49:54',13,'http://localhost:3000/images/3_1641685794821.png','Il est Impératif de toujours s\'echanger les idées '),(14,'2022-01-09 01:08:34',18,'http://localhost:3000/images/4_1641686914866.png','La Force Mentale'),(15,'2022-01-09 03:20:58',17,'http://localhost:3000/images/5_1641694858610.png','Effectivement'),(16,'2022-01-09 15:02:24',1,'http://localhost:3000/images/5_1641736944039.png','un autre test'),(17,'2022-01-09 23:08:20',15,'http://localhost:3000/images/11_1641766100309.png','La Beauté et la Grandeur de la Nature');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Vladimirovsky','vladimirovsky@yahoo.com','U2FsdGVkX19v/T1eyyqaBr9tGcaj/nbx4wiw+4czleIa23Ehr+E+nEbokxeR7j7KvXSoT7xIlw3wRGyPiV5SlkboJqQf5zsBFchSUcO7R9I=','http://localhost:3000/images/Capture_d’écran_2021-12-31_02-57-08_1640923762929_1641724963553_1641765095821.png','Pour tout le monde, Je suis à votre entière disposition .',1),(2,'Christophe LeGrand','christophe@paris.com','U2FsdGVkX18jQZ2n0XyqbWy6nSfk36/5VfSv/dny0EMflno0AKtVFJzTUrWVzIxw265jfJsVgIlG9i4ohB5mBUG+KiTSCRoWKW6RsCikg74=','http://localhost:3000/images/555_1639502673118.png',NULL,0),(3,'Michel Dupon','michel@le95.fr','U2FsdGVkX18q/A4Si1cqReXWutUlXUaDXzgaEzqaaaoDrsXpa5HID5k4Cg/FsB7ibDZ8R91EhpLHn7PsrvMOOXdlhUyYAujx2cR3LJdTPrs=','http://localhost:3000/images/888_1639501599053.png',NULL,0),(4,'Lucette Marenier','l.marenier@grouporama.fr','U2FsdGVkX1+kK18+9e/h+JrMOJ8rUmKJ/lqPgeKn/tAswIW+sG7fcsHeH9mY6ooFr/kspPOeqLfdixEOQYQWJ0QbjHyg2/oBn7gAfZ9RhxI=','http://localhost:3000/images/222_1639502195404.png',NULL,1),(5,'Lucie Calanne','calanne.lucie@live.fr','U2FsdGVkX1/5s/Lc4smE1Fcx5u29BUbxy402l8jFdpXP0joqUrHNs3vn/nAkcnfXKRYGfAIuIlQWlZw8DMfiEWTDRPAbweHXRHg40nn0Avo=','http://localhost:3000/images/666_1639502127011.png',NULL,0),(6,'EL-WALID EL-KHABOU','alkhabou@aol.com','U2FsdGVkX18WWsBhD7NrNSxNE37K0/EKISVUW3m4VGmOK/ReL9dtK+uwwTo3LVyRJMOIHXxewychSalDV/OJ1ZHzuz/V/BnjbE6KgR//XjQ=','http://localhost:3000/images/large-removebg-preview_1641724862113.png',NULL,1),(7,'Jean Michel SIOUD','sioud@orange.fr','U2FsdGVkX19Ii8poL102vvG1eF0iciiw7b41Km4XQU64TAGHqagcJAX3fWPNp3A+gntny7vyXSbEaGHg7Fmaw5GoCcxFD2iQb43048zPVIw=','http://localhost:3000/images/444_1639502057674.png',NULL,0),(8,'Mme Linda Osset','l.osset@gmail.com','U2FsdGVkX19IZcyymsg5ClpBZ9LjHidS2om2JeUJSLAC6q6yfCdfrFopR4mcT2P/SlZY+hcGVr4l1VeJ55FTAdIePpzE8JlcHhGQgKfmn6g=','http://localhost:3000/images/Capture_d’écran_2021-12-14_21-42-17_1639514553515.png',NULL,0),(9,'Alexandre','alexandre@email.com','U2FsdGVkX19cBjpbCjJleI+hpiIr6Nca3qKtcISW+jnBK5L3/P8MTRAwLqrLsYgHNkxW/gAE+EVXGj6I7SSciXX2urT7XyZkEfD3qOxuHxw=','http://localhost:3000/images/7787_1639501711323.png',NULL,0),(10,'NONO','nono@nono.com','U2FsdGVkX19jsox3xLZeWCjcZMnCmG3SYRgzYfnBFREtQyWvt14vpcNls3YPDTbtR3ytIRRLgwGazAcLlbWBQSWf4whYS8orBfVaGEcFvNs=',NULL,NULL,0),(11,'Salut','salut@salut.com','U2FsdGVkX1/cSOwPNn6k8I/CEuhHhkazxcZfG66qKW06Jg50boYNjQT1LGCMwbLYk8mHm0S269loxcLiLPI4rgsP5w2MOKNQmUlIAPCJ2LQ=','http://localhost:3000/images/111_1641682055317.png',NULL,0),(12,'Khaled LAROU','khaled@gmail.com','U2FsdGVkX18xxvMTTU4+1LbGW/3JeOK31CY6kkVX2QwJ0AgB2sYotANNImtLJGUj4YbT1imB8vdq6fv5ooC1/ye0G829G+Xa39NpLCZOzws=','http://localhost:3000/images/1f468-1f3fd-1f9b1_1641685044565.png','Il faut dire que de tout temps, les écrivains, les philosophes ou les poètes ont tenté de mieux cerner la traversée existentielle de l\'être humain.',0),(13,'Alex Vitron','alex@aol.com','U2FsdGVkX19GhNk+XVLHrypqr99QlcIx1EEc2fMpwGitHOnu0ZtBCoTB7BndgxdkVPW81yzybpU6Yb6aBoCqFYBqJ+I/5x+9iuZlbBXJRRk=','http://localhost:3000/images/black-young-man-avatar-character-vector-16849944_1641685576396.png','Un seul être vous manque et tout est dépeuplé  Lamartine',0),(14,'Walid CAMARA','walid@walid.com','U2FsdGVkX193zW9hc8Ve6zgXjE/g3NU0OonfnZp4SYPjh0yrqvZB45l4wZy/tZS/3WfjgaWt86lhnMSoRVSHU4oJ2I73csNg6kVjPOGf6vY=','http://localhost:3000/images/images_(1)_1641686307196.png','Dans la liberté commune, nul n\'a le droit de faire ce que la liberté de l\'autre lui interdit.',0),(15,'Michael LeGendre','legendre@free.fr','U2FsdGVkX198r+7M+V6pQz9HpruYJhfnu90LvbmbNx4Y9SnC2dPW3G1gV6Wp5RebFfZ3lLE8pZ/ZiJc/vQS/qc8ldAGEfi0tBaqHrOgsUMg=','http://localhost:3000/images/avatar-homme_1641693124582.png','Pas d\'Email SVP sauf en cas d\'urgence',0),(16,'Camilia Bodelot','c.bodelot@live.com','U2FsdGVkX1827n4a9OZ0r6Pf/H84nTT7OjjI9S5UElwmP3cp5zCeeQdvlFswJbHfUKc9nWFIsm9FDVJLnFQPawryfuQPVrPU1EEOs64FXXQ=','http://localhost:3000/images/4545_1641723586206.png',NULL,0),(17,'Lucette LeGrand','lucette.legrand@gmail.com','U2FsdGVkX18QtqQGE+3GCTx0CqaRoCUYY0OQSzAf43noVsiS4mBVhW+nz7kbX6O2wRoYMKrdyAKJ1QCdkqyhyK2ikvsVwD7qWGorZl/O2xo=','http://localhost:3000/images/11_1641694803651.png',NULL,0),(18,'Alexandre Mesa','alex.mesa@yahoo.fr','U2FsdGVkX19aNSCRdtMAuRVhld2BnVI51l2KIinO6/oFhzE0V/UwuXu8dkLC/mmhUWD6dBa9FNWdeLuumBSVFJnMm2P0vUeOAO1KWqF8Vi4=','http://localhost:3000/images/11111111_1641724457534.png','Le transfert de l\'information est la chose la plus importante dans une entreprise comme la notre',0),(19,'Michael DONARUS','m.denri@gmail.com','U2FsdGVkX1/dvK7aq9MVB7De6JXc/EvZ+rp6NMYahIY9bZfoZysOLa/XwN9LIHz3dMTl5FOUn5/+TnDnUU0uqX6gmDX5fxapyHZRlDU/MU4=','http://localhost:3000/images/avatar-homme_1641723684670.png',NULL,0),(20,'Gaelle Renault','gaelle.renault@gmail.com','U2FsdGVkX1/tqi570rD64V4CnGcLI/XkMTbK36N1CmcL3XJ6ZCtAfYOsWEmpTvkfkeF86szh3YthhYlNJbxpidJT745ALwgr+6y/a+wcMrU=','http://localhost:3000/images/22_1641693898540.png',NULL,0),(21,'Rose Goutin','goutin38@hotmail.fr','U2FsdGVkX1/m4+j+7ELwXF6xnb3yferQRpnFsLWQVzC8bMz/eirwszZdGO7JeCJISbb8IFhPck+LEDPlTkV6nv6X8Dvi9m02h5mkjtkNTEo=','http://localhost:3000/images/flat-female-face-avatar-smiling-260nw-408921406_1641723815469.png',NULL,0),(22,'Rosette Sitbon','r-sitbon@sfr.fr','U2FsdGVkX1/oovUD1iVcpW/MNpFYrvS3PS3Pf6RuT3c7Uummeu0HCVGFL5fA42zFLZt6ugNHWTH/297sEtl8eOqoTpJfK3QtC7gup2i7uU8=','http://localhost:3000/images/images_1641723884438.png',NULL,0),(23,'Romeo Gallet','romeogallet@gmail.com','U2FsdGVkX1+0hwg+yJ0aaiy03cmUeTiCSDxHGuO72Hj1SiMn4ORyfvmbG1Z77tuKTdI0pARMgcvX/f532ByKpil4rxW2yBjBp5p5OzAdh3k=','http://localhost:3000/images/1f468-1f3fd-1f9b1_1641723952719.png',NULL,0),(24,'George RODIN','rodin7george@hotmail.fr','U2FsdGVkX18WJZwn/93rSKwZ2UAx5L3gzPnHvCE9NLjwmwak+B4qDN5KTt4I+yZBy7Ak4Y4OdW0wgBUeCza3ti7RHqPDY11JRWpuoxRYgwQ=','http://localhost:3000/images/33333333_1641724623843.png',NULL,0),(25,'Caroline LeDin','c.ledin@live.fr','U2FsdGVkX18+nDECJ8Nc1Jo44Pk91LZpO7Tjb4R2di7+m5BDmCDkYfzGOUVojJKdyLsO7o4AoVHqYmdUnnr+AWHhVJvrLNgXFdC6EZmuwbk=','http://localhost:3000/images/22222222_1641724686825.png',NULL,0),(26,'Roseline Constain','roseline-ledin@yahoo.fr','U2FsdGVkX18eOg5p9Um/P2QutLyM2VECHVNd9HrE1lKXdXOc9ZS9zCRDx45Y+ytnzgVMvgQFyzYvLrUneA9nn64ohmgaRZX/Dcxn6BwPOwI=','http://localhost:3000/images/44444444_1641724767928.png',NULL,0),(27,'Marie Dupon','marie-dupon@wanadoo.fr','U2FsdGVkX18MB7SpX97TQ626mEPc6G2UjG01gQEDXtA0CGglIPqjWZtW8xNr+HMyQQ+J01hY+3lbhYIbuJTh8FyaAB0Yu3yPArcoa2e3DZ8=',NULL,NULL,0),(28,'Gaelle Buson','gaelle.dupon@gmail.com','U2FsdGVkX194ym+vU9p0U9yqI0DnlZ2yzWw1YkPPfLrBnYQyJ3fKnYJKq3bicHLcBHTeipOraoe0SSNowwfT8hrGAaE7g48r2GMzog+7rPM=',NULL,NULL,0),(29,'MarieClaire Leroi','mariecl.leroi@orange.fr','U2FsdGVkX1/H4/xxJYIjEHETrUtqO5R32ibN4FCUd0gw7ifoisAtGhCgzR2d3qxkRNekCjyffgwXfjSChVVB3FQl20pim9qtBmcr0REG0Ik=',NULL,NULL,0),(30,'Marion Sarraf','m.sarraf@sarraf.com','U2FsdGVkX19t7ZAgTYItA3+nWU2FSW6LWFYn2v8L/0mEqjfk3h/ZSk76194hxpdvT51gDRrJh2czvr+EL09zh2fXVmV+xJ4qvZUHBXV3EuQ=',NULL,NULL,0),(32,'Testeur','test@test.com','U2FsdGVkX19bIZKwRkPawBecUt+hA9alHFhd4tfyF1PI3jQUr99daJly2i0GsDB8Im6jaz9BWRksnStRqWjtZCrMW0r8gUibSDvhNBSXpDU=',NULL,NULL,0);
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

-- Dump completed on 2022-01-10 13:03:10
