-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.41-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema `ecas-database`
--

CREATE DATABASE IF NOT EXISTS `ecas-database`;
USE `ecas-database`;

--
-- Definition of table `add_item_size`
--

DROP TABLE IF EXISTS `add_item_size`;
CREATE TABLE `add_item_size` (
  `size_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `item` int(15) unsigned NOT NULL,
  `size` varchar(45) NOT NULL,
  `created_by` int(15) unsigned NOT NULL,
  `created_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `add_item_size`
--

/*!40000 ALTER TABLE `add_item_size` DISABLE KEYS */;
INSERT INTO `add_item_size` (`size_id`,`item`,`size`,`created_by`,`created_dt`) VALUES 
 (1,4,'200ml',1,'2014-04-12 06:04:59'),
 (2,4,'500ml',1,'2014-04-13 11:19:26'),
 (3,4,'800ml',1,'2014-04-13 12:11:18');
/*!40000 ALTER TABLE `add_item_size` ENABLE KEYS */;


--
-- Definition of trigger `add_item_size_ins`
--

DROP TRIGGER /*!50030 IF EXISTS */ `add_item_size_ins`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `add_item_size_ins` BEFORE INSERT ON `add_item_size` FOR EACH ROW set new.created_dt=now() $$

DELIMITER ;

--
-- Definition of table `assign_rights`
--

DROP TABLE IF EXISTS `assign_rights`;
CREATE TABLE `assign_rights` (
  `rights_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(15) unsigned NOT NULL,
  `user_id` int(15) unsigned NOT NULL,
  `privilege_ids` varchar(100) NOT NULL,
  PRIMARY KEY (`rights_id`),
  KEY `FK_assign_rights_1` (`role_id`),
  KEY `FK_assign_rights_2` (`user_id`),
  CONSTRAINT `FK_assign_rights_1` FOREIGN KEY (`role_id`) REFERENCES `web_gen_role_mst` (`role_id`),
  CONSTRAINT `FK_assign_rights_2` FOREIGN KEY (`user_id`) REFERENCES `web_user_master` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assign_rights`
--

/*!40000 ALTER TABLE `assign_rights` DISABLE KEYS */;
INSERT INTO `assign_rights` (`rights_id`,`role_id`,`user_id`,`privilege_ids`) VALUES 
 (2,1,1,'1,2,3'),
 (3,7,20,'2'),
 (4,1,18,'1'),
 (5,2,23,'3'),
 (8,1,24,'1,2,3,4');
/*!40000 ALTER TABLE `assign_rights` ENABLE KEYS */;


--
-- Definition of table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `category_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`category_id`,`category`) VALUES 
 (1,'Product'),
 (2,'Information'),
 (3,'Services'),
 (4,'Software');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


--
-- Definition of table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `city_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(15) unsigned NOT NULL,
  `state_id` int(15) unsigned NOT NULL,
  `city_name` varchar(45) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `FK_city_1` (`country_id`),
  KEY `FK_city_2` (`state_id`),
  CONSTRAINT `FK_city_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`),
  CONSTRAINT `FK_city_2` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`city_id`,`country_id`,`state_id`,`city_name`) VALUES 
 (1,1,1,'Ahmedabad'),
 (2,1,1,'Gandhinagar'),
 (3,1,1,'Surat'),
 (4,1,1,'Bharuch'),
 (5,2,2,'xyz'),
 (6,5,6,'Mumbai'),
 (7,1,3,'Jaipur'),
 (8,2,2,'pqr'),
 (9,9,14,'Sydney'),
 (10,3,12,'pojo'),
 (11,2,2,'abc'),
 (12,3,12,'ojop');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;


--
-- Definition of table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `company_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `phn_no` varchar(45) DEFAULT NULL,
  `mobile_no1` varchar(45) DEFAULT NULL,
  `mobile_no2` varchar(45) DEFAULT NULL,
  `address` text NOT NULL,
  `country` int(15) unsigned NOT NULL,
  `state` int(15) unsigned NOT NULL,
  `city` int(15) unsigned NOT NULL,
  `description` text,
  `active_flag` varchar(1) NOT NULL,
  `created_by` int(15) unsigned NOT NULL,
  `created_dt` datetime DEFAULT NULL,
  `updated_by` int(15) unsigned DEFAULT NULL,
  `updated_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  KEY `FK_company_1` (`country`),
  KEY `FK_company_2` (`state`),
  KEY `FK_company_3` (`city`),
  CONSTRAINT `FK_company_1` FOREIGN KEY (`country`) REFERENCES `country` (`country_id`),
  CONSTRAINT `FK_company_2` FOREIGN KEY (`state`) REFERENCES `state` (`state_id`),
  CONSTRAINT `FK_company_3` FOREIGN KEY (`city`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`company_id`,`company_name`,`email`,`website`,`fax`,`phn_no`,`mobile_no1`,`mobile_no2`,`address`,`country`,`state`,`city`,`description`,`active_flag`,`created_by`,`created_dt`,`updated_by`,`updated_dt`) VALUES 
 (1,'TCS','tcs@yahoo.com','','','','8778788778','','chandkheda',1,1,1,'','1',1,'2014-04-12 16:22:22',0,NULL);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;


--
-- Definition of trigger `company_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `company_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `company_insert` BEFORE INSERT ON `company` FOR EACH ROW set new.created_dt=now() $$

DELIMITER ;

--
-- Definition of trigger `company_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `company_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `company_update` BEFORE UPDATE ON `company` FOR EACH ROW set new.updated_dt=now() $$

DELIMITER ;

--
-- Definition of table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(45) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`country_id`,`country_name`) VALUES 
 (1,'India'),
 (2,'Afghanistan'),
 (3,'CANADA'),
 (4,'Pakistan'),
 (5,'USA'),
 (9,'Aus'),
 (10,'Japan'),
 (11,'Chin'),
 (12,'South Africa');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;


--
-- Definition of table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `item_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `product` int(15) unsigned NOT NULL,
  `product_type` int(15) unsigned DEFAULT NULL,
  `product_category` int(15) unsigned DEFAULT NULL,
  `item` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `active_flag` varchar(45) NOT NULL,
  `created_by` int(15) unsigned NOT NULL,
  `created_dt` datetime DEFAULT NULL,
  `updated_by` int(15) unsigned DEFAULT NULL,
  `updated_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`item_id`,`product`,`product_type`,`product_category`,`item`,`description`,`active_flag`,`created_by`,`created_dt`,`updated_by`,`updated_dt`) VALUES 
 (1,1,2,1,'Send','','1',1,'2014-04-11 16:00:55',0,NULL),
 (2,1,2,1,'Cement','','1',1,'2014-04-11 16:36:53',1,'2014-04-13 12:08:46'),
 (3,2,1,2,'Johnson baby Powder','','1',1,'2014-04-11 16:37:25',0,NULL),
 (4,2,1,2,'Johnson baby oil','','1',1,'2014-04-12 04:41:47',1,'2014-04-13 12:12:53');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;


--
-- Definition of trigger `items_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `items_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `items_insert` BEFORE INSERT ON `items` FOR EACH ROW set new.created_dt=now() $$

DELIMITER ;

--
-- Definition of trigger `items_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `items_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `items_update` BEFORE UPDATE ON `items` FOR EACH ROW set new.updated_dt=now() $$

DELIMITER ;

--
-- Definition of table `logged_calls`
--

DROP TABLE IF EXISTS `logged_calls`;
CREATE TABLE `logged_calls` (
  `logged_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `summary` varchar(200) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `contact` int(15) unsigned DEFAULT NULL,
  `responsible` int(15) unsigned DEFAULT NULL,
  `created_by` int(15) unsigned DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`logged_id`),
  KEY `FK_logged_calls_1` (`contact`),
  CONSTRAINT `FK_logged_calls_1` FOREIGN KEY (`contact`) REFERENCES `web_customer_mst` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logged_calls`
--

/*!40000 ALTER TABLE `logged_calls` DISABLE KEYS */;
INSERT INTO `logged_calls` (`logged_id`,`summary`,`date`,`contact`,`responsible`,`created_by`,`created_dt`) VALUES 
 (11,'for Information','2014-04-02',2,1,1,'2014-04-12 16:50:38'),
 (12,'for deal','2014-04-18',1,24,24,'2014-04-20 08:27:39'),
 (13,'for Information11','2014-04-17',1,24,24,'2014-04-20 08:29:47');
/*!40000 ALTER TABLE `logged_calls` ENABLE KEYS */;


--
-- Definition of trigger `logged_calls_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `logged_calls_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `logged_calls_insert` BEFORE INSERT ON `logged_calls` FOR EACH ROW set new.created_dt=now() $$

DELIMITER ;

--
-- Definition of table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
CREATE TABLE `meetings` (
  `meeting_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `attendies` varchar(200) NOT NULL,
  `responsible` int(15) unsigned NOT NULL,
  `location` varchar(45) NOT NULL,
  `description` text,
  `created_by` int(15) unsigned NOT NULL,
  `created_dt` datetime DEFAULT NULL,
  `updated_by` int(15) unsigned DEFAULT NULL,
  `updated_dt` datetime DEFAULT NULL,
  `attendees_names` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`meeting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meetings`
--

/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` (`meeting_id`,`subject`,`date`,`duration`,`attendies`,`responsible`,`location`,`description`,`created_by`,`created_dt`,`updated_by`,`updated_dt`,`attendees_names`) VALUES 
 (1,'for Deal','2014-04-16','24:00','1,3',1,'NicheTech','',1,'2014-04-12 16:46:18',1,'2014-04-12 16:48:37','Ankit Agrawal,Amit Anand'),
 (2,'for deal','2014-04-17','24:00','1,3',1,'Ahmedabad','',1,'2014-04-16 10:10:56',0,NULL,'Ankit Agrawal,Amit Anand'),
 (3,'for deal','2014-04-25','24:00','1,2',24,'Ah','',24,'2014-04-20 08:24:51',0,NULL,'Ankit Agrawal,TATA MOTORS');
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;


--
-- Definition of trigger `meetings_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `meetings_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `meetings_insert` BEFORE INSERT ON `meetings` FOR EACH ROW set new.created_dt=now() $$

DELIMITER ;

--
-- Definition of trigger `meetings_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `meetings_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `meetings_update` BEFORE UPDATE ON `meetings` FOR EACH ROW set new.updated_dt=now() $$

DELIMITER ;

--
-- Definition of table `phone_category`
--

DROP TABLE IF EXISTS `phone_category`;
CREATE TABLE `phone_category` (
  `category_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phone_category`
--

/*!40000 ALTER TABLE `phone_category` DISABLE KEYS */;
INSERT INTO `phone_category` (`category_id`,`category_name`) VALUES 
 (1,'Inbound'),
 (2,'Outbound');
/*!40000 ALTER TABLE `phone_category` ENABLE KEYS */;


--
-- Definition of table `priorities`
--

DROP TABLE IF EXISTS `priorities`;
CREATE TABLE `priorities` (
  `priority_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `priority` varchar(45) NOT NULL,
  PRIMARY KEY (`priority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `priorities`
--

/*!40000 ALTER TABLE `priorities` DISABLE KEYS */;
INSERT INTO `priorities` (`priority_id`,`priority`) VALUES 
 (1,'Highest'),
 (2,'High'),
 (3,'Normal'),
 (4,'Low'),
 (5,'Lowest');
/*!40000 ALTER TABLE `priorities` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `product_category` int(15) unsigned NOT NULL,
  `product` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `product_type` int(15) unsigned DEFAULT NULL,
  `created_by` int(15) unsigned NOT NULL,
  `created_dt` datetime DEFAULT NULL,
  `updated_by` int(15) unsigned DEFAULT NULL,
  `updated_dt` datetime DEFAULT NULL,
  `active_flag` varchar(1) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK_product_1` (`product_category`),
  CONSTRAINT `FK_product_1` FOREIGN KEY (`product_category`) REFERENCES `product_category` (`pc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`product_id`,`product_category`,`product`,`description`,`product_type`,`created_by`,`created_dt`,`updated_by`,`updated_dt`,`active_flag`) VALUES 
 (1,1,'Brick','',2,2014,NULL,2014,NULL,'1'),
 (2,2,'Johnson','',1,2014,NULL,0,NULL,'1'),
 (3,1,'ABC','',2,2014,NULL,0,NULL,'1'),
 (4,2,'XYZ','',1,2014,NULL,0,NULL,'1');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of trigger `product_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `product_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `product_insert` BEFORE INSERT ON `product` FOR EACH ROW set new.created_by=now() $$

DELIMITER ;

--
-- Definition of trigger `product_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `product_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `product_update` BEFORE UPDATE ON `product` FOR EACH ROW set new.updated_by=now() $$

DELIMITER ;

--
-- Definition of table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `pc_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `product_type_id` int(15) unsigned NOT NULL,
  `product_caegory` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_by` int(15) unsigned DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`pc_id`),
  KEY `FK_product_category_1` (`product_type_id`),
  CONSTRAINT `FK_product_category_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` (`pc_id`,`product_type_id`,`product_caegory`,`description`,`created_by`,`created_dt`) VALUES 
 (1,2,'Row Material','',1,'2014-04-11 11:13:54'),
 (2,1,'Cosmetic','',1,'2014-04-11 14:45:57');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;


--
-- Definition of trigger `product_category_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `product_category_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `product_category_insert` BEFORE INSERT ON `product_category` FOR EACH ROW set new.created_dt=now() $$

DELIMITER ;

--
-- Definition of table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `type_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_type`
--

/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` (`type_id`,`type`) VALUES 
 (1,'Stockable'),
 (2,'Service');
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;


--
-- Definition of table `purchase_quotation`
--

DROP TABLE IF EXISTS `purchase_quotation`;
CREATE TABLE `purchase_quotation` (
  `quotation_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `supplier` int(15) unsigned NOT NULL,
  `supplier_ref` varchar(45) DEFAULT NULL,
  `order_dt` varchar(45) DEFAULT NULL,
  `expected_dt` varchar(45) DEFAULT NULL,
  `untaxted_amount` double DEFAULT NULL,
  `taxes` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `created_by` int(15) unsigned NOT NULL,
  `created_dt` datetime DEFAULT NULL,
  `updated_by` int(15) unsigned DEFAULT NULL,
  `updated_dt` datetime DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`quotation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_quotation`
--

/*!40000 ALTER TABLE `purchase_quotation` DISABLE KEYS */;
INSERT INTO `purchase_quotation` (`quotation_id`,`supplier`,`supplier_ref`,`order_dt`,`expected_dt`,`untaxted_amount`,`taxes`,`total`,`created_by`,`created_dt`,`updated_by`,`updated_dt`,`status`) VALUES 
 (1,2,'','2014-04-16','2014-04-16',0,0,0,1,'2014-04-16 15:11:54',0,NULL,'Draft PO'),
 (2,3,'','2014-04-09','2014-04-25',0,0,0,1,'2014-04-17 10:41:11',0,NULL,'Draft PO'),
 (3,2,'','2014-04-15','2014-04-08',0,0,0,1,'2014-04-18 03:27:40',0,NULL,'Draft PO'),
 (4,1,'','2014-04-02','2014-04-16',0,0,0,1,'2014-04-18 05:34:50',0,NULL,'Draft PO');
/*!40000 ALTER TABLE `purchase_quotation` ENABLE KEYS */;


--
-- Definition of trigger `pq_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `pq_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `pq_insert` BEFORE INSERT ON `purchase_quotation` FOR EACH ROW set new.created_dt=now() $$

DELIMITER ;

--
-- Definition of trigger `pq_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `pq_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `pq_update` BEFORE UPDATE ON `purchase_quotation` FOR EACH ROW set new.updated_dt=now() $$

DELIMITER ;

--
-- Definition of table `purchase_quotation_detail`
--

DROP TABLE IF EXISTS `purchase_quotation_detail`;
CREATE TABLE `purchase_quotation_detail` (
  `detail_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` int(15) unsigned NOT NULL,
  `product` int(15) unsigned NOT NULL,
  `item` int(15) unsigned NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Schedule_dt` varchar(45) NOT NULL,
  `Quantity` double NOT NULL,
  `Unit_price` double DEFAULT NULL,
  `taxs` double DEFAULT NULL,
  `subtotal` varchar(45) NOT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_quotation_detail`
--

/*!40000 ALTER TABLE `purchase_quotation_detail` DISABLE KEYS */;
INSERT INTO `purchase_quotation_detail` (`detail_id`,`quotation_id`,`product`,`item`,`Description`,`Schedule_dt`,`Quantity`,`Unit_price`,`taxs`,`subtotal`) VALUES 
 (1,4,1,2,'kjhkjh','2014-04-08',1,0,0,'0.0'),
 (2,5,1,2,'mjmjb','2014-04-15',1,0,0,'0.0'),
 (3,5,1,1,'jhg','2014-04-15',1,0,0,'0.0');
/*!40000 ALTER TABLE `purchase_quotation_detail` ENABLE KEYS */;


--
-- Definition of table `scheduled_calls`
--

DROP TABLE IF EXISTS `scheduled_calls`;
CREATE TABLE `scheduled_calls` (
  `schedule_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `summary` varchar(200) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `contact` int(15) unsigned DEFAULT NULL,
  `responsible` int(15) unsigned NOT NULL,
  `category` int(15) unsigned DEFAULT NULL,
  `priority` int(15) unsigned DEFAULT NULL,
  `phone_no` varchar(45) DEFAULT NULL,
  `mobile_no1` varchar(45) DEFAULT NULL,
  `mobile_no2` varchar(45) DEFAULT NULL,
  `description` text,
  `created_by` int(15) unsigned NOT NULL,
  `created_dt` datetime DEFAULT NULL,
  `updated_by` int(15) unsigned DEFAULT NULL,
  `updated_dt` datetime DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `FK_scheduled_calls_1` (`contact`),
  CONSTRAINT `FK_scheduled_calls_1` FOREIGN KEY (`contact`) REFERENCES `web_customer_mst` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scheduled_calls`
--

/*!40000 ALTER TABLE `scheduled_calls` DISABLE KEYS */;
INSERT INTO `scheduled_calls` (`schedule_id`,`summary`,`date`,`contact`,`responsible`,`category`,`priority`,`phone_no`,`mobile_no1`,`mobile_no2`,`description`,`created_by`,`created_dt`,`updated_by`,`updated_dt`,`status`) VALUES 
 (14,'Proposal for discount offer','2014-04-11',2,1,2,3,'','7878877878','','',1,'2014-04-12 16:53:50',0,NULL,'Pending'),
 (15,'for project training','2014-04-17',1,1,1,2,'','9898989898','','',1,'2014-04-12 16:54:27',1,'2014-04-18 08:10:31','Cancelled'),
 (16,'Proposal for discount offer','2014-04-18',2,1,2,3,'','7878877878','','',1,'2014-04-12 16:55:13',0,NULL,'Confirmed'),
 (17,'for project meeting','2014-04-24',2,1,2,3,'','7878877878','','',1,'2014-04-16 10:12:24',0,NULL,'Confirmed'),
 (19,'for Information','2014-04-17',1,24,1,1,'','9898989898','','',24,'2014-04-20 08:29:00',0,NULL,'Confirmed');
/*!40000 ALTER TABLE `scheduled_calls` ENABLE KEYS */;


--
-- Definition of trigger `scheduled_calls_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `scheduled_calls_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `scheduled_calls_insert` BEFORE INSERT ON `scheduled_calls` FOR EACH ROW set new.created_dt=now() $$

DELIMITER ;

--
-- Definition of trigger `scheduled_calls_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `scheduled_calls_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `scheduled_calls_update` BEFORE UPDATE ON `scheduled_calls` FOR EACH ROW set new.updated_dt=now() $$

DELIMITER ;

--
-- Definition of table `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `state_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(15) unsigned NOT NULL,
  `state_name` varchar(45) NOT NULL,
  PRIMARY KEY (`state_id`),
  KEY `FK_country` (`country_id`),
  CONSTRAINT `FK_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` (`state_id`,`country_id`,`state_name`) VALUES 
 (1,1,'Gujrat'),
 (2,2,'abc'),
 (3,1,'Rajasthan'),
 (4,2,'pqr'),
 (5,2,'ghj'),
 (6,1,'Maharashtra'),
 (7,2,'muala'),
 (8,1,'MP'),
 (9,2,'chi'),
 (10,2,'vov'),
 (11,2,'tttttttt'),
 (12,3,'pojo'),
 (13,10,'Tokiyo'),
 (14,9,'Sydney');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;


--
-- Definition of table `supplier_company`
--

DROP TABLE IF EXISTS `supplier_company`;
CREATE TABLE `supplier_company` (
  `company_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `phn_no` varchar(45) DEFAULT NULL,
  `mobile_no1` varchar(45) DEFAULT NULL,
  `mobile_no2` varchar(45) DEFAULT NULL,
  `address` text NOT NULL,
  `country` int(15) unsigned NOT NULL,
  `state` int(15) unsigned NOT NULL,
  `city` int(15) unsigned NOT NULL,
  `description` text,
  `active_flag` varchar(1) NOT NULL,
  `created_by` int(15) unsigned NOT NULL,
  `created_dt` datetime DEFAULT NULL,
  `updated_by` int(15) unsigned DEFAULT NULL,
  `updated_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_company`
--

/*!40000 ALTER TABLE `supplier_company` DISABLE KEYS */;
INSERT INTO `supplier_company` (`company_id`,`company_name`,`email`,`website`,`fax`,`phn_no`,`mobile_no1`,`mobile_no2`,`address`,`country`,`state`,`city`,`description`,`active_flag`,`created_by`,`created_dt`,`updated_by`,`updated_dt`) VALUES 
 (1,'Sofico','sofico@gmail.com','','','','9898989898','','Gandhinagar',1,1,2,'training company','1',1,'2014-04-12 12:33:54',0,NULL),
 (2,'T&T','tnt@gmail.com','','','','8888888888','','Kalupur',1,1,1,'','1',1,'2014-04-12 12:36:43',0,NULL);
/*!40000 ALTER TABLE `supplier_company` ENABLE KEYS */;


--
-- Definition of trigger `supplier_company_ins`
--

DROP TRIGGER /*!50030 IF EXISTS */ `supplier_company_ins`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `supplier_company_ins` BEFORE INSERT ON `supplier_company` FOR EACH ROW set new.created_dt=now() $$

DELIMITER ;

--
-- Definition of trigger `supplier_company_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `supplier_company_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `supplier_company_update` BEFORE UPDATE ON `supplier_company` FOR EACH ROW set new.updated_dt=now() $$

DELIMITER ;

--
-- Definition of table `title`
--

DROP TABLE IF EXISTS `title`;
CREATE TABLE `title` (
  `title_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `title`
--

/*!40000 ALTER TABLE `title` DISABLE KEYS */;
INSERT INTO `title` (`title_id`,`title`) VALUES 
 (1,'Sir'),
 (2,'Madam'),
 (3,'Mister'),
 (4,'Miss');
/*!40000 ALTER TABLE `title` ENABLE KEYS */;


--
-- Definition of table `web_acm_privilege_comp_map`
--

DROP TABLE IF EXISTS `web_acm_privilege_comp_map`;
CREATE TABLE `web_acm_privilege_comp_map` (
  `privilege_comp_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `privilege_id` int(15) unsigned NOT NULL,
  `component_names` varchar(200) NOT NULL,
  `created_by` int(15) unsigned NOT NULL,
  `created_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`privilege_comp_id`),
  KEY `fk_privilege_id` (`privilege_id`),
  CONSTRAINT `fk_privilege_id` FOREIGN KEY (`privilege_id`) REFERENCES `web_acm_privilege_mst` (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_acm_privilege_comp_map`
--

/*!40000 ALTER TABLE `web_acm_privilege_comp_map` DISABLE KEYS */;
INSERT INTO `web_acm_privilege_comp_map` (`privilege_comp_id`,`privilege_id`,`component_names`,`created_by`,`created_dt`) VALUES 
 (1,1,'Add User,View User,Assign Rights,Manage Privilege',1,'2014-03-13 05:14:38'),
 (2,2,'Customers,Leads,Quotations,Sales Orders,Meetings,Logged Calls,Scheduled Calls',1,'2014-04-07 01:39:17'),
 (3,3,'Products,Items,Suppliers,Quotations',1,'2014-04-13 12:53:42'),
 (4,4,'Client Details,Survey Report',1,'2014-04-20 08:07:34');
/*!40000 ALTER TABLE `web_acm_privilege_comp_map` ENABLE KEYS */;


--
-- Definition of trigger `privilege_comp`
--

DROP TRIGGER /*!50030 IF EXISTS */ `privilege_comp`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `privilege_comp` BEFORE INSERT ON `web_acm_privilege_comp_map` FOR EACH ROW set new.created_dt=now() $$

DELIMITER ;

--
-- Definition of table `web_acm_privilege_mst`
--

DROP TABLE IF EXISTS `web_acm_privilege_mst`;
CREATE TABLE `web_acm_privilege_mst` (
  `privilege_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `privilege_name` varchar(45) NOT NULL,
  `privilege_desc` varchar(200) DEFAULT NULL,
  `active_flag` varchar(1) NOT NULL DEFAULT '1',
  `created_by` int(15) unsigned NOT NULL,
  `created_dt` datetime DEFAULT NULL,
  `updated_by` int(15) unsigned DEFAULT NULL,
  `updated_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_acm_privilege_mst`
--

/*!40000 ALTER TABLE `web_acm_privilege_mst` DISABLE KEYS */;
INSERT INTO `web_acm_privilege_mst` (`privilege_id`,`privilege_name`,`privilege_desc`,`active_flag`,`created_by`,`created_dt`,`updated_by`,`updated_dt`) VALUES 
 (1,'User Management','user management module','1',1,'2014-03-13 04:23:36',NULL,NULL),
 (2,'Sales','sales module','1',1,'2014-03-13 06:48:21',NULL,NULL),
 (3,'Purchase','','1',1,'2014-04-13 12:46:37',NULL,NULL),
 (4,'Marketing','','1',24,'2014-04-20 08:06:57',NULL,NULL);
/*!40000 ALTER TABLE `web_acm_privilege_mst` ENABLE KEYS */;


--
-- Definition of trigger `privilege_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `privilege_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `privilege_insert` BEFORE INSERT ON `web_acm_privilege_mst` FOR EACH ROW set new.created_dt=now() $$

DELIMITER ;

--
-- Definition of trigger `privilege_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `privilege_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `privilege_update` BEFORE UPDATE ON `web_acm_privilege_mst` FOR EACH ROW set new.updated_dt=now() $$

DELIMITER ;

--
-- Definition of table `web_customer_mst`
--

DROP TABLE IF EXISTS `web_customer_mst`;
CREATE TABLE `web_customer_mst` (
  `cust_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `is_company` varchar(1) NOT NULL,
  `company_id` int(15) DEFAULT NULL,
  `phone_no` varchar(45) DEFAULT NULL,
  `mobile_no1` varchar(45) DEFAULT NULL,
  `mobile_no2` varchar(45) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `active_flag` varchar(1) NOT NULL DEFAULT '1',
  `created_by` int(15) unsigned NOT NULL DEFAULT '0',
  `created_dt` datetime DEFAULT NULL,
  `updated_by` int(15) unsigned DEFAULT NULL,
  `updated_dt` datetime DEFAULT NULL,
  `address` text NOT NULL,
  `country` int(15) unsigned NOT NULL,
  `state` int(15) unsigned NOT NULL,
  `city` int(15) unsigned NOT NULL,
  `job_position` varchar(100) DEFAULT NULL,
  `title` int(15) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  KEY `FK_web_customer_mst_1` (`country`),
  KEY `FK_web_customer_mst_2` (`state`),
  KEY `FK_web_customer_mst_3` (`city`),
  KEY `FK_web_customer_mst_4` (`title`),
  CONSTRAINT `FK_web_customer_mst_1` FOREIGN KEY (`country`) REFERENCES `country` (`country_id`),
  CONSTRAINT `FK_web_customer_mst_2` FOREIGN KEY (`state`) REFERENCES `state` (`state_id`),
  CONSTRAINT `FK_web_customer_mst_3` FOREIGN KEY (`city`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_customer_mst`
--

/*!40000 ALTER TABLE `web_customer_mst` DISABLE KEYS */;
INSERT INTO `web_customer_mst` (`cust_id`,`cust_name`,`description`,`email_id`,`is_company`,`company_id`,`phone_no`,`mobile_no1`,`mobile_no2`,`website`,`active_flag`,`created_by`,`created_dt`,`updated_by`,`updated_dt`,`address`,`country`,`state`,`city`,`job_position`,`title`,`fax`) VALUES 
 (1,'Ankit Agrawal','','ankit35@gmail.com','0',1,'','9898989898','','','1',1,'2014-04-12 16:25:30',0,NULL,'Ahmedabad',1,1,1,'',0,''),
 (2,'TATA MOTORS','','','1',-1,'','7878877878','','','1',1,'2014-04-12 16:27:24',0,NULL,'sec-28,gnagar',1,1,2,'',-1,''),
 (3,'Amit Anand','','amitanand13@gmail.com','0',0,'','4545454554','','','1',1,'2014-04-12 16:30:05',0,NULL,'Ahmedabad',1,1,1,'CEO',1,''),
 (4,'jay','','','0',1,'','8888888888','','','1',24,'2014-04-20 08:21:22',0,NULL,'jgjhg',1,1,1,'',1,'');
/*!40000 ALTER TABLE `web_customer_mst` ENABLE KEYS */;


--
-- Definition of trigger `customer_mst_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `customer_mst_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `customer_mst_insert` BEFORE INSERT ON `web_customer_mst` FOR EACH ROW set new.created_dt=now() $$

DELIMITER ;

--
-- Definition of trigger `customer_mst_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `customer_mst_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `customer_mst_update` BEFORE UPDATE ON `web_customer_mst` FOR EACH ROW set new.updated_dt=now() $$

DELIMITER ;

--
-- Definition of table `web_gen_role_mst`
--

DROP TABLE IF EXISTS `web_gen_role_mst`;
CREATE TABLE `web_gen_role_mst` (
  `role_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  `role_desc` varchar(200) DEFAULT NULL,
  `active_flag` varchar(1) NOT NULL DEFAULT '1',
  `active_from_dt` date DEFAULT NULL,
  `active_to_dt` date DEFAULT NULL,
  `created_by` int(15) unsigned NOT NULL,
  `created_dt` date DEFAULT NULL,
  `updated_by` int(15) unsigned DEFAULT NULL,
  `updated_dt` date DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_gen_role_mst`
--

/*!40000 ALTER TABLE `web_gen_role_mst` DISABLE KEYS */;
INSERT INTO `web_gen_role_mst` (`role_id`,`role_name`,`role_desc`,`active_flag`,`active_from_dt`,`active_to_dt`,`created_by`,`created_dt`,`updated_by`,`updated_dt`) VALUES 
 (1,'Admin','admin','1',NULL,NULL,1,'2014-02-22',NULL,NULL),
 (2,'Purchase Head','purchase head','1',NULL,NULL,1,'2014-02-22',NULL,NULL),
 (3,'Marketing Head','marketing head','1',NULL,NULL,1,'2014-03-06',NULL,NULL),
 (6,'Stock & Inventory Head','head of stock and Inventory department','1',NULL,NULL,1,'2014-03-11',NULL,NULL),
 (7,'Sales Manager','','1',NULL,NULL,1,'2014-04-04',NULL,NULL),
 (8,'Productiion Head','','1',NULL,NULL,1,'2014-04-08',NULL,NULL);
/*!40000 ALTER TABLE `web_gen_role_mst` ENABLE KEYS */;


--
-- Definition of trigger `role_master_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `role_master_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `role_master_insert` BEFORE INSERT ON `web_gen_role_mst` FOR EACH ROW set new.created_dt=curdate() $$

DELIMITER ;

--
-- Definition of trigger `role_master_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `role_master_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `role_master_update` BEFORE UPDATE ON `web_gen_role_mst` FOR EACH ROW set new.updated_dt=curdate() $$

DELIMITER ;

--
-- Definition of table `web_gen_user_role_map`
--

DROP TABLE IF EXISTS `web_gen_user_role_map`;
CREATE TABLE `web_gen_user_role_map` (
  `user_role_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(15) unsigned NOT NULL,
  `role_id` int(15) unsigned NOT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_gen_user_role_map`
--

/*!40000 ALTER TABLE `web_gen_user_role_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_gen_user_role_map` ENABLE KEYS */;


--
-- Definition of table `web_leads_mst`
--

DROP TABLE IF EXISTS `web_leads_mst`;
CREATE TABLE `web_leads_mst` (
  `lead_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL,
  `lead_dt` varchar(45) NOT NULL,
  `customer_id` int(15) unsigned NOT NULL,
  `contact_name` varchar(100) DEFAULT NULL,
  `title` int(15) unsigned DEFAULT NULL,
  `category` int(15) unsigned NOT NULL,
  `priority` int(15) unsigned NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `phone_no` varchar(45) DEFAULT NULL,
  `mobile_no1` varchar(45) DEFAULT NULL,
  `mobile_no2` varchar(45) DEFAULT NULL,
  `description` text,
  `created_by` int(15) unsigned NOT NULL,
  `created_dt` datetime DEFAULT NULL,
  `updated_by` int(15) unsigned DEFAULT NULL,
  `updated_dt` datetime DEFAULT NULL,
  `stage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`lead_id`),
  KEY `FK_web_leads_mst_2` (`category`),
  KEY `FK_web_leads_mst_3` (`priority`),
  KEY `FK_web_leads_mst_1` (`customer_id`),
  CONSTRAINT `FK_web_leads_mst_1` FOREIGN KEY (`customer_id`) REFERENCES `web_customer_mst` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_web_leads_mst_2` FOREIGN KEY (`category`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `FK_web_leads_mst_3` FOREIGN KEY (`priority`) REFERENCES `priorities` (`priority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_leads_mst`
--

/*!40000 ALTER TABLE `web_leads_mst` DISABLE KEYS */;
INSERT INTO `web_leads_mst` (`lead_id`,`subject`,`lead_dt`,`customer_id`,`contact_name`,`title`,`category`,`priority`,`address`,`email`,`fax`,`phone_no`,`mobile_no1`,`mobile_no2`,`description`,`created_by`,`created_dt`,`updated_by`,`updated_dt`,`stage`) VALUES 
 (11,'information required for estimation','2014-04-11',3,'',0,2,2,'Ahmedabad','amitanand13@gmail.com','','','4545454554','','',1,'2014-04-12 16:35:40',1,'2014-04-12 16:36:06','Dead'),
 (12,'information required for project training','2014-04-08',1,'',0,2,2,'Ahmedabad','ankit35@gmail.com','','','9898989898','','',1,'2014-04-16 10:09:13',0,NULL,'New'),
 (13,'information required for project training','2014-04-17',4,'',0,2,1,'jgjhg','','','','8888888888','','',24,'2014-04-20 08:22:53',24,'2014-04-20 08:23:13','New');
/*!40000 ALTER TABLE `web_leads_mst` ENABLE KEYS */;


--
-- Definition of trigger `leads_mst_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `leads_mst_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `leads_mst_insert` BEFORE INSERT ON `web_leads_mst` FOR EACH ROW set new.created_dt=now() $$

DELIMITER ;

--
-- Definition of trigger `leads_mst_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `leads_mst_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `leads_mst_update` BEFORE UPDATE ON `web_leads_mst` FOR EACH ROW set new.updated_dt=now() $$

DELIMITER ;

--
-- Definition of table `web_supplier_mst`
--

DROP TABLE IF EXISTS `web_supplier_mst`;
CREATE TABLE `web_supplier_mst` (
  `supplier_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `is_company` varchar(1) NOT NULL,
  `company_id` int(15) DEFAULT NULL,
  `phone_no` varchar(45) DEFAULT NULL,
  `mobile_no1` varchar(45) DEFAULT NULL,
  `mobile_no2` varchar(45) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `active_flag` varchar(1) NOT NULL DEFAULT '1',
  `created_by` int(15) unsigned NOT NULL DEFAULT '0',
  `created_dt` datetime DEFAULT NULL,
  `updated_by` int(15) unsigned DEFAULT NULL,
  `updated_dt` datetime DEFAULT NULL,
  `address` text NOT NULL,
  `country` int(15) unsigned NOT NULL,
  `state` int(15) unsigned NOT NULL,
  `city` int(15) unsigned NOT NULL,
  `job_position` varchar(100) DEFAULT NULL,
  `title` int(15) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_supplier_mst`
--

/*!40000 ALTER TABLE `web_supplier_mst` DISABLE KEYS */;
INSERT INTO `web_supplier_mst` (`supplier_id`,`supplier_name`,`description`,`email_id`,`is_company`,`company_id`,`phone_no`,`mobile_no1`,`mobile_no2`,`website`,`active_flag`,`created_by`,`created_dt`,`updated_by`,`updated_dt`,`address`,`country`,`state`,`city`,`job_position`,`title`,`fax`) VALUES 
 (1,'VAIO','','vaio@gmail.com','1',-1,'','8778788778','','','1',1,NULL,0,NULL,'Swastik',1,1,1,'',-1,''),
 (2,'Nikunj','','','0',1,'','8888888888','','','1',1,NULL,0,NULL,'Meghani',1,1,1,'',0,''),
 (3,'Arjun','','arjun@yahoo.com','0',0,'','9898989898','','','1',1,NULL,1,NULL,'Asharwa',1,1,1,'',0,''),
 (4,'Vijay Sir','','','0',0,'9999999999','','','','1',1,NULL,1,NULL,'hjgjhg',1,1,1,'',1,''),
 (5,'jay','','','0',1,'','8778788778','','','1',24,NULL,0,NULL,'hjgjhg',1,1,1,'',1,'');
/*!40000 ALTER TABLE `web_supplier_mst` ENABLE KEYS */;


--
-- Definition of table `web_user_master`
--

DROP TABLE IF EXISTS `web_user_master`;
CREATE TABLE `web_user_master` (
  `user_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `login_id` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `full_name` varchar(60) NOT NULL,
  `role_type` int(15) unsigned NOT NULL,
  `active_flag` varchar(1) NOT NULL DEFAULT '1',
  `created_by` int(15) unsigned NOT NULL,
  `created_dt` date DEFAULT NULL,
  `updated_by` int(15) unsigned DEFAULT NULL,
  `updated_dt` date DEFAULT NULL,
  `acc_lock` varchar(1) NOT NULL DEFAULT '0',
  `gender` varchar(7) NOT NULL,
  `birth_dt` varchar(45) NOT NULL,
  `email` varchar(60) NOT NULL,
  `address` text NOT NULL,
  `country` int(15) unsigned NOT NULL,
  `state` int(15) unsigned NOT NULL,
  `city` int(15) unsigned NOT NULL,
  `contact_no` varchar(45) NOT NULL,
  `image` longblob,
  `internal_note` text,
  `assign_rights` varchar(1) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `FK_country_1` (`country`),
  KEY `FK_state_2` (`state`),
  KEY `FK_city_3` (`city`),
  KEY `FK_role_mst` (`role_type`),
  CONSTRAINT `FK_city_3` FOREIGN KEY (`city`) REFERENCES `city` (`city_id`),
  CONSTRAINT `FK_country_1` FOREIGN KEY (`country`) REFERENCES `country` (`country_id`),
  CONSTRAINT `FK_role_mst` FOREIGN KEY (`role_type`) REFERENCES `web_gen_role_mst` (`role_id`),
  CONSTRAINT `FK_state_2` FOREIGN KEY (`state`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_user_master`
--

/*!40000 ALTER TABLE `web_user_master` DISABLE KEYS */;
INSERT INTO `web_user_master` (`user_id`,`login_id`,`password`,`full_name`,`role_type`,`active_flag`,`created_by`,`created_dt`,`updated_by`,`updated_dt`,`acc_lock`,`gender`,`birth_dt`,`email`,`address`,`country`,`state`,`city`,`contact_no`,`image`,`internal_note`,`assign_rights`) VALUES 
 (1,'admin','admin','Amit',1,'1',1,'2014-02-22',1,'2014-04-13','0','male','1992-11-11','thakoramit1111@gmail.com','Love Gate',1,1,1,'9913650239',NULL,'','1'),
 (2,'aashil','abc','Aashil',1,'1',1,'2014-02-22',0,'2014-04-08','0','male','2014-02-05','abc@gmail.com','Some',1,1,4,'3434343434',NULL,'ffgfgfkjgf kgjkj','0'),
 (3,'xyz','xyz','xyz',2,'1',2,'2014-02-22',0,'2014-04-07','0','male','2009-03-03','xxx@gmail.com','XYZ',1,1,1,'8888888888',NULL,'fgfgfgfgf','0'),
 (4,'jay','jay','Jay Patel',2,'1',1,'2014-02-22',1,'2014-04-20','0','male','2001-05-01','jay@gmail.com','mani',1,1,1,'7777777777',NULL,'','0'),
 (6,'suresh','suresh','Suresh',3,'1',1,'2014-02-22',1,'2014-04-08','0','male','2014-02-28','suru@gmail.com','Khadiya',1,1,1,'7878787878',NULL,'note','0'),
 (8,'thakor','thakor','Thakor',2,'1',1,'2014-03-06',0,'2014-04-07','0','male','2014-03-01','thakor@gmail.com','cdfdf',1,1,1,'2222222222',NULL,'fgfgfg','0'),
 (9,'soni','soni','D',1,'1',1,'2014-03-06',0,'2014-04-07','0','male','2014-03-11','thakoramit1111@gmail.com','fgfgfg',1,1,1,'7777777777',NULL,'fgfgfg','0'),
 (10,'sejal','[C@18a9216','sejal',1,'1',1,'2014-03-07',0,'2014-04-13','0','female','2014-03-12','dreamsejal54@gmail.com','mjgjgg',1,1,1,'2222222222',NULL,'kjhkjhkjh','0'),
 (11,'daxesh','daxesh','daxesh',3,'1',1,'2014-03-07',0,'2014-04-07','0','male','1992-01-11','daxeshgohel@gmail.com','6/b manilalnagar,ghatlodia',1,1,1,'9601500047',NULL,'nothing','0'),
 (12,'hardik','[C@fec020','Hardik H Mehta',3,'1',1,'2014-03-07',0,'2014-04-07','0','male','2014-03-31','hardikmehta.it@ddu.ac.in','Ahmedabad',1,1,1,'9898989898',NULL,'Admin','0'),
 (14,'Jay','[C@2cd73e','Jay Patel',2,'1',1,'2014-03-27',0,'2014-04-07','0','male','1993-04-14','jaypateljs@gmail.com','fhfhfh',1,1,1,'8866861835',NULL,'lazy','0'),
 (15,'Dhruv','dhruv','Dhruv C',2,'1',9,'2014-03-27',0,'2014-04-08','0','male','1993-03-17','amitsherdil1111@gmail.com','fgfgfg',1,1,4,'9898989898',NULL,'','0'),
 (16,'pqr','[C@96cb3e','PQR',1,'1',1,'2014-03-30',0,'2014-04-07','0','female','2014-03-19','abc@gmail.com','fjgfkgjkfjg',1,6,6,'8787878787',NULL,NULL,'0'),
 (17,'ankit','[C@165b863','Ankit Agrawal',2,'1',1,'2014-04-01',0,'2014-04-07','0','male','1992-06-29','ankitagrawal296@gmail.com','ranchodpura',1,1,1,'9904396875',NULL,'','0'),
 (18,'amit','amit','Amit Rawat',1,'1',1,'2014-04-02',0,'2014-04-13','0','male','1992-02-11','amit.cr92@gmail.com','Chandkheda',1,1,1,'9714292852',NULL,'','1'),
 (19,'dhruv','[C@12fb4b2','Dhruv Chaudhry',1,'1',1,'2014-04-02',0,'2014-04-07','0','male','1993-05-10','dcbesexy10@gmail.com','sanskardham',1,1,4,'7878787878',NULL,NULL,'0'),
 (20,'suru','[C@1bd97f3','Suresh',7,'1',1,'2014-04-04',0,'2014-04-13','0','male','1992-07-26','suru30141023@gmail.com','Ahmedabad',1,1,1,'8888888888',NULL,NULL,'1'),
 (21,'sunil','[C@18c025','Sunil Thakor',7,'1',1,'2014-04-07',0,'2014-04-07','0','male','1998-10-31','thakoramit1111@gmail.com','Love Gate',1,1,1,'8888888888',NULL,NULL,'0'),
 (22,'Kshatriya','[C@17c419a','Kshatriya Thakor',1,'1',1,'2014-04-08',0,NULL,'0','male','2014-08-15','thakoramit1111@gmail.com','Love Gate',1,1,1,'9904396932',NULL,'','0'),
 (23,'kaal','[C@1938e8a','Kuldip Patel',2,'1',18,'2014-04-13',18,'2014-04-13','0','male','1992-05-06','swami@gmail.com','Ahmedabad',1,1,1,'8866861835',NULL,'','1'),
 (24,'man','man','Manthan G',1,'1',1,'2014-04-20',0,'2014-04-20','0','male','1993-04-04','manthangajjar0@gmail.com','Maninagar',1,1,1,'8866863263',NULL,'note','1');
/*!40000 ALTER TABLE `web_user_master` ENABLE KEYS */;


--
-- Definition of trigger `user_master_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `user_master_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `user_master_insert` BEFORE INSERT ON `web_user_master` FOR EACH ROW set new.created_dt=curdate() $$

DELIMITER ;

--
-- Definition of trigger `user_master_update`
--

DROP TRIGGER /*!50030 IF EXISTS */ `user_master_update`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `user_master_update` BEFORE UPDATE ON `web_user_master` FOR EACH ROW set new.updated_dt=curdate() $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
