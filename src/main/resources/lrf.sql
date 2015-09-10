/*
Navicat MySQL Data Transfer

Source Server         : host
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : lrf

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2015-05-05 22:58:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `name` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', null, '特色食品', null);
INSERT INTO `t_category` VALUES ('2', null, '特殊场合', null);
INSERT INTO `t_category` VALUES ('3', null, '菜式', null);
INSERT INTO `t_category` VALUES ('4', null, '功效', null);
INSERT INTO `t_category` VALUES ('5', null, '烘焙甜点饮料', null);

-- ----------------------------
-- Table structure for t_categorysub
-- ----------------------------
DROP TABLE IF EXISTS `t_categorysub`;
CREATE TABLE `t_categorysub` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `name` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  `category` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_lubwo04yimou3tbkhy7qjsc1o` (`category`),
  CONSTRAINT `FK_lubwo04yimou3tbkhy7qjsc1o` FOREIGN KEY (`category`) REFERENCES `t_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_categorysub
-- ----------------------------
INSERT INTO `t_categorysub` VALUES ('3', '2015-05-05 22:03:32', '小吃', '									', '1');
INSERT INTO `t_categorysub` VALUES ('4', '2015-05-05 22:04:16', '沙拉', '									', '1');
INSERT INTO `t_categorysub` VALUES ('5', '2015-05-05 22:04:27', '零食', '									', '1');
INSERT INTO `t_categorysub` VALUES ('6', '2015-05-05 22:04:34', '寿司', '									', '1');
INSERT INTO `t_categorysub` VALUES ('7', '2015-05-05 22:04:44', '三明治', '									', '1');
INSERT INTO `t_categorysub` VALUES ('8', '2015-05-05 22:04:54', '早餐', '									', '2');
INSERT INTO `t_categorysub` VALUES ('9', '2015-05-05 22:05:03', '下午茶', '									', '2');
INSERT INTO `t_categorysub` VALUES ('10', '2015-05-05 22:09:04', '便当', '									', '2');
INSERT INTO `t_categorysub` VALUES ('11', '2015-05-05 22:09:13', '夜宵', '									', '2');
INSERT INTO `t_categorysub` VALUES ('12', '2015-05-05 22:09:26', '家常菜', '									', '3');
INSERT INTO `t_categorysub` VALUES ('13', '2015-05-05 22:09:40', '快手菜', '									', '3');
INSERT INTO `t_categorysub` VALUES ('14', '2015-05-05 22:09:48', '小清新', '									', '3');
INSERT INTO `t_categorysub` VALUES ('15', '2015-05-05 22:09:59', '创意菜', '									', '3');
INSERT INTO `t_categorysub` VALUES ('16', '2015-05-05 22:10:15', '减肥', '									', '4');
INSERT INTO `t_categorysub` VALUES ('17', '2015-05-05 22:10:23', '美容', '									', '4');
INSERT INTO `t_categorysub` VALUES ('18', '2015-05-05 22:10:34', '润肤抗燥', '									', '4');
INSERT INTO `t_categorysub` VALUES ('19', '2015-05-05 22:11:03', '补血养生', '									', '4');
INSERT INTO `t_categorysub` VALUES ('20', '2015-05-05 22:11:15', '饼干', '									', '5');
INSERT INTO `t_categorysub` VALUES ('21', '2015-05-05 22:11:20', '蛋糕', '									', '5');
INSERT INTO `t_categorysub` VALUES ('22', '2015-05-05 22:11:27', '果汁', '									', '5');
INSERT INTO `t_categorysub` VALUES ('23', '2015-05-05 22:11:35', '冰淇淋', '									', '5');
INSERT INTO `t_categorysub` VALUES ('24', '2015-05-05 22:11:43', '豆浆', '									', '5');

-- ----------------------------
-- Table structure for t_collect
-- ----------------------------
DROP TABLE IF EXISTS `t_collect`;
CREATE TABLE `t_collect` (
  `id` bigint(20) NOT NULL auto_increment,
  `cook_book` bigint(20) default NULL,
  `user` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_cm7x58iql8l9gl16cybw8asb5` (`cook_book`),
  KEY `FK_b9ku0l7j6y52mo09dhxo5fiel` (`user`),
  CONSTRAINT `FK_b9ku0l7j6y52mo09dhxo5fiel` FOREIGN KEY (`user`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_cm7x58iql8l9gl16cybw8asb5` FOREIGN KEY (`cook_book`) REFERENCES `t_cookbook` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_collect
-- ----------------------------
INSERT INTO `t_collect` VALUES ('1', '1', null);
INSERT INTO `t_collect` VALUES ('2', '1', null);
INSERT INTO `t_collect` VALUES ('3', '1', null);
INSERT INTO `t_collect` VALUES ('5', '1', null);

-- ----------------------------
-- Table structure for t_cookbook
-- ----------------------------
DROP TABLE IF EXISTS `t_cookbook`;
CREATE TABLE `t_cookbook` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `img_path` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  `category` bigint(20) default NULL,
  `category_sub` bigint(20) default NULL,
  `user` bigint(20) default NULL,
  `count` int(11) default NULL,
  `score` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_1gl53nkrk7g6bo69261dofoxu` (`category`),
  KEY `FK_j41yjstx97ar2dcrk5mnwwc7l` (`category_sub`),
  KEY `FK_bf5k90s94x054pk0m0g8922gq` (`user`),
  CONSTRAINT `FK_1gl53nkrk7g6bo69261dofoxu` FOREIGN KEY (`category`) REFERENCES `t_category` (`id`),
  CONSTRAINT `FK_bf5k90s94x054pk0m0g8922gq` FOREIGN KEY (`user`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_j41yjstx97ar2dcrk5mnwwc7l` FOREIGN KEY (`category_sub`) REFERENCES `t_categorysub` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cookbook
-- ----------------------------
INSERT INTO `t_cookbook` VALUES ('1', '2015-05-03 19:06:13', '2009110210042762.jpg', '红烧龙虾', '这是一个简单介绍', '2', null, '1', null, '5');
INSERT INTO `t_cookbook` VALUES ('2', '2015-05-03 20:05:33', '2009110911514403.jpg', '炒面', '炒面介绍炒面介绍', '2', null, '1', null, '5');
INSERT INTO `t_cookbook` VALUES ('3', '2015-05-05 22:14:16', '2009110309362552.jpg', '武汉小吃三鲜豆皮', '豆皮是武汉最有特色的民间小吃之一。本厨娘来挑战它！', null, null, '1', null, null);
INSERT INTO `t_cookbook` VALUES ('4', '2015-05-05 22:17:32', '2009110210383038.jpg', '巧炸薯条', '将切好的土豆条放入沸水中煮2—3分钟，捞出沥干水分晾凉，然后放入冰箱中冷冻，冻硬后随吃随炸', null, null, '1', null, null);
INSERT INTO `t_cookbook` VALUES ('7', '2015-05-05 22:22:35', '2009110811290907.jpg', '自制凉皮', '自己动手做放心凉皮，虽然有点麻烦，但是真的不难', '1', '5', '1', null, null);
INSERT INTO `t_cookbook` VALUES ('8', '2015-05-05 22:27:34', '2009110909105992.jpg', '爱心早餐 ', '爱心早餐 新的一天满满正能量 健康又营养～', '2', '8', '1', null, '2');
INSERT INTO `t_cookbook` VALUES ('9', '2015-05-05 22:28:49', '2009110811290907.jpg', '早餐鸡蛋卷', '这是一道早餐的快手鸡蛋卷 有肉 有蛋 有芝士 配一碗小米粥或者杂粮米糊 都是早餐不错的选择 营养搭配摄取均衡 配上好看的餐具还担心宝贝不爱吃饭么', '2', '10', '1', null, '4');
INSERT INTO `t_cookbook` VALUES ('10', '2015-05-05 22:30:33', '2009110910363149.jpg', '鸡蛋煎饼', '懒人早餐   \r\n10分钟版漂亮的早餐鸡蛋煎饼卷', '2', '10', '1', null, '4');
INSERT INTO `t_cookbook` VALUES ('11', '2015-05-05 22:32:20', '2009110813575408.jpg', '糖醋里脊', '简介\r\n糖醋里脊 \r\n有很多种做法 \r\n之前博客发过一个也 \r\n外边不裹生粉版 \r\n前段时间在外吃饭 \r\n点了一次又 \r\n一般餐馆都是 \r\n这种版本的多 \r\n然后就是肉块个子小 \r\n面粉多 \r\n一口下去 \r\n你分不清楚到底是肉还是面疙瘩。。。 \r\n买到一块好里脊 \r\n据说是里脊肉里最嫩的 \r\n这就是逼着咱。。。。 \r\n于是被逼无奈自己在家整了一次 \r\n果然是好里脊！ \r\n嫩到叫人感动！ \r\n还能嚼到芝麻的香味！ \r\n不会甜到让人发腻的番茄酱糖汁！ \r\n成功！ \r\n哈哈哈 \r\n糖醋里脊配白馒头！好吃呦！', '3', '12', '1', null, null);
INSERT INTO `t_cookbook` VALUES ('13', '2015-05-05 22:34:52', '2009110909105992.jpg', '糖醋脆皮豆腐', '重现高中食堂最高点击率菜式 \r\n从小学六年级开始，我就走上了混食堂的', '3', '15', '1', null, null);
INSERT INTO `t_cookbook` VALUES ('14', '2015-05-05 22:36:43', '2009110813575408.jpg', '减肥刮油炒米粥', '炒米粥减肥清肠刮油的原因是在炒制的过程中，米里所含的淀粉全部被破坏、分解（当然别的营养素也遭到了重大的破坏，因此，它可是说是一种毫无营养的东西了），变成了活性炭。 ', '4', '16', '1', null, null);
INSERT INTO `t_cookbook` VALUES ('15', '2015-05-05 22:37:29', '2009110309362552.jpg', '无油煎鸡胸', '腌制15分钟是比较快手的时间，做法也是属于基本款，当然也可以做得更讲究些，用刀背把肉拍松，用自己喜欢的调味料腌制更长时间等等（干淀粉，火候等等不能忽略哦）。我一般是晚上把肉准备好，放冰箱腌一晚上，第二天早上起来煎，很快就煎好了。再配点蔬菜和糙米饭，就成了我当天的午饭。上班族的健身午餐，欢迎大家来交流！', '4', '17', '1', null, null);
INSERT INTO `t_cookbook` VALUES ('16', '2015-05-05 22:38:50', '2009110813575408.jpg', '草莓慕斯', '\r\n就算没有烤箱也可以做出美味蛋糕，慕斯系列是没有烤箱的亲唯一的选择，简单操作，让你瞬间爱上下厨房。 \r\n6寸用量，草莓也可以换成同等量的其他新鲜水果，超简单操作，一起动手吧！ \r\n不要看着步骤多而望而却步，其实我只是讲述的比较详细且啰嗦了点，实际操作真的超级简单，这个也只是我第二次做的成品而已哦。', '5', '21', '1', null, null);
INSERT INTO `t_cookbook` VALUES ('17', '2015-05-05 22:39:34', '2009110309533409.jpg', '彩虹慕斯蛋糕', '五彩斑斓的彩虹慕斯，让心情瞬间明媚起来。\r\n\r\nP.S. 平时若非发配方，可能一两周才会来一次下厨房，大家的问题我看见了都会回复，如果急需回答，可以来新浪微博 @杏酱的杏 拍照问我，回答速度会快一点，谢谢大家的喜欢和支持。', '1', '3', '1', null, null);

-- ----------------------------
-- Table structure for t_cookfood
-- ----------------------------
DROP TABLE IF EXISTS `t_cookfood`;
CREATE TABLE `t_cookfood` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `number` varchar(255) default NULL,
  `cookbook_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_79n0fwg4a62aa9n5swxkws2i4` (`cookbook_id`),
  CONSTRAINT `FK_79n0fwg4a62aa9n5swxkws2i4` FOREIGN KEY (`cookbook_id`) REFERENCES `t_cookbook` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cookfood
-- ----------------------------
INSERT INTO `t_cookfood` VALUES ('1', '龙虾', '一斤', '1');
INSERT INTO `t_cookfood` VALUES ('2', '大蒜', '少许', '1');
INSERT INTO `t_cookfood` VALUES ('3', '面条', '100g', '2');
INSERT INTO `t_cookfood` VALUES ('4', '大蒜', '10g', '2');
INSERT INTO `t_cookfood` VALUES ('5', '肉丁', '少许', '3');
INSERT INTO `t_cookfood` VALUES ('6', '鸡蛋2颗', '少许', '3');
INSERT INTO `t_cookfood` VALUES ('7', '青豆', '少许', '3');
INSERT INTO `t_cookfood` VALUES ('8', '番茄酱', '', '4');
INSERT INTO `t_cookfood` VALUES ('9', '土豆', '', '4');
INSERT INTO `t_cookfood` VALUES ('14', ' 面粉', '少许', '7');
INSERT INTO `t_cookfood` VALUES ('15', '酵母', '少许', '7');
INSERT INTO `t_cookfood` VALUES ('16', '鸡蛋', '100g', '8');
INSERT INTO `t_cookfood` VALUES ('17', '火腿', '33', '8');
INSERT INTO `t_cookfood` VALUES ('18', '鸡蛋', '4', '9');
INSERT INTO `t_cookfood` VALUES ('19', '火腿', '100G', '9');
INSERT INTO `t_cookfood` VALUES ('20', '黄油', '10g', '9');
INSERT INTO `t_cookfood` VALUES ('21', '鸡蛋', '4', '10');
INSERT INTO `t_cookfood` VALUES ('22', '大米', '100', '10');
INSERT INTO `t_cookfood` VALUES ('23', '猪里脊', '', '11');
INSERT INTO `t_cookfood` VALUES ('24', '鸡蛋', '', '11');
INSERT INTO `t_cookfood` VALUES ('25', '白胡椒粉', '', '11');
INSERT INTO `t_cookfood` VALUES ('29', '老豆腐', '', '13');
INSERT INTO `t_cookfood` VALUES ('30', '生抽', '', '13');
INSERT INTO `t_cookfood` VALUES ('31', '芝麻', '', '13');
INSERT INTO `t_cookfood` VALUES ('32', '大米', '', '14');
INSERT INTO `t_cookfood` VALUES ('33', '干淀粉', '', '15');
INSERT INTO `t_cookfood` VALUES ('34', '草莓酱', '2', '16');
INSERT INTO `t_cookfood` VALUES ('35', '动物性淡奶油', '3', '16');
INSERT INTO `t_cookfood` VALUES ('36', '吉利丁片', '', '17');

-- ----------------------------
-- Table structure for t_cookstep
-- ----------------------------
DROP TABLE IF EXISTS `t_cookstep`;
CREATE TABLE `t_cookstep` (
  `id` bigint(20) NOT NULL auto_increment,
  `img_path` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `cookboox_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_fqgegl6c207h9tmu4k6njlqkf` (`cookboox_id`),
  CONSTRAINT `FK_fqgegl6c207h9tmu4k6njlqkf` FOREIGN KEY (`cookboox_id`) REFERENCES `t_cookbook` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cookstep
-- ----------------------------
INSERT INTO `t_cookstep` VALUES ('1', '2009110910083341.jpg', '第一步', '1');
INSERT INTO `t_cookstep` VALUES ('2', '2009110910255443.jpg', '第二步', '1');
INSERT INTO `t_cookstep` VALUES ('3', '2009110910463410.jpg', '第三步', '1');
INSERT INTO `t_cookstep` VALUES ('4', '2009110910363149.jpg', '水电费家发生地方 收到了发送到发', '2');
INSERT INTO `t_cookstep` VALUES ('5', '2009110710512096.jpg', '会吧有关集合中的信息放在名称', '2');
INSERT INTO `t_cookstep` VALUES ('6', '2009110910114599.jpg', '橄榄油烧热，依次下香干，香菇，肉丁。', '3');
INSERT INTO `t_cookstep` VALUES ('7', '2009110910465262.jpg', '糯米洗净，浸泡一晚。蒸锅铺好纱布，糯米铺在纱布上', '3');
INSERT INTO `t_cookstep` VALUES ('8', '2009110910463410.jpg', '平锅：葛根粉冷水调成稀糊状', '3');
INSERT INTO `t_cookstep` VALUES ('9', '2009110611530979.jpg', '葱切葱花', '10');
INSERT INTO `t_cookstep` VALUES ('10', '2009110910255443.jpg', '火腿肠切细粒', '10');
INSERT INTO `t_cookstep` VALUES ('11', '2009110910463410.jpg', '生粉加到面粉里，比例自己控制就好，当然生粉就一点点啦', '10');
INSERT INTO `t_cookstep` VALUES ('12', '2009110710280054.jpg', '取姜汁', '11');
INSERT INTO `t_cookstep` VALUES ('13', '2009110710280054.jpg', '打蛋，取蛋清', '11');
INSERT INTO `t_cookstep` VALUES ('14', '2009110909452784.jpg', '里脊肉切长条', '11');
INSERT INTO `t_cookstep` VALUES ('15', '2009110910004122.jpg', '适量盐', '11');
INSERT INTO `t_cookstep` VALUES ('19', '2009110710175483.jpg', '将所有调料除葱花外混合在一个碗内，调匀备用', '13');
INSERT INTO `t_cookstep` VALUES ('20', '2009110710280054.jpg', '老豆腐切成麻将大小的块', '13');
INSERT INTO `t_cookstep` VALUES ('21', '2009110813575408.jpg', '大火将汁收稠后，撒上葱花、芝麻，关火', '13');
INSERT INTO `t_cookstep` VALUES ('22', '2009110710512096.jpg', '把锅烧热后保持中小火倒入大米不断的翻炒直到米粒变黄即可', '14');
INSERT INTO `t_cookstep` VALUES ('23', null, '炒好的大米淘洗一下加水煮二十分钟即可', '14');
INSERT INTO `t_cookstep` VALUES ('24', null, '鸡胸肉一块，冲干净，去掉脂肪和筋膜。太厚的话可以横刀剖成两块。', '15');
INSERT INTO `t_cookstep` VALUES ('25', null, '肉放入盘中，放一点生抽，淀粉抓匀，腌15分钟左右。', '15');
INSERT INTO `t_cookstep` VALUES ('26', '2009110909482834.jpg', '将6寸戚风蛋糕切成两片一厘米厚度的蛋糕片，一大一小', '16');
INSERT INTO `t_cookstep` VALUES ('27', '2009110309533409.jpg', '其他主要原材料称重备用，吉丁片冷水泡软（千万不要用有温度的水，吉丁片于热会融化的），ps：忘记拍草莓酱了。。', '16');
INSERT INTO `t_cookstep` VALUES ('28', '2009110710280054.jpg', '称取消化饼干。', '17');
INSERT INTO `t_cookstep` VALUES ('29', '2009110309362552.jpg', '33', '17');

-- ----------------------------
-- Table structure for t_msgboard
-- ----------------------------
DROP TABLE IF EXISTS `t_msgboard`;
CREATE TABLE `t_msgboard` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `msg` varchar(255) default NULL,
  `user` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_o1nhfqltbcaewo266ye0kok80` (`user`),
  CONSTRAINT `FK_o1nhfqltbcaewo266ye0kok80` FOREIGN KEY (`user`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_msgboard
-- ----------------------------
INSERT INTO `t_msgboard` VALUES ('1', '2015-05-04 21:43:40', '2222222', '1');
INSERT INTO `t_msgboard` VALUES ('9', '2015-05-05 20:15:52', '3333333333', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `address` varchar(255) default NULL,
  `birthday` datetime default NULL,
  `email` varchar(255) default NULL,
  `job` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `nickname` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '333333333333', null, 'zhaoyang@125.com', '33', 'zhaoyang', '胡惊涛', '110119', '');
