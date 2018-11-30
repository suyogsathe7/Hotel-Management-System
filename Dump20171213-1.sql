-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hotelmanagement
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `afternoonshift`
--

DROP TABLE IF EXISTS `afternoonshift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afternoonshift` (
  `EmployeeID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `shift` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afternoonshift`
--

LOCK TABLES `afternoonshift` WRITE;
/*!40000 ALTER TABLE `afternoonshift` DISABLE KEYS */;
/*!40000 ALTER TABLE `afternoonshift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID_FK` int(11) NOT NULL,
  `CheckIN` date DEFAULT NULL,
  `CheckOUT` date DEFAULT NULL,
  `ExtraBed` int(11) DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `fk_Booking_Customer1_idx` (`CustomerID_FK`),
  CONSTRAINT `fk_Booking_Customer1` FOREIGN KEY (`CustomerID_FK`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,'2017-12-06','2017-12-09',NULL),(2,2,'2017-10-15','2017-10-22',NULL),(3,3,'2017-10-22','2017-10-23',NULL),(4,4,'2017-11-17',NULL,NULL),(5,5,'2017-12-11','2017-12-13',NULL),(6,6,'2017-12-06','2017-12-09',NULL),(7,7,'2017-12-01',NULL,NULL),(8,8,'2017-12-27','2017-12-28',NULL),(9,9,'2017-08-17',NULL,NULL),(10,10,'2017-10-22',NULL,NULL);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bookingdetails`
--

DROP TABLE IF EXISTS `bookingdetails`;
/*!50001 DROP VIEW IF EXISTS `bookingdetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bookingdetails` AS SELECT 
 1 AS `BookingID`,
 1 AS `Customer Name`,
 1 AS `Check In Date`,
 1 AS `Check out Date`,
 1 AS `Booking Type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `ReceptionID_FK` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Zip` int(5) DEFAULT NULL,
  `IDType` varchar(45) DEFAULT NULL,
  `IDNo` varchar(45) DEFAULT NULL,
  `ContactNo` varchar(45) DEFAULT NULL,
  `EmailID` varchar(45) DEFAULT NULL,
  `Booking` enum('Online','Offline') DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `fk_Customer_Reception1_idx` (`ReceptionID_FK`),
  CONSTRAINT `fk_Customer_Reception1` FOREIGN KEY (`ReceptionID_FK`) REFERENCES `reception` (`ReceptionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1,'SUYOG','M','BOSTON',2120,'PASSPORT','Z4127946','8573995537','suyogsathe7@gmail.com','Online'),(2,1,'ROHAN','M','CHICAGO',2345,'PASSPORT','Z4127945','8573995536','rohan@gmail.com','Offline'),(3,1,'CHINAMY','M','UTAH',12345,'PASSPORT','Z4127944','8573995535','chinmay@gmail.com','Online'),(4,1,'CHAITANYA','M','NEW JERSEY',56748,'PASSPORT','Z4127943','8573995534','chaitanya@gmail.com','Online'),(5,1,'MAYUR','M','MANCHESTER',98756,'PASSPORT','Z4127942','8573995533','mayur@gmail.com','Offline');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_customer_forInsert
AFTER INSERT 
ON customer FOR EACH ROW
BEGIN
	     DECLARE vUser varchar(20);
     --   SELECT user() into vUser;
        SELECT `name` from customer where CustomerID = New.CustomerID into Vuser;
        INSERT INTO customer_audit(username,Customer_CustomerID,`Date`) VALUES (vUser,New.CustomerID,current_timestamp()); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer_audit`
--

DROP TABLE IF EXISTS `customer_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_audit` (
  `username` varchar(45) NOT NULL,
  `Customer_CustomerID` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `fk_customer_Audit_Customer1_idx` (`Customer_CustomerID`),
  CONSTRAINT `fk_customer_Audit_Customer1` FOREIGN KEY (`Customer_CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_audit`
--

LOCK TABLES `customer_audit` WRITE;
/*!40000 ALTER TABLE `customer_audit` DISABLE KEYS */;
INSERT INTO `customer_audit` VALUES ('CHAITANYA',4,'2017-12-13 22:06:41'),('CHINAMY',3,'2017-12-13 22:06:41'),('MAYUR',5,'2017-12-13 22:06:41'),('ROHAN',2,'2017-12-13 22:06:41'),('SAMARTH',6,'2017-12-13 22:01:45'),('SUYOG',1,'2017-12-13 22:06:41'),('yogini',11,'2017-12-13 22:06:02');
/*!40000 ALTER TABLE `customer_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `DepartmentID` int(11) NOT NULL,
  `Department` varchar(45) NOT NULL,
  `Hotel_HotelID` int(11) NOT NULL,
  PRIMARY KEY (`DepartmentID`),
  KEY `fk_Department_Hotel1_idx` (`Hotel_HotelID`),
  CONSTRAINT `fk_Department_Hotel1` FOREIGN KEY (`Hotel_HotelID`) REFERENCES `hotel` (`HotelID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Cooking',1),(2,'Security',1),(3,'Housekeeping',1);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_has_employees`
--

DROP TABLE IF EXISTS `department_has_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_has_employees` (
  `Department_DepartmentID` int(11) NOT NULL,
  `Employees_EmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`Department_DepartmentID`,`Employees_EmployeeID`),
  KEY `fk_Department_has_Employees_Employees1_idx` (`Employees_EmployeeID`),
  KEY `fk_Department_has_Employees_Department1_idx` (`Department_DepartmentID`),
  CONSTRAINT `fk_Department_has_Employees_Department1` FOREIGN KEY (`Department_DepartmentID`) REFERENCES `department` (`DepartmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Department_has_Employees_Employees1` FOREIGN KEY (`Employees_EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_has_employees`
--

LOCK TABLES `department_has_employees` WRITE;
/*!40000 ALTER TABLE `department_has_employees` DISABLE KEYS */;
INSERT INTO `department_has_employees` VALUES (2,1),(2,2),(3,3),(3,4),(2,5),(1,6),(1,7),(3,8),(1,9),(3,10);
/*!40000 ALTER TABLE `department_has_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `shift` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'abhay','Morning'),(2,'suresh','Afternoon'),(3,'ramesh','Morning'),(4,'avinash','Evening'),(5,'rohit','Night'),(6,'ravi','Morning'),(7,'Dan','Night'),(8,'Cyrus','Afternoon'),(9,'John','Afternoon'),(10,'Ann','Morning');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eveningshift`
--

DROP TABLE IF EXISTS `eveningshift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eveningshift` (
  `EmployeeID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `shift` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eveningshift`
--

LOCK TABLES `eveningshift` WRITE;
/*!40000 ALTER TABLE `eveningshift` DISABLE KEYS */;
/*!40000 ALTER TABLE `eveningshift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food` (
  `FoodID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) DEFAULT NULL,
  `Rate` int(11) DEFAULT NULL,
  PRIMARY KEY (`FoodID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Breakfast',20),(2,'Lunch',40),(3,'Dinner',60);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `food_details`
--

DROP TABLE IF EXISTS `food_details`;
/*!50001 DROP VIEW IF EXISTS `food_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `food_details` AS SELECT 
 1 AS `Room Number`,
 1 AS `Food`,
 1 AS `Quantity`,
 1 AS `Rate`,
 1 AS `Amount`,
 1 AS `Date of Food Served`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `HotelID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zip` int(5) DEFAULT NULL,
  PRIMARY KEY (`HotelID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'Suswagat','Dattapada Road','Mumbai',40006);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `morningshift`
--

DROP TABLE IF EXISTS `morningshift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `morningshift` (
  `EmployeeID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `shift` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `morningshift`
--

LOCK TABLES `morningshift` WRITE;
/*!40000 ALTER TABLE `morningshift` DISABLE KEYS */;
/*!40000 ALTER TABLE `morningshift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nightshift`
--

DROP TABLE IF EXISTS `nightshift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nightshift` (
  `EmployeeID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `shift` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nightshift`
--

LOCK TABLES `nightshift` WRITE;
/*!40000 ALTER TABLE `nightshift` DISABLE KEYS */;
/*!40000 ALTER TABLE `nightshift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offlinebooking`
--

DROP TABLE IF EXISTS `offlinebooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offlinebooking` (
  `OfflineID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_CustomerID` int(11) NOT NULL,
  PRIMARY KEY (`OfflineID`),
  KEY `fk_OfflineBooking_Customer1_idx` (`Customer_CustomerID`),
  CONSTRAINT `fk_OfflineBooking_Customer1` FOREIGN KEY (`Customer_CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offlinebooking`
--

LOCK TABLES `offlinebooking` WRITE;
/*!40000 ALTER TABLE `offlinebooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `offlinebooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onlinebooking`
--

DROP TABLE IF EXISTS `onlinebooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `onlinebooking` (
  `OnlineID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID_FK` int(11) NOT NULL,
  PRIMARY KEY (`OnlineID`),
  KEY `fk_OnlineBooking_Customer1_idx` (`CustomerID_FK`),
  CONSTRAINT `fk_OnlineBooking_Customer1` FOREIGN KEY (`CustomerID_FK`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onlinebooking`
--

LOCK TABLES `onlinebooking` WRITE;
/*!40000 ALTER TABLE `onlinebooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `onlinebooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `BookingID_FK` int(11) NOT NULL,
  `PaymentMode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `fk_Payment_Booking1_idx` (`BookingID_FK`),
  CONSTRAINT `fk_Payment_Booking1` FOREIGN KEY (`BookingID_FK`) REFERENCES `booking` (`BookingID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricelog`
--

DROP TABLE IF EXISTS `pricelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricelog` (
  `Bill` float DEFAULT NULL,
  `RestaurantID_FK` int(11) NOT NULL,
  PRIMARY KEY (`RestaurantID_FK`),
  KEY `fk_PriceLog_Restaurant1_idx` (`RestaurantID_FK`),
  CONSTRAINT `fk_PriceLog_Restaurant1` FOREIGN KEY (`RestaurantID_FK`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricelog`
--

LOCK TABLES `pricelog` WRITE;
/*!40000 ALTER TABLE `pricelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reception`
--

DROP TABLE IF EXISTS `reception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reception` (
  `ReceptionID` int(11) NOT NULL AUTO_INCREMENT,
  `HotelID_FK` int(11) NOT NULL,
  `RestaurantID_FK` int(11) NOT NULL,
  `RoomID_FK` int(11) NOT NULL,
  PRIMARY KEY (`ReceptionID`),
  KEY `fk_Reception_Hotel1_idx` (`HotelID_FK`),
  KEY `fk_Reception_Restaurant1_idx` (`RestaurantID_FK`),
  KEY `fk_Reception_Rooms1_idx` (`RoomID_FK`),
  CONSTRAINT `fk_Reception_Hotel1` FOREIGN KEY (`HotelID_FK`) REFERENCES `hotel` (`HotelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reception_Restaurant1` FOREIGN KEY (`RestaurantID_FK`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reception_Rooms1` FOREIGN KEY (`RoomID_FK`) REFERENCES `rooms` (`RoomID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reception`
--

LOCK TABLES `reception` WRITE;
/*!40000 ALTER TABLE `reception` DISABLE KEYS */;
/*!40000 ALTER TABLE `reception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `RestaurantID` int(11) NOT NULL AUTO_INCREMENT,
  `RoomID_FK` int(11) NOT NULL,
  `FoodID_FK` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `ServeDate` date DEFAULT NULL,
  `Hotel_HotelID` int(11) NOT NULL,
  PRIMARY KEY (`RestaurantID`),
  KEY `fk_Restaurant_Rooms1_idx` (`RoomID_FK`),
  KEY `fk_Restaurant_FoodCategory1_idx` (`FoodID_FK`),
  KEY `fk_Restaurant_Hotel1_idx` (`Hotel_HotelID`),
  CONSTRAINT `fk_Restaurant_FoodCategory1` FOREIGN KEY (`FoodID_FK`) REFERENCES `food` (`FoodID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Restaurant_Hotel1` FOREIGN KEY (`Hotel_HotelID`) REFERENCES `hotel` (`HotelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Restaurant_Rooms1` FOREIGN KEY (`RoomID_FK`) REFERENCES `rooms` (`RoomID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,101,1,3,'2017-12-06',1),(2,201,3,1,'2017-11-21',1),(3,102,2,5,'2017-10-12',1),(4,202,2,12,'2017-12-07',1),(5,102,1,3,'2017-12-08',1),(6,301,3,7,'2017-12-09',1),(7,303,3,2,'2017-12-10',1),(8,303,2,1,'2017-12-11',1),(9,300,2,3,'2017-12-12',1),(10,200,1,1,'2017-12-13',1);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `room_status`
--

DROP TABLE IF EXISTS `room_status`;
/*!50001 DROP VIEW IF EXISTS `room_status`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `room_status` AS SELECT 
 1 AS `Room Number`,
 1 AS `RoomType`,
 1 AS `Check Out Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `RoomID` int(11) NOT NULL AUTO_INCREMENT,
  `RoomTypeID_FK` int(11) NOT NULL,
  `BookingID_FK` int(11) DEFAULT NULL,
  `Availability` tinyint(4) NOT NULL,
  PRIMARY KEY (`RoomID`),
  KEY `fk_Rooms_RoomType1_idx` (`RoomTypeID_FK`),
  KEY `fk_Rooms_Booking1_idx` (`BookingID_FK`),
  CONSTRAINT `fk_Rooms_Booking1` FOREIGN KEY (`BookingID_FK`) REFERENCES `booking` (`BookingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rooms_RoomType1` FOREIGN KEY (`RoomTypeID_FK`) REFERENCES `roomtype` (`RoomTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (101,1,2,0),(102,2,5,0),(103,3,4,0),(104,1,NULL,1),(201,3,3,0),(202,2,1,0),(203,3,4,0),(204,2,NULL,1),(301,1,3,0),(302,2,2,0),(303,3,1,0),(304,3,NULL,1);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomtype`
--

DROP TABLE IF EXISTS `roomtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roomtype` (
  `RoomTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `roomType` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`RoomTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtype`
--

LOCK TABLES `roomtype` WRITE;
/*!40000 ALTER TABLE `roomtype` DISABLE KEYS */;
INSERT INTO `roomtype` VALUES (1,'Deluxe',400),(2,'Premium',500),(3,'Supreme',600);
/*!40000 ALTER TABLE `roomtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `staydays`
--

DROP TABLE IF EXISTS `staydays`;
/*!50001 DROP VIEW IF EXISTS `staydays`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `staydays` AS SELECT 
 1 AS `Room Number`,
 1 AS `Customer Name`,
 1 AS `Room Type`,
 1 AS `BookingID`,
 1 AS `No of Days Stayed`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'hotelmanagement'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `customerBackups` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `customerBackups` ON SCHEDULE EVERY 5 HOUR STARTS '2017-12-13 08:30:00' ON COMPLETION NOT PRESERVE ENABLE DO begin
select * into outfile 'C:\STUDY\DBMS\eg.csv' from customer;
end */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'hotelmanagement'
--
/*!50003 DROP PROCEDURE IF EXISTS `backup_customer_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `backup_customer_details`()
BEGIN
CREATE TABLE newCustomer AS SELECT * FROM customer;
CREATE TABLE onlineCustomer AS SELECT * FROM customer WHERE Booking="Online";
CREATE TABLE offlineCustomer AS SELECT * FROM customer WHERE Booking="Offline";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `count_rooms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_rooms`()
begin
select count(rooms.Availability)as `Available Rooms`, roomType as `Room Type`  from rooms
inner join roomtype
on rooms.RoomTypeID_FK = roomtype.RoomTypeID
where BookingID_FK is null;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_hotel_bill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_hotel_bill`(IN id INT(10))
BEGIN
select CustomerID, `name`, roomType, CheckOUT-CheckIN as `Days Stayed`,SUM((CheckOUT-CheckIN)*price) as `Total`
from customer
inner join booking
on customer.CustomerID = booking.CustomerID_FK
inner join rooms 
on booking.BookingID = rooms.BookingID_FK
inner join roomtype
on rooms.RoomTypeID_FK = roomtype.RoomTypeID
where CheckIN is not null and CheckOUT is not null and CustomerID=1
group by roomType with rollup;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_invoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_invoice`(IN id INT(10))
BEGIN
SELECT BookingID,`name` AS `Name`,CheckIN, CheckOUT , sum(Quantity*Rate) AS `Restaurant Bill`, (CheckOUT-CheckIN)*price as `Hotel Bill` ,sum(Quantity*Rate)+((CheckOUT-CheckIN)*price) as `Total Bill`
FROM customer
INNER JOIN booking
ON customer.CustomerID = booking.CustomerID_FK
INNER JOIN rooms
ON booking.BookingID = rooms.BookingID_FK
INNER JOIN roomtype
ON rooms.RoomTypeID_FK = roomtype.RoomTypeID
INNER JOIN restaurant 
ON rooms.RoomID = restaurant.RoomID_FK
INNER JOIN food 
ON restaurant.FoodID_FK = food.FoodID
where CheckIN is not null and CheckOUT is not null and BookingID=id
group by name
order by BookingID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_res_bill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_res_bill`(IN id INT(10))
BEGIN
SELECT RoomID_FK AS `Room No`,`Type` AS `Food Type Ordered`,sum(Quantity*Rate) as Amount
FROM food
INNER JOIN restaurant
ON food.FoodID = restaurant.FoodID_FK
where RoomID_FK=id
group by `Type` with rollup;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `shift_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `shift_details`()
BEGIN
CREATE TABLE morningShift AS SELECT * FROM employees WHERE shift="Morning";
CREATE TABLE afternoonShift AS SELECT * FROM employees WHERE shift="Afternoon";
CREATE TABLE eveningShift AS SELECT * FROM employees WHERE shift="Evening";
CREATE TABLE nightShift AS SELECT * FROM employees WHERE shift="Night";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `bookingdetails`
--

/*!50001 DROP VIEW IF EXISTS `bookingdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bookingdetails` AS select `booking`.`BookingID` AS `BookingID`,`customer`.`name` AS `Customer Name`,`booking`.`CheckIN` AS `Check In Date`,`booking`.`CheckOUT` AS `Check out Date`,`customer`.`Booking` AS `Booking Type` from (`booking` join `customer` on((`booking`.`CustomerID_FK` = `customer`.`CustomerID`))) where (`booking`.`BookingID` is not null) order by `booking`.`BookingID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `food_details`
--

/*!50001 DROP VIEW IF EXISTS `food_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `food_details` AS select `rooms`.`RoomID` AS `Room Number`,`food`.`Type` AS `Food`,`restaurant`.`Quantity` AS `Quantity`,`food`.`Rate` AS `Rate`,(`restaurant`.`Quantity` * `food`.`Rate`) AS `Amount`,`restaurant`.`ServeDate` AS `Date of Food Served` from ((`rooms` join `restaurant` on((`rooms`.`RoomID` = `restaurant`.`RoomID_FK`))) join `food` on((`restaurant`.`FoodID_FK` = `food`.`FoodID`))) order by `rooms`.`RoomID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `room_status`
--

/*!50001 DROP VIEW IF EXISTS `room_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `room_status` AS select `rooms`.`RoomID` AS `Room Number`,`roomtype`.`roomType` AS `RoomType`,`booking`.`CheckOUT` AS `Check Out Date` from ((`booking` join `rooms` on((`booking`.`BookingID` = `rooms`.`BookingID_FK`))) join `roomtype` on((`rooms`.`RoomTypeID_FK` = `roomtype`.`RoomTypeID`))) order by `rooms`.`RoomID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staydays`
--

/*!50001 DROP VIEW IF EXISTS `staydays`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staydays` AS select `rooms`.`RoomID` AS `Room Number`,`customer`.`name` AS `Customer Name`,`roomtype`.`roomType` AS `Room Type`,`booking`.`BookingID` AS `BookingID`,(`booking`.`CheckOUT` - `booking`.`CheckIN`) AS `No of Days Stayed` from (`roomtype` left join ((`customer` join `booking` on((`customer`.`CustomerID` = `booking`.`CustomerID_FK`))) join `rooms` on((`booking`.`BookingID` = `rooms`.`BookingID_FK`))) on((`rooms`.`RoomTypeID_FK` = `roomtype`.`RoomTypeID`))) where ((`booking`.`BookingID` is not null) and (`booking`.`CheckIN` is not null) and (`booking`.`CheckOUT` is not null)) order by `rooms`.`RoomID` */;
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

-- Dump completed on 2017-12-13 23:15:21
