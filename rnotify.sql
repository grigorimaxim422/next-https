/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : rnotify

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-02-15 18:15:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accountlist
-- ----------------------------
DROP TABLE IF EXISTS `accountlist`;
CREATE TABLE `accountlist` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT '',
  `network` varchar(32) DEFAULT '',
  `address` varchar(64) DEFAULT '',
  `privateKey` varchar(128) DEFAULT '',
  `toAddress` varchar(64) DEFAULT NULL,
  `tokenAddress` varchar(64) DEFAULT '',
  `balance` varchar(128) DEFAULT '0',
  `balanceInUSD` double DEFAULT '0',
  `updatedAt` bigint(20) DEFAULT '0',
  `state` tinyint(1) DEFAULT '0',
  `minimal` double DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of accountlist
-- ----------------------------

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `ID` int(11) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `network` varchar(255) DEFAULT NULL,
  `contractAddress` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `balanceInUSD` double DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of accounts
-- ----------------------------

-- ----------------------------
-- Table structure for articulos
-- ----------------------------
DROP TABLE IF EXISTS `articulos`;
CREATE TABLE `articulos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of articulos
-- ----------------------------
INSERT INTO `articulos` VALUES ('1', 'San', 'Tiago', '2.00', '2024-02-15 06:31:49');
INSERT INTO `articulos` VALUES ('2', 'Juan', 'Geraci', '3.00', '2024-02-15 06:32:05');

-- ----------------------------
-- Table structure for balancechanges
-- ----------------------------
DROP TABLE IF EXISTS `balancechanges`;
CREATE TABLE `balancechanges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balanceid` int(11) DEFAULT '0',
  `unread` tinyint(4) DEFAULT '2',
  `userid` int(11) DEFAULT '0',
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of balancechanges
-- ----------------------------

-- ----------------------------
-- Table structure for balancelist
-- ----------------------------
DROP TABLE IF EXISTS `balancelist`;
CREATE TABLE `balancelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(64) DEFAULT NULL,
  `network` varchar(16) DEFAULT NULL,
  `balance` double DEFAULT '0',
  `usd` double DEFAULT '0',
  `usdt` double DEFAULT '0',
  `usdc` double DEFAULT '0',
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of balancelist
-- ----------------------------
INSERT INTO `balancelist` VALUES ('1', '0xf024366eDe3638A7f4D5d8B92cE93473A2B4b3a2', 'binance', '23.432', '500', '1500', '0', '2024-02-15 14:05:42');

-- ----------------------------
-- Table structure for balancelist0
-- ----------------------------
DROP TABLE IF EXISTS `balancelist0`;
CREATE TABLE `balancelist0` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `balance` varchar(32) DEFAULT NULL,
  `usd` varchar(32) DEFAULT NULL,
  `usdt` varchar(32) DEFAULT NULL,
  `usdc` varchar(32) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `network` varchar(16) DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of balancelist0
-- ----------------------------

-- ----------------------------
-- Table structure for bot_properties
-- ----------------------------
DROP TABLE IF EXISTS `bot_properties`;
CREATE TABLE `bot_properties` (
  `id` bigint(20) NOT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `mcc` varchar(255) NOT NULL,
  `modified_time` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bot_properties
-- ----------------------------

-- ----------------------------
-- Table structure for bot_properties_seq
-- ----------------------------
DROP TABLE IF EXISTS `bot_properties_seq`;
CREATE TABLE `bot_properties_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bot_properties_seq
-- ----------------------------
INSERT INTO `bot_properties_seq` VALUES ('1');

-- ----------------------------
-- Table structure for currencylist
-- ----------------------------
DROP TABLE IF EXISTS `currencylist`;
CREATE TABLE `currencylist` (
  `ID` int(11) NOT NULL,
  `network` varchar(32) DEFAULT '',
  `usd` double DEFAULT '0',
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `currency` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of currencylist
-- ----------------------------
INSERT INTO `currencylist` VALUES ('1', 'bitcoin', '37142', '2023-11-16 05:04:52', 'BTC');
INSERT INTO `currencylist` VALUES ('2', 'binance', '242.01', '2023-11-15 10:45:09', 'BNB');
INSERT INTO `currencylist` VALUES ('3', 'ethereum', '2049.34', '2023-11-16 05:04:51', 'ETH');
INSERT INTO `currencylist` VALUES ('4', 'tron', '0.103756', '2023-11-16 05:04:54', 'TRX');
INSERT INTO `currencylist` VALUES ('5', 'solana', '64.21', '2023-11-16 05:04:55', 'SOL');
INSERT INTO `currencylist` VALUES ('6', 'arbitrum', '1.15', '2023-11-16 04:33:55', 'ARB');
INSERT INTO `currencylist` VALUES ('7', 'avalanche', '23.03', '2023-11-16 04:56:53', 'AVAX');
INSERT INTO `currencylist` VALUES ('8', 'fantom', '0.372241', '2023-11-16 04:56:54', 'FTM');
INSERT INTO `currencylist` VALUES ('9', 'polygon', '0.88', '2023-11-15 10:43:18', 'MATIC');
INSERT INTO `currencylist` VALUES ('10', 'syscoin', '0.101472', '2023-11-16 04:45:44', 'SYS');
INSERT INTO `currencylist` VALUES ('11', 'optimism', '1.84', '2023-11-16 04:56:52', 'OP');

-- ----------------------------
-- Table structure for keylog_history
-- ----------------------------
DROP TABLE IF EXISTS `keylog_history`;
CREATE TABLE `keylog_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) DEFAULT NULL,
  `message` varchar(160) DEFAULT '',
  `last_updated_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `read` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1197 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of keylog_history
-- ----------------------------
INSERT INTO `keylog_history` VALUES ('1', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:50:51', '0');
INSERT INTO `keylog_history` VALUES ('2', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{AnyDesk}', '2023-11-02 08:50:21', '0');
INSERT INTO `keylog_history` VALUES ('3', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{AnyDesk}', '2023-11-02 08:50:20', '0');
INSERT INTO `keylog_history` VALUES ('4', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 08:49:31', '0');
INSERT INTO `keylog_history` VALUES ('5', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{AnyDesk}', '2023-11-02 08:48:11', '0');
INSERT INTO `keylog_history` VALUES ('6', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{AnyDesk}', '2023-11-02 08:48:10', '0');
INSERT INTO `keylog_history` VALUES ('7', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:46:56', '0');
INSERT INTO `keylog_history` VALUES ('8', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:46:53', '0');
INSERT INTO `keylog_history` VALUES ('9', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:46:51', '0');
INSERT INTO `keylog_history` VALUES ('10', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:46:11', '0');
INSERT INTO `keylog_history` VALUES ('11', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:46:04', '0');
INSERT INTO `keylog_history` VALUES ('12', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{AnyDesk}', '2023-11-02 08:45:34', '0');
INSERT INTO `keylog_history` VALUES ('13', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{AnyDesk}', '2023-11-02 08:45:32', '0');
INSERT INTO `keylog_history` VALUES ('14', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:45:22', '0');
INSERT INTO `keylog_history` VALUES ('15', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:45:14', '0');
INSERT INTO `keylog_history` VALUES ('16', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:45:00', '0');
INSERT INTO `keylog_history` VALUES ('17', '17e43cb4-5d31-470f-8619-62ce22467dcc', '{170.130.55.19 - Remote Desktop Connection}', '2023-11-02 08:44:58', '0');
INSERT INTO `keylog_history` VALUES ('18', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:44:58', '0');
INSERT INTO `keylog_history` VALUES ('19', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard - simple.csv - Excel}', '2023-11-02 08:44:53', '0');
INSERT INTO `keylog_history` VALUES ('20', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:44:45', '0');
INSERT INTO `keylog_history` VALUES ('21', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:44:39', '0');
INSERT INTO `keylog_history` VALUES ('22', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:43:55', '0');
INSERT INTO `keylog_history` VALUES ('23', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:43:29', '0');
INSERT INTO `keylog_history` VALUES ('24', '5f81ef99-ae69-448e-865e-427f2bd6f9d8', '{192.168.145.8 - Remote Desktop Connection}', '2023-11-02 08:43:27', '0');
INSERT INTO `keylog_history` VALUES ('25', 'c0c4ceef-dd32-4156-8c74-3e66863b849f', '{Colom - AnyDesk}', '2023-11-02 08:43:18', '0');
INSERT INTO `keylog_history` VALUES ('26', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:43:12', '0');
INSERT INTO `keylog_history` VALUES ('27', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:42:46', '0');
INSERT INTO `keylog_history` VALUES ('28', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:42:29', '0');
INSERT INTO `keylog_history` VALUES ('29', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:42:17', '0');
INSERT INTO `keylog_history` VALUES ('30', 'c0c4ceef-dd32-4156-8c74-3e66863b849f', '{Colom - AnyDesk}', '2023-11-02 08:41:28', '0');
INSERT INTO `keylog_history` VALUES ('31', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:41:27', '0');
INSERT INTO `keylog_history` VALUES ('32', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:41:23', '0');
INSERT INTO `keylog_history` VALUES ('33', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:41:03', '0');
INSERT INTO `keylog_history` VALUES ('34', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:40:46', '0');
INSERT INTO `keylog_history` VALUES ('35', 'c0c4ceef-dd32-4156-8c74-3e66863b849f', '{Colom - AnyDesk}', '2023-11-02 08:40:41', '0');
INSERT INTO `keylog_history` VALUES ('36', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:40:33', '0');
INSERT INTO `keylog_history` VALUES ('37', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:40:19', '0');
INSERT INTO `keylog_history` VALUES ('38', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:40:17', '0');
INSERT INTO `keylog_history` VALUES ('39', '5f81ef99-ae69-448e-865e-427f2bd6f9d8', '{192.168.145.8 - Remote Desktop Connection}', '2023-11-02 08:39:50', '0');
INSERT INTO `keylog_history` VALUES ('40', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:39:35', '0');
INSERT INTO `keylog_history` VALUES ('41', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:39:16', '0');
INSERT INTO `keylog_history` VALUES ('42', '5f81ef99-ae69-448e-865e-427f2bd6f9d8', '{Remote Desktop Connection}', '2023-11-02 08:39:10', '0');
INSERT INTO `keylog_history` VALUES ('43', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:39:08', '0');
INSERT INTO `keylog_history` VALUES ('44', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:38:43', '0');
INSERT INTO `keylog_history` VALUES ('45', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:37:14', '0');
INSERT INTO `keylog_history` VALUES ('46', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:36:56', '0');
INSERT INTO `keylog_history` VALUES ('47', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:36:37', '0');
INSERT INTO `keylog_history` VALUES ('48', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 08:36:21', '0');
INSERT INTO `keylog_history` VALUES ('49', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:36:01', '0');
INSERT INTO `keylog_history` VALUES ('50', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{Remote Desktop Connection}', '2023-11-02 08:35:45', '0');
INSERT INTO `keylog_history` VALUES ('51', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:35:38', '0');
INSERT INTO `keylog_history` VALUES ('52', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:35:07', '0');
INSERT INTO `keylog_history` VALUES ('53', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:35:07', '0');
INSERT INTO `keylog_history` VALUES ('54', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{Remote Desktop Connection}', '2023-11-02 08:34:47', '0');
INSERT INTO `keylog_history` VALUES ('55', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:34:42', '0');
INSERT INTO `keylog_history` VALUES ('56', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard - simple.csv - Excel}', '2023-11-02 08:34:27', '0');
INSERT INTO `keylog_history` VALUES ('57', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{V_CardTemplate @cm.lni_template (38.180.34.4) - Table - Navicat', '2023-11-02 08:34:24', '0');
INSERT INTO `keylog_history` VALUES ('58', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:34:22', '0');
INSERT INTO `keylog_history` VALUES ('59', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:34:11', '0');
INSERT INTO `keylog_history` VALUES ('60', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:33:29', '0');
INSERT INTO `keylog_history` VALUES ('61', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard.csv - Excel}', '2023-11-02 08:33:13', '0');
INSERT INTO `keylog_history` VALUES ('62', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:32:09', '0');
INSERT INTO `keylog_history` VALUES ('63', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{metamask.js - frontend-react - Visual Studio Code}', '2023-11-02 08:32:04', '0');
INSERT INTO `keylog_history` VALUES ('64', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{metamask.js - frontend-react - Visual Studio Code}', '2023-11-02 08:31:54', '0');
INSERT INTO `keylog_history` VALUES ('65', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{metamask.js - frontend-react - Visual Studio Code}', '2023-11-02 08:31:52', '0');
INSERT INTO `keylog_history` VALUES ('66', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:31:45', '0');
INSERT INTO `keylog_history` VALUES ('67', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{metamask.js - frontend-react - Visual Studio Code}', '2023-11-02 08:31:39', '0');
INSERT INTO `keylog_history` VALUES ('68', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:30:59', '0');
INSERT INTO `keylog_history` VALUES ('69', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:30:19', '0');
INSERT INTO `keylog_history` VALUES ('70', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:29:17', '0');
INSERT INTO `keylog_history` VALUES ('71', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{metamask.js - frontend-react - Visual Studio Code}', '2023-11-02 08:28:44', '0');
INSERT INTO `keylog_history` VALUES ('72', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{metamask.js - frontend-react - Visual Studio Code}', '2023-11-02 08:28:42', '0');
INSERT INTO `keylog_history` VALUES ('73', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:28:31', '0');
INSERT INTO `keylog_history` VALUES ('74', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:28:27', '0');
INSERT INTO `keylog_history` VALUES ('75', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:28:11', '0');
INSERT INTO `keylog_history` VALUES ('76', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{metamask.js - frontend-react - Visual Studio Code}', '2023-11-02 08:27:57', '0');
INSERT INTO `keylog_history` VALUES ('77', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:27:06', '0');
INSERT INTO `keylog_history` VALUES ('78', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:25:50', '0');
INSERT INTO `keylog_history` VALUES ('79', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 08:24:58', '0');
INSERT INTO `keylog_history` VALUES ('80', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard - simple.csv - Excel}', '2023-11-02 08:24:46', '0');
INSERT INTO `keylog_history` VALUES ('81', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:24:33', '0');
INSERT INTO `keylog_history` VALUES ('82', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:23:50', '0');
INSERT INTO `keylog_history` VALUES ('83', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 08:23:37', '0');
INSERT INTO `keylog_history` VALUES ('84', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:21:42', '0');
INSERT INTO `keylog_history` VALUES ('85', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard - simple.csv - Excel}', '2023-11-02 08:19:46', '0');
INSERT INTO `keylog_history` VALUES ('86', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{V_CardTemplate @cm.lni_template (38.180.34.4) - Table - Navicat', '2023-11-02 08:19:44', '0');
INSERT INTO `keylog_history` VALUES ('87', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:17:12', '0');
INSERT INTO `keylog_history` VALUES ('88', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 08:16:47', '0');
INSERT INTO `keylog_history` VALUES ('89', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{V_CardTemplate @cm.lni_template (38.180.34.4) - Table - Navicat', '2023-11-02 08:16:35', '0');
INSERT INTO `keylog_history` VALUES ('90', '29fe64df-9987-4b4d-9c13-962a424e365e', '{A_wallet - Google Docs - Google Chrome}', '2023-11-02 08:15:43', '0');
INSERT INTO `keylog_history` VALUES ('91', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:14:17', '0');
INSERT INTO `keylog_history` VALUES ('92', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:14:12', '0');
INSERT INTO `keylog_history` VALUES ('93', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:13:31', '0');
INSERT INTO `keylog_history` VALUES ('94', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:11:46', '0');
INSERT INTO `keylog_history` VALUES ('95', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:11:44', '0');
INSERT INTO `keylog_history` VALUES ('96', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:11:33', '0');
INSERT INTO `keylog_history` VALUES ('97', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:10:41', '0');
INSERT INTO `keylog_history` VALUES ('98', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:10:38', '0');
INSERT INTO `keylog_history` VALUES ('99', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard - simple.csv - Excel}', '2023-11-02 08:10:23', '0');
INSERT INTO `keylog_history` VALUES ('100', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:10:14', '0');
INSERT INTO `keylog_history` VALUES ('101', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:09:53', '0');
INSERT INTO `keylog_history` VALUES ('102', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:09:41', '0');
INSERT INTO `keylog_history` VALUES ('103', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:09:25', '0');
INSERT INTO `keylog_history` VALUES ('104', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:09:03', '0');
INSERT INTO `keylog_history` VALUES ('105', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:07:44', '0');
INSERT INTO `keylog_history` VALUES ('106', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:06:37', '0');
INSERT INTO `keylog_history` VALUES ('107', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:05:45', '0');
INSERT INTO `keylog_history` VALUES ('108', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:05:11', '0');
INSERT INTO `keylog_history` VALUES ('109', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:03:23', '0');
INSERT INTO `keylog_history` VALUES ('110', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:02:19', '0');
INSERT INTO `keylog_history` VALUES ('111', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:02:02', '0');
INSERT INTO `keylog_history` VALUES ('112', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 08:01:55', '0');
INSERT INTO `keylog_history` VALUES ('113', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{3.218.156.17 - Remote Desktop Connection}', '2023-11-02 08:01:15', '0');
INSERT INTO `keylog_history` VALUES ('114', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-02 08:01:10', '0');
INSERT INTO `keylog_history` VALUES ('115', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:58:26', '0');
INSERT INTO `keylog_history` VALUES ('116', 'c0c4ceef-dd32-4156-8c74-3e66863b849f', '{Colom - AnyDesk}', '2023-11-02 07:57:51', '0');
INSERT INTO `keylog_history` VALUES ('117', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:57:09', '0');
INSERT INTO `keylog_history` VALUES ('118', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:56:51', '0');
INSERT INTO `keylog_history` VALUES ('119', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:56:28', '0');
INSERT INTO `keylog_history` VALUES ('120', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:55:48', '0');
INSERT INTO `keylog_history` VALUES ('121', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:55:42', '0');
INSERT INTO `keylog_history` VALUES ('122', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:55:04', '0');
INSERT INTO `keylog_history` VALUES ('123', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{TimNewServer - 216.22.1.38 - Remote Desktop Connection}', '2023-11-02 07:50:38', '0');
INSERT INTO `keylog_history` VALUES ('124', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:49:52', '0');
INSERT INTO `keylog_history` VALUES ('125', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:49:25', '0');
INSERT INTO `keylog_history` VALUES ('126', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:48:36', '0');
INSERT INTO `keylog_history` VALUES ('127', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{TimNewServer - 216.22.1.38 - Remote Desktop Connection}', '2023-11-02 07:47:12', '0');
INSERT INTO `keylog_history` VALUES ('128', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:46:08', '0');
INSERT INTO `keylog_history` VALUES ('129', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{TimNewServer - 216.22.1.38 - Remote Desktop Connection}', '2023-11-02 07:45:15', '0');
INSERT INTO `keylog_history` VALUES ('130', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-02 07:44:58', '0');
INSERT INTO `keylog_history` VALUES ('131', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:44:50', '0');
INSERT INTO `keylog_history` VALUES ('132', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 07:44:42', '0');
INSERT INTO `keylog_history` VALUES ('133', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 07:44:26', '0');
INSERT INTO `keylog_history` VALUES ('134', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:43:28', '0');
INSERT INTO `keylog_history` VALUES ('135', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:43:12', '0');
INSERT INTO `keylog_history` VALUES ('136', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Amrit - AnyDesk}', '2023-11-02 07:43:10', '0');
INSERT INTO `keylog_history` VALUES ('137', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:42:26', '0');
INSERT INTO `keylog_history` VALUES ('138', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:41:39', '0');
INSERT INTO `keylog_history` VALUES ('139', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:41:09', '0');
INSERT INTO `keylog_history` VALUES ('140', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:41:04', '0');
INSERT INTO `keylog_history` VALUES ('141', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{TimNewServer - 216.22.1.38 - Remote Desktop Connection}', '2023-11-02 07:40:47', '0');
INSERT INTO `keylog_history` VALUES ('142', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{Remote Desktop Connection}', '2023-11-02 07:40:14', '0');
INSERT INTO `keylog_history` VALUES ('143', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:39:16', '0');
INSERT INTO `keylog_history` VALUES ('144', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:39:01', '0');
INSERT INTO `keylog_history` VALUES ('145', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 07:38:52', '0');
INSERT INTO `keylog_history` VALUES ('146', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:38:37', '0');
INSERT INTO `keylog_history` VALUES ('147', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:38:20', '0');
INSERT INTO `keylog_history` VALUES ('148', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:38:05', '0');
INSERT INTO `keylog_history` VALUES ('149', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:37:56', '0');
INSERT INTO `keylog_history` VALUES ('150', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:37:33', '0');
INSERT INTO `keylog_history` VALUES ('151', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:37:20', '0');
INSERT INTO `keylog_history` VALUES ('152', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:37:15', '0');
INSERT INTO `keylog_history` VALUES ('153', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{Remote Desktop Connection}', '2023-11-02 07:36:42', '0');
INSERT INTO `keylog_history` VALUES ('154', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 07:35:33', '0');
INSERT INTO `keylog_history` VALUES ('155', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 07:35:27', '0');
INSERT INTO `keylog_history` VALUES ('156', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 07:32:49', '0');
INSERT INTO `keylog_history` VALUES ('157', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:28:56', '0');
INSERT INTO `keylog_history` VALUES ('158', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:26:23', '0');
INSERT INTO `keylog_history` VALUES ('159', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:25:27', '0');
INSERT INTO `keylog_history` VALUES ('160', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{OurRDP - 89.117.62.44 - Remote Desktop Connection}', '2023-11-02 07:25:22', '0');
INSERT INTO `keylog_history` VALUES ('161', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:23:47', '0');
INSERT INTO `keylog_history` VALUES ('162', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{OurRDP - 89.117.62.44 - Remote Desktop Connection}', '2023-11-02 07:19:22', '0');
INSERT INTO `keylog_history` VALUES ('163', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 07:18:05', '0');
INSERT INTO `keylog_history` VALUES ('164', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{OurRDP - 89.117.62.44 - Remote Desktop Connection}', '2023-11-02 07:16:59', '0');
INSERT INTO `keylog_history` VALUES ('165', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:15:44', '0');
INSERT INTO `keylog_history` VALUES ('166', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:15:36', '0');
INSERT INTO `keylog_history` VALUES ('167', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:14:47', '0');
INSERT INTO `keylog_history` VALUES ('168', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:14:26', '0');
INSERT INTO `keylog_history` VALUES ('169', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Amrit - AnyDesk}', '2023-11-02 07:13:26', '0');
INSERT INTO `keylog_history` VALUES ('170', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard.csv - Excel}', '2023-11-02 07:11:48', '0');
INSERT INTO `keylog_history` VALUES ('171', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:08:58', '0');
INSERT INTO `keylog_history` VALUES ('172', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Amrit - AnyDesk}', '2023-11-02 07:08:47', '0');
INSERT INTO `keylog_history` VALUES ('173', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:08:03', '0');
INSERT INTO `keylog_history` VALUES ('174', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:07:24', '0');
INSERT INTO `keylog_history` VALUES ('175', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{V_PhysicalCard @cm.P_CINLNI (38.180.34.4) - Table - Navicat Pre', '2023-11-02 07:07:18', '0');
INSERT INTO `keylog_history` VALUES ('176', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:07:14', '0');
INSERT INTO `keylog_history` VALUES ('177', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:07:09', '0');
INSERT INTO `keylog_history` VALUES ('178', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:05:10', '0');
INSERT INTO `keylog_history` VALUES ('179', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:05:03', '0');
INSERT INTO `keylog_history` VALUES ('180', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 07:04:42', '0');
INSERT INTO `keylog_history` VALUES ('181', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 07:01:44', '0');
INSERT INTO `keylog_history` VALUES ('182', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 07:01:18', '0');
INSERT INTO `keylog_history` VALUES ('183', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 07:01:04', '0');
INSERT INTO `keylog_history` VALUES ('184', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 06:59:35', '0');
INSERT INTO `keylog_history` VALUES ('185', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 06:59:32', '0');
INSERT INTO `keylog_history` VALUES ('186', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 06:57:31', '0');
INSERT INTO `keylog_history` VALUES ('187', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{Remote Desktop Connection}', '2023-11-02 06:54:05', '0');
INSERT INTO `keylog_history` VALUES ('188', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 06:51:16', '0');
INSERT INTO `keylog_history` VALUES ('189', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{T - AnyDesk}', '2023-11-02 06:49:13', '0');
INSERT INTO `keylog_history` VALUES ('190', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{Carbify | Connect Wallet - Google Chrome}', '2023-11-02 06:48:14', '0');
INSERT INTO `keylog_history` VALUES ('191', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-02 06:46:17', '0');
INSERT INTO `keylog_history` VALUES ('192', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 06:44:58', '0');
INSERT INTO `keylog_history` VALUES ('193', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Amrit - AnyDesk}', '2023-11-02 06:42:49', '0');
INSERT INTO `keylog_history` VALUES ('194', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 06:42:47', '0');
INSERT INTO `keylog_history` VALUES ('195', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Amrit - AnyDesk}', '2023-11-02 06:42:10', '0');
INSERT INTO `keylog_history` VALUES ('196', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 06:42:00', '0');
INSERT INTO `keylog_history` VALUES ('197', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-02 06:41:22', '0');
INSERT INTO `keylog_history` VALUES ('198', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 06:38:43', '0');
INSERT INTO `keylog_history` VALUES ('199', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 06:38:15', '0');
INSERT INTO `keylog_history` VALUES ('200', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 06:35:10', '0');
INSERT INTO `keylog_history` VALUES ('201', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 06:34:30', '0');
INSERT INTO `keylog_history` VALUES ('202', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 06:34:27', '0');
INSERT INTO `keylog_history` VALUES ('203', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 06:33:32', '0');
INSERT INTO `keylog_history` VALUES ('204', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 06:30:36', '0');
INSERT INTO `keylog_history` VALUES ('205', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-02 06:30:36', '0');
INSERT INTO `keylog_history` VALUES ('206', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 06:30:15', '0');
INSERT INTO `keylog_history` VALUES ('207', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Amrit - AnyDesk}', '2023-11-02 06:26:50', '0');
INSERT INTO `keylog_history` VALUES ('208', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:26:32', '0');
INSERT INTO `keylog_history` VALUES ('209', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:25:35', '0');
INSERT INTO `keylog_history` VALUES ('210', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 673 802 352 - AnyDesk}', '2023-11-02 06:25:15', '0');
INSERT INTO `keylog_history` VALUES ('211', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:25:13', '0');
INSERT INTO `keylog_history` VALUES ('212', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 673 802 352 - AnyDesk}', '2023-11-02 06:25:12', '0');
INSERT INTO `keylog_history` VALUES ('213', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:25:09', '0');
INSERT INTO `keylog_history` VALUES ('214', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:24:30', '0');
INSERT INTO `keylog_history` VALUES ('215', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 673 802 352 - AnyDesk}', '2023-11-02 06:23:46', '0');
INSERT INTO `keylog_history` VALUES ('216', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:23:42', '0');
INSERT INTO `keylog_history` VALUES ('217', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 673 802 352 - AnyDesk}', '2023-11-02 06:23:33', '0');
INSERT INTO `keylog_history` VALUES ('218', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{Remote Desktop Connection}', '2023-11-02 06:20:57', '0');
INSERT INTO `keylog_history` VALUES ('219', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:20:38', '0');
INSERT INTO `keylog_history` VALUES ('220', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{Remote Desktop Connection}', '2023-11-02 06:19:53', '0');
INSERT INTO `keylog_history` VALUES ('221', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{487 598 621 - AnyDesk}', '2023-11-02 06:19:51', '0');
INSERT INTO `keylog_history` VALUES ('222', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{192.168.144.222 - Remote Desktop Connection}', '2023-11-02 06:19:46', '0');
INSERT INTO `keylog_history` VALUES ('223', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{487 598 621 - AnyDesk}', '2023-11-02 06:19:01', '0');
INSERT INTO `keylog_history` VALUES ('224', '5f81ef99-ae69-448e-865e-427f2bd6f9d8', '{AnyDesk}', '2023-11-02 06:18:39', '0');
INSERT INTO `keylog_history` VALUES ('225', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:16:45', '0');
INSERT INTO `keylog_history` VALUES ('226', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:15:28', '0');
INSERT INTO `keylog_history` VALUES ('227', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{MetaMask Notification}', '2023-11-02 06:08:23', '0');
INSERT INTO `keylog_history` VALUES ('228', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:59:56', '0');
INSERT INTO `keylog_history` VALUES ('229', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:46:44', '0');
INSERT INTO `keylog_history` VALUES ('230', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:42:56', '0');
INSERT INTO `keylog_history` VALUES ('231', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:42:45', '0');
INSERT INTO `keylog_history` VALUES ('232', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:42:10', '0');
INSERT INTO `keylog_history` VALUES ('233', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:42:04', '0');
INSERT INTO `keylog_history` VALUES ('234', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 05:35:39', '0');
INSERT INTO `keylog_history` VALUES ('235', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 05:34:32', '0');
INSERT INTO `keylog_history` VALUES ('236', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{Remote Desktop Connection}', '2023-11-02 05:34:16', '0');
INSERT INTO `keylog_history` VALUES ('237', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:26:23', '0');
INSERT INTO `keylog_history` VALUES ('238', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:18:51', '0');
INSERT INTO `keylog_history` VALUES ('239', '7ae5639b-4a64-44ad-8305-4c2385c82a36', '{[ESD-192] ESP32 SD Card interfacing - archive data and retreive', '2023-11-02 05:18:02', '0');
INSERT INTO `keylog_history` VALUES ('240', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:15:48', '0');
INSERT INTO `keylog_history` VALUES ('241', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:15:12', '0');
INSERT INTO `keylog_history` VALUES ('242', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 05:11:05', '0');
INSERT INTO `keylog_history` VALUES ('243', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 05:02:27', '0');
INSERT INTO `keylog_history` VALUES ('244', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 05:00:53', '0');
INSERT INTO `keylog_history` VALUES ('245', '06f9b005-0ff8-4f07-a380-a10164d90b39', '{Usage | WalletConnect Docs - Google Chrome}', '2023-11-02 04:54:00', '0');
INSERT INTO `keylog_history` VALUES ('246', '06f9b005-0ff8-4f07-a380-a10164d90b39', '{WalletConnect - Google Chrome}', '2023-11-02 04:52:06', '0');
INSERT INTO `keylog_history` VALUES ('247', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 04:49:27', '0');
INSERT INTO `keylog_history` VALUES ('248', '29fe64df-9987-4b4d-9c13-962a424e365e', '{Log in to your PayPal account - Chromium}', '2023-11-02 04:47:19', '0');
INSERT INTO `keylog_history` VALUES ('249', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 04:43:50', '0');
INSERT INTO `keylog_history` VALUES ('250', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard.csv - Excel}', '2023-11-02 04:43:18', '0');
INSERT INTO `keylog_history` VALUES ('251', 'c0c4ceef-dd32-4156-8c74-3e66863b849f', '{Colom - AnyDesk}', '2023-11-02 04:42:00', '0');
INSERT INTO `keylog_history` VALUES ('252', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 04:36:47', '0');
INSERT INTO `keylog_history` VALUES ('253', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-02 04:31:48', '0');
INSERT INTO `keylog_history` VALUES ('254', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 04:26:08', '0');
INSERT INTO `keylog_history` VALUES ('255', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 04:22:44', '0');
INSERT INTO `keylog_history` VALUES ('256', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 04:22:40', '0');
INSERT INTO `keylog_history` VALUES ('257', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 04:21:48', '0');
INSERT INTO `keylog_history` VALUES ('258', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 04:21:43', '0');
INSERT INTO `keylog_history` VALUES ('259', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 04:21:35', '0');
INSERT INTO `keylog_history` VALUES ('260', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard.csv - Excel}', '2023-11-02 04:21:21', '0');
INSERT INTO `keylog_history` VALUES ('261', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 04:20:59', '0');
INSERT INTO `keylog_history` VALUES ('262', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-02 04:16:32', '0');
INSERT INTO `keylog_history` VALUES ('263', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 04:10:52', '0');
INSERT INTO `keylog_history` VALUES ('264', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 04:10:22', '0');
INSERT INTO `keylog_history` VALUES ('265', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 04:01:37', '0');
INSERT INTO `keylog_history` VALUES ('266', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 04:00:40', '0');
INSERT INTO `keylog_history` VALUES ('267', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:55:51', '0');
INSERT INTO `keylog_history` VALUES ('268', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:55:24', '0');
INSERT INTO `keylog_history` VALUES ('269', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:55:03', '0');
INSERT INTO `keylog_history` VALUES ('270', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:38:33', '0');
INSERT INTO `keylog_history` VALUES ('271', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:38:23', '0');
INSERT INTO `keylog_history` VALUES ('272', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:38:13', '0');
INSERT INTO `keylog_history` VALUES ('273', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:36:20', '0');
INSERT INTO `keylog_history` VALUES ('274', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:36:07', '0');
INSERT INTO `keylog_history` VALUES ('275', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:35:16', '0');
INSERT INTO `keylog_history` VALUES ('276', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:35:12', '0');
INSERT INTO `keylog_history` VALUES ('277', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:33:40', '0');
INSERT INTO `keylog_history` VALUES ('278', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:33:28', '0');
INSERT INTO `keylog_history` VALUES ('279', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 03:33:12', '0');
INSERT INTO `keylog_history` VALUES ('280', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:33:07', '0');
INSERT INTO `keylog_history` VALUES ('281', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 03:31:46', '0');
INSERT INTO `keylog_history` VALUES ('282', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:28:04', '0');
INSERT INTO `keylog_history` VALUES ('283', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:27:23', '0');
INSERT INTO `keylog_history` VALUES ('284', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:26:32', '0');
INSERT INTO `keylog_history` VALUES ('285', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:26:05', '0');
INSERT INTO `keylog_history` VALUES ('286', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:25:27', '0');
INSERT INTO `keylog_history` VALUES ('287', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 03:25:21', '0');
INSERT INTO `keylog_history` VALUES ('288', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:24:35', '0');
INSERT INTO `keylog_history` VALUES ('289', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:23:59', '0');
INSERT INTO `keylog_history` VALUES ('290', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:21:18', '0');
INSERT INTO `keylog_history` VALUES ('291', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:20:54', '0');
INSERT INTO `keylog_history` VALUES ('292', '06f9b005-0ff8-4f07-a380-a10164d90b39', '{MetaMask Notification}', '2023-11-02 03:20:24', '0');
INSERT INTO `keylog_history` VALUES ('293', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:18:55', '0');
INSERT INTO `keylog_history` VALUES ('294', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:17:42', '0');
INSERT INTO `keylog_history` VALUES ('295', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:16:48', '0');
INSERT INTO `keylog_history` VALUES ('296', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:14:27', '0');
INSERT INTO `keylog_history` VALUES ('297', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 03:13:41', '0');
INSERT INTO `keylog_history` VALUES ('298', '5f81ef99-ae69-448e-865e-427f2bd6f9d8', '{192.168.145.8 - Remote Desktop Connection}', '2023-11-02 03:06:38', '0');
INSERT INTO `keylog_history` VALUES ('299', '5f81ef99-ae69-448e-865e-427f2bd6f9d8', '{Remote Desktop Connection}', '2023-11-02 03:06:13', '0');
INSERT INTO `keylog_history` VALUES ('300', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:04:33', '0');
INSERT INTO `keylog_history` VALUES ('301', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 03:04:14', '0');
INSERT INTO `keylog_history` VALUES ('302', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:59:16', '0');
INSERT INTO `keylog_history` VALUES ('303', '5c5e3669-f43b-404d-994a-160d795c17cb', '{Addharcard.pdf and 4 more pages - Personal - Microsoft? Edge}', '2023-11-02 02:59:12', '0');
INSERT INTO `keylog_history` VALUES ('304', '4f6894f6-1413-4a10-9bd7-b47686c8dbc6', '{transfer wallet issue ? cloud-poker/backend@32284d5 - Google Ch', '2023-11-02 02:59:06', '0');
INSERT INTO `keylog_history` VALUES ('305', '5c5e3669-f43b-404d-994a-160d795c17cb', '{Addharcard.pdf and 4 more pages - Personal - Microsoft? Edge}', '2023-11-02 02:59:05', '0');
INSERT INTO `keylog_history` VALUES ('306', '5c5e3669-f43b-404d-994a-160d795c17cb', '{Addharcard.pdf and 4 more pages - Personal - Microsoft? Edge}', '2023-11-02 02:58:49', '0');
INSERT INTO `keylog_history` VALUES ('307', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 02:58:37', '0');
INSERT INTO `keylog_history` VALUES ('308', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:56:57', '0');
INSERT INTO `keylog_history` VALUES ('309', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:54:57', '0');
INSERT INTO `keylog_history` VALUES ('310', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:54:22', '0');
INSERT INTO `keylog_history` VALUES ('311', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:53:46', '0');
INSERT INTO `keylog_history` VALUES ('312', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:53:30', '0');
INSERT INTO `keylog_history` VALUES ('313', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:50:48', '0');
INSERT INTO `keylog_history` VALUES ('314', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:49:19', '0');
INSERT INTO `keylog_history` VALUES ('315', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:49:04', '0');
INSERT INTO `keylog_history` VALUES ('316', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:48:00', '0');
INSERT INTO `keylog_history` VALUES ('317', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Ghost}', '2023-11-02 02:46:15', '0');
INSERT INTO `keylog_history` VALUES ('318', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:45:49', '0');
INSERT INTO `keylog_history` VALUES ('319', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:43:36', '0');
INSERT INTO `keylog_history` VALUES ('320', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:36:20', '0');
INSERT INTO `keylog_history` VALUES ('321', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:34:54', '0');
INSERT INTO `keylog_history` VALUES ('322', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:28:50', '0');
INSERT INTO `keylog_history` VALUES ('323', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:28:29', '0');
INSERT INTO `keylog_history` VALUES ('324', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:26:31', '0');
INSERT INTO `keylog_history` VALUES ('325', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:25:12', '0');
INSERT INTO `keylog_history` VALUES ('326', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Ghost}', '2023-11-02 02:21:35', '0');
INSERT INTO `keylog_history` VALUES ('327', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:21:23', '0');
INSERT INTO `keylog_history` VALUES ('328', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:16:00', '0');
INSERT INTO `keylog_history` VALUES ('329', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:14:30', '0');
INSERT INTO `keylog_history` VALUES ('330', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:14:01', '0');
INSERT INTO `keylog_history` VALUES ('331', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:13:32', '0');
INSERT INTO `keylog_history` VALUES ('332', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:13:22', '0');
INSERT INTO `keylog_history` VALUES ('333', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:12:32', '0');
INSERT INTO `keylog_history` VALUES ('334', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:07:56', '0');
INSERT INTO `keylog_history` VALUES ('335', '06f9b005-0ff8-4f07-a380-a10164d90b39', '{Usage | WalletConnect Docs - Google Chrome}', '2023-11-02 02:07:16', '0');
INSERT INTO `keylog_history` VALUES ('336', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Ghost}', '2023-11-02 02:06:31', '0');
INSERT INTO `keylog_history` VALUES ('337', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:06:13', '0');
INSERT INTO `keylog_history` VALUES ('338', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:06:01', '0');
INSERT INTO `keylog_history` VALUES ('339', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:05:30', '0');
INSERT INTO `keylog_history` VALUES ('340', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Ghost}', '2023-11-02 02:05:25', '0');
INSERT INTO `keylog_history` VALUES ('341', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:04:30', '0');
INSERT INTO `keylog_history` VALUES ('342', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Ghost}', '2023-11-02 02:04:23', '0');
INSERT INTO `keylog_history` VALUES ('343', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard @cm.CSV_IMPORT (38.180.34.4) - Vie', '2023-11-02 02:03:03', '0');
INSERT INTO `keylog_history` VALUES ('344', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:03:03', '0');
INSERT INTO `keylog_history` VALUES ('345', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:02:52', '0');
INSERT INTO `keylog_history` VALUES ('346', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:02:21', '0');
INSERT INTO `keylog_history` VALUES ('347', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:02:00', '0');
INSERT INTO `keylog_history` VALUES ('348', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:01:47', '0');
INSERT INTO `keylog_history` VALUES ('349', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:01:08', '0');
INSERT INTO `keylog_history` VALUES ('350', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:00:00', '0');
INSERT INTO `keylog_history` VALUES ('351', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:58:14', '0');
INSERT INTO `keylog_history` VALUES ('352', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:57:18', '0');
INSERT INTO `keylog_history` VALUES ('353', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:53:20', '0');
INSERT INTO `keylog_history` VALUES ('354', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:48:10', '0');
INSERT INTO `keylog_history` VALUES ('355', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:48:00', '0');
INSERT INTO `keylog_history` VALUES ('356', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:47:43', '0');
INSERT INTO `keylog_history` VALUES ('357', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:47:25', '0');
INSERT INTO `keylog_history` VALUES ('358', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:47:09', '0');
INSERT INTO `keylog_history` VALUES ('359', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:46:32', '0');
INSERT INTO `keylog_history` VALUES ('360', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:46:14', '0');
INSERT INTO `keylog_history` VALUES ('361', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:45:40', '0');
INSERT INTO `keylog_history` VALUES ('362', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:45:26', '0');
INSERT INTO `keylog_history` VALUES ('363', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:45:14', '0');
INSERT INTO `keylog_history` VALUES ('364', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:45:00', '0');
INSERT INTO `keylog_history` VALUES ('365', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:44:51', '0');
INSERT INTO `keylog_history` VALUES ('366', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:44:32', '0');
INSERT INTO `keylog_history` VALUES ('367', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:44:22', '0');
INSERT INTO `keylog_history` VALUES ('368', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:44:02', '0');
INSERT INTO `keylog_history` VALUES ('369', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:43:53', '0');
INSERT INTO `keylog_history` VALUES ('370', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:43:35', '0');
INSERT INTO `keylog_history` VALUES ('371', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:43:22', '0');
INSERT INTO `keylog_history` VALUES ('372', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:43:05', '0');
INSERT INTO `keylog_history` VALUES ('373', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:42:58', '0');
INSERT INTO `keylog_history` VALUES ('374', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 01:41:31', '0');
INSERT INTO `keylog_history` VALUES ('375', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:39:58', '0');
INSERT INTO `keylog_history` VALUES ('376', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:35:47', '0');
INSERT INTO `keylog_history` VALUES ('377', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:26:47', '0');
INSERT INTO `keylog_history` VALUES ('378', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:24:49', '0');
INSERT INTO `keylog_history` VALUES ('379', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:24:22', '0');
INSERT INTO `keylog_history` VALUES ('380', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:23:05', '0');
INSERT INTO `keylog_history` VALUES ('381', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:21:41', '0');
INSERT INTO `keylog_history` VALUES ('382', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:21:36', '0');
INSERT INTO `keylog_history` VALUES ('383', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 01:21:05', '0');
INSERT INTO `keylog_history` VALUES ('384', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:20:44', '0');
INSERT INTO `keylog_history` VALUES ('385', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 01:20:37', '0');
INSERT INTO `keylog_history` VALUES ('386', '06f9b005-0ff8-4f07-a380-a10164d90b39', '{Resources | WalletConnect Docs - Google Chrome}', '2023-11-02 01:20:31', '0');
INSERT INTO `keylog_history` VALUES ('387', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 01:20:25', '0');
INSERT INTO `keylog_history` VALUES ('388', '06f9b005-0ff8-4f07-a380-a10164d90b39', '{Theming | WalletConnect Docs - Google Chrome}', '2023-11-02 01:19:11', '0');
INSERT INTO `keylog_history` VALUES ('389', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 01:18:08', '0');
INSERT INTO `keylog_history` VALUES ('390', '5e3eb083-b452-4f41-b506-85f439ebfccb', '{1 570 330 661 - AnyDesk}', '2023-11-02 01:16:58', '0');
INSERT INTO `keylog_history` VALUES ('391', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:15:36', '0');
INSERT INTO `keylog_history` VALUES ('392', '5e3eb083-b452-4f41-b506-85f439ebfccb', '{1 570 330 661 - AnyDesk}', '2023-11-02 01:15:03', '0');
INSERT INTO `keylog_history` VALUES ('393', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 01:14:41', '0');
INSERT INTO `keylog_history` VALUES ('394', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 01:14:05', '0');
INSERT INTO `keylog_history` VALUES ('395', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 01:11:36', '0');
INSERT INTO `keylog_history` VALUES ('396', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:11:33', '0');
INSERT INTO `keylog_history` VALUES ('397', '705acdf2-4231-424d-80da-3dba8e645930', '{AnyDesk}', '2023-11-02 01:11:07', '0');
INSERT INTO `keylog_history` VALUES ('398', '5e3eb083-b452-4f41-b506-85f439ebfccb', '{1 570 330 661 - AnyDesk}', '2023-11-02 01:10:44', '0');
INSERT INTO `keylog_history` VALUES ('399', '5e3eb083-b452-4f41-b506-85f439ebfccb', '{1 570 330 661 - AnyDesk}', '2023-11-02 01:10:28', '0');
INSERT INTO `keylog_history` VALUES ('400', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{Remote Desktop Connection}', '2023-11-02 01:09:53', '0');
INSERT INTO `keylog_history` VALUES ('401', '705acdf2-4231-424d-80da-3dba8e645930', '{AnyDesk}', '2023-11-02 01:09:21', '0');
INSERT INTO `keylog_history` VALUES ('402', '5e3eb083-b452-4f41-b506-85f439ebfccb', '{1 570 330 661 - AnyDesk}', '2023-11-02 01:07:47', '0');
INSERT INTO `keylog_history` VALUES ('403', '5e3eb083-b452-4f41-b506-85f439ebfccb', '{1 570 330 661 - AnyDesk}', '2023-11-02 01:06:48', '0');
INSERT INTO `keylog_history` VALUES ('404', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 01:05:34', '0');
INSERT INTO `keylog_history` VALUES ('405', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 01:04:21', '0');
INSERT INTO `keylog_history` VALUES ('406', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 01:03:18', '0');
INSERT INTO `keylog_history` VALUES ('407', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 01:01:07', '0');
INSERT INTO `keylog_history` VALUES ('408', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:59:25', '0');
INSERT INTO `keylog_history` VALUES ('409', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:58:49', '0');
INSERT INTO `keylog_history` VALUES ('410', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:58:44', '0');
INSERT INTO `keylog_history` VALUES ('411', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:57:23', '0');
INSERT INTO `keylog_history` VALUES ('412', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:55:53', '0');
INSERT INTO `keylog_history` VALUES ('413', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:55:06', '0');
INSERT INTO `keylog_history` VALUES ('414', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:53:46', '0');
INSERT INTO `keylog_history` VALUES ('415', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:53:44', '0');
INSERT INTO `keylog_history` VALUES ('416', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:52:25', '0');
INSERT INTO `keylog_history` VALUES ('417', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:52:02', '0');
INSERT INTO `keylog_history` VALUES ('418', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 00:51:44', '0');
INSERT INTO `keylog_history` VALUES ('419', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:49:25', '0');
INSERT INTO `keylog_history` VALUES ('420', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:48:41', '0');
INSERT INTO `keylog_history` VALUES ('421', '78874fd3-abb4-416d-aaf7-45f5a57f1a4b', '{Redis for Windows alternative, In-Memory Datastore | Memurai - ', '2023-11-02 00:47:55', '0');
INSERT INTO `keylog_history` VALUES ('422', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:47:54', '0');
INSERT INTO `keylog_history` VALUES ('423', '78874fd3-abb4-416d-aaf7-45f5a57f1a4b', '{Redis for Windows alternative, In-Memory Datastore | Memurai - ', '2023-11-02 00:47:42', '0');
INSERT INTO `keylog_history` VALUES ('424', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:47:10', '0');
INSERT INTO `keylog_history` VALUES ('425', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:46:00', '0');
INSERT INTO `keylog_history` VALUES ('426', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:45:18', '0');
INSERT INTO `keylog_history` VALUES ('427', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:45:17', '0');
INSERT INTO `keylog_history` VALUES ('428', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:43:00', '0');
INSERT INTO `keylog_history` VALUES ('429', '705acdf2-4231-424d-80da-3dba8e645930', '{1 089 079 309 - AnyDesk}', '2023-11-02 00:42:09', '0');
INSERT INTO `keylog_history` VALUES ('430', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-02 00:40:28', '0');
INSERT INTO `keylog_history` VALUES ('431', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Ghost}', '2023-11-02 00:40:07', '0');
INSERT INTO `keylog_history` VALUES ('432', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 00:37:25', '0');
INSERT INTO `keylog_history` VALUES ('433', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 00:36:55', '0');
INSERT INTO `keylog_history` VALUES ('434', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 00:36:53', '0');
INSERT INTO `keylog_history` VALUES ('435', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 00:36:39', '0');
INSERT INTO `keylog_history` VALUES ('436', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 00:36:31', '0');
INSERT INTO `keylog_history` VALUES ('437', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 00:36:17', '0');
INSERT INTO `keylog_history` VALUES ('438', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:34:06', '0');
INSERT INTO `keylog_history` VALUES ('439', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-02 00:31:39', '0');
INSERT INTO `keylog_history` VALUES ('440', '06f9b005-0ff8-4f07-a380-a10164d90b39', '{MetaMask Notification}', '2023-11-02 00:30:56', '0');
INSERT INTO `keylog_history` VALUES ('441', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 00:29:58', '0');
INSERT INTO `keylog_history` VALUES ('442', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 00:29:14', '0');
INSERT INTO `keylog_history` VALUES ('443', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 00:29:05', '0');
INSERT INTO `keylog_history` VALUES ('444', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-02 00:27:33', '0');
INSERT INTO `keylog_history` VALUES ('445', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:25:30', '0');
INSERT INTO `keylog_history` VALUES ('446', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 00:24:13', '0');
INSERT INTO `keylog_history` VALUES ('447', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-02 00:23:33', '0');
INSERT INTO `keylog_history` VALUES ('448', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:21:26', '0');
INSERT INTO `keylog_history` VALUES ('449', '5c5e3669-f43b-404d-994a-160d795c17cb', '{RajniAadharcard.pdf - Personal - Microsoft? Edge}', '2023-11-02 00:21:21', '0');
INSERT INTO `keylog_history` VALUES ('450', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-02 00:06:53', '0');
INSERT INTO `keylog_history` VALUES ('451', '276d8427-abc0-490a-82cf-a591f6448a0d', '{Pokemon_Card_Grade.mp4 - Google Drive - Google Chrome}', '2023-11-02 00:04:47', '0');
INSERT INTO `keylog_history` VALUES ('452', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:59:43', '0');
INSERT INTO `keylog_history` VALUES ('453', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:58:30', '0');
INSERT INTO `keylog_history` VALUES ('454', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:56:23', '0');
INSERT INTO `keylog_history` VALUES ('455', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:55:26', '0');
INSERT INTO `keylog_history` VALUES ('456', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-01 23:54:54', '0');
INSERT INTO `keylog_history` VALUES ('457', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:54:53', '0');
INSERT INTO `keylog_history` VALUES ('458', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:54:06', '0');
INSERT INTO `keylog_history` VALUES ('459', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-01 23:52:07', '0');
INSERT INTO `keylog_history` VALUES ('460', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:50:54', '0');
INSERT INTO `keylog_history` VALUES ('461', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:50:43', '0');
INSERT INTO `keylog_history` VALUES ('462', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:50:19', '0');
INSERT INTO `keylog_history` VALUES ('463', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:49:48', '0');
INSERT INTO `keylog_history` VALUES ('464', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:49:31', '0');
INSERT INTO `keylog_history` VALUES ('465', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:48:58', '0');
INSERT INTO `keylog_history` VALUES ('466', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-01 23:44:19', '0');
INSERT INTO `keylog_history` VALUES ('467', '5c5e3669-f43b-404d-994a-160d795c17cb', '{Corporate Gift Cards ', '2023-11-01 23:41:32', '0');
INSERT INTO `keylog_history` VALUES ('468', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:38:52', '0');
INSERT INTO `keylog_history` VALUES ('469', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-01 23:38:37', '0');
INSERT INTO `keylog_history` VALUES ('470', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 23:38:06', '0');
INSERT INTO `keylog_history` VALUES ('471', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 23:37:54', '0');
INSERT INTO `keylog_history` VALUES ('472', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-01 23:37:24', '0');
INSERT INTO `keylog_history` VALUES ('473', '276d8427-abc0-490a-82cf-a591f6448a0d', '{Pokemon_Card_Grade.mp4 - Google Drive - Google Chrome}', '2023-11-01 23:36:41', '0');
INSERT INTO `keylog_history` VALUES ('474', '276d8427-abc0-490a-82cf-a591f6448a0d', '{Pokemon_Card_Grade.mp4 - Google Drive - Google Chrome}', '2023-11-01 23:36:32', '0');
INSERT INTO `keylog_history` VALUES ('475', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-01 23:36:21', '0');
INSERT INTO `keylog_history` VALUES ('476', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:34:22', '0');
INSERT INTO `keylog_history` VALUES ('477', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-01 23:33:59', '0');
INSERT INTO `keylog_history` VALUES ('478', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 23:24:51', '0');
INSERT INTO `keylog_history` VALUES ('479', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 23:24:29', '0');
INSERT INTO `keylog_history` VALUES ('480', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-01 23:24:04', '0');
INSERT INTO `keylog_history` VALUES ('481', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-01 23:19:49', '0');
INSERT INTO `keylog_history` VALUES ('482', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-01 23:15:01', '0');
INSERT INTO `keylog_history` VALUES ('483', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 23:12:08', '0');
INSERT INTO `keylog_history` VALUES ('484', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 23:11:24', '0');
INSERT INTO `keylog_history` VALUES ('485', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-01 23:09:29', '0');
INSERT INTO `keylog_history` VALUES ('486', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{AnyDesk}', '2023-11-01 23:08:37', '0');
INSERT INTO `keylog_history` VALUES ('487', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-01 23:01:07', '0');
INSERT INTO `keylog_history` VALUES ('488', 'bc163ea0-beb8-4979-8011-2f7c448a059b', '{10.58.17.4 - Remote Desktop Connection}', '2023-11-01 22:43:38', '0');
INSERT INTO `keylog_history` VALUES ('489', 'bc163ea0-beb8-4979-8011-2f7c448a059b', '{10.58.17.4 - Remote Desktop Connection}', '2023-11-01 22:42:20', '0');
INSERT INTO `keylog_history` VALUES ('490', 'bc163ea0-beb8-4979-8011-2f7c448a059b', '{10.58.17.4 - Remote Desktop Connection}', '2023-11-01 22:36:14', '0');
INSERT INTO `keylog_history` VALUES ('491', 'd7ad44aa-eb21-4a8e-84c2-34772a3a1962', '{MEmu}', '2023-11-01 22:28:51', '0');
INSERT INTO `keylog_history` VALUES ('492', 'd7ad44aa-eb21-4a8e-84c2-34772a3a1962', '{MEmu}', '2023-11-01 22:27:33', '0');
INSERT INTO `keylog_history` VALUES ('493', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{192.168.144.235 - Remote Desktop Connection}', '2023-11-01 22:27:02', '0');
INSERT INTO `keylog_history` VALUES ('494', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 22:13:13', '0');
INSERT INTO `keylog_history` VALUES ('495', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 22:13:11', '0');
INSERT INTO `keylog_history` VALUES ('496', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-01 22:08:37', '0');
INSERT INTO `keylog_history` VALUES ('497', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-01 22:08:34', '0');
INSERT INTO `keylog_history` VALUES ('498', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Remote Desktop Connection}', '2023-11-01 22:04:25', '0');
INSERT INTO `keylog_history` VALUES ('499', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-01 21:54:58', '0');
INSERT INTO `keylog_history` VALUES ('500', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Ghost}', '2023-11-01 21:54:03', '0');
INSERT INTO `keylog_history` VALUES ('501', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 21:46:50', '0');
INSERT INTO `keylog_history` VALUES ('502', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 21:46:47', '0');
INSERT INTO `keylog_history` VALUES ('503', '2c84958e-37c4-4a20-95ff-ee5b5a76116f', '{CardAuthorization.yaml - Funtions2API - Visual Studio Code}', '2023-11-01 21:31:15', '0');
INSERT INTO `keylog_history` VALUES ('504', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-01 21:23:36', '0');
INSERT INTO `keylog_history` VALUES ('505', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-01 20:54:47', '0');
INSERT INTO `keylog_history` VALUES ('506', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-01 20:53:55', '0');
INSERT INTO `keylog_history` VALUES ('507', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-01 20:49:53', '0');
INSERT INTO `keylog_history` VALUES ('508', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-01 20:39:40', '0');
INSERT INTO `keylog_history` VALUES ('509', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{170.130.165.174 - Remote Desktop Connection}', '2023-11-01 20:23:18', '0');
INSERT INTO `keylog_history` VALUES ('510', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{LDPlayer}', '2023-11-01 20:21:27', '0');
INSERT INTO `keylog_history` VALUES ('511', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 20:18:32', '0');
INSERT INTO `keylog_history` VALUES ('512', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 20:17:40', '0');
INSERT INTO `keylog_history` VALUES ('513', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 20:17:40', '0');
INSERT INTO `keylog_history` VALUES ('514', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 20:17:19', '0');
INSERT INTO `keylog_history` VALUES ('515', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Welcome]}', '2023-11-01 20:17:16', '0');
INSERT INTO `keylog_history` VALUES ('516', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager - Do You Want to Restore the Last Opened', '2023-11-01 20:17:16', '0');
INSERT INTO `keylog_history` VALUES ('517', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{170.130.165.174 - Remote Desktop Connection}', '2023-11-01 20:07:40', '0');
INSERT INTO `keylog_history` VALUES ('518', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{170.130.165.174 - Remote Desktop Connection}', '2023-11-01 19:59:39', '0');
INSERT INTO `keylog_history` VALUES ('519', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{170.130.165.174 - Remote Desktop Connection}', '2023-11-01 19:59:11', '0');
INSERT INTO `keylog_history` VALUES ('520', '5dcad717-8d60-4002-8951-02b4aab74465', '{LDPlayer}', '2023-11-01 19:58:48', '0');
INSERT INTO `keylog_history` VALUES ('521', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{170.130.165.174 - Remote Desktop Connection}', '2023-11-01 19:52:51', '0');
INSERT INTO `keylog_history` VALUES ('522', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{Remote Desktop Connection}', '2023-11-01 19:46:18', '0');
INSERT INTO `keylog_history` VALUES ('523', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:46:14', '0');
INSERT INTO `keylog_history` VALUES ('524', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:46:13', '0');
INSERT INTO `keylog_history` VALUES ('525', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 19:46:13', '0');
INSERT INTO `keylog_history` VALUES ('526', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 19:46:12', '0');
INSERT INTO `keylog_history` VALUES ('527', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:46:06', '0');
INSERT INTO `keylog_history` VALUES ('528', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{170.130.165.174 - Remote Desktop Connection}', '2023-11-01 19:46:03', '0');
INSERT INTO `keylog_history` VALUES ('529', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{175.45.182.177 - Remote Desktop Connection}', '2023-11-01 19:45:56', '0');
INSERT INTO `keylog_history` VALUES ('530', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-01 19:45:40', '0');
INSERT INTO `keylog_history` VALUES ('531', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{175.45.182.177 - Remote Desktop Connection}', '2023-11-01 19:44:43', '0');
INSERT INTO `keylog_history` VALUES ('532', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 19:43:36', '0');
INSERT INTO `keylog_history` VALUES ('533', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 19:43:35', '0');
INSERT INTO `keylog_history` VALUES ('534', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 19:43:11', '0');
INSERT INTO `keylog_history` VALUES ('535', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{170.130.165.174 - Remote Desktop Connection}', '2023-11-01 19:42:14', '0');
INSERT INTO `keylog_history` VALUES ('536', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{Remote Desktop Connection}', '2023-11-01 19:41:20', '0');
INSERT INTO `keylog_history` VALUES ('537', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:40:59', '0');
INSERT INTO `keylog_history` VALUES ('538', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 19:40:27', '0');
INSERT INTO `keylog_history` VALUES ('539', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 19:40:26', '0');
INSERT INTO `keylog_history` VALUES ('540', '5dcad717-8d60-4002-8951-02b4aab74465', '{192.168.146.167 - Remote Desktop Connection}', '2023-11-01 19:40:26', '0');
INSERT INTO `keylog_history` VALUES ('541', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 19:40:18', '0');
INSERT INTO `keylog_history` VALUES ('542', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 19:39:43', '0');
INSERT INTO `keylog_history` VALUES ('543', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 19:39:29', '0');
INSERT INTO `keylog_history` VALUES ('544', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:39:29', '0');
INSERT INTO `keylog_history` VALUES ('545', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:39:24', '0');
INSERT INTO `keylog_history` VALUES ('546', '5dcad717-8d60-4002-8951-02b4aab74465', '{192.168.146.167 - Remote Desktop Connection}', '2023-11-01 19:39:23', '0');
INSERT INTO `keylog_history` VALUES ('547', '5dcad717-8d60-4002-8951-02b4aab74465', '{192.168.146.167 - Remote Desktop Connection}', '2023-11-01 19:38:08', '0');
INSERT INTO `keylog_history` VALUES ('548', '5dcad717-8d60-4002-8951-02b4aab74465', '{192.168.146.167 - Remote Desktop Connection}', '2023-11-01 19:37:00', '0');
INSERT INTO `keylog_history` VALUES ('549', '5dcad717-8d60-4002-8951-02b4aab74465', '{192.168.146.167 - Remote Desktop Connection}', '2023-11-01 19:34:33', '0');
INSERT INTO `keylog_history` VALUES ('550', '5dcad717-8d60-4002-8951-02b4aab74465', '{192.168.146.167 - Remote Desktop Connection}', '2023-11-01 19:33:56', '0');
INSERT INTO `keylog_history` VALUES ('551', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Connection}', '2023-11-01 19:33:54', '0');
INSERT INTO `keylog_history` VALUES ('552', '5dcad717-8d60-4002-8951-02b4aab74465', '{192.168.146.167 - Remote Desktop Connection}', '2023-11-01 19:33:46', '0');
INSERT INTO `keylog_history` VALUES ('553', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Connection}', '2023-11-01 19:33:40', '0');
INSERT INTO `keylog_history` VALUES ('554', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Connection}', '2023-11-01 19:33:19', '0');
INSERT INTO `keylog_history` VALUES ('555', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:28:17', '0');
INSERT INTO `keylog_history` VALUES ('556', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:27:14', '0');
INSERT INTO `keylog_history` VALUES ('557', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:24:02', '0');
INSERT INTO `keylog_history` VALUES ('558', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:23:33', '0');
INSERT INTO `keylog_history` VALUES ('559', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:21:08', '0');
INSERT INTO `keylog_history` VALUES ('560', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:19:16', '0');
INSERT INTO `keylog_history` VALUES ('561', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:19:14', '0');
INSERT INTO `keylog_history` VALUES ('562', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:18:23', '0');
INSERT INTO `keylog_history` VALUES ('563', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:18:23', '0');
INSERT INTO `keylog_history` VALUES ('564', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:18:05', '0');
INSERT INTO `keylog_history` VALUES ('565', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:16:30', '0');
INSERT INTO `keylog_history` VALUES ('566', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:15:52', '0');
INSERT INTO `keylog_history` VALUES ('567', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:14:37', '0');
INSERT INTO `keylog_history` VALUES ('568', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 18:56:16', '0');
INSERT INTO `keylog_history` VALUES ('569', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 18:55:56', '0');
INSERT INTO `keylog_history` VALUES ('570', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 18:55:04', '0');
INSERT INTO `keylog_history` VALUES ('571', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 18:52:43', '0');
INSERT INTO `keylog_history` VALUES ('572', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 18:52:43', '0');
INSERT INTO `keylog_history` VALUES ('573', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 18:00:41', '0');
INSERT INTO `keylog_history` VALUES ('574', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 18:00:29', '0');
INSERT INTO `keylog_history` VALUES ('575', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 17:40:16', '0');
INSERT INTO `keylog_history` VALUES ('576', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Software for Windows ? AnyDesk - Google Chrome}', '2023-11-01 17:34:36', '0');
INSERT INTO `keylog_history` VALUES ('577', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 17:16:42', '0');
INSERT INTO `keylog_history` VALUES ('578', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 16:06:46', '0');
INSERT INTO `keylog_history` VALUES ('579', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram (1)}', '2023-11-01 16:06:43', '0');
INSERT INTO `keylog_history` VALUES ('580', '5dcad717-8d60-4002-8951-02b4aab74465', '{MetaMask Flask DEVELOPMENT BUILD - Chrome Web Store - Google Ch', '2023-11-01 15:36:39', '0');
INSERT INTO `keylog_history` VALUES ('581', '5dcad717-8d60-4002-8951-02b4aab74465', '{MetaMask Notification}', '2023-11-01 15:31:34', '0');
INSERT INTO `keylog_history` VALUES ('582', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram_XtNVMoZKS0.png ?- Photos}', '2023-11-01 15:01:26', '0');
INSERT INTO `keylog_history` VALUES ('583', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 14:25:55', '0');
INSERT INTO `keylog_history` VALUES ('584', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 14:25:29', '0');
INSERT INTO `keylog_history` VALUES ('585', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 14:24:30', '0');
INSERT INTO `keylog_history` VALUES ('586', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 13:12:52', '0');
INSERT INTO `keylog_history` VALUES ('587', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 13:08:16', '0');
INSERT INTO `keylog_history` VALUES ('588', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{TelegramDesktop}', '2023-11-01 13:08:14', '0');
INSERT INTO `keylog_history` VALUES ('589', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 13:07:03', '0');
INSERT INTO `keylog_history` VALUES ('590', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 13:02:51', '0');
INSERT INTO `keylog_history` VALUES ('591', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 12:29:43', '0');
INSERT INTO `keylog_history` VALUES ('592', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 12:29:12', '0');
INSERT INTO `keylog_history` VALUES ('593', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 12:28:50', '0');
INSERT INTO `keylog_history` VALUES ('594', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 12:27:32', '0');
INSERT INTO `keylog_history` VALUES ('595', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 12:21:40', '0');
INSERT INTO `keylog_history` VALUES ('596', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 12:08:44', '0');
INSERT INTO `keylog_history` VALUES ('597', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 12:04:32', '0');
INSERT INTO `keylog_history` VALUES ('598', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:50:51', '0');
INSERT INTO `keylog_history` VALUES ('599', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{AnyDesk}', '2023-11-02 08:50:21', '0');
INSERT INTO `keylog_history` VALUES ('600', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{AnyDesk}', '2023-11-02 08:50:20', '0');
INSERT INTO `keylog_history` VALUES ('601', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 08:49:31', '0');
INSERT INTO `keylog_history` VALUES ('602', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{AnyDesk}', '2023-11-02 08:48:11', '0');
INSERT INTO `keylog_history` VALUES ('603', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{AnyDesk}', '2023-11-02 08:48:10', '0');
INSERT INTO `keylog_history` VALUES ('604', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:46:56', '0');
INSERT INTO `keylog_history` VALUES ('605', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:46:53', '0');
INSERT INTO `keylog_history` VALUES ('606', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:46:51', '0');
INSERT INTO `keylog_history` VALUES ('607', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:46:11', '0');
INSERT INTO `keylog_history` VALUES ('608', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:46:04', '0');
INSERT INTO `keylog_history` VALUES ('609', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{AnyDesk}', '2023-11-02 08:45:34', '0');
INSERT INTO `keylog_history` VALUES ('610', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{AnyDesk}', '2023-11-02 08:45:32', '0');
INSERT INTO `keylog_history` VALUES ('611', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:45:22', '0');
INSERT INTO `keylog_history` VALUES ('612', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:45:14', '0');
INSERT INTO `keylog_history` VALUES ('613', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:45:00', '0');
INSERT INTO `keylog_history` VALUES ('614', '17e43cb4-5d31-470f-8619-62ce22467dcc', '{170.130.55.19 - Remote Desktop Connection}', '2023-11-02 08:44:58', '0');
INSERT INTO `keylog_history` VALUES ('615', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:44:58', '0');
INSERT INTO `keylog_history` VALUES ('616', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard - simple.csv - Excel}', '2023-11-02 08:44:53', '0');
INSERT INTO `keylog_history` VALUES ('617', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:44:45', '0');
INSERT INTO `keylog_history` VALUES ('618', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:44:39', '0');
INSERT INTO `keylog_history` VALUES ('619', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:43:55', '0');
INSERT INTO `keylog_history` VALUES ('620', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:43:29', '0');
INSERT INTO `keylog_history` VALUES ('621', '5f81ef99-ae69-448e-865e-427f2bd6f9d8', '{192.168.145.8 - Remote Desktop Connection}', '2023-11-02 08:43:27', '0');
INSERT INTO `keylog_history` VALUES ('622', 'c0c4ceef-dd32-4156-8c74-3e66863b849f', '{Colom - AnyDesk}', '2023-11-02 08:43:18', '0');
INSERT INTO `keylog_history` VALUES ('623', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:43:12', '0');
INSERT INTO `keylog_history` VALUES ('624', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:42:46', '0');
INSERT INTO `keylog_history` VALUES ('625', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:42:29', '0');
INSERT INTO `keylog_history` VALUES ('626', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:42:17', '0');
INSERT INTO `keylog_history` VALUES ('627', 'c0c4ceef-dd32-4156-8c74-3e66863b849f', '{Colom - AnyDesk}', '2023-11-02 08:41:28', '0');
INSERT INTO `keylog_history` VALUES ('628', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:41:27', '0');
INSERT INTO `keylog_history` VALUES ('629', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:41:23', '0');
INSERT INTO `keylog_history` VALUES ('630', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:41:03', '0');
INSERT INTO `keylog_history` VALUES ('631', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:40:46', '0');
INSERT INTO `keylog_history` VALUES ('632', 'c0c4ceef-dd32-4156-8c74-3e66863b849f', '{Colom - AnyDesk}', '2023-11-02 08:40:41', '0');
INSERT INTO `keylog_history` VALUES ('633', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:40:33', '0');
INSERT INTO `keylog_history` VALUES ('634', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:40:19', '0');
INSERT INTO `keylog_history` VALUES ('635', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:40:17', '0');
INSERT INTO `keylog_history` VALUES ('636', '5f81ef99-ae69-448e-865e-427f2bd6f9d8', '{192.168.145.8 - Remote Desktop Connection}', '2023-11-02 08:39:50', '0');
INSERT INTO `keylog_history` VALUES ('637', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:39:35', '0');
INSERT INTO `keylog_history` VALUES ('638', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:39:16', '0');
INSERT INTO `keylog_history` VALUES ('639', '5f81ef99-ae69-448e-865e-427f2bd6f9d8', '{Remote Desktop Connection}', '2023-11-02 08:39:10', '0');
INSERT INTO `keylog_history` VALUES ('640', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:39:08', '0');
INSERT INTO `keylog_history` VALUES ('641', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:38:43', '0');
INSERT INTO `keylog_history` VALUES ('642', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:37:14', '0');
INSERT INTO `keylog_history` VALUES ('643', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:36:56', '0');
INSERT INTO `keylog_history` VALUES ('644', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:36:37', '0');
INSERT INTO `keylog_history` VALUES ('645', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 08:36:21', '0');
INSERT INTO `keylog_history` VALUES ('646', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:36:01', '0');
INSERT INTO `keylog_history` VALUES ('647', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{Remote Desktop Connection}', '2023-11-02 08:35:45', '0');
INSERT INTO `keylog_history` VALUES ('648', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:35:38', '0');
INSERT INTO `keylog_history` VALUES ('649', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:35:07', '0');
INSERT INTO `keylog_history` VALUES ('650', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:35:07', '0');
INSERT INTO `keylog_history` VALUES ('651', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{Remote Desktop Connection}', '2023-11-02 08:34:47', '0');
INSERT INTO `keylog_history` VALUES ('652', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:34:42', '0');
INSERT INTO `keylog_history` VALUES ('653', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard - simple.csv - Excel}', '2023-11-02 08:34:27', '0');
INSERT INTO `keylog_history` VALUES ('654', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{V_CardTemplate @cm.lni_template (38.180.34.4) - Table - Navicat', '2023-11-02 08:34:24', '0');
INSERT INTO `keylog_history` VALUES ('655', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:34:22', '0');
INSERT INTO `keylog_history` VALUES ('656', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:34:11', '0');
INSERT INTO `keylog_history` VALUES ('657', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:33:29', '0');
INSERT INTO `keylog_history` VALUES ('658', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard.csv - Excel}', '2023-11-02 08:33:13', '0');
INSERT INTO `keylog_history` VALUES ('659', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:32:09', '0');
INSERT INTO `keylog_history` VALUES ('660', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{metamask.js - frontend-react - Visual Studio Code}', '2023-11-02 08:32:04', '0');
INSERT INTO `keylog_history` VALUES ('661', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{metamask.js - frontend-react - Visual Studio Code}', '2023-11-02 08:31:54', '0');
INSERT INTO `keylog_history` VALUES ('662', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{metamask.js - frontend-react - Visual Studio Code}', '2023-11-02 08:31:52', '0');
INSERT INTO `keylog_history` VALUES ('663', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:31:45', '0');
INSERT INTO `keylog_history` VALUES ('664', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{metamask.js - frontend-react - Visual Studio Code}', '2023-11-02 08:31:39', '0');
INSERT INTO `keylog_history` VALUES ('665', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:30:59', '0');
INSERT INTO `keylog_history` VALUES ('666', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:30:19', '0');
INSERT INTO `keylog_history` VALUES ('667', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:29:17', '0');
INSERT INTO `keylog_history` VALUES ('668', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{metamask.js - frontend-react - Visual Studio Code}', '2023-11-02 08:28:44', '0');
INSERT INTO `keylog_history` VALUES ('669', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{metamask.js - frontend-react - Visual Studio Code}', '2023-11-02 08:28:42', '0');
INSERT INTO `keylog_history` VALUES ('670', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:28:31', '0');
INSERT INTO `keylog_history` VALUES ('671', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:28:27', '0');
INSERT INTO `keylog_history` VALUES ('672', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:28:11', '0');
INSERT INTO `keylog_history` VALUES ('673', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{metamask.js - frontend-react - Visual Studio Code}', '2023-11-02 08:27:57', '0');
INSERT INTO `keylog_history` VALUES ('674', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:27:06', '0');
INSERT INTO `keylog_history` VALUES ('675', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:25:50', '0');
INSERT INTO `keylog_history` VALUES ('676', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 08:24:58', '0');
INSERT INTO `keylog_history` VALUES ('677', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard - simple.csv - Excel}', '2023-11-02 08:24:46', '0');
INSERT INTO `keylog_history` VALUES ('678', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:24:33', '0');
INSERT INTO `keylog_history` VALUES ('679', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:23:50', '0');
INSERT INTO `keylog_history` VALUES ('680', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 08:23:37', '0');
INSERT INTO `keylog_history` VALUES ('681', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:21:42', '0');
INSERT INTO `keylog_history` VALUES ('682', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard - simple.csv - Excel}', '2023-11-02 08:19:46', '0');
INSERT INTO `keylog_history` VALUES ('683', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{V_CardTemplate @cm.lni_template (38.180.34.4) - Table - Navicat', '2023-11-02 08:19:44', '0');
INSERT INTO `keylog_history` VALUES ('684', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:17:12', '0');
INSERT INTO `keylog_history` VALUES ('685', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 08:16:47', '0');
INSERT INTO `keylog_history` VALUES ('686', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{V_CardTemplate @cm.lni_template (38.180.34.4) - Table - Navicat', '2023-11-02 08:16:35', '0');
INSERT INTO `keylog_history` VALUES ('687', '29fe64df-9987-4b4d-9c13-962a424e365e', '{A_wallet - Google Docs - Google Chrome}', '2023-11-02 08:15:43', '0');
INSERT INTO `keylog_history` VALUES ('688', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:14:17', '0');
INSERT INTO `keylog_history` VALUES ('689', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:14:12', '0');
INSERT INTO `keylog_history` VALUES ('690', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:13:31', '0');
INSERT INTO `keylog_history` VALUES ('691', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:11:46', '0');
INSERT INTO `keylog_history` VALUES ('692', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:11:44', '0');
INSERT INTO `keylog_history` VALUES ('693', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:11:33', '0');
INSERT INTO `keylog_history` VALUES ('694', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:10:41', '0');
INSERT INTO `keylog_history` VALUES ('695', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:10:38', '0');
INSERT INTO `keylog_history` VALUES ('696', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard - simple.csv - Excel}', '2023-11-02 08:10:23', '0');
INSERT INTO `keylog_history` VALUES ('697', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:10:14', '0');
INSERT INTO `keylog_history` VALUES ('698', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:09:53', '0');
INSERT INTO `keylog_history` VALUES ('699', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 08:09:41', '0');
INSERT INTO `keylog_history` VALUES ('700', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:09:25', '0');
INSERT INTO `keylog_history` VALUES ('701', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 08:09:03', '0');
INSERT INTO `keylog_history` VALUES ('702', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:07:44', '0');
INSERT INTO `keylog_history` VALUES ('703', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:06:37', '0');
INSERT INTO `keylog_history` VALUES ('704', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:05:45', '0');
INSERT INTO `keylog_history` VALUES ('705', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:05:11', '0');
INSERT INTO `keylog_history` VALUES ('706', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:03:23', '0');
INSERT INTO `keylog_history` VALUES ('707', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 08:02:19', '0');
INSERT INTO `keylog_history` VALUES ('708', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 08:02:02', '0');
INSERT INTO `keylog_history` VALUES ('709', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 08:01:55', '0');
INSERT INTO `keylog_history` VALUES ('710', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{3.218.156.17 - Remote Desktop Connection}', '2023-11-02 08:01:15', '0');
INSERT INTO `keylog_history` VALUES ('711', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-02 08:01:10', '0');
INSERT INTO `keylog_history` VALUES ('712', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:58:26', '0');
INSERT INTO `keylog_history` VALUES ('713', 'c0c4ceef-dd32-4156-8c74-3e66863b849f', '{Colom - AnyDesk}', '2023-11-02 07:57:51', '0');
INSERT INTO `keylog_history` VALUES ('714', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:57:09', '0');
INSERT INTO `keylog_history` VALUES ('715', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:56:51', '0');
INSERT INTO `keylog_history` VALUES ('716', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:56:28', '0');
INSERT INTO `keylog_history` VALUES ('717', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:55:48', '0');
INSERT INTO `keylog_history` VALUES ('718', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:55:42', '0');
INSERT INTO `keylog_history` VALUES ('719', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:55:04', '0');
INSERT INTO `keylog_history` VALUES ('720', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{TimNewServer - 216.22.1.38 - Remote Desktop Connection}', '2023-11-02 07:50:38', '0');
INSERT INTO `keylog_history` VALUES ('721', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:49:52', '0');
INSERT INTO `keylog_history` VALUES ('722', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:49:25', '0');
INSERT INTO `keylog_history` VALUES ('723', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:48:36', '0');
INSERT INTO `keylog_history` VALUES ('724', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{TimNewServer - 216.22.1.38 - Remote Desktop Connection}', '2023-11-02 07:47:12', '0');
INSERT INTO `keylog_history` VALUES ('725', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:46:08', '0');
INSERT INTO `keylog_history` VALUES ('726', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{TimNewServer - 216.22.1.38 - Remote Desktop Connection}', '2023-11-02 07:45:15', '0');
INSERT INTO `keylog_history` VALUES ('727', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-02 07:44:58', '0');
INSERT INTO `keylog_history` VALUES ('728', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:44:50', '0');
INSERT INTO `keylog_history` VALUES ('729', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 07:44:42', '0');
INSERT INTO `keylog_history` VALUES ('730', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 07:44:26', '0');
INSERT INTO `keylog_history` VALUES ('731', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:43:28', '0');
INSERT INTO `keylog_history` VALUES ('732', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:43:12', '0');
INSERT INTO `keylog_history` VALUES ('733', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Amrit - AnyDesk}', '2023-11-02 07:43:10', '0');
INSERT INTO `keylog_history` VALUES ('734', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:42:26', '0');
INSERT INTO `keylog_history` VALUES ('735', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:41:39', '0');
INSERT INTO `keylog_history` VALUES ('736', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:41:09', '0');
INSERT INTO `keylog_history` VALUES ('737', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:41:04', '0');
INSERT INTO `keylog_history` VALUES ('738', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{TimNewServer - 216.22.1.38 - Remote Desktop Connection}', '2023-11-02 07:40:47', '0');
INSERT INTO `keylog_history` VALUES ('739', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{Remote Desktop Connection}', '2023-11-02 07:40:14', '0');
INSERT INTO `keylog_history` VALUES ('740', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:39:16', '0');
INSERT INTO `keylog_history` VALUES ('741', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:39:01', '0');
INSERT INTO `keylog_history` VALUES ('742', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 07:38:52', '0');
INSERT INTO `keylog_history` VALUES ('743', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:38:37', '0');
INSERT INTO `keylog_history` VALUES ('744', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:38:20', '0');
INSERT INTO `keylog_history` VALUES ('745', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-02 07:38:05', '0');
INSERT INTO `keylog_history` VALUES ('746', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:37:56', '0');
INSERT INTO `keylog_history` VALUES ('747', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:37:33', '0');
INSERT INTO `keylog_history` VALUES ('748', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:37:20', '0');
INSERT INTO `keylog_history` VALUES ('749', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:37:15', '0');
INSERT INTO `keylog_history` VALUES ('750', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{Remote Desktop Connection}', '2023-11-02 07:36:42', '0');
INSERT INTO `keylog_history` VALUES ('751', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 07:35:33', '0');
INSERT INTO `keylog_history` VALUES ('752', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 07:35:27', '0');
INSERT INTO `keylog_history` VALUES ('753', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 07:32:49', '0');
INSERT INTO `keylog_history` VALUES ('754', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:28:56', '0');
INSERT INTO `keylog_history` VALUES ('755', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:26:23', '0');
INSERT INTO `keylog_history` VALUES ('756', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:25:27', '0');
INSERT INTO `keylog_history` VALUES ('757', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{OurRDP - 89.117.62.44 - Remote Desktop Connection}', '2023-11-02 07:25:22', '0');
INSERT INTO `keylog_history` VALUES ('758', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 07:23:47', '0');
INSERT INTO `keylog_history` VALUES ('759', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{OurRDP - 89.117.62.44 - Remote Desktop Connection}', '2023-11-02 07:19:22', '0');
INSERT INTO `keylog_history` VALUES ('760', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 07:18:05', '0');
INSERT INTO `keylog_history` VALUES ('761', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{OurRDP - 89.117.62.44 - Remote Desktop Connection}', '2023-11-02 07:16:59', '0');
INSERT INTO `keylog_history` VALUES ('762', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:15:44', '0');
INSERT INTO `keylog_history` VALUES ('763', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:15:36', '0');
INSERT INTO `keylog_history` VALUES ('764', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:14:47', '0');
INSERT INTO `keylog_history` VALUES ('765', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:14:26', '0');
INSERT INTO `keylog_history` VALUES ('766', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Amrit - AnyDesk}', '2023-11-02 07:13:26', '0');
INSERT INTO `keylog_history` VALUES ('767', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard.csv - Excel}', '2023-11-02 07:11:48', '0');
INSERT INTO `keylog_history` VALUES ('768', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:08:58', '0');
INSERT INTO `keylog_history` VALUES ('769', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Amrit - AnyDesk}', '2023-11-02 07:08:47', '0');
INSERT INTO `keylog_history` VALUES ('770', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:08:03', '0');
INSERT INTO `keylog_history` VALUES ('771', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:07:24', '0');
INSERT INTO `keylog_history` VALUES ('772', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{V_PhysicalCard @cm.P_CINLNI (38.180.34.4) - Table - Navicat Pre', '2023-11-02 07:07:18', '0');
INSERT INTO `keylog_history` VALUES ('773', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:07:14', '0');
INSERT INTO `keylog_history` VALUES ('774', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:07:09', '0');
INSERT INTO `keylog_history` VALUES ('775', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:05:10', '0');
INSERT INTO `keylog_history` VALUES ('776', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 07:05:03', '0');
INSERT INTO `keylog_history` VALUES ('777', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 07:04:42', '0');
INSERT INTO `keylog_history` VALUES ('778', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 07:01:44', '0');
INSERT INTO `keylog_history` VALUES ('779', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 07:01:18', '0');
INSERT INTO `keylog_history` VALUES ('780', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 07:01:04', '0');
INSERT INTO `keylog_history` VALUES ('781', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 06:59:35', '0');
INSERT INTO `keylog_history` VALUES ('782', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 06:59:32', '0');
INSERT INTO `keylog_history` VALUES ('783', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 06:57:31', '0');
INSERT INTO `keylog_history` VALUES ('784', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{Remote Desktop Connection}', '2023-11-02 06:54:05', '0');
INSERT INTO `keylog_history` VALUES ('785', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 06:51:16', '0');
INSERT INTO `keylog_history` VALUES ('786', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{T - AnyDesk}', '2023-11-02 06:49:13', '0');
INSERT INTO `keylog_history` VALUES ('787', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{Carbify | Connect Wallet - Google Chrome}', '2023-11-02 06:48:14', '0');
INSERT INTO `keylog_history` VALUES ('788', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-02 06:46:17', '0');
INSERT INTO `keylog_history` VALUES ('789', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 06:44:58', '0');
INSERT INTO `keylog_history` VALUES ('790', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Amrit - AnyDesk}', '2023-11-02 06:42:49', '0');
INSERT INTO `keylog_history` VALUES ('791', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 06:42:47', '0');
INSERT INTO `keylog_history` VALUES ('792', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Amrit - AnyDesk}', '2023-11-02 06:42:10', '0');
INSERT INTO `keylog_history` VALUES ('793', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 06:42:00', '0');
INSERT INTO `keylog_history` VALUES ('794', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-02 06:41:22', '0');
INSERT INTO `keylog_history` VALUES ('795', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 06:38:43', '0');
INSERT INTO `keylog_history` VALUES ('796', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 06:38:15', '0');
INSERT INTO `keylog_history` VALUES ('797', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 06:35:10', '0');
INSERT INTO `keylog_history` VALUES ('798', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 06:34:30', '0');
INSERT INTO `keylog_history` VALUES ('799', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 06:34:27', '0');
INSERT INTO `keylog_history` VALUES ('800', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 06:33:32', '0');
INSERT INTO `keylog_history` VALUES ('801', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 06:30:36', '0');
INSERT INTO `keylog_history` VALUES ('802', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-02 06:30:36', '0');
INSERT INTO `keylog_history` VALUES ('803', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 06:30:15', '0');
INSERT INTO `keylog_history` VALUES ('804', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Amrit - AnyDesk}', '2023-11-02 06:26:50', '0');
INSERT INTO `keylog_history` VALUES ('805', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:26:32', '0');
INSERT INTO `keylog_history` VALUES ('806', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:25:35', '0');
INSERT INTO `keylog_history` VALUES ('807', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 673 802 352 - AnyDesk}', '2023-11-02 06:25:15', '0');
INSERT INTO `keylog_history` VALUES ('808', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:25:13', '0');
INSERT INTO `keylog_history` VALUES ('809', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 673 802 352 - AnyDesk}', '2023-11-02 06:25:12', '0');
INSERT INTO `keylog_history` VALUES ('810', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:25:09', '0');
INSERT INTO `keylog_history` VALUES ('811', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:24:30', '0');
INSERT INTO `keylog_history` VALUES ('812', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 673 802 352 - AnyDesk}', '2023-11-02 06:23:46', '0');
INSERT INTO `keylog_history` VALUES ('813', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:23:42', '0');
INSERT INTO `keylog_history` VALUES ('814', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 673 802 352 - AnyDesk}', '2023-11-02 06:23:33', '0');
INSERT INTO `keylog_history` VALUES ('815', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{Remote Desktop Connection}', '2023-11-02 06:20:57', '0');
INSERT INTO `keylog_history` VALUES ('816', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:20:38', '0');
INSERT INTO `keylog_history` VALUES ('817', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{Remote Desktop Connection}', '2023-11-02 06:19:53', '0');
INSERT INTO `keylog_history` VALUES ('818', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{487 598 621 - AnyDesk}', '2023-11-02 06:19:51', '0');
INSERT INTO `keylog_history` VALUES ('819', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{192.168.144.222 - Remote Desktop Connection}', '2023-11-02 06:19:46', '0');
INSERT INTO `keylog_history` VALUES ('820', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{487 598 621 - AnyDesk}', '2023-11-02 06:19:01', '0');
INSERT INTO `keylog_history` VALUES ('821', '5f81ef99-ae69-448e-865e-427f2bd6f9d8', '{AnyDesk}', '2023-11-02 06:18:39', '0');
INSERT INTO `keylog_history` VALUES ('822', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:16:45', '0');
INSERT INTO `keylog_history` VALUES ('823', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-02 06:15:28', '0');
INSERT INTO `keylog_history` VALUES ('824', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{MetaMask Notification}', '2023-11-02 06:08:23', '0');
INSERT INTO `keylog_history` VALUES ('825', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:59:56', '0');
INSERT INTO `keylog_history` VALUES ('826', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:46:44', '0');
INSERT INTO `keylog_history` VALUES ('827', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:42:56', '0');
INSERT INTO `keylog_history` VALUES ('828', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:42:45', '0');
INSERT INTO `keylog_history` VALUES ('829', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:42:10', '0');
INSERT INTO `keylog_history` VALUES ('830', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:42:04', '0');
INSERT INTO `keylog_history` VALUES ('831', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 05:35:39', '0');
INSERT INTO `keylog_history` VALUES ('832', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 05:34:32', '0');
INSERT INTO `keylog_history` VALUES ('833', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{Remote Desktop Connection}', '2023-11-02 05:34:16', '0');
INSERT INTO `keylog_history` VALUES ('834', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:26:23', '0');
INSERT INTO `keylog_history` VALUES ('835', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:18:51', '0');
INSERT INTO `keylog_history` VALUES ('836', '7ae5639b-4a64-44ad-8305-4c2385c82a36', '{[ESD-192] ESP32 SD Card interfacing - archive data and retreive', '2023-11-02 05:18:02', '0');
INSERT INTO `keylog_history` VALUES ('837', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:15:48', '0');
INSERT INTO `keylog_history` VALUES ('838', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 05:15:12', '0');
INSERT INTO `keylog_history` VALUES ('839', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-02 05:11:05', '0');
INSERT INTO `keylog_history` VALUES ('840', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 05:02:27', '0');
INSERT INTO `keylog_history` VALUES ('841', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 05:00:53', '0');
INSERT INTO `keylog_history` VALUES ('842', '06f9b005-0ff8-4f07-a380-a10164d90b39', '{Usage | WalletConnect Docs - Google Chrome}', '2023-11-02 04:54:00', '0');
INSERT INTO `keylog_history` VALUES ('843', '06f9b005-0ff8-4f07-a380-a10164d90b39', '{WalletConnect - Google Chrome}', '2023-11-02 04:52:06', '0');
INSERT INTO `keylog_history` VALUES ('844', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 04:49:27', '0');
INSERT INTO `keylog_history` VALUES ('845', '29fe64df-9987-4b4d-9c13-962a424e365e', '{Log in to your PayPal account - Chromium}', '2023-11-02 04:47:19', '0');
INSERT INTO `keylog_history` VALUES ('846', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 04:43:50', '0');
INSERT INTO `keylog_history` VALUES ('847', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard.csv - Excel}', '2023-11-02 04:43:18', '0');
INSERT INTO `keylog_history` VALUES ('848', 'c0c4ceef-dd32-4156-8c74-3e66863b849f', '{Colom - AnyDesk}', '2023-11-02 04:42:00', '0');
INSERT INTO `keylog_history` VALUES ('849', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 04:36:47', '0');
INSERT INTO `keylog_history` VALUES ('850', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-02 04:31:48', '0');
INSERT INTO `keylog_history` VALUES ('851', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 04:26:08', '0');
INSERT INTO `keylog_history` VALUES ('852', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 04:22:44', '0');
INSERT INTO `keylog_history` VALUES ('853', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 04:22:40', '0');
INSERT INTO `keylog_history` VALUES ('854', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 04:21:48', '0');
INSERT INTO `keylog_history` VALUES ('855', '29fe64df-9987-4b4d-9c13-962a424e365e', '{1 662 049 968 - AnyDesk}', '2023-11-02 04:21:43', '0');
INSERT INTO `keylog_history` VALUES ('856', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 04:21:35', '0');
INSERT INTO `keylog_history` VALUES ('857', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard.csv - Excel}', '2023-11-02 04:21:21', '0');
INSERT INTO `keylog_history` VALUES ('858', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 04:20:59', '0');
INSERT INTO `keylog_history` VALUES ('859', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-02 04:16:32', '0');
INSERT INTO `keylog_history` VALUES ('860', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 04:10:52', '0');
INSERT INTO `keylog_history` VALUES ('861', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 04:10:22', '0');
INSERT INTO `keylog_history` VALUES ('862', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 04:01:37', '0');
INSERT INTO `keylog_history` VALUES ('863', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 04:00:40', '0');
INSERT INTO `keylog_history` VALUES ('864', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:55:51', '0');
INSERT INTO `keylog_history` VALUES ('865', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:55:24', '0');
INSERT INTO `keylog_history` VALUES ('866', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:55:03', '0');
INSERT INTO `keylog_history` VALUES ('867', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:38:33', '0');
INSERT INTO `keylog_history` VALUES ('868', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:38:23', '0');
INSERT INTO `keylog_history` VALUES ('869', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:38:13', '0');
INSERT INTO `keylog_history` VALUES ('870', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:36:20', '0');
INSERT INTO `keylog_history` VALUES ('871', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:36:07', '0');
INSERT INTO `keylog_history` VALUES ('872', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:35:16', '0');
INSERT INTO `keylog_history` VALUES ('873', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 03:35:12', '0');
INSERT INTO `keylog_history` VALUES ('874', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:33:40', '0');
INSERT INTO `keylog_history` VALUES ('875', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:33:28', '0');
INSERT INTO `keylog_history` VALUES ('876', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 03:33:12', '0');
INSERT INTO `keylog_history` VALUES ('877', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:33:07', '0');
INSERT INTO `keylog_history` VALUES ('878', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 03:31:46', '0');
INSERT INTO `keylog_history` VALUES ('879', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:28:04', '0');
INSERT INTO `keylog_history` VALUES ('880', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:27:23', '0');
INSERT INTO `keylog_history` VALUES ('881', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:26:32', '0');
INSERT INTO `keylog_history` VALUES ('882', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:26:05', '0');
INSERT INTO `keylog_history` VALUES ('883', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:25:27', '0');
INSERT INTO `keylog_history` VALUES ('884', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 03:25:21', '0');
INSERT INTO `keylog_history` VALUES ('885', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:24:35', '0');
INSERT INTO `keylog_history` VALUES ('886', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:23:59', '0');
INSERT INTO `keylog_history` VALUES ('887', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:21:18', '0');
INSERT INTO `keylog_history` VALUES ('888', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:20:54', '0');
INSERT INTO `keylog_history` VALUES ('889', '06f9b005-0ff8-4f07-a380-a10164d90b39', '{MetaMask Notification}', '2023-11-02 03:20:24', '0');
INSERT INTO `keylog_history` VALUES ('890', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:18:55', '0');
INSERT INTO `keylog_history` VALUES ('891', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:17:42', '0');
INSERT INTO `keylog_history` VALUES ('892', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:16:48', '0');
INSERT INTO `keylog_history` VALUES ('893', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:14:27', '0');
INSERT INTO `keylog_history` VALUES ('894', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 03:13:41', '0');
INSERT INTO `keylog_history` VALUES ('895', '5f81ef99-ae69-448e-865e-427f2bd6f9d8', '{192.168.145.8 - Remote Desktop Connection}', '2023-11-02 03:06:38', '0');
INSERT INTO `keylog_history` VALUES ('896', '5f81ef99-ae69-448e-865e-427f2bd6f9d8', '{Remote Desktop Connection}', '2023-11-02 03:06:13', '0');
INSERT INTO `keylog_history` VALUES ('897', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 03:04:33', '0');
INSERT INTO `keylog_history` VALUES ('898', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 03:04:14', '0');
INSERT INTO `keylog_history` VALUES ('899', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:59:16', '0');
INSERT INTO `keylog_history` VALUES ('900', '5c5e3669-f43b-404d-994a-160d795c17cb', '{Addharcard.pdf and 4 more pages - Personal - Microsoft? Edge}', '2023-11-02 02:59:12', '0');
INSERT INTO `keylog_history` VALUES ('901', '4f6894f6-1413-4a10-9bd7-b47686c8dbc6', '{transfer wallet issue ? cloud-poker/backend@32284d5 - Google Ch', '2023-11-02 02:59:06', '0');
INSERT INTO `keylog_history` VALUES ('902', '5c5e3669-f43b-404d-994a-160d795c17cb', '{Addharcard.pdf and 4 more pages - Personal - Microsoft? Edge}', '2023-11-02 02:59:05', '0');
INSERT INTO `keylog_history` VALUES ('903', '5c5e3669-f43b-404d-994a-160d795c17cb', '{Addharcard.pdf and 4 more pages - Personal - Microsoft? Edge}', '2023-11-02 02:58:49', '0');
INSERT INTO `keylog_history` VALUES ('904', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 02:58:37', '0');
INSERT INTO `keylog_history` VALUES ('905', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:56:57', '0');
INSERT INTO `keylog_history` VALUES ('906', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:54:57', '0');
INSERT INTO `keylog_history` VALUES ('907', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:54:22', '0');
INSERT INTO `keylog_history` VALUES ('908', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:53:46', '0');
INSERT INTO `keylog_history` VALUES ('909', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:53:30', '0');
INSERT INTO `keylog_history` VALUES ('910', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:50:48', '0');
INSERT INTO `keylog_history` VALUES ('911', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:49:19', '0');
INSERT INTO `keylog_history` VALUES ('912', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:49:04', '0');
INSERT INTO `keylog_history` VALUES ('913', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:48:00', '0');
INSERT INTO `keylog_history` VALUES ('914', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Ghost}', '2023-11-02 02:46:15', '0');
INSERT INTO `keylog_history` VALUES ('915', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:45:49', '0');
INSERT INTO `keylog_history` VALUES ('916', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:43:36', '0');
INSERT INTO `keylog_history` VALUES ('917', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:36:20', '0');
INSERT INTO `keylog_history` VALUES ('918', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:34:54', '0');
INSERT INTO `keylog_history` VALUES ('919', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:28:50', '0');
INSERT INTO `keylog_history` VALUES ('920', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:28:29', '0');
INSERT INTO `keylog_history` VALUES ('921', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:26:31', '0');
INSERT INTO `keylog_history` VALUES ('922', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:25:12', '0');
INSERT INTO `keylog_history` VALUES ('923', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Ghost}', '2023-11-02 02:21:35', '0');
INSERT INTO `keylog_history` VALUES ('924', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 02:21:23', '0');
INSERT INTO `keylog_history` VALUES ('925', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:16:00', '0');
INSERT INTO `keylog_history` VALUES ('926', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:14:30', '0');
INSERT INTO `keylog_history` VALUES ('927', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:14:01', '0');
INSERT INTO `keylog_history` VALUES ('928', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:13:32', '0');
INSERT INTO `keylog_history` VALUES ('929', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:13:22', '0');
INSERT INTO `keylog_history` VALUES ('930', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:12:32', '0');
INSERT INTO `keylog_history` VALUES ('931', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:07:56', '0');
INSERT INTO `keylog_history` VALUES ('932', '06f9b005-0ff8-4f07-a380-a10164d90b39', '{Usage | WalletConnect Docs - Google Chrome}', '2023-11-02 02:07:16', '0');
INSERT INTO `keylog_history` VALUES ('933', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Ghost}', '2023-11-02 02:06:31', '0');
INSERT INTO `keylog_history` VALUES ('934', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:06:13', '0');
INSERT INTO `keylog_history` VALUES ('935', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:06:01', '0');
INSERT INTO `keylog_history` VALUES ('936', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:05:30', '0');
INSERT INTO `keylog_history` VALUES ('937', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Ghost}', '2023-11-02 02:05:25', '0');
INSERT INTO `keylog_history` VALUES ('938', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:04:30', '0');
INSERT INTO `keylog_history` VALUES ('939', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Ghost}', '2023-11-02 02:04:23', '0');
INSERT INTO `keylog_history` VALUES ('940', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{v_ecin_planning_physicalcard @cm.CSV_IMPORT (38.180.34.4) - Vie', '2023-11-02 02:03:03', '0');
INSERT INTO `keylog_history` VALUES ('941', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:03:03', '0');
INSERT INTO `keylog_history` VALUES ('942', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:02:52', '0');
INSERT INTO `keylog_history` VALUES ('943', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:02:21', '0');
INSERT INTO `keylog_history` VALUES ('944', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:02:00', '0');
INSERT INTO `keylog_history` VALUES ('945', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:01:47', '0');
INSERT INTO `keylog_history` VALUES ('946', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:01:08', '0');
INSERT INTO `keylog_history` VALUES ('947', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 02:00:00', '0');
INSERT INTO `keylog_history` VALUES ('948', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:58:14', '0');
INSERT INTO `keylog_history` VALUES ('949', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:57:18', '0');
INSERT INTO `keylog_history` VALUES ('950', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:53:20', '0');
INSERT INTO `keylog_history` VALUES ('951', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:48:10', '0');
INSERT INTO `keylog_history` VALUES ('952', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:48:00', '0');
INSERT INTO `keylog_history` VALUES ('953', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:47:43', '0');
INSERT INTO `keylog_history` VALUES ('954', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:47:25', '0');
INSERT INTO `keylog_history` VALUES ('955', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:47:09', '0');
INSERT INTO `keylog_history` VALUES ('956', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:46:32', '0');
INSERT INTO `keylog_history` VALUES ('957', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:46:14', '0');
INSERT INTO `keylog_history` VALUES ('958', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:45:40', '0');
INSERT INTO `keylog_history` VALUES ('959', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:45:26', '0');
INSERT INTO `keylog_history` VALUES ('960', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:45:14', '0');
INSERT INTO `keylog_history` VALUES ('961', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:45:00', '0');
INSERT INTO `keylog_history` VALUES ('962', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:44:51', '0');
INSERT INTO `keylog_history` VALUES ('963', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:44:32', '0');
INSERT INTO `keylog_history` VALUES ('964', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:44:22', '0');
INSERT INTO `keylog_history` VALUES ('965', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:44:02', '0');
INSERT INTO `keylog_history` VALUES ('966', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:43:53', '0');
INSERT INTO `keylog_history` VALUES ('967', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:43:35', '0');
INSERT INTO `keylog_history` VALUES ('968', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:43:22', '0');
INSERT INTO `keylog_history` VALUES ('969', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:43:05', '0');
INSERT INTO `keylog_history` VALUES ('970', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:42:58', '0');
INSERT INTO `keylog_history` VALUES ('971', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 01:41:31', '0');
INSERT INTO `keylog_history` VALUES ('972', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:39:58', '0');
INSERT INTO `keylog_history` VALUES ('973', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:35:47', '0');
INSERT INTO `keylog_history` VALUES ('974', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:26:47', '0');
INSERT INTO `keylog_history` VALUES ('975', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:24:49', '0');
INSERT INTO `keylog_history` VALUES ('976', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:24:22', '0');
INSERT INTO `keylog_history` VALUES ('977', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:23:05', '0');
INSERT INTO `keylog_history` VALUES ('978', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:21:41', '0');
INSERT INTO `keylog_history` VALUES ('979', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:21:36', '0');
INSERT INTO `keylog_history` VALUES ('980', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 01:21:05', '0');
INSERT INTO `keylog_history` VALUES ('981', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:20:44', '0');
INSERT INTO `keylog_history` VALUES ('982', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 01:20:37', '0');
INSERT INTO `keylog_history` VALUES ('983', '06f9b005-0ff8-4f07-a380-a10164d90b39', '{Resources | WalletConnect Docs - Google Chrome}', '2023-11-02 01:20:31', '0');
INSERT INTO `keylog_history` VALUES ('984', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 01:20:25', '0');
INSERT INTO `keylog_history` VALUES ('985', '06f9b005-0ff8-4f07-a380-a10164d90b39', '{Theming | WalletConnect Docs - Google Chrome}', '2023-11-02 01:19:11', '0');
INSERT INTO `keylog_history` VALUES ('986', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 01:18:08', '0');
INSERT INTO `keylog_history` VALUES ('987', '5e3eb083-b452-4f41-b506-85f439ebfccb', '{1 570 330 661 - AnyDesk}', '2023-11-02 01:16:58', '0');
INSERT INTO `keylog_history` VALUES ('988', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:15:36', '0');
INSERT INTO `keylog_history` VALUES ('989', '5e3eb083-b452-4f41-b506-85f439ebfccb', '{1 570 330 661 - AnyDesk}', '2023-11-02 01:15:03', '0');
INSERT INTO `keylog_history` VALUES ('990', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 01:14:41', '0');
INSERT INTO `keylog_history` VALUES ('991', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 01:14:05', '0');
INSERT INTO `keylog_history` VALUES ('992', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 01:11:36', '0');
INSERT INTO `keylog_history` VALUES ('993', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{38.180.34.4 - Remote Desktop Connection}', '2023-11-02 01:11:33', '0');
INSERT INTO `keylog_history` VALUES ('994', '705acdf2-4231-424d-80da-3dba8e645930', '{AnyDesk}', '2023-11-02 01:11:07', '0');
INSERT INTO `keylog_history` VALUES ('995', '5e3eb083-b452-4f41-b506-85f439ebfccb', '{1 570 330 661 - AnyDesk}', '2023-11-02 01:10:44', '0');
INSERT INTO `keylog_history` VALUES ('996', '5e3eb083-b452-4f41-b506-85f439ebfccb', '{1 570 330 661 - AnyDesk}', '2023-11-02 01:10:28', '0');
INSERT INTO `keylog_history` VALUES ('997', 'a35ef399-726d-4593-a1a0-3ae444c9c893', '{Remote Desktop Connection}', '2023-11-02 01:09:53', '0');
INSERT INTO `keylog_history` VALUES ('998', '705acdf2-4231-424d-80da-3dba8e645930', '{AnyDesk}', '2023-11-02 01:09:21', '0');
INSERT INTO `keylog_history` VALUES ('999', '5e3eb083-b452-4f41-b506-85f439ebfccb', '{1 570 330 661 - AnyDesk}', '2023-11-02 01:07:47', '0');
INSERT INTO `keylog_history` VALUES ('1000', '5e3eb083-b452-4f41-b506-85f439ebfccb', '{1 570 330 661 - AnyDesk}', '2023-11-02 01:06:48', '0');
INSERT INTO `keylog_history` VALUES ('1001', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 01:05:34', '0');
INSERT INTO `keylog_history` VALUES ('1002', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 01:04:21', '0');
INSERT INTO `keylog_history` VALUES ('1003', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 01:03:18', '0');
INSERT INTO `keylog_history` VALUES ('1004', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 01:01:07', '0');
INSERT INTO `keylog_history` VALUES ('1005', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:59:25', '0');
INSERT INTO `keylog_history` VALUES ('1006', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:58:49', '0');
INSERT INTO `keylog_history` VALUES ('1007', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:58:44', '0');
INSERT INTO `keylog_history` VALUES ('1008', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:57:23', '0');
INSERT INTO `keylog_history` VALUES ('1009', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:55:53', '0');
INSERT INTO `keylog_history` VALUES ('1010', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:55:06', '0');
INSERT INTO `keylog_history` VALUES ('1011', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:53:46', '0');
INSERT INTO `keylog_history` VALUES ('1012', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:53:44', '0');
INSERT INTO `keylog_history` VALUES ('1013', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:52:25', '0');
INSERT INTO `keylog_history` VALUES ('1014', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:52:02', '0');
INSERT INTO `keylog_history` VALUES ('1015', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 00:51:44', '0');
INSERT INTO `keylog_history` VALUES ('1016', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:49:25', '0');
INSERT INTO `keylog_history` VALUES ('1017', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:48:41', '0');
INSERT INTO `keylog_history` VALUES ('1018', '78874fd3-abb4-416d-aaf7-45f5a57f1a4b', '{Redis for Windows alternative, In-Memory Datastore | Memurai - ', '2023-11-02 00:47:55', '0');
INSERT INTO `keylog_history` VALUES ('1019', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:47:54', '0');
INSERT INTO `keylog_history` VALUES ('1020', '78874fd3-abb4-416d-aaf7-45f5a57f1a4b', '{Redis for Windows alternative, In-Memory Datastore | Memurai - ', '2023-11-02 00:47:42', '0');
INSERT INTO `keylog_history` VALUES ('1021', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:47:10', '0');
INSERT INTO `keylog_history` VALUES ('1022', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:46:00', '0');
INSERT INTO `keylog_history` VALUES ('1023', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', '{195.201.205.242:7777 - Remote Desktop Connection}', '2023-11-02 00:45:18', '0');
INSERT INTO `keylog_history` VALUES ('1024', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:45:17', '0');
INSERT INTO `keylog_history` VALUES ('1025', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:43:00', '0');
INSERT INTO `keylog_history` VALUES ('1026', '705acdf2-4231-424d-80da-3dba8e645930', '{1 089 079 309 - AnyDesk}', '2023-11-02 00:42:09', '0');
INSERT INTO `keylog_history` VALUES ('1027', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-02 00:40:28', '0');
INSERT INTO `keylog_history` VALUES ('1028', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Ghost}', '2023-11-02 00:40:07', '0');
INSERT INTO `keylog_history` VALUES ('1029', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 00:37:25', '0');
INSERT INTO `keylog_history` VALUES ('1030', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 00:36:55', '0');
INSERT INTO `keylog_history` VALUES ('1031', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 00:36:53', '0');
INSERT INTO `keylog_history` VALUES ('1032', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 00:36:39', '0');
INSERT INTO `keylog_history` VALUES ('1033', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 00:36:31', '0');
INSERT INTO `keylog_history` VALUES ('1034', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 00:36:17', '0');
INSERT INTO `keylog_history` VALUES ('1035', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:34:06', '0');
INSERT INTO `keylog_history` VALUES ('1036', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-02 00:31:39', '0');
INSERT INTO `keylog_history` VALUES ('1037', '06f9b005-0ff8-4f07-a380-a10164d90b39', '{MetaMask Notification}', '2023-11-02 00:30:56', '0');
INSERT INTO `keylog_history` VALUES ('1038', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 00:29:58', '0');
INSERT INTO `keylog_history` VALUES ('1039', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-02 00:29:14', '0');
INSERT INTO `keylog_history` VALUES ('1040', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', '{CZ - 1 650 277 907 - AnyDesk}', '2023-11-02 00:29:05', '0');
INSERT INTO `keylog_history` VALUES ('1041', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-02 00:27:33', '0');
INSERT INTO `keylog_history` VALUES ('1042', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:25:30', '0');
INSERT INTO `keylog_history` VALUES ('1043', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-02 00:24:13', '0');
INSERT INTO `keylog_history` VALUES ('1044', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-02 00:23:33', '0');
INSERT INTO `keylog_history` VALUES ('1045', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-02 00:21:26', '0');
INSERT INTO `keylog_history` VALUES ('1046', '5c5e3669-f43b-404d-994a-160d795c17cb', '{RajniAadharcard.pdf - Personal - Microsoft? Edge}', '2023-11-02 00:21:21', '0');
INSERT INTO `keylog_history` VALUES ('1047', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-02 00:06:53', '0');
INSERT INTO `keylog_history` VALUES ('1048', '276d8427-abc0-490a-82cf-a591f6448a0d', '{Pokemon_Card_Grade.mp4 - Google Drive - Google Chrome}', '2023-11-02 00:04:47', '0');
INSERT INTO `keylog_history` VALUES ('1049', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:59:43', '0');
INSERT INTO `keylog_history` VALUES ('1050', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:58:30', '0');
INSERT INTO `keylog_history` VALUES ('1051', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:56:23', '0');
INSERT INTO `keylog_history` VALUES ('1052', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:55:26', '0');
INSERT INTO `keylog_history` VALUES ('1053', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-01 23:54:54', '0');
INSERT INTO `keylog_history` VALUES ('1054', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:54:53', '0');
INSERT INTO `keylog_history` VALUES ('1055', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:54:06', '0');
INSERT INTO `keylog_history` VALUES ('1056', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-01 23:52:07', '0');
INSERT INTO `keylog_history` VALUES ('1057', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:50:54', '0');
INSERT INTO `keylog_history` VALUES ('1058', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:50:43', '0');
INSERT INTO `keylog_history` VALUES ('1059', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:50:19', '0');
INSERT INTO `keylog_history` VALUES ('1060', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:49:48', '0');
INSERT INTO `keylog_history` VALUES ('1061', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:49:31', '0');
INSERT INTO `keylog_history` VALUES ('1062', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:48:58', '0');
INSERT INTO `keylog_history` VALUES ('1063', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-01 23:44:19', '0');
INSERT INTO `keylog_history` VALUES ('1064', '5c5e3669-f43b-404d-994a-160d795c17cb', '{Corporate Gift Cards ', '2023-11-01 23:41:32', '0');
INSERT INTO `keylog_history` VALUES ('1065', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:38:52', '0');
INSERT INTO `keylog_history` VALUES ('1066', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-01 23:38:37', '0');
INSERT INTO `keylog_history` VALUES ('1067', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 23:38:06', '0');
INSERT INTO `keylog_history` VALUES ('1068', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 23:37:54', '0');
INSERT INTO `keylog_history` VALUES ('1069', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-01 23:37:24', '0');
INSERT INTO `keylog_history` VALUES ('1070', '276d8427-abc0-490a-82cf-a591f6448a0d', '{Pokemon_Card_Grade.mp4 - Google Drive - Google Chrome}', '2023-11-01 23:36:41', '0');
INSERT INTO `keylog_history` VALUES ('1071', '276d8427-abc0-490a-82cf-a591f6448a0d', '{Pokemon_Card_Grade.mp4 - Google Drive - Google Chrome}', '2023-11-01 23:36:32', '0');
INSERT INTO `keylog_history` VALUES ('1072', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-01 23:36:21', '0');
INSERT INTO `keylog_history` VALUES ('1073', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', '{1 416 237 716 - AnyDesk}', '2023-11-01 23:34:22', '0');
INSERT INTO `keylog_history` VALUES ('1074', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-01 23:33:59', '0');
INSERT INTO `keylog_history` VALUES ('1075', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 23:24:51', '0');
INSERT INTO `keylog_history` VALUES ('1076', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 23:24:29', '0');
INSERT INTO `keylog_history` VALUES ('1077', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-01 23:24:04', '0');
INSERT INTO `keylog_history` VALUES ('1078', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{LDPlayer}', '2023-11-01 23:19:49', '0');
INSERT INTO `keylog_history` VALUES ('1079', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-01 23:15:01', '0');
INSERT INTO `keylog_history` VALUES ('1080', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 23:12:08', '0');
INSERT INTO `keylog_history` VALUES ('1081', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 23:11:24', '0');
INSERT INTO `keylog_history` VALUES ('1082', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{173.232.146.15 - Remote Desktop Connection}', '2023-11-01 23:09:29', '0');
INSERT INTO `keylog_history` VALUES ('1083', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{AnyDesk}', '2023-11-01 23:08:37', '0');
INSERT INTO `keylog_history` VALUES ('1084', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{1 035 673 359 - AnyDesk}', '2023-11-01 23:01:07', '0');
INSERT INTO `keylog_history` VALUES ('1085', 'bc163ea0-beb8-4979-8011-2f7c448a059b', '{10.58.17.4 - Remote Desktop Connection}', '2023-11-01 22:43:38', '0');
INSERT INTO `keylog_history` VALUES ('1086', 'bc163ea0-beb8-4979-8011-2f7c448a059b', '{10.58.17.4 - Remote Desktop Connection}', '2023-11-01 22:42:20', '0');
INSERT INTO `keylog_history` VALUES ('1087', 'bc163ea0-beb8-4979-8011-2f7c448a059b', '{10.58.17.4 - Remote Desktop Connection}', '2023-11-01 22:36:14', '0');
INSERT INTO `keylog_history` VALUES ('1088', 'd7ad44aa-eb21-4a8e-84c2-34772a3a1962', '{MEmu}', '2023-11-01 22:28:51', '0');
INSERT INTO `keylog_history` VALUES ('1089', 'd7ad44aa-eb21-4a8e-84c2-34772a3a1962', '{MEmu}', '2023-11-01 22:27:33', '0');
INSERT INTO `keylog_history` VALUES ('1090', '64225566-3bd2-4e98-87e7-669cd9bcffa5', '{192.168.144.235 - Remote Desktop Connection}', '2023-11-01 22:27:02', '0');
INSERT INTO `keylog_history` VALUES ('1091', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 22:13:13', '0');
INSERT INTO `keylog_history` VALUES ('1092', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 22:13:11', '0');
INSERT INTO `keylog_history` VALUES ('1093', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-01 22:08:37', '0');
INSERT INTO `keylog_history` VALUES ('1094', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-01 22:08:34', '0');
INSERT INTO `keylog_history` VALUES ('1095', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Remote Desktop Connection}', '2023-11-01 22:04:25', '0');
INSERT INTO `keylog_history` VALUES ('1096', '81800360-aa65-424e-9a2f-cc5829e8dd27', '{64.235.35.180 - Remote Desktop Connection}', '2023-11-01 21:54:58', '0');
INSERT INTO `keylog_history` VALUES ('1097', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Ghost}', '2023-11-01 21:54:03', '0');
INSERT INTO `keylog_history` VALUES ('1098', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 21:46:50', '0');
INSERT INTO `keylog_history` VALUES ('1099', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 21:46:47', '0');
INSERT INTO `keylog_history` VALUES ('1100', '2c84958e-37c4-4a20-95ff-ee5b5a76116f', '{CardAuthorization.yaml - Funtions2API - Visual Studio Code}', '2023-11-01 21:31:15', '0');
INSERT INTO `keylog_history` VALUES ('1101', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-01 21:23:36', '0');
INSERT INTO `keylog_history` VALUES ('1102', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-01 20:54:47', '0');
INSERT INTO `keylog_history` VALUES ('1103', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-01 20:53:55', '0');
INSERT INTO `keylog_history` VALUES ('1104', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', '{1 906 959 141 - AnyDesk}', '2023-11-01 20:49:53', '0');
INSERT INTO `keylog_history` VALUES ('1105', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-01 20:39:40', '0');
INSERT INTO `keylog_history` VALUES ('1106', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{170.130.165.174 - Remote Desktop Connection}', '2023-11-01 20:23:18', '0');
INSERT INTO `keylog_history` VALUES ('1107', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{LDPlayer}', '2023-11-01 20:21:27', '0');
INSERT INTO `keylog_history` VALUES ('1108', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 20:18:32', '0');
INSERT INTO `keylog_history` VALUES ('1109', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 20:17:40', '0');
INSERT INTO `keylog_history` VALUES ('1110', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 20:17:40', '0');
INSERT INTO `keylog_history` VALUES ('1111', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 20:17:19', '0');
INSERT INTO `keylog_history` VALUES ('1112', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Welcome]}', '2023-11-01 20:17:16', '0');
INSERT INTO `keylog_history` VALUES ('1113', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager - Do You Want to Restore the Last Opened', '2023-11-01 20:17:16', '0');
INSERT INTO `keylog_history` VALUES ('1114', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{170.130.165.174 - Remote Desktop Connection}', '2023-11-01 20:07:40', '0');
INSERT INTO `keylog_history` VALUES ('1115', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{170.130.165.174 - Remote Desktop Connection}', '2023-11-01 19:59:39', '0');
INSERT INTO `keylog_history` VALUES ('1116', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{170.130.165.174 - Remote Desktop Connection}', '2023-11-01 19:59:11', '0');
INSERT INTO `keylog_history` VALUES ('1117', '5dcad717-8d60-4002-8951-02b4aab74465', '{LDPlayer}', '2023-11-01 19:58:48', '0');
INSERT INTO `keylog_history` VALUES ('1118', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{170.130.165.174 - Remote Desktop Connection}', '2023-11-01 19:52:51', '0');
INSERT INTO `keylog_history` VALUES ('1119', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{Remote Desktop Connection}', '2023-11-01 19:46:18', '0');
INSERT INTO `keylog_history` VALUES ('1120', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:46:14', '0');
INSERT INTO `keylog_history` VALUES ('1121', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:46:13', '0');
INSERT INTO `keylog_history` VALUES ('1122', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 19:46:13', '0');
INSERT INTO `keylog_history` VALUES ('1123', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 19:46:12', '0');
INSERT INTO `keylog_history` VALUES ('1124', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:46:06', '0');
INSERT INTO `keylog_history` VALUES ('1125', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{170.130.165.174 - Remote Desktop Connection}', '2023-11-01 19:46:03', '0');
INSERT INTO `keylog_history` VALUES ('1126', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{175.45.182.177 - Remote Desktop Connection}', '2023-11-01 19:45:56', '0');
INSERT INTO `keylog_history` VALUES ('1127', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', '{Chrome Remote Desktop - Trent}', '2023-11-01 19:45:40', '0');
INSERT INTO `keylog_history` VALUES ('1128', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{175.45.182.177 - Remote Desktop Connection}', '2023-11-01 19:44:43', '0');
INSERT INTO `keylog_history` VALUES ('1129', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 19:43:36', '0');
INSERT INTO `keylog_history` VALUES ('1130', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 19:43:35', '0');
INSERT INTO `keylog_history` VALUES ('1131', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 19:43:11', '0');
INSERT INTO `keylog_history` VALUES ('1132', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{170.130.165.174 - Remote Desktop Connection}', '2023-11-01 19:42:14', '0');
INSERT INTO `keylog_history` VALUES ('1133', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', '{Remote Desktop Connection}', '2023-11-01 19:41:20', '0');
INSERT INTO `keylog_history` VALUES ('1134', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:40:59', '0');
INSERT INTO `keylog_history` VALUES ('1135', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 19:40:27', '0');
INSERT INTO `keylog_history` VALUES ('1136', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 19:40:26', '0');
INSERT INTO `keylog_history` VALUES ('1137', '5dcad717-8d60-4002-8951-02b4aab74465', '{192.168.146.167 - Remote Desktop Connection}', '2023-11-01 19:40:26', '0');
INSERT INTO `keylog_history` VALUES ('1138', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 19:40:18', '0');
INSERT INTO `keylog_history` VALUES ('1139', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 19:39:43', '0');
INSERT INTO `keylog_history` VALUES ('1140', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [170.130.165.181]}', '2023-11-01 19:39:29', '0');
INSERT INTO `keylog_history` VALUES ('1141', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:39:29', '0');
INSERT INTO `keylog_history` VALUES ('1142', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:39:24', '0');
INSERT INTO `keylog_history` VALUES ('1143', '5dcad717-8d60-4002-8951-02b4aab74465', '{192.168.146.167 - Remote Desktop Connection}', '2023-11-01 19:39:23', '0');
INSERT INTO `keylog_history` VALUES ('1144', '5dcad717-8d60-4002-8951-02b4aab74465', '{192.168.146.167 - Remote Desktop Connection}', '2023-11-01 19:38:08', '0');
INSERT INTO `keylog_history` VALUES ('1145', '5dcad717-8d60-4002-8951-02b4aab74465', '{192.168.146.167 - Remote Desktop Connection}', '2023-11-01 19:37:00', '0');
INSERT INTO `keylog_history` VALUES ('1146', '5dcad717-8d60-4002-8951-02b4aab74465', '{192.168.146.167 - Remote Desktop Connection}', '2023-11-01 19:34:33', '0');
INSERT INTO `keylog_history` VALUES ('1147', '5dcad717-8d60-4002-8951-02b4aab74465', '{192.168.146.167 - Remote Desktop Connection}', '2023-11-01 19:33:56', '0');
INSERT INTO `keylog_history` VALUES ('1148', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Connection}', '2023-11-01 19:33:54', '0');
INSERT INTO `keylog_history` VALUES ('1149', '5dcad717-8d60-4002-8951-02b4aab74465', '{192.168.146.167 - Remote Desktop Connection}', '2023-11-01 19:33:46', '0');
INSERT INTO `keylog_history` VALUES ('1150', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Connection}', '2023-11-01 19:33:40', '0');
INSERT INTO `keylog_history` VALUES ('1151', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Connection}', '2023-11-01 19:33:19', '0');
INSERT INTO `keylog_history` VALUES ('1152', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:28:17', '0');
INSERT INTO `keylog_history` VALUES ('1153', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:27:14', '0');
INSERT INTO `keylog_history` VALUES ('1154', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:24:02', '0');
INSERT INTO `keylog_history` VALUES ('1155', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:23:33', '0');
INSERT INTO `keylog_history` VALUES ('1156', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:21:08', '0');
INSERT INTO `keylog_history` VALUES ('1157', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:19:16', '0');
INSERT INTO `keylog_history` VALUES ('1158', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:19:14', '0');
INSERT INTO `keylog_history` VALUES ('1159', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:18:23', '0');
INSERT INTO `keylog_history` VALUES ('1160', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:18:23', '0');
INSERT INTO `keylog_history` VALUES ('1161', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:18:05', '0');
INSERT INTO `keylog_history` VALUES ('1162', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:16:30', '0');
INSERT INTO `keylog_history` VALUES ('1163', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:15:52', '0');
INSERT INTO `keylog_history` VALUES ('1164', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Manager [Syed]}', '2023-11-01 19:14:37', '0');
INSERT INTO `keylog_history` VALUES ('1165', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 18:56:16', '0');
INSERT INTO `keylog_history` VALUES ('1166', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 18:55:56', '0');
INSERT INTO `keylog_history` VALUES ('1167', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 18:55:04', '0');
INSERT INTO `keylog_history` VALUES ('1168', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 18:52:43', '0');
INSERT INTO `keylog_history` VALUES ('1169', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 18:52:43', '0');
INSERT INTO `keylog_history` VALUES ('1170', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 18:00:41', '0');
INSERT INTO `keylog_history` VALUES ('1171', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 18:00:29', '0');
INSERT INTO `keylog_history` VALUES ('1172', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 17:40:16', '0');
INSERT INTO `keylog_history` VALUES ('1173', '5dcad717-8d60-4002-8951-02b4aab74465', '{Remote Desktop Software for Windows ? AnyDesk - Google Chrome}', '2023-11-01 17:34:36', '0');
INSERT INTO `keylog_history` VALUES ('1174', '07c2b799-7ec0-49b6-a641-714ade0f284e', '{NoxPlayer}', '2023-11-01 17:16:42', '0');
INSERT INTO `keylog_history` VALUES ('1175', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 16:06:46', '0');
INSERT INTO `keylog_history` VALUES ('1176', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram (1)}', '2023-11-01 16:06:43', '0');
INSERT INTO `keylog_history` VALUES ('1177', '5dcad717-8d60-4002-8951-02b4aab74465', '{MetaMask Flask DEVELOPMENT BUILD - Chrome Web Store - Google Ch', '2023-11-01 15:36:39', '0');
INSERT INTO `keylog_history` VALUES ('1178', '5dcad717-8d60-4002-8951-02b4aab74465', '{MetaMask Notification}', '2023-11-01 15:31:34', '0');
INSERT INTO `keylog_history` VALUES ('1179', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram_XtNVMoZKS0.png ?- Photos}', '2023-11-01 15:01:26', '0');
INSERT INTO `keylog_history` VALUES ('1180', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 14:25:55', '0');
INSERT INTO `keylog_history` VALUES ('1181', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 14:25:29', '0');
INSERT INTO `keylog_history` VALUES ('1182', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 14:24:30', '0');
INSERT INTO `keylog_history` VALUES ('1183', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 13:12:52', '0');
INSERT INTO `keylog_history` VALUES ('1184', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 13:08:16', '0');
INSERT INTO `keylog_history` VALUES ('1185', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{TelegramDesktop}', '2023-11-01 13:08:14', '0');
INSERT INTO `keylog_history` VALUES ('1186', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 13:07:03', '0');
INSERT INTO `keylog_history` VALUES ('1187', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 13:02:51', '0');
INSERT INTO `keylog_history` VALUES ('1188', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 12:29:43', '0');
INSERT INTO `keylog_history` VALUES ('1189', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 12:29:12', '0');
INSERT INTO `keylog_history` VALUES ('1190', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 12:28:50', '0');
INSERT INTO `keylog_history` VALUES ('1191', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 12:27:32', '0');
INSERT INTO `keylog_history` VALUES ('1192', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '{AnyDesk}', '2023-11-01 12:21:40', '0');
INSERT INTO `keylog_history` VALUES ('1193', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 12:08:44', '0');
INSERT INTO `keylog_history` VALUES ('1194', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', '{Telegram}', '2023-11-01 12:04:32', '0');
INSERT INTO `keylog_history` VALUES ('1195', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', 'Anydesk', '2024-01-15 04:26:41', '0');
INSERT INTO `keylog_history` VALUES ('1196', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', 'Anydesk', '2024-01-15 04:26:48', '0');

-- ----------------------------
-- Table structure for keylog_messages
-- ----------------------------
DROP TABLE IF EXISTS `keylog_messages`;
CREATE TABLE `keylog_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) DEFAULT NULL,
  `message` varchar(256) DEFAULT '',
  `last_updated_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `read` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=649 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of keylog_messages
-- ----------------------------
INSERT INTO `keylog_messages` VALUES ('642', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', 'Anydesk', '2024-02-15 04:26:54', '0');
INSERT INTO `keylog_messages` VALUES ('643', '07c2b799-7ec0-49b6-a641-714ade0f284e', 'Black', '2024-02-15 12:44:35', '0');
INSERT INTO `keylog_messages` VALUES ('644', '07c2b799-7ec0-49b6-a641-714ade0f284e', 'White', '2024-02-15 12:45:08', '0');
INSERT INTO `keylog_messages` VALUES ('645', '07c2b799-7ec0-49b6-a641-714ade0f284e', 'Test Message', '2024-02-15 12:45:47', '0');
INSERT INTO `keylog_messages` VALUES ('646', '07c2b799-7ec0-49b6-a641-714ade0f284e', 'Test Message', '2024-02-15 14:08:10', '0');
INSERT INTO `keylog_messages` VALUES ('647', '07c2b799-7ec0-49b6-a641-714ade0f284e', 'Test Message', '2024-02-15 16:00:23', '0');
INSERT INTO `keylog_messages` VALUES ('648', '07c2b799-7ec0-49b6-a641-714ade0f284e', 'Test Message', '2024-02-15 16:00:24', '0');

-- ----------------------------
-- Table structure for messages_bots
-- ----------------------------
DROP TABLE IF EXISTS `messages_bots`;
CREATE TABLE `messages_bots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) DEFAULT NULL,
  `user` varchar(32) DEFAULT NULL,
  `lanip` varchar(64) DEFAULT '',
  `last_updated_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of messages_bots
-- ----------------------------
INSERT INTO `messages_bots` VALUES ('2', '1234-21345-345-234-234', 'Slava', '190.50.61.7', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('3', '9875459-30419-353-123fa434s-qwe123f54', 'Admin', 'Bond', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('5', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', 'Admin', 'Bond', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('14', '89ef43d1-75b7-41a9-850b-b34f5d65a742', 'wa', '192.168.148.192-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('19', 'd7ad44aa-eb21-4a8e-84c2-34772a3a1962', 'wa', 'Server1-192.168.148.192-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('20', '64225566-3bd2-4e98-87e7-669cd9bcffa5', 'admin', 'Server2-192.168.147.201-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('21', 'bc163ea0-beb8-4979-8011-2f7c448a059b', 'darren', 'Server2-Vps', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('27', 'fbaf6a97-fb07-4186-86e0-b9fc54cca64f', 'Administrator', 'Server3 - 192.168.146.179-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('28', '5dcad717-8d60-4002-8951-02b4aab74465', 'administrator', 'Server3 - 192.168.146.170-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('30', '1e8caeb4-1d04-4409-a27e-70a3cbcad348', 'administrator', 'Server3 - 192.168.146.167-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('31', 'a09fbbfb-ba25-42e0-8017-ac316caddfc9', 'administrator', 'Server1 - 192.168.147.77-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('32', '2c84958e-37c4-4a20-95ff-ee5b5a76116f', 'a', 'Server2 - India', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('33', '81800360-aa65-424e-9a2f-cc5829e8dd27', 'lava', 'Server2 - Abroad1', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('34', '87b6fe28-0e9c-41a9-bd5c-c21bd521e74f', 'administrator', 'Server2 - 192.168.147.29-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('36', '276d8427-abc0-490a-82cf-a591f6448a0d', 'kkaif', 'Server2-192.168.128.39-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('37', '22938bef-dca8-4eb6-9d39-8d77ddd70e0f', 'bzzard', 'Server2-192.168.3.46-C', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('39', '5c5e3669-f43b-404d-994a-160d795c17cb', 'SONY', 'Server2-WIFI lan', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('40', '6daee7d7-a581-4e06-a1a8-f69d35eaf58b', 'hope', 'Server-192.168.145.30-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('41', '06f9b005-0ff8-4f07-a380-a10164d90b39', '777', 'Server3-192.168.145.231-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('43', '705acdf2-4231-424d-80da-3dba8e645930', 'admin', 'Server1-192.168.147.95-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('44', 'd9d3a3bd-5f34-4abb-a6fb-e5826bbb698b', 'administrator', 'Server2-192.168.136.99-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('45', '78874fd3-abb4-416d-aaf7-45f5a57f1a4b', '1241891571583922', 'Server2-192.168.1.14-C', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('46', '5e3eb083-b452-4f41-b506-85f439ebfccb', 'komado', 'Server2-192.168.2.173-C', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('47', 'a35ef399-726d-4593-a1a0-3ae444c9c893', 's.w.r.t', 'Server3-192.168.148.157-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('48', '4f6894f6-1413-4a10-9bd7-b47686c8dbc6', 'websu', 'Server2-India', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('49', '5f81ef99-ae69-448e-865e-427f2bd6f9d8', 'administrator', 'Server2-192.168.148.202-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('50', 'c0c4ceef-dd32-4156-8c74-3e66863b849f', '111', 'Server2-192.168.2.97-C', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('51', '29fe64df-9987-4b4d-9c13-962a424e365e', 'janus', 'Server1-192.168.129.100-O', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('53', '7ae5639b-4a64-44ad-8305-4c2385c82a36', 'anmal', 'Server2-pakistan', '2024-02-15 11:48:50');
INSERT INTO `messages_bots` VALUES ('54', '07c2b799-7ec0-49b6-a641-714ade0f284e', 'GAMJA', '205-ip', '2024-02-15 16:00:24');

-- ----------------------------
-- Table structure for propertylist
-- ----------------------------
DROP TABLE IF EXISTS `propertylist`;
CREATE TABLE `propertylist` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `propertyname` varchar(64) DEFAULT '',
  `propertyvalue` varchar(64) DEFAULT '',
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of propertylist
-- ----------------------------
INSERT INTO `propertylist` VALUES ('1', 'enableDebug', 'true', '2024-01-30 18:05:18');

-- ----------------------------
-- Table structure for timetable
-- ----------------------------
DROP TABLE IF EXISTS `timetable`;
CREATE TABLE `timetable` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `updatedAt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of timetable
-- ----------------------------
INSERT INTO `timetable` VALUES ('3', '0');
INSERT INTO `timetable` VALUES ('4', '1707102669601');
INSERT INTO `timetable` VALUES ('5', '1707102713053');
INSERT INTO `timetable` VALUES ('6', '1707102767493');

-- ----------------------------
-- Table structure for unreads
-- ----------------------------
DROP TABLE IF EXISTS `unreads`;
CREATE TABLE `unreads` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) DEFAULT NULL,
  `keylogid` int(11) DEFAULT NULL,
  `userid` tinyint(1) DEFAULT NULL,
  `unread` tinyint(1) DEFAULT '2',
  `message` varchar(256) DEFAULT '',
  `last_updated_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1939 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of unreads
-- ----------------------------
INSERT INTO `unreads` VALUES ('1918', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '642', '1', '2', '', '0000-00-00 00:00:00');
INSERT INTO `unreads` VALUES ('1919', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '642', '2', '1', '', '0000-00-00 00:00:00');
INSERT INTO `unreads` VALUES ('1920', '68ec644a-4e2e-45e3-ae33-f88f9a7a0d8c', '642', '3', '1', '', '0000-00-00 00:00:00');
INSERT INTO `unreads` VALUES ('1921', '07c2b799-7ec0-49b6-a641-714ade0f284e', '643', '1', '2', null, '2024-02-15 12:44:35');
INSERT INTO `unreads` VALUES ('1922', '07c2b799-7ec0-49b6-a641-714ade0f284e', '643', '2', '2', null, '2024-02-15 12:44:35');
INSERT INTO `unreads` VALUES ('1924', '07c2b799-7ec0-49b6-a641-714ade0f284e', '644', '1', '2', null, '2024-02-15 12:45:08');
INSERT INTO `unreads` VALUES ('1925', '07c2b799-7ec0-49b6-a641-714ade0f284e', '644', '2', '2', null, '2024-02-15 12:45:08');
INSERT INTO `unreads` VALUES ('1927', '07c2b799-7ec0-49b6-a641-714ade0f284e', '645', '1', '2', 'Test Message', '2024-02-15 12:45:47');
INSERT INTO `unreads` VALUES ('1928', '07c2b799-7ec0-49b6-a641-714ade0f284e', '645', '2', '2', 'Test Message', '2024-02-15 12:45:47');
INSERT INTO `unreads` VALUES ('1930', '07c2b799-7ec0-49b6-a641-714ade0f284e', '646', '1', '2', 'Test Message', '2024-02-15 14:08:10');
INSERT INTO `unreads` VALUES ('1931', '07c2b799-7ec0-49b6-a641-714ade0f284e', '646', '2', '2', 'Test Message', '2024-02-15 14:08:10');
INSERT INTO `unreads` VALUES ('1933', '07c2b799-7ec0-49b6-a641-714ade0f284e', '647', '1', '2', 'Test Message', '2024-02-15 16:00:23');
INSERT INTO `unreads` VALUES ('1934', '07c2b799-7ec0-49b6-a641-714ade0f284e', '647', '2', '2', 'Test Message', '2024-02-15 16:00:23');
INSERT INTO `unreads` VALUES ('1935', '07c2b799-7ec0-49b6-a641-714ade0f284e', '647', '3', '1', 'Test Message', '2024-02-15 16:00:23');
INSERT INTO `unreads` VALUES ('1936', '07c2b799-7ec0-49b6-a641-714ade0f284e', '648', '1', '2', 'Test Message', '2024-02-15 16:00:24');
INSERT INTO `unreads` VALUES ('1937', '07c2b799-7ec0-49b6-a641-714ade0f284e', '648', '2', '2', 'Test Message', '2024-02-15 16:00:24');
INSERT INTO `unreads` VALUES ('1938', '07c2b799-7ec0-49b6-a641-714ade0f284e', '648', '3', '1', 'Test Message', '2024-02-15 16:00:24');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'vps4', '123123');
INSERT INTO `users` VALUES ('2', 'bond', '123');
INSERT INTO `users` VALUES ('3', 'nabob', '123');

-- ----------------------------
-- Table structure for walletlist
-- ----------------------------
DROP TABLE IF EXISTS `walletlist`;
CREATE TABLE `walletlist` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `privkey` varchar(128) DEFAULT NULL,
  `pubkey` varchar(128) DEFAULT NULL,
  `minimal` double DEFAULT '0',
  `dest` varchar(128) DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `network` varchar(16) DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `isAlive` tinyint(1) DEFAULT '1',
  `balance` varchar(256) DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of walletlist
-- ----------------------------
INSERT INTO `walletlist` VALUES ('3', '0b78f1a6d1f3a107c7edb80c34290b908ad3990f525a7d2f9fc8aefb125b1797', '0xf024366eDe3638A7f4D5d8B92cE93473A2B4b3a2', '12.34', '0x072831Acc4fac82C32533B7Df0A836f21F46F6b5', '2024-02-06 09:15:50', 'binance', 'exodus-r', '0', '');
INSERT INTO `walletlist` VALUES ('4', '0b78f1a6d1f3a107c7edb80c34290b908ad3990f525a7d2f9fc8aefb125b1797', '0xf024366eDe3638A7f4D5d8B92cE93473A2B4b3a2', '12.34', '0x072831Acc4fac82C32533B7Df0A836f21F46F6b5', '2024-02-06 09:15:50', 'ethereum', 'exodus-r', '0', '');
INSERT INTO `walletlist` VALUES ('5', 'D0C8993F2940EAC241996C13EF748C9AFC2CF3545F2AF7CAABE900C898CC273C', 'TB37oPEnHZdAhz4y42mwhGkQb4CfSwqjWq', '33.2', 'TUrHRLojVf4bfcdJFLekisjnLNnEXeznE7', '2024-02-06 09:21:57', 'tronnet', 'testuser', '1', '');
INSERT INTO `walletlist` VALUES ('6', '0b78f1a6d1f3a107c7edb80c34290b908ad3990f525a7d2f9fc8aefb125b1797', '0xf024366eDe3638A7f4D5d8B92cE93473A2B4b3a2', '232', '0x072831Acc4fac82C32533B7Df0A836f21F46F6b5', '2024-02-06 09:15:50', 'polygon', 'exodus-r', '0', '');
INSERT INTO `walletlist` VALUES ('10', 'D0C8993F2940EAC241996C13EF748C9AFC2CF3545F2AF7CAABE900C898CC273C', 'TB37oPEnHZdAhz4y42mwhGkQb4CfSwqjWq', '50', 'TGWXrUEh4ej4mq8hv14k4Kni2iFvwP4o76', '2024-02-06 10:29:48', 'nile', 'testuser', '0', '');
INSERT INTO `walletlist` VALUES ('14', '80428108532aa1bb5934b5fa4cc084b739ee33dd40172ff8ef0a89f475b0347d', '0xF1277E51eE7Db12B55209D84C64af436A857bEF7', '3560', '0x072831Acc4fac82C32533B7Df0A836f21F46F6b5', '2024-02-07 18:05:42', 'sepolia', 'hello.start', '0', '');
INSERT INTO `walletlist` VALUES ('15', 'e0bd264e740e672666c606b9d2bf6a6b767b3de4d5a919a3fe5ae20f508317e8', '0x072831Acc4fac82C32533B7Df0A836f21F46F6b5', '5550', '0xF1277E51eE7Db12B55209D84C64af436A857bEF7', '2024-02-08 07:55:07', 'sepolia', 'exodus-2', '0', '');
INSERT INTO `walletlist` VALUES ('16', '80428108532aa1bb5934b5fa4cc084b739ee33dd40172ff8ef0a89f475b0347d', '0xF1277E51eE7Db12B55209D84C64af436A857bEF7', '60', '0x072831Acc4fac82C32533B7Df0A836f21F46F6b5', '2024-02-08 06:39:31', 'bnbtest', 'testuser2', '1', '');
INSERT INTO `walletlist` VALUES ('17', '80428108532aa1bb5934b5fa4cc084b739ee33dd40172ff8ef0a89f475b0347d', '0xF1277E51eE7Db12B55209D84C64af436A857bEF7', '800', '0x072831Acc4fac82C32533B7Df0A836f21F46F6b5', '2024-02-08 04:49:03', 'scrollsepolia', 'hello.start', '0', '');
INSERT INTO `walletlist` VALUES ('29', 'e0bd264e740e672666c606b9d2bf6a6b767b3de4d5a919a3fe5ae20f508317e8', '0x072831Acc4fac82C32533B7Df0A836f21F46F6b5', '56456', '0xF1277E51eE7Db12B55209D84C64af436A857bEF7', '2024-02-08 07:55:07', 'sepolia', 'exodus-2', '1', '');
INSERT INTO `walletlist` VALUES ('32', 'e0bd264e740e672666c606b9d2bf6a6b767b3de4d5a919a3fe5ae20f508317e8', '0x072831Acc4fac82C32533B7Df0A836f21F46F6b5', '51515', '0xF1277E51eE7Db12B55209D84C64af436A857bEF7', '2024-02-08 07:55:07', 'ethereum', 'exodus-2', '1', '');
INSERT INTO `walletlist` VALUES ('33', 'e0bd264e740e672666c606b9d2bf6a6b767b3de4d5a919a3fe5ae20f508317e8', '0x072831Acc4fac82C32533B7Df0A836f21F46F6b5', '51515', '0xF1277E51eE7Db12B55209D84C64af436A857bEF7', '2024-02-08 07:55:07', 'polygon', 'exodus-2', '1', '');
INSERT INTO `walletlist` VALUES ('34', 'e0bd264e740e672666c606b9d2bf6a6b767b3de4d5a919a3fe5ae20f508317e8', '0x072831Acc4fac82C32533B7Df0A836f21F46F6b5', '51515', '0xF1277E51eE7Db12B55209D84C64af436A857bEF7', '2024-02-08 07:55:07', 'bitcoin', 'exodus-2', '1', '');

-- ----------------------------
-- Table structure for wallets
-- ----------------------------
DROP TABLE IF EXISTS `wallets`;
CREATE TABLE `wallets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(64) DEFAULT '',
  `type` varchar(16) DEFAULT '0',
  `label` varchar(64) DEFAULT '',
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wallets
-- ----------------------------
INSERT INTO `wallets` VALUES ('1', '0xf024366eDe3638A7f4D5d8B92cE93473A2B4b3a2', 'binance', 'gamja', '2024-02-15 14:05:08');

-- ----------------------------
-- Table structure for wallets0
-- ----------------------------
DROP TABLE IF EXISTS `wallets0`;
CREATE TABLE `wallets0` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(64) DEFAULT NULL,
  `network` varchar(16) DEFAULT NULL,
  `owner` varchar(32) DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `balance` double DEFAULT '0',
  `token1` double DEFAULT '0',
  `token2` double DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of wallets0
-- ----------------------------
INSERT INTO `wallets0` VALUES ('1', '00000000000000000000000', 'tronnet', 'washa', '2024-02-05 09:53:04', '219.14848423750556', '568.7324008726268', '590.2650525961171');
INSERT INTO `wallets0` VALUES ('2', '123123123123', 'tronnet', 'washika', '2024-02-05 09:53:07', '35.24363644255391', '334.24202270276925', '393.0581600025509');
INSERT INTO `wallets0` VALUES ('3', '05050505050505', 'ethereum', 'solvin', '2024-02-05 09:53:01', '62.43800040419334', '823.4870721213456', '797.2005688389281');
