-- phpMyAdmin SQL Dump
-- version 2.11.9.2
-- http://www.phpmyadmin.net
--
-- Host: db1
-- Generation Time: Jan 23, 2010 at 07:03 PM
-- Server version: 5.0.67
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shinto_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL,
  `email` varchar(100) collate utf8_unicode_ci NOT NULL,
  `website` varchar(100) collate utf8_unicode_ci NOT NULL,
  `joined` date NOT NULL,
  `kills` int(10) unsigned NOT NULL default '0',
  `points` int(10) unsigned NOT NULL default '0',
  `lastrevive` date NOT NULL,
  `description` mediumtext collate utf8_unicode_ci NOT NULL,
  `image` varchar(100) collate utf8_unicode_ci NOT NULL default '',
  `deaths` int(11) unsigned NOT NULL default '0',
  `revives` int(11) unsigned NOT NULL default '0',
  `frags` int(10) unsigned NOT NULL default '1',
  `settlement_id` int(32) NOT NULL,
  `vote` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `animals`
--

CREATE TABLE IF NOT EXISTS `animals` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `type_id` tinyint(16) NOT NULL,
  `x` int(11) NOT NULL default '10',
  `y` int(11) NOT NULL default '-10',
  `z` tinyint(1) NOT NULL,
  `hp` tinyint(4) NOT NULL default '10',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18491 ;

-- --------------------------------------------------------

--
-- Table structure for table `grid`
--

CREATE TABLE IF NOT EXISTS `grid` (
  `x` smallint(6) NOT NULL,
  `y` smallint(6) NOT NULL,
  `region_id` int(11) NOT NULL default '1',
  `hp` tinyint(2) unsigned NOT NULL default '3',
  `terrain` tinyint(3) unsigned NOT NULL default '3',
  `building_id` int(2) NOT NULL default '0',
  `building_hp` tinyint(3) unsigned NOT NULL default '0',
  KEY `XY` (`x`,`y`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE IF NOT EXISTS `inventories` (
  `user_id` int(11) unsigned NOT NULL,
  `item_id` tinyint(3) unsigned NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  KEY `user_id` (`user_id`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ips`
--

CREATE TABLE IF NOT EXISTS `ips` (
  `hits` int(10) unsigned NOT NULL default '0',
  `user_id` int(11) NOT NULL,
  `ip` varchar(14) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `message` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `speaker_id` int(11) NOT NULL default '0',
  `target_id` int(11) NOT NULL default '0',
  `x` smallint(6) NOT NULL,
  `y` smallint(6) NOT NULL,
  `z` tinyint(4) NOT NULL,
  `type` enum('whisper','talk','shout','distant','reply','action','game','persistent','slash_me','chat') NOT NULL default 'action',
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `x` (`x`,`y`,`z`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=300805 ;

-- --------------------------------------------------------

--
-- Table structure for table `settlements`
--

CREATE TABLE IF NOT EXISTS `settlements` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `x` smallint(6) NOT NULL,
  `y` smallint(6) NOT NULL,
  `founded` date NOT NULL,
  `type` enum('village','town','city','metropolis') NOT NULL default 'village',
  `description` mediumtext NOT NULL,
  `motto` tinytext NOT NULL,
  `image` varchar(100) NOT NULL default '',
  `title` varchar(32) NOT NULL default 'Leader',
  `leader_id` int(11) NOT NULL,
  `website` varchar(100) NOT NULL,
  `allow_new_users` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE IF NOT EXISTS `skills` (
  `user_id` int(11) unsigned NOT NULL,
  `skill_id` tinyint(3) unsigned NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`skill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stockpiles`
--

CREATE TABLE IF NOT EXISTS `stockpiles` (
  `x` smallint(6) NOT NULL,
  `y` smallint(6) NOT NULL,
  `item_id` tinyint(3) unsigned NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  KEY `x_y` (`x`,`y`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(24) character set utf8 collate utf8_unicode_ci NOT NULL,
  `password` varchar(32) NOT NULL,
  `active` tinyint(1) NOT NULL default '1',
  `x` smallint(6) NOT NULL default '0',
  `y` smallint(6) NOT NULL default '0',
  `z` tinyint(3) unsigned NOT NULL default '0',
  `hp` tinyint(3) unsigned NOT NULL default '50',
  `maxhp` tinyint(3) unsigned NOT NULL default '50',
  `ap` float(4,1) NOT NULL default '100.0',
  `hunger` tinyint(3) unsigned NOT NULL default '9',
  `lastaction` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `craft_xp` smallint(5) unsigned NOT NULL default '0',
  `warrior_xp` smallint(5) unsigned NOT NULL default '0',
  `herbal_xp` smallint(5) unsigned NOT NULL default '0',
  `wander_xp` smallint(5) unsigned NOT NULL default '0',
  `donated` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  KEY `username` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2292 ;

-- --------------------------------------------------------

--
-- Table structure for table `writings`
--

CREATE TABLE IF NOT EXISTS `writings` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `z` tinyint(3) unsigned NOT NULL,
  `message` tinytext collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1601 ;
