/*
Navicat MySQL Data Transfer

Source Server         : 本地开发
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : distribution

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2019-04-10 13:45:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `g_admins`
-- ----------------------------
DROP TABLE IF EXISTS `g_admins`;
CREATE TABLE `g_admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` char(36) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `lastLogin` timestamp NULL DEFAULT NULL,
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `companyId` int(10) unsigned DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `weixin` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `companyId` (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of g_admins
-- ----------------------------
INSERT INTO `g_admins` VALUES ('1', 'admin', '`~5AA0B0C2A2EB1C1730726C2CEBD65790`~', null, '2019-02-18 12:43:08', '2019-02-18 12:43:05', '1', null, null, null, null);
INSERT INTO `g_admins` VALUES ('2', 'test', '`~0C95D3822A656DEFCE0C1EBF8AB76E6A`~', null, null, '2019-02-24 17:12:02', '1', '15111111111', '张三', '88888888', 'zhangsan@qq.com');
INSERT INTO `g_admins` VALUES ('3', 'cs', '`~5503D52B2C886409AF4569949F24D808`~', null, null, '2019-04-10 10:25:48', null, '8888', '测试', '8888', '888@qq.com');
INSERT INTO `g_admins` VALUES ('4', 't', '`~974818CA47D99677AC1A791E258F791B`~', null, null, '2019-04-10 11:43:40', '0', null, null, null, null);

-- ----------------------------
-- Table structure for `g_client`
-- ----------------------------
DROP TABLE IF EXISTS `g_client`;
CREATE TABLE `g_client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(200) NOT NULL COMMENT '客户名称',
  `userIdCard` char(18) DEFAULT NULL,
  `weixin` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL COMMENT '客户电话',
  `address` varchar(500) DEFAULT NULL COMMENT '客户地址',
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '客户首次进入系统时间',
  `bankNumber` varchar(20) DEFAULT NULL,
  `bankName` varchar(50) DEFAULT NULL,
  `bankUser` varchar(50) DEFAULT NULL,
  `friends` varchar(500) DEFAULT NULL,
  `companyId` int(10) unsigned DEFAULT NULL,
  `sellCount` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of g_client
-- ----------------------------
INSERT INTO `g_client` VALUES ('1', '0', '张三', '34433344433223344x', null, '8520960', '湖南省/湘西土家族苗族自治州/吉首市', '2019-03-18 11:46:26', '6228485512512515521', '工商银行', null, null, '1', '0');
INSERT INTO `g_client` VALUES ('2', '0', '李四', '444333444332233449', null, '43465436', '湖南省/张家界市/永定区', '2019-03-18 11:46:25', '6228485512512515522', '工商银行', '李四', null, '1', '0');
INSERT INTO `g_client` VALUES ('3', '0', '王五', '45512221151251255X', null, '8520960', '武陵山大道32号旭唐科技', '2019-03-18 11:46:24', '6228485512512515521', '工商银行', '王五', null, '1', '0');
INSERT INTO `g_client` VALUES ('4', '0', '李敏', '45215125633251221X', null, '8521552', '武陵东路43号', '2019-03-18 11:46:24', '6228485351254451256', '建设银行', '李敏', '张杰，王丽，苏有朋', '1', '0');
INSERT INTO `g_client` VALUES ('5', '0', '李启', '451251256335215415', null, '8512254', '是对方就是对方是对方是', '2019-03-18 11:46:23', '6251588451254486512', '建设银行', '李启', '彭王，李冰，赵甲', '1', '0');
INSERT INTO `g_client` VALUES ('6', '0', '王二', '4315215231512150', null, '8512351', '翻看了电视剧', '2019-03-13 15:20:58', '625125125121512151', '农业银行', '王二', '张三，433101', '2', '0');
INSERT INTO `g_client` VALUES ('7', '0', '李三', '3254165246524346', null, '2536465', '是对方开始就会', '2019-03-13 15:22:39', '65221326452344623154', '中国银行', '李三', '李四', '2', '0');
INSERT INTO `g_client` VALUES ('8', '0', '张三', '4512651235411215', null, '8520960', '湖南省/湘西土家族苗族自治州/吉首市', '2019-03-14 11:32:14', '6228485512512515522', '工商银行', '张三', null, '3', '0');
INSERT INTO `g_client` VALUES ('9', '0', '李八', '2341234234234231', null, '234242342', '飞机哦都市辅导快速里', '2019-03-18 09:26:05', '2348392874938274982', '农业银行', '李八', '福鼎市 是对方', '3', '0');
INSERT INTO `g_client` VALUES ('10', '9', '2342342', '234234234', '234234', '2342341', '234231', '2019-04-03 14:56:56', null, null, null, null, '1', '0');
INSERT INTO `g_client` VALUES ('11', '3', 'fuminshen', '4563456354634564', '5464563', '45634645', '湖南省/湘西土家族苗族自治州/吉首市', '2019-04-09 09:22:41', null, null, null, null, '1', '1');
INSERT INTO `g_client` VALUES ('12', '11', 'fuminshen1', '234325345345234534', '234123423', '8520960', '经开区武陵山大道32号', '2019-04-09 09:28:19', null, null, null, null, '1', '0');
INSERT INTO `g_client` VALUES ('13', '12', 'fuminshen2', '453654634563456', '4564563', '4356345', '经开区武陵山大道32号', '2019-04-09 09:35:57', null, null, null, null, '1', '0');
INSERT INTO `g_client` VALUES ('14', '0', '一级代理商', null, null, null, null, '2019-04-10 09:40:01', null, null, null, null, '1', '0');
INSERT INTO `g_client` VALUES ('15', '14', '二级代理商', null, null, null, null, '2019-04-10 09:41:13', null, null, null, null, '1', '5');
INSERT INTO `g_client` VALUES ('16', '15', '三级代理商', null, null, null, null, '2019-04-10 09:41:54', null, null, null, null, '1', '0');
INSERT INTO `g_client` VALUES ('17', '16', '四级代理商', null, null, null, null, '2019-04-10 09:42:11', null, null, null, null, '1', '0');
INSERT INTO `g_client` VALUES ('18', '0', '顶级代理商', null, null, null, null, '2019-04-10 10:23:05', null, null, null, null, '0', '0');
INSERT INTO `g_client` VALUES ('19', '0', '1级', null, null, null, null, '2019-04-10 10:32:45', null, null, null, null, '3', '0');
INSERT INTO `g_client` VALUES ('20', '0', '1', null, null, null, null, '2019-04-10 10:34:35', null, null, null, null, '0', '0');
INSERT INTO `g_client` VALUES ('21', '14', '2级代理', null, null, null, null, '2019-04-10 10:40:38', null, null, null, null, '0', '0');
INSERT INTO `g_client` VALUES ('22', '21', '3级', null, null, null, null, '2019-04-10 10:43:48', null, null, null, null, '0', '0');
INSERT INTO `g_client` VALUES ('23', '0', '0', null, null, null, null, '2019-04-10 11:44:28', null, null, null, null, '0', '0');

-- ----------------------------
-- Table structure for `g_company`
-- ----------------------------
DROP TABLE IF EXISTS `g_company`;
CREATE TABLE `g_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(10) unsigned DEFAULT NULL COMMENT '上级公司id',
  `name` varchar(1000) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(2000) DEFAULT NULL,
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bankName` varchar(100) DEFAULT NULL,
  `bankNumber` varchar(50) DEFAULT NULL,
  `bankUser` varchar(200) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of g_company
-- ----------------------------
INSERT INTO `g_company` VALUES ('1', null, '深圳市金玉满唐黄金珠宝有限公司', '0755-26530009', '深圳市南山区常兴路国兴大厦702', '2019-02-26 16:07:24', '中国银行深圳市沙头角保税区支行', '6232632000100837367', '深圳市金玉满唐黄金珠宝有限公司', '0755-26530016');
INSERT INTO `g_company` VALUES ('2', null, '乾州分公司', '251651', '乾州', '2019-03-13 10:07:20', null, null, null, null);
INSERT INTO `g_company` VALUES ('3', null, '吉首分公司', '8520960', '武陵山大道32号', '2019-03-14 09:51:14', null, null, null, null);

-- ----------------------------
-- Table structure for `g_contract`
-- ----------------------------
DROP TABLE IF EXISTS `g_contract`;
CREATE TABLE `g_contract` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `orderId` bigint(20) unsigned NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `number` char(20) NOT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `orderId` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of g_contract
-- ----------------------------
INSERT INTO `g_contract` VALUES ('2', '1174', '销售合同', '20190311103920406497', null, '2019-03-11 10:39:20');
INSERT INTO `g_contract` VALUES ('3', '1186', '销售合同', '20190313032439954935', null, '2019-03-13 15:24:39');

-- ----------------------------
-- Table structure for `g_contract_img`
-- ----------------------------
DROP TABLE IF EXISTS `g_contract_img`;
CREATE TABLE `g_contract_img` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `contractId` bigint(20) unsigned NOT NULL,
  `path` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contarctId` (`contractId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of g_contract_img
-- ----------------------------
INSERT INTO `g_contract_img` VALUES ('1', '2', '/upload/contract/20190311103930958301.jpg');
INSERT INTO `g_contract_img` VALUES ('2', '2', '/upload/contract/20190311103938661333.jpg');
INSERT INTO `g_contract_img` VALUES ('3', '3', '/upload/contract/20190313032446320615.jpg');

-- ----------------------------
-- Table structure for `g_orders`
-- ----------------------------
DROP TABLE IF EXISTS `g_orders`;
CREATE TABLE `g_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `number` char(20) NOT NULL COMMENT '订单编号',
  `adminId` int(10) unsigned DEFAULT NULL,
  `companyId` int(10) unsigned NOT NULL DEFAULT '1',
  `clientId` int(10) unsigned DEFAULT NULL,
  `price` decimal(19,4) DEFAULT NULL COMMENT '每克单价',
  `money` decimal(19,4) DEFAULT NULL COMMENT '付款总价',
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `productId` int(11) DEFAULT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `companyId` (`companyId`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=1198 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of g_orders
-- ----------------------------
INSERT INTO `g_orders` VALUES ('1', '543535353453', null, '1', '1', null, null, '2019-02-19 12:32:03', null, '1');
INSERT INTO `g_orders` VALUES ('3', '20190222161054', null, '1', '1', null, '800.0000', '2019-02-22 16:10:54', null, '1');
INSERT INTO `g_orders` VALUES ('4', '20190222161238', null, '1', '1', null, '1200.0000', '2019-02-22 16:12:38', null, '1');
INSERT INTO `g_orders` VALUES ('7', '20190222162806342', null, '1', '1', null, null, '2019-02-22 16:28:06', null, '1');
INSERT INTO `g_orders` VALUES ('8', '20190222162806662', null, '1', '1', null, null, '2019-02-22 16:28:06', null, '1');
INSERT INTO `g_orders` VALUES ('9', '20190222162806387', null, '1', '1', null, null, '2019-02-22 16:28:06', null, '1');
INSERT INTO `g_orders` VALUES ('10', '20190222162806750', null, '1', '1', null, '8000.0000', '2019-02-22 16:28:06', null, '1');
INSERT INTO `g_orders` VALUES ('11', '20190222162806690', null, '1', '1', null, '5000.0000', '2019-02-22 16:28:06', null, '1');
INSERT INTO `g_orders` VALUES ('12', '20190222162807198', null, '1', '1', null, null, '2019-02-22 16:28:07', null, '1');
INSERT INTO `g_orders` VALUES ('13', '20190222162807621', null, '1', '1', null, null, '2019-02-22 16:28:07', null, '1');
INSERT INTO `g_orders` VALUES ('14', '20190222162807612', null, '1', '1', null, null, '2019-02-22 16:28:07', null, '1');
INSERT INTO `g_orders` VALUES ('16', '20190222162857853', null, '1', '1', null, null, '2019-02-22 16:28:57', null, '1');
INSERT INTO `g_orders` VALUES ('17', '20190222162857800', null, '1', '1', null, null, '2019-02-22 16:28:57', null, '1');
INSERT INTO `g_orders` VALUES ('18', '20190222162857321', null, '1', '1', null, null, '2019-02-22 16:28:57', null, '1');
INSERT INTO `g_orders` VALUES ('19', '20190222162857700', null, '1', '1', null, null, '2019-02-22 16:28:57', null, '1');
INSERT INTO `g_orders` VALUES ('20', '20190222162857526', null, '1', '1', null, null, '2019-02-22 16:28:57', null, '1');
INSERT INTO `g_orders` VALUES ('21', '20190222162857998', null, '1', '1', null, null, '2019-02-22 16:28:57', null, '1');
INSERT INTO `g_orders` VALUES ('22', '20190222162857725', null, '1', '1', null, null, '2019-02-22 16:28:57', null, '1');
INSERT INTO `g_orders` VALUES ('23', '20190222162857300', null, '1', '1', null, null, '2019-02-22 16:28:57', null, '1');
INSERT INTO `g_orders` VALUES ('24', '20190222162857972', null, '1', '1', null, null, '2019-02-22 16:28:57', null, '1');
INSERT INTO `g_orders` VALUES ('25', '20190222162857481', null, '1', '1', null, null, '2019-02-22 16:28:57', null, '1');
INSERT INTO `g_orders` VALUES ('26', '20190222162857392', null, '1', '1', null, null, '2019-02-22 16:28:57', null, '1');
INSERT INTO `g_orders` VALUES ('27', '20190222162858419', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('28', '20190222162858833', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('29', '20190222162858372', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('30', '20190222162858466', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('31', '20190222162858106', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('32', '20190222162858521', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('33', '20190222162858857', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('34', '20190222162858790', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('35', '20190222162858102', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('36', '20190222162858236', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('37', '20190222162858864', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('38', '20190222162858794', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('39', '20190222162858112', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('40', '20190222162858394', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('41', '20190222162858187', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('42', '20190222162858910', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('43', '20190222162858319', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('44', '20190222162858580', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('45', '20190222162858949', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('46', '20190222162858213', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('47', '20190222162858915', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('48', '20190222162858173', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('49', '20190222162858454', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('51', '20190222162858808', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('52', '20190222162858253', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('53', '20190222162858231', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('59', '20190222162858634', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('60', '20190222162858208', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('61', '20190222162858956', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('62', '20190222162858985', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('63', '20190222162858229', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('64', '20190222162858883', null, '1', '1', null, null, '2019-02-22 16:28:58', null, '1');
INSERT INTO `g_orders` VALUES ('66', '20190222163002822', null, '1', '1', null, null, '2019-02-22 16:30:02', null, '1');
INSERT INTO `g_orders` VALUES ('67', '20190222163002156', null, '1', '1', null, null, '2019-02-22 16:30:02', null, '1');
INSERT INTO `g_orders` VALUES ('68', '20190222163002976', null, '1', '1', null, null, '2019-02-22 16:30:02', null, '1');
INSERT INTO `g_orders` VALUES ('69', '20190222163002950', null, '1', '1', null, null, '2019-02-22 16:30:02', null, '1');
INSERT INTO `g_orders` VALUES ('70', '20190222163002260', null, '1', '1', null, null, '2019-02-22 16:30:02', null, '1');
INSERT INTO `g_orders` VALUES ('71', '20190222163002906', null, '1', '1', null, null, '2019-02-22 16:30:02', null, '1');
INSERT INTO `g_orders` VALUES ('72', '20190222163002467', null, '1', '1', null, null, '2019-02-22 16:30:02', null, '1');
INSERT INTO `g_orders` VALUES ('73', '20190222163002735', null, '1', '1', null, null, '2019-02-22 16:30:02', null, '1');
INSERT INTO `g_orders` VALUES ('74', '20190222163002766', null, '1', '1', null, null, '2019-02-22 16:30:02', null, '1');
INSERT INTO `g_orders` VALUES ('75', '20190222163002736', null, '1', '1', null, null, '2019-02-22 16:30:02', null, '1');
INSERT INTO `g_orders` VALUES ('76', '20190222163002792', null, '1', '1', null, null, '2019-02-22 16:30:02', null, '1');
INSERT INTO `g_orders` VALUES ('77', '20190222163002322', null, '1', '1', null, null, '2019-02-22 16:30:02', null, '1');
INSERT INTO `g_orders` VALUES ('78', '20190222163002805', null, '1', '1', null, null, '2019-02-22 16:30:02', null, '1');
INSERT INTO `g_orders` VALUES ('79', '20190222163003707', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('80', '20190222163003784', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('81', '20190222163003432', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('82', '20190222163003265', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('83', '20190222163003247', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('84', '20190222163003511', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('85', '20190222163003285', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('86', '20190222163003823', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('87', '20190222163003483', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('88', '20190222163003876', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('89', '20190222163003593', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('90', '20190222163003687', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('91', '20190222163003527', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('92', '20190222163003228', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('93', '20190222163003503', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('94', '20190222163003298', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('95', '20190222163003251', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('96', '20190222163003289', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('97', '20190222163003541', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('98', '20190222163003482', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('99', '20190222163003684', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('100', '20190222163003564', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('101', '20190222163003966', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('102', '20190222163003682', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('103', '20190222163003669', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('104', '20190222163003275', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('105', '20190222163003107', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('106', '20190222163003472', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('107', '20190222163003803', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('108', '20190222163003212', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('109', '20190222163003399', null, '1', '1', null, null, '2019-02-22 16:30:03', null, '1');
INSERT INTO `g_orders` VALUES ('111', '20190222163017101', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('112', '20190222163017223', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('113', '20190222163017626', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('114', '20190222163017899', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('115', '20190222163017650', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('116', '20190222163017672', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('117', '20190222163017611', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('118', '20190222163017178', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('119', '20190222163017576', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('120', '20190222163017355', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('121', '20190222163017655', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('122', '20190222163017256', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('123', '20190222163017776', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('124', '20190222163017747', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('125', '20190222163017917', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('126', '20190222163017800', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('127', '20190222163017648', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('128', '20190222163017620', null, '1', '1', null, null, '2019-02-22 16:30:17', null, '1');
INSERT INTO `g_orders` VALUES ('129', '20190222163018548', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('130', '20190222163018342', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('131', '20190222163018665', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('132', '20190222163018558', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('133', '20190222163018118', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('134', '20190222163018823', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('135', '20190222163018187', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('136', '20190222163018650', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('137', '20190222163018766', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('138', '20190222163018603', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('139', '20190222163018978', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('140', '20190222163018552', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('141', '20190222163018791', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('142', '20190222163018169', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('143', '20190222163018588', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('144', '20190222163018664', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('145', '20190222163018125', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('146', '20190222163018912', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('147', '20190222163018908', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('148', '20190222163018940', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('149', '20190222163018703', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('150', '20190222163018400', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('151', '20190222163018375', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('152', '20190222163018832', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('153', '20190222163018745', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('154', '20190222163018373', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('155', '20190222163018381', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('156', '20190222163018280', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('157', '20190222163018102', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('158', '20190222163018329', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('159', '20190222163018837', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('160', '20190222163018338', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('161', '20190222163018693', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('162', '20190222163018240', null, '1', '1', null, null, '2019-02-22 16:30:18', null, '1');
INSERT INTO `g_orders` VALUES ('164', '2019022216342919703', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('165', '2019022216342993804', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('166', '2019022216342974948', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('167', '2019022216342939792', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('168', '2019022216342981509', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('169', '2019022216342920557', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('170', '2019022216342917006', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('171', '2019022216342948112', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('172', '2019022216342941080', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('173', '2019022216342977520', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('174', '2019022216342923164', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('175', '2019022216342912436', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('176', '2019022216342927816', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('177', '2019022216342956585', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('178', '2019022216342914782', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('179', '2019022216342941590', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('180', '2019022216342927183', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('181', '2019022216342952178', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('182', '2019022216342926732', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('183', '2019022216342938320', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('184', '2019022216342937489', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('185', '2019022216342997423', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('186', '2019022216342973643', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('187', '2019022216342972407', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('188', '2019022216342982947', null, '1', '1', null, null, '2019-02-22 16:34:29', null, '1');
INSERT INTO `g_orders` VALUES ('189', '2019022216343024336', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('190', '2019022216343075875', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('191', '2019022216343052607', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('192', '2019022216343046667', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('193', '2019022216343053208', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('194', '2019022216343050956', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('195', '2019022216343039291', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('196', '2019022216343017934', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('197', '2019022216343077134', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('198', '2019022216343044141', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('199', '2019022216343054475', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('200', '2019022216343097765', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('201', '2019022216343017266', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('202', '2019022216343078165', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('203', '2019022216343069743', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('204', '2019022216343081636', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('205', '2019022216343023409', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('206', '2019022216343070049', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('207', '2019022216343040261', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('208', '2019022216343044514', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('209', '2019022216343033429', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('210', '2019022216343054529', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('211', '2019022216343015200', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('212', '2019022216343068042', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('213', '2019022216343075994', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('214', '2019022216343021513', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('215', '2019022216343084814', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('216', '2019022216343067846', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('217', '2019022216343075760', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('218', '2019022216343018822', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('219', '2019022216343035791', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('220', '2019022216343060638', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('221', '2019022216343020003', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('222', '2019022216343014323', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('223', '2019022216343092112', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('224', '2019022216343091233', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('225', '2019022216343094424', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('226', '2019022216343072960', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('227', '2019022216343086425', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('228', '2019022216343085447', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('229', '2019022216343035670', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('230', '2019022216343088705', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('231', '2019022216343014373', null, '1', '1', null, null, '2019-02-22 16:34:30', null, '1');
INSERT INTO `g_orders` VALUES ('232', '2019022216343114747', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('233', '2019022216343160831', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('234', '2019022216343133083', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('235', '2019022216343181100', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('236', '2019022216343173156', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('237', '2019022216343130072', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('238', '2019022216343192969', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('239', '2019022216343155764', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('240', '2019022216343142808', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('241', '2019022216343141486', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('242', '2019022216343142963', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('243', '2019022216343182918', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('244', '2019022216343118786', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('245', '2019022216343160673', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('246', '2019022216343183718', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('247', '2019022216343154599', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('248', '2019022216343113921', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('249', '2019022216343143103', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('250', '2019022216343163684', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('251', '2019022216343112071', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('252', '2019022216343116204', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('253', '2019022216343119244', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('254', '2019022216343139793', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('255', '2019022216343142881', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('256', '2019022216343196601', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('257', '2019022216343199490', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('258', '2019022216343130900', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('259', '2019022216343151693', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('260', '2019022216343174070', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('261', '2019022216343142093', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('262', '2019022216343143146', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('263', '2019022216343180946', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('264', '2019022216343169664', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('265', '2019022216343155098', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('266', '2019022216343159894', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('267', '2019022216343112112', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('268', '2019022216343151087', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('269', '2019022216343151652', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('270', '2019022216343171609', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('271', '2019022216343185700', null, '1', '1', null, null, '2019-02-22 16:34:31', null, '1');
INSERT INTO `g_orders` VALUES ('272', '2019022216343283829', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('273', '2019022216343211454', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('274', '2019022216343293171', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('275', '2019022216343247166', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('276', '2019022216343257626', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('277', '2019022216343240402', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('278', '2019022216343269012', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('279', '2019022216343247620', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('280', '2019022216343213667', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('281', '2019022216343211108', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('282', '2019022216343288041', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('283', '2019022216343242815', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('284', '2019022216343221124', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('285', '2019022216343216020', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('286', '2019022216343224276', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('287', '2019022216343247068', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('288', '2019022216343245811', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('289', '2019022216343286810', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('290', '2019022216343267094', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('291', '2019022216343243498', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('292', '2019022216343242615', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('293', '2019022216343258210', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('294', '2019022216343292462', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('295', '2019022216343262886', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('296', '2019022216343292683', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('297', '2019022216343225008', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('298', '2019022216343291007', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('299', '2019022216343264068', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('300', '2019022216343238237', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('301', '2019022216343259889', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('302', '2019022216343273765', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('303', '2019022216343252537', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('304', '2019022216343264332', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('305', '2019022216343229483', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('306', '2019022216343271187', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('307', '2019022216343297218', null, '1', '1', null, null, '2019-02-22 16:34:32', null, '1');
INSERT INTO `g_orders` VALUES ('308', '2019022216343336462', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('309', '2019022216343387818', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('310', '2019022216343380382', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('311', '2019022216343316898', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('312', '2019022216343347638', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('313', '2019022216343333045', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('314', '2019022216343319125', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('315', '2019022216343365966', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('316', '2019022216343391244', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('317', '2019022216343359941', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('318', '2019022216343347690', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('319', '2019022216343396637', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('320', '2019022216343356894', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('321', '2019022216343331262', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('322', '2019022216343381943', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('323', '2019022216343315560', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('324', '2019022216343398149', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('325', '2019022216343314803', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('326', '2019022216343327916', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('327', '2019022216343337192', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('328', '2019022216343395397', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('329', '2019022216343337820', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('330', '2019022216343340015', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('331', '2019022216343359911', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('332', '2019022216343358178', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('333', '2019022216343326193', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('334', '2019022216343364061', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('335', '2019022216343381420', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('336', '2019022216343370444', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('337', '2019022216343365653', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('338', '2019022216343373411', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('339', '2019022216343383948', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('340', '2019022216343334323', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('341', '2019022216343376598', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('342', '2019022216343366469', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('343', '2019022216343333537', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('344', '2019022216343338992', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('345', '2019022216343379013', null, '1', '1', null, null, '2019-02-22 16:34:33', null, '1');
INSERT INTO `g_orders` VALUES ('346', '2019022216343470321', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('347', '2019022216343484997', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('348', '2019022216343482061', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('349', '2019022216343474182', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('350', '2019022216343440915', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('351', '2019022216343419748', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('352', '2019022216343496990', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('353', '2019022216343445076', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('354', '2019022216343473540', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('355', '2019022216343491574', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('356', '2019022216343488048', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('357', '2019022216343438747', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('358', '2019022216343433767', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('359', '2019022216343422859', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('360', '2019022216343440423', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('361', '2019022216343422308', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('362', '2019022216343460052', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('363', '2019022216343440218', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('364', '2019022216343443688', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('365', '2019022216343418113', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('366', '2019022216343440965', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('367', '2019022216343475313', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('368', '2019022216343472274', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('369', '2019022216343465385', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('370', '2019022216343451854', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('371', '2019022216343436758', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('372', '2019022216343451724', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('373', '2019022216343421940', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('374', '2019022216343441351', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('375', '2019022216343448207', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('376', '2019022216343493773', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('377', '2019022216343487828', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('378', '2019022216343414785', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('379', '2019022216343430457', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('380', '2019022216343485632', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('381', '2019022216343492896', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('382', '2019022216343494345', null, '1', '1', null, null, '2019-02-22 16:34:34', null, '1');
INSERT INTO `g_orders` VALUES ('383', '2019022216343556486', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('384', '2019022216343544145', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('385', '2019022216343560375', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('386', '2019022216343529830', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('387', '2019022216343523395', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('388', '2019022216343586033', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('389', '2019022216343574086', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('390', '2019022216343593341', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('391', '2019022216343526713', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('392', '2019022216343527487', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('393', '2019022216343511835', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('394', '2019022216343567496', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('395', '2019022216343595913', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('396', '2019022216343544879', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('397', '2019022216343579498', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('398', '2019022216343526554', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('399', '2019022216343559053', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('400', '2019022216343573021', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('401', '2019022216343545923', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('402', '2019022216343535363', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('403', '2019022216343578595', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('404', '2019022216343595034', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('405', '2019022216343518291', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('406', '2019022216343532228', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('407', '2019022216343587728', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('408', '2019022216343526773', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('409', '2019022216343579147', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('410', '2019022216343592842', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('411', '2019022216343561674', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('412', '2019022216343566230', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('413', '2019022216343573314', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('414', '2019022216343576904', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('415', '2019022216343581361', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('416', '2019022216343543726', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('417', '2019022216343598540', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('418', '2019022216343538730', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('419', '2019022216343529014', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('420', '2019022216343522701', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('421', '2019022216343580193', null, '1', '1', null, null, '2019-02-22 16:34:35', null, '1');
INSERT INTO `g_orders` VALUES ('422', '2019022216343659368', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('423', '2019022216343646263', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('424', '2019022216343674680', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('425', '2019022216343612568', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('426', '2019022216343616668', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('427', '2019022216343623581', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('428', '2019022216343628032', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('429', '2019022216343650392', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('430', '2019022216343675167', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('431', '2019022216343674650', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('432', '2019022216343621855', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('433', '2019022216343613390', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('434', '2019022216343657727', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('435', '2019022216343676301', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('436', '2019022216343630189', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('437', '2019022216343666883', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('438', '2019022216343699089', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('439', '2019022216343620752', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('440', '2019022216343642487', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('441', '2019022216343680487', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('442', '2019022216343666881', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('443', '2019022216343696358', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('444', '2019022216343658878', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('445', '2019022216343671473', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('446', '2019022216343618080', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('447', '2019022216343660274', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('448', '2019022216343682485', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('449', '2019022216343634762', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('450', '2019022216343698113', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('451', '2019022216343621289', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('452', '2019022216343661474', null, '1', '1', null, null, '2019-02-22 16:34:36', null, '1');
INSERT INTO `g_orders` VALUES ('453', '2019022216343776420', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('454', '2019022216343788708', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('455', '2019022216343797680', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('456', '2019022216343767547', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('457', '2019022216343744272', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('458', '2019022216343753251', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('459', '2019022216343773335', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('460', '2019022216343714111', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('461', '2019022216343758100', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('462', '2019022216343776898', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('463', '2019022216343738168', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('464', '2019022216343733122', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('465', '2019022216343715801', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('466', '2019022216343792138', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('467', '2019022216343778406', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('468', '2019022216343730488', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('469', '2019022216343753618', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('470', '2019022216343724349', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('471', '2019022216343770084', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('472', '2019022216343732463', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('473', '2019022216343776039', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('474', '2019022216343772574', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('475', '2019022216343764563', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('476', '2019022216343733543', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('477', '2019022216343756247', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('478', '2019022216343746814', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('479', '2019022216343723243', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('480', '2019022216343720299', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('481', '2019022216343786491', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('482', '2019022216343720652', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('483', '2019022216343763970', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('484', '2019022216343739568', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('485', '2019022216343786072', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('486', '2019022216343719253', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('487', '2019022216343741166', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('488', '2019022216343768881', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('489', '2019022216343738248', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('490', '2019022216343716795', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('491', '2019022216343764870', null, '1', '1', null, null, '2019-02-22 16:34:37', null, '1');
INSERT INTO `g_orders` VALUES ('492', '2019022216343891386', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('493', '2019022216343872508', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('494', '2019022216343815190', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('495', '2019022216343886047', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('496', '2019022216343858190', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('497', '2019022216343861188', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('498', '2019022216343898863', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('499', '2019022216343867706', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('500', '2019022216343836657', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('501', '2019022216343887138', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('502', '2019022216343865702', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('503', '2019022216343814110', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('504', '2019022216343836776', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('505', '2019022216343831749', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('506', '2019022216343892258', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('507', '2019022216343827158', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('508', '2019022216343845688', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('509', '2019022216343883649', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('510', '2019022216343898140', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('511', '2019022216343831835', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('512', '2019022216343881597', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('513', '2019022216343893841', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('514', '2019022216343858606', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('515', '2019022216343888956', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('516', '2019022216343882720', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('517', '2019022216343851076', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('518', '2019022216343845967', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('519', '2019022216343853701', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('520', '2019022216343866610', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('521', '2019022216343862290', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('522', '2019022216343844026', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('523', '2019022216343895890', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('524', '2019022216343875683', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('525', '2019022216343834973', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('526', '2019022216343873350', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('527', '2019022216343888893', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('528', '2019022216343838819', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('529', '2019022216343827532', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('530', '2019022216343883740', null, '1', '1', null, null, '2019-02-22 16:34:38', null, '1');
INSERT INTO `g_orders` VALUES ('531', '2019022216343983271', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('532', '2019022216343918490', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('533', '2019022216343951878', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('534', '2019022216343999285', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('535', '2019022216343969511', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('536', '2019022216343967144', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('537', '2019022216343920151', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('538', '2019022216343948579', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('539', '2019022216343921646', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('540', '2019022216343964058', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('541', '2019022216343932300', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('542', '2019022216343937176', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('543', '2019022216343955654', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('544', '2019022216343992840', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('545', '2019022216343993080', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('546', '2019022216343932974', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('547', '2019022216343958784', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('548', '2019022216343910145', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('549', '2019022216343923696', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('550', '2019022216343988918', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('551', '2019022216343936185', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('552', '2019022216343967267', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('553', '2019022216343952410', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('554', '2019022216343930382', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('555', '2019022216343915573', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('556', '2019022216343922460', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('557', '2019022216343916588', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('558', '2019022216343923043', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('559', '2019022216343918531', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('560', '2019022216343954713', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('561', '2019022216343962761', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('562', '2019022216343970055', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('563', '2019022216343946201', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('564', '2019022216343967321', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('565', '2019022216343953303', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('566', '2019022216343946865', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('567', '2019022216343950708', null, '1', '1', null, null, '2019-02-22 16:34:39', null, '1');
INSERT INTO `g_orders` VALUES ('568', '2019022216344091666', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('569', '2019022216344025298', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('570', '2019022216344015676', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('571', '2019022216344070168', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('572', '2019022216344022114', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('573', '2019022216344058659', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('574', '2019022216344015501', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('575', '2019022216344036584', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('576', '2019022216344015587', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('577', '2019022216344056905', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('578', '2019022216344040923', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('579', '2019022216344085386', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('580', '2019022216344084030', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('581', '2019022216344018103', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('582', '2019022216344037695', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('583', '2019022216344013278', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('584', '2019022216344093032', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('585', '2019022216344028114', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('586', '2019022216344056873', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('587', '2019022216344017576', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('588', '2019022216344092083', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('589', '2019022216344061403', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('590', '2019022216344067910', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('591', '2019022216344017666', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('592', '2019022216344084473', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('593', '2019022216344095999', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('594', '2019022216344073722', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('595', '2019022216344086740', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('596', '2019022216344084558', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('597', '2019022216344015952', null, '1', '1', null, null, '2019-02-22 16:34:40', null, '1');
INSERT INTO `g_orders` VALUES ('598', '2019022216344182074', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('599', '2019022216344165832', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('600', '2019022216344162159', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('601', '2019022216344148530', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('602', '2019022216344192644', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('603', '2019022216344163475', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('604', '2019022216344112230', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('605', '2019022216344121095', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('606', '2019022216344120733', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('607', '2019022216344124087', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('608', '2019022216344191065', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('609', '2019022216344173457', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('610', '2019022216344136107', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('611', '2019022216344124925', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('612', '2019022216344158609', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('613', '2019022216344179249', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('614', '2019022216344178261', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('615', '2019022216344153724', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('616', '2019022216344146407', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('617', '2019022216344138224', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('618', '2019022216344138593', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('619', '2019022216344129254', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('620', '2019022216344128502', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('621', '2019022216344198251', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('622', '2019022216344180256', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('623', '2019022216344110609', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('624', '2019022216344119267', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('625', '2019022216344190602', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('626', '2019022216344118030', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('627', '2019022216344167161', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('628', '2019022216344133790', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('629', '2019022216344137573', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('630', '2019022216344149786', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('631', '2019022216344167787', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('632', '2019022216344129878', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('633', '2019022216344147612', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('634', '2019022216344195732', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('635', '2019022216344140396', null, '1', '1', null, null, '2019-02-22 16:34:41', null, '1');
INSERT INTO `g_orders` VALUES ('636', '2019022216344285936', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('637', '2019022216344299221', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('638', '2019022216344231790', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('639', '2019022216344271028', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('640', '2019022216344273423', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('641', '2019022216344235786', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('642', '2019022216344219136', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('643', '2019022216344241510', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('644', '2019022216344276466', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('645', '2019022216344289268', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('646', '2019022216344217899', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('647', '2019022216344276679', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('648', '2019022216344235806', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('649', '2019022216344280214', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('650', '2019022216344231812', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('651', '2019022216344262502', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('652', '2019022216344291229', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('653', '2019022216344290849', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('654', '2019022216344295067', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('655', '2019022216344288637', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('656', '2019022216344218514', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('657', '2019022216344294029', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('658', '2019022216344289928', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('659', '2019022216344252376', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('660', '2019022216344295804', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('661', '2019022216344288892', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('662', '2019022216344216717', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('663', '2019022216344257600', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('664', '2019022216344243947', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('665', '2019022216344246592', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('666', '2019022216344239729', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('667', '2019022216344265523', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('668', '2019022216344277377', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('669', '2019022216344270472', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('670', '2019022216344212572', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('671', '2019022216344254631', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('672', '2019022216344224850', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('673', '2019022216344270468', null, '1', '1', null, null, '2019-02-22 16:34:42', null, '1');
INSERT INTO `g_orders` VALUES ('674', '2019022216344335241', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('675', '2019022216344335378', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('676', '2019022216344385020', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('677', '2019022216344336989', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('678', '2019022216344327620', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('679', '2019022216344311871', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('680', '2019022216344366977', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('681', '2019022216344385729', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('682', '2019022216344336070', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('683', '2019022216344393771', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('684', '2019022216344317026', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('685', '2019022216344319557', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('686', '2019022216344338361', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('687', '2019022216344312845', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('688', '2019022216344378817', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('689', '2019022216344331926', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('690', '2019022216344377234', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('691', '2019022216344310124', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('692', '2019022216344337252', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('693', '2019022216344376671', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('694', '2019022216344341487', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('695', '2019022216344398211', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('696', '2019022216344352632', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('697', '2019022216344326120', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('698', '2019022216344322598', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('699', '2019022216344314291', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('700', '2019022216344368150', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('701', '2019022216344386241', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('702', '2019022216344335236', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('703', '2019022216344373319', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('704', '2019022216344385934', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('705', '2019022216344372879', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('706', '2019022216344371296', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('707', '2019022216344368719', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('708', '2019022216344334005', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('709', '2019022216344327628', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('710', '2019022216344338887', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('711', '2019022216344340213', null, '1', '1', null, null, '2019-02-22 16:34:43', null, '1');
INSERT INTO `g_orders` VALUES ('712', '2019022216344454063', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('713', '2019022216344435280', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('714', '2019022216344493755', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('715', '2019022216344423838', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('716', '2019022216344459132', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('717', '2019022216344498977', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('718', '2019022216344488377', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('719', '2019022216344468376', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('720', '2019022216344453762', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('721', '2019022216344446096', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('722', '2019022216344431966', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('723', '2019022216344412492', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('724', '2019022216344439652', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('725', '2019022216344410972', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('726', '2019022216344431608', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('727', '2019022216344451815', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('728', '2019022216344470017', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('729', '2019022216344453996', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('730', '2019022216344435768', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('731', '2019022216344413636', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('732', '2019022216344427179', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('733', '2019022216344433689', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('734', '2019022216344435473', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('735', '2019022216344410798', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('736', '2019022216344465906', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('737', '2019022216344475040', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('738', '2019022216344422606', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('739', '2019022216344424155', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('740', '2019022216344475496', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('741', '2019022216344447031', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('742', '2019022216344434123', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('743', '2019022216344445067', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('744', '2019022216344499179', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('745', '2019022216344438791', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('746', '2019022216344424426', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('747', '2019022216344424982', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('748', '2019022216344474820', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('749', '2019022216344426754', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('750', '2019022216344414948', null, '1', '1', null, null, '2019-02-22 16:34:44', null, '1');
INSERT INTO `g_orders` VALUES ('751', '2019022216344543236', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('752', '2019022216344556961', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('753', '2019022216344563136', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('754', '2019022216344556930', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('755', '2019022216344563463', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('756', '2019022216344563419', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('757', '2019022216344593800', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('758', '2019022216344541429', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('759', '2019022216344532968', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('760', '2019022216344573522', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('761', '2019022216344520217', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('762', '2019022216344582432', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('763', '2019022216344534255', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('764', '2019022216344588957', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('765', '2019022216344531902', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('766', '2019022216344575533', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('767', '2019022216344568003', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('768', '2019022216344572264', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('769', '2019022216344540986', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('770', '2019022216344538373', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('771', '2019022216344590215', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('772', '2019022216344518725', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('773', '2019022216344583854', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('774', '2019022216344574696', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('775', '2019022216344534549', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('776', '2019022216344574163', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('777', '2019022216344518163', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('778', '2019022216344537644', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('779', '2019022216344511766', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('780', '2019022216344564755', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('781', '2019022216344544468', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('782', '2019022216344582097', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('783', '2019022216344579631', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('784', '2019022216344554115', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('785', '2019022216344541520', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('786', '2019022216344531855', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('787', '2019022216344551565', null, '1', '1', null, null, '2019-02-22 16:34:45', null, '1');
INSERT INTO `g_orders` VALUES ('788', '2019022216344663051', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('789', '2019022216344613881', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('790', '2019022216344656296', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('791', '2019022216344644690', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('792', '2019022216344672455', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('793', '2019022216344674443', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('794', '2019022216344642328', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('795', '2019022216344644256', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('796', '2019022216344699905', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('797', '2019022216344659903', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('798', '2019022216344659019', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('799', '2019022216344642245', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('800', '2019022216344691487', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('801', '2019022216344698052', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('802', '2019022216344649601', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('803', '2019022216344659957', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('804', '2019022216344662784', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('805', '2019022216344623280', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('806', '2019022216344657280', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('807', '2019022216344668804', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('808', '2019022216344671766', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('809', '2019022216344624328', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('810', '2019022216344686331', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('811', '2019022216344671336', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('812', '2019022216344638421', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('813', '2019022216344687980', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('814', '2019022216344665825', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('815', '2019022216344698867', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('816', '2019022216344626051', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('817', '2019022216344655178', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('818', '2019022216344693925', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('819', '2019022216344627974', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('820', '2019022216344646191', null, '1', '1', null, null, '2019-02-22 16:34:46', null, '1');
INSERT INTO `g_orders` VALUES ('821', '2019022216344785865', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('822', '2019022216344745715', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('823', '2019022216344795802', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('824', '2019022216344758801', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('825', '2019022216344775014', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('826', '2019022216344786050', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('827', '2019022216344759842', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('828', '2019022216344792544', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('829', '2019022216344749770', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('830', '2019022216344722737', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('831', '2019022216344774075', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('832', '2019022216344732797', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('833', '2019022216344746477', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('834', '2019022216344747891', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('835', '2019022216344741635', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('836', '2019022216344790059', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('837', '2019022216344776408', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('838', '2019022216344711230', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('839', '2019022216344765697', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('840', '2019022216344767186', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('841', '2019022216344755271', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('842', '2019022216344785483', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('843', '2019022216344746739', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('844', '2019022216344728694', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('845', '2019022216344734539', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('846', '2019022216344738004', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('847', '2019022216344751234', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('848', '2019022216344791420', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('849', '2019022216344715880', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('850', '2019022216344718950', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('851', '2019022216344737123', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('852', '2019022216344784804', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('853', '2019022216344717177', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('854', '2019022216344713134', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('855', '2019022216344794954', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('856', '2019022216344765927', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('857', '2019022216344738030', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('858', '2019022216344739236', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('859', '2019022216344743217', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('860', '2019022216344718002', null, '1', '1', null, null, '2019-02-22 16:34:47', null, '1');
INSERT INTO `g_orders` VALUES ('861', '2019022216344843087', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('862', '2019022216344826650', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('863', '2019022216344828561', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('864', '2019022216344832824', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('865', '2019022216344896603', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('866', '2019022216344810049', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('867', '2019022216344841513', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('868', '2019022216344868309', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('869', '2019022216344824261', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('870', '2019022216344826185', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('871', '2019022216344899164', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('872', '2019022216344828456', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('873', '2019022216344898187', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('874', '2019022216344879462', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('875', '2019022216344886092', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('876', '2019022216344820592', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('877', '2019022216344866422', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('878', '2019022216344886688', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('879', '2019022216344859285', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('880', '2019022216344876230', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('881', '2019022216344814800', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('882', '2019022216344845146', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('883', '2019022216344894581', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('884', '2019022216344840729', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('885', '2019022216344812617', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('886', '2019022216344853169', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('887', '2019022216344886656', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('888', '2019022216344887955', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('889', '2019022216344881245', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('890', '2019022216344832063', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('891', '2019022216344858002', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('892', '2019022216344893476', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('893', '2019022216344884036', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('894', '2019022216344835393', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('895', '2019022216344896157', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('896', '2019022216344868454', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('897', '2019022216344875221', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('898', '2019022216344893112', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('899', '2019022216344812151', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('900', '2019022216344822854', null, '1', '1', null, null, '2019-02-22 16:34:48', null, '1');
INSERT INTO `g_orders` VALUES ('901', '2019022216344954872', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('902', '2019022216344926888', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('903', '2019022216344917020', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('904', '2019022216344981388', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('905', '2019022216344943199', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('906', '2019022216344988297', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('907', '2019022216344928857', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('908', '2019022216344923612', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('909', '2019022216344998915', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('910', '2019022216344946891', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('911', '2019022216344990696', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('912', '2019022216344941212', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('913', '2019022216344956767', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('914', '2019022216344977668', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('915', '2019022216344964786', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('916', '2019022216344981930', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('917', '2019022216344973598', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('918', '2019022216344931002', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('919', '2019022216344916657', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('920', '2019022216344937474', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('921', '2019022216344922091', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('922', '2019022216344982471', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('923', '2019022216344918140', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('924', '2019022216344952421', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('925', '2019022216344922748', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('926', '2019022216344950426', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('927', '2019022216344933364', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('928', '2019022216344990095', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('929', '2019022216344961531', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('930', '2019022216344988236', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('931', '2019022216344942710', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('932', '2019022216344917363', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('933', '2019022216344935515', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('934', '2019022216344968528', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('935', '2019022216344982394', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('936', '2019022216344948735', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('937', '2019022216344994423', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('938', '2019022216344995423', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('939', '2019022216344963246', null, '1', '1', null, null, '2019-02-22 16:34:49', null, '1');
INSERT INTO `g_orders` VALUES ('940', '2019022216345072868', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('941', '2019022216345095273', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('942', '2019022216345074384', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('943', '2019022216345015847', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('944', '2019022216345081641', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('945', '2019022216345058562', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('946', '2019022216345017919', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('947', '2019022216345083402', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('948', '2019022216345073364', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('949', '2019022216345013308', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('950', '2019022216345042572', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('951', '2019022216345059111', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('952', '2019022216345019962', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('953', '2019022216345027292', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('954', '2019022216345068897', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('955', '2019022216345073417', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('956', '2019022216345054861', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('957', '2019022216345021609', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('958', '2019022216345096828', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('959', '2019022216345025251', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('960', '2019022216345058320', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('961', '2019022216345070829', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('962', '2019022216345010874', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('963', '2019022216345019155', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('964', '2019022216345086075', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('965', '2019022216345023030', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('966', '2019022216345022899', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('967', '2019022216345047825', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('968', '2019022216345072583', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('969', '2019022216345048660', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('970', '2019022216345091294', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('971', '2019022216345036661', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('972', '2019022216345054908', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('973', '2019022216345083307', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('974', '2019022216345098670', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('975', '2019022216345044974', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('976', '2019022216345056474', null, '1', '1', null, null, '2019-02-22 16:34:50', null, '1');
INSERT INTO `g_orders` VALUES ('977', '2019022216345138245', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('978', '2019022216345138399', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('979', '2019022216345125385', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('980', '2019022216345146720', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('981', '2019022216345129213', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('982', '2019022216345144578', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('983', '2019022216345144077', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('984', '2019022216345176263', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('985', '2019022216345162303', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('986', '2019022216345147399', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('987', '2019022216345169858', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('988', '2019022216345190708', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('989', '2019022216345114746', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('990', '2019022216345193794', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('991', '2019022216345129373', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('992', '2019022216345173950', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('993', '2019022216345160692', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('994', '2019022216345137607', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('995', '2019022216345178304', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('996', '2019022216345169312', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('997', '2019022216345172202', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('998', '2019022216345128025', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('999', '2019022216345162672', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1000', '2019022216345138537', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1001', '2019022216345178170', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1002', '2019022216345158405', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1003', '2019022216345146159', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1004', '2019022216345181382', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1005', '2019022216345150839', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1006', '2019022216345153508', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1007', '2019022216345119107', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1008', '2019022216345161470', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1009', '2019022216345195967', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1010', '2019022216345110148', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1011', '2019022216345149104', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1012', '2019022216345131662', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1013', '2019022216345169642', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1014', '2019022216345148248', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1015', '2019022216345119938', null, '1', '1', null, null, '2019-02-22 16:34:51', null, '1');
INSERT INTO `g_orders` VALUES ('1016', '2019022216345234592', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1017', '2019022216345227804', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1018', '2019022216345236959', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1019', '2019022216345291993', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1020', '2019022216345265236', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1021', '2019022216345251549', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1022', '2019022216345232314', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1023', '2019022216345260035', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1024', '2019022216345239837', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1025', '2019022216345236591', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1026', '2019022216345266706', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1027', '2019022216345238100', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1028', '2019022216345233550', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1029', '2019022216345224556', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1030', '2019022216345274624', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1031', '2019022216345226856', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1032', '2019022216345218654', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1033', '2019022216345222725', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1034', '2019022216345283898', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1035', '2019022216345239542', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1036', '2019022216345286222', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1037', '2019022216345222351', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1038', '2019022216345298665', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1039', '2019022216345253481', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1040', '2019022216345238159', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1041', '2019022216345263696', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1042', '2019022216345256795', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1043', '2019022216345255845', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1044', '2019022216345299908', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1045', '2019022216345245655', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1046', '2019022216345258279', null, '1', '1', null, null, '2019-02-22 16:34:52', null, '1');
INSERT INTO `g_orders` VALUES ('1047', '2019022216345366411', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1048', '2019022216345317307', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1049', '2019022216345391139', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1050', '2019022216345345874', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1051', '2019022216345351358', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1052', '2019022216345322948', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1053', '2019022216345363789', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1054', '2019022216345315470', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1055', '2019022216345379831', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1056', '2019022216345327556', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1057', '2019022216345375096', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1058', '2019022216345398820', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1059', '2019022216345331722', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1060', '2019022216345373338', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1061', '2019022216345327922', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1062', '2019022216345350491', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1063', '2019022216345378023', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1064', '2019022216345338034', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1065', '2019022216345320437', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1066', '2019022216345346008', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1067', '2019022216345360221', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1068', '2019022216345310138', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1069', '2019022216345310627', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1070', '2019022216345320681', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1071', '2019022216345327309', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1072', '2019022216345362739', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1073', '2019022216345346264', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1074', '2019022216345344368', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1075', '2019022216345366613', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1076', '2019022216345356352', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1077', '2019022216345321176', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1078', '2019022216345375179', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1079', '2019022216345367817', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1080', '2019022216345371915', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1081', '2019022216345336037', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1082', '2019022216345337469', null, '1', '1', null, null, '2019-02-22 16:34:53', null, '1');
INSERT INTO `g_orders` VALUES ('1083', '2019022216345427593', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1084', '2019022216345497040', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1085', '2019022216345465433', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1086', '2019022216345499866', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1087', '2019022216345448568', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1088', '2019022216345423995', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1089', '2019022216345418803', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1090', '2019022216345451305', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1091', '2019022216345485572', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1092', '2019022216345484123', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1093', '2019022216345418190', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1094', '2019022216345438507', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1095', '2019022216345427938', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1096', '2019022216345494260', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1097', '2019022216345499506', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1098', '2019022216345452285', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1099', '2019022216345497866', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1100', '2019022216345438888', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1101', '2019022216345438088', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1102', '2019022216345413688', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1103', '2019022216345497286', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1104', '2019022216345415253', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1105', '2019022216345444241', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1106', '2019022216345473306', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1107', '2019022216345494641', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1108', '2019022216345458435', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1109', '2019022216345478490', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1110', '2019022216345465411', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1111', '2019022216345486401', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1112', '2019022216345462917', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1113', '2019022216345457829', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1114', '2019022216345482506', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1115', '2019022216345457147', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1116', '2019022216345473253', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1117', '2019022216345467493', null, '1', '1', null, null, '2019-02-22 16:34:54', null, '1');
INSERT INTO `g_orders` VALUES ('1118', '2019022216345583097', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1119', '2019022216345571411', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1120', '2019022216345568948', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1121', '2019022216345537315', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1122', '2019022216345588455', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1123', '2019022216345584814', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1124', '2019022216345595382', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1125', '2019022216345558933', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1126', '2019022216345581301', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1127', '2019022216345524327', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1128', '2019022216345590513', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1129', '2019022216345560801', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1130', '2019022216345570602', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1131', '2019022216345574237', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1132', '2019022216345555082', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1133', '2019022216345518441', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1134', '2019022216345534650', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1135', '2019022216345542389', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1136', '2019022216345543536', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1137', '2019022216345585692', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1138', '2019022216345566321', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1139', '2019022216345538878', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1140', '2019022216345551806', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1141', '2019022216345594413', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1142', '2019022216345567595', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1143', '2019022216345574600', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1144', '2019022216345589047', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1145', '2019022216345530488', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1146', '2019022216345547862', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1147', '2019022216345594994', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1148', '2019022216345524138', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1149', '2019022216345553684', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1150', '2019022216345582756', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1151', '2019022216345599207', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1152', '2019022216345560141', null, '1', '1', null, null, '2019-02-22 16:34:55', null, '1');
INSERT INTO `g_orders` VALUES ('1153', '2019022216345669825', null, '1', '1', null, null, '2019-02-22 16:34:56', null, '1');
INSERT INTO `g_orders` VALUES ('1154', '2019022216345665403', null, '1', '1', null, null, '2019-02-22 16:34:56', null, '1');
INSERT INTO `g_orders` VALUES ('1155', '2019022216345674232', null, '1', '1', null, null, '2019-02-22 16:34:56', null, '1');
INSERT INTO `g_orders` VALUES ('1156', '2019022216345611781', null, '1', '1', null, null, '2019-02-22 16:34:56', null, '1');
INSERT INTO `g_orders` VALUES ('1158', '2019022216345693485', null, '1', '1', null, null, '2019-02-22 16:34:56', null, '1');
INSERT INTO `g_orders` VALUES ('1159', '2019022216345614345', null, '1', '1', null, null, '2019-02-22 16:34:56', null, '1');
INSERT INTO `g_orders` VALUES ('1160', '2019022216345661197', null, '1', '1', null, null, '2019-02-22 16:34:56', null, '1');
INSERT INTO `g_orders` VALUES ('1161', '2019022216345643638', null, '1', '1', null, null, '2019-02-22 16:34:56', null, '1');
INSERT INTO `g_orders` VALUES ('1162', '2019022216345698363', null, '1', '1', null, null, '2019-02-22 16:34:56', null, '1');
INSERT INTO `g_orders` VALUES ('1163', '2019022216345636155', null, '1', '1', null, null, '2019-02-22 16:34:56', null, '1');
INSERT INTO `g_orders` VALUES ('1164', '20190301032723148444', null, '1', '2', '280.0000', '1867.6000', '2019-03-01 15:27:23', null, '1');
INSERT INTO `g_orders` VALUES ('1165', '20190306043525726550', null, '1', null, '380.0000', '4104.0000', '2019-03-06 16:35:25', null, '1');
INSERT INTO `g_orders` VALUES ('1166', '20190306052955231193', null, '1', null, '388.0000', '3608.4000', '2019-03-06 17:29:55', null, '1');
INSERT INTO `g_orders` VALUES ('1168', '20190307093531554159', null, '1', null, '380.0000', '2014.0000', '2019-03-07 09:35:31', null, '1');
INSERT INTO `g_orders` VALUES ('1169', '20190307093827522253', null, '1', null, '380.0000', '2014.0000', '2019-03-07 09:38:27', null, '1');
INSERT INTO `g_orders` VALUES ('1170', '20190307093910095888', null, '1', null, '380.0000', '2014.0000', '2019-03-07 09:39:10', null, '1');
INSERT INTO `g_orders` VALUES ('1171', '20190307094632195483', null, '1', '2', '388.0000', '4423.2000', '2019-03-07 09:46:32', null, '1');
INSERT INTO `g_orders` VALUES ('1172', '20190307104656725503', null, '1', '2', '388.0000', '9777.6000', '2019-03-07 10:46:56', null, '1');
INSERT INTO `g_orders` VALUES ('1173', '20190307113358065454', null, '1', null, '380.0000', '2014.0000', '2019-03-07 11:33:58', null, '1');
INSERT INTO `g_orders` VALUES ('1174', '20190307011435028339', null, '1', '4', '388.0000', '2056.4000', '2019-03-07 13:14:35', null, '1');
INSERT INTO `g_orders` VALUES ('1175', '20190307011541646982', null, '1', '4', '388.0000', '2056.4000', '2019-03-07 13:15:41', null, '1');
INSERT INTO `g_orders` VALUES ('1176', '20190307012524287384', null, '1', '4', '388.0000', '2056.4000', '2019-03-07 13:25:24', null, '1');
INSERT INTO `g_orders` VALUES ('1177', '20190307012618842973', null, '1', '4', '388.0000', '2056.4000', '2019-03-07 13:26:18', null, '1');
INSERT INTO `g_orders` VALUES ('1179', '20190311114626515805', null, '1', '5', '388.0000', '38800.0000', '2019-03-11 11:46:26', null, '1');
INSERT INTO `g_orders` VALUES ('1180', '20190311115300878588', null, '1', '3', '388.0000', '232800.0000', '2019-03-11 11:53:00', null, '1');
INSERT INTO `g_orders` VALUES ('1181', '20190311115441650241', null, '1', null, '388.0000', '38800.0000', '2019-03-11 11:54:41', null, '1');
INSERT INTO `g_orders` VALUES ('1182', '20190311115642543332', null, '1', null, '380.0000', '2014.0000', '2019-03-11 11:56:42', null, '1');
INSERT INTO `g_orders` VALUES ('1183', '20190311124935221695', null, '1', null, '380.0000', '38000.0000', '2019-03-11 12:49:35', null, '1');
INSERT INTO `g_orders` VALUES ('1184', '20190311125007110639', null, '1', '4', '388.0000', '58200.0000', '2019-03-11 12:50:07', null, '1');
INSERT INTO `g_orders` VALUES ('1185', '20190313014005488987', null, '2', null, '388.0000', '2056.4000', '2019-03-13 13:40:05', null, '1');
INSERT INTO `g_orders` VALUES ('1186', '20190313032308036527', null, '2', '7', '388.0000', '23280.0000', '2019-03-13 15:23:08', null, '1');
INSERT INTO `g_orders` VALUES ('1187', '20190314113232311768', null, '3', '8', '388.0000', '77600.0000', '2019-03-14 11:32:32', null, '1');
INSERT INTO `g_orders` VALUES ('1188', '20190318092622819997', null, '3', '9', '388.0000', '11640.0000', '2019-03-18 09:26:22', null, '1');
INSERT INTO `g_orders` VALUES ('1189', '20190404025203757491', '2', '1', '9', '1000.0000', '1000.0000', '2019-04-04 14:52:03', '1', '1');
INSERT INTO `g_orders` VALUES ('1190', '20190404025715115683', '2', '1', '10', '1000.0000', '2000.0000', '2019-04-04 14:57:15', '1', '2');
INSERT INTO `g_orders` VALUES ('1191', '20190409041346464353', '2', '1', '13', '1000.0000', '1000.0000', '2019-04-09 16:13:46', '1', '1');
INSERT INTO `g_orders` VALUES ('1192', '20190410101359691363', '2', '1', '14', '3800.0000', '19000.0000', '2019-04-10 10:13:59', '2', '5');
INSERT INTO `g_orders` VALUES ('1193', '20190410101425570851', '2', '1', '15', '3800.0000', '11400.0000', '2019-04-10 10:14:25', '2', '3');
INSERT INTO `g_orders` VALUES ('1194', '20190410101454700633', '2', '1', '17', '1000.0000', '5000.0000', '2019-04-10 10:14:54', '1', '5');
INSERT INTO `g_orders` VALUES ('1195', '20190410102951135713', '3', '1', '15', '1000.0000', '1000.0000', '2019-04-10 10:29:51', '1', '1');
INSERT INTO `g_orders` VALUES ('1196', '20190410104047021559', '3', '1', '21', '5000.0000', '5000.0000', '2019-04-10 10:40:47', '3', '1');
INSERT INTO `g_orders` VALUES ('1197', '20190410114435389469', '4', '0', '23', '3800.0000', '3800.0000', '2019-04-10 11:44:35', '2', '1');

-- ----------------------------
-- Table structure for `g_order_info`
-- ----------------------------
DROP TABLE IF EXISTS `g_order_info`;
CREATE TABLE `g_order_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `orderId` bigint(20) unsigned NOT NULL,
  `number` varchar(30) NOT NULL,
  `weight` decimal(19,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of g_order_info
-- ----------------------------
INSERT INTO `g_order_info` VALUES ('1', '1166', '213123', '5.3000');
INSERT INTO `g_order_info` VALUES ('2', '1166', '423442', '4.0000');
INSERT INTO `g_order_info` VALUES ('3', '1167', '23453453', '5.3000');
INSERT INTO `g_order_info` VALUES ('4', '1168', '4353453', '5.3000');
INSERT INTO `g_order_info` VALUES ('5', '1169', '4353453', '5.3000');
INSERT INTO `g_order_info` VALUES ('6', '1170', '4353453', '5.3000');
INSERT INTO `g_order_info` VALUES ('7', '1171', '2342', '5.3000');
INSERT INTO `g_order_info` VALUES ('8', '1171', '4333', '6.1000');
INSERT INTO `g_order_info` VALUES ('9', '1172', '65464', '5.3000');
INSERT INTO `g_order_info` VALUES ('10', '1172', '65465', '4.0000');
INSERT INTO `g_order_info` VALUES ('11', '1172', '54415', '2.8000');
INSERT INTO `g_order_info` VALUES ('12', '1172', '32511', '3.1000');
INSERT INTO `g_order_info` VALUES ('13', '1172', '15541', '2.9000');
INSERT INTO `g_order_info` VALUES ('14', '1172', '95548', '7.1000');
INSERT INTO `g_order_info` VALUES ('15', '1173', '241', '5.3000');
INSERT INTO `g_order_info` VALUES ('16', '1174', '65464', '5.3000');
INSERT INTO `g_order_info` VALUES ('17', '1175', '65464', '5.3000');
INSERT INTO `g_order_info` VALUES ('18', '1176', '5345', '5.3000');
INSERT INTO `g_order_info` VALUES ('19', '1177', '43534', '5.3000');
INSERT INTO `g_order_info` VALUES ('20', '1178', '423534', '4.0000');
INSERT INTO `g_order_info` VALUES ('21', '1179', '673565463', '100.0000');
INSERT INTO `g_order_info` VALUES ('22', '1180', '346453654', '100.0000');
INSERT INTO `g_order_info` VALUES ('23', '1180', '654643565', '500.0000');
INSERT INTO `g_order_info` VALUES ('24', '1181', '346453654', '100.0000');
INSERT INTO `g_order_info` VALUES ('25', '1182', '456345645', '5.3000');
INSERT INTO `g_order_info` VALUES ('26', '1183', '535543', '100.0000');
INSERT INTO `g_order_info` VALUES ('27', '1184', '65465132', '50.0000');
INSERT INTO `g_order_info` VALUES ('28', '1184', '54644575', '100.0000');
INSERT INTO `g_order_info` VALUES ('29', '1185', '5463464', '5.3000');
INSERT INTO `g_order_info` VALUES ('30', '1186', '32442', '10.0000');
INSERT INTO `g_order_info` VALUES ('31', '1186', '43224', '50.0000');
INSERT INTO `g_order_info` VALUES ('32', '1187', '3453543', '200.0000');
INSERT INTO `g_order_info` VALUES ('33', '1188', '23424322', '30.0000');

-- ----------------------------
-- Table structure for `g_pay`
-- ----------------------------
DROP TABLE IF EXISTS `g_pay`;
CREATE TABLE `g_pay` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `orderId` bigint(20) unsigned NOT NULL,
  `clientId` int(10) unsigned DEFAULT NULL,
  `orders` int(10) unsigned DEFAULT NULL COMMENT '返点季度数序号，如：1=一季度，2=二季度，3=三季度，4=四季度',
  `money` decimal(19,4) NOT NULL,
  `state` int(11) DEFAULT NULL COMMENT '支付状态，0=未支付，1=已支付',
  `adminId` int(11) DEFAULT NULL COMMENT '操作人',
  `dueTime` timestamp NULL DEFAULT NULL COMMENT '到期支付时间',
  `payTime` timestamp NULL DEFAULT NULL COMMENT '实际支付时间',
  `companyId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of g_pay
-- ----------------------------
INSERT INTO `g_pay` VALUES ('1', '1175', '4', '1', '51.4000', '1', null, '2019-03-13 08:00:00', null, null);
INSERT INTO `g_pay` VALUES ('2', '1175', '4', '2', '51.4000', '0', null, '2019-03-11 08:00:00', null, null);
INSERT INTO `g_pay` VALUES ('3', '1175', '4', '3', '51.4000', '0', null, '2019-12-10 08:00:00', null, null);
INSERT INTO `g_pay` VALUES ('4', '1175', '4', '4', '51.4000', '0', null, '2020-03-10 08:00:00', null, null);
INSERT INTO `g_pay` VALUES ('5', '1184', '4', '1', '1455.0000', '0', null, '2019-06-11 08:00:00', null, null);
INSERT INTO `g_pay` VALUES ('6', '1184', '4', '2', '1455.0000', '0', null, '2019-09-11 08:00:00', null, null);
INSERT INTO `g_pay` VALUES ('7', '1184', '4', '3', '1455.0000', '0', null, '2019-12-11 08:00:00', null, null);
INSERT INTO `g_pay` VALUES ('8', '1184', '4', '4', '1455.0000', '0', null, '2020-03-11 08:00:00', null, null);
INSERT INTO `g_pay` VALUES ('9', '1180', '3', '1', '5820.0000', '1', '2', '2019-06-11 08:00:00', '2019-03-13 16:39:53', null);
INSERT INTO `g_pay` VALUES ('10', '1180', '3', '2', '5820.0000', '0', null, '2019-09-11 08:00:00', null, null);
INSERT INTO `g_pay` VALUES ('11', '1180', '3', '3', '5820.0000', '0', null, '2019-12-11 08:00:00', null, null);
INSERT INTO `g_pay` VALUES ('12', '1180', '3', '4', '5820.0000', '0', null, '2020-03-11 08:00:00', null, null);
INSERT INTO `g_pay` VALUES ('13', '1186', '7', '1', '465.6000', '1', '3', '2019-06-13 08:00:00', null, '2');
INSERT INTO `g_pay` VALUES ('14', '1186', '7', '2', '465.6000', '0', null, '2019-09-13 08:00:00', null, '2');
INSERT INTO `g_pay` VALUES ('15', '1186', '7', '3', '465.6000', '0', null, '2019-12-13 08:00:00', null, '2');
INSERT INTO `g_pay` VALUES ('16', '1186', '7', '4', '465.6000', '0', null, '2020-03-13 08:00:00', null, '2');
INSERT INTO `g_pay` VALUES ('17', '1187', '8', '1', '1552.0000', '1', '5', '2019-03-18 08:00:00', '2019-03-18 11:34:57', '3');
INSERT INTO `g_pay` VALUES ('18', '1187', '8', '2', '1552.0000', '0', '5', '2019-09-18 08:00:00', '2019-03-18 11:11:32', '3');
INSERT INTO `g_pay` VALUES ('19', '1187', '8', '3', '1552.0000', '0', '5', '2019-12-18 08:00:00', '2019-03-18 11:21:24', '3');
INSERT INTO `g_pay` VALUES ('20', '1187', '8', '4', '1552.0000', '0', null, '2020-03-18 08:00:00', null, '3');
INSERT INTO `g_pay` VALUES ('21', '1189', '9', null, '200.0000', '1', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('22', '1190', '10', null, '200.0000', '1', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('23', '1190', '9', null, '300.0000', '2', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('24', '1191', '13', null, '200.0000', '1', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('25', '1191', '12', null, '300.0000', '2', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('26', '1191', '11', null, '500.0000', '3', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('27', '1192', '14', null, '4000.0000', '1', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('28', '1193', '15', null, '2400.0000', '1', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('29', '1193', '14', null, '1500.0000', '2', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('30', '1194', '17', null, '1000.0000', '1', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('31', '1194', '16', null, '2500.0000', '2', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('32', '1194', '15', null, '2500.0000', '3', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('33', '1195', '15', null, '200.0000', '1', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('34', '1195', '14', null, '500.0000', '2', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('35', '1196', '21', null, '1000.0000', '1', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('36', '1196', '14', null, '500.0000', '2', null, null, null, '0');
INSERT INTO `g_pay` VALUES ('37', '1197', '23', null, '800.0000', '1', null, null, null, '0');

-- ----------------------------
-- Table structure for `g_products`
-- ----------------------------
DROP TABLE IF EXISTS `g_products`;
CREATE TABLE `g_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `price` decimal(19,2) NOT NULL COMMENT '单价',
  `payCommission` decimal(19,2) NOT NULL COMMENT '销售佣金',
  `adCommission` decimal(19,2) NOT NULL COMMENT '推广佣金',
  `descript` varchar(2000) DEFAULT NULL,
  `show` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of g_products
-- ----------------------------
INSERT INTO `g_products` VALUES ('1', '1号套装', '1000.00', '200.00', '500.00', null, '1');
INSERT INTO `g_products` VALUES ('2', '产品2', '3800.00', '800.00', '500.00', null, '1');
INSERT INTO `g_products` VALUES ('3', '产品3', '5000.00', '1000.00', '500.00', null, '1');

-- ----------------------------
-- Table structure for `g_rule_pay`
-- ----------------------------
DROP TABLE IF EXISTS `g_rule_pay`;
CREATE TABLE `g_rule_pay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `count` int(10) unsigned NOT NULL,
  `money` decimal(19,2) unsigned NOT NULL,
  `descript` varchar(2000) DEFAULT NULL,
  `adminId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `count` (`count`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of g_rule_pay
-- ----------------------------
INSERT INTO `g_rule_pay` VALUES ('1', '100', '500.00', '初级达标100套', '3');
INSERT INTO `g_rule_pay` VALUES ('10', '500', '400.00', '500套以内规则', '3');
INSERT INTO `g_rule_pay` VALUES ('11', '1000', '300.00', '1000套以内规则', '3');
INSERT INTO `g_rule_pay` VALUES ('12', '2000', '200.00', '2000套以内规则', '3');
INSERT INTO `g_rule_pay` VALUES ('13', '3000', '100.00', '3000套以内规则', '3');
INSERT INTO `g_rule_pay` VALUES ('14', '5000', '100.00', '5000套以内规则', '3');

-- ----------------------------
-- Procedure structure for `pr`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr`()
begin

declare i int;
set i=5000;

while i<6000 
do
	
insert into g_orders (number,weight,username,type,state,photo) values (CONCAT(DATE_FORMAT(NOW(),'%Y%m%d%H%i%s'),floor(rand()*90000+10000)),rand()*10,'admin',0,1,'/sdfsdfs/sdfsdfs/sdfs');

set i=i+1;

end while;

end
;;
DELIMITER ;
