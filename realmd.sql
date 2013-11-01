-- MySQL dump 10.13  Distrib 5.6.13, for Win64 (x86_64)
--
-- Host: localhost    Database: 300m_realmd
-- ------------------------------------------------------
-- Server version	5.6.13-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `gmlevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sessionkey` varchar(81) DEFAULT NULL,
  `v` varchar(65) DEFAULT NULL,
  `s` varchar(65) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `local_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `failed_logins` int(11) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active_realm_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '24',
  `mutetime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '8',
  `os` varchar(4) NOT NULL DEFAULT '',
  `recruiter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`) USING BTREE,
  KEY `idx_gmlevel` (`gmlevel`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=382126713 DEFAULT CHARSET=utf8 COMMENT='Account System';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`7z`@`46.242.67.9`*/ /*!50003 TRIGGER gmlevel BEFORE UPDATE
  ON account FOR EACH ROW 
BEGIN
 IF (NEW.gmlevel <> OLD.gmlevel) THEN
  INSERT INTO mysql.`trigger_account` (acc, gmlevel, gmlevel_old, user) 
	VALUES (NEW.id, NEW.gmlevel, OLD.gmlevel, USER());

  
  
  

 END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`7z`@`46.242.67.9`*/ /*!50003 TRIGGER `account_log` AFTER UPDATE ON `account`
FOR EACH ROW BEGIN
	IF (NEW.`online` = 1) then
		INSERT INTO `account_log` (acct, last_ip, local_ip, time) VALUES (OLD.id, OLD.last_ip, OLD.local_ip, NOW());
	ELSE
		UPDATE `account_log` SET session_end = NOW() WHERE acct = OLD.id ORDER BY id DESC LIMIT 1;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `account_banned`
--

DROP TABLE IF EXISTS `account_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_banned` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` bigint(40) NOT NULL DEFAULT '0',
  `unbandate` bigint(40) NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Ban List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_friends`
--

DROP TABLE IF EXISTS `account_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_friends` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `friend_id` int(11) unsigned NOT NULL DEFAULT '0',
  `bind_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Bring date',
  `expire_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Expire date',
  PRIMARY KEY (`id`,`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores accounts for refer-a-friend system.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_log`
--

DROP TABLE IF EXISTS `account_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acct` bigint(20) DEFAULT NULL,
  `last_ip` varchar(15) DEFAULT NULL,
  `local_ip` varchar(15) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `session_end` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_premium`
--

DROP TABLE IF EXISTS `account_premium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_premium` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Account id',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `rateType` tinyint(4) NOT NULL DEFAULT '0',
  `active` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Premium Account List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anticheat_config`
--

DROP TABLE IF EXISTS `anticheat_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anticheat_config` (
  `checktype` mediumint(8) unsigned NOT NULL COMMENT 'Type of check',
  `description` varchar(255) DEFAULT NULL,
  `check_period` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Time period of check, in ms, 0 - always',
  `alarmscount` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'Count of alarms before action',
  `disableoperation` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Anticheat disable operations in main core code after check fail',
  `messagenum` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of system message',
  `intparam1` mediumint(8) NOT NULL DEFAULT '0' COMMENT 'Int parameter 1',
  `intparam2` mediumint(8) NOT NULL DEFAULT '0' COMMENT 'Int parameter 2',
  `floatparam1` float NOT NULL DEFAULT '0' COMMENT 'Float parameter 1',
  `floatparam2` float NOT NULL DEFAULT '0' COMMENT 'Float parameter 2',
  `action1` mediumint(8) NOT NULL DEFAULT '0' COMMENT 'Action 1',
  `actionparam1` mediumint(8) NOT NULL DEFAULT '0' COMMENT 'Action parameter 1',
  `action2` mediumint(8) NOT NULL DEFAULT '0' COMMENT 'Action 1',
  `actionparam2` mediumint(8) NOT NULL DEFAULT '0' COMMENT 'Action parameter 1',
  `disabledzones` varchar(255) NOT NULL DEFAULT '' COMMENT 'List of zones, in which check disabled.',
  PRIMARY KEY (`checktype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Anticheat configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_GM_nick` varchar(32) NOT NULL DEFAULT '',
  `c_description` text NOT NULL,
  `c_pic_1` varchar(255) DEFAULT NULL,
  `c_pic_2` varchar(255) DEFAULT NULL,
  `c_pic_3` varchar(255) DEFAULT NULL,
  `c_user` varchar(32) NOT NULL DEFAULT '',
  `c_status` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `c_id` (`c_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=956 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crashreport_logs`
--

DROP TABLE IF EXISTS `crashreport_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crashreport_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `crash_reason` varchar(255) NOT NULL DEFAULT 'Unknown',
  `crashreport_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Crashreport log table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gdb_callstacks`
--

DROP TABLE IF EXISTS `gdb_callstacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdb_callstacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` tinyint(4) NOT NULL COMMENT 'realm id',
  `callstack` text NOT NULL,
  `ret` int(11) NOT NULL COMMENT 'return code',
  `version` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `time` (`time`) USING BTREE,
  KEY `rid` (`rid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=143456 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ip_banned`
--

DROP TABLE IF EXISTS `ip_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_banned` (
  `ip` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `bandate` bigint(40) NOT NULL,
  `unbandate` bigint(40) NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Banned IPs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `realmcharacters`
--

DROP TABLE IF EXISTS `realmcharacters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmcharacters` (
  `realmid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `acctid` int(11) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `realmd_db_version`
--

DROP TABLE IF EXISTS `realmd_db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmd_db_version` (
  `required_10008_01_realmd_realmd_db_version` bit(1) DEFAULT NULL,
  `required_9010_01_realmd_realmlist` bit(1) DEFAULT NULL,
  `required_12112_01_realmd_account_access` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Last applied sql update to DB';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `realmlist`
--

DROP TABLE IF EXISTS `realmlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmlist` (
  `color` tinyint(3) NOT NULL DEFAULT '2',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(32) NOT NULL DEFAULT '127.0.0.1',
  `port` int(11) NOT NULL DEFAULT '8085',
  `db` varchar(20) NOT NULL,
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `realmflags` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT 'Supported masks: 0x1 (invalid, not show in realm list), 0x2 (offline, set by mangosd), 0x4 (show version and build), 0x20 (new players), 0x40 (recommended)',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `realmbuilds` varchar(64) NOT NULL DEFAULT '',
  `gamebuild` int(10) unsigned NOT NULL DEFAULT '12340',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `uptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `textinfo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='Realm System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realmlist` varchar(100) DEFAULT NULL,
  `realm` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `guid` varchar(30) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `account` bigint(20) DEFAULT NULL,
  `dump` longtext,
  `comment_dev` varchar(50) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `hash` varchar(50) DEFAULT NULL,
  `cryptkey` varchar(50) DEFAULT NULL,
  `server_dump` longtext,
  `server_realmid` int(11) DEFAULT NULL,
  `restored` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `final_guid` int(11) DEFAULT '0',
  `transferer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transfer_change_items`
--

DROP TABLE IF EXISTS `transfer_change_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_change_items` (
  `from` int(3) NOT NULL DEFAULT '0',
  `to` int(3) DEFAULT NULL,
  `achievement` int(3) DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uptime`
--

DROP TABLE IF EXISTS `uptime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uptime` (
  `realmid` int(11) unsigned NOT NULL,
  `starttime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `startstring` varchar(64) NOT NULL DEFAULT '',
  `uptime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Uptime system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `warden_data_result`
--

DROP TABLE IF EXISTS `warden_data_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warden_data_result` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `check` int(3) DEFAULT NULL,
  `data` tinytext,
  `str` tinytext,
  `address` int(8) DEFAULT NULL,
  `length` int(2) DEFAULT NULL,
  `result` tinytext,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='Warden data checks';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-01 21:49:17
