CREATE DATABASE  IF NOT EXISTS `online_laptop_store` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `online_laptop_store`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: online_laptop_store
-- ------------------------------------------------------
-- Server version	5.5.35

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
-- Table structure for table `laptop_brands`
--

DROP TABLE IF EXISTS `laptop_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laptop_brands` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop_brands`
--

LOCK TABLES `laptop_brands` WRITE;
/*!40000 ALTER TABLE `laptop_brands` DISABLE KEYS */;
INSERT INTO `laptop_brands` VALUES (1,'Lenovo');
/*!40000 ALTER TABLE `laptop_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptop_model`
--

DROP TABLE IF EXISTS `laptop_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laptop_model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(45) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `base_price` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`model_id`),
  KEY `model_category_pk_idx` (`category_id`),
  KEY `model_brand_pk_idx` (`brand_id`),
  CONSTRAINT `model_brand_pk` FOREIGN KEY (`brand_id`) REFERENCES `laptop_brands` (`brand_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `model_category_pk` FOREIGN KEY (`category_id`) REFERENCES `laptop_model_category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop_model`
--

LOCK TABLES `laptop_model` WRITE;
/*!40000 ALTER TABLE `laptop_model` DISABLE KEYS */;
INSERT INTO `laptop_model` VALUES (1,'ThinkPad X',1,1,185.00),(2,'ThinkPad Y',1,1,172.00),(3,'11 E',2,1,153.00),(4,'100 E',2,1,127.00),(5,'Legion Y520',3,1,210.00),(6,'Legion Y720',3,1,228.00),(7,'ThinkPad X1 Carbon',4,1,155.00),(8,'ThinkPad X280',4,1,162.00),(9,'ThinkPad 13 Chromebook',5,1,95.00),(10,'ThinkPad 11e Chromebook',5,1,87.00);
/*!40000 ALTER TABLE `laptop_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptop_model_category`
--

DROP TABLE IF EXISTS `laptop_model_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laptop_model_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop_model_category`
--

LOCK TABLES `laptop_model_category` WRITE;
/*!40000 ALTER TABLE `laptop_model_category` DISABLE KEYS */;
INSERT INTO `laptop_model_category` VALUES (1,'Work Laptops'),(2,'Student Laptops'),(3,'Gaming Laptops'),(4,'Small Business Laptops'),(5,'Chromebooks');
/*!40000 ALTER TABLE `laptop_model_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptop_model_specifications`
--

DROP TABLE IF EXISTS `laptop_model_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laptop_model_specifications` (
  `model_specification_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) DEFAULT NULL,
  `specification_id` int(11) DEFAULT NULL,
  `default_option` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`model_specification_id`),
  KEY `model_spec_model_fk_idx` (`model_id`),
  KEY `model_spec_specifications_fk_idx` (`specification_id`),
  CONSTRAINT `model_spec_model_fk` FOREIGN KEY (`model_id`) REFERENCES `laptop_model` (`model_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `model_spec_specifications_fk` FOREIGN KEY (`specification_id`) REFERENCES `laptop_specifications` (`specification_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop_model_specifications`
--

LOCK TABLES `laptop_model_specifications` WRITE;
/*!40000 ALTER TABLE `laptop_model_specifications` DISABLE KEYS */;
INSERT INTO `laptop_model_specifications` VALUES (1,1,32,1),(2,1,33,1),(3,1,36,1),(4,1,39,1),(5,1,40,1),(6,1,41,1),(7,1,42,0),(8,1,43,1),(9,1,44,1),(10,1,45,1);
/*!40000 ALTER TABLE `laptop_model_specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptop_specification_category`
--

DROP TABLE IF EXISTS `laptop_specification_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laptop_specification_category` (
  `specification_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `specification_category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`specification_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop_specification_category`
--

LOCK TABLES `laptop_specification_category` WRITE;
/*!40000 ALTER TABLE `laptop_specification_category` DISABLE KEYS */;
INSERT INTO `laptop_specification_category` VALUES (2,'Processor'),(3,'Operating System'),(4,'Display Type'),(5,'Memory'),(6,'Graphics'),(7,'Hard Drive'),(8,'AC Adapter'),(9,'Camera'),(10,'Fingerprint Reader'),(11,'Keyboard'),(12,'Battery'),(13,'Wireless'),(14,'Integrated Mobile Broadband');
/*!40000 ALTER TABLE `laptop_specification_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptop_specifications`
--

DROP TABLE IF EXISTS `laptop_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laptop_specifications` (
  `specification_id` int(11) NOT NULL AUTO_INCREMENT,
  `specification_category_id` int(11) DEFAULT NULL,
  `specification_name` varchar(45) DEFAULT NULL,
  `specification_desc` varchar(250) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`specification_id`),
  KEY `specifications_specifications_category_idx` (`specification_category_id`),
  CONSTRAINT `specifications_specifications_category` FOREIGN KEY (`specification_category_id`) REFERENCES `laptop_specification_category` (`specification_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop_specifications`
--

LOCK TABLES `laptop_specifications` WRITE;
/*!40000 ALTER TABLE `laptop_specifications` DISABLE KEYS */;
INSERT INTO `laptop_specifications` VALUES (29,2,'i5-8250U','8th Generation Intel® Core™ i5-8250U Processor (1.60GHz, up to 3.40GHz with Turbo Boost, 6MB Cache)',480.00),(30,2,'i7-8550U','8th Generation Intel® Core™ i7-8550U Processor (1.80GHz, up to 4.0GHz with Turbo Boost, 8MB Cache)',520.00),(31,3,'Windows 10 Home 64','Windows 10 Home 64',73.00),(32,3,'Windows 10 Pro 64','Windows 10 Pro 64',112.00),(33,4,'14\" FHD','14\" FHD (1920 x 1080) IPS anti-glare, 300 nits',165.00),(34,4,'16\" FHD','16\" FHD (1920 x 1080) IPS anti-glare, 300 nits',214.00),(35,5,'8 GB LPDDR3','8 GB LPDDR3 2133MHz (Onboard)',63.00),(36,5,'16 GB LPDDR3','16 GB LPDDR3 2133MHz (Onboard)',87.00),(37,6,'Integrated Intel® UHD Graphics 620','Integrated Intel® UHD Graphics 620',110.00),(38,7,'256GB','256GB Solid State Drive PCIe-NVME OPAL2.0 M.2',113.00),(39,7,'512 GB','512 GB Solid State Drive, PCIe-NVME',155.00),(40,8,'65W AC Adapter (2pin)','65W AC Adapter (2pin) - USB Type C',30.00),(41,9,'720p HD','720p HD Camera with ThinkShutter and microphone',86.00),(42,10,'Fingerprint Reader','Fingerprint Reader',50.00),(43,11,'Backlit Keyboard','Backlit Keyboard - US English',36.00),(44,12,'3 cell Li-Ion 57Wh','3 cell Li-Ion 57Wh',72.00),(45,13,'Intel Dual Band 8265','Intel Dual Band 8265 Wireless AC (2 x 2) & Bluetooth 4.1 with vPro',40.00);
/*!40000 ALTER TABLE `laptop_specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptop_stock`
--

DROP TABLE IF EXISTS `laptop_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laptop_stock` (
  `stock_id` int(11) NOT NULL,
  `model_id` int(11) DEFAULT NULL,
  `available_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `stock_model_fk_idx` (`model_id`),
  CONSTRAINT `stock_model_fk` FOREIGN KEY (`model_id`) REFERENCES `laptop_model` (`model_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop_stock`
--

LOCK TABLES `laptop_stock` WRITE;
/*!40000 ALTER TABLE `laptop_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `laptop_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_details`
--

DROP TABLE IF EXISTS `purchase_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_details` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) DEFAULT NULL,
  `final_price` decimal(6,2) DEFAULT NULL,
  `user_email_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`purchase_id`),
  KEY `purchase_details_model_fk_idx` (`model_id`),
  CONSTRAINT `purchase_details_model_fk` FOREIGN KEY (`model_id`) REFERENCES `laptop_model` (`model_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_details`
--

LOCK TABLES `purchase_details` WRITE;
/*!40000 ALTER TABLE `purchase_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-06  0:20:38
