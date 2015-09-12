/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : tuangou

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2015-09-12 13:52:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_adminuser
-- ----------------------------
DROP TABLE IF EXISTS `t_adminuser`;
CREATE TABLE `t_adminuser` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `password` varchar(255) collate utf8_unicode_ci default NULL,
  `remark` varchar(255) collate utf8_unicode_ci default NULL,
  `role1` varchar(255) collate utf8_unicode_ci default NULL,
  `role2` varchar(255) collate utf8_unicode_ci default NULL,
  `role3` varchar(255) collate utf8_unicode_ci default NULL,
  `role4` varchar(255) collate utf8_unicode_ci default NULL,
  `role5` varchar(255) collate utf8_unicode_ci default NULL,
  `role6` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_adminuser
-- ----------------------------
INSERT INTO `t_adminuser` VALUES ('1', 'admin1', '123456', '普通管理员				', 'yes', 'yes', 'yes', 'yes', 'yes', 'no');
INSERT INTO `t_adminuser` VALUES ('2', 'admin2', '123456', '订单管理者', 'no', 'no', 'no', 'no', 'yes', 'no');
INSERT INTO `t_adminuser` VALUES ('3', 'admin', '123456', '超级管理员1', 'yes', 'yes', 'yes', 'yes', 'yes', 'no');
INSERT INTO `t_adminuser` VALUES ('4', 'admin3', '123456', '系统设置管理员', 'yes', 'yes', 'yes', 'yes', 'no', 'no');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `remark` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '2015-09-10 20:34:08', '家用电器', '个护化妆333');
INSERT INTO `t_category` VALUES ('2', '2015-09-10 20:34:20', '手机、数码、京东通信1', '手机、数码、京东通信2				');
INSERT INTO `t_category` VALUES ('3', '2015-09-10 20:34:29', '电脑、办公', '电脑、办公					');
INSERT INTO `t_category` VALUES ('6', '2015-09-12 11:18:04', '男装、女装、内衣、珠宝', '男装、女装、内衣、珠宝			');
INSERT INTO `t_category` VALUES ('7', '2015-09-12 11:18:17', '汽车、汽车用品', '汽车、汽车用品	');
INSERT INTO `t_category` VALUES ('8', '2015-09-12 11:18:35', '食品、酒类、生鲜、特产', '食品、酒类、生鲜、特产');

-- ----------------------------
-- Table structure for t_item
-- ----------------------------
DROP TABLE IF EXISTS `t_item`;
CREATE TABLE `t_item` (
  `id` bigint(20) NOT NULL auto_increment,
  `count` int(11) default NULL,
  `create_date` datetime default NULL,
  `img_path` varchar(255) collate utf8_unicode_ci default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `remark` varchar(255) collate utf8_unicode_ci default NULL,
  `score` double default NULL,
  `category` bigint(20) default NULL,
  `user` bigint(20) default NULL,
  `price` double default NULL,
  `seller` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_r6xjwkq1ksnr9kabgcjeuuj3g` (`category`),
  KEY `FK_quq4snuxxm4w1jy2k9h9f4t98` (`user`),
  KEY `FK_8rvg9jrvtoyq8c8q9810vblk` (`seller`),
  CONSTRAINT `FK_8rvg9jrvtoyq8c8q9810vblk` FOREIGN KEY (`seller`) REFERENCES `t_category` (`id`),
  CONSTRAINT `FK_quq4snuxxm4w1jy2k9h9f4t98` FOREIGN KEY (`user`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_r6xjwkq1ksnr9kabgcjeuuj3g` FOREIGN KEY (`category`) REFERENCES `t_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_item
-- ----------------------------
INSERT INTO `t_item` VALUES ('16', '100', '2015-09-12 11:25:52', '0150912112424.png', '电热水器', '电热水器电热水器电热水器电热水器', null, '1', null, '4999', '1');
INSERT INTO `t_item` VALUES ('17', '500', '2015-09-12 11:26:14', '20150912112250.png', '飞利浦电视机', '飞利浦电视机飞利浦电视机飞利浦电视机', null, '1', null, '5999', '3');
INSERT INTO `t_item` VALUES ('18', '40', '2015-09-12 11:26:35', '20150912112325.png', '三星空调', '三星空调三星空调三星空调', null, '1', null, '4500', '1');
INSERT INTO `t_item` VALUES ('20', '300', '2015-09-12 11:27:38', '20150912112456.png', 'HIWI家庭音响', 'HIWI家庭音响HIWI家庭音响', null, '1', null, '1600', '1');
INSERT INTO `t_item` VALUES ('21', '690', '2015-09-12 11:27:58', '20150912112516.png', '公牛插座1023', '公牛插座1023公牛插座1023', null, '3', null, '700', '2');
INSERT INTO `t_item` VALUES ('22', '600', '2015-09-12 11:31:44', '20150912113041.png', '九阳电热水器', '九阳电热水器九阳电热水器', null, '1', null, '79.5', '1');
INSERT INTO `t_item` VALUES ('23', '30', '2015-09-12 11:32:03', '0150912113113.png', '电饭煲', '电饭煲电饭煲', null, '1', null, '47', '1');
INSERT INTO `t_item` VALUES ('24', '60', '2015-09-12 11:32:23', '150912112938.png', '电热水器1-12', '电饭煲电饭煲', null, '1', null, '78', '1');
INSERT INTO `t_item` VALUES ('25', '79', '2015-09-12 11:32:42', '150912113019.png', '小霸王电磁炉', '小霸王电磁炉									', null, '1', null, '90', '1');
INSERT INTO `t_item` VALUES ('26', '700', '2015-09-12 11:47:51', '150912114436.png', '坚果手机', '坚果手机坚果手机', null, '2', null, '1399', '3');
INSERT INTO `t_item` VALUES ('27', '60', '2015-09-12 11:48:14', '0150912114454.png', '苹果6S', '苹果6S苹果6S', null, '2', null, '4999', '3');
INSERT INTO `t_item` VALUES ('28', '700', '2015-09-12 11:48:36', '20150912114545.png', '佳能单反相机', '佳能单反相机佳能单反相机', null, '2', null, '800', '1');
INSERT INTO `t_item` VALUES ('29', '50', '2015-09-12 11:48:56', '3330150912114520.png', '老年人手机', '老年人手机									', null, '2', null, '50', '3');
INSERT INTO `t_item` VALUES ('30', '25', '2015-09-12 11:51:02', '20150912114351.png', '朵唯手机', '									', null, '2', null, '1120', '1');
INSERT INTO `t_item` VALUES ('31', '13', '2015-09-12 11:50:52', '20150912114417.png', 'HTC手机', '									', null, '2', null, '1400', '1');
INSERT INTO `t_item` VALUES ('32', '23', '2015-09-12 12:05:22', '20150912120326.png', '男士针织衫', '男士针织衫男士针织衫', null, '6', null, '88', '1');
INSERT INTO `t_item` VALUES ('33', '600', '2015-09-12 12:05:39', '20150912120349.png', '牛仔裤', '牛仔裤牛仔裤									', null, '6', null, '99', '3');
INSERT INTO `t_item` VALUES ('34', '500', '2015-09-12 12:06:32', '20150912120403.png', '运动鞋', '运动鞋运动鞋', null, '6', null, '160', '3');
INSERT INTO `t_item` VALUES ('35', '600', '2015-09-12 12:09:50', '0150912120739.png', '米其林轮胎', '米其林轮胎米其林轮胎', null, '7', null, '699', '3');
INSERT INTO `t_item` VALUES ('36', '70', '2015-09-12 12:10:12', '20150912120819.png', '胎压件瓷器', '胎压件瓷器', null, '7', null, '79', '1');
INSERT INTO `t_item` VALUES ('37', '700', '2015-09-12 12:10:35', '20150912120757.png', 'XX机油', 'XX机油', null, '7', null, '80', '2');
INSERT INTO `t_item` VALUES ('38', '5', '2015-09-12 12:11:02', '20150912120712.png', '探险者汽车', '探险者汽车探险者汽车', null, '7', null, '880000', '2');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` bigint(20) NOT NULL auto_increment,
  `total_price` double default NULL,
  `count` int(11) default NULL,
  `create_date` date default NULL,
  `pay_type` varchar(255) collate utf8_unicode_ci default NULL,
  `state` varchar(255) collate utf8_unicode_ci default NULL,
  `item` bigint(20) default NULL,
  `user` bigint(20) default NULL,
  `addr` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_85yet1dbbrsprqfsttdcm701` (`item`),
  KEY `FK_1isv5n8ndeuw5y3mwianl1j94` (`user`),
  CONSTRAINT `FK_1isv5n8ndeuw5y3mwianl1j94` FOREIGN KEY (`user`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_85yet1dbbrsprqfsttdcm701` FOREIGN KEY (`item`) REFERENCES `t_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('8', '1399', '1', '2015-09-12', '在线支付', '待审核', '26', '3', '中关村1-12');
INSERT INTO `t_order` VALUES ('9', '4999', '1', '2015-09-12', '在线支付', '待审核', '16', '3', '6666');
INSERT INTO `t_order` VALUES ('10', '4200', '3', '2015-09-12', '货到付款', '已发货', '31', '6', '中关村1-12');

-- ----------------------------
-- Table structure for t_seller
-- ----------------------------
DROP TABLE IF EXISTS `t_seller`;
CREATE TABLE `t_seller` (
  `id` bigint(20) NOT NULL auto_increment,
  `addr` varchar(255) collate utf8_unicode_ci default NULL,
  `detail` varchar(255) collate utf8_unicode_ci default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `tel` varchar(255) collate utf8_unicode_ci default NULL,
  `user_name` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_seller
-- ----------------------------
INSERT INTO `t_seller` VALUES ('1', 'XX路XX号', '111', 'A公司', '33', '22');
INSERT INTO `t_seller` VALUES ('2', 'XX路XX号', '13556666789', 'B公司', '010-123123123', '13556666789');
INSERT INTO `t_seller` VALUES ('3', 'XX路XX号', '13556666789', 'C公司', '010-123123123', '13556666789');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `address` varchar(255) collate utf8_unicode_ci default NULL,
  `birthday` datetime default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `job` varchar(255) collate utf8_unicode_ci default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `nickname` varchar(255) collate utf8_unicode_ci default NULL,
  `password` varchar(255) collate utf8_unicode_ci default NULL,
  `sex` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('3', '', null, 'zhaoyangjay@sina.com', '程序员', 'user1', '胡惊涛', '123456', '男');
INSERT INTO `t_user` VALUES ('4', '中南海', null, 'zhaoyangjay@sina.com', '无', 'user2', '用户2', '123456', '女');
INSERT INTO `t_user` VALUES ('5', '中南海', null, 'zhaoyangjay@sina.com', '程序员', 'user3', '用户3', '123456', '女');
INSERT INTO `t_user` VALUES ('6', '', null, 'zhaoyangjay@sina.com', '程序员', 'user4', '11', '123456', '男');
