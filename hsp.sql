-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: HOSPITAL
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Current Database: `HOSPITAL`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `HOSPITAL` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `HOSPITAL`;

--
-- Table structure for table `ADMISSION`
--

DROP TABLE IF EXISTS `ADMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMISSION` (
  `PATIENT_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `NURSE_ID` int(11) NOT NULL,
  `ROOM_NUMBER` int(11) NOT NULL,
  KEY `DOCTOR_ID` (`DOCTOR_ID`),
  KEY `NURSE_ID` (`NURSE_ID`),
  KEY `ROOM_NUMBER` (`ROOM_NUMBER`),
  KEY `PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `ADMISSION_ibfk_1` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `DOCTOR` (`DOCTOR_ID`),
  CONSTRAINT `ADMISSION_ibfk_2` FOREIGN KEY (`NURSE_ID`) REFERENCES `NURSE` (`NURSE_ID`),
  CONSTRAINT `ADMISSION_ibfk_3` FOREIGN KEY (`ROOM_NUMBER`) REFERENCES `ROOM` (`ROOM_NUMBER`),
  CONSTRAINT `ADMISSION_ibfk_4` FOREIGN KEY (`PATIENT_ID`) REFERENCES `PATIENT` (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMISSION`
--

LOCK TABLES `ADMISSION` WRITE;
/*!40000 ALTER TABLE `ADMISSION` DISABLE KEYS */;
INSERT INTO ADMISSION VALUES (1,1,1,1);
INSERT INTO ADMISSION VALUES (2,2,2,2);
INSERT INTO ADMISSION VALUES (3,3,3,3);
/*!40000 ALTER TABLE `ADMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOCTOR`
--

DROP TABLE IF EXISTS `DOCTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOCTOR` (
  `PHONE_NUMBER` varchar(10) DEFAULT NULL,
  `NAME` varchar(15) DEFAULT NULL,
  `DEPARTMENT` int(11) DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL check (SEX = 'M' or SEX = 'F'),
  `WORKING_HOURS` varchar(25) DEFAULT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  PRIMARY KEY (`DOCTOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCTOR`
--

LOCK TABLES `DOCTOR` WRITE;
/*!40000 ALTER TABLE `DOCTOR` DISABLE KEYS */;
INSERT INTO DOCTOR VALUES ("98786547231","Alice",1,"F","(9-2 & 3-5)",1);
INSERT INTO DOCTOR VALUES ("96781546231","Bunty",2,"M","(10-1 & 3-7)",2);
INSERT INTO DOCTOR VALUES ("99286347431","Charles",3,"M","(9-2 & 3-6)",3);
/*!40000 ALTER TABLE `DOCTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOCTOR_PHONE_NUMBER`
--

DROP TABLE IF EXISTS `DOCTOR_PHONE_NUMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOCTOR_PHONE_NUMBER` (
  `DOCTOR_ID` int(11) NOT NULL,
  `PHONE_NUMBER` varchar(10) NOT NULL,
  PRIMARY KEY (`DOCTOR_ID`,`PHONE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCTOR_PHONE_NUMBER`
--

LOCK TABLES `DOCTOR_PHONE_NUMBER` WRITE;
/*!40000 ALTER TABLE `DOCTOR_PHONE_NUMBER` DISABLE KEYS */;
INSERT INTO DOCTOR_PHONE_NUMBER VALUES (1,"98786547231"),(2,"96781546231"),(3,"99286347431");
/*!40000 ALTER TABLE `DOCTOR_PHONE_NUMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEDICLAIM_POLICY`
--

DROP TABLE IF EXISTS `MEDICLAIM_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEDICLAIM_POLICY` (
  `PATIENT_ID` int(11) NOT NULL,
  `BANK_AFFILIATED` varchar(30) DEFAULT NULL,
  `AMOUNT_COVERED` int(11) DEFAULT NULL,
  `DATE_OF_LAST_RENEWAL` date DEFAULT NULL,
  KEY `PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `MEDICLAIM_POLICY_ibfk_1` FOREIGN KEY (`PATIENT_ID`) REFERENCES `PATIENT` (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDICLAIM_POLICY`
--

LOCK TABLES `MEDICLAIM_POLICY` WRITE;
/*!40000 ALTER TABLE `MEDICLAIM_POLICY` DISABLE KEYS */;
INSERT INTO MEDICLAIM_POLICY VALUES (1,"SBI",100000,"2016-4-5"),(2,"ICICI",200000,"2017-6-6"),(3,"YESBANK",50000,"2018-2-9");
/*!40000 ALTER TABLE `MEDICLAIM_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NURSE`
--

DROP TABLE IF EXISTS `NURSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NURSE` (
  `PHONE_NUMBER` varchar(10) DEFAULT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `SUPERVISOR_ID` int(11) NOT NULL,
  `PATIENT_ID` int(11) NOT NULL,
  `WORKING_HOURS` varchar(20) DEFAULT NULL,
  `NURSE_ID` int(11) NOT NULL,
  PRIMARY KEY (`NURSE_ID`),
  KEY `SUPERVISOR_ID` (`SUPERVISOR_ID`),
  CONSTRAINT `NURSE_ibfk_1` FOREIGN KEY (`SUPERVISOR_ID`) REFERENCES `DOCTOR` (`DOCTOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NURSE`
--

LOCK TABLES `NURSE` WRITE;
/*!40000 ALTER TABLE `NURSE` DISABLE KEYS */;
INSERT INTO NURSE VALUES ("9831001236","Gaitonde",1,1,"(10-2 & 3-5)",1),("9231001214","Himesh",2,2,"(10-2 &
3-7)",2),("9531101236","Indira",3,3,"(9-2 & 4-6)",3);
/*!40000 ALTER TABLE `NURSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NURSE_PHONE_NUMBER`
--

DROP TABLE IF EXISTS `NURSE_PHONE_NUMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NURSE_PHONE_NUMBER` (
  `NURSE_ID` int(11) NOT NULL,
  `PHONE_NUMBER` varchar(10) NOT NULL,
  PRIMARY KEY (`NURSE_ID`,`PHONE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NURSE_PHONE_NUMBER`
--

LOCK TABLES `NURSE_PHONE_NUMBER` WRITE;
/*!40000 ALTER TABLE `NURSE_PHONE_NUMBER` DISABLE KEYS */;
INSERT INTO NURSE_PHONE_NUMBER VALUES (1,"9831001236"),(2,"9231001214"),(3,"9531101236");
/*!40000 ALTER TABLE `NURSE_PHONE_NUMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATIENT`
--

DROP TABLE IF EXISTS `PATIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PATIENT` (
  `PATIENT_ID` int(11) NOT NULL,
  `DATE_OF_BIRTH` date DEFAULT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL check (SEX in ('M','F')),
  `EMAIL` varchar(30) DEFAULT NULL,
  `PHONE_NUMBER` varchar(10) DEFAULT NULL,
  `ROOM_NUMBER` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `NURSE_ID` int(11) NOT NULL,
  PRIMARY KEY (`PATIENT_ID`),
  KEY `DOCTOR_ID` (`DOCTOR_ID`),
  KEY `NURSE_ID` (`NURSE_ID`),
  KEY `ROOM_NUMBER` (`ROOM_NUMBER`),
  CONSTRAINT `PATIENT_ibfk_1` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `DOCTOR` (`DOCTOR_ID`),
  CONSTRAINT `PATIENT_ibfk_2` FOREIGN KEY (`NURSE_ID`) REFERENCES `NURSE` (`NURSE_ID`),
  CONSTRAINT `PATIENT_ibfk_3` FOREIGN KEY (`ROOM_NUMBER`) REFERENCES `ROOM` (`ROOM_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATIENT`
--

LOCK TABLES `PATIENT` WRITE;
/*!40000 ALTER TABLE `PATIENT` DISABLE KEYS */;
INSERT INTO PATIENT VALUES (1,'1997-1-1','Dave','M','dave@gmail.com','9874654321',1,1,1),(2,"1996-2-2","Edith","F","edith@gmail.com","9974653421",2,2,2)  
,(3,"1995-3-3","Franz","M","franz@gmail.com","9674634322",3,3,3);
/*!40000 ALTER TABLE `PATIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATIENT_BILL`
--

DROP TABLE IF EXISTS `PATIENT_BILL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PATIENT_BILL` (
  `PATIENT_ID` int(11) NOT NULL,
  `ROOM_OF_PATIENT` int(11) DEFAULT NULL,
  `BILL_AMOUNT` int(11) DEFAULT NULL,
  `DOCTOR_DEPARTMENT` int(11) DEFAULT NULL,
  `DAYS_OF_STAY` int(11) DEFAULT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  KEY `PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `PATIENT_BILL_ibfk_1` FOREIGN KEY (`PATIENT_ID`) REFERENCES `PATIENT` (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATIENT_BILL`
--

LOCK TABLES `PATIENT_BILL` WRITE;
/*!40000 ALTER TABLE `PATIENT_BILL` DISABLE KEYS */;
INSERT INTO PATIENT_BILL VALUES (1,1,50000,1,10,1),(2,2,20000,2,20,2),(3,3,30000,3,30,3);
/*!40000 ALTER TABLE `PATIENT_BILL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATIENT_BILL_DISTRICT`
--

DROP TABLE IF EXISTS `PATIENT_BILL_DISTRICT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PATIENT_BILL_DISTRICT` (
  `DISTRICT` varchar(30) DEFAULT NULL,
  `PINCODE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATIENT_BILL_DISTRICT`
--

LOCK TABLES `PATIENT_BILL_DISTRICT` WRITE;
/*!40000 ALTER TABLE `PATIENT_BILL_DISTRICT` DISABLE KEYS */;
INSERT INTO PATIENT_BILL_DISTRICT VALUES ("South-24","700036"),("North-12","456123"),("Sector-5","890134");
/*!40000 ALTER TABLE `PATIENT_BILL_DISTRICT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATIENT_DISTRICT`
--

DROP TABLE IF EXISTS `PATIENT_DISTRICT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PATIENT_DISTRICT` (
  `DISTRICT` varchar(30) DEFAULT NULL,
  `PINCODE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATIENT_DISTRICT`
--

LOCK TABLES `PATIENT_DISTRICT` WRITE;
/*!40000 ALTER TABLE `PATIENT_DISTRICT` DISABLE KEYS */;
INSERT INTO PATIENT_DISTRICT VALUES ("South-24","700036"),("North-12","456123"),("Sector-5","890134");
/*!40000 ALTER TABLE `PATIENT_DISTRICT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATIENT_EMAIL_ID`
--

DROP TABLE IF EXISTS `PATIENT_EMAIL_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PATIENT_EMAIL_ID` (
  `PATIENT_ID` int(11) NOT NULL,
  `EMAIL_ID` varchar(30) NOT NULL,
  PRIMARY KEY (`PATIENT_ID`,`EMAIL_ID`),
  CONSTRAINT `PATIENT_EMAIL_ID_ibfk_1` FOREIGN KEY (`PATIENT_ID`) REFERENCES `PATIENT` (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATIENT_EMAIL_ID`
--

LOCK TABLES `PATIENT_EMAIL_ID` WRITE;
/*!40000 ALTER TABLE `PATIENT_EMAIL_ID` DISABLE KEYS */;
INSERT INTO PATIENT_EMAIL_ID VALUES (1,"dave@gmail.com"),(2,"edith@gmail.com"),(3,"franz@gmail.com");
/*!40000 ALTER TABLE `PATIENT_EMAIL_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATIENT_PHONE_NUMBER`
--

DROP TABLE IF EXISTS `PATIENT_PHONE_NUMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PATIENT_PHONE_NUMBER` (
  `PATIENT_ID` int(11) NOT NULL,
  `PHONE_NUMBER` varchar(10) NOT NULL,
  PRIMARY KEY (`PATIENT_ID`,`PHONE_NUMBER`),
  CONSTRAINT `PATIENT_PHONE_NUMBER_ibfk_1` FOREIGN KEY (`PATIENT_ID`) REFERENCES `PATIENT` (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATIENT_PHONE_NUMBER`
--

LOCK TABLES `PATIENT_PHONE_NUMBER` WRITE;
/*!40000 ALTER TABLE `PATIENT_PHONE_NUMBER` DISABLE KEYS */;
INSERT INTO PATIENT_PHONE_NUMBER VALUES (1,"9874654321"),(2,"9974653421"),(3,"9674634322");
/*!40000 ALTER TABLE `PATIENT_PHONE_NUMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PHYSICIAN`
--

DROP TABLE IF EXISTS `PHYSICIAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PHYSICIAN` (
  `DOCTOR_ID` int(11) NOT NULL,
  PRIMARY KEY (`DOCTOR_ID`),
  CONSTRAINT `PHYSICIAN_ibfk_1` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `DOCTOR` (`DOCTOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PHYSICIAN`
--

LOCK TABLES `PHYSICIAN` WRITE;
/*!40000 ALTER TABLE `PHYSICIAN` DISABLE KEYS */;
INSERT INTO PHYSICIAN VALUES (1);
/*!40000 ALTER TABLE `PHYSICIAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROOM`
--

DROP TABLE IF EXISTS `ROOM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROOM` (
  `ROOM_NUMBER` int(11) NOT NULL,
  PRIMARY KEY (`ROOM_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROOM`
--

LOCK TABLES `ROOM` WRITE;
/*!40000 ALTER TABLE `ROOM` DISABLE KEYS */;
INSERT INTO ROOM VALUES (1),(2),(3);
/*!40000 ALTER TABLE `ROOM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SURGEON`
--

DROP TABLE IF EXISTS `SURGEON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SURGEON` (
  `DOCTOR_ID` int(11) NOT NULL,
  PRIMARY KEY (`DOCTOR_ID`),
  CONSTRAINT `SURGEON_ibfk_1` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `DOCTOR` (`DOCTOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SURGEON`
--

LOCK TABLES `SURGEON` WRITE;
/*!40000 ALTER TABLE `SURGEON` DISABLE KEYS */;
INSERT INTO SURGEON VALUES (2),(3);
/*!40000 ALTER TABLE `SURGEON` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-13  7:54:34
