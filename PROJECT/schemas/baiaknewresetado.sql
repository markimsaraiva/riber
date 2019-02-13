-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 01/06/2016 às 23:41:59
-- Versão do Servidor: 5.5.47
-- Versão do PHP: 5.4.45-0+deb7u2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `baiaknew`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `salt` varchar(40) NOT NULL DEFAULT '',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `lastday` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(32) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `page_lastday` int(11) NOT NULL,
  `email_new` varchar(255) NOT NULL,
  `email_new_time` int(15) NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT '0',
  `email_code` varchar(255) NOT NULL DEFAULT '0',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL,
  `last_post` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(255) NOT NULL,
  `vip_time` int(11) NOT NULL DEFAULT '0',
  `guild_points` int(11) NOT NULL DEFAULT '0',
  `guild_points_stats` int(11) NOT NULL DEFAULT '0',
  `backup_points` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12015 ;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `salt`, `premdays`, `lastday`, `email`, `key`, `blocked`, `warnings`, `group_id`, `page_lastday`, `email_new`, `email_new_time`, `created`, `rlname`, `location`, `page_access`, `email_code`, `next_email`, `premium_points`, `vote`, `last_post`, `flag`, `vip_time`, `guild_points`, `guild_points_stats`, `backup_points`, `create_date`, `create_ip`) VALUES
(1, '1', '356a192b7913b04c54574d18c28d46e6395428ab', '', 65535, 0, '', '0', 0, 0, 1, 1451196145, '', 0, 1456766174, '', '', 0, '0', 0, 0, 0, 1363541383, 'unknown', 1458059618, 0, 0, 0, 0, 0),
(18, 'caraio', '3dec446c46e5f640bfed9c5d27eed00ad6835f0b', '', 0, 0, '', '0', 0, 0, 1, 0, '', 0, 0, '', '', 0, '0', 0, 0, 0, 0, '', 1458059618, 0, 0, 0, 0, 0);

--
-- Gatilhos `accounts`
--
DROP TRIGGER IF EXISTS `ondelete_accounts`;
DELIMITER //
CREATE TRIGGER `ondelete_accounts` BEFORE DELETE ON `accounts`
 FOR EACH ROW BEGIN
	DELETE FROM `bans` WHERE `type` IN (3, 4) AND `value` = OLD.`id`;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_storage`
--

CREATE TABLE IF NOT EXISTS `account_storage` (
  `account_id` int(11) NOT NULL DEFAULT '0',
  `key` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_id_2` (`account_id`,`key`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_viplist`
--

CREATE TABLE IF NOT EXISTS `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `description` varchar(128) NOT NULL,
  `icon` int(11) unsigned NOT NULL,
  `notify` tinyint(1) NOT NULL,
  UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  KEY `account_id` (`account_id`),
  KEY `player_id` (`player_id`),
  KEY `world_id` (`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `announcements`
--

CREATE TABLE IF NOT EXISTS `announcements` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` varchar(20) NOT NULL,
  `author` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auction_system`
--

CREATE TABLE IF NOT EXISTS `auction_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip, 2 - player, 3 - account, 4 - notation',
  `value` int(10) unsigned NOT NULL COMMENT 'ip - ip address, player - player_id, account - account_id, notation - account_id',
  `param` int(10) unsigned NOT NULL COMMENT 'ip - mask, player - type (1 - report, 2 - lock, 3 - ban), account - player, notation - player',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expires` int(11) NOT NULL DEFAULT '-1',
  `added` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `reason` int(10) unsigned NOT NULL DEFAULT '0',
  `action` int(10) unsigned NOT NULL DEFAULT '0',
  `statement` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`value`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ban_table`
--

CREATE TABLE IF NOT EXISTS `ban_table` (
  `id` int(11) NOT NULL,
  `account` int(11) NOT NULL,
  `added` int(11) NOT NULL,
  `expires` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bounty_hunters`
--

CREATE TABLE IF NOT EXISTS `bounty_hunters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fp_id` int(11) NOT NULL,
  `sp_id` int(11) NOT NULL,
  `k_id` int(11) NOT NULL,
  `added` int(15) NOT NULL,
  `prize` bigint(20) NOT NULL,
  `killed` int(11) NOT NULL,
  `kill_time` int(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `castle.dono`
--

CREATE TABLE IF NOT EXISTS `castle.dono` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13107 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `castle_dono`
--

CREATE TABLE IF NOT EXISTS `castle_dono` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1',
  `guild_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13107 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `environment_killers`
--

CREATE TABLE IF NOT EXISTS `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  KEY `kill_id` (`kill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `global_storage`
--

CREATE TABLE IF NOT EXISTS `global_storage` (
  `key` varchar(32) NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  UNIQUE KEY `key` (`key`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guilds`
--

CREATE TABLE IF NOT EXISTS `guilds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `checkdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `balance` bigint(20) unsigned NOT NULL,
  `description` text NOT NULL,
  `logo_gfx_name` varchar(255) NOT NULL DEFAULT '',
  `last_execute_points` int(11) NOT NULL DEFAULT '0',
  `guild_logo` mediumblob,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`world_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=718 ;

--
-- Gatilhos `guilds`
--
DROP TRIGGER IF EXISTS `oncreate_guilds`;
DELIMITER //
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds`
 FOR EACH ROW BEGIN
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `ondelete_guilds`;
DELIMITER //
CREATE TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds`
 FOR EACH ROW BEGIN
	UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_invites`
--

CREATE TABLE IF NOT EXISTS `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_kills`
--

CREATE TABLE IF NOT EXISTS `guild_kills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `war_id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`),
  KEY `war_id` (`war_id`),
  KEY `death_id` (`death_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1038 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_ranks`
--

CREATE TABLE IF NOT EXISTS `guild_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member',
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1787 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_wars`
--

CREATE TABLE IF NOT EXISTS `guild_wars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `enemy_id` int(11) NOT NULL,
  `begin` bigint(20) NOT NULL DEFAULT '0',
  `end` bigint(20) NOT NULL DEFAULT '0',
  `frags` int(10) unsigned NOT NULL DEFAULT '0',
  `payment` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guild_kills` int(10) unsigned NOT NULL DEFAULT '0',
  `enemy_kills` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `guild_id` (`guild_id`),
  KEY `enemy_id` (`enemy_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=201 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL,
  `paid` int(10) unsigned NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `lastwarning` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `town` int(10) unsigned NOT NULL DEFAULT '0',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `rent` int(10) unsigned NOT NULL DEFAULT '0',
  `doors` int(10) unsigned NOT NULL DEFAULT '0',
  `beds` int(10) unsigned NOT NULL DEFAULT '0',
  `tiles` int(10) unsigned NOT NULL DEFAULT '0',
  `guild` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clear` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`world_id`,`owner`,`paid`,`warnings`,`lastwarning`,`name`,`town`,`size`,`price`,`rent`,`doors`,`beds`,`tiles`,`guild`,`clear`),
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `houses`
--

INSERT INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
(1, 0, 0, 1457650824, 0, 0, 'Dark House #1', 1, 40, 41000, 41000, 1, 1, 72, 0, 0),
(2, 0, 0, 1457642544, 0, 0, 'Dark House #2', 1, 40, 41000, 41000, 1, 1, 63, 0, 0),
(3, 0, 0, 1457650726, 0, 0, '', 1, 19, 20000, 20000, 0, 1, 24, 0, 0),
(4, 0, 0, 1457659985, 0, 0, 'Dark House #4', 1, 40, 41000, 41000, 1, 1, 72, 0, 0),
(5, 0, 0, 0, 0, 0, 'Dark House #5', 1, 40, 41000, 41000, 1, 1, 72, 0, 0),
(6, 0, 0, 0, 0, 0, 'Dark House #6', 1, 18, 19000, 19000, 1, 1, 35, 0, 0),
(7, 0, 0, 0, 0, 0, 'Dark House #7', 1, 74, 74000, 74000, 1, 0, 135, 0, 0),
(8, 0, 0, 0, 0, 0, 'Dark House #8', 1, 35, 35000, 35000, 1, 0, 57, 0, 0),
(9, 0, 0, 1457659946, 0, 0, 'Dark House #9', 1, 44, 46000, 46000, 1, 2, 82, 0, 0),
(10, 0, 0, 1457678583, 0, 0, 'Dark House #10', 1, 51, 52000, 52000, 1, 1, 78, 0, 0),
(11, 0, 0, 1457721339, 0, 0, 'Dark House #11', 1, 26, 27000, 27000, 1, 1, 54, 0, 0),
(12, 0, 0, 0, 0, 0, 'Dark House #12', 1, 26, 27000, 27000, 1, 1, 36, 0, 0),
(13, 0, 0, 1457742533, 0, 0, 'Dark House #13', 1, 40, 41000, 41000, 1, 1, 68, 0, 0),
(14, 0, 0, 0, 0, 0, 'Dark House #14', 1, 38, 39000, 39000, 1, 1, 70, 0, 0),
(16, 0, 0, 0, 0, 0, 'Dark House #16', 1, 43, 44000, 44000, 1, 1, 60, 0, 0),
(17, 0, 0, 0, 0, 0, 'Dark House #17', 1, 43, 44000, 44000, 1, 1, 77, 0, 0),
(18, 0, 0, 1457726700, 0, 0, 'Dark House #18', 1, 55, 56000, 56000, 1, 1, 81, 0, 0),
(19, 0, 0, 0, 0, 0, 'Dark House #19', 1, 24, 24000, 24000, 1, 0, 44, 0, 0),
(20, 0, 0, 0, 0, 0, 'Dark House #20', 1, 47, 48000, 48000, 1, 1, 81, 0, 0),
(21, 0, 0, 0, 0, 0, 'Dark House #21', 1, 62, 63000, 63000, 1, 1, 90, 0, 0),
(22, 0, 0, 0, 0, 0, 'Dark House #22', 1, 62, 63000, 63000, 1, 1, 81, 0, 0),
(23, 0, 0, 0, 0, 0, 'Dark House #23', 1, 68, 69000, 69000, 1, 1, 89, 0, 0),
(24, 0, 0, 0, 0, 0, 'Dark House #24', 1, 70, 71000, 71000, 1, 1, 100, 0, 0),
(25, 0, 0, 0, 0, 0, 'Dark House #25', 1, 54, 55000, 55000, 1, 1, 80, 0, 0),
(26, 0, 0, 0, 0, 0, 'Dark House #26', 1, 54, 55000, 55000, 1, 1, 80, 0, 0),
(27, 0, 0, 1457687308, 0, 0, 'Dark House #27', 1, 82, 83000, 83000, 1, 1, 126, 0, 0),
(28, 0, 0, 0, 0, 0, 'Dark House #28', 1, 56, 56000, 56000, 1, 0, 80, 0, 0),
(29, 0, 0, 0, 0, 0, 'Dark House #29', 1, 48, 48000, 48000, 1, 0, 70, 0, 0),
(30, 0, 0, 0, 0, 0, '', 1, 60, 60000, 60000, 0, 0, 81, 0, 0),
(31, 0, 0, 0, 0, 0, 'Dark House #31', 1, 35, 35000, 35000, 1, 0, 54, 0, 0),
(32, 0, 0, 0, 0, 0, 'Dark House #32', 1, 28, 28000, 28000, 1, 0, 32, 0, 0),
(33, 0, 0, 0, 0, 0, 'Dark House #33', 1, 32, 32000, 32000, 1, 0, 50, 0, 0),
(34, 0, 0, 0, 0, 0, '', 1, 26, 28000, 28000, 1, 2, 38, 0, 0),
(35, 0, 0, 0, 0, 0, 'Dark House #35', 1, 33, 33000, 33000, 1, 0, 50, 0, 0),
(36, 0, 0, 0, 0, 0, 'Dark House #36', 1, 24, 24000, 24000, 1, 0, 42, 0, 0),
(37, 0, 0, 0, 0, 0, 'Dark House #37', 1, 32, 32000, 32000, 1, 0, 36, 0, 0),
(38, 0, 0, 0, 0, 0, 'Dark House #38', 1, 28, 29000, 29000, 1, 1, 48, 0, 0),
(39, 0, 0, 0, 0, 0, 'Dark House #39', 1, 22, 23000, 23000, 1, 1, 40, 0, 0),
(40, 0, 0, 0, 0, 0, 'Dark House #40', 1, 28, 29000, 29000, 1, 1, 43, 0, 0),
(41, 0, 0, 0, 0, 0, 'Dark House #41', 1, 15, 16000, 16000, 1, 1, 24, 0, 0),
(42, 0, 0, 0, 0, 0, 'Dark House #42', 1, 18, 19000, 19000, 1, 1, 30, 0, 0),
(44, 0, 0, 0, 0, 0, '', 1, 26, 27000, 27000, 0, 1, 32, 0, 0),
(45, 0, 0, 0, 0, 0, '', 1, 10, 11000, 11000, 0, 1, 14, 0, 0),
(46, 0, 0, 0, 0, 0, '', 1, 14, 15000, 15000, 0, 1, 19, 0, 0),
(47, 0, 0, 0, 0, 0, 'Dark House #47', 1, 12, 12000, 12000, 0, 0, 20, 0, 0),
(48, 0, 0, 0, 0, 0, 'Dark House #48', 1, 12, 12000, 12000, 0, 0, 20, 0, 0),
(49, 0, 0, 0, 0, 0, 'Dark House #49', 1, 20, 20000, 20000, 1, 0, 30, 0, 0),
(50, 0, 0, 1457665493, 0, 0, 'Dark House #50', 1, 52, 53000, 53000, 1, 1, 81, 0, 0),
(52, 0, 0, 0, 0, 0, '', 1, 14, 15000, 15000, 0, 1, 20, 0, 0),
(53, 0, 0, 0, 0, 0, '', 1, 6, 7000, 7000, 0, 1, 11, 0, 0),
(54, 0, 0, 0, 0, 0, '', 1, 8, 9000, 9000, 0, 1, 13, 0, 0),
(55, 0, 0, 0, 0, 0, '', 1, 6, 7000, 7000, 0, 1, 11, 0, 0),
(56, 0, 0, 0, 0, 0, 'Dark House #56', 1, 12, 14000, 14000, 1, 2, 25, 0, 0),
(57, 0, 0, 0, 0, 0, '', 1, 13, 14000, 14000, 0, 1, 18, 0, 0),
(58, 0, 0, 0, 0, 0, 'Dark House #58', 1, 8, 10000, 10000, 1, 2, 20, 0, 0),
(59, 0, 0, 0, 0, 0, 'Dark House #59', 1, 7, 8000, 8000, 1, 1, 12, 0, 0),
(60, 0, 0, 0, 0, 0, 'Dark House #60', 1, 13, 14000, 14000, 1, 1, 15, 0, 0),
(61, 0, 0, 0, 0, 0, 'Dark House #61', 1, 24, 26000, 26000, 1, 2, 48, 0, 0),
(62, 0, 0, 0, 0, 0, 'Dark House #62', 1, 24, 26000, 26000, 1, 2, 46, 0, 0),
(63, 0, 0, 0, 0, 0, 'Dark House #63', 1, 22, 24000, 24000, 1, 2, 29, 0, 0),
(64, 0, 0, 0, 0, 0, 'Dark House #64', 1, 11, 13000, 13000, 1, 2, 28, 0, 0),
(65, 0, 0, 1457731738, 0, 0, 'Dark House #65', 1, 26, 28000, 28000, 2, 2, 54, 0, 0),
(66, 0, 0, 0, 0, 0, 'Dark House #66', 1, 20, 22000, 22000, 2, 2, 41, 0, 0),
(67, 0, 0, 0, 0, 0, 'Dark House #67', 1, 26, 28000, 28000, 2, 2, 54, 0, 0),
(68, 0, 0, 0, 0, 0, 'Dark House #68', 1, 38, 40000, 40000, 2, 2, 72, 0, 0),
(69, 0, 0, 0, 0, 0, 'Dark House #69', 1, 25, 27000, 27000, 1, 2, 48, 0, 0),
(70, 0, 0, 0, 0, 0, 'Dark House #70', 1, 19, 20000, 20000, 1, 1, 32, 0, 0),
(71, 0, 0, 0, 0, 0, 'Dark House #71', 1, 10, 11000, 11000, 1, 1, 25, 0, 0),
(72, 0, 0, 0, 0, 0, 'Dark House #72', 1, 16, 17000, 17000, 1, 1, 28, 0, 0),
(73, 0, 0, 0, 0, 0, 'Dark House #73', 1, 18, 20000, 20000, 0, 2, 30, 0, 0),
(74, 0, 0, 0, 0, 0, 'Dark House #74', 1, 32, 34000, 34000, 1, 2, 43, 0, 0),
(75, 0, 0, 0, 0, 0, 'Dark House #75', 1, 8, 9000, 9000, 1, 1, 24, 0, 0),
(77, 0, 0, 0, 0, 0, 'Dark House #77', 1, 47, 48000, 48000, 2, 1, 90, 0, 0),
(78, 0, 0, 0, 0, 0, 'Dark House #78', 1, 56, 58000, 58000, 1, 2, 85, 0, 0),
(79, 0, 0, 0, 0, 0, 'Dark House #79', 1, 56, 58000, 58000, 1, 2, 90, 0, 0),
(80, 0, 0, 0, 0, 0, 'Dark House #80', 1, 56, 58000, 58000, 1, 2, 90, 0, 0),
(81, 0, 0, 0, 0, 0, 'Dark House #81', 1, 56, 58000, 58000, 1, 2, 84, 0, 0),
(82, 0, 0, 0, 0, 0, 'Dark House #82', 1, 56, 58000, 58000, 1, 2, 84, 0, 0),
(83, 0, 0, 0, 0, 0, 'Dark House #83', 1, 19, 20000, 20000, 1, 1, 32, 0, 0),
(84, 0, 0, 0, 0, 0, 'Dark House #84', 1, 28, 29000, 29000, 1, 1, 42, 0, 0),
(85, 0, 0, 0, 0, 0, 'Dark House #85', 1, 14, 15000, 15000, 1, 1, 25, 0, 0),
(86, 0, 0, 0, 0, 0, '', 1, 62, 62000, 62000, 0, 0, 84, 0, 0),
(87, 0, 0, 0, 0, 0, 'Dark House #87', 1, 57, 58000, 58000, 1, 1, 84, 0, 0),
(88, 0, 0, 0, 0, 0, '', 1, 64, 64000, 64000, 0, 0, 99, 0, 0),
(89, 0, 0, 0, 0, 0, 'Dark House #89', 1, 27, 30000, 30000, 3, 3, 57, 0, 0),
(90, 0, 0, 0, 0, 0, 'Dark House #90', 1, 47, 49000, 49000, 2, 2, 84, 0, 0),
(91, 0, 0, 0, 0, 0, '', 1, 54, 55000, 55000, 0, 1, 59, 0, 0),
(92, 0, 0, 1457757361, 0, 0, '', 1, 26, 27000, 27000, 0, 1, 31, 0, 0),
(93, 0, 0, 0, 0, 0, 'Dark House #93', 1, 20, 21000, 21000, 1, 1, 34, 0, 0),
(94, 0, 0, 0, 0, 0, 'Dark House #94', 1, 13, 14000, 14000, 1, 1, 33, 0, 0),
(95, 0, 0, 0, 0, 0, 'Dark House #95', 1, 30, 31000, 31000, 1, 1, 50, 0, 0),
(96, 0, 0, 0, 0, 0, 'Dark House #96', 1, 53, 54000, 54000, 1, 1, 91, 0, 0),
(97, 0, 0, 0, 0, 0, 'Dark House #97', 1, 38, 39000, 39000, 2, 1, 63, 0, 0),
(98, 0, 0, 0, 0, 0, 'Dark House #98', 1, 18, 19000, 19000, 2, 1, 37, 0, 0),
(99, 0, 0, 0, 0, 0, 'Dark House #99', 1, 10, 11000, 11000, 1, 1, 29, 0, 0),
(100, 0, 0, 0, 0, 0, 'Dark House #100', 1, 208, 209000, 209000, 1, 1, 260, 0, 0),
(101, 0, 0, 0, 0, 0, 'Dark House #101', 1, 160, 161000, 161000, 1, 1, 193, 0, 0),
(102, 0, 0, 0, 0, 0, 'Dark House #102', 1, 416, 417000, 417000, 3, 1, 544, 0, 0),
(103, 0, 0, 0, 0, 0, 'Dark House #103', 1, 268, 269000, 269000, 3, 1, 341, 0, 0),
(104, 0, 0, 0, 0, 0, 'Dark House #104', 1, 97, 98000, 98000, 1, 1, 135, 0, 0),
(105, 0, 0, 0, 0, 0, 'Dark House #105', 1, 133, 134000, 134000, 1, 1, 180, 0, 0),
(106, 0, 0, 0, 0, 0, 'Dark House #106', 1, 148, 149000, 149000, 1, 1, 200, 0, 0),
(107, 0, 0, 0, 0, 0, '', 1, 10, 11000, 11000, 0, 1, 16, 0, 0),
(108, 0, 0, 0, 0, 0, '', 1, 17, 18000, 18000, 0, 1, 21, 0, 0),
(109, 0, 0, 0, 0, 0, '', 1, 38, 39000, 39000, 0, 1, 52, 0, 0),
(110, 0, 0, 0, 0, 0, '', 1, 150, 152000, 152000, 0, 2, 184, 0, 0),
(111, 0, 0, 0, 0, 0, '', 1, 30, 31000, 31000, 0, 1, 35, 0, 0),
(112, 0, 0, 0, 0, 0, 'Dark House #112', 1, 170, 171000, 171000, 1, 1, 192, 0, 0),
(113, 0, 0, 0, 0, 0, 'Dark House #113', 1, 406, 407000, 407000, 1, 1, 510, 0, 0),
(114, 0, 0, 0, 0, 0, 'Dark House #114', 1, 69, 69000, 69000, 1, 0, 84, 0, 0),
(115, 0, 0, 0, 0, 0, 'Dark House #115', 1, 128, 128000, 128000, 1, 0, 171, 0, 0),
(116, 0, 0, 0, 0, 0, 'Dark House #116', 1, 64, 64000, 64000, 1, 0, 81, 0, 0),
(117, 0, 0, 0, 0, 0, 'Dark House #117', 1, 60, 60000, 60000, 1, 0, 80, 0, 0),
(118, 0, 0, 0, 0, 0, 'Dark House #118', 1, 64, 64000, 64000, 1, 0, 89, 0, 0),
(119, 0, 0, 0, 0, 0, 'Dark House #119', 1, 44, 44000, 44000, 1, 0, 68, 0, 0),
(120, 0, 0, 0, 0, 0, 'Dark House #120', 1, 63, 63000, 63000, 1, 0, 99, 0, 0),
(121, 0, 0, 0, 0, 0, 'Dark House #121', 1, 63, 63000, 63000, 1, 0, 88, 0, 0),
(122, 0, 0, 0, 0, 0, 'Dark House #122', 1, 72, 72000, 72000, 1, 0, 110, 0, 0),
(123, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 38, 0, 0),
(124, 0, 0, 0, 0, 0, 'Dark House #124', 1, 60, 60000, 60000, 1, 0, 96, 0, 0),
(144, 0, 0, 0, 0, 0, 'Morgum House #144', 2, 45, 46000, 46000, 1, 1, 54, 0, 0),
(145, 0, 0, 0, 0, 1456425234, 'Morgum House #145', 2, 54, 55000, 55000, 1, 1, 90, 0, 0),
(146, 0, 0, 0, 0, 0, 'Morgum House #146', 2, 54, 55000, 55000, 1, 1, 90, 0, 0),
(147, 0, 0, 0, 0, 0, 'Morgum House #147', 2, 54, 55000, 55000, 1, 1, 64, 0, 0),
(148, 0, 0, 0, 0, 0, '', 1, 37, 37000, 37000, 0, 0, 49, 0, 0),
(149, 0, 0, 0, 0, 0, 'Morgum House #149', 2, 40, 41000, 41000, 1, 1, 48, 0, 0),
(150, 0, 0, 0, 0, 0, 'Morgum House #150', 2, 48, 49000, 49000, 2, 1, 72, 0, 0),
(151, 0, 0, 0, 0, 0, 'Morgum House #151', 2, 54, 55000, 55000, 1, 1, 72, 0, 0),
(152, 0, 0, 0, 0, 0, 'Morgum House #152', 2, 121, 123000, 123000, 1, 2, 135, 0, 0),
(153, 0, 0, 0, 0, 0, '', 1, 36, 36000, 36000, 0, 0, 42, 0, 0),
(154, 0, 0, 0, 0, 0, 'Morgum House #154', 2, 35, 36000, 36000, 2, 1, 56, 0, 0),
(155, 0, 0, 0, 0, 0, 'Morgum House #155', 2, 35, 36000, 36000, 2, 1, 56, 0, 0),
(156, 0, 0, 0, 0, 0, 'Morgum House #156', 2, 35, 36000, 36000, 2, 1, 57, 0, 0),
(157, 0, 0, 0, 0, 0, 'Morgum House #157', 2, 49, 49000, 49000, 2, 0, 80, 0, 0),
(158, 0, 0, 0, 0, 0, 'Morgum House #158', 2, 36, 36000, 36000, 1, 0, 42, 0, 0),
(159, 0, 0, 0, 0, 0, 'Morgum House #159', 2, 79, 81000, 81000, 1, 2, 92, 0, 0),
(160, 0, 0, 0, 0, 0, 'Morgum House #160', 2, 49, 49000, 49000, 1, 0, 66, 0, 0),
(161, 0, 0, 0, 0, 0, 'Morgum House #161', 2, 48, 48000, 48000, 1, 0, 73, 0, 0),
(162, 0, 0, 0, 0, 0, '', 1, 42, 42000, 42000, 0, 0, 43, 0, 0),
(163, 0, 0, 0, 0, 0, 'Dark House #163', 1, 9, 9000, 9000, 1, 0, 12, 0, 0),
(164, 0, 0, 0, 0, 0, 'Dark House #164', 1, 9, 9000, 9000, 1, 0, 12, 0, 0),
(165, 0, 0, 0, 0, 0, 'Dark House #165', 1, 9, 9000, 9000, 1, 0, 12, 0, 0),
(166, 0, 0, 0, 0, 0, 'Dark House #166', 1, 9, 9000, 9000, 1, 0, 12, 0, 0),
(167, 0, 0, 0, 0, 0, 'Dark House #167', 1, 9, 9000, 9000, 1, 0, 12, 0, 0),
(168, 0, 0, 0, 0, 0, 'Dark House #168', 1, 9, 9000, 9000, 1, 0, 12, 0, 0),
(169, 0, 0, 0, 0, 0, 'Dark House #169', 1, 9, 9000, 9000, 1, 0, 12, 0, 0),
(170, 0, 0, 0, 0, 0, 'New House', 1, 22, 23000, 23000, 1, 1, 48, 0, 0),
(171, 0, 0, 1458061660, 1, 1458108234, 'New House', 1, 14, 15000, 15000, 1, 1, 32, 0, 0),
(172, 0, 0, 0, 0, 0, 'Dark House #172', 1, 9, 9000, 9000, 1, 0, 12, 0, 0),
(173, 0, 0, 0, 0, 0, 'Dark House #173', 1, 9, 9000, 9000, 1, 0, 16, 0, 0),
(174, 0, 0, 0, 0, 0, 'Dark House #174', 1, 9, 9000, 9000, 1, 0, 16, 0, 0),
(175, 0, 0, 0, 0, 0, 'Dark House #175', 1, 9, 9000, 9000, 1, 0, 15, 0, 0),
(178, 0, 0, 0, 0, 0, 'Dark House #178', 1, 9, 9000, 9000, 1, 0, 20, 0, 0),
(179, 0, 0, 0, 0, 0, 'Dark House #179', 1, 9, 9000, 9000, 1, 0, 20, 0, 0),
(180, 0, 0, 0, 0, 0, 'Dark House #180', 1, 9, 9000, 9000, 1, 0, 17, 0, 0),
(197, 0, 0, 0, 0, 0, 'New House', 1, 18, 19000, 19000, 0, 1, 39, 0, 0),
(198, 0, 0, 0, 0, 0, 'New House', 1, 1, 1000, 1000, 0, 0, 2, 0, 0),
(202, 0, 0, 1458497884, 0, 0, 'New House', 1, 19, 20000, 20000, 0, 1, 43, 0, 0),
(203, 0, 0, 1458459026, 0, 0, 'New House', 1, 20, 21000, 21000, 0, 1, 38, 0, 0),
(204, 0, 0, 1458008920, 2, 1458184530, 'New House', 1, 16, 17000, 17000, 0, 1, 33, 0, 0),
(205, 0, 0, 1458654587, 0, 0, 'New House', 1, 30, 31000, 31000, 0, 1, 58, 0, 0),
(206, 0, 0, 0, 0, 0, 'New House', 1, 53, 54000, 54000, 0, 1, 80, 0, 0),
(207, 0, 0, 1457831245, 3, 1458108234, 'New House', 1, 38, 39000, 39000, 2, 1, 79, 0, 0),
(208, 0, 0, 1458116321, 1, 1458184530, 'New House', 1, 18, 19000, 19000, 2, 1, 43, 0, 0),
(209, 0, 0, 0, 0, 0, 'New House', 1, 10, 11000, 11000, 1, 1, 28, 0, 0),
(210, 0, 0, 1457960359, 2, 1458108234, 'New House', 1, 44, 46000, 46000, 0, 2, 83, 0, 0),
(212, 0, 0, 1457932430, 0, 0, '', 1, 74, 74000, 74000, 1, 0, 179, 0, 0),
(213, 0, 0, 0, 0, 0, '', 1, 26, 28000, 28000, 2, 2, 56, 0, 0),
(214, 0, 0, 1457746745, 0, 0, '', 1, 20, 22000, 22000, 2, 2, 45, 0, 0),
(215, 0, 0, 1457810142, 0, 0, '', 1, 26, 28000, 28000, 2, 2, 54, 0, 0),
(216, 0, 0, 1457822309, 0, 0, '', 1, 38, 40000, 40000, 2, 2, 71, 0, 0),
(217, 0, 0, 1457757979, 0, 0, '', 1, 25, 27000, 27000, 1, 2, 47, 0, 0),
(218, 0, 0, 1457828441, 0, 0, '', 1, 10, 11000, 11000, 1, 1, 20, 0, 0),
(225, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 3, 0, 0),
(226, 0, 0, 0, 0, 0, 'New House', 1, 10, 11000, 11000, 1, 1, 25, 0, 0),
(227, 0, 0, 1457949185, 2, 1458108234, 'New House', 1, 13, 14000, 14000, 1, 1, 31, 0, 0),
(228, 0, 0, 1458068385, 0, 0, '', 1, 18, 19000, 19000, 1, 1, 24, 0, 0),
(229, 0, 0, 1458073679, 0, 0, '', 1, 15, 16000, 16000, 1, 1, 24, 0, 0),
(230, 0, 0, 1457978705, 0, 0, '', 1, 28, 29000, 29000, 1, 1, 45, 0, 0),
(231, 0, 0, 1458053648, 0, 0, '', 1, 22, 23000, 23000, 1, 1, 32, 0, 0),
(232, 0, 0, 1458050588, 0, 0, '', 1, 28, 29000, 29000, 1, 1, 47, 0, 0),
(234, 0, 0, 1458021317, 0, 0, '', 1, 12, 14000, 14000, 1, 2, 25, 0, 0),
(235, 0, 0, 1457962738, 0, 0, '', 1, 7, 8000, 8000, 1, 1, 19, 0, 0),
(236, 0, 0, 0, 0, 0, '', 1, 13, 14000, 14000, 0, 1, 30, 0, 0),
(1901, 0, 0, 1458021157, 0, 0, '', 1, 24, 26000, 26000, 1, 2, 45, 0, 0),
(1902, 0, 0, 1458061844, 0, 0, '', 1, 24, 26000, 26000, 1, 2, 53, 0, 0),
(1903, 0, 0, 1458061968, 0, 0, '', 1, 22, 24000, 24000, 1, 2, 35, 0, 0),
(1904, 0, 0, 1458062199, 0, 0, '', 1, 11, 13000, 13000, 1, 2, 35, 0, 0),
(1905, 0, 0, 1458059380, 0, 0, '', 1, 8, 10000, 10000, 1, 2, 28, 0, 0),
(1906, 0, 0, 1458057368, 0, 0, '', 1, 12, 14000, 14000, 1, 2, 29, 0, 0),
(1908, 0, 0, 0, 0, 0, '', 1, 32, 32000, 32000, 1, 0, 50, 0, 0),
(1909, 0, 0, 0, 0, 0, '', 1, 24, 24000, 24000, 1, 0, 39, 0, 0),
(1910, 0, 0, 0, 0, 0, '', 1, 33, 33000, 33000, 1, 0, 62, 0, 0),
(1911, 0, 0, 1457922067, 0, 0, '', 1, 68, 68000, 68000, 1, 0, 86, 0, 0),
(1912, 0, 0, 0, 0, 0, '', 1, 32, 32000, 32000, 1, 0, 50, 0, 0),
(1913, 0, 0, 0, 0, 0, '', 1, 48, 48000, 48000, 1, 0, 70, 0, 0),
(1914, 0, 0, 1458086263, 0, 0, '', 1, 48, 48000, 48000, 1, 0, 70, 0, 0),
(1915, 0, 0, 0, 1, 1457515253, '', 1, 56, 56000, 56000, 1, 0, 80, 0, 0),
(1916, 0, 0, 1458144359, 0, 0, '', 1, 28, 28000, 28000, 1, 0, 54, 0, 0),
(1917, 0, 0, 1458073554, 0, 0, '', 1, 35, 35000, 35000, 1, 0, 62, 0, 0),
(1918, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 1, 1, 12, 0, 0),
(1919, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 1, 1, 12, 0, 0),
(1920, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 1, 1, 12, 0, 0),
(1921, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 1, 1, 12, 0, 0),
(1922, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 1, 1, 12, 0, 0),
(1923, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 1, 1, 12, 0, 0),
(1924, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 1, 1, 12, 0, 0),
(1925, 0, 0, 0, 0, 0, '', 1, 20, 21000, 21000, 3, 1, 32, 0, 0),
(1926, 0, 0, 1457982886, 0, 0, '', 1, 20, 21000, 21000, 3, 1, 33, 0, 0),
(1927, 0, 0, 1457987641, 0, 0, '', 1, 55, 58000, 58000, 2, 3, 96, 0, 0),
(1928, 0, 0, 0, 0, 0, '', 1, 95, 98000, 98000, 3, 3, 137, 0, 0),
(1929, 0, 0, 0, 0, 0, '', 1, 42, 45000, 45000, 2, 3, 63, 0, 0),
(1930, 0, 0, 0, 0, 0, '', 1, 18, 21000, 21000, 2, 3, 29, 0, 0),
(1931, 0, 0, 0, 0, 0, '', 1, 10, 12000, 12000, 2, 2, 17, 0, 0),
(1932, 0, 0, 0, 0, 0, '', 1, 18, 21000, 21000, 2, 3, 29, 0, 0),
(1933, 0, 0, 0, 0, 0, '', 1, 18, 21000, 21000, 2, 3, 28, 0, 0),
(1934, 0, 0, 0, 0, 0, '', 1, 2, 3000, 3000, 1, 1, 5, 0, 0),
(1935, 0, 0, 1458568674, 0, 0, 'New House', 1, 11, 13000, 13000, 1, 2, 17, 0, 0),
(1936, 0, 0, 0, 0, 0, '', 1, 19, 19000, 19000, 2, 0, 29, 0, 0),
(1937, 0, 0, 1457831194, 0, 0, '', 1, 40, 43000, 43000, 2, 3, 72, 0, 0),
(1938, 0, 0, 1457826821, 0, 0, '', 1, 37, 42000, 42000, 2, 5, 59, 0, 0),
(1939, 0, 0, 1457926305, 0, 0, '', 1, 24, 25000, 25000, 1, 1, 41, 0, 0),
(1940, 0, 0, 1457743894, 0, 0, '', 1, 40, 42000, 42000, 1, 2, 67, 0, 0),
(1941, 0, 0, 1458093180, 0, 0, '', 1, 16, 17000, 17000, 1, 1, 36, 0, 0),
(1942, 0, 0, 1457758376, 0, 0, '', 1, 66, 69000, 69000, 2, 3, 102, 0, 0),
(1943, 0, 0, 1458121783, 1, 1458184530, 'New House', 1, 0, 0, 0, 0, 0, 1, 0, 0),
(1944, 0, 0, 1458132681, 1, 1458184530, 'New House', 1, 19, 20000, 20000, 1, 1, 35, 0, 0),
(1945, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 1, 1, 9, 0, 0),
(1946, 0, 0, 1458056404, 0, 0, '', 1, 55, 57000, 57000, 3, 2, 102, 0, 0),
(1947, 0, 0, 0, 0, 0, 'New House', 1, 6, 7000, 7000, 1, 1, 9, 0, 0),
(1948, 0, 0, 0, 0, 0, 'New House', 1, 6, 7000, 7000, 1, 1, 9, 0, 0),
(1949, 0, 0, 0, 0, 0, 'New House', 1, 6, 7000, 7000, 1, 1, 9, 0, 0),
(1950, 0, 0, 0, 0, 0, 'New House', 1, 8, 9000, 9000, 1, 1, 12, 0, 0),
(1951, 0, 0, 0, 0, 0, 'New House', 1, 6, 7000, 7000, 1, 1, 9, 0, 0),
(1952, 0, 0, 0, 0, 0, 'New House', 1, 6, 7000, 7000, 1, 1, 9, 0, 0),
(1953, 0, 0, 1457817531, 0, 0, 'New House', 1, 36, 38000, 38000, 2, 2, 68, 0, 0),
(1954, 0, 0, 1457810479, 0, 0, 'New House', 1, 54, 57000, 57000, 3, 3, 84, 0, 0),
(1955, 0, 0, 1458234091, 0, 0, 'New House', 1, 56, 59000, 59000, 3, 3, 98, 0, 0),
(1956, 0, 0, 1457965565, 0, 0, 'New House', 1, 46, 49000, 49000, 2, 3, 65, 0, 0),
(1957, 0, 0, 0, 0, 0, 'New House', 1, 46, 49000, 49000, 1, 3, 82, 0, 0),
(1958, 0, 0, 1458654587, 0, 0, 'New House', 1, 20, 22000, 22000, 0, 2, 25, 0, 0),
(1959, 0, 0, 1457747299, 3, 1458108234, 'New House', 1, 10, 11000, 11000, 1, 1, 14, 0, 0),
(1960, 0, 0, 0, 0, 0, 'New House', 1, 10, 11000, 11000, 1, 1, 15, 0, 0),
(1961, 0, 0, 1458500925, 0, 0, 'New House', 1, 24, 26000, 26000, 1, 2, 31, 0, 0),
(1962, 0, 0, 1458056606, 0, 0, 'New House', 1, 98, 100000, 100000, 3, 2, 143, 0, 0),
(1963, 0, 0, 1457989169, 0, 0, 'New House', 1, 82, 85000, 85000, 2, 3, 120, 0, 0),
(1964, 0, 0, 1457811791, 0, 0, 'New House', 1, 87, 90000, 90000, 2, 3, 123, 0, 0),
(1965, 0, 0, 1457796218, 0, 0, 'New House', 1, 68, 71000, 71000, 2, 3, 101, 0, 0),
(1966, 0, 0, 1457792805, 0, 0, 'New House', 1, 61, 64000, 64000, 2, 3, 92, 0, 0),
(1967, 0, 0, 1457743711, 0, 0, 'New House', 1, 46, 48000, 48000, 2, 2, 79, 0, 0),
(1968, 0, 0, 0, 0, 0, 'New House', 1, 32, 34000, 34000, 2, 2, 56, 0, 0),
(1969, 0, 0, 0, 0, 0, 'New House', 1, 32, 33000, 33000, 2, 1, 51, 0, 0),
(1970, 0, 0, 0, 0, 0, 'New House', 1, 45, 47000, 47000, 2, 2, 67, 0, 0),
(1971, 0, 0, 1457938274, 0, 0, 'New House', 1, 37, 39000, 39000, 3, 2, 60, 0, 0),
(1972, 0, 0, 1458058645, 0, 0, 'New House', 1, 63, 66000, 66000, 2, 3, 99, 0, 0),
(1973, 0, 0, 1457952845, 0, 0, 'New House', 1, 60, 63000, 63000, 2, 3, 97, 0, 0),
(1974, 0, 0, 1457781248, 0, 0, 'New House', 1, 63, 66000, 66000, 2, 3, 100, 0, 0),
(1975, 0, 0, 1458014985, 0, 0, 'New House', 1, 63, 66000, 66000, 2, 3, 105, 0, 0),
(1976, 0, 0, 1457833023, 0, 0, 'New House', 1, 182, 190000, 190000, 7, 8, 295, 0, 0),
(1977, 0, 0, 1457826616, 0, 0, 'New House', 1, 97, 102000, 102000, 2, 5, 139, 0, 0),
(1978, 0, 0, 1457931617, 0, 0, 'New House', 1, 88, 92000, 92000, 3, 4, 136, 0, 0),
(1979, 0, 0, 1457803051, 0, 0, 'New House', 1, 116, 122000, 122000, 11, 6, 215, 0, 0),
(1980, 0, 0, 1458173183, 0, 0, 'New House', 1, 124, 129000, 129000, 3, 5, 167, 0, 0),
(1981, 0, 0, 1458713034, 0, 0, 'New House', 1, 11, 12000, 12000, 1, 1, 16, 0, 0),
(1982, 0, 0, 0, 0, 0, '', 1, 10, 11000, 11000, 1, 1, 15, 0, 0),
(1983, 0, 12308, 1460211302, 3, 1460791089, 'New House', 1, 41, 43000, 43000, 3, 2, 69, 0, 0),
(1984, 0, 17878, 1462235263, 0, 0, 'New House', 1, 41, 43000, 43000, 3, 2, 66, 0, 0),
(1985, 0, 18035, 0, 0, 1461262103, 'New House', 1, 88, 90000, 90000, 2, 2, 139, 0, 0),
(1986, 0, 20181, 1462269294, 0, 0, 'New House', 1, 61, 63000, 63000, 2, 2, 85, 0, 0),
(1987, 0, 18703, 1461871188, 0, 0, 'New House', 1, 52, 54000, 54000, 2, 2, 95, 0, 0),
(1988, 0, 16901, 0, 0, 1461568632, 'New House', 1, 61, 63000, 63000, 2, 2, 90, 0, 0),
(1989, 0, 19439, 1462227880, 0, 0, 'New House', 1, 61, 63000, 63000, 2, 2, 89, 0, 0),
(1990, 0, 20051, 1462216299, 0, 0, 'New House', 1, 68, 71000, 71000, 2, 3, 94, 0, 0),
(1991, 0, 13763, 1461578238, 0, 0, 'New House', 1, 53, 55000, 55000, 2, 2, 79, 0, 0),
(1992, 0, 0, 0, 0, 0, 'New House', 1, 69, 72000, 72000, 3, 3, 104, 0, 0),
(1993, 0, 0, 0, 0, 0, 'New House', 1, 90, 92000, 92000, 1, 2, 120, 0, 0),
(1994, 0, 0, 0, 0, 0, 'New House', 1, 59, 61000, 61000, 1, 2, 90, 0, 0),
(1995, 0, 0, 0, 0, 0, '', 1, 13, 15000, 15000, 1, 2, 17, 0, 0),
(1996, 0, 0, 0, 0, 0, 'New House', 1, 60, 62000, 62000, 3, 2, 97, 0, 0),
(1997, 0, 0, 0, 0, 0, 'New House', 1, 52, 54000, 54000, 2, 2, 77, 0, 0),
(1998, 0, 0, 0, 0, 0, '', 1, 16, 18000, 18000, 1, 2, 22, 0, 0),
(1999, 0, 0, 0, 0, 0, 'New House', 1, 277, 287000, 287000, 4, 10, 447, 0, 0),
(2000, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 1, 1, 12, 0, 0),
(2001, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 1, 1, 10, 0, 0),
(2002, 0, 0, 0, 0, 0, '', 1, 8, 9000, 9000, 1, 1, 11, 0, 0),
(2003, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 1, 1, 10, 0, 0),
(2078, 0, 0, 0, 0, 0, '', 1, 245, 254000, 254000, 11, 9, 428, 0, 0),
(2234, 0, 0, 0, 0, 0, '', 1, 31, 32000, 32000, 1, 1, 67, 0, 0),
(2235, 0, 0, 0, 0, 0, '', 1, 31, 32000, 32000, 1, 1, 70, 0, 0),
(2236, 0, 0, 0, 0, 0, '', 1, 31, 32000, 32000, 1, 1, 67, 0, 0),
(2252, 0, 0, 0, 0, 0, '', 1, 62, 63000, 63000, 0, 1, 67, 0, 0),
(2253, 0, 0, 0, 0, 0, '', 1, 83, 84000, 84000, 0, 1, 119, 0, 0),
(2254, 0, 0, 0, 0, 0, '', 1, 72, 73000, 73000, 0, 1, 86, 0, 0),
(2255, 0, 0, 0, 0, 0, '', 1, 28, 28000, 28000, 0, 0, 29, 0, 0),
(2260, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 0, 1, 20, 0, 0),
(2261, 0, 0, 0, 0, 0, '', 1, 14, 16000, 16000, 0, 2, 28, 0, 0),
(2262, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 0, 1, 20, 0, 0),
(2263, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 0, 1, 20, 0, 0),
(2264, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 0, 1, 20, 0, 0),
(2265, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 0, 1, 20, 0, 0),
(2266, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 0, 1, 20, 0, 0),
(2267, 0, 0, 0, 0, 0, '', 1, 7, 8000, 8000, 0, 1, 20, 0, 0),
(2282, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 2, 0, 0),
(2284, 0, 18541, 1461981924, 0, 0, 'New House', 1, 72, 75000, 75000, 4, 3, 136, 0, 0),
(2285, 0, 19853, 1462213526, 0, 0, 'New House', 1, 58, 61000, 61000, 4, 3, 114, 0, 0),
(2286, 0, 14898, 1461001479, 0, 0, 'New House', 1, 150, 152000, 152000, 1, 2, 230, 0, 0),
(2287, 0, 13891, 1461395889, 0, 0, 'New House', 1, 69, 70000, 70000, 1, 1, 109, 0, 0),
(2288, 0, 0, 0, 0, 0, '', 1, 29, 29000, 29000, 0, 0, 56, 0, 0),
(2295, 0, 16281, 1461439285, 0, 0, 'New House', 1, 208, 209000, 209000, 1, 1, 224, 0, 0),
(2296, 0, 19010, 1461970793, 0, 0, 'New House', 1, 133, 134000, 134000, 1, 1, 164, 0, 0),
(2297, 0, 9589, 1460810295, 0, 0, 'New House', 1, 97, 98000, 98000, 1, 1, 123, 0, 0),
(2298, 0, 18313, 1462279415, 0, 0, 'New House', 1, 171, 174000, 174000, 4, 3, 251, 0, 0),
(2299, 0, 10095, 1461101926, 0, 0, 'New House', 1, 168, 171000, 171000, 2, 3, 232, 0, 0),
(2300, 0, 13126, 1460656099, 1, 1460791089, 'New House', 1, 398, 399000, 399000, 1, 1, 448, 0, 0),
(2301, 0, 13874, 1461396152, 0, 0, 'New House', 1, 234, 235000, 235000, 1, 1, 248, 0, 0),
(2302, 0, 19340, 1462265429, 0, 0, 'New House', 1, 251, 252000, 252000, 2, 1, 299, 0, 0),
(2303, 0, 16509, 1461732122, 0, 0, 'New House', 1, 236, 237000, 237000, 2, 1, 270, 0, 0),
(2304, 0, 12765, 1462294363, 0, 0, 'New House', 1, 190, 191000, 191000, 1, 1, 223, 0, 0),
(2305, 0, 13963, 1461599903, 0, 0, 'New House', 1, 160, 161000, 161000, 1, 1, 177, 0, 0),
(2306, 0, 16663, 0, 0, 1461233041, 'New House', 1, 416, 417000, 417000, 2, 1, 489, 0, 0),
(2307, 0, 16105, 1461774140, 0, 0, 'New House', 1, 299, 302000, 302000, 3, 3, 382, 0, 0),
(2308, 0, 18756, 1461866896, 0, 0, 'New House', 1, 406, 407000, 407000, 1, 1, 446, 0, 0),
(2311, 0, 0, 0, 0, 0, '', 1, 32, 34000, 34000, 0, 2, 64, 0, 0),
(2312, 0, 0, 0, 0, 0, '', 1, 32, 34000, 34000, 0, 2, 56, 0, 0),
(2313, 0, 0, 0, 0, 0, '', 1, 32, 34000, 34000, 1, 2, 49, 0, 0),
(2314, 0, 0, 0, 0, 0, '', 1, 32, 34000, 34000, 0, 2, 64, 0, 0),
(2319, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 2, 0, 0),
(2368, 0, 0, 0, 0, 0, '', 1, 1, 1000, 1000, 0, 0, 61, 0, 0),
(2369, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 23, 0, 0),
(2370, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 13, 0, 0),
(2371, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 23, 0, 0),
(2372, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 23, 0, 0),
(2373, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 10, 0, 0),
(2374, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 15, 0, 0),
(2375, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 23, 0, 0),
(2376, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 10, 0, 0),
(2377, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 24, 0, 0),
(2380, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 27, 0, 0),
(2381, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 23, 0, 0),
(2382, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 27, 0, 0),
(2383, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 15, 0, 0),
(2384, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 21, 0, 0),
(2385, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 13, 0, 0),
(2386, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 14, 0, 0),
(2387, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 23, 0, 0),
(2388, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 13, 0, 0),
(2389, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 22, 0, 0),
(2390, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 14, 0, 0),
(2391, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 10, 0, 0),
(2392, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 19, 0, 0),
(2393, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 22, 0, 0),
(2394, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 20, 0, 0),
(2395, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 15, 0, 0),
(2396, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 22, 0, 0),
(2404, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 1, 0, 0),
(2552, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 3, 0, 0),
(2633, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 17, 0, 0),
(2673, 0, 9538, 1459254885, 0, 0, '', 0, 47, 48000, 48000, 1, 1, 81, 0, 0),
(2832, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 2, 0, 0),
(268435457, 0, 0, 0, 0, 0, '', 1, 15, 16000, 16000, 0, 1, 24, 0, 0),
(268435458, 0, 0, 0, 0, 0, '', 1, 19, 20000, 20000, 0, 1, 28, 0, 0),
(268435487, 0, 0, 0, 0, 0, '', 1, 48, 49000, 49000, 0, 1, 60, 0, 0),
(268435488, 0, 0, 0, 0, 0, '', 1, 50, 50000, 50000, 0, 0, 62, 0, 0),
(268435489, 0, 0, 0, 0, 0, '', 1, 50, 50000, 50000, 0, 0, 66, 0, 0),
(268435490, 0, 0, 0, 0, 0, '', 1, 58, 59000, 59000, 0, 1, 70, 0, 0),
(268435499, 0, 0, 0, 0, 0, '', 1, 40, 40000, 40000, 0, 0, 47, 0, 0),
(268435500, 0, 0, 0, 0, 0, '', 1, 40, 40000, 40000, 0, 0, 48, 0, 0),
(268435501, 0, 0, 0, 0, 0, '', 1, 40, 40000, 40000, 0, 0, 53, 0, 0),
(268435502, 0, 0, 0, 0, 0, '', 1, 40, 40000, 40000, 0, 0, 51, 0, 0),
(268435503, 0, 0, 0, 0, 0, '', 1, 36, 36000, 36000, 0, 0, 51, 0, 0),
(268435504, 0, 0, 0, 0, 0, '', 1, 64, 64000, 64000, 0, 0, 84, 0, 0),
(268435505, 0, 0, 0, 0, 0, '', 1, 64, 64000, 64000, 0, 0, 85, 0, 0),
(268435506, 0, 0, 0, 0, 0, '', 1, 48, 48000, 48000, 0, 0, 66, 0, 0),
(268435518, 0, 0, 0, 0, 0, '', 1, 24, 24000, 24000, 0, 0, 30, 0, 0),
(268435519, 0, 0, 0, 0, 0, 'New House', 1, 38, 40000, 40000, 0, 2, 57, 0, 0),
(268435520, 0, 0, 1457977434, 2, 1458108234, 'New House', 1, 38, 40000, 40000, 0, 2, 49, 0, 0),
(268435521, 0, 12739, 1460973042, 0, 0, 'New House', 1, 118, 120000, 120000, 3, 2, 147, 0, 0),
(268435522, 0, 0, 0, 0, 0, 'New House', 1, 28, 29000, 29000, 1, 1, 33, 0, 0),
(268435523, 0, 16457, 1461602182, 0, 0, 'New House', 1, 28, 29000, 29000, 1, 1, 34, 0, 0),
(268435524, 0, 15529, 1461592210, 0, 0, 'New House', 1, 28, 29000, 29000, 1, 1, 36, 0, 0),
(268435525, 0, 16215, 1461682505, 0, 0, 'New House', 1, 28, 29000, 29000, 1, 1, 35, 0, 0),
(268435526, 0, 14167, 1462074086, 0, 0, 'New House', 1, 28, 29000, 29000, 1, 1, 34, 0, 0),
(268435527, 0, 16458, 1461418697, 0, 0, 'New House', 1, 28, 29000, 29000, 1, 1, 38, 0, 0),
(268435528, 0, 15441, 1461393817, 0, 0, 'New House', 1, 26, 28000, 28000, 1, 2, 33, 0, 0),
(268435529, 0, 11228, 1461531309, 0, 0, 'New House', 1, 26, 28000, 28000, 1, 2, 33, 0, 0),
(268435530, 0, 9908, 1460588912, 1, 1460791089, 'New House', 1, 24, 24000, 24000, 1, 0, 35, 0, 0),
(268435531, 0, 13452, 1461557638, 0, 0, 'New House', 1, 24, 24000, 24000, 1, 0, 34, 0, 0),
(268435532, 0, 18519, 1462304400, 0, 0, 'New House', 1, 26, 27000, 27000, 1, 1, 31, 0, 0),
(268435533, 0, 11922, 1461536415, 0, 0, 'New House', 1, 24, 26000, 26000, 1, 2, 30, 0, 0),
(268435534, 0, 14992, 1461536453, 0, 0, 'New House', 1, 23, 23000, 23000, 1, 0, 25, 0, 0),
(268435535, 0, 14375, 1460778356, 1, 1460791089, 'New House', 1, 46, 48000, 48000, 1, 2, 56, 0, 0),
(268435536, 0, 0, 0, 0, 0, 'New House', 1, 70, 71000, 71000, 0, 1, 73, 0, 0),
(268435537, 0, 15148, 1461252384, 0, 0, 'New House', 1, 68, 69000, 69000, 1, 1, 83, 0, 0),
(268435538, 0, 10501, 1459981425, 3, 1460791089, 'New House', 1, 34, 34000, 34000, 2, 0, 41, 0, 0),
(268435539, 0, 14627, 1462207885, 0, 0, 'New House', 1, 42, 43000, 43000, 2, 1, 50, 0, 0),
(268435540, 0, 13613, 1460778135, 1, 1460791089, 'New House', 1, 22, 23000, 23000, 1, 1, 28, 0, 0),
(268435541, 0, 15169, 1461349672, 0, 0, 'New House', 1, 22, 23000, 23000, 1, 1, 25, 0, 0),
(268435542, 0, 16298, 1461536662, 0, 0, 'New House', 1, 22, 23000, 23000, 1, 1, 28, 0, 0),
(268435543, 0, 11278, 1461831085, 0, 0, 'New House', 1, 22, 23000, 23000, 1, 1, 25, 0, 0),
(268435544, 0, 15204, 1461572073, 0, 0, 'New House', 1, 22, 23000, 23000, 1, 1, 27, 0, 0),
(268435545, 0, 0, 0, 0, 0, 'New House', 1, 22, 23000, 23000, 1, 1, 25, 0, 0),
(268435546, 0, 16866, 1462074399, 0, 0, 'New House', 1, 22, 23000, 23000, 1, 1, 26, 0, 0),
(268435547, 0, 0, 0, 0, 0, 'New House', 1, 19, 20000, 20000, 1, 1, 23, 0, 0),
(268435548, 0, 0, 0, 0, 0, 'New House', 1, 19, 20000, 20000, 1, 1, 22, 0, 0),
(268435549, 0, 0, 0, 0, 0, 'New House', 1, 19, 20000, 20000, 1, 1, 22, 0, 0),
(268435550, 0, 0, 0, 0, 0, 'New House', 1, 19, 20000, 20000, 1, 1, 22, 0, 0),
(268435551, 0, 0, 0, 0, 0, 'New House', 1, 19, 20000, 20000, 1, 1, 22, 0, 0),
(268435552, 0, 0, 0, 0, 0, 'New House', 1, 19, 20000, 20000, 1, 1, 22, 0, 0),
(268435553, 0, 0, 1458419011, 0, 0, 'New House', 1, 55, 56000, 56000, 2, 1, 71, 0, 0),
(268435554, 0, 0, 1457964916, 2, 1458108234, 'New House', 1, 43, 44000, 44000, 1, 1, 48, 0, 0),
(268435555, 0, 0, 0, 0, 0, 'New House', 1, 43, 44000, 44000, 1, 1, 48, 0, 0),
(268435557, 0, 0, 1457987197, 2, 1458184530, 'New House', 1, 26, 27000, 27000, 2, 1, 35, 0, 0),
(268435558, 0, 0, 1458032205, 2, 1458184530, 'New House', 1, 33, 34000, 34000, 1, 1, 43, 0, 0),
(268435559, 0, 0, 1458436923, 0, 0, 'New House', 1, 52, 53000, 53000, 2, 1, 75, 0, 0),
(268435560, 0, 0, 1458785851, 0, 0, 'New House', 1, 20, 20000, 20000, 1, 0, 22, 0, 0),
(268435561, 0, 0, 1458256747, 0, 0, 'New House', 1, 12, 12000, 12000, 1, 0, 14, 0, 0),
(268435562, 0, 0, 1458257259, 0, 0, 'New House', 1, 12, 12000, 12000, 1, 0, 15, 0, 0),
(268435563, 0, 0, 1458080599, 1, 1458108234, 'New House', 1, 24, 24000, 24000, 0, 0, 34, 0, 0),
(268435565, 0, 0, 1458099194, 0, 0, 'New House', 1, 20, 20000, 20000, 1, 0, 35, 0, 0),
(268435567, 0, 0, 0, 3, 1458184530, 'New House', 1, 67, 67000, 67000, 1, 0, 83, 0, 0),
(268435568, 0, 0, 1458660772, 0, 0, 'New House', 1, 53, 53000, 53000, 1, 0, 67, 0, 0),
(268435569, 0, 0, 1458010469, 0, 0, 'New House', 1, 0, 0, 0, 0, 0, 1, 0, 0),
(268435570, 0, 17777, 1462258384, 0, 0, 'New House', 1, 72, 72000, 72000, 1, 0, 99, 0, 0),
(268435573, 0, 0, 0, 0, 0, 'New House', 1, 44, 44000, 44000, 0, 0, 53, 0, 0),
(268435574, 0, 0, 0, 0, 0, 'New House', 1, 64, 64000, 64000, 0, 0, 80, 0, 0),
(268435575, 0, 15636, 1462065958, 0, 0, 'New House', 1, 60, 60000, 60000, 1, 0, 76, 0, 0),
(268435576, 0, 15405, 1461117673, 0, 0, 'New House', 1, 96, 96000, 96000, 1, 0, 117, 0, 0),
(268435577, 0, 9149, 1460427471, 2, 1460791089, 'New House', 1, 128, 128000, 128000, 1, 0, 162, 0, 0),
(268435578, 0, 19221, 1462079449, 0, 0, 'New House', 1, 69, 69000, 69000, 1, 0, 88, 0, 0),
(268435579, 0, 15490, 1462156957, 0, 0, 'New House', 1, 60, 60000, 60000, 1, 0, 71, 0, 0),
(268435580, 0, 11940, 1462065862, 0, 0, 'New House', 1, 72, 72000, 72000, 1, 0, 90, 0, 0),
(268435581, 0, 16371, 1461425293, 0, 0, 'New House', 1, 56, 56000, 56000, 1, 0, 72, 0, 0),
(268435582, 0, 0, 0, 0, 0, 'New House', 1, 10, 11000, 11000, 0, 1, 24, 0, 0),
(268435583, 0, 0, 1458308245, 0, 0, 'New House', 1, 13, 14000, 14000, 1, 1, 25, 0, 0),
(268435584, 0, 0, 1458262592, 0, 0, 'New House', 1, 19, 20000, 20000, 1, 1, 32, 0, 0),
(268435585, 0, 0, 1458242805, 0, 0, 'New House', 1, 25, 27000, 27000, 1, 2, 56, 0, 0),
(268435586, 0, 0, 1458310593, 0, 0, 'New House', 1, 18, 20000, 20000, 1, 2, 30, 0, 0),
(268435587, 0, 0, 1458660817, 0, 0, 'New House', 1, 32, 34000, 34000, 1, 2, 49, 0, 0),
(268435588, 0, 0, 1458319279, 0, 0, 'New House', 1, 8, 9000, 9000, 1, 1, 18, 0, 0),
(268435589, 0, 0, 1458236497, 0, 0, 'New House', 1, 26, 28000, 28000, 2, 2, 49, 0, 0),
(268435590, 0, 0, 1458255263, 0, 0, 'New House', 1, 20, 22000, 22000, 2, 2, 40, 0, 0),
(268435591, 0, 0, 1458740220, 0, 0, 'New House', 1, 26, 28000, 28000, 2, 2, 54, 0, 0),
(268435592, 0, 0, 1458261091, 0, 0, 'New House', 1, 38, 40000, 40000, 2, 2, 72, 0, 0),
(268435593, 0, 0, 1458243037, 0, 0, 'New House', 1, 12, 14000, 14000, 1, 2, 25, 0, 0),
(268435594, 0, 0, 1458251189, 0, 0, 'New House', 1, 12, 14000, 14000, 1, 2, 20, 0, 0),
(268435595, 0, 0, 1458258556, 0, 0, 'New House', 1, 8, 10000, 10000, 1, 2, 20, 0, 0),
(268435596, 0, 0, 1458437830, 0, 0, 'New House', 1, 7, 8000, 8000, 1, 1, 12, 0, 0),
(268435597, 0, 0, 1458330717, 0, 0, 'New House', 1, 13, 14000, 14000, 1, 1, 21, 0, 0),
(268435598, 0, 0, 1458242509, 0, 0, 'New House', 1, 24, 26000, 26000, 1, 2, 48, 0, 0),
(268435599, 0, 0, 1458251870, 0, 0, 'New House', 1, 24, 26000, 26000, 1, 2, 36, 0, 0),
(268435600, 0, 0, 1458251722, 0, 0, 'New House', 1, 22, 24000, 24000, 1, 2, 36, 0, 0),
(268435601, 0, 0, 1458260856, 0, 0, 'New House', 1, 11, 13000, 13000, 1, 2, 28, 0, 0),
(268435602, 0, 0, 1458234839, 0, 0, 'New House', 1, 62, 64000, 64000, 1, 2, 86, 0, 0),
(268435603, 0, 0, 1458437228, 0, 0, 'New House', 1, 28, 29000, 29000, 1, 1, 48, 0, 0),
(268435604, 0, 0, 1458248634, 0, 0, 'New House', 1, 22, 23000, 23000, 1, 1, 40, 0, 0),
(268435605, 0, 0, 1458328242, 0, 0, 'New House', 1, 28, 29000, 29000, 1, 1, 37, 0, 0),
(268435606, 0, 0, 1458245294, 0, 0, 'New House', 1, 15, 16000, 16000, 1, 1, 24, 0, 0),
(268435607, 0, 0, 1458328305, 0, 0, 'New House', 1, 18, 19000, 19000, 1, 1, 30, 0, 0),
(268435608, 0, 0, 1458255599, 0, 0, 'New House', 1, 32, 32000, 32000, 1, 0, 45, 0, 0),
(268435609, 0, 0, 1458728329, 0, 0, 'New House', 1, 24, 24000, 24000, 1, 0, 35, 0, 0),
(268435610, 0, 0, 1458728445, 0, 0, 'New House', 1, 33, 33000, 33000, 1, 0, 40, 0, 0),
(268435611, 0, 0, 1458255567, 0, 0, 'New House', 1, 68, 68000, 68000, 1, 0, 89, 0, 0),
(268435612, 0, 0, 1458278231, 0, 0, 'New House', 1, 32, 32000, 32000, 1, 0, 50, 0, 0),
(268435613, 0, 0, 1458693805, 0, 0, 'New House', 1, 48, 48000, 48000, 1, 0, 60, 0, 0),
(268435614, 0, 0, 1458526153, 0, 0, 'New House', 1, 48, 48000, 48000, 1, 0, 70, 0, 0),
(268435615, 0, 0, 1458727705, 0, 0, 'New House', 1, 56, 56000, 56000, 1, 0, 80, 0, 0),
(268435616, 0, 0, 1458349613, 0, 0, 'New House', 1, 35, 35000, 35000, 1, 0, 48, 0, 0),
(268435617, 0, 0, 1458645884, 0, 0, 'New House', 1, 28, 28000, 28000, 1, 0, 40, 0, 0),
(268435618, 0, 0, 1458665192, 0, 0, 'New House', 1, 65, 65000, 65000, 1, 0, 100, 0, 0),
(268435619, 0, 0, 0, 0, 0, 'New House', 1, 35, 35000, 35000, 0, 0, 50, 0, 0),
(268435620, 0, 0, 1458265317, 0, 0, 'Unnamed House #268435620', 1, 40, 41000, 41000, 0, 1, 64, 0, 0),
(268435621, 0, 0, 0, 0, 0, 'Unnamed House #268435621', 1, 54, 55000, 55000, 0, 1, 80, 0, 0),
(268435622, 0, 0, 0, 0, 0, 'Unnamed House #268435622', 1, 54, 55000, 55000, 0, 1, 72, 0, 0),
(268435623, 0, 0, 1458274797, 0, 0, 'Unnamed House #268435623', 1, 70, 71000, 71000, 0, 1, 100, 0, 0),
(268435624, 0, 0, 1458320151, 0, 0, 'Unnamed House #268435624', 1, 68, 69000, 69000, 0, 1, 83, 0, 0),
(268435625, 0, 0, 1458324317, 0, 0, 'Unnamed House #268435625', 1, 62, 63000, 63000, 0, 1, 81, 0, 0),
(268435626, 0, 0, 0, 0, 0, 'Unnamed House #268435626', 1, 26, 27000, 27000, 0, 1, 40, 0, 0),
(268435627, 0, 0, 1458317411, 0, 0, 'Unnamed House #268435627', 1, 26, 27000, 27000, 0, 1, 40, 0, 0),
(268435628, 0, 0, 1458265551, 0, 0, 'Unnamed House #268435628', 1, 40, 41000, 41000, 0, 1, 50, 0, 0),
(268435629, 0, 0, 1458270393, 0, 0, 'Unnamed House #268435629', 1, 38, 39000, 39000, 0, 1, 48, 0, 0),
(268435630, 0, 0, 1458746561, 0, 0, 'Unnamed House #268435630', 1, 28, 29000, 29000, 1, 1, 49, 0, 0),
(268435631, 0, 0, 1458316638, 0, 0, 'Unnamed House #268435631', 1, 56, 58000, 58000, 1, 2, 84, 0, 0),
(268435632, 0, 0, 1458303971, 0, 0, 'Unnamed House #268435632', 1, 56, 58000, 58000, 1, 2, 73, 0, 0),
(268435633, 0, 0, 1458651908, 0, 0, 'Unnamed House #268435633', 1, 56, 58000, 58000, 1, 2, 78, 0, 0),
(268435634, 0, 0, 1458307420, 0, 0, 'Unnamed House #268435634', 1, 56, 58000, 58000, 1, 2, 90, 0, 0),
(268435635, 0, 0, 1458627222, 0, 0, 'Unnamed House #268435635', 1, 56, 58000, 58000, 1, 2, 90, 0, 0),
(268435636, 0, 0, 1458413831, 0, 0, 'Unnamed House #268435636', 1, 57, 58000, 58000, 1, 1, 78, 0, 0),
(268435637, 0, 0, 1458593316, 0, 0, 'Unnamed House #268435637', 1, 67, 69000, 69000, 2, 2, 86, 0, 0),
(268435638, 0, 0, 1458593223, 0, 0, 'Unnamed House #268435638', 1, 27, 30000, 30000, 3, 3, 63, 0, 0),
(268435639, 0, 0, 1458516412, 0, 0, 'Unnamed House #268435639', 1, 47, 49000, 49000, 2, 2, 72, 0, 0),
(268435640, 0, 0, 1458593264, 0, 0, 'Unnamed House #268435640', 1, 48, 49000, 49000, 2, 1, 80, 0, 0),
(268435641, 0, 18221, 1462192760, 0, 0, 'Unnamed House #268435641', 1, 28, 30000, 30000, 1, 2, 34, 0, 0),
(268435642, 0, 19705, 1462192865, 0, 0, 'Unnamed House #268435642', 1, 38, 40000, 40000, 1, 2, 43, 0, 0),
(268435643, 0, 0, 0, 0, 0, 'Unnamed House #268435643', 1, 4, 5000, 5000, 1, 1, 7, 0, 0),
(268435644, 0, 20499, 1462328495, 0, 0, 'Unnamed House #268435644', 1, 7, 8000, 8000, 1, 1, 10, 0, 0),
(268435645, 0, 11922, 0, 0, 1459128409, 'Unnamed House #268435645', 1, 7, 8000, 8000, 0, 1, 10, 0, 0),
(268435646, 0, 0, 0, 0, 0, 'Unnamed House #268435646', 1, 7, 8000, 8000, 0, 1, 10, 0, 0),
(268435647, 0, 19018, 1462292860, 0, 0, 'Unnamed House #268435647', 1, 4, 5000, 5000, 1, 1, 7, 0, 0),
(268435648, 0, 18986, 1462275137, 0, 0, 'Unnamed House #268435648', 1, 8, 10000, 10000, 1, 2, 13, 0, 0),
(268435649, 0, 11869, 1462239504, 0, 0, 'Unnamed House #268435649', 1, 10, 11000, 11000, 1, 1, 13, 0, 0),
(268435650, 0, 16022, 1462197185, 0, 0, 'Unnamed House #268435650', 1, 10, 11000, 11000, 1, 1, 13, 0, 0),
(268435651, 0, 0, 0, 0, 0, 'Unnamed House #268435651', 1, 14, 15000, 15000, 0, 1, 17, 0, 0),
(268435652, 0, 20015, 1462224412, 0, 0, 'Unnamed House #268435652', 1, 14, 15000, 15000, 1, 1, 20, 0, 0),
(268435653, 0, 0, 0, 0, 0, 'Unnamed House #268435653', 1, 16, 17000, 17000, 0, 1, 19, 0, 0),
(268435654, 0, 9003, 0, 0, 1459131686, 'Unnamed House #268435654', 1, 16, 17000, 17000, 0, 1, 19, 0, 0),
(268435655, 0, 0, 0, 0, 0, 'Unnamed House #268435655', 1, 16, 17000, 17000, 0, 1, 19, 0, 0),
(268435656, 0, 20637, 1462340717, 0, 0, 'Unnamed House #268435656', 1, 40, 41000, 41000, 1, 1, 66, 0, 0),
(268435657, 0, 9192, 1462199076, 0, 0, 'Unnamed House #268435657', 1, 40, 41000, 41000, 1, 1, 43, 0, 0),
(268435658, 0, 16807, 1461592512, 0, 0, 'Unnamed House #268435658', 1, 35, 37000, 37000, 1, 2, 43, 0, 0),
(268435659, 0, 15662, 1461940143, 0, 0, 'Unnamed House #268435659', 1, 38, 40000, 40000, 1, 2, 43, 0, 0),
(268435660, 0, 13755, 1462227031, 0, 0, 'Unnamed House #268435660', 1, 23, 24000, 24000, 1, 1, 26, 0, 0),
(268435661, 0, 16717, 1461422650, 0, 0, 'Unnamed House #268435661', 1, 28, 29000, 29000, 1, 1, 31, 0, 0),
(268435662, 0, 13808, 1461964978, 0, 0, 'Unnamed House #268435662', 1, 23, 24000, 24000, 1, 1, 26, 0, 0),
(268435663, 0, 17952, 1461777282, 0, 0, 'Unnamed House #268435663', 1, 28, 29000, 29000, 1, 1, 31, 0, 0),
(268435664, 0, 14516, 1460995558, 0, 0, 'Unnamed House #268435664', 1, 7, 8000, 8000, 1, 1, 10, 0, 0),
(268435665, 0, 13738, 1461004340, 0, 0, 'Unnamed House #268435665', 1, 4, 5000, 5000, 1, 1, 8, 0, 0),
(268435666, 0, 12878, 1461578713, 0, 0, 'Unnamed House #268435666', 1, 7, 8000, 8000, 1, 1, 10, 0, 0),
(268435667, 0, 12522, 1460837222, 0, 0, 'Unnamed House #268435667', 1, 8, 10000, 10000, 1, 2, 13, 0, 0),
(268435668, 0, 11252, 1461363011, 0, 0, 'Unnamed House #268435668', 1, 6, 7000, 7000, 1, 1, 9, 0, 0),
(268435669, 0, 9524, 1460973042, 0, 0, 'Unnamed House #268435669', 1, 7, 8000, 8000, 1, 1, 10, 0, 0),
(268435670, 0, 12474, 1461867232, 0, 0, 'Unnamed House #268435670', 1, 6, 7000, 7000, 1, 1, 9, 0, 0),
(268435671, 0, 12428, 1461395889, 0, 0, 'Unnamed House #268435671', 1, 77, 79000, 79000, 1, 2, 83, 0, 0),
(268435672, 0, 18752, 0, 0, 1461416360, 'Unnamed House #268435672', 1, 22, 23000, 23000, 1, 1, 35, 0, 0),
(268435673, 0, 13943, 1462232551, 0, 0, 'Unnamed House #268435673', 1, 34, 35000, 35000, 1, 1, 38, 0, 0),
(268435674, 0, 19013, 1462186225, 0, 0, 'Unnamed House #268435674', 1, 33, 34000, 34000, 1, 1, 36, 0, 0),
(268435675, 0, 17738, 1462187983, 0, 0, 'Unnamed House #268435675', 1, 18, 19000, 19000, 1, 1, 24, 0, 0),
(268435676, 0, 11478, 1462197958, 0, 0, 'Unnamed House #268435676', 1, 26, 28000, 28000, 1, 2, 31, 0, 0),
(268435677, 0, 0, 0, 0, 0, 'Unnamed House #268435677', 1, 22, 23000, 23000, 0, 1, 24, 0, 0),
(268435678, 0, 10839, 1462186699, 0, 0, 'Unnamed House #268435678', 1, 16, 17000, 17000, 1, 1, 19, 0, 0),
(268435679, 0, 10613, 1462187797, 0, 0, 'Unnamed House #268435679', 1, 18, 19000, 19000, 1, 1, 21, 0, 0),
(268435680, 0, 19791, 1462277936, 0, 0, 'Unnamed House #268435680', 1, 15, 16000, 16000, 1, 1, 18, 0, 0),
(268435681, 0, 16448, 1462253084, 0, 0, 'Unnamed House #268435681', 1, 14, 15000, 15000, 1, 1, 17, 0, 0),
(268435682, 0, 15753, 1462233503, 0, 0, 'Unnamed House #268435682', 1, 22, 23000, 23000, 1, 1, 26, 0, 0),
(268435683, 0, 18243, 1462201435, 0, 0, 'Unnamed House #268435683', 1, 70, 71000, 71000, 1, 1, 73, 0, 0),
(268435684, 0, 16716, 0, 0, 1461569495, 'Unnamed House #268435684', 1, 46, 47000, 47000, 1, 1, 49, 0, 0),
(268435685, 0, 9088, 1460973042, 0, 0, 'Unnamed House #268435685', 1, 20, 20000, 20000, 1, 0, 21, 0, 0),
(268435686, 0, 12621, 1460037254, 3, 1460791089, 'Unnamed House #268435686', 1, 20, 20000, 20000, 1, 0, 25, 0, 0),
(268435687, 0, 13946, 0, 0, 1461566171, 'Unnamed House #268435687', 1, 20, 20000, 20000, 1, 0, 21, 0, 0),
(268435688, 0, 11002, 0, 1, 1460791089, 'Unnamed House #268435688', 1, 94, 95000, 95000, 1, 1, 97, 0, 0),
(268435689, 0, 11073, 0, 0, 1461567715, 'Unnamed House #268435689', 1, 33, 33000, 33000, 1, 0, 41, 0, 0),
(268435690, 0, 14004, 1460619050, 1, 1460791089, 'Unnamed House #268435690', 1, 41, 41000, 41000, 1, 0, 42, 0, 0),
(268435691, 0, 9090, 1460973042, 0, 0, 'Unnamed House #268435691', 1, 51, 52000, 52000, 1, 1, 54, 0, 0),
(268435692, 0, 9397, 1462246305, 0, 0, 'Unnamed House #268435692', 1, 26, 27000, 27000, 1, 1, 29, 0, 0),
(268435693, 0, 16214, 1462233954, 0, 0, 'Unnamed House #268435693', 1, 26, 27000, 27000, 1, 1, 29, 0, 0),
(268435694, 0, 15656, 1462233770, 0, 0, 'Unnamed House #268435694', 1, 40, 41000, 41000, 1, 1, 43, 0, 0),
(268435695, 0, 17134, 1461945311, 0, 0, 'Unnamed House #268435695', 1, 22, 22000, 22000, 1, 0, 24, 0, 0),
(268435696, 0, 17189, 1462235019, 0, 0, 'Unnamed House #268435696', 1, 26, 27000, 27000, 1, 1, 29, 0, 0),
(268435697, 0, 20191, 1462236985, 0, 0, 'Unnamed House #268435697', 1, 18, 19000, 19000, 1, 1, 21, 0, 0),
(268435698, 0, 10555, 1462197086, 0, 0, 'Unnamed House #268435698', 1, 17, 18000, 18000, 1, 1, 20, 0, 0),
(268435699, 0, 16402, 1462196420, 0, 0, 'Unnamed House #268435699', 1, 33, 34000, 34000, 1, 1, 42, 0, 0),
(268435700, 0, 20246, 1462243658, 0, 0, 'Unnamed House #268435700', 1, 19, 20000, 20000, 1, 1, 22, 0, 0),
(268435701, 0, 13684, 1460445430, 2, 1460791089, 'Unnamed House #268435701', 1, 25, 26000, 26000, 1, 1, 36, 0, 0),
(268435702, 0, 20152, 1462276119, 0, 0, 'Unnamed House #268435702', 1, 49, 51000, 51000, 1, 2, 54, 0, 0),
(268435703, 0, 15677, 1461176570, 0, 0, 'Unnamed House #268435703', 1, 19, 20000, 20000, 1, 1, 23, 0, 0),
(268435704, 0, 9311, 1460831323, 0, 0, 'Unnamed House #268435704', 1, 48, 48000, 48000, 2, 0, 51, 0, 0),
(268435705, 0, 15984, 1461300560, 0, 0, 'Unnamed House #268435705', 1, 34, 35000, 35000, 1, 1, 37, 0, 0),
(268435706, 0, 17349, 1462258359, 0, 0, 'Unnamed House #268435706', 1, 11, 12000, 12000, 1, 1, 14, 0, 0),
(268435707, 0, 18422, 1462202762, 0, 0, 'Unnamed House #268435707', 1, 32, 34000, 34000, 1, 2, 37, 0, 0),
(268435708, 0, 14272, 1460996098, 0, 0, 'Unnamed House #268435708', 1, 16, 17000, 17000, 1, 1, 21, 0, 0),
(268435710, 0, 11049, 1461395889, 0, 0, 'Unnamed House #268435710', 1, 12, 13000, 13000, 1, 1, 15, 0, 0),
(268435711, 0, 12425, 1461145467, 0, 0, 'Unnamed House #268435711', 1, 32, 34000, 34000, 1, 2, 37, 0, 0),
(268435712, 0, 9403, 0, 3, 1460791089, 'Unnamed House #268435712', 1, 13, 14000, 14000, 1, 1, 16, 0, 0),
(268435713, 0, 12128, 1459975887, 3, 1460791089, 'Unnamed House #268435713', 1, 16, 17000, 17000, 1, 1, 19, 0, 0),
(268435714, 0, 0, 0, 0, 0, 'Unnamed House #268435714', 1, 28, 29000, 29000, 1, 1, 31, 0, 0),
(268435715, 0, 9914, 1462250190, 0, 0, 'Unnamed House #268435715', 1, 22, 23000, 23000, 1, 1, 25, 0, 0),
(268435716, 0, 0, 0, 0, 0, 'Unnamed House #268435716', 1, 28, 29000, 29000, 1, 1, 31, 0, 0),
(268435717, 0, 16718, 1462223815, 0, 0, 'Unnamed House #268435717', 1, 46, 47000, 47000, 1, 1, 49, 0, 0),
(268435718, 0, 18253, 1462333039, 0, 0, 'Unnamed House #268435718', 1, 18, 19000, 19000, 1, 1, 21, 0, 0),
(268435719, 0, 17913, 1462223922, 0, 0, 'Unnamed House #268435719', 1, 10, 11000, 11000, 1, 1, 16, 0, 0),
(268435720, 0, 10109, 0, 1, 1460791089, 'Unnamed House #268435720', 1, 21, 22000, 22000, 1, 1, 26, 0, 0),
(268435721, 0, 12956, 1462186483, 0, 0, 'Unnamed House #268435721', 1, 8, 9000, 9000, 1, 1, 12, 0, 0),
(268435722, 0, 16421, 1462181939, 0, 0, 'Unnamed House #268435722', 1, 12, 13000, 13000, 1, 1, 15, 0, 0),
(268435723, 0, 16665, 0, 0, 1461232776, 'Unnamed House #268435723', 1, 13, 14000, 14000, 1, 1, 17, 0, 0),
(268435724, 0, 9038, 1461145467, 0, 0, 'Unnamed House #268435724', 1, 18, 19000, 19000, 1, 1, 21, 0, 0),
(268435725, 0, 13939, 1460496863, 2, 1460791089, 'Unnamed House #268435725', 1, 10, 11000, 11000, 1, 1, 13, 0, 0),
(268435726, 0, 13254, 1462225405, 0, 0, 'Unnamed House #268435726', 1, 56, 57000, 57000, 1, 1, 59, 0, 0),
(268435727, 0, 10150, 0, 0, 1461565570, 'Unnamed House #268435727', 1, 36, 37000, 37000, 1, 1, 39, 0, 0),
(268435728, 0, 9066, 0, 0, 1460723076, 'Unnamed House #268435728', 1, 46, 47000, 47000, 1, 1, 49, 0, 0),
(268435729, 0, 15055, 1462295934, 0, 0, 'Unnamed House #268435729', 1, 68, 68000, 68000, 1, 0, 82, 0, 0),
(268435731, 0, 18973, 1462235988, 0, 0, 'Unnamed House #268435731', 1, 36, 37000, 37000, 1, 1, 39, 0, 0),
(268435732, 0, 19847, 1462236042, 0, 0, 'Unnamed House #268435732', 1, 44, 45000, 45000, 1, 1, 48, 0, 0),
(268435733, 0, 16727, 1462236256, 0, 0, 'Unnamed House #268435733', 1, 36, 37000, 37000, 1, 1, 39, 0, 0),
(268435734, 0, 19537, 1462220261, 0, 0, 'Unnamed House #268435734', 1, 40, 41000, 41000, 1, 1, 43, 0, 0),
(268435737, 0, 13093, 1461201046, 0, 0, 'Unnamed House #268435737', 1, 10, 11000, 11000, 1, 1, 13, 0, 0),
(268435738, 0, 18191, 1461763086, 0, 0, 'Unnamed House #268435738', 1, 5, 6000, 6000, 1, 1, 10, 0, 0),
(268435739, 0, 16103, 1461578364, 0, 0, 'Unnamed House #268435739', 1, 12, 13000, 13000, 1, 1, 15, 0, 0),
(268435740, 0, 10700, 1462314708, 0, 0, 'Unnamed House #268435740', 1, 12, 12000, 12000, 1, 0, 14, 0, 0),
(268435741, 0, 15203, 1461014279, 0, 0, 'Unnamed House #268435741', 1, 12, 12000, 12000, 1, 0, 13, 0, 0),
(268435742, 0, 13805, 1460803276, 0, 0, 'Unnamed House #268435742', 1, 24, 24000, 24000, 1, 0, 25, 0, 0),
(268435743, 0, 13084, 1461886664, 0, 0, 'Unnamed House #268435743', 1, 9, 9000, 9000, 1, 0, 10, 0, 0),
(268435744, 0, 14358, 1461011131, 0, 0, 'Unnamed House #268435744', 1, 9, 10000, 10000, 1, 1, 13, 0, 0),
(268435745, 0, 15922, 1461436136, 0, 0, 'Unnamed House #268435745', 1, 8, 10000, 10000, 1, 2, 13, 0, 0),
(268435746, 0, 17622, 1461685482, 0, 0, 'Unnamed House #268435746', 1, 9, 10000, 10000, 1, 1, 13, 0, 0),
(268435747, 0, 17716, 1462204536, 0, 0, 'Unnamed House #268435747', 1, 74, 75000, 75000, 1, 1, 78, 0, 0),
(268435748, 0, 14434, 1462229246, 0, 0, 'Unnamed House #268435748', 1, 16, 17000, 17000, 1, 1, 19, 0, 0),
(268435750, 0, 18589, 1462199065, 0, 0, 'Unnamed House #268435750', 1, 16, 17000, 17000, 1, 1, 19, 0, 0),
(268435751, 0, 19015, 1462294238, 0, 0, 'Unnamed House #268435751', 1, 14, 15000, 15000, 1, 1, 17, 0, 0),
(268435752, 0, 0, 0, 0, 0, 'Unnamed House #268435752', 1, 16, 17000, 17000, 1, 1, 19, 0, 0),
(268435753, 0, 20438, 1462328219, 0, 0, 'Unnamed House #268435753', 1, 7, 8000, 8000, 1, 1, 10, 0, 0),
(268435754, 0, 17187, 1462307893, 0, 0, 'Unnamed House #268435754', 1, 7, 8000, 8000, 1, 1, 10, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_auctions`
--

CREATE TABLE IF NOT EXISTS `house_auctions` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `bid` int(10) unsigned NOT NULL DEFAULT '0',
  `limit` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` bigint(20) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `house_id` (`house_id`,`world_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_data`
--

CREATE TABLE IF NOT EXISTS `house_data` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `house_id` (`house_id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_lists`
--

CREATE TABLE IF NOT EXISTS `house_lists` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `listid` int(11) NOT NULL,
  `list` text NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `killers`
--

CREATE TABLE IF NOT EXISTS `killers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `war` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `death_id` (`death_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=818497 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login_history`
--

CREATE TABLE IF NOT EXISTS `login_history` (
  `account_id` int(11) NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `login` tinyint(1) NOT NULL DEFAULT '0',
  `ip` int(11) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lottery`
--

CREATE TABLE IF NOT EXISTS `lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `item_name` varchar(255) NOT NULL,
  `date` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_history`
--

CREATE TABLE IF NOT EXISTS `market_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) unsigned NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `expires_at` bigint(20) unsigned NOT NULL,
  `inserted` bigint(20) unsigned NOT NULL,
  `state` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`,`sale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_offers`
--

CREATE TABLE IF NOT EXISTS `market_offers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) unsigned NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sale` (`sale`,`itemtype`),
  KEY `created` (`created`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `PagSeguroTrans`
--

CREATE TABLE IF NOT EXISTS `PagSeguroTrans` (
  `TransacaoID` varchar(36) NOT NULL,
  `Account` varchar(200) DEFAULT NULL,
  `StatusTransacao` varchar(50) NOT NULL,
  `CliNome` varchar(200) NOT NULL,
  `CliEmail` varchar(200) NOT NULL,
  `Data_PagSeg` varchar(200) NOT NULL,
  `Data` datetime NOT NULL,
  `QntPontos` int(5) NOT NULL,
  `Valor` int(5) NOT NULL,
  UNIQUE KEY `TransacaoID` (`TransacaoID`,`StatusTransacao`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagsegurotransacoes`
--

CREATE TABLE IF NOT EXISTS `pagsegurotransacoes` (
  `TransacaoID` varchar(36) NOT NULL,
  `VendedorEmail` varchar(200) NOT NULL,
  `Referencia` varchar(200) DEFAULT NULL,
  `TipoFrete` char(2) DEFAULT NULL,
  `ValorFrete` decimal(10,2) DEFAULT NULL,
  `Extras` decimal(10,2) DEFAULT NULL,
  `Anotacao` text,
  `TipoPagamento` varchar(50) NOT NULL,
  `StatusTransacao` varchar(50) NOT NULL,
  `CliNome` varchar(200) NOT NULL,
  `CliEmail` varchar(200) NOT NULL,
  `CliEndereco` varchar(200) NOT NULL,
  `CliNumero` varchar(10) DEFAULT NULL,
  `CliComplemento` varchar(100) DEFAULT NULL,
  `CliBairro` varchar(100) NOT NULL,
  `CliCidade` varchar(100) NOT NULL,
  `CliEstado` char(2) NOT NULL,
  `CliCEP` varchar(9) NOT NULL,
  `CliTelefone` varchar(14) DEFAULT NULL,
  `NumItens` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `ProdQuantidade_x` int(5) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `TransacaoID` (`TransacaoID`,`StatusTransacao`),
  KEY `Referencia` (`Referencia`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `PagSeguroTransacoes`
--

CREATE TABLE IF NOT EXISTS `PagSeguroTransacoes` (
  `TransacaoID` varchar(36) NOT NULL,
  `Account` varchar(200) DEFAULT NULL,
  `StatusTransacao` varchar(50) NOT NULL,
  `CliNome` varchar(200) NOT NULL,
  `CliEmail` varchar(200) NOT NULL,
  `Data_PagSeg` varchar(200) NOT NULL,
  `Data` datetime NOT NULL,
  `QntPontos` int(5) NOT NULL,
  `Valor` int(5) NOT NULL,
  UNIQUE KEY `TransacaoID` (`TransacaoID`,`StatusTransacao`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `lookmount` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `soul` int(10) unsigned NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lastip` int(10) unsigned NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `rank_id` int(11) NOT NULL DEFAULT '0',
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) unsigned NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `pvp_blessing` tinyint(1) NOT NULL DEFAULT '0',
  `balance` bigint(20) unsigned NOT NULL DEFAULT '0',
  `stamina` bigint(20) unsigned NOT NULL DEFAULT '151200000' COMMENT 'stored in miliseconds',
  `direction` int(11) NOT NULL DEFAULT '2',
  `loss_experience` int(11) NOT NULL DEFAULT '100',
  `loss_mana` int(11) NOT NULL DEFAULT '100',
  `loss_skills` int(11) NOT NULL DEFAULT '100',
  `loss_containers` int(11) NOT NULL DEFAULT '100',
  `loss_items` int(11) NOT NULL DEFAULT '100',
  `premend` int(11) NOT NULL DEFAULT '0' COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `marriage` int(10) unsigned NOT NULL DEFAULT '0',
  `promotion` int(11) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `offlinetraining_time` smallint(5) unsigned NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int(11) NOT NULL DEFAULT '-1',
  `created` int(11) NOT NULL DEFAULT '0',
  `nick_verify` int(11) NOT NULL DEFAULT '0',
  `old_name` varchar(255) NOT NULL DEFAULT '',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `worldtransfer` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `show_outfit` tinyint(4) NOT NULL DEFAULT '1',
  `show_eq` tinyint(4) NOT NULL DEFAULT '1',
  `show_bars` tinyint(4) NOT NULL DEFAULT '1',
  `show_skills` tinyint(4) NOT NULL DEFAULT '1',
  `show_quests` tinyint(4) NOT NULL DEFAULT '1',
  `stars` int(10) NOT NULL DEFAULT '0',
  `ip` varchar(17) NOT NULL DEFAULT '0',
  `cast` tinyint(4) NOT NULL DEFAULT '0',
  `castViewers` int(11) NOT NULL DEFAULT '0',
  `castDescription` varchar(255) NOT NULL,
  `broadcasting` tinyint(4) DEFAULT '0',
  `viewers` int(1) DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `signature` text NOT NULL,
  `auction_balance` int(11) NOT NULL DEFAULT '0',
  `sbw_points` bigint(255) NOT NULL DEFAULT '0',
  `shopitens` varchar(255) NOT NULL DEFAULT '''{}''',
  `shoplucro` varchar(255) NOT NULL DEFAULT '''{}''',
  `army_level` bigint(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`deleted`),
  KEY `account_id` (`account_id`),
  KEY `group_id` (`group_id`),
  KEY `online` (`online`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20676 ;

--
-- Extraindo dados da tabela `players`
--

INSERT INTO `players` (`id`, `name`, `world_id`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `lookmount`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `rank_id`, `guildnick`, `lastlogout`, `blessings`, `pvp_blessing`, `balance`, `stamina`, `direction`, `loss_experience`, `loss_mana`, `loss_skills`, `loss_containers`, `loss_items`, `premend`, `online`, `marriage`, `promotion`, `deleted`, `description`, `offlinetraining_time`, `offlinetraining_skill`, `created`, `nick_verify`, `old_name`, `hide_char`, `worldtransfer`, `comment`, `show_outfit`, `show_eq`, `show_bars`, `show_skills`, `show_quests`, `stars`, `ip`, `cast`, `castViewers`, `castDescription`, `broadcasting`, `viewers`, `create_ip`, `create_date`, `signature`, `auction_balance`, `sbw_points`, `shopitens`, `shoplucro`, `army_level`) VALUES
(2, 'Rook Sample', 0, 1, 18, 20, 0, 200, 200, 4200, 68, 114, 78, 58, 136, 0, 0, 0, 200, 200, 0, 0, 1, 155, 52, 7, '', 400, 0, 1425632444, 1293101243, 0, 0, 0, 0, '', 0, 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 43200, -1, 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, '0', 0, 0, '', 0, 0, 0, 0, '', 0, 0, '''{}''', '''{}''', 0),
(3, 'Sorcerer Sample', 0, 1, 18, 8, 1, 200, 200, 4200, 68, 114, 78, 58, 136, 0, 0, 0, 200, 200, 0, 0, 1, 155, 54, 7, '', 800, 0, 1457111283, 2850378417, 1, 0, 0, 0, '', 1457111295, 0, 0, 0, 151200000, 0, 60, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 43200, -1, 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, '177.82.229.169', 0, 0, '', 0, 0, 0, 0, '', 0, 0, '''{}''', '''{}''', 0),
(4, 'Druid Sample', 0, 1, 18, 8, 2, 200, 200, 4200, 68, 114, 78, 58, 136, 0, 0, 0, 200, 200, 0, 0, 1, 155, 54, 7, '', 800, 0, 1457138896, 2850378417, 1, 0, 0, 0, '', 1457138904, 31, 0, 0, 151200000, 0, 90, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 43200, -1, 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, '177.82.229.169', 0, 0, '', 0, 0, 0, 0, '', 0, 0, '''{}''', '''{}''', 0),
(5, 'Paladin Sample', 0, 1, 18, 8, 3, 200, 200, 4200, 68, 114, 78, 58, 136, 0, 0, 0, 200, 200, 0, 0, 1, 155, 54, 7, '', 800, 0, 1457111275, 2850378417, 1, 0, 0, 0, '', 1457111282, 0, 0, 0, 151200000, 0, 60, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 43200, -1, 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, '177.82.229.169', 0, 0, '', 0, 0, 0, 0, '', 0, 0, '''{}''', '''{}''', 0),
(6, 'Knight Sample', 0, 1, 18, 8, 4, 200, 200, 4200, 68, 114, 78, 58, 136, 0, 0, 0, 200, 200, 0, 0, 1, 155, 54, 7, '', 800, 0, 1457111262, 2850378417, 1, 0, 0, 0, '', 1457111274, 0, 0, 0, 151200000, 0, 60, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 43200, -1, 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, '177.82.229.169', 0, 0, '', 0, 0, 0, 0, '', 0, 0, '''{}''', '''{}''', 0),
(6361, 'Account Manager', 0, 1, 1, 10, 2, 310, 310, 506255, 68, 114, 78, 58, 136, 0, 0, 3, 785, 785, 1419, 100, 1, 155, 54, 7, '', 685, 1, 1461741175, 3791489723, 0, 0, 0, 0, '', 1458279900, 31, 0, 0, 151200000, 2, 80, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 43200, -1, 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, '177.82.229.169', 0, 0, '', 0, 0, 0, 0, '', 0, 0, '''{}''', '''{}''', 0);

--
-- Gatilhos `players`
--
DROP TRIGGER IF EXISTS `oncreate_players`;
DELIMITER //
CREATE TRIGGER `oncreate_players` AFTER INSERT ON `players`
 FOR EACH ROW BEGIN
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 10);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `ondelete_players`;
DELIMITER //
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players`
 FOR EACH ROW BEGIN
	DELETE FROM `bans` WHERE `type` IN (2, 5) AND `value` = OLD.`id`;
	UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_deaths`
--

CREATE TABLE IF NOT EXISTS `player_deaths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=238005 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotitems`
--

CREATE TABLE IF NOT EXISTS `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `m_uid` int(11) NOT NULL DEFAULT '0',
  `serial` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_inboxitems`
--

CREATE TABLE IF NOT EXISTS `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_items`
--

CREATE TABLE IF NOT EXISTS `player_items` (
  `player_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `m_uid` int(11) NOT NULL DEFAULT '0',
  `serial` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_killers`
--

CREATE TABLE IF NOT EXISTS `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  KEY `kill_id` (`kill_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_namelocks`
--

CREATE TABLE IF NOT EXISTS `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0',
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_skills`
--

CREATE TABLE IF NOT EXISTS `player_skills` (
  `player_id` int(11) NOT NULL,
  `skillid` tinyint(2) NOT NULL DEFAULT '0',
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_skills`
--

INSERT INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
(2, 0, 10, 0),
(2, 1, 10, 0),
(2, 2, 10, 0),
(2, 3, 10, 0),
(2, 4, 10, 0),
(2, 5, 10, 0),
(2, 6, 10, 0),
(3, 0, 10, 0),
(3, 1, 10, 0),
(3, 2, 10, 0),
(3, 3, 10, 0),
(3, 4, 10, 0),
(3, 5, 10, 0),
(3, 6, 10, 0),
(4, 0, 10, 0),
(4, 1, 10, 0),
(4, 2, 10, 0),
(4, 3, 10, 0),
(4, 4, 10, 0),
(4, 5, 10, 0),
(4, 6, 10, 0),
(5, 0, 10, 0),
(5, 1, 10, 0),
(5, 2, 10, 0),
(5, 3, 10, 0),
(5, 4, 10, 0),
(5, 5, 10, 0),
(5, 6, 10, 0),
(6, 0, 10, 0),
(6, 1, 10, 0),
(6, 2, 10, 0),
(6, 3, 10, 0),
(6, 4, 10, 0),
(6, 5, 10, 0),
(6, 6, 10, 0),
(6361, 0, 10, 0),
(6361, 1, 10, 0),
(6361, 2, 10, 0),
(6361, 3, 10, 0),
(6361, 4, 10, 0),
(6361, 5, 10, 0),
(6361, 6, 10, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_spells`
--

CREATE TABLE IF NOT EXISTS `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`name`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_statements`
--

CREATE TABLE IF NOT EXISTS `player_statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL DEFAULT '0',
  `text` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_storage`
--

CREATE TABLE IF NOT EXISTS `player_storage` (
  `player_id` int(11) NOT NULL,
  `key` varchar(32) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`key`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_viplist`
--

CREATE TABLE IF NOT EXISTS `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  `description` varchar(128) NOT NULL,
  `icon` int(11) unsigned NOT NULL,
  `notify` tinyint(1) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  KEY `player_id` (`player_id`),
  KEY `vip_id` (`vip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_config`
--

CREATE TABLE IF NOT EXISTS `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `config` (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_motd`
--

CREATE TABLE IF NOT EXISTS `server_motd` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_record`
--

CREATE TABLE IF NOT EXISTS `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL,
  UNIQUE KEY `record` (`record`,`world_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_reports`
--

CREATE TABLE IF NOT EXISTS `server_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '1',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `world_id` (`world_id`),
  KEY `reads` (`reads`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `snowballwar`
--

CREATE TABLE IF NOT EXISTS `snowballwar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `data` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tiles`
--

CREATE TABLE IF NOT EXISTS `tiles` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `house_id` int(10) unsigned NOT NULL,
  `x` int(5) unsigned NOT NULL,
  `y` int(5) unsigned NOT NULL,
  `z` tinyint(2) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`),
  KEY `x` (`x`,`y`,`z`),
  KEY `house_id` (`house_id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_items`
--

CREATE TABLE IF NOT EXISTS `tile_items` (
  `tile_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_store`
--

CREATE TABLE IF NOT EXISTS `tile_store` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '',
  KEY `house_id` (`house_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `zaypay_payment`
--

CREATE TABLE IF NOT EXISTS `zaypay_payment` (
  `payID` bigint(30) NOT NULL,
  `account_id` int(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`payID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_bug_logs`
--

CREATE TABLE IF NOT EXISTS `z_bug_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_bug_tracker`
--

CREATE TABLE IF NOT EXISTS `z_bug_tracker` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `text` text NOT NULL,
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_changelog`
--

CREATE TABLE IF NOT EXISTS `z_changelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `where` varchar(255) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_featured_article`
--

CREATE TABLE IF NOT EXISTS `z_featured_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` varchar(30) NOT NULL,
  `author` varchar(50) NOT NULL,
  `read_more` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_forum`
--

CREATE TABLE IF NOT EXISTS `z_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `first_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `section` int(3) NOT NULL DEFAULT '0',
  `icon_id` int(3) NOT NULL DEFAULT '1',
  `replies` int(20) NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `author_aid` int(20) NOT NULL DEFAULT '0',
  `author_guid` int(20) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int(20) NOT NULL DEFAULT '0',
  `last_edit_aid` int(20) NOT NULL DEFAULT '0',
  `edit_date` int(20) NOT NULL DEFAULT '0',
  `post_ip` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `post_icon_id` tinyint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section` (`section`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_helpdesk`
--

CREATE TABLE IF NOT EXISTS `z_helpdesk` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `text` text NOT NULL,
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `tag` int(11) NOT NULL,
  `registered` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_monsters`
--

CREATE TABLE IF NOT EXISTS `z_monsters` (
  `hide_creature` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL,
  `exp` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `speed_lvl` int(11) NOT NULL DEFAULT '1',
  `use_haste` tinyint(1) NOT NULL,
  `voices` text NOT NULL,
  `immunities` varchar(255) NOT NULL,
  `summonable` tinyint(1) NOT NULL,
  `convinceable` tinyint(1) NOT NULL,
  `race` varchar(255) NOT NULL,
  `loot` text NOT NULL,
  `gfx_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_monsters`
--

INSERT INTO `z_monsters` (`hide_creature`, `name`, `mana`, `exp`, `health`, `speed_lvl`, `use_haste`, `voices`, `immunities`, `summonable`, `convinceable`, `race`, `loot`, `gfx_name`) VALUES
(0, 'Event Zombie', 0, 280, 500, 1, 0, '"You wont last long!", "Mmmmh.. braains!"', 'paralyze, invisible', 0, 0, 'undead', '<img src="images/items/2148.gif" />&nbsp;&nbsp;', 'eventzombie.gif'),
(0, 'Trainner', 0, 0, 5000000, 1, 0, '', 'invisible', 0, 0, 'blood', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/1949.gif" />&nbsp;&nbsp;<img src="images/items/2467.gif" />&nbsp;&nbsp;<img src="images/items/2642.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2044.gif" />&nbsp;&nbsp;<img src="images/items/2689.gif" />&nbsp;&nbsp;<img src="images/items/2401.gif" />&nbsp;&nbsp;<img src="images/items/2166.gif" />&nbsp;&nbsp;', 'trainner.gif'),
(0, 'Treinner', 0, 0, 5000000, 1, 0, '', 'invisible', 0, 0, 'blood', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/1949.gif" />&nbsp;&nbsp;<img src="images/items/2467.gif" />&nbsp;&nbsp;<img src="images/items/2642.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2044.gif" />&nbsp;&nbsp;<img src="images/items/2689.gif" />&nbsp;&nbsp;<img src="images/items/2401.gif" />&nbsp;&nbsp;<img src="images/items/2166.gif" />&nbsp;&nbsp;', 'treinner.gif'),
(0, 'Teleports', 0, 12000, 35000, 35, 0, '', '', 0, 0, 'venom', '', 'teleports.gif'),
(0, 'Apoca Vip III', 0, 7200, 8000, 80, 1, '"BOW TO THE POWER OF THE RUTHLESS SEVEN!", "DESTRUCTION!", "CHAOS!", "DEATH TO ALL!"', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', '<img src="images/items/2142.gif" />&nbsp;&nbsp;', 'apocavipiii.gif'),
(0, 'Dragon Lord Vip III', 0, 5800, 4300, 13, 0, '"ZCHHHHH", "YOU WILL BURN!"', 'fire, paralyze, invisible', 0, 0, 'blood', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2672.gif" />&nbsp;&nbsp;<img src="images/items/2033.gif" />&nbsp;&nbsp;<img src="images/items/1976.gif" />&nbsp;&nbsp;<img src="images/items/2413.gif" />&nbsp;&nbsp;<img src="images/items/2498.gif" />&nbsp;&nbsp;<img src="images/items/2492.gif" />&nbsp;&nbsp;<img src="images/items/7378.gif" />&nbsp;&nbsp;<img src="images/items/2547.gif" />&nbsp;&nbsp;<img src="images/items/2796.gif" />&nbsp;&nbsp;<img src="images/items/5948.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2149.gif" />&nbsp;&nbsp;<img src="images/items/2392.gif" />&nbsp;&nbsp;<img src="images/items/2146.gif" />&nbsp;&nbsp;<img src="images/items/2528.gif" />&nbsp;&nbsp;<img src="images/items/7402.gif" />&nbsp;&nbsp;<img src="images/items/2414.gif" />&nbsp;&nbsp;<img src="images/items/5882.gif" />&nbsp;&nbsp;', 'dragonlordvipiii.gif'),
(0, 'Demon Vip III', 10000, 4500, 7500, 28, 1, '"MUHAHAHAHA!", "I SMELL FEEEEEAAAR!", "CHAMEK ATH UTHUL ARAK!", "Your resistance is futile!", "Your soul will be mine!"', 'fire, drown, paralyze, invisible', 0, 0, 'fire', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2152.gif" />&nbsp;&nbsp;<img src="images/items/2514.gif" />&nbsp;&nbsp;<img src="images/items/2472.gif" />&nbsp;&nbsp;<img src="images/items/2795.gif" />&nbsp;&nbsp;<img src="images/items/5906.gif" />&nbsp;&nbsp;<img src="images/items/5954.gif" />&nbsp;&nbsp;<img src="images/items/2164.gif" />&nbsp;&nbsp;<img src="images/items/2176.gif" />&nbsp;&nbsp;<img src="images/items/1982.gif" />&nbsp;&nbsp;<img src="images/items/2165.gif" />&nbsp;&nbsp;<img src="images/items/7591.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2393.gif" />&nbsp;&nbsp;<img src="images/items/2432.gif" />&nbsp;&nbsp;<img src="images/items/2214.gif" />&nbsp;&nbsp;<img src="images/items/2678.gif" />&nbsp;&nbsp;<img src="images/items/2151.gif" />&nbsp;&nbsp;<img src="images/items/2149.gif" />&nbsp;&nbsp;<img src="images/items/2171.gif" />&nbsp;&nbsp;<img src="images/items/2387.gif" />&nbsp;&nbsp;<img src="images/items/2470.gif" />&nbsp;&nbsp;<img src="images/items/7393.gif" />&nbsp;&nbsp;', 'demonvipiii.gif'),
(0, 'Grim Reaper Vip III', 0, 6200, 5300, 75, 0, '"Death!", "Come a little closer!", "The end is near!"', 'lifedrain, paralyze, invisible', 0, 0, 'undead', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2152.gif" />&nbsp;&nbsp;<img src="images/items/2150.gif" />&nbsp;&nbsp;<img src="images/items/6558.gif" />&nbsp;&nbsp;<img src="images/items/6500.gif" />&nbsp;&nbsp;<img src="images/items/5909.gif" />&nbsp;&nbsp;<img src="images/items/2521.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/5022.gif" />&nbsp;&nbsp;<img src="images/items/8889.gif" />&nbsp;&nbsp;<img src="images/items/7418.gif" />&nbsp;&nbsp;<img src="images/items/7589.gif" />&nbsp;&nbsp;<img src="images/items/8910.gif" />&nbsp;&nbsp;<img src="images/items/8473.gif" />&nbsp;&nbsp;<img src="images/items/2112.gif" />&nbsp;&nbsp;', 'grimreapervipiii.gif'),
(0, 'Hand Vip Iii', 0, 6000, 10500, 40, 1, '', 'death, energy, fire, poison, paralyze, invisible', 0, 0, 'undead', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2654.gif" />&nbsp;&nbsp;<img src="images/items/2152.gif" />&nbsp;&nbsp;<img src="images/items/2187.gif" />&nbsp;&nbsp;<img src="images/items/8974.gif" />&nbsp;&nbsp;<img src="images/items/2463.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2487.gif" />&nbsp;&nbsp;<img src="images/items/2476.gif" />&nbsp;&nbsp;<img src="images/items/6500.gif" />&nbsp;&nbsp;<img src="images/items/2153.gif" />&nbsp;&nbsp;', 'handvipiii.gif'),
(0, 'Hydra Vip II', 0, 5900, 6450, 10, 0, '"FCHHHHH", "HISSSS"', 'poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2498.gif" />&nbsp;&nbsp;<img src="images/items/2195.gif" />&nbsp;&nbsp;<img src="images/items/2475.gif" />&nbsp;&nbsp;<img src="images/items/3976.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2214.gif" />&nbsp;&nbsp;<img src="images/items/2671.gif" />&nbsp;&nbsp;<img src="images/items/2666.gif" />&nbsp;&nbsp;<img src="images/items/2146.gif" />&nbsp;&nbsp;<img src="images/items/2177.gif" />&nbsp;&nbsp;<img src="images/items/2476.gif" />&nbsp;&nbsp;<img src="images/items/4850.gif" />&nbsp;&nbsp;<img src="images/items/2149.gif" />&nbsp;&nbsp;<img src="images/items/2536.gif" />&nbsp;&nbsp;<img src="images/items/2168.gif" />&nbsp;&nbsp;<img src="images/items/2197.gif" />&nbsp;&nbsp;<img src="images/items/2112.gif" />&nbsp;&nbsp;', 'hydravipii.gif'),
(0, 'Medusa Vip II', 0, 6000, 4900, 40, 0, '"You will ssuch a fine ssstatue!", "There isss no chhhanccce of esscape", "Are you tired or why are you moving thhat sslow"', 'earth, paralyze, invisible', 0, 0, 'blood', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2671.gif" />&nbsp;&nbsp;<img src="images/items/7590.gif" />&nbsp;&nbsp;<img src="images/items/2476.gif" />&nbsp;&nbsp;<img src="images/items/2536.gif" />&nbsp;&nbsp;<img src="images/items/3976.gif" />&nbsp;&nbsp;<img src="images/items/2149.gif" />&nbsp;&nbsp;<img src="images/items/2004.gif" />&nbsp;&nbsp;<img src="images/items/2152.gif" />&nbsp;&nbsp;<img src="images/items/9808.gif" />&nbsp;&nbsp;<img src="images/items/7887.gif" />&nbsp;&nbsp;<img src="images/items/7885.gif" />&nbsp;&nbsp;<img src="images/items/7884.gif" />&nbsp;&nbsp;<img src="images/items/7413.gif" />&nbsp;&nbsp;<img src="images/items/2112.gif" />&nbsp;&nbsp;<img src="images/items/8473.gif" />&nbsp;&nbsp;<img src="images/items/2143.gif" />&nbsp;&nbsp;', 'medusavipii.gif'),
(0, 'Warlock Vip Iii', 0, 5800, 6500, 23, 0, '"Learn the secret of our magic! YOUR death!", "Even a rat is a better mage than you.", "We don''t like intruders!"', 'energy, fire, ice, paralyze, outfit, drunk, invisible', 0, 0, 'blood', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2185.gif" />&nbsp;&nbsp;<img src="images/items/1986.gif" />&nbsp;&nbsp;<img src="images/items/2600.gif" />&nbsp;&nbsp;<img src="images/items/2124.gif" />&nbsp;&nbsp;<img src="images/items/2689.gif" />&nbsp;&nbsp;<img src="images/items/2167.gif" />&nbsp;&nbsp;<img src="images/items/2197.gif" />&nbsp;&nbsp;<img src="images/items/2151.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2146.gif" />&nbsp;&nbsp;<img src="images/items/2178.gif" />&nbsp;&nbsp;<img src="images/items/2679.gif" />&nbsp;&nbsp;<img src="images/items/2047.gif" />&nbsp;&nbsp;<img src="images/items/2411.gif" />&nbsp;&nbsp;<img src="images/items/2792.gif" />&nbsp;&nbsp;<img src="images/items/2793.gif" />&nbsp;&nbsp;<img src="images/items/2466.gif" />&nbsp;&nbsp;<img src="images/items/2436.gif" />&nbsp;&nbsp;', 'warlockvipiii.gif'),
(0, 'Jabuti', 490000000, 18000, 10000, 140, 0, '', '', 0, 0, 'blood', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/5678.gif" />&nbsp;&nbsp;<img src="images/items/2667.gif" />&nbsp;&nbsp;<img src="images/items/2789.gif" />&nbsp;&nbsp;<img src="images/items/2391.gif" />&nbsp;&nbsp;<img src="images/items/2787.gif" />&nbsp;&nbsp;<img src="images/items/2671.gif" />&nbsp;&nbsp;', 'jabuti.gif'),
(0, 'Jabuti Hatchling', 445, 12000, 5000, 1, 0, '', '', 0, 1, 'blood', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/5899.gif" />&nbsp;&nbsp;<img src="images/items/5678.gif" />&nbsp;&nbsp;<img src="images/items/6131.gif" />&nbsp;&nbsp;<img src="images/items/2671.gif" />&nbsp;&nbsp;<img src="images/items/2417.gif" />&nbsp;&nbsp;<img src="images/items/2510.gif" />&nbsp;&nbsp;', 'jabutihatchling.gif'),
(0, 'Lobo', 0, 16550, 20000, 140, 0, '"Grrrrrrr", "Yoooohhuuuu!"', 'invisible', 0, 1, 'blood', '<img src="images/items/3976.gif" />&nbsp;&nbsp;<img src="images/items/2671.gif" />&nbsp;&nbsp;<img src="images/items/5897.gif" />&nbsp;&nbsp;', 'lobo.gif'),
(0, 'Menino Verde', 360, 16500, 16000, 140, 0, '"MENINO LOBO MENIIIIIIINO", "MENINIIIIIINHO", "ETA BIXIGUINHA!"', 'paralyze, drunk, invisible', 1, 1, 'blood', '<img src="images/items/3976.gif" />&nbsp;&nbsp;<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2666.gif" />&nbsp;&nbsp;<img src="images/items/2512.gif" />&nbsp;&nbsp;<img src="images/items/2530.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2385.gif" />&nbsp;&nbsp;<img src="images/items/2464.gif" />&nbsp;&nbsp;<img src="images/items/2420.gif" />&nbsp;&nbsp;<img src="images/items/2448.gif" />&nbsp;&nbsp;<img src="images/items/2007.gif" />&nbsp;&nbsp;', 'meninoverde.gif'),
(0, 'Menino Verde No Lobo', 0, 19500, 26000, 190, 1, '"Famoso menino verde", "Meniiiiiiiiiiiiiino LOOBO"', '', 0, 1, 'blood', '<img src="images/items/6527.gif" />&nbsp;&nbsp;<img src="images/items/2666.gif" />&nbsp;&nbsp;<img src="images/items/2129.gif" />&nbsp;&nbsp;<img src="images/items/1988.gif" />&nbsp;&nbsp;<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2428.gif" />&nbsp;&nbsp;<img src="images/items/2480.gif" />&nbsp;&nbsp;<img src="images/items/2425.gif" />&nbsp;&nbsp;<img src="images/items/2513.gif" />&nbsp;&nbsp;', 'meninoverdenolobo.gif'),
(0, 'Plebeu Engajado', 0, 20000, 20000, 190, 0, '"Pao e circo! Pao e circo!", "Voce acha que eu nao sei lutar?!", "Eu dou a vida pelo meu rei!"', '', 0, 0, 'blood', '<img src="images/items/2666.gif" />&nbsp;&nbsp;<img src="images/items/3976.gif" />&nbsp;&nbsp;', 'plebeuengajado.gif'),
(0, 'Patricio', 0, 26600, 28000, 240, 0, '"Onde esta meu cha?!", "Quero voltar para a area urbana..", "Preparastes para a guerra??"', '', 0, 0, 'blood', '<img src="images/items/2666.gif" />&nbsp;&nbsp;<img src="images/items/3976.gif" />&nbsp;&nbsp;', 'patricio.gif'),
(0, 'Wind Minion', 800, 50725, 30000, 1, 0, '"Pazuzu vai saber disso!", "Ihihihihihihiii", "Como voce veio parar aqui?"', 'invisible', 0, 0, 'blood', '<img src="images/items/2520.gif" />&nbsp;&nbsp;<img src="images/items/2160.gif" />&nbsp;&nbsp;', 'windminion.gif'),
(0, 'Mariun Warrior', 0, 355000, 1080000, 190, 1, '"I AM THE WARRIOR CHOSEN BY THE MARIUNS"', 'invisible, paralyze', 0, 0, 'blood', '<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2431.gif" />&nbsp;&nbsp;<img src="images/items/2421.gif" />&nbsp;&nbsp;<img src="images/items/6527.gif" />&nbsp;&nbsp;<img src="images/items/3940.gif" />&nbsp;&nbsp;<img src="images/items/7391.gif" />&nbsp;&nbsp;<img src="images/items/7423.gif" />&nbsp;&nbsp;<img src="images/items/7433.gif" />&nbsp;&nbsp;', 'mariunwarrior.gif'),
(0, 'Mariun Ranger', 0, 350000, 1050000, 190, 1, '"I AM THE RANGER CHOSEN BY THE MARIUNS"', 'invisible, paralyze', 0, 0, 'blood', '<img src="images/items/6527.gif" />&nbsp;&nbsp;<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/7367.gif" />&nbsp;&nbsp;<img src="images/items/2195.gif" />&nbsp;&nbsp;<img src="images/items/3940.gif" />&nbsp;&nbsp;<img src="images/items/5803.gif" />&nbsp;&nbsp;<img src="images/items/8849.gif" />&nbsp;&nbsp;', 'mariunranger.gif'),
(0, 'Mariun Wyzard', 0, 330000, 1000000, 190, 1, '"I AM THE MAGE CHOSEN BY THE MARIUNS"', 'invisible, paralyze', 0, 0, 'blood', '<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/8902.gif" />&nbsp;&nbsp;<img src="images/items/11349.gif" />&nbsp;&nbsp;<img src="images/items/2323.gif" />&nbsp;&nbsp;<img src="images/items/2195.gif" />&nbsp;&nbsp;<img src="images/items/3940.gif" />&nbsp;&nbsp;<img src="images/items/8904.gif" />&nbsp;&nbsp;<img src="images/items/6527.gif" />&nbsp;&nbsp;', 'mariunwyzard.gif'),
(0, 'Gonka', 0, 3000000, 550000, 490, 1, '"Acha que consegue me derrotar?!"', 'paralyze, invisible', 0, 0, 'blood', '<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2494.gif" />&nbsp;&nbsp;<img src="images/items/2493.gif" />&nbsp;&nbsp;<img src="images/items/2520.gif" />&nbsp;&nbsp;<img src="images/items/6527.gif" />&nbsp;&nbsp;', 'gonka.gif'),
(0, 'Chupa Cabra', 0, 200000, 350000, 290, 0, '"Gnarlll!", "Grrrrrr!"', 'lifedrain, paralyze, invisible', 0, 0, 'blood', '<img src="images/items/2666.gif" />&nbsp;&nbsp;<img src="images/items/3976.gif" />&nbsp;&nbsp;<img src="images/items/11318.gif" />&nbsp;&nbsp;', 'chupacabra.gif'),
(0, 'Lagarto Guerreiro', 0, 200000, 350000, 290, 0, '', 'earth, invisible', 0, 0, 'blood', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/11325.gif" />&nbsp;&nbsp;<img src="images/items/7591.gif" />&nbsp;&nbsp;<img src="images/items/11200.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/7588.gif" />&nbsp;&nbsp;<img src="images/items/5881.gif" />&nbsp;&nbsp;<img src="images/items/2149.gif" />&nbsp;&nbsp;<img src="images/items/11324.gif" />&nbsp;&nbsp;<img src="images/items/11298.gif" />&nbsp;&nbsp;', 'lagartoguerreiro.gif'),
(0, 'Thunder Lord', 0, 450000, 290000, 190, 1, '"YOU WILL BE ELEcTRUCTED MWAHAHAHAH!!"', 'energy, invisible', 0, 0, 'blood', '<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2472.gif" />&nbsp;&nbsp;<img src="images/items/6527.gif" />&nbsp;&nbsp;<img src="images/items/1998.gif" />&nbsp;&nbsp;<img src="images/items/10569.gif" />&nbsp;&nbsp;<img src="images/items/2342.gif" />&nbsp;&nbsp;<img src="images/items/2424.gif" />&nbsp;&nbsp;<img src="images/items/7417.gif" />&nbsp;&nbsp;<img src="images/items/8879.gif" />&nbsp;&nbsp;<img src="images/items/2542.gif" />&nbsp;&nbsp;<img src="images/items/11113.gif" />&nbsp;&nbsp;', 'thunderlord.gif'),
(0, 'Swamp Lord', 0, 350000, 270000, 190, 1, '"I will drown you in my poison Hahahahaaha!"', 'poison, invisible', 0, 0, 'venom', '<img src="images/items/2152.gif" />&nbsp;&nbsp;<img src="images/items/2492.gif" />&nbsp;&nbsp;<img src="images/items/2171.gif" />&nbsp;&nbsp;<img src="images/items/6527.gif" />&nbsp;&nbsp;<img src="images/items/1998.gif" />&nbsp;&nbsp;<img src="images/items/10219.gif" />&nbsp;&nbsp;<img src="images/items/7405.gif" />&nbsp;&nbsp;<img src="images/items/2506.gif" />&nbsp;&nbsp;<img src="images/items/2415.gif" />&nbsp;&nbsp;<img src="images/items/3961.gif" />&nbsp;&nbsp;<img src="images/items/2522.gif" />&nbsp;&nbsp;<img src="images/items/11113.gif" />&nbsp;&nbsp;', 'swamplord.gif'),
(0, 'Lava Lord', 0, 650000, 300000, 190, 1, '"YOU WILL FEEL THE POWER OF THE LORD OF THE VOLCANOS MWAHAHAHAH!!"', 'fire, invisible', 0, 0, 'blood', '<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2472.gif" />&nbsp;&nbsp;<img src="images/items/2171.gif" />&nbsp;&nbsp;<img src="images/items/6527.gif" />&nbsp;&nbsp;<img src="images/items/1998.gif" />&nbsp;&nbsp;<img src="images/items/8886.gif" />&nbsp;&nbsp;<img src="images/items/2471.gif" />&nbsp;&nbsp;<img src="images/items/8924.gif" />&nbsp;&nbsp;<img src="images/items/7415.gif" />&nbsp;&nbsp;<img src="images/items/11113.gif" />&nbsp;&nbsp;', 'lavalord.gif'),
(0, 'Dark Lord', 0, 1000000, 1250000, 315, 1, '', 'lifedrain, paralyze, invisible', 0, 0, 'fire', '<img src="images/items/2136.gif" />&nbsp;&nbsp;<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2150.gif" />&nbsp;&nbsp;<img src="images/items/7388.gif" />&nbsp;&nbsp;<img src="images/items/2208.gif" />&nbsp;&nbsp;<img src="images/items/8871.gif" />&nbsp;&nbsp;<img src="images/items/2158.gif" />&nbsp;&nbsp;<img src="images/items/2155.gif" />&nbsp;&nbsp;<img src="images/items/2210.gif" />&nbsp;&nbsp;<img src="images/items/9970.gif" />&nbsp;&nbsp;<img src="images/items/6500.gif" />&nbsp;&nbsp;<img src="images/items/2143.gif" />&nbsp;&nbsp;<img src="images/items/2470.gif" />&nbsp;&nbsp;<img src="images/items/7368.gif" />&nbsp;&nbsp;<img src="images/items/2144.gif" />&nbsp;&nbsp;<img src="images/items/2145.gif" />&nbsp;&nbsp;<img src="images/items/2514.gif" />&nbsp;&nbsp;<img src="images/items/8932.gif" />&nbsp;&nbsp;<img src="images/items/8924.gif" />&nbsp;&nbsp;<img src="images/items/2466.gif" />&nbsp;&nbsp;<img src="images/items/7412.gif" />&nbsp;&nbsp;<img src="images/items/7590.gif" />&nbsp;&nbsp;<img src="images/items/8904.gif" />&nbsp;&nbsp;<img src="images/items/7591.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/8901.gif" />&nbsp;&nbsp;<img src="images/items/2415.gif" />&nbsp;&nbsp;<img src="images/items/8926.gif" />&nbsp;&nbsp;<img src="images/items/2645.gif" />&nbsp;&nbsp;<img src="images/items/8902.gif" />&nbsp;&nbsp;<img src="images/items/2488.gif" />&nbsp;&nbsp;<img src="images/items/8879.gif" />&nbsp;&nbsp;<img src="images/items/2146.gif" />&nbsp;&nbsp;<img src="images/items/2195.gif" />&nbsp;&nbsp;<img src="images/items/8918.gif" />&nbsp;&nbsp;', 'darklord.gif'),
(0, 'Rei Tywin', 10000, 10000000, 1000000, 490, 1, '"Saia do meu castelo!", "Voce ousa desonrar o Rei?!", "Tire eles daqui, meu cachorro!", "Eu sou o rei de todo o continente, nao me perturbe!", "SAIAAAA"', 'fire, drown, paralyze, invisible', 0, 0, 'fire', '<img src="images/items/2514.gif" />&nbsp;&nbsp;<img src="images/items/2472.gif" />&nbsp;&nbsp;<img src="images/items/2112.gif" />&nbsp;&nbsp;<img src="images/items/2470.gif" />&nbsp;&nbsp;<img src="images/items/7369.gif" />&nbsp;&nbsp;<img src="images/items/2520.gif" />&nbsp;&nbsp;<img src="images/items/6527.gif" />&nbsp;&nbsp;<img src="images/items/10521.gif" />&nbsp;&nbsp;<img src="images/items/9778.gif" />&nbsp;&nbsp;<img src="images/items/9776.gif" />&nbsp;&nbsp;<img src="images/items/9777.gif" />&nbsp;&nbsp;<img src="images/items/3969.gif" />&nbsp;&nbsp;<img src="images/items/3968.gif" />&nbsp;&nbsp;<img src="images/items/3983.gif" />&nbsp;&nbsp;<img src="images/items/2111.gif" />&nbsp;&nbsp;<img src="images/items/2435.gif" />&nbsp;&nbsp;<img src="images/items/2437.gif" />&nbsp;&nbsp;<img src="images/items/7392.gif" />&nbsp;&nbsp;<img src="images/items/7418.gif" />&nbsp;&nbsp;<img src="images/items/7428.gif" />&nbsp;&nbsp;<img src="images/items/7433.gif" />&nbsp;&nbsp;<img src="images/items/8850.gif" />&nbsp;&nbsp;<img src="images/items/7379.gif" />&nbsp;&nbsp;<img src="images/items/7386.gif" />&nbsp;&nbsp;<img src="images/items/7420.gif" />&nbsp;&nbsp;<img src="images/items/7450.gif" />&nbsp;&nbsp;<img src="images/items/7454.gif" />&nbsp;&nbsp;<img src="images/items/12327.gif" />&nbsp;&nbsp;<img src="images/items/5907.gif" />&nbsp;&nbsp;<img src="images/items/12647.gif" />&nbsp;&nbsp;<img src="images/items/2527.gif" />&nbsp;&nbsp;', 'reitywin.gif'),
(0, 'Pazuzu', 0, 2500000, 6000000, 490, 1, '"Uma dimensao so para mim... que honra!", "Veio me alimentar, humano?", "AAAAAAAAAAAAAAAAAAH QUEM ME ACORDOU?"', 'paralyze, invisible', 0, 0, 'blood', '<img src="images/items/2157.gif" />&nbsp;&nbsp;<img src="images/items/7443.gif" />&nbsp;&nbsp;<img src="images/items/12575.gif" />&nbsp;&nbsp;<img src="images/items/12396.gif" />&nbsp;&nbsp;<img src="images/items/2494.gif" />&nbsp;&nbsp;<img src="images/items/2493.gif" />&nbsp;&nbsp;<img src="images/items/2520.gif" />&nbsp;&nbsp;', 'pazuzu.gif'),
(0, 'Naz''Gul', 0, 36000, 20000, 24, 0, '"Welcome to Yalahar, outsider.", "Our wisdom and knowledge are unequalled in this world.", "One day Yalahar will return to its former glory.", "That knowledge would overburden your fragile mind."', 'paralyze, invisible', 0, 0, 'undead', '<img src="images/items/2148.gif" />&nbsp;&nbsp;', 'naz''gul.gif'),
(0, 'Amon', 0, 500000, 300000, 10, 0, '"VocÃª nÃ£o pode me derrotar!", "VocÃª estÃ¡ muito fraco...", "Acho melhor desistir"', 'earth, paralyze, invisible', 0, 0, 'blood', '<img src="images/items/8306.gif" />&nbsp;&nbsp;<img src="images/items/8302.gif" />&nbsp;&nbsp;<img src="images/items/2157.gif" />&nbsp;&nbsp;', 'amon.gif'),
(0, 'Alma Penada', 100, 78000, 55000, 1, 0, '"Oque? Porque me trouxe pra ca denovo?? Me leve devolta!", "Acabe com meu sofrimento mais uma vez!", "Eu gostava tanto da tranquilidade do outro mundo..."', 'lifedrain, paralyze', 0, 0, 'undead', '<img src="images/items/8871.gif" />&nbsp;&nbsp;<img src="images/items/2157.gif" />&nbsp;&nbsp;<img src="images/items/2396.gif" />&nbsp;&nbsp;', 'almapenada.gif'),
(0, 'Ice Ricardo', 0, 1200000, 900000, 1, 0, '"Chrr."', 'paralyze, invisible', 0, 0, 'undead', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/6527.gif" />&nbsp;&nbsp;<img src="images/items/2144.gif" />&nbsp;&nbsp;<img src="images/items/7290.gif" />&nbsp;&nbsp;<img src="images/items/2145.gif" />&nbsp;&nbsp;<img src="images/items/7441.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2146.gif" />&nbsp;&nbsp;<img src="images/items/2396.gif" />&nbsp;&nbsp;<img src="images/items/2479.gif" />&nbsp;&nbsp;<img src="images/items/7449.gif" />&nbsp;&nbsp;<img src="images/items/2383.gif" />&nbsp;&nbsp;<img src="images/items/8302.gif" />&nbsp;&nbsp;', 'icericardo.gif'),
(0, 'Thenebreus', 0, 100000, 100000, 90, 0, '"Burn, Burn HAHAHA!!", "One little mistake and your all are mine!", "MWA HAHAHAHA!", "You is my!!!", "Impossible my death!!!", "My Creator is Luck!"', 'death, paralyze, invisible', 1, 1, 'fire', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/6300.gif" />&nbsp;&nbsp;<img src="images/items/2195.gif" />&nbsp;&nbsp;<img src="images/items/2393.gif" />&nbsp;&nbsp;<img src="images/items/2432.gif" />&nbsp;&nbsp;<img src="images/items/2402.gif" />&nbsp;&nbsp;<img src="images/items/2477.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2151.gif" />&nbsp;&nbsp;<img src="images/items/2462.gif" />&nbsp;&nbsp;<img src="images/items/2149.gif" />&nbsp;&nbsp;<img src="images/items/2171.gif" />&nbsp;&nbsp;<img src="images/items/2158.gif" />&nbsp;&nbsp;<img src="images/items/2470.gif" />&nbsp;&nbsp;<img src="images/items/2520.gif" />&nbsp;&nbsp;', 'thenebreus.gif'),
(0, 'Dont Lure', 0, 15000, 500000, 1, 1, '"COME AND GIVE ME SOME AMUSEMENT!", "IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?", "I AM GHAZBARAN OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL!", "FLAWLESS VICTORY!"', 'energy, earth, fire, paralyze, invisible', 0, 0, 'fire', '<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2514.gif" />&nbsp;&nbsp;<img src="images/items/5943.gif" />&nbsp;&nbsp;<img src="images/items/2003.gif" />&nbsp;&nbsp;<img src="images/items/7431.gif" />&nbsp;&nbsp;<img src="images/items/2393.gif" />&nbsp;&nbsp;<img src="images/items/2195.gif" />&nbsp;&nbsp;<img src="images/items/2112.gif" />&nbsp;&nbsp;', 'dontlure.gif'),
(0, 'Pigglet', 255, 0, 150, 890, 0, '"Pigglet! Pigglet!", "Ser malvado ajuda voce a ganhar mais", "2.800 pizzas seriam necessarias para formar uma torre da altura da Torre de Pisa.", "Elvis Presley era coveiro, como todos em sua familia antes dele.", "Dez por cento das receitas da Russia vem da venda de Vodka.", "A American Airlines economizou 40 mil dolares em 1987 eliminando uma azeitona de cada salada servida na primeira classe.", "A Antartida eh o unico continente sem repteis", "Alunas de escolas so para meninas preferem rapazes com rosto feminino", "Piolho prejudica aprendizado", "A guerra mais curta da histÃ³ria foi entre Zanzibar e Inglaterra em 1896. O zanzibar rendeu-se ao fim de 38 minutos.", "A lagosta carnivora, que habita nas aguas costeiras da Australia, conta-se entre os predadores mais rapidos da Terra.", "A bucha contem somente de 2 a 6 por cento de THC, enquanto a seiva tem ate 60 por cento.", "360.000 Ã© o nÃºmero de vagas disponiveis no exercito suiÃ§o, cujos profissionais sao apenas 3.300.", "Apos um periodo de sede, os dromedarios sao capazes de beber, de uma so vez, de 60 a 100 litros de agua."', '', 0, 1, 'blood', '<img src="images/items/3976.gif" />&nbsp;&nbsp;<img src="images/items/2671.gif" />&nbsp;&nbsp;', 'pigglet.gif'),
(0, 'Ancient Boss', 0, 1600000, 2000000, 290, 1, '"NOONE WILL STOP ME THIS TIME!", "THE POWER IS MINE!"', 'lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', '<img src="images/items/2157.gif" />&nbsp;&nbsp;<img src="images/items/2514.gif" />&nbsp;&nbsp;<img src="images/items/2472.gif" />&nbsp;&nbsp;<img src="images/items/8299.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2678.gif" />&nbsp;&nbsp;<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/5903.gif" />&nbsp;&nbsp;<img src="images/items/2171.gif" />&nbsp;&nbsp;<img src="images/items/2415.gif" />&nbsp;&nbsp;', 'ancientboss.gif'),
(0, 'Hydroruga', 0, 4400, 2850, 10, 0, '"MORRE DIABO!", "HISSSS"', 'poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2498.gif" />&nbsp;&nbsp;<img src="images/items/2195.gif" />&nbsp;&nbsp;<img src="images/items/2475.gif" />&nbsp;&nbsp;<img src="images/items/3976.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2214.gif" />&nbsp;&nbsp;<img src="images/items/2671.gif" />&nbsp;&nbsp;<img src="images/items/2666.gif" />&nbsp;&nbsp;<img src="images/items/2146.gif" />&nbsp;&nbsp;<img src="images/items/2177.gif" />&nbsp;&nbsp;<img src="images/items/2476.gif" />&nbsp;&nbsp;<img src="images/items/4850.gif" />&nbsp;&nbsp;<img src="images/items/2149.gif" />&nbsp;&nbsp;<img src="images/items/2536.gif" />&nbsp;&nbsp;<img src="images/items/2168.gif" />&nbsp;&nbsp;<img src="images/items/2197.gif" />&nbsp;&nbsp;<img src="images/items/2112.gif" />&nbsp;&nbsp;', 'hydroruga.gif'),
(0, '[BDM] Red Skull', 0, 10000, 10200, 295, 1, '"utani gran hur", "Vem team, ajuda aqui!", "Bot!?", "Aaaah..."', 'outfit, drunk, invisible', 0, 0, 'blood', '<img src="images/items/2187.gif" />&nbsp;&nbsp;<img src="images/items/2536.gif" />&nbsp;&nbsp;<img src="images/items/8820.gif" />&nbsp;&nbsp;<img src="images/items/2195.gif" />&nbsp;&nbsp;<img src="images/items/1988.gif" />&nbsp;&nbsp;<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2268.gif" />&nbsp;&nbsp;<img src="images/items/2293.gif" />&nbsp;&nbsp;<img src="images/items/7590.gif" />&nbsp;&nbsp;', '[bdm]redskull.gif'),
(0, '[BDM] Black Skull', 0, 10000, 10200, 295, 1, '"utani gran hur", "Vem team, ajuda aqui!", "Bot!?", "Aaaah..."', 'outfit, drunk, invisible', 0, 0, 'blood', '<img src="images/items/2183.gif" />&nbsp;&nbsp;<img src="images/items/2534.gif" />&nbsp;&nbsp;<img src="images/items/8871.gif" />&nbsp;&nbsp;<img src="images/items/2195.gif" />&nbsp;&nbsp;<img src="images/items/5926.gif" />&nbsp;&nbsp;<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2268.gif" />&nbsp;&nbsp;<img src="images/items/2278.gif" />&nbsp;&nbsp;<img src="images/items/7590.gif" />&nbsp;&nbsp;', '[bdm]blackskull.gif'),
(0, '[BDM] Yellow Skull', 0, 10000, 10200, 295, 1, '"utani hur", "Vem team, ajuda aqui!", "Bot!?", "Aaaah..."', 'outfit, drunk, invisible', 0, 0, 'blood', '<img src="images/items/2407.gif" />&nbsp;&nbsp;<img src="images/items/2535.gif" />&nbsp;&nbsp;<img src="images/items/2497.gif" />&nbsp;&nbsp;<img src="images/items/2476.gif" />&nbsp;&nbsp;<img src="images/items/2002.gif" />&nbsp;&nbsp;<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2313.gif" />&nbsp;&nbsp;<img src="images/items/2261.gif" />&nbsp;&nbsp;<img src="images/items/8473.gif" />&nbsp;&nbsp;', '[bdm]yellowskull.gif'),
(0, '[BDM] White Skull', 0, 10000, 10200, 145, 1, '"utani hur", "Vem team, ajuda aqui!", "Bot!?", "Aaaah..."', 'outfit, drunk, invisible', 0, 0, 'blood', '<img src="images/items/2544.gif" />&nbsp;&nbsp;<img src="images/items/2456.gif" />&nbsp;&nbsp;<img src="images/items/2491.gif" />&nbsp;&nbsp;<img src="images/items/2195.gif" />&nbsp;&nbsp;<img src="images/items/2488.gif" />&nbsp;&nbsp;<img src="images/items/5949.gif" />&nbsp;&nbsp;<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2268.gif" />&nbsp;&nbsp;<img src="images/items/2295.gif" />&nbsp;&nbsp;<img src="images/items/8472.gif" />&nbsp;&nbsp;', '[bdm]whiteskull.gif'),
(0, 'Trapo Mermo', 0, 15000, 300200, 1, 1, '"VocÃª nÃ£o vai passar!", "Credo... Bate que nem homem!", "AUEHAUEHA... Sou muito trapadora!", "Aaaah..."', 'outfit, drunk, invisible', 0, 0, 'blood', '<img src="images/items/2407.gif" />&nbsp;&nbsp;<img src="images/items/2535.gif" />&nbsp;&nbsp;<img src="images/items/2497.gif" />&nbsp;&nbsp;<img src="images/items/2476.gif" />&nbsp;&nbsp;<img src="images/items/5462.gif" />&nbsp;&nbsp;<img src="images/items/2002.gif" />&nbsp;&nbsp;<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2313.gif" />&nbsp;&nbsp;<img src="images/items/2261.gif" />&nbsp;&nbsp;<img src="images/items/8473.gif" />&nbsp;&nbsp;', 'trapomermo.gif'),
(0, 'Exp', 0, 500000, 100, 1, 1, '"VocÃª nÃ£o vai passar!", "Credo... Bate que nem homem!", "AUEHAUEHA... Sou muito trapadora!", "Aaaah..."', 'outfit, drunk, invisible', 0, 0, 'blood', '<img src="images/items/2407.gif" />&nbsp;&nbsp;<img src="images/items/2535.gif" />&nbsp;&nbsp;<img src="images/items/2497.gif" />&nbsp;&nbsp;<img src="images/items/2476.gif" />&nbsp;&nbsp;<img src="images/items/5462.gif" />&nbsp;&nbsp;<img src="images/items/2002.gif" />&nbsp;&nbsp;<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2313.gif" />&nbsp;&nbsp;<img src="images/items/2261.gif" />&nbsp;&nbsp;<img src="images/items/8473.gif" />&nbsp;&nbsp;', 'exp.gif'),
(0, 'Noob', 0, 100, 1000, 40, 0, '"Pls itens, pls!", "Pls, no kill me! Ã³.Ã²"', '', 0, 0, 'blood', '', 'noob.gif'),
(0, 'Guarda Costas Do GOD', 0, 4000200, 7000000, 90, 0, '"Zrp zrp!"', 'paralyze, invisible', 0, 0, 'blood', '<img src="images/items/2503.gif" />&nbsp;&nbsp;<img src="images/items/2502.gif" />&nbsp;&nbsp;<img src="images/items/2504.gif" />&nbsp;&nbsp;<img src="images/items/8855.gif" />&nbsp;&nbsp;<img src="images/items/7423.gif" />&nbsp;&nbsp;<img src="images/items/7958.gif" />&nbsp;&nbsp;<img src="images/items/3983.gif" />&nbsp;&nbsp;<img src="images/items/3972.gif" />&nbsp;&nbsp;<img src="images/items/7890.gif" />&nbsp;&nbsp;<img src="images/items/1988.gif" />&nbsp;&nbsp;<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/7414.gif" />&nbsp;&nbsp;<img src="images/items/7735.gif" />&nbsp;&nbsp;<img src="images/items/6571.gif" />&nbsp;&nbsp;', 'guardacostasdogod.gif'),
(0, 'Verminor', 0, 250000, 10000000, 390, 1, '"Your Noob!"', 'earth, fire, lifedrain, paralyze, invisible', 0, 0, 'Venom', '<img src="images/items/2090.gif" />&nbsp;&nbsp;<img src="images/items/2472.gif" />&nbsp;&nbsp;<img src="images/items/3976.gif" />&nbsp;&nbsp;<img src="images/items/5906.gif" />&nbsp;&nbsp;<img src="images/items/5954.gif" />&nbsp;&nbsp;<img src="images/items/3955.gif" />&nbsp;&nbsp;<img src="images/items/2421.gif" />&nbsp;&nbsp;<img src="images/items/2157.gif" />&nbsp;&nbsp;<img src="images/items/2144.gif" />&nbsp;&nbsp;<img src="images/items/2462.gif" />&nbsp;&nbsp;<img src="images/items/8302.gif" />&nbsp;&nbsp;<img src="images/items/8300.gif" />&nbsp;&nbsp;<img src="images/items/8306.gif" />&nbsp;&nbsp;<img src="images/items/2470.gif" />&nbsp;&nbsp;<img src="images/items/2520.gif" />&nbsp;&nbsp;<img src="images/items/2418.gif" />&nbsp;&nbsp;<img src="images/items/5884.gif" />&nbsp;&nbsp;', 'verminor.gif'),
(0, 'Balghordan', 0, 900, 5000000, 1390, 0, '"NOOB!"', 'paralyze, invisible', 0, 0, 'venom', '<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/8881.gif" />&nbsp;&nbsp;<img src="images/items/2500.gif" />&nbsp;&nbsp;<img src="images/items/8903.gif" />&nbsp;&nbsp;', 'balghordan.gif'),
(0, 'Alpha Tower', 0, 12000, 10000000, 1, 0, '', 'lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'undead', '<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/8306.gif" />&nbsp;&nbsp;<img src="images/items/8300.gif" />&nbsp;&nbsp;<img src="images/items/8302.gif" />&nbsp;&nbsp;', 'alphatower.gif'),
(0, 'Morgaroth Girl', 0, 1, 80000, 105, 1, '', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', '<img src="images/items/2349.gif" />&nbsp;&nbsp;', 'morgarothgirl.gif'),
(0, 'Baron Of The Room', 0, 11000, 60000, 790, 1, '"VENEZ ICI POUR VOIR SA DEFAITE... PERDANT!", "JE VAIS ECRASER TOUS COMME S''ILS ETAIENT DES CHIENS!", "TOUS VONT MOURIR!", "LES PERDANTS, VOUS SALAUDS!"', 'paralyze, invisible', 0, 0, 'UNDEAD', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2143.gif" />&nbsp;&nbsp;<img src="images/items/2514.gif" />&nbsp;&nbsp;<img src="images/items/7590.gif" />&nbsp;&nbsp;<img src="images/items/7591.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/7431.gif" />&nbsp;&nbsp;<img src="images/items/2421.gif" />&nbsp;&nbsp;<img src="images/items/5947.gif" />&nbsp;&nbsp;<img src="images/items/7368.gif" />&nbsp;&nbsp;', 'baronoftheroom.gif'),
(0, 'Breeze', 0, 10000, 40000, 60, 0, '"I might reward you for killing my brother ~ with a swift dead!"', 'fire', 0, 0, 'fire', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2152.gif" />&nbsp;&nbsp;<img src="images/items/2144.gif" />&nbsp;&nbsp;<img src="images/items/7440.gif" />&nbsp;&nbsp;<img src="images/items/2514.gif" />&nbsp;&nbsp;<img src="images/items/2171.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2151.gif" />&nbsp;&nbsp;<img src="images/items/2470.gif" />&nbsp;&nbsp;<img src="images/items/2432.gif" />&nbsp;&nbsp;', 'breeze.gif'),
(0, 'Ghost Morgaroth', 0, 1, 80000, 155, 1, '"BOW TO THE POWER OF THE RUTHLESS SEVEN!", "Slay your friends and I will spare you!", "DON''T BE AFRAID, I AM COMING IN PEACE!", "COME HERE! FREE ITEMS FOR EVERYONE!"', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', '<img src="images/items/9971.gif" />&nbsp;&nbsp;', 'ghostmorgaroth.gif'),
(0, 'Green Phantom', 0, 600000, 91600, 325, 0, '"BU!"', 'lifedrain, death, invisible', 0, 0, 'undead', '<img src="images/items/7440.gif" />&nbsp;&nbsp;<img src="images/items/9971.gif" />&nbsp;&nbsp;<img src="images/items/12396.gif" />&nbsp;&nbsp;<img src="images/items/12575.gif" />&nbsp;&nbsp;', 'greenphantom.gif'),
(0, 'Lavanos', 0, 25000, 40000, 490, 1, '"DIE!", "COME AND YOU WILL DIE", "IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?", "I AM LAVANOS OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL!", "FLAWLESS VICTORY!"', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'UNDEAD', '<img src="images/items/2160.gif" />&nbsp;&nbsp;', 'lavanos.gif'),
(0, 'Rainbow Morgaroth', 0, 4, 80000, 140, 0, '', 'invisible', 0, 0, 'blood', '<img src="images/items/2349.gif" />&nbsp;&nbsp;', 'rainbowmorgaroth.gif'),
(0, 'Medusa', 0, 0, 150, 24, 0, '"Welcome to Yalahar, outsider.", "Our wisdom and knowledge are unequalled in this world.", "One day Yalahar will return to its former glory.", "That knowledge would overburden your fragile mind."', 'paralyze, invisible', 0, 0, 'blood', '<img src="images/items/2148.gif" />&nbsp;&nbsp;', 'medusa.gif'),
(0, 'Swamp Morgaroth', 0, 30000, 60000, 155, 1, '', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', '<img src="images/items/2349.gif" />&nbsp;&nbsp;', 'swampmorgaroth.gif'),
(0, 'The Fastest Turtle', 0, 100000, 180000, 390, 0, '"Ahhnn? human? kill everyone? or let live? I am wrong? I am Confused!", "where is my leader? Is he on the cover of a book? I am Confused..."', 'earth, ice, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'venom', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2151.gif" />&nbsp;&nbsp;', 'thefastestturtle.gif'),
(0, 'Undead Morgaroth', 0, 25000, 40000, 530, 1, '"Be prepared for the day my masters will come for you!", "I might reward you for killing my brother ~ with a swift dead!"', 'poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', '', 'undeadmorgaroth.gif'),
(0, 'Abomination Fury', 0, 30000, 31300, 300, 0, '"Zrp zrp!"', 'invisible', 0, 0, 'venom', '', 'abominationfury.gif'),
(0, 'Donate Demon', 10000, 5000, 8000, 30, 1, '"MUHAHAHAHA!", "I SMELL FEEEEEAAAR!", "CHAMEK ATH UTHUL ARAK!", "Your resistance is futile!", "Your soul will be mine!"', 'fire, drown, paralyze, invisible', 0, 0, 'fire', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2152.gif" />&nbsp;&nbsp;<img src="images/items/2514.gif" />&nbsp;&nbsp;<img src="images/items/2472.gif" />&nbsp;&nbsp;<img src="images/items/2795.gif" />&nbsp;&nbsp;<img src="images/items/5906.gif" />&nbsp;&nbsp;<img src="images/items/5954.gif" />&nbsp;&nbsp;<img src="images/items/2164.gif" />&nbsp;&nbsp;<img src="images/items/2176.gif" />&nbsp;&nbsp;<img src="images/items/1982.gif" />&nbsp;&nbsp;<img src="images/items/2165.gif" />&nbsp;&nbsp;<img src="images/items/7591.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2393.gif" />&nbsp;&nbsp;<img src="images/items/2432.gif" />&nbsp;&nbsp;<img src="images/items/2214.gif" />&nbsp;&nbsp;<img src="images/items/2396.gif" />&nbsp;&nbsp;<img src="images/items/2678.gif" />&nbsp;&nbsp;<img src="images/items/2151.gif" />&nbsp;&nbsp;<img src="images/items/2462.gif" />&nbsp;&nbsp;<img src="images/items/2149.gif" />&nbsp;&nbsp;<img src="images/items/2171.gif" />&nbsp;&nbsp;<img src="images/items/2387.gif" />&nbsp;&nbsp;<img src="images/items/2470.gif" />&nbsp;&nbsp;<img src="images/items/7382.gif" />&nbsp;&nbsp;<img src="images/items/7393.gif" />&nbsp;&nbsp;<img src="images/items/2520.gif" />&nbsp;&nbsp;<img src="images/items/2418.gif" />&nbsp;&nbsp;<img src="images/items/2112.gif" />&nbsp;&nbsp;', 'donatedemon.gif'),
(0, 'Draken Abomination', 0, 6500, 36250, 350, 0, '"Zrp zrp!"', 'invisible', 0, 0, 'venom', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2152.gif" />&nbsp;&nbsp;<img src="images/items/2144.gif" />&nbsp;&nbsp;<img src="images/items/2514.gif" />&nbsp;&nbsp;<img src="images/items/2171.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2151.gif" />&nbsp;&nbsp;<img src="images/items/2470.gif" />&nbsp;&nbsp;<img src="images/items/2432.gif" />&nbsp;&nbsp;', 'drakenabomination.gif'),
(0, 'Draken Elite', 0, 6000, 14000, 350, 0, '"Zrp zrp!"', 'invisible', 0, 0, 'venom', '<img src="images/items/2514.gif" />&nbsp;&nbsp;<img src="images/items/2472.gif" />&nbsp;&nbsp;<img src="images/items/2470.gif" />&nbsp;&nbsp;<img src="images/items/2520.gif" />&nbsp;&nbsp;<img src="images/items/2492.gif" />&nbsp;&nbsp;', 'drakenelite.gif'),
(0, 'Finger Killer', 0, 600000, 81300, 250, 0, '"Zrp zrp!"', 'invisible', 0, 0, 'venom', '<img src="images/items/7440.gif" />&nbsp;&nbsp;<img src="images/items/9971.gif" />&nbsp;&nbsp;<img src="images/items/12396.gif" />&nbsp;&nbsp;<img src="images/items/12575.gif" />&nbsp;&nbsp;', 'fingerkiller.gif'),
(0, 'Living Plant', 0, 31900, 31300, 350, 0, '"Zrp zrp!"', 'invisible', 0, 0, 'venom', '', 'livingplant.gif'),
(0, 'Lizard Abomination', 0, 900, 35000, 250, 0, '"Zrp zrp!"', 'invisible', 0, 0, 'venom', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2143.gif" />&nbsp;&nbsp;<img src="images/items/2514.gif" />&nbsp;&nbsp;<img src="images/items/7590.gif" />&nbsp;&nbsp;<img src="images/items/7591.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/7431.gif" />&nbsp;&nbsp;<img src="images/items/2421.gif" />&nbsp;&nbsp;<img src="images/items/5947.gif" />&nbsp;&nbsp;<img src="images/items/7368.gif" />&nbsp;&nbsp;', 'lizardabomination.gif'),
(0, 'Phantom Lord', 0, 650000, 81300, 250, 0, '"Zrp zrp!"', 'invisible', 0, 0, 'venom', '<img src="images/items/7440.gif" />&nbsp;&nbsp;<img src="images/items/9971.gif" />&nbsp;&nbsp;<img src="images/items/12396.gif" />&nbsp;&nbsp;<img src="images/items/12575.gif" />&nbsp;&nbsp;', 'phantomlord.gif'),
(0, 'Purple Turtle', 0, 30000, 40300, 300, 0, '"Zrp zrp!"', 'invisible', 0, 0, 'venom', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2143.gif" />&nbsp;&nbsp;<img src="images/items/2514.gif" />&nbsp;&nbsp;<img src="images/items/7590.gif" />&nbsp;&nbsp;<img src="images/items/7591.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/7431.gif" />&nbsp;&nbsp;<img src="images/items/2421.gif" />&nbsp;&nbsp;<img src="images/items/5947.gif" />&nbsp;&nbsp;<img src="images/items/7368.gif" />&nbsp;&nbsp;', 'purpleturtle.gif'),
(0, 'Snake God Essence', 0, 11000, 30000, 350, 0, '"Zrp zrp!"', 'invisible', 0, 0, 'venom', '<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2146.gif" />&nbsp;&nbsp;<img src="images/items/2666.gif" />&nbsp;&nbsp;<img src="images/items/2214.gif" />&nbsp;&nbsp;<img src="images/items/7391.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/2672.gif" />&nbsp;&nbsp;<img src="images/items/7888.gif" />&nbsp;&nbsp;<img src="images/items/8887.gif" />&nbsp;&nbsp;', 'snakegodessence.gif'),
(0, 'Souleater', 0, 21300, 21100, 200, 0, '"Zrp zrp!"', 'invisible', 0, 0, 'venom', '', 'souleater.gif'),
(0, 'Triple Medusa', 0, 20000, 33000, 300, 0, '"Zrp zrp!"', 'invisible', 0, 0, 'venom', '<img src="images/items/2148.gif" />&nbsp;&nbsp;<img src="images/items/2160.gif" />&nbsp;&nbsp;<img src="images/items/2143.gif" />&nbsp;&nbsp;<img src="images/items/2514.gif" />&nbsp;&nbsp;<img src="images/items/7590.gif" />&nbsp;&nbsp;<img src="images/items/7591.gif" />&nbsp;&nbsp;<img src="images/items/1987.gif" />&nbsp;&nbsp;<img src="images/items/7431.gif" />&nbsp;&nbsp;<img src="images/items/2421.gif" />&nbsp;&nbsp;<img src="images/items/5947.gif" />&nbsp;&nbsp;<img src="images/items/7368.gif" />&nbsp;&nbsp;', 'triplemedusa.gif'),
(0, 'Phelps', 0, 20000, 50200, 395, 1, '', 'paralyze, outfit, drunk, invisible', 0, 0, 'blood', '<img src="images/items/2187.gif" />&nbsp;&nbsp;<img src="images/items/2536.gif" />&nbsp;&nbsp;<img src="images/items/8820.gif" />&nbsp;&nbsp;<img src="images/items/2195.gif" />&nbsp;&nbsp;', 'phelps.gif'),
(0, 'Shark', 0, 20000, 50200, 395, 1, '', 'paralyze, outfit, drunk, invisible', 0, 0, 'blood', '', 'shark.gif'),
(0, 'Beta', 0, 20000, 50200, 395, 1, '', 'outfit, drunk, invisible', 0, 0, 'blood', '', 'beta.gif');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_network_box`
--

CREATE TABLE IF NOT EXISTS `z_network_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `network_name` varchar(10) NOT NULL,
  `network_link` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_news_tickers`
--

CREATE TABLE IF NOT EXISTS `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT '1',
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_news_tickers`
--

INSERT INTO `z_news_tickers` (`date`, `author`, `image_id`, `text`, `hide_ticker`) VALUES
(1456751286, 1, 1, 'WELCOME!', 1),
(1457005474, 5, 0, '<b>Bem Vindo</b>', 1),
(1457017275, 5, 0, '<b>[InauguraÃ§Ã£o]</b> Hoje as 17:00 estamos inaugurando uma nova era. Chame seus amigos e venha conferir!!', 1),
(1457031932, 5, 0, '<b>[IP]</b> darkbaiak.com', 1),
(1457033749, 5, 0, '<b>[EVENTO]</b> Os 5 primeiros do top level que permanecer atÃ© dia 06.03 ganharam 10 points cada.', 1),
(1457140043, 5, 0, 'EVENTO FREE POINTS LEVEL 400 VOCÃŠ GANHA 15 POINTS DONATES AUTOMATICAMENTE! EVENTO ENCERRA DIA 08.03', 1),
(1457199185, 5, 0, 'SERVIDOR OFFLINE Estamos realizando uma manutenÃ§Ã£o no servidor, voltaremos logo..', 1),
(1457285587, 5, 0, 'ESTAMOS EM MANUTENÃ‡ÃƒO!!!!!!!', 1),
(1457293158, 5, 0, 'SERVIDOR ONLINE!!', 1),
(1457444577, 5, 0, '[TRIPLE POINTS] SOMENTE HOJE DIA 08.03!', 1),
(1457445458, 5, 0, '<b>[TRIPLE POINTS]</b> SÓ MAIS HOJE 09-03 para doaÃ§Ãµes acima de 20 reais', 1),
(1444140510, 2887014, 0, 'Servidor Online! Novamente Desculpe pelos problemas ocorridos, passamos muitas horas trabalhando e pedimos desculpas. Area Donate liberada por 24 horas para todos!', 1),
(1457642358, 5, 0, 'WELCOME', 1),
(1457642417, 5, 0, 'Fizemos um update com base nas sugestões que recebemos dos jogadores do Baiaknew, confiram na noticia e em nossa pagina no Facebook!', 0),
(1457738073, 5, 0, 'Estamos em MANUTENÃ‡ÃƒO!', 1),
(1457999015, 5, 0, '<p><strong>Contato com o Administrador</strong><span>:&nbsp;</span><span style="text-decoration: underline;">baiaknewpayment@gmail.com</span></p>', 1),
(1457999132, 5, 0, '<b>Contato com o Administrador</b>:     baiaknewpayment@gmail.com', 1),
(1457999201, 5, 0, 'Contato com o Administrador    baiaknewpayment@gmail.com', 0),
(1458087710, 5, 0, '[Ts3] <b>ts3.baiaknew.com:5605</b>', 1),
(1458257713, 5, 0, 'O servidor será resetado FULL ficará OFFLINE e volta sábado as 14:00 horas.', 1),
(1458351667, 2130, 0, 'Novo rap do baiaknew, clique em play e escute o novo som do baiaknew!!!', 0),
(1458366219, 2130, 0, 'Problemas de conexão? use o ip: baiaknew.noip.me', 0),
(1458596461, 2130, 0, 'Servidor resetado pessoal venho até aqui informar a todos que trabalhamos duro em cima do servidor fizemos muitas alteraçoes ao servidor e aconteceu um bug e teremos que resetar o servidor novamente, quero pedir a todos um voto de confiança e pedir desculpas pelo ocorrido. Nos aumentamos o fast atk do servidor, aumentamos as rates. Mudamos o visual no mapa espero que todos fiquem satisfeitos. Equipe Baiaknew.', 0),
(1458616941, 2130, 0, 'Castle Of Emperium 48hr com hunts EXCLUSIVAS sera aberto todos os dias as 20:00 horas a guild que manter dominada o castle até finalizar ganhará hunts exclusivas por 24 horas, até reabrir o castle as 22:00 do outro dia.', 0),
(1458640110, 2130, 0, 'Doações realizadas devem ser confirmadas enviando seu comprovante para o email baiaknewpayment@gmail.com', 0),
(1458645507, 2130, 0, 'PROMOÇÃO DOUBLE POINTS POR TEMPO LIMITADO!', 0),
(1459161151, 2130, 0, 'Agora todos os Eventos ganham event coins que você pode trocar por itens no Npc Event Seller no templo!!', 0),
(1459252756, 2130, 0, 'Update 29.03 Adicionamos o evento Firestorm e o Evento Desert War! Modificamos o Event Zombie, e o Capture the flag! Novo Minigame do Cassino funcional também! Todos estes eventos você ganha Event Coins que você pode trocar por itens no Npc Event Seller que está localizado ao templo! Apartir de hoje os eventos começam a rolar as 9 horas da manhã e terminam a meia noite!', 0),
(1459392824, 2130, 0, 'Agora você pode casar com outro jogador para casar digite exemplo: !marry nomedojogador', 0),
(1460174889, 2130, 0, 'Evento com premiação de points, entre em nossa pagina do facebook para conferir o evento ou aqui mesmo em nosso site leia sobre e participe e tenha chance de ganhar pontos donates!', 0),
(1460246196, 2130, 0, 'New Baiak OTX Full By Jonatas Felipe!', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_comunication`
--

CREATE TABLE IF NOT EXISTS `z_ots_comunication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2567 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_guildcomunication`
--

CREATE TABLE IF NOT EXISTS `z_ots_guildcomunication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls`
--

CREATE TABLE IF NOT EXISTS `z_polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls_answers`
--

CREATE TABLE IF NOT EXISTS `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_history_item`
--

CREATE TABLE IF NOT EXISTS `z_shopguild_history_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_history_pacc`
--

CREATE TABLE IF NOT EXISTS `z_shopguild_history_pacc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_offer`
--

CREATE TABLE IF NOT EXISTS `z_shopguild_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12658 ;

--
-- Extraindo dados da tabela `z_shopguild_offer`
--

INSERT INTO `z_shopguild_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`, `pid`) VALUES
(7424, 5, 7424, 1, 0, 0, 'itemvip', '[Druid] and [Sorcerers]', 'Destruction Staff', 0),
(5468, 7, 5468, 1, 0, 0, 'item', 'Use Em Voce e Remova Red e BlackSkull', 'Remova seu Redskull', 0),
(7420, 5, 7420, 1, 0, 0, 'itemvip', 'You see a Destruction Axe (Atk:97, Def:30 +1, club fighting +2, sword fighting +2, axe fighting +2).\r\nIt can only be wielded properly by elite knights of level 80 or higher.', 'Destruction Axe', 0),
(7450, 5, 7450, 1, 0, 0, 'itemvip', 'You see a Destruction club (Atk:97, Def:30 +1, club fighting +2, sword fighting +2, axe fighting +2).\r\nIt can only be wielded properly by elite knights of level 80 or higher.', 'Destruction Club', 0),
(7417, 5, 7417, 1, 0, 0, 'itemvip', 'You see Destruction Sword (Atk:97, Def:30 +1, club fighting +2, sword fighting +2, axe fighting +2).\r\nIt can only be wielded properly by elite knights of level 80 or higher.', 'Destruction Sword', 0),
(8854, 5, 8854, 1, 0, 0, 'itemvip', 'You see a Destruction Bow (Atk:115).\r\nIt can only be wielded properly by royal paladins of level 80 or higher.', 'Destruction Bow', 0),
(2641, 4, 2641, 1, 0, 0, 'itemvip', 'Soft + Boh.', 'Regeneration Boots', 0),
(12657, 5, 8903, 1, 0, 0, 'itemvip', 'You see a galaxy spellbook (Def:17, magic level +4).\r\nIt can only be wielded properly by master sorcerers and elder druids', 'Galaxy Spellbook', 0),
(2523, 5, 2523, 1, 0, 0, 'itemvip', 'You see a blessed shield (Def:80, protection physical +3%).', 'Blessed Shield', 0),
(2160, 1, 2160, 100, 0, 0, 'item', 'Compre 1kk', 'Crystal Coins', 0),
(2346, 10, 2346, 1, 0, 0, 'item', 'Compre Stamina Potion', 'Stamina Potion', 0),
(7440, 10, 7440, 2, 0, 0, 'item', 'Compre 1 Double Exp.', 'Double Exp Event', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_item`
--

CREATE TABLE IF NOT EXISTS `z_shop_history_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_pacc`
--

CREATE TABLE IF NOT EXISTS `z_shop_history_pacc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_offer`
--

CREATE TABLE IF NOT EXISTS `z_shop_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12715 ;

--
-- Extraindo dados da tabela `z_shop_offer`
--

INSERT INTO `z_shop_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`, `pid`, `type`) VALUES
(7889, 40, 7889, 1, 0, 0, 'itemvip', 'Nunca mais precisara pagar bless com ele equipado voce tera bless infinita! Protecao do seu loot. Mesmo estando red ou black skull seus itens nao dropam.', 'Blessing Amulet', 0, 'outros'),
(2390, 15, 2390, 1, 0, 0, 'itemvip', 'You see a New Kina sword (Atk:115, Def:40, sword fighting +2)', 'New Kina Sword', 0, 'knight'),
(8925, 15, 8925, 1, 0, 0, 'itemvip', 'You see the New Kina axe (Atk:115, Def:40, axe fighting +2).', 'New Kina Axe', 0, 'knight'),
(12655, 15, 12655, 1, 0, 0, 'itemvip', 'Para druids e sorcerer. Hit 600-650', 'New Mage Staff', 0, 'mage'),
(12654, 15, 12654, 1, 0, 0, 'itemvip', 'New Pally bow attack:130', 'New Pally Bow', 0, 'paladin'),
(2501, 10, 2501, 1, 0, 0, 'itemvip', 'You see a New Kina Helmet (Arm:30, club fighting +4, sword fighting +4, axe fighting +4, protection All damages +5%). It can only be wielded properly by elite knights.', 'New Kina Helmet', 0, 'knight'),
(2503, 10, 2503, 1, 0, 0, 'itemvip', 'You see a New Kina Armor (Arm:30, club fighting +5, sword fighting +5, axe fighting +5, protection All damages +5%).', 'New Kina Armor', 0, 'knight'),
(2504, 10, 2504, 1, 0, 0, 'itemvip', 'You see New Kina legs (Arm:30, club fighting +5, sword fighting +5, axe fighting +5, protection All damages +5%).', 'New Kina Legs', 0, 'knight'),
(12649, 10, 12649, 1, 0, 0, 'itemvip', 'Heal 2x mais que soft boots,Speed +25\r\n[Knight]', 'New Kina Boots', 0, 'knight'),
(2538, 10, 2538, 1, 0, 0, 'itemvip', 'You see an new Kina shield (Def:150).Protect holy 5% Protect death 5% [Knight]', 'New Kina Shield', 0, 'knight'),
(12641, 10, 12641, 1, 0, 0, 'itemvip', 'You see a new mage helmet (Arm:20, magic level +6,protection All damages +5%). It can only be wielded properly by master sorcerers and elder druids.', 'New Mage helmet', 0, 'mage'),
(12642, 10, 12642, 1, 0, 0, 'itemvip', 'You see a new mage armor (Arm:20, magic level +6, protection All damages +5%). It can only be wielded properly by master sorcerers and elder druids.', 'New Mage Armor', 0, 'mage'),
(12643, 10, 12643, 1, 0, 0, 'itemvip', 'You see a new mage legs (Arm:20, (protection All damages +5%), + 4 magic level). It can only be wielded properly by master sorcerers and elder druids', 'New Mage Legs', 0, 'mage'),
(7443, 4, 7443, 1, 0, 0, 'item', 'Use e ganhe 50% a mais de exp por 1 hora.\r\n', 'Double Exp 1 hora', 0, 'outros'),
(12644, 10, 12644, 1, 0, 0, 'itemvip', 'Heal 2x mais que soft boots,Speed +25\r\n[Sorcerer/Druids]', 'New Mage Boots', 0, 'mage'),
(12645, 10, 12645, 1, 0, 0, 'itemvip', 'You see a mage spellbook (Def:50, magic level +6 protect physical 10%). It can only be wielded properly by master sorcerers and elder druids.', 'New Mage Spellbook', 0, 'mage'),
(12657, 15, 12657, 1, 0, 0, 'item', '(Protect All Attacks 5%) Use somente com bless!', 'New Amulet', 0, 'outros'),
(12289, 30, 12289, 1, 0, 0, 'item', 'Recarregue toda sua stamina quando quiser!', 'Stamina Potion', 0, 'outros'),
(12658, 20, 12658, 1, 0, 0, 'item', '(Adiciona +1000 de HP/ +2000 Mana) + 5 Magic Level. \r\n<br><font color="red">Ex: Colocando o ring Life sobe +1000/Mana sobe +2000, tirando o Life/Mana volta ao normal novamente. !</font></td>', 'New Mage Ring', 0, 'mage'),
(9971, 4, 9971, 30, 0, 0, 'item', '30x Gold ingots ( 30kk )', 'Compre 30kk', 0, 'outros'),
(8981, 6, 8981, 1, 0, 0, 'item', 'Escritura de Cave Exclusiva. Use este item para virar o dono de uma Hunt de Super UP por 6 horas. Uso somente para level menor que 700.', 'Escritura de Cave Exclusiva', 0, 'outros'),
(12708, 30, 0, 90, 0, 0, 'vipdays', 'Ganhe 20% a mais de experiencia e tenha acesso a area donate por 90 dias.', '90 Dias de Donate', 0, 'outros'),
(12707, 15, 0, 30, 0, 0, 'vipdays', 'Ganhe 20% a mais de experiencia e tenha acesso a area donate por 30 dias.', '30 Dias de Donate', 0, 'outros'),
(12709, 10, 0, 15, 0, 0, 'vipdays', 'Ganhe 20% a mais de experiencia e tenha acesso a area donate por 15 dias.', '15 Dias de Donate', 0, 'outros'),
(12636, 10, 12636, 1, 0, 0, 'itemvip', 'You see a New Pally Helmet (Arm:30, distance fighting +4, protection All damages +5%).', 'New Pally Helmet', 0, 'paladin'),
(12637, 10, 12637, 1, 0, 0, 'itemvip', 'You see a New Pally Armor (Arm:30, distance fighting +5, protection All damages +5%).', 'New Pally Armor', 0, 'paladin'),
(12638, 10, 12638, 1, 0, 0, 'itemvip', 'You see New Pally legs (Arm:30, distance fighting +4, protection All damages +5%).', 'New Pally Legs', 0, 'paladin'),
(12639, 10, 12639, 1, 0, 0, 'itemvip', 'Heal 2x mais que soft boots,Speed + 25 [Paladin]', 'New Pally Boots', 0, 'paladin'),
(12640, 10, 12640, 1, 0, 0, 'itemvip', 'You see an New Pally shield (Def:130).Protect holy 5% Protect death 5% [Paladin]', 'New Pally Shield', 0, 'paladin'),
(10502, 20, 10502, 1, 0, 0, 'item', '(Adiciona +2000 de HP/ +1000 Mana) + 4 Skill Level. \r\n<br><font color="red">Ex: Colocando o ring Life sobe +2000/Mana sobe +1000, tirando o Life/Mana volta ao normal novamente. !</font></td>', 'New Kina Ring', 0, 'knight'),
(6300, 20, 6300, 1, 0, 0, 'item', '(Adiciona +1500 de HP/Mana) + 4 Distance\r\n<br><font color="red">Ex: Colocando o ring Life/Mana sobe +1500, tirando o Life/Mana desce -1500!</font>', 'New Pally Ring', 0, 'paladin'),
(5801, 1, 5801, 1, 0, 0, 'item', 'Backpack Donate com 36 Slots de capacidade.', 'New Backpack', 0, 'outros'),
(12712, 7, 8300, 1, 0, 0, 'item', 'Use em cima de vocÃª e ganhe um novo Outfit!\r\n<p><img src="./images/addons/Barbarian.gif"/><img src="./images/addons/Barbaria.gif"/>', 'Outfit', 0, 'outros'),
(12575, 15, 12575, 20, 0, 0, 'item', 'Compre 20x Dodge Stones', 'Dodge Stones', 0, 'outros'),
(12396, 15, 12396, 20, 0, 0, 'item', 'Compre 20x Critical Stones', 'Critical Stone', 0, 'outros'),
(9693, 7, 9693, 1, 0, 0, 'item', 'Ganhe um addon full digite:<br>\r\nex: !addon mage, !addon warrior', 'Addon Doll', 0, 'outros'),
(11138, 30, 11138, 1, 0, 0, 'item', 'Todas addons full em apenas um clique!', 'Super Addon Doll', 0, 'outros'),
(2444, 15, 2444, 1, 0, 0, 'itemvip', 'You see a New Kina Club (Atk:115, Def:40, club fighting +2)', 'New Kina Club', 0, 'knight');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_spells`
--

CREATE TABLE IF NOT EXISTS `z_spells` (
  `name` varchar(255) NOT NULL,
  `spell` varchar(255) NOT NULL,
  `spell_type` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL DEFAULT '0',
  `lvl` int(11) NOT NULL DEFAULT '0',
  `mlvl` int(11) NOT NULL DEFAULT '0',
  `soul` int(11) NOT NULL DEFAULT '0',
  `pacc` varchar(255) NOT NULL,
  `vocations` varchar(255) NOT NULL,
  `conj_count` int(11) NOT NULL DEFAULT '0',
  `hide_spell` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_spells`
--

INSERT INTO `z_spells` (`name`, `spell`, `spell_type`, `mana`, `lvl`, `mlvl`, `soul`, `pacc`, `vocations`, `conj_count`, `hide_spell`) VALUES
('Conjure Arrow', 'exevo con', 'conjure', 100, 13, 0, 1, 'no', '', 10, 0),
('Poisoned Arrow', 'exevo con pox', 'conjure', 130, 16, 0, 2, 'no', '', 7, 0),
('Conjure Bolt', 'exevo con mort', 'conjure', 140, 17, 0, 2, 'no', '', 5, 0),
('Conjure Sniper Arrow', 'exevo con hur', 'conjure', 160, 24, 0, 3, 'no', '', 5, 0),
('Explosive Arrow', 'exevo con flam', 'conjure', 290, 25, 0, 3, 'no', '', 8, 0),
('Conjure Piercing Bolt', 'exevo con grav', 'conjure', 180, 33, 0, 3, 'no', '', 5, 0),
('Enchant Staff', 'exeta vis', 'conjure', 80, 41, 0, 0, 'no', '', 0, 0),
('Enchant Spear', 'exeta con', 'conjure', 350, 45, 0, 3, 'no', '', 0, 0),
('Power Bolt', 'exevo con vis', 'conjure', 800, 59, 0, 3, 'no', '', 10, 0),
('Poison Field', 'adevo grav pox', 'conjure', 200, 14, 0, 1, 'no', '', 3, 0),
('Light Magic Missile', 'adori min vis', 'conjure', 120, 15, 0, 1, 'no', '', 10, 0),
('Fire Field', 'adevo grav flam', 'conjure', 240, 15, 0, 1, 'no', '', 3, 0),
('Fireball', 'adori flam', 'conjure', 460, 27, 0, 3, 'no', '', 5, 0),
('Energy Field', 'adevo grav vis', 'conjure', 320, 18, 0, 2, 'no', '', 3, 0),
('Stalagmite', 'adori tera', 'conjure', 400, 24, 0, 2, 'no', '', 10, 0),
('Great Fireball', 'adori mas flam', 'conjure', 530, 30, 0, 3, 'no', '', 3, 0),
('Heavy Magic Missile', 'adori vis', 'conjure', 350, 25, 0, 2, 'no', '', 10, 0),
('Poison Bomb', 'adevo mas pox', 'conjure', 520, 25, 0, 2, 'no', '', 2, 0),
('Firebomb', 'adevo mas flam', 'conjure', 600, 27, 0, 3, 'no', '', 2, 0),
('Soulfire', 'adevo res flam', 'conjure', 600, 27, 0, 3, 'no', '', 3, 0),
('Poison Wall', 'adevo mas grav pox', 'conjure', 640, 29, 0, 3, 'no', '', 3, 0),
('Explosion', 'adevo mas hur', 'conjure', 570, 31, 0, 3, 'no', '', 6, 0),
('Fire Wall', 'adevo mas grav flam', 'conjure', 780, 33, 0, 3, 'no', '', 3, 0),
('Energybomb', 'adevo mas vis', 'conjure', 880, 37, 0, 5, 'no', '', 2, 0),
('Energy Wall', 'adevo mas grav vis', 'conjure', 1000, 41, 0, 5, 'no', '', 3, 0),
('Sudden Death', 'adori gran mort', 'conjure', 985, 45, 0, 5, 'no', '', 3, 0),
('Cure Poison Rune', 'adana pox', 'conjure', 200, 15, 0, 1, 'no', '', 1, 0),
('Intense Healing Rune', 'adura gran', 'conjure', 240, 15, 0, 2, 'no', '', 1, 0),
('Ultimate Healing Rune', 'adura vita', 'conjure', 400, 24, 0, 3, 'no', '', 1, 0),
('Convince Creature', 'adeta sio', 'conjure', 200, 16, 0, 3, 'no', '', 1, 0),
('Animate Dead', 'adana mort', 'conjure', 600, 27, 0, 5, 'no', '', 1, 0),
('Chameleon', 'adevo ina', 'conjure', 600, 27, 0, 2, 'no', '', 1, 0),
('Destroy Field', 'adito grav', 'conjure', 120, 17, 0, 2, 'no', '', 3, 0),
('Desintegrate', 'adito tera', 'conjure', 200, 21, 0, 3, 'no', '', 3, 0),
('Magic Wall', 'adevo grav tera', 'conjure', 750, 32, 0, 5, 'no', '', 3, 0),
('Wild Growth', 'adevo grav vita', 'conjure', 600, 27, 0, 5, 'no', '', 2, 0),
('Paralyze', 'adana ani', 'conjure', 1400, 54, 0, 3, 'no', '', 1, 0),
('Icicle', 'adori frigo', 'conjure', 460, 28, 0, 3, 'no', '', 5, 0),
('Avalanche', 'adori mas frigo', 'conjure', 530, 30, 0, 3, 'no', '', 3, 0),
('Stone Shower', 'adori mas tera', 'conjure', 430, 28, 0, 3, 'no', '', 3, 0),
('Thunderstorm', 'adori mas vis', 'conjure', 430, 28, 0, 3, 'no', '', 3, 0),
('Holy Missile', 'adori san', 'conjure', 350, 27, 0, 3, 'no', '', 5, 0),
('Death Strike', 'exori mort', 'instant', 20, 16, 0, 0, 'yes', '', 0, 0),
('Flame Strike', 'exori flam', 'instant', 20, 14, 0, 0, 'yes', '', 0, 0),
('Strong Flame Strike', 'exori gran flam', 'instant', 60, 70, 0, 0, 'yes', '', 0, 0),
('Ultimate Flame Strike', 'exori max flam', 'instant', 100, 90, 0, 0, 'yes', '', 0, 0),
('Energy Strike', 'exori vis', 'instant', 20, 12, 0, 0, 'yes', '', 0, 0),
('Strong Energy Strike', 'exori gran vis', 'instant', 60, 80, 0, 0, 'yes', '', 0, 0),
('Ultimate Energy Strike', 'exori max vis', 'instant', 100, 100, 0, 0, 'yes', '', 0, 0),
('Whirlwind Throw', 'exori hur', 'instant', 40, 28, 0, 0, 'yes', '', 0, 0),
('Fire Wave', 'exevo flam hur', 'instant', 25, 18, 0, 0, 'no', '', 0, 0),
('Ethereal Spear', 'exori con', 'instant', 25, 23, 0, 0, 'yes', '', 0, 0),
('Energy Beam', 'exevo vis lux', 'instant', 40, 23, 0, 0, 'no', '', 0, 0),
('Great Energy Beam', 'exevo gran vis lux', 'instant', 110, 29, 0, 0, 'no', '', 0, 0),
('Groundshaker', 'exori mas', 'instant', 160, 33, 0, 0, 'yes', '', 0, 0),
('Berserk', 'exori', 'instant', 115, 35, 0, 0, 'yes', '', 0, 0),
('Brutal Strike', 'exori ico', 'instant', 30, 16, 0, 0, 'yes', '', 0, 0),
('Front Sweep', 'exori min', 'instant', 200, 70, 0, 0, 'yes', '', 0, 0),
('Inflict Wound', 'utori kor', 'instant', 30, 40, 0, 0, 'yes', '', 0, 0),
('Ignite', 'utori flam', 'instant', 30, 26, 0, 0, 'yes', '', 0, 0),
('Lightning', 'exori amp vis', 'instant', 60, 55, 0, 0, 'yes', '', 0, 0),
('Curser', 'utori mort', 'instant', 30, 75, 0, 0, 'yes', '', 0, 0),
('Electrify', 'utori vis', 'instant', 30, 34, 0, 0, 'yes', '', 0, 0),
('Energy Wave', 'exevo vis hur', 'instant', 170, 38, 0, 0, 'no', '', 0, 0),
('Rage of the Skies', 'exevo gran mas vis', 'instant', 600, 55, 0, 0, 'yes', '', 0, 0),
('Fierce Berserk', 'exori gran', 'instant', 340, 90, 0, 0, 'yes', '', 0, 0),
('Hells Core', 'exevo gran mas flam', 'instant', 700, 60, 0, 0, 'yes', '', 0, 0),
('Holy Flash', 'utori san', 'instant', 30, 70, 0, 0, 'yes', '', 0, 0),
('Divine Missile', 'exori san', 'instant', 20, 40, 0, 0, 'yes', '', 0, 0),
('Divine Caldera', 'exevo mas san', 'instant', 160, 50, 0, 0, 'yes', '', 0, 0),
('Physical Strike', 'exori moe ico', 'instant', 20, 16, 0, 0, 'yes', '', 0, 0),
('Eternal Winter', 'exevo gran mas frigo', 'instant', 1000, 60, 0, 0, 'yes', '', 0, 0),
('Ice Strike', 'exori frigo', 'instant', 20, 15, 0, 0, 'yes', '', 0, 0),
('Strong Ice Strike', 'exori gran frigo', 'instant', 60, 80, 0, 0, 'yes', '', 0, 0),
('Ultimate Ice Strike', 'exori max frigo', 'instant', 100, 100, 0, 0, 'yes', '', 0, 0),
('Ice Wave', 'exevo frigo hur', 'instant', 25, 18, 0, 0, 'no', '', 0, 0),
('Strong Ice Wave', 'exevo gran frigo hur', 'instant', 170, 40, 0, 0, 'yes', '', 0, 0),
('Envenom', 'utori pox', 'instant', 30, 50, 0, 0, 'yes', '', 0, 0),
('Terra Strike', 'exori tera', 'instant', 20, 13, 0, 0, 'yes', '', 0, 0),
('Strong Terra Strike', 'exori gran tera', 'instant', 60, 70, 0, 0, 'yes', '', 0, 0),
('Ultimate Terra Strike', 'exori max tera', 'instant', 100, 90, 0, 0, 'yes', '', 0, 0),
('Terra Wave', 'exevo tera hur', 'instant', 210, 38, 0, 0, 'no', '', 0, 0),
('Wrath of Nature', 'exevo gran mas tera', 'instant', 700, 55, 0, 0, 'yes', '', 0, 0),
('Light Healing', 'exura', 'instant', 20, 9, 0, 0, 'no', '', 0, 0),
('Wound Cleansing', 'exura ico', 'instant', 40, 10, 0, 0, 'no', '', 0, 0),
('Intense Wound Cleansing', 'exura gran ico', 'instant', 200, 80, 0, 0, 'no', '', 0, 0),
('Cure Electrification', 'exana vis', 'instant', 30, 22, 0, 0, 'yes', '', 0, 0),
('Cure Poison', 'exana pox', 'instant', 30, 10, 0, 0, 'no', '', 0, 0),
('Cure Burning', 'exana flam', 'instant', 30, 30, 0, 0, 'yes', '', 0, 0),
('Cure Curse', 'exana mort', 'instant', 40, 80, 0, 0, 'yes', '', 0, 0),
('Recovery', 'utura', 'instant', 75, 50, 0, 0, 'yes', '', 0, 0),
('Intense Recovery', 'utura gran', 'instant', 165, 100, 0, 0, 'yes', '', 0, 0),
('Intense Healing', 'exura gran', 'instant', 70, 20, 0, 0, 'no', '', 0, 0),
('Heal Friend', 'exura sio', 'instant', 140, 18, 0, 0, 'yes', '', 0, 0),
('Ultimate Healing', 'exura vita', 'instant', 160, 30, 0, 0, 'no', '', 0, 0),
('Mass Healing', 'exura gran mas res', 'instant', 150, 36, 0, 0, 'yes', '', 0, 0),
('Divine Healing', 'exura san', 'instant', 160, 35, 0, 0, 'no', '', 0, 0),
('Light', 'utevo lux', 'instant', 20, 8, 0, 0, 'no', '', 0, 0),
('Find Person', 'exiva', 'instant', 20, 8, 0, 0, 'no', '', 0, 0),
('Magic Rope', 'exani tera', 'instant', 20, 9, 0, 0, 'yes', '', 0, 0),
('Levitate', 'exani hur', 'instant', 50, 12, 0, 0, 'yes', '', 0, 0),
('Great Light', 'utevo gran lux', 'instant', 60, 13, 0, 0, 'no', '', 0, 0),
('Magic Shield', 'utamo vita', 'instant', 50, 14, 0, 0, 'no', '', 0, 0),
('Haste', 'utani hur', 'instant', 60, 14, 0, 0, 'yes', '', 0, 0),
('Charge', 'utani tempo hur', 'instant', 100, 25, 0, 0, 'yes', '', 0, 0),
('Swift Foot', 'utamo tempo san', 'instant', 400, 55, 0, 0, 'yes', '', 0, 0),
('Challenge', 'exeta res', 'instant', 30, 20, 0, 0, 'yes', '', 0, 0),
('Strong Haste', 'utani gran hur', 'instant', 100, 20, 0, 0, 'yes', '', 0, 0),
('Ultimate Light', 'utevo vis lux', 'instant', 140, 26, 0, 0, 'yes', '', 0, 0),
('Cancel Invisibility', 'exana ina', 'instant', 200, 26, 0, 0, 'yes', '', 0, 0),
('Invisibility', 'utana vid', 'instant', 440, 35, 0, 0, 'no', '', 0, 0),
('Sharpshooter', 'utito tempo san', 'instant', 450, 60, 0, 0, 'yes', '', 0, 0),
('Protector', 'utamo tempo', 'instant', 200, 55, 0, 0, 'yes', '', 0, 0),
('Blood Rage', 'utito tempo', 'instant', 290, 60, 0, 0, 'yes', '', 0, 0),
('Train Party', 'utito mas sio', 'instant', 60, 32, 0, 0, 'yes', '', 0, 0),
('Protect Party', 'utamo mas sio', 'instant', 90, 32, 0, 0, 'yes', '', 0, 0),
('Heal Party', 'utura mas sio', 'instant', 120, 32, 0, 0, 'yes', '', 0, 0),
('Enchant Party', 'utori mas sio', 'instant', 120, 32, 0, 0, 'yes', '', 0, 0),
('Creature Illusion', 'utevo res ina', 'instant', 100, 23, 0, 0, 'no', '', 0, 0),
('Food', 'exevo pan', 'instant', 120, 14, 0, 1, 'no', '', 0, 0);

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD CONSTRAINT `environment_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_kills`
--
ALTER TABLE `guild_kills`
  ADD CONSTRAINT `guild_kills_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_2` FOREIGN KEY (`war_id`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_3` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD CONSTRAINT `guild_wars_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_wars_ibfk_2` FOREIGN KEY (`enemy_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD CONSTRAINT `house_auctions_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `house_auctions_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `house_data`
--
ALTER TABLE `house_data`
  ADD CONSTRAINT `house_data_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `killers`
--
ALTER TABLE `killers`
  ADD CONSTRAINT `killers_ibfk_1` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `login_history`
--
ALTER TABLE `login_history`
  ADD CONSTRAINT `login_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`);

--
-- Restrições para a tabela `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_killers`
--
ALTER TABLE `player_killers`
  ADD CONSTRAINT `player_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_killers_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_skills`
--
ALTER TABLE `player_skills`
  ADD CONSTRAINT `player_skills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_statements`
--
ALTER TABLE `player_statements`
  ADD CONSTRAINT `player_statements_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD CONSTRAINT `player_viplist_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_viplist_ibfk_2` FOREIGN KEY (`vip_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `server_reports`
--
ALTER TABLE `server_reports`
  ADD CONSTRAINT `server_reports_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `tiles`
--
ALTER TABLE `tiles`
  ADD CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `tile_items`
--
ALTER TABLE `tile_items`
  ADD CONSTRAINT `tile_items_ibfk_1` FOREIGN KEY (`tile_id`) REFERENCES `tiles` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
