-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: floorbrax
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `installers`
--

DROP TABLE IF EXISTS `installers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `installers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installers`
--

LOCK TABLES `installers` WRITE;
/*!40000 ALTER TABLE `installers` DISABLE KEYS */;
INSERT INTO `installers` VALUES (1,'Santiago','404-678-0967'),(3,'Jorge','256-555-2222'),(6,'Chico','256-999-1118'),(7,'Jose','897-980-9876');
/*!40000 ALTER TABLE `installers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_num` varchar(15) NOT NULL,
  `installer_id` varchar(10) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `extras` varchar(200) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `subdivision` varchar(100) NOT NULL,
  `tel_num` varchar(12) DEFAULT NULL,
  `pic` varchar(150) NOT NULL,
  `total` varchar(15) DEFAULT NULL,
  `to_pay` varchar(15) DEFAULT NULL,
  `service_id` varchar(30) DEFAULT NULL,
  `square_footage` varchar(15) DEFAULT NULL,
  `user` varchar(5) DEFAULT NULL,
  `extra_price` varchar(15) DEFAULT NULL,
  `sqf_ditra` varchar(10) DEFAULT NULL,
  `sqf_hardwood` varchar(10) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  PRIMARY KEY (`order_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('F28331','6','Soap Niche +$100\r\nBench +$100\r\n\r\nDrywall +$150','2018-05-30','','Completed','2','','','0','700','0 ','0','1','350','0','0','2018-05-24'),('F28334','6','\r\n','2018-05-21','','Completed','3','','','2481','1200','2 6 ','0','0','0','342','0','2018-05-23'),('F28400','3','\r\n','2018-05-26','','Pending','2','','https://s3.amazonaws.com/floorbrax/orders/IMG_5122.jpg','3870','1935','7 ','0','3','0','0','1290','2018-05-23'),('F54FF3','3','\r\n','2018-05-23','','Completed','1','','null','150','120','2 ','0','3','0','0','0','2018-05-23'),('F58000','6','Soap Niche +$100\r\nBench +$100\r\n\r\nDryWall +$100','2018-06-02','','Pending','1','','https://s3.amazonaws.com/floorbrax/orders/IMG_0542.jpg','1600','1570','2 3 1 ','0','3','300','0','0','2018-05-22'),('F58001','3','Soap Niche +$100\r\nBench +$100\r\n\r\nDrywall +$150','2018-05-25','','Pending','2','','https://s3.amazonaws.com/floorbrax/orders/IMG_0542.jpg','1250','1440','1 2 5 ','0','3','350','0','0','2018-05-23'),('F66666','3','\r\n','2018-05-23','','Pending','4','','null','150','120','5 ','0','3','0','0','0','2018-05-23'),('G98078','6','\r\n','2018-05-24','','Completed','1','','https://s3.amazonaws.com/floorbrax/orders/20171213_093225.jpg','2329','1095','6 ','678','3','0','278','0','2018-05-24'),('G98082','7','Soap Niche +$100\r\nBench +$100\r\n\r\nDrywall +$200','2018-05-24','','Pending','2','','https://s3.amazonaws.com/floorbrax/orders/IMG_5122.jpg','3000','1770','1 2 7 ','0','3','400','0','500','2018-05-24'),('G99090','1','Soap Niche +$100\r\n\r\n','2018-05-18','','Completed','2','','https://s3.amazonaws.com/floorbrax/orders/IMG_0542.jpg','1200','720','1 4 ','0','3','100','0','0','2018-05-24'),('G99091','1','Soap Niche +$100\r\n\r\n','2018-05-18','','Pending','2','','https://s3.amazonaws.com/floorbrax/orders/IMG_0542.jpg','1200','720','1 4 ','0','3','100','0','0','2018-05-24'),('G99092','1','Soap Niche +$100\r\n\r\n','2018-05-18','','Pending','2','','https://s3.amazonaws.com/floorbrax/orders/IMG_0542.jpg','1200','720','1 4 ','0','3','100','0','0','2018-05-24'),('G99555','3','\r\n','2018-05-24','','Completed','2','','https://s3.amazonaws.com/floorbrax/orders/IMG_5122.jpg','300','240','4 5 ','0','3','0','0','0','2018-05-24'),('H22725','3','\r\n','2018-06-07','','Pending','2','','','300','240','2 5 ','0','1','0','0','0','2018-05-21'),('H27926','6','Soap Niche +$100\r\nBench +$100\r\n\r\n','2018-06-01','','Completed','2','','','950','900','1 ','0','1','200','0','0','2018-05-23'),('H28000','6','Soap Niche +$100\r\nBench +$100\r\n\r\ndrywall +$180','2018-05-16','','Completed','1','','https://s3.amazonaws.com/floorbrax/orders/IMG_5122.jpg','1630','1120','1 2 4 ','0','3','380','0','0','2018-05-23'),('H28321','1','\r\n','2018-05-14','','Completed','3','','','150','120','4 ','0','1','0','0','0','2018-05-23'),('H28322','1','\r\n','2018-05-18','','Completed','4','','','150','120','4 ','0','1','0','0','0','2018-05-23'),('H28324','1','Install behind refrigerator +$20\r\n                    ','2018-04-27','','Pending','2','','','0','0','0 ','0','1','0','0','0','2018-05-23'),('H28325','1','\r\n','2018-05-25','','Pending','3','','','500','350','3 ','0','1','0','0','0','2018-05-23'),('H28326','5','Bench +$100\r\n\r\n','2018-05-10','','Pending','1','','','950','700','1 ','0','1','100','0','0',NULL),('H28327','5','\r\n','2018-05-14','','Completed','2','','','950','500','1 ','0','1','0','0','0','2018-05-23'),('H28329','5','\r\n','2018-05-16','','Pending','4','','','950','500','1 ','0','1','0','0','0',NULL),('H28330','5','\r\n','2018-05-17','','Completed','2','','','950','500','1 ','0','1','0','0','0','2018-05-24'),('H28345','3','\r\n','2018-05-08','','Pending','1','','','150','120','5 ','0','1','0','0','0',NULL),('H28348','3','\r\n','2018-05-30','','Pending','1','','','1368','684','7 ','0','1','0','0','456',NULL),('H28350','5','\r\n','2018-05-09','','Pending','1','','','150','120','4 ','0','1','0','0','0',NULL),('H28353','5','Soap Niche +$100\r\nBench +$100\r\n\r\nInstall drywall +$150','2018-05-15','','Completed','3','','','950','1200','1 ','0','1','350','0','0','2018-05-23'),('H28354','5','\r\n','2018-05-23','','Pending','3','','','150','120','2 ','0','1','0','0','0','2018-05-23'),('H28356','5','\r\n','2018-05-16','','Pending','3','','','150','120','2 ','0','1','0','0','0',NULL),('H28358','5','\r\n','2018-05-22','','Pending','2','','','500','350','3 ','0','1','0','0','0','2018-05-23');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `price` varchar(15) DEFAULT NULL,
  `to_pay` varchar(15) DEFAULT NULL,
  `price_per_sqf` varchar(10) DEFAULT NULL,
  `price_per_sqf_paid` varchar(10) DEFAULT NULL,
  `sqf_ditra` varchar(10) DEFAULT NULL,
  `sql_ditra_toPay` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Shower','Install water proof and Shower tiles','950','500',NULL,NULL,NULL,NULL),(2,'Tub Surround','Install tiles around tub','150','120',NULL,NULL,NULL,NULL),(3,'Shower Surround','Install tiles around Tub-Shower','500','350',NULL,NULL,NULL,NULL),(4,'Fireplace','Install tiles around fireplace','150','120',NULL,NULL,NULL,NULL),(5,'Backsplash','Install tiles on backsplash','150','120',NULL,NULL,NULL,NULL),(6,'Tile Floor','Install tiles on floors','0','0','2','1','3.5','1.5'),(7,'Hardwood Floor','Install hardwood on floors','0','0','3.0','1.5',NULL,NULL);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subdivision`
--

DROP TABLE IF EXISTS `subdivision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdivision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subdivision`
--

LOCK TABLES `subdivision` WRITE;
/*!40000 ALTER TABLE `subdivision` DISABLE KEYS */;
INSERT INTO `subdivision` VALUES (1,'Lake Forest','43 Lake Forest rd'),(2,'Dairy','25 Dairy Lane'),(3,'Magnolia','459 Magnolia dr'),(4,'Sanctuary','654 sancura rd');
/*!40000 ALTER TABLE `subdivision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Sonia Souza','sonia','sonia'),(2,'Jose Erico Batista','jose','jose'),(3,'Ciro Amaral','ciro','ciro');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-24 15:43:11
