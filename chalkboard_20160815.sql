-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: 
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Current Database: `c9`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c9` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `c9`;

--
-- Dumping events for database 'c9'
--

--
-- Current Database: `chamilo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `chamilo` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `chamilo`;

--
-- Table structure for table `access_url`
--

DROP TABLE IF EXISTS `access_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `active` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `tms` datetime NOT NULL,
  `url_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url`
--

LOCK TABLES `access_url` WRITE;
/*!40000 ALTER TABLE `access_url` DISABLE KEYS */;
INSERT INTO `access_url` VALUES (1,'http://localhost/',' ',1,1,'2016-07-12 12:07:17',NULL);
/*!40000 ALTER TABLE `access_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_url_rel_course`
--

DROP TABLE IF EXISTS `access_url_rel_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url_rel_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `access_url_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8E97FC0891D79BD3` (`c_id`),
  KEY `IDX_8E97FC0873444FD5` (`access_url_id`),
  CONSTRAINT `FK_8E97FC0873444FD5` FOREIGN KEY (`access_url_id`) REFERENCES `access_url` (`id`),
  CONSTRAINT `FK_8E97FC0891D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url_rel_course`
--

LOCK TABLES `access_url_rel_course` WRITE;
/*!40000 ALTER TABLE `access_url_rel_course` DISABLE KEYS */;
INSERT INTO `access_url_rel_course` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1);
/*!40000 ALTER TABLE `access_url_rel_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_url_rel_session`
--

DROP TABLE IF EXISTS `access_url_rel_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url_rel_session` (
  `access_url_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`access_url_id`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url_rel_session`
--

LOCK TABLES `access_url_rel_session` WRITE;
/*!40000 ALTER TABLE `access_url_rel_session` DISABLE KEYS */;
INSERT INTO `access_url_rel_session` VALUES (1,1);
/*!40000 ALTER TABLE `access_url_rel_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_url_rel_user`
--

DROP TABLE IF EXISTS `access_url_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url_rel_user` (
  `access_url_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`access_url_id`,`user_id`),
  KEY `idx_access_url_rel_user_user` (`user_id`),
  KEY `idx_access_url_rel_user_access_url` (`access_url_id`),
  KEY `idx_access_url_rel_user_access_url_user` (`user_id`,`access_url_id`),
  CONSTRAINT `FK_8557426373444FD5` FOREIGN KEY (`access_url_id`) REFERENCES `access_url` (`id`),
  CONSTRAINT `FK_85574263A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url_rel_user`
--

LOCK TABLES `access_url_rel_user` WRITE;
/*!40000 ALTER TABLE `access_url_rel_user` DISABLE KEYS */;
INSERT INTO `access_url_rel_user` VALUES (1,1),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8);
/*!40000 ALTER TABLE `access_url_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_url_rel_usergroup`
--

DROP TABLE IF EXISTS `access_url_rel_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url_rel_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_url_id` int(11) NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url_rel_usergroup`
--

LOCK TABLES `access_url_rel_usergroup` WRITE;
/*!40000 ALTER TABLE `access_url_rel_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_url_rel_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,1),(2,5);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_rel_group`
--

DROP TABLE IF EXISTS `announcement_rel_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_rel_group` (
  `group_id` int(11) NOT NULL,
  `announcement_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_rel_group`
--

LOCK TABLES `announcement_rel_group` WRITE;
/*!40000 ALTER TABLE `announcement_rel_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_rel_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_sync`
--

DROP TABLE IF EXISTS `branch_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_sync` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `access_url_id` int(11) NOT NULL,
  `unique_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `branch_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `branch_ip` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` decimal(10,0) DEFAULT NULL,
  `longitude` decimal(10,0) DEFAULT NULL,
  `dwn_speed` int(11) DEFAULT NULL,
  `up_speed` int(11) DEFAULT NULL,
  `delay` int(11) DEFAULT NULL,
  `admin_mail` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_phone` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sync_trans_id` bigint(20) DEFAULT NULL,
  `last_sync_trans_date` datetime DEFAULT NULL,
  `last_sync_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssl_pub_key` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch_type` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `lvl` int(11) DEFAULT NULL,
  `root` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F62F45EDE3C68343` (`unique_id`),
  KEY `IDX_F62F45ED727ACA70` (`parent_id`),
  CONSTRAINT `FK_F62F45ED727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `branch_sync` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_sync`
--

LOCK TABLES `branch_sync` WRITE;
/*!40000 ALTER TABLE `branch_sync` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_transaction`
--

DROP TABLE IF EXISTS `branch_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `transaction_id` bigint(20) NOT NULL,
  `action` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_insert` datetime NOT NULL,
  `time_update` datetime NOT NULL,
  `failed_attempts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FEFBA12B6BF700BD` (`status_id`),
  KEY `IDX_FEFBA12BDCD6CC49` (`branch_id`),
  CONSTRAINT `FK_FEFBA12B6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `branch_transaction_status` (`id`),
  CONSTRAINT `FK_FEFBA12BDCD6CC49` FOREIGN KEY (`branch_id`) REFERENCES `branch_sync` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_transaction`
--

LOCK TABLES `branch_transaction` WRITE;
/*!40000 ALTER TABLE `branch_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_transaction_status`
--

DROP TABLE IF EXISTS `branch_transaction_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_transaction_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_transaction_status`
--

LOCK TABLES `branch_transaction_status` WRITE;
/*!40000 ALTER TABLE `branch_transaction_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_transaction_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_announcement`
--

DROP TABLE IF EXISTS `c_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_announcement` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `end_date` date DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `email_sent` tinyint(1) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_announcement`
--

LOCK TABLES `c_announcement` WRITE;
/*!40000 ALTER TABLE `c_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_announcement_attachment`
--

DROP TABLE IF EXISTS `c_announcement_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_announcement_attachment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `size` int(11) NOT NULL,
  `announcement_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_announcement_attachment`
--

LOCK TABLES `c_announcement_attachment` WRITE;
/*!40000 ALTER TABLE `c_announcement_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_announcement_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance`
--

DROP TABLE IF EXISTS `c_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `active` tinyint(1) NOT NULL,
  `attendance_qualify_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attendance_qualify_max` int(11) NOT NULL,
  `attendance_weight` double NOT NULL,
  `session_id` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance`
--

LOCK TABLES `c_attendance` WRITE;
/*!40000 ALTER TABLE `c_attendance` DISABLE KEYS */;
INSERT INTO `c_attendance` VALUES (1,1,1,'Attendances','Attendances',1,NULL,0,0,0,0);
/*!40000 ALTER TABLE `c_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance_calendar`
--

DROP TABLE IF EXISTS `c_attendance_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance_calendar` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `done_attendance` tinyint(1) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `attendance_id` (`attendance_id`),
  KEY `done_attendance` (`done_attendance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance_calendar`
--

LOCK TABLES `c_attendance_calendar` WRITE;
/*!40000 ALTER TABLE `c_attendance_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance_calendar_rel_group`
--

DROP TABLE IF EXISTS `c_attendance_calendar_rel_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance_calendar_rel_group` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `calendar_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance_calendar_rel_group`
--

LOCK TABLES `c_attendance_calendar_rel_group` WRITE;
/*!40000 ALTER TABLE `c_attendance_calendar_rel_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance_calendar_rel_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance_result`
--

DROP TABLE IF EXISTS `c_attendance_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance_result` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `attendance_id` (`attendance_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance_result`
--

LOCK TABLES `c_attendance_result` WRITE;
/*!40000 ALTER TABLE `c_attendance_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance_sheet`
--

DROP TABLE IF EXISTS `c_attendance_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance_sheet` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `presence` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `attendance_calendar_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`),
  KEY `presence` (`presence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance_sheet`
--

LOCK TABLES `c_attendance_sheet` WRITE;
/*!40000 ALTER TABLE `c_attendance_sheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance_sheet_log`
--

DROP TABLE IF EXISTS `c_attendance_sheet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance_sheet_log` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `lastedit_date` datetime NOT NULL,
  `lastedit_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `lastedit_user_id` int(11) NOT NULL,
  `calendar_date_value` datetime DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance_sheet_log`
--

LOCK TABLES `c_attendance_sheet_log` WRITE;
/*!40000 ALTER TABLE `c_attendance_sheet_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance_sheet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog`
--

DROP TABLE IF EXISTS `c_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `blog_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `blog_subtitle` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `visibility` tinyint(1) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog`
--

LOCK TABLES `c_blog` WRITE;
/*!40000 ALTER TABLE `c_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_attachment`
--

DROP TABLE IF EXISTS `c_blog_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_attachment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `size` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `blog_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_attachment`
--

LOCK TABLES `c_blog_attachment` WRITE;
/*!40000 ALTER TABLE `c_blog_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_comment`
--

DROP TABLE IF EXISTS `c_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_comment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_creation` datetime NOT NULL,
  `blog_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `parent_comment_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_comment`
--

LOCK TABLES `c_blog_comment` WRITE;
/*!40000 ALTER TABLE `c_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_post`
--

DROP TABLE IF EXISTS `c_blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_post` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `full_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date_creation` datetime NOT NULL,
  `author_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_post`
--

LOCK TABLES `c_blog_post` WRITE;
/*!40000 ALTER TABLE `c_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_rating`
--

DROP TABLE IF EXISTS `c_blog_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_rating` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `rating_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `rating_type` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_rating`
--

LOCK TABLES `c_blog_rating` WRITE;
/*!40000 ALTER TABLE `c_blog_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_rel_user`
--

DROP TABLE IF EXISTS `c_blog_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_rel_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_rel_user`
--

LOCK TABLES `c_blog_rel_user` WRITE;
/*!40000 ALTER TABLE `c_blog_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_task`
--

DROP TABLE IF EXISTS `c_blog_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_task` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `system_task` tinyint(1) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_task`
--

LOCK TABLES `c_blog_task` WRITE;
/*!40000 ALTER TABLE `c_blog_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_task_rel_user`
--

DROP TABLE IF EXISTS `c_blog_task_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_task_rel_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `target_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`),
  KEY `task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_task_rel_user`
--

LOCK TABLES `c_blog_task_rel_user` WRITE;
/*!40000 ALTER TABLE `c_blog_task_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_task_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_calendar_event`
--

DROP TABLE IF EXISTS `c_calendar_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_calendar_event` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `parent_event_id` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `all_day` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `color` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `videoconference` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `IDX_A062258154177093` (`room_id`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `FK_A062258154177093` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_calendar_event`
--

LOCK TABLES `c_calendar_event` WRITE;
/*!40000 ALTER TABLE `c_calendar_event` DISABLE KEYS */;
INSERT INTO `c_calendar_event` VALUES (1,NULL,1,2,'Test Update','','2016-07-19 07:00:00','2016-07-19 23:59:00',NULL,0,0,'','','Y'),(3,NULL,3,5,'Handing over of task Assignment 1','<a href=\"https://bits-bsharp-melbnetworks.c9users.io/main/work/work_list.php?cidReq=BUILDINGITSYSTEMS&amp;id_session=0&amp;gidReq=0&amp;gradebook=0&amp;origin=&amp;id=1\">Assignment 1</a><p align=\"center\"><a name=\"h.70brseg6m6el\"></a>Assignment 1</p>\n\n<p align=\"center\"><a name=\"h.iarfqp60y399\"></a>Building IT Systems ( CPT 111 / COSC 2635 )<br />\nStudy Period 2, 2016</p>\n\n<div>\n<p> </p>\n</div>\n\n<p> </p>\n\n<p> </p>\n\n<h1><a name=\"h.471biyyoffo\"></a>Overview</h1>\n\n<ol><li>This assignment is <strong>due</strong> on the <strong>26th June 2016, 11:59 PM (UTC +10)</strong>.</li>\n	<li>Your task is to write a proposal for a project of building a functional prototype of which you will endeavour to complete by Week 12 which is the end of the project timeline.</li>\n	<li>The project you choose to build should be beyond what you can currently accomplish with your current capabilities; and be worth at least 5 hours per week over the duration of 8 weeks. In a team of 5, as a team that would be 200 hours worth of work in total.</li>\n	<li>You must work on your assignments and project as a team of 5 persons.<br />\n	Any variation to this must be received in writing from the course instructor.</li>\n	<li>The project you choose must be in one of the following streams :\n	<ul><li>Web Application; or</li>\n		<li>Mobile Application; or</li>\n		<li>Game; or</li>\n		<li>a Moonshot IT-centric Project ( should you choose this stream, you are required to discuss this with the instructor, and receive approval in writing to proceed. )</li>\n	</ul></li>\n	<li>Find a project that you feel passionate about. Recommendation is to build a chatbot, or a turn-based app/game. Seek guidance from your mentors for ideas and scope. Discuss with your mentor regarding any variation, and if approval from the instructor is required.</li>\n	<li>You will be matched with a mentor which will provide you with mentorship, and monitor your progress. Once you have been matched with your mentor, you will be their mentee for the remaining duration of the course. Your team is expected to meet with your mentors at least once a week.</li>\n	<li>You must have your <strong>projects approved</strong> by your assigned mentors <strong>at least 7 calendar days</strong> prior to your assignment submission due date <strong>to be eligible to submit</strong>. This approval will also formally complete your mentor assignment to your team.</li>\n	<li>You may collaborate with your team at anytime throughout the week. However, you should synchronously (online at the same time) collaborate with your teammates for at least an hour a week. You should make these arrangements amongst your team members.</li>\n	<li>This assignment should contain as much detail as possible to convince the assessor that you will be able to execute the project to produce a functional prototype by the end of the project timeline.</li>\n	<li>Your submission is required to be a truthful, honest and original work produced by your whole team in collaboration.</li>\n	<li>This assignment must be submitted as a single PDF file, one per group via the corresponding Blackboard Assignment submission link, <strong>and</strong> the correspondingly named Trello card on your team’s board.</li>\n	<li>Your submission file should be named as follows :<br />\n	“ [TeamName]-BITS-A[AssignmentNumber].pdf ”<br />\n	Example : UniversalUnicorns-BITS-A1.pdf</li>\n	<li>This assignment is worth 5% of your overall marks for this course.<br />\n	Your assignment will be marked out of 100, with marks awarded as shown in the {curly braces} below.</li>\n</ol><p> </p>\n\n<p> </p>\n\n<h1><a name=\"h.k48jn3saj7cm\"></a>Content Requirements</h1>\n\n<p>Your project proposal should contain the following contents. The recommended template for this proposal can be found at the URL (<a href=\"https://makebits.xyz/a1-template\">https://makebits.xyz/a1-template</a>). There is no minimum or maximum word/page count for your submission. Use as many words/pages you just need to fulfill the requirements. Use your Trello board to plan these sections before working on the report as most of the content in the Trello sample board will contribute to this report.</p>\n\n<h2><a name=\"h.rkiqfhhkjxd1\"></a>What</h2>\n\n<p>This section will describe what your project is about.</p>\n\n<p> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Project Name</strong> : { 2 marks }<br />\nWhat is the name of your project. This is the name of the product/item you are building. Be descriptive but creative.</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Project Description</strong> : { 5 marks }</p>\n\n<p style=\"margin-left:36pt;\">Describe to us what your product would be when completed. Your description should contain enough details that anyone with reasonable technical capability should be able to visualise the outcome product without ambiguity. This section should also identify the type of project this is; a mobile app, web app, a game or something else. It should also contain description of the functionality of the product.</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>The Team : </strong>{ 10 marks }</p>\n\n<p style=\"margin-left:36pt;\">List your team with the following information :</p>\n\n<ul><li>Full Name ( as per your course registration )</li>\n	<li>Student Email Address</li>\n	<li>Your Locale ( City, Country )</li>\n	<li>Background &amp; Passion in IT ( a few sentences )</li>\n	<li>What are you good at / What you’re interested in ?</li>\n	<li>What are your weak-point in the context of the project ?</li>\n	<li>What role do you see yourself mainly playing in the team ?</li>\n</ul><p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Demonstrable Outcomes</strong></p>\n\n<p style=\"margin-left:36pt;\">This section refers to you telling us what the demonstrable outcomes of your project would be. Think of this as functional and nonfunctional requirements that can be measured or demonstrated. If you were to buy your product from the store, what would the box say it would do? Simply list time, and include a measure (question you can ask) that validates the outcome.</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\">Example:</p>\n\n<ol><li>A digital clock showing the current time on the app.<br />\n	Is a clock showing the current time visible on the app’s dashboard page?</li>\n</ol><p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\">Do this in 2 sections;</p>\n\n<p style=\"margin-left:72pt;\"><strong>Minimum Viable Product</strong> : { 10 marks }<br />\nthe minimum state of completion to showcase the base features.<br />\nList at least 5 features. ( “The background will be white” is not a feature.)<br /><br /><strong>Extended Features</strong> : { 2 marks }<br />\nIf time permits, these feature will be implemented. List at least 3.</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Project Motivation</strong> : { 3 marks }</p>\n\n<p style=\"margin-left:36pt;\">As a group, why did you choose to build the project you described?</p>\n\n<p style=\"margin-left:36pt;\">What is your motivation? How does it relate to your collective interests?</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Project Justification</strong></p>\n\n<p style=\"margin-left:36pt;\">Provide your justifications as to why as a team you believe this project fulfills the following project criterias :</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:72pt;\"><strong>Justified Workload </strong>{ 4 marks }</p>\n\n<p style=\"margin-left:72pt;\">Your project is worth at least 5 hours of work per week for 8 weeks for each member; totaling in 200 hours of work for a group of 5 persons. You can use your project schedule to back your claims.</p>\n\n<p style=\"margin-left:72pt;\"><strong>Beyond Current Capabilities </strong>{ 4 marks }</p>\n\n<p style=\"margin-left:72pt;\">Your project is something that is more than your current capabilities as a team. That this project will be a learning experience for you.</p>\n\n<p> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Project Risks </strong>{ 4 marks }</p>\n\n<p style=\"margin-left:36pt;\">List at least 2 project specific potential issues that may roadblock your progress. For each identified issue, specify how you would attempt to mitigate the problem.</p>\n\n<p> </p>\n\n<p> </p>\n\n<h2><a name=\"h.2df7lox8wynh\"></a>How</h2>\n\n<p>This section will describe how you intend to accomplish building your proposal. This section should be based on the contents of your “Pin-Board” list in your Trello board.</p>\n\n<p> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Resources &amp; Tools </strong>{ 4 marks }</p>\n\n<p style=\"margin-left:36pt;\">List the technologies, tools and resources you\'re using here with a link to the source. You can also link to relevant documentation. For each tool/resource listed, it should contain; Tool/Resource Name, Short description, Rationale, Specific version (if applicable), Cost, Alternatives (simply name and link to them). See corresponding Trello card for more information</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Collaborative Workspaces </strong>{ 4 marks }</p>\n\n<p style=\"margin-left:36pt;\">Think about the tools and resources your team would be using. Where can we find your files ? Put them here with any relevant information so that everyone can find it. List all the workspaces you will be using with their URLs and information on how to access it. (Example workspace : Trello, Google Drive, GitHub, Heroku, Cloud9.) See corresponding Trello card for more information</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Communication Expectations </strong>{ 4 marks }</p>\n\n<p style=\"margin-left:36pt;\">This card is an agreement between all team members on communication expectations and responsibilities. This is to reduce misunderstandings and mismatched expectations. List the tools you will be using to communicate with the corresponding expected response frequencies. You should also include description for an action-plan for team members Missing-in-Action. See corresponding Trello card for more information.</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Decision Making Process </strong>{ 4 marks }</p>\n\n<p style=\"margin-left:36pt;\">Describe your decision making and dispute resolution process. See corresponding Trello card for more information.</p>\n\n<p> </p>\n\n<h2><a name=\"h.jnu3rxa3inxq\"></a>When</h2>\n\n<p>What happens when? “Failing to plan, is planning to fail”. List tasks with at least enough granularity, that the assessor can see what each member is accomplishing as a demonstrable outcome every week. List the tasks you need to be completed from Week 4 till Week 13 to deliver your project &amp; final report.</p>\n\n<p> </p>\n\n<p>{ 30 marks }</p>\n\n<p> </p>\n\n<p>Each task in your list/table should contain the following information :</p>\n\n<ul><li>Task Num/ID</li>\n	<li>Descriptive Title</li>\n	<li>Demonstrable Outcome</li>\n	<li>Start &amp; End by (Date)</li>\n	<li>Lead by ( member’s name )</li>\n	<li>Trello Card URL</li>\n</ul><p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p>{ 5 marks awarded for general professionalism }</p>\n\n<h1><a name=\"h.b0pamtey6m5p\"></a> </h1>\n\n<p> </p>\n\n<p> </p>\n\n<h1><a name=\"h.xhfnlpc3ccxz\"></a> </h1>\n\n<h1><a name=\"h.ccwc607mbe94\"></a>Submission Requirements</h1>\n\n<p>Before submission you must have completed the following :</p>\n\n<p> </p>\n\n<ol><li>Setup Trello : { 5 marks &amp; submission prerequisite }\n	<ul><li><a href=\"https://makebits.xyz/join-trello\">Join the RMIT_BITS_2016SP2</a> team on Trello.</li>\n		<li>Copy the <a href=\"https://makebits.xyz/template-board\">[Group Template]</a> board.</li>\n		<li>Renamed the copied board with your group name.</li>\n		<li>Added all your team members to Trello.</li>\n		<li>Completed all the tasks in the “(!) Getting Started” card.</li>\n	</ul></li>\n	<li>Team Registration &amp; Approval\n	<ul><li>As a group, roughly think about the type of project you’d want to be doing. Then make contact with the corresponding mentor via their thread in the Discussion Board “General Lobby” forum. Mentor availability is first-come-first-served basis.</li>\n		<li>Once you’ve made contact, arrange to speak with your mentor about your project ideas and scope. It is recommended you try to work through the Trello prerequisite steps before contacting a mentor, so they can help you should you have any issues.</li>\n		<li>Schedule a “live chat” discussion with your mentor. Work with them until they approve your project. They will have a form to fill when they approve your project idea &amp; formally register your team with them. If you’ve chosen to do a Moonshot Project, please contact the instructor before you do so.</li>\n	</ul></li>\n</ol><p> </p>\n\n<p>Once you’ve completed the prerequisites :</p>\n\n<p> </p>\n\n<p>Your submission should be a <strong>single PDF file</strong>. Files in any <strong>other formats will be rejected</strong>. You need to create a group on Blackboard reflecting the membership of your group before you submit this assignment. Once this is done, any member of the group can submit (a version of) the assignment.</p>\n\n<p> </p>\n\n<p>There should only be one submission per group, but you can re-submit any number of times before the deadline. In other words, if there are say five people in your group, only one person from the group needs to submit a PDF file, but this file can be re-submitted as many times as you like before the deadline.</p>\n\n<p> </p>\n\n<p>Submission must be made on Blackboard and the corresponding Trello card as described in the Overview section of this document to be accepted as a completed submission.</p>\n\n<p align=\"center\"><a></a>Assignment 1</p>\n\n<p align=\"center\"><a></a>Building IT Systems ( CPT 111 / COSC 2635 )<br />\nStudy Period 2, 2016</p>\n\n<div>\n<p> </p>\n</div>\n\n<p> </p>\n\n<p> </p>\n\n<h1><a></a>Overview</h1>\n\n<ol><li>This assignment is <strong>due</strong> on the <strong>26th June 2016, 11:59 PM (UTC +10)</strong>.</li>\n	<li>Your task is to write a proposal for a project of building a functional prototype of which you will endeavour to complete by Week 12 which is the end of the project timeline.</li>\n	<li>The project you choose to build should be beyond what you can currently accomplish with your current capabilities; and be worth at least 5 hours per week over the duration of 8 weeks. In a team of 5, as a team that would be 200 hours worth of work in total.</li>\n	<li>You must work on your assignments and project as a team of 5 persons.<br />\n	Any variation to this must be received in writing from the course instructor.</li>\n	<li>The project you choose must be in one of the following streams :\n	<ul><li>Web Application; or</li>\n		<li>Mobile Application; or</li>\n		<li>Game; or</li>\n		<li>a Moonshot IT-centric Project ( should you choose this stream, you are required to discuss this with the instructor, and receive approval in writing to proceed. )</li>\n	</ul></li>\n	<li>Find a project that you feel passionate about. Recommendation is to build a chatbot, or a turn-based app/game. Seek guidance from your mentors for ideas and scope. Discuss with your mentor regarding any variation, and if approval from the instructor is required.</li>\n	<li>You will be matched with a mentor which will provide you with mentorship, and monitor your progress. Once you have been matched with your mentor, you will be their mentee for the remaining duration of the course. Your team is expected to meet with your mentors at least once a week.</li>\n	<li>You must have your <strong>projects approved</strong> by your assigned mentors <strong>at least 7 calendar days</strong> prior to your assignment submission due date <strong>to be eligible to submit</strong>. This approval will also formally complete your mentor assignment to your team.</li>\n	<li>You may collaborate with your team at anytime throughout the week. However, you should synchronously (online at the same time) collaborate with your teammates for at least an hour a week. You should make these arrangements amongst your team members.</li>\n	<li>This assignment should contain as much detail as possible to convince the assessor that you will be able to execute the project to produce a functional prototype by the end of the project timeline.</li>\n	<li>Your submission is required to be a truthful, honest and original work produced by your whole team in collaboration.</li>\n	<li>This assignment must be submitted as a single PDF file, one per group via the corresponding Blackboard Assignment submission link, <strong>and</strong> the correspondingly named Trello card on your team’s board.</li>\n	<li>Your submission file should be named as follows :<br />\n	“ [TeamName]-BITS-A[AssignmentNumber].pdf ”<br />\n	Example : UniversalUnicorns-BITS-A1.pdf</li>\n	<li>This assignment is worth 5% of your overall marks for this course.<br />\n	Your assignment will be marked out of 100, with marks awarded as shown in the {curly braces} below.</li>\n</ol><p> </p>\n\n<p> </p>\n\n<h1><a></a>Content Requirements</h1>\n\n<p>Your project proposal should contain the following contents. The recommended template for this proposal can be found at the URL (<a href=\"https://makebits.xyz/a1-template\">https://makebits.xyz/a1-template</a>). There is no minimum or maximum word/page count for your submission. Use as many words/pages you just need to fulfill the requirements. Use your Trello board to plan these sections before working on the report as most of the content in the Trello sample board will contribute to this report.</p>\n\n<h2><a></a>What</h2>\n\n<p>This section will describe what your project is about.</p>\n\n<p> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Project Name</strong> : { 2 marks }<br />\nWhat is the name of your project. This is the name of the product/item you are building. Be descriptive but creative.</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Project Description</strong> : { 5 marks }</p>\n\n<p style=\"margin-left:36pt;\">Describe to us what your product would be when completed. Your description should contain enough details that anyone with reasonable technical capability should be able to visualise the outcome product without ambiguity. This section should also identify the type of project this is; a mobile app, web app, a game or something else. It should also contain description of the functionality of the product.</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>The Team : </strong>{ 10 marks }</p>\n\n<p style=\"margin-left:36pt;\">List your team with the following information :</p>\n\n<ul><li>Full Name ( as per your course registration )</li>\n	<li>Student Email Address</li>\n	<li>Your Locale ( City, Country )</li>\n	<li>Background &amp; Passion in IT ( a few sentences )</li>\n	<li>What are you good at / What you’re interested in ?</li>\n	<li>What are your weak-point in the context of the project ?</li>\n	<li>What role do you see yourself mainly playing in the team ?</li>\n</ul><p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Demonstrable Outcomes</strong></p>\n\n<p style=\"margin-left:36pt;\">This section refers to you telling us what the demonstrable outcomes of your project would be. Think of this as functional and nonfunctional requirements that can be measured or demonstrated. If you were to buy your product from the store, what would the box say it would do? Simply list time, and include a measure (question you can ask) that validates the outcome.</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\">Example:</p>\n\n<ol><li>A digital clock showing the current time on the app.<br />\n	Is a clock showing the current time visible on the app’s dashboard page?</li>\n</ol><p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\">Do this in 2 sections;</p>\n\n<p style=\"margin-left:72pt;\"><strong>Minimum Viable Product</strong> : { 10 marks }<br />\nthe minimum state of completion to showcase the base features.<br />\nList at least 5 features. ( “The background will be white” is not a feature.)<br /><br /><strong>Extended Features</strong> : { 2 marks }<br />\nIf time permits, these feature will be implemented. List at least 3.</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Project Motivation</strong> : { 3 marks }</p>\n\n<p style=\"margin-left:36pt;\">As a group, why did you choose to build the project you described?</p>\n\n<p style=\"margin-left:36pt;\">What is your motivation? How does it relate to your collective interests?</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Project Justification</strong></p>\n\n<p style=\"margin-left:36pt;\">Provide your justifications as to why as a team you believe this project fulfills the following project criterias :</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:72pt;\"><strong>Justified Workload </strong>{ 4 marks }</p>\n\n<p style=\"margin-left:72pt;\">Your project is worth at least 5 hours of work per week for 8 weeks for each member; totaling in 200 hours of work for a group of 5 persons. You can use your project schedule to back your claims.</p>\n\n<p style=\"margin-left:72pt;\"><strong>Beyond Current Capabilities </strong>{ 4 marks }</p>\n\n<p style=\"margin-left:72pt;\">Your project is something that is more than your current capabilities as a team. That this project will be a learning experience for you.</p>\n\n<p> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Project Risks </strong>{ 4 marks }</p>\n\n<p style=\"margin-left:36pt;\">List at least 2 project specific potential issues that may roadblock your progress. For each identified issue, specify how you would attempt to mitigate the problem.</p>\n\n<p> </p>\n\n<p> </p>\n\n<h2><a></a>How</h2>\n\n<p>This section will describe how you intend to accomplish building your proposal. This section should be based on the contents of your “Pin-Board” list in your Trello board.</p>\n\n<p> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Resources &amp; Tools </strong>{ 4 marks }</p>\n\n<p style=\"margin-left:36pt;\">List the technologies, tools and resources you\'re using here with a link to the source. You can also link to relevant documentation. For each tool/resource listed, it should contain; Tool/Resource Name, Short description, Rationale, Specific version (if applicable), Cost, Alternatives (simply name and link to them). See corresponding Trello card for more information</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Collaborative Workspaces </strong>{ 4 marks }</p>\n\n<p style=\"margin-left:36pt;\">Think about the tools and resources your team would be using. Where can we find your files ? Put them here with any relevant information so that everyone can find it. List all the workspaces you will be using with their URLs and information on how to access it. (Example workspace : Trello, Google Drive, GitHub, Heroku, Cloud9.) See corresponding Trello card for more information</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Communication Expectations </strong>{ 4 marks }</p>\n\n<p style=\"margin-left:36pt;\">This card is an agreement between all team members on communication expectations and responsibilities. This is to reduce misunderstandings and mismatched expectations. List the tools you will be using to communicate with the corresponding expected response frequencies. You should also include description for an action-plan for team members Missing-in-Action. See corresponding Trello card for more information.</p>\n\n<p style=\"margin-left:36pt;\"> </p>\n\n<p style=\"margin-left:36pt;\"><strong>Decision Making Process </strong>{ 4 marks }</p>\n\n<p style=\"margin-left:36pt;\">Describe your decision making and dispute resolution process. See corresponding Trello card for more information.</p>\n\n<p> </p>\n\n<h2><a></a>When</h2>\n\n<p>What happens when? “Failing to plan, is planning to fail”. List tasks with at least enough granularity, that the assessor can see what each member is accomplishing as a demonstrable outcome every week. List the tasks you need to be completed from Week 4 till Week 13 to deliver your project &amp; final report.</p>\n\n<p> </p>\n\n<p>{ 30 marks }</p>\n\n<p> </p>\n\n<p>Each task in your list/table should contain the following information :</p>\n\n<ul><li>Task Num/ID</li>\n	<li>Descriptive Title</li>\n	<li>Demonstrable Outcome</li>\n	<li>Start &amp; End by (Date)</li>\n	<li>Lead by ( member’s name )</li>\n	<li>Trello Card URL</li>\n</ul><p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p>{ 5 marks awarded for general professionalism }</p>\n\n<h1><a></a> </h1>\n\n<p> </p>\n\n<p> </p>\n\n<h1><a></a> </h1>\n\n<h1><a></a>Submission Requirements</h1>\n\n<p>Before submission you must have completed the following :</p>\n\n<p> </p>\n\n<ol><li>Setup Trello : { 5 marks &amp; submission prerequisite }\n	<ul><li><a href=\"https://makebits.xyz/join-trello\">Join the RMIT_BITS_2016SP2</a> team on Trello.</li>\n		<li>Copy the <a href=\"https://makebits.xyz/template-board\">[Group Template]</a> board.</li>\n		<li>Renamed the copied board with your group name.</li>\n		<li>Added all your team members to Trello.</li>\n		<li>Completed all the tasks in the “(!) Getting Started” card.</li>\n	</ul></li>\n	<li>Team Registration &amp; Approval\n	<ul><li>As a group, roughly think about the type of project you’d want to be doing. Then make contact with the corresponding mentor via their thread in the Discussion Board “General Lobby” forum. Mentor availability is first-come-first-served basis.</li>\n		<li>Once you’ve made contact, arrange to speak with your mentor about your project ideas and scope. It is recommended you try to work through the Trello prerequisite steps before contacting a mentor, so they can help you should you have any issues.</li>\n		<li>Schedule a “live chat” discussion with your mentor. Work with them until they approve your project. They will have a form to fill when they approve your project idea &amp; formally register your team with them. If you’ve chosen to do a Moonshot Project, please contact the instructor before you do so.</li>\n	</ul></li>\n</ol><p> </p>\n\n<p>Once you’ve completed the prerequisites :</p>\n\n<p> </p>\n\n<p>Your submission should be a <strong>single PDF file</strong>. Files in any <strong>other formats will be rejected</strong>. You need to create a group on Blackboard reflecting the membership of your group before you submit this assignment. Once this is done, any member of the group can submit (a version of) the assignment.</p>\n\n<p> </p>\n\n<p>There should only be one submission per group, but you can re-submit any number of times before the deadline. In other words, if there are say five people in your group, only one person from the group needs to submit a PDF file, but this file can be re-submitted as many times as you like before the deadline.</p>\n\n<p> </p>\n\n<p>Submission must be made on Blackboard and the corresponding Trello card as described in the Overview section of this document to be accepted as a completed submission.</p>\n','2016-08-14 13:59:00','2016-08-14 13:59:00',NULL,0,0,'','',NULL),(4,NULL,4,5,'Handing over of task Assignment 2','<a href=\"https://bits-bsharp-melbnetworks.c9users.io/main/work/work_list.php?cidReq=BUILDINGITSYSTEMS&amp;id_session=0&amp;gidReq=0&amp;gradebook=0&amp;origin=&amp;id=2\">Assignment 2</a><p style=\"text-align:center;\">Assignment 2</p>\n\n<p style=\"text-align:center;\">Building IT Systems ( CPT 111 / COSC 2635 )</p>\n\n<p style=\"text-align:center;\">Study Period 2, 2016</p>\n\n<p>1. This assignment is due on the 24th July 2016, 11:59 PM (UTC +10)</p>\n\n<p>2. Your task is to write a mid-project status report &amp; review, for the project you have proposed in Assignment 1 (Project Proposal). This report will have several sections, as described in the “Content Requirements” section below.</p>\n\n<p>3. At this stage, you should have the design stage of your project completed. You should now have a clear understanding of how your final product can be expected to look. This typically means you should at least have a visual mock-up of your prototype ready. For projects where visual mock-ups aren’t the appropriate representation, speak with your mentors for advice on what is required.</p>\n\n<p>4. You will be required to provide demonstrable evidence of your claimed progress in the project.</p>\n\n<p>5. The project you choose to build should have been beyond what you can currently accomplish with your current capabilities; and be worth at least 5 hours per week over the duration of 8 weeks. In a team of 5, as a team that would be 200 hours worth of work in total. This means that by Week 8, each person in the group should be able to show for at least 20 hours of work.</p>\n\n<p>6. You may collaborate with your team at anytime throughout the week. However, you should synchronously (online at the same time) collaborate with your teammates for at least an hour a week. You should make these arrangements amongst your team members.</p>\n\n<p>7. Every member of the group should contribute an equal and fair amount of work to the project &amp; assignments. Reasonable effort should be made to ensure that every member of the group contributes equally. If despite reasonable efforts, contribution isn’t equal, overall marks awarded may be varied based on corresponding effort contributed at the discretion of the assessor.</p>\n\n<p>8. Your submission is required to be a truthful, honest and original work produced by your whole team in collaboration.</p>\n\n<p>9. This assignment must be submitted as a single PDF file, one per group via the corresponding Blackboard Assignment submission link, and the correspondingly named Trello card on your team’s board. Please retain the Assignment card in the BITS Progression list, and ensure that the said list is in the 2nd position from the left, in your board.</p>\n\n<p>10. Your submission file should be named as follows : “ [TeamName]-BITS-A[AssignmentNumber].pdf ”</p>\n\n<p>Example : UniversalUnicorns-BITS-A2.pdf</p>\n\n<p>11. This assignment is worth 15% of your overall marks for this course. Your assignment will be marked out of 100, with marks awarded as shown in the {curly braces} below. Should you earn more than 100 marks, it will be capped to 100.</p>\n\n<p>Content Requirements</p>\n\n<p>Your project proposal should contain the following contents. There is no minimum or maximum word/page count for your submission. Use as many words or pages you just need to fulfill the requirements.</p>\n\n<p>Project Background { 20 marks }</p>\n\n<p>This section will describe what your project is about. This should be relatively similar to your Assignment 1 submission but there are crucial differences, Should this have changed since then, this is your opportunity clarify and improve on them.</p>\n\n<p>Project Name​: { 1 marks }</p>\n\n<p>What is the name of your project. This is the name of the product/item you are building. Be descriptive but creative.</p>\n\n<p>Project Description​: { 2 marks }</p>\n\n<p>Describe to us what your product would be when completed. Your description should contain enough details that anyone with reasonable technical capability should be able to visualise the outcome product without ambiguity. This section should also identify the type of project this is; a mobile app, web app, a game or something else. It should also contain description of the functionality of the product.</p>\n\n<p>The Team : ​{ 5 marks }</p>\n\n<p>List your team with the following information :</p>\n\n<p>● Full Name ( as per your course registration )</p>\n\n<p>● Student Email Address</p>\n\n<p>● What role did you end up playing in the team ?</p>\n\n<p>Demonstrable Outcomes</p>\n\n<p>This section refers to you telling us what the demonstrable outcomes of your project would be. Think of this as functional and nonfunctional requirements that can be measured or demonstrated. If you were to buy your product from the store, what would the box say it would do? Simply list time, and include a measure (question you can ask) that validates the outcome.</p>\n\n<p>1. A digital clock showing the current time on the app. Is a clock showing the current time visible on the app’s dashboard page?</p>\n\n<p>Do this in 2 sections;</p>\n\n<p>Minimum Viable Product​: { 10 marks }</p>\n\n<p>the minimum state of completion to showcase the base features. List at least 5 features. ( “The background will be white” is not a feature. “Users will be able to login with their own username and password” is.)</p>\n\n<p>Extended Features​: { 2 marks }</p>\n\n<p>If time permits, these feature will be implemented. List at least 2.</p>\n\n<p>Project Mockup { 20 marks }</p>\n\n<p>In the previous section, you provided a textual description on what we can expect from your project. Now that you’ve begun the journey to build, at this stage, you should have a clear understanding of what your project will look like</p>\n\n<p>at the end. Now you need to convey this vision to us. Build a mockup, using visualisation tools, such as LucidCharts, Axure, Sketch, Adobe Photoshop or even simply Microsoft Powerpoint. These mockups should be interactive. As an example, if you are building a login screen for your app, clicking the “LOGIN” button, should change screens to the default, post-login screen. This can be done directly in Lucidchart or Microsoft Powerpoint, and exported as a PDF. Alternatively, using any graphics or mockup tool to build your screens, then use InVision App, to build the interaction, and then export your prototype mockup as a PDF. Your mockups should at least show how the Minimum Viable Product features you’ve listed should work. Use this section of the report, to provide description of your mockup, and link to the Interactive Mockup PDF file. It is recommended that you upload that PDF to a corresponding Trello card, and drop the attachment link below.</p>\n\n<p>If building an interactive mockup isn’t applicable to your project. It is very likely that there are similar approaches to show visually, the expected outcomes of your project as described by your Minimum Viable Product.</p>\n\n<p>Eg. 1: Building a text-based application.</p>\n\n<p>You will be expected to provide example inputs and outputs for your</p>\n\n<p>Eg. 2: Building a side-scrolling game.</p>\n\n<p>You would be able to produce storyboards, game UI screens, and game If an interactive mockup doesn’t apply to your project, simply use this section in this report, attach inline, your artefacts. Contextually describe and explain how each item fits in your project. Please seek clarification from your mentor as to what would be expected for your project. { up to 4 marks for coverage of each feature described in the MVP. }</p>\n\n<p> </p>\n\n<p>Project Progress { 27 marks }</p>\n\n<p>In the Assignment 1, we asked you for a schedule of your project. Let’s see how far have we done thus far. All items in this section should have a correspondingly titled Trello card of which can be explored for more information. This shouldn’t be too much work, since you were required to create these cards as part of your Assignment 1. At this stage, you would have noticed that you’ve created more task cards than you initially conceived during your planning in assignment 1. Simply add them to the list below, and if there were cards that are now defunct, just leave them out. The title should be hyperlinked to its corresponding Trello card. This is the link that is shown in your browser’s address bar, when the card is opened. Please ensure that your titles are descriptive of the content.To gain full marks, it is crucial at minimum, that your list provides sufficient information to show what each person has been/is doing each week, and with work (and corresponding artefacts) in the linked Trello cards that is able justify the time claimed.</p>\n\n<p>Title Planned</p>\n\n<p>Completed</p>\n\n<p>[Create landing page mockup in</p>\n\n<p>[Create landing page mockup in</p>\n\n<p>Due</p>\n\n<p>[2/7] [1/7] [Dennis</p>\n\n<p>[2/7] [1/7] [Dennis</p>\n\n<p>The Summary { 2 marks }</p>\n\n<p>List for each person, the total number of hours each person has spent on the project since week 5 - 8 (inclusive of 5 &amp; 8).</p>\n\n<p>Dennis Ritchie : 20 hours</p>\n\n<p>Reflection &amp; Learnings { 30 marks }</p>\n\n<p>You were required to attempt a project that was beyond your current ability; one that should have stretched your skills in some way. It is difficult to see how you would have learnt much from a project within your comfort zone. This section you will be reflecting on the challenges you have faced, how you have addressed them, and what you’ve learnt from it.</p>\n\n<p>The Project { 20 marks }</p>\n\n<p>For the “The Project” subsection, give your responses individually, and then summarily as a group. You may respond to the questions in a Q&amp;A form, or as paragraph narratives with titled sections.</p>\n\n<p>1. The Climb</p>\n\n<p>a. How challenging has it been so far?</p>\n\n<p>b. What have you found easy?</p>\n\n<p>c. What have you found difficult? Was this what you</p>\n\n<p>d. In what ways have you been stretched?</p>\n\n<p>e. In hindsight, what would you have done differently?</p>\n\n<p> </p>\n\n<p>2. The Roadblocks</p>\n\n<p>a. What obstacles or roadblocks have you faced?</p>\n\n<p>b. What have you done to address these?</p>\n\n<p>c. Have these been overcome? If so, how how, else, why not?</p>\n\n<p> </p>\n\n<p>3. The Destination</p>\n\n<p>a. Has your goal changed since assignment 1? If so, how, else, expected? how can it be improved?</p>\n\n<p>b. What have you learnt about your goal? What is now clearer to you than when you first begun this project?</p>\n\n<p> </p>\n\n<p>4. The Journey</p>\n\n<p>a. Has your plans changed since assignment 1? If so, how, else, how can it be improved? (Note that you plans can change in more ways that just the schedule; such as your roles and/or changing, or reacting to unanticipated events/roadblocks.)</p>\n\n<p>b. Have things turned out as you expected? Explain.</p>\n\n<p>c. Has your schedule been realistic? Why/Why not? How can it be improved?</p>\n\n<p>d. What would you do differently if you had your time over again?</p>\n\n<p>e. Has your role in the team changed from when it was initially conceived ? If so, why ? Is the current role appropriate?</p>\n\n<p>If not, should it have changed? Why/why not?</p>\n\n<p>f. Looking forward, what changes will you make to your project plans based on your reflections ?</p>\n\n<p> </p>\n\n<p>5. The Lessons</p>\n\n<p>a. What have you learned?</p>\n\n<p>b. Have you developed any new skills or new experiences?</p>\n\n<p>Explain.</p>\n\n<p>c. What things that didn’t work out for you/dead-ends have you encountered during your project? What did you learn from it? Describe a few.</p>\n\n<p>d. What successes have you had during the project? What did you do to achieve it ?</p>\n\n<p>e. What advice would you give to a group about to embark on a similar project?</p>\n\n<p> </p>\n\n<p>The Processes &amp; Collaboration Mechanics { 10 marks }</p>\n\n<p>1. Collaborative Workspaces :</p>\n\n<p> </p>\n\n<p>a. Tell us what you used to collaborate on your project, and report</p>\n\n<p>b. Tell us how you used it.</p>\n\n<p>c. Tell us what are the benefits, and challenges for the said tool.</p>\n\n<p>d. If you had a do-over, what would you have done differently.</p>\n\n<p> </p>\n\n<p>2. Communication Expectations :</p>\n\n<p>a. Tell us, what channels/mediums you ended up using for your report.</p>\n\n<p>b. Tell us, how you typically used that medium/channel in question</p>\n\n<p>c. Tell us what are the benefits, and challenges for the said</p>\n\n<p>d. If you had a do-over, what would you have done differently.</p>\n\n<p> </p>\n\n<p>3. Decision Making Process :</p>\n\n<p>a. Describe to us what your decision making process flow is like</p>\n\n<p>b. Has this helped with your decision making and</p>\n\n<p>c. Tell us, what worked well with your decision making</p>\n\n<p>d. If you had a do-over, what would you have done differently.</p>\n\n<p>{ 5 bonus marks awarded for general professionalism }</p>\n\n<p> </p>\n\n<p>Submission Requirements</p>\n\n<p>Before submission you must have completed the following :</p>\n\n<p>1. To be eligible for submission of this assignment to be assessed, you are required to;</p>\n\n<p>a. Be in an approved team, of which you are registered to; and</p>\n\n<p>b. Have a mentor with whom your team has been making regular contact with; and</p>\n\n<p>c. Have submitted a project proposal (Assignment 1) to the teaching team.</p>\n\n<p>d. Have an active Trello board that is “Team Visible” to the “RMIT_BITS_2016SP2” team.</p>\n\n<p>For most of you, these requirements should have been fulfilled. Otherwise, you will need to contact the instructor at least 14 calendar days prior to the submission deadline for further instruction.</p>\n\n<p>Once you’ve completed the prerequisites :</p>\n\n<p>Your submission should be a single PDF file​. Files in any other formats will be rejected​. You need to create a group on Blackboard reflecting the membership of your group before you submit this assignment. Once this is done, any member of the group can submit (a version of) the assignment. There should only be one submission per group, but you can re-submit any number of times before the deadline. In other words, if there are say five people in your group, only one person from the group needs to submit a PDF file, but this file can be re-submitted as many times as you like by any member of your group before the deadline.</p>\n\n<p>Submission must be made on Blackboard and the corresponding Trello card as described in the Overview section of this document to be accepted as a completed submission.</p>\n','2016-09-04 13:59:00','2016-09-04 13:59:00',NULL,0,0,'','',NULL),(10,NULL,10,5,'Mels Test Event','','2016-08-06 06:19:00','2016-08-06 06:19:00',NULL,0,1,'','',NULL),(22,NULL,22,6,'test','','2016-08-08 12:49:00','2016-08-08 13:59:00',NULL,0,0,'','',NULL),(23,NULL,23,3,'test','','2016-08-08 12:31:00','2016-08-08 13:59:00',NULL,0,0,'','',NULL),(24,NULL,24,5,'test','','2016-08-08 06:16:00','2016-08-08 13:59:00',NULL,0,0,'','',NULL),(25,NULL,25,2,'test','','2016-08-08 12:34:00','2016-08-08 13:59:00',NULL,1,0,'','',NULL),(26,NULL,26,4,'test2','','2016-08-08 12:14:00','2016-08-08 13:59:00',NULL,0,0,'','',NULL),(27,NULL,27,5,'asdfasdf','<p>asdfasdf</p>\n','2016-08-08 04:16:00','2016-08-12 04:16:00',NULL,0,0,'asdfsdf','Dev',NULL),(28,NULL,28,3,'Test meeting','','2016-08-10 09:50:00','2016-08-10 13:59:00',NULL,0,0,'','',NULL);
/*!40000 ALTER TABLE `c_calendar_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_calendar_event_attachment`
--

DROP TABLE IF EXISTS `c_calendar_event_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_calendar_event_attachment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `size` int(11) NOT NULL,
  `agenda_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_calendar_event_attachment`
--

LOCK TABLES `c_calendar_event_attachment` WRITE;
/*!40000 ALTER TABLE `c_calendar_event_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_calendar_event_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_calendar_event_repeat`
--

DROP TABLE IF EXISTS `c_calendar_event_repeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_calendar_event_repeat` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `cal_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `cal_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cal_end` int(11) DEFAULT NULL,
  `cal_frequency` int(11) DEFAULT NULL,
  `cal_days` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_calendar_event_repeat`
--

LOCK TABLES `c_calendar_event_repeat` WRITE;
/*!40000 ALTER TABLE `c_calendar_event_repeat` DISABLE KEYS */;
INSERT INTO `c_calendar_event_repeat` VALUES (1,25,2,'daily',1470700799,NULL,NULL);
/*!40000 ALTER TABLE `c_calendar_event_repeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_calendar_event_repeat_not`
--

DROP TABLE IF EXISTS `c_calendar_event_repeat_not`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_calendar_event_repeat_not` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cal_id` int(11) NOT NULL,
  `cal_date` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_calendar_event_repeat_not`
--

LOCK TABLES `c_calendar_event_repeat_not` WRITE;
/*!40000 ALTER TABLE `c_calendar_event_repeat_not` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_calendar_event_repeat_not` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_chat_connected`
--

DROP TABLE IF EXISTS `c_chat_connected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_chat_connected` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `to_group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_connection` datetime NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`),
  KEY `char_connected_index` (`user_id`,`session_id`,`to_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_chat_connected`
--

LOCK TABLES `c_chat_connected` WRITE;
/*!40000 ALTER TABLE `c_chat_connected` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_chat_connected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_course_description`
--

DROP TABLE IF EXISTS `c_course_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_course_description` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `session_id` int(11) DEFAULT NULL,
  `description_type` int(11) NOT NULL,
  `progress` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_course_description`
--

LOCK TABLES `c_course_description` WRITE;
/*!40000 ALTER TABLE `c_course_description` DISABLE KEYS */;
INSERT INTO `c_course_description` VALUES (1,1,3,'Mockups are fun','<p>Learn how to make mockups in NO TIME AT ALL! Yay..</p>\r\n',0,1,0),(2,2,3,'Make fast mockups','<p>make awesome mockups in no time at all!</p>\r\n',0,2,0),(3,3,3,'Mockups 101','<p>Why do we care about mockups?</p>\r\n\r\n<p>How can we do them quickly?</p>\r\n',0,3,0),(4,4,5,'Course Description','<p>This course will mislead you for 10 weeks and change rapidy with no warning.</p>\r\n\r\n<p>There are 0 prerequisites yet we expect a large amount of original code to be written and implemented</p>\r\n',0,1,0),(5,5,5,'Course Material','<p>No textbook required for this course</p>\r\n',0,5,0);
/*!40000 ALTER TABLE `c_course_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_course_setting`
--

DROP TABLE IF EXISTS `c_course_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_course_setting` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `variable` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subkey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subkeytext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_course_setting`
--

LOCK TABLES `c_course_setting` WRITE;
/*!40000 ALTER TABLE `c_course_setting` DISABLE KEYS */;
INSERT INTO `c_course_setting` VALUES (1,1,1,'email_alert_manager_on_new_doc',NULL,NULL,'work','0','',NULL,NULL),(2,2,1,'email_alert_on_new_doc_dropbox',NULL,NULL,'dropbox','0','',NULL,NULL),(3,3,1,'allow_user_edit_agenda',NULL,NULL,'agenda','0','',NULL,NULL),(4,4,1,'allow_user_edit_announcement',NULL,NULL,'announcement','0','',NULL,NULL),(5,5,1,'email_alert_manager_on_new_quiz',NULL,NULL,'quiz','1','',NULL,NULL),(6,6,1,'allow_user_image_forum',NULL,NULL,'forum','1','',NULL,NULL),(7,7,1,'course_theme',NULL,NULL,'theme','','',NULL,NULL),(8,8,1,'allow_learning_path_theme',NULL,NULL,'theme','1','',NULL,NULL),(9,9,1,'allow_open_chat_window',NULL,NULL,'chat','1','',NULL,NULL),(10,10,1,'email_alert_to_teacher_on_new_user_in_course',NULL,NULL,'registration','0','',NULL,NULL),(11,11,1,'allow_user_view_user_list',NULL,NULL,'user','1','',NULL,NULL),(12,12,1,'display_info_advance_inside_homecourse',NULL,NULL,'thematic_advance','1','',NULL,NULL),(13,13,1,'email_alert_students_on_new_homework',NULL,NULL,'work','0','',NULL,NULL),(14,14,1,'enable_lp_auto_launch',NULL,NULL,'learning_path','0','',NULL,NULL),(15,15,1,'pdf_export_watermark_text',NULL,NULL,'learning_path',NULL,'',NULL,NULL),(16,16,1,'allow_public_certificates',NULL,NULL,'certificates',NULL,'',NULL,NULL),(17,17,1,'documents_default_visibility',NULL,NULL,'document',NULL,'',NULL,NULL),(19,1,2,'email_alert_manager_on_new_doc',NULL,NULL,'work','0','',NULL,NULL),(20,2,2,'email_alert_on_new_doc_dropbox',NULL,NULL,'dropbox','0','',NULL,NULL),(21,3,2,'allow_user_edit_agenda',NULL,NULL,'agenda','0','',NULL,NULL),(22,4,2,'allow_user_edit_announcement',NULL,NULL,'announcement','0','',NULL,NULL),(23,5,2,'email_alert_manager_on_new_quiz',NULL,NULL,'quiz','1','',NULL,NULL),(24,6,2,'allow_user_image_forum',NULL,NULL,'forum','1','',NULL,NULL),(25,7,2,'course_theme',NULL,NULL,'theme','','',NULL,NULL),(26,8,2,'allow_learning_path_theme',NULL,NULL,'theme','1','',NULL,NULL),(27,9,2,'allow_open_chat_window',NULL,NULL,'chat','1','',NULL,NULL),(28,10,2,'email_alert_to_teacher_on_new_user_in_course',NULL,NULL,'registration','0','',NULL,NULL),(29,11,2,'allow_user_view_user_list',NULL,NULL,'user','1','',NULL,NULL),(30,12,2,'display_info_advance_inside_homecourse',NULL,NULL,'thematic_advance','1','',NULL,NULL),(31,13,2,'email_alert_students_on_new_homework',NULL,NULL,'work','0','',NULL,NULL),(32,14,2,'enable_lp_auto_launch',NULL,NULL,'learning_path','0','',NULL,NULL),(33,15,2,'pdf_export_watermark_text',NULL,NULL,'learning_path',NULL,'',NULL,NULL),(34,16,2,'allow_public_certificates',NULL,NULL,'certificates',NULL,'',NULL,NULL),(35,17,2,'documents_default_visibility',NULL,NULL,'document',NULL,'',NULL,NULL),(37,NULL,2,'show_system_folders',NULL,NULL,NULL,NULL,'show_system_folders',NULL,NULL),(38,NULL,2,'lp_return_link',NULL,NULL,NULL,NULL,'lp_return_link',NULL,NULL),(43,NULL,1,'show_system_folders',NULL,NULL,NULL,NULL,'show_system_folders',NULL,NULL),(44,NULL,1,'lp_return_link',NULL,NULL,NULL,NULL,'lp_return_link',NULL,NULL),(49,NULL,1,'big_blue_button_record_and_store','bbb','checkbox','plugins','','',NULL,NULL),(50,NULL,1,'bbb_enable_conference_in_groups','bbb','checkbox','plugins','','',NULL,NULL),(51,NULL,2,'big_blue_button_record_and_store','bbb','checkbox','plugins','','',NULL,NULL),(52,NULL,2,'bbb_enable_conference_in_groups','bbb','checkbox','plugins','','',NULL,NULL),(53,1,3,'email_alert_manager_on_new_doc',NULL,NULL,'work','0','',NULL,NULL),(54,2,3,'email_alert_on_new_doc_dropbox',NULL,NULL,'dropbox','0','',NULL,NULL),(55,3,3,'allow_user_edit_agenda',NULL,NULL,'agenda','0','',NULL,NULL),(56,4,3,'allow_user_edit_announcement',NULL,NULL,'announcement','0','',NULL,NULL),(57,5,3,'email_alert_manager_on_new_quiz',NULL,NULL,'quiz','1','',NULL,NULL),(58,6,3,'allow_user_image_forum',NULL,NULL,'forum','1','',NULL,NULL),(59,7,3,'course_theme',NULL,NULL,'theme','','',NULL,NULL),(60,8,3,'allow_learning_path_theme',NULL,NULL,'theme','1','',NULL,NULL),(61,9,3,'allow_open_chat_window',NULL,NULL,'chat','1','',NULL,NULL),(62,10,3,'email_alert_to_teacher_on_new_user_in_course',NULL,NULL,'registration','0','',NULL,NULL),(63,11,3,'allow_user_view_user_list',NULL,NULL,'user','1','',NULL,NULL),(64,12,3,'display_info_advance_inside_homecourse',NULL,NULL,'thematic_advance','1','',NULL,NULL),(65,13,3,'email_alert_students_on_new_homework',NULL,NULL,'work','0','',NULL,NULL),(66,14,3,'enable_lp_auto_launch',NULL,NULL,'learning_path','0','',NULL,NULL),(67,15,3,'pdf_export_watermark_text',NULL,NULL,'learning_path',NULL,'',NULL,NULL),(68,16,3,'allow_public_certificates',NULL,NULL,'certificates',NULL,'',NULL,NULL),(69,17,3,'documents_default_visibility',NULL,NULL,'document',NULL,'',NULL,NULL),(70,NULL,3,'big_blue_button_record_and_store','bbb','checkbox','plugins','1','',NULL,NULL),(71,NULL,3,'show_system_folders',NULL,NULL,NULL,NULL,'show_system_folders',NULL,NULL),(72,NULL,3,'lp_return_link',NULL,NULL,NULL,NULL,'lp_return_link',NULL,NULL),(73,1,4,'email_alert_manager_on_new_doc',NULL,NULL,'work','0','',NULL,NULL),(74,2,4,'email_alert_on_new_doc_dropbox',NULL,NULL,'dropbox','0','',NULL,NULL),(75,3,4,'allow_user_edit_agenda',NULL,NULL,'agenda','0','',NULL,NULL),(76,4,4,'allow_user_edit_announcement',NULL,NULL,'announcement','0','',NULL,NULL),(77,5,4,'email_alert_manager_on_new_quiz',NULL,NULL,'quiz','1','',NULL,NULL),(78,6,4,'allow_user_image_forum',NULL,NULL,'forum','1','',NULL,NULL),(79,7,4,'course_theme',NULL,NULL,'theme','theBsharps','',NULL,NULL),(80,8,4,'allow_learning_path_theme',NULL,NULL,'theme','1','',NULL,NULL),(81,9,4,'allow_open_chat_window',NULL,NULL,'chat','1','',NULL,NULL),(82,10,4,'email_alert_to_teacher_on_new_user_in_course',NULL,NULL,'registration','0','',NULL,NULL),(83,11,4,'allow_user_view_user_list',NULL,NULL,'user','1','',NULL,NULL),(84,12,4,'display_info_advance_inside_homecourse',NULL,NULL,'thematic_advance','1','',NULL,NULL),(85,13,4,'email_alert_students_on_new_homework',NULL,NULL,'work','0','',NULL,NULL),(86,14,4,'enable_lp_auto_launch',NULL,NULL,'learning_path','0','',NULL,NULL),(87,15,4,'pdf_export_watermark_text',NULL,NULL,'learning_path',NULL,'',NULL,NULL),(88,16,4,'allow_public_certificates',NULL,NULL,'certificates',NULL,'',NULL,NULL),(89,17,4,'documents_default_visibility',NULL,NULL,'document',NULL,'',NULL,NULL),(90,NULL,4,'big_blue_button_record_and_store','bbb','checkbox','plugins',NULL,'',NULL,NULL),(91,NULL,4,'show_system_folders',NULL,NULL,NULL,NULL,'show_system_folders',NULL,NULL),(92,NULL,4,'lp_return_link',NULL,NULL,NULL,NULL,'lp_return_link',NULL,NULL),(93,1,5,'email_alert_manager_on_new_doc',NULL,NULL,'work','0','',NULL,NULL),(94,2,5,'email_alert_on_new_doc_dropbox',NULL,NULL,'dropbox','0','',NULL,NULL),(95,3,5,'allow_user_edit_agenda',NULL,NULL,'agenda','0','',NULL,NULL),(96,4,5,'allow_user_edit_announcement',NULL,NULL,'announcement','0','',NULL,NULL),(97,5,5,'email_alert_manager_on_new_quiz',NULL,NULL,'quiz','1','',NULL,NULL),(98,6,5,'allow_user_image_forum',NULL,NULL,'forum','1','',NULL,NULL),(99,7,5,'course_theme',NULL,NULL,'theme','','',NULL,NULL),(100,8,5,'allow_learning_path_theme',NULL,NULL,'theme','1','',NULL,NULL),(101,9,5,'allow_open_chat_window',NULL,NULL,'chat','1','',NULL,NULL),(102,10,5,'email_alert_to_teacher_on_new_user_in_course',NULL,NULL,'registration','0','',NULL,NULL),(103,11,5,'allow_user_view_user_list',NULL,NULL,'user','1','',NULL,NULL),(104,12,5,'display_info_advance_inside_homecourse',NULL,NULL,'thematic_advance','1','',NULL,NULL),(105,13,5,'email_alert_students_on_new_homework',NULL,NULL,'work','0','',NULL,NULL),(106,14,5,'enable_lp_auto_launch',NULL,NULL,'learning_path','0','',NULL,NULL),(107,15,5,'pdf_export_watermark_text',NULL,NULL,'learning_path',NULL,'',NULL,NULL),(108,16,5,'allow_public_certificates',NULL,NULL,'certificates',NULL,'',NULL,NULL),(109,17,5,'documents_default_visibility',NULL,NULL,'document',NULL,'',NULL,NULL),(110,NULL,5,'big_blue_button_record_and_store','bbb','checkbox','plugins',NULL,'',NULL,NULL),(111,NULL,5,'bbb_enable_conference_in_groups','bbb','checkbox','plugins',NULL,'',NULL,NULL),(112,NULL,3,'bbb_enable_conference_in_groups','bbb','checkbox','plugins','','',NULL,NULL),(113,NULL,4,'bbb_enable_conference_in_groups','bbb','checkbox','plugins',NULL,'',NULL,NULL),(114,1,6,'email_alert_manager_on_new_doc',NULL,NULL,'work','0','',NULL,NULL),(115,2,6,'email_alert_on_new_doc_dropbox',NULL,NULL,'dropbox','0','',NULL,NULL),(116,3,6,'allow_user_edit_agenda',NULL,NULL,'agenda','0','',NULL,NULL),(117,4,6,'allow_user_edit_announcement',NULL,NULL,'announcement','0','',NULL,NULL),(118,5,6,'email_alert_manager_on_new_quiz',NULL,NULL,'quiz','1','',NULL,NULL),(119,6,6,'allow_user_image_forum',NULL,NULL,'forum','1','',NULL,NULL),(120,7,6,'course_theme',NULL,NULL,'theme','','',NULL,NULL),(121,8,6,'allow_learning_path_theme',NULL,NULL,'theme','1','',NULL,NULL),(122,9,6,'allow_open_chat_window',NULL,NULL,'chat','1','',NULL,NULL),(123,10,6,'email_alert_to_teacher_on_new_user_in_course',NULL,NULL,'registration','0','',NULL,NULL),(124,11,6,'allow_user_view_user_list',NULL,NULL,'user','1','',NULL,NULL),(125,12,6,'display_info_advance_inside_homecourse',NULL,NULL,'thematic_advance','1','',NULL,NULL),(126,13,6,'email_alert_students_on_new_homework',NULL,NULL,'work','0','',NULL,NULL),(127,14,6,'enable_lp_auto_launch',NULL,NULL,'learning_path','0','',NULL,NULL),(128,15,6,'pdf_export_watermark_text',NULL,NULL,'learning_path',NULL,'',NULL,NULL),(129,16,6,'allow_public_certificates',NULL,NULL,'certificates',NULL,'',NULL,NULL),(130,17,6,'documents_default_visibility',NULL,NULL,'document',NULL,'',NULL,NULL),(131,NULL,6,'big_blue_button_record_and_store','bbb','checkbox','plugins',NULL,'',NULL,NULL),(132,NULL,6,'bbb_enable_conference_in_groups','bbb','checkbox','plugins',NULL,'',NULL,NULL),(133,NULL,5,'show_system_folders',NULL,NULL,NULL,NULL,'show_system_folders',NULL,NULL),(134,NULL,5,'lp_return_link',NULL,NULL,NULL,NULL,'lp_return_link',NULL,NULL),(135,NULL,6,'show_system_folders',NULL,NULL,NULL,NULL,'show_system_folders',NULL,NULL),(136,NULL,6,'lp_return_link',NULL,NULL,NULL,NULL,'lp_return_link',NULL,NULL),(137,1,7,'email_alert_manager_on_new_doc',NULL,NULL,'work','0','',NULL,NULL),(138,2,7,'email_alert_on_new_doc_dropbox',NULL,NULL,'dropbox','0','',NULL,NULL),(139,3,7,'allow_user_edit_agenda',NULL,NULL,'agenda','0','',NULL,NULL),(140,4,7,'allow_user_edit_announcement',NULL,NULL,'announcement','0','',NULL,NULL),(141,5,7,'email_alert_manager_on_new_quiz',NULL,NULL,'quiz','1','',NULL,NULL),(142,6,7,'allow_user_image_forum',NULL,NULL,'forum','1','',NULL,NULL),(143,7,7,'course_theme',NULL,NULL,'theme','','',NULL,NULL),(144,8,7,'allow_learning_path_theme',NULL,NULL,'theme','1','',NULL,NULL),(145,9,7,'allow_open_chat_window',NULL,NULL,'chat','1','',NULL,NULL),(146,10,7,'email_alert_to_teacher_on_new_user_in_course',NULL,NULL,'registration','0','',NULL,NULL),(147,11,7,'allow_user_view_user_list',NULL,NULL,'user','1','',NULL,NULL),(148,12,7,'display_info_advance_inside_homecourse',NULL,NULL,'thematic_advance','1','',NULL,NULL),(149,13,7,'email_alert_students_on_new_homework',NULL,NULL,'work','0','',NULL,NULL),(150,14,7,'enable_lp_auto_launch',NULL,NULL,'learning_path','0','',NULL,NULL),(151,15,7,'pdf_export_watermark_text',NULL,NULL,'learning_path','','',NULL,NULL),(152,16,7,'allow_public_certificates',NULL,NULL,'certificates','','',NULL,NULL),(153,17,7,'documents_default_visibility',NULL,NULL,'document','visible','',NULL,NULL),(154,NULL,7,'big_blue_button_record_and_store','bbb','checkbox','plugins','','',NULL,NULL),(155,NULL,7,'bbb_enable_conference_in_groups','bbb','checkbox','plugins','','',NULL,NULL);
/*!40000 ALTER TABLE `c_course_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_document`
--

DROP TABLE IF EXISTS `c_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_document` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filetype` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `readonly` tinyint(1) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_document`
--

LOCK TABLES `c_document` WRITE;
/*!40000 ALTER TABLE `c_document` DISABLE KEYS */;
INSERT INTO `c_document` VALUES (1,1,1,'/shared_folder',NULL,'Folders of users','folder',0,0,0),(2,2,1,'/chat_files',NULL,'Chat conversations history','folder',0,0,0),(3,3,2,'/shared_folder',NULL,'Folders of users','folder',0,0,0),(4,4,2,'/chat_files',NULL,'Chat conversations history','folder',0,0,0),(5,5,1,'/certificates',NULL,'Certificates','folder',0,0,0),(6,6,1,'/shared_folder/sf_user_1',NULL,'Ned Flanders','folder',0,0,0),(7,7,1,'/weekly-resourses',NULL,'Weekly Resourses','folder',0,0,0),(8,8,1,'/recorded-chats',NULL,'Recorded Chats','folder',0,0,0),(9,9,1,'/rubrics',NULL,'Rubrics','folder',0,0,0),(10,10,1,'/learning_path',NULL,'Learning paths','folder',0,0,0),(11,11,2,'/certificates__1__0',NULL,'Certificates','folder',0,0,1),(12,12,2,'/certificates',NULL,'Certificates','folder',0,0,1),(13,13,2,'/shared_folder_session_1__1__0',NULL,'Folders of users (Test Session)','folder',0,0,1),(14,14,2,'/shared_folder_session_1/sf_user_1__1__0',NULL,'Ned Flanders(Test Session)','folder',0,0,1),(15,15,1,'/weekly-resourses/week-1-topic.pdf.pdf','','week-1-Topic','file',90809,0,0),(16,16,1,'/weekly-resourses/week-2-topic.pdf.pdf',NULL,'week-2-topic','file',91075,0,0),(17,17,1,'/recorded-chats/week-1-chat.pdf.pdf',NULL,'week-1-chat','file',89432,0,0),(18,18,1,'/recorded-chats/week-2-chat.pdf.pdf',NULL,'week-2-chat','file',89672,0,0),(19,19,1,'/rubrics/rubrics.pdf.pdf',NULL,'rubrics','file',93426,0,0),(20,20,1,'/shared_folder/sf_user_4',NULL,'Mayor Quimby','folder',0,0,0),(21,21,1,'/chat_files/messages-2016-07-20.log.html',NULL,'messages-2016-07-20.log.html','file',0,0,0),(22,22,1,'/chat_files/messages-2016-07-21.log.html',NULL,'messages-2016-07-21.log.html','file',0,0,0),(23,23,3,'/shared_folder',NULL,'Folders of users','folder',0,0,0),(24,24,3,'/chat_files',NULL,'Chat conversations history','folder',0,0,0),(25,25,3,'/certificates',NULL,'Certificates','folder',0,0,0),(26,26,3,'/shared_folder/sf_user_4',NULL,'Mayor Quimby','folder',0,0,0),(27,27,1,'/certificates/default-certificate.html',NULL,'Default certificate','file',7040,0,0),(28,28,4,'/shared_folder',NULL,'Folders of users','folder',0,0,0),(29,29,4,'/chat_files',NULL,'Chat conversations history','folder',0,0,0),(30,30,2,'/chat_files/messages-2016-07-25_sid-1.log.html',NULL,'messages-2016-07-25_sid-1.log.html','file',0,0,1),(31,31,3,'/shared_folder/sf_user_1',NULL,'Ned Flanders','folder',0,0,0),(32,32,4,'/certificates',NULL,'Certificates','folder',0,0,0),(33,33,4,'/shared_folder/sf_user_1',NULL,'Ned Flanders','folder',0,0,0),(34,34,4,'/weekly-material',NULL,'Weekly Material','folder',0,0,0),(35,35,4,'/weekly-material/week-1-topic.pdf.pdf',NULL,'week-1-topic','file',90809,0,0),(36,36,5,'/shared_folder',NULL,'Folders of users','folder',0,0,0),(37,37,5,'/chat_files',NULL,'Chat conversations history','folder',0,0,0),(38,38,5,'/certificates',NULL,'Certificates','folder',0,0,0),(39,39,5,'/shared_folder/sf_user_1',NULL,'Ned Flanders','folder',0,0,0),(40,40,5,'/certificates/default-certificate.html',NULL,'Default certificate','file',7097,0,0),(41,41,6,'/shared_folder',NULL,'Folders of users','folder',0,0,0),(42,42,6,'/chat_files',NULL,'Chat conversations history','folder',0,0,0),(43,43,6,'/certificates',NULL,'Certificates','folder',0,0,0),(44,44,6,'/shared_folder/sf_user_6',NULL,'aimee wilson','folder',0,0,0),(45,45,6,'/shared_folder/sf_user_1',NULL,'Ned Flanders','folder',0,0,0),(46,46,7,'/shared_folder',NULL,'Folders of users','folder',0,0,0),(47,47,7,'/chat_files',NULL,'Chat conversations history','folder',0,0,0),(48,48,5,'/weekly-material','','Course Material','folder',4096,0,0),(49,49,5,'/weekly-chats','','Chats','folder',4096,0,0),(50,50,5,'/weekly-chats/week-1',NULL,'Week 1','folder',0,0,0),(51,51,5,'/weekly-chats/week-2',NULL,'Week 2','folder',0,0,0),(52,52,5,'/weekly-chats/week-1/week-1-chat.pdf.pdf',NULL,'week-1-chat','file',89432,0,0),(53,53,5,'/weekly-chats/week-2/week-2-chat.pdf.pdf',NULL,'week-2-chat','file',89672,0,0),(54,54,5,'/weekly-material/week-1-course-material',NULL,'Week 1 Course Material','folder',0,0,0),(55,55,5,'/weekly-material/week-2-course-material',NULL,'Week 2 Course Material','folder',0,0,0),(56,56,5,'/weekly-material/week-1-course-material/week-1-topic.pdf.pdf',NULL,'week-1-topic','file',90809,0,0),(57,57,5,'/weekly-material/week-2-course-material/week-2-topic.pdf.pdf',NULL,'week-2-topic','file',91075,0,0);
/*!40000 ALTER TABLE `c_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_dropbox_category`
--

DROP TABLE IF EXISTS `c_dropbox_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_dropbox_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `cat_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `received` tinyint(1) NOT NULL,
  `sent` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_dropbox_category`
--

LOCK TABLES `c_dropbox_category` WRITE;
/*!40000 ALTER TABLE `c_dropbox_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_dropbox_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_dropbox_feedback`
--

DROP TABLE IF EXISTS `c_dropbox_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_dropbox_feedback` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `feedback_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `author_user_id` int(11) NOT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedback_date` datetime NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `file_id` (`file_id`),
  KEY `author_user_id` (`author_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_dropbox_feedback`
--

LOCK TABLES `c_dropbox_feedback` WRITE;
/*!40000 ALTER TABLE `c_dropbox_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_dropbox_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_dropbox_file`
--

DROP TABLE IF EXISTS `c_dropbox_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_dropbox_file` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `filename` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `filesize` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_date` datetime NOT NULL,
  `last_upload_date` datetime NOT NULL,
  `cat_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  UNIQUE KEY `UN_filename` (`filename`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_dropbox_file`
--

LOCK TABLES `c_dropbox_file` WRITE;
/*!40000 ALTER TABLE `c_dropbox_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_dropbox_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_dropbox_person`
--

DROP TABLE IF EXISTS `c_dropbox_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_dropbox_person` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_dropbox_person`
--

LOCK TABLES `c_dropbox_person` WRITE;
/*!40000 ALTER TABLE `c_dropbox_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_dropbox_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_dropbox_post`
--

DROP TABLE IF EXISTS `c_dropbox_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_dropbox_post` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_date` datetime NOT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci,
  `cat_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `dest_user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `dest_user` (`dest_user_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_dropbox_post`
--

LOCK TABLES `c_dropbox_post` WRITE;
/*!40000 ALTER TABLE `c_dropbox_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_dropbox_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_attachment`
--

DROP TABLE IF EXISTS `c_forum_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_attachment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `size` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_attachment`
--

LOCK TABLES `c_forum_attachment` WRITE;
/*!40000 ALTER TABLE `c_forum_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_category`
--

DROP TABLE IF EXISTS `c_forum_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cat_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cat_comment` longtext COLLATE utf8_unicode_ci,
  `cat_order` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_category`
--

LOCK TABLES `c_forum_category` WRITE;
/*!40000 ALTER TABLE `c_forum_category` DISABLE KEYS */;
INSERT INTO `c_forum_category` VALUES (1,1,'Assignment 1','<p>Any questions or discussions related to Assignment 1.&nbsp;</p>\r\n',1,0,0,1),(2,1,'Assignment Area','                 \r\n                 ',2,0,0,2),(3,1,'Assignment 2','',3,0,0,3),(4,1,'Assignment 3','',4,0,0,4),(5,1,'Weekly Course Note / Tutorial Discussions','',5,0,0,5),(6,1,'General Discussion Area','',6,0,0,6),(7,3,'Mockups - fun or a nightmware','<p>Mockups are a nightmware..</p>\r\n',1,0,0,7),(8,5,'Testing','<p>Test forum</p>\r\n',1,0,0,8),(9,6,'Welcome Page','<p>Take this opportunity to introduce yourself, and tell everyone a little bit about yourself.</p>\r\n',1,0,0,9),(10,6,'Help','<p>Please&nbsp;use this area to ask any question, and request assistance.</p>\r\n',2,0,0,10),(11,6,'Assignments','<p>Here you can ask any question in relation to Assignments.</p>\r\n',3,0,0,11),(12,6,'Weekly Course Material.','<p>Here you can discuss anything related to the weekly course topics.</p>\r\n',4,0,0,12);
/*!40000 ALTER TABLE `c_forum_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_forum`
--

DROP TABLE IF EXISTS `c_forum_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_forum` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `forum_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `forum_comment` longtext COLLATE utf8_unicode_ci,
  `forum_threads` int(11) DEFAULT NULL,
  `forum_posts` int(11) DEFAULT NULL,
  `forum_last_post` int(11) DEFAULT NULL,
  `forum_category` int(11) DEFAULT NULL,
  `allow_anonymous` int(11) DEFAULT NULL,
  `allow_edit` int(11) DEFAULT NULL,
  `approval_direct_post` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_attachments` int(11) DEFAULT NULL,
  `allow_new_threads` int(11) DEFAULT NULL,
  `default_view` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_of_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_group_public_private` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_order` int(11) DEFAULT NULL,
  `locked` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `forum_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `lp_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_forum`
--

LOCK TABLES `c_forum_forum` WRITE;
/*!40000 ALTER TABLE `c_forum_forum` DISABLE KEYS */;
INSERT INTO `c_forum_forum` VALUES (1,1,1,'Questions','',NULL,NULL,NULL,2,NULL,0,NULL,NULL,0,'flat','0','public',1,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(2,1,2,'Assignment 1','',NULL,NULL,NULL,2,NULL,0,NULL,NULL,1,'flat','0','public',3,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(3,1,3,'Assignment 2','',NULL,NULL,NULL,2,NULL,0,NULL,NULL,1,'flat','0','public',5,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(4,1,4,'Week 1','',NULL,NULL,NULL,5,NULL,0,NULL,NULL,0,'flat','0','public',1,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(5,1,5,'Week 2','',NULL,NULL,NULL,5,NULL,0,NULL,NULL,0,'flat','0','public',2,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(6,3,6,'Mockups yay..','<p>We love mockups..</p>\r\n\r\n<p>&nbsp;</p>\r\n',NULL,NULL,NULL,7,NULL,0,NULL,NULL,0,'flat','0','public',1,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(7,5,7,'test','<p>test again</p>\r\n',NULL,NULL,NULL,8,NULL,0,NULL,NULL,0,'flat','0','public',1,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(8,6,8,'Hi from the Gold Coast','<p>Hi everyone,</p>\r\n\r\n<p>My name is Aimee and I am from the Gold Coast. &nbsp;I am halfway through my studies, and am looking forward to this study period.</p>\r\n',NULL,NULL,NULL,9,NULL,0,NULL,NULL,0,'flat','0','public',1,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(9,6,9,'Assignment 1','<p>Here you can ask any questions in relation to Assignment 1.</p>\r\n',NULL,NULL,NULL,11,NULL,0,NULL,NULL,0,'flat','0','public',3,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(10,6,10,'Assignment 2','<p>Here you can ask any questions in relation to Assignment 2.</p>\r\n',NULL,NULL,NULL,11,NULL,0,NULL,NULL,0,'flat','0','public',2,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(11,6,11,'Week 1','<p>Here you can discuss anything related to the week 1 course topic.</p>\r\n',NULL,NULL,NULL,12,NULL,0,NULL,NULL,0,'flat','0','public',3,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(12,6,12,'Week 2','<p>Here you can discuss anything related to the week 2&nbsp;course topic.</p>\r\n',NULL,NULL,NULL,12,NULL,0,NULL,NULL,0,'flat','0','public',4,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(13,6,13,'General Coding Help','<p>This is a place to ask any coding questions.</p>\r\n',NULL,NULL,NULL,10,NULL,0,NULL,NULL,0,'flat','0','public',1,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(14,6,14,'IDE Help','<p>Here you can discuss any problems you are having with your chosen IDE.</p>\r\n',NULL,NULL,NULL,10,NULL,0,NULL,NULL,0,'flat','0','public',2,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `c_forum_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_mailcue`
--

DROP TABLE IF EXISTS `c_forum_mailcue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_mailcue` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `thread` (`thread_id`),
  KEY `user` (`user_id`),
  KEY `post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_mailcue`
--

LOCK TABLES `c_forum_mailcue` WRITE;
/*!40000 ALTER TABLE `c_forum_mailcue` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_mailcue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_notification`
--

DROP TABLE IF EXISTS `c_forum_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_notification` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `thread` (`thread_id`),
  KEY `post` (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_notification`
--

LOCK TABLES `c_forum_notification` WRITE;
/*!40000 ALTER TABLE `c_forum_notification` DISABLE KEYS */;
INSERT INTO `c_forum_notification` VALUES (3,6,NULL,1,9,0,0);
/*!40000 ALTER TABLE `c_forum_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_post`
--

DROP TABLE IF EXISTS `c_forum_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_post` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `post_title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_text` longtext COLLATE utf8_unicode_ci,
  `thread_id` int(11) DEFAULT NULL,
  `forum_id` int(11) DEFAULT NULL,
  `poster_id` int(11) DEFAULT NULL,
  `poster_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `post_notification` tinyint(1) DEFAULT NULL,
  `post_parent_id` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `poster_id` (`poster_id`),
  KEY `forum_id` (`forum_id`),
  KEY `idx_forum_post_thread_id` (`thread_id`),
  KEY `idx_forum_post_visible` (`visible`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_post`
--

LOCK TABLES `c_forum_post` WRITE;
/*!40000 ALTER TABLE `c_forum_post` DISABLE KEYS */;
INSERT INTO `c_forum_post` VALUES (1,1,1,'Cant Submit','<p>asdfasdfasdffasf</p>',1,2,1,'','2016-07-16 10:36:04',0,NULL,1),(2,1,2,'Re:Cant Submit','<p>try this</p>',1,2,1,NULL,'2016-07-16 10:53:50',NULL,1,1),(3,1,3,'Do we submit our answers individually or as a group','<p>The questions in section 4, how do we answer them?&nbsp;</p>',2,3,1,'','2016-07-21 10:10:09',0,NULL,1),(4,5,4,'tt','<p>test</p>',3,7,1,'','2016-08-04 04:05:49',0,NULL,1);
/*!40000 ALTER TABLE `c_forum_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_thread`
--

DROP TABLE IF EXISTS `c_forum_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_thread` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `thread_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_id` int(11) DEFAULT NULL,
  `thread_replies` int(10) unsigned NOT NULL DEFAULT '0',
  `thread_poster_id` int(11) DEFAULT NULL,
  `thread_poster_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thread_views` int(10) unsigned NOT NULL DEFAULT '0',
  `thread_last_post` int(11) DEFAULT NULL,
  `thread_date` datetime DEFAULT NULL,
  `thread_sticky` tinyint(1) DEFAULT NULL,
  `locked` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `thread_title_qualify` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thread_qualify_max` double NOT NULL,
  `thread_close_date` datetime DEFAULT NULL,
  `thread_weight` double NOT NULL,
  `thread_peer_qualify` tinyint(1) NOT NULL,
  `lp_item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `idx_forum_thread_forum_id` (`forum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_thread`
--

LOCK TABLES `c_forum_thread` WRITE;
/*!40000 ALTER TABLE `c_forum_thread` DISABLE KEYS */;
INSERT INTO `c_forum_thread` VALUES (1,1,1,'Cant Submit',2,1,1,'',19,2,'2016-07-16 10:53:50',0,0,0,'',0,NULL,0,0,0),(2,1,2,'Do we submit our answers individually or as a group',3,0,1,'',0,3,'2016-07-21 10:10:09',0,0,0,'',0,NULL,0,0,0),(3,5,3,'tt',7,0,1,'',0,4,'2016-08-04 04:05:49',0,0,0,'',0,NULL,0,0,0);
/*!40000 ALTER TABLE `c_forum_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_thread_qualify`
--

DROP TABLE IF EXISTS `c_forum_thread_qualify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_thread_qualify` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `qualify` double NOT NULL,
  `qualify_user_id` int(11) DEFAULT NULL,
  `qualify_time` datetime DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user_id` (`user_id`,`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_thread_qualify`
--

LOCK TABLES `c_forum_thread_qualify` WRITE;
/*!40000 ALTER TABLE `c_forum_thread_qualify` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_thread_qualify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_thread_qualify_log`
--

DROP TABLE IF EXISTS `c_forum_thread_qualify_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_thread_qualify_log` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `qualify` double NOT NULL,
  `qualify_user_id` int(11) DEFAULT NULL,
  `qualify_time` datetime DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user_id` (`user_id`,`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_thread_qualify_log`
--

LOCK TABLES `c_forum_thread_qualify_log` WRITE;
/*!40000 ALTER TABLE `c_forum_thread_qualify_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_thread_qualify_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_glossary`
--

DROP TABLE IF EXISTS `c_glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_glossary` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `glossary_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `display_order` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_glossary`
--

LOCK TABLES `c_glossary` WRITE;
/*!40000 ALTER TABLE `c_glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_group_category`
--

DROP TABLE IF EXISTS `c_group_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_group_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `doc_state` tinyint(1) NOT NULL,
  `calendar_state` tinyint(1) NOT NULL,
  `work_state` tinyint(1) NOT NULL,
  `announcements_state` tinyint(1) NOT NULL,
  `forum_state` tinyint(1) NOT NULL,
  `wiki_state` tinyint(1) NOT NULL,
  `chat_state` tinyint(1) NOT NULL,
  `max_student` int(11) NOT NULL,
  `self_reg_allowed` tinyint(1) NOT NULL,
  `self_unreg_allowed` tinyint(1) NOT NULL,
  `groups_per_user` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_group_category`
--

LOCK TABLES `c_group_category` WRITE;
/*!40000 ALTER TABLE `c_group_category` DISABLE KEYS */;
INSERT INTO `c_group_category` VALUES (1,1,2,'Default groups','',1,1,1,1,1,1,1,8,0,0,0,0),(2,2,2,'Default groups','',1,1,1,1,1,1,1,8,0,0,0,0),(3,3,2,'Default groups','',1,1,1,1,1,1,1,8,0,0,0,0),(4,4,2,'Default groups','',1,1,1,1,1,1,1,8,0,0,0,0),(5,5,2,'Default groups','',1,1,1,1,1,1,1,8,0,0,0,0),(6,6,2,'Default groups','',1,1,1,1,1,1,1,8,0,0,0,0),(7,7,2,'Default groups','',1,1,1,1,1,1,1,8,0,0,0,0);
/*!40000 ALTER TABLE `c_group_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_group_info`
--

DROP TABLE IF EXISTS `c_group_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_group_info` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `max_student` int(11) NOT NULL,
  `doc_state` tinyint(1) NOT NULL,
  `calendar_state` tinyint(1) NOT NULL,
  `work_state` tinyint(1) NOT NULL,
  `announcements_state` tinyint(1) NOT NULL,
  `forum_state` tinyint(1) NOT NULL,
  `wiki_state` tinyint(1) NOT NULL,
  `chat_state` tinyint(1) NOT NULL,
  `secret_directory` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `self_registration_allowed` tinyint(1) NOT NULL,
  `self_unregistration_allowed` tinyint(1) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_group_info`
--

LOCK TABLES `c_group_info` WRITE;
/*!40000 ALTER TABLE `c_group_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_group_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_group_rel_tutor`
--

DROP TABLE IF EXISTS `c_group_rel_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_group_rel_tutor` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_group_rel_tutor`
--

LOCK TABLES `c_group_rel_tutor` WRITE;
/*!40000 ALTER TABLE `c_group_rel_tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_group_rel_tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_group_rel_user`
--

DROP TABLE IF EXISTS `c_group_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_group_rel_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_group_rel_user`
--

LOCK TABLES `c_group_rel_user` WRITE;
/*!40000 ALTER TABLE `c_group_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_group_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_item_property`
--

DROP TABLE IF EXISTS `c_item_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_item_property` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `to_group_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `insert_user_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `tool` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `insert_date` datetime NOT NULL,
  `lastedit_date` datetime NOT NULL,
  `ref` int(11) NOT NULL,
  `lastedit_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lastedit_user_id` int(11) NOT NULL,
  `visibility` tinyint(1) NOT NULL,
  `start_visible` datetime DEFAULT NULL,
  `end_visible` datetime DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `IDX_1D84C18191D79BD3` (`c_id`),
  KEY `IDX_1D84C181330D47E9` (`to_group_id`),
  KEY `IDX_1D84C18129F6EE60` (`to_user_id`),
  KEY `IDX_1D84C1819C859CC3` (`insert_user_id`),
  KEY `IDX_1D84C181613FECDF` (`session_id`),
  KEY `idx_item_property_toolref` (`tool`,`ref`),
  CONSTRAINT `FK_1D84C18129F6EE60` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_1D84C181330D47E9` FOREIGN KEY (`to_group_id`) REFERENCES `c_group_info` (`iid`),
  CONSTRAINT `FK_1D84C181613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_1D84C18191D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_1D84C1819C859CC3` FOREIGN KEY (`insert_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_item_property`
--

LOCK TABLES `c_item_property` WRITE;
/*!40000 ALTER TABLE `c_item_property` DISABLE KEYS */;
INSERT INTO `c_item_property` VALUES (1,1,NULL,NULL,1,NULL,1,'document','2016-07-12 12:07:51','2016-07-23 04:18:30',1,'DocumentInvisible',1,0,NULL,NULL),(2,1,NULL,NULL,1,NULL,2,'document','2016-07-12 12:07:51','2016-07-23 04:18:26',2,'DocumentInvisible',1,0,NULL,NULL),(3,1,NULL,NULL,1,NULL,3,'forum_category','2016-07-13 08:48:49','2016-07-13 08:49:17',1,'ForumcategoryDeleted',1,2,NULL,NULL),(4,1,NULL,NULL,1,NULL,4,'forum_category','2016-07-13 08:49:41','2016-07-27 09:49:44',2,'ForumCategoryUpdated',1,1,NULL,NULL),(5,1,NULL,NULL,1,NULL,5,'forum_category','2016-07-13 08:49:50','2016-07-13 08:50:43',3,'ForumcategoryDeleted',1,2,NULL,NULL),(6,1,NULL,NULL,1,NULL,6,'forum_category','2016-07-13 08:50:00','2016-07-13 08:50:47',4,'ForumcategoryDeleted',1,2,NULL,NULL),(7,1,NULL,NULL,1,NULL,7,'forum','2016-07-13 08:50:15','2016-07-13 08:52:10',1,'ForumDeleted',1,2,NULL,NULL),(8,1,NULL,NULL,1,NULL,8,'forum','2016-07-13 08:51:22','2016-07-27 10:48:36',2,'ForumVisible',1,1,NULL,NULL),(9,1,NULL,NULL,1,NULL,9,'forum','2016-07-13 08:51:52','2016-07-13 08:52:28',3,'ForumUpdated',1,1,NULL,NULL),(10,1,NULL,NULL,1,NULL,10,'forum_category','2016-07-13 08:53:59','2016-07-13 08:53:59',5,'ForumcategoryVisible',1,1,NULL,NULL),(11,1,NULL,NULL,1,NULL,11,'forum_category','2016-07-13 08:54:21','2016-07-13 08:54:21',6,'ForumcategoryVisible',1,1,NULL,NULL),(12,1,NULL,NULL,1,NULL,12,'forum','2016-07-13 10:16:05','2016-07-13 10:16:05',4,'ForumVisible',1,1,NULL,NULL),(13,1,NULL,NULL,1,NULL,13,'forum','2016-07-13 10:16:15','2016-07-13 10:16:15',5,'ForumVisible',1,1,NULL,NULL),(14,2,NULL,NULL,1,NULL,14,'document','2016-07-14 01:28:50','2016-07-14 01:28:50',3,'DocumentAdded',1,0,NULL,NULL),(15,2,NULL,NULL,1,NULL,15,'document','2016-07-14 01:28:50','2016-07-14 01:28:50',4,'DocumentAdded',1,0,NULL,NULL),(16,1,NULL,NULL,1,NULL,16,'document','2016-07-16 04:04:54','2016-07-16 04:04:54',5,'DocumentInvisible',1,0,NULL,NULL),(17,1,NULL,NULL,1,NULL,17,'document','2016-07-16 04:04:54','2016-07-16 04:04:54',6,'DocumentVisible',1,1,NULL,NULL),(18,1,NULL,NULL,1,NULL,18,'document','2016-07-16 04:18:14','2016-07-19 08:05:14',7,'DocumentInFolderUpdated',1,1,NULL,NULL),(19,1,NULL,NULL,1,NULL,19,'document','2016-07-16 04:19:23','2016-07-23 06:04:58',8,'DocumentVisible',1,1,NULL,NULL),(20,1,NULL,NULL,1,NULL,20,'document','2016-07-16 04:19:41','2016-07-19 08:07:51',9,'DocumentInFolderUpdated',1,1,NULL,NULL),(21,1,NULL,NULL,1,NULL,21,'document','2016-07-16 04:50:29','2016-07-23 04:17:41',10,'DocumentInvisible',1,0,NULL,NULL),(22,1,NULL,NULL,1,NULL,22,'forum_thread','2016-07-16 10:36:04','2016-07-16 10:36:04',1,'ForumthreadVisible',1,1,NULL,NULL),(23,1,NULL,NULL,1,NULL,23,'forum_post','2016-07-16 10:53:50','2016-07-16 10:53:50',2,'NewPost',1,1,NULL,NULL),(24,2,NULL,NULL,1,1,24,'document','2016-07-19 07:42:51','2016-07-19 07:42:51',11,'FolderCreated',1,1,NULL,NULL),(25,2,NULL,NULL,1,1,25,'document','2016-07-19 07:42:51','2016-07-19 07:42:51',12,'DocumentInvisible',1,0,NULL,NULL),(26,2,NULL,NULL,1,1,26,'document','2016-07-19 07:42:51','2016-07-19 07:42:51',13,'FolderCreated',1,1,NULL,NULL),(27,2,NULL,NULL,1,1,27,'document','2016-07-19 07:42:51','2016-07-19 07:42:51',14,'DocumentVisible',1,1,NULL,NULL),(28,1,NULL,NULL,1,NULL,28,'document','2016-07-19 08:05:07','2016-07-19 08:05:07',15,'DocumentVisible',1,1,NULL,NULL),(29,1,NULL,NULL,1,NULL,29,'document','2016-07-19 08:05:14','2016-07-19 08:05:14',16,'DocumentVisible',1,1,NULL,NULL),(30,1,NULL,NULL,1,NULL,30,'document','2016-07-19 08:05:34','2016-07-23 01:18:05',17,'DocumentVisible',1,1,NULL,NULL),(31,1,NULL,NULL,1,NULL,31,'document','2016-07-19 08:05:39','2016-07-19 08:05:39',18,'DocumentVisible',1,1,NULL,NULL),(32,1,NULL,NULL,1,NULL,32,'document','2016-07-19 08:07:51','2016-07-19 08:07:51',19,'DocumentVisible',1,1,NULL,NULL),(33,1,NULL,NULL,4,NULL,33,'document','2016-07-19 09:22:23','2016-07-19 09:22:23',20,'DocumentVisible',4,1,NULL,NULL),(34,2,NULL,NULL,1,NULL,34,'calendar_event','2016-07-19 09:44:34','2016-08-03 05:13:15',1,'CalendareventVisible',5,1,'2016-07-19 07:00:00','2016-07-19 23:59:00'),(35,1,NULL,NULL,1,NULL,35,'document','2016-07-20 09:50:48','2016-07-20 09:50:48',21,'DocumentInvisible',1,0,NULL,NULL),(36,1,NULL,NULL,1,NULL,36,'document','2016-07-21 07:59:50','2016-07-21 07:59:50',22,'DocumentInvisible',1,0,NULL,NULL),(37,1,NULL,NULL,1,NULL,37,'forum_thread','2016-07-21 10:10:09','2016-07-21 10:10:09',2,'ForumthreadVisible',1,1,NULL,NULL),(38,3,NULL,NULL,5,NULL,38,'document','2016-07-22 02:02:40','2016-07-22 02:02:40',23,'DocumentAdded',5,0,NULL,NULL),(39,3,NULL,NULL,5,NULL,39,'document','2016-07-22 02:02:40','2016-07-22 02:02:40',24,'DocumentAdded',5,0,NULL,NULL),(40,3,NULL,NULL,5,NULL,40,'course_description','2016-07-22 02:03:11','2016-07-22 02:03:11',1,'CourseDescriptionAdded',5,1,NULL,NULL),(41,3,NULL,NULL,5,NULL,41,'course_description','2016-07-22 02:03:41','2016-07-22 02:03:41',2,'CourseDescriptionAdded',5,1,NULL,NULL),(42,3,NULL,NULL,5,NULL,42,'course_description','2016-07-22 02:04:08','2016-07-22 02:04:08',3,'CourseDescriptionAdded',5,1,NULL,NULL),(43,3,NULL,NULL,5,NULL,43,'forum_category','2016-07-22 02:06:57','2016-07-22 02:07:23',7,'ForumcategoryInvisible',5,0,NULL,NULL),(44,3,NULL,NULL,5,NULL,44,'forum','2016-07-22 02:07:41','2016-07-22 02:07:41',6,'ForumVisible',5,1,NULL,NULL),(45,3,NULL,NULL,4,NULL,45,'document','2016-07-23 01:04:06','2016-07-23 01:04:06',25,'DocumentInvisible',4,0,NULL,NULL),(46,3,NULL,NULL,4,NULL,46,'document','2016-07-23 01:04:06','2016-07-23 01:04:06',26,'DocumentVisible',4,1,NULL,NULL),(47,1,NULL,NULL,1,NULL,47,'document','2016-07-23 05:46:45','2016-07-23 05:46:45',27,'DocumentAdded',1,1,NULL,NULL),(48,4,NULL,NULL,1,NULL,48,'document','2016-07-23 09:25:57','2016-07-23 09:25:57',28,'DocumentAdded',1,0,NULL,NULL),(49,4,NULL,NULL,1,NULL,49,'document','2016-07-23 09:25:57','2016-07-23 09:25:57',29,'DocumentAdded',1,0,NULL,NULL),(50,1,NULL,NULL,1,NULL,50,'attendance','2016-07-24 00:25:15','2016-07-24 00:25:15',1,'AttendanceAdded',1,1,NULL,NULL),(51,2,NULL,NULL,1,1,51,'document','2016-07-25 11:30:41','2016-07-25 11:30:41',30,'DocumentInvisible',1,0,NULL,NULL),(52,3,NULL,NULL,1,NULL,52,'document','2016-07-25 11:39:51','2016-07-25 11:39:52',31,'DocumentVisible',1,1,NULL,NULL),(53,3,NULL,NULL,5,NULL,53,'calendar_event','2016-07-25 11:47:17','2016-08-07 22:37:36',2,'CalendareventDeleted',5,2,'2016-07-25 11:24:37','2016-07-25 11:47:17'),(54,3,NULL,NULL,5,NULL,54,'link','2016-07-25 11:47:25','2016-07-25 11:47:25',1,'LinkAdded',5,1,NULL,NULL),(55,4,NULL,NULL,1,NULL,55,'document','2016-07-27 09:48:53','2016-07-27 09:48:54',32,'DocumentInvisible',1,0,NULL,NULL),(56,4,NULL,NULL,1,NULL,56,'document','2016-07-27 09:48:54','2016-07-27 09:48:54',33,'DocumentVisible',1,1,NULL,NULL),(57,4,NULL,NULL,1,NULL,57,'document','2016-07-27 09:49:19','2016-08-01 09:21:42',34,'DocumentInFolderUpdated',1,1,NULL,NULL),(58,4,NULL,NULL,1,NULL,58,'document','2016-08-01 09:21:42','2016-08-01 09:21:42',35,'DocumentVisible',1,1,NULL,NULL),(59,5,NULL,NULL,1,NULL,59,'document','2016-08-01 09:36:15','2016-08-01 09:36:15',36,'DocumentAdded',1,0,NULL,NULL),(60,5,NULL,NULL,1,NULL,60,'document','2016-08-01 09:36:15','2016-08-01 09:36:15',37,'DocumentAdded',1,0,NULL,NULL),(61,5,NULL,NULL,1,NULL,61,'document','2016-08-02 00:22:38','2016-08-02 00:22:38',38,'DocumentInvisible',1,0,NULL,NULL),(62,5,NULL,NULL,1,NULL,62,'document','2016-08-02 00:22:38','2016-08-02 00:22:38',39,'DocumentVisible',1,1,NULL,NULL),(63,5,NULL,NULL,1,NULL,63,'work','2016-08-03 10:05:35','2016-08-03 10:05:35',1,'DirectoryCreated',1,1,NULL,NULL),(64,5,NULL,NULL,1,NULL,64,'calendar_event','2016-08-03 10:05:35','2016-08-03 10:05:35',3,'CalendareventVisible',1,1,'2016-08-14 13:59:00','2016-08-14 13:59:00'),(65,5,NULL,NULL,1,NULL,65,'work','2016-08-03 10:22:51','2016-08-03 10:22:51',2,'DirectoryCreated',1,1,NULL,NULL),(66,5,NULL,NULL,1,NULL,66,'calendar_event','2016-08-03 10:22:51','2016-08-03 10:22:52',4,'CalendareventVisible',1,1,'2016-09-04 13:59:00','2016-09-04 13:59:00'),(67,5,NULL,NULL,1,NULL,67,'work','2016-08-03 10:30:48','2016-08-08 10:51:37',3,'WorkVisible',1,1,NULL,NULL),(68,2,NULL,5,5,1,68,'calendar_event','2016-08-04 00:28:04','2016-08-07 23:10:30',5,'CalendareventDeleted',5,2,'2016-08-10 14:00:00','2016-08-11 13:59:00'),(69,5,NULL,NULL,1,NULL,69,'forum_category','2016-08-04 04:04:11','2016-08-04 04:06:48',8,'ForumcategoryDeleted',1,2,NULL,NULL),(70,5,NULL,NULL,1,NULL,70,'forum','2016-08-04 04:04:55','2016-08-04 04:04:55',7,'ForumVisible',1,1,NULL,NULL),(71,5,NULL,NULL,1,NULL,71,'forum_thread','2016-08-04 04:05:49','2016-08-04 04:05:49',3,'ForumthreadVisible',1,1,NULL,NULL),(72,3,NULL,5,5,NULL,72,'calendar_event','2016-08-04 05:14:57','2016-08-07 22:37:44',6,'CalendareventDeleted',5,2,'2016-03-27 14:00:00','2016-06-06 13:59:00'),(73,5,NULL,NULL,1,NULL,73,'document','2016-08-04 06:27:01','2016-08-04 06:27:01',40,'DocumentAdded',1,1,NULL,NULL),(74,3,NULL,5,5,NULL,74,'calendar_event','2016-08-04 06:38:01','2016-08-07 22:31:32',7,'CalendareventDeleted',5,2,'2016-08-04 07:00:00','2016-08-04 13:59:00'),(75,3,NULL,5,5,NULL,75,'calendar_event','2016-08-04 06:43:33','2016-08-07 22:31:39',8,'CalendareventDeleted',5,2,'2016-08-04 09:00:00','2016-08-04 13:59:00'),(76,3,NULL,5,5,NULL,76,'calendar_event','2016-08-04 08:22:58','2016-08-07 22:31:36',9,'CalendareventDeleted',5,2,'2016-08-04 08:30:00','2016-08-04 13:59:00'),(77,6,NULL,NULL,1,NULL,77,'document','2016-08-05 04:44:43','2016-08-05 04:44:43',41,'DocumentAdded',1,0,NULL,NULL),(78,6,NULL,NULL,1,NULL,78,'document','2016-08-05 04:44:43','2016-08-05 04:44:43',42,'DocumentAdded',1,0,NULL,NULL),(79,6,NULL,NULL,6,NULL,79,'document','2016-08-05 04:49:03','2016-08-05 04:49:03',43,'DocumentInvisible',6,0,NULL,NULL),(80,6,NULL,NULL,6,NULL,80,'document','2016-08-05 04:49:03','2016-08-05 04:49:03',44,'DocumentVisible',6,1,NULL,NULL),(81,6,NULL,NULL,1,NULL,81,'document','2016-08-05 05:29:05','2016-08-05 05:29:05',45,'DocumentVisible',1,1,NULL,NULL),(82,5,NULL,8,1,NULL,82,'calendar_event','2016-08-06 06:19:25','2016-08-06 06:19:25',10,'CalendareventVisible',1,1,'2016-08-06 06:19:00','2016-08-06 06:19:00'),(83,6,NULL,NULL,1,NULL,83,'forum_category','2016-08-07 00:06:24','2016-08-07 00:14:14',9,'ForumcategoryDeleted',1,2,NULL,NULL),(84,6,NULL,NULL,1,NULL,84,'forum_category','2016-08-07 00:07:58','2016-08-10 06:54:43',10,'ForumcategoryVisible',1,1,NULL,NULL),(85,6,NULL,NULL,1,NULL,85,'forum_category','2016-08-07 00:09:00','2016-08-07 00:12:21',11,'ForumCategoryUpdated',1,1,NULL,NULL),(86,6,NULL,NULL,1,NULL,86,'forum','2016-08-07 00:11:33','2016-08-07 00:11:56',8,'ForumDeleted',1,2,NULL,NULL),(87,6,NULL,NULL,1,NULL,87,'forum','2016-08-07 00:13:17','2016-08-07 00:18:25',9,'ForumUpdated',1,1,NULL,NULL),(88,6,NULL,NULL,1,NULL,88,'forum','2016-08-07 00:13:45','2016-08-07 00:13:45',10,'ForumVisible',1,1,NULL,NULL),(89,6,NULL,NULL,1,NULL,89,'forum_category','2016-08-07 00:17:09','2016-08-07 00:17:09',12,'ForumcategoryVisible',1,1,NULL,NULL),(90,6,NULL,NULL,1,NULL,90,'forum','2016-08-07 00:17:53','2016-08-07 00:18:34',11,'ForumUpdated',1,1,NULL,NULL),(91,6,NULL,NULL,1,NULL,91,'forum','2016-08-07 00:18:10','2016-08-07 00:18:42',12,'ForumUpdated',1,1,NULL,NULL),(92,6,NULL,NULL,1,NULL,92,'forum','2016-08-07 00:21:19','2016-08-07 00:21:19',13,'ForumVisible',1,1,NULL,NULL),(93,6,NULL,NULL,1,NULL,93,'forum','2016-08-07 00:24:13','2016-08-07 00:24:13',14,'ForumVisible',1,1,NULL,NULL),(94,2,NULL,5,5,1,94,'calendar_event','2016-08-07 11:53:15','2016-08-07 23:10:36',11,'CalendareventDeleted',5,2,'2016-08-07 12:00:00','2016-08-07 13:59:00'),(95,2,NULL,5,5,1,95,'calendar_event','2016-08-07 12:21:52','2016-08-07 23:10:33',12,'CalendareventDeleted',5,2,'2016-08-07 12:30:00','2016-08-07 13:59:00'),(96,3,NULL,5,5,NULL,96,'calendar_event','2016-08-07 21:19:03','2016-08-07 22:31:42',13,'CalendareventDeleted',5,2,'2016-08-07 21:00:00','2016-08-08 13:59:00'),(97,3,NULL,5,5,NULL,97,'calendar_event','2016-08-07 21:19:59','2016-08-07 22:31:46',14,'CalendareventDeleted',5,2,'2016-08-07 21:18:00','2016-08-07 22:00:00'),(98,3,NULL,5,5,NULL,98,'calendar_event','2016-08-07 22:23:51','2016-08-07 22:37:24',15,'CalendareventDeleted',5,2,'2016-08-07 22:20:00','2016-08-07 23:00:00'),(99,3,NULL,5,5,NULL,99,'calendar_event','2016-08-07 22:40:33','2016-08-07 23:16:13',16,'CalendareventDeleted',5,2,'2016-08-07 22:40:00','2016-08-08 13:59:00'),(100,2,NULL,5,5,NULL,100,'calendar_event','2016-08-07 23:11:55','2016-08-07 23:17:25',17,'CalendareventDeleted',5,2,'2016-08-07 23:10:00','2016-08-08 13:59:00'),(101,2,NULL,5,5,1,101,'calendar_event','2016-08-07 23:14:54','2016-08-07 23:15:49',18,'CalendareventDeleted',5,2,'2016-08-07 23:12:00','2016-08-08 13:59:00'),(102,5,NULL,1,5,NULL,102,'calendar_event','2016-08-07 23:22:07','2016-08-07 23:46:14',19,'CalendareventDeleted',5,2,'2016-08-07 23:20:00','2016-08-08 13:59:00'),(103,4,NULL,1,5,NULL,103,'calendar_event','2016-08-07 23:23:10','2016-08-07 23:44:38',20,'CalendareventDeleted',5,2,'2016-08-07 23:20:00','2016-08-08 13:59:00'),(104,6,NULL,1,5,NULL,104,'calendar_event','2016-08-07 23:25:03','2016-08-07 23:38:22',21,'CalendareventDeleted',5,2,'2016-08-07 23:24:00','2016-08-08 13:59:00'),(105,6,NULL,1,5,NULL,105,'calendar_event','2016-08-07 23:40:06','2016-08-07 23:40:06',22,'CalendareventVisible',5,1,'2016-08-07 23:39:00','2016-08-08 13:59:00'),(106,3,NULL,5,5,NULL,106,'calendar_event','2016-08-07 23:42:41','2016-08-07 23:42:41',23,'CalendareventVisible',5,1,'2016-08-07 23:40:00','2016-08-08 13:59:00'),(107,5,NULL,1,5,NULL,107,'calendar_event','2016-08-08 03:24:18','2016-08-08 03:24:18',24,'CalendareventVisible',5,1,'2016-08-08 03:24:00','2016-08-08 13:59:00'),(108,7,NULL,NULL,1,NULL,108,'document','2016-08-08 05:30:34','2016-08-08 05:30:34',46,'DocumentAdded',1,0,NULL,NULL),(109,7,NULL,NULL,1,NULL,109,'document','2016-08-08 05:30:34','2016-08-08 05:30:34',47,'DocumentAdded',1,0,NULL,NULL),(110,2,NULL,NULL,5,1,110,'calendar_event','2016-08-08 05:52:14','2016-08-08 12:34:25',25,'CalendareventVisible',5,1,'2016-08-08 05:50:00','2016-08-08 13:59:00'),(111,4,NULL,1,5,NULL,111,'calendar_event','2016-08-08 11:44:20','2016-08-08 11:44:20',26,'CalendareventVisible',5,1,'2016-08-08 11:44:00','2016-08-08 13:59:00'),(112,5,NULL,NULL,1,NULL,112,'document','2016-08-09 10:48:27','2016-08-09 10:58:16',48,'DocumentInFolderUpdated',1,1,NULL,NULL),(113,5,NULL,NULL,1,NULL,113,'document','2016-08-09 10:48:42','2016-08-09 10:55:45',49,'DocumentInFolderUpdated',1,1,NULL,NULL),(114,5,NULL,NULL,1,NULL,114,'document','2016-08-09 10:55:07','2016-08-09 10:55:38',50,'DocumentInFolderUpdated',1,1,NULL,NULL),(115,5,NULL,NULL,1,NULL,115,'document','2016-08-09 10:55:13','2016-08-09 10:55:45',51,'DocumentInFolderUpdated',1,1,NULL,NULL),(116,5,NULL,NULL,1,NULL,116,'document','2016-08-09 10:55:38','2016-08-09 10:55:38',52,'DocumentVisible',1,1,NULL,NULL),(117,5,NULL,NULL,1,NULL,117,'document','2016-08-09 10:55:45','2016-08-09 10:55:45',53,'DocumentVisible',1,1,NULL,NULL),(118,5,NULL,NULL,1,NULL,118,'document','2016-08-09 10:57:50','2016-08-09 10:58:11',54,'DocumentInFolderUpdated',1,1,NULL,NULL),(119,5,NULL,NULL,1,NULL,119,'document','2016-08-09 10:57:59','2016-08-09 10:58:16',55,'DocumentInFolderUpdated',1,1,NULL,NULL),(120,5,NULL,NULL,1,NULL,120,'document','2016-08-09 10:58:11','2016-08-09 10:58:11',56,'DocumentVisible',1,1,NULL,NULL),(121,5,NULL,NULL,1,NULL,121,'document','2016-08-09 10:58:16','2016-08-09 10:58:16',57,'DocumentVisible',1,1,NULL,NULL),(122,5,NULL,NULL,1,NULL,122,'course_description','2016-08-09 11:11:40','2016-08-09 11:11:40',4,'CourseDescriptionAdded',1,1,NULL,NULL),(123,5,NULL,NULL,1,NULL,123,'course_description','2016-08-09 11:14:09','2016-08-09 11:14:09',5,'CourseDescriptionAdded',1,1,NULL,NULL),(124,5,NULL,NULL,1,NULL,124,'calendar_event','2016-08-10 04:17:16','2016-08-10 04:17:16',27,'CalendareventVisible',1,1,'2016-08-08 04:16:00','2016-08-12 04:16:00'),(125,3,NULL,5,5,NULL,125,'calendar_event','2016-08-10 09:43:42','2016-08-10 09:43:42',28,'CalendareventVisible',5,1,'2016-08-09 14:00:00','2016-08-10 13:59:00');
/*!40000 ALTER TABLE `c_item_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_link`
--

DROP TABLE IF EXISTS `c_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_link` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `category_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `on_homepage` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_link`
--

LOCK TABLES `c_link` WRITE;
/*!40000 ALTER TABLE `c_link` DISABLE KEYS */;
INSERT INTO `c_link` VALUES (1,3,1,'http://52.62.242.210/playback/presentation/0.9.0/playback.html?meetingId=77f7e1d76a1bcc77fdf22fa7e6b4c3d254f8c747-1469445877860','MOCKUPSAREFUN-0',NULL,0,1,'',NULL,0);
/*!40000 ALTER TABLE `c_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_link_category`
--

DROP TABLE IF EXISTS `c_link_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_link_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `category_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `display_order` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_link_category`
--

LOCK TABLES `c_link_category` WRITE;
/*!40000 ALTER TABLE `c_link_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_link_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp`
--

DROP TABLE IF EXISTS `c_lp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `lp_type` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ref` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `path` longtext COLLATE utf8_unicode_ci NOT NULL,
  `force_commit` tinyint(1) NOT NULL,
  `default_view_mod` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'embedded',
  `default_encoding` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UTF-8',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `content_maker` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_local` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `content_license` longtext COLLATE utf8_unicode_ci NOT NULL,
  `prevent_reinit` tinyint(1) NOT NULL DEFAULT '1',
  `js_lib` longtext COLLATE utf8_unicode_ci NOT NULL,
  `debug` tinyint(1) NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preview_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) NOT NULL,
  `prerequisite` int(11) NOT NULL,
  `hide_toc_frame` tinyint(1) NOT NULL,
  `seriousgame_mode` tinyint(1) NOT NULL,
  `use_max_score` int(11) NOT NULL DEFAULT '1',
  `autolaunch` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `max_attempts` int(11) NOT NULL,
  `subscribe_users` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `publicated_on` datetime NOT NULL,
  `expired_on` datetime NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp`
--

LOCK TABLES `c_lp` WRITE;
/*!40000 ALTER TABLE `c_lp` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_category`
--

DROP TABLE IF EXISTS `c_lp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_category`
--

LOCK TABLES `c_lp_category` WRITE;
/*!40000 ALTER TABLE `c_lp_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_item`
--

DROP TABLE IF EXISTS `c_lp_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_item` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `lp_id` int(11) NOT NULL,
  `item_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ref` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(511) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(511) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` longtext COLLATE utf8_unicode_ci NOT NULL,
  `min_score` double NOT NULL,
  `max_score` double DEFAULT '100',
  `mastery_score` double DEFAULT NULL,
  `parent_item_id` int(11) NOT NULL,
  `previous_item_id` int(11) NOT NULL,
  `next_item_id` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  `prerequisite` longtext COLLATE utf8_unicode_ci,
  `parameters` longtext COLLATE utf8_unicode_ci,
  `launch_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `max_time_allowed` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `terms` longtext COLLATE utf8_unicode_ci,
  `search_did` int(11) DEFAULT NULL,
  `audio` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prerequisite_min_score` double DEFAULT NULL,
  `prerequisite_max_score` double DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `lp_id` (`lp_id`),
  KEY `idx_c_lp_item_cid_lp_id` (`c_id`,`lp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_item`
--

LOCK TABLES `c_lp_item` WRITE;
/*!40000 ALTER TABLE `c_lp_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_item_view`
--

DROP TABLE IF EXISTS `c_lp_item_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_item_view` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `lp_item_id` int(11) NOT NULL,
  `lp_view_id` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `total_time` int(11) NOT NULL,
  `score` double NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'not attempted',
  `suspend_data` longtext COLLATE utf8_unicode_ci,
  `lesson_location` longtext COLLATE utf8_unicode_ci,
  `core_exit` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `max_score` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `lp_item_id` (`lp_item_id`),
  KEY `lp_view_id` (`lp_view_id`),
  KEY `idx_c_lp_item_view_cid_lp_view_id_lp_item_id` (`c_id`,`lp_view_id`,`lp_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_item_view`
--

LOCK TABLES `c_lp_item_view` WRITE;
/*!40000 ALTER TABLE `c_lp_item_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_item_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_iv_interaction`
--

DROP TABLE IF EXISTS `c_lp_iv_interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_iv_interaction` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `lp_iv_id` bigint(20) NOT NULL,
  `interaction_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `interaction_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `weighting` double NOT NULL,
  `completion_time` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `correct_responses` longtext COLLATE utf8_unicode_ci NOT NULL,
  `student_response` longtext COLLATE utf8_unicode_ci NOT NULL,
  `result` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latency` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `lp_iv_id` (`lp_iv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_iv_interaction`
--

LOCK TABLES `c_lp_iv_interaction` WRITE;
/*!40000 ALTER TABLE `c_lp_iv_interaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_iv_interaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_iv_objective`
--

DROP TABLE IF EXISTS `c_lp_iv_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_iv_objective` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `lp_iv_id` bigint(20) NOT NULL,
  `order_id` int(11) NOT NULL,
  `objective_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `score_raw` double NOT NULL,
  `score_max` double NOT NULL,
  `score_min` double NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `lp_iv_id` (`lp_iv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_iv_objective`
--

LOCK TABLES `c_lp_iv_objective` WRITE;
/*!40000 ALTER TABLE `c_lp_iv_objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_iv_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_view`
--

DROP TABLE IF EXISTS `c_lp_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_view` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `lp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `last_item` int(11) NOT NULL,
  `progress` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `lp_id` (`lp_id`),
  KEY `user_id` (`user_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_view`
--

LOCK TABLES `c_lp_view` WRITE;
/*!40000 ALTER TABLE `c_lp_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_notebook`
--

DROP TABLE IF EXISTS `c_notebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_notebook` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `notebook_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_notebook`
--

LOCK TABLES `c_notebook` WRITE;
/*!40000 ALTER TABLE `c_notebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_notebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_online_connected`
--

DROP TABLE IF EXISTS `c_online_connected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_online_connected` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `last_connection` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_online_connected`
--

LOCK TABLES `c_online_connected` WRITE;
/*!40000 ALTER TABLE `c_online_connected` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_online_connected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_online_link`
--

DROP TABLE IF EXISTS `c_online_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_online_link` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_online_link`
--

LOCK TABLES `c_online_link` WRITE;
/*!40000 ALTER TABLE `c_online_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_online_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_permission_group`
--

DROP TABLE IF EXISTS `c_permission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_permission_group` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `tool` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_permission_group`
--

LOCK TABLES `c_permission_group` WRITE;
/*!40000 ALTER TABLE `c_permission_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_permission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_permission_task`
--

DROP TABLE IF EXISTS `c_permission_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_permission_task` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `task_id` int(11) NOT NULL,
  `tool` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_permission_task`
--

LOCK TABLES `c_permission_task` WRITE;
/*!40000 ALTER TABLE `c_permission_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_permission_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_permission_user`
--

DROP TABLE IF EXISTS `c_permission_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_permission_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `tool` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_permission_user`
--

LOCK TABLES `c_permission_user` WRITE;
/*!40000 ALTER TABLE `c_permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_permission_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz`
--

DROP TABLE IF EXISTS `c_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `sound` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `random` int(11) NOT NULL,
  `random_answers` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `results_disabled` int(11) NOT NULL,
  `access_condition` longtext COLLATE utf8_unicode_ci,
  `max_attempt` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `feedback_type` int(11) NOT NULL,
  `expired_time` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `propagate_neg` int(11) NOT NULL,
  `review_answers` int(11) NOT NULL,
  `random_by_category` int(11) NOT NULL,
  `text_when_finished` longtext COLLATE utf8_unicode_ci,
  `display_category_name` int(11) NOT NULL,
  `pass_percentage` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz`
--

LOCK TABLES `c_quiz` WRITE;
/*!40000 ALTER TABLE `c_quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_answer`
--

DROP TABLE IF EXISTS `c_quiz_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_answer` (
  `iid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_auto` int(10) unsigned NOT NULL,
  `c_id` int(10) unsigned NOT NULL,
  `id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correct` int(11) DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `ponderation` double NOT NULL,
  `position` int(11) NOT NULL,
  `hotspot_coordinates` longtext COLLATE utf8_unicode_ci,
  `hotspot_type` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destination` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answer_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `c_id` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_answer`
--

LOCK TABLES `c_quiz_answer` WRITE;
/*!40000 ALTER TABLE `c_quiz_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_question`
--

DROP TABLE IF EXISTS `c_quiz_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_question` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `question` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `ponderation` double NOT NULL,
  `position` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `picture` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL,
  `extra` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_question`
--

LOCK TABLES `c_quiz_question` WRITE;
/*!40000 ALTER TABLE `c_quiz_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_question_category`
--

DROP TABLE IF EXISTS `c_quiz_question_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_question_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_question_category`
--

LOCK TABLES `c_quiz_question_category` WRITE;
/*!40000 ALTER TABLE `c_quiz_question_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_question_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_question_option`
--

DROP TABLE IF EXISTS `c_quiz_question_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_question_option` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_question_option`
--

LOCK TABLES `c_quiz_question_option` WRITE;
/*!40000 ALTER TABLE `c_quiz_question_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_question_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_question_rel_category`
--

DROP TABLE IF EXISTS `c_quiz_question_rel_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_question_rel_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_question_rel_category`
--

LOCK TABLES `c_quiz_question_rel_category` WRITE;
/*!40000 ALTER TABLE `c_quiz_question_rel_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_question_rel_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_rel_question`
--

DROP TABLE IF EXISTS `c_quiz_rel_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_rel_question` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `question_order` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `exercice_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `question` (`question_id`),
  KEY `exercice` (`exercice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_rel_question`
--

LOCK TABLES `c_quiz_rel_question` WRITE;
/*!40000 ALTER TABLE `c_quiz_rel_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_rel_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_resource`
--

DROP TABLE IF EXISTS `c_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_resource` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `source_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `resource_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_resource`
--

LOCK TABLES `c_resource` WRITE;
/*!40000 ALTER TABLE `c_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_role`
--

DROP TABLE IF EXISTS `c_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_role` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `role_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role_comment` longtext COLLATE utf8_unicode_ci,
  `default_role` tinyint(1) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_role`
--

LOCK TABLES `c_role` WRITE;
/*!40000 ALTER TABLE `c_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_role_group`
--

DROP TABLE IF EXISTS `c_role_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_role_group` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `scope` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_role_group`
--

LOCK TABLES `c_role_group` WRITE;
/*!40000 ALTER TABLE `c_role_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_role_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_role_permissions`
--

DROP TABLE IF EXISTS `c_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_role_permissions` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `default_perm` tinyint(1) NOT NULL,
  `role_id` int(11) NOT NULL,
  `tool` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_role_permissions`
--

LOCK TABLES `c_role_permissions` WRITE;
/*!40000 ALTER TABLE `c_role_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_role_user`
--

DROP TABLE IF EXISTS `c_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_role_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `scope` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_role_user`
--

LOCK TABLES `c_role_user` WRITE;
/*!40000 ALTER TABLE `c_role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_student_publication`
--

DROP TABLE IF EXISTS `c_student_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_student_publication` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_correction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_correction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `post_group_id` int(11) NOT NULL,
  `sent_date` datetime DEFAULT NULL,
  `filetype` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `has_properties` int(11) NOT NULL,
  `view_properties` tinyint(1) DEFAULT NULL,
  `qualification` double NOT NULL,
  `date_of_qualification` datetime DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `qualificator_id` int(11) NOT NULL,
  `weight` double NOT NULL,
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `allow_text_assignment` int(11) NOT NULL,
  `contains_file` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_student_publication`
--

LOCK TABLES `c_student_publication` WRITE;
/*!40000 ALTER TABLE `c_student_publication` DISABLE KEYS */;
INSERT INTO `c_student_publication` VALUES (1,5,1,'/assignment-1',NULL,'Assignment 1',NULL,'<p align=\"center\"><a name=\"h.70brseg6m6el\"></a>Assignment 1</p>\r\n\r\n<p align=\"center\"><a name=\"h.iarfqp60y399\"></a>Building IT Systems ( CPT 111 / COSC 2635 )<br />\r\nStudy Period 2, 2016</p>\r\n\r\n<div>\r\n<p>&nbsp;</p>\r\n</div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h1><a name=\"h.471biyyoffo\"></a>Overview</h1>\r\n\r\n<ol>\r\n	<li value=\"NaN\">This assignment is <strong>due</strong> on the <strong>26th June 2016, 11:59 PM (UTC +10)</strong>.</li>\r\n	<li value=\"NaN\">Your task is to write a proposal for a project of building a functional prototype of which you will endeavour to complete by Week 12 which is the end of the project timeline.</li>\r\n	<li value=\"NaN\">The project you choose to build should be beyond what you can currently accomplish with your current capabilities; and be worth at least 5 hours per week over the duration of 8 weeks. In a team of 5, as a team that would be 200 hours worth of work in total.</li>\r\n	<li value=\"NaN\">You must work on your assignments and project as a team of 5 persons.<br />\r\n	Any variation to this must be received in writing from the course instructor.</li>\r\n	<li value=\"NaN\">The project you choose must be in one of the following streams :\r\n	<ul>\r\n		<li>Web Application; or</li>\r\n		<li>Mobile Application; or</li>\r\n		<li>Game; or</li>\r\n		<li>a Moonshot IT-centric Project ( should you choose this stream, you are required to discuss this with the instructor, and receive approval in writing to proceed. )</li>\r\n	</ul>\r\n	</li>\r\n	<li value=\"NaN\">Find a project that you feel passionate about. Recommendation is to build a chatbot, or a turn-based app/game. Seek guidance from your mentors for ideas and scope. Discuss with your mentor regarding any variation, and if approval from the instructor is required.</li>\r\n	<li value=\"NaN\">You will be matched with a mentor which will provide you with mentorship, and monitor your progress. Once you have been matched with your mentor, you will be their mentee for the remaining duration of the course. Your team is expected to meet with your mentors at least once a week.</li>\r\n	<li value=\"NaN\">You must have your <strong>projects approved</strong> by your assigned mentors <strong>at least 7 calendar days</strong> prior to your assignment submission due date <strong>to be eligible to submit</strong>. This approval will also formally complete your mentor assignment to your team.</li>\r\n	<li value=\"NaN\">You may collaborate with your team at anytime throughout the week. However, you should synchronously (online at the same time) collaborate with your teammates for at least an hour a week. You should make these arrangements amongst your team members.</li>\r\n	<li value=\"NaN\">This assignment should contain as much detail as possible to convince the assessor that you will be able to execute the project to produce a functional prototype by the end of the project timeline.</li>\r\n	<li value=\"NaN\">Your submission is required to be a truthful, honest and original work produced by your whole team in collaboration.</li>\r\n	<li value=\"NaN\">This assignment must be submitted as a single PDF file, one per group via the corresponding Blackboard Assignment submission link, <strong>and</strong> the correspondingly named Trello card on your team&rsquo;s board.</li>\r\n	<li value=\"NaN\">Your submission file should be named as follows :<br />\r\n	&ldquo; [TeamName]-BITS-A[AssignmentNumber].pdf &rdquo;<br />\r\n	Example : UniversalUnicorns-BITS-A1.pdf</li>\r\n	<li value=\"NaN\">This assignment is worth 5% of your overall marks for this course.<br />\r\n	Your assignment will be marked out of 100, with marks awarded as shown in the {curly braces} below.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h1><a name=\"h.k48jn3saj7cm\"></a>Content Requirements</h1>\r\n\r\n<p>Your project proposal should contain the following contents. The recommended template for this proposal can be found at the URL (<a href=\"https://makebits.xyz/a1-template\">https://makebits.xyz/a1-template</a>). There is no minimum or maximum word/page count for your submission. Use as many words/pages you just need to fulfill the requirements. Use your Trello board to plan these sections before working on the report as most of the content in the Trello sample board will contribute to this report.</p>\r\n\r\n<h2><a name=\"h.rkiqfhhkjxd1\"></a>What</h2>\r\n\r\n<p>This section will describe what your project is about.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Project Name</strong> : { 2 marks }<br />\r\nWhat is the name of your project. This is the name of the product/item you are building. Be descriptive but creative.</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Project Description</strong> : { 5 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">Describe to us what your product would be when completed. Your description should contain enough details that anyone with reasonable technical capability should be able to visualise the outcome product without ambiguity. This section should also identify the type of project this is; a mobile app, web app, a game or something else. It should also contain description of the functionality of the product.</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>The Team : </strong>{ 10 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">List your team with the following information :</p>\r\n\r\n<ul>\r\n	<li>Full Name ( as per your course registration )</li>\r\n	<li>Student Email Address</li>\r\n	<li>Your Locale ( City, Country )</li>\r\n	<li>Background &amp; Passion in IT ( a few sentences )</li>\r\n	<li>What are you good at / What you&rsquo;re interested in ?</li>\r\n	<li>What are your weak-point in the context of the project ?</li>\r\n	<li>What role do you see yourself mainly playing in the team ?</li>\r\n</ul>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Demonstrable Outcomes</strong></p>\r\n\r\n<p style=\"margin-left:36.0pt;\">This section refers to you telling us what the demonstrable outcomes of your project would be. Think of this as functional and nonfunctional requirements that can be measured or demonstrated. If you were to buy your product from the store, what would the box say it would do? Simply list time, and include a measure (question you can ask) that validates the outcome.</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">Example:</p>\r\n\r\n<ol>\r\n	<li value=\"NaN\">A digital clock showing the current time on the app.<br />\r\n	Is a clock showing the current time visible on the app&rsquo;s dashboard page?</li>\r\n</ol>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">Do this in 2 sections;</p>\r\n\r\n<p style=\"margin-left:72.0pt;\"><strong>Minimum Viable Product</strong> : { 10 marks }<br />\r\nthe minimum state of completion to showcase the base features.<br />\r\nList at least 5 features. ( &ldquo;The background will be white&rdquo; is not a feature.)<br />\r\n<br />\r\n<strong>Extended Features</strong> : { 2 marks }<br />\r\nIf time permits, these feature will be implemented. List at least 3.</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Project Motivation</strong> : { 3 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">As a group, why did you choose to build the project you described?</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">What is your motivation? How does it relate to your collective interests?</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Project Justification</strong></p>\r\n\r\n<p style=\"margin-left:36.0pt;\">Provide your justifications as to why as a team you believe this project fulfills the following project criterias :</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:72.0pt;\"><strong>Justified Workload </strong>{ 4 marks }</p>\r\n\r\n<p style=\"margin-left:72.0pt;\">Your project is worth at least 5 hours of work per week for 8 weeks for each member; totaling in 200 hours of work for a group of 5 persons. You can use your project schedule to back your claims.</p>\r\n\r\n<p style=\"margin-left:72.0pt;\"><strong>Beyond Current Capabilities </strong>{ 4 marks }</p>\r\n\r\n<p style=\"margin-left:72.0pt;\">Your project is something that is more than your current capabilities as a team. That this project will be a learning experience for you.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Project Risks </strong>{ 4 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">List at least 2 project specific potential issues that may roadblock your progress. For each identified issue, specify how you would attempt to mitigate the problem.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><a name=\"h.2df7lox8wynh\"></a>How</h2>\r\n\r\n<p>This section will describe how you intend to accomplish building your proposal. This section should be based on the contents of your &ldquo;Pin-Board&rdquo; list in your Trello board.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Resources &amp; Tools </strong>{ 4 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">List the technologies, tools and resources you&#39;re using here with a link to the source. You can also link to relevant documentation. For each tool/resource listed, it should contain; Tool/Resource Name, Short description, Rationale, Specific version (if applicable), Cost, Alternatives (simply name and link to them). See corresponding Trello card for more information</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Collaborative Workspaces </strong>{ 4 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">Think about the tools and resources your team would be using. Where can we find your files ? Put them here with any relevant information so that everyone can find it. List all the workspaces you will be using with their URLs and information on how to access it. (Example workspace : Trello, Google Drive, GitHub, Heroku, Cloud9.) See corresponding Trello card for more information</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Communication Expectations </strong>{ 4 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">This card is an agreement between all team members on communication expectations and responsibilities. This is to reduce misunderstandings and mismatched expectations. List the tools you will be using to communicate with the corresponding expected response frequencies. You should also include description for an action-plan for team members Missing-in-Action. See corresponding Trello card for more information.</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Decision Making Process </strong>{ 4 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">Describe your decision making and dispute resolution process. See corresponding Trello card for more information.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><a name=\"h.jnu3rxa3inxq\"></a>When</h2>\r\n\r\n<p>What happens when? &ldquo;Failing to plan, is planning to fail&rdquo;. List tasks with at least enough granularity, that the assessor can see what each member is accomplishing as a demonstrable outcome every week. List the tasks you need to be completed from Week 4 till Week 13 to deliver your project &amp; final report.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>{ 30 marks }</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Each task in your list/table should contain the following information :</p>\r\n\r\n<ul>\r\n	<li>Task Num/ID</li>\r\n	<li>Descriptive Title</li>\r\n	<li>Demonstrable Outcome</li>\r\n	<li>Start &amp; End by (Date)</li>\r\n	<li>Lead by ( member&rsquo;s name )</li>\r\n	<li>Trello Card URL</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>{ 5 marks awarded for general professionalism }</p>\r\n\r\n<h1><a name=\"h.b0pamtey6m5p\"></a>&nbsp;</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h1><a name=\"h.xhfnlpc3ccxz\"></a>&nbsp;</h1>\r\n\r\n<h1><a name=\"h.ccwc607mbe94\"></a>Submission Requirements</h1>\r\n\r\n<p>Before submission you must have completed the following :</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li value=\"NaN\">Setup Trello : { 5 marks &amp; submission prerequisite }\r\n	<ul>\r\n		<li><a href=\"https://makebits.xyz/join-trello\">Join the RMIT_BITS_2016SP2</a> team on Trello.</li>\r\n		<li>Copy the <a href=\"https://makebits.xyz/template-board\">[Group Template]</a> board.</li>\r\n		<li>Renamed the copied board with your group name.</li>\r\n		<li>Added all your team members to Trello.</li>\r\n		<li>Completed all the tasks in the &ldquo;(!) Getting Started&rdquo; card.</li>\r\n	</ul>\r\n	</li>\r\n	<li value=\"NaN\">Team Registration &amp; Approval\r\n	<ul>\r\n		<li>As a group, roughly think about the type of project you&rsquo;d want to be doing. Then make contact with the corresponding mentor via their thread in the Discussion Board &ldquo;General Lobby&rdquo; forum. Mentor availability is first-come-first-served basis.</li>\r\n		<li>Once you&rsquo;ve made contact, arrange to speak with your mentor about your project ideas and scope. It is recommended you try to work through the Trello prerequisite steps before contacting a mentor, so they can help you should you have any issues.</li>\r\n		<li>Schedule a &ldquo;live chat&rdquo; discussion with your mentor. Work with them until they approve your project. They will have a form to fill when they approve your project idea &amp; formally register your team with them. If you&rsquo;ve chosen to do a Moonshot Project, please contact the instructor before you do so.</li>\r\n	</ul>\r\n	</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Once you&rsquo;ve completed the prerequisites :</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your submission should be a <strong>single PDF file</strong>. Files in any <strong>other formats will be rejected</strong>. You need to create a group on Blackboard reflecting the membership of your group before you submit this assignment. Once this is done, any member of the group can submit (a version of) the assignment.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>There should only be one submission per group, but you can re-submit any number of times before the deadline. In other words, if there are say five people in your group, only one person from the group needs to submit a PDF file, but this file can be re-submitted as many times as you like before the deadline.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Submission must be made on Blackboard and the corresponding Trello card as described in the Overview section of this document to be accepted as a completed submission.</p>\r\n\r\n<p align=\"center\"><a name=\"h.70brseg6m6el\"></a>Assignment 1</p>\r\n\r\n<p align=\"center\"><a name=\"h.iarfqp60y399\"></a>Building IT Systems ( CPT 111 / COSC 2635 )<br />\r\nStudy Period 2, 2016</p>\r\n\r\n<div>\r\n<p>&nbsp;</p>\r\n</div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h1><a name=\"h.471biyyoffo\"></a>Overview</h1>\r\n\r\n<ol>\r\n	<li value=\"NaN\">This assignment is <strong>due</strong> on the <strong>26th June 2016, 11:59 PM (UTC +10)</strong>.</li>\r\n	<li value=\"NaN\">Your task is to write a proposal for a project of building a functional prototype of which you will endeavour to complete by Week 12 which is the end of the project timeline.</li>\r\n	<li value=\"NaN\">The project you choose to build should be beyond what you can currently accomplish with your current capabilities; and be worth at least 5 hours per week over the duration of 8 weeks. In a team of 5, as a team that would be 200 hours worth of work in total.</li>\r\n	<li value=\"NaN\">You must work on your assignments and project as a team of 5 persons.<br />\r\n	Any variation to this must be received in writing from the course instructor.</li>\r\n	<li value=\"NaN\">The project you choose must be in one of the following streams :\r\n	<ul>\r\n		<li>Web Application; or</li>\r\n		<li>Mobile Application; or</li>\r\n		<li>Game; or</li>\r\n		<li>a Moonshot IT-centric Project ( should you choose this stream, you are required to discuss this with the instructor, and receive approval in writing to proceed. )</li>\r\n	</ul>\r\n	</li>\r\n	<li value=\"NaN\">Find a project that you feel passionate about. Recommendation is to build a chatbot, or a turn-based app/game. Seek guidance from your mentors for ideas and scope. Discuss with your mentor regarding any variation, and if approval from the instructor is required.</li>\r\n	<li value=\"NaN\">You will be matched with a mentor which will provide you with mentorship, and monitor your progress. Once you have been matched with your mentor, you will be their mentee for the remaining duration of the course. Your team is expected to meet with your mentors at least once a week.</li>\r\n	<li value=\"NaN\">You must have your <strong>projects approved</strong> by your assigned mentors <strong>at least 7 calendar days</strong> prior to your assignment submission due date <strong>to be eligible to submit</strong>. This approval will also formally complete your mentor assignment to your team.</li>\r\n	<li value=\"NaN\">You may collaborate with your team at anytime throughout the week. However, you should synchronously (online at the same time) collaborate with your teammates for at least an hour a week. You should make these arrangements amongst your team members.</li>\r\n	<li value=\"NaN\">This assignment should contain as much detail as possible to convince the assessor that you will be able to execute the project to produce a functional prototype by the end of the project timeline.</li>\r\n	<li value=\"NaN\">Your submission is required to be a truthful, honest and original work produced by your whole team in collaboration.</li>\r\n	<li value=\"NaN\">This assignment must be submitted as a single PDF file, one per group via the corresponding Blackboard Assignment submission link, <strong>and</strong> the correspondingly named Trello card on your team&rsquo;s board.</li>\r\n	<li value=\"NaN\">Your submission file should be named as follows :<br />\r\n	&ldquo; [TeamName]-BITS-A[AssignmentNumber].pdf &rdquo;<br />\r\n	Example : UniversalUnicorns-BITS-A1.pdf</li>\r\n	<li value=\"NaN\">This assignment is worth 5% of your overall marks for this course.<br />\r\n	Your assignment will be marked out of 100, with marks awarded as shown in the {curly braces} below.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h1><a name=\"h.k48jn3saj7cm\"></a>Content Requirements</h1>\r\n\r\n<p>Your project proposal should contain the following contents. The recommended template for this proposal can be found at the URL (<a href=\"https://makebits.xyz/a1-template\">https://makebits.xyz/a1-template</a>). There is no minimum or maximum word/page count for your submission. Use as many words/pages you just need to fulfill the requirements. Use your Trello board to plan these sections before working on the report as most of the content in the Trello sample board will contribute to this report.</p>\r\n\r\n<h2><a name=\"h.rkiqfhhkjxd1\"></a>What</h2>\r\n\r\n<p>This section will describe what your project is about.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Project Name</strong> : { 2 marks }<br />\r\nWhat is the name of your project. This is the name of the product/item you are building. Be descriptive but creative.</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Project Description</strong> : { 5 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">Describe to us what your product would be when completed. Your description should contain enough details that anyone with reasonable technical capability should be able to visualise the outcome product without ambiguity. This section should also identify the type of project this is; a mobile app, web app, a game or something else. It should also contain description of the functionality of the product.</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>The Team : </strong>{ 10 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">List your team with the following information :</p>\r\n\r\n<ul>\r\n	<li>Full Name ( as per your course registration )</li>\r\n	<li>Student Email Address</li>\r\n	<li>Your Locale ( City, Country )</li>\r\n	<li>Background &amp; Passion in IT ( a few sentences )</li>\r\n	<li>What are you good at / What you&rsquo;re interested in ?</li>\r\n	<li>What are your weak-point in the context of the project ?</li>\r\n	<li>What role do you see yourself mainly playing in the team ?</li>\r\n</ul>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Demonstrable Outcomes</strong></p>\r\n\r\n<p style=\"margin-left:36.0pt;\">This section refers to you telling us what the demonstrable outcomes of your project would be. Think of this as functional and nonfunctional requirements that can be measured or demonstrated. If you were to buy your product from the store, what would the box say it would do? Simply list time, and include a measure (question you can ask) that validates the outcome.</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">Example:</p>\r\n\r\n<ol>\r\n	<li value=\"NaN\">A digital clock showing the current time on the app.<br />\r\n	Is a clock showing the current time visible on the app&rsquo;s dashboard page?</li>\r\n</ol>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">Do this in 2 sections;</p>\r\n\r\n<p style=\"margin-left:72.0pt;\"><strong>Minimum Viable Product</strong> : { 10 marks }<br />\r\nthe minimum state of completion to showcase the base features.<br />\r\nList at least 5 features. ( &ldquo;The background will be white&rdquo; is not a feature.)<br />\r\n<br />\r\n<strong>Extended Features</strong> : { 2 marks }<br />\r\nIf time permits, these feature will be implemented. List at least 3.</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Project Motivation</strong> : { 3 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">As a group, why did you choose to build the project you described?</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">What is your motivation? How does it relate to your collective interests?</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Project Justification</strong></p>\r\n\r\n<p style=\"margin-left:36.0pt;\">Provide your justifications as to why as a team you believe this project fulfills the following project criterias :</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:72.0pt;\"><strong>Justified Workload </strong>{ 4 marks }</p>\r\n\r\n<p style=\"margin-left:72.0pt;\">Your project is worth at least 5 hours of work per week for 8 weeks for each member; totaling in 200 hours of work for a group of 5 persons. You can use your project schedule to back your claims.</p>\r\n\r\n<p style=\"margin-left:72.0pt;\"><strong>Beyond Current Capabilities </strong>{ 4 marks }</p>\r\n\r\n<p style=\"margin-left:72.0pt;\">Your project is something that is more than your current capabilities as a team. That this project will be a learning experience for you.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Project Risks </strong>{ 4 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">List at least 2 project specific potential issues that may roadblock your progress. For each identified issue, specify how you would attempt to mitigate the problem.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><a name=\"h.2df7lox8wynh\"></a>How</h2>\r\n\r\n<p>This section will describe how you intend to accomplish building your proposal. This section should be based on the contents of your &ldquo;Pin-Board&rdquo; list in your Trello board.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Resources &amp; Tools </strong>{ 4 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">List the technologies, tools and resources you&#39;re using here with a link to the source. You can also link to relevant documentation. For each tool/resource listed, it should contain; Tool/Resource Name, Short description, Rationale, Specific version (if applicable), Cost, Alternatives (simply name and link to them). See corresponding Trello card for more information</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Collaborative Workspaces </strong>{ 4 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">Think about the tools and resources your team would be using. Where can we find your files ? Put them here with any relevant information so that everyone can find it. List all the workspaces you will be using with their URLs and information on how to access it. (Example workspace : Trello, Google Drive, GitHub, Heroku, Cloud9.) See corresponding Trello card for more information</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Communication Expectations </strong>{ 4 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">This card is an agreement between all team members on communication expectations and responsibilities. This is to reduce misunderstandings and mismatched expectations. List the tools you will be using to communicate with the corresponding expected response frequencies. You should also include description for an action-plan for team members Missing-in-Action. See corresponding Trello card for more information.</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:36.0pt;\"><strong>Decision Making Process </strong>{ 4 marks }</p>\r\n\r\n<p style=\"margin-left:36.0pt;\">Describe your decision making and dispute resolution process. See corresponding Trello card for more information.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><a name=\"h.jnu3rxa3inxq\"></a>When</h2>\r\n\r\n<p>What happens when? &ldquo;Failing to plan, is planning to fail&rdquo;. List tasks with at least enough granularity, that the assessor can see what each member is accomplishing as a demonstrable outcome every week. List the tasks you need to be completed from Week 4 till Week 13 to deliver your project &amp; final report.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>{ 30 marks }</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Each task in your list/table should contain the following information :</p>\r\n\r\n<ul>\r\n	<li>Task Num/ID</li>\r\n	<li>Descriptive Title</li>\r\n	<li>Demonstrable Outcome</li>\r\n	<li>Start &amp; End by (Date)</li>\r\n	<li>Lead by ( member&rsquo;s name )</li>\r\n	<li>Trello Card URL</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>{ 5 marks awarded for general professionalism }</p>\r\n\r\n<h1><a name=\"h.b0pamtey6m5p\"></a>&nbsp;</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h1><a name=\"h.xhfnlpc3ccxz\"></a>&nbsp;</h1>\r\n\r\n<h1><a name=\"h.ccwc607mbe94\"></a>Submission Requirements</h1>\r\n\r\n<p>Before submission you must have completed the following :</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li value=\"NaN\">Setup Trello : { 5 marks &amp; submission prerequisite }\r\n	<ul>\r\n		<li><a href=\"https://makebits.xyz/join-trello\">Join the RMIT_BITS_2016SP2</a> team on Trello.</li>\r\n		<li>Copy the <a href=\"https://makebits.xyz/template-board\">[Group Template]</a> board.</li>\r\n		<li>Renamed the copied board with your group name.</li>\r\n		<li>Added all your team members to Trello.</li>\r\n		<li>Completed all the tasks in the &ldquo;(!) Getting Started&rdquo; card.</li>\r\n	</ul>\r\n	</li>\r\n	<li value=\"NaN\">Team Registration &amp; Approval\r\n	<ul>\r\n		<li>As a group, roughly think about the type of project you&rsquo;d want to be doing. Then make contact with the corresponding mentor via their thread in the Discussion Board &ldquo;General Lobby&rdquo; forum. Mentor availability is first-come-first-served basis.</li>\r\n		<li>Once you&rsquo;ve made contact, arrange to speak with your mentor about your project ideas and scope. It is recommended you try to work through the Trello prerequisite steps before contacting a mentor, so they can help you should you have any issues.</li>\r\n		<li>Schedule a &ldquo;live chat&rdquo; discussion with your mentor. Work with them until they approve your project. They will have a form to fill when they approve your project idea &amp; formally register your team with them. If you&rsquo;ve chosen to do a Moonshot Project, please contact the instructor before you do so.</li>\r\n	</ul>\r\n	</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Once you&rsquo;ve completed the prerequisites :</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your submission should be a <strong>single PDF file</strong>. Files in any <strong>other formats will be rejected</strong>. You need to create a group on Blackboard reflecting the membership of your group before you submit this assignment. Once this is done, any member of the group can submit (a version of) the assignment.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>There should only be one submission per group, but you can re-submit any number of times before the deadline. In other words, if there are say five people in your group, only one person from the group needs to submit a PDF file, but this file can be re-submitted as many times as you like before the deadline.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Submission must be made on Blackboard and the corresponding Trello card as described in the Overview section of this document to be accepted as a completed submission.</p>\r\n','',1,1,0,'2016-08-03 10:05:35','folder',1,1,100,NULL,0,0,0,0,1,2,0,0),(2,5,2,'/assignment-2',NULL,'Assignment 2',NULL,'<p style=\"text-align: center;\">Assignment 2</p>\r\n\r\n<p style=\"text-align: center;\">Building IT Systems ( CPT 111 / COSC 2635 )</p>\r\n\r\n<p style=\"text-align: center;\">Study Period 2, 2016</p>\r\n\r\n<p>1. This assignment is due on the 24th July 2016, 11:59 PM (UTC +10)</p>\r\n\r\n<p>2. Your task is to write a mid-project status report &amp; review, for the project you have proposed in Assignment 1 (Project Proposal). This report will have several sections, as described in the &ldquo;Content Requirements&rdquo; section below.</p>\r\n\r\n<p>3. At this stage, you should have the design stage of your project completed. You should now have a clear understanding of how your final product can be expected to look. This typically means you should at least have a visual mock-up of your prototype ready. For projects where visual mock-ups aren&rsquo;t the appropriate representation, speak with your mentors for advice on what is required.</p>\r\n\r\n<p>4. You will be required to provide demonstrable evidence of your claimed progress in the project.</p>\r\n\r\n<p>5. The project you choose to build should have been beyond what you can currently accomplish with your current capabilities; and be worth at least 5 hours per week over the duration of 8 weeks. In a team of 5, as a team that would be 200 hours worth of work in total. This means that by Week 8, each person in the group should be able to show for at least 20 hours of work.</p>\r\n\r\n<p>6. You may collaborate with your team at anytime throughout the week. However, you should synchronously (online at the same time) collaborate with your teammates for at least an hour a week. You should make these arrangements amongst your team members.</p>\r\n\r\n<p>7. Every member of the group should contribute an equal and fair amount of work to the project &amp; assignments. Reasonable effort should be made to ensure that every member of the group contributes equally. If despite reasonable efforts, contribution isn&rsquo;t equal, overall marks awarded may be varied based on corresponding effort contributed at the discretion of the assessor.</p>\r\n\r\n<p>8. Your submission is required to be a truthful, honest and original work produced by your whole team in collaboration.</p>\r\n\r\n<p>9. This assignment must be submitted as a single PDF file, one per group via the corresponding Blackboard Assignment submission link, and the correspondingly named Trello card on your team&rsquo;s board. Please retain the Assignment card in the BITS Progression list, and ensure that the said list is in the 2nd position from the left, in your board.</p>\r\n\r\n<p>10. Your submission file should be named as follows : &ldquo; [TeamName]-BITS-A[AssignmentNumber].pdf &rdquo;</p>\r\n\r\n<p>Example : UniversalUnicorns-BITS-A2.pdf</p>\r\n\r\n<p>11. This assignment is worth 15% of your overall marks for this course. Your assignment will be marked out of 100, with marks awarded as shown in the {curly braces} below. Should you earn more than 100 marks, it will be capped to 100.</p>\r\n\r\n<p>Content Requirements</p>\r\n\r\n<p>Your project proposal should contain the following contents. There is no minimum or maximum word/page count for your submission. Use as many words or pages you just need to fulfill the requirements.</p>\r\n\r\n<p>Project Background { 20 marks }</p>\r\n\r\n<p>This section will describe what your project is about. This should be relatively similar to your Assignment 1 submission but there are crucial differences, Should this have changed since then, this is your opportunity clarify and improve on them.</p>\r\n\r\n<p>Project Name​: { 1 marks }</p>\r\n\r\n<p>What is the name of your project. This is the name of the product/item you are building. Be descriptive but creative.</p>\r\n\r\n<p>Project Description​: { 2 marks }</p>\r\n\r\n<p>Describe to us what your product would be when completed. Your description should contain enough details that anyone with reasonable technical capability should be able to visualise the outcome product without ambiguity. This section should also identify the type of project this is; a mobile app, web app, a game or something else. It should also contain description of the functionality of the product.</p>\r\n\r\n<p>The Team : ​{ 5 marks }</p>\r\n\r\n<p>List your team with the following information :</p>\r\n\r\n<p>● Full Name ( as per your course registration )</p>\r\n\r\n<p>● Student Email Address</p>\r\n\r\n<p>● What role did you end up playing in the team ?</p>\r\n\r\n<p>Demonstrable Outcomes</p>\r\n\r\n<p>This section refers to you telling us what the demonstrable outcomes of your project would be. Think of this as functional and nonfunctional requirements that can be measured or demonstrated. If you were to buy your product from the store, what would the box say it would do? Simply list time, and include a measure (question you can ask) that validates the outcome.</p>\r\n\r\n<p>1. A digital clock showing the current time on the app. Is a clock showing the current time visible on the app&rsquo;s dashboard page?</p>\r\n\r\n<p>Do this in 2 sections;</p>\r\n\r\n<p>Minimum Viable Product​: { 10 marks }</p>\r\n\r\n<p>the minimum state of completion to showcase the base features. List at least 5 features. ( &ldquo;The background will be white&rdquo; is not a feature. &ldquo;Users will be able to login with their own username and password&rdquo; is.)</p>\r\n\r\n<p>Extended Features​: { 2 marks }</p>\r\n\r\n<p>If time permits, these feature will be implemented. List at least 2.</p>\r\n\r\n<p>Project Mockup { 20 marks }</p>\r\n\r\n<p>In the previous section, you provided a textual description on what we can expect from your project. Now that you&rsquo;ve begun the journey to build, at this stage, you should have a clear understanding of what your project will look like</p>\r\n\r\n<p>at the end. Now you need to convey this vision to us. Build a mockup, using visualisation tools, such as LucidCharts, Axure, Sketch, Adobe Photoshop or even simply Microsoft Powerpoint. These mockups should be interactive. As an example, if you are building a login screen for your app, clicking the &ldquo;LOGIN&rdquo; button, should change screens to the default, post-login screen. This can be done directly in Lucidchart or Microsoft Powerpoint, and exported as a PDF. Alternatively, using any graphics or mockup tool to build your screens, then use InVision App, to build the interaction, and then export your prototype mockup as a PDF. Your mockups should at least show how the Minimum Viable Product features you&rsquo;ve listed should work. Use this section of the report, to provide description of your mockup, and link to the Interactive Mockup PDF file. It is recommended that you upload that PDF to a corresponding Trello card, and drop the attachment link below.</p>\r\n\r\n<p>If building an interactive mockup isn&rsquo;t applicable to your project. It is very likely that there are similar approaches to show visually, the expected outcomes of your project as described by your Minimum Viable Product.</p>\r\n\r\n<p>Eg. 1: Building a text-based application.</p>\r\n\r\n<p>You will be expected to provide example inputs and outputs for your</p>\r\n\r\n<p>Eg. 2: Building a side-scrolling game.</p>\r\n\r\n<p>You would be able to produce storyboards, game UI screens, and game If an interactive mockup doesn&rsquo;t apply to your project, simply use this section in this report, attach inline, your artefacts. Contextually describe and explain how each item fits in your project. Please seek clarification from your mentor as to what would be expected for your project. { up to 4 marks for coverage of each feature described in the MVP. }</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Project Progress { 27 marks }</p>\r\n\r\n<p>In the Assignment 1, we asked you for a schedule of your project. Let&rsquo;s see how far have we done thus far. All items in this section should have a correspondingly titled Trello card of which can be explored for more information. This shouldn&rsquo;t be too much work, since you were required to create these cards as part of your Assignment 1. At this stage, you would have noticed that you&rsquo;ve created more task cards than you initially conceived during your planning in assignment 1. Simply add them to the list below, and if there were cards that are now defunct, just leave them out. The title should be hyperlinked to its corresponding Trello card. This is the link that is shown in your browser&rsquo;s address bar, when the card is opened. Please ensure that your titles are descriptive of the content.To gain full marks, it is crucial at minimum, that your list provides sufficient information to show what each person has been/is doing each week, and with work (and corresponding artefacts) in the linked Trello cards that is able justify the time claimed.</p>\r\n\r\n<p>Title Planned</p>\r\n\r\n<p>Completed</p>\r\n\r\n<p>[Create landing page mockup in</p>\r\n\r\n<p>[Create landing page mockup in</p>\r\n\r\n<p>Due</p>\r\n\r\n<p>[2/7] [1/7] [Dennis</p>\r\n\r\n<p>[2/7] [1/7] [Dennis</p>\r\n\r\n<p>The Summary { 2 marks }</p>\r\n\r\n<p>List for each person, the total number of hours each person has spent on the project since week 5 - 8 (inclusive of 5 &amp; 8).</p>\r\n\r\n<p>Dennis Ritchie : 20 hours</p>\r\n\r\n<p>Reflection &amp; Learnings { 30 marks }</p>\r\n\r\n<p>You were required to attempt a project that was beyond your current ability; one that should have stretched your skills in some way. It is difficult to see how you would have learnt much from a project within your comfort zone. This section you will be reflecting on the challenges you have faced, how you have addressed them, and what you&rsquo;ve learnt from it.</p>\r\n\r\n<p>The Project { 20 marks }</p>\r\n\r\n<p>For the &ldquo;The Project&rdquo; subsection, give your responses individually, and then summarily as a group. You may respond to the questions in a Q&amp;A form, or as paragraph narratives with titled sections.</p>\r\n\r\n<p>1. The Climb</p>\r\n\r\n<p>a. How challenging has it been so far?</p>\r\n\r\n<p>b. What have you found easy?</p>\r\n\r\n<p>c. What have you found difficult? Was this what you</p>\r\n\r\n<p>d. In what ways have you been stretched?</p>\r\n\r\n<p>e. In hindsight, what would you have done differently?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>2. The Roadblocks</p>\r\n\r\n<p>a. What obstacles or roadblocks have you faced?</p>\r\n\r\n<p>b. What have you done to address these?</p>\r\n\r\n<p>c. Have these been overcome? If so, how how, else, why not?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>3. The Destination</p>\r\n\r\n<p>a. Has your goal changed since assignment 1? If so, how, else, expected? how can it be improved?</p>\r\n\r\n<p>b. What have you learnt about your goal? What is now clearer to you than when you first begun this project?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>4. The Journey</p>\r\n\r\n<p>a. Has your plans changed since assignment 1? If so, how, else, how can it be improved? (Note that you plans can change in more ways that just the schedule; such as your roles and/or changing, or reacting to unanticipated events/roadblocks.)</p>\r\n\r\n<p>b. Have things turned out as you expected? Explain.</p>\r\n\r\n<p>c. Has your schedule been realistic? Why/Why not? How can it be improved?</p>\r\n\r\n<p>d. What would you do differently if you had your time over again?</p>\r\n\r\n<p>e. Has your role in the team changed from when it was initially conceived ? If so, why ? Is the current role appropriate?</p>\r\n\r\n<p>If not, should it have changed? Why/why not?</p>\r\n\r\n<p>f. Looking forward, what changes will you make to your project plans based on your reflections ?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>5. The Lessons</p>\r\n\r\n<p>a. What have you learned?</p>\r\n\r\n<p>b. Have you developed any new skills or new experiences?</p>\r\n\r\n<p>Explain.</p>\r\n\r\n<p>c. What things that didn&rsquo;t work out for you/dead-ends have you encountered during your project? What did you learn from it? Describe a few.</p>\r\n\r\n<p>d. What successes have you had during the project? What did you do to achieve it ?</p>\r\n\r\n<p>e. What advice would you give to a group about to embark on a similar project?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The Processes &amp; Collaboration Mechanics { 10 marks }</p>\r\n\r\n<p>1. Collaborative Workspaces :</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>a. Tell us what you used to collaborate on your project, and report</p>\r\n\r\n<p>b. Tell us how you used it.</p>\r\n\r\n<p>c. Tell us what are the benefits, and challenges for the said tool.</p>\r\n\r\n<p>d. If you had a do-over, what would you have done differently.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>2. Communication Expectations :</p>\r\n\r\n<p>a. Tell us, what channels/mediums you ended up using for your report.</p>\r\n\r\n<p>b. Tell us, how you typically used that medium/channel in question</p>\r\n\r\n<p>c. Tell us what are the benefits, and challenges for the said</p>\r\n\r\n<p>d. If you had a do-over, what would you have done differently.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>3. Decision Making Process :</p>\r\n\r\n<p>a. Describe to us what your decision making process flow is like</p>\r\n\r\n<p>b. Has this helped with your decision making and</p>\r\n\r\n<p>c. Tell us, what worked well with your decision making</p>\r\n\r\n<p>d. If you had a do-over, what would you have done differently.</p>\r\n\r\n<p>{ 5 bonus marks awarded for general professionalism }</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Submission Requirements</p>\r\n\r\n<p>Before submission you must have completed the following :</p>\r\n\r\n<p>1. To be eligible for submission of this assignment to be assessed, you are required to;</p>\r\n\r\n<p>a. Be in an approved team, of which you are registered to; and</p>\r\n\r\n<p>b. Have a mentor with whom your team has been making regular contact with; and</p>\r\n\r\n<p>c. Have submitted a project proposal (Assignment 1) to the teaching team.</p>\r\n\r\n<p>d. Have an active Trello board that is &ldquo;Team Visible&rdquo; to the &ldquo;RMIT_BITS_2016SP2&rdquo; team.</p>\r\n\r\n<p>For most of you, these requirements should have been fulfilled. Otherwise, you will need to contact the instructor at least 14 calendar days prior to the submission deadline for further instruction.</p>\r\n\r\n<p>Once you&rsquo;ve completed the prerequisites :</p>\r\n\r\n<p>Your submission should be a single PDF file​. Files in any other formats will be rejected​. You need to create a group on Blackboard reflecting the membership of your group before you submit this assignment. Once this is done, any member of the group can submit (a version of) the assignment. There should only be one submission per group, but you can re-submit any number of times before the deadline. In other words, if there are say five people in your group, only one person from the group needs to submit a PDF file, but this file can be re-submitted as many times as you like by any member of your group before the deadline.</p>\r\n\r\n<p>Submission must be made on Blackboard and the corresponding Trello card as described in the Overview section of this document to be accepted as a completed submission.</p>\r\n','',1,1,0,'2016-08-03 10:22:51','folder',2,1,100,NULL,0,0,0,0,1,2,0,0),(3,5,3,'work/assignment-1/79a6ccf4894ffdb180108fdef0b68186',NULL,'B-SharpsAssignment1.docx',NULL,NULL,NULL,1,1,0,'2016-08-03 10:30:48','file',0,NULL,0,NULL,1,0,0,0,1,0,1,0);
/*!40000 ALTER TABLE `c_student_publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_student_publication_assignment`
--

DROP TABLE IF EXISTS `c_student_publication_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_student_publication_assignment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `expires_on` datetime DEFAULT NULL,
  `ends_on` datetime DEFAULT NULL,
  `add_to_calendar` tinyint(1) NOT NULL,
  `enable_qualification` tinyint(1) NOT NULL,
  `publication_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_student_publication_assignment`
--

LOCK TABLES `c_student_publication_assignment` WRITE;
/*!40000 ALTER TABLE `c_student_publication_assignment` DISABLE KEYS */;
INSERT INTO `c_student_publication_assignment` VALUES (1,5,1,'2016-08-14 13:59:00','2016-08-21 13:59:00',3,1,1),(2,5,2,'2016-09-04 13:59:00','2016-09-11 13:59:00',4,1,2);
/*!40000 ALTER TABLE `c_student_publication_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_student_publication_comment`
--

DROP TABLE IF EXISTS `c_student_publication_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_student_publication_comment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `work_id` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `sent_at` datetime NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`),
  KEY `work` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_student_publication_comment`
--

LOCK TABLES `c_student_publication_comment` WRITE;
/*!40000 ALTER TABLE `c_student_publication_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_student_publication_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_student_publication_rel_document`
--

DROP TABLE IF EXISTS `c_student_publication_rel_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_student_publication_rel_document` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `work_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `work` (`work_id`),
  KEY `document` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_student_publication_rel_document`
--

LOCK TABLES `c_student_publication_rel_document` WRITE;
/*!40000 ALTER TABLE `c_student_publication_rel_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_student_publication_rel_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_student_publication_rel_user`
--

DROP TABLE IF EXISTS `c_student_publication_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_student_publication_rel_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `work_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `work` (`work_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_student_publication_rel_user`
--

LOCK TABLES `c_student_publication_rel_user` WRITE;
/*!40000 ALTER TABLE `c_student_publication_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_student_publication_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey`
--

DROP TABLE IF EXISTS `c_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `subtitle` longtext COLLATE utf8_unicode_ci,
  `author` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avail_from` date DEFAULT NULL,
  `avail_till` date DEFAULT NULL,
  `is_shared` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `surveythanks` longtext COLLATE utf8_unicode_ci,
  `creation_date` datetime NOT NULL,
  `invited` int(11) NOT NULL,
  `answered` int(11) NOT NULL,
  `invite_mail` longtext COLLATE utf8_unicode_ci NOT NULL,
  `reminder_mail` longtext COLLATE utf8_unicode_ci NOT NULL,
  `mail_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anonymous` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `access_condition` longtext COLLATE utf8_unicode_ci,
  `shuffle` tinyint(1) NOT NULL,
  `one_question_per_page` tinyint(1) NOT NULL,
  `survey_version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `survey_type` int(11) NOT NULL,
  `show_form_profile` int(11) NOT NULL,
  `form_fields` longtext COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) NOT NULL,
  `visible_results` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey`
--

LOCK TABLES `c_survey` WRITE;
/*!40000 ALTER TABLE `c_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey_answer`
--

DROP TABLE IF EXISTS `c_survey_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey_answer` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  `user` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey_answer`
--

LOCK TABLES `c_survey_answer` WRITE;
/*!40000 ALTER TABLE `c_survey_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey_group`
--

DROP TABLE IF EXISTS `c_survey_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey_group` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `survey_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey_group`
--

LOCK TABLES `c_survey_group` WRITE;
/*!40000 ALTER TABLE `c_survey_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey_invitation`
--

DROP TABLE IF EXISTS `c_survey_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey_invitation` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `survey_invitation_id` int(11) NOT NULL,
  `survey_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `invitation_code` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `invitation_date` datetime NOT NULL,
  `reminder_date` datetime NOT NULL,
  `answered` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey_invitation`
--

LOCK TABLES `c_survey_invitation` WRITE;
/*!40000 ALTER TABLE `c_survey_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey_question`
--

DROP TABLE IF EXISTS `c_survey_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey_question` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `survey_question` longtext COLLATE utf8_unicode_ci NOT NULL,
  `survey_question_comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `display` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `shared_question_id` int(11) DEFAULT NULL,
  `max_value` int(11) DEFAULT NULL,
  `survey_group_pri` int(11) NOT NULL,
  `survey_group_sec1` int(11) NOT NULL,
  `survey_group_sec2` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey_question`
--

LOCK TABLES `c_survey_question` WRITE;
/*!40000 ALTER TABLE `c_survey_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey_question_option`
--

DROP TABLE IF EXISTS `c_survey_question_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey_question_option` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `question_option_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `option_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey_question_option`
--

LOCK TABLES `c_survey_question_option` WRITE;
/*!40000 ALTER TABLE `c_survey_question_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey_question_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_thematic`
--

DROP TABLE IF EXISTS `c_thematic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_thematic` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `display_order` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `active` (`active`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_thematic`
--

LOCK TABLES `c_thematic` WRITE;
/*!40000 ALTER TABLE `c_thematic` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_thematic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_thematic_advance`
--

DROP TABLE IF EXISTS `c_thematic_advance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_thematic_advance` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `thematic_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `start_date` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `done_advance` tinyint(1) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `IDX_62798E9754177093` (`room_id`),
  KEY `course` (`c_id`),
  KEY `thematic_id` (`thematic_id`),
  CONSTRAINT `FK_62798E9754177093` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_thematic_advance`
--

LOCK TABLES `c_thematic_advance` WRITE;
/*!40000 ALTER TABLE `c_thematic_advance` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_thematic_advance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_thematic_plan`
--

DROP TABLE IF EXISTS `c_thematic_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_thematic_plan` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `thematic_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `description_type` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `thematic_id` (`thematic_id`,`description_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_thematic_plan`
--

LOCK TABLES `c_thematic_plan` WRITE;
/*!40000 ALTER TABLE `c_thematic_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_thematic_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_tool`
--

DROP TABLE IF EXISTS `c_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_tool` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility` tinyint(1) DEFAULT NULL,
  `admin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added_tool` tinyint(1) DEFAULT NULL,
  `target` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'authoring',
  `session_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `custom_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_tool`
--

LOCK TABLES `c_tool` WRITE;
/*!40000 ALTER TABLE `c_tool` DISABLE KEYS */;
INSERT INTO `c_tool` VALUES (1,1,1,'course_description','course_description/','info.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(2,2,1,'calendar_event','calendar/agenda.php','agenda.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(3,3,1,'document','document/document.php','folder_document.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(4,4,1,'learnpath','newscorm/lp_controller.php','scorms.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(5,5,1,'link','link/link.php','links.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(6,6,1,'quiz','exercice/exercice.php','quiz.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(7,7,1,'announcement','announcements/announcements.php','valves.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(8,8,1,'forum','forum/index.php','forum.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(9,9,1,'dropbox','dropbox/index.php','dropbox.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(10,10,1,'user','user/user.php','members.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(11,11,1,'group','group/group.php','group.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(12,12,1,'chat','chat/chat.php','chat.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(13,13,1,'student_publication','work/work.php','works.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(14,14,1,'survey','survey/survey_list.php','survey.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(15,15,1,'wiki','wiki/index.php','wiki.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(16,16,1,'gradebook','gradebook/index.php','gradebook.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(17,17,1,'glossary','glossary/index.php','glossary.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(18,18,1,'notebook','notebook/index.php','notebook.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(19,19,1,'attendance','attendance/index.php','attendance.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(20,20,1,'course_progress','course_progress/index.php','course_progress.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(21,24,1,'blog_management','blog/blog_admin.php','blog_admin.gif',0,'1','squaregrey.gif',0,'_self','admin',0,NULL,NULL),(22,25,1,'tracking','tracking/courseLog.php','statistics.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(23,26,1,'course_setting','course_info/infocours.php','reference.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(24,27,1,'course_maintenance','course_info/maintenance.php','backup.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(26,1,2,'course_description','course_description/','info.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(27,2,2,'calendar_event','calendar/agenda.php','agenda.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(28,3,2,'document','document/document.php','folder_document.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(29,4,2,'learnpath','newscorm/lp_controller.php','scorms.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(30,5,2,'link','link/link.php','links.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(31,6,2,'quiz','exercice/exercice.php','quiz.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(32,7,2,'announcement','announcements/announcements.php','valves.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(33,8,2,'forum','forum/index.php','forum.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(34,9,2,'dropbox','dropbox/index.php','dropbox.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(35,10,2,'user','user/user.php','members.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(36,11,2,'group','group/group.php','group.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(37,12,2,'chat','chat/chat.php','chat.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(38,13,2,'student_publication','work/work.php','works.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(39,14,2,'survey','survey/survey_list.php','survey.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(40,15,2,'wiki','wiki/index.php','wiki.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(41,16,2,'gradebook','gradebook/index.php','gradebook.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(42,17,2,'glossary','glossary/index.php','glossary.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(43,18,2,'notebook','notebook/index.php','notebook.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(44,19,2,'attendance','attendance/index.php','attendance.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(45,20,2,'course_progress','course_progress/index.php','course_progress.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(46,24,2,'blog_management','blog/blog_admin.php','blog_admin.gif',0,'1','squaregrey.gif',0,'_self','admin',0,NULL,NULL),(47,25,2,'tracking','tracking/courseLog.php','statistics.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(48,26,2,'course_setting','course_info/infocours.php','reference.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(49,27,2,'course_maintenance','course_info/maintenance.php','backup.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(55,28,1,'bbb','bbb/start.php','bbb.png',1,'0','squaregrey.gif',0,'_self','plugin',0,NULL,NULL),(56,28,2,'bbb','bbb/start.php','bbb.png',1,'0','squaregrey.gif',0,'_self','plugin',0,NULL,NULL),(57,1,3,'course_description','course_description/','info.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(58,2,3,'calendar_event','calendar/agenda.php','agenda.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(59,3,3,'document','document/document.php','folder_document.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(60,4,3,'learnpath','newscorm/lp_controller.php','scorms.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(61,5,3,'link','link/link.php','links.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(62,6,3,'quiz','exercice/exercice.php','quiz.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(63,7,3,'announcement','announcements/announcements.php','valves.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(64,8,3,'forum','forum/index.php','forum.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(65,9,3,'dropbox','dropbox/index.php','dropbox.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(66,10,3,'user','user/user.php','members.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(67,11,3,'group','group/group.php','group.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(68,12,3,'chat','chat/chat.php','chat.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(69,13,3,'student_publication','work/work.php','works.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(70,14,3,'survey','survey/survey_list.php','survey.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(71,15,3,'wiki','wiki/index.php','wiki.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(72,16,3,'gradebook','gradebook/index.php','gradebook.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(73,17,3,'glossary','glossary/index.php','glossary.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(74,18,3,'notebook','notebook/index.php','notebook.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(75,19,3,'attendance','attendance/index.php','attendance.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(76,20,3,'course_progress','course_progress/index.php','course_progress.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(77,24,3,'blog_management','blog/blog_admin.php','blog_admin.gif',0,'1','squaregrey.gif',0,'_self','admin',0,NULL,NULL),(78,25,3,'tracking','tracking/courseLog.php','statistics.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(79,26,3,'course_setting','course_info/infocours.php','reference.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(80,27,3,'course_maintenance','course_info/maintenance.php','backup.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(81,28,3,'bbb','bbb/start.php','bbb.png',1,'0','squaregrey.gif',0,'_self','plugin',0,NULL,NULL),(82,1,4,'course_description','course_description/','info.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(83,2,4,'calendar_event','calendar/agenda.php','agenda.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(84,3,4,'document','document/document.php','folder_document.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(85,4,4,'learnpath','newscorm/lp_controller.php','scorms.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(86,5,4,'link','link/link.php','links.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(87,6,4,'quiz','exercice/exercice.php','quiz.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(88,7,4,'announcement','announcements/announcements.php','valves.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(89,8,4,'forum','forum/index.php','forum.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(90,9,4,'dropbox','dropbox/index.php','dropbox.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(91,10,4,'user','user/user.php','members.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(92,11,4,'group','group/group.php','group.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(93,12,4,'chat','chat/chat.php','chat.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(94,13,4,'student_publication','work/work.php','works.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(95,14,4,'survey','survey/survey_list.php','survey.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(96,15,4,'wiki','wiki/index.php','wiki.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(97,16,4,'gradebook','gradebook/index.php','gradebook.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(98,17,4,'glossary','glossary/index.php','glossary.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(99,18,4,'notebook','notebook/index.php','notebook.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(100,19,4,'attendance','attendance/index.php','attendance.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(101,20,4,'course_progress','course_progress/index.php','course_progress.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(102,24,4,'blog_management','blog/blog_admin.php','blog_admin.gif',0,'1','squaregrey.gif',0,'_self','admin',0,NULL,NULL),(103,25,4,'tracking','tracking/courseLog.php','statistics.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(104,26,4,'course_setting','course_info/infocours.php','reference.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(105,27,4,'course_maintenance','course_info/maintenance.php','backup.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(106,28,4,'bbb','bbb/start.php','bbb.png',1,'0','squaregrey.gif',0,'_self','plugin',0,NULL,NULL),(107,1,5,'course_description','course_description/','info.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(108,2,5,'calendar_event','calendar/agenda.php','agenda.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(109,3,5,'document','document/document.php','folder_document.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(110,4,5,'learnpath','newscorm/lp_controller.php','scorms.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(111,5,5,'link','link/link.php','links.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(112,6,5,'quiz','exercice/exercice.php','quiz.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(113,7,5,'announcement','announcements/announcements.php','valves.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(114,8,5,'forum','forum/index.php','forum.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(115,9,5,'dropbox','dropbox/index.php','dropbox.gif',0,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(116,10,5,'user','user/user.php','members.gif',0,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(117,11,5,'group','group/group.php','group.gif',0,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(118,12,5,'chat','chat/chat.php','chat.gif',0,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(119,13,5,'student_publication','work/work.php','works.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(120,14,5,'survey','survey/survey_list.php','survey.gif',0,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(121,15,5,'wiki','wiki/index.php','wiki.gif',0,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(122,16,5,'gradebook','gradebook/index.php','gradebook.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(123,17,5,'glossary','glossary/index.php','glossary.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(124,18,5,'notebook','notebook/index.php','notebook.gif',0,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(125,19,5,'attendance','attendance/index.php','attendance.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(126,20,5,'course_progress','course_progress/index.php','course_progress.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(127,23,5,'search','search/','info.gif',0,'0','search.gif',0,'_self','authoring',0,NULL,NULL),(128,24,5,'blog_management','blog/blog_admin.php','blog_admin.gif',0,'1','squaregrey.gif',0,'_self','admin',0,NULL,NULL),(129,25,5,'tracking','tracking/courseLog.php','statistics.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(130,26,5,'course_setting','course_info/infocours.php','reference.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(131,27,5,'course_maintenance','course_info/maintenance.php','backup.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(132,28,5,'bbb','bbb/start.php','bbb.png',1,'0','squaregrey.gif',0,'_self','plugin',0,NULL,NULL),(133,1,6,'course_description','course_description/','info.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(134,2,6,'calendar_event','calendar/agenda.php','agenda.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(135,3,6,'document','document/document.php','folder_document.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(136,4,6,'learnpath','newscorm/lp_controller.php','scorms.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(137,5,6,'link','link/link.php','links.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(138,6,6,'quiz','exercice/exercice.php','quiz.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(139,7,6,'announcement','announcements/announcements.php','valves.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(140,8,6,'forum','forum/index.php','forum.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(141,9,6,'dropbox','dropbox/index.php','dropbox.gif',0,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(142,10,6,'user','user/user.php','members.gif',0,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(143,11,6,'group','group/group.php','group.gif',0,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(144,12,6,'chat','chat/chat.php','chat.gif',0,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(145,13,6,'student_publication','work/work.php','works.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(146,14,6,'survey','survey/survey_list.php','survey.gif',0,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(147,15,6,'wiki','wiki/index.php','wiki.gif',0,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(148,16,6,'gradebook','gradebook/index.php','gradebook.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(149,17,6,'glossary','glossary/index.php','glossary.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(150,18,6,'notebook','notebook/index.php','notebook.gif',0,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(151,19,6,'attendance','attendance/index.php','attendance.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(152,20,6,'course_progress','course_progress/index.php','course_progress.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(153,23,6,'search','search/','info.gif',0,'0','search.gif',0,'_self','authoring',0,NULL,NULL),(154,24,6,'blog_management','blog/blog_admin.php','blog_admin.gif',0,'1','squaregrey.gif',0,'_self','admin',0,NULL,NULL),(155,25,6,'tracking','tracking/courseLog.php','statistics.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(156,26,6,'course_setting','course_info/infocours.php','reference.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(157,27,6,'course_maintenance','course_info/maintenance.php','backup.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(158,28,6,'bbb','bbb/start.php','bbb.png',1,'0','squaregrey.gif',0,'_self','plugin',0,NULL,NULL),(159,1,7,'course_description','course_description/','info.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(160,2,7,'calendar_event','calendar/agenda.php','agenda.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(161,3,7,'document','document/document.php','folder_document.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(162,4,7,'learnpath','newscorm/lp_controller.php','scorms.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(163,5,7,'link','link/link.php','links.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(164,6,7,'quiz','exercice/exercice.php','quiz.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(165,7,7,'announcement','announcements/announcements.php','valves.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(166,8,7,'forum','forum/index.php','forum.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(167,9,7,'dropbox','dropbox/index.php','dropbox.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(168,10,7,'user','user/user.php','members.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(169,11,7,'group','group/group.php','group.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(170,12,7,'chat','chat/chat.php','chat.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(171,13,7,'student_publication','work/work.php','works.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(172,14,7,'survey','survey/survey_list.php','survey.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(173,15,7,'wiki','wiki/index.php','wiki.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(174,16,7,'gradebook','gradebook/index.php','gradebook.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(175,17,7,'glossary','glossary/index.php','glossary.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(176,18,7,'notebook','notebook/index.php','notebook.gif',1,'0','squaregrey.gif',0,'_self','interaction',0,NULL,NULL),(177,19,7,'attendance','attendance/index.php','attendance.gif',0,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(178,20,7,'course_progress','course_progress/index.php','course_progress.gif',1,'0','squaregrey.gif',0,'_self','authoring',0,NULL,NULL),(179,23,7,'search','search/','info.gif',0,'0','search.gif',0,'_self','authoring',0,NULL,NULL),(180,24,7,'blog_management','blog/blog_admin.php','blog_admin.gif',0,'1','squaregrey.gif',0,'_self','admin',0,NULL,NULL),(181,25,7,'tracking','tracking/courseLog.php','statistics.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(182,26,7,'course_setting','course_info/infocours.php','reference.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(183,27,7,'course_maintenance','course_info/maintenance.php','backup.gif',0,'1','',0,'_self','admin',0,NULL,NULL),(184,28,7,'bbb','bbb/start.php','bbb.png',1,'0','squaregrey.gif',0,'_self','plugin',0,NULL,NULL);
/*!40000 ALTER TABLE `c_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_tool_intro`
--

DROP TABLE IF EXISTS `c_tool_intro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_tool_intro` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_tool_intro`
--

LOCK TABLES `c_tool_intro` WRITE;
/*!40000 ALTER TABLE `c_tool_intro` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_tool_intro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_userinfo_content`
--

DROP TABLE IF EXISTS `c_userinfo_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_userinfo_content` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `definition_id` int(11) NOT NULL,
  `editor_ip` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `edition_time` datetime DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_userinfo_content`
--

LOCK TABLES `c_userinfo_content` WRITE;
/*!40000 ALTER TABLE `c_userinfo_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_userinfo_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_userinfo_def`
--

DROP TABLE IF EXISTS `c_userinfo_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_userinfo_def` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `line_count` tinyint(1) NOT NULL,
  `rank` tinyint(1) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_userinfo_def`
--

LOCK TABLES `c_userinfo_def` WRITE;
/*!40000 ALTER TABLE `c_userinfo_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_userinfo_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_wiki`
--

DROP TABLE IF EXISTS `c_wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_wiki` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `reflink` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `dtime` datetime NOT NULL,
  `addlock` int(11) NOT NULL,
  `editlock` int(11) NOT NULL,
  `visibility` int(11) NOT NULL,
  `addlock_disc` int(11) NOT NULL,
  `visibility_disc` int(11) NOT NULL,
  `ratinglock_disc` int(11) NOT NULL,
  `assignment` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `progress` longtext COLLATE utf8_unicode_ci NOT NULL,
  `score` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `is_editing` int(11) NOT NULL,
  `time_edit` datetime NOT NULL,
  `hits` int(11) DEFAULT NULL,
  `linksto` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tag` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `reflink` (`reflink`),
  KEY `group_id` (`group_id`),
  KEY `page_id` (`page_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_wiki`
--

LOCK TABLES `c_wiki` WRITE;
/*!40000 ALTER TABLE `c_wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_wiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_wiki_conf`
--

DROP TABLE IF EXISTS `c_wiki_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_wiki_conf` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `task` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedback1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedback2` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedback3` longtext COLLATE utf8_unicode_ci NOT NULL,
  `fprogress1` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `fprogress2` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `fprogress3` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `max_size` int(11) DEFAULT NULL,
  `max_text` int(11) DEFAULT NULL,
  `max_version` int(11) DEFAULT NULL,
  `startdate_assig` datetime NOT NULL,
  `enddate_assig` datetime NOT NULL,
  `delayedsubmit` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_wiki_conf`
--

LOCK TABLES `c_wiki_conf` WRITE;
/*!40000 ALTER TABLE `c_wiki_conf` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_wiki_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_wiki_discuss`
--

DROP TABLE IF EXISTS `c_wiki_discuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_wiki_discuss` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `publication_id` int(11) NOT NULL,
  `userc_id` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `p_score` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dtime` datetime NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_wiki_discuss`
--

LOCK TABLES `c_wiki_discuss` WRITE;
/*!40000 ALTER TABLE `c_wiki_discuss` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_wiki_discuss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_wiki_mailcue`
--

DROP TABLE IF EXISTS `c_wiki_mailcue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_wiki_mailcue` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`),
  KEY `c_id` (`c_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_wiki_mailcue`
--

LOCK TABLES `c_wiki_mailcue` WRITE;
/*!40000 ALTER TABLE `c_wiki_mailcue` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_wiki_mailcue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `career`
--

DROP TABLE IF EXISTS `career`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `career` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `career`
--

LOCK TABLES `career` WRITE;
/*!40000 ALTER TABLE `career` DISABLE KEYS */;
/*!40000 ALTER TABLE `career` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sent` datetime NOT NULL,
  `recd` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_chat_to_user` (`to_user`),
  KEY `idx_chat_from_user` (`from_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_video`
--

DROP TABLE IF EXISTS `chat_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` int(11) NOT NULL,
  `to_user` int(11) NOT NULL,
  `room_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_chat_video_to_user` (`to_user`),
  KEY `idx_chat_video_from_user` (`from_user`),
  KEY `idx_chat_video_users` (`from_user`,`to_user`),
  KEY `idx_chat_video_room_name` (`room_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_video`
--

LOCK TABLES `chat_video` WRITE;
/*!40000 ALTER TABLE `chat_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_item`
--

DROP TABLE IF EXISTS `class_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_item`
--

LOCK TABLES `class_item` WRITE;
/*!40000 ALTER TABLE `class_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_user`
--

DROP TABLE IF EXISTS `class_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_user` (
  `class_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`class_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_user`
--

LOCK TABLES `class_user` WRITE;
/*!40000 ALTER TABLE `class_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `directory` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_language` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `category_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility` int(11) DEFAULT NULL,
  `show_score` int(11) DEFAULT NULL,
  `tutor_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visual_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_url` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disk_quota` bigint(20) DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `last_edit` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `subscribe` tinyint(1) DEFAULT NULL,
  `unsubscribe` tinyint(1) DEFAULT NULL,
  `registration_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `legal` longtext COLLATE utf8_unicode_ci,
  `activate_legal` int(11) DEFAULT NULL,
  `add_teachers_to_sessions_courses` tinyint(1) DEFAULT NULL,
  `course_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_169E6FB977153098` (`code`),
  KEY `IDX_169E6FB954177093` (`room_id`),
  KEY `category_code` (`category_code`),
  KEY `directory` (`directory`),
  CONSTRAINT `FK_169E6FB954177093` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,NULL,'Test course','TESTCOURSE','TESTCOURSE','english','Course Description','',2,1,'','TESTCOURSE','','',100034150,'2016-08-07 00:15:44','2016-07-12 12:07:51','2016-07-12 12:07:51','2017-07-12 12:07:51',1,0,'','',0,NULL,NULL),(2,NULL,'test2','TEST2','TEST2','english','Course Description','',2,1,'','TEST2','','http://',100034150,'2016-08-08 12:35:09','2016-07-14 01:28:50','2016-07-14 01:28:50','2017-07-14 01:28:50',1,0,'','',0,0,NULL),(3,NULL,'Mockups are fun','MOCKUPSAREFUN','MOCKUPSAREFUN','english','Course Description','NEW',2,1,'','MOCKUPSAREFUN','IS','http://',100034150,'2016-08-10 09:56:04','2016-07-22 02:02:39','2016-07-22 02:02:39','2017-07-22 02:02:39',1,0,'','',0,0,NULL),(4,NULL,'This Course - Adam','COURSE','COURSE','english','Course Description','',2,1,'','COURSE','','',100000000,'2016-08-10 09:25:24','2016-07-23 09:25:56','2016-07-23 09:25:56','2017-07-23 09:25:56',1,0,'','',0,NULL,NULL),(5,NULL,'Building IT Systems','BUILDINGITSYSTEMS','BUILDINGITSYSTEMS','english','Course Description','',2,1,'','BUILDINGITSYSTEMS','','',100000000,'2016-08-15 10:58:46','2016-08-01 09:36:14','2016-08-01 09:36:14','2017-08-01 09:36:14',1,1,'','',0,NULL,NULL),(6,NULL,'Introduction to Python','INTROPYTHON','INTROPYTHON','english','Course Description','',2,1,'','INTROPYTHON','','http://',100034150,'2016-08-14 01:43:38','2016-08-05 04:44:43','2016-08-05 04:44:43','2017-08-05 04:44:43',1,1,'','',0,0,NULL),(7,NULL,'Test','TEST','TEST','english','Course Description','',2,1,'','TEST','','',100000000,'2016-08-08 05:30:44','2016-08-08 05:30:33','2016-08-08 05:30:33','2017-08-08 05:30:33',1,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_category`
--

DROP TABLE IF EXISTS `course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tree_pos` int(11) DEFAULT NULL,
  `children_count` smallint(6) DEFAULT NULL,
  `auth_course_child` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_cat_child` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parent_id` (`parent_id`),
  KEY `tree_pos` (`tree_pos`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_category`
--

LOCK TABLES `course_category` WRITE;
/*!40000 ALTER TABLE `course_category` DISABLE KEYS */;
INSERT INTO `course_category` VALUES (4,'New Courses','NEW',NULL,1,0,'TRUE','TRUE');
/*!40000 ALTER TABLE `course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_module`
--

DROP TABLE IF EXISTS `course_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `row` int(11) NOT NULL,
  `column` int(11) NOT NULL,
  `position` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_module`
--

LOCK TABLES `course_module` WRITE;
/*!40000 ALTER TABLE `course_module` DISABLE KEYS */;
INSERT INTO `course_module` VALUES (1,'calendar_event','calendar/agenda.php','agenda.gif',1,1,'basic'),(2,'link','link/link.php','links.gif',4,1,'basic'),(3,'document','document/document.php','documents.gif',3,1,'basic'),(4,'student_publication','work/work.php','works.gif',3,2,'basic'),(5,'announcement','announcements/announcements.php','valves.gif',2,1,'basic'),(6,'user','user/user.php','members.gif',2,3,'basic'),(7,'forum','forum/index.php','forum.gif',1,2,'basic'),(8,'quiz','exercice/exercice.php','quiz.gif',2,2,'basic'),(9,'group','group/group.php','group.gif',3,3,'basic'),(10,'course_description','course_description/','info.gif',1,3,'basic'),(11,'chat','chat/chat.php','chat.gif',0,0,'external'),(12,'dropbox','dropbox/index.php','dropbox.gif',4,2,'basic'),(13,'tracking','tracking/courseLog.php','statistics.gif',1,3,'courseadmin'),(14,'homepage_link','link/link.php?action=addlink','npage.gif',1,1,'courseadmin'),(15,'course_setting','course_info/infocours.php','reference.gif',1,1,'courseadmin'),(16,'External','','external.gif',0,0,'external'),(17,'AddedLearnpath','','scormbuilder.gif',0,0,'external'),(18,'conference','conference/index.php?type=conference','conf.gif',0,0,'external'),(19,'conference','conference/index.php?type=classroom','conf.gif',0,0,'external'),(20,'learnpath','newscorm/lp_controller.php','scorms.gif',5,1,'basic'),(21,'blog','blog/blog.php','blog.gif',1,2,'basic'),(22,'blog_management','blog/blog_admin.php','blog_admin.gif',1,2,'courseadmin'),(23,'course_maintenance','course_info/maintenance.php','backup.gif',2,3,'courseadmin'),(24,'survey','survey/survey_list.php','survey.gif',2,1,'basic'),(25,'wiki','wiki/index.php','wiki.gif',2,3,'basic'),(26,'gradebook','gradebook/index.php','gradebook.gif',2,2,'basic'),(27,'glossary','glossary/index.php','glossary.gif',2,1,'basic'),(28,'notebook','notebook/index.php','notebook.gif',2,1,'basic'),(29,'attendance','attendance/index.php','attendance.gif',2,1,'basic'),(30,'course_progress','course_progress/index.php','course_progress.gif',2,1,'basic');
/*!40000 ALTER TABLE `course_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_rel_class`
--

DROP TABLE IF EXISTS `course_rel_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_rel_class` (
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`course_code`,`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_rel_class`
--

LOCK TABLES `course_rel_class` WRITE;
/*!40000 ALTER TABLE `course_rel_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_rel_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_rel_user`
--

DROP TABLE IF EXISTS `course_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `relation_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_tutor` tinyint(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `user_course_cat` int(11) DEFAULT NULL,
  `legal_agreement` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_92CFD9FEA76ED395` (`user_id`),
  KEY `IDX_92CFD9FE91D79BD3` (`c_id`),
  CONSTRAINT `FK_92CFD9FE91D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_92CFD9FEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_rel_user`
--

LOCK TABLES `course_rel_user` WRITE;
/*!40000 ALTER TABLE `course_rel_user` DISABLE KEYS */;
INSERT INTO `course_rel_user` VALUES (1,1,1,0,1,0,4,0,NULL),(2,1,2,0,1,0,6,0,NULL),(3,3,2,0,5,NULL,1,0,NULL),(4,4,1,0,5,NULL,1,0,NULL),(5,5,2,0,1,0,1,0,NULL),(6,5,3,0,1,0,0,0,NULL),(7,4,3,0,5,NULL,2,0,NULL),(8,3,3,0,5,NULL,2,0,NULL),(9,1,4,0,1,0,5,0,NULL),(10,7,3,0,5,NULL,1,0,NULL),(11,1,5,0,1,0,1,0,NULL),(13,1,6,0,1,0,3,0,NULL),(14,6,6,0,5,NULL,2,0,NULL),(15,8,5,0,5,NULL,1,0,NULL),(16,1,7,0,1,0,2,0,NULL);
/*!40000 ALTER TABLE `course_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_request`
--

DROP TABLE IF EXISTS `course_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `directory` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `db_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_language` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `category_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tutor_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visual_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_date` datetime NOT NULL,
  `objetives` longtext COLLATE utf8_unicode_ci,
  `target_audience` longtext COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `info` int(11) NOT NULL,
  `exemplary_content` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_request`
--

LOCK TABLES `course_request` WRITE;
/*!40000 ALTER TABLE `course_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_type`
--

DROP TABLE IF EXISTS `course_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `translation_var` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `props` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_type`
--

LOCK TABLES `course_type` WRITE;
/*!40000 ALTER TABLE `course_type` DISABLE KEYS */;
INSERT INTO `course_type` VALUES (1,'All tools',NULL,NULL,NULL),(2,'Entry exam',NULL,NULL,NULL);
/*!40000 ALTER TABLE `course_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_email_template`
--

DROP TABLE IF EXISTS `event_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8_unicode_ci,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_type_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_name_index` (`event_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_email_template`
--

LOCK TABLES `event_email_template` WRITE;
/*!40000 ALTER TABLE `event_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_sent`
--

DROP TABLE IF EXISTS `event_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_sent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_from` int(11) NOT NULL,
  `user_to` int(11) DEFAULT NULL,
  `event_type_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_name_index` (`event_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_sent`
--

LOCK TABLES `event_sent` WRITE;
/*!40000 ALTER TABLE `event_sent` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_sent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field`
--

DROP TABLE IF EXISTS `extra_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `extra_field_type` int(11) NOT NULL,
  `field_type` int(11) NOT NULL,
  `variable` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `display_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_value` longtext COLLATE utf8_unicode_ci,
  `field_order` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `changeable` tinyint(1) DEFAULT NULL,
  `filter` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field`
--

LOCK TABLES `extra_field` WRITE;
/*!40000 ALTER TABLE `extra_field` DISABLE KEYS */;
INSERT INTO `extra_field` VALUES (1,1,1,'legal_accept','Legal',NULL,NULL,0,0,NULL,'2016-07-12 12:07:17'),(2,1,1,'already_logged_in','Already logged in',NULL,NULL,0,0,NULL,'2016-07-12 12:07:17'),(3,1,1,'update_type','Update script type',NULL,NULL,0,0,NULL,'2016-07-12 12:07:17'),(4,1,10,'tags','tags',NULL,NULL,0,0,NULL,'2016-07-12 12:07:17'),(5,1,1,'rssfeeds','RSS',NULL,NULL,0,0,NULL,'2016-07-12 12:07:17'),(6,1,1,'dashboard','Dashboard',NULL,NULL,0,0,NULL,'2016-07-12 12:07:17'),(7,1,11,'timezone','Timezone',NULL,NULL,0,0,NULL,'2016-07-12 12:07:17'),(8,1,4,'mail_notify_invitation','MailNotifyInvitation','1',NULL,1,1,NULL,'2016-07-12 12:07:17'),(9,1,4,'mail_notify_message','MailNotifyMessage','1',NULL,1,1,NULL,'2016-07-12 12:07:17'),(10,1,4,'mail_notify_group_message','MailNotifyGroupMessage','1',NULL,1,1,NULL,'2016-07-12 12:07:17'),(11,1,1,'user_chat_status','User chat status',NULL,NULL,0,0,NULL,'2016-07-12 12:07:17'),(12,1,1,'google_calendar_url','Google Calendar URL',NULL,NULL,0,0,NULL,'2016-07-12 12:07:17'),(13,2,13,'special_course','Special course','',NULL,1,1,NULL,'2016-07-12 12:07:17'),(14,2,10,'tags','Tags',NULL,NULL,1,1,NULL,'2016-07-12 12:07:17'),(15,2,19,'video_url','VideoUrl',NULL,NULL,1,1,NULL,'2016-07-12 12:07:17'),(16,3,16,'image','Image',NULL,NULL,1,1,NULL,'2016-07-12 12:07:17'),(17,1,1,'captcha_blocked_until_date','Account locked until',NULL,NULL,0,0,NULL,'2016-07-12 12:07:17');
/*!40000 ALTER TABLE `extra_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field_option_rel_field_option`
--

DROP TABLE IF EXISTS `extra_field_option_rel_field_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field_option_rel_field_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `field_option_id` int(11) DEFAULT NULL,
  `related_field_option_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx` (`field_id`,`role_id`,`field_option_id`,`related_field_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field_option_rel_field_option`
--

LOCK TABLES `extra_field_option_rel_field_option` WRITE;
/*!40000 ALTER TABLE `extra_field_option_rel_field_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra_field_option_rel_field_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field_options`
--

DROP TABLE IF EXISTS `extra_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `option_value` longtext COLLATE utf8_unicode_ci,
  `display_text` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A572E3AE443707B0` (`field_id`),
  CONSTRAINT `FK_A572E3AE443707B0` FOREIGN KEY (`field_id`) REFERENCES `extra_field` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field_options`
--

LOCK TABLES `extra_field_options` WRITE;
/*!40000 ALTER TABLE `extra_field_options` DISABLE KEYS */;
INSERT INTO `extra_field_options` VALUES (1,8,'1','AtOnce',NULL,NULL,1),(2,8,'8','Daily',NULL,NULL,2),(3,8,'0','No',NULL,NULL,3),(4,9,'1','AtOnce',NULL,NULL,1),(5,9,'8','Daily',NULL,NULL,2),(6,9,'0','No',NULL,NULL,3),(7,10,'1','AtOnce',NULL,NULL,1),(8,10,'8','Daily',NULL,NULL,2),(9,10,'0','No',NULL,NULL,3);
/*!40000 ALTER TABLE `extra_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field_rel_tag`
--

DROP TABLE IF EXISTS `extra_field_rel_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field_rel_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field` (`field_id`),
  KEY `item` (`item_id`),
  KEY `tag` (`tag_id`),
  KEY `field_item_tag` (`field_id`,`item_id`,`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field_rel_tag`
--

LOCK TABLES `extra_field_rel_tag` WRITE;
/*!40000 ALTER TABLE `extra_field_rel_tag` DISABLE KEYS */;
INSERT INTO `extra_field_rel_tag` VALUES (1,14,1,1),(4,14,1,2),(6,14,1,3),(7,14,1,4),(8,14,1,5),(10,14,1,6),(11,14,1,7);
/*!40000 ALTER TABLE `extra_field_rel_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field_values`
--

DROP TABLE IF EXISTS `extra_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_171DF924443707B0` (`field_id`),
  CONSTRAINT `FK_171DF924443707B0` FOREIGN KEY (`field_id`) REFERENCES `extra_field` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field_values`
--

LOCK TABLES `extra_field_values` WRITE;
/*!40000 ALTER TABLE `extra_field_values` DISABLE KEYS */;
INSERT INTO `extra_field_values` VALUES (1,2,'true',1,'2016-07-12 12:07:17','2016-08-15 10:25:04',NULL),(3,13,'0',1,'2016-07-12 12:07:51','2016-07-12 12:07:51',NULL),(4,15,'',1,'2016-07-12 12:07:51','2016-07-12 12:07:51',NULL),(5,11,'1',1,'2016-07-13 10:27:19','2016-08-03 09:26:32',NULL),(6,13,'0',2,'2016-07-14 01:28:50','2016-07-21 22:27:24',NULL),(7,15,'http://www.bigbluebutton.org',2,'2016-07-14 01:28:50','2016-07-21 22:27:24',NULL),(8,8,'1',3,'2016-07-18 20:50:23','2016-07-18 20:50:23',NULL),(9,9,'1',3,'2016-07-18 20:50:23','2016-07-18 20:50:23',NULL),(10,10,'1',3,'2016-07-18 20:50:23','2016-07-18 20:50:23',NULL),(11,2,'false',3,'2016-07-18 20:50:23','2016-07-18 20:50:23',NULL),(12,8,'1',4,'2016-07-19 09:20:29','2016-07-19 09:21:03',NULL),(13,9,'1',4,'2016-07-19 09:20:29','2016-07-19 09:21:03',NULL),(14,10,'1',4,'2016-07-19 09:20:29','2016-07-19 09:21:03',NULL),(15,2,'true',4,'2016-07-19 09:20:29','2016-07-23 03:48:21',NULL),(16,8,'1',5,'2016-07-21 22:19:57','2016-07-22 05:15:34',NULL),(17,9,'1',5,'2016-07-21 22:19:57','2016-07-22 05:15:34',NULL),(18,10,'1',5,'2016-07-21 22:19:57','2016-07-22 05:15:34',NULL),(19,2,'true',5,'2016-07-21 22:19:57','2016-08-08 03:22:33',NULL),(20,13,'0',3,'2016-07-22 02:02:40','2016-07-22 05:09:49',NULL),(21,15,'',3,'2016-07-22 02:02:40','2016-07-22 05:09:49',NULL),(22,13,'0',4,'2016-07-23 09:25:57','2016-07-23 09:25:57',NULL),(23,15,'',4,'2016-07-23 09:25:57','2016-07-23 09:25:57',NULL),(24,8,'1',6,'2016-07-25 11:25:57','2016-07-25 11:25:57',NULL),(25,9,'1',6,'2016-07-25 11:25:57','2016-07-25 11:25:57',NULL),(26,10,'1',6,'2016-07-25 11:25:57','2016-07-25 11:25:57',NULL),(27,2,'true',6,'2016-07-25 11:25:57','2016-08-08 03:10:59',NULL),(28,8,'1',7,'2016-07-25 11:27:10','2016-07-25 11:28:51',NULL),(29,9,'1',7,'2016-07-25 11:27:10','2016-07-25 11:28:51',NULL),(30,10,'1',7,'2016-07-25 11:27:10','2016-07-25 11:28:51',NULL),(31,2,'true',7,'2016-07-25 11:27:10','2016-07-27 08:41:26',NULL),(32,11,'1',6,'2016-07-25 11:27:44','2016-08-02 00:50:31',NULL),(33,8,'',1,'2016-07-27 10:11:34','2016-07-27 10:19:07',NULL),(34,9,'',1,'2016-07-27 10:11:34','2016-07-27 10:19:07',NULL),(35,10,'',1,'2016-07-27 10:11:34','2016-07-27 10:19:07',NULL),(36,13,'0',5,'2016-08-01 09:36:15','2016-08-01 09:36:15',NULL),(37,15,'',5,'2016-08-01 09:36:15','2016-08-01 09:36:15',NULL),(38,13,'0',6,'2016-08-05 04:44:43','2016-08-05 05:12:08',NULL),(39,15,'',6,'2016-08-05 04:44:44','2016-08-05 05:12:08',NULL),(40,8,'1',8,'2016-08-06 06:17:54','2016-08-06 06:17:54',NULL),(41,9,'1',8,'2016-08-06 06:17:54','2016-08-06 06:17:54',NULL),(42,10,'1',8,'2016-08-06 06:17:54','2016-08-06 06:17:54',NULL),(43,2,'false',8,'2016-08-06 06:17:54','2016-08-06 06:17:54',NULL),(44,13,'0',7,'2016-08-08 05:30:34','2016-08-08 05:30:34',NULL),(45,15,'',7,'2016-08-08 05:30:34','2016-08-08 05:30:34',NULL);
/*!40000 ALTER TABLE `extra_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_components`
--

DROP TABLE IF EXISTS `grade_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `percentage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `acronym` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `grade_model_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_components`
--

LOCK TABLES `grade_components` WRITE;
/*!40000 ALTER TABLE `grade_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_model`
--

DROP TABLE IF EXISTS `grade_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `default_lowest_eval_exclude` tinyint(1) DEFAULT NULL,
  `default_external_eval` tinyint(1) DEFAULT NULL,
  `default_external_eval_prefix` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_model`
--

LOCK TABLES `grade_model` WRITE;
/*!40000 ALTER TABLE `grade_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_category`
--

DROP TABLE IF EXISTS `gradebook_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `user_id` int(11) NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `weight` double NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `certif_min_score` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `locked` int(11) NOT NULL,
  `default_lowest_eval_exclude` tinyint(1) DEFAULT NULL,
  `generate_certificates` tinyint(1) NOT NULL,
  `grade_model_id` int(11) DEFAULT NULL,
  `is_requirement` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_category`
--

LOCK TABLES `gradebook_category` WRITE;
/*!40000 ALTER TABLE `gradebook_category` DISABLE KEYS */;
INSERT INTO `gradebook_category` VALUES (1,'TESTCOURSE',NULL,1,'TESTCOURSE',0,100,0,75,0,27,0,NULL,0,0,0),(2,'BUILDINGITSYSTEMS',NULL,1,'BUILDINGITSYSTEMS',0,100,0,75,0,40,0,NULL,0,0,0),(3,'INTROPYTHON',NULL,1,'INTROPYTHON',0,100,0,75,0,NULL,0,NULL,0,0,0);
/*!40000 ALTER TABLE `gradebook_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_certificate`
--

DROP TABLE IF EXISTS `gradebook_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_certificate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score_certificate` double NOT NULL,
  `created_at` datetime NOT NULL,
  `path_certificate` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_gradebook_certificate_category_id` (`cat_id`),
  KEY `idx_gradebook_certificate_user_id` (`user_id`),
  KEY `idx_gradebook_certificate_category_id_user_id` (`cat_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_certificate`
--

LOCK TABLES `gradebook_certificate` WRITE;
/*!40000 ALTER TABLE `gradebook_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_evaluation`
--

DROP TABLE IF EXISTS `gradebook_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `user_id` int(11) NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `weight` double NOT NULL,
  `max` double NOT NULL,
  `visible` int(11) NOT NULL,
  `type` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `locked` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_evaluation`
--

LOCK TABLES `gradebook_evaluation` WRITE;
/*!40000 ALTER TABLE `gradebook_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_link`
--

DROP TABLE IF EXISTS `gradebook_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `weight` double NOT NULL,
  `visible` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_link`
--

LOCK TABLES `gradebook_link` WRITE;
/*!40000 ALTER TABLE `gradebook_link` DISABLE KEYS */;
INSERT INTO `gradebook_link` VALUES (1,3,1,1,'BUILDINGITSYSTEMS',2,'2016-08-03 10:05:35',0,1,0),(2,3,2,1,'BUILDINGITSYSTEMS',2,'2016-08-03 10:22:52',0,1,0);
/*!40000 ALTER TABLE `gradebook_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_linkeval_log`
--

DROP TABLE IF EXISTS `gradebook_linkeval_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_linkeval_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_linkeval_log` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `weight` smallint(6) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_id_log` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_linkeval_log`
--

LOCK TABLES `gradebook_linkeval_log` WRITE;
/*!40000 ALTER TABLE `gradebook_linkeval_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_linkeval_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_result`
--

DROP TABLE IF EXISTS `gradebook_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_result`
--

LOCK TABLES `gradebook_result` WRITE;
/*!40000 ALTER TABLE `gradebook_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_result_log`
--

DROP TABLE IF EXISTS `gradebook_result_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_result_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_result` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_result_log`
--

LOCK TABLES `gradebook_result_log` WRITE;
/*!40000 ALTER TABLE `gradebook_result_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_result_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_score_display`
--

DROP TABLE IF EXISTS `gradebook_score_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_score_display` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` double NOT NULL,
  `display` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `score_color_percent` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_score_display`
--

LOCK TABLES `gradebook_score_display` WRITE;
/*!40000 ALTER TABLE `gradebook_score_display` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_score_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_score_log`
--

DROP TABLE IF EXISTS `gradebook_score_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` double NOT NULL,
  `registered_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gradebook_score_log_user` (`user_id`),
  KEY `idx_gradebook_score_log_user_category` (`user_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_score_log`
--

LOCK TABLES `gradebook_score_log` WRITE;
/*!40000 ALTER TABLE `gradebook_score_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_score_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_rel_group`
--

DROP TABLE IF EXISTS `group_rel_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_rel_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `subgroup_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `subgroup_id` (`subgroup_id`),
  KEY `relation_type` (`relation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_rel_group`
--

LOCK TABLES `group_rel_group` WRITE;
/*!40000 ALTER TABLE `group_rel_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_rel_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_rel_tag`
--

DROP TABLE IF EXISTS `group_rel_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_rel_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_rel_tag`
--

LOCK TABLES `group_rel_tag` WRITE;
/*!40000 ALTER TABLE `group_rel_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_rel_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_rel_user`
--

DROP TABLE IF EXISTS `group_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `relation_type` (`relation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_rel_user`
--

LOCK TABLES `group_rel_user` WRITE;
/*!40000 ALTER TABLE `group_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `visibility` int(11) NOT NULL,
  `updated_on` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hook_call`
--

DROP TABLE IF EXISTS `hook_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hook_call` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hook_event_id` int(11) NOT NULL,
  `hook_observer_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `hook_order` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hook_call`
--

LOCK TABLES `hook_call` WRITE;
/*!40000 ALTER TABLE `hook_call` DISABLE KEYS */;
INSERT INTO `hook_call` VALUES (1,1,1,0,1,0),(2,1,1,1,1,0),(3,2,2,0,1,0),(4,2,2,1,1,0),(5,3,3,0,1,0),(6,3,3,1,1,0);
/*!40000 ALTER TABLE `hook_call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hook_event`
--

DROP TABLE IF EXISTS `hook_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hook_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hook_event`
--

LOCK TABLES `hook_event` WRITE;
/*!40000 ALTER TABLE `hook_event` DISABLE KEYS */;
INSERT INTO `hook_event` VALUES (1,'HookCreateUser','HookDescriptionHookCreateUser'),(2,'HookResubscribe','HookDescriptionHookResubscribe'),(3,'HookEventSkype','HookDescriptionHookEventSkype');
/*!40000 ALTER TABLE `hook_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hook_observer`
--

DROP TABLE IF EXISTS `hook_observer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hook_observer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hook_observer`
--

LOCK TABLES `hook_observer` WRITE;
/*!40000 ALTER TABLE `hook_observer` DISABLE KEYS */;
INSERT INTO `hook_observer` VALUES (1,'HookCreateDrupalUser','plugin/createdrupaluser/src/CreateDrupalUser.php','drupaluser'),(2,'HookResubscription','plugin/resubscription/src/Resubscription.php','resubscription'),(3,'HookObserverSkype','plugin/skype/src/Skype.php','skype');
/*!40000 ALTER TABLE `hook_observer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `english_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isocode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dokeos_folder` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` tinyint(1) NOT NULL,
  `parent_id` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_language_dokeos_folder` (`dokeos_folder`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'&#1575;&#1604;&#1593;&#1585;&#1576;&#1610;&#1577;','arabic','ar','arabic',0,NULL),(2,'Asturianu','asturian','ast','asturian',0,49),(3,'Euskara','basque','eu','basque',1,NULL),(4,'&#2476;&#2494;&#2434;&#2482;&#2494;','bengali','bn','bengali',0,NULL),(5,'Bosanski','bosnian','bs','bosnian',1,NULL),(6,'Portugu&ecirc;s do Brasil','brazilian','pt-BR','brazilian',1,40),(7,'&#1041;&#1098;&#1083;&#1075;&#1072;&#1088;&#1089;&#1082;&#1080;','bulgarian','bg','bulgarian',1,NULL),(8,'Catal&agrave;','catalan','ca','catalan',0,49),(9,'Hrvatski','croatian','hr','croatian',0,NULL),(10,'&#268;esky','czech','cs','czech',0,NULL),(11,'Dansk','danish','da','danish',0,NULL),(12,'&#1583;&#1585;&#1740;','dari','prs','dari',0,NULL),(13,'Nederlands','dutch','nl','dutch',1,NULL),(14,'English','english','en','english',1,NULL),(15,'Esperanto','esperanto','eo','esperanto',0,49),(16,'Føroyskt','faroese','fo','faroese',0,NULL),(17,'Suomi','finnish','fi','finnish',0,NULL),(18,'Fran&ccedil;ais','french','fr','french',1,NULL),(19,'Furlan','friulian','fur','friulian',0,28),(20,'Galego','galician','gl','galician',1,49),(21,'&#4325;&#4304;&#4320;&#4311;&#4323;&#4314;&#4312;','georgian','ka','georgian',0,NULL),(22,'Deutsch','german','de','german',1,NULL),(23,'&Epsilon;&lambda;&lambda;&eta;&nu;&iota;&kappa;&#940;','greek','el','greek',1,NULL),(24,'&#1506;&#1489;&#1512;&#1497;&#1514;','hebrew','he','hebrew',0,NULL),(25,'&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;','hindi','hi','hindi',0,NULL),(26,'Magyar','hungarian','hu','hungarian',1,NULL),(27,'Bahasa Indonesia','indonesian','id','indonesian',1,NULL),(28,'Italiano','italian','it','italian',1,NULL),(29,'&#26085;&#26412;&#35486;','japanese','ja','japanese',0,NULL),(30,'&#54620;&#44397;&#50612;','korean','ko','korean',0,NULL),(31,'Latvie&scaron;u','latvian','lv','latvian',1,NULL),(32,'Lietuvi&#371;','lithuanian','lt','lithuanian',0,NULL),(33,'&#1052;&#1072;&#1082;&#1077;&#1076;&#1086;&#1085;&#1089;&#1082;&#1080;','macedonian','mk','macedonian',0,NULL),(34,'Bahasa Melayu','malay','ms','malay',0,NULL),(35,'Norsk','norwegian','no','norwegian',0,NULL),(36,'Occitan','occitan','oc','occitan',0,18),(37,'&#1662;&#1690;&#1578;&#1608;','pashto','ps','pashto',0,NULL),(38,'&#1601;&#1575;&#1585;&#1587;&#1740;','persian','fa','persian',0,NULL),(39,'Polski','polish','pl','polish',1,NULL),(40,'Portugu&ecirc;s europeu','portuguese','pt','portuguese',1,NULL),(41,'Runasimi','quechua_cusco','qu','quechua_cusco',0,49),(42,'Rom&acirc;n&#259;','romanian','ro','romanian',0,NULL),(43,'&#1056;&#1091;&#1089;&#1089;&#1082;&#1080;&#1081;','russian','ru','russian',0,NULL),(44,'Srpski','serbian','sr','serbian',0,NULL),(45,'&#20013;&#25991;&#65288;&#31616;&#20307;&#65289;','simpl_chinese','zh','simpl_chinese',0,NULL),(46,'Sloven&#269;ina','slovak','sk','slovak',1,NULL),(47,'Sloven&scaron;&#269;ina','slovenian','sl','slovenian',1,NULL),(48,'&#1575;&#1604;&#1589;&#1608;&#1605;&#1575;&#1604;&#1610;&#1577;','somali','so','somali',0,NULL),(49,'Espa&ntilde;ol','spanish','es','spanish',1,NULL),(50,'Kiswahili','swahili','sw','swahili',0,NULL),(51,'Svenska','swedish','sv','swedish',0,NULL),(52,'Tagalog','tagalog','tl','tagalog',1,NULL),(53,'&#3652;&#3607;&#3618;','thai','th','thai',0,NULL),(54,'Tibetan','tibetan','bo','tibetan',0,NULL),(55,'&#32321;&#39636;&#20013;&#25991;','trad_chinese','zh-TW','trad_chinese',0,45),(56,'T&uuml;rk&ccedil;e','turkish','tr','turkish',0,NULL),(57,'&#1059;&#1082;&#1088;&#1072;&#1111;&#1085;&#1089;&#1100;&#1082;&#1072;','ukrainian','uk','ukrainian',0,NULL),(58,'Ti&#7871;ng Vi&#7879;t','vietnamese','vi','vietnamese',0,NULL),(59,'isiXhosa','xhosa','xh','xhosa',0,NULL),(60,'Yor&ugrave;b&aacute;','yoruba','yo','yoruba',0,NULL);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal`
--

DROP TABLE IF EXISTS `legal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legal` (
  `legal_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `type` int(11) NOT NULL,
  `changes` longtext COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`legal_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal`
--

LOCK TABLES `legal` WRITE;
/*!40000 ALTER TABLE `legal` DISABLE KEYS */;
/*!40000 ALTER TABLE `legal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_sender_id` int(11) NOT NULL,
  `user_receiver_id` int(11) NOT NULL,
  `msg_status` tinyint(1) NOT NULL,
  `send_date` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_message_user_sender` (`user_sender_id`),
  KEY `idx_message_user_receiver` (`user_receiver_id`),
  KEY `idx_message_user_sender_user_receiver` (`user_sender_id`,`user_receiver_id`),
  KEY `idx_message_group` (`group_id`),
  KEY `idx_message_parent` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_attachment`
--

DROP TABLE IF EXISTS `message_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `size` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_attachment`
--

LOCK TABLES `message_attachment` WRITE;
/*!40000 ALTER TABLE `message_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dest_user_id` int(11) NOT NULL,
  `dest_mail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_freq` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `sent_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_notify_sent_index` (`sent_at`),
  KEY `mail_notify_freq_index` (`sent_at`,`send_freq`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openid_association`
--

DROP TABLE IF EXISTS `openid_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openid_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idp_endpoint_uri` longtext COLLATE utf8_unicode_ci NOT NULL,
  `session_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `assoc_handle` longtext COLLATE utf8_unicode_ci NOT NULL,
  `assoc_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expires_in` bigint(20) NOT NULL,
  `mac_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openid_association`
--

LOCK TABLES `openid_association` WRITE;
/*!40000 ALTER TABLE `openid_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `openid_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_agenda`
--

DROP TABLE IF EXISTS `personal_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_agenda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `text` longtext COLLATE utf8_unicode_ci,
  `date` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `course` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_event_id` int(11) DEFAULT NULL,
  `all_day` int(11) NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `videoconference` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_personal_agenda_user` (`user`),
  KEY `idx_personal_agenda_parent` (`parent_event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_agenda`
--

LOCK TABLES `personal_agenda` WRITE;
/*!40000 ALTER TABLE `personal_agenda` DISABLE KEYS */;
INSERT INTO `personal_agenda` VALUES (20,8,'Mels Test For Devq','','2016-08-10 04:29:00','2016-08-10 04:29:00','Dev',NULL,0,NULL,NULL,NULL),(21,8,'Mels test for units','','2016-08-11 04:30:00','2016-08-11 04:30:00','Unit',NULL,0,NULL,NULL,NULL);
INSERT INTO `personal_agenda` VALUES (23,1,'testing event again','<p>testing</p><br />\r\n<br />\r\n<p>&nbsp;</p><br />\r\n','2016-08-10 10:00:00','2016-08-10 11:00:00','Dev',NULL,0,'',NULL,NULL),(24,1,'dfgdfsgs','<p>asdfasdfsdaf</p>\n','2016-08-15 09:36:00','2016-08-15 09:36:00','Dev',NULL,0,NULL,NULL,NULL),(25,1,'asdfasdf','<p>adsfasdf</p>\n','2016-08-15 09:56:00','2016-08-15 09:56:00','Dev',NULL,0,NULL,NULL,NULL),(26,1,'aaaaa','<p>asdf</p>\n','2016-08-15 09:58:00','2016-08-15 09:58:00','Dev',NULL,0,NULL,NULL,NULL),(27,1,'aaaa','<p>asdfasdf</p>\n','2016-08-26 14:00:00','2016-08-27 13:59:00','Dev',NULL,0,NULL,NULL,NULL),(28,1,'bbbbb','<p>asdf</p>\n','2016-08-27 14:00:00','2016-08-28 13:59:00','Dev',NULL,0,NULL,NULL,NULL),(29,1,'1st','<p>yuity</p>\n','2016-07-31 23:00:00','2016-08-01 00:00:00','Dev',NULL,0,NULL,NULL,NULL),(30,1,'1st','<p>yuity</p>\n','2016-07-31 23:00:00','2016-08-01 00:00:00','Dev',NULL,0,NULL,NULL,NULL),(31,1,'1st','<p>yuity</p>\n','2016-07-31 23:00:00','2016-08-01 00:00:00','Dev',NULL,0,NULL,NULL,NULL),(32,1,'1st','<p>yuity</p>\n','2016-07-31 23:00:00','2016-08-01 00:00:00','Dev',NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `personal_agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_agenda_repeat`
--

DROP TABLE IF EXISTS `personal_agenda_repeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_agenda_repeat` (
  `cal_id` int(11) NOT NULL AUTO_INCREMENT,
  `cal_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cal_end` int(11) DEFAULT NULL,
  `cal_frequency` int(11) DEFAULT NULL,
  `cal_days` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_agenda_repeat`
--

LOCK TABLES `personal_agenda_repeat` WRITE;
/*!40000 ALTER TABLE `personal_agenda_repeat` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_agenda_repeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_agenda_repeat_not`
--

DROP TABLE IF EXISTS `personal_agenda_repeat_not`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_agenda_repeat_not` (
  `cal_id` int(11) NOT NULL,
  `cal_date` int(11) NOT NULL,
  PRIMARY KEY (`cal_id`,`cal_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_agenda_repeat_not`
--

LOCK TABLES `personal_agenda_repeat_not` WRITE;
/*!40000 ALTER TABLE `personal_agenda_repeat_not` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_agenda_repeat_not` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_bbb_meeting`
--

DROP TABLE IF EXISTS `plugin_bbb_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_bbb_meeting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `c_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `meeting_name` varchar(255) NOT NULL DEFAULT '',
  `attendee_pw` varchar(255) NOT NULL DEFAULT '',
  `moderator_pw` varchar(255) NOT NULL DEFAULT '',
  `record` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` varchar(255) NOT NULL,
  `closed_at` varchar(255) NOT NULL,
  `calendar_id` int(11) DEFAULT '0',
  `welcome_msg` varchar(255) NOT NULL DEFAULT '',
  `session_id` int(10) unsigned DEFAULT '0',
  `remote_id` char(30) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT '1',
  `voice_bridge` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_bbb_meeting`
--

LOCK TABLES `plugin_bbb_meeting` WRITE;
/*!40000 ALTER TABLE `plugin_bbb_meeting` DISABLE KEYS */;
INSERT INTO `plugin_bbb_meeting` VALUES (65,3,0,'MOCKUPSAREFUN-0','MOCKUPSAREFUN','MOCKUPSAREFUNmod',0,1,'2016-08-10 19:56:27','',0,'',0,'157aafa49c149f5.30176339',1,1),(66,3,0,'MOCKUPSAREFUN-0','MOCKUPSAREFUN','MOCKUPSAREFUNmod',0,1,'2016-08-10 19:56:27','',0,'',0,'157aafa49401d91.32909293',1,1),(67,3,0,'MOCKUPSAREFUN-0','MOCKUPSAREFUN','MOCKUPSAREFUNmod',0,1,'2016-08-10 19:56:28','',0,'',0,'157aafa4ab90cb0.37952716',1,1),(68,3,0,'MOCKUPSAREFUN-0','MOCKUPSAREFUN','MOCKUPSAREFUNmod',0,1,'2016-08-10 20:02:39','',0,'',0,'157aafa53af25b9.48285117',1,1);
/*!40000 ALTER TABLE `plugin_bbb_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `career_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `geolocation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_mask` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_729F519BDCD6CC49` (`branch_id`),
  CONSTRAINT `FK_729F519BDCD6CC49` FOREIGN KEY (`branch_id`) REFERENCES `branch_sync` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_engine_ref`
--

DROP TABLE IF EXISTS `search_engine_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_engine_ref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `tool_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref_id_high_level` int(11) NOT NULL,
  `ref_id_second_level` int(11) DEFAULT NULL,
  `search_did` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_engine_ref`
--

LOCK TABLES `search_engine_ref` WRITE;
/*!40000 ALTER TABLE `search_engine_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_engine_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `graph` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_condition`
--

DROP TABLE IF EXISTS `sequence_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `mat_op` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `param` double NOT NULL,
  `act_true` int(11) NOT NULL,
  `act_false` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_condition`
--

LOCK TABLES `sequence_condition` WRITE;
/*!40000 ALTER TABLE `sequence_condition` DISABLE KEYS */;
INSERT INTO `sequence_condition` VALUES (1,'<= 100%','<=',100,2,'0'),(2,'>= 70%','>=',70,0,'');
/*!40000 ALTER TABLE `sequence_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_formula`
--

DROP TABLE IF EXISTS `sequence_formula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_formula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_method_id` int(11) DEFAULT NULL,
  `sequence_variable_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_533B9159B2D1386E` (`sequence_method_id`),
  KEY `IDX_533B915955C65E08` (`sequence_variable_id`),
  CONSTRAINT `FK_533B915955C65E08` FOREIGN KEY (`sequence_variable_id`) REFERENCES `sequence_variable` (`id`),
  CONSTRAINT `FK_533B9159B2D1386E` FOREIGN KEY (`sequence_method_id`) REFERENCES `sequence_method` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_formula`
--

LOCK TABLES `sequence_formula` WRITE;
/*!40000 ALTER TABLE `sequence_formula` DISABLE KEYS */;
INSERT INTO `sequence_formula` VALUES (1,1,2),(2,2,2),(3,2,3),(4,2,1),(5,3,3),(6,4,4),(7,5,5),(8,6,6),(9,7,7),(10,8,8),(11,9,3),(12,10,2),(13,11,1);
/*!40000 ALTER TABLE `sequence_formula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_method`
--

DROP TABLE IF EXISTS `sequence_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `formula` longtext COLLATE utf8_unicode_ci NOT NULL,
  `assign` int(11) NOT NULL,
  `met_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `act_false` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_method`
--

LOCK TABLES `sequence_method` WRITE;
/*!40000 ALTER TABLE `sequence_method` DISABLE KEYS */;
INSERT INTO `sequence_method` VALUES (1,'Add completed item','v#2 + $complete_items;',2,'add',''),(2,'Update progress by division','v#2 / v#3 * 100;',1,'div',''),(3,'Update items count','$total_items;',3,'update',''),(4,'Enable success','1;',4,'success',''),(5,'Store success date','(empty(v#5))? api_get_utc_datetime() : v#5;',5,'success',''),(6,'Enable availability','1;',6,'pre',''),(7,'Store availability start date','(empty(v#7))? api_get_utc_datetime() : v#7;',7,'pre',''),(8,'Store availability end date','(empty($available_end_date))? api_get_utc_datetime($available_end_date) : \"0000-00-00 00:00:00\";',8,'pre',''),(9,'Increase the items count','v#3 + $total_items;',3,'add',''),(10,'Update completed items','$complete_items;',2,'update',''),(11,'Update progress','$complete_items / $total_items * 100;',1,'update','');
/*!40000 ALTER TABLE `sequence_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_resource`
--

DROP TABLE IF EXISTS `sequence_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_34ADA43998FB19AE` (`sequence_id`),
  CONSTRAINT `FK_34ADA43998FB19AE` FOREIGN KEY (`sequence_id`) REFERENCES `sequence` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_resource`
--

LOCK TABLES `sequence_resource` WRITE;
/*!40000 ALTER TABLE `sequence_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_row_entity`
--

DROP TABLE IF EXISTS `sequence_row_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_row_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_type_entity_id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `row_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2779761FAED14944` (`sequence_type_entity_id`),
  CONSTRAINT `FK_2779761FAED14944` FOREIGN KEY (`sequence_type_entity_id`) REFERENCES `sequence_type_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_row_entity`
--

LOCK TABLES `sequence_row_entity` WRITE;
/*!40000 ALTER TABLE `sequence_row_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_row_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_rule`
--

DROP TABLE IF EXISTS `sequence_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_rule`
--

LOCK TABLES `sequence_rule` WRITE;
/*!40000 ALTER TABLE `sequence_rule` DISABLE KEYS */;
INSERT INTO `sequence_rule` VALUES (1,'If user completes 70% of an entity or group of items, he will be able to access another entity or group of items');
/*!40000 ALTER TABLE `sequence_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_rule_condition`
--

DROP TABLE IF EXISTS `sequence_rule_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_rule_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_rule_id` int(11) DEFAULT NULL,
  `sequence_condition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F948EE6A4044CA89` (`sequence_rule_id`),
  KEY `IDX_F948EE6A8C0A7083` (`sequence_condition_id`),
  CONSTRAINT `FK_F948EE6A4044CA89` FOREIGN KEY (`sequence_rule_id`) REFERENCES `sequence_rule` (`id`),
  CONSTRAINT `FK_F948EE6A8C0A7083` FOREIGN KEY (`sequence_condition_id`) REFERENCES `sequence_condition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_rule_condition`
--

LOCK TABLES `sequence_rule_condition` WRITE;
/*!40000 ALTER TABLE `sequence_rule_condition` DISABLE KEYS */;
INSERT INTO `sequence_rule_condition` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `sequence_rule_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_rule_method`
--

DROP TABLE IF EXISTS `sequence_rule_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_rule_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_rule_id` int(11) DEFAULT NULL,
  `sequence_method_id` int(11) DEFAULT NULL,
  `method_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6336EA764044CA89` (`sequence_rule_id`),
  KEY `IDX_6336EA76B2D1386E` (`sequence_method_id`),
  CONSTRAINT `FK_6336EA764044CA89` FOREIGN KEY (`sequence_rule_id`) REFERENCES `sequence_rule` (`id`),
  CONSTRAINT `FK_6336EA76B2D1386E` FOREIGN KEY (`sequence_method_id`) REFERENCES `sequence_method` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_rule_method`
--

LOCK TABLES `sequence_rule_method` WRITE;
/*!40000 ALTER TABLE `sequence_rule_method` DISABLE KEYS */;
INSERT INTO `sequence_rule_method` VALUES (1,1,1,1),(2,1,2,3),(3,1,3,0),(4,1,4,0),(5,1,5,0),(6,1,6,0),(7,1,7,0),(8,1,8,0),(9,1,9,2),(10,1,10,0),(11,1,11,0);
/*!40000 ALTER TABLE `sequence_rule_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_type_entity`
--

DROP TABLE IF EXISTS `sequence_type_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_type_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ent_table` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_type_entity`
--

LOCK TABLES `sequence_type_entity` WRITE;
/*!40000 ALTER TABLE `sequence_type_entity` DISABLE KEYS */;
INSERT INTO `sequence_type_entity` VALUES (1,'Lp','Learning Path','c_lp'),(2,'Quiz','Quiz and Tests','c_quiz'),(3,'LpItem','Items of a Learning Path','c_lp_item');
/*!40000 ALTER TABLE `sequence_type_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_valid`
--

DROP TABLE IF EXISTS `sequence_valid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_valid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_variable_id` int(11) DEFAULT NULL,
  `sequence_condition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F78B9CE655C65E08` (`sequence_variable_id`),
  KEY `IDX_F78B9CE68C0A7083` (`sequence_condition_id`),
  CONSTRAINT `FK_F78B9CE655C65E08` FOREIGN KEY (`sequence_variable_id`) REFERENCES `sequence_variable` (`id`),
  CONSTRAINT `FK_F78B9CE68C0A7083` FOREIGN KEY (`sequence_condition_id`) REFERENCES `sequence_condition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_valid`
--

LOCK TABLES `sequence_valid` WRITE;
/*!40000 ALTER TABLE `sequence_valid` DISABLE KEYS */;
INSERT INTO `sequence_valid` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `sequence_valid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_value`
--

DROP TABLE IF EXISTS `sequence_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_row_entity_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `advance` double NOT NULL,
  `complete_items` int(11) NOT NULL,
  `total_items` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `success_date` datetime DEFAULT NULL,
  `available` tinyint(1) NOT NULL,
  `available_start_date` datetime DEFAULT NULL,
  `available_end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_66FBF12D218736B2` (`sequence_row_entity_id`),
  CONSTRAINT `FK_66FBF12D218736B2` FOREIGN KEY (`sequence_row_entity_id`) REFERENCES `sequence_row_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_value`
--

LOCK TABLES `sequence_value` WRITE;
/*!40000 ALTER TABLE `sequence_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_variable`
--

DROP TABLE IF EXISTS `sequence_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `default_val` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_variable`
--

LOCK TABLES `sequence_variable` WRITE;
/*!40000 ALTER TABLE `sequence_variable` DISABLE KEYS */;
INSERT INTO `sequence_variable` VALUES (1,'Percentile progress','advance','0.0'),(2,'Completed items','complete_items','0'),(3,'Items count','total_items','0'),(4,'Completed','success','0'),(5,'Completion date','success_date','0000-00-00 00:00:00'),(6,'Available','available','0'),(7,'Availability start date','available_start_date','0000-00-00 00:00:00'),(8,'Availability end date','available_end_date','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `sequence_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_coach` int(11) DEFAULT NULL,
  `session_category_id` int(11) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `show_description` tinyint(1) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `nbr_courses` smallint(6) DEFAULT NULL,
  `nbr_users` int(11) DEFAULT NULL,
  `nbr_classes` int(11) DEFAULT NULL,
  `session_admin_id` int(11) DEFAULT NULL,
  `visibility` int(11) NOT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `display_start_date` datetime DEFAULT NULL,
  `display_end_date` datetime DEFAULT NULL,
  `access_start_date` datetime DEFAULT NULL,
  `access_end_date` datetime DEFAULT NULL,
  `coach_access_start_date` datetime DEFAULT NULL,
  `coach_access_end_date` datetime DEFAULT NULL,
  `send_subscription_notification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `IDX_D044D5D4EE1F8395` (`session_category_id`),
  KEY `idx_id_coach` (`id_coach`),
  KEY `idx_id_session_admin_id` (`session_admin_id`),
  CONSTRAINT `FK_D044D5D4D1DC2CFC` FOREIGN KEY (`id_coach`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_D044D5D4EE1F8395` FOREIGN KEY (`session_category_id`) REFERENCES `session_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,1,NULL,'Session One','',0,NULL,1,0,NULL,1,1,NULL,'2016-07-18 20:54:00',NULL,'2016-07-17 20:54:00',NULL,'2016-07-18 20:54:00',NULL,0);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_category`
--

DROP TABLE IF EXISTS `session_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_url_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8DE079A973444FD5` (`access_url_id`),
  CONSTRAINT `FK_8DE079A973444FD5` FOREIGN KEY (`access_url_id`) REFERENCES `access_url` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_category`
--

LOCK TABLES `session_category` WRITE;
/*!40000 ALTER TABLE `session_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_rel_course`
--

DROP TABLE IF EXISTS `session_rel_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_rel_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `nbr_users` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_12D110D3613FECDF` (`session_id`),
  KEY `idx_session_rel_course_course_id` (`c_id`),
  CONSTRAINT `FK_12D110D3613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_12D110D391D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_rel_course`
--

LOCK TABLES `session_rel_course` WRITE;
/*!40000 ALTER TABLE `session_rel_course` DISABLE KEYS */;
INSERT INTO `session_rel_course` VALUES (1,1,2,0,0);
/*!40000 ALTER TABLE `session_rel_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_rel_course_rel_user`
--

DROP TABLE IF EXISTS `session_rel_course_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_rel_course_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `visibility` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `legal_agreement` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_720167E613FECDF` (`session_id`),
  KEY `idx_session_rel_course_rel_user_id_user` (`user_id`),
  KEY `idx_session_rel_course_rel_user_course_id` (`c_id`),
  CONSTRAINT `FK_720167E613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_720167E91D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_720167EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_rel_course_rel_user`
--

LOCK TABLES `session_rel_course_rel_user` WRITE;
/*!40000 ALTER TABLE `session_rel_course_rel_user` DISABLE KEYS */;
INSERT INTO `session_rel_course_rel_user` VALUES (1,5,1,2,0,2,NULL);
/*!40000 ALTER TABLE `session_rel_course_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_rel_user`
--

DROP TABLE IF EXISTS `session_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `relation_type` int(11) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `moved_to` int(11) DEFAULT NULL,
  `moved_status` int(11) DEFAULT NULL,
  `moved_at` datetime DEFAULT NULL,
  `registered_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B0D7D4C0613FECDF` (`session_id`),
  KEY `IDX_B0D7D4C0A76ED395` (`user_id`),
  KEY `idx_session_rel_user_id_user_moved` (`user_id`,`moved_to`),
  CONSTRAINT `FK_B0D7D4C0613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_B0D7D4C0A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_rel_user`
--

LOCK TABLES `session_rel_user` WRITE;
/*!40000 ALTER TABLE `session_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_current`
--

DROP TABLE IF EXISTS `settings_current`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subkey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selected_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subkeytext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_url` int(11) NOT NULL DEFAULT '1',
  `access_url_changeable` int(11) NOT NULL,
  `access_url_locked` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_setting` (`variable`,`subkey`,`access_url`),
  KEY `access_url` (`access_url`)
) ENGINE=InnoDB AUTO_INCREMENT=492 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_current`
--

LOCK TABLES `settings_current` WRITE;
/*!40000 ALTER TABLE `settings_current` DISABLE KEYS */;
INSERT INTO `settings_current` VALUES (1,'Institution',NULL,'textfield','Platform','The B Sharps','InstitutionTitle','InstitutionComment','platform',NULL,1,1,0),(2,'InstitutionUrl',NULL,'textfield','Platform','https://bits-bsharp-melbnetworks.c9users.io','InstitutionUrlTitle','InstitutionUrlComment',NULL,NULL,1,1,0),(3,'siteName',NULL,'textfield','Platform','Chalkboard','SiteNameTitle','SiteNameComment',NULL,NULL,1,1,0),(4,'emailAdministrator',NULL,'textfield','Platform','s9977839@student.rmit.edu.au','emailAdministratorTitle','emailAdministratorComment',NULL,NULL,1,1,0),(5,'administratorSurname',NULL,'textfield','Platform','Flanders','administratorSurnameTitle','administratorSurnameComment',NULL,NULL,1,1,0),(6,'administratorName',NULL,'textfield','Platform','Ned','administratorNameTitle','administratorNameComment',NULL,NULL,1,1,0),(7,'show_administrator_data',NULL,'radio','Platform','true','ShowAdministratorDataTitle','ShowAdministratorDataComment',NULL,NULL,1,1,0),(8,'show_tutor_data',NULL,'radio','Session','true','ShowTutorDataTitle','ShowTutorDataComment',NULL,NULL,1,1,0),(9,'show_teacher_data',NULL,'radio','Platform','true','ShowTeacherDataTitle','ShowTeacherDataComment',NULL,NULL,1,1,0),(10,'homepage_view',NULL,'radio','Course','activity_big','HomepageViewTitle','HomepageViewComment',NULL,NULL,1,1,0),(11,'show_toolshortcuts',NULL,'radio','Course','false','ShowToolShortcutsTitle','ShowToolShortcutsComment',NULL,NULL,1,0,0),(12,'allow_group_categories',NULL,'radio','Course','false','AllowGroupCategories','AllowGroupCategoriesComment',NULL,NULL,1,0,0),(13,'server_type',NULL,'radio','Platform','production','ServerStatusTitle','ServerStatusComment',NULL,NULL,1,0,1),(14,'platformLanguage',NULL,'link','Languages','english','PlatformLanguageTitle','PlatformLanguageComment',NULL,NULL,1,0,0),(15,'showonline','world','checkbox','Platform','true','ShowOnlineTitle','ShowOnlineComment',NULL,'ShowOnlineWorld',1,0,0),(16,'showonline','users','checkbox','Platform','true','ShowOnlineTitle','ShowOnlineComment',NULL,'ShowOnlineUsers',1,0,0),(17,'showonline','course','checkbox','Platform','true','ShowOnlineTitle','ShowOnlineComment',NULL,'ShowOnlineCourse',1,0,0),(18,'profile','name','checkbox','User','true','ProfileChangesTitle','ProfileChangesComment',NULL,'name',1,0,0),(19,'profile','officialcode','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'officialcode',1,0,0),(20,'profile','email','checkbox','User','true','ProfileChangesTitle','ProfileChangesComment',NULL,'Email',1,0,0),(21,'profile','picture','checkbox','User','true','ProfileChangesTitle','ProfileChangesComment',NULL,'UserPicture',1,0,0),(22,'profile','login','checkbox','User','true','ProfileChangesTitle','ProfileChangesComment',NULL,'Login',1,0,0),(23,'profile','password','checkbox','User','true','ProfileChangesTitle','ProfileChangesComment',NULL,'UserPassword',1,0,0),(24,'profile','language','checkbox','User','true','ProfileChangesTitle','ProfileChangesComment',NULL,'Language',1,0,0),(25,'default_document_quotum',NULL,'textfield','Course','100000000','DefaultDocumentQuotumTitle','DefaultDocumentQuotumComment',NULL,NULL,1,0,0),(26,'registration','officialcode','checkbox','User','false','RegistrationRequiredFormsTitle','RegistrationRequiredFormsComment',NULL,'OfficialCode',1,0,0),(27,'registration','email','checkbox','User','true','RegistrationRequiredFormsTitle','RegistrationRequiredFormsComment',NULL,'Email',1,0,0),(28,'registration','language','checkbox','User','true','RegistrationRequiredFormsTitle','RegistrationRequiredFormsComment',NULL,'Language',1,0,0),(29,'default_group_quotum',NULL,'textfield','Course','5000000','DefaultGroupQuotumTitle','DefaultGroupQuotumComment',NULL,NULL,1,0,0),(30,'allow_registration',NULL,'radio','Platform','true','AllowRegistrationTitle','AllowRegistrationComment',NULL,NULL,1,0,0),(31,'allow_registration_as_teacher',NULL,'radio','Platform','true','AllowRegistrationAsTeacherTitle','AllowRegistrationAsTeacherComment',NULL,NULL,1,0,0),(32,'allow_lostpassword',NULL,'radio','Platform','true','AllowLostPasswordTitle','AllowLostPasswordComment',NULL,NULL,1,0,0),(33,'allow_user_headings',NULL,'radio','Course','false','AllowUserHeadings','AllowUserHeadingsComment',NULL,NULL,1,0,0),(34,'course_create_active_tools','course_description','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'CourseDescription',1,0,0),(35,'course_create_active_tools','agenda','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Agenda',1,0,0),(36,'course_create_active_tools','documents','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Documents',1,0,0),(37,'course_create_active_tools','learning_path','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'LearningPath',1,0,0),(38,'course_create_active_tools','links','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Links',1,0,0),(39,'course_create_active_tools','announcements','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Announcements',1,0,0),(40,'course_create_active_tools','forums','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Forums',1,0,0),(41,'course_create_active_tools','dropbox','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Dropbox',1,0,0),(42,'course_create_active_tools','quiz','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Quiz',1,0,0),(43,'course_create_active_tools','users','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Users',1,0,0),(44,'course_create_active_tools','groups','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Groups',1,0,0),(45,'course_create_active_tools','chat','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Chat',1,0,0),(46,'course_create_active_tools','online_conference','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'OnlineConference',1,0,0),(47,'course_create_active_tools','student_publications','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'StudentPublications',1,0,0),(48,'allow_personal_agenda',NULL,'radio','User','true','AllowPersonalAgendaTitle','AllowPersonalAgendaComment',NULL,NULL,1,0,0),(49,'display_coursecode_in_courselist',NULL,'radio','Platform','false','DisplayCourseCodeInCourselistTitle','DisplayCourseCodeInCourselistComment',NULL,NULL,1,0,0),(50,'display_teacher_in_courselist',NULL,'radio','Platform','true','DisplayTeacherInCourselistTitle','DisplayTeacherInCourselistComment',NULL,NULL,1,0,0),(51,'permanently_remove_deleted_files',NULL,'radio','Tools','false','PermanentlyRemoveFilesTitle','PermanentlyRemoveFilesComment',NULL,NULL,1,0,1),(52,'dropbox_allow_overwrite',NULL,'radio','Tools','true','DropboxAllowOverwriteTitle','DropboxAllowOverwriteComment',NULL,NULL,1,0,0),(53,'dropbox_max_filesize',NULL,'textfield','Tools','100000000','DropboxMaxFilesizeTitle','DropboxMaxFilesizeComment',NULL,NULL,1,0,0),(54,'dropbox_allow_just_upload',NULL,'radio','Tools','true','DropboxAllowJustUploadTitle','DropboxAllowJustUploadComment',NULL,NULL,1,0,0),(55,'dropbox_allow_student_to_student',NULL,'radio','Tools','true','DropboxAllowStudentToStudentTitle','DropboxAllowStudentToStudentComment',NULL,NULL,1,0,0),(56,'dropbox_allow_group',NULL,'radio','Tools','true','DropboxAllowGroupTitle','DropboxAllowGroupComment',NULL,NULL,1,0,0),(57,'dropbox_allow_mailing',NULL,'radio','Tools','false','DropboxAllowMailingTitle','DropboxAllowMailingComment',NULL,NULL,1,0,0),(58,'administratorTelephone',NULL,'textfield','Platform','(000) 001 02 03','administratorTelephoneTitle','administratorTelephoneComment',NULL,NULL,1,1,0),(59,'extended_profile',NULL,'radio','User','false','ExtendedProfileTitle','ExtendedProfileComment',NULL,NULL,1,0,0),(60,'student_view_enabled',NULL,'radio','Platform','true','StudentViewEnabledTitle','StudentViewEnabledComment',NULL,NULL,1,0,0),(61,'show_navigation_menu',NULL,'radio','Course','false','ShowNavigationMenuTitle','ShowNavigationMenuComment',NULL,NULL,1,0,0),(62,'enable_tool_introduction',NULL,'radio','course','false','EnableToolIntroductionTitle','EnableToolIntroductionComment',NULL,NULL,1,0,0),(63,'page_after_login',NULL,'radio','Platform','index.php','PageAfterLoginTitle','PageAfterLoginComment',NULL,NULL,1,0,0),(64,'time_limit_whosonline',NULL,'textfield','Platform','30','TimeLimitWhosonlineTitle','TimeLimitWhosonlineComment',NULL,NULL,1,0,0),(65,'breadcrumbs_course_homepage',NULL,'radio','Course','course_title','BreadCrumbsCourseHomepageTitle','BreadCrumbsCourseHomepageComment',NULL,NULL,1,0,0),(66,'example_material_course_creation',NULL,'radio','Platform','false','ExampleMaterialCourseCreationTitle','ExampleMaterialCourseCreationComment',NULL,NULL,1,0,0),(67,'account_valid_duration',NULL,'textfield','Platform','3660','AccountValidDurationTitle','AccountValidDurationComment',NULL,NULL,1,0,1),(68,'use_session_mode',NULL,'radio','Session','true','UseSessionModeTitle','UseSessionModeComment',NULL,NULL,1,0,0),(69,'allow_email_editor',NULL,'radio','Tools','false','AllowEmailEditorTitle','AllowEmailEditorComment',NULL,NULL,1,0,0),(70,'registered',NULL,'textfield',NULL,'true','registered',NULL,NULL,NULL,1,0,0),(71,'donotlistcampus',NULL,'textfield',NULL,'false','donotlistcampus',NULL,NULL,NULL,1,0,0),(72,'show_email_addresses',NULL,'radio','Platform','false','ShowEmailAddresses','ShowEmailAddressesComment',NULL,NULL,1,1,0),(73,'profile','phone','checkbox','User','true','ProfileChangesTitle','ProfileChangesComment',NULL,'phone',1,0,0),(74,'service_visio','active','radio',NULL,'false','VisioEnable','',NULL,NULL,1,0,1),(75,'service_visio','visio_host','textfield',NULL,'','VisioHost','',NULL,NULL,1,0,1),(76,'service_visio','visio_port','textfield',NULL,'1935','VisioPort','',NULL,NULL,1,0,1),(77,'service_visio','visio_pass','textfield',NULL,'','VisioPassword','',NULL,NULL,1,0,1),(78,'service_ppt2lp','active','radio',NULL,'false','ppt2lp_actived','',NULL,NULL,1,0,1),(79,'service_ppt2lp','host','textfield',NULL,NULL,'Host',NULL,NULL,NULL,1,0,1),(80,'service_ppt2lp','port','textfield',NULL,'2002','Port',NULL,NULL,NULL,1,0,1),(81,'service_ppt2lp','user','textfield',NULL,NULL,'UserOnHost',NULL,NULL,NULL,1,0,1),(82,'service_ppt2lp','ftp_password','textfield',NULL,NULL,'FtpPassword',NULL,NULL,NULL,1,0,1),(83,'service_ppt2lp','path_to_lzx','textfield',NULL,NULL,'',NULL,NULL,NULL,1,0,1),(84,'service_ppt2lp','size','radio',NULL,'720x540','',NULL,NULL,NULL,1,0,1),(85,'stylesheets',NULL,'textfield','stylesheets','theBsharps','',NULL,NULL,NULL,1,1,0),(86,'upload_extensions_list_type',NULL,'radio','Security','blacklist','UploadExtensionsListType','UploadExtensionsListTypeComment',NULL,NULL,1,0,1),(87,'upload_extensions_blacklist',NULL,'textfield','Security','','UploadExtensionsBlacklist','UploadExtensionsBlacklistComment',NULL,NULL,1,0,1),(88,'upload_extensions_whitelist',NULL,'textfield','Security','htm;html;jpg;jpeg;gif;png;swf;avi;mpg;mpeg;mov;flv;doc;docx;xls;xlsx;ppt;pptx;odt;odp;ods;pdf','UploadExtensionsWhitelist','UploadExtensionsWhitelistComment',NULL,NULL,1,0,1),(89,'upload_extensions_skip',NULL,'radio','Security','true','UploadExtensionsSkip','UploadExtensionsSkipComment',NULL,NULL,1,0,1),(90,'upload_extensions_replace_by',NULL,'textfield','Security','dangerous','UploadExtensionsReplaceBy','UploadExtensionsReplaceByComment',NULL,NULL,1,0,1),(91,'show_number_of_courses',NULL,'radio','Platform','false','ShowNumberOfCourses','ShowNumberOfCoursesComment',NULL,NULL,1,0,0),(92,'show_empty_course_categories',NULL,'radio','Platform','true','ShowEmptyCourseCategories','ShowEmptyCourseCategoriesComment',NULL,NULL,1,0,0),(93,'show_back_link_on_top_of_tree',NULL,'radio','Platform','true','ShowBackLinkOnTopOfCourseTree','ShowBackLinkOnTopOfCourseTreeComment',NULL,NULL,1,0,0),(94,'show_different_course_language',NULL,'radio','Platform','true','ShowDifferentCourseLanguage','ShowDifferentCourseLanguageComment',NULL,NULL,1,1,0),(95,'split_users_upload_directory',NULL,'radio','Tuning','true','SplitUsersUploadDirectory','SplitUsersUploadDirectoryComment',NULL,NULL,1,0,1),(96,'hide_dltt_markup',NULL,'radio','Languages','true','HideDLTTMarkup','HideDLTTMarkupComment',NULL,NULL,1,0,1),(97,'display_categories_on_homepage',NULL,'radio','Platform','false','DisplayCategoriesOnHomepageTitle','DisplayCategoriesOnHomepageComment',NULL,NULL,1,1,0),(98,'permissions_for_new_directories',NULL,'textfield','Security','0777','PermissionsForNewDirs','PermissionsForNewDirsComment',NULL,NULL,1,0,1),(99,'permissions_for_new_files',NULL,'textfield','Security','0600','PermissionsForNewFiles','PermissionsForNewFilesComment',NULL,NULL,1,0,1),(100,'show_tabs','campus_homepage','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsCampusHomepage',1,1,0),(101,'show_tabs','my_courses','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsMyCourses',1,1,0),(102,'show_tabs','reporting','checkbox','Platform','false','ShowTabsTitle','ShowTabsComment',NULL,'TabsReporting',1,1,0),(103,'show_tabs','platform_administration','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsPlatformAdministration',1,1,0),(104,'show_tabs','my_agenda','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsMyAgenda',1,1,0),(105,'show_tabs','my_profile','checkbox','Platform','false','ShowTabsTitle','ShowTabsComment',NULL,'TabsMyProfile',1,1,0),(106,'default_forum_view',NULL,'radio','Course','flat','DefaultForumViewTitle','DefaultForumViewComment',NULL,NULL,1,0,0),(107,'platform_charset',NULL,'textfield','Languages','UTF-8','PlatformCharsetTitle','PlatformCharsetComment','platform',NULL,1,0,1),(108,'noreply_email_address','','textfield','Platform','','NoReplyEmailAddress','NoReplyEmailAddressComment',NULL,NULL,1,0,0),(109,'survey_email_sender_noreply','','radio','Course','coach','SurveyEmailSenderNoReply','SurveyEmailSenderNoReplyComment',NULL,NULL,1,0,0),(110,'openid_authentication',NULL,'radio','Security','false','OpenIdAuthentication','OpenIdAuthenticationComment',NULL,NULL,1,0,0),(111,'profile','openid','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'OpenIDURL',1,0,0),(112,'gradebook_enable',NULL,'radio','Gradebook','false','GradebookActivation','GradebookActivationComment',NULL,NULL,1,0,0),(113,'show_tabs','my_gradebook','checkbox','Platform','false','ShowTabsTitle','ShowTabsComment',NULL,'TabsMyGradebook',1,1,0),(114,'gradebook_score_display_coloring','my_display_coloring','checkbox','Gradebook','false','GradebookScoreDisplayColoring','GradebookScoreDisplayColoringComment',NULL,'TabsGradebookEnableColoring',1,0,0),(115,'gradebook_score_display_custom','my_display_custom','checkbox','Gradebook','false','GradebookScoreDisplayCustom','GradebookScoreDisplayCustomComment',NULL,'TabsGradebookEnableCustom',1,0,0),(116,'gradebook_score_display_colorsplit',NULL,'textfield','Gradebook','50','GradebookScoreDisplayColorSplit','GradebookScoreDisplayColorSplitComment',NULL,NULL,1,0,0),(117,'gradebook_score_display_upperlimit','my_display_upperlimit','checkbox','Gradebook','false','GradebookScoreDisplayUpperLimit','GradebookScoreDisplayUpperLimitComment',NULL,'TabsGradebookEnableUpperLimit',1,0,0),(118,'gradebook_number_decimals',NULL,'select','Gradebook','0','GradebookNumberDecimals','GradebookNumberDecimalsComment',NULL,NULL,1,0,0),(119,'user_selected_theme',NULL,'radio','Platform','false','UserThemeSelection','UserThemeSelectionComment',NULL,NULL,1,0,0),(120,'profile','theme','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'UserTheme',1,0,0),(121,'allow_course_theme',NULL,'radio','Course','true','AllowCourseThemeTitle','AllowCourseThemeComment',NULL,NULL,1,0,0),(122,'show_closed_courses',NULL,'radio','Platform','false','ShowClosedCoursesTitle','ShowClosedCoursesComment',NULL,NULL,1,0,0),(123,'service_visio','visio_use_rtmpt','radio',NULL,'false','VisioUseRtmptTitle','VisioUseRtmptComment',NULL,NULL,1,0,1),(124,'extendedprofile_registration','mycomptetences','checkbox','User','false','ExtendedProfileRegistrationTitle','ExtendedProfileRegistrationComment',NULL,'MyCompetences',1,0,0),(125,'extendedprofile_registration','mydiplomas','checkbox','User','false','ExtendedProfileRegistrationTitle','ExtendedProfileRegistrationComment',NULL,'MyDiplomas',1,0,0),(126,'extendedprofile_registration','myteach','checkbox','User','false','ExtendedProfileRegistrationTitle','ExtendedProfileRegistrationComment',NULL,'MyTeach',1,0,0),(127,'extendedprofile_registration','mypersonalopenarea','checkbox','User','false','ExtendedProfileRegistrationTitle','ExtendedProfileRegistrationComment',NULL,'MyPersonalOpenArea',1,0,0),(128,'extendedprofile_registrationrequired','mycomptetences','checkbox','User','false','ExtendedProfileRegistrationRequiredTitle','ExtendedProfileRegistrationRequiredComment',NULL,'MyCompetences',1,0,0),(129,'extendedprofile_registrationrequired','mydiplomas','checkbox','User','false','ExtendedProfileRegistrationRequiredTitle','ExtendedProfileRegistrationRequiredComment',NULL,'MyDiplomas',1,0,0),(130,'extendedprofile_registrationrequired','myteach','checkbox','User','false','ExtendedProfileRegistrationRequiredTitle','ExtendedProfileRegistrationRequiredComment',NULL,'MyTeach',1,0,0),(131,'extendedprofile_registrationrequired','mypersonalopenarea','checkbox','User','false','ExtendedProfileRegistrationRequiredTitle','ExtendedProfileRegistrationRequiredComment',NULL,'MyPersonalOpenArea',1,0,0),(132,'registration','phone','checkbox','User','false','RegistrationRequiredFormsTitle','RegistrationRequiredFormsComment',NULL,'Phone',1,0,0),(133,'add_users_by_coach',NULL,'radio','Session','false','AddUsersByCoachTitle','AddUsersByCoachComment',NULL,NULL,1,0,0),(134,'extend_rights_for_coach',NULL,'radio','Security','false','ExtendRightsForCoachTitle','ExtendRightsForCoachComment',NULL,NULL,1,0,0),(135,'extend_rights_for_coach_on_survey',NULL,'radio','Security','true','ExtendRightsForCoachOnSurveyTitle','ExtendRightsForCoachOnSurveyComment',NULL,NULL,1,0,0),(136,'course_create_active_tools','wiki','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Wiki',1,0,0),(137,'show_session_coach',NULL,'radio','Session','false','ShowSessionCoachTitle','ShowSessionCoachComment',NULL,NULL,1,0,0),(138,'course_create_active_tools','gradebook','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Gradebook',1,0,0),(139,'allow_users_to_create_courses',NULL,'radio','Platform','true','AllowUsersToCreateCoursesTitle','AllowUsersToCreateCoursesComment',NULL,NULL,1,0,0),(140,'course_create_active_tools','survey','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Survey',1,0,0),(141,'course_create_active_tools','glossary','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Glossary',1,0,0),(142,'course_create_active_tools','notebook','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Notebook',1,0,0),(143,'course_create_active_tools','attendances','checkbox','Tools','false','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Attendances',1,0,0),(144,'course_create_active_tools','course_progress','checkbox','Tools','false','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'CourseProgress',1,0,0),(145,'profile','apikeys','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'ApiKeys',1,0,0),(146,'allow_message_tool',NULL,'radio','Tools','true','AllowMessageToolTitle','AllowMessageToolComment',NULL,NULL,1,1,0),(147,'allow_social_tool',NULL,'radio','Tools','true','AllowSocialToolTitle','AllowSocialToolComment',NULL,NULL,1,1,0),(148,'allow_students_to_browse_courses',NULL,'radio','Platform','true','AllowStudentsToBrowseCoursesTitle','AllowStudentsToBrowseCoursesComment',NULL,NULL,1,1,0),(149,'show_session_data',NULL,'radio','Session','false','ShowSessionDataTitle','ShowSessionDataComment',NULL,NULL,1,1,0),(150,'allow_use_sub_language',NULL,'radio','Languages','false','AllowUseSubLanguageTitle','AllowUseSubLanguageComment',NULL,NULL,1,0,0),(151,'show_glossary_in_documents',NULL,'radio','Course','none','ShowGlossaryInDocumentsTitle','ShowGlossaryInDocumentsComment',NULL,NULL,1,1,0),(152,'allow_terms_conditions',NULL,'radio','Platform','false','AllowTermsAndConditionsTitle','AllowTermsAndConditionsComment',NULL,NULL,1,0,0),(153,'course_create_active_tools','enable_search','checkbox','Tools','false','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Search',1,0,0),(154,'search_enabled',NULL,'radio','Search','true','EnableSearchTitle','EnableSearchComment',NULL,NULL,1,1,0),(155,'search_prefilter_prefix',NULL,NULL,'Search','false','SearchPrefilterPrefix','SearchPrefilterPrefixComment',NULL,NULL,1,0,0),(156,'search_show_unlinked_results',NULL,'radio','Search','false','SearchShowUnlinkedResultsTitle','SearchShowUnlinkedResultsComment',NULL,NULL,1,1,0),(157,'show_courses_descriptions_in_catalog',NULL,'radio','Course','true','ShowCoursesDescriptionsInCatalogTitle','ShowCoursesDescriptionsInCatalogComment',NULL,NULL,1,1,0),(158,'allow_coach_to_edit_course_session',NULL,'radio','Session','true','AllowCoachsToEditInsideTrainingSessions','AllowCoachsToEditInsideTrainingSessionsComment',NULL,NULL,1,0,0),(159,'show_glossary_in_extra_tools',NULL,'radio','Course','none','ShowGlossaryInExtraToolsTitle','ShowGlossaryInExtraToolsComment',NULL,NULL,1,1,0),(160,'send_email_to_admin_when_create_course',NULL,'radio','Platform','false','SendEmailToAdminTitle','SendEmailToAdminComment',NULL,NULL,1,1,0),(161,'go_to_course_after_login',NULL,'radio','Course','false','GoToCourseAfterLoginTitle','GoToCourseAfterLoginComment',NULL,NULL,1,0,0),(162,'math_asciimathML',NULL,'radio','Editor','false','MathASCIImathMLTitle','MathASCIImathMLComment',NULL,NULL,1,0,0),(163,'enabled_asciisvg',NULL,'radio','Editor','false','AsciiSvgTitle','AsciiSvgComment',NULL,NULL,1,0,0),(164,'include_asciimathml_script',NULL,'radio','Editor','false','IncludeAsciiMathMlTitle','IncludeAsciiMathMlComment',NULL,NULL,1,0,0),(165,'youtube_for_students',NULL,'radio','Editor','true','YoutubeForStudentsTitle','YoutubeForStudentsComment',NULL,NULL,1,0,0),(166,'block_copy_paste_for_students',NULL,'radio','Editor','false','BlockCopyPasteForStudentsTitle','BlockCopyPasteForStudentsComment',NULL,NULL,1,0,0),(167,'more_buttons_maximized_mode',NULL,'radio','Editor','true','MoreButtonsForMaximizedModeTitle','MoreButtonsForMaximizedModeComment',NULL,NULL,1,0,0),(168,'students_download_folders',NULL,'radio','Tools','true','AllowStudentsDownloadFoldersTitle','AllowStudentsDownloadFoldersComment',NULL,NULL,1,0,0),(169,'users_copy_files',NULL,'radio','Tools','true','AllowUsersCopyFilesTitle','AllowUsersCopyFilesComment',NULL,NULL,1,1,0),(170,'show_tabs','social','checkbox','Platform','false','ShowTabsTitle','ShowTabsComment',NULL,'TabsSocial',1,0,0),(171,'allow_students_to_create_groups_in_social',NULL,'radio','Tools','false','AllowStudentsToCreateGroupsInSocialTitle','AllowStudentsToCreateGroupsInSocialComment',NULL,NULL,1,0,0),(172,'allow_send_message_to_all_platform_users',NULL,'radio','Tools','true','AllowSendMessageToAllPlatformUsersTitle','AllowSendMessageToAllPlatformUsersComment',NULL,NULL,1,0,0),(173,'message_max_upload_filesize',NULL,'textfield','Tools','20971520','MessageMaxUploadFilesizeTitle','MessageMaxUploadFilesizeComment',NULL,NULL,1,0,0),(174,'show_tabs','dashboard','checkbox','Platform','false','ShowTabsTitle','ShowTabsComment',NULL,'TabsDashboard',1,1,0),(175,'use_users_timezone','timezones','radio','Timezones','true','UseUsersTimezoneTitle','UseUsersTimezoneComment',NULL,'Timezones',1,1,0),(176,'timezone_value','timezones','select','Timezones','Australia/Brisbane','TimezoneValueTitle','TimezoneValueComment',NULL,'Timezones',1,1,0),(177,'allow_user_course_subscription_by_course_admin',NULL,'radio','Security','true','AllowUserCourseSubscriptionByCourseAdminTitle','AllowUserCourseSubscriptionByCourseAdminComment',NULL,NULL,1,1,0),(178,'show_link_bug_notification',NULL,'radio','Platform','true','ShowLinkBugNotificationTitle','ShowLinkBugNotificationComment',NULL,NULL,1,0,0),(179,'course_validation',NULL,'radio','Platform','false','EnableCourseValidation','EnableCourseValidationComment',NULL,NULL,1,1,0),(180,'course_validation_terms_and_conditions_url',NULL,'textfield','Platform','','CourseValidationTermsAndConditionsLink','CourseValidationTermsAndConditionsLinkComment',NULL,NULL,1,1,0),(181,'sso_authentication',NULL,'radio','Security','false','EnableSSOTitle','EnableSSOComment',NULL,NULL,1,1,0),(182,'sso_authentication_domain',NULL,'textfield','Security','','SSOServerDomainTitle','SSOServerDomainComment',NULL,NULL,1,1,0),(183,'sso_authentication_auth_uri',NULL,'textfield','Security','/?q=user','SSOServerAuthURITitle','SSOServerAuthURIComment',NULL,NULL,1,1,0),(184,'sso_authentication_unauth_uri',NULL,'textfield','Security','/?q=logout','SSOServerUnAuthURITitle','SSOServerUnAuthURIComment',NULL,NULL,1,1,0),(185,'sso_authentication_protocol',NULL,'radio','Security','http://','SSOServerProtocolTitle','SSOServerProtocolComment',NULL,NULL,1,1,0),(186,'enabled_wiris',NULL,'radio','Editor','false','EnabledWirisTitle','EnabledWirisComment',NULL,NULL,1,0,0),(187,'allow_spellcheck',NULL,'radio','Editor','true','AllowSpellCheckTitle','AllowSpellCheckComment',NULL,NULL,1,0,0),(188,'force_wiki_paste_as_plain_text',NULL,'radio','Editor','false','ForceWikiPasteAsPlainTextTitle','ForceWikiPasteAsPlainTextComment',NULL,NULL,1,0,0),(189,'enabled_googlemaps',NULL,'radio','Editor','false','EnabledGooglemapsTitle','EnabledGooglemapsComment',NULL,NULL,1,0,0),(190,'enabled_imgmap',NULL,'radio','Editor','true','EnabledImageMapsTitle','EnabledImageMapsComment',NULL,NULL,1,0,0),(191,'enabled_support_svg',NULL,'radio','Tools','true','EnabledSVGTitle','EnabledSVGComment',NULL,NULL,1,0,0),(192,'pdf_export_watermark_enable',NULL,'radio','Platform','false','PDFExportWatermarkEnableTitle','PDFExportWatermarkEnableComment','platform',NULL,1,1,0),(193,'pdf_export_watermark_by_course',NULL,'radio','Platform','false','PDFExportWatermarkByCourseTitle','PDFExportWatermarkByCourseComment','platform',NULL,1,1,0),(194,'pdf_export_watermark_text',NULL,'textfield','Platform','','PDFExportWatermarkTextTitle','PDFExportWatermarkTextComment','platform',NULL,1,1,0),(195,'enabled_insertHtml',NULL,'radio','Editor','true','EnabledInsertHtmlTitle','EnabledInsertHtmlComment',NULL,NULL,1,0,0),(196,'students_export2pdf',NULL,'radio','Tools','true','EnabledStudentExport2PDFTitle','EnabledStudentExport2PDFComment',NULL,NULL,1,0,0),(197,'exercise_min_score',NULL,'textfield','Course','','ExerciseMinScoreTitle','ExerciseMinScoreComment','platform',NULL,1,1,0),(198,'exercise_max_score',NULL,'textfield','Course','','ExerciseMaxScoreTitle','ExerciseMaxScoreComment','platform',NULL,1,1,0),(199,'show_users_folders',NULL,'radio','Tools','true','ShowUsersFoldersTitle','ShowUsersFoldersComment',NULL,NULL,1,0,0),(200,'show_default_folders',NULL,'radio','Tools','true','ShowDefaultFoldersTitle','ShowDefaultFoldersComment',NULL,NULL,1,0,0),(201,'show_chat_folder',NULL,'radio','Tools','true','ShowChatFolderTitle','ShowChatFolderComment',NULL,NULL,1,0,0),(202,'enabled_text2audio',NULL,'radio','Tools','false','Text2AudioTitle','Text2AudioComment',NULL,NULL,1,0,0),(203,'course_hide_tools','course_description','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'CourseDescription',1,1,0),(204,'course_hide_tools','calendar_event','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Agenda',1,1,0),(205,'course_hide_tools','document','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Documents',1,1,0),(206,'course_hide_tools','learnpath','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'LearningPath',1,1,0),(207,'course_hide_tools','link','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Links',1,1,0),(208,'course_hide_tools','announcement','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Announcements',1,1,0),(209,'course_hide_tools','forum','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Forums',1,1,0),(210,'course_hide_tools','dropbox','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Dropbox',1,1,0),(211,'course_hide_tools','quiz','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Quiz',1,1,0),(212,'course_hide_tools','user','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Users',1,1,0),(213,'course_hide_tools','group','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Groups',1,1,0),(214,'course_hide_tools','chat','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Chat',1,1,0),(215,'course_hide_tools','student_publication','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'StudentPublications',1,1,0),(216,'course_hide_tools','wiki','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Wiki',1,1,0),(217,'course_hide_tools','gradebook','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Gradebook',1,1,0),(218,'course_hide_tools','survey','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Survey',1,1,0),(219,'course_hide_tools','glossary','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Glossary',1,1,0),(220,'course_hide_tools','notebook','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Notebook',1,1,0),(221,'course_hide_tools','attendance','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Attendances',1,1,0),(222,'course_hide_tools','course_progress','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'CourseProgress',1,1,0),(223,'course_hide_tools','blog_management','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Blog',1,1,0),(224,'course_hide_tools','tracking','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Stats',1,1,0),(225,'course_hide_tools','course_maintenance','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Maintenance',1,1,0),(226,'course_hide_tools','course_setting','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'CourseSettings',1,1,0),(227,'enabled_support_pixlr',NULL,'radio','Tools','false','EnabledPixlrTitle','EnabledPixlrComment',NULL,NULL,1,0,0),(228,'show_groups_to_users',NULL,'radio','Session','false','ShowGroupsToUsersTitle','ShowGroupsToUsersComment',NULL,NULL,1,0,0),(229,'accessibility_font_resize',NULL,'radio','Platform','false','EnableAccessibilityFontResizeTitle','EnableAccessibilityFontResizeComment',NULL,NULL,1,1,0),(230,'hide_courses_in_sessions',NULL,'radio','Session','false','HideCoursesInSessionsTitle','HideCoursesInSessionsComment','platform',NULL,1,1,0),(231,'enable_quiz_scenario',NULL,'radio','Course','false','EnableQuizScenarioTitle','EnableQuizScenarioComment',NULL,NULL,1,1,0),(232,'enable_nanogong',NULL,'radio','Tools','false','EnableNanogongTitle','EnableNanogongComment',NULL,NULL,1,0,0),(233,'filter_terms',NULL,'textarea','Security','','FilterTermsTitle','FilterTermsComment',NULL,NULL,1,0,0),(234,'header_extra_content',NULL,'textarea','Tracking','','HeaderExtraContentTitle','HeaderExtraContentComment',NULL,NULL,1,1,0),(235,'footer_extra_content',NULL,'textarea','Tracking','','FooterExtraContentTitle','FooterExtraContentComment',NULL,NULL,1,1,0),(236,'show_documents_preview',NULL,'radio','Tools','false','ShowDocumentPreviewTitle','ShowDocumentPreviewComment',NULL,NULL,1,1,0),(237,'htmlpurifier_wiki',NULL,'radio','Editor','false','HtmlPurifierWikiTitle','HtmlPurifierWikiComment',NULL,NULL,1,0,0),(238,'cas_activate',NULL,'radio','CAS','false','CasMainActivateTitle','CasMainActivateComment',NULL,NULL,1,0,1),(239,'cas_server',NULL,'textfield','CAS','','CasMainServerTitle','CasMainServerComment',NULL,NULL,1,0,1),(240,'cas_server_uri',NULL,'textfield','CAS','','CasMainServerURITitle','CasMainServerURIComment',NULL,NULL,1,0,1),(241,'cas_port',NULL,'textfield','CAS','','CasMainPortTitle','CasMainPortComment',NULL,NULL,1,0,1),(242,'cas_protocol',NULL,'radio','CAS','','CasMainProtocolTitle','CasMainProtocolComment',NULL,NULL,1,0,1),(243,'cas_add_user_activate',NULL,'radio','CAS','false','CasUserAddActivateTitle','CasUserAddActivateComment',NULL,NULL,1,0,1),(244,'update_user_info_cas_with_ldap',NULL,'radio','CAS','true','UpdateUserInfoCasWithLdapTitle','UpdateUserInfoCasWithLdapComment',NULL,NULL,1,0,1),(245,'student_page_after_login',NULL,'textfield','Platform','','StudentPageAfterLoginTitle','StudentPageAfterLoginComment',NULL,NULL,1,0,0),(246,'teacher_page_after_login',NULL,'textfield','Platform','','TeacherPageAfterLoginTitle','TeacherPageAfterLoginComment',NULL,NULL,1,0,0),(247,'drh_page_after_login',NULL,'textfield','Platform','','DRHPageAfterLoginTitle','DRHPageAfterLoginComment',NULL,NULL,1,0,0),(248,'sessionadmin_page_after_login',NULL,'textfield','Session','','SessionAdminPageAfterLoginTitle','SessionAdminPageAfterLoginComment',NULL,NULL,1,0,0),(249,'student_autosubscribe',NULL,'textfield','Platform','','StudentAutosubscribeTitle','StudentAutosubscribeComment',NULL,NULL,1,0,0),(250,'teacher_autosubscribe',NULL,'textfield','Platform','','TeacherAutosubscribeTitle','TeacherAutosubscribeComment',NULL,NULL,1,0,0),(251,'drh_autosubscribe',NULL,'textfield','Platform','','DRHAutosubscribeTitle','DRHAutosubscribeComment',NULL,NULL,1,0,0),(252,'sessionadmin_autosubscribe',NULL,'textfield','Session','','SessionadminAutosubscribeTitle','SessionadminAutosubscribeComment',NULL,NULL,1,0,0),(253,'scorm_cumulative_session_time',NULL,'radio','Course','true','ScormCumulativeSessionTimeTitle','ScormCumulativeSessionTimeComment',NULL,NULL,1,0,0),(254,'allow_hr_skills_management',NULL,'radio','Gradebook','true','AllowHRSkillsManagementTitle','AllowHRSkillsManagementComment',NULL,NULL,1,1,0),(255,'enable_help_link',NULL,'radio','Platform','true','EnableHelpLinkTitle','EnableHelpLinkComment',NULL,NULL,1,0,0),(256,'teachers_can_change_score_settings',NULL,'radio','Gradebook','true','TeachersCanChangeScoreSettingsTitle','TeachersCanChangeScoreSettingsComment',NULL,NULL,1,1,0),(257,'allow_users_to_change_email_with_no_password',NULL,'radio','User','false','AllowUsersToChangeEmailWithNoPasswordTitle','AllowUsersToChangeEmailWithNoPasswordComment',NULL,NULL,1,0,0),(258,'show_admin_toolbar',NULL,'radio','Platform','show_to_admin','ShowAdminToolbarTitle','ShowAdminToolbarComment',NULL,NULL,1,1,0),(259,'allow_global_chat',NULL,'radio','Platform','true','AllowGlobalChatTitle','AllowGlobalChatComment',NULL,NULL,1,1,0),(260,'languagePriority1',NULL,'radio','Languages','course_lang','LanguagePriority1Title','LanguagePriority1Comment',NULL,NULL,1,0,1),(261,'languagePriority2',NULL,'radio','Languages','user_profil_lang','LanguagePriority2Title','LanguagePriority2Comment',NULL,NULL,1,0,1),(262,'languagePriority3',NULL,'radio','Languages','user_selected_lang','LanguagePriority3Title','LanguagePriority3Comment',NULL,NULL,1,0,1),(263,'languagePriority4',NULL,'radio','Languages','platform_lang','LanguagePriority4Title','LanguagePriority4Comment',NULL,NULL,1,0,1),(264,'login_is_email',NULL,'radio','Platform','false','LoginIsEmailTitle','LoginIsEmailComment',NULL,NULL,1,0,1),(265,'courses_default_creation_visibility',NULL,'radio','Course','2','CoursesDefaultCreationVisibilityTitle','CoursesDefaultCreationVisibilityComment',NULL,NULL,1,1,0),(266,'allow_browser_sniffer',NULL,'radio','Tuning','false','AllowBrowserSnifferTitle','AllowBrowserSnifferComment',NULL,NULL,1,0,0),(267,'enable_wami_record',NULL,'radio','Tools','false','EnableWamiRecordTitle','EnableWamiRecordComment',NULL,NULL,1,0,0),(268,'gradebook_enable_grade_model',NULL,'radio','Gradebook','false','GradebookEnableGradeModelTitle','GradebookEnableGradeModelComment',NULL,NULL,1,1,0),(269,'teachers_can_change_grade_model_settings',NULL,'radio','Gradebook','true','TeachersCanChangeGradeModelSettingsTitle','TeachersCanChangeGradeModelSettingsComment',NULL,NULL,1,1,0),(270,'gradebook_default_weight',NULL,'textfield','Gradebook','100','GradebookDefaultWeightTitle','GradebookDefaultWeightComment',NULL,NULL,1,0,0),(271,'ldap_description',NULL,'radio','LDAP',NULL,'LdapDescriptionTitle','LdapDescriptionComment',NULL,NULL,1,0,1),(272,'shibboleth_description',NULL,'radio','Shibboleth','false','ShibbolethMainActivateTitle','ShibbolethMainActivateComment',NULL,NULL,1,0,0),(273,'facebook_description',NULL,'radio','Facebook','false','FacebookMainActivateTitle','FacebookMainActivateComment',NULL,NULL,1,0,0),(274,'gradebook_locking_enabled',NULL,'radio','Gradebook','false','GradebookEnableLockingTitle','GradebookEnableLockingComment',NULL,NULL,1,0,0),(275,'gradebook_default_grade_model_id',NULL,'select','Gradebook','','GradebookDefaultGradeModelTitle','GradebookDefaultGradeModelComment',NULL,NULL,1,1,0),(276,'allow_session_admins_to_manage_all_sessions',NULL,'radio','Session','false','AllowSessionAdminsToSeeAllSessionsTitle','AllowSessionAdminsToSeeAllSessionsComment',NULL,NULL,1,1,0),(277,'allow_skills_tool',NULL,'radio','Platform','false','AllowSkillsToolTitle','AllowSkillsToolComment',NULL,NULL,1,1,0),(278,'allow_public_certificates',NULL,'radio','Course','false','AllowPublicCertificatesTitle','AllowPublicCertificatesComment',NULL,NULL,1,1,0),(279,'platform_unsubscribe_allowed',NULL,'radio','Platform','false','PlatformUnsubscribeTitle','PlatformUnsubscribeComment',NULL,NULL,1,1,0),(280,'activate_email_template',NULL,'radio','Platform','true','ActivateEmailTemplateTitle','ActivateEmailTemplateComment',NULL,NULL,1,0,0),(281,'enable_iframe_inclusion',NULL,'radio','Editor','false','EnableIframeInclusionTitle','EnableIframeInclusionComment',NULL,NULL,1,1,0),(282,'show_hot_courses',NULL,'radio','Platform','false','ShowHotCoursesTitle','ShowHotCoursesComment',NULL,NULL,1,1,0),(283,'enable_webcam_clip',NULL,'radio','Tools','false','EnableWebCamClipTitle','EnableWebCamClipComment',NULL,NULL,1,0,0),(284,'use_custom_pages',NULL,'radio','Platform','false','UseCustomPagesTitle','UseCustomPagesComment',NULL,NULL,1,1,0),(285,'tool_visible_by_default_at_creation','documents','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Documents',1,1,0),(286,'tool_visible_by_default_at_creation','learning_path','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'LearningPath',1,1,0),(287,'tool_visible_by_default_at_creation','links','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Links',1,1,0),(288,'tool_visible_by_default_at_creation','announcements','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Announcements',1,1,0),(289,'tool_visible_by_default_at_creation','forums','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Forums',1,1,0),(290,'tool_visible_by_default_at_creation','quiz','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Quiz',1,1,0),(291,'tool_visible_by_default_at_creation','gradebook','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Gradebook',1,1,0),(292,'prevent_session_admins_to_manage_all_users',NULL,'radio','Session','false','PreventSessionAdminsToManageAllUsersTitle','PreventSessionAdminsToManageAllUsersComment',NULL,NULL,1,1,0),(293,'documents_default_visibility_defined_in_course',NULL,'radio','Tools','false','DocumentsDefaultVisibilityDefinedInCourseTitle','DocumentsDefaultVisibilityDefinedInCourseComment',NULL,NULL,1,1,0),(294,'enabled_mathjax',NULL,'radio','Editor','false','EnableMathJaxTitle','EnableMathJaxComment',NULL,NULL,1,0,0),(295,'meta_twitter_site',NULL,'textfield','Tracking','','MetaTwitterSiteTitle','MetaTwitterSiteComment',NULL,NULL,1,1,0),(296,'meta_twitter_creator',NULL,'textfield','Tracking','','MetaTwitterCreatorTitle','MetaTwitterCreatorComment',NULL,NULL,1,1,0),(297,'meta_title',NULL,'textfield','Tracking','','MetaTitleTitle','MetaTitleComment',NULL,NULL,1,1,0),(298,'meta_description',NULL,'textfield','Tracking','','MetaDescriptionTitle','MetaDescriptionComment',NULL,NULL,1,1,0),(299,'meta_image_path',NULL,'textfield','Tracking','','MetaImagePathTitle','MetaImagePathComment',NULL,NULL,1,1,0),(300,'allow_teachers_to_create_sessions',NULL,'radio','Session','false','AllowTeachersToCreateSessionsTitle','AllowTeachersToCreateSessionsComment',NULL,NULL,1,0,0),(301,'institution_address',NULL,'textfield','Platform','','InstitutionAddressTitle','InstitutionAddressComment',NULL,NULL,1,1,0),(302,'chamilo_database_version',NULL,'textfield',NULL,'1.10.0.51','DatabaseVersion','',NULL,NULL,1,0,1),(303,'cron_remind_course_finished_activate',NULL,'radio','Crons','false','CronRemindCourseFinishedActivateTitle','CronRemindCourseFinishedActivateComment',NULL,NULL,1,1,0),(304,'cron_remind_course_expiration_frequency',NULL,'textfield','Crons','2','CronRemindCourseExpirationFrequencyTitle','CronRemindCourseExpirationFrequencyComment',NULL,NULL,1,1,0),(305,'cron_remind_course_expiration_activate',NULL,'radio','Crons','false','CronRemindCourseExpirationActivateTitle','CronRemindCourseExpirationActivateComment',NULL,NULL,1,1,0),(306,'allow_coach_feedback_exercises',NULL,'radio','Session','true','AllowCoachFeedbackExercisesTitle','AllowCoachFeedbackExercisesComment',NULL,NULL,1,0,0),(307,'hide_home_top_when_connected','','radio','Platform','false','HideHomeTopContentWhenLoggedInText','HideHomeTopContentWhenLoggedInComment',NULL,'',1,1,0),(308,'hide_global_announcements_when_not_connected','','radio','Platform','false','HideGlobalAnnouncementsWhenNotLoggedInText','HideGlobalAnnouncementsWhenNotLoggedInComment',NULL,'',1,1,0),(309,'course_creation_use_template','','textfield','Course','','CourseCreationUsesTemplateText','CourseCreationUsesTemplateComment',NULL,'',1,1,0),(310,'allow_strength_pass_checker','','radio','Security','true','EnablePasswordStrengthCheckerText','EnablePasswordStrengthCheckerComment',NULL,'',1,1,0),(311,'allow_captcha','','radio','Security','false','EnableCaptchaText','EnableCaptchaComment',NULL,'',1,1,0),(312,'captcha_number_mistakes_to_block_account','','textfield','Security','5','CaptchaNumberOfMistakesBeforeBlockingAccountText','CaptchaNumberOfMistakesBeforeBlockingAccountComment',NULL,'',1,1,0),(313,'captcha_time_to_block','','textfield','Security','5','CaptchaTimeAccountIsLockedText','CaptchaTimeAccountIsLockedComment',NULL,'',1,1,0),(314,'drh_can_access_all_session_content','','radio','Session','true','DRHAccessToAllSessionContentText','DRHAccessToAllSessionContentComment',NULL,'',1,1,0),(315,'display_groups_forum_in_general_tool','','radio','Tools','true','ShowGroupForaInGeneralToolText','ShowGroupForaInGeneralToolComment',NULL,'',1,1,0),(316,'allow_tutors_to_assign_students_to_session','','radio','Session','false','TutorsCanAssignStudentsToSessionsText','TutorsCanAssignStudentsToSessionsComment',NULL,'',1,1,0),(317,'allow_lp_return_link',NULL,'radio','Course','true','AllowLearningPathReturnLinkTitle','AllowLearningPathReturnLinkComment',NULL,NULL,1,1,0),(318,'hide_scorm_export_link',NULL,'radio','Course','false','HideScormExportLinkTitle','HideScormExportLinkComment',NULL,NULL,1,1,0),(319,'hide_scorm_copy_link',NULL,'radio','Course','false','HideScormCopyLinkTitle','HideScormCopyLinkComment',NULL,NULL,1,1,0),(320,'hide_scorm_pdf_link',NULL,'radio','Course','false','HideScormPdfLinkTitle','HideScormPdfLinkComment',NULL,NULL,1,1,0),(321,'session_days_before_coach_access',NULL,'textfield','Session','0','SessionDaysBeforeCoachAccessTitle','SessionDaysBeforeCoachAccessComment',NULL,NULL,1,1,0),(322,'session_days_after_coach_access',NULL,'textfield','Session','0','SessionDaysAfterCoachAccessTitle','SessionDaysAfterCoachAccessComment',NULL,NULL,1,1,0),(323,'pdf_logo_header',NULL,'radio','Course','false','PdfLogoHeaderTitle','PdfLogoHeaderComment',NULL,NULL,1,1,0),(324,'order_user_list_by_official_code',NULL,'radio','Platform','false','OrderUserListByOfficialCodeTitle','OrderUserListByOfficialCodeComment',NULL,NULL,1,1,0),(325,'email_alert_manager_on_new_quiz',NULL,'radio','Tools','true','AlertManagerOnNewQuizTitle','AlertManagerOnNewQuizComment',NULL,NULL,1,1,0),(326,'show_official_code_exercise_result_list',NULL,'radio','Tools','false','ShowOfficialCodeInExerciseResultListTitle','ShowOfficialCodeInExerciseResultListComment',NULL,NULL,1,1,0),(327,'course_catalog_hide_private',NULL,'radio','Platform','false','HidePrivateCoursesFromCourseCatalogTitle','HidePrivateCoursesFromCourseCatalogComment',NULL,NULL,1,1,0),(328,'catalog_show_courses_sessions',NULL,'radio','Platform','0','CoursesCatalogueShowSessionsTitle','CoursesCatalogueShowSessionsComment',NULL,NULL,1,1,0),(329,'auto_detect_language_custom_pages',NULL,'radio','Platform','true','AutoDetectLanguageCustomPagesTitle','AutoDetectLanguageCustomPagesComment',NULL,NULL,1,1,0),(330,'lp_show_reduced_report',NULL,'radio','Tools','false','LearningPathShowReducedReportTitle','LearningPathShowReducedReportComment',NULL,NULL,1,1,0),(331,'allow_session_course_copy_for_teachers',NULL,'radio','Session','false','AllowSessionCourseCopyForTeachersTitle','AllowSessionCourseCopyForTeachersComment',NULL,NULL,1,1,0),(332,'hide_logout_button',NULL,'radio','Platform','false','HideLogoutButtonTitle','HideLogoutButtonComment',NULL,NULL,1,1,0),(333,'redirect_admin_to_courses_list',NULL,'radio','Platform','false','RedirectAdminToCoursesListTitle','RedirectAdminToCoursesListComment',NULL,NULL,1,1,0),(334,'course_images_in_courses_list',NULL,'radio','Course','false','CourseImagesInCoursesListTitle','CourseImagesInCoursesListComment',NULL,NULL,1,1,0),(335,'student_publication_to_take_in_gradebook',NULL,'radio','Gradebook','first','StudentPublicationSelectionForGradebookTitle','StudentPublicationSelectionForGradebookComment',NULL,NULL,1,1,0),(336,'certificate_filter_by_official_code',NULL,'radio','Gradebook','false','FilterCertificateByOfficialCodeTitle','FilterCertificateByOfficialCodeComment',NULL,NULL,1,1,0),(337,'exercise_max_ckeditors_in_page',NULL,'textfield','Tools','0','MaxCKeditorsOnExerciseResultsPageTitle','MaxCKeditorsOnExerciseResultsPageComment',NULL,NULL,1,1,0),(338,'document_if_file_exists_option',NULL,'radio','Tools','rename','DocumentDefaultOptionIfFileExistsTitle','DocumentDefaultOptionIfFileExistsComment',NULL,NULL,1,1,0),(339,'add_gradebook_certificates_cron_task_enabled',NULL,'radio','Tools','false','GradebookCronTaskGenerationTitle','GradebookCronTaskGenerationComment',NULL,NULL,1,1,0),(340,'openbadges_backpack',NULL,'textfield','Gradebook','https://backpack.openbadges.org/','OpenBadgesBackpackUrlTitle','OpenBadgesBackpackUrlComment',NULL,NULL,1,1,0),(341,'cookie_warning',NULL,'radio','Tools','false','CookieWarningTitle','CookieWarningComment',NULL,NULL,1,1,0),(342,'hide_course_group_if_no_tools_available',NULL,'radio','Tools','false','HideCourseGroupIfNoToolAvailableTitle','HideCourseGroupIfNoToolAvailableComment',NULL,NULL,1,1,0),(343,'catalog_allow_session_auto_subscription',NULL,'radio','Session','false','CatalogueAllowSessionAutoSubscriptionTitle','CatalogueAllowSessionAutoSubscriptionTitle',NULL,NULL,1,1,0),(344,'registration.soap.php.decode_utf8',NULL,'radio','Platform','false','SoapRegistrationDecodeUtf8Title','SoapRegistrationDecodeUtf8Comment',NULL,NULL,1,1,0),(345,'allow_delete_attendance',NULL,'radio','Tools','false','AttendanceDeletionEnableTitle','AttendanceDeletionEnableComment',NULL,NULL,1,1,0),(346,'gravatar_enabled',NULL,'radio','Platform','false','GravatarPicturesTitle','GravatarPicturesComment',NULL,NULL,1,1,0),(347,'gravatar_type',NULL,'radio','Platform','mm','GravatarPicturesTypeTitle','GravatarPicturesTypeComment',NULL,NULL,1,1,0),(348,'limit_session_admin_role',NULL,'radio','Session','false','SessionAdminPermissionsLimitTitle','SessionAdminPermissionsLimitComment',NULL,NULL,1,1,0),(349,'show_session_description',NULL,'radio','Session','false','ShowSessionDescriptionTitle','ShowSessionDescriptionComment',NULL,NULL,1,1,0),(350,'hide_certificate_export_link_students',NULL,'radio','Gradebook','false','CertificateHideExportLinkStudentTitle','CertificateHideExportLinkStudentComment',NULL,NULL,1,1,0),(351,'hide_certificate_export_link',NULL,'radio','Gradebook','false','CertificateHideExportLinkTitle','CertificateHideExportLinkComment',NULL,NULL,1,1,0),(352,'dropbox_hide_course_coach',NULL,'radio','Tools','false','DropboxHideCourseCoachTitle','DropboxHideCourseCoachComment',NULL,NULL,1,1,0),(353,'dropbox_hide_general_coach',NULL,'radio','Tools','false','DropboxHideGeneralCoachTitle','DropboxHideGeneralCoachComment',NULL,NULL,1,1,0),(354,'sso_force_redirect',NULL,'radio','Security','false','SSOForceRedirectTitle','SSOForceRedirectComment',NULL,NULL,1,1,0),(355,'session_course_ordering',NULL,'radio','Session','false','SessionCourseOrderingTitle','SessionCourseOrderingComment',NULL,NULL,1,1,0),(356,'gamification_mode',NULL,'radio','Platform','1','GamificationModeTitle','GamificationModeComment',NULL,NULL,1,1,0),(357,'prevent_multiple_simultaneous_login',NULL,'radio','Security','false','PreventMultipleSimultaneousLoginTitle','PreventMultipleSimultaneousLoginComment',NULL,NULL,1,0,0),(358,'gradebook_detailed_admin_view',NULL,'radio','Gradebook','false','ShowAdditionalColumnsInStudentResultsPageTitle','ShowAdditionalColumnsInStudentResultsPageComment',NULL,NULL,1,1,0),(359,'course_catalog_published',NULL,'radio','Course','false','CourseCatalogIsPublicTitle','CourseCatalogIsPublicComment',NULL,NULL,1,0,0),(360,'user_reset_password',NULL,'radio','Security','false','ResetPasswordTokenTitle','ResetPasswordTokenComment',NULL,NULL,1,0,0),(361,'user_reset_password_token_limit',NULL,'textfield','Security','3600','ResetPasswordTokenLimitTitle','ResetPasswordTokenLimitComment',NULL,NULL,1,0,0),(362,'my_courses_view_by_session',NULL,'radio','Session','false','ViewMyCoursesListBySessionTitle','ViewMyCoursesListBySessionComment',NULL,NULL,1,0,0),(363,'show_full_skill_name_on_skill_wheel',NULL,'radio','Platform','false','ShowFullSkillNameOnSkillWheelTitle','ShowFullSkillNameOnSkillWheelComment',NULL,NULL,1,1,0),(473,'status','bbb','setting','Plugins','installed','bbb',NULL,NULL,NULL,1,1,0),(486,'bbb_tool_enable','bbb','setting','Plugins','true','bbb',NULL,NULL,NULL,1,1,0),(487,'bbb_host','bbb','setting','Plugins','http://52.62.242.210','bbb',NULL,NULL,NULL,1,1,0),(488,'bbb_salt','bbb','setting','Plugins','04c5360f439c3365ee7d63ea46e4e9df','bbb',NULL,NULL,NULL,1,1,0),(489,'bbb_enable_global_conference','bbb','setting','Plugins','true','bbb',NULL,NULL,NULL,1,1,0),(490,'bbb_enable_conference_in_course_groups','bbb','setting','Plugins','true','bbb',NULL,NULL,NULL,1,1,0),(491,'bbb_submit_button','bbb','setting','Plugins','','bbb',NULL,NULL,NULL,1,1,0);
/*!40000 ALTER TABLE `settings_current` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_options`
--

DROP TABLE IF EXISTS `settings_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_setting_option` (`variable`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_options`
--

LOCK TABLES `settings_options` WRITE;
/*!40000 ALTER TABLE `settings_options` DISABLE KEYS */;
INSERT INTO `settings_options` VALUES (1,'show_administrator_data','true','Yes'),(2,'show_administrator_data','false','No'),(3,'show_tutor_data','true','Yes'),(4,'show_tutor_data','false','No'),(5,'show_teacher_data','true','Yes'),(6,'show_teacher_data','false','No'),(7,'homepage_view','activity','HomepageViewActivity'),(8,'homepage_view','2column','HomepageView2column'),(9,'homepage_view','3column','HomepageView3column'),(10,'homepage_view','vertical_activity','HomepageViewVerticalActivity'),(11,'homepage_view','activity_big','HomepageViewActivityBig'),(12,'show_toolshortcuts','true','Yes'),(13,'show_toolshortcuts','false','No'),(14,'allow_group_categories','true','Yes'),(15,'allow_group_categories','false','No'),(16,'server_type','production','ProductionServer'),(17,'server_type','test','TestServer'),(18,'allow_name_change','true','Yes'),(19,'allow_name_change','false','No'),(20,'allow_officialcode_change','true','Yes'),(21,'allow_officialcode_change','false','No'),(22,'allow_registration','true','Yes'),(23,'allow_registration','false','No'),(24,'allow_registration','approval','AfterApproval'),(25,'allow_registration_as_teacher','true','Yes'),(26,'allow_registration_as_teacher','false','No'),(27,'allow_lostpassword','true','Yes'),(28,'allow_lostpassword','false','No'),(29,'allow_user_headings','true','Yes'),(30,'allow_user_headings','false','No'),(31,'allow_personal_agenda','true','Yes'),(32,'allow_personal_agenda','false','No'),(33,'display_coursecode_in_courselist','true','Yes'),(34,'display_coursecode_in_courselist','false','No'),(35,'display_teacher_in_courselist','true','Yes'),(36,'display_teacher_in_courselist','false','No'),(37,'permanently_remove_deleted_files','true','YesWillDeletePermanently'),(38,'permanently_remove_deleted_files','false','NoWillDeletePermanently'),(39,'dropbox_allow_overwrite','true','Yes'),(40,'dropbox_allow_overwrite','false','No'),(41,'dropbox_allow_just_upload','true','Yes'),(42,'dropbox_allow_just_upload','false','No'),(43,'dropbox_allow_student_to_student','true','Yes'),(44,'dropbox_allow_student_to_student','false','No'),(45,'dropbox_allow_group','true','Yes'),(46,'dropbox_allow_group','false','No'),(47,'dropbox_allow_mailing','true','Yes'),(48,'dropbox_allow_mailing','false','No'),(49,'extended_profile','true','Yes'),(50,'extended_profile','false','No'),(51,'student_view_enabled','true','Yes'),(52,'student_view_enabled','false','No'),(53,'show_navigation_menu','false','No'),(54,'show_navigation_menu','icons','IconsOnly'),(55,'show_navigation_menu','text','TextOnly'),(56,'show_navigation_menu','iconstext','IconsText'),(57,'enable_tool_introduction','true','Yes'),(58,'enable_tool_introduction','false','No'),(59,'page_after_login','index.php','CampusHomepage'),(60,'page_after_login','user_portal.php','MyCourses'),(61,'page_after_login','main/auth/courses.php','CourseCatalog'),(62,'breadcrumbs_course_homepage','get_lang','CourseHomepage'),(63,'breadcrumbs_course_homepage','course_code','CourseCode'),(64,'breadcrumbs_course_homepage','course_title','CourseTitle'),(65,'example_material_course_creation','true','Yes'),(66,'example_material_course_creation','false','No'),(67,'use_session_mode','true','Yes'),(68,'use_session_mode','false','No'),(69,'allow_email_editor','true','Yes'),(70,'allow_email_editor','false','No'),(71,'show_email_addresses','true','Yes'),(72,'show_email_addresses','false','No'),(73,'upload_extensions_list_type','blacklist','Blacklist'),(74,'upload_extensions_list_type','whitelist','Whitelist'),(75,'upload_extensions_skip','true','Remove'),(76,'upload_extensions_skip','false','Rename'),(77,'show_number_of_courses','true','Yes'),(78,'show_number_of_courses','false','No'),(79,'show_empty_course_categories','true','Yes'),(80,'show_empty_course_categories','false','No'),(81,'show_back_link_on_top_of_tree','true','Yes'),(82,'show_back_link_on_top_of_tree','false','No'),(83,'show_different_course_language','true','Yes'),(84,'show_different_course_language','false','No'),(85,'split_users_upload_directory','true','Yes'),(86,'split_users_upload_directory','false','No'),(87,'hide_dltt_markup','false','No'),(88,'hide_dltt_markup','true','Yes'),(89,'display_categories_on_homepage','true','Yes'),(90,'display_categories_on_homepage','false','No'),(91,'default_forum_view','flat','Flat'),(92,'default_forum_view','threaded','Threaded'),(93,'default_forum_view','nested','Nested'),(94,'survey_email_sender_noreply','coach','CourseCoachEmailSender'),(95,'survey_email_sender_noreply','noreply','NoReplyEmailSender'),(96,'openid_authentication','true','Yes'),(97,'openid_authentication','false','No'),(98,'gradebook_enable','true','Yes'),(99,'gradebook_enable','false','No'),(100,'user_selected_theme','true','Yes'),(101,'user_selected_theme','false','No'),(102,'allow_course_theme','true','Yes'),(103,'allow_course_theme','false','No'),(104,'show_closed_courses','true','Yes'),(105,'show_closed_courses','false','No'),(106,'ldap_version','2','LDAPVersion2'),(107,'ldap_version','3','LDAPVersion3'),(108,'visio_use_rtmpt','true','Yes'),(109,'visio_use_rtmpt','false','No'),(110,'add_users_by_coach','true','Yes'),(111,'add_users_by_coach','false','No'),(112,'extend_rights_for_coach','true','Yes'),(113,'extend_rights_for_coach','false','No'),(114,'extend_rights_for_coach_on_survey','true','Yes'),(115,'extend_rights_for_coach_on_survey','false','No'),(116,'show_session_coach','true','Yes'),(117,'show_session_coach','false','No'),(118,'allow_users_to_create_courses','true','Yes'),(119,'allow_users_to_create_courses','false','No'),(120,'breadcrumbs_course_homepage','session_name_and_course_title','SessionNameAndCourseTitle'),(121,'allow_message_tool','true','Yes'),(122,'allow_message_tool','false','No'),(123,'allow_social_tool','true','Yes'),(124,'allow_social_tool','false','No'),(125,'allow_students_to_browse_courses','true','Yes'),(126,'allow_students_to_browse_courses','false','No'),(127,'show_email_of_teacher_or_tutor ','true','Yes'),(128,'show_email_of_teacher_or_tutor ','false','No'),(129,'show_session_data ','true','Yes'),(130,'show_session_data ','false','No'),(131,'allow_use_sub_language','true','Yes'),(132,'allow_use_sub_language','false','No'),(133,'show_glossary_in_documents','none','ShowGlossaryInDocumentsIsNone'),(134,'show_glossary_in_documents','ismanual','ShowGlossaryInDocumentsIsManual'),(135,'show_glossary_in_documents','isautomatic','ShowGlossaryInDocumentsIsAutomatic'),(136,'allow_terms_conditions','true','Yes'),(137,'allow_terms_conditions','false','No'),(138,'search_enabled','true','Yes'),(139,'search_enabled','false','No'),(140,'search_show_unlinked_results','true','SearchShowUnlinkedResults'),(141,'search_show_unlinked_results','false','SearchHideUnlinkedResults'),(142,'show_courses_descriptions_in_catalog','true','Yes'),(143,'show_courses_descriptions_in_catalog','false','No'),(144,'allow_coach_to_edit_course_session','true','Yes'),(145,'allow_coach_to_edit_course_session','false','No'),(146,'show_glossary_in_extra_tools','none','None'),(147,'show_glossary_in_extra_tools','exercise','Exercise'),(148,'show_glossary_in_extra_tools','lp','Learning path'),(149,'show_glossary_in_extra_tools','exercise_and_lp','ExerciseAndLearningPath'),(150,'send_email_to_admin_when_create_course','true','Yes'),(151,'send_email_to_admin_when_create_course','false','No'),(152,'go_to_course_after_login','true','Yes'),(153,'go_to_course_after_login','false','No'),(154,'math_asciimathML','true','Yes'),(155,'math_asciimathML','false','No'),(156,'enabled_asciisvg','true','Yes'),(157,'enabled_asciisvg','false','No'),(158,'include_asciimathml_script','true','Yes'),(159,'include_asciimathml_script','false','No'),(160,'youtube_for_students','true','Yes'),(161,'youtube_for_students','false','No'),(162,'block_copy_paste_for_students','true','Yes'),(163,'block_copy_paste_for_students','false','No'),(164,'more_buttons_maximized_mode','true','Yes'),(165,'more_buttons_maximized_mode','false','No'),(166,'students_download_folders','true','Yes'),(167,'students_download_folders','false','No'),(168,'users_copy_files','true','Yes'),(169,'users_copy_files','false','No'),(170,'allow_students_to_create_groups_in_social','true','Yes'),(171,'allow_students_to_create_groups_in_social','false','No'),(172,'allow_send_message_to_all_platform_users','true','Yes'),(173,'allow_send_message_to_all_platform_users','false','No'),(174,'use_users_timezone','true','Yes'),(175,'use_users_timezone','false','No'),(176,'allow_user_course_subscription_by_course_admin','true','Yes'),(177,'allow_user_course_subscription_by_course_admin','false','No'),(178,'show_link_bug_notification','true','Yes'),(179,'show_link_bug_notification','false','No'),(180,'course_validation','true','Yes'),(181,'course_validation','false','No'),(182,'sso_authentication','true','Yes'),(183,'sso_authentication','false','No'),(184,'sso_authentication_protocol','http://','http://'),(185,'sso_authentication_protocol','https://','https://'),(186,'enabled_wiris','true','Yes'),(187,'enabled_wiris','false','No'),(188,'allow_spellcheck','true','Yes'),(189,'allow_spellcheck','false','No'),(190,'force_wiki_paste_as_plain_text','true','Yes'),(191,'force_wiki_paste_as_plain_text','false','No'),(192,'enabled_googlemaps','true','Yes'),(193,'enabled_googlemaps','false','No'),(194,'enabled_imgmap','true','Yes'),(195,'enabled_imgmap','false','No'),(196,'enabled_support_svg','true','Yes'),(197,'enabled_support_svg','false','No'),(198,'pdf_export_watermark_enable','true','Yes'),(199,'pdf_export_watermark_enable','false','No'),(200,'pdf_export_watermark_by_course','true','Yes'),(201,'pdf_export_watermark_by_course','false','No'),(202,'enabled_insertHtml','true','Yes'),(203,'enabled_insertHtml','false','No'),(204,'students_export2pdf','true','Yes'),(205,'students_export2pdf','false','No'),(206,'show_users_folders','true','Yes'),(207,'show_users_folders','false','No'),(208,'show_default_folders','true','Yes'),(209,'show_default_folders','false','No'),(210,'show_chat_folder','true','Yes'),(211,'show_chat_folder','false','No'),(212,'enabled_text2audio','true','Yes'),(213,'enabled_text2audio','false','No'),(214,'enabled_support_pixlr','true','Yes'),(215,'enabled_support_pixlr','false','No'),(216,'show_groups_to_users','true','Yes'),(217,'show_groups_to_users','false','No'),(218,'accessibility_font_resize','true','Yes'),(219,'accessibility_font_resize','false','No'),(220,'hide_courses_in_sessions','true','Yes'),(221,'hide_courses_in_sessions','false','No'),(222,'enable_quiz_scenario','true','Yes'),(223,'enable_quiz_scenario','false','No'),(224,'enable_nanogong','true','Yes'),(225,'enable_nanogong','false','No'),(226,'show_documents_preview','true','Yes'),(227,'show_documents_preview','false','No'),(228,'htmlpurifier_wiki','true','Yes'),(229,'htmlpurifier_wiki','false','No'),(230,'cas_activate','true','Yes'),(231,'cas_activate','false','No'),(232,'cas_protocol','CAS1','CAS1Text'),(233,'cas_protocol','CAS2','CAS2Text'),(234,'cas_protocol','SAML','SAMLText'),(235,'cas_add_user_activate','false','No'),(236,'cas_add_user_activate','platform','casAddUserActivatePlatform'),(237,'cas_add_user_activate','extldap','casAddUserActivateLDAP'),(238,'update_user_info_cas_with_ldap','true','Yes'),(239,'update_user_info_cas_with_ldap','false','No'),(240,'scorm_cumulative_session_time','true','Yes'),(241,'scorm_cumulative_session_time','false','No'),(242,'allow_hr_skills_management','true','Yes'),(243,'allow_hr_skills_management','false','No'),(244,'enable_help_link','true','Yes'),(245,'enable_help_link','false','No'),(246,'allow_users_to_change_email_with_no_password','true','Yes'),(247,'allow_users_to_change_email_with_no_password','false','No'),(248,'show_admin_toolbar','do_not_show','DoNotShow'),(249,'show_admin_toolbar','show_to_admin','ShowToAdminsOnly'),(250,'show_admin_toolbar','show_to_admin_and_teachers','ShowToAdminsAndTeachers'),(251,'show_admin_toolbar','show_to_all','ShowToAllUsers'),(252,'use_custom_pages','true','Yes'),(253,'use_custom_pages','false','No'),(254,'languagePriority1','platform_lang','PlatformLanguage'),(255,'languagePriority1','user_profil_lang','UserLanguage'),(256,'languagePriority1','user_selected_lang','UserSelectedLanguage'),(257,'languagePriority1','course_lang','CourseLanguage'),(258,'languagePriority2','platform_lang','PlatformLanguage'),(259,'languagePriority2','user_profil_lang','UserLanguage'),(260,'languagePriority2','user_selected_lang','UserSelectedLanguage'),(261,'languagePriority2','course_lang','CourseLanguage'),(262,'languagePriority3','platform_lang','PlatformLanguage'),(263,'languagePriority3','user_profil_lang','UserLanguage'),(264,'languagePriority3','user_selected_lang','UserSelectedLanguage'),(265,'languagePriority3','course_lang','CourseLanguage'),(266,'languagePriority4','platform_lang','PlatformLanguage'),(267,'languagePriority4','user_profil_lang','UserLanguage'),(268,'languagePriority4','user_selected_lang','UserSelectedLanguage'),(269,'languagePriority4','course_lang','CourseLanguage'),(270,'allow_global_chat','true','Yes'),(271,'allow_global_chat','false','No'),(272,'login_is_email','true','Yes'),(273,'login_is_email','false','No'),(274,'courses_default_creation_visibility','3','OpenToTheWorld'),(275,'courses_default_creation_visibility','2','OpenToThePlatform'),(276,'courses_default_creation_visibility','1','Private'),(277,'courses_default_creation_visibility','0','CourseVisibilityClosed'),(278,'allow_browser_sniffer','true','Yes'),(279,'allow_browser_sniffer','false','No'),(280,'enable_wami_record','true','Yes'),(281,'enable_wami_record','false','No'),(282,'teachers_can_change_score_settings','true','Yes'),(283,'teachers_can_change_score_settings','false','No'),(284,'teachers_can_change_grade_model_settings','true','Yes'),(285,'teachers_can_change_grade_model_settings','false','No'),(286,'gradebook_locking_enabled','true','Yes'),(287,'gradebook_locking_enabled','false','No'),(288,'gradebook_enable_grade_model','true','Yes'),(289,'gradebook_enable_grade_model','false','No'),(290,'allow_session_admins_to_manage_all_sessions','true','Yes'),(291,'allow_session_admins_to_manage_all_sessions','false','No'),(292,'allow_skills_tool','true','Yes'),(293,'allow_skills_tool','false','No'),(294,'allow_public_certificates','true','Yes'),(295,'allow_public_certificates','false','No'),(296,'platform_unsubscribe_allowed','true','Yes'),(297,'platform_unsubscribe_allowed','false','No'),(298,'activate_email_template','true','Yes'),(299,'activate_email_template','false','No'),(300,'enable_iframe_inclusion','true','Yes'),(301,'enable_iframe_inclusion','false','No'),(302,'show_hot_courses','true','Yes'),(303,'show_hot_courses','false','No'),(304,'enable_webcam_clip','true','Yes'),(305,'enable_webcam_clip','false','No'),(306,'prevent_session_admins_to_manage_all_users','true','Yes'),(307,'prevent_session_admins_to_manage_all_users','false','No'),(308,'documents_default_visibility_defined_in_course','true','Yes'),(309,'documents_default_visibility_defined_in_course','false','No'),(310,'enabled_mathjax','true','Yes'),(311,'enabled_mathjax','false','No'),(312,'allow_teachers_to_create_sessions','true','Yes'),(313,'allow_teachers_to_create_sessions','false','No'),(314,'cron_remind_course_finished_activate','false','No'),(315,'cron_remind_course_finished_activate','true','Yes'),(316,'cron_remind_course_expiration_activate','false','No'),(317,'cron_remind_course_expiration_activate','true','Yes'),(318,'allow_coach_feedback_exercises','true','Yes'),(319,'allow_coach_feedback_exercises','false','No'),(320,'hide_home_top_when_connected','true','Yes'),(321,'hide_home_top_when_connected','false','No'),(322,'hide_global_announcements_when_not_connected','true','Yes'),(323,'hide_global_announcements_when_not_connected','false','No'),(324,'allow_strength_pass_checker','true','Yes'),(325,'allow_strength_pass_checker','false','No'),(326,'allow_captcha','true','Yes'),(327,'allow_captcha','false','No'),(328,'drh_can_access_all_session_content','true','Yes'),(329,'drh_can_access_all_session_content','false','No'),(330,'display_groups_forum_in_general_tool','true','Yes'),(331,'display_groups_forum_in_general_tool','false','No'),(332,'allow_tutors_to_assign_students_to_session','true','Yes'),(333,'allow_tutors_to_assign_students_to_session','false','No'),(334,'allow_lp_return_link','true','Yes'),(335,'allow_lp_return_link','false','No'),(336,'hide_scorm_export_link','true','Yes'),(337,'hide_scorm_export_link','false','No'),(338,'hide_scorm_copy_link','true','Yes'),(339,'hide_scorm_copy_link','false','No'),(340,'hide_scorm_pdf_link','true','Yes'),(341,'hide_scorm_pdf_link','false','No'),(342,'pdf_logo_header','true','Yes'),(343,'pdf_logo_header','false','No'),(344,'order_user_list_by_official_code','true','Yes'),(345,'order_user_list_by_official_code','false','No'),(346,'email_alert_manager_on_new_quiz','true','Yes'),(347,'email_alert_manager_on_new_quiz','false','No'),(348,'show_official_code_exercise_result_list','true','Yes'),(349,'show_official_code_exercise_result_list','false','No'),(350,'course_catalog_hide_private','true','Yes'),(351,'course_catalog_hide_private','false','No'),(352,'catalog_show_courses_sessions','0','CatalogueShowOnlyCourses'),(353,'catalog_show_courses_sessions','1','CatalogueShowOnlySessions'),(354,'catalog_show_courses_sessions','2','CatalogueShowCoursesAndSessions'),(355,'auto_detect_language_custom_pages','true','Yes'),(356,'auto_detect_language_custom_pages','false','No'),(357,'lp_show_reduced_report','true','Yes'),(358,'lp_show_reduced_report','false','No'),(359,'allow_session_course_copy_for_teachers','true','Yes'),(360,'allow_session_course_copy_for_teachers','false','No'),(361,'hide_logout_button','true','Yes'),(362,'hide_logout_button','false','No'),(363,'redirect_admin_to_courses_list','true','Yes'),(364,'redirect_admin_to_courses_list','false','No'),(365,'course_images_in_courses_list','true','Yes'),(366,'course_images_in_courses_list','false','No'),(367,'student_publication_to_take_in_gradebook','first','First'),(368,'student_publication_to_take_in_gradebook','last','Last'),(369,'certificate_filter_by_official_code','true','Yes'),(370,'certificate_filter_by_official_code','false','No'),(371,'document_if_file_exists_option','rename','Rename'),(372,'document_if_file_exists_option','overwrite','Overwrite'),(373,'add_gradebook_certificates_cron_task_enabled','true','Yes'),(374,'add_gradebook_certificates_cron_task_enabled','false','No'),(375,'cookie_warning','true','Yes'),(376,'cookie_warning','false','No'),(377,'hide_course_group_if_no_tools_available','true','Yes'),(378,'hide_course_group_if_no_tools_available','false','No'),(379,'catalog_allow_session_auto_subscription','true','Yes'),(380,'catalog_allow_session_auto_subscription','false','No'),(381,'registration.soap.php.decode_utf8','true','Yes'),(382,'registration.soap.php.decode_utf8','false','No'),(383,'allow_delete_attendance','true','Yes'),(384,'allow_delete_attendance','false','No'),(385,'gravatar_enabled','true','Yes'),(386,'gravatar_enabled','false','No'),(387,'gravatar_type','mm','mistery-man'),(388,'gravatar_type','identicon','identicon'),(389,'gravatar_type','monsterid','monsterid'),(390,'gravatar_type','wavatar','wavatar'),(391,'limit_session_admin_role','true','Yes'),(392,'limit_session_admin_role','false','No'),(393,'show_session_description','true','Yes'),(394,'show_session_description','false','No'),(395,'hide_certificate_export_link_students','true','Yes'),(396,'hide_certificate_export_link_students','false','No'),(397,'hide_certificate_export_link','true','Yes'),(398,'hide_certificate_export_link','false','No'),(399,'dropbox_hide_course_coach','true','Yes'),(400,'dropbox_hide_course_coach','false','No'),(401,'dropbox_hide_general_coach','true','Yes'),(402,'dropbox_hide_general_coach','false','No'),(403,'sso_force_redirect','true','Yes'),(404,'sso_force_redirect','false','No'),(405,'session_course_ordering','true','Yes'),(406,'session_course_ordering','false','No'),(407,'gamification_mode','1','Yes'),(408,'gamification_mode','0','No'),(409,'prevent_multiple_simultaneous_login','true','Yes'),(410,'prevent_multiple_simultaneous_login','false','No'),(411,'gradebook_detailed_admin_view','true','Yes'),(412,'gradebook_detailed_admin_view','false','No'),(413,'course_catalog_published','true','Yes'),(414,'course_catalog_published','false','No'),(415,'user_reset_password','true','Yes'),(416,'user_reset_password','false','No'),(417,'my_courses_view_by_session','true','Yes'),(418,'my_courses_view_by_session','false','No'),(419,'show_full_skill_name_on_skill_wheel','true','Yes'),(420,'show_full_skill_name_on_skill_wheel','false','No');
/*!40000 ALTER TABLE `settings_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_survey`
--

DROP TABLE IF EXISTS `shared_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_survey` (
  `survey_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `subtitle` longtext COLLATE utf8_unicode_ci,
  `author` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `surveythanks` longtext COLLATE utf8_unicode_ci,
  `creation_date` datetime NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`survey_id`),
  UNIQUE KEY `id` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_survey`
--

LOCK TABLES `shared_survey` WRITE;
/*!40000 ALTER TABLE `shared_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_survey_question`
--

DROP TABLE IF EXISTS `shared_survey_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_survey_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `survey_question` longtext COLLATE utf8_unicode_ci NOT NULL,
  `survey_question_comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `display` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `max_value` int(11) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_survey_question`
--

LOCK TABLES `shared_survey_question` WRITE;
/*!40000 ALTER TABLE `shared_survey_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_survey_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_survey_question_option`
--

DROP TABLE IF EXISTS `shared_survey_question_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_survey_question_option` (
  `question_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `option_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`question_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_survey_question_option`
--

LOCK TABLES `shared_survey_question_option` WRITE;
/*!40000 ALTER TABLE `shared_survey_question_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_survey_question_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `access_url_id` int(11) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` longtext COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'Root','root','',1,'',NULL,1,'2016-07-12 12:07:17');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_profile`
--

DROP TABLE IF EXISTS `skill_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_profile`
--

LOCK TABLES `skill_profile` WRITE;
/*!40000 ALTER TABLE `skill_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_rel_gradebook`
--

DROP TABLE IF EXISTS `skill_rel_gradebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_rel_gradebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gradebook_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_rel_gradebook`
--

LOCK TABLES `skill_rel_gradebook` WRITE;
/*!40000 ALTER TABLE `skill_rel_gradebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_rel_gradebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_rel_profile`
--

DROP TABLE IF EXISTS `skill_rel_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_rel_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_rel_profile`
--

LOCK TABLES `skill_rel_profile` WRITE;
/*!40000 ALTER TABLE `skill_rel_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_rel_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_rel_skill`
--

DROP TABLE IF EXISTS `skill_rel_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_rel_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_rel_skill`
--

LOCK TABLES `skill_rel_skill` WRITE;
/*!40000 ALTER TABLE `skill_rel_skill` DISABLE KEYS */;
INSERT INTO `skill_rel_skill` VALUES (1,1,0,0,0);
/*!40000 ALTER TABLE `skill_rel_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_rel_user`
--

DROP TABLE IF EXISTS `skill_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `acquired_skill_at` datetime NOT NULL,
  `assigned_by` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_select_cs` (`course_id`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_rel_user`
--

LOCK TABLES `skill_rel_user` WRITE;
/*!40000 ALTER TABLE `skill_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specific_field`
--

DROP TABLE IF EXISTS `specific_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specific_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_specific_field__code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specific_field`
--

LOCK TABLES `specific_field` WRITE;
/*!40000 ALTER TABLE `specific_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `specific_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specific_field_values`
--

DROP TABLE IF EXISTS `specific_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specific_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `tool_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specific_field_values`
--

LOCK TABLES `specific_field_values` WRITE;
/*!40000 ALTER TABLE `specific_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `specific_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_announcement`
--

DROP TABLE IF EXISTS `sys_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `visible_teacher` tinyint(1) NOT NULL,
  `visible_student` tinyint(1) NOT NULL,
  `visible_guest` tinyint(1) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_url_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_announcement`
--

LOCK TABLES `sys_announcement` WRITE;
/*!40000 ALTER TABLE `sys_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_calendar`
--

DROP TABLE IF EXISTS `sys_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `access_url_id` int(11) NOT NULL,
  `all_day` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_calendar`
--

LOCK TABLES `sys_calendar` WRITE;
/*!40000 ALTER TABLE `sys_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_template`
--

DROP TABLE IF EXISTS `system_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_template`
--

LOCK TABLES `system_template` WRITE;
/*!40000 ALTER TABLE `system_template` DISABLE KEYS */;
INSERT INTO `system_template` VALUES (1,'TemplateTitleCourseTitle','TemplateTitleCourseTitleDescription','coursetitle.gif','\n<head>\n                {CSS}\n                <style type=\"text/css\">\n                .gris_title         	{\n                    color: silver;\n                }\n                h1\n                {\n                    text-align: right;\n                }\n                </style>\n\n            </head>\n            <body>\n            <table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\" border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n            <tbody>\n            <tr>\n            <td style=\"vertical-align: middle; width: 50%;\" colspan=\"1\" rowspan=\"1\">\n                <h1>TITULUS 1<br>\n                <span class=\"gris_title\">TITULUS 2</span><br>\n                </h1>\n            </td>\n            <td style=\"width: 50%;\">\n                <img style=\"width: 100px; height: 100px;\" alt=\"Chamilo logo\" src=\"{COURSE_DIR}images/logo_chamilo.png\"></td>\n            </tr>\n            </tbody>\n            </table>\n            <p><br>\n            <br>\n            </p>\n            </body>\n'),(2,'TemplateTitleTeacher','TemplateTitleTeacherDescription','yourinstructor.gif','\n<head>\n                   {CSS}\n                   <style type=\"text/css\">\n                    .text\n                    {\n                        font-weight: normal;\n                    }\n                    </style>\n                </head>\n                <body>\n                    <table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\" border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n                    <tbody>\n                    <tr>\n                    <td></td>\n                    <td style=\"height: 33%;\"></td>\n                    <td></td>\n                    </tr>\n                    <tr>\n                    <td style=\"width: 25%;\"></td>\n                    <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: right; font-weight: bold;\" colspan=\"1\" rowspan=\"1\">\n                    <span class=\"text\">\n                    <br>\n                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis pellentesque.</span>\n                    </td>\n                    <td style=\"width: 25%; font-weight: bold;\">\n                    <img style=\"width: 180px; height: 241px;\" alt=\"trainer\" src=\"{COURSE_DIR}images/trainer/trainer_case.png \"></td>\n                    </tr>\n                    </tbody>\n                    </table>\n                    <p><br>\n                    <br>\n                    </p>\n                </body>\n'),(3,'TemplateTitleLeftList','TemplateTitleListLeftListDescription','leftlist.gif','\n<head>\n               {CSS}\n           </head>\n            <body>\n                <table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\" border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n                <tbody>\n                <tr>\n                <td style=\"width: 66%;\"></td>\n                <td style=\"vertical-align: bottom; width: 33%;\" colspan=\"1\" rowspan=\"4\">&nbsp;<img style=\"width: 180px; height: 248px;\" alt=\"trainer\" src=\"{COURSE_DIR}images/trainer/trainer_reads.png \"><br>\n                </td>\n                </tr>\n                <tr align=\"right\">\n                <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 66%;\">Lorem\n                ipsum dolor sit amet.\n                </td>\n                </tr>\n                <tr align=\"right\">\n                <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 66%;\">\n                Vivamus\n                a quam.&nbsp;<br>\n                </td>\n                </tr>\n                <tr align=\"right\">\n                <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 66%;\">\n                Proin\n                a est stibulum ante ipsum.</td>\n                </tr>\n                </tbody>\n                </table>\n            <p><br>\n            <br>\n            </p>\n            </body>\n'),(4,'TemplateTitleLeftRightList','TemplateTitleLeftRightListDescription','leftrightlist.gif','\n\n<head>\n               {CSS}\n            </head>\n            <body>\n                <table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; height: 400px; width: 720px;\" border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n                <tbody>\n                <tr>\n                <td></td>\n                <td style=\"vertical-align: top;\" colspan=\"1\" rowspan=\"4\">&nbsp;<img style=\"width: 180px; height: 294px;\" alt=\"Trainer\" src=\"{COURSE_DIR}images/trainer/trainer_join_hands.png \"><br>\n                </td>\n                <td></td>\n                </tr>\n                <tr>\n                <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: right;\">Lorem\n                ipsum dolor sit amet.\n                </td>\n                <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: left;\">\n                Convallis\n                ut.&nbsp;Cras dui magna.</td>\n                </tr>\n                <tr>\n                <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: right;\">\n                Vivamus\n                a quam.&nbsp;<br>\n                </td>\n                <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: left;\">\n                Etiam\n                lacinia stibulum ante.<br>\n                </td>\n                </tr>\n                <tr>\n                <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: right;\">\n                Proin\n                a est stibulum ante ipsum.</td>\n                <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: left;\">\n                Consectetuer\n                adipiscing elit. <br>\n                </td>\n                </tr>\n                </tbody>\n                </table>\n            <p><br>\n            <br>\n            </p>\n            </body>\n\n'),(5,'TemplateTitleRightList','TemplateTitleRightListDescription','rightlist.gif','\n    <head>\n               {CSS}\n            </head>\n            <body style=\"direction: ltr;\">\n                <table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\" border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n                <tbody>\n                <tr>\n                <td style=\"vertical-align: bottom; width: 50%;\" colspan=\"1\" rowspan=\"4\"><img style=\"width: 300px; height: 199px;\" alt=\"trainer\" src=\"{COURSE_DIR}images/trainer/trainer_points_right.png\"><br>\n                </td>\n                <td style=\"width: 50%;\"></td>\n                </tr>\n                <tr>\n                <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; text-align: left; width: 50%;\">\n                Convallis\n                ut.&nbsp;Cras dui magna.</td>\n                </tr>\n                <tr>\n                <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; text-align: left; width: 50%;\">\n                Etiam\n                lacinia.<br>\n                </td>\n                </tr>\n                <tr>\n                <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; text-align: left; width: 50%;\">\n                Consectetuer\n                adipiscing elit. <br>\n                </td>\n                </tr>\n                </tbody>\n                </table>\n            <p><br>\n            <br>\n            </p>\n            </body>\n'),(6,'TemplateTitleDiagram','TemplateTitleDiagramDescription','diagram.gif','\n    <head>\n                       {CSS}\n                    </head>\n\n                    <body>\n                    <table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\" border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n                    <tbody>\n                    <tr>\n                    <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; text-align: left; height: 33%; width: 33%;\">\n                    <br>\n                    Etiam\n                    lacinia stibulum ante.\n                    Convallis\n                    ut.&nbsp;Cras dui magna.</td>\n                    <td colspan=\"1\" rowspan=\"3\">\n                        <img style=\"width: 350px; height: 267px;\" alt=\"Alaska chart\" src=\"{COURSE_DIR}images/diagrams/alaska_chart.png \"></td>\n                    </tr>\n                    <tr>\n                    <td colspan=\"1\" rowspan=\"1\">\n                    <img style=\"width: 300px; height: 199px;\" alt=\"trainer\" src=\"{COURSE_DIR}images/trainer/trainer_points_right.png \"></td>\n                    </tr>\n                    <tr>\n                    </tr>\n                    </tbody>\n                    </table>\n                    <p><br>\n                    <br>\n                    </p>\n                    </body>\n'),(7,'TemplateTitleDesc','TemplateTitleCheckListDescription','description.gif','\n<head>\n                       {CSS}\n                    </head>\n                    <body>\n                        <table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\" border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n                        <tbody>\n                        <tr>\n                        <td style=\"width: 50%; vertical-align: top;\">\n                            <img style=\"width: 48px; height: 49px; float: left;\" alt=\"01\" src=\"{COURSE_DIR}images/small/01.png \" hspace=\"5\"><br>Lorem ipsum dolor sit amet<br><br><br>\n                            <img style=\"width: 48px; height: 49px; float: left;\" alt=\"02\" src=\"{COURSE_DIR}images/small/02.png \" hspace=\"5\">\n                            <br>Ut enim ad minim veniam<br><br><br>\n                            <img style=\"width: 48px; height: 49px; float: left;\" alt=\"03\" src=\"{COURSE_DIR}images/small/03.png \" hspace=\"5\">Duis aute irure dolor in reprehenderit<br><br><br>\n                            <img style=\"width: 48px; height: 49px; float: left;\" alt=\"04\" src=\"{COURSE_DIR}images/small/04.png \" hspace=\"5\">Neque porro quisquam est</td>\n\n                        <td style=\"vertical-align: top; width: 50%; text-align: right;\" colspan=\"1\" rowspan=\"1\">\n                            <img style=\"width: 300px; height: 291px;\" alt=\"Gearbox\" src=\"{COURSE_DIR}images/diagrams/gearbox.jpg \"><br></td>\n                        </tr><tr></tr>\n                        </tbody>\n                        </table>\n                        <p><br>\n                        <br>\n                        </p>\n                    </body>\n'),(8,'TemplateTitleCycle','TemplateTitleCycleDescription','cyclechart.gif','\n<head>\n                   {CSS}\n                   <style>\n                   .title\n                   {\n                       color: white; font-weight: bold;\n                   }\n                   </style>\n                </head>\n\n\n                <body>\n                <table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\" border=\"0\" cellpadding=\"8\" cellspacing=\"6\">\n                <tbody>\n                <tr>\n                    <td style=\"text-align: center; vertical-align: bottom; height: 10%;\" colspan=\"3\" rowspan=\"1\">\n                        <img style=\"width: 250px; height: 76px;\" alt=\"arrow\" src=\"{COURSE_DIR}images/diagrams/top_arrow.png \">\n                    </td>\n                </tr>\n                <tr>\n                    <td style=\"height: 5%; width: 45%; vertical-align: top; background-color: rgb(153, 153, 153); text-align: center;\">\n                        <span class=\"title\">Lorem ipsum</span>\n                    </td>\n\n                    <td style=\"height: 5%; width: 10%;\"></td>\n                    <td style=\"height: 5%; vertical-align: top; background-color: rgb(153, 153, 153); text-align: center;\">\n                        <span class=\"title\">Sed ut perspiciatis</span>\n                    </td>\n                </tr>\n                    <tr>\n                        <td style=\"background-color: rgb(204, 204, 255); width: 45%; vertical-align: top;\">\n                            <ul>\n                                <li>dolor sit amet</li>\n                                <li>consectetur adipisicing elit</li>\n                                <li>sed do eiusmod tempor&nbsp;</li>\n                                <li>adipisci velit, sed quia non numquam</li>\n                                <li>eius modi tempora incidunt ut labore et dolore magnam</li>\n                            </ul>\n                </td>\n                <td style=\"width: 10%;\"></td>\n                <td style=\"background-color: rgb(204, 204, 255); width: 45%; vertical-align: top;\">\n                    <ul>\n                    <li>ut enim ad minim veniam</li>\n                    <li>quis nostrud exercitation</li><li>ullamco laboris nisi ut</li>\n                    <li> Quis autem vel eum iure reprehenderit qui in ea</li>\n                    <li>voluptate velit esse quam nihil molestiae consequatur,</li>\n                    </ul>\n                    </td>\n                    </tr>\n                    <tr align=\"center\">\n                    <td style=\"height: 10%; vertical-align: top;\" colspan=\"3\" rowspan=\"1\">\n                    <img style=\"width: 250px; height: 76px;\" alt=\"arrow\" src=\"{COURSE_DIR}images/diagrams/bottom_arrow.png \">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;\n                </td>\n                </tr>\n                </tbody>\n                </table>\n                <p><br>\n                <br>\n                </p>\n                </body>\n'),(9,'TemplateTitleTimeline','TemplateTitleTimelineDescription','phasetimeline.gif','\n<head>\n               {CSS}\n                <style>\n                .title\n                {\n                    font-weight: bold; text-align: center;\n                }\n                </style>\n            </head>\n\n            <body>\n                <table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\" border=\"0\" cellpadding=\"8\" cellspacing=\"5\">\n                <tbody>\n                <tr class=\"title\">\n                    <td style=\"vertical-align: top; height: 3%; background-color: rgb(224, 224, 224);\">Lorem ipsum</td>\n                    <td style=\"height: 3%;\"></td>\n                    <td style=\"vertical-align: top; height: 3%; background-color: rgb(237, 237, 237);\">Perspiciatis</td>\n                    <td style=\"height: 3%;\"></td>\n                    <td style=\"vertical-align: top; height: 3%; background-color: rgb(245, 245, 245);\">Nemo enim</td>\n                </tr>\n\n                <tr>\n                    <td style=\"vertical-align: top; width: 30%; background-color: rgb(224, 224, 224);\">\n                        <ul>\n                        <li>dolor sit amet</li>\n                        <li>consectetur</li>\n                        <li>adipisicing elit</li>\n                    </ul>\n                    <br>\n                    </td>\n                    <td>\n                        <img style=\"width: 32px; height: 32px;\" alt=\"arrow\" src=\"{COURSE_DIR}images/small/arrow.png \">\n                    </td>\n\n                    <td style=\"vertical-align: top; width: 30%; background-color: rgb(237, 237, 237);\">\n                        <ul>\n                            <li>ut labore</li>\n                            <li>et dolore</li>\n                            <li>magni dolores</li>\n                        </ul>\n                    </td>\n                    <td>\n                        <img style=\"width: 32px; height: 32px;\" alt=\"arrow\" src=\"{COURSE_DIR}images/small/arrow.png \">\n                    </td>\n\n                    <td style=\"vertical-align: top; background-color: rgb(245, 245, 245); width: 30%;\">\n                        <ul>\n                            <li>neque porro</li>\n                            <li>quisquam est</li>\n                            <li>qui dolorem&nbsp;&nbsp;</li>\n                        </ul>\n                        <br><br>\n                    </td>\n                </tr>\n                </tbody>\n                </table>\n            <p><br>\n            <br>\n            </p>\n            </body>\n'),(10,'TemplateTitleTable','TemplateTitleCheckListDescription','table.gif','\n<head>\n                   {CSS}\n                   <style type=\"text/css\">\n                .title\n                {\n                    font-weight: bold; text-align: center;\n                }\n\n                .items\n                {\n                    text-align: right;\n                }\n\n\n                    </style>\n\n                </head>\n                <body>\n                <br />\n               <h2>A table</h2>\n                <table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px;\" border=\"1\" cellpadding=\"5\" cellspacing=\"0\">\n                <tbody>\n                <tr class=\"title\">\n                    <td>City</td>\n                    <td>2005</td>\n                    <td>2006</td>\n                    <td>2007</td>\n                    <td>2008</td>\n                </tr>\n                <tr class=\"items\">\n                    <td>Lima</td>\n                    <td>10,40</td>\n                    <td>8,95</td>\n                    <td>9,19</td>\n                    <td>9,76</td>\n                </tr>\n                <tr class=\"items\">\n                <td>New York</td>\n                    <td>18,39</td>\n                    <td>17,52</td>\n                    <td>16,57</td>\n                    <td>16,60</td>\n                </tr>\n                <tr class=\"items\">\n                <td>Barcelona</td>\n                    <td>0,10</td>\n                    <td>0,10</td>\n                    <td>0,05</td>\n                    <td>0,05</td>\n                </tr>\n                <tr class=\"items\">\n                <td>Paris</td>\n                    <td>3,38</td>\n                    <td >3,63</td>\n                    <td>3,63</td>\n                    <td>3,54</td>\n                </tr>\n                </tbody>\n                </table>\n                <br>\n                </body>\n'),(11,'TemplateTitleAudio','TemplateTitleAudioDescription','audiocomment.gif','\n<head>\n               {CSS}\n            </head>\n                   <body>\n                    <table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\" border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n                    <tbody>\n                    <tr>\n                    <td>\n                    <div align=\"center\">\n                    <span style=\"text-align: center;\">\n                        <embed  type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" width=\"300\" height=\"20\" bgcolor=\"#FFFFFF\" src=\"{REL_PATH}main/inc/lib/mediaplayer/player.swf\" allowfullscreen=\"false\" allowscriptaccess=\"always\" flashvars=\"file={COURSE_DIR}audio/ListeningComprehension.mp3&amp;autostart=true\"></embed>\n                    </span></div>\n\n                    <br>\n                    </td>\n                    <td colspan=\"1\" rowspan=\"3\"><br>\n                        <img style=\"width: 300px; height: 341px; float: right;\" alt=\"image\" src=\"{COURSE_DIR}images/diagrams/head_olfactory_nerve.png \"><br></td>\n                    </tr>\n                    <tr>\n                    <td colspan=\"1\" rowspan=\"1\">\n                        <img style=\"width: 180px; height: 271px;\" alt=\"trainer\" src=\"{COURSE_DIR}images/trainer/trainer_glasses.png\"><br></td>\n                    </tr>\n                    <tr>\n                    </tr>\n                    </tbody>\n                    </table>\n                    <p><br>\n                    <br>\n                    </p>\n                    </body>\n'),(12,'TemplateTitleVideo','TemplateTitleVideoDescription','video.gif','\n<head>\n                {CSS}\n            </head>\n\n            <body>\n            <table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\" border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n            <tbody>\n            <tr>\n            <td style=\"width: 50%; vertical-align: top;\">\n\n                 <div style=\"text-align: center;\" id=\"player810625-parent\">\n                    <div style=\"border-style: none; overflow: hidden; width: 320px; height: 240px; background-color: rgb(220, 220, 220);\">\n\n                        <div id=\"player810625\">\n                            <div id=\"player810625-config\" style=\"overflow: hidden; display: none; visibility: hidden; width: 0px; height: 0px;\">url={REL_PATH}main/default_course_document/video/flv/example.flv width=320 height=240 loop=false play=false downloadable=false fullscreen=true displayNavigation=true displayDigits=true align=left dispPlaylist=none playlistThumbs=false</div>\n                        </div>\n\n                        <embed\n                            type=\"application/x-shockwave-flash\"\n                            src=\"{REL_PATH}main/inc/lib/mediaplayer/player.swf\"\n                            width=\"320\"\n                            height=\"240\"\n                            id=\"single\"\n                            name=\"single\"\n                            quality=\"high\"\n                            allowfullscreen=\"true\"\n                            flashvars=\"width=320&height=240&autostart=false&file={REL_PATH}main/default_course_document/video/flv/example.flv&repeat=false&image=&showdownload=false&link={REL_PATH}main/default_course_document/video/flv/example.flv&showdigits=true&shownavigation=true&logo=\"\n                        />\n\n                    </div>\n                </div>\n\n            </td>\n            <td style=\"background: transparent url({IMG_DIR}faded_grey.png) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 50%;\">\n            <h3><br>\n            </h3>\n            <h3>Lorem ipsum dolor sit amet</h3>\n                <ul>\n                <li>consectetur adipisicing elit</li>\n                <li>sed do eiusmod tempor incididunt</li>\n                <li>ut labore et dolore magna aliqua</li>\n                </ul>\n            <h3>Ut enim ad minim veniam</h3>\n                <ul>\n                <li>quis nostrud exercitation ullamco</li>\n                <li>laboris nisi ut aliquip ex ea commodo consequat</li>\n                <li>Excepteur sint occaecat cupidatat non proident</li>\n                </ul>\n            </td>\n            </tr>\n            </tbody>\n            </table>\n            <p><br>\n            <br>\n            </p>\n             <style type=\"text/css\">body{}</style><!-- to fix a strange bug appearing with firefox when editing this template -->\n            </body>\n'),(13,'TemplateTitleFlash','TemplateTitleFlashDescription','flash.gif','\n<head>\n               {CSS}\n            </head>\n            <body>\n            <center>\n                <table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 100%; height: 400px;\" border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n                <tbody>\n                    <tr>\n                    <td align=\"center\">\n                    <embed width=\"700\" height=\"300\" type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"{COURSE_DIR}flash/SpinEchoSequence.swf\" play=\"true\" loop=\"true\" menu=\"true\"></embed></span><br />\n                    </td>\n                    </tr>\n                </tbody>\n                </table>\n                <p><br>\n                <br>\n                </p>\n            </center>\n            </body>\n');
/*!40000 ALTER TABLE `system_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'',14,7);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `ref_doc` int(11) NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_course_ranking`
--

DROP TABLE IF EXISTS `track_course_ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_course_ranking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  `accesses` int(11) NOT NULL,
  `total_score` int(11) NOT NULL,
  `users` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tcc_cid` (`c_id`),
  KEY `idx_tcc_sid` (`session_id`),
  KEY `idx_tcc_urlid` (`url_id`),
  KEY `idx_tcc_creation_date` (`creation_date`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_course_ranking`
--

LOCK TABLES `track_course_ranking` WRITE;
/*!40000 ALTER TABLE `track_course_ranking` DISABLE KEYS */;
INSERT INTO `track_course_ranking` VALUES (1,1,0,1,90,0,0,'2016-07-12 12:07:55'),(2,2,0,1,38,0,0,'2016-07-14 01:28:51'),(3,2,1,1,44,0,0,'2016-07-18 20:56:19'),(4,3,0,1,51,0,0,'2016-07-22 02:02:40'),(5,4,0,1,22,0,0,'2016-07-23 09:25:57'),(6,5,0,1,70,0,0,'2016-08-01 09:36:16'),(7,6,0,1,49,0,0,'2016-08-05 04:44:56'),(8,7,0,1,1,0,0,'2016-08-08 05:30:34');
/*!40000 ALTER TABLE `track_course_ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_access`
--

DROP TABLE IF EXISTS `track_e_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_access` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_user_id` int(11) DEFAULT NULL,
  `access_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `access_tool` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_session_id` int(11) NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`access_id`),
  KEY `access_user_id` (`access_user_id`),
  KEY `access_c_id` (`c_id`),
  KEY `access_session_id` (`access_session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=878 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_access`
--

LOCK TABLES `track_e_access` WRITE;
/*!40000 ALTER TABLE `track_e_access` DISABLE KEYS */;
INSERT INTO `track_e_access` VALUES (1,1,'2016-07-12 12:07:55',1,NULL,0,'124.171.130.216'),(2,1,'2016-07-12 12:08:02',1,NULL,0,'124.171.130.216'),(3,1,'2016-07-13 00:57:35',1,NULL,0,'124.171.130.216'),(4,1,'2016-07-13 00:58:38',1,NULL,0,'124.171.130.216'),(5,1,'2016-07-13 00:59:17',1,NULL,0,'124.171.130.216'),(6,1,'2016-07-13 04:42:50',1,NULL,0,'124.171.130.216'),(7,1,'2016-07-13 04:48:41',1,NULL,0,'124.171.130.216'),(8,1,'2016-07-13 04:51:47',1,NULL,0,'124.171.130.216'),(9,1,'2016-07-13 04:51:50',1,'course_progress',0,'124.171.130.216'),(10,1,'2016-07-13 04:51:55',1,NULL,0,'124.171.130.216'),(11,1,'2016-07-13 05:21:04',1,NULL,0,'124.171.130.216'),(12,1,'2016-07-13 08:48:12',1,NULL,0,'101.183.92.157'),(13,1,'2016-07-13 08:48:23',1,'forum',0,'101.183.92.157'),(14,1,'2016-07-13 08:50:18',1,NULL,0,'101.183.92.157'),(15,1,'2016-07-13 08:50:24',1,'forum',0,'101.183.92.157'),(16,1,'2016-07-13 08:54:46',1,NULL,0,'101.183.92.157'),(17,1,'2016-07-13 08:54:50',1,'forum',0,'101.183.92.157'),(18,1,'2016-07-13 09:55:48',1,NULL,0,'124.171.130.216'),(19,1,'2016-07-13 09:56:05',1,NULL,0,'124.171.130.216'),(20,1,'2016-07-13 10:15:12',1,NULL,0,'101.183.92.157'),(21,1,'2016-07-13 10:15:19',1,'forum',0,'101.183.92.157'),(22,1,'2016-07-13 10:17:42',1,NULL,0,'101.183.92.157'),(23,1,'2016-07-13 10:17:47',1,'forum',0,'101.183.92.157'),(24,1,'2016-07-13 10:35:55',1,NULL,0,'101.183.92.157'),(25,1,'2016-07-13 10:35:58',1,'forum',0,'101.183.92.157'),(26,1,'2016-07-13 23:02:34',1,NULL,0,'124.171.130.216'),(27,1,'2016-07-13 23:02:46',1,NULL,0,'124.171.130.216'),(28,1,'2016-07-13 23:03:48',1,NULL,0,'124.171.130.216'),(29,1,'2016-07-13 23:05:22',1,NULL,0,'124.171.130.216'),(30,1,'2016-07-13 23:06:43',1,NULL,0,'124.171.130.216'),(31,1,'2016-07-14 01:24:38',1,NULL,0,'124.171.130.216'),(32,1,'2016-07-14 01:25:11',1,NULL,0,'124.171.130.216'),(33,1,'2016-07-14 01:25:22',1,NULL,0,'124.171.130.216'),(34,1,'2016-07-14 01:26:46',1,NULL,0,'124.171.130.216'),(35,1,'2016-07-14 01:28:56',2,NULL,0,'124.171.130.216'),(36,1,'2016-07-14 01:29:06',2,NULL,0,'124.171.130.216'),(37,1,'2016-07-14 01:32:25',2,NULL,0,'124.171.130.216'),(38,1,'2016-07-15 00:29:42',1,NULL,0,'124.171.130.216'),(39,1,'2016-07-15 00:33:06',1,NULL,0,'124.171.130.216'),(40,1,'2016-07-15 01:36:38',1,NULL,0,'124.171.130.216'),(41,1,'2016-07-15 02:03:56',1,NULL,0,'124.171.130.216'),(42,1,'2016-07-16 04:04:39',1,NULL,0,'101.166.251.97'),(43,1,'2016-07-16 04:04:45',1,'course_description',0,'101.166.251.97'),(44,1,'2016-07-16 04:04:51',1,NULL,0,'101.166.251.97'),(45,1,'2016-07-16 04:04:54',1,'document',0,'101.166.251.97'),(46,1,'2016-07-16 04:16:36',1,'document',0,'101.166.251.97'),(47,1,'2016-07-16 04:16:54',1,'document',0,'101.166.251.97'),(48,1,'2016-07-16 04:43:27',1,NULL,0,'101.166.251.97'),(49,1,'2016-07-16 04:43:33',1,'document',0,'101.166.251.97'),(50,1,'2016-07-16 04:43:38',1,NULL,0,'101.166.251.97'),(51,1,'2016-07-16 04:43:41',1,'course_description',0,'101.166.251.97'),(52,1,'2016-07-16 04:43:44',1,NULL,0,'101.166.251.97'),(53,1,'2016-07-16 04:43:48',1,'document',0,'101.166.251.97'),(54,1,'2016-07-16 04:46:23',1,NULL,0,'101.166.251.97'),(55,1,'2016-07-16 04:49:45',1,'course_progress',0,'101.166.251.97'),(56,1,'2016-07-16 04:49:48',1,NULL,0,'101.166.251.97'),(57,1,'2016-07-16 04:49:55',1,'course_progress',0,'101.166.251.97'),(58,1,'2016-07-16 04:50:22',1,NULL,0,'101.166.251.97'),(59,1,'2016-07-16 04:50:28',1,'learnpath',0,'101.166.251.97'),(60,1,'2016-07-16 04:51:31',2,NULL,0,'101.166.251.97'),(61,1,'2016-07-16 04:51:35',2,'course_progress',0,'101.166.251.97'),(62,1,'2016-07-16 04:51:37',2,NULL,0,'101.166.251.97'),(63,1,'2016-07-16 04:51:40',2,'quiz',0,'101.166.251.97'),(64,1,'2016-07-16 04:51:45',2,NULL,0,'101.166.251.97'),(65,1,'2016-07-16 04:51:49',2,'link',0,'101.166.251.97'),(66,1,'2016-07-16 10:02:49',1,NULL,0,'101.183.3.127'),(67,1,'2016-07-16 10:02:56',1,'forum',0,'101.183.3.127'),(68,1,'2016-07-16 10:27:01',2,NULL,0,'101.166.251.97'),(69,1,'2016-07-17 07:33:18',1,NULL,0,'101.166.251.97'),(70,1,'2016-07-17 07:33:31',2,NULL,0,'101.166.251.97'),(71,1,'2016-07-17 07:33:39',2,NULL,0,'101.166.251.97'),(72,1,'2016-07-17 07:33:48',1,NULL,0,'101.166.251.97'),(73,1,'2016-07-17 07:33:53',1,'document',0,'101.166.251.97'),(74,1,'2016-07-17 08:58:56',1,NULL,0,'101.166.251.97'),(75,1,'2016-07-17 08:58:58',1,'document',0,'101.166.251.97'),(76,1,'2016-07-18 10:25:55',1,NULL,0,'101.183.3.127'),(77,1,'2016-07-18 10:30:07',1,'learnpath',0,'101.183.3.127'),(78,1,'2016-07-18 10:55:10',1,NULL,0,'124.171.130.216'),(79,1,'2016-07-18 11:32:00',1,NULL,0,'124.171.130.216'),(80,1,'2016-07-18 11:34:35',1,NULL,0,'124.171.130.216'),(81,1,'2016-07-18 11:39:43',2,NULL,0,'124.171.130.216'),(82,1,'2016-07-18 20:47:11',2,NULL,0,'124.171.193.190'),(83,1,'2016-07-18 20:51:14',2,NULL,0,'124.171.193.190'),(84,1,'2016-07-18 20:51:25',2,'user',0,'124.171.193.190'),(85,1,'2016-07-18 20:51:49',2,NULL,0,'124.171.193.190'),(86,1,'2016-07-18 20:53:22',2,NULL,0,'124.171.193.190'),(87,1,'2016-07-18 20:56:19',2,NULL,1,'124.171.193.190'),(88,1,'2016-07-19 05:14:34',2,NULL,1,'220.240.126.220'),(89,1,'2016-07-19 07:41:52',2,NULL,1,'101.166.251.97'),(90,1,'2016-07-19 07:42:48',2,NULL,1,'101.166.251.97'),(91,1,'2016-07-19 07:42:51',2,'document',1,'101.166.251.97'),(92,1,'2016-07-19 07:42:58',2,'document',1,'101.166.251.97'),(93,1,'2016-07-19 07:43:15',1,NULL,0,'101.166.251.97'),(94,1,'2016-07-19 07:43:17',1,'document',0,'101.166.251.97'),(95,1,'2016-07-19 07:59:02',1,NULL,0,'101.166.251.97'),(96,1,'2016-07-19 07:59:04',1,'document',0,'101.166.251.97'),(97,4,'2016-07-19 09:22:19',1,NULL,0,'101.166.251.97'),(98,4,'2016-07-19 09:22:23',1,'document',0,'101.166.251.97'),(99,1,'2016-07-19 09:39:56',2,NULL,0,'124.171.193.190'),(100,1,'2016-07-19 09:40:43',2,NULL,0,'124.171.193.190'),(101,1,'2016-07-19 09:41:19',2,NULL,0,'124.171.193.190'),(102,1,'2016-07-19 09:44:48',2,NULL,0,'124.171.193.190'),(103,1,'2016-07-19 09:45:44',2,NULL,0,'124.171.193.190'),(104,1,'2016-07-19 10:10:05',2,NULL,0,'124.171.193.190'),(105,1,'2016-07-19 10:40:03',1,NULL,0,'101.183.3.127'),(106,1,'2016-07-19 10:40:08',1,'forum',0,'101.183.3.127'),(107,4,'2016-07-19 11:28:02',1,NULL,0,'101.166.251.97'),(108,1,'2016-07-19 11:28:59',2,NULL,1,'101.166.251.97'),(109,1,'2016-07-19 11:29:05',2,'document',1,'101.166.251.97'),(110,1,'2016-07-20 09:37:27',1,NULL,0,'101.183.3.127'),(111,1,'2016-07-20 09:50:46',1,'chat',0,'101.183.3.127'),(112,1,'2016-07-21 07:56:12',1,NULL,0,'124.171.144.135'),(113,1,'2016-07-21 07:58:54',1,NULL,0,'124.171.144.135'),(114,1,'2016-07-21 07:59:09',1,NULL,0,'124.171.144.135'),(115,1,'2016-07-21 07:59:23',1,NULL,0,'124.171.144.135'),(116,1,'2016-07-21 07:59:31',1,NULL,0,'124.171.144.135'),(117,1,'2016-07-21 07:59:49',1,'chat',0,'124.171.144.135'),(118,1,'2016-07-21 08:00:42',1,NULL,0,'124.171.144.135'),(119,1,'2016-07-21 08:00:50',1,NULL,0,'124.171.144.135'),(120,1,'2016-07-21 09:26:35',1,'forum',0,'101.183.3.127'),(121,1,'2016-07-21 09:54:09',1,'forum',0,'101.183.3.127'),(122,1,'2016-07-21 10:01:19',1,NULL,0,'101.183.3.127'),(123,1,'2016-07-21 10:01:24',1,'forum',0,'101.183.3.127'),(124,1,'2016-07-21 10:30:02',1,NULL,0,'101.183.3.127'),(125,1,'2016-07-21 10:30:10',1,'forum',0,'101.183.3.127'),(126,1,'2016-07-21 19:57:33',1,NULL,0,'124.171.144.135'),(127,1,'2016-07-21 19:59:08',1,NULL,0,'124.171.144.135'),(128,1,'2016-07-21 20:49:48',1,NULL,0,'124.171.144.135'),(129,1,'2016-07-21 20:50:05',1,NULL,0,'124.171.144.135'),(130,1,'2016-07-21 20:50:12',1,NULL,0,'124.171.144.135'),(131,1,'2016-07-21 20:53:09',1,NULL,0,'124.171.144.135'),(132,1,'2016-07-21 20:57:52',1,NULL,0,'124.171.144.135'),(133,1,'2016-07-21 21:02:43',1,NULL,0,'124.171.144.135'),(134,1,'2016-07-21 21:03:18',2,NULL,0,'124.171.144.135'),(135,1,'2016-07-21 21:03:34',2,NULL,0,'124.171.144.135'),(136,1,'2016-07-21 21:05:42',2,NULL,0,'124.171.144.135'),(137,1,'2016-07-21 21:08:32',2,NULL,0,'124.171.144.135'),(138,1,'2016-07-21 21:11:50',1,NULL,0,'124.171.144.135'),(139,5,'2016-07-21 22:20:49',2,NULL,0,'103.248.97.2'),(140,5,'2016-07-21 22:22:28',2,NULL,0,'103.248.97.2'),(141,5,'2016-07-21 22:24:11',2,NULL,0,'103.248.97.2'),(142,5,'2016-07-21 22:25:16',2,NULL,0,'103.248.97.2'),(143,5,'2016-07-21 22:25:23',2,NULL,0,'103.248.97.2'),(144,5,'2016-07-21 22:25:32',2,NULL,0,'103.248.97.2'),(145,5,'2016-07-21 22:27:29',2,NULL,0,'103.248.97.2'),(146,5,'2016-07-21 22:27:33',2,'link',0,'103.248.97.2'),(147,5,'2016-07-21 22:27:41',2,NULL,0,'103.248.97.2'),(148,5,'2016-07-21 22:33:04',2,NULL,0,'103.248.97.2'),(149,5,'2016-07-21 23:34:10',2,NULL,1,'103.248.97.2'),(150,5,'2016-07-21 23:35:44',2,NULL,1,'103.248.97.2'),(151,5,'2016-07-21 23:39:24',2,NULL,1,'103.248.97.2'),(152,5,'2016-07-21 23:39:34',2,NULL,1,'103.248.97.2'),(153,5,'2016-07-21 23:42:20',2,NULL,1,'103.248.97.2'),(154,5,'2016-07-21 23:42:47',2,NULL,0,'103.248.97.2'),(155,5,'2016-07-21 23:49:04',2,NULL,0,'103.248.97.2'),(156,4,'2016-07-21 23:50:31',1,NULL,0,'103.248.97.2'),(157,5,'2016-07-21 23:51:28',1,NULL,0,'103.248.97.2'),(158,3,'2016-07-21 23:56:19',2,NULL,0,'103.248.97.2'),(159,3,'2016-07-22 01:58:28',2,NULL,0,'103.248.97.2'),(160,3,'2016-07-22 02:01:55',2,'forum',0,'103.248.97.2'),(161,5,'2016-07-22 02:04:37',3,NULL,0,'103.248.97.2'),(162,5,'2016-07-22 02:05:29',3,NULL,0,'103.248.97.2'),(163,5,'2016-07-22 02:05:35',3,'user',0,'103.248.97.2'),(164,5,'2016-07-22 02:06:29',3,NULL,0,'103.248.97.2'),(165,5,'2016-07-22 02:06:34',3,'forum',0,'103.248.97.2'),(166,5,'2016-07-22 02:07:45',3,NULL,0,'103.248.97.2'),(167,1,'2016-07-22 03:34:47',2,NULL,1,'220.240.126.220'),(168,1,'2016-07-22 03:34:59',2,'course_description',1,'220.240.126.220'),(169,5,'2016-07-22 04:44:57',3,NULL,0,'103.248.97.2'),(170,5,'2016-07-22 04:56:40',3,NULL,0,'103.248.97.2'),(171,3,'2016-07-22 04:56:58',3,NULL,0,'103.248.97.2'),(172,3,'2016-07-22 04:57:04',3,NULL,0,'103.248.97.2'),(173,5,'2016-07-22 04:59:49',3,NULL,0,'103.248.97.2'),(174,5,'2016-07-22 04:59:59',3,NULL,0,'103.248.97.2'),(175,5,'2016-07-22 05:01:08',3,NULL,0,'103.248.97.2'),(176,5,'2016-07-22 05:01:27',3,NULL,0,'103.248.97.2'),(177,5,'2016-07-22 05:16:53',3,NULL,0,'103.248.97.2'),(178,1,'2016-07-22 07:41:56',3,NULL,0,'124.171.144.135'),(179,1,'2016-07-22 07:43:01',3,NULL,0,'124.171.144.135'),(180,1,'2016-07-22 07:44:09',3,'student_publication',0,'124.171.144.135'),(181,1,'2016-07-23 01:01:05',1,NULL,0,'101.166.251.97'),(182,1,'2016-07-23 01:01:12',1,'forum',0,'101.166.251.97'),(183,1,'2016-07-23 01:01:42',2,NULL,0,'101.166.251.97'),(184,1,'2016-07-23 01:02:46',2,NULL,1,'101.166.251.97'),(185,1,'2016-07-23 01:03:35',2,'document',1,'101.166.251.97'),(186,1,'2016-07-23 01:03:37',2,'document',1,'101.166.251.97'),(187,4,'2016-07-23 01:04:02',3,NULL,0,'101.166.251.97'),(188,4,'2016-07-23 01:04:06',3,'document',0,'101.166.251.97'),(189,4,'2016-07-23 01:04:15',3,NULL,0,'101.166.251.97'),(190,4,'2016-07-23 01:04:20',1,NULL,0,'101.166.251.97'),(191,4,'2016-07-23 01:04:22',1,'document',0,'101.166.251.97'),(192,4,'2016-07-23 01:05:39',1,NULL,0,'101.166.251.97'),(193,4,'2016-07-23 01:05:42',1,'document',0,'101.166.251.97'),(194,1,'2016-07-23 01:10:33',1,NULL,0,'101.166.251.97'),(195,1,'2016-07-23 01:10:37',1,'document',0,'101.166.251.97'),(196,4,'2016-07-23 03:48:26',1,NULL,0,'101.166.251.97'),(197,4,'2016-07-23 03:48:29',1,'document',0,'101.166.251.97'),(198,4,'2016-07-23 04:15:13',1,NULL,0,'101.166.251.97'),(199,1,'2016-07-23 04:15:57',1,NULL,0,'101.166.251.97'),(200,1,'2016-07-23 04:15:59',1,'document',0,'101.166.251.97'),(201,1,'2016-07-23 05:46:39',1,NULL,0,'101.166.251.97'),(202,1,'2016-07-23 05:46:59',1,NULL,0,'101.166.251.97'),(203,1,'2016-07-23 05:47:02',1,'student_publication',0,'101.166.251.97'),(204,1,'2016-07-23 05:47:14',1,'student_publication',0,'101.166.251.97'),(205,1,'2016-07-23 05:47:16',1,NULL,0,'101.166.251.97'),(206,1,'2016-07-23 05:48:42',1,'document',0,'101.166.251.97'),(207,1,'2016-07-23 05:49:41',1,'document',0,'101.166.251.97'),(208,1,'2016-07-23 07:57:09',1,NULL,0,'101.166.251.97'),(209,1,'2016-07-23 07:57:12',1,'document',0,'101.166.251.97'),(210,1,'2016-07-23 09:26:07',4,NULL,0,'101.166.251.97'),(211,1,'2016-07-23 09:28:54',1,NULL,0,'101.166.251.97'),(212,1,'2016-07-23 09:28:56',1,'document',0,'101.166.251.97'),(213,1,'2016-07-23 22:53:28',4,NULL,0,'168.1.6.43'),(214,1,'2016-07-24 00:22:16',1,NULL,0,'101.166.251.97'),(215,1,'2016-07-24 00:25:15',1,'attendance',0,'101.166.251.97'),(216,1,'2016-07-24 00:25:17',1,NULL,0,'101.166.251.97'),(217,1,'2016-07-24 00:38:56',1,NULL,0,'101.166.251.97'),(218,1,'2016-07-25 11:19:59',2,NULL,1,'101.166.251.97'),(219,5,'2016-07-25 11:20:09',3,NULL,0,'124.171.144.135'),(220,5,'2016-07-25 11:23:25',3,NULL,0,'124.171.144.135'),(221,1,'2016-07-25 11:25:10',1,NULL,0,'101.166.251.97'),(222,1,'2016-07-25 11:27:31',2,NULL,1,'101.166.251.97'),(223,5,'2016-07-25 11:29:15',3,NULL,0,'124.171.144.135'),(224,7,'2016-07-25 11:29:39',3,NULL,0,'27.33.251.228'),(225,1,'2016-07-25 11:30:35',2,NULL,1,'220.240.126.220'),(226,1,'2016-07-25 11:30:41',2,'chat',1,'220.240.126.220'),(227,1,'2016-07-25 11:31:12',2,NULL,1,'220.240.126.220'),(228,1,'2016-07-25 11:31:49',4,NULL,0,'220.240.126.220'),(229,1,'2016-07-25 11:32:07',4,'link',0,'220.240.126.220'),(230,1,'2016-07-25 11:32:27',2,NULL,1,'220.240.126.220'),(231,1,'2016-07-25 11:33:51',2,NULL,1,'101.166.251.97'),(232,1,'2016-07-25 11:35:24',2,NULL,0,'101.166.251.97'),(233,5,'2016-07-25 11:36:32',3,NULL,0,'124.171.144.135'),(234,1,'2016-07-25 11:38:31',1,NULL,0,'101.166.251.97'),(235,1,'2016-07-25 11:38:57',3,NULL,0,'101.166.251.97'),(236,1,'2016-07-25 11:39:42',3,NULL,0,'101.166.251.97'),(237,1,'2016-07-25 11:39:52',3,'document',0,'101.166.251.97'),(238,1,'2016-07-25 11:40:00',3,'document',0,'101.166.251.97'),(239,1,'2016-07-25 11:40:02',3,NULL,0,'101.166.251.97'),(240,5,'2016-07-25 11:40:59',3,NULL,0,'124.171.144.135'),(241,1,'2016-07-25 11:46:23',3,NULL,0,'101.166.251.97'),(242,5,'2016-07-25 11:47:44',3,NULL,0,'124.171.144.135'),(243,5,'2016-07-26 11:47:55',3,NULL,0,'168.1.6.33'),(244,5,'2016-07-26 11:48:58',3,NULL,0,'168.1.6.33'),(245,1,'2016-07-27 09:30:59',3,NULL,0,'101.166.251.97'),(246,1,'2016-07-27 09:31:05',3,'document',0,'101.166.251.97'),(247,1,'2016-07-27 09:31:11',3,NULL,0,'101.166.251.97'),(248,1,'2016-07-27 09:33:01',3,'document',0,'101.166.251.97'),(249,1,'2016-07-27 09:33:35',2,NULL,1,'101.183.56.133'),(250,1,'2016-07-27 09:35:36',3,NULL,0,'101.166.251.97'),(251,5,'2016-07-27 09:43:48',3,NULL,0,'124.171.144.135'),(252,1,'2016-07-27 09:43:54',3,NULL,0,'101.166.251.97'),(253,1,'2016-07-27 09:44:11',1,NULL,0,'101.183.56.133'),(254,1,'2016-07-27 09:44:23',3,NULL,0,'101.166.251.97'),(255,1,'2016-07-27 09:44:24',2,NULL,1,'101.183.56.133'),(256,1,'2016-07-27 09:44:29',2,'forum',1,'101.183.56.133'),(257,1,'2016-07-27 09:44:34',3,NULL,0,'101.166.251.97'),(258,1,'2016-07-27 09:44:41',2,NULL,1,'101.183.56.133'),(259,1,'2016-07-27 09:44:43',2,'forum',1,'101.183.56.133'),(260,1,'2016-07-27 09:44:51',1,NULL,0,'101.183.56.133'),(261,1,'2016-07-27 09:44:59',1,'forum',0,'101.183.56.133'),(262,1,'2016-07-27 09:46:10',1,NULL,0,'101.183.56.133'),(263,1,'2016-07-27 09:46:13',4,NULL,0,'27.33.251.228'),(264,1,'2016-07-27 09:46:14',1,'forum',0,'101.183.56.133'),(265,1,'2016-07-27 09:47:25',2,NULL,0,'101.166.251.97'),(266,1,'2016-07-27 09:47:29',2,'forum',0,'101.166.251.97'),(267,1,'2016-07-27 09:47:45',1,NULL,0,'101.166.251.97'),(268,1,'2016-07-27 09:47:50',1,'forum',0,'101.166.251.97'),(269,5,'2016-07-27 09:48:12',2,NULL,0,'124.171.144.135'),(270,1,'2016-07-27 09:48:12',1,NULL,0,'27.33.251.228'),(271,1,'2016-07-27 09:48:17',1,'link',0,'27.33.251.228'),(272,1,'2016-07-27 09:48:22',1,NULL,0,'27.33.251.228'),(273,5,'2016-07-27 09:48:33',2,NULL,0,'124.171.144.135'),(274,1,'2016-07-27 09:48:34',1,'link',0,'27.33.251.228'),(275,1,'2016-07-27 09:48:41',1,NULL,0,'27.33.251.228'),(276,1,'2016-07-27 09:48:51',4,NULL,0,'101.166.251.97'),(277,1,'2016-07-27 09:48:54',4,'document',0,'101.166.251.97'),(278,1,'2016-07-27 09:48:58',1,'forum',0,'27.33.251.228'),(279,1,'2016-07-27 09:49:21',4,NULL,0,'27.33.251.228'),(280,5,'2016-07-27 09:49:22',2,'forum',0,'124.171.144.135'),(281,1,'2016-07-27 09:49:29',1,NULL,0,'27.33.251.228'),(282,1,'2016-07-27 09:49:30',1,NULL,0,'101.183.56.133'),(283,5,'2016-07-27 09:49:33',3,NULL,0,'124.171.144.135'),(284,1,'2016-07-27 09:49:33',1,'forum',0,'27.33.251.228'),(285,1,'2016-07-27 09:49:37',1,'forum',0,'101.183.56.133'),(286,5,'2016-07-27 09:49:38',3,'forum',0,'124.171.144.135'),(287,5,'2016-07-27 09:49:48',2,NULL,1,'124.171.144.135'),(288,5,'2016-07-27 09:50:00',2,'forum',1,'124.171.144.135'),(289,1,'2016-07-27 09:50:02',1,NULL,0,'101.166.251.97'),(290,5,'2016-07-27 09:50:16',1,NULL,0,'124.171.144.135'),(291,5,'2016-07-27 09:50:26',1,'forum',0,'124.171.144.135'),(292,1,'2016-07-27 09:50:36',1,NULL,0,'101.183.56.133'),(293,1,'2016-07-27 10:14:54',1,NULL,0,'101.183.56.133'),(294,1,'2016-07-27 10:14:59',2,NULL,1,'27.33.251.228'),(295,1,'2016-07-27 10:15:11',1,NULL,0,'27.33.251.228'),(296,1,'2016-07-27 10:15:17',2,NULL,1,'220.240.126.220'),(297,1,'2016-07-27 10:15:18',1,'document',0,'27.33.251.228'),(298,1,'2016-07-27 10:18:38',1,NULL,0,'101.183.56.133'),(299,1,'2016-07-27 10:18:40',1,NULL,0,'101.183.56.133'),(300,1,'2016-07-27 10:18:42',1,'forum',0,'101.183.56.133'),(301,1,'2016-07-27 10:31:27',1,NULL,0,'220.240.126.220'),(302,5,'2016-07-27 11:56:39',3,NULL,0,'124.171.144.135'),(303,1,'2016-07-31 00:38:32',1,NULL,0,'101.183.56.133'),(304,1,'2016-07-31 00:38:37',1,'forum',0,'101.183.56.133'),(305,1,'2016-07-31 00:50:49',1,NULL,0,'101.183.56.133'),(306,1,'2016-07-31 00:50:51',1,'forum',0,'101.183.56.133'),(307,1,'2016-07-31 01:01:15',1,NULL,0,'101.183.56.133'),(308,1,'2016-07-31 01:01:18',1,'forum',0,'101.183.56.133'),(309,1,'2016-07-31 01:01:49',1,NULL,0,'101.183.56.133'),(310,1,'2016-07-31 01:01:52',1,'forum',0,'101.183.56.133'),(311,1,'2016-07-31 01:13:06',1,NULL,0,'101.183.56.133'),(312,1,'2016-07-31 01:13:10',1,'forum',0,'101.183.56.133'),(313,5,'2016-07-31 11:30:58',3,NULL,0,'124.171.144.135'),(314,1,'2016-08-01 06:39:06',2,NULL,1,'220.240.126.220'),(315,1,'2016-08-01 06:44:55',4,NULL,0,'220.240.126.220'),(316,1,'2016-08-01 06:45:59',1,NULL,0,'220.240.126.220'),(317,1,'2016-08-01 09:20:54',4,NULL,0,'101.166.251.97'),(318,1,'2016-08-01 09:21:00',4,'document',0,'101.166.251.97'),(319,1,'2016-08-01 09:22:42',4,NULL,0,'101.166.251.97'),(320,1,'2016-08-01 09:22:46',4,'forum',0,'101.166.251.97'),(321,1,'2016-08-01 09:23:05',4,NULL,0,'101.166.251.97'),(322,1,'2016-08-01 09:23:08',4,'document',0,'101.166.251.97'),(323,1,'2016-08-01 09:23:54',4,NULL,0,'101.166.251.97'),(324,1,'2016-08-01 09:24:05',3,NULL,0,'101.166.251.97'),(325,1,'2016-08-01 09:24:13',3,NULL,0,'101.166.251.97'),(326,1,'2016-08-01 09:24:26',3,NULL,0,'101.166.251.97'),(327,1,'2016-08-01 09:24:32',1,NULL,0,'101.166.251.97'),(328,1,'2016-08-01 09:24:35',1,'forum',0,'101.166.251.97'),(329,1,'2016-08-01 09:25:35',1,NULL,0,'101.166.251.97'),(330,1,'2016-08-01 09:25:37',1,'document',0,'101.166.251.97'),(331,1,'2016-08-01 09:37:33',5,NULL,0,'27.33.251.228'),(332,1,'2016-08-01 09:38:18',5,NULL,0,'27.33.251.228'),(333,1,'2016-08-01 11:08:12',4,NULL,0,'101.166.251.97'),(334,1,'2016-08-01 11:16:13',4,'wiki',0,'101.166.251.97'),(335,1,'2016-08-01 11:19:09',5,NULL,0,'27.33.251.228'),(336,1,'2016-08-01 11:19:19',5,'student_publication',0,'27.33.251.228'),(337,1,'2016-08-01 11:20:09',1,NULL,0,'101.166.251.97'),(338,1,'2016-08-01 11:20:14',1,'wiki',0,'101.166.251.97'),(339,1,'2016-08-01 11:22:29',5,NULL,0,'27.33.251.228'),(340,1,'2016-08-01 11:22:33',5,NULL,0,'27.33.251.228'),(341,1,'2016-08-01 11:22:35',1,NULL,0,'101.166.251.97'),(342,1,'2016-08-01 11:22:38',1,NULL,0,'101.166.251.97'),(343,1,'2016-08-01 11:22:50',5,'student_publication',0,'27.33.251.228'),(344,1,'2016-08-01 11:22:51',1,NULL,0,'101.166.251.97'),(345,1,'2016-08-01 11:23:05',1,NULL,0,'101.166.251.97'),(346,1,'2016-08-01 11:25:16',5,NULL,0,'101.183.56.133'),(347,1,'2016-08-01 11:29:11',5,'forum',0,'101.183.56.133'),(348,1,'2016-08-01 11:29:16',5,NULL,0,'101.183.56.133'),(349,1,'2016-08-01 11:29:20',5,NULL,0,'101.183.56.133'),(350,1,'2016-08-01 11:30:04',2,NULL,1,'101.166.251.97'),(351,1,'2016-08-01 11:31:46',3,NULL,0,'101.166.251.97'),(352,1,'2016-08-01 11:35:51',5,NULL,0,'101.183.56.133'),(353,1,'2016-08-01 11:36:14',5,NULL,0,'101.183.56.133'),(354,1,'2016-08-01 11:36:43',5,NULL,0,'101.183.56.133'),(355,1,'2016-08-01 11:36:48',5,'announcement',0,'101.183.56.133'),(356,1,'2016-08-01 11:36:53',5,NULL,0,'101.183.56.133'),(357,1,'2016-08-01 11:37:27',5,NULL,0,'101.183.56.133'),(358,5,'2016-08-01 21:14:54',3,NULL,0,'124.171.144.135'),(359,1,'2016-08-02 00:19:06',5,NULL,0,'220.240.126.220'),(360,1,'2016-08-02 00:21:55',5,NULL,0,'220.240.126.220'),(361,1,'2016-08-02 00:22:29',5,'course_description',0,'220.240.126.220'),(362,1,'2016-08-02 00:22:35',5,NULL,0,'220.240.126.220'),(363,1,'2016-08-02 00:22:38',5,'document',0,'220.240.126.220'),(364,1,'2016-08-02 00:22:56',5,NULL,0,'220.240.126.220'),(365,1,'2016-08-02 00:23:00',5,'announcement',0,'220.240.126.220'),(366,1,'2016-08-02 00:23:04',5,NULL,0,'220.240.126.220'),(367,1,'2016-08-02 00:23:05',5,'forum',0,'220.240.126.220'),(368,1,'2016-08-02 00:23:11',5,NULL,0,'220.240.126.220'),(369,1,'2016-08-02 00:23:13',5,'student_publication',0,'220.240.126.220'),(370,1,'2016-08-02 00:23:17',5,NULL,0,'220.240.126.220'),(371,5,'2016-08-02 11:56:42',3,NULL,0,'124.171.144.135'),(372,5,'2016-08-02 12:27:53',3,NULL,0,'124.171.144.135'),(373,1,'2016-08-02 20:51:31',5,NULL,0,'220.240.126.220'),(374,1,'2016-08-02 20:51:45',5,'document',0,'220.240.126.220'),(375,1,'2016-08-02 20:51:52',5,NULL,0,'220.240.126.220'),(376,1,'2016-08-02 20:51:54',5,'course_description',0,'220.240.126.220'),(377,1,'2016-08-02 20:52:56',2,NULL,1,'220.240.126.220'),(378,1,'2016-08-02 20:53:57',5,NULL,0,'220.240.126.220'),(379,1,'2016-08-02 20:54:04',5,'student_publication',0,'220.240.126.220'),(380,5,'2016-08-02 21:16:47',3,NULL,0,'124.171.70.69'),(381,5,'2016-08-03 05:03:22',2,NULL,0,'103.248.97.2'),(382,5,'2016-08-03 05:10:38',2,NULL,0,'103.248.97.2'),(383,5,'2016-08-03 05:11:33',2,NULL,0,'103.248.97.2'),(384,1,'2016-08-03 09:56:14',5,NULL,0,'101.166.251.97'),(385,1,'2016-08-03 10:00:04',5,NULL,0,'101.183.56.133'),(386,1,'2016-08-03 10:01:11',5,'student_publication',0,'101.166.251.97'),(387,1,'2016-08-03 10:06:43',5,NULL,0,'101.166.251.97'),(388,1,'2016-08-03 10:06:46',5,'student_publication',0,'101.166.251.97'),(389,1,'2016-08-03 10:08:39',5,NULL,0,'27.33.251.228'),(390,1,'2016-08-03 10:08:40',5,NULL,0,'101.183.56.133'),(391,1,'2016-08-03 10:23:00',5,NULL,0,'101.166.251.97'),(392,1,'2016-08-03 10:23:04',5,NULL,0,'101.166.251.97'),(393,1,'2016-08-03 10:24:45',5,NULL,0,'101.166.251.97'),(394,1,'2016-08-03 10:24:51',5,NULL,0,'101.166.251.97'),(395,1,'2016-08-03 10:24:53',5,NULL,0,'101.166.251.97'),(396,1,'2016-08-03 10:24:54',5,'student_publication',0,'101.166.251.97'),(397,1,'2016-08-03 10:31:52',5,NULL,0,'101.183.56.133'),(398,1,'2016-08-03 10:32:37',5,NULL,0,'101.183.56.133'),(399,1,'2016-08-03 10:33:05',5,NULL,0,'27.33.251.228'),(400,1,'2016-08-03 10:36:10',2,NULL,1,'101.183.56.133'),(401,1,'2016-08-03 10:37:13',2,NULL,1,'101.183.56.133'),(402,1,'2016-08-03 10:37:14',5,NULL,0,'101.166.251.97'),(403,1,'2016-08-03 10:37:15',5,NULL,0,'27.33.251.228'),(404,1,'2016-08-03 10:37:28',5,NULL,0,'101.166.251.97'),(405,1,'2016-08-03 10:37:28',5,NULL,0,'27.33.251.228'),(406,1,'2016-08-03 10:37:31',5,NULL,0,'27.33.251.228'),(407,1,'2016-08-03 10:38:05',5,NULL,0,'27.33.251.228'),(408,1,'2016-08-03 11:09:13',2,NULL,1,'101.166.251.97'),(409,1,'2016-08-03 11:10:08',2,NULL,1,'101.166.251.97'),(410,1,'2016-08-03 11:11:09',1,NULL,0,'101.166.251.97'),(411,1,'2016-08-03 11:11:17',5,NULL,0,'101.166.251.97'),(412,1,'2016-08-03 11:11:24',5,NULL,0,'101.166.251.97'),(413,1,'2016-08-03 11:11:30',5,'forum',0,'101.166.251.97'),(414,1,'2016-08-03 11:11:40',5,NULL,0,'101.166.251.97'),(415,1,'2016-08-03 11:12:18',5,'student_publication',0,'101.166.251.97'),(416,1,'2016-08-03 12:05:32',5,NULL,0,'101.166.251.97'),(417,1,'2016-08-03 12:05:41',5,NULL,0,'27.33.251.228'),(418,1,'2016-08-03 12:06:08',2,NULL,1,'101.183.56.133'),(419,1,'2016-08-03 12:06:14',5,NULL,0,'101.183.56.133'),(420,1,'2016-08-03 12:06:25',5,NULL,0,'101.166.251.97'),(421,1,'2016-08-03 12:06:28',5,NULL,0,'101.166.251.97'),(422,1,'2016-08-03 12:08:06',5,NULL,0,'101.166.251.97'),(423,1,'2016-08-03 12:08:08',5,'forum',0,'101.166.251.97'),(424,1,'2016-08-03 12:08:10',5,NULL,0,'101.166.251.97'),(425,5,'2016-08-04 00:25:55',2,NULL,1,'103.248.97.2'),(426,1,'2016-08-04 03:58:58',5,NULL,0,'220.240.126.220'),(427,1,'2016-08-04 03:59:04',5,'course_description',0,'220.240.126.220'),(428,1,'2016-08-04 03:59:08',5,NULL,0,'220.240.126.220'),(429,1,'2016-08-04 03:59:14',5,NULL,0,'220.240.126.220'),(430,1,'2016-08-04 03:59:17',5,'document',0,'220.240.126.220'),(431,1,'2016-08-04 03:59:27',5,NULL,0,'220.240.126.220'),(432,1,'2016-08-04 03:59:29',5,'announcement',0,'220.240.126.220'),(433,1,'2016-08-04 03:59:34',5,NULL,0,'220.240.126.220'),(434,1,'2016-08-04 03:59:36',5,'forum',0,'220.240.126.220'),(435,1,'2016-08-04 03:59:45',5,NULL,0,'220.240.126.220'),(436,1,'2016-08-04 03:59:47',5,'student_publication',0,'220.240.126.220'),(437,1,'2016-08-04 04:00:08',5,'student_publication',0,'220.240.126.220'),(438,1,'2016-08-04 04:00:11',5,NULL,0,'220.240.126.220'),(439,1,'2016-08-04 04:00:18',5,NULL,0,'220.240.126.220'),(440,1,'2016-08-04 04:00:58',5,'course_description',0,'220.240.126.220'),(441,1,'2016-08-04 04:01:41',5,NULL,0,'220.240.126.220'),(442,1,'2016-08-04 04:02:11',5,NULL,0,'220.240.126.220'),(443,1,'2016-08-04 04:03:46',5,NULL,0,'220.240.126.220'),(444,1,'2016-08-04 04:03:50',5,'forum',0,'220.240.126.220'),(445,1,'2016-08-04 04:06:50',5,NULL,0,'220.240.126.220'),(446,1,'2016-08-04 04:06:56',5,'forum',0,'220.240.126.220'),(447,1,'2016-08-04 04:18:29',1,NULL,0,'220.240.126.220'),(448,1,'2016-08-04 04:18:36',1,'forum',0,'220.240.126.220'),(449,5,'2016-08-04 05:13:25',3,NULL,0,'103.248.97.2'),(450,1,'2016-08-04 06:14:49',5,NULL,0,'220.240.126.220'),(451,1,'2016-08-04 06:15:42',5,NULL,0,'220.240.126.220'),(452,1,'2016-08-04 06:23:18',5,NULL,0,'220.240.126.220'),(453,1,'2016-08-04 06:23:24',5,'quiz',0,'220.240.126.220'),(454,1,'2016-08-04 06:24:23',5,NULL,0,'220.240.126.220'),(455,1,'2016-08-04 06:24:35',5,'link',0,'220.240.126.220'),(456,1,'2016-08-04 06:24:43',5,NULL,0,'220.240.126.220'),(457,1,'2016-08-04 06:24:57',5,'survey',0,'220.240.126.220'),(458,1,'2016-08-04 06:25:05',5,NULL,0,'220.240.126.220'),(459,1,'2016-08-04 06:25:15',5,'notebook',0,'220.240.126.220'),(460,1,'2016-08-04 06:25:32',5,NULL,0,'220.240.126.220'),(461,1,'2016-08-04 06:25:35',5,NULL,0,'220.240.126.220'),(462,1,'2016-08-04 06:25:50',5,NULL,0,'220.240.126.220'),(463,1,'2016-08-04 06:26:01',5,'wiki',0,'220.240.126.220'),(464,1,'2016-08-04 06:26:14',5,NULL,0,'220.240.126.220'),(465,1,'2016-08-04 06:27:15',5,NULL,0,'220.240.126.220'),(466,1,'2016-08-04 06:27:20',5,'course_progress',0,'220.240.126.220'),(467,1,'2016-08-04 06:27:26',5,NULL,0,'220.240.126.220'),(468,1,'2016-08-04 06:27:59',5,NULL,0,'220.240.126.220'),(469,1,'2016-08-04 06:28:05',5,NULL,0,'220.240.126.220'),(470,1,'2016-08-04 06:28:10',5,'forum',0,'220.240.126.220'),(471,5,'2016-08-04 06:42:56',3,NULL,0,'103.248.97.2'),(472,5,'2016-08-04 08:22:20',3,NULL,0,'124.171.70.69'),(473,5,'2016-08-04 11:05:53',3,NULL,0,'124.171.70.69'),(474,5,'2016-08-04 21:18:19',5,NULL,0,'124.171.70.69'),(475,6,'2016-08-05 02:58:52',5,NULL,0,'220.240.126.220'),(476,6,'2016-08-05 02:58:59',5,'forum',0,'220.240.126.220'),(477,1,'2016-08-05 03:28:57',5,NULL,0,'220.240.126.220'),(478,1,'2016-08-05 03:29:01',5,NULL,0,'220.240.126.220'),(479,1,'2016-08-05 03:29:10',5,NULL,0,'220.240.126.220'),(480,1,'2016-08-05 03:29:15',5,'course_description',0,'220.240.126.220'),(481,1,'2016-08-05 03:29:17',5,NULL,0,'220.240.126.220'),(482,1,'2016-08-05 03:29:22',5,'forum',0,'220.240.126.220'),(483,1,'2016-08-05 04:43:16',5,NULL,0,'220.240.126.220'),(484,1,'2016-08-05 04:44:56',6,NULL,0,'220.240.126.220'),(485,1,'2016-08-05 04:45:03',6,NULL,0,'220.240.126.220'),(486,1,'2016-08-05 04:45:06',6,NULL,0,'220.240.126.220'),(487,1,'2016-08-05 04:45:22',5,NULL,0,'220.240.126.220'),(488,1,'2016-08-05 04:45:45',6,NULL,0,'220.240.126.220'),(489,1,'2016-08-05 04:46:17',6,NULL,0,'220.240.126.220'),(490,1,'2016-08-05 04:46:20',6,NULL,0,'220.240.126.220'),(491,6,'2016-08-05 04:48:36',6,NULL,0,'220.240.126.220'),(492,6,'2016-08-05 04:48:58',6,NULL,0,'220.240.126.220'),(493,6,'2016-08-05 04:49:03',6,'document',0,'220.240.126.220'),(494,6,'2016-08-05 04:49:08',6,NULL,0,'220.240.126.220'),(495,6,'2016-08-05 04:49:11',6,'announcement',0,'220.240.126.220'),(496,6,'2016-08-05 04:49:14',6,NULL,0,'220.240.126.220'),(497,6,'2016-08-05 04:49:16',6,'course_description',0,'220.240.126.220'),(498,6,'2016-08-05 04:49:19',6,NULL,0,'220.240.126.220'),(499,6,'2016-08-05 04:49:25',5,NULL,0,'220.240.126.220'),(500,6,'2016-08-05 04:49:27',5,'course_description',0,'220.240.126.220'),(501,1,'2016-08-05 05:29:13',6,NULL,0,'220.240.126.220'),(502,1,'2016-08-05 05:54:05',6,NULL,0,'220.240.126.220'),(503,1,'2016-08-05 05:54:14',6,NULL,0,'220.240.126.220'),(504,1,'2016-08-05 05:54:51',6,NULL,0,'220.240.126.220'),(505,1,'2016-08-05 05:54:56',6,'forum',0,'220.240.126.220'),(506,1,'2016-08-05 05:54:58',6,NULL,0,'220.240.126.220'),(507,1,'2016-08-05 05:55:08',6,'document',0,'220.240.126.220'),(508,1,'2016-08-05 05:55:12',6,NULL,0,'220.240.126.220'),(509,1,'2016-08-05 05:55:14',6,'announcement',0,'220.240.126.220'),(510,1,'2016-08-05 05:55:17',6,NULL,0,'220.240.126.220'),(511,1,'2016-08-05 10:09:06',6,NULL,0,'101.166.251.97'),(512,1,'2016-08-05 10:09:13',6,'document',0,'101.166.251.97'),(513,1,'2016-08-05 10:09:18',6,NULL,0,'101.166.251.97'),(514,1,'2016-08-05 10:09:22',5,NULL,0,'101.166.251.97'),(515,1,'2016-08-05 10:09:24',5,'document',0,'101.166.251.97'),(516,1,'2016-08-05 10:09:31',5,NULL,0,'101.166.251.97'),(517,1,'2016-08-05 10:09:36',5,'forum',0,'101.166.251.97'),(518,1,'2016-08-05 10:09:45',5,NULL,0,'101.166.251.97'),(519,1,'2016-08-05 10:09:54',2,NULL,1,'101.166.251.97'),(520,1,'2016-08-05 10:09:56',2,'document',1,'101.166.251.97'),(521,1,'2016-08-05 10:10:06',4,NULL,0,'101.166.251.97'),(522,1,'2016-08-05 10:10:08',4,'document',0,'101.166.251.97'),(523,1,'2016-08-05 10:10:21',5,NULL,0,'101.166.251.97'),(524,1,'2016-08-05 10:10:25',5,'student_publication',0,'101.166.251.97'),(525,1,'2016-08-05 12:29:18',5,NULL,0,'101.183.56.133'),(526,1,'2016-08-06 06:18:19',5,NULL,0,'101.183.56.133'),(527,1,'2016-08-06 06:18:26',5,'user',0,'101.183.56.133'),(528,1,'2016-08-06 06:18:44',5,NULL,0,'101.183.56.133'),(529,8,'2016-08-06 06:22:04',5,NULL,0,'101.183.56.133'),(530,8,'2016-08-06 06:22:40',5,NULL,0,'101.183.56.133'),(531,8,'2016-08-06 06:22:44',5,'student_publication',0,'101.183.56.133'),(532,8,'2016-08-06 06:23:11',5,NULL,0,'101.183.56.133'),(533,8,'2016-08-06 06:23:15',5,'announcement',0,'101.183.56.133'),(534,8,'2016-08-06 06:23:18',5,NULL,0,'101.183.56.133'),(535,1,'2016-08-06 06:32:27',5,NULL,0,'101.183.56.133'),(536,1,'2016-08-06 06:32:32',5,'user',0,'101.183.56.133'),(537,6,'2016-08-06 06:32:56',5,NULL,0,'101.183.56.133'),(538,6,'2016-08-06 07:12:12',5,NULL,0,'101.183.56.133'),(539,8,'2016-08-06 07:21:24',5,NULL,0,'101.183.56.133'),(540,5,'2016-08-06 12:09:28',3,NULL,0,'124.171.149.76'),(541,1,'2016-08-06 23:08:34',6,NULL,0,'27.33.251.228'),(542,1,'2016-08-06 23:08:48',6,NULL,0,'27.33.251.228'),(543,1,'2016-08-06 23:19:44',6,NULL,0,'27.33.251.228'),(544,1,'2016-08-07 00:00:59',2,NULL,0,'220.240.126.220'),(545,1,'2016-08-07 00:01:05',2,'forum',0,'220.240.126.220'),(546,1,'2016-08-07 00:01:08',2,NULL,0,'220.240.126.220'),(547,1,'2016-08-07 00:01:16',1,NULL,0,'220.240.126.220'),(548,1,'2016-08-07 00:01:19',1,'forum',0,'220.240.126.220'),(549,1,'2016-08-07 00:01:48',1,NULL,0,'220.240.126.220'),(550,1,'2016-08-07 00:02:23',6,NULL,0,'220.240.126.220'),(551,1,'2016-08-07 00:02:29',6,'forum',0,'220.240.126.220'),(552,1,'2016-08-07 00:15:12',1,NULL,0,'220.240.126.220'),(553,1,'2016-08-07 00:15:15',1,'forum',0,'220.240.126.220'),(554,1,'2016-08-07 00:15:54',6,NULL,0,'220.240.126.220'),(555,1,'2016-08-07 00:15:57',6,'forum',0,'220.240.126.220'),(556,6,'2016-08-07 00:28:21',5,NULL,0,'220.240.126.220'),(557,6,'2016-08-07 00:28:50',6,NULL,0,'220.240.126.220'),(558,6,'2016-08-07 00:28:54',6,'forum',0,'220.240.126.220'),(559,6,'2016-08-07 00:29:01',6,NULL,0,'220.240.126.220'),(560,6,'2016-08-07 00:29:03',6,'announcement',0,'220.240.126.220'),(561,6,'2016-08-07 00:29:06',6,NULL,0,'220.240.126.220'),(562,6,'2016-08-07 00:29:10',6,'student_publication',0,'220.240.126.220'),(563,6,'2016-08-07 00:29:12',6,NULL,0,'220.240.126.220'),(564,6,'2016-08-07 00:29:14',6,'course_description',0,'220.240.126.220'),(565,6,'2016-08-07 00:29:16',6,NULL,0,'220.240.126.220'),(566,6,'2016-08-07 00:29:18',6,'document',0,'220.240.126.220'),(567,6,'2016-08-07 00:29:21',6,NULL,0,'220.240.126.220'),(568,6,'2016-08-07 00:47:48',6,NULL,0,'220.240.126.220'),(569,6,'2016-08-07 00:47:51',6,NULL,0,'220.240.126.220'),(570,6,'2016-08-07 00:47:56',6,NULL,0,'220.240.126.220'),(571,6,'2016-08-07 00:47:57',6,NULL,0,'220.240.126.220'),(572,6,'2016-08-07 00:48:03',6,'course_description',0,'220.240.126.220'),(573,6,'2016-08-07 00:49:11',6,'course_description',0,'220.240.126.220'),(574,6,'2016-08-07 00:49:19',6,NULL,0,'220.240.126.220'),(575,6,'2016-08-07 00:49:38',6,NULL,0,'220.240.126.220'),(576,1,'2016-08-07 01:06:54',6,NULL,0,'220.240.126.220'),(577,1,'2016-08-07 01:07:25',6,NULL,0,'220.240.126.220'),(578,1,'2016-08-07 01:33:48',6,NULL,0,'27.33.251.228'),(579,1,'2016-08-07 01:34:15',2,NULL,1,'27.33.251.228'),(580,1,'2016-08-07 01:34:26',4,NULL,0,'27.33.251.228'),(581,1,'2016-08-07 01:34:36',4,'student_publication',0,'27.33.251.228'),(582,1,'2016-08-07 01:34:37',4,'student_publication',0,'27.33.251.228'),(583,1,'2016-08-07 01:34:52',4,NULL,0,'27.33.251.228'),(584,1,'2016-08-07 01:36:48',6,NULL,0,'27.33.251.228'),(585,1,'2016-08-07 01:36:53',6,NULL,0,'27.33.251.228'),(586,1,'2016-08-07 01:47:58',6,NULL,0,'27.33.251.228'),(587,1,'2016-08-07 01:53:08',6,NULL,0,'27.33.251.228'),(588,1,'2016-08-07 02:00:36',6,NULL,0,'27.33.251.228'),(589,1,'2016-08-07 02:01:27',6,'course_description',0,'27.33.251.228'),(590,1,'2016-08-07 02:01:34',6,NULL,0,'27.33.251.228'),(591,1,'2016-08-07 02:02:08',6,NULL,0,'27.33.251.228'),(592,1,'2016-08-07 02:03:42',6,'student_publication',0,'27.33.251.228'),(593,1,'2016-08-07 02:03:46',6,NULL,0,'27.33.251.228'),(594,1,'2016-08-07 02:09:17',6,'student_publication',0,'27.33.251.228'),(595,1,'2016-08-07 02:09:21',6,NULL,0,'27.33.251.228'),(596,1,'2016-08-07 02:10:12',6,NULL,0,'27.33.251.228'),(597,1,'2016-08-07 02:15:48',6,NULL,0,'27.33.251.228'),(598,1,'2016-08-07 02:17:15',6,NULL,0,'27.33.251.228'),(599,1,'2016-08-07 02:24:55',6,NULL,0,'27.33.251.228'),(600,1,'2016-08-07 02:25:31',6,NULL,0,'27.33.251.228'),(601,1,'2016-08-07 02:40:49',6,NULL,0,'27.33.251.228'),(602,1,'2016-08-07 02:40:53',6,'forum',0,'27.33.251.228'),(603,1,'2016-08-07 02:40:57',6,NULL,0,'27.33.251.228'),(604,1,'2016-08-07 02:42:53',6,NULL,0,'27.33.251.228'),(605,1,'2016-08-07 02:43:32',6,'student_publication',0,'27.33.251.228'),(606,1,'2016-08-07 02:43:35',6,NULL,0,'27.33.251.228'),(607,1,'2016-08-07 02:44:38',6,NULL,0,'27.33.251.228'),(608,1,'2016-08-07 02:44:45',6,NULL,0,'27.33.251.228'),(609,1,'2016-08-07 02:46:51',6,NULL,0,'27.33.251.228'),(610,1,'2016-08-07 02:47:11',6,NULL,0,'27.33.251.228'),(611,1,'2016-08-07 02:48:59',6,NULL,0,'27.33.251.228'),(612,1,'2016-08-07 02:58:37',6,NULL,0,'27.33.251.228'),(613,1,'2016-08-07 02:58:59',6,NULL,0,'27.33.251.228'),(614,1,'2016-08-07 03:23:10',6,'course_description',0,'27.33.251.228'),(615,1,'2016-08-07 03:23:18',6,NULL,0,'27.33.251.228'),(616,1,'2016-08-07 03:24:57',5,NULL,0,'27.33.251.228'),(617,1,'2016-08-07 03:25:18',5,NULL,0,'27.33.251.228'),(618,6,'2016-08-07 04:18:39',6,NULL,0,'220.240.126.220'),(619,6,'2016-08-07 04:18:49',6,'course_description',0,'220.240.126.220'),(620,6,'2016-08-07 04:18:53',6,NULL,0,'220.240.126.220'),(621,6,'2016-08-07 04:18:58',6,'forum',0,'220.240.126.220'),(622,6,'2016-08-07 04:19:38',6,NULL,0,'220.240.126.220'),(623,5,'2016-08-07 07:07:20',2,NULL,1,'124.171.149.76'),(624,5,'2016-08-07 08:12:44',2,NULL,0,'124.171.149.76'),(625,5,'2016-08-07 08:13:08',2,NULL,1,'124.171.149.76'),(626,5,'2016-08-07 08:20:59',2,NULL,1,'124.171.149.76'),(627,5,'2016-08-07 10:18:24',2,NULL,1,'124.171.149.76'),(628,5,'2016-08-07 10:26:19',2,NULL,0,'124.171.149.76'),(629,5,'2016-08-07 10:26:41',2,NULL,0,'124.171.149.76'),(630,5,'2016-08-07 10:27:42',2,NULL,1,'124.171.149.76'),(631,5,'2016-08-07 10:28:43',2,NULL,0,'124.171.149.76'),(632,5,'2016-08-07 10:28:54',2,NULL,0,'124.171.149.76'),(633,5,'2016-08-07 10:29:02',2,NULL,1,'124.171.149.76'),(634,5,'2016-08-07 11:18:38',2,NULL,1,'124.171.149.76'),(635,5,'2016-08-07 11:18:55',2,NULL,0,'124.171.149.76'),(636,5,'2016-08-07 11:51:17',2,NULL,1,'124.171.149.76'),(637,5,'2016-08-07 12:27:08',2,NULL,1,'124.171.149.76'),(638,5,'2016-08-07 21:18:05',3,NULL,0,'124.171.149.76'),(639,5,'2016-08-07 21:18:12',3,NULL,0,'124.171.149.76'),(640,5,'2016-08-07 22:12:19',2,NULL,1,'103.248.97.2'),(641,5,'2016-08-07 22:22:47',3,NULL,0,'103.248.97.2'),(642,5,'2016-08-07 22:37:54',3,NULL,0,'103.248.97.2'),(643,5,'2016-08-07 22:38:40',2,NULL,1,'103.248.97.2'),(644,5,'2016-08-07 22:39:35',3,NULL,0,'103.248.97.2'),(645,5,'2016-08-07 23:10:15',2,NULL,1,'103.248.97.2'),(646,5,'2016-08-07 23:10:57',2,NULL,0,'103.248.97.2'),(647,5,'2016-08-07 23:13:57',2,NULL,1,'103.248.97.2'),(648,5,'2016-08-07 23:15:56',3,NULL,0,'103.248.97.2'),(649,5,'2016-08-07 23:16:45',2,NULL,1,'103.248.97.2'),(650,5,'2016-08-07 23:17:00',3,NULL,0,'103.248.97.2'),(651,5,'2016-08-07 23:17:15',2,NULL,0,'103.248.97.2'),(652,5,'2016-08-07 23:21:17',5,NULL,0,'103.248.97.2'),(653,5,'2016-08-07 23:21:23',4,NULL,0,'103.248.97.2'),(654,5,'2016-08-07 23:21:24',6,NULL,0,'103.248.97.2'),(655,5,'2016-08-07 23:36:49',6,NULL,0,'103.248.97.2'),(656,5,'2016-08-07 23:41:04',3,NULL,0,'103.248.97.2'),(657,5,'2016-08-07 23:43:11',4,NULL,0,'103.248.97.2'),(658,5,'2016-08-07 23:45:18',5,NULL,0,'103.248.97.2'),(659,6,'2016-08-08 03:11:31',6,NULL,0,'220.240.126.220'),(660,6,'2016-08-08 03:11:37',6,'course_description',0,'220.240.126.220'),(661,6,'2016-08-08 03:11:41',6,NULL,0,'220.240.126.220'),(662,6,'2016-08-08 03:11:45',6,'forum',0,'220.240.126.220'),(663,6,'2016-08-08 03:12:03',6,NULL,0,'220.240.126.220'),(664,5,'2016-08-08 03:22:39',5,NULL,0,'103.248.97.2'),(665,1,'2016-08-08 05:30:55',6,NULL,0,'27.33.251.228'),(666,1,'2016-08-08 05:31:02',6,'course_description',0,'27.33.251.228'),(667,1,'2016-08-08 05:31:12',6,NULL,0,'27.33.251.228'),(668,1,'2016-08-08 05:31:17',6,NULL,0,'27.33.251.228'),(669,1,'2016-08-08 05:31:19',6,'document',0,'27.33.251.228'),(670,1,'2016-08-08 05:31:53',6,NULL,0,'27.33.251.228'),(671,1,'2016-08-08 05:31:56',6,'announcement',0,'27.33.251.228'),(672,1,'2016-08-08 05:32:00',6,NULL,0,'27.33.251.228'),(673,1,'2016-08-08 05:32:02',6,'forum',0,'27.33.251.228'),(674,1,'2016-08-08 05:35:42',6,'forum',0,'27.33.251.228'),(675,1,'2016-08-08 05:39:56',6,'forum',0,'27.33.251.228'),(676,1,'2016-08-08 05:44:55',6,NULL,0,'27.33.251.228'),(677,1,'2016-08-08 05:45:02',6,'course_description',0,'27.33.251.228'),(678,1,'2016-08-08 05:45:05',6,NULL,0,'27.33.251.228'),(679,1,'2016-08-08 05:45:10',6,NULL,0,'27.33.251.228'),(680,1,'2016-08-08 05:45:12',6,'document',0,'27.33.251.228'),(681,1,'2016-08-08 05:47:19',6,'document',0,'27.33.251.228'),(682,5,'2016-08-08 05:47:28',3,NULL,0,'103.248.97.2'),(683,1,'2016-08-08 05:47:30',6,NULL,0,'27.33.251.228'),(684,1,'2016-08-08 05:47:33',6,'document',0,'27.33.251.228'),(685,1,'2016-08-08 05:47:37',6,NULL,0,'27.33.251.228'),(686,1,'2016-08-08 05:47:39',6,'announcement',0,'27.33.251.228'),(687,1,'2016-08-08 05:47:43',6,NULL,0,'27.33.251.228'),(688,1,'2016-08-08 05:47:45',6,'forum',0,'27.33.251.228'),(689,1,'2016-08-08 05:47:50',6,NULL,0,'27.33.251.228'),(690,1,'2016-08-08 05:47:53',6,'student_publication',0,'27.33.251.228'),(691,5,'2016-08-08 05:51:36',2,NULL,1,'103.248.97.2'),(692,1,'2016-08-08 06:08:32',5,NULL,0,'27.33.251.228'),(693,5,'2016-08-08 06:15:39',3,NULL,0,'103.248.97.2'),(694,5,'2016-08-08 06:16:38',6,NULL,0,'103.248.97.2'),(695,5,'2016-08-08 06:17:45',5,NULL,0,'103.248.97.2'),(696,1,'2016-08-08 10:00:43',6,NULL,0,'27.33.251.228'),(697,1,'2016-08-08 10:01:44',5,NULL,0,'27.33.251.228'),(698,1,'2016-08-08 10:01:48',5,'student_publication',0,'27.33.251.228'),(699,5,'2016-08-08 10:07:30',2,NULL,1,'124.171.149.76'),(700,5,'2016-08-08 10:07:56',2,NULL,0,'124.171.149.76'),(701,5,'2016-08-08 10:10:02',2,NULL,0,'124.171.149.76'),(702,5,'2016-08-08 11:22:21',3,NULL,0,'124.171.149.76'),(703,5,'2016-08-08 11:22:31',3,NULL,0,'124.171.149.76'),(704,5,'2016-08-08 11:29:59',3,NULL,0,'124.171.149.76'),(705,5,'2016-08-08 11:38:50',3,NULL,0,'124.171.149.76'),(706,5,'2016-08-08 11:43:38',4,NULL,0,'124.171.149.76'),(707,5,'2016-08-08 11:45:01',4,NULL,0,'124.171.149.76'),(708,5,'2016-08-08 12:13:19',4,NULL,0,'124.171.149.76'),(709,5,'2016-08-08 12:16:02',3,NULL,0,'124.171.149.76'),(710,5,'2016-08-08 12:33:03',3,NULL,0,'124.171.149.76'),(711,5,'2016-08-08 12:33:51',2,NULL,1,'124.171.149.76'),(712,5,'2016-08-08 12:34:50',2,NULL,1,'124.171.149.76'),(713,5,'2016-08-08 12:35:02',2,NULL,0,'124.171.149.76'),(714,5,'2016-08-08 12:42:56',6,NULL,0,'124.171.149.76'),(715,5,'2016-08-08 12:48:56',6,NULL,0,'124.171.149.76'),(716,8,'2016-08-09 09:44:50',5,NULL,0,'101.183.79.111'),(717,1,'2016-08-09 09:45:12',5,NULL,0,'101.183.79.111'),(718,8,'2016-08-09 09:49:09',5,NULL,0,'101.183.79.111'),(719,8,'2016-08-09 09:49:26',5,NULL,0,'101.183.79.111'),(720,8,'2016-08-09 10:09:21',5,NULL,0,'101.183.79.111'),(721,1,'2016-08-09 10:38:13',6,NULL,0,'101.166.251.97'),(722,1,'2016-08-09 10:38:25',6,NULL,0,'101.166.251.97'),(723,1,'2016-08-09 10:38:34',6,NULL,0,'101.166.251.97'),(724,1,'2016-08-09 10:38:39',6,NULL,0,'101.166.251.97'),(725,1,'2016-08-09 10:38:47',6,NULL,0,'101.166.251.97'),(726,1,'2016-08-09 10:38:48',6,NULL,0,'101.166.251.97'),(727,1,'2016-08-09 10:39:01',5,NULL,0,'101.166.251.97'),(728,1,'2016-08-09 10:39:06',5,NULL,0,'101.166.251.97'),(729,1,'2016-08-09 10:39:18',5,NULL,0,'101.166.251.97'),(730,1,'2016-08-09 10:39:42',5,NULL,0,'101.166.251.97'),(731,1,'2016-08-09 10:40:20',5,NULL,0,'101.166.251.97'),(732,1,'2016-08-09 10:40:23',5,'announcement',0,'101.166.251.97'),(733,1,'2016-08-09 10:40:25',5,NULL,0,'101.166.251.97'),(734,1,'2016-08-09 10:40:27',5,'course_description',0,'101.166.251.97'),(735,1,'2016-08-09 10:40:30',5,NULL,0,'101.166.251.97'),(736,1,'2016-08-09 10:40:32',5,'forum',0,'101.166.251.97'),(737,1,'2016-08-09 10:40:36',5,'forum',0,'101.166.251.97'),(738,1,'2016-08-09 10:40:38',5,NULL,0,'101.166.251.97'),(739,1,'2016-08-09 10:42:18',4,NULL,0,'101.166.251.97'),(740,1,'2016-08-09 10:42:26',4,'document',0,'101.166.251.97'),(741,1,'2016-08-09 10:42:36',4,'document',0,'101.166.251.97'),(742,1,'2016-08-09 10:48:04',5,NULL,0,'101.166.251.97'),(743,1,'2016-08-09 10:48:09',5,'document',0,'101.166.251.97'),(744,1,'2016-08-09 10:48:45',5,NULL,0,'101.166.251.97'),(745,1,'2016-08-09 10:54:50',5,NULL,0,'101.166.251.97'),(746,1,'2016-08-09 10:54:54',5,'document',0,'101.166.251.97'),(747,1,'2016-08-09 10:58:49',5,NULL,0,'101.166.251.97'),(748,1,'2016-08-09 10:58:58',5,'document',0,'101.166.251.97'),(749,1,'2016-08-09 11:00:44',5,NULL,0,'101.166.251.97'),(750,1,'2016-08-09 11:00:51',5,NULL,0,'101.166.251.97'),(751,1,'2016-08-09 11:00:57',5,'student_publication',0,'101.166.251.97'),(752,1,'2016-08-09 11:01:03',5,'student_publication',0,'101.166.251.97'),(753,1,'2016-08-09 11:08:20',5,NULL,0,'101.166.251.97'),(754,1,'2016-08-09 11:08:22',5,NULL,0,'101.166.251.97'),(755,1,'2016-08-09 11:08:31',5,'forum',0,'101.166.251.97'),(756,1,'2016-08-09 11:08:33',5,NULL,0,'101.166.251.97'),(757,1,'2016-08-09 11:08:39',5,'course_description',0,'101.166.251.97'),(758,1,'2016-08-09 11:08:41',5,NULL,0,'101.166.251.97'),(759,1,'2016-08-09 11:08:49',5,NULL,0,'101.166.251.97'),(760,1,'2016-08-09 11:08:51',5,'document',0,'101.166.251.97'),(761,1,'2016-08-09 11:08:53',5,NULL,0,'101.166.251.97'),(762,1,'2016-08-09 11:08:56',5,'announcement',0,'101.166.251.97'),(763,1,'2016-08-09 11:08:57',5,NULL,0,'101.166.251.97'),(764,1,'2016-08-09 11:08:59',5,'course_description',0,'101.166.251.97'),(765,1,'2016-08-09 11:11:57',5,NULL,0,'101.166.251.97'),(766,1,'2016-08-09 11:12:03',5,'course_description',0,'101.166.251.97'),(767,1,'2016-08-09 11:12:17',5,NULL,0,'101.166.251.97'),(768,1,'2016-08-09 11:12:24',5,NULL,0,'101.166.251.97'),(769,1,'2016-08-09 11:12:25',5,'document',0,'101.166.251.97'),(770,1,'2016-08-09 11:12:29',5,NULL,0,'101.166.251.97'),(771,1,'2016-08-09 11:12:31',5,'course_description',0,'101.166.251.97'),(772,1,'2016-08-09 11:12:41',5,NULL,0,'101.166.251.97'),(773,1,'2016-08-09 11:12:46',5,NULL,0,'101.166.251.97'),(774,1,'2016-08-09 11:12:48',5,'document',0,'101.166.251.97'),(775,1,'2016-08-09 11:12:53',5,NULL,0,'101.166.251.97'),(776,1,'2016-08-09 11:12:55',5,'forum',0,'101.166.251.97'),(777,1,'2016-08-09 11:12:57',5,NULL,0,'101.166.251.97'),(778,1,'2016-08-09 11:12:59',5,'course_description',0,'101.166.251.97'),(779,1,'2016-08-09 11:14:59',5,NULL,0,'101.166.251.97'),(780,6,'2016-08-09 22:35:16',6,NULL,0,'220.240.126.220'),(781,6,'2016-08-09 22:35:29',6,'course_description',0,'220.240.126.220'),(782,6,'2016-08-09 22:35:32',6,NULL,0,'220.240.126.220'),(783,6,'2016-08-09 22:35:38',6,NULL,0,'220.240.126.220'),(784,6,'2016-08-09 22:35:40',6,'document',0,'220.240.126.220'),(785,6,'2016-08-09 22:35:44',6,NULL,0,'220.240.126.220'),(786,6,'2016-08-09 22:35:46',6,'announcement',0,'220.240.126.220'),(787,6,'2016-08-09 22:35:49',6,NULL,0,'220.240.126.220'),(788,6,'2016-08-09 22:35:51',6,'forum',0,'220.240.126.220'),(789,6,'2016-08-09 22:36:01',6,NULL,0,'220.240.126.220'),(790,6,'2016-08-09 22:36:04',6,'forum',0,'220.240.126.220'),(791,6,'2016-08-09 22:36:11',6,NULL,0,'220.240.126.220'),(792,6,'2016-08-09 22:36:12',6,'student_publication',0,'220.240.126.220'),(793,6,'2016-08-09 22:36:15',6,NULL,0,'220.240.126.220'),(794,6,'2016-08-09 22:38:18',6,NULL,0,'220.240.126.220'),(795,1,'2016-08-09 22:38:37',5,NULL,0,'220.240.126.220'),(796,1,'2016-08-09 22:38:40',5,'announcement',0,'220.240.126.220'),(797,1,'2016-08-09 22:38:44',5,NULL,0,'220.240.126.220'),(798,1,'2016-08-09 22:38:49',5,'document',0,'220.240.126.220'),(799,1,'2016-08-09 22:39:20',5,NULL,0,'220.240.126.220'),(800,1,'2016-08-09 22:39:22',5,'student_publication',0,'220.240.126.220'),(801,1,'2016-08-09 22:39:29',5,NULL,0,'220.240.126.220'),(802,1,'2016-08-09 22:39:34',5,'forum',0,'220.240.126.220'),(803,1,'2016-08-09 22:39:36',5,NULL,0,'220.240.126.220'),(804,1,'2016-08-10 04:16:43',5,NULL,0,'101.183.79.111'),(805,1,'2016-08-10 05:58:32',6,NULL,0,'220.240.126.220'),(806,1,'2016-08-10 05:58:39',6,'forum',0,'220.240.126.220'),(807,1,'2016-08-10 06:01:22',6,NULL,0,'220.240.126.220'),(808,1,'2016-08-10 06:03:27',6,'student_publication',0,'220.240.126.220'),(809,1,'2016-08-10 06:03:27',6,'course_description',0,'220.240.126.220'),(810,1,'2016-08-10 06:03:28',6,NULL,0,'220.240.126.220'),(811,1,'2016-08-10 06:50:59',6,NULL,0,'220.240.126.220'),(812,1,'2016-08-10 06:51:20',6,'forum',0,'220.240.126.220'),(813,1,'2016-08-10 06:52:15',6,NULL,0,'220.240.126.220'),(814,1,'2016-08-10 06:52:20',5,NULL,0,'27.33.251.228'),(815,1,'2016-08-10 06:52:23',6,'forum',0,'220.240.126.220'),(816,1,'2016-08-10 06:52:27',5,'forum',0,'27.33.251.228'),(817,1,'2016-08-10 06:52:37',6,NULL,0,'220.240.126.220'),(818,1,'2016-08-10 06:52:42',5,NULL,0,'27.33.251.228'),(819,1,'2016-08-10 06:52:47',5,NULL,0,'27.33.251.228'),(820,1,'2016-08-10 06:52:53',6,NULL,0,'27.33.251.228'),(821,1,'2016-08-10 06:53:11',6,'forum',0,'220.240.126.220'),(822,1,'2016-08-10 06:53:27',6,NULL,0,'27.33.251.228'),(823,1,'2016-08-10 06:53:37',6,'forum',0,'27.33.251.228'),(824,1,'2016-08-10 06:55:37',6,NULL,0,'27.33.251.228'),(825,1,'2016-08-10 07:05:51',6,NULL,0,'27.33.251.228'),(826,1,'2016-08-10 07:05:56',6,NULL,0,'27.33.251.228'),(827,1,'2016-08-10 07:05:56',6,NULL,0,'220.240.126.220'),(828,1,'2016-08-10 07:06:00',6,NULL,0,'220.240.126.220'),(829,1,'2016-08-10 07:08:17',6,NULL,0,'220.240.126.220'),(830,1,'2016-08-10 07:08:29',6,NULL,0,'220.240.126.220'),(831,1,'2016-08-10 07:08:38',6,NULL,0,'220.240.126.220'),(832,1,'2016-08-10 07:43:28',5,NULL,0,'27.33.251.228'),(833,1,'2016-08-10 08:43:24',6,NULL,0,'27.33.251.228'),(834,1,'2016-08-10 08:43:27',6,'forum',0,'27.33.251.228'),(835,1,'2016-08-10 08:51:35',6,'forum',0,'27.33.251.228'),(836,5,'2016-08-10 09:40:59',3,NULL,0,'124.171.149.76'),(837,5,'2016-08-10 09:45:15',3,NULL,0,'124.171.149.76'),(838,1,'2016-08-10 09:46:11',5,NULL,0,'101.166.251.97'),(839,1,'2016-08-10 09:46:16',5,'course_description',0,'101.166.251.97'),(840,1,'2016-08-10 09:46:27',5,NULL,0,'101.166.251.97'),(841,1,'2016-08-10 09:56:55',6,NULL,0,'101.166.251.97'),(842,1,'2016-08-10 09:56:59',6,'course_description',0,'101.166.251.97'),(843,1,'2016-08-10 10:00:01',6,NULL,0,'101.166.251.97'),(844,1,'2016-08-10 10:00:58',6,NULL,0,'101.166.251.97'),(845,1,'2016-08-10 10:01:32',6,NULL,0,'101.166.251.97'),(846,1,'2016-08-10 10:13:40',6,'course_description',0,'101.166.251.97'),(847,1,'2016-08-10 10:14:07',6,NULL,0,'101.166.251.97'),(848,1,'2016-08-10 10:14:27',6,'student_publication',0,'101.166.251.97'),(849,1,'2016-08-10 10:14:36',6,NULL,0,'101.166.251.97'),(850,1,'2016-08-10 10:16:41',5,NULL,0,'101.166.251.97'),(851,1,'2016-08-10 10:29:40',5,NULL,0,'101.166.251.97'),(852,1,'2016-08-12 00:42:22',6,NULL,0,'220.240.126.220'),(853,1,'2016-08-12 00:42:26',6,'course_description',0,'220.240.126.220'),(854,1,'2016-08-12 00:42:29',6,NULL,0,'220.240.126.220'),(855,1,'2016-08-12 00:42:31',6,'announcement',0,'220.240.126.220'),(856,1,'2016-08-12 00:42:34',6,NULL,0,'220.240.126.220'),(857,1,'2016-08-12 00:42:38',6,'student_publication',0,'220.240.126.220'),(858,1,'2016-08-12 00:42:41',6,NULL,0,'220.240.126.220'),(859,1,'2016-08-12 00:42:43',6,'forum',0,'220.240.126.220'),(860,1,'2016-08-12 00:43:02',6,NULL,0,'220.240.126.220'),(861,1,'2016-08-12 00:43:05',6,'announcement',0,'220.240.126.220'),(862,1,'2016-08-12 06:01:51',6,NULL,0,'220.240.126.220'),(863,1,'2016-08-12 06:01:54',6,NULL,0,'220.240.126.220'),(864,1,'2016-08-12 06:01:56',6,'course_description',0,'220.240.126.220'),(865,1,'2016-08-12 06:02:00',6,NULL,0,'220.240.126.220'),(866,1,'2016-08-12 06:02:06',6,NULL,0,'220.240.126.220'),(867,1,'2016-08-12 06:02:09',6,'document',0,'220.240.126.220'),(868,1,'2016-08-12 06:02:11',6,NULL,0,'220.240.126.220'),(869,1,'2016-08-12 06:02:14',6,'forum',0,'220.240.126.220'),(870,1,'2016-08-14 00:40:33',6,NULL,0,'220.240.126.220'),(871,1,'2016-08-14 00:40:36',6,'course_description',0,'220.240.126.220'),(872,1,'2016-08-14 00:40:38',6,NULL,0,'220.240.126.220'),(873,1,'2016-08-14 00:40:40',6,'announcement',0,'220.240.126.220'),(874,1,'2016-08-14 00:40:43',6,NULL,0,'220.240.126.220'),(875,1,'2016-08-14 00:40:44',6,'document',0,'220.240.126.220'),(876,1,'2016-08-14 00:40:47',6,NULL,0,'220.240.126.220'),(877,1,'2016-08-15 10:37:36',5,NULL,0,'101.183.79.111');
/*!40000 ALTER TABLE `track_e_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_attempt`
--

DROP TABLE IF EXISTS `track_e_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exe_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teacher_comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `marks` double NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `c_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `tms` datetime NOT NULL,
  `session_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course` (`c_id`),
  KEY `exe_id` (`exe_id`),
  KEY `user_id` (`user_id`),
  KEY `question_id` (`question_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_attempt`
--

LOCK TABLES `track_e_attempt` WRITE;
/*!40000 ALTER TABLE `track_e_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_attempt_coeff`
--

DROP TABLE IF EXISTS `track_e_attempt_coeff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_attempt_coeff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attempt_id` int(11) NOT NULL,
  `marks_coeff` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_attempt_coeff`
--

LOCK TABLES `track_e_attempt_coeff` WRITE;
/*!40000 ALTER TABLE `track_e_attempt_coeff` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_attempt_coeff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_attempt_recording`
--

DROP TABLE IF EXISTS `track_e_attempt_recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_attempt_recording` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exe_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `marks` int(11) NOT NULL,
  `insert_date` datetime NOT NULL,
  `author` int(11) NOT NULL,
  `teacher_comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exe_id` (`exe_id`),
  KEY `question_id` (`question_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_attempt_recording`
--

LOCK TABLES `track_e_attempt_recording` WRITE;
/*!40000 ALTER TABLE `track_e_attempt_recording` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_attempt_recording` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_course_access`
--

DROP TABLE IF EXISTS `track_e_course_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_course_access` (
  `course_access_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_course_date` datetime NOT NULL,
  `logout_course_date` datetime DEFAULT NULL,
  `counter` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`course_access_id`),
  KEY `course` (`c_id`),
  KEY `user_id` (`user_id`),
  KEY `login_course_date` (`login_course_date`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_course_access`
--

LOCK TABLES `track_e_course_access` WRITE;
/*!40000 ALTER TABLE `track_e_course_access` DISABLE KEYS */;
INSERT INTO `track_e_course_access` VALUES (1,1,1,'2016-07-12 12:07:55','2016-07-12 12:13:50',4,0,'124.171.130.216'),(2,1,2,'2016-07-12 12:13:21','2016-07-12 12:13:21',1,0,'124.171.130.216'),(3,1,1,'2016-07-13 00:57:34','2016-07-13 00:58:42',5,0,'124.171.130.216'),(4,1,1,'2016-07-13 00:59:17','2016-07-13 00:59:59',4,0,'124.171.130.216'),(5,1,1,'2016-07-13 04:32:48','2016-07-13 04:42:25',2,0,'124.171.130.216'),(6,1,1,'2016-07-13 04:42:50','2016-07-13 04:48:55',5,0,'124.171.130.216'),(7,1,1,'2016-07-13 04:51:47','2016-07-13 05:00:54',5,0,'124.171.130.216'),(8,1,1,'2016-07-13 05:12:37','2016-07-13 05:18:22',2,0,'124.171.130.216'),(9,1,1,'2016-07-13 05:21:04','2016-07-13 05:21:11',2,0,'124.171.130.216'),(10,1,1,'2016-07-13 07:07:32','2016-07-13 07:11:05',2,0,'124.171.130.216'),(11,1,1,'2016-07-13 07:11:08','2016-07-13 07:11:10',2,0,'124.171.130.216'),(12,1,1,'2016-07-13 08:48:12','2016-07-13 08:54:40',65,0,'101.183.92.157'),(13,1,1,'2016-07-13 08:54:46','2016-07-13 09:46:43',10,0,'101.183.92.157'),(14,1,1,'2016-07-13 09:55:48','2016-07-13 09:56:01',2,0,'124.171.130.216'),(15,1,1,'2016-07-13 09:56:05','2016-07-13 09:58:25',2,0,'124.171.130.216'),(16,1,1,'2016-07-13 10:15:12','2016-07-13 10:17:34',15,0,'101.183.92.157'),(17,1,1,'2016-07-13 10:17:42','2016-07-13 10:27:14',3,0,'101.183.92.157'),(18,1,1,'2016-07-13 10:35:55','2016-07-13 10:35:58',2,0,'101.183.92.157'),(19,1,1,'2016-07-13 23:02:34','2016-07-13 23:03:10',5,0,'124.171.130.216'),(20,1,1,'2016-07-13 23:03:48','2016-07-13 23:05:33',8,0,'124.171.130.216'),(21,1,1,'2016-07-13 23:06:43','2016-07-13 23:19:55',6,0,'124.171.130.216'),(22,1,1,'2016-07-14 01:24:38','2016-07-14 01:24:49',3,0,'124.171.130.216'),(23,1,1,'2016-07-14 01:25:11','2016-07-14 01:25:31',5,0,'124.171.130.216'),(24,1,1,'2016-07-14 01:26:46','2016-07-14 01:28:38',4,0,'124.171.130.216'),(25,2,1,'2016-07-14 01:28:51','2016-07-14 01:29:09',5,0,'124.171.130.216'),(26,2,1,'2016-07-14 01:32:24','2016-07-14 01:32:28',2,0,'124.171.130.216'),(27,2,1,'2016-07-14 03:23:48','2016-07-14 04:01:46',3,0,'124.171.130.216'),(28,2,1,'2016-07-14 08:19:02','2016-07-14 08:24:39',2,0,'124.171.130.216'),(29,2,1,'2016-07-15 00:27:43','2016-07-15 00:29:23',2,0,'124.171.130.216'),(30,1,1,'2016-07-15 00:29:42','2016-07-15 00:32:01',3,0,'124.171.130.216'),(31,1,1,'2016-07-15 00:33:06','2016-07-15 00:33:13',3,0,'124.171.130.216'),(32,1,1,'2016-07-15 01:36:38','2016-07-15 01:36:42',2,0,'124.171.130.216'),(33,1,1,'2016-07-15 02:03:56','2016-07-15 02:06:59',3,0,'124.171.130.216'),(34,1,1,'2016-07-15 05:23:27','2016-07-15 05:23:27',1,0,'124.171.130.216'),(35,1,1,'2016-07-16 04:04:39','2016-07-16 04:50:55',58,0,'101.166.251.97'),(36,2,1,'2016-07-16 04:51:31','2016-07-16 04:53:12',7,0,'101.166.251.97'),(37,1,1,'2016-07-16 10:02:48','2016-07-16 10:50:15',13,0,'101.183.3.127'),(38,2,1,'2016-07-16 10:27:01','2016-07-16 10:27:01',1,0,'101.166.251.97'),(39,1,1,'2016-07-16 10:50:21','2016-07-16 10:54:07',10,0,'101.183.3.127'),(40,1,1,'2016-07-17 07:33:18','2016-07-17 07:33:29',2,0,'101.166.251.97'),(41,2,1,'2016-07-17 07:33:31','2016-07-17 07:33:46',3,0,'101.166.251.97'),(42,1,1,'2016-07-17 07:33:48','2016-07-17 07:34:10',4,0,'101.166.251.97'),(43,1,1,'2016-07-17 08:58:56','2016-07-17 09:12:02',9,0,'101.166.251.97'),(44,1,1,'2016-07-17 10:03:52','2016-07-17 10:43:05',5,0,'101.183.3.127'),(45,1,1,'2016-07-18 10:25:55','2016-07-18 10:35:10',7,0,'101.183.3.127'),(46,1,1,'2016-07-18 10:55:10','2016-07-18 11:31:04',9,0,'124.171.130.216'),(47,1,1,'2016-07-18 11:32:00','2016-07-18 11:36:29',15,0,'124.171.130.216'),(48,2,1,'2016-07-18 11:39:42','2016-07-18 12:17:49',11,0,'124.171.130.216'),(49,2,1,'2016-07-18 20:37:24','2016-07-18 20:46:59',7,0,'124.171.193.190'),(50,2,1,'2016-07-18 20:47:11','2016-07-18 20:47:51',6,0,'124.171.193.190'),(51,2,1,'2016-07-18 20:51:14','2016-07-18 20:52:04',8,0,'124.171.193.190'),(52,2,1,'2016-07-18 20:53:22','2016-07-18 20:54:05',10,0,'124.171.193.190'),(53,2,1,'2016-07-18 20:56:19','2016-07-18 20:56:28',4,1,'124.171.193.190'),(54,1,1,'2016-07-19 00:50:36','2016-07-19 00:50:36',2,0,'220.240.126.220'),(55,2,1,'2016-07-19 05:14:34','2016-07-19 05:14:42',2,1,'220.240.126.220'),(56,2,1,'2016-07-19 07:41:52','2016-07-19 07:43:08',13,1,'101.166.251.97'),(57,1,1,'2016-07-19 07:43:15','2016-07-19 07:44:06',13,0,'101.166.251.97'),(58,1,1,'2016-07-19 07:59:02','2016-07-19 08:07:53',24,0,'101.166.251.97'),(59,1,4,'2016-07-19 09:22:19','2016-07-19 09:22:28',3,0,'101.166.251.97'),(60,2,1,'2016-07-19 09:36:06','2016-07-19 09:38:49',5,1,'124.171.193.190'),(61,2,1,'2016-07-19 09:39:56','2016-07-19 09:40:26',4,0,'124.171.193.190'),(62,2,1,'2016-07-19 09:40:43','2016-07-19 09:44:44',19,0,'124.171.193.190'),(63,2,1,'2016-07-19 09:44:48','2016-07-19 09:45:20',4,0,'124.171.193.190'),(64,2,1,'2016-07-19 09:45:20','2016-07-19 10:25:48',20,0,'124.171.193.190'),(65,1,1,'2016-07-19 10:40:03','2016-07-19 11:23:07',26,0,'101.183.3.127'),(66,2,1,'2016-07-19 11:08:45','2016-07-19 11:13:41',7,0,'124.171.193.190'),(67,1,4,'2016-07-19 11:26:07','2016-07-19 11:27:42',5,0,'101.166.251.97'),(68,1,4,'2016-07-19 11:28:02','2016-07-19 11:28:07',2,0,'101.166.251.97'),(69,2,1,'2016-07-19 11:28:59','2016-07-19 11:29:20',4,1,'101.166.251.97'),(70,1,1,'2016-07-20 09:35:44','2016-07-20 09:35:54',2,0,'101.183.3.127'),(71,1,1,'2016-07-20 09:37:27','2016-07-20 09:51:11',12,0,'101.183.3.127'),(72,2,1,'2016-07-20 10:51:36','2016-07-20 10:55:51',3,0,'124.171.193.190'),(73,1,1,'2016-07-21 07:56:12','2016-07-21 07:58:24',3,0,'124.171.144.135'),(74,1,1,'2016-07-21 07:58:54','2016-07-21 07:59:05',4,0,'124.171.144.135'),(75,1,1,'2016-07-21 07:59:05','2016-07-21 08:00:50',19,0,'124.171.144.135'),(76,1,1,'2016-07-21 09:26:35','2016-07-21 10:22:12',69,0,'101.183.3.127'),(77,1,1,'2016-07-21 10:28:23','2016-07-21 10:28:23',1,0,'101.183.3.127'),(78,1,1,'2016-07-21 10:30:02','2016-07-21 10:40:31',10,0,'101.183.3.127'),(79,1,1,'2016-07-21 19:57:33','2016-07-21 19:58:17',2,0,'124.171.144.135'),(80,1,1,'2016-07-21 19:59:08','2016-07-21 20:05:10',3,0,'124.171.144.135'),(81,1,1,'2016-07-21 20:49:48','2016-07-21 20:50:34',7,0,'124.171.144.135'),(82,1,1,'2016-07-21 20:53:08','2016-07-21 20:57:48',3,0,'124.171.144.135'),(83,1,1,'2016-07-21 20:57:52','2016-07-21 21:02:51',7,0,'124.171.144.135'),(84,2,1,'2016-07-21 21:03:18','2016-07-21 21:07:23',7,0,'124.171.144.135'),(85,2,1,'2016-07-21 21:08:32','2016-07-21 21:11:29',3,0,'124.171.144.135'),(86,1,1,'2016-07-21 21:11:50','2016-07-21 21:11:50',1,0,'124.171.144.135'),(87,2,5,'2016-07-21 22:20:49','2016-07-21 22:24:15',4,0,'103.248.97.2'),(88,2,5,'2016-07-21 22:25:16','2016-07-21 22:25:38',5,0,'103.248.97.2'),(89,2,5,'2016-07-21 22:27:29','2016-07-21 23:10:50',14,0,'103.248.97.2'),(90,2,5,'2016-07-21 23:30:24','2016-07-21 23:34:07',5,0,'103.248.97.2'),(91,2,5,'2016-07-21 23:34:10','2016-07-21 23:38:27',12,1,'103.248.97.2'),(92,2,5,'2016-07-21 23:39:24','2016-07-21 23:42:24',9,1,'103.248.97.2'),(93,2,5,'2016-07-21 23:42:47','2016-07-21 23:49:01',6,0,'103.248.97.2'),(94,2,5,'2016-07-21 23:49:04','2016-07-21 23:50:08',7,0,'103.248.97.2'),(95,1,5,'2016-07-21 23:51:28','2016-07-21 23:51:34',2,0,'103.248.97.2'),(96,3,5,'2016-07-22 02:02:40','2016-07-22 02:04:48',23,0,'103.248.97.2'),(97,3,5,'2016-07-22 02:04:54','2016-07-22 02:05:05',3,0,'103.248.97.2'),(98,3,5,'2016-07-22 02:05:05','2016-07-22 02:05:22',4,0,'103.248.97.2'),(99,3,5,'2016-07-22 02:05:22','2016-07-22 02:06:18',19,0,'103.248.97.2'),(100,3,5,'2016-07-22 02:06:29','2016-07-22 02:09:37',16,0,'103.248.97.2'),(101,2,1,'2016-07-22 03:34:47','2016-07-22 03:35:26',3,1,'220.240.126.220'),(102,3,5,'2016-07-22 04:44:57','2016-07-22 05:05:50',29,0,'103.248.97.2'),(103,3,5,'2016-07-22 05:16:53','2016-07-22 05:17:52',4,0,'103.248.97.2'),(104,1,1,'2016-07-22 07:41:23','2016-07-22 07:41:30',3,0,'124.171.144.135'),(105,3,1,'2016-07-22 07:41:55','2016-07-22 07:42:41',8,0,'124.171.144.135'),(106,3,1,'2016-07-22 07:43:01','2016-07-22 07:44:12',8,0,'124.171.144.135'),(107,1,1,'2016-07-23 01:01:05','2016-07-23 01:01:36',7,0,'101.166.251.97'),(108,2,1,'2016-07-23 01:01:42','2016-07-23 01:01:49',2,0,'101.166.251.97'),(109,2,1,'2016-07-23 01:02:46','2016-07-23 01:03:36',5,1,'101.166.251.97'),(110,2,1,'2016-07-23 01:03:37','2016-07-23 01:03:39',2,1,'101.166.251.97'),(111,3,4,'2016-07-23 01:04:02','2016-07-23 01:04:18',4,0,'101.166.251.97'),(112,1,4,'2016-07-23 01:04:20','2016-07-23 01:05:02',6,0,'101.166.251.97'),(113,1,4,'2016-07-23 01:05:39','2016-07-23 01:10:08',5,0,'101.166.251.97'),(114,1,1,'2016-07-23 01:10:33','2016-07-23 01:22:44',30,0,'101.166.251.97'),(115,1,1,'2016-07-23 03:48:08','2016-07-23 03:48:08',1,0,'101.166.251.97'),(116,1,4,'2016-07-23 03:48:26','2016-07-23 04:15:13',26,0,'101.166.251.97'),(117,1,1,'2016-07-23 04:15:57','2016-07-23 04:18:31',17,0,'101.166.251.97'),(118,1,1,'2016-07-23 05:46:35','2016-07-23 05:46:35',1,0,'101.166.251.97'),(119,1,1,'2016-07-23 05:46:39','2016-07-23 06:39:04',32,0,'101.166.251.97'),(120,1,1,'2016-07-23 07:57:08','2016-07-23 08:00:12',10,0,'101.166.251.97'),(121,1,1,'2016-07-23 09:03:56','2016-07-23 09:25:30',3,0,'101.166.251.97'),(122,4,1,'2016-07-23 09:25:57','2016-07-23 09:26:10',3,0,'101.166.251.97'),(123,1,1,'2016-07-23 09:28:54','2016-07-23 09:35:52',6,0,'101.166.251.97'),(124,1,1,'2016-07-23 12:16:53','2016-07-23 12:16:53',1,0,'101.166.251.97'),(125,3,1,'2016-07-23 22:52:20','2016-07-23 22:53:21',4,0,'168.1.6.43'),(126,4,1,'2016-07-23 22:53:28','2016-07-23 23:13:30',4,0,'168.1.6.43'),(127,1,1,'2016-07-24 00:22:16','2016-07-24 00:25:17',3,0,'101.166.251.97'),(128,1,1,'2016-07-24 00:38:56','2016-07-24 00:38:56',1,0,'101.166.251.97'),(129,1,1,'2016-07-24 05:10:03','2016-07-24 05:10:03',1,0,'101.183.56.133'),(130,4,1,'2016-07-25 09:04:32','2016-07-25 09:14:01',5,0,'168.1.23.121'),(131,2,1,'2016-07-25 11:19:58','2016-07-25 11:23:29',4,1,'101.166.251.97'),(132,3,5,'2016-07-25 11:20:09','2016-07-25 11:23:14',2,0,'124.171.144.135'),(133,3,5,'2016-07-25 11:23:25','2016-07-25 11:25:12',5,0,'124.171.144.135'),(134,1,1,'2016-07-25 11:25:10','2016-07-25 11:25:30',4,0,'101.166.251.97'),(135,2,1,'2016-07-25 11:27:31','2016-07-25 11:27:42',4,1,'101.166.251.97'),(136,3,5,'2016-07-25 11:29:15','2016-07-25 11:40:08',13,0,'124.171.144.135'),(137,3,7,'2016-07-25 11:29:29','2016-07-25 11:29:31',2,0,'27.33.251.228'),(138,3,7,'2016-07-25 11:29:39','2016-07-25 11:35:10',7,0,'27.33.251.228'),(139,2,1,'2016-07-25 11:30:35','2016-07-25 11:31:31',13,1,'220.240.126.220'),(140,4,1,'2016-07-25 11:31:49','2016-07-25 11:32:11',3,0,'220.240.126.220'),(141,2,1,'2016-07-25 11:32:27','2016-07-25 11:33:39',5,1,'220.240.126.220'),(142,2,1,'2016-07-25 11:33:50','2016-07-25 11:35:18',5,1,'101.166.251.97'),(143,2,1,'2016-07-25 11:35:24','2016-07-25 11:37:32',4,0,'101.166.251.97'),(144,1,1,'2016-07-25 11:38:30','2016-07-25 11:46:10',4,0,'101.166.251.97'),(145,3,1,'2016-07-25 11:38:57','2016-07-25 11:40:22',10,0,'101.166.251.97'),(146,3,5,'2016-07-25 11:40:59','2016-07-25 11:47:40',8,0,'124.171.144.135'),(147,3,1,'2016-07-25 11:46:22','2016-07-25 11:46:25',3,0,'101.166.251.97'),(148,3,5,'2016-07-25 11:47:44','2016-07-25 11:47:55',5,0,'124.171.144.135'),(149,2,1,'2016-07-26 00:24:05','2016-07-26 00:24:05',1,1,'220.240.126.220'),(150,3,5,'2016-07-26 11:33:10','2016-07-26 11:34:40',2,0,'168.1.6.33'),(151,3,5,'2016-07-26 11:47:55','2016-07-26 11:49:31',11,0,'168.1.6.33'),(152,3,5,'2016-07-26 21:10:20','2016-07-26 21:10:20',1,0,'168.1.53.203'),(153,3,7,'2016-07-27 07:11:15','2016-07-27 07:11:15',1,0,'27.33.251.228'),(154,1,1,'2016-07-27 09:28:46','2016-07-27 09:28:46',2,0,'101.166.251.97'),(155,3,1,'2016-07-27 09:30:59','2016-07-27 09:33:38',5,0,'101.166.251.97'),(156,2,1,'2016-07-27 09:33:35','2016-07-27 09:33:42',2,1,'101.183.56.133'),(157,3,1,'2016-07-27 09:35:36','2016-07-27 09:36:00',4,0,'101.166.251.97'),(158,3,5,'2016-07-27 09:43:48','2016-07-27 09:44:05',4,0,'124.171.144.135'),(159,3,1,'2016-07-27 09:43:54','2016-07-27 09:47:14',17,0,'101.166.251.97'),(160,1,1,'2016-07-27 09:44:11','2016-07-27 09:44:21',2,0,'101.183.56.133'),(161,2,1,'2016-07-27 09:44:24','2016-07-27 09:44:34',3,1,'101.183.56.133'),(162,2,1,'2016-07-27 09:44:41','2016-07-27 09:44:46',3,1,'101.183.56.133'),(163,1,1,'2016-07-27 09:44:50','2016-07-27 09:45:17',3,0,'101.183.56.133'),(164,1,1,'2016-07-27 09:46:10','2016-07-27 09:46:28',3,0,'101.183.56.133'),(165,4,1,'2016-07-27 09:46:13','2016-07-27 09:46:28',2,0,'27.33.251.228'),(166,1,1,'2016-07-27 09:47:22','2016-07-27 09:47:41',8,0,'101.183.56.133'),(167,2,1,'2016-07-27 09:47:25','2016-07-27 09:47:38',4,0,'101.166.251.97'),(168,1,1,'2016-07-27 09:47:44','2016-07-27 09:48:10',6,0,'101.166.251.97'),(169,2,5,'2016-07-27 09:48:11','2016-07-27 09:49:29',5,0,'124.171.144.135'),(170,1,1,'2016-07-27 09:48:12','2016-07-27 09:48:32',7,0,'27.33.251.228'),(171,1,1,'2016-07-27 09:48:34','2016-07-27 09:49:26',11,0,'101.183.56.133'),(172,4,1,'2016-07-27 09:48:50','2016-07-27 09:49:19',6,0,'101.166.251.97'),(173,4,1,'2016-07-27 09:49:20','2016-07-27 09:49:36',6,0,'27.33.251.228'),(174,1,1,'2016-07-27 09:49:29','2016-07-27 09:49:29',1,0,'27.33.251.228'),(175,1,1,'2016-07-27 09:49:30','2016-07-27 09:49:57',9,0,'101.183.56.133'),(176,3,5,'2016-07-27 09:49:33','2016-07-27 09:49:45',3,0,'124.171.144.135'),(177,4,1,'2016-07-27 09:49:47','2016-07-27 09:49:54',3,0,'101.166.251.97'),(178,2,5,'2016-07-27 09:49:48','2016-07-27 09:50:10',3,1,'124.171.144.135'),(179,4,1,'2016-07-27 09:49:54','2016-07-27 09:49:58',3,0,'101.166.251.97'),(180,1,1,'2016-07-27 09:50:02','2016-07-27 10:11:46',21,0,'101.166.251.97'),(181,1,5,'2016-07-27 09:50:16','2016-07-27 09:53:16',13,0,'124.171.144.135'),(182,1,1,'2016-07-27 10:14:53','2016-07-27 10:14:53',1,0,'101.183.56.133'),(183,2,1,'2016-07-27 10:14:59','2016-07-27 10:15:05',2,1,'27.33.251.228'),(184,1,1,'2016-07-27 10:15:11','2016-07-27 10:17:04',4,0,'27.33.251.228'),(185,2,1,'2016-07-27 10:15:17','2016-07-27 10:15:25',2,1,'220.240.126.220'),(186,1,1,'2016-07-27 10:18:38','2016-07-27 10:18:51',6,0,'101.183.56.133'),(187,1,1,'2016-07-27 10:31:27','2016-07-27 11:03:26',43,0,'220.240.126.220'),(188,1,1,'2016-07-27 11:03:43','2016-07-27 11:03:53',5,0,'101.183.56.133'),(189,3,5,'2016-07-27 11:56:39','2016-07-27 12:24:57',15,0,'124.171.144.135'),(190,1,1,'2016-07-31 00:38:27','2016-07-31 00:38:27',1,0,'101.183.56.133'),(191,1,1,'2016-07-31 00:38:32','2016-07-31 00:38:43',4,0,'101.183.56.133'),(192,1,1,'2016-07-31 00:50:49','2016-07-31 01:01:07',21,0,'101.183.56.133'),(193,1,1,'2016-07-31 01:01:15','2016-07-31 01:01:45',7,0,'101.183.56.133'),(194,1,1,'2016-07-31 01:01:49','2016-07-31 01:36:54',89,0,'101.183.56.133'),(195,3,5,'2016-07-31 11:30:58','2016-07-31 11:34:55',4,0,'124.171.144.135'),(196,3,5,'2016-07-31 19:57:33','2016-07-31 20:01:23',2,0,'124.171.144.135'),(197,2,1,'2016-08-01 06:39:06','2016-08-01 06:39:21',2,1,'220.240.126.220'),(198,4,1,'2016-08-01 06:44:55','2016-08-01 06:45:03',2,0,'220.240.126.220'),(199,1,1,'2016-08-01 06:45:59','2016-08-01 06:47:33',2,0,'220.240.126.220'),(200,4,1,'2016-08-01 09:20:54','2016-08-01 09:23:58',31,0,'101.166.251.97'),(201,3,1,'2016-08-01 09:24:05','2016-08-01 09:24:28',7,0,'101.166.251.97'),(202,1,1,'2016-08-01 09:24:32','2016-08-01 09:43:00',20,0,'101.166.251.97'),(203,5,1,'2016-08-01 09:36:16','2016-08-01 09:43:50',36,0,'27.33.251.228'),(204,4,1,'2016-08-01 11:08:11','2016-08-01 11:16:40',6,0,'101.166.251.97'),(205,5,1,'2016-08-01 11:19:09','2016-08-01 11:19:44',7,0,'27.33.251.228'),(206,1,1,'2016-08-01 11:20:09','2016-08-01 11:20:28',3,0,'101.166.251.97'),(207,5,1,'2016-08-01 11:22:29','2016-08-01 11:22:55',5,0,'27.33.251.228'),(208,1,1,'2016-08-01 11:22:35','2016-08-01 11:23:16',5,0,'101.166.251.97'),(209,5,1,'2016-08-01 11:25:16','2016-08-01 11:29:25',5,0,'101.183.56.133'),(210,2,1,'2016-08-01 11:30:04','2016-08-01 11:31:30',4,1,'101.166.251.97'),(211,3,1,'2016-08-01 11:31:46','2016-08-01 11:35:42',4,0,'101.166.251.97'),(212,5,1,'2016-08-01 11:35:51','2016-08-01 11:36:18',3,0,'101.183.56.133'),(213,5,1,'2016-08-01 11:36:43','2016-08-01 11:36:58',4,0,'101.183.56.133'),(214,5,1,'2016-08-01 11:37:27','2016-08-01 11:37:27',1,0,'101.183.56.133'),(215,3,5,'2016-08-01 21:14:54','2016-08-01 21:18:50',4,0,'124.171.144.135'),(216,5,1,'2016-08-02 00:19:06','2016-08-02 00:22:50',6,0,'220.240.126.220'),(217,5,1,'2016-08-02 00:22:56','2016-08-02 00:24:02',11,0,'220.240.126.220'),(218,3,5,'2016-08-02 11:56:30','2016-08-02 11:56:30',1,0,'124.171.144.135'),(219,3,5,'2016-08-02 11:56:41','2016-08-02 11:56:47',2,0,'124.171.144.135'),(220,3,5,'2016-08-02 12:27:53','2016-08-02 12:58:45',5,0,'124.171.144.135'),(221,5,1,'2016-08-02 20:51:31','2016-08-02 20:52:26',5,0,'220.240.126.220'),(222,2,1,'2016-08-02 20:52:56','2016-08-02 20:53:10',2,1,'220.240.126.220'),(223,5,1,'2016-08-02 20:53:57','2016-08-02 20:54:19',5,0,'220.240.126.220'),(224,3,5,'2016-08-02 21:16:47','2016-08-02 21:17:07',5,0,'124.171.70.69'),(225,2,5,'2016-08-03 05:03:22','2016-08-03 05:10:38',15,0,'103.248.97.2'),(226,2,5,'2016-08-03 05:10:38','2016-08-03 05:10:39',2,0,'103.248.97.2'),(227,2,5,'2016-08-03 05:11:33','2016-08-03 05:13:16',19,0,'103.248.97.2'),(228,3,5,'2016-08-03 08:39:31','2016-08-03 08:39:31',1,0,'124.171.70.69'),(229,5,1,'2016-08-03 09:25:47','2016-08-03 09:26:25',2,0,'27.33.251.228'),(230,5,1,'2016-08-03 09:56:14','2016-08-03 09:59:52',2,0,'101.166.251.97'),(231,5,1,'2016-08-03 10:00:04','2016-08-03 10:07:03',28,0,'101.183.56.133'),(232,5,1,'2016-08-03 10:08:38','2016-08-03 10:08:38',1,0,'27.33.251.228'),(233,5,1,'2016-08-03 10:08:40','2016-08-03 10:23:54',18,0,'101.183.56.133'),(234,5,1,'2016-08-03 10:24:45','2016-08-03 10:31:03',16,0,'101.166.251.97'),(235,5,1,'2016-08-03 10:31:52','2016-08-03 10:32:47',5,0,'101.183.56.133'),(236,5,1,'2016-08-03 10:33:05','2016-08-03 10:37:07',3,0,'27.33.251.228'),(237,2,1,'2016-08-03 10:36:10','2016-08-03 10:37:28',22,1,'101.183.56.133'),(238,5,1,'2016-08-03 10:37:14','2016-08-03 10:37:14',1,0,'101.166.251.97'),(239,5,1,'2016-08-03 10:37:15','2016-08-03 10:37:17',2,0,'27.33.251.228'),(240,5,1,'2016-08-03 10:37:21','2016-08-03 11:07:47',7,0,'27.33.251.228'),(241,2,1,'2016-08-03 11:09:13','2016-08-03 12:06:10',14,1,'101.166.251.97'),(242,1,1,'2016-08-03 11:11:08','2016-08-03 11:11:15',2,0,'101.166.251.97'),(243,5,1,'2016-08-03 11:11:17','2016-08-03 11:12:32',9,0,'101.166.251.97'),(244,5,1,'2016-08-03 12:05:32','2016-08-03 12:06:02',3,0,'101.166.251.97'),(245,5,1,'2016-08-03 12:06:13','2016-08-03 12:06:22',6,0,'101.183.56.133'),(246,5,1,'2016-08-03 12:06:24','2016-08-03 12:08:14',21,0,'101.166.251.97'),(247,2,5,'2016-08-04 00:25:04','2016-08-04 00:25:04',1,0,'103.248.97.2'),(248,2,5,'2016-08-04 00:25:55','2016-08-04 00:28:05',11,1,'103.248.97.2'),(249,5,1,'2016-08-04 03:58:58','2016-08-04 04:01:44',31,0,'220.240.126.220'),(250,5,1,'2016-08-04 04:02:11','2016-08-04 04:09:48',30,0,'220.240.126.220'),(251,5,1,'2016-08-04 04:11:18','2016-08-04 04:15:48',2,0,'220.240.126.220'),(252,1,1,'2016-08-04 04:18:28','2016-08-04 04:18:35',2,0,'220.240.126.220'),(253,2,5,'2016-08-04 05:13:13','2016-08-04 05:13:13',1,1,'103.248.97.2'),(254,3,5,'2016-08-04 05:13:25','2016-08-04 05:14:58',16,0,'103.248.97.2'),(255,1,1,'2016-08-04 05:52:19','2016-08-04 05:52:19',1,0,'220.240.126.220'),(256,5,1,'2016-08-04 06:14:48','2016-08-04 06:18:50',5,0,'220.240.126.220'),(257,5,1,'2016-08-04 06:23:18','2016-08-04 06:27:29',20,0,'220.240.126.220'),(258,5,1,'2016-08-04 06:27:59','2016-08-04 06:28:20',4,0,'220.240.126.220'),(259,3,5,'2016-08-04 06:37:09','2016-08-04 06:39:49',9,0,'103.248.97.2'),(260,3,5,'2016-08-04 06:42:56','2016-08-04 06:43:35',11,0,'103.248.97.2'),(261,3,5,'2016-08-04 08:22:20','2016-08-04 08:23:00',11,0,'124.171.70.69'),(262,3,5,'2016-08-04 11:05:36','2016-08-04 11:05:36',1,0,'124.171.70.69'),(263,3,5,'2016-08-04 11:05:52','2016-08-04 11:07:30',8,0,'124.171.70.69'),(264,5,5,'2016-08-04 21:18:19','2016-08-04 21:18:30',4,0,'124.171.70.69'),(265,5,6,'2016-08-05 02:58:52','2016-08-05 03:27:43',3,0,'220.240.126.220'),(266,5,1,'2016-08-05 03:28:56','2016-08-05 03:29:22',10,0,'220.240.126.220'),(267,5,1,'2016-08-05 04:39:54','2016-08-05 04:39:54',1,0,'220.240.126.220'),(268,5,1,'2016-08-05 04:43:16','2016-08-05 04:43:19',2,0,'220.240.126.220'),(269,6,1,'2016-08-05 04:44:56','2016-08-05 04:45:13',4,0,'220.240.126.220'),(270,5,1,'2016-08-05 04:45:22','2016-08-05 04:45:42',2,0,'220.240.126.220'),(271,6,1,'2016-08-05 04:45:45','2016-08-05 04:47:24',17,0,'220.240.126.220'),(272,6,6,'2016-08-05 04:48:36','2016-08-05 04:48:42',2,0,'220.240.126.220'),(273,6,6,'2016-08-05 04:48:58','2016-08-05 04:49:23',8,0,'220.240.126.220'),(274,5,6,'2016-08-05 04:49:25','2016-08-05 04:49:27',2,0,'220.240.126.220'),(275,6,1,'2016-08-05 05:29:05','2016-08-05 05:29:28',3,0,'220.240.126.220'),(276,6,1,'2016-08-05 05:54:05','2016-08-05 05:54:18',3,0,'220.240.126.220'),(277,6,1,'2016-08-05 05:54:51','2016-08-05 05:55:17',7,0,'220.240.126.220'),(278,6,1,'2016-08-05 10:09:06','2016-08-05 10:09:20',4,0,'101.166.251.97'),(279,5,1,'2016-08-05 10:09:22','2016-08-05 10:09:50',6,0,'101.166.251.97'),(280,2,1,'2016-08-05 10:09:54','2016-08-05 10:10:02',3,1,'101.166.251.97'),(281,4,1,'2016-08-05 10:10:06','2016-08-05 10:10:16',4,0,'101.166.251.97'),(282,5,1,'2016-08-05 10:10:21','2016-08-05 10:10:28',4,0,'101.166.251.97'),(283,5,1,'2016-08-05 12:29:18','2016-08-05 12:48:57',57,0,'101.183.56.133'),(284,5,1,'2016-08-06 06:01:04','2016-08-06 06:16:31',5,0,'101.183.56.133'),(285,5,1,'2016-08-06 06:18:06','2016-08-06 06:18:40',7,0,'101.183.56.133'),(286,5,1,'2016-08-06 06:18:44','2016-08-06 06:19:27',11,0,'101.183.56.133'),(287,5,1,'2016-08-06 06:32:27','2016-08-06 06:32:42',4,0,'101.183.56.133'),(288,5,5,'2016-08-06 12:09:19','2016-08-06 12:09:19',1,0,'124.171.149.76'),(289,3,5,'2016-08-06 12:09:28','2016-08-06 12:10:43',6,0,'124.171.149.76'),(290,6,1,'2016-08-06 23:08:34','2016-08-06 23:19:44',3,0,'27.33.251.228'),(291,5,1,'2016-08-07 00:00:07','2016-08-07 00:00:40',3,0,'220.240.126.220'),(292,5,1,'2016-08-07 00:00:40','2016-08-07 00:00:45',3,0,'220.240.126.220'),(293,2,1,'2016-08-07 00:00:59','2016-08-07 00:01:09',4,0,'220.240.126.220'),(294,1,1,'2016-08-07 00:01:16','2016-08-07 00:01:50',9,0,'220.240.126.220'),(295,6,1,'2016-08-07 00:01:54','2016-08-07 00:15:04',34,0,'220.240.126.220'),(296,1,1,'2016-08-07 00:15:12','2016-08-07 00:15:45',3,0,'220.240.126.220'),(297,6,1,'2016-08-07 00:15:54','2016-08-07 00:27:45',31,0,'220.240.126.220'),(298,5,6,'2016-08-07 00:28:21','2016-08-07 00:28:25',2,0,'220.240.126.220'),(299,6,6,'2016-08-07 00:28:50','2016-08-07 00:29:33',18,0,'220.240.126.220'),(300,3,5,'2016-08-07 00:31:21','2016-08-07 00:31:34',2,0,'124.171.149.76'),(301,6,6,'2016-08-07 00:47:48','2016-08-07 00:47:53',3,0,'220.240.126.220'),(302,6,6,'2016-08-07 00:47:56','2016-08-07 00:49:43',7,0,'220.240.126.220'),(303,6,1,'2016-08-07 00:56:15','2016-08-07 01:06:09',3,0,'220.240.126.220'),(304,6,1,'2016-08-07 01:06:09','2016-08-07 01:06:44',4,0,'220.240.126.220'),(305,6,1,'2016-08-07 01:06:44','2016-08-07 01:06:50',4,0,'220.240.126.220'),(306,6,1,'2016-08-07 01:06:50','2016-08-07 01:06:59',4,0,'220.240.126.220'),(307,6,1,'2016-08-07 01:07:25','2016-08-07 01:34:11',4,0,'220.240.126.220'),(308,2,1,'2016-08-07 01:34:15','2016-08-07 01:34:21',2,1,'27.33.251.228'),(309,4,1,'2016-08-07 01:34:26','2016-08-07 01:36:44',7,0,'27.33.251.228'),(310,6,1,'2016-08-07 01:36:48','2016-08-07 02:26:07',22,0,'27.33.251.228'),(311,6,1,'2016-08-07 02:40:49','2016-08-07 02:47:06',46,0,'27.33.251.228'),(312,6,1,'2016-08-07 02:47:11','2016-08-07 03:24:00',33,0,'27.33.251.228'),(313,5,1,'2016-08-07 03:24:57','2016-08-07 04:10:18',3,0,'27.33.251.228'),(314,6,6,'2016-08-07 04:18:39','2016-08-07 04:19:17',5,0,'220.240.126.220'),(315,6,6,'2016-08-07 04:19:38','2016-08-07 04:19:38',1,0,'220.240.126.220'),(316,3,5,'2016-08-07 07:02:30','2016-08-07 07:07:14',7,0,'124.171.149.76'),(317,2,5,'2016-08-07 07:07:20','2016-08-07 07:35:34',5,1,'124.171.149.76'),(318,2,5,'2016-08-07 08:12:44','2016-08-07 08:13:04',4,0,'124.171.149.76'),(319,2,5,'2016-08-07 08:13:08','2016-08-07 08:20:55',7,1,'124.171.149.76'),(320,2,5,'2016-08-07 08:20:59','2016-08-07 08:21:11',4,1,'124.171.149.76'),(321,2,5,'2016-08-07 10:18:09','2016-08-07 10:18:09',1,1,'124.171.149.76'),(322,2,5,'2016-08-07 10:18:24','2016-08-07 10:26:16',14,1,'124.171.149.76'),(323,2,5,'2016-08-07 10:26:19','2016-08-07 10:27:39',5,0,'124.171.149.76'),(324,2,5,'2016-08-07 10:27:42','2016-08-07 10:28:35',6,1,'124.171.149.76'),(325,2,5,'2016-08-07 10:28:43','2016-08-07 10:28:59',5,0,'124.171.149.76'),(326,2,5,'2016-08-07 10:29:02','2016-08-07 11:18:33',7,1,'124.171.149.76'),(327,2,5,'2016-08-07 11:18:38','2016-08-07 11:18:50',4,1,'124.171.149.76'),(328,2,5,'2016-08-07 11:18:55','2016-08-07 11:51:12',6,0,'124.171.149.76'),(329,2,5,'2016-08-07 11:51:17','2016-08-07 12:27:37',27,1,'124.171.149.76'),(330,2,5,'2016-08-07 21:17:37','2016-08-07 21:17:37',1,1,'124.171.149.76'),(331,3,5,'2016-08-07 21:18:05','2016-08-07 22:10:49',21,0,'124.171.149.76'),(332,2,5,'2016-08-07 22:12:19','2016-08-07 22:22:40',8,1,'103.248.97.2'),(333,3,5,'2016-08-07 22:22:47','2016-08-07 22:37:51',36,0,'103.248.97.2'),(334,3,5,'2016-08-07 22:37:54','2016-08-07 22:38:37',9,0,'103.248.97.2'),(335,2,5,'2016-08-07 22:38:40','2016-08-07 22:39:32',5,1,'103.248.97.2'),(336,3,5,'2016-08-07 22:39:35','2016-08-07 23:10:07',24,0,'103.248.97.2'),(337,2,5,'2016-08-07 23:10:14','2016-08-07 23:10:41',12,1,'103.248.97.2'),(338,2,5,'2016-08-07 23:10:57','2016-08-07 23:13:54',13,0,'103.248.97.2'),(339,2,5,'2016-08-07 23:13:57','2016-08-07 23:15:51',14,1,'103.248.97.2'),(340,3,5,'2016-08-07 23:15:56','2016-08-07 23:16:16',8,0,'103.248.97.2'),(341,2,5,'2016-08-07 23:16:45','2016-08-07 23:16:57',6,1,'103.248.97.2'),(342,3,5,'2016-08-07 23:17:00','2016-08-07 23:17:11',6,0,'103.248.97.2'),(343,2,5,'2016-08-07 23:17:15','2016-08-07 23:20:20',8,0,'103.248.97.2'),(344,2,5,'2016-08-07 23:20:25','2016-08-07 23:20:31',2,0,'103.248.97.2'),(345,5,5,'2016-08-07 23:21:17','2016-08-07 23:21:23',2,0,'103.248.97.2'),(346,4,5,'2016-08-07 23:21:23','2016-08-07 23:21:24',2,0,'103.248.97.2'),(347,6,5,'2016-08-07 23:21:24','2016-08-07 23:21:29',2,0,'103.248.97.2'),(348,5,5,'2016-08-07 23:21:29','2016-08-07 23:22:31',11,0,'103.248.97.2'),(349,4,5,'2016-08-07 23:22:31','2016-08-07 23:24:16',11,0,'103.248.97.2'),(350,6,5,'2016-08-07 23:24:16','2016-08-07 23:36:23',12,0,'103.248.97.2'),(351,6,5,'2016-08-07 23:36:49','2016-08-07 23:41:01',27,0,'103.248.97.2'),(352,3,5,'2016-08-07 23:41:03','2016-08-07 23:43:02',13,0,'103.248.97.2'),(353,4,5,'2016-08-07 23:43:11','2016-08-07 23:45:08',19,0,'103.248.97.2'),(354,5,5,'2016-08-07 23:45:18','2016-08-07 23:46:35',14,0,'103.248.97.2'),(355,6,6,'2016-08-08 03:11:31','2016-08-08 03:12:05',6,0,'220.240.126.220'),(356,5,5,'2016-08-08 03:22:39','2016-08-08 04:05:07',35,0,'103.248.97.2'),(357,5,5,'2016-08-08 05:05:34','2016-08-08 05:47:23',10,0,'103.248.97.2'),(358,7,1,'2016-08-08 05:30:34','2016-08-08 05:30:46',3,0,'27.33.251.228'),(359,6,1,'2016-08-08 05:30:55','2016-08-08 06:08:28',58,0,'27.33.251.228'),(360,3,5,'2016-08-08 05:47:28','2016-08-08 05:51:34',12,0,'103.248.97.2'),(361,2,5,'2016-08-08 05:51:36','2016-08-08 06:15:35',18,1,'103.248.97.2'),(362,5,1,'2016-08-08 06:08:32','2016-08-08 06:09:24',4,0,'27.33.251.228'),(363,3,5,'2016-08-08 06:15:39','2016-08-08 06:16:24',12,0,'103.248.97.2'),(364,6,5,'2016-08-08 06:16:38','2016-08-08 06:17:34',12,0,'103.248.97.2'),(365,5,5,'2016-08-08 06:17:45','2016-08-08 06:18:13',11,0,'103.248.97.2'),(366,6,1,'2016-08-08 10:00:43','2016-08-08 10:01:37',2,0,'27.33.251.228'),(367,5,1,'2016-08-08 10:01:44','2016-08-08 10:51:58',52,0,'27.33.251.228'),(368,3,5,'2016-08-08 10:06:25','2016-08-08 10:06:25',1,0,'124.171.149.76'),(369,2,5,'2016-08-08 10:07:30','2016-08-08 10:07:53',4,1,'124.171.149.76'),(370,2,5,'2016-08-08 10:07:56','2016-08-08 10:09:54',5,0,'124.171.149.76'),(371,2,5,'2016-08-08 10:10:02','2016-08-08 10:10:07',3,0,'124.171.149.76'),(372,2,5,'2016-08-08 11:22:03','2016-08-08 11:22:16',2,0,'124.171.149.76'),(373,3,5,'2016-08-08 11:22:21','2016-08-08 11:29:56',15,0,'124.171.149.76'),(374,3,5,'2016-08-08 11:29:59','2016-08-08 11:43:26',20,0,'124.171.149.76'),(375,4,5,'2016-08-08 11:43:38','2016-08-08 11:44:45',13,0,'124.171.149.76'),(376,4,5,'2016-08-08 11:44:57','2016-08-08 12:15:55',21,0,'124.171.149.76'),(377,3,5,'2016-08-08 12:16:02','2016-08-08 12:33:47',22,0,'124.171.149.76'),(378,2,5,'2016-08-08 12:33:50','2016-08-08 12:34:59',15,1,'124.171.149.76'),(379,2,5,'2016-08-08 12:35:02','2016-08-08 12:42:52',5,0,'124.171.149.76'),(380,6,5,'2016-08-08 12:42:56','2016-08-08 12:49:04',21,0,'124.171.149.76'),(381,5,1,'2016-08-09 09:45:12','2016-08-09 09:48:53',17,0,'101.183.79.111'),(382,6,1,'2016-08-09 10:38:13','2016-08-09 10:38:50',11,0,'101.166.251.97'),(383,5,1,'2016-08-09 10:39:01','2016-08-09 10:40:44',26,0,'101.166.251.97'),(384,4,1,'2016-08-09 10:42:00','2016-08-09 10:42:13',3,0,'101.166.251.97'),(385,4,1,'2016-08-09 10:42:13','2016-08-09 10:42:58',7,0,'101.166.251.97'),(386,5,1,'2016-08-09 10:48:04','2016-08-09 10:49:08',10,0,'101.166.251.97'),(387,6,5,'2016-08-09 10:51:32','2016-08-09 10:53:32',2,0,'124.171.149.76'),(388,5,1,'2016-08-09 10:54:50','2016-08-09 11:01:34',60,0,'101.166.251.97'),(389,4,1,'2016-08-09 11:05:22','2016-08-09 11:05:33',2,0,'101.166.251.97'),(390,5,1,'2016-08-09 11:08:19','2016-08-09 11:12:13',25,0,'101.166.251.97'),(391,5,1,'2016-08-09 11:12:17','2016-08-09 11:14:59',31,0,'101.166.251.97'),(392,6,6,'2016-08-09 22:35:16','2016-08-09 22:38:18',22,0,'220.240.126.220'),(393,6,6,'2016-08-09 22:38:18','2016-08-09 22:38:19',2,0,'220.240.126.220'),(394,5,1,'2016-08-09 22:38:37','2016-08-09 22:39:42',16,0,'220.240.126.220'),(395,5,1,'2016-08-10 04:16:43','2016-08-10 04:20:46',14,0,'101.183.79.111'),(396,6,1,'2016-08-10 05:58:32','2016-08-10 06:03:27',6,0,'220.240.126.220'),(397,6,1,'2016-08-10 06:03:27','2016-08-10 06:03:27',2,0,'220.240.126.220'),(398,6,1,'2016-08-10 06:03:27','2016-08-10 06:49:46',4,0,'220.240.126.220'),(399,6,1,'2016-08-10 06:50:59','2016-08-10 06:52:37',5,0,'220.240.126.220'),(400,5,1,'2016-08-10 06:52:20','2016-08-10 06:52:49',6,0,'27.33.251.228'),(401,6,1,'2016-08-10 06:52:53','2016-08-10 06:55:26',14,0,'27.33.251.228'),(402,6,1,'2016-08-10 06:55:37','2016-08-10 06:55:43',2,0,'27.33.251.228'),(403,6,1,'2016-08-10 07:05:51','2016-08-10 07:05:56',2,0,'27.33.251.228'),(404,6,1,'2016-08-10 07:05:56','2016-08-10 07:38:13',16,0,'220.240.126.220'),(405,5,1,'2016-08-10 07:43:28','2016-08-10 08:27:43',2,0,'27.33.251.228'),(406,6,1,'2016-08-10 08:43:24','2016-08-10 09:08:25',11,0,'27.33.251.228'),(407,4,1,'2016-08-10 09:08:34','2016-08-10 09:25:25',7,0,'27.33.251.228'),(408,3,5,'2016-08-10 09:40:59','2016-08-10 09:56:08',29,0,'124.171.149.76'),(409,5,1,'2016-08-10 09:46:11','2016-08-10 09:46:24',3,0,'101.166.251.97'),(410,5,1,'2016-08-10 09:46:27','2016-08-10 09:46:39',4,0,'101.166.251.97'),(411,6,1,'2016-08-10 09:56:55','2016-08-10 09:59:56',17,0,'101.166.251.97'),(412,6,1,'2016-08-10 10:00:01','2016-08-10 10:15:24',14,0,'101.166.251.97'),(413,5,1,'2016-08-10 10:16:41','2016-08-10 10:17:04',8,0,'101.166.251.97'),(414,5,1,'2016-08-10 10:29:40','2016-08-10 10:29:40',1,0,'101.166.251.97'),(415,6,1,'2016-08-12 00:42:22','2016-08-12 00:43:19',12,0,'220.240.126.220'),(416,6,1,'2016-08-12 06:01:51','2016-08-12 06:04:31',18,0,'220.240.126.220'),(417,6,1,'2016-08-14 00:40:12','2016-08-14 00:40:12',1,0,'220.240.126.220'),(418,6,1,'2016-08-14 00:40:33','2016-08-14 01:09:41',19,0,'220.240.126.220'),(419,6,1,'2016-08-14 01:40:47','2016-08-14 01:43:23',3,0,'220.240.126.220'),(420,5,1,'2016-08-15 10:37:36','2016-08-15 10:46:16',20,0,'101.183.79.111');
/*!40000 ALTER TABLE `track_e_course_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_default`
--

DROP TABLE IF EXISTS `track_e_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_default` (
  `default_id` int(11) NOT NULL AUTO_INCREMENT,
  `default_user_id` int(11) NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `default_date` datetime NOT NULL,
  `default_event_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_value_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`default_id`),
  KEY `course` (`c_id`),
  KEY `session` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_default`
--

LOCK TABLES `track_e_default` WRITE;
/*!40000 ALTER TABLE `track_e_default` DISABLE KEYS */;
INSERT INTO `track_e_default` VALUES (1,0,0,'2016-07-12 12:07:17','user_created','user_id','1',0),(2,0,0,'2016-07-12 12:07:17','user_created','user_id','2',0),(3,1,1,'2016-07-12 12:07:51','course_created','course_code','TESTCOURSE',0),(4,1,0,'2016-07-12 12:19:01','user_deleted','user_id','2',0),(5,1,0,'2016-07-12 12:19:01','user_deleted','user_object','a:19:{s:9:\\\"firstname\\\";s:3:\\\"Joe\\\";s:8:\\\"lastname\\\";s:9:\\\"Anonymous\\\";s:5:\\\"phone\\\";s:0:\\\"\\\";s:13:\\\"official_code\\\";s:9:\\\"anonymous\\\";s:6:\\\"status\\\";s:1:\\\"6\\\";s:6:\\\"active\\\";s:1:\\\"1\\\";s:11:\\\"auth_source\\\";s:8:\\\"platform\\\";s:8:\\\"username\\\";s:4:\\\"anon\\\";s:5:\\\"theme\\\";N;s:8:\\\"language\\\";s:7:\\\"english\\\";s:10:\\\"creator_id\\\";s:1:\\\"0\\\";s:17:\\\"registration_date\\\";s:19:\\\"2016-07-12 12:07:17\\\";s:10:\\\"hr_dept_id\\\";s:1:\\\"0\\\";s:15:\\\"expiration_date\\\";N;s:5:\\\"email\\\";s:19:\\\"anonymous@localhost\\\";s:2:\\\"id\\\";i:2;s:7:\\\"user_id\\\";i:2;s:15:\\\"avatar_no_query\\\";s:74:\\\"https://bits-bsharp-melbnetworks.c9users.io/main/img/icons/128/unknown.png\\\";s:11:\\\"profile_url\\\";s:71:\\\"https://bits-bsharp-melbnetworks.c9users.io/main/social/profile.php?u=2\\\";}',0),(6,1,0,'2016-07-13 00:56:12','settings_changed','settings_category','Plugins',0),(7,1,2,'2016-07-14 01:28:50','course_created','course_code','TEST2',0),(8,1,0,'2016-07-18 11:37:06','settings_changed','settings_category','Regions',0),(9,1,0,'2016-07-18 20:50:23','user_created','user_id','3',0),(10,1,0,'2016-07-18 20:50:55','user_subscribed','course_code','TEST2',0),(11,1,0,'2016-07-18 20:50:55','user_subscribed','user_object','a:19:{s:9:\\\"firstname\\\";s:5:\\\"Ralph\\\";s:8:\\\"lastname\\\";s:6:\\\"Wiggum\\\";s:5:\\\"phone\\\";s:10:\\\"4036140864\\\";s:13:\\\"official_code\\\";s:0:\\\"\\\";s:6:\\\"status\\\";s:1:\\\"5\\\";s:6:\\\"active\\\";s:1:\\\"1\\\";s:11:\\\"auth_source\\\";s:8:\\\"platform\\\";s:8:\\\"username\\\";s:5:\\\"ralph\\\";s:5:\\\"theme\\\";N;s:8:\\\"language\\\";s:7:\\\"english\\\";s:10:\\\"creator_id\\\";s:1:\\\"1\\\";s:17:\\\"registration_date\\\";s:19:\\\"2016-07-18 20:50:22\\\";s:10:\\\"hr_dept_id\\\";s:1:\\\"0\\\";s:15:\\\"expiration_date\\\";N;s:5:\\\"email\\\";s:33:\\\"s9977839+test@student.rmit.edu.au\\\";s:2:\\\"id\\\";i:3;s:7:\\\"user_id\\\";i:3;s:15:\\\"avatar_no_query\\\";s:92:\\\"https://bits-bsharp-melbnetworks.c9users.io/app/upload/users/3/3/3_578d410f41d1b_images.jpeg\\\";s:11:\\\"profile_url\\\";s:71:\\\"https://bits-bsharp-melbnetworks.c9users.io/main/social/profile.php?u=3\\\";}',0),(12,1,0,'2016-07-18 20:55:15','session_created','session_id','1',0),(13,1,2,'2016-07-18 20:55:22','session_add_course','course_id','2',1),(14,1,0,'2016-07-19 00:53:33','homepage_changed','edit_top','Announcement Test',0),(15,1,0,'2016-07-19 00:54:16','settings_changed','settings_category','search_setting',0),(16,1,0,'2016-07-19 00:54:16','settings_changed','settings_variable','show_hot_courses',0),(17,1,0,'2016-07-19 00:56:46','homepage_changed','edit_top','Census Date Approaching soon for Semester 2! \\r\\n\\r\\nPublished on June 12, 2016.\\r\\n\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ...',0),(18,1,0,'2016-07-19 09:20:29','user_created','user_id','4',0),(19,1,0,'2016-07-21 07:53:21','settings_changed','settings_category','Plugins',0),(20,1,0,'2016-07-21 07:53:40','settings_changed','settings_category','Plugins',0),(21,1,0,'2016-07-21 21:07:35','settings_changed','settings_category','Plugins',0),(22,1,0,'2016-07-21 21:07:44','settings_changed','settings_category','Plugins',0),(23,1,0,'2016-07-21 22:19:57','user_created','user_id','5',0),(24,5,0,'2016-07-21 22:24:46','settings_changed','settings_category','Plugins',0),(25,5,0,'2016-07-21 22:25:48','settings_changed','settings_category','Plugins',0),(26,5,3,'2016-07-22 02:02:39','course_created','course_code','MOCKUPSAREFUN',0),(27,5,3,'2016-07-22 02:05:58','user_subscribed','course_code','MOCKUPSAREFUN',0),(28,5,3,'2016-07-22 02:05:58','user_subscribed','user_object','a:19:{s:9:\\\"firstname\\\";s:5:\\\"Mayor\\\";s:8:\\\"lastname\\\";s:6:\\\"Quimby\\\";s:5:\\\"phone\\\";s:0:\\\"\\\";s:13:\\\"official_code\\\";s:0:\\\"\\\";s:6:\\\"status\\\";s:1:\\\"3\\\";s:6:\\\"active\\\";s:1:\\\"1\\\";s:11:\\\"auth_source\\\";s:8:\\\"platform\\\";s:8:\\\"username\\\";s:6:\\\"quimby\\\";s:5:\\\"theme\\\";N;s:8:\\\"language\\\";s:7:\\\"english\\\";s:10:\\\"creator_id\\\";s:1:\\\"1\\\";s:17:\\\"registration_date\\\";s:19:\\\"2016-07-19 09:20:28\\\";s:10:\\\"hr_dept_id\\\";N;s:15:\\\"expiration_date\\\";s:19:\\\"2026-07-27 09:20:00\\\";s:5:\\\"email\\\";s:17:\\\"mquimby@email.com\\\";s:2:\\\"id\\\";i:4;s:7:\\\"user_id\\\";i:4;s:15:\\\"avatar_no_query\\\";s:74:\\\"https://bits-bsharp-melbnetworks.c9users.io/main/img/icons/128/unknown.png\\\";s:11:\\\"profile_url\\\";s:71:\\\"https://bits-bsharp-melbnetworks.c9users.io/main/social/profile.php?u=4\\\";}',0),(29,5,3,'2016-07-22 02:05:58','user_subscribed','course_code','MOCKUPSAREFUN',0),(30,5,3,'2016-07-22 02:05:58','user_subscribed','user_object','a:19:{s:9:\\\"firstname\\\";s:5:\\\"Ralph\\\";s:8:\\\"lastname\\\";s:6:\\\"Wiggum\\\";s:5:\\\"phone\\\";s:10:\\\"4036140864\\\";s:13:\\\"official_code\\\";s:0:\\\"\\\";s:6:\\\"status\\\";s:1:\\\"5\\\";s:6:\\\"active\\\";s:1:\\\"1\\\";s:11:\\\"auth_source\\\";s:8:\\\"platform\\\";s:8:\\\"username\\\";s:5:\\\"ralph\\\";s:5:\\\"theme\\\";N;s:8:\\\"language\\\";s:7:\\\"english\\\";s:10:\\\"creator_id\\\";s:1:\\\"1\\\";s:17:\\\"registration_date\\\";s:19:\\\"2016-07-18 20:50:22\\\";s:10:\\\"hr_dept_id\\\";s:1:\\\"0\\\";s:15:\\\"expiration_date\\\";N;s:5:\\\"email\\\";s:33:\\\"s9977839+test@student.rmit.edu.au\\\";s:2:\\\"id\\\";i:3;s:7:\\\"user_id\\\";i:3;s:15:\\\"avatar_no_query\\\";s:92:\\\"https://bits-bsharp-melbnetworks.c9users.io/app/upload/users/3/3/3_578d410f41d1b_images.jpeg\\\";s:11:\\\"profile_url\\\";s:71:\\\"https://bits-bsharp-melbnetworks.c9users.io/main/social/profile.php?u=3\\\";}',0),(31,5,0,'2016-07-22 05:08:06','homepage_changed','edit_top','Welcome to Chalkboard created by the BSharps group!',0),(32,5,0,'2016-07-22 05:13:51','settings_changed','settings_category','Platform',0),(33,5,0,'2016-07-22 05:13:51','settings_changed','settings_variable','InstitutionUrl',0),(34,5,0,'2016-07-22 05:13:51','settings_changed','settings_variable','emailAdministrator',0),(35,5,0,'2016-07-22 05:13:51','settings_changed','settings_variable','show_back_link_on_top_of_tree',0),(36,5,0,'2016-07-22 05:13:51','settings_changed','settings_variable','show_tabs',0),(37,5,0,'2016-07-22 05:13:51','settings_changed','settings_variable','activate_email_template',0),(38,5,0,'2016-07-22 05:13:51','settings_changed','settings_variable','gamification_mode',0),(39,5,0,'2016-07-22 05:14:15','settings_changed','settings_category','Timezones',0),(40,5,0,'2016-07-22 05:14:15','settings_changed','settings_variable','use_users_timezone',0),(41,5,0,'2016-07-22 05:14:15','settings_changed','settings_variable','timezone_value',0),(42,1,4,'2016-07-23 09:25:57','course_created','course_code','COURSE',0),(43,1,0,'2016-07-25 11:25:57','user_created','user_id','6',0),(44,1,0,'2016-07-25 11:27:10','user_created','user_id','7',0),(45,5,0,'2016-07-26 11:42:57','settings_changed','settings_category','Editor',0),(46,5,0,'2016-07-26 11:42:57','settings_changed','settings_variable','allow_spellcheck',0),(47,5,0,'2016-07-26 11:45:13','settings_changed','settings_category','User',0),(48,5,0,'2016-07-26 11:45:13','settings_changed','settings_variable','profile',0),(49,1,0,'2016-07-27 05:05:40','homepage_changed','edit_top','Welcome to Chalkboard created by the BSharps group!',0),(50,1,0,'2016-07-27 05:06:34','homepage_changed','edit_top','Welcome to Chalkboard created by the BSharps group!',0),(51,1,0,'2016-07-27 05:06:53','homepage_changed','edit_top','Welcome to Chalkboard created by the BSharps group!',0),(52,1,0,'2016-07-27 08:49:29','settings_changed','settings_category','Stylesheets',0),(53,1,0,'2016-07-29 06:51:07','settings_changed','settings_category','Platform',0),(54,1,0,'2016-07-29 06:51:07','settings_changed','settings_variable','page_after_login',0),(55,1,0,'2016-07-31 01:35:10','settings_changed','settings_category','Platform',0),(56,1,0,'2016-07-31 01:35:10','settings_changed','settings_variable','show_tabs',0),(57,1,0,'2016-07-31 01:38:00','settings_changed','settings_category','Platform',0),(58,1,0,'2016-07-31 01:38:00','settings_changed','settings_variable','show_tabs',0),(59,1,0,'2016-08-01 00:24:34','homepage_changed','edit_top','Welcome to Chalkboard created by the BSharps group!\\r\\n\\r\\n&nbsp;\\r\\n\\r\\nCensus Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\n&nbsp;\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key ac ...',0),(60,1,0,'2016-08-01 00:35:30','homepage_changed','edit_top','Welcome to Chalkboard created by the BSharps group!\\r\\n\\r\\n&nbsp;\\r\\n\\r\\nCensus Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, suc ...',0),(61,1,0,'2016-08-01 00:43:16','homepage_changed','edit_top','Welcome to Chalkboard created by the BSharps group!\\r\\n\\r\\n&nbsp;\\r\\n\\r\\nCensus Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, suc ...',0),(62,1,0,'2016-08-01 00:43:52','homepage_changed','edit_top','Welcome to Chalkboard created by the BSharps group!\\r\\n\\r\\n&nbsp;\\r\\n\\r\\nCensus Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, suc ...',0),(63,1,0,'2016-08-01 00:53:58','homepage_changed','edit_top','Welcome to Chalkboard created by the BSharps group!\\r\\n\\r\\n&nbsp;\\r\\n\\r\\nCensus Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, suc ...',0),(64,1,0,'2016-08-01 00:54:40','homepage_changed','edit_top','Census Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, such as drop a class or cancel enrolment without financial penalty.  ...',0),(65,1,0,'2016-08-01 09:13:44','settings_changed','settings_category','Platform',0),(66,1,0,'2016-08-01 09:13:44','settings_changed','settings_variable','Institution',0),(67,1,5,'2016-08-01 09:36:15','course_created','course_code','BUILDINGITSYSTEMS',0),(68,1,0,'2016-08-01 11:32:46','homepage_changed','edit_top','Census Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, such as drop a class or cancel enrolment without financial penalty.  ...',0),(69,1,0,'2016-08-02 00:35:14','settings_changed','settings_category','Platform',0),(70,1,0,'2016-08-02 00:35:14','settings_changed','settings_variable','allow_registration',0),(71,1,0,'2016-08-02 22:13:17','homepage_changed','edit_top','Census Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, such as drop a class or cancel enrolment without financial penalty.  ...',0),(72,1,0,'2016-08-02 22:58:05','homepage_changed','edit_top','Census Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, such as drop a class or cancel enrolment without financial penalty.  ...',0),(73,1,0,'2016-08-03 03:24:07','homepage_changed','edit_top','Census Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, such as drop a class or cancel enrolment without financial penalty.  ...',0),(74,1,0,'2016-08-03 03:30:11','homepage_changed','edit_top','Census Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, such as drop a class or cancel enrolment without financial penalty.  ...',0),(75,1,0,'2016-08-03 03:30:42','homepage_changed','edit_top','Census Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, such as drop a class or cancel enrolment without financial penalty.  ...',0),(76,1,0,'2016-08-03 03:31:18','homepage_changed','edit_top','Census Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, such as drop a class or cancel enrolment without financial penalty.  ...',0),(77,1,0,'2016-08-03 03:31:55','homepage_changed','edit_top','Census Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, such as drop a class or cancel enrolment without financial penalty.  ...',0),(78,1,0,'2016-08-03 03:32:38','homepage_changed','edit_top','Census Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, such as drop a class or cancel enrolment without financial penalty.  ...',0),(79,1,0,'2016-08-03 05:04:36','homepage_changed','edit_top','Census Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, such as drop a class or cancel enrolment without financial penalty.  ...',0),(80,1,0,'2016-08-03 05:06:41','homepage_changed','edit_top','Census Date for Semester 2 is just around the corner.\\r\\n\\r\\nPublished on July 27, 2016.\\r\\n\\r\\nThe Census date for Semester 2 is 31/8/2016. &nbsp;This date is the deadline to take key actions, such as drop a class or cancel enrolment without financial penalty.  ...',0),(81,1,0,'2016-08-04 00:39:13','settings_changed','settings_category','Platform',0),(82,1,0,'2016-08-04 00:39:13','settings_changed','settings_variable','show_tabs',0),(83,1,0,'2016-08-04 00:40:14','settings_changed','settings_category','Platform',0),(84,1,0,'2016-08-04 00:40:14','settings_changed','settings_variable','show_tabs',0),(85,1,0,'2016-08-04 00:40:46','settings_changed','settings_category','Platform',0),(86,1,0,'2016-08-04 00:40:46','settings_changed','settings_variable','show_tabs',0),(87,1,0,'2016-08-04 03:33:20','settings_changed','settings_category','Regions',0),(88,1,0,'2016-08-04 03:34:04','settings_changed','settings_category','Regions',0),(89,1,0,'2016-08-04 03:35:19','settings_changed','settings_category','Regions',0),(90,5,0,'2016-08-04 06:42:30','settings_changed','settings_category','Timezones',0),(91,5,0,'2016-08-04 06:42:30','settings_changed','settings_variable','use_users_timezone',0),(92,5,0,'2016-08-04 06:42:30','settings_changed','settings_variable','timezone_value',0),(93,1,6,'2016-08-05 04:44:43','course_created','course_code','INTROPYTHON',0),(94,1,0,'2016-08-06 06:17:54','user_created','user_id','8',0),(95,1,5,'2016-08-06 06:18:36','user_subscribed','course_code','BUILDINGITSYSTEMS',0),(96,1,5,'2016-08-06 06:18:36','user_subscribed','user_object','a:19:{s:9:\\\"firstname\\\";s:3:\\\"Mel\\\";s:8:\\\"lastname\\\";s:8:\\\"Thompson\\\";s:5:\\\"phone\\\";s:0:\\\"\\\";s:13:\\\"official_code\\\";s:0:\\\"\\\";s:6:\\\"status\\\";s:1:\\\"5\\\";s:6:\\\"active\\\";s:1:\\\"1\\\";s:11:\\\"auth_source\\\";s:8:\\\"platform\\\";s:8:\\\"username\\\";s:8:\\\"s3338093\\\";s:5:\\\"theme\\\";N;s:8:\\\"language\\\";s:7:\\\"english\\\";s:10:\\\"creator_id\\\";s:1:\\\"1\\\";s:17:\\\"registration_date\\\";s:19:\\\"2016-08-06 06:17:54\\\";s:10:\\\"hr_dept_id\\\";s:1:\\\"0\\\";s:15:\\\"expiration_date\\\";s:19:\\\"2026-08-14 06:17:54\\\";s:5:\\\"email\\\";s:28:\\\"s3338093@student.rmit.edu.au\\\";s:2:\\\"id\\\";i:8;s:7:\\\"user_id\\\";i:8;s:15:\\\"avatar_no_query\\\";s:74:\\\"https://bits-bsharp-melbnetworks.c9users.io/main/img/icons/128/unknown.png\\\";s:11:\\\"profile_url\\\";s:71:\\\"https://bits-bsharp-melbnetworks.c9users.io/main/social/profile.php?u=8\\\";}',0),(97,6,0,'2016-08-07 00:28:41','user_unsubscribed','course_code','BUILDINGITSYSTEMS',0),(98,6,0,'2016-08-07 00:28:41','user_unsubscribed','user_object','a:19:{s:9:\\\"firstname\\\";s:5:\\\"aimee\\\";s:8:\\\"lastname\\\";s:6:\\\"wilson\\\";s:5:\\\"phone\\\";s:0:\\\"\\\";s:13:\\\"official_code\\\";s:0:\\\"\\\";s:6:\\\"status\\\";s:1:\\\"5\\\";s:6:\\\"active\\\";s:1:\\\"1\\\";s:11:\\\"auth_source\\\";s:8:\\\"platform\\\";s:8:\\\"username\\\";s:5:\\\"aimee\\\";s:5:\\\"theme\\\";N;s:8:\\\"language\\\";s:7:\\\"english\\\";s:10:\\\"creator_id\\\";s:1:\\\"1\\\";s:17:\\\"registration_date\\\";s:19:\\\"2016-07-25 11:25:57\\\";s:10:\\\"hr_dept_id\\\";s:1:\\\"0\\\";s:15:\\\"expiration_date\\\";s:19:\\\"2026-08-02 11:25:57\\\";s:5:\\\"email\\\";s:28:\\\"s3456209@student.rmit.edu.au\\\";s:2:\\\"id\\\";i:6;s:7:\\\"user_id\\\";i:6;s:15:\\\"avatar_no_query\\\";s:74:\\\"https://bits-bsharp-melbnetworks.c9users.io/main/img/icons/128/unknown.png\\\";s:11:\\\"profile_url\\\";s:71:\\\"https://bits-bsharp-melbnetworks.c9users.io/main/social/profile.php?u=6\\\";}',0),(99,1,7,'2016-08-08 05:30:33','course_created','course_code','TEST',0);
/*!40000 ALTER TABLE `track_e_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_downloads`
--

DROP TABLE IF EXISTS `track_e_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_downloads` (
  `down_id` int(11) NOT NULL AUTO_INCREMENT,
  `down_user_id` int(11) DEFAULT NULL,
  `down_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `down_doc_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `down_session_id` int(11) NOT NULL,
  PRIMARY KEY (`down_id`),
  KEY `idx_ted_user_id` (`down_user_id`),
  KEY `idx_ted_c_id` (`c_id`),
  KEY `down_session_id` (`down_session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_downloads`
--

LOCK TABLES `track_e_downloads` WRITE;
/*!40000 ALTER TABLE `track_e_downloads` DISABLE KEYS */;
INSERT INTO `track_e_downloads` VALUES (1,4,'2016-07-23 01:04:43',1,'/recorded-chats/week-1-chat.pdf.pdf',0),(2,1,'2016-07-23 01:15:08',1,'https://bits-bsharp-melbnetworks.c9users.io/main/document/showinframes.php?cidReq=TESTCOURSE&id=15',0),(3,1,'2016-07-23 01:20:10',1,'/recorded-chats/week-1-chat.pdf.pdf',0),(4,1,'2016-07-23 01:22:01',1,'/weekly-resourses/week-1-topic.pdf.pdf',0),(5,4,'2016-07-23 03:53:38',1,'/weekly-resourses/week-1-topic.pdf.pdf',0),(6,4,'2016-07-23 03:53:53',1,'/weekly-resourses/week-1-topic.pdf.pdf',0),(7,4,'2016-07-23 04:11:42',1,'/rubrics/rubrics.pdf.pdf',0),(8,4,'2016-07-23 04:11:57',1,'/rubrics/rubrics.pdf.pdf',0),(9,1,'2016-07-23 04:18:13',1,'/chat_files/messages-2016-07-20.log.html',0),(10,1,'2016-07-23 06:05:07',1,'https://bits-bsharp-melbnetworks.c9users.io/main/document/showinframes.php?cidReq=TESTCOURSE&id=17',0),(11,1,'2016-07-23 09:35:52',1,'https://bits-bsharp-melbnetworks.c9users.io/main/document/showinframes.php?cidReq=TESTCOURSE&id=17',0),(12,1,'2016-08-01 09:23:43',4,'https://bits-bsharp-melbnetworks.c9users.io/main/document/showinframes.php?cidReq=COURSE&id=35',0),(13,1,'2016-08-09 22:39:04',5,'https://bits-bsharp-melbnetworks.c9users.io/main/document/showinframes.php?cidReq=BUILDINGITSYSTEMS&id=52',0);
/*!40000 ALTER TABLE `track_e_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_exercises`
--

DROP TABLE IF EXISTS `track_e_exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_exercises` (
  `exe_id` int(11) NOT NULL AUTO_INCREMENT,
  `exe_user_id` int(11) DEFAULT NULL,
  `exe_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `exe_exo_id` int(11) NOT NULL,
  `exe_result` double NOT NULL,
  `exe_weighting` double NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `data_tracking` longtext COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `steps_counter` smallint(6) NOT NULL,
  `session_id` smallint(6) NOT NULL,
  `orig_lp_id` int(11) NOT NULL,
  `orig_lp_item_id` int(11) NOT NULL,
  `exe_duration` int(11) NOT NULL,
  `expired_time_control` datetime NOT NULL,
  `orig_lp_item_view_id` int(11) NOT NULL,
  `questions_to_check` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`exe_id`),
  KEY `idx_tee_user_id` (`exe_user_id`),
  KEY `idx_tee_c_id` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_exercises`
--

LOCK TABLES `track_e_exercises` WRITE;
/*!40000 ALTER TABLE `track_e_exercises` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_hotpotatoes`
--

DROP TABLE IF EXISTS `track_e_hotpotatoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_hotpotatoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exe_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exe_user_id` int(11) DEFAULT NULL,
  `exe_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `exe_result` smallint(6) NOT NULL,
  `exe_weighting` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tehp_user_id` (`exe_user_id`),
  KEY `idx_tehp_c_id` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_hotpotatoes`
--

LOCK TABLES `track_e_hotpotatoes` WRITE;
/*!40000 ALTER TABLE `track_e_hotpotatoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_hotpotatoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_hotspot`
--

DROP TABLE IF EXISTS `track_e_hotspot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_hotspot` (
  `hotspot_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotspot_user_id` int(11) NOT NULL,
  `hotspot_course_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `hotspot_exe_id` int(11) NOT NULL,
  `hotspot_question_id` int(11) NOT NULL,
  `hotspot_answer_id` int(11) NOT NULL,
  `hotspot_correct` tinyint(1) NOT NULL,
  `hotspot_coordinate` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hotspot_id`),
  KEY `hotspot_course_code` (`hotspot_course_code`),
  KEY `hotspot_user_id` (`hotspot_user_id`),
  KEY `hotspot_exe_id` (`hotspot_exe_id`),
  KEY `hotspot_question_id` (`hotspot_question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_hotspot`
--

LOCK TABLES `track_e_hotspot` WRITE;
/*!40000 ALTER TABLE `track_e_hotspot` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_hotspot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_item_property`
--

DROP TABLE IF EXISTS `track_e_item_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_item_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `item_property_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `progress` int(11) NOT NULL,
  `lastedit_date` datetime NOT NULL,
  `lastedit_user_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`,`item_property_id`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_item_property`
--

LOCK TABLES `track_e_item_property` WRITE;
/*!40000 ALTER TABLE `track_e_item_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_item_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_lastaccess`
--

DROP TABLE IF EXISTS `track_e_lastaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_lastaccess` (
  `access_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_user_id` int(11) DEFAULT NULL,
  `access_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `access_tool` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`access_id`),
  KEY `access_user_id` (`access_user_id`),
  KEY `access_c_id` (`c_id`),
  KEY `access_session_id` (`access_session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_lastaccess`
--

LOCK TABLES `track_e_lastaccess` WRITE;
/*!40000 ALTER TABLE `track_e_lastaccess` DISABLE KEYS */;
INSERT INTO `track_e_lastaccess` VALUES (1,1,'2016-08-07 00:15:12',1,NULL,0),(2,1,'2016-07-16 04:49:55',1,'course_progress',0),(3,1,'2016-08-07 00:15:15',1,'forum',0),(4,1,'2016-08-07 00:01:08',2,NULL,0),(5,1,'2016-07-16 04:43:41',1,'course_description',0),(6,1,'2016-08-01 09:29:40',1,'document',0),(7,1,'2016-07-18 10:30:10',1,'learnpath',0),(8,1,'2016-07-16 04:51:35',2,'course_progress',0),(9,1,'2016-07-16 04:51:40',2,'quiz',0),(10,1,'2016-07-16 04:51:49',2,'link',0),(11,1,'2016-07-18 20:51:30',2,'user',0),(12,1,'2016-08-07 01:34:15',2,NULL,1),(13,1,'2016-08-05 10:09:56',2,'document',1),(14,4,'2016-07-23 04:15:13',1,NULL,0),(15,4,'2016-07-23 04:15:08',1,'document',0),(16,1,'2016-07-19 09:44:34',2,'calendar_event',0),(17,1,'2016-07-21 07:59:49',1,'chat',0),(18,5,'2016-08-08 12:35:02',2,NULL,0),(19,5,'2016-07-21 22:27:39',2,'link',0),(20,5,'2016-08-08 12:34:50',2,NULL,1),(21,5,'2016-07-27 09:50:16',1,NULL,0),(22,3,'2016-07-22 01:58:28',2,NULL,0),(23,3,'2016-07-22 02:01:55',2,'forum',0),(24,5,'2016-07-22 02:04:33',3,'course_description',0),(25,5,'2016-08-10 09:45:15',3,NULL,0),(26,5,'2016-07-22 02:06:02',3,'user',0),(27,5,'2016-07-27 09:49:38',3,'forum',0),(28,1,'2016-07-22 03:34:59',2,'course_description',1),(29,3,'2016-07-22 04:57:04',3,NULL,0),(30,1,'2016-08-01 11:31:46',3,NULL,0),(31,1,'2016-07-22 07:42:22',3,'calendar_event',0),(32,1,'2016-07-22 07:44:09',3,'student_publication',0),(33,4,'2016-07-23 01:04:15',3,NULL,0),(34,4,'2016-07-23 01:04:06',3,'document',0),(35,1,'2016-08-01 09:29:40',1,'document',0),(36,1,'2016-08-01 09:29:40',1,'document',0),(37,1,'2016-07-23 05:47:14',1,'student_publication',0),(38,1,'2016-08-01 09:29:40',1,'document',0),(39,1,'2016-08-09 10:42:18',4,NULL,0),(40,1,'2016-07-24 00:25:15',1,'attendance',0),(41,7,'2016-07-25 11:29:39',3,NULL,0),(42,1,'2016-07-25 11:30:41',2,'chat',1),(43,1,'2016-07-25 11:32:07',4,'link',0),(44,1,'2016-07-27 09:33:01',3,'document',0),(45,1,'2016-07-27 09:44:43',2,'forum',1),(46,1,'2016-08-01 09:24:23',3,'forum',0),(47,1,'2016-08-07 00:01:05',2,'forum',0),(48,1,'2016-07-27 09:48:34',1,'link',0),(49,1,'2016-08-09 10:42:36',4,'document',0),(50,5,'2016-07-27 09:49:22',2,'forum',0),(51,5,'2016-07-27 09:50:00',2,'forum',1),(52,1,'2016-08-07 00:15:15',1,'forum',0),(53,5,'2016-07-27 09:53:12',1,'forum',0),(54,1,'2016-08-01 09:23:04',4,'forum',0),(55,1,'2016-08-10 09:46:16',5,'course_description',0),(56,1,'2016-08-15 10:37:36',5,NULL,0),(57,1,'2016-08-09 22:39:22',5,'student_publication',0),(58,1,'2016-08-01 11:16:35',4,'wiki',0),(59,1,'2016-08-01 11:20:14',1,'wiki',0),(60,1,'2016-08-10 06:52:32',5,'forum',0),(61,1,'2016-08-09 22:38:43',5,'announcement',0),(62,1,'2016-08-09 22:39:17',5,'document',0),(63,5,'2016-08-07 23:11:55',2,'calendar_event',0),(64,1,'2016-08-15 10:37:25',0,'calendar_event',0),(65,1,'2016-08-03 10:37:26',2,'calendar_event',1),(66,1,'2016-08-15 10:37:36',5,NULL,0),(67,5,'2016-08-08 12:34:25',2,'calendar_event',1),(68,5,'2016-08-10 09:44:33',3,'calendar_event',0),(69,1,'2016-08-04 06:23:24',5,'quiz',0),(70,1,'2016-08-04 06:24:35',5,'link',0),(71,1,'2016-08-04 06:24:57',5,'survey',0),(72,1,'2016-08-04 06:25:29',5,'notebook',0),(73,1,'2016-08-04 06:26:01',5,'wiki',0),(74,1,'2016-08-04 06:27:20',5,'course_progress',0),(75,5,'2016-08-08 06:17:45',5,NULL,0),(76,6,'2016-08-07 00:28:21',5,NULL,0),(77,6,'2016-08-05 02:58:59',5,'forum',0),(78,1,'2016-08-14 00:40:47',6,NULL,0),(79,6,'2016-08-09 22:38:18',6,NULL,0),(80,6,'2016-08-09 22:35:40',6,'document',0),(81,6,'2016-08-09 22:35:46',6,'announcement',0),(82,6,'2016-08-09 22:35:29',6,'course_description',0),(83,6,'2016-08-05 04:49:27',5,'course_description',0),(84,1,'2016-08-14 00:40:44',6,'document',0),(85,1,'2016-08-12 06:02:29',6,'forum',0),(86,1,'2016-08-14 00:40:40',6,'announcement',0),(87,1,'2016-08-06 06:32:32',5,'user',0),(88,1,'2016-08-15 10:43:14',5,'calendar_event',0),(89,8,'2016-08-09 10:09:21',5,NULL,0),(90,8,'2016-08-06 06:23:08',5,'student_publication',0),(91,8,'2016-08-06 06:23:15',5,'announcement',0),(92,8,'2016-08-10 04:30:33',0,'calendar_event',0),(93,6,'2016-08-09 22:36:04',6,'forum',0),(94,6,'2016-08-09 22:36:12',6,'student_publication',0),(95,1,'2016-08-07 01:34:37',4,'student_publication',0),(96,1,'2016-08-14 00:40:36',6,'course_description',0),(97,1,'2016-08-12 00:42:38',6,'student_publication',0),(98,5,'2016-08-08 12:13:19',4,NULL,0),(99,5,'2016-08-08 12:48:56',6,NULL,0),(100,5,'2016-08-08 06:18:11',5,'calendar_event',0),(101,5,'2016-08-08 12:15:29',4,'calendar_event',0),(102,5,'2016-08-08 12:46:53',6,'calendar_event',0),(103,0,'2016-08-10 04:51:59',0,'calendar_event',0),(104,1,'2016-08-14 00:40:47',6,NULL,0),(105,1,'2016-08-15 10:43:14',5,'calendar_event',0);
/*!40000 ALTER TABLE `track_e_lastaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_links`
--

DROP TABLE IF EXISTS `track_e_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_links` (
  `links_id` int(11) NOT NULL AUTO_INCREMENT,
  `links_user_id` int(11) DEFAULT NULL,
  `links_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `links_link_id` int(11) NOT NULL,
  `links_session_id` int(11) NOT NULL,
  PRIMARY KEY (`links_id`),
  KEY `idx_tel_c_id` (`c_id`),
  KEY `idx_tel_user_id` (`links_user_id`),
  KEY `links_session_id` (`links_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_links`
--

LOCK TABLES `track_e_links` WRITE;
/*!40000 ALTER TABLE `track_e_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_login`
--

DROP TABLE IF EXISTS `track_e_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_user_id` int(11) NOT NULL,
  `login_date` datetime NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `logout_date` datetime DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  KEY `login_user_id` (`login_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_login`
--

LOCK TABLES `track_e_login` WRITE;
/*!40000 ALTER TABLE `track_e_login` DISABLE KEYS */;
INSERT INTO `track_e_login` VALUES (1,1,'2016-07-12 12:07:28','124.171.130.216','2016-07-12 12:08:03'),(2,1,'2016-07-12 12:13:49','124.171.130.216','2016-07-13 10:46:07'),(3,1,'2016-07-13 10:46:11','220.240.126.220','2016-07-13 10:47:51'),(4,1,'2016-07-13 10:47:54','220.240.126.220','2016-07-16 00:16:35'),(5,1,'2016-07-16 04:03:09','101.166.251.97','2016-07-16 04:53:22'),(6,1,'2016-07-16 10:00:29','101.183.3.127','2016-07-16 10:26:41'),(7,1,'2016-07-16 10:26:42','101.166.251.97','2016-07-16 12:29:56'),(8,1,'2016-07-17 07:33:04','101.166.251.97','2016-07-17 07:34:26'),(9,1,'2016-07-17 08:58:50','101.166.251.97','2016-07-19 00:46:11'),(10,1,'2016-07-19 00:46:11','220.240.126.220','2016-07-19 00:50:35'),(11,1,'2016-07-19 00:50:36','220.240.126.220','2016-07-19 05:13:38'),(12,1,'2016-07-19 05:13:41','220.240.126.220','2016-07-19 07:41:14'),(13,1,'2016-07-19 07:41:15','101.166.251.97','2016-07-19 09:18:26'),(14,1,'2016-07-19 09:18:27','101.166.251.97','2016-07-19 11:28:25'),(15,4,'2016-07-19 09:21:53','101.166.251.97','2016-07-19 11:28:24'),(16,1,'2016-07-19 11:28:28','101.166.251.97','2016-07-21 05:01:11'),(17,1,'2016-07-21 05:02:30','220.240.126.220','2016-07-21 05:02:54'),(18,1,'2016-07-21 05:13:19','220.240.126.220','2016-07-21 21:11:52'),(19,1,'2016-07-21 22:18:41','103.248.97.2','2016-07-22 07:44:59'),(20,5,'2016-07-21 22:20:43','103.248.97.2','2016-07-21 23:50:23'),(21,5,'2016-07-21 23:51:06','103.248.97.2','2016-07-21 23:56:09'),(22,5,'2016-07-22 02:02:13','103.248.97.2','2016-07-22 02:09:42'),(23,5,'2016-07-22 04:44:48','103.248.97.2','2016-07-22 04:45:04'),(24,5,'2016-07-22 04:56:40','103.248.97.2','2016-07-22 05:00:14'),(25,5,'2016-07-22 05:01:06','103.248.97.2','2016-07-22 05:18:15'),(26,1,'2016-07-23 01:00:56','101.166.251.97','2016-07-23 01:03:48'),(27,4,'2016-07-23 01:03:58','101.166.251.97','2016-07-23 01:10:17'),(28,1,'2016-07-23 01:10:21','101.166.251.97','2016-07-23 03:48:10'),(29,4,'2016-07-23 03:48:21','101.166.251.97','2016-07-23 04:15:20'),(30,1,'2016-07-23 04:15:25','101.166.251.97','2016-07-23 06:23:22'),(31,1,'2016-07-23 06:23:26','220.240.126.220','2016-07-23 23:53:40'),(32,1,'2016-07-24 00:21:57','101.166.251.97','2016-07-24 00:30:42'),(33,1,'2016-07-24 00:38:39','101.166.251.97','2016-07-25 11:19:36'),(34,1,'2016-07-25 11:19:37','101.166.251.97','2016-07-25 11:26:12'),(35,5,'2016-07-25 11:19:51','124.171.144.135','2016-07-30 22:14:30'),(36,1,'2016-07-25 11:26:15','27.33.251.228','2016-07-25 11:28:00'),(37,6,'2016-07-25 11:26:17','220.240.126.220','2016-07-25 11:28:55'),(38,1,'2016-07-25 11:28:01','27.33.251.228','2016-07-25 11:29:08'),(39,7,'2016-07-25 11:29:07','27.33.251.228','2016-07-27 07:11:23'),(40,1,'2016-07-25 11:29:09','220.240.126.220','2016-07-25 11:43:26'),(41,1,'2016-07-25 11:46:09','101.166.251.97','2016-07-27 05:08:07'),(42,1,'2016-07-27 05:10:08','220.240.126.220','2016-07-27 05:14:21'),(43,7,'2016-07-27 08:41:26','27.33.251.228','2016-07-27 08:48:40'),(44,1,'2016-07-27 08:48:47','27.33.251.228','2016-07-27 09:00:53'),(45,1,'2016-07-27 09:01:15','27.33.251.228','2016-07-27 09:28:42'),(46,1,'2016-07-27 09:28:46','101.166.251.97','2016-07-27 09:30:49'),(47,1,'2016-07-27 09:30:49','101.183.56.133','2016-07-27 11:45:30'),(48,1,'2016-07-28 01:38:08','220.240.126.220','2016-07-28 05:51:13'),(49,1,'2016-07-28 05:53:27','220.240.126.220','2016-07-31 00:43:25'),(50,5,'2016-07-30 22:14:41','124.171.144.135','2016-08-02 21:17:07'),(51,1,'2016-07-31 00:45:41','101.183.56.133','2016-07-31 01:34:42'),(52,1,'2016-07-31 01:34:55','220.240.126.220','2016-07-31 06:53:30'),(53,1,'2016-07-31 08:49:18','116.240.181.201','2016-08-01 01:07:29'),(54,1,'2016-08-01 05:11:36','220.240.126.220','2016-08-01 05:21:40'),(55,1,'2016-08-01 06:30:56','220.240.126.220','2016-08-01 09:13:45'),(56,1,'2016-08-01 09:19:46','101.166.251.97','2016-08-01 10:45:45'),(57,1,'2016-08-01 11:04:44','101.166.251.97','2016-08-01 11:16:36'),(58,1,'2016-08-01 11:16:39','116.240.181.201','2016-08-01 11:23:24'),(59,1,'2016-08-01 11:23:56','101.183.56.133','2016-08-01 23:58:52'),(60,1,'2016-08-01 23:58:52','220.240.126.220','2016-08-02 00:26:58'),(61,1,'2016-08-02 00:26:59','220.240.126.220','2016-08-02 00:30:02'),(62,6,'2016-08-02 00:27:52','220.240.126.220','2016-08-02 00:28:52'),(63,1,'2016-08-02 00:33:03','220.240.126.220','2016-08-02 01:01:07'),(64,6,'2016-08-02 00:49:44','220.240.126.220','2016-08-02 01:00:50'),(65,1,'2016-08-02 01:01:09','220.240.126.220','2016-08-02 05:13:15'),(66,1,'2016-08-02 05:13:18','101.173.104.227','2016-08-03 02:01:07'),(67,5,'2016-08-02 22:29:42','103.248.97.2','2016-08-07 23:46:36'),(68,1,'2016-08-03 02:01:08','116.240.181.201','2016-08-03 09:54:19'),(69,1,'2016-08-03 09:54:20','101.166.251.97','2016-08-04 04:09:52'),(70,6,'2016-08-04 04:10:03','220.240.126.220','2016-08-04 04:10:56'),(71,1,'2016-08-04 04:11:10','220.240.126.220','2016-08-04 10:43:36'),(72,1,'2016-08-04 12:29:35','101.166.251.97','2016-08-05 03:28:19'),(73,6,'2016-08-05 02:54:45','220.240.126.220','2016-08-05 03:28:05'),(74,1,'2016-08-05 03:28:23','220.240.126.220','2016-08-05 05:11:31'),(75,6,'2016-08-05 04:47:47','220.240.126.220','2016-08-05 04:49:31'),(76,1,'2016-08-05 05:11:34','220.240.126.220','2016-08-05 09:06:40'),(77,1,'2016-08-05 09:06:43','101.183.56.133','2016-08-05 10:08:37'),(78,1,'2016-08-05 10:08:38','101.166.251.97','2016-08-06 06:19:55'),(79,1,'2016-08-06 06:21:38','101.183.56.133','2016-08-06 06:21:53'),(80,1,'2016-08-06 06:31:24','101.183.56.133','2016-08-06 06:31:33'),(81,1,'2016-08-06 06:32:09','101.183.56.133','2016-08-06 06:32:51'),(82,1,'2016-08-06 07:00:05','101.183.56.133','2016-08-06 07:00:13'),(83,1,'2016-08-06 07:11:59','101.183.56.133','2016-08-06 07:12:07'),(84,1,'2016-08-06 07:20:25','101.183.56.133','2016-08-06 07:20:38'),(85,1,'2016-08-06 09:29:40','220.240.126.220','2016-08-07 00:56:05'),(86,6,'2016-08-07 00:28:09','220.240.126.220','2016-08-07 00:55:32'),(87,1,'2016-08-07 00:56:06','220.240.126.220','2016-08-09 08:37:26'),(88,6,'2016-08-07 01:08:09','220.240.126.220','2016-08-07 01:34:46'),(89,6,'2016-08-07 04:18:21','220.240.126.220','2016-08-08 00:00:47'),(90,6,'2016-08-08 03:10:59','220.240.126.220','2016-08-09 22:38:19'),(91,5,'2016-08-08 03:22:33','103.248.97.2','2016-08-14 10:16:27'),(92,1,'2016-08-09 09:45:04','101.183.79.111','2016-08-09 09:49:03'),(93,1,'2016-08-09 10:37:54','101.166.251.97','2016-08-09 10:49:08'),(94,1,'2016-08-09 10:54:40','101.166.251.97','2016-08-09 21:53:07'),(95,1,'2016-08-09 22:38:29','220.240.126.220','2016-08-10 03:52:34'),(96,1,'2016-08-10 04:16:17','101.183.79.111','2016-08-10 04:29:17'),(97,1,'2016-08-10 04:52:05','101.183.79.111','2016-08-10 09:31:14'),(98,1,'2016-08-10 09:31:15','27.33.251.228','2016-08-10 09:39:41'),(99,1,'2016-08-10 09:39:42','101.166.251.97','2016-08-10 10:14:33'),(100,1,'2016-08-10 10:14:33','101.183.79.111','2016-08-12 06:01:30'),(101,1,'2016-08-12 06:01:30','220.240.126.220','2016-08-15 09:08:01'),(102,1,'2016-08-15 09:08:04','101.183.79.111','2016-08-15 10:25:01'),(103,1,'2016-08-15 10:25:04','101.183.79.111','2016-08-15 10:58:46');
/*!40000 ALTER TABLE `track_e_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_online`
--

DROP TABLE IF EXISTS `track_e_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_online` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_user_id` int(11) NOT NULL,
  `login_date` datetime NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `c_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `access_url_id` int(11) NOT NULL,
  PRIMARY KEY (`login_id`),
  KEY `course` (`c_id`),
  KEY `login_user_id` (`login_user_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_online`
--

LOCK TABLES `track_e_online` WRITE;
/*!40000 ALTER TABLE `track_e_online` DISABLE KEYS */;
INSERT INTO `track_e_online` VALUES (1,1,'2016-08-15 10:58:46','27.33.251.228',0,0,1),(2,2,'2016-07-12 12:13:21','124.171.130.216',1,0,1),(3,3,'2016-07-22 04:57:12','103.248.97.2',3,0,1),(5,5,'2016-08-14 10:16:27','124.171.149.76',0,0,1),(6,6,'2016-08-09 22:38:19','220.240.126.220',0,0,1);
/*!40000 ALTER TABLE `track_e_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_open`
--

DROP TABLE IF EXISTS `track_e_open`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_open` (
  `open_id` int(11) NOT NULL AUTO_INCREMENT,
  `open_remote_host` longtext COLLATE utf8_unicode_ci NOT NULL,
  `open_agent` longtext COLLATE utf8_unicode_ci NOT NULL,
  `open_referer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `open_date` datetime NOT NULL,
  PRIMARY KEY (`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_open`
--

LOCK TABLES `track_e_open` WRITE;
/*!40000 ALTER TABLE `track_e_open` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_open` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_uploads`
--

DROP TABLE IF EXISTS `track_e_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_uploads` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_user_id` int(11) DEFAULT NULL,
  `upload_date` datetime NOT NULL,
  `upload_cours_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `upload_work_id` int(11) NOT NULL,
  `upload_session_id` int(11) NOT NULL,
  PRIMARY KEY (`upload_id`),
  KEY `course` (`c_id`),
  KEY `upload_user_id` (`upload_user_id`),
  KEY `upload_cours_id` (`upload_cours_id`),
  KEY `upload_session_id` (`upload_session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_uploads`
--

LOCK TABLES `track_e_uploads` WRITE;
/*!40000 ALTER TABLE `track_e_uploads` DISABLE KEYS */;
INSERT INTO `track_e_uploads` VALUES (1,1,'2016-08-03 10:30:48','',5,3,0);
/*!40000 ALTER TABLE `track_e_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_stored_values`
--

DROP TABLE IF EXISTS `track_stored_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_stored_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sco_id` int(11) NOT NULL,
  `course_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sv_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `sv_value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`sco_id`,`course_id`,`sv_key`),
  KEY `user_sco_course_sv` (`user_id`,`sco_id`,`course_id`,`sv_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_stored_values`
--

LOCK TABLES `track_stored_values` WRITE;
/*!40000 ALTER TABLE `track_stored_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_stored_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_stored_values_stack`
--

DROP TABLE IF EXISTS `track_stored_values_stack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_stored_values_stack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sco_id` int(11) NOT NULL,
  `stack_order` int(11) NOT NULL,
  `course_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sv_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `sv_value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`sco_id`,`course_id`,`sv_key`,`stack_order`),
  KEY `user_sco_course_sv_stack` (`user_id`,`sco_id`,`course_id`,`sv_key`,`stack_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_stored_values_stack`
--

LOCK TABLES `track_stored_values_stack` WRITE;
/*!40000 ALTER TABLE `track_stored_values_stack` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_stored_values_stack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_source` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `official_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture_uri` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `competences` longtext COLLATE utf8_unicode_ci,
  `diplomas` longtext COLLATE utf8_unicode_ci,
  `openarea` longtext COLLATE utf8_unicode_ci,
  `teach` longtext COLLATE utf8_unicode_ci,
  `productions` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chatcall_user_id` int(11) DEFAULT NULL,
  `chatcall_date` datetime DEFAULT NULL,
  `chatcall_text` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_date` datetime NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hr_dept_id` smallint(6) DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`),
  UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  KEY `idx_user_uid` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'admin','admin','[no address given]','Flanders','Ned','0f9d25a0eaebca78d2e9740e4fa399d6606a6f1c','platform',1,'ADMIN','(000) 001 02 03','1_579888d5d9c5a_ned.png',0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'english','2016-07-12 12:07:17',NULL,1,'http://',NULL,0,'34acce36b41f4dd0e2b58e5a3ddbb98fb0c41d5e','2016-08-15 10:58:46',NULL,NULL),(3,3,'ralph','ralph','s9977839+test@student.rmit.edu.au','Wiggum','Ralph','fc4eddbb93633337b36e615a63fbb827df66159a','platform',5,'','4036140864','3_578d410f41d1b_images.jpeg',1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'english','2016-07-18 20:50:22',NULL,1,NULL,NULL,0,'64ea00f642f046fea7c1ebc2a175d44b8af459ea',NULL,NULL,NULL),(4,4,'quimby','quimby','mquimby@email.com','Quimby','Mayor','4666e0fd4505e45de11754fd5a7d26ae14705924','platform',3,'','',NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'english','2016-07-19 09:20:28','2026-07-27 09:20:00',1,NULL,NULL,NULL,'612ce7f6860d1f7dac844f5489f3ee1647e38808','2016-07-23 04:15:14',NULL,NULL),(5,5,'blewis','blewis','s9977839@student.rmit.edu.au','Lewis','Ben','035aa5d290587379524850c4f3f5ff267b7ea374','platform',1,'NERD','','5_5791abf5dbcec_index.png',1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'english','2016-07-21 22:19:56',NULL,1,'http://',NULL,NULL,'e7e69788b3f948ce3828c0fd3020ceb2f7f6e902','2016-08-14 10:16:27',NULL,NULL),(6,6,'aimee','aimee','s3456209@student.rmit.edu.au','wilson','aimee','46b7cd509abe078b48c9301a620ee6ce77111d03','platform',5,'','',NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'english','2016-07-25 11:25:57','2026-08-02 11:25:57',1,NULL,NULL,0,'0a560f0fe0e6b84b762a0f75be5d8e7f9b2f9e56','2016-08-09 22:38:19',NULL,NULL),(7,7,'Chris','chris','test@test.com','Bell','Chris','868b2d4fcdd93b686a272caf8d00694b812cc738','platform',1,'','',NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'english','2016-07-25 11:27:10','2026-08-02 11:27:00',1,NULL,NULL,NULL,'b6588b279e76e985bdf4cdaa62af1334108c0768','2016-07-27 08:42:15',NULL,NULL),(8,8,'s3338093','s3338093','s3338093@student.rmit.edu.au','Thompson','Mel','56b1bde380cf637ab29d889bc139c935a4aec9ef','platform',5,'','',NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'english','2016-08-06 06:17:54','2026-08-14 06:17:54',1,NULL,NULL,0,'e1bf5198563331754f2a337112a267b2da212b7e',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_key`
--

DROP TABLE IF EXISTS `user_api_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `api_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `api_service` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `api_end_point` longtext COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_user_api_keys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_key`
--

LOCK TABLES `user_api_key` WRITE;
/*!40000 ALTER TABLE `user_api_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_course_category`
--

DROP TABLE IF EXISTS `user_course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_course_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_c_cat_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_course_category`
--

LOCK TABLES `user_course_category` WRITE;
/*!40000 ALTER TABLE `user_course_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_friend_relation_type`
--

DROP TABLE IF EXISTS `user_friend_relation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_friend_relation_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_friend_relation_type`
--

LOCK TABLES `user_friend_relation_type` WRITE;
/*!40000 ALTER TABLE `user_friend_relation_type` DISABLE KEYS */;
INSERT INTO `user_friend_relation_type` VALUES (1,'SocialUnknow'),(2,'SocialParent'),(3,'SocialFriend'),(4,'SocialGoodFriend'),(5,'SocialEnemy'),(6,'SocialDeleted');
/*!40000 ALTER TABLE `user_friend_relation_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rel_course_vote`
--

DROP TABLE IF EXISTS `user_rel_course_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rel_course_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ucv_cid` (`c_id`),
  KEY `idx_ucv_uid` (`user_id`),
  KEY `idx_ucv_cuid` (`user_id`,`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rel_course_vote`
--

LOCK TABLES `user_rel_course_vote` WRITE;
/*!40000 ALTER TABLE `user_rel_course_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rel_course_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rel_event_type`
--

DROP TABLE IF EXISTS `user_rel_event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rel_event_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `event_type_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_name_index` (`event_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rel_event_type`
--

LOCK TABLES `user_rel_event_type` WRITE;
/*!40000 ALTER TABLE `user_rel_event_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rel_event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rel_tag`
--

DROP TABLE IF EXISTS `user_rel_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rel_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_urt_uid` (`user_id`),
  KEY `idx_urt_tid` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rel_tag`
--

LOCK TABLES `user_rel_tag` WRITE;
/*!40000 ALTER TABLE `user_rel_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rel_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rel_user`
--

DROP TABLE IF EXISTS `user_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rel_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_user_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  `last_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_rel_user__user` (`user_id`),
  KEY `idx_user_rel_user__friend_user` (`friend_user_id`),
  KEY `idx_user_rel_user__user_friend_user` (`user_id`,`friend_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rel_user`
--

LOCK TABLES `user_rel_user` WRITE;
/*!40000 ALTER TABLE `user_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `group_type` int(11) NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `allow_members_leave_group` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_rel_course`
--

DROP TABLE IF EXISTS `usergroup_rel_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_rel_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_rel_course`
--

LOCK TABLES `usergroup_rel_course` WRITE;
/*!40000 ALTER TABLE `usergroup_rel_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_rel_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_rel_question`
--

DROP TABLE IF EXISTS `usergroup_rel_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_rel_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  `coefficient` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_rel_question`
--

LOCK TABLES `usergroup_rel_question` WRITE;
/*!40000 ALTER TABLE `usergroup_rel_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_rel_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_rel_session`
--

DROP TABLE IF EXISTS `usergroup_rel_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_rel_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_rel_session`
--

LOCK TABLES `usergroup_rel_session` WRITE;
/*!40000 ALTER TABLE `usergroup_rel_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_rel_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_rel_user`
--

DROP TABLE IF EXISTS `usergroup_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `usergroup_id` int(11) DEFAULT NULL,
  `relation_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_739515A9A76ED395` (`user_id`),
  KEY `IDX_739515A9D2112630` (`usergroup_id`),
  CONSTRAINT `FK_739515A9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_739515A9D2112630` FOREIGN KEY (`usergroup_id`) REFERENCES `usergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_rel_user`
--

LOCK TABLES `usergroup_rel_user` WRITE;
/*!40000 ALTER TABLE `usergroup_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_rel_usergroup`
--

DROP TABLE IF EXISTS `usergroup_rel_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_rel_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `subgroup_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_rel_usergroup`
--

LOCK TABLES `usergroup_rel_usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup_rel_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_rel_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'chamilo'
--

--
-- Current Database: `mysql`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysql` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mysql`;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columns_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns_priv`
--

LOCK TABLES `columns_priv` WRITE;
/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` VALUES ('localhost','phpmyadmin','phpmyadmin','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','openmeetings','openmeetings','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','openmeeting_dbs','openmeetings','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','open307','openmeetings','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','openmeetings_db','openmeetings','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','phpcron','phpcron','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','chamilo','php','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `body` longblob NOT NULL,
  `definer` char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `execute_at` datetime DEFAULT NULL,
  `interval_value` int(11) DEFAULT NULL,
  `interval_field` enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_executed` datetime DEFAULT NULL,
  `starts` datetime DEFAULT NULL,
  `ends` datetime DEFAULT NULL,
  `status` enum('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL DEFAULT 'ENABLED',
  `on_completion` enum('DROP','PRESERVE') NOT NULL DEFAULT 'DROP',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `originator` int(10) unsigned NOT NULL,
  `time_zone` char(64) CHARACTER SET latin1 NOT NULL DEFAULT 'SYSTEM',
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `func`
--

LOCK TABLES `func` WRITE;
/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_category` (
  `help_category_id` smallint(5) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_category`
--

LOCK TABLES `help_category` WRITE;
/*!40000 ALTER TABLE `help_category` DISABLE KEYS */;
INSERT INTO `help_category` VALUES (1,'Geographic',0,''),(2,'Polygon properties',35,''),(3,'Numeric Functions',39,''),(4,'WKT',35,''),(5,'Plugins',36,''),(6,'Control flow functions',39,''),(7,'MBR',35,''),(8,'Transactions',36,''),(9,'Help Metadata',36,''),(10,'Account Management',36,''),(11,'Point properties',35,''),(12,'Encryption Functions',39,''),(13,'LineString properties',35,''),(14,'Miscellaneous Functions',39,''),(15,'Logical operators',39,''),(16,'Functions and Modifiers for Use with GROUP BY',36,''),(17,'Information Functions',39,''),(18,'Storage Engines',36,''),(19,'Bit Functions',39,''),(20,'Comparison operators',39,''),(21,'Table Maintenance',36,''),(22,'User-Defined Functions',36,''),(23,'Data Types',36,''),(24,'Compound Statements',36,''),(25,'Geometry constructors',35,''),(26,'GeometryCollection properties',1,''),(27,'Administration',36,''),(28,'Data Manipulation',36,''),(29,'Utility',36,''),(30,'Language Structure',36,''),(31,'Geometry relations',35,''),(32,'Date and Time Functions',39,''),(33,'WKB',35,''),(34,'Procedures',36,''),(35,'Geographic Features',36,''),(36,'Contents',0,''),(37,'Geometry properties',35,''),(38,'String Functions',39,''),(39,'Functions',36,''),(40,'Data Definition',36,'');
/*!40000 ALTER TABLE `help_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (0,'JOIN'),(1,'HOST'),(2,'SERIALIZABLE'),(3,'CONTAINS'),(4,'SRID'),(5,'AT'),(6,'SCHEDULE'),(7,'RETURNS'),(8,'MASTER_SSL_CA'),(9,'NCHAR'),(10,'ONLY'),(11,'WORK'),(12,'OPEN'),(13,'ESCAPE'),(14,'EVENTS'),(15,'MONTH'),(16,'PROFILES'),(17,'ISCLOSED'),(18,'DUPLICATE'),(19,'REPLICATION'),(20,'UNLOCK'),(21,'INNODB'),(22,'YEAR_MONTH'),(23,'WITHIN'),(24,'PREPARE'),(25,'LOCK'),(26,'NDB'),(27,'INT4'),(28,'POLYGON'),(29,'MINUTE'),(30,'SEPARATOR'),(31,'DELETE'),(32,'ON'),(33,'CONNECTION'),(34,'CLOSE'),(35,'USE'),(36,'PRIVILEGES'),(37,'SPATIAL'),(38,'SQL_BUFFER_RESULT'),(39,'SECURITY'),(40,'AUTOEXTEND_SIZE'),(41,'NDBCLUSTER'),(42,'LEVEL'),(43,'BINARY'),(44,'CURRENT_USER'),(45,'HOUR_MINUTE'),(46,'UPDATE'),(47,'PRESERVE'),(48,'INTO'),(49,'POLYFROMWKB'),(50,'VARIABLE'),(51,'ROLLBACK'),(52,'TIMESTAMP'),(53,'IMPORT'),(54,'CHECKSUM'),(55,'THEN'),(56,'ENGINES'),(57,'HANDLER'),(58,'DAY_SECOND'),(59,'HELP_DATE'),(60,'BOOLEAN'),(61,'MOD'),(62,'CLASS_ORIGIN'),(63,'MPOLYFROMWKB'),(64,'ITERATE'),(65,'DO'),(66,'DATE'),(67,'FULLTEXT'),(68,'COMMENT'),(69,'MASTER_CONNECT_RETRY'),(70,'MASTER_LOG_FILE'),(71,'PRECISION'),(72,'REQUIRE'),(73,'LONG'),(74,'OPTION'),(75,'REORGANIZE'),(76,'ELSE'),(77,'EXTERIORRING'),(78,'GEOMFROMWKB'),(79,'FROM'),(80,'MULTIPOLYGON'),(81,'LEFT'),(82,'ELSEIF'),(83,'COMPACT'),(84,'DEC'),(85,'FOR'),(86,'WARNINGS'),(87,'STRING'),(88,'CONDITION'),(89,'ENCLOSED'),(90,'AGGREGATE'),(91,'FIELDS'),(92,'KILL'),(93,'DISJOINT'),(94,'TABLESPACE'),(95,'OVERLAPS'),(96,'INFILE'),(97,'MBREQUAL'),(98,'HELP_VERSION'),(99,'ORDER'),(100,'USING'),(101,'MIDDLEINT'),(102,'GRANT'),(103,'MBRINTERSECTS'),(104,'GEOMETRYN'),(105,'GEOMETRYFROMTEXT'),(106,'FOREIGN'),(107,'CACHE'),(108,'MYSQL_ERRNO'),(109,'SCHEMAS'),(110,'LEADING'),(111,'CONSTRAINT_NAME'),(112,'CONVERT'),(113,'DYNAMIC'),(114,'POLYGONFROMTEXT'),(115,'ENVELOPE'),(116,'HAVING'),(117,'STARTING'),(118,'RELOAD'),(119,'ISSIMPLE'),(120,'AUTOCOMMIT'),(121,'REVOKE'),(122,'EXPLAIN'),(123,'CSV'),(124,'OUTFILE'),(125,'LOW_PRIORITY'),(126,'FILE'),(127,'NODEGROUP'),(128,'SCHEMA'),(129,'MLINEFROMWKB'),(130,'DUAL'),(131,'MULTIPOINTFROMWKB'),(132,'MULTIPOINTFROMTEXT'),(133,'EXTENDED'),(134,'CROSS'),(135,'CONTRIBUTORS'),(136,'NATIONAL'),(137,'GROUP'),(138,'SHA'),(139,'POINTN'),(140,'IGNORE_SERVER_IDS'),(141,'ASBINARY'),(142,'MBROVERLAPS'),(143,'OWNER'),(144,'TRUE'),(145,'CHARACTER'),(146,'SCHEMA_NAME'),(147,'TABLE'),(148,'CASCADE'),(149,'RELAY_LOG_POS'),(150,'ASWKB'),(151,'LEAVE'),(152,'MODIFY'),(153,'MATCH'),(154,'MASTER_LOG_POS'),(155,'DISTINCTROW'),(156,'X'),(157,'CURSOR'),(158,'CROSSES'),(159,'GEOMETRYCOLLECTIONFROMTEXT'),(160,'CHAIN'),(161,'FLUSH'),(162,'CREATE'),(163,'DESCRIBE'),(164,'PROCESSLIST'),(165,'DISCARD'),(166,'SOUNDS'),(167,'PACK_KEYS'),(168,'MULTILINESTRINGFROMTEXT'),(169,'INTERSECTS'),(170,'FAST'),(171,'LOOP'),(172,'VARCHARACTER'),(173,'BEFORE'),(174,'ALL'),(175,'REDUNDANT'),(176,'USER_RESOURCES'),(177,'PARTIAL'),(178,'END'),(179,'SECOND'),(180,'FLOAT8'),(181,'PREV'),(182,'MBRCONTAINS'),(183,'OR'),(184,'IDENTIFIED'),(185,'POINTFROMTEXT'),(186,'MASTER_SSL_CIPHER'),(187,'SQL_SLAVE_SKIP_COUNTER'),(188,'BOTH'),(189,'YEAR'),(190,'UNIQUE'),(191,'TRIGGERS'),(192,'RESIGNAL'),(193,'MASTER_SSL'),(194,'DATE_ADD'),(195,'LIKE'),(196,'PLUGIN'),(197,'MULTIPOINT'),(198,'FETCH'),(199,'MBRWITHIN'),(200,'COLUMN'),(201,'USAGE'),(202,'MEMORY'),(203,'QUERY'),(204,'Y'),(205,'LINES'),(206,'SQL_THREAD'),(207,'INTERIORRINGN'),(208,'NUMINTERIORRINGS'),(209,'MAX_QUERIES_PER_HOUR'),(210,'TRANSACTION'),(211,'STDDEV'),(212,'INT1'),(213,'RIGHT'),(214,'MAX_ROWS'),(215,'ALTER'),(216,'NATURAL'),(217,'MULTILINESTRING'),(218,'VARIABLES'),(219,'ESCAPED'),(220,'KEY_BLOCK_SIZE'),(221,'MPOINTFROMTEXT'),(222,'CHAR'),(223,'UPGRADE'),(224,'INTERVAL'),(225,'NAME'),(226,'REFERENCES'),(227,'STORAGE'),(228,'ISOLATION'),(229,'EVERY'),(230,'INT8'),(231,'AUTHORS'),(232,'RESTRICT'),(233,'UNCOMMITTED'),(234,'LINESTRINGFROMTEXT'),(235,'IS'),(236,'NOT'),(237,'DATAFILE'),(238,'ANALYSE'),(239,'DES_KEY_FILE'),(240,'COMPRESSED'),(241,'START'),(242,'IF'),(243,'ROWS'),(244,'PURGE'),(245,'USER'),(246,'EXIT'),(247,'MERGE'),(248,'SQL_NO_CACHE'),(249,'DELAYED'),(250,'WRITE'),(251,'DATABASE'),(252,'NULL'),(253,'POWER'),(254,'POINTFROMWKB'),(255,'USE_FRM'),(256,'TERMINATED'),(257,'NVARCHAR'),(258,'RETURN'),(259,'DIRECTORY'),(260,'AES_DECRYPT'),(261,'GLENGTH'),(262,'SHUTDOWN'),(263,'CATALOG_NAME'),(264,'FIXED'),(265,'MULTIPOLYGONFROMTEXT'),(266,'REPLACE'),(267,'REPEAT'),(268,'STARTS'),(269,'COMPLETION'),(270,'COLUMNS'),(271,'DATETIME'),(272,'MODE'),(273,'INTEGER'),(274,'VALUE'),(275,'ASWKT'),(276,'GEOMETRYCOLLECTIONFROMWKB'),(277,'DROP'),(278,'SQL_BIG_RESULT'),(279,'MASTER_SSL_VERIFY_SERVER_CERT'),(280,'SUBJECT'),(281,'CHECK'),(282,'FULL'),(283,'BY'),(284,'NO'),(285,'DAY'),(286,'DATA'),(287,'PARTITION'),(288,'REAL'),(289,'SHARE'),(290,'LINESTRING'),(291,'MASTER_HEARTBEAT_PERIOD'),(292,'MESSAGE_TEXT'),(293,'COLUMN_NAME'),(294,'LINEFROMTEXT'),(295,'X509'),(296,'WHERE'),(297,'SUBCLASS_ORIGIN'),(298,'EVENT'),(299,'IGNORE'),(300,'SUPER'),(301,'SHA2'),(302,'QUICK'),(303,'SIGNED'),(304,'OFFLINE'),(305,'FALSE'),(306,'POLYGONFROMWKB'),(307,'FORCE'),(308,'CHANGE'),(309,'TO'),(310,'POINT'),(311,'TABLE_NAME'),(312,'VARYING'),(313,'FEDERATED'),(314,'MAX_SIZE'),(315,'HOUR_SECOND'),(316,'GEOMETRYCOLLECTION'),(317,'PROCEDURE'),(318,'AGAINST'),(319,'ENDPOINT'),(320,'LONGBINARY'),(321,'INSERT'),(322,'COUNT'),(323,'PORT'),(324,'MLINEFROMTEXT'),(325,'EXISTS'),(326,'MUTEX'),(327,'RELEASE'),(328,'DEFAULT'),(329,'TYPE'),(330,'NO_WRITE_TO_BINLOG'),(331,'OPTIMIZE'),(332,'SQLSTATE'),(333,'RESET'),(334,'INSTALL'),(335,'BIGINT'),(336,'SET'),(337,'ISSUER'),(338,'STATUS'),(339,'INNER'),(340,'RELAYLOG'),(341,'MRG_MYISAM'),(342,'STOP'),(343,'TRAILING'),(344,'PARTITIONS'),(345,'CASE'),(346,'IO_THREAD'),(347,'DEALLOCATE'),(348,'CIPHER'),(349,'CONTINUE'),(350,'READ'),(351,'MINUTE_SECOND'),(352,'MIN_ROWS'),(353,'FUNCTION'),(354,'INT3'),(355,'ADD'),(356,'AVG_ROW_LENGTH'),(357,'ARCHIVE'),(358,'FLOAT4'),(359,'ASTEXT'),(360,'NUMGEOMETRIES'),(361,'VIEW'),(362,'REPEATABLE'),(363,'STARTPOINT'),(364,'CONSTRAINT_CATALOG'),(365,'MPOLYFROMTEXT'),(366,'UNSIGNED'),(367,'DECIMAL'),(368,'INDEXES'),(369,'HOSTS'),(370,'COMMIT'),(371,'SNAPSHOT'),(372,'DECLARE'),(373,'NUMPOINTS'),(374,'LOAD'),(375,'SQL_CACHE'),(376,'COLLATE'),(377,'BYTE'),(378,'LINESTRINGFROMWKB'),(379,'GLOBAL'),(380,'WHEN'),(381,'TOUCHES'),(382,'AS'),(383,'GEOMCOLLFROMTEXT'),(384,'GRANTS'),(385,'OUTER'),(386,'CURSOR_NAME'),(387,'FLOOR'),(388,'WITH'),(389,'STD'),(390,'AFTER'),(391,'DISABLE'),(392,'UNINSTALL'),(393,'POW'),(394,'SONAME'),(395,'INDEX'),(396,'DEFINER'),(397,'MASTER_BIND'),(398,'REMOVE'),(399,'MULTILINESTRINGFROMWKB'),(400,'ONLINE'),(401,'UNDO'),(402,'ZEROFILL'),(403,'CLIENT'),(404,'MASTER_PASSWORD'),(405,'RELAY_LOG_FILE'),(406,'MBRTOUCHES'),(407,'MASTER_USER'),(408,'ENGINE'),(409,'INSERT_METHOD'),(410,'SQL_CALC_FOUND_ROWS'),(411,'UNION'),(412,'MYISAM'),(413,'DESC'),(414,'TIME'),(415,'EXPANSION'),(416,'NUMERIC'),(417,'CODE'),(418,'AREA'),(419,'LOGFILE'),(420,'EXTENT_SIZE'),(421,'INT2'),(422,'MAX_UPDATES_PER_HOUR'),(423,'ENDS'),(424,'ISEMPTY'),(425,'RECOVER'),(426,'LOGS'),(427,'HEAP'),(428,'BETWEEN'),(429,'REPAIR'),(430,'MBRDISJOINT'),(431,'CALL'),(432,'VALUES'),(433,'TRUNCATE'),(434,'SHOW'),(435,'BINLOG'),(436,'AND'),(437,'HOUR'),(438,'SELECT'),(439,'DATABASES'),(440,'WRAPPER'),(441,'BOOL'),(442,'MASTER_PORT'),(443,'CONCURRENT'),(444,'HELP'),(445,'OPTIONS'),(446,'PROCESS'),(447,'CONSISTENT'),(448,'MAX_CONNECTIONS_PER_HOUR'),(449,'IN'),(450,'DUMPFILE'),(451,'POLYFROMTEXT'),(452,'EXECUTE'),(453,'CEIL'),(454,'MASTER_HOST'),(455,'SERVER'),(456,'MULTIPOLYGONFROMWKB'),(457,'MASTER_SSL_CERT'),(458,'DAY_MINUTE'),(459,'DATE_SUB'),(460,'REBUILD'),(461,'GEOMETRYFROMWKB'),(462,'PARSER'),(463,'RENAME'),(464,'GEOMFROMTEXT'),(465,'SOCKET'),(466,'STRAIGHT_JOIN'),(467,'SHA1'),(468,'PASSWORD'),(469,'OFFSET'),(470,'NEXT'),(471,'TEMPORARY'),(472,'SQL_LOG_BIN'),(473,'ERRORS'),(474,'DIMENSION'),(475,'SQL_SMALL_RESULT'),(476,'COMMITTED'),(477,'EQUALS'),(478,'DELAY_KEY_WRITE'),(479,'BEGIN'),(480,'XA'),(481,'PROFILE'),(482,'CENTROID'),(483,'MEDIUM'),(484,'SSL'),(485,'DAY_HOUR'),(486,'AES_ENCRYPT'),(487,'GEOMCOLLROMWKB'),(488,'CEILING'),(489,'LINEFROMWKB'),(490,'GEOMETRYTYPE'),(491,'SIGNAL'),(492,'PLUGINS'),(493,'SAVEPOINT'),(494,'PRIMARY'),(495,'LAST'),(496,'KEYS'),(497,'MPOINTFROMWKB'),(498,'LIMIT'),(499,'KEY'),(500,'UNTIL'),(501,'CONSTRAINT_SCHEMA'),(502,'ANALYZE'),(503,'CONSTRAINT'),(504,'SERIAL'),(505,'ACTION'),(506,'INITIAL_SIZE'),(507,'SESSION'),(508,'SLAVE'),(509,'ASC'),(510,'ENABLE'),(511,'OPTIONALLY'),(512,'DISTINCT'),(513,'LOCAL'),(514,'WHILE'),(515,'MAX_USER_CONNECTIONS'),(516,'MASTER_SSL_KEY'),(517,'NONE'),(518,'TABLES'),(519,'<>'),(520,'RLIKE'),(521,'TRIGGER'),(522,'HIGH_PRIORITY'),(523,'COLLATION'),(524,'BTREE'),(525,'COALESCE'),(526,'FIRST'),(527,'WAIT'),(528,'MASTER'),(529,'ROW_FORMAT');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_relation` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `help_keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='keyword-topic relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_relation`
--

LOCK TABLES `help_relation` WRITE;
/*!40000 ALTER TABLE `help_relation` DISABLE KEYS */;
INSERT INTO `help_relation` VALUES (1,0),(356,0),(476,1),(450,2),(4,3),(5,4),(90,5),(90,6),(407,6),(98,7),(185,8),(431,9),(436,10),(146,11),(18,12),(107,12),(135,12),(346,12),(381,13),(123,14),(170,14),(425,14),(377,15),(83,16),(27,17),(105,18),(199,19),(37,20),(346,21),(471,21),(377,22),(32,23),(36,24),(238,24),(436,24),(37,25),(356,25),(471,26),(503,27),(41,28),(377,29),(361,30),(50,31),(471,31),(475,31),(1,32),(90,32),(407,32),(475,32),(176,33),(471,33),(53,34),(107,34),(1,35),(57,35),(194,35),(193,36),(199,36),(250,36),(210,37),(466,37),(356,38),(199,39),(194,40),(471,41),(450,42),(40,43),(230,43),(270,43),(90,44),(407,44),(377,45),(84,46),(105,46),(356,46),(475,46),(90,47),(407,47),(3,48),(105,48),(305,48),(356,48),(92,49),(130,50),(146,51),(436,51),(463,51),(100,52),(188,52),(422,53),(466,53),(402,54),(471,54),(29,55),(59,55),(86,55),(283,56),(346,56),(107,57),(314,57),(377,58),(110,59),(24,60),(89,60),(114,61),(174,61),(375,62),(462,62),(124,63),(125,64),(90,65),(126,65),(407,65),(499,65),(133,66),(230,66),(263,66),(377,66),(210,67),(466,67),(471,67),(90,68),(194,68),(210,68),(407,68),(471,68),(185,69),(185,70),(315,71),(199,72),(286,73),(199,74),(250,74),(466,75),(59,76),(86,76),(143,77),(144,78),(50,79),(123,79),(346,79),(356,79),(425,79),(458,79),(148,80),(1,81),(29,82),(471,83),(209,84),(180,85),(314,85),(346,85),(356,85),(421,85),(329,86),(346,86),(98,87),(180,88),(422,89),(98,90),(346,91),(422,91),(176,92),(177,93),(194,94),(416,94),(466,94),(481,94),(181,95),(131,96),(422,96),(187,97),(190,98),(50,99),(84,99),(356,99),(361,99),(466,99),(1,100),(50,100),(87,100),(253,101),(199,102),(250,102),(203,103),(213,104),(413,105),(466,106),(471,106),(475,106),(476,106),(102,107),(151,107),(305,107),(375,108),(462,108),(160,109),(346,109),(458,110),(375,111),(462,111),(230,112),(378,112),(471,113),(396,114),(240,115),(356,116),(422,117),(199,118),(245,119),(146,120),(250,121),(256,122),(422,123),(471,123),(356,124),(3,125),(37,125),(50,125),(84,125),(105,125),(131,125),(422,125),(199,126),(194,127),(155,128),(186,128),(212,128),(310,128),(346,128),(273,129),(280,130),(467,131),(426,132),(256,133),(469,133),(1,134),(7,135),(346,135),(259,136),(431,136),(49,137),(194,137),(226,137),(231,137),(356,137),(428,138),(287,139),(185,140),(293,141),(298,142),(476,143),(386,144),(131,145),(155,145),(212,145),(259,145),(332,145),(346,145),(356,145),(422,145),(431,145),(471,145),(375,146),(462,146),(65,147),(111,147),(116,147),(215,147),(277,147),(279,147),(321,147),(346,147),(402,147),(418,147),(466,147),(469,147),(471,147),(473,147),(31,148),(277,148),(471,148),(475,148),(185,149),(293,150),(311,151),(466,152),(89,153),(185,154),(356,155),(317,156),(421,157),(320,158),(247,159),(146,160),(151,161),(326,161),(17,162),(22,162),(49,162),(65,162),(78,162),(90,162),(98,162),(155,162),(194,162),(210,162),(211,162),(279,162),(303,162),(310,162),(346,162),(358,162),(394,162),(457,162),(471,162),(476,162),(256,163),(346,164),(454,164),(466,165),(379,166),(471,167),(108,168),(337,169),(418,170),(343,171),(259,172),(270,173),(39,174),(199,174),(250,174),(306,174),(356,174),(471,175),(326,176),(471,177),(29,178),(59,178),(86,178),(233,178),(327,178),(343,178),(436,178),(499,178),(377,179),(315,180),(107,181),(354,182),(359,183),(78,184),(131,184),(199,184),(362,185),(185,186),(182,187),(458,188),(377,189),(466,190),(25,191),(346,191),(375,192),(185,193),(377,194),(346,195),(379,195),(292,196),(346,196),(420,196),(382,197),(384,198),(387,199),(466,200),(199,201),(356,202),(89,203),(151,203),(176,203),(401,204),(131,205),(422,205),(54,206),(324,206),(404,207),(403,208),(199,209),(146,210),(450,210),(408,211),(24,212),(1,213),(471,214),(65,215),(159,215),(199,215),(212,215),(226,215),(234,215),(374,215),(407,215),(442,215),(466,215),(481,215),(1,216),(423,217),(346,218),(348,218),(422,219),(471,220),(426,221),(230,222),(468,222),(212,223),(418,223),(90,224),(377,224),(212,225),(199,226),(471,226),(475,226),(283,227),(450,228),(90,229),(129,230),(10,231),(346,231),(31,232),(277,232),(475,232),(450,233),(58,234),(85,235),(206,235),(369,235),(459,235),(85,236),(90,236),(155,236),(206,236),(313,236),(194,237),(481,237),(189,238),(326,239),(471,240),(146,241),(324,241),(436,241),(9,242),(29,242),(31,242),(90,242),(155,242),(186,242),(277,242),(301,242),(483,242),(131,243),(270,244),(78,245),(222,245),(330,245),(476,245),(314,246),(471,247),(356,248),(3,249),(105,249),(489,249),(37,250),(436,250),(155,251),(186,251),(212,251),(310,251),(346,251),(476,251),(85,252),(369,252),(475,252),(486,253),(485,254),(469,255),(422,256),(259,257),(494,258),(212,259),(471,259),(500,260),(504,261),(199,262),(375,263),(462,263),(209,264),(471,264),(201,265),(3,266),(131,266),(422,266),(233,267),(90,268),(90,269),(407,269),(21,270),(346,270),(422,270),(466,270),(471,270),(230,271),(89,272),(356,272),(98,273),(230,273),(503,273),(3,274),(105,274),(244,274),(375,274),(462,274),(178,275),(109,276),(9,277),(31,277),(35,277),(88,277),(186,277),(231,277),(238,277),(264,277),(277,277),(301,277),(330,277),(406,277),(416,277),(417,277),(466,277),(481,277),(356,278),(185,279),(199,280),(418,281),(466,281),(471,281),(21,282),(295,282),(346,282),(454,282),(471,282),(50,283),(78,283),(84,283),(131,283),(199,283),(356,283),(361,283),(422,283),(466,283),(471,283),(471,284),(475,284),(377,285),(212,286),(422,286),(471,286),(476,286),(466,287),(471,287),(98,288),(315,288),(356,289),(47,290),(185,291),(375,292),(462,292),(375,293),(462,293),(58,294),(199,295),(50,296),(84,296),(107,296),(375,297),(462,297),(90,298),(301,298),(358,298),(407,298),(1,299),(84,299),(105,299),(131,299),(356,299),(422,299),(466,299),(199,300),(68,301),(50,302),(418,302),(469,302),(230,303),(88,304),(210,304),(466,304),(386,305),(92,306),(1,307),(185,308),(466,308),(185,309),(270,309),(463,309),(79,310),(375,311),(462,311),(259,312),(471,313),(194,314),(377,315),(97,316),(17,317),(189,317),(303,317),(328,317),(346,317),(356,317),(417,317),(442,317),(491,317),(89,318),(103,319),(286,320),(105,321),(195,321),(302,321),(489,321),(71,322),(329,322),(434,322),(476,323),(108,324),(9,325),(31,325),(90,325),(155,325),(186,325),(277,325),(301,325),(346,326),(366,326),(146,327),(436,327),(463,327),(3,328),(105,328),(155,328),(200,328),(212,328),(244,328),(466,328),(471,328),(466,329),(116,330),(326,330),(469,330),(473,330),(116,331),(466,331),(375,332),(462,332),(39,333),(120,333),(151,333),(265,333),(420,334),(221,335),(3,336),(84,336),(105,336),(130,336),(131,336),(146,336),(155,336),(182,336),(212,336),(332,336),(346,336),(356,336),(375,336),(422,336),(462,336),(466,336),(471,336),(475,336),(480,336),(497,336),(199,337),(60,338),(138,338),(215,338),(223,338),(328,338),(335,338),(346,338),(366,338),(1,339),(425,340),(471,341),(54,342),(458,343),(256,344),(59,345),(86,345),(54,346),(324,346),(238,347),(199,348),(314,349),(37,350),(107,350),(436,350),(450,350),(377,351),(471,352),(35,353),(70,353),(98,353),(211,353),(234,353),(303,353),(335,353),(346,353),(394,353),(406,353),(417,353),(253,354),(65,355),(194,355),(466,355),(481,355),(466,356),(471,356),(471,357),(168,358),(178,359),(183,360),(31,361),(159,361),(457,361),(450,362),(198,363),(375,364),(462,364),(201,365),(24,366),(129,366),(168,366),(209,366),(230,366),(315,366),(503,366),(98,367),(156,367),(230,367),(346,368),(145,369),(346,369),(146,370),(436,370),(146,371),(436,371),(180,372),(200,372),(314,372),(421,372),(225,373),(305,374),(422,374),(356,375),(155,376),(212,376),(471,376),(468,377),(455,378),(130,379),(138,379),(182,379),(348,379),(450,379),(59,380),(86,380),(241,381),(1,382),(37,382),(356,382),(247,383),(192,384),(346,384),(1,385),(375,386),(462,386),(221,387),(89,388),(199,388),(210,388),(466,388),(471,388),(261,389),(466,390),(90,391),(407,391),(466,391),(292,392),(278,393),(98,394),(1,395),(65,395),(88,395),(102,395),(210,395),(305,395),(309,395),(346,395),(466,395),(471,395),(90,396),(407,396),(185,397),(466,398),(273,399),(88,400),(210,400),(466,400),(314,401),(24,402),(129,402),(168,402),(209,402),(315,402),(503,402),(199,403),(185,404),(185,405),(300,406),(185,407),(194,408),(346,408),(366,408),(416,408),(466,408),(471,408),(481,408),(471,409),(356,410),(306,411),(471,412),(256,413),(356,413),(361,413),(230,414),(316,414),(376,414),(89,415),(209,416),(70,417),(491,417),(325,418),(49,419),(194,419),(226,419),(231,419),(194,420),(235,421),(199,422),(90,423),(334,424),(436,425),(40,426),(270,426),(346,426),(471,427),(147,428),(466,429),(469,429),(340,430),(338,431),(3,432),(105,432),(321,433),(466,433),(7,434),(10,434),(17,434),(21,434),(25,434),(34,434),(40,434),(60,434),(70,434),(71,434),(83,434),(123,434),(135,434),(138,434),(145,434),(160,434),(170,434),(192,434),(193,434),(215,434),(223,434),(279,434),(283,434),(295,434),(309,434),(310,434),(328,434),(329,434),(332,434),(335,434),(346,434),(348,434),(358,434),(366,434),(394,434),(425,434),(454,434),(490,434),(491,434),(495,434),(123,435),(349,435),(147,436),(352,436),(377,437),(3,438),(105,438),(256,438),(302,438),(356,438),(160,439),(346,439),(476,440),(24,441),(112,441),(185,442),(131,443),(422,443),(119,444),(391,444),(374,445),(476,445),(199,446),(146,447),(436,447),(199,448),(89,449),(123,449),(356,449),(425,449),(356,450),(396,451),(87,452),(199,452),(398,453),(185,454),(9,455),(374,455),(476,455),(124,456),(185,457),(377,458),(377,459),(466,460),(144,461),(210,462),(466,462),(471,462),(111,463),(222,463),(407,463),(466,463),(413,464),(476,465),(1,466),(356,466),(428,467),(78,468),(199,468),(476,468),(480,468),(356,469),(107,470),(277,471),(497,472),(71,473),(346,473),(433,474),(356,475),(450,476),(437,477),(471,478),(146,479),(327,479),(436,479),(436,480),(490,481),(439,482),(418,483),(199,484),(377,485),(446,486),(109,487),(451,488),(455,489),(456,490),(462,491),(34,492),(463,493),(466,494),(107,495),(309,496),(346,496),(466,496),(467,497),(50,498),(84,498),(107,498),(123,498),(356,498),(425,498),(65,499),(105,499),(466,499),(471,499),(475,499),(233,500),(375,501),(462,501),(466,502),(473,502),(466,503),(471,503),(244,504),(471,504),(471,505),(475,505),(194,506),(481,506),(130,507),(138,507),(348,507),(450,507),(39,508),(54,508),(90,508),(145,508),(223,508),(324,508),(407,508),(356,509),(361,509),(90,510),(407,510),(466,510),(422,511),(0,512),(96,512),(289,512),(306,512),(356,512),(361,512),(385,512),(434,512),(37,513),(116,513),(131,513),(326,513),(422,513),(469,513),(473,513),(499,514),(199,515),(185,516),(199,517),(37,518),(135,518),(295,518),(346,518),(498,519),(28,520),(22,521),(264,521),(346,521),(105,522),(356,522),(346,523),(495,523),(210,524),(466,525),(107,526),(466,526),(471,526),(194,527),(481,527),(40,528),(60,528),(185,528),(265,528),(270,528),(471,529);
/*!40000 ALTER TABLE `help_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_topic` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help topics';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_topic`
--

LOCK TABLES `help_topic` WRITE;
/*!40000 ALTER TABLE `help_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Host privileges;  Merged with database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ndb_binlog_index`
--

DROP TABLE IF EXISTS `ndb_binlog_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndb_binlog_index` (
  `Position` bigint(20) unsigned NOT NULL,
  `File` varchar(255) NOT NULL,
  `epoch` bigint(20) unsigned NOT NULL,
  `inserts` bigint(20) unsigned NOT NULL,
  `updates` bigint(20) unsigned NOT NULL,
  `deletes` bigint(20) unsigned NOT NULL,
  `schemaops` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`epoch`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ndb_binlog_index`
--

LOCK TABLES `ndb_binlog_index` WRITE;
/*!40000 ALTER TABLE `ndb_binlog_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `ndb_binlog_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MySQL plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proc`
--

DROP TABLE IF EXISTS `proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL DEFAULT '',
  `language` enum('SQL') NOT NULL DEFAULT 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL DEFAULT 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` longblob NOT NULL,
  `body` longblob NOT NULL,
  `definer` char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stored Procedures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proc`
--

LOCK TABLES `proc` WRITE;
/*!40000 ALTER TABLE `proc` DISABLE KEYS */;
/*!40000 ALTER TABLE `proc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procs_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8_bin NOT NULL,
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Procedure privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procs_priv`
--

LOCK TABLES `procs_priv` WRITE;
/*!40000 ALTER TABLE `procs_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `procs_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxies_priv`
--

DROP TABLE IF EXISTS `proxies_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxies_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_user` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User proxy privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxies_priv`
--

LOCK TABLES `proxies_priv` WRITE;
/*!40000 ALTER TABLE `proxies_priv` DISABLE KEYS */;
INSERT INTO `proxies_priv` VALUES ('localhost','root','','',1,'','2016-06-09 08:24:06'),('dfc2eabdf236','root','','',1,'','2016-06-09 08:24:06');
/*!40000 ALTER TABLE `proxies_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(64) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int(4) NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MySQL Foreign Servers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_priv`
--

LOCK TABLES `tables_priv` WRITE;
/*!40000 ALTER TABLE `tables_priv` DISABLE KEYS */;
INSERT INTO `tables_priv` VALUES ('localhost','chamilo','php','plugin_bbb_meeting','root@localhost','2016-08-08 10:52:43','Select,Insert,Update,Delete','');
/*!40000 ALTER TABLE `tables_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone` (
  `Time_zone_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone`
--

LOCK TABLES `time_zone` WRITE;
/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY (`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Leap seconds information for time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_leap_second`
--

LOCK TABLES `time_zone_leap_second` WRITE;
/*!40000 ALTER TABLE `time_zone_leap_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_leap_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_name`
--

LOCK TABLES `time_zone_name` WRITE;
/*!40000 ALTER TABLE `time_zone_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition`
--

LOCK TABLES `time_zone_transition` WRITE;
/*!40000 ALTER TABLE `time_zone_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  `Offset` int(11) NOT NULL DEFAULT '0',
  `Is_DST` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transition types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition_type`
--

LOCK TABLES `time_zone_transition_type` WRITE;
/*!40000 ALTER TABLE `time_zone_transition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Password` char(41) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL DEFAULT '0',
  `max_updates` int(11) unsigned NOT NULL DEFAULT '0',
  `max_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8_bin DEFAULT '',
  `authentication_string` text COLLATE utf8_bin,
  PRIMARY KEY (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('localhost','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',''),('dfc2eabdf236','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',''),('127.0.0.1','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',''),('::1','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',''),('localhost','debian-sys-maint','*A14384EA2524731F5FEC3ABECF022410B47B358E','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',NULL),('localhost','phpmyadmin','*EF8AFC3377F7FDD8E3EFD0299E9BE4F554536690','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'',NULL),('%','melbnetworks','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',NULL),('%','openmeetings','','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'',NULL),('localhost','openmeetings','*497C85D0E979CD9DCB4F665BC4CEFD34A794F4C2','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'',NULL),('localhost','phpcron','*497C85D0E979CD9DCB4F665BC4CEFD34A794F4C2','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'',NULL),('localhost','php','*497C85D0E979CD9DCB4F665BC4CEFD34A794F4C2','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mysql'
--

--
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `thread_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `query_time` time NOT NULL,
  `lock_time` time NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `sql_text` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `openmeetings_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `openmeetings_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `openmeetings_db`;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `additionalname` varchar(255) DEFAULT NULL,
  `comment` text,
  `deleted` bit(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_ADDRESS_STATE` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,NULL,NULL,'\0','admin@mydomain.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_connected_event` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `description` text,
  `end` datetime DEFAULT NULL,
  `icalId` varchar(255) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `isdaily` bit(1) DEFAULT NULL,
  `ismonthly` bit(1) DEFAULT NULL,
  `isweekly` bit(1) DEFAULT NULL,
  `isyearly` bit(1) DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_password_protected` bit(1) DEFAULT NULL,
  `reminder` varchar(20) DEFAULT NULL,
  `is_reminder_email_send` bit(1) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `appointmentname` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `om_user` (`id`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` text,
  `need_moderation` bit(1) NOT NULL,
  `sent` datetime DEFAULT NULL,
  `from_user_id` bigint(20) DEFAULT NULL,
  `to_room_id` bigint(20) DEFAULT NULL,
  `to_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_room_id` (`to_room_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `om_user` (`id`),
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`to_room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `chat_ibfk_3` FOREIGN KEY (`to_user_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `allow_recording` bit(1) DEFAULT NULL,
  `avsettings` varchar(255) DEFAULT NULL,
  `broadcast_id` bigint(20) DEFAULT NULL,
  `can_draw` bit(1) DEFAULT NULL,
  `can_giveaudio` bit(1) DEFAULT NULL,
  `can_remote` bit(1) DEFAULT NULL,
  `can_share` bit(1) DEFAULT NULL,
  `can_video` bit(1) DEFAULT NULL,
  `connected_since` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `external_user_id` varchar(255) DEFAULT NULL,
  `external_user_type` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `formated_date` varchar(255) DEFAULT NULL,
  `interview_pod_id` int(11) DEFAULT NULL,
  `is_broadcasting` bit(1) DEFAULT NULL,
  `is_mod` bit(1) DEFAULT NULL,
  `is_recording` bit(1) DEFAULT NULL,
  `is_supermoderator` bit(1) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `last_login` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `mic_muted` bit(1) DEFAULT NULL,
  `mobile` bit(1) DEFAULT NULL,
  `official_code` varchar(255) DEFAULT NULL,
  `picture_uri` varchar(255) DEFAULT NULL,
  `public_sid` varchar(255) DEFAULT NULL,
  `recording_id` bigint(20) DEFAULT NULL,
  `recording_metadata_id` bigint(20) DEFAULT NULL,
  `room_enter` datetime DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `room_recording_name` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `is_screenclient` bit(1) DEFAULT NULL,
  `screen_publish_started` bit(1) DEFAULT NULL,
  `sip_transport` bit(1) DEFAULT NULL,
  `start_recording` bit(1) DEFAULT NULL,
  `start_streaming` bit(1) DEFAULT NULL,
  `stream_publish_name` varchar(255) DEFAULT NULL,
  `stream_publish_started` bit(1) DEFAULT NULL,
  `streamid` varchar(255) DEFAULT NULL,
  `swfurl` varchar(2048) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `usercolor` varchar(255) DEFAULT NULL,
  `userip` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userport` int(11) DEFAULT NULL,
  `userpos` int(11) DEFAULT NULL,
  `vheight` int(11) DEFAULT NULL,
  `vwidth` int(11) DEFAULT NULL,
  `vx` int(11) DEFAULT NULL,
  `vy` int(11) DEFAULT NULL,
  `zombie_check_flag` bit(1) DEFAULT NULL,
  `server_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_CLIENT_SERVER` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conferencelog`
--

DROP TABLE IF EXISTS `conferencelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conferencelog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inserted` datetime DEFAULT NULL,
  `insertedby` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `scopename` varchar(255) DEFAULT NULL,
  `streamid` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `userip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conferencelog`
--

LOCK TABLES `conferencelog` WRITE;
/*!40000 ALTER TABLE `conferencelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `conferencelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` text,
  `deleted` bit(1) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `KEY0` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `U_CNFGRTN_KEY0` (`KEY0`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `configuration_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,'This Class is used for Authentification-Crypting. Be carefull what you do here! If you change it while running previous Pass of users will not be workign anymore! for more Information see http://openmeetings.apache.org/CustomCryptMechanism.html','\0','2016-07-13 23:18:06','crypt_ClassName',NULL,'org.apache.openmeetings.util.crypt.MD5Implementation',NULL),(2,'Is user register available on login screen','\0','2016-07-13 23:18:06','allow_frontend_register',NULL,'1',NULL),(3,'Is user register available via SOAP/REST','\0','2016-07-13 23:18:06','allow.soap.register',NULL,'1',NULL),(4,'Is user register available via OAuth','\0','2016-07-13 23:18:06','allow.oauth.register',NULL,'1',NULL),(5,'','\0','2016-07-13 23:18:06','default_group_id',NULL,'1',NULL),(6,'this is the smtp server to send messages','\0','2016-07-13 23:18:06','smtp_server',NULL,'localhost',NULL),(7,'this is the smtp server port normally 25','\0','2016-07-13 23:18:06','smtp_port',NULL,'25',NULL),(8,'all send e-mails by the system will have this address','\0','2016-07-13 23:18:06','system_email_addr',NULL,'noreply@openmeetings.apache.org',NULL),(9,'System auth email username','\0','2016-07-13 23:18:06','email_username',NULL,'',NULL),(10,'System auth email password','\0','2016-07-13 23:18:06','email_userpass',NULL,'',NULL),(11,'Enable TLS 1=true, 0=false','\0','2016-07-13 23:18:06','mail.smtp.starttls.enable',NULL,'0',NULL),(12,'Socket connection timeout value in milliseconds. Default is 30 seconds (30000).','\0','2016-07-13 23:18:06','mail.smtp.connection.timeout',NULL,'30000',NULL),(13,'Socket I/O timeout value in milliseconds. Default is 30 seconds (30000).','\0','2016-07-13 23:18:06','mail.smtp.timeout',NULL,'30000',NULL),(14,'Name of the Browser Title window','\0','2016-07-13 23:18:06','application.name',NULL,'OpenMeetings',NULL),(15,'Default System Language ID see languages.xml','\0','2016-07-13 23:18:06','default_lang_id',NULL,'1',NULL),(16,'dpi for conversion of PDF to SWF (should be an integer between 50 and  600 with a default value of 100 dpi)','\0','2016-07-13 23:18:06','swftools_zoom',NULL,'100',NULL),(17,'compression quality for conversion of PDF to SWF (should be an integer between 1 and 100, with a default value of 85)','\0','2016-07-13 23:18:06','swftools_jpegquality',NULL,'85',NULL),(18,'Path To SWF-Tools','\0','2016-07-13 23:18:06','swftools_path',NULL,'',NULL),(19,'Path to ImageMagick tools','\0','2016-07-13 23:18:06','imagemagick_path',NULL,'',NULL),(20,'Path To SoX-Tools','\0','2016-07-13 23:18:06','sox_path',NULL,'',NULL),(21,'Path To FFMPEG','\0','2016-07-13 23:18:06','ffmpeg_path',NULL,'',NULL),(22,'The path to OpenOffice/LibreOffice (optional) please set this to the real path in case jodconverter is unable to find OpenOffice/LibreOffice installation automatically','\0','2016-07-13 23:18:06','office.path',NULL,'',NULL),(23,'The path to JOD library (http://code.google.com/p/jodconverter), configure the path to point to the lib directory of JOD that contains also the jodconverter-core-version.jar','\0','2016-07-13 23:18:06','jod.path',NULL,'/opt/jod/lib',NULL),(24,'Feed URL','\0','2016-07-13 23:18:06','rss_feed1',NULL,'http://mail-archives.apache.org/mod_mbox/openmeetings-user/?format=atom',NULL),(25,'Feed URL 2','\0','2016-07-13 23:18:06','rss_feed2',NULL,'http://mail-archives.apache.org/mod_mbox/openmeetings-dev/?format=atom',NULL),(26,'User get a EMail with their Account data. Values: 0(No) or 1(Yes)','\0','2016-07-13 23:18:06','sendEmailAtRegister',NULL,'0',NULL),(27,'User must activate their account by clicking on the activation-link in the registering Email. Values: 0(No) or 1(Yes) It makes no sense to make this(sendEmailWithVerficationCode) 1(Yes) while sendEmailAtRegister is 0(No) cause you needto send a EMail.','\0','2016-07-13 23:18:06','sendEmailWithVerficationCode',NULL,'0',NULL),(28,'The Name of the Font used for exporting/render Images from WhiteboardThe Font has to exist on the Server which runs Red5','\0','2016-07-13 23:18:06','default_export_font',NULL,'TimesNewRoman',NULL),(29,'Base URL your OPenmeetings installation will be accessible at.','\0','2016-07-13 23:18:06','application.base.url',NULL,'http://localhost:5080/openmeetings/',NULL),(30,'Enable to enable the red5SIP integration ','\0','2016-07-13 23:18:06','red5sip.enable',NULL,'no',NULL),(31,'Numerical prefix for OM rooms created inside the SIP','\0','2016-07-13 23:18:06','red5sip.room_prefix',NULL,'400',NULL),(32,'Enable to enable the red5SIP integration ','\0','2016-07-13 23:18:06','red5sip.exten_context',NULL,'rooms',NULL),(33,'This is the default timezone if nothing is specified','\0','2016-07-13 23:18:06','default.timezone',NULL,'Australia/Sydney',NULL),(34,'Default selection in ScreenSharing Quality:\n 0 - bigger frame rate, no resize\n 1 - no resize\n 2 - size == 1/2 of selected area\n 3 - size == 3/8 of selected area','\0','2016-07-13 23:18:06','default.quality.screensharing',NULL,'1',NULL),(35,'Default selection in ScreenSharing FPS','\0','2016-07-13 23:18:06','default.fps.screensharing',NULL,'10',NULL),(36,'Is screensharing FPS should be displayed or not (true/false)','\0','2016-07-13 23:18:06','screensharing.fps.show',NULL,'true',NULL),(37,'Is remote control will be enabled while screensharing. Allowing remote control will be not possible in case it is set to \'false\' (true/false)','\0','2016-07-13 23:18:06','screensharing.allow.remote',NULL,'true',NULL),(38,'Show My Rooms Tab','\0','2016-07-13 23:18:06','dashboard.show.myrooms',NULL,'1',NULL),(39,'Show Chat Tab','\0','2016-07-13 23:18:06','dashboard.show.chat',NULL,'1',NULL),(40,'Show RSS Tab','\0','2016-07-13 23:18:06','dashboard.show.rssfeed',NULL,'0',NULL),(41,'Display name of the user who draw the current object (User Name auto-disapper after 3 seconds.','\0','2016-07-13 23:18:06','show.whiteboard.draw.status',NULL,'0',NULL),(42,'Maximum size of upload file (bytes)','\0','2016-07-13 23:18:06','max_upload_size',NULL,'1073741824',NULL),(43,'The number of minutes before reminder emails are send. Set to 0 to disable reminder emails','\0','2016-07-13 23:18:06','number.minutes.reminder.send',NULL,'15',NULL),(44,'Number of chars needed in a user login','\0','2016-07-13 23:18:06','user.login.minimum.length',NULL,'4',NULL),(45,'Number of chars needed in a user login','\0','2016-07-13 23:18:06','user.pass.minimum.length',NULL,'4',NULL),(46,'Default number of participants conference room created via calendar','\0','2016-07-13 23:18:06','calendar.conference.rooms.default.size',NULL,'50',NULL),(47,'specify a 1 if you would like to use old FFMPEG -map option with 0.0 instead of 0:0','\0','2016-07-13 23:18:06','use.old.style.ffmpeg.map.option',NULL,'0',NULL),(48,'A hot key code for the \'give exclusive audio\' functionality. Keycode 123 is F12','\0','2016-07-13 23:18:06','exclusive.audio.keycode',NULL,'123',NULL),(49,'A hot key code for the \'mute/unmute audio\' functionality. Keycode 118 is F7','\0','2016-07-13 23:18:06','mute.keycode',NULL,'118',NULL),(50,'Ldap domain selected by default in the login screen','\0','2016-07-13 23:18:06','ldap_default_id',NULL,'0',NULL),(51,'Set inviter\'s email address as ReplyTo in email invitations (1 == set, 0 == NOT set)','\0','2016-07-13 23:18:06','inviter.email.as.replyto',NULL,'1',NULL),(52,'Area to be shown to the user after login. Possible values are: user/dashboard, user/calendar, user/record, rooms/my, rooms/group, rooms/public, admin/user, admin/connection, admin/group, admin/room, admin/config, admin/lang, admin/ldap, admin/backup, admin/server, admin/oauth2','\0','2016-07-13 23:18:06','default.landing.zone',NULL,'user/dashboard',NULL),(53,'Set \"yes\" or \"no\" to enable/disable ssl certifications checking for OAuth2','\0','2016-07-13 23:18:06','oauth2.ignore_bad_ssl',NULL,'no',NULL),(54,'Users entered the room via invitationHash or secureHash will be redirected to this URL on connection lost','\0','2016-07-13 23:18:06','redirect.url.for.external.users',NULL,'',NULL),(55,'The day that each week begins. The value must be a number that represents the day of the week. Sunday=0, Monday=1, Tuesday=2, etc.','\0','2016-07-13 23:18:06','calendar.firstday',NULL,'0',NULL),(56,'Code for Google Analytics','\0','2016-07-13 23:18:06','google.analytics.code',NULL,NULL,NULL);
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_queue`
--

DROP TABLE IF EXISTS `email_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` text,
  `error_count` int(11) NOT NULL,
  `ics` blob,
  `inserted` datetime DEFAULT NULL,
  `last_error` text,
  `recipients` text,
  `replyTo` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_queue`
--

LOCK TABLES `email_queue` WRITE;
/*!40000 ALTER TABLE `email_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `errorvalue`
--

DROP TABLE IF EXISTS `errorvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `errorvalue` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `errorvalue`
--

LOCK TABLES `errorvalue` WRITE;
/*!40000 ALTER TABLE `errorvalue` DISABLE KEYS */;
INSERT INTO `errorvalue` VALUES (1,'\0','2016-07-13 23:18:03',334,'error',NULL),(2,'\0','2016-07-13 23:18:03',319,'error',NULL),(3,'\0','2016-07-13 23:18:03',320,'error',NULL),(4,'\0','2016-07-13 23:18:03',321,'info',NULL),(5,'\0','2016-07-13 23:18:03',324,'error',NULL),(6,'\0','2016-07-13 23:18:03',330,'error',NULL),(7,'\0','2016-07-13 23:18:03',331,'error',NULL),(8,'\0','2016-07-13 23:18:03',332,'info',NULL),(9,'\0','2016-07-13 23:18:03',318,'error',NULL),(10,'\0','2016-07-13 23:18:03',335,'error',NULL),(11,'\0','2016-07-13 23:18:03',336,'error',NULL),(12,'\0','2016-07-13 23:18:03',337,'info',NULL),(13,'\0','2016-07-13 23:18:03',103,'error',NULL),(14,'\0','2016-07-13 23:18:03',338,'error',NULL),(15,'\0','2016-07-13 23:18:03',105,'error',NULL),(16,'\0','2016-07-13 23:18:03',107,'error',NULL),(17,'\0','2016-07-13 23:18:03',106,'error',NULL),(18,'\0','2016-07-13 23:18:03',236,'error',NULL),(19,'\0','2016-07-13 23:18:03',339,'error',NULL),(20,'\0','2016-07-13 23:18:03',340,'error',NULL),(21,'\0','2016-07-13 23:18:03',341,'error',NULL),(22,'\0','2016-07-13 23:18:03',342,'error',NULL),(23,'\0','2016-07-13 23:18:03',343,'info',NULL),(24,'\0','2016-07-13 23:18:03',345,'error',NULL),(25,'\0','2016-07-13 23:18:03',346,'error',NULL),(26,'\0','2016-07-13 23:18:03',347,'error',NULL),(27,'\0','2016-07-13 23:18:03',358,'error',NULL),(28,'\0','2016-07-13 23:18:03',357,'info',NULL),(29,'\0','2016-07-13 23:18:03',358,'error',NULL),(30,'\0','2016-07-13 23:18:03',403,'info',NULL),(31,'\0','2016-07-13 23:18:03',533,'error',NULL),(32,'\0','2016-07-13 23:18:03',534,'error',NULL),(33,'\0','2016-07-13 23:18:03',535,'error',NULL),(34,'\0','2016-07-13 23:18:03',538,'error',NULL),(35,'\0','2016-07-13 23:18:03',276,'error',NULL),(36,'\0','2016-07-13 23:18:03',664,'error',NULL),(37,'\0','2016-07-13 23:18:03',665,'error',NULL),(38,'\0','2016-07-13 23:18:03',663,'error',NULL),(39,'\0','2016-07-13 23:18:03',666,'error',NULL),(40,'\0','2016-07-13 23:18:03',674,'info',NULL),(41,'\0','2016-07-13 23:18:03',673,'error',NULL),(42,'\0','2016-07-13 23:18:03',787,'error',NULL),(43,'\0','2016-07-13 23:18:03',920,'error',NULL),(44,'\0','2016-07-13 23:18:03',1000,'error',NULL),(45,'\0','2016-07-13 23:18:03',1195,'error',NULL),(46,'\0','2016-07-13 23:18:03',1226,'error',NULL),(47,'\0','2016-07-13 23:18:03',1227,'error',NULL),(48,'\0','2016-07-13 23:18:03',1228,'error',NULL),(49,'\0','2016-07-13 23:18:03',1231,'error',NULL),(50,'\0','2016-07-13 23:18:03',1271,'error',NULL),(51,'\0','2016-07-13 23:18:03',1309,'error',NULL),(52,'\0','2016-07-13 23:18:03',1310,'error',NULL),(53,'\0','2016-07-13 23:18:03',1416,'error',NULL),(54,'\0','2016-07-13 23:18:03',1431,'error',NULL),(55,'\0','2016-07-13 23:18:03',1540,'error',NULL),(56,'\0','2016-07-13 23:18:03',1544,'error',NULL);
/*!40000 ALTER TABLE `errorvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fileexploreritem`
--

DROP TABLE IF EXISTS `fileexploreritem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileexploreritem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) DEFAULT NULL,
  `flv_height` int(11) DEFAULT NULL,
  `flv_width` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `inserted_by` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `parent_item_id` bigint(20) DEFAULT NULL,
  `preview_image` varchar(255) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `external_type` varchar(255) DEFAULT NULL,
  `filesize` bigint(20) DEFAULT NULL,
  `wml_file_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fileexploreritem`
--

LOCK TABLES `fileexploreritem` WRITE;
/*!40000 ALTER TABLE `fileexploreritem` DISABLE KEYS */;
/*!40000 ALTER TABLE `fileexploreritem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_user`
--

DROP TABLE IF EXISTS `group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `is_moderator` bit(1) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_GRP_USR_USER` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `group_user_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `om_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_user`
--

LOCK TABLES `group_user` WRITE;
/*!40000 ALTER TABLE `group_user` DISABLE KEYS */;
INSERT INTO `group_user` VALUES (1,'\0',NULL,'\0',NULL,1,1);
/*!40000 ALTER TABLE `group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_protected` bit(1) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `was_used` bit(1) DEFAULT NULL,
  `valid` varchar(20) DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `appointment_id` bigint(20) DEFAULT NULL,
  `invited_by` bigint(20) DEFAULT NULL,
  `invitee_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `invited_by` (`invited_by`),
  KEY `invitee_id` (`invitee_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `invitation_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`id`),
  CONSTRAINT `invitation_ibfk_2` FOREIGN KEY (`invited_by`) REFERENCES `om_user` (`id`),
  CONSTRAINT `invitation_ibfk_3` FOREIGN KEY (`invitee_id`) REFERENCES `om_user` (`id`),
  CONSTRAINT `invitation_ibfk_4` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation`
--

LOCK TABLES `invitation` WRITE;
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldapconfig`
--

DROP TABLE IF EXISTS `ldapconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ldapconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_active` bit(1) DEFAULT NULL,
  `add_domain_to_user_name` bit(1) DEFAULT NULL,
  `comment` text,
  `config_file_name` varchar(255) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `insertedby_id` bigint(20) DEFAULT NULL,
  `updatedby_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `insertedby_id` (`insertedby_id`),
  KEY `updatedby_id` (`updatedby_id`),
  CONSTRAINT `ldapconfig_ibfk_1` FOREIGN KEY (`insertedby_id`) REFERENCES `om_user` (`id`),
  CONSTRAINT `ldapconfig_ibfk_2` FOREIGN KEY (`updatedby_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldapconfig`
--

LOCK TABLES `ldapconfig` WRITE;
/*!40000 ALTER TABLE `ldapconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `ldapconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_member`
--

DROP TABLE IF EXISTS `meeting_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appointment_status` varchar(255) DEFAULT NULL,
  `is_connected_event` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `appointment_id` bigint(20) DEFAULT NULL,
  `invitation` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `invitation` (`invitation`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `meeting_member_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`id`),
  CONSTRAINT `meeting_member_ibfk_2` FOREIGN KEY (`invitation`) REFERENCES `invitation` (`id`),
  CONSTRAINT `meeting_member_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_member`
--

LOCK TABLES `meeting_member` WRITE;
/*!40000 ALTER TABLE `meeting_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `naviglobal`
--

DROP TABLE IF EXISTS `naviglobal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `naviglobal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `isleaf` bit(1) DEFAULT NULL,
  `isopen` bit(1) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  `level_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `naviorder` int(11) DEFAULT NULL,
  `tooltip_label_id` bigint(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `naviglobal`
--

LOCK TABLES `naviglobal` WRITE;
/*!40000 ALTER TABLE `naviglobal` DISABLE KEYS */;
INSERT INTO `naviglobal` VALUES (1,'home','','\0','','2016-07-13 23:18:02','\0','',124,1,'home',1,582,NULL),(2,'meetings','','\0','','2016-07-13 23:18:02','\0','',792,1,'List of Conference Rooms Global Navi',2,793,NULL),(3,'record','','\0','','2016-07-13 23:18:02','\0','',395,1,'record',3,583,NULL),(4,'events','','','','2016-07-13 23:18:02','\0','',3,1,'List of Event Rooms Global Navi',4,585,NULL),(5,'moderate','','','','2016-07-13 23:18:02','\0','',649,2,'Moderation Menu',5,660,NULL),(6,'admin','','\0','','2016-07-13 23:18:03','\0','',6,3,'Administration Menu',6,586,NULL);
/*!40000 ALTER TABLE `naviglobal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navimain`
--

DROP TABLE IF EXISTS `navimain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navimain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `global_id` bigint(20) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `isleaf` bit(1) DEFAULT NULL,
  `isopen` bit(1) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  `level_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `naviorder` int(11) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `tooltip_label_id` bigint(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navimain`
--

LOCK TABLES `navimain` WRITE;
/*!40000 ALTER TABLE `navimain` DISABLE KEYS */;
INSERT INTO `navimain` VALUES (1,'dashboardModuleStartScreen','','\0',1,'','2016-07-13 23:18:02','','\0',290,1,'Dashboard Module',1,NULL,1450,NULL),(2,'dashboardModuleCalendar','','\0',1,'','2016-07-13 23:18:02','','\0',291,1,'Module Calendar',2,NULL,1451,NULL),(3,'conferenceModuleRoomList','','\0',2,'','2016-07-13 23:18:02','','\0',777,1,'List of Conference Rooms Main Navi',1,'publicTabButton',1506,NULL),(4,'conferenceModuleRoomList','','\0',2,'','2016-07-13 23:18:02','','\0',779,1,'List of Conference Rooms Main Navi',2,'privateTabButton',1507,NULL),(5,'conferenceModuleRoomList','','\0',2,'','2016-07-13 23:18:02','','\0',781,1,'List of Conference Rooms Main Navi',3,'myTabButton',1508,NULL),(6,'recordModule','','\0',3,'','2016-07-13 23:18:02','','\0',395,1,'Module Recording Player',1,NULL,1452,NULL),(7,'eventModuleRoomList','','\0',4,'','2016-07-13 23:18:02','','\0',3,1,'List of Event Rooms Main Navi',1,NULL,NULL,NULL),(8,'moderatorModuleUser','','\0',5,'','2016-07-13 23:18:03','','\0',650,1,'Moderate Users',1,NULL,NULL,NULL),(9,'moderatorModuleRoom','','\0',5,'','2016-07-13 23:18:03','','\0',651,1,'Moderate Rooms',1,NULL,NULL,NULL),(10,'adminModuleUser','','\0',6,'','2016-07-13 23:18:03','','\0',125,2,'Administration of Users',14,NULL,1454,NULL),(11,'adminModuleConnections','','\0',6,'','2016-07-13 23:18:03','','\0',597,3,'Aministration of Connections',15,NULL,1455,NULL),(12,'adminModuleOrg','','\0',6,'','2016-07-13 23:18:03','','\0',127,3,'Administration of Groups',16,NULL,1456,NULL),(13,'adminModuleRoom','','\0',6,'','2016-07-13 23:18:03','','\0',186,3,'Administration of Rooms',17,NULL,1457,NULL),(14,'adminModuleConfiguration','','\0',6,'','2016-07-13 23:18:03','','\0',263,3,'Administration of Configuration',18,NULL,1458,NULL),(15,'adminModuleLanguages','','\0',6,'','2016-07-13 23:18:03','','\0',348,3,'Administration of Languages',19,NULL,1459,NULL),(16,'adminModuleLDAP','','\0',6,'','2016-07-13 23:18:03','','\0',1103,3,'Administration of LDAP Configs',20,NULL,1460,NULL),(17,'adminModuleOAuth','','\0',6,'','2016-07-13 23:18:03','','\0',1571,3,'Administration of OAuth2 servers',21,NULL,1572,NULL),(18,'adminModuleBackup','','\0',6,'','2016-07-13 23:18:03','','\0',367,3,'Administration of Backups',22,NULL,1461,NULL),(19,'adminModuleServers','','\0',6,'','2016-07-13 23:18:03','','\0',1498,3,'Administration of Servers',23,NULL,1499,NULL);
/*!40000 ALTER TABLE `navimain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_server`
--

DROP TABLE IF EXISTS `oauth_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_server` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `email_param_name` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `firstname_param_name` varchar(255) DEFAULT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `lastname_param_name` varchar(255) DEFAULT NULL,
  `login_param_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `request_info_url` varchar(255) DEFAULT NULL,
  `request_key_url` varchar(255) DEFAULT NULL,
  `request_token_attributes` varchar(255) DEFAULT NULL,
  `request_method` varchar(20) DEFAULT NULL,
  `request_token_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_server`
--

LOCK TABLES `oauth_server` WRITE;
/*!40000 ALTER TABLE `oauth_server` DISABLE KEYS */;
INSERT INTO `oauth_server` VALUES (1,'<put your client_id>','<put your client_secret>','\0','default_email','\0','first_name','http://yandex.st/morda-logo/i/favicon.ico','last_name','login','Yandex','https://login.yandex.ru/info?format=json&oauth_token={$access_token}','https://oauth.yandex.ru/authorize?response_type=code&client_id={$client_id}','grant_type=authorization_code&code={$code}&client_id={$client_id}&client_secret={$client_secret}','POST','https://oauth.yandex.ru/token'),(2,'<put your client_id>','<put your client_secret>','\0','email','\0','given_name','https://www.google.ru/images/google_favicon_128.png','family_name','email','Google','https://www.googleapis.com/oauth2/v1/userinfo?access_token={$access_token}','https://accounts.google.com/o/oauth2/auth?redirect_uri={$redirect_uri}&response_type=code&client_id={$client_id}&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile','code={$code}&client_id={$client_id}&client_secret={$client_secret}&redirect_uri={$redirect_uri}&grant_type=authorization_code','POST','https://accounts.google.com/o/oauth2/token'),(3,'<put your client_id>','<put your client_secret>','\0','email','\0','first_name','https://www.facebook.com/images/fb_icon_325x325.png','last_name','id','Facebook','https://graph.facebook.com/me?access_token={$access_token}&fields=id,first_name,last_name,email','https://www.facebook.com/dialog/oauth?client_id={$client_id}&redirect_uri={$redirect_uri}&scope=email','client_id={$client_id}&redirect_uri={$redirect_uri}&client_secret={$client_secret}&code={$code}','POST','https://graph.facebook.com/v2.3/oauth/access_token');
/*!40000 ALTER TABLE `oauth_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `om_group`
--

DROP TABLE IF EXISTS `om_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `om_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `insertedby` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `om_group`
--

LOCK TABLES `om_group` WRITE;
/*!40000 ALTER TABLE `om_group` DISABLE KEYS */;
INSERT INTO `om_group` VALUES (1,'\0','2016-07-13 23:18:06',1,'admins',NULL,NULL);
/*!40000 ALTER TABLE `om_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `om_user`
--

DROP TABLE IF EXISTS `om_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `om_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activatehash` varchar(255) DEFAULT NULL,
  `age` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `external_type` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `forceTimeZoneCheck` bit(1) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `lasttrans` bigint(20) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pictureuri` varchar(255) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `resethash` varchar(255) DEFAULT NULL,
  `salutation` varchar(20) DEFAULT NULL,
  `sendSMS` bit(1) DEFAULT NULL,
  `show_contact_data` bit(1) NOT NULL,
  `show_contact_data_to_contacts` bit(1) NOT NULL,
  `time_zone_id` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `user_offers` varchar(255) DEFAULT NULL,
  `user_searchs` varchar(255) DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `sip_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_OM_USER_SIPUSER` (`sip_user_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `om_user_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `om_user`
--

LOCK TABLES `om_user` WRITE;
/*!40000 ALTER TABLE `om_user` DISABLE KEYS */;
INSERT INTO `om_user` VALUES (1,NULL,'2016-07-13 23:18:06','\0',NULL,NULL,NULL,'firstname','\0','2016-07-13 23:18:06',1,NULL,'lastname',NULL,'admin',NULL,'7f41c081b7b08b6633d2ed12651e774f',NULL,'2016-07-13 23:18:06',NULL,'mr','\0','\0','\0','Australia/Sydney','user','2016-07-13 23:18:06',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `om_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `om_user_right`
--

DROP TABLE IF EXISTS `om_user_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `om_user_right` (
  `user_id` bigint(20) DEFAULT NULL,
  `om_right` varchar(20) DEFAULT NULL,
  KEY `I_M_SRGHT_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `om_user_right`
--

LOCK TABLES `om_user_right` WRITE;
/*!40000 ALTER TABLE `om_user_right` DISABLE KEYS */;
INSERT INTO `om_user_right` VALUES (1,'Admin'),(1,'Room'),(1,'Login'),(1,'Dashboard'),(1,'Soap');
/*!40000 ALTER TABLE `om_user_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private_message`
--

DROP TABLE IF EXISTS `private_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `private_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `booked_room` bit(1) DEFAULT NULL,
  `private_message_folder_id` bigint(20) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `is_contact_request` bit(1) DEFAULT NULL,
  `is_read` bit(1) DEFAULT NULL,
  `isTrash` bit(1) DEFAULT NULL,
  `message` text,
  `parent_message_id` bigint(20) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `user_contact_id` bigint(20) DEFAULT NULL,
  `from_id` bigint(20) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `to_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_id` (`from_id`),
  KEY `owner_id` (`owner_id`),
  KEY `room_id` (`room_id`),
  KEY `to_id` (`to_id`),
  CONSTRAINT `private_message_ibfk_1` FOREIGN KEY (`from_id`) REFERENCES `om_user` (`id`),
  CONSTRAINT `private_message_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `om_user` (`id`),
  CONSTRAINT `private_message_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `private_message_ibfk_4` FOREIGN KEY (`to_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private_message`
--

LOCK TABLES `private_message` WRITE;
/*!40000 ALTER TABLE `private_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `private_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private_message_folder`
--

DROP TABLE IF EXISTS `private_message_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `private_message_folder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `folder_name` varchar(255) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private_message_folder`
--

LOCK TABLES `private_message_folder` WRITE;
/*!40000 ALTER TABLE `private_message_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `private_message_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recording`
--

DROP TABLE IF EXISTS `recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recording` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) DEFAULT NULL,
  `flv_height` int(11) DEFAULT NULL,
  `flv_width` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `inserted_by` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `parent_item_id` bigint(20) DEFAULT NULL,
  `preview_image` varchar(255) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `alternate_download` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `is_interview` bit(1) DEFAULT NULL,
  `progress_post_processing` int(11) DEFAULT NULL,
  `record_end` datetime DEFAULT NULL,
  `record_start` datetime DEFAULT NULL,
  `recorder_stream_id` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recording`
--

LOCK TABLES `recording` WRITE;
/*!40000 ALTER TABLE `recording` DISABLE KEYS */;
/*!40000 ALTER TABLE `recording` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recording_log`
--

DROP TABLE IF EXISTS `recording_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recording_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `exit_value` varchar(255) DEFAULT NULL,
  `full_message` mediumblob,
  `inserted` datetime DEFAULT NULL,
  `msg_type` varchar(255) DEFAULT NULL,
  `recording_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_RCRD_LG_RECORDING` (`recording_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recording_log`
--

LOCK TABLES `recording_log` WRITE;
/*!40000 ALTER TABLE `recording_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `recording_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recording_meta_delta`
--

DROP TABLE IF EXISTS `recording_meta_delta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recording_meta_delta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `current_event_time` datetime DEFAULT NULL,
  `data_length_packet` int(11) DEFAULT NULL,
  `debug_status` varchar(255) DEFAULT NULL,
  `delta_time` bigint(20) DEFAULT NULL,
  `delta_time_stamp` bigint(20) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `is_end_padding` bit(1) DEFAULT NULL,
  `last_time_stamp` bigint(20) DEFAULT NULL,
  `metadata_id` bigint(20) DEFAULT NULL,
  `missing_time` bigint(20) DEFAULT NULL,
  `packet_time_stamp` int(11) DEFAULT NULL,
  `received_audio_data_length` bigint(20) DEFAULT NULL,
  `is_start_padding` bit(1) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `start_time_stamp` int(11) DEFAULT NULL,
  `time_stamp` int(11) DEFAULT NULL,
  `wave_out_put_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recording_meta_delta`
--

LOCK TABLES `recording_meta_delta` WRITE;
/*!40000 ALTER TABLE `recording_meta_delta` DISABLE KEYS */;
/*!40000 ALTER TABLE `recording_meta_delta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recording_metadata`
--

DROP TABLE IF EXISTS `recording_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recording_metadata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_audio_only` bit(1) DEFAULT NULL,
  `audio_is_valid` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `free_text_user_name` varchar(255) DEFAULT NULL,
  `full_wav_audio_data` varchar(255) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `inserted_by` bigint(20) DEFAULT NULL,
  `interiew_pod_id` int(11) DEFAULT NULL,
  `record_end` datetime DEFAULT NULL,
  `record_start` datetime DEFAULT NULL,
  `is_screen_data` bit(1) DEFAULT NULL,
  `stream_name` varchar(255) DEFAULT NULL,
  `stream_status` varchar(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `is_video_only` bit(1) DEFAULT NULL,
  `wav_audio_data` varchar(255) DEFAULT NULL,
  `recording_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_RCRDTDT_RECORDING` (`recording_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recording_metadata`
--

LOCK TABLES `recording_metadata` WRITE;
/*!40000 ALTER TABLE `recording_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `recording_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hide_activities_and_actions` bit(1) DEFAULT NULL,
  `allow_font_styles` bit(1) NOT NULL,
  `allow_recording` bit(1) DEFAULT NULL,
  `allow_user_questions` bit(1) DEFAULT NULL,
  `appointment` bit(1) DEFAULT NULL,
  `is_audio_only` bit(1) DEFAULT NULL,
  `auto_video_select` bit(1) DEFAULT NULL,
  `hide_chat` bit(1) DEFAULT NULL,
  `chat_moderated` bit(1) DEFAULT NULL,
  `chat_opened` bit(1) DEFAULT NULL,
  `is_closed` bit(1) DEFAULT NULL,
  `comment` text,
  `confno` varchar(255) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `demo_room` bit(1) DEFAULT NULL,
  `demo_time` int(11) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `external_type` varchar(255) DEFAULT NULL,
  `files_opened` bit(1) DEFAULT NULL,
  `hide_actions_menu` bit(1) DEFAULT NULL,
  `hide_files_explorer` bit(1) DEFAULT NULL,
  `hide_screen_sharing` bit(1) DEFAULT NULL,
  `hide_top_bar` bit(1) DEFAULT NULL,
  `hide_whiteboard` bit(1) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `ispublic` bit(1) DEFAULT NULL,
  `ismoderatedroom` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `numberOfPartizipants` bigint(20) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  `show_microphone_status` bit(1) DEFAULT NULL,
  `sip_enabled` bit(1) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `wait_for_recording` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'\0','','','','\0','\0','\0','\0','\0','\0','\0','',NULL,'\0','\0',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0','2016-07-13 23:18:06','','\0','public Interview Room',16,NULL,NULL,NULL,'\0','\0','interview',NULL,'\0'),(2,'\0','','','','\0','\0','\0','\0','\0','\0','\0','',NULL,'\0','\0',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0','2016-07-13 23:18:06','','\0','public Conference Room',32,NULL,NULL,NULL,'\0','\0','conference',NULL,'\0'),(3,'\0','','','','\0','\0','\0','\0','\0','\0','\0','',NULL,'\0','\0',NULL,NULL,NULL,'\0','\0','\0','\0','\0','','2016-07-13 23:18:06','','\0','public Video Only Room',32,NULL,NULL,NULL,'\0','\0','conference','2016-07-13 23:18:06','\0'),(4,'\0','','','','\0','\0','\0','\0','\0','\0','\0','',NULL,'\0','\0',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0','2016-07-13 23:18:06','','\0','public Video And Whiteboard Room',32,NULL,NULL,NULL,'\0','\0','conference',NULL,'\0'),(5,'\0','','','','\0','\0','\0','\0','\0','\0','\0','',NULL,'\0','\0',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0','2016-07-13 23:18:06','','\0','public Restricted Room',100,NULL,NULL,NULL,'\0','\0','restricted',NULL,'\0'),(6,'\0','','','','\0','\0','\0','\0','\0','\0','\0','',NULL,'\0','\0',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0','2016-07-13 23:18:07','','\0','restricted room with micro option set',100,NULL,NULL,NULL,'','\0','restricted','2016-07-13 23:18:07','\0'),(7,'\0','','','','\0','\0','\0','\0','\0','\0','\0','',NULL,'\0','\0',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0','2016-07-13 23:18:07','','\0','conference room with micro option set',32,NULL,NULL,NULL,'','\0','conference','2016-07-13 23:18:07','\0'),(8,'\0','','','','\0','\0','\0','\0','\0','\0','\0','',NULL,'\0','\0',NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0','2016-07-13 23:18:07','\0','\0','private Conference Room',32,NULL,NULL,NULL,'\0','\0','conference',NULL,'\0');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_group`
--

DROP TABLE IF EXISTS `room_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_RM_GRUP_ROOM` (`room_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `room_group_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `om_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_group`
--

LOCK TABLES `room_group` WRITE;
/*!40000 ALTER TABLE `room_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_moderator`
--

DROP TABLE IF EXISTS `room_moderator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_moderator` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `roomId` bigint(20) DEFAULT NULL,
  `is_supermoderator` bit(1) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `room_moderator_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_moderator`
--

LOCK TABLES `room_moderator` WRITE;
/*!40000 ALTER TABLE `room_moderator` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_moderator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_poll`
--

DROP TABLE IF EXISTS `room_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_poll` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archived` bit(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `room_poll_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `om_user` (`id`),
  CONSTRAINT `room_poll_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_poll`
--

LOCK TABLES `room_poll` WRITE;
/*!40000 ALTER TABLE `room_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_poll_answer`
--

DROP TABLE IF EXISTS `room_poll_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_poll_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` bit(1) DEFAULT NULL,
  `pointList` int(11) DEFAULT NULL,
  `voteDate` datetime DEFAULT NULL,
  `poll_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_RM_PSWR_ROOMPOLL` (`poll_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `room_poll_answer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_poll_answer`
--

LOCK TABLES `room_poll_answer` WRITE;
/*!40000 ALTER TABLE `room_poll_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_poll_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `comment` text,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `last_ping` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `protocol` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `webapp` varchar(255) DEFAULT NULL,
  `insertedby_id` bigint(20) DEFAULT NULL,
  `updatedby_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `insertedby_id` (`insertedby_id`),
  KEY `updatedby_id` (`updatedby_id`),
  CONSTRAINT `server_ibfk_1` FOREIGN KEY (`insertedby_id`) REFERENCES `om_user` (`id`),
  CONSTRAINT `server_ibfk_2` FOREIGN KEY (`updatedby_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessiondata`
--

DROP TABLE IF EXISTS `sessiondata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessiondata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `permanent` bit(1) DEFAULT NULL,
  `refreshed` datetime DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `xml` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessiondata`
--

LOCK TABLES `sessiondata` WRITE;
/*!40000 ALTER TABLE `sessiondata` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessiondata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipuser`
--

DROP TABLE IF EXISTS `sipuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sipuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `allow` varchar(100) NOT NULL,
  `callbackextension` varchar(250) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `defaultuser` varchar(128) DEFAULT NULL,
  `fullcontact` varchar(512) DEFAULT NULL,
  `host` varchar(128) NOT NULL,
  `ipaddr` varchar(128) NOT NULL,
  `lastms` int(11) DEFAULT NULL,
  `md5secret` varchar(255) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `nat` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `regseconds` bigint(20) NOT NULL,
  `regserver` varchar(128) DEFAULT NULL,
  `secret` varchar(128) DEFAULT NULL,
  `type` varchar(6) NOT NULL,
  `useragent` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipuser`
--

LOCK TABLES `sipuser` WRITE;
/*!40000 ALTER TABLE `sipuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `sipuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soaplogin`
--

DROP TABLE IF EXISTS `soaplogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soaplogin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `allow_recording` bit(1) DEFAULT NULL,
  `allow_same_url_multiple_times` bit(1) DEFAULT NULL,
  `becomemoderator` bit(1) DEFAULT NULL,
  `client_url` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `landing_zone` varchar(255) DEFAULT NULL,
  `recording_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `session_hash` varchar(255) DEFAULT NULL,
  `showaudiovideotest` bit(1) DEFAULT NULL,
  `show_nick_name_dialog` bit(1) DEFAULT NULL,
  `use_date` datetime DEFAULT NULL,
  `used` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soaplogin`
--

LOCK TABLES `soaplogin` WRITE;
/*!40000 ALTER TABLE `soaplogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `soaplogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `shortName` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,4,'\0','2016-07-13 23:18:03','Afghanistan','AFG',NULL),(2,248,'\0','2016-07-13 23:18:03','Åland Islands','ALA',NULL),(3,8,'\0','2016-07-13 23:18:03','Albania','ALB',NULL),(4,12,'\0','2016-07-13 23:18:04','Algeria','DZA',NULL),(5,16,'\0','2016-07-13 23:18:04','American Samoa','ASM',NULL),(6,20,'\0','2016-07-13 23:18:04','Andorra','AND',NULL),(7,24,'\0','2016-07-13 23:18:04','Angola','AGO',NULL),(8,660,'\0','2016-07-13 23:18:04','Anguilla','AIA',NULL),(9,28,'\0','2016-07-13 23:18:04','Antigua and Barbuda','ATG',NULL),(10,32,'\0','2016-07-13 23:18:04','Argentina','ARG',NULL),(11,51,'\0','2016-07-13 23:18:04','Armenia','ARM',NULL),(12,533,'\0','2016-07-13 23:18:04','Aruba','ABW',NULL),(13,36,'\0','2016-07-13 23:18:04','Australia','AUS',NULL),(14,40,'\0','2016-07-13 23:18:04','Austria','AUT',NULL),(15,31,'\0','2016-07-13 23:18:04','Azerbaijan','AZE',NULL),(16,44,'\0','2016-07-13 23:18:04','Bahamas','BHS',NULL),(17,48,'\0','2016-07-13 23:18:04','Bahrain','BHR',NULL),(18,50,'\0','2016-07-13 23:18:04','Bangladesh','BGD',NULL),(19,52,'\0','2016-07-13 23:18:04','Barbados','BRB',NULL),(20,112,'\0','2016-07-13 23:18:04','Belarus','BLR',NULL),(21,56,'\0','2016-07-13 23:18:04','Belgium','BEL',NULL),(22,84,'\0','2016-07-13 23:18:04','Belize','BLZ',NULL),(23,204,'\0','2016-07-13 23:18:04','Benin','BEN',NULL),(24,60,'\0','2016-07-13 23:18:04','Bermuda','BMU',NULL),(25,64,'\0','2016-07-13 23:18:04','Bhutan','BTN',NULL),(26,68,'\0','2016-07-13 23:18:04','Bolivia','BOL',NULL),(27,70,'\0','2016-07-13 23:18:04','Bosnia and Herzegovina','BIH',NULL),(28,72,'\0','2016-07-13 23:18:04','Botswana','BWA',NULL),(29,76,'\0','2016-07-13 23:18:04','Brazil','BRA',NULL),(30,92,'\0','2016-07-13 23:18:04','British Virgin Islands','VGB',NULL),(31,96,'\0','2016-07-13 23:18:04','Brunei Darussalam','BRN',NULL),(32,100,'\0','2016-07-13 23:18:04','Bulgaria','BGR',NULL),(33,854,'\0','2016-07-13 23:18:04','Burkina Faso','BFA',NULL),(34,108,'\0','2016-07-13 23:18:04','Burundi','BDI',NULL),(35,116,'\0','2016-07-13 23:18:04','Cambodia','KHM',NULL),(36,120,'\0','2016-07-13 23:18:04','Cameroon','CMR',NULL),(37,124,'\0','2016-07-13 23:18:04','Canada','CAN',NULL),(38,132,'\0','2016-07-13 23:18:04','Cape Verde','CPV',NULL),(39,136,'\0','2016-07-13 23:18:04','Cayman Islands','CYM',NULL),(40,140,'\0','2016-07-13 23:18:04','Central African Republic','CAF',NULL),(41,148,'\0','2016-07-13 23:18:04','Chad','TCD',NULL),(42,830,'\0','2016-07-13 23:18:04','Channel Islands','',NULL),(43,152,'\0','2016-07-13 23:18:04','Chile','CHL',NULL),(44,156,'\0','2016-07-13 23:18:04','China','CHN',NULL),(45,344,'\0','2016-07-13 23:18:04','Hong Kong Special Administrative Region of China','HKG',NULL),(46,446,'\0','2016-07-13 23:18:04','Macao Special Administrative Region of China','MAC',NULL),(47,170,'\0','2016-07-13 23:18:04','Colombia','COL',NULL),(48,174,'\0','2016-07-13 23:18:04','Comoros','COM',NULL),(49,178,'\0','2016-07-13 23:18:04','Congo','COG',NULL),(50,184,'\0','2016-07-13 23:18:04','Cook Islands','COK',NULL),(51,188,'\0','2016-07-13 23:18:04','Costa Rica','CRI',NULL),(52,384,'\0','2016-07-13 23:18:04','Côte d\'Ivoire','CIV',NULL),(53,191,'\0','2016-07-13 23:18:04','Croatia','HRV',NULL),(54,192,'\0','2016-07-13 23:18:04','Cuba','CUB',NULL),(55,196,'\0','2016-07-13 23:18:04','Cyprus','CYP',NULL),(56,203,'\0','2016-07-13 23:18:04','Czech Republic','CZE',NULL),(57,408,'\0','2016-07-13 23:18:04','Democratic People\'s Republic of Korea','PRK',NULL),(58,180,'\0','2016-07-13 23:18:04','Democratic Republic of the Congo','COD',NULL),(59,208,'\0','2016-07-13 23:18:04','Denmark','DNK',NULL),(60,262,'\0','2016-07-13 23:18:04','Djibouti','DJI',NULL),(61,212,'\0','2016-07-13 23:18:04','Dominica','DMA',NULL),(62,214,'\0','2016-07-13 23:18:04','Dominican Republic','DOM',NULL),(63,218,'\0','2016-07-13 23:18:04','Ecuador','ECU',NULL),(64,818,'\0','2016-07-13 23:18:04','Egypt','EGY',NULL),(65,222,'\0','2016-07-13 23:18:04','El Salvador','SLV',NULL),(66,226,'\0','2016-07-13 23:18:04','Equatorial Guinea','GNQ',NULL),(67,232,'\0','2016-07-13 23:18:04','Eritrea','ERI',NULL),(68,233,'\0','2016-07-13 23:18:04','Estonia','EST',NULL),(69,231,'\0','2016-07-13 23:18:04','Ethiopia','ETH',NULL),(70,234,'\0','2016-07-13 23:18:04','Faeroe Islands','FRO',NULL),(71,238,'\0','2016-07-13 23:18:04','Falkland Islands (Malvinas)','FLK',NULL),(72,242,'\0','2016-07-13 23:18:04','Fiji','FJI',NULL),(73,246,'\0','2016-07-13 23:18:04','Finland','FIN',NULL),(74,250,'\0','2016-07-13 23:18:04','France','FRA',NULL),(75,254,'\0','2016-07-13 23:18:04','French Guiana','GUF',NULL),(76,258,'\0','2016-07-13 23:18:04','French Polynesia','PYF',NULL),(77,266,'\0','2016-07-13 23:18:04','Gabon','GAB',NULL),(78,270,'\0','2016-07-13 23:18:04','Gambia','GMB',NULL),(79,268,'\0','2016-07-13 23:18:04','Georgia','GEO',NULL),(80,276,'\0','2016-07-13 23:18:04','Germany','DEU',NULL),(81,288,'\0','2016-07-13 23:18:04','Ghana','GHA',NULL),(82,292,'\0','2016-07-13 23:18:04','Gibraltar','GIB',NULL),(83,300,'\0','2016-07-13 23:18:04','Greece','GRC',NULL),(84,304,'\0','2016-07-13 23:18:04','Greenland','GRL',NULL),(85,308,'\0','2016-07-13 23:18:04','Grenada','GRD',NULL),(86,312,'\0','2016-07-13 23:18:04','Guadeloupe','GLP',NULL),(87,316,'\0','2016-07-13 23:18:04','Guam','GUM',NULL),(88,320,'\0','2016-07-13 23:18:04','Guatemala','GTM',NULL),(89,831,'\0','2016-07-13 23:18:04','Guernsey','CGY',NULL),(90,324,'\0','2016-07-13 23:18:04','Guinea','GIN',NULL),(91,624,'\0','2016-07-13 23:18:04','Guinea-Bissau','GNB',NULL),(92,328,'\0','2016-07-13 23:18:04','Guyana','GUY',NULL),(93,332,'\0','2016-07-13 23:18:04','Haiti','HTI',NULL),(94,336,'\0','2016-07-13 23:18:04','Holy See','VAT',NULL),(95,340,'\0','2016-07-13 23:18:04','Honduras','HND',NULL),(96,348,'\0','2016-07-13 23:18:04','Hungary','HUN',NULL),(97,352,'\0','2016-07-13 23:18:04','Iceland','ISL',NULL),(98,356,'\0','2016-07-13 23:18:04','India','IND',NULL),(99,360,'\0','2016-07-13 23:18:04','Indonesia','IDN',NULL),(100,364,'\0','2016-07-13 23:18:04','Iran, Islamic Republic of','IRN',NULL),(101,368,'\0','2016-07-13 23:18:04','Iraq','IRQ',NULL),(102,372,'\0','2016-07-13 23:18:04','Ireland','IRL',NULL),(103,833,'\0','2016-07-13 23:18:04','Isle of Man','IMN',NULL),(104,376,'\0','2016-07-13 23:18:04','Israel','ISR',NULL),(105,380,'\0','2016-07-13 23:18:04','Italy','ITA',NULL),(106,388,'\0','2016-07-13 23:18:04','Jamaica','JAM',NULL),(107,392,'\0','2016-07-13 23:18:04','Japan','JPN',NULL),(108,832,'\0','2016-07-13 23:18:04','Jersey','JEY',NULL),(109,400,'\0','2016-07-13 23:18:04','Jordan','JOR',NULL),(110,398,'\0','2016-07-13 23:18:04','Kazakhstan','KAZ',NULL),(111,404,'\0','2016-07-13 23:18:05','Kenya','KEN',NULL),(112,296,'\0','2016-07-13 23:18:05','Kiribati','KIR',NULL),(113,414,'\0','2016-07-13 23:18:05','Kuwait','KWT',NULL),(114,417,'\0','2016-07-13 23:18:05','Kyrgyzstan','KGZ',NULL),(115,418,'\0','2016-07-13 23:18:05','Lao People\'s Democratic Republic','LAO',NULL),(116,428,'\0','2016-07-13 23:18:05','Latvia','LVA',NULL),(117,422,'\0','2016-07-13 23:18:05','Lebanon','LBN',NULL),(118,426,'\0','2016-07-13 23:18:05','Lesotho','LSO',NULL),(119,430,'\0','2016-07-13 23:18:05','Liberia','LBR',NULL),(120,434,'\0','2016-07-13 23:18:05','Libyan Arab Jamahiriya','LBY',NULL),(121,438,'\0','2016-07-13 23:18:05','Liechtenstein','LIE',NULL),(122,440,'\0','2016-07-13 23:18:05','Lithuania','LTU',NULL),(123,442,'\0','2016-07-13 23:18:05','Luxembourg','LUX',NULL),(124,450,'\0','2016-07-13 23:18:05','Madagascar','MDG',NULL),(125,454,'\0','2016-07-13 23:18:05','Malawi','MWI',NULL),(126,458,'\0','2016-07-13 23:18:05','Malaysia','MYS',NULL),(127,462,'\0','2016-07-13 23:18:05','Maldives','MDV',NULL),(128,466,'\0','2016-07-13 23:18:05','Mali','MLI',NULL),(129,470,'\0','2016-07-13 23:18:05','Malta','MLT',NULL),(130,584,'\0','2016-07-13 23:18:05','Marshall Islands','MHL',NULL),(131,474,'\0','2016-07-13 23:18:05','Martinique','MTQ',NULL),(132,478,'\0','2016-07-13 23:18:05','Mauritania','MRT',NULL),(133,480,'\0','2016-07-13 23:18:05','Mauritius','MUS',NULL),(134,175,'\0','2016-07-13 23:18:05','Mayotte','MYT',NULL),(135,484,'\0','2016-07-13 23:18:05','Mexico','MEX',NULL),(136,583,'\0','2016-07-13 23:18:05','Micronesia, Federated States of','FSM',NULL),(137,492,'\0','2016-07-13 23:18:05','Monaco','MCO',NULL),(138,496,'\0','2016-07-13 23:18:05','Mongolia','MNG',NULL),(139,499,'\0','2016-07-13 23:18:05','Montenegro','MNE',NULL),(140,500,'\0','2016-07-13 23:18:05','Montserrat','MSR',NULL),(141,504,'\0','2016-07-13 23:18:05','Morocco','MAR',NULL),(142,508,'\0','2016-07-13 23:18:05','Mozambique','MOZ',NULL),(143,104,'\0','2016-07-13 23:18:05','Myanmar','MMR',NULL),(144,516,'\0','2016-07-13 23:18:05','Namibia','NAM',NULL),(145,520,'\0','2016-07-13 23:18:05','Nauru','NRU',NULL),(146,524,'\0','2016-07-13 23:18:05','Nepal','NPL',NULL),(147,528,'\0','2016-07-13 23:18:05','Netherlands','NLD',NULL),(148,530,'\0','2016-07-13 23:18:05','Netherlands Antilles','ANT',NULL),(149,540,'\0','2016-07-13 23:18:05','New Caledonia','NCL',NULL),(150,554,'\0','2016-07-13 23:18:05','New Zealand','NZL',NULL),(151,558,'\0','2016-07-13 23:18:05','Nicaragua','NIC',NULL),(152,562,'\0','2016-07-13 23:18:05','Niger','NER',NULL),(153,566,'\0','2016-07-13 23:18:05','Nigeria','NGA',NULL),(154,570,'\0','2016-07-13 23:18:05','Niue','NIU',NULL),(155,574,'\0','2016-07-13 23:18:05','Norfolk Island','NFK',NULL),(156,580,'\0','2016-07-13 23:18:05','Northern Mariana Islands','MNP',NULL),(157,578,'\0','2016-07-13 23:18:05','Norway','NOR',NULL),(158,275,'\0','2016-07-13 23:18:05','Occupied Palestinian Territory','PSE',NULL),(159,512,'\0','2016-07-13 23:18:05','Oman','OMN',NULL),(160,586,'\0','2016-07-13 23:18:05','Pakistan','PAK',NULL),(161,585,'\0','2016-07-13 23:18:05','Palau','PLW',NULL),(162,591,'\0','2016-07-13 23:18:05','Panama','PAN',NULL),(163,598,'\0','2016-07-13 23:18:05','Papua New Guinea','PNG',NULL),(164,600,'\0','2016-07-13 23:18:05','Paraguay','PRY',NULL),(165,604,'\0','2016-07-13 23:18:05','Peru','PER',NULL),(166,608,'\0','2016-07-13 23:18:05','Philippines','PHL',NULL),(167,612,'\0','2016-07-13 23:18:05','Pitcairn','PCN',NULL),(168,616,'\0','2016-07-13 23:18:05','Poland','POL',NULL),(169,620,'\0','2016-07-13 23:18:05','Portugal','PRT',NULL),(170,630,'\0','2016-07-13 23:18:05','Puerto Rico','PRI',NULL),(171,634,'\0','2016-07-13 23:18:05','Qatar','QAT',NULL),(172,410,'\0','2016-07-13 23:18:05','Republic of Korea','KOR',NULL),(173,498,'\0','2016-07-13 23:18:05','Republic of Moldova','MDA',NULL),(174,638,'\0','2016-07-13 23:18:05','Réunion','REU',NULL),(175,642,'\0','2016-07-13 23:18:05','Romania','ROU',NULL),(176,643,'\0','2016-07-13 23:18:05','Russian Federation','RUS',NULL),(177,646,'\0','2016-07-13 23:18:05','Rwanda','RWA',NULL),(178,654,'\0','2016-07-13 23:18:05','Saint Helena','SHN',NULL),(179,659,'\0','2016-07-13 23:18:05','Saint Kitts and Nevis','KNA',NULL),(180,662,'\0','2016-07-13 23:18:05','Saint Lucia','LCA',NULL),(181,666,'\0','2016-07-13 23:18:05','Saint Pierre and Miquelon','SPM',NULL),(182,670,'\0','2016-07-13 23:18:05','Saint Vincent and the Grenadines','VCT',NULL),(183,882,'\0','2016-07-13 23:18:05','Samoa','WSM',NULL),(184,674,'\0','2016-07-13 23:18:05','San Marino','SMR',NULL),(185,678,'\0','2016-07-13 23:18:05','Sao Tome and Principe','STP',NULL),(186,682,'\0','2016-07-13 23:18:05','Saudi Arabia','SAU',NULL),(187,686,'\0','2016-07-13 23:18:05','Senegal','SEN',NULL),(188,688,'\0','2016-07-13 23:18:05','Serbia','SRB',NULL),(189,690,'\0','2016-07-13 23:18:05','Seychelles','SYC',NULL),(190,694,'\0','2016-07-13 23:18:05','Sierra Leone','SLE',NULL),(191,702,'\0','2016-07-13 23:18:05','Singapore','SGP',NULL),(192,703,'\0','2016-07-13 23:18:05','Slovakia','SVK',NULL),(193,705,'\0','2016-07-13 23:18:05','Slovenia','SVN',NULL),(194,90,'\0','2016-07-13 23:18:05','Solomon Islands','SLB',NULL),(195,706,'\0','2016-07-13 23:18:05','Somalia','SOM',NULL),(196,710,'\0','2016-07-13 23:18:05','South Africa','ZAF',NULL),(197,724,'\0','2016-07-13 23:18:05','Spain','ESP',NULL),(198,144,'\0','2016-07-13 23:18:05','Sri Lanka','LKA',NULL),(199,736,'\0','2016-07-13 23:18:05','Sudan','SDN',NULL),(200,740,'\0','2016-07-13 23:18:05','Suriname','SUR',NULL),(201,744,'\0','2016-07-13 23:18:05','Svalbard and Jan Mayen Islands','SJM',NULL),(202,748,'\0','2016-07-13 23:18:05','Swaziland','SWZ',NULL),(203,752,'\0','2016-07-13 23:18:05','Sweden','SWE',NULL),(204,756,'\0','2016-07-13 23:18:05','Switzerland','CHE',NULL),(205,760,'\0','2016-07-13 23:18:05','Syrian Arab Republic','SYR',NULL),(206,157,'\0','2016-07-13 23:18:05','Taiwan, Republic of China','ROC',NULL),(207,762,'\0','2016-07-13 23:18:05','Tajikistan','TJK',NULL),(208,764,'\0','2016-07-13 23:18:05','Thailand','THA',NULL),(209,807,'\0','2016-07-13 23:18:05','The former Yugoslav Republic of Macedonia','MKD',NULL),(210,626,'\0','2016-07-13 23:18:05','Timor-Leste','TLS',NULL),(211,768,'\0','2016-07-13 23:18:05','Togo','TGO',NULL),(212,772,'\0','2016-07-13 23:18:05','Tokelau','TKL',NULL),(213,776,'\0','2016-07-13 23:18:05','Tonga','TON',NULL),(214,780,'\0','2016-07-13 23:18:05','Trinidad and Tobago','TTO',NULL),(215,788,'\0','2016-07-13 23:18:05','Tunisia','TUN',NULL),(216,792,'\0','2016-07-13 23:18:05','Turkey','TUR',NULL),(217,795,'\0','2016-07-13 23:18:05','Turkmenistan','TKM',NULL),(218,796,'\0','2016-07-13 23:18:05','Turks and Caicos Islands','TCA',NULL),(219,798,'\0','2016-07-13 23:18:05','Tuvalu','TUV',NULL),(220,800,'\0','2016-07-13 23:18:05','Uganda','UGA',NULL),(221,804,'\0','2016-07-13 23:18:05','Ukraine','UKR',NULL),(222,784,'\0','2016-07-13 23:18:05','United Arab Emirates','ARE',NULL),(223,826,'\0','2016-07-13 23:18:06','United Kingdom of Great Britain and Northern Ireland','GBR',NULL),(224,834,'\0','2016-07-13 23:18:06','United Republic of Tanzania','TZA',NULL),(225,840,'\0','2016-07-13 23:18:06','United States of America','USA',NULL),(226,850,'\0','2016-07-13 23:18:06','United States Virgin Islands','VIR',NULL),(227,858,'\0','2016-07-13 23:18:06','Uruguay','URY',NULL),(228,860,'\0','2016-07-13 23:18:06','Uzbekistan','UZB',NULL),(229,548,'\0','2016-07-13 23:18:06','Vanuatu','VUT',NULL),(230,862,'\0','2016-07-13 23:18:06','Venezuela (Bolivarian Republic of)','VEN',NULL),(231,704,'\0','2016-07-13 23:18:06','Viet Nam','VNM',NULL),(232,876,'\0','2016-07-13 23:18:06','Wallis and Futuna Islands','WLF',NULL),(233,732,'\0','2016-07-13 23:18:06','Western Sahara','ESH',NULL),(234,887,'\0','2016-07-13 23:18:06','Yemen','YEM',NULL),(235,894,'\0','2016-07-13 23:18:06','Zambia','ZMB',NULL),(236,716,'\0','2016-07-13 23:18:06','Zimbabwe','ZWE',NULL);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_contact`
--

DROP TABLE IF EXISTS `user_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_contact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inserted` datetime DEFAULT NULL,
  `pending` bit(1) DEFAULT NULL,
  `share_calendar` bit(1) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_SR_CTCT_CONTACT` (`user_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `user_contact_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_contact`
--

LOCK TABLES `user_contact` WRITE;
/*!40000 ALTER TABLE `user_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_data`
--

DROP TABLE IF EXISTS `user_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` text,
  `data` varchar(255) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `data_key` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_data`
--

LOCK TABLES `user_data` WRITE;
/*!40000 ALTER TABLE `user_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whiteboard`
--

DROP TABLE IF EXISTS `whiteboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whiteboard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `full_fit` bit(1) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `zoom` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whiteboard`
--

LOCK TABLES `whiteboard` WRITE;
/*!40000 ALTER TABLE `whiteboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `whiteboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whiteboard_item`
--

DROP TABLE IF EXISTS `whiteboard_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whiteboard_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyx` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `whiteboarditem_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whiteboard_item`
--

LOCK TABLES `whiteboard_item` WRITE;
/*!40000 ALTER TABLE `whiteboard_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `whiteboard_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'openmeetings_db'
--

--
-- Current Database: `phpcron`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phpcron` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `phpcron`;

--
-- Dumping events for database 'phpcron'
--

--
-- Current Database: `phpmyadmin`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phpmyadmin` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `phpmyadmin`;

--
-- Table structure for table `pma_bookmark`
--

DROP TABLE IF EXISTS `pma_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pma_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma_bookmark`
--

LOCK TABLES `pma_bookmark` WRITE;
/*!40000 ALTER TABLE `pma_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma_column_info`
--

DROP TABLE IF EXISTS `pma_column_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pma_column_info` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma_column_info`
--

LOCK TABLES `pma_column_info` WRITE;
/*!40000 ALTER TABLE `pma_column_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_column_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma_designer_coords`
--

DROP TABLE IF EXISTS `pma_designer_coords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pma_designer_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `v` tinyint(4) DEFAULT NULL,
  `h` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for Designer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma_designer_coords`
--

LOCK TABLES `pma_designer_coords` WRITE;
/*!40000 ALTER TABLE `pma_designer_coords` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_designer_coords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma_history`
--

DROP TABLE IF EXISTS `pma_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pma_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`,`db`,`table`,`timevalue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma_history`
--

LOCK TABLES `pma_history` WRITE;
/*!40000 ALTER TABLE `pma_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma_pdf_pages`
--

DROP TABLE IF EXISTS `pma_pdf_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pma_pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`page_nr`),
  KEY `db_name` (`db_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma_pdf_pages`
--

LOCK TABLES `pma_pdf_pages` WRITE;
/*!40000 ALTER TABLE `pma_pdf_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_pdf_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma_recent`
--

DROP TABLE IF EXISTS `pma_recent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pma_recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma_recent`
--

LOCK TABLES `pma_recent` WRITE;
/*!40000 ALTER TABLE `pma_recent` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_recent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma_relation`
--

DROP TABLE IF EXISTS `pma_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pma_relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  KEY `foreign_field` (`foreign_db`,`foreign_table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma_relation`
--

LOCK TABLES `pma_relation` WRITE;
/*!40000 ALTER TABLE `pma_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma_table_coords`
--

DROP TABLE IF EXISTS `pma_table_coords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pma_table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float unsigned NOT NULL DEFAULT '0',
  `y` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma_table_coords`
--

LOCK TABLES `pma_table_coords` WRITE;
/*!40000 ALTER TABLE `pma_table_coords` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_table_coords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma_table_info`
--

DROP TABLE IF EXISTS `pma_table_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pma_table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma_table_info`
--

LOCK TABLES `pma_table_info` WRITE;
/*!40000 ALTER TABLE `pma_table_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_table_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma_table_uiprefs`
--

DROP TABLE IF EXISTS `pma_table_uiprefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pma_table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`,`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma_table_uiprefs`
--

LOCK TABLES `pma_table_uiprefs` WRITE;
/*!40000 ALTER TABLE `pma_table_uiprefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_table_uiprefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma_tracking`
--

DROP TABLE IF EXISTS `pma_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pma_tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`db_name`,`table_name`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='Database changes tracking for phpMyAdmin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma_tracking`
--

LOCK TABLES `pma_tracking` WRITE;
/*!40000 ALTER TABLE `pma_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma_userconfig`
--

DROP TABLE IF EXISTS `pma_userconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pma_userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma_userconfig`
--

LOCK TABLES `pma_userconfig` WRITE;
/*!40000 ALTER TABLE `pma_userconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_userconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'phpmyadmin'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-15 20:58:48