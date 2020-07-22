/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : user

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2018-05-15 08:57:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminid` int(11) NOT NULL auto_increment,
  `adminname` varchar(255) NOT NULL,
  `adminpassword` varchar(255) NOT NULL,
  PRIMARY KEY  (`adminid`),
  UNIQUE KEY `adminname` (`adminname`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('26', 'admin', '123');
INSERT INTO `admin` VALUES ('2', 'admin2', '123');
INSERT INTO `admin` VALUES ('3', 'admin3', '1111');
INSERT INTO `admin` VALUES ('25', 'admin1', '111');
INSERT INTO `admin` VALUES ('23', '地方', '123');
INSERT INTO `admin` VALUES ('12', 'admin5', '123');
INSERT INTO `admin` VALUES ('13', 'admin6', '123');
INSERT INTO `admin` VALUES ('14', 'admin7', '123');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customerid` int(11) NOT NULL auto_increment,
  `customername` varchar(255) NOT NULL,
  `customerpassword` varchar(255) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  PRIMARY KEY  (`customerid`),
  UNIQUE KEY `customername` (`customername`),
  UNIQUE KEY `customername_2` (`customername`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('19', '小明', '123', '我的名字是？', '小明');
INSERT INTO `customer` VALUES ('17', '黄辉营', '123', '我的名字是？', '黄辉营');
INSERT INTO `customer` VALUES ('13', '潘志毅', '123', '我的名字是？', '潘志毅');
INSERT INTO `customer` VALUES ('32', '打卡机', '123', '我最喜欢的食物是？', '香蕉');
INSERT INTO `customer` VALUES ('33', '肯德基', '123', '我最喜欢的食物是？', '汉堡');
INSERT INTO `customer` VALUES ('16', '俞振霖', '123', '我的名字是？', '俞振霖');
INSERT INTO `customer` VALUES ('14', '李明华', '123', '我的名字是？', '李明华');
INSERT INTO `customer` VALUES ('15', '朱来川', '123', '我的名字是？', '潘志毅');
INSERT INTO `customer` VALUES ('22', '地方快乐老家', '123', '我最尊敬的人是？', '对的健康');
INSERT INTO `customer` VALUES ('37', 'user5', '123', '我最喜欢的食物是？', '芒果');
INSERT INTO `customer` VALUES ('38', '潘志毅1', '123', '我最喜欢的食物是？', '123');
INSERT INTO `customer` VALUES ('35', 'user1', '123', '我最喜欢的食物是？', '苹果');
INSERT INTO `customer` VALUES ('36', 'user2', '123', '我的名字是？', 'user2');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsid` int(11) NOT NULL,
  `goodsname` varchar(255) NOT NULL,
  `shopid` int(11) NOT NULL,
  `price` double(10,2) NOT NULL,
  `img` varchar(255) NOT NULL,
  `childgoods` varchar(255) default NULL,
  `shopname` varchar(255) NOT NULL,
  PRIMARY KEY  (`goodsid`,`shopid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '华硕笔记本', '13', '1111.00', 'assets/img/a.png', '1', '电脑店');
INSERT INTO `goods` VALUES ('2', '外星人', '13', '434343.00', 'assets/img/b.png', '1', '电脑店');
INSERT INTO `goods` VALUES ('4', '联想笔记本', '13', '4000.00', 'assets/img/Lenovo.png', '1', '电脑店');
INSERT INTO `goods` VALUES ('1', '华硕笔记本', '19', '1111.00', 'assets/img/a.png', null, '电脑分店1');
INSERT INTO `goods` VALUES ('3', '宏碁笔记本', '13', '3000.00', 'assets/img/acer.png', '1', '电脑店');
INSERT INTO `goods` VALUES ('2', '外星人', '26', '434343.00', 'assets/img/b.png', null, '电脑分店2');
INSERT INTO `goods` VALUES ('1', '华硕笔记本', '26', '1111.00', 'assets/img/a.png', null, '电脑分店2');
INSERT INTO `goods` VALUES ('1', '华硕笔记本', '34', '1111.00', 'assets/img/a.png', null, '电脑分店3');
INSERT INTO `goods` VALUES ('2', '外星人', '34', '434343.00', 'assets/img/b.png', null, '电脑分店3');
INSERT INTO `goods` VALUES ('7', '遥控车', '33', '200.00', 'assets/img/car.png', '1', '玩具店');
INSERT INTO `goods` VALUES ('8', '积木', '33', '400.00', 'assets/img/jimu.png', '1', '玩具店');
INSERT INTO `goods` VALUES ('5', '苹果笔记本', '13', '6500.00', 'assets/img/apple.png', '1', '电脑店');
INSERT INTO `goods` VALUES ('6', '苹果台式机', '13', '8080.00', 'assets/img/applet.png', '1', '电脑店');
INSERT INTO `goods` VALUES ('4', '联想笔记本', '26', '4000.00', 'assets/img/Lenovo.png', null, '电脑分店2');
INSERT INTO `goods` VALUES ('3', '宏碁笔记本', '26', '3000.00', 'assets/img/acer.png', null, '电脑分店2');
INSERT INTO `goods` VALUES ('1', '华硕笔记本', '36', '1111.00', 'assets/img/a.png', null, '分店1');
INSERT INTO `goods` VALUES ('2', '外星人', '36', '434343.00', 'assets/img/b.png', null, '分店1');
INSERT INTO `goods` VALUES ('4', '联想笔记本', '36', '4000.00', 'assets/img/Lenovo.png', null, '分店1');
INSERT INTO `goods` VALUES ('3', '宏碁笔记本', '36', '3000.00', 'assets/img/acer.png', null, '分店1');
INSERT INTO `goods` VALUES ('7', '遥控车', '37', '200.00', 'assets/img/car.png', null, '玩具分店2');
INSERT INTO `goods` VALUES ('8', '积木', '37', '400.00', 'assets/img/jimu.png', null, '玩具分店2');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `customerid` int(11) NOT NULL,
  `shopid` int(11) NOT NULL,
  `shopname` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('14', '13', '电脑店', '对对对');
INSERT INTO `message` VALUES ('14', '13', '电脑店', '对方答复');
INSERT INTO `message` VALUES ('14', '13', '电脑店', '离开对方家里宽带荆防颗粒');
INSERT INTO `message` VALUES ('14', '16', '水果店', '芒果优惠啦');
INSERT INTO `message` VALUES ('15', '13', '电脑店', '大立科技分了可视对讲');
INSERT INTO `message` VALUES ('15', '14', '烧烤店', '看见了监控六角恐龙');
INSERT INTO `message` VALUES ('15', '15', '海鲜店', '通融通融唐人街');
INSERT INTO `message` VALUES ('16', '16', '水果店', '覆盖覆盖覆盖');
INSERT INTO `message` VALUES ('15', '13', '电脑店', '对对对');
INSERT INTO `message` VALUES ('14', '13', '电脑店', '快递费健康的九分裤');
INSERT INTO `message` VALUES ('15', '13', '电脑店', 'è´¹å¤§å¹åº¦å');
INSERT INTO `message` VALUES ('14', '14', '烧烤店', 'nba kobe james');
INSERT INTO `message` VALUES ('16', '14', '烧烤店', 'nba kobe james');
INSERT INTO `message` VALUES ('16', '13', '电脑店', '对对对');
INSERT INTO `message` VALUES ('14', '13', '电脑店', '对对对');
INSERT INTO `message` VALUES ('15', '13', '电脑店', '对对对');
INSERT INTO `message` VALUES ('15', '13', '电脑店', 'å³å¿çè¯´æ³');
INSERT INTO `message` VALUES ('13', '13', '电脑店', '华硕电脑打九折');
INSERT INTO `message` VALUES ('15', '13', '电脑店', '大幅度发动机');
INSERT INTO `message` VALUES ('15', '13', '电脑店', '华硕电脑打九折');

-- ----------------------------
-- Table structure for request
-- ----------------------------
DROP TABLE IF EXISTS `request`;
CREATE TABLE `request` (
  `customerid` int(11) NOT NULL,
  `customername` varchar(255) NOT NULL,
  `shopid` int(11) NOT NULL,
  `shopname` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of request
-- ----------------------------
INSERT INTO `request` VALUES ('17', '黄辉营', '14', '烧烤店', '钻石会员', '审核未通过');
INSERT INTO `request` VALUES ('14', '李明华', '16', '水果店', '钻石会员', '审核通过');
INSERT INTO `request` VALUES ('14', '李明华', '16', '水果店', '钻石会员', '审核通过');
INSERT INTO `request` VALUES ('36', 'user2', '13', '电脑店', '钻石会员', '审核通过');
INSERT INTO `request` VALUES ('14', '李明华', '13', '电脑店', '钻石会员', '审核未通过');
INSERT INTO `request` VALUES ('13', '潘志毅', '33', '玩具店', '钻石会员', '审核通过');
INSERT INTO `request` VALUES ('13', '潘志毅', '33', '玩具店', '钻石会员', '审核通过');
INSERT INTO `request` VALUES ('35', 'user1', '13', '电脑店', '钻石会员', '审核通过');
INSERT INTO `request` VALUES ('37', 'user5', '33', '玩具店', '钻石会员', '审核通过');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shopid` int(11) NOT NULL auto_increment,
  `shopname` varchar(255) NOT NULL,
  `shoppassword` varchar(255) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `maxdiscount` double default NULL,
  `middiscount` double default NULL,
  `mindiscount` double default NULL,
  `parentshopid` varchar(255) default NULL,
  PRIMARY KEY  (`shopid`),
  UNIQUE KEY `shopname` (`shopname`),
  UNIQUE KEY `shopname_2` (`shopname`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('16', '水果店', '123', '我的名字是？', '水果店', '0.5', '0.6', '0.7', null);
INSERT INTO `shop` VALUES ('13', '电脑店', '123', '我的名字是？', '电脑店', '0.3', '0.4', '0.5', null);
INSERT INTO `shop` VALUES ('14', '烧烤店', '1234', '我的名字是？', '烧烤店', '0.6', '0.7', '0.8', null);
INSERT INTO `shop` VALUES ('15', '海鲜店', '123', '我的名字是？', '海鲜店', '0.7', '0.8', '0.9', null);
INSERT INTO `shop` VALUES ('18', '蛋糕店', '123', '我最喜欢的食物是？', '哈密瓜', '0.5', '0.6', '0.7', null);
INSERT INTO `shop` VALUES ('19', '电脑分店1', '123', '我最喜欢的食物是？', '苹果', '0.4', '0.5', '0.6', '13');
INSERT INTO `shop` VALUES ('33', '玩具店', '123', '我最喜欢的食物是？', '芒果', '0.6', '0.7', '0.8', null);
INSERT INTO `shop` VALUES ('26', '电脑分店2', '123', '我最尊敬的人是？', '123', '0.4', '0.5', '0.6', '13');
INSERT INTO `shop` VALUES ('38', '肯德基', '123', '我最喜欢的食物是？', '芒果', null, null, null, null);
INSERT INTO `shop` VALUES ('34', '电脑分店3', '123', '我最喜欢的食物是？', '1', '0.4', '0.5', '0.6', '19');
INSERT INTO `shop` VALUES ('35', '电脑分店4', '123', '我最喜欢的食物是？', '苹果', '0.5', '0.6', '0.7', '13');
INSERT INTO `shop` VALUES ('37', '玩具分店2', '123', '我最喜欢的食物是？', '香蕉', '0.7', '0.8', '0.9', '33');

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `shopid` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `shopname` varchar(255) NOT NULL,
  `discount` double NOT NULL,
  `level` varchar(255) NOT NULL,
  `customername` varchar(255) NOT NULL,
  PRIMARY KEY  (`shopid`,`customerid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES ('15', '13', '海鲜店', '0.7', '钻石会员', '潘志毅');
INSERT INTO `vip` VALUES ('14', '13', '烧烤店', '0.6', '钻石会员', '潘志毅');
INSERT INTO `vip` VALUES ('13', '13', '电脑店', '0.3', '钻石会员', '潘志毅');
INSERT INTO `vip` VALUES ('16', '13', '水果店', '0.5', '钻石会员', '潘志毅');
INSERT INTO `vip` VALUES ('14', '14', '烧烤店', '0.7', '白金会员', '李明华');
INSERT INTO `vip` VALUES ('15', '15', '海鲜店', '0.7', '钻石会员', '朱来川');
INSERT INTO `vip` VALUES ('16', '15', '水果店', '0.7', '黄金会员', '朱来川');
INSERT INTO `vip` VALUES ('14', '16', '烧烤店', '0.7', '白金会员', '俞振霖');
INSERT INTO `vip` VALUES ('15', '16', '海鲜店', '0.9', '黄金会员', '俞振霖');
INSERT INTO `vip` VALUES ('13', '15', '电脑店', '0.3', '钻石会员', '朱来川');
INSERT INTO `vip` VALUES ('33', '13', '玩具店', '0.6', '钻石会员', '潘志毅');
INSERT INTO `vip` VALUES ('16', '14', '水果店', '0.5', '钻石会员', '李明华');
INSERT INTO `vip` VALUES ('33', '37', '玩具店', '0.6', '钻石会员', 'user5');
INSERT INTO `vip` VALUES ('33', '16', '玩具店', '0.7', '白金会员', '俞振霖');
