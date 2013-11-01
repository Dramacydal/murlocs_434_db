-- MySQL dump 10.13  Distrib 5.6.13, for Win64 (x86_64)
--
-- Host: localhost    Database: 300m_char
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
-- Table structure for table `account_data`
--

DROP TABLE IF EXISTS `account_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_data` (
  `account` int(11) unsigned NOT NULL DEFAULT '0',
  `type` int(11) unsigned NOT NULL DEFAULT '0',
  `time` bigint(11) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  PRIMARY KEY (`account`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_forcepermission`
--

DROP TABLE IF EXISTS `account_forcepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_forcepermission` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `security` int(3) unsigned DEFAULT '0',
  `comment` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anticheat_log`
--

DROP TABLE IF EXISTS `anticheat_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anticheat_log` (
  `entry` bigint(20) NOT NULL AUTO_INCREMENT,
  `acctid` int(11) NOT NULL,
  `guid` int(11) unsigned NOT NULL,
  `playername` varchar(32) NOT NULL,
  `checktype` mediumint(8) unsigned NOT NULL,
  `alarm_time` datetime NOT NULL,
  `action1` mediumint(8) NOT NULL DEFAULT '0',
  `action2` mediumint(8) NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT 'Unknown',
  `Map` smallint(5) NOT NULL DEFAULT '-1',
  `Pos` varchar(255) NOT NULL DEFAULT '0',
  `Level` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`),
  KEY `idx_Player` (`guid`)
) ENGINE=MyISAM AUTO_INCREMENT=9248 DEFAULT CHARSET=utf8 COMMENT='Anticheat log table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arena_team`
--

DROP TABLE IF EXISTS `arena_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arena_team` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` char(255) NOT NULL,
  `captainguid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BackgroundColor` int(10) unsigned NOT NULL DEFAULT '0',
  `EmblemStyle` int(10) unsigned NOT NULL DEFAULT '0',
  `EmblemColor` int(10) unsigned NOT NULL DEFAULT '0',
  `BorderStyle` int(10) unsigned NOT NULL DEFAULT '0',
  `BorderColor` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenateamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arena_team_member`
--

DROP TABLE IF EXISTS `arena_team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arena_team_member` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT '0',
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `played_week` int(10) unsigned NOT NULL DEFAULT '0',
  `wons_week` int(10) unsigned NOT NULL DEFAULT '0',
  `played_season` int(10) unsigned NOT NULL DEFAULT '0',
  `wons_season` int(10) unsigned NOT NULL DEFAULT '0',
  `personal_rating` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenateamid`,`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arena_team_stats`
--

DROP TABLE IF EXISTS `arena_team_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arena_team_stats` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` int(10) unsigned NOT NULL DEFAULT '0',
  `games_week` int(10) unsigned NOT NULL DEFAULT '0',
  `wins_week` int(10) unsigned NOT NULL DEFAULT '0',
  `games_season` int(10) unsigned NOT NULL DEFAULT '0',
  `wins_season` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenateamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `armory_character_stats`
--

DROP TABLE IF EXISTS `armory_character_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `armory_character_stats` (
  `guid` int(11) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='World of Warcraft Armory table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `armory_game_chart`
--

DROP TABLE IF EXISTS `armory_game_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `armory_game_chart` (
  `gameid` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `changeType` int(11) NOT NULL,
  `ratingChange` int(11) NOT NULL,
  `teamRating` int(11) NOT NULL,
  `damageDone` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `healingDone` int(11) NOT NULL,
  `damageTaken` int(11) NOT NULL,
  `healingTaken` int(11) NOT NULL,
  `killingBlows` int(11) NOT NULL,
  `mapId` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `personalRating` int(11) NOT NULL,
  `ip` text,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`gameid`,`teamid`,`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='WoWArmory Game Chart';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auction` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `houseid` int(11) unsigned NOT NULL DEFAULT '0',
  `itemguid` int(11) unsigned NOT NULL DEFAULT '0',
  `item_template` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  `item_count` int(11) unsigned NOT NULL DEFAULT '0',
  `item_randompropertyid` int(11) NOT NULL DEFAULT '0',
  `itemowner` int(11) unsigned NOT NULL DEFAULT '0',
  `buyoutprice` bigint(40) NOT NULL DEFAULT '0',
  `time` bigint(40) unsigned NOT NULL DEFAULT '0',
  `moneyTime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `buyguid` int(11) unsigned NOT NULL DEFAULT '0',
  `lastbid` bigint(40) NOT NULL DEFAULT '0',
  `startbid` bigint(40) NOT NULL DEFAULT '0',
  `deposit` bigint(40) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auction_log`
--

DROP TABLE IF EXISTS `auction_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auction_log` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `seller` int(11) unsigned NOT NULL DEFAULT '0',
  `item` int(11) unsigned NOT NULL DEFAULT '0',
  `itemGuid` int(11) unsigned NOT NULL DEFAULT '0',
  `money` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Auction log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bugreport`
--

DROP TABLE IF EXISTS `bugreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` longtext NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Debug System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_account_data`
--

DROP TABLE IF EXISTS `character_account_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_account_data` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `type` int(11) unsigned NOT NULL DEFAULT '0',
  `time` bigint(11) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  PRIMARY KEY (`guid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_account_log`
--

DROP TABLE IF EXISTS `character_account_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_account_log` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `oldacc` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Old Account Identifier',
  `newacc` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'New Account Identifier',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Character transfer logs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_achievement`
--

DROP TABLE IF EXISTS `character_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_achievement` (
  `guid` int(11) unsigned NOT NULL,
  `achievement` int(11) unsigned NOT NULL,
  `date` bigint(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`achievement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_achievement_progress`
--

DROP TABLE IF EXISTS `character_achievement_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_achievement_progress` (
  `guid` int(11) unsigned NOT NULL,
  `criteria` int(11) unsigned NOT NULL,
  `counter` int(11) unsigned NOT NULL,
  `date` int(4) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_action`
--

DROP TABLE IF EXISTS `character_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_action` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `button` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action` int(11) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spec`,`button`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_archaeology`
--

DROP TABLE IF EXISTS `character_archaeology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_archaeology` (
  `guid` int(11) NOT NULL,
  `sites` text NOT NULL,
  `counts` text NOT NULL,
  `projects` text NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archaeology System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_archaeology_finds`
--

DROP TABLE IF EXISTS `character_archaeology_finds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_archaeology_finds` (
  `guid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`guid`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_aura`
--

DROP TABLE IF EXISTS `character_aura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_aura` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `spell` int(11) unsigned NOT NULL DEFAULT '0',
  `stackcount` int(11) unsigned NOT NULL DEFAULT '1',
  `remaincharges` int(11) unsigned NOT NULL DEFAULT '0',
  `basepoints0` int(11) NOT NULL DEFAULT '0',
  `basepoints1` int(11) NOT NULL DEFAULT '0',
  `basepoints2` int(11) NOT NULL DEFAULT '0',
  `periodictime0` int(11) unsigned NOT NULL DEFAULT '0',
  `periodictime1` int(11) unsigned NOT NULL DEFAULT '0',
  `periodictime2` int(11) unsigned NOT NULL DEFAULT '0',
  `maxduration` int(11) NOT NULL DEFAULT '0',
  `remaintime` int(11) NOT NULL DEFAULT '0',
  `effIndexMask` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`caster_guid`,`item_guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_banned`
--

DROP TABLE IF EXISTS `character_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_banned` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character guid',
  `bandate` bigint(40) NOT NULL DEFAULT '0',
  `unbandate` bigint(40) NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`bandate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Character Ban List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_battleground_data`
--

DROP TABLE IF EXISTS `character_battleground_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_battleground_data` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `instance_id` int(11) unsigned NOT NULL DEFAULT '0',
  `team` int(11) unsigned NOT NULL DEFAULT '0',
  `join_x` float NOT NULL DEFAULT '0',
  `join_y` float NOT NULL DEFAULT '0',
  `join_z` float NOT NULL DEFAULT '0',
  `join_o` float NOT NULL DEFAULT '0',
  `join_map` int(11) NOT NULL DEFAULT '0',
  `taxi_start` int(11) NOT NULL DEFAULT '0',
  `taxi_end` int(11) NOT NULL DEFAULT '0',
  `mount_spell` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_battleground_random`
--

DROP TABLE IF EXISTS `character_battleground_random`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_battleground_random` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_cuf_profiles`
--

DROP TABLE IF EXISTS `character_cuf_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_cuf_profiles` (
  `guid` int(10) unsigned NOT NULL COMMENT 'Character Guid',
  `id` tinyint(3) unsigned NOT NULL COMMENT 'Profile Id (0-4)',
  `name` varchar(12) NOT NULL COMMENT 'Profile Name',
  `frameHeight` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Frame Height',
  `frameWidth` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Frame Width',
  `sortBy` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Frame Sort By',
  `healthText` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Frame Health Text',
  `boolOptions` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Many Configurable Bool Options',
  `unk146` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Unk Int8',
  `unk147` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Unk Int8',
  `unk148` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Unk Int8',
  `unk150` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Unk Int16',
  `unk152` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Unk Int16',
  `unk154` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Unk Int16',
  PRIMARY KEY (`guid`,`id`),
  KEY `index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_currencies`
--

DROP TABLE IF EXISTS `character_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_currencies` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `totalCount` int(11) unsigned NOT NULL DEFAULT '0',
  `weekCount` int(11) unsigned NOT NULL DEFAULT '0',
  `seasonCount` int(11) unsigned NOT NULL DEFAULT '0',
  `customWeekCap` int(11) NOT NULL,
  `flags` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_db_version`
--

DROP TABLE IF EXISTS `character_db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_db_version` (
  `required_12447_02_characters_calendar_invites` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Last applied sql update to DB';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_declinedname`
--

DROP TABLE IF EXISTS `character_declinedname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_declinedname` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `genitive` varchar(15) NOT NULL DEFAULT '',
  `dative` varchar(15) NOT NULL DEFAULT '',
  `accusative` varchar(15) NOT NULL DEFAULT '',
  `instrumental` varchar(15) NOT NULL DEFAULT '',
  `prepositional` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_equipmentsets`
--

DROP TABLE IF EXISTS `character_equipmentsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_equipmentsets` (
  `guid` int(11) NOT NULL DEFAULT '0',
  `setguid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `setindex` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `iconname` varchar(100) NOT NULL,
  `ignore_mask` int(11) unsigned NOT NULL DEFAULT '0',
  `item0` int(11) unsigned NOT NULL DEFAULT '0',
  `item1` int(11) unsigned NOT NULL DEFAULT '0',
  `item2` int(11) unsigned NOT NULL DEFAULT '0',
  `item3` int(11) unsigned NOT NULL DEFAULT '0',
  `item4` int(11) unsigned NOT NULL DEFAULT '0',
  `item5` int(11) unsigned NOT NULL DEFAULT '0',
  `item6` int(11) unsigned NOT NULL DEFAULT '0',
  `item7` int(11) unsigned NOT NULL DEFAULT '0',
  `item8` int(11) unsigned NOT NULL DEFAULT '0',
  `item9` int(11) unsigned NOT NULL DEFAULT '0',
  `item10` int(11) unsigned NOT NULL DEFAULT '0',
  `item11` int(11) unsigned NOT NULL DEFAULT '0',
  `item12` int(11) unsigned NOT NULL DEFAULT '0',
  `item13` int(11) unsigned NOT NULL DEFAULT '0',
  `item14` int(11) unsigned NOT NULL DEFAULT '0',
  `item15` int(11) unsigned NOT NULL DEFAULT '0',
  `item16` int(11) unsigned NOT NULL DEFAULT '0',
  `item17` int(11) unsigned NOT NULL DEFAULT '0',
  `item18` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`setguid`),
  UNIQUE KEY `idx_set` (`guid`,`setguid`,`setindex`),
  KEY `Idx_setindex` (`setindex`)
) ENGINE=InnoDB AUTO_INCREMENT=4795 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_feed_log`
--

DROP TABLE IF EXISTS `character_feed_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_feed_log` (
  `guid` int(11) NOT NULL,
  `type` smallint(1) NOT NULL,
  `data` int(11) NOT NULL,
  `date` int(11) DEFAULT NULL,
  `counter` int(11) NOT NULL,
  `difficulty` smallint(6) DEFAULT '-1',
  PRIMARY KEY (`guid`,`type`,`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_gifts`
--

DROP TABLE IF EXISTS `character_gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_gifts` (
  `guid` int(20) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `entry` int(20) unsigned NOT NULL DEFAULT '0',
  `flags` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_glyphs`
--

DROP TABLE IF EXISTS `character_glyphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_glyphs` (
  `guid` int(11) unsigned NOT NULL,
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `glyph` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spec`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_homebind`
--

DROP TABLE IF EXISTS `character_homebind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_homebind` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `map` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zone` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_instance`
--

DROP TABLE IF EXISTS `character_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_instance` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `instance` int(11) unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_inventory`
--

DROP TABLE IF EXISTS `character_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_inventory` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bag` int(11) unsigned NOT NULL DEFAULT '0',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Global Unique Identifier',
  `item_template` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  PRIMARY KEY (`item`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_mmr`
--

DROP TABLE IF EXISTS `character_mmr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_mmr` (
  `guid` int(10) NOT NULL,
  `slot` tinyint(3) NOT NULL,
  `mmr` smallint(5) NOT NULL,
  PRIMARY KEY (`guid`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_pet`
--

DROP TABLE IF EXISTS `character_pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_pet` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `entry` int(11) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `modelid` int(11) unsigned DEFAULT '0',
  `CreatedBySpell` int(11) unsigned NOT NULL DEFAULT '0',
  `PetType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` int(11) unsigned NOT NULL DEFAULT '1',
  `exp` int(11) unsigned NOT NULL DEFAULT '0',
  `Reactstate` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT 'Pet',
  `renamed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `slot` int(11) unsigned NOT NULL DEFAULT '0',
  `curhealth` int(11) unsigned NOT NULL DEFAULT '1',
  `curmana` int(11) unsigned NOT NULL DEFAULT '0',
  `curhappiness` int(11) DEFAULT NULL,
  `savetime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resettalents_cost` int(11) unsigned NOT NULL DEFAULT '0',
  `resettalents_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `abdata` longtext,
  `actual_slot` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_pet_declinedname`
--

DROP TABLE IF EXISTS `character_pet_declinedname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_pet_declinedname` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `genitive` varchar(12) NOT NULL DEFAULT '',
  `dative` varchar(12) NOT NULL DEFAULT '',
  `accusative` varchar(12) NOT NULL DEFAULT '',
  `instrumental` varchar(12) NOT NULL DEFAULT '',
  `prepositional` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `owner_key` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_phase_data`
--

DROP TABLE IF EXISTS `character_phase_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_phase_data` (
  `guid` int(11) NOT NULL,
  `map` smallint(6) NOT NULL,
  `phase` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_queststatus`
--

DROP TABLE IF EXISTS `character_queststatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_queststatus` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `status` tinyint(3) unsigned NOT NULL,
  `rewarded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `explored` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timer` int(4) unsigned NOT NULL,
  `mobcount1` smallint(5) unsigned NOT NULL,
  `mobcount2` smallint(5) unsigned NOT NULL,
  `mobcount3` smallint(5) unsigned NOT NULL,
  `mobcount4` smallint(5) unsigned NOT NULL,
  `itemcount1` smallint(5) unsigned NOT NULL,
  `itemcount2` smallint(5) unsigned NOT NULL,
  `itemcount3` smallint(5) unsigned NOT NULL,
  `itemcount4` smallint(5) unsigned NOT NULL,
  `itemcount5` smallint(5) unsigned NOT NULL,
  `itemcount6` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_queststatus_daily`
--

DROP TABLE IF EXISTS `character_queststatus_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_queststatus_daily` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_queststatus_monthly`
--

DROP TABLE IF EXISTS `character_queststatus_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_queststatus_monthly` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_queststatus_weekly`
--

DROP TABLE IF EXISTS `character_queststatus_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_queststatus_weekly` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_race_change`
--

DROP TABLE IF EXISTS `character_race_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_race_change` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `oldrace` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Old Race',
  `newrace` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'New Race',
  `oldname` text,
  `newname` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Character race/faction change logs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_renames`
--

DROP TABLE IF EXISTS `character_renames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_renames` (
  `guid` int(11) NOT NULL,
  `oldname` text,
  `newname` text,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_reputation`
--

DROP TABLE IF EXISTS `character_reputation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_reputation` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `faction` smallint(5) unsigned NOT NULL,
  `standing` int(11) NOT NULL DEFAULT '0',
  `flags` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_skills`
--

DROP TABLE IF EXISTS `character_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_skills` (
  `guid` int(11) unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `skill` mediumint(9) unsigned NOT NULL,
  `value` mediumint(9) unsigned NOT NULL,
  `max` mediumint(9) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`skill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_social`
--

DROP TABLE IF EXISTS `character_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_social` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `friend` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Global Unique Identifier',
  `flags` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Flags',
  `note` varchar(48) NOT NULL DEFAULT '' COMMENT 'Friend Note',
  PRIMARY KEY (`guid`,`friend`,`flags`),
  KEY `guid` (`guid`),
  KEY `friend` (`friend`),
  KEY `guid_flags` (`guid`,`flags`),
  KEY `friend_flags` (`friend`,`flags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_spell`
--

DROP TABLE IF EXISTS `character_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_spell` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`),
  KEY `Idx_spell` (`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_spell_cooldown`
--

DROP TABLE IF EXISTS `character_spell_cooldown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_spell_cooldown` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `item` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_stats`
--

DROP TABLE IF EXISTS `character_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_stats` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `maxhealth` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower1` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower2` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower3` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower4` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower5` int(10) unsigned NOT NULL DEFAULT '0',
  `strength` int(10) unsigned NOT NULL DEFAULT '0',
  `agility` int(10) unsigned NOT NULL DEFAULT '0',
  `stamina` int(10) unsigned NOT NULL DEFAULT '0',
  `intellect` int(10) unsigned NOT NULL DEFAULT '0',
  `spirit` int(10) unsigned NOT NULL DEFAULT '0',
  `armor` int(10) unsigned NOT NULL DEFAULT '0',
  `resHoly` int(10) unsigned NOT NULL DEFAULT '0',
  `resFire` int(10) unsigned NOT NULL DEFAULT '0',
  `resNature` int(10) unsigned NOT NULL DEFAULT '0',
  `resFrost` int(10) unsigned NOT NULL DEFAULT '0',
  `resShadow` int(10) unsigned NOT NULL DEFAULT '0',
  `resArcane` int(10) unsigned NOT NULL DEFAULT '0',
  `blockPct` float unsigned NOT NULL DEFAULT '0',
  `dodgePct` float unsigned NOT NULL DEFAULT '0',
  `parryPct` float unsigned NOT NULL DEFAULT '0',
  `critPct` float unsigned NOT NULL DEFAULT '0',
  `rangedCritPct` float unsigned NOT NULL DEFAULT '0',
  `spellCritPct` float unsigned NOT NULL DEFAULT '0',
  `attackPower` int(10) unsigned NOT NULL DEFAULT '0',
  `rangedAttackPower` int(10) unsigned NOT NULL DEFAULT '0',
  `spellPower` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_talent`
--

DROP TABLE IF EXISTS `character_talent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_talent` (
  `guid` int(11) unsigned NOT NULL,
  `talent_id` int(11) unsigned NOT NULL,
  `current_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`talent_id`,`spec`),
  KEY `guid_key` (`guid`),
  KEY `talent_key` (`talent_id`),
  KEY `spec_key` (`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_ticket`
--

DROP TABLE IF EXISTS `character_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_ticket` (
  `ticket_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `ticket_text` text,
  `response_text` text,
  `ticket_lastchange` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4829 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_tutorial`
--

DROP TABLE IF EXISTS `character_tutorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_tutorial` (
  `account` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Account Identifier',
  `tut0` int(11) unsigned NOT NULL DEFAULT '0',
  `tut1` int(11) unsigned NOT NULL DEFAULT '0',
  `tut2` int(11) unsigned NOT NULL DEFAULT '0',
  `tut3` int(11) unsigned NOT NULL DEFAULT '0',
  `tut4` int(11) unsigned NOT NULL DEFAULT '0',
  `tut5` int(11) unsigned NOT NULL DEFAULT '0',
  `tut6` int(11) unsigned NOT NULL DEFAULT '0',
  `tut7` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=382126465 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_void_storage`
--

DROP TABLE IF EXISTS `character_void_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_void_storage` (
  `itemId` bigint(20) unsigned NOT NULL,
  `playerGuid` int(10) unsigned NOT NULL,
  `itemEntry` mediumint(8) unsigned NOT NULL,
  `slot` tinyint(3) unsigned NOT NULL,
  `creatorGuid` int(10) unsigned NOT NULL DEFAULT '0',
  `randomProperty` int(10) unsigned NOT NULL DEFAULT '0',
  `suffixFactor` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemId`),
  UNIQUE KEY `idx_player_slot` (`playerGuid`,`slot`),
  KEY `idx_player` (`playerGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_weekly_spell_usage`
--

DROP TABLE IF EXISTS `character_weekly_spell_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_weekly_spell_usage` (
  `guid` int(11) DEFAULT NULL,
  `spell` int(11) DEFAULT NULL,
  `count` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `account` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `name` varchar(12) NOT NULL DEFAULT '',
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `xp` int(10) unsigned NOT NULL DEFAULT '0',
  `money` bigint(40) unsigned NOT NULL DEFAULT '0',
  `playerBytes` int(10) unsigned NOT NULL DEFAULT '0',
  `playerBytes2` int(10) unsigned NOT NULL DEFAULT '0',
  `playerFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `map` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `dungeon_difficulty` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `taximask` longtext,
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cinematic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `totaltime` int(11) unsigned NOT NULL DEFAULT '0',
  `leveltime` int(11) unsigned NOT NULL DEFAULT '0',
  `logout_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `is_logout_resting` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rest_bonus` float NOT NULL DEFAULT '0',
  `resettalents_cost` int(11) unsigned NOT NULL DEFAULT '0',
  `resettalents_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `primary_trees` varchar(10) NOT NULL DEFAULT '0 0 ',
  `trans_x` float NOT NULL DEFAULT '0',
  `trans_y` float NOT NULL DEFAULT '0',
  `trans_z` float NOT NULL DEFAULT '0',
  `trans_o` float NOT NULL DEFAULT '0',
  `transguid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `extra_flags` int(11) unsigned NOT NULL DEFAULT '0',
  `stable_slots` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `at_login` int(11) unsigned NOT NULL DEFAULT '0',
  `zone` int(11) unsigned NOT NULL DEFAULT '0',
  `death_expire_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxi_path` text,
  `totalKills` int(10) unsigned NOT NULL DEFAULT '0',
  `todayKills` smallint(5) unsigned NOT NULL DEFAULT '0',
  `yesterdayKills` smallint(5) unsigned NOT NULL DEFAULT '0',
  `chosenTitle` int(10) unsigned NOT NULL DEFAULT '0',
  `watchedFaction` int(10) unsigned NOT NULL DEFAULT '0',
  `drunk` smallint(5) unsigned NOT NULL DEFAULT '0',
  `health` int(10) unsigned NOT NULL DEFAULT '0',
  `power1` int(10) NOT NULL DEFAULT '0',
  `power2` int(10) NOT NULL DEFAULT '0',
  `power3` int(10) NOT NULL DEFAULT '0',
  `power4` int(10) NOT NULL DEFAULT '0',
  `power5` int(10) NOT NULL DEFAULT '0',
  `specCount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `activeSpec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `exploredZones` longtext,
  `equipmentCache` longtext,
  `knownTitles` longtext,
  `actionBars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grantableLevels` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `deleteInfos_Account` int(11) unsigned DEFAULT NULL,
  `deleteInfos_Name` varchar(12) DEFAULT NULL,
  `deleteDate` bigint(20) unsigned DEFAULT NULL,
  `last_ip` varchar(30) NOT NULL DEFAULT '0.0.0.0',
  `arenaPoints` int(11) DEFAULT NULL,
  `totalHonorPoints` int(11) DEFAULT NULL,
  `todayHonorPoints` int(11) DEFAULT NULL,
  `yesterdayHonorPoints` int(11) DEFAULT NULL,
  `knownCurrencies` int(11) DEFAULT NULL,
  `power6` int(11) DEFAULT NULL,
  `power7` int(11) DEFAULT NULL,
  `ammoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_account` (`account`),
  KEY `idx_online` (`online`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `characters_visuals`
--

DROP TABLE IF EXISTS `characters_visuals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters_visuals` (
  `guid` int(11) unsigned NOT NULL,
  `head` int(11) unsigned NOT NULL,
  `shoulders` int(11) unsigned NOT NULL,
  `chest` int(11) unsigned NOT NULL,
  `waist` int(11) unsigned NOT NULL,
  `legs` int(11) unsigned NOT NULL,
  `feet` int(11) unsigned NOT NULL,
  `wrists` int(11) unsigned NOT NULL,
  `hands` int(11) unsigned NOT NULL,
  `back` int(11) unsigned NOT NULL,
  `main` int(11) unsigned NOT NULL,
  `off` int(11) unsigned NOT NULL,
  `ranged` int(11) unsigned NOT NULL,
  `type` int(11) unsigned NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Player extra visuality items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `console`
--

DROP TABLE IF EXISTS `console`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `console` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `done` timestamp NULL DEFAULT NULL,
  `command` text,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2338 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corpse`
--

DROP TABLE IF EXISTS `corpse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corpse` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `player` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `phaseMask` smallint(5) unsigned NOT NULL DEFAULT '1',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `corpse_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `instance` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_type` (`corpse_type`),
  KEY `instance` (`instance`),
  KEY `Idx_player` (`player`),
  KEY `Idx_time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Death System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_respawn`
--

DROP TABLE IF EXISTS `creature_respawn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawntime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `instance` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbc_skillline`
--

DROP TABLE IF EXISTS `dbc_skillline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbc_skillline` (
  `id` int(11) NOT NULL DEFAULT '0',
  `categoryId` int(11) NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `description` text NOT NULL,
  `spellicon` int(11) NOT NULL DEFAULT '0',
  `alternateVerb` text NOT NULL,
  `canLink` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Export of SkillLine.dbc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbc_skilllineability`
--

DROP TABLE IF EXISTS `dbc_skilllineability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbc_skilllineability` (
  `id` int(11) NOT NULL DEFAULT '0',
  `skillId` int(11) NOT NULL DEFAULT '0',
  `spellId` int(11) NOT NULL DEFAULT '0',
  `racemask` int(11) NOT NULL DEFAULT '0',
  `classmask` int(11) NOT NULL DEFAULT '0',
  `racemaskNot` int(11) NOT NULL DEFAULT '0',
  `classmaskNot` int(11) NOT NULL DEFAULT '0',
  `req_skill_value` int(11) NOT NULL DEFAULT '0',
  `forward_spellid` int(11) NOT NULL DEFAULT '0',
  `learnOnGetSkill` int(11) NOT NULL DEFAULT '0',
  `max_value` int(11) NOT NULL DEFAULT '0',
  `min_value` int(11) NOT NULL DEFAULT '0',
  `characterPoints` int(11) NOT NULL DEFAULT '0',
  `bonusMaxLevel` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Export of SkillLineAbility.dbc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disabled_spells`
--

DROP TABLE IF EXISTS `disabled_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disabled_spells` (
  `id` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `type` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_status`
--

DROP TABLE IF EXISTS `game_event_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_event_status` (
  `event` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Game event system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_respawn`
--

DROP TABLE IF EXISTS `gameobject_respawn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawntime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `instance` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gm_played_time`
--

DROP TABLE IF EXISTS `gm_played_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_played_time` (
  `account` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `playedTime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='GM played time tracking system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gmlog_commands`
--

DROP TABLE IF EXISTS `gmlog_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gmlog_commands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command` varchar(255) NOT NULL,
  `account` int(10) unsigned NOT NULL,
  `player` varchar(30) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `selected_type` varchar(255) DEFAULT NULL,
  `selected_guid` bigint(20) unsigned DEFAULT NULL,
  `map` int(10) unsigned NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '0.0.0.0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1391683 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='GM logs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_instance`
--

DROP TABLE IF EXISTS `group_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_instance` (
  `leaderGuid` int(11) unsigned NOT NULL DEFAULT '0',
  `instance` int(11) unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`leaderGuid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_member`
--

DROP TABLE IF EXISTS `group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_member` (
  `groupId` int(11) unsigned NOT NULL,
  `memberGuid` int(11) unsigned NOT NULL,
  `memberFlags` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Member flags bit mask',
  `subgroup` smallint(6) unsigned NOT NULL,
  `roles` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Member roles bit mask',
  PRIMARY KEY (`groupId`,`memberGuid`),
  KEY `Idx_memberGuid` (`memberGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `groupId` int(11) unsigned NOT NULL,
  `leaderGuid` int(11) unsigned NOT NULL,
  `lootMethod` tinyint(4) unsigned NOT NULL,
  `looterGuid` int(11) unsigned NOT NULL,
  `lootThreshold` tinyint(4) unsigned NOT NULL,
  `icon1` int(11) unsigned NOT NULL,
  `icon2` int(11) unsigned NOT NULL,
  `icon3` int(11) unsigned NOT NULL,
  `icon4` int(11) unsigned NOT NULL,
  `icon5` int(11) unsigned NOT NULL,
  `icon6` int(11) unsigned NOT NULL,
  `icon7` int(11) unsigned NOT NULL,
  `icon8` int(11) unsigned NOT NULL,
  `groupType` tinyint(1) unsigned NOT NULL,
  `difficulty` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `raiddifficulty` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupId`),
  UNIQUE KEY `leaderGuid` (`leaderGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild`
--

DROP TABLE IF EXISTS `guild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild` (
  `guildid` int(6) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `leaderguid` int(6) unsigned NOT NULL DEFAULT '0',
  `EmblemStyle` int(5) NOT NULL DEFAULT '0',
  `EmblemColor` int(5) NOT NULL DEFAULT '0',
  `BorderStyle` int(5) NOT NULL DEFAULT '0',
  `BorderColor` int(5) NOT NULL DEFAULT '0',
  `BackgroundColor` int(5) NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `createdate` bigint(20) unsigned NOT NULL DEFAULT '0',
  `BankMoney` bigint(20) unsigned NOT NULL DEFAULT '0',
  `level` int(10) unsigned DEFAULT '1',
  `experience` bigint(20) unsigned DEFAULT '0',
  `todayExperience` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_achievement`
--

DROP TABLE IF EXISTS `guild_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_achievement` (
  `guildId` int(10) unsigned NOT NULL,
  `achievement` smallint(5) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `guids` text NOT NULL,
  PRIMARY KEY (`guildId`,`achievement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_achievement_progress`
--

DROP TABLE IF EXISTS `guild_achievement_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_achievement_progress` (
  `guildId` int(10) unsigned NOT NULL,
  `criteria` smallint(5) unsigned NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `completedGuid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildId`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_bank_eventlog`
--

DROP TABLE IF EXISTS `guild_bank_eventlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_bank_eventlog` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Guild Identificator',
  `LogGuid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Log record identificator - auxiliary column',
  `TabId` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Guild bank TabId',
  `EventType` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Event type',
  `PlayerGuid` int(11) unsigned NOT NULL DEFAULT '0',
  `ItemOrMoney` int(11) unsigned NOT NULL DEFAULT '0',
  `ItemStackCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DestTabId` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Destination Tab Id',
  `TimeStamp` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`,`TabId`),
  KEY `guildid_key` (`guildid`),
  KEY `Idx_PlayerGuid` (`PlayerGuid`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_bank_item`
--

DROP TABLE IF EXISTS `guild_bank_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_bank_item` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SlotId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `item_entry` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`SlotId`),
  KEY `guildid_key` (`guildid`),
  KEY `Idx_item_guid` (`item_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_bank_right`
--

DROP TABLE IF EXISTS `guild_bank_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_bank_right` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rid` int(11) unsigned NOT NULL DEFAULT '0',
  `gbright` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SlotPerDay` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`rid`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_bank_tab`
--

DROP TABLE IF EXISTS `guild_bank_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_bank_tab` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `TabName` varchar(100) NOT NULL DEFAULT '',
  `TabIcon` varchar(100) NOT NULL DEFAULT '',
  `TabText` text,
  PRIMARY KEY (`guildid`,`TabId`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_eventlog`
--

DROP TABLE IF EXISTS `guild_eventlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_eventlog` (
  `guildid` int(11) unsigned NOT NULL COMMENT 'Guild Identificator',
  `LogGuid` int(11) unsigned NOT NULL COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint(1) unsigned NOT NULL COMMENT 'Event type',
  `PlayerGuid1` int(11) unsigned NOT NULL COMMENT 'Player 1',
  `PlayerGuid2` int(11) unsigned NOT NULL COMMENT 'Player 2',
  `NewRank` tinyint(2) unsigned NOT NULL COMMENT 'New rank(in case promotion/demotion)',
  `TimeStamp` bigint(20) unsigned NOT NULL COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`),
  KEY `Idx_PlayerGuid1` (`PlayerGuid1`),
  KEY `Idx_PlayerGuid2` (`PlayerGuid2`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild Eventlog';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_finder_applicant`
--

DROP TABLE IF EXISTS `guild_finder_applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_finder_applicant` (
  `guildId` int(10) unsigned DEFAULT NULL,
  `playerGuid` int(10) unsigned DEFAULT NULL,
  `availability` tinyint(3) unsigned DEFAULT '0',
  `classRole` tinyint(3) unsigned DEFAULT '0',
  `interests` tinyint(3) unsigned DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `submitTime` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `guildId` (`guildId`,`playerGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_finder_guild_settings`
--

DROP TABLE IF EXISTS `guild_finder_guild_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_finder_guild_settings` (
  `guildId` int(10) unsigned NOT NULL,
  `availability` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `classRoles` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `interests` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `listed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guildId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_member`
--

DROP TABLE IF EXISTS `guild_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_member` (
  `guildid` int(6) unsigned NOT NULL DEFAULT '0',
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `rank` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `pnote` varchar(255) NOT NULL DEFAULT '',
  `offnote` varchar(255) NOT NULL DEFAULT '',
  `thisWeekReputation` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeMoney` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemMoney` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab0` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab0` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab1` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab1` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab2` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab2` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab3` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab3` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab4` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab4` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab5` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab5` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab6` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab6` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab7` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab7` int(11) unsigned NOT NULL DEFAULT '0',
  `achievementPoints` int(11) unsigned NOT NULL DEFAULT '0',
  `firstProfessionId` int(11) unsigned NOT NULL DEFAULT '0',
  `firstProfessionRank` int(11) unsigned NOT NULL DEFAULT '0',
  `firstProfessionValue` int(11) unsigned NOT NULL DEFAULT '0',
  `secondProfessionId` int(11) unsigned NOT NULL DEFAULT '0',
  `secondProfessionRank` int(11) unsigned NOT NULL DEFAULT '0',
  `secondProfessionValue` int(11) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `guid_key` (`guid`),
  KEY `guildid_key` (`guildid`),
  KEY `guildid_rank_key` (`guildid`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Guild System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_news_eventlog`
--

DROP TABLE IF EXISTS `guild_news_eventlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_news_eventlog` (
  `guildid` int(10) unsigned NOT NULL,
  `LogGuid` int(10) unsigned NOT NULL,
  `EventType` int(10) unsigned NOT NULL,
  `PlayerGuid` bigint(20) unsigned NOT NULL,
  `Data` int(10) unsigned NOT NULL,
  `Flags` int(10) unsigned NOT NULL,
  `Date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_rank`
--

DROP TABLE IF EXISTS `guild_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_rank` (
  `guildid` int(6) unsigned NOT NULL DEFAULT '0',
  `rid` int(11) unsigned NOT NULL,
  `rname` varchar(255) NOT NULL DEFAULT '',
  `rights` int(3) unsigned NOT NULL DEFAULT '0',
  `BankMoneyPerDay` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`rid`),
  KEY `Idx_rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance`
--

DROP TABLE IF EXISTS `instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `map` int(11) unsigned NOT NULL DEFAULT '0',
  `resettime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `encountersMask` int(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`id`),
  KEY `map` (`map`),
  KEY `resettime` (`resettime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance_reset`
--

DROP TABLE IF EXISTS `instance_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_reset` (
  `mapid` int(11) unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `resettime` bigint(40) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mapid`,`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_instance`
--

DROP TABLE IF EXISTS `item_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_instance` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`guid`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_instance_text`
--

DROP TABLE IF EXISTS `item_instance_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_instance_text` (
  `guid` int(10) unsigned NOT NULL,
  `text` longtext,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_loot`
--

DROP TABLE IF EXISTS `item_loot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_loot` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `itemid` int(11) unsigned NOT NULL DEFAULT '0',
  `amount` int(11) unsigned NOT NULL DEFAULT '0',
  `suffix` int(11) unsigned NOT NULL DEFAULT '0',
  `property` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`itemid`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_refund`
--

DROP TABLE IF EXISTS `item_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_refund` (
  `item_guid` int(10) unsigned NOT NULL COMMENT 'Item GUID',
  `player_guid` int(10) unsigned NOT NULL COMMENT 'Player GUID',
  `paidMoney` int(10) unsigned NOT NULL DEFAULT '0',
  `paidExtendedCost` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`,`player_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Item Refund System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_soulbound_trade_data`
--

DROP TABLE IF EXISTS `item_soulbound_trade_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_soulbound_trade_data` (
  `itemGuid` int(16) unsigned NOT NULL DEFAULT '0',
  `allowedPlayers` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='BOP item trade cache';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lfg_data`
--

DROP TABLE IF EXISTS `lfg_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lfg_data` (
  `guid` int(11) NOT NULL,
  `dungeon` int(11) NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail` (
  `id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `messageType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stationery` tinyint(3) NOT NULL DEFAULT '41',
  `mailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sender` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `receiver` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `subject` longtext,
  `body` longtext,
  `has_items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expire_time` bigint(40) unsigned NOT NULL DEFAULT '0',
  `deliver_time` bigint(40) unsigned NOT NULL DEFAULT '0',
  `money` bigint(40) unsigned NOT NULL DEFAULT '0',
  `cod` bigint(40) unsigned NOT NULL DEFAULT '0',
  `checked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Mail System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_items`
--

DROP TABLE IF EXISTS `mail_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_items` (
  `mail_id` int(11) NOT NULL DEFAULT '0',
  `item_guid` int(11) NOT NULL DEFAULT '0',
  `item_template` int(11) NOT NULL DEFAULT '0',
  `receiver` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  PRIMARY KEY (`mail_id`,`item_guid`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet_aura`
--

DROP TABLE IF EXISTS `pet_aura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_aura` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `spell` int(11) unsigned NOT NULL DEFAULT '0',
  `stackcount` int(11) unsigned NOT NULL DEFAULT '1',
  `remaincharges` int(11) unsigned NOT NULL DEFAULT '0',
  `basepoints0` int(11) NOT NULL DEFAULT '0',
  `basepoints1` int(11) NOT NULL DEFAULT '0',
  `basepoints2` int(11) NOT NULL DEFAULT '0',
  `periodictime0` int(11) unsigned NOT NULL DEFAULT '0',
  `periodictime1` int(11) unsigned NOT NULL DEFAULT '0',
  `periodictime2` int(11) unsigned NOT NULL DEFAULT '0',
  `maxduration` int(11) NOT NULL DEFAULT '0',
  `remaintime` int(11) NOT NULL DEFAULT '0',
  `effIndexMask` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`caster_guid`,`item_guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet_spell`
--

DROP TABLE IF EXISTS `pet_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_spell` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet_spell_cooldown`
--

DROP TABLE IF EXISTS `pet_spell_cooldown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_spell_cooldown` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `petition`
--

DROP TABLE IF EXISTS `petition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petition` (
  `ownerguid` int(10) unsigned NOT NULL,
  `petitionguid` int(10) unsigned DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ownerguid`),
  UNIQUE KEY `index_ownerguid_petitionguid` (`ownerguid`,`petitionguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `petition_sign`
--

DROP TABLE IF EXISTS `petition_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petition_sign` (
  `ownerguid` int(10) unsigned NOT NULL,
  `petitionguid` int(11) unsigned NOT NULL DEFAULT '0',
  `playerguid` int(11) unsigned NOT NULL DEFAULT '0',
  `player_account` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petitionguid`,`playerguid`),
  KEY `Idx_playerguid` (`playerguid`),
  KEY `Idx_ownerguid` (`ownerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queuedgifts`
--

DROP TABLE IF EXISTS `queuedgifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queuedgifts` (
  `qIdx` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `charGuid` int(10) unsigned NOT NULL,
  `itemId` int(10) unsigned NOT NULL,
  `itemStackCnt` int(10) unsigned DEFAULT '1',
  `itemGuid` int(10) unsigned DEFAULT NULL,
  `sentFlag` int(10) unsigned DEFAULT '0',
  `text` text,
  `subj` varchar(255) DEFAULT '',
  `gold` int(10) unsigned DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`qIdx`)
) ENGINE=InnoDB AUTO_INCREMENT=23599 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saved_variables`
--

DROP TABLE IF EXISTS `saved_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_variables` (
  `NextCurrenciesResetTime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `NextDailyQuestResetTime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `NextWeeklyQuestResetTime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `NextRandomBGResetTime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `NextMonthlyQuestResetTime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `cleaning_flags` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Variable Saves';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spellstore`
--

DROP TABLE IF EXISTS `spellstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spellstore` (
  `Id` int(11) unsigned NOT NULL DEFAULT '0',
  `Attributes` int(11) unsigned NOT NULL DEFAULT '0',
  `AttributesEx` int(11) unsigned NOT NULL DEFAULT '0',
  `AttributesEx2` int(11) unsigned NOT NULL DEFAULT '0',
  `AttributesEx3` int(11) unsigned NOT NULL DEFAULT '0',
  `AttributesEx4` int(11) unsigned NOT NULL DEFAULT '0',
  `AttributesEx5` int(11) unsigned NOT NULL DEFAULT '0',
  `AttributesEx6` int(11) unsigned NOT NULL DEFAULT '0',
  `AttributesEx7` int(11) unsigned NOT NULL DEFAULT '0',
  `AttributesEx8` int(11) unsigned NOT NULL DEFAULT '0',
  `AttributesEx9` int(11) unsigned NOT NULL DEFAULT '0',
  `AttributesEx10` int(11) unsigned NOT NULL DEFAULT '0',
  `CastingTimeIndex` int(11) NOT NULL DEFAULT '0',
  `DurationIndex` int(11) NOT NULL DEFAULT '0',
  `powerType` int(11) unsigned NOT NULL DEFAULT '0',
  `rangeIndex` int(11) NOT NULL DEFAULT '0',
  `speed` float NOT NULL DEFAULT '0',
  `SpellVisual0` int(11) NOT NULL DEFAULT '0',
  `SpellVisual1` int(11) NOT NULL DEFAULT '0',
  `SpellIconID` int(11) NOT NULL DEFAULT '0',
  `activeIconID` int(11) NOT NULL DEFAULT '0',
  `SpellName` text,
  `Rank` text,
  `Description` text,
  `ToolTip` text,
  `SchoolMask` int(11) NOT NULL DEFAULT '0',
  `runeCostID` int(11) NOT NULL DEFAULT '0',
  `spellMissileID` int(11) NOT NULL DEFAULT '0',
  `spellDescriptionVariableID` int(11) unsigned NOT NULL DEFAULT '0',
  `SpellDifficultyId` int(11) NOT NULL DEFAULT '0',
  `unk_f1` float NOT NULL DEFAULT '0',
  `SpellScalingId` int(11) NOT NULL DEFAULT '0',
  `castTimeMin` int(11) unsigned NOT NULL DEFAULT '0',
  `castTimeMax` int(11) unsigned NOT NULL DEFAULT '0',
  `castScalingMaxLevel` int(11) NOT NULL DEFAULT '0',
  `playerClass` int(11) NOT NULL DEFAULT '0',
  `coeff10` float NOT NULL DEFAULT '0',
  `coeff11` float NOT NULL DEFAULT '0',
  `coeff12` float NOT NULL DEFAULT '0',
  `coeff20` float NOT NULL DEFAULT '0',
  `coeff21` float NOT NULL DEFAULT '0',
  `coeff22` float NOT NULL DEFAULT '0',
  `coeff30` float NOT NULL DEFAULT '0',
  `coeff31` float NOT NULL DEFAULT '0',
  `coefBase` float NOT NULL DEFAULT '0',
  `coefLevelBase` int(11) NOT NULL DEFAULT '0',
  `SpellAuraOptionsId` int(11) NOT NULL DEFAULT '0',
  `StackAmount` int(11) NOT NULL DEFAULT '0',
  `procChance` int(11) NOT NULL DEFAULT '0',
  `procCharges` int(11) NOT NULL DEFAULT '0',
  `procFlags` int(11) NOT NULL DEFAULT '0',
  `SpellAuraRestrictionsId` int(11) NOT NULL DEFAULT '0',
  `CasterAuraState` int(11) NOT NULL DEFAULT '0',
  `TargetAuraState` int(11) NOT NULL DEFAULT '0',
  `CasterAuraStateNot` int(11) NOT NULL DEFAULT '0',
  `TargetAuraStateNot` int(11) NOT NULL DEFAULT '0',
  `casterAuraSpell` int(11) NOT NULL DEFAULT '0',
  `targetAuraSpell` int(11) NOT NULL DEFAULT '0',
  `excludeCasterAuraSpell` int(11) NOT NULL DEFAULT '0',
  `excludeTargetAuraSpell` int(11) NOT NULL DEFAULT '0',
  `SpellCastingRequirementsId` int(11) NOT NULL DEFAULT '0',
  `FacingCasterFlags` int(11) NOT NULL DEFAULT '0',
  `MinFactionId` int(11) NOT NULL DEFAULT '0',
  `MinReputation` int(11) NOT NULL DEFAULT '0',
  `AreaGroupId` int(11) NOT NULL DEFAULT '0',
  `RequiredAuraVision` int(11) NOT NULL DEFAULT '0',
  `RequiresSpellFocus` int(11) NOT NULL DEFAULT '0',
  `SpellCategoriesId` int(11) NOT NULL DEFAULT '0',
  `Category` int(11) NOT NULL DEFAULT '0',
  `DmgClass` int(11) NOT NULL DEFAULT '0',
  `Dispel` int(11) NOT NULL DEFAULT '0',
  `Mechanic` int(11) NOT NULL DEFAULT '0',
  `PreventionType` int(11) NOT NULL DEFAULT '0',
  `StartRecoveryCategory` int(11) NOT NULL DEFAULT '0',
  `SpellClassOptionsId` int(11) NOT NULL DEFAULT '0',
  `modalNextSpell` int(11) NOT NULL DEFAULT '0',
  `SpellFamilyFlags0` int(11) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags1` int(11) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags2` int(11) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` int(11) NOT NULL DEFAULT '0',
  `OptionsDescription` text,
  `SpellCooldownsId` int(11) NOT NULL DEFAULT '0',
  `CategoryRecoveryTime` int(11) NOT NULL DEFAULT '0',
  `RecoveryTime` int(11) NOT NULL DEFAULT '0',
  `StartRecoveryTime` int(11) NOT NULL DEFAULT '0',
  `unkIndex7` int(11) NOT NULL DEFAULT '0',
  `SpellEquippedItemsId` int(11) NOT NULL DEFAULT '0',
  `EquippedItemClass` int(11) NOT NULL DEFAULT '0',
  `EquippedItemInventoryTypeMask` int(11) NOT NULL DEFAULT '0',
  `EquippedItemSubClassMask` int(11) NOT NULL DEFAULT '0',
  `SpellInterruptsId` int(11) NOT NULL DEFAULT '0',
  `AuraInterruptFlags` int(11) unsigned NOT NULL DEFAULT '0',
  `InterruptsUnk1` int(11) unsigned NOT NULL DEFAULT '0',
  `ChannelInterruptFlags` int(11) unsigned NOT NULL DEFAULT '0',
  `InterruptsUnk2` int(11) unsigned NOT NULL DEFAULT '0',
  `InterruptFlags` int(11) unsigned NOT NULL DEFAULT '0',
  `SpellLevelsId` int(11) NOT NULL DEFAULT '0',
  `baseLevel` int(11) NOT NULL DEFAULT '0',
  `maxLevel` int(11) NOT NULL DEFAULT '0',
  `spellLevel` int(11) NOT NULL DEFAULT '0',
  `SpellPowerId` int(11) NOT NULL DEFAULT '0',
  `manaCost` int(11) unsigned NOT NULL DEFAULT '0',
  `manaCostPerlevel` int(11) NOT NULL DEFAULT '0',
  `ManaCostPercentage` int(11) unsigned NOT NULL DEFAULT '0',
  `manaPerSecond` int(11) NOT NULL DEFAULT '0',
  `PowerDisplayId` int(11) unsigned NOT NULL DEFAULT '0',
  `PowersUnk1` int(11) unsigned NOT NULL DEFAULT '0',
  `PowersUnk2` int(11) unsigned NOT NULL DEFAULT '0',
  `SpellReagentsId` int(11) NOT NULL DEFAULT '0',
  `Reagent0` int(11) NOT NULL DEFAULT '0',
  `ReagentCount0` int(11) unsigned NOT NULL DEFAULT '0',
  `Reagent1` int(11) NOT NULL DEFAULT '0',
  `ReagentCount1` int(11) unsigned NOT NULL DEFAULT '0',
  `Reagent2` int(11) NOT NULL DEFAULT '0',
  `ReagentCount2` int(11) unsigned NOT NULL DEFAULT '0',
  `Reagent3` int(11) NOT NULL DEFAULT '0',
  `ReagentCount3` int(11) unsigned NOT NULL DEFAULT '0',
  `Reagent4` int(11) NOT NULL DEFAULT '0',
  `ReagentCount4` int(11) unsigned NOT NULL DEFAULT '0',
  `Reagent5` int(11) NOT NULL DEFAULT '0',
  `ReagentCount5` int(11) unsigned NOT NULL DEFAULT '0',
  `Reagent6` int(11) NOT NULL DEFAULT '0',
  `ReagentCount6` int(11) unsigned NOT NULL DEFAULT '0',
  `Reagent7` int(11) NOT NULL DEFAULT '0',
  `ReagentCount7` int(11) unsigned NOT NULL DEFAULT '0',
  `SpellShapeshiftId` int(11) NOT NULL DEFAULT '0',
  `StancesNot` int(11) unsigned NOT NULL DEFAULT '0',
  `unk_320_2` int(11) NOT NULL DEFAULT '0',
  `Stances` int(11) unsigned NOT NULL DEFAULT '0',
  `unk_320_3` int(11) NOT NULL DEFAULT '0',
  `StanceBarOrder` int(11) unsigned NOT NULL DEFAULT '0',
  `SpellTargetRestrictionsId` int(11) NOT NULL DEFAULT '0',
  `MaxTargetRadius` float NOT NULL DEFAULT '0',
  `MaxAffectedTargets` int(11) NOT NULL DEFAULT '0',
  `MaxTargetLevel` int(11) NOT NULL DEFAULT '0',
  `TargetCreatureType` int(11) NOT NULL DEFAULT '0',
  `Targets` int(11) NOT NULL DEFAULT '0',
  `SpellTotemsId` int(11) NOT NULL DEFAULT '0',
  `TotemCategory0` int(11) NOT NULL DEFAULT '0',
  `TotemCategory1` int(11) NOT NULL DEFAULT '0',
  `Totem0` int(11) NOT NULL DEFAULT '0',
  `Totem1` int(11) NOT NULL DEFAULT '0',
  `ResearchProject` int(11) NOT NULL DEFAULT '0',
  `Effect0` int(11) NOT NULL,
  `EffectMultipleValue0` float NOT NULL DEFAULT '0',
  `EffectApplyAuraName0` int(11) NOT NULL DEFAULT '0',
  `EffectAmplitude0` int(11) NOT NULL DEFAULT '0',
  `EffectBasePoints0` int(11) NOT NULL DEFAULT '0',
  `unk_320_4_0` float NOT NULL DEFAULT '0',
  `DmgMultiplier0` float NOT NULL DEFAULT '0',
  `EffectChainTarget0` int(11) NOT NULL DEFAULT '0',
  `EffectDieSides0` int(11) NOT NULL DEFAULT '0',
  `EffectItemType0` int(11) unsigned NOT NULL DEFAULT '0',
  `EffectMechanic0` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValue0` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB0` int(11) NOT NULL DEFAULT '0',
  `EffectPointsPerComboPoint0` float NOT NULL DEFAULT '0',
  `EffectRadiusIndex0` int(11) NOT NULL DEFAULT '0',
  `EffectRadiusMaxIndex0` int(11) NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel0` float NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA0` int(11) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB0` int(11) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC0` int(11) unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell0` int(11) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA0` int(11) NOT NULL DEFAULT '0',
  `EffectImplicitTargetB0` int(11) NOT NULL DEFAULT '0',
  `EffectIndex0` int(11) NOT NULL DEFAULT '0',
  `EffectUnk0` int(11) NOT NULL DEFAULT '0',
  `Effect1` int(11) NOT NULL,
  `EffectMultipleValue1` float NOT NULL DEFAULT '0',
  `EffectApplyAuraName1` int(11) NOT NULL DEFAULT '0',
  `EffectAmplitude1` int(11) NOT NULL DEFAULT '0',
  `EffectBasePoints1` int(11) NOT NULL DEFAULT '0',
  `unk_320_4_1` float NOT NULL DEFAULT '0',
  `DmgMultiplier1` float NOT NULL DEFAULT '0',
  `EffectChainTarget1` int(11) NOT NULL DEFAULT '0',
  `EffectDieSides1` int(11) NOT NULL DEFAULT '0',
  `EffectItemType1` int(11) NOT NULL DEFAULT '0',
  `EffectMechanic1` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValue1` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB1` int(11) NOT NULL DEFAULT '0',
  `EffectPointsPerComboPoint1` float NOT NULL DEFAULT '0',
  `EffectRadiusIndex1` int(11) NOT NULL DEFAULT '0',
  `EffectRadiusMaxIndex1` int(11) NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel1` float NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA1` int(11) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB1` int(11) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC1` int(11) unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell1` int(11) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA1` int(11) NOT NULL DEFAULT '0',
  `EffectImplicitTargetB1` int(11) NOT NULL DEFAULT '0',
  `EffectIndex1` int(11) NOT NULL DEFAULT '0',
  `EffectUnk1` int(11) NOT NULL DEFAULT '0',
  `Effect2` int(11) NOT NULL,
  `EffectMultipleValue2` float NOT NULL DEFAULT '0',
  `EffectApplyAuraName2` int(11) NOT NULL DEFAULT '0',
  `EffectAmplitude2` int(11) NOT NULL DEFAULT '0',
  `EffectBasePoints2` int(11) NOT NULL DEFAULT '0',
  `unk_320_4_2` float NOT NULL DEFAULT '0',
  `DmgMultiplier2` float NOT NULL DEFAULT '0',
  `EffectChainTarget2` int(11) NOT NULL DEFAULT '0',
  `EffectDieSides2` int(11) NOT NULL DEFAULT '0',
  `EffectItemType2` int(11) NOT NULL DEFAULT '0',
  `EffectMechanic2` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValue2` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB2` int(11) NOT NULL DEFAULT '0',
  `EffectPointsPerComboPoint2` float NOT NULL DEFAULT '0',
  `EffectRadiusIndex2` int(11) NOT NULL DEFAULT '0',
  `EffectRadiusMaxIndex2` int(11) NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel2` float NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA2` int(11) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB2` int(11) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC2` int(11) unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell2` int(11) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA2` int(11) NOT NULL DEFAULT '0',
  `EffectImplicitTargetB2` int(11) NOT NULL DEFAULT '0',
  `EffectIndex2` int(11) NOT NULL DEFAULT '0',
  `EffectUnk2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `world`
--

DROP TABLE IF EXISTS `world`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `world` (
  `map` int(11) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`map`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-01 21:53:01
