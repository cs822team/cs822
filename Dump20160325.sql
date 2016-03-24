CREATE DATABASE  IF NOT EXISTS `SUW` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `SUW`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: SUW
-- ------------------------------------------------------
-- Server version	5.7.11

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `question_id` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `body` blob,
  `creation_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_count` int(5) DEFAULT NULL,
  `illegal` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  `text` blob,
  `creation_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `answer_id` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `illegal` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `score` int(5) DEFAULT NULL,
  `acept_answer_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `body` blob,
  `creation_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_count` int(9) DEFAULT NULL,
  `answer_count` int(5) DEFAULT NULL,
  `illegal` int(1) DEFAULT NULL,
  `tags` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `tag_id` varchar(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) DEFAULT NULL,
  `name` char(20) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_question`
--

DROP TABLE IF EXISTS `tag_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_question` (
  `id` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `question_id` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_question`
--

LOCK TABLES `tag_question` WRITE;
/*!40000 ALTER TABLE `tag_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) DEFAULT NULL COMMENT 'user’s id, to recognize the user',
  `reputation` int(11) DEFAULT '0' COMMENT 'Get reputation from report some illegal answers, questions or comments',
  `reputation_by_report` int(11) DEFAULT '0',
  `reputation_by_answer` int(11) DEFAULT '0',
  `display_name` char(20) COLLATE utf8_bin DEFAULT NULL,
  `location` char(100) COLLATE utf8_bin DEFAULT NULL,
  `view` int(11) DEFAULT '0',
  `up_vote` int(11) DEFAULT '0',
  `down_vote` int(11) DEFAULT '0',
  `age` int(11) DEFAULT '0',
  `accept_answer_count` int(11) DEFAULT '0',
  `tags` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `tag_id` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `creation_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-25 10:28:04
