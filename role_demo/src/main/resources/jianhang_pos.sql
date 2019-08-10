/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50644
 Source Host           : localhost:3306
 Source Schema         : jianhang_pos

 Target Server Type    : MySQL
 Target Server Version : 50644
 File Encoding         : 65001

 Date: 10/08/2019 17:34:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for g_admins
-- ----------------------------
DROP TABLE IF EXISTS `g_admins`;
CREATE TABLE `g_admins`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` int(11) NOT NULL,
  `addTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `companyId` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系电话',
  `sex` int(10) DEFAULT 0 COMMENT '0表示男，1表示女',
  `idcard` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `companyId`(`companyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of g_admins
-- ----------------------------
INSERT INTO `g_admins` VALUES (1, 'test', 'f216a7ce3d5fa7827e6c77f8ff8fc596', 1, '2019-07-24 12:53:42', NULL, '李方', '15074319294', 0, '43310119851030003x');
INSERT INTO `g_admins` VALUES (2, '10001', '7d5416383e9a1cbba1aaed0e178cd911', 2, '2019-07-28 12:43:30', NULL, '10001', '15111111111', 1, '433101198510300033');
INSERT INTO `g_admins` VALUES (3, '1111', '60aa93b675f31f8f0a58276ac1a762b2', 3, '2019-07-28 14:29:15', NULL, '', '', 0, '');

-- ----------------------------
-- Table structure for g_client
-- ----------------------------
DROP TABLE IF EXISTS `g_client`;
CREATE TABLE `g_client`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `companyId` int(11) DEFAULT NULL,
  `number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `longitude` decimal(19, 8) DEFAULT NULL COMMENT '经度',
  `latitude` decimal(19, 8) DEFAULT NULL COMMENT '维度',
  `manager` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系人',
  `userId` int(10) UNSIGNED DEFAULT NULL,
  `isChecked` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `number`(`number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of g_client
-- ----------------------------
INSERT INTO `g_client` VALUES (1, NULL, '42342342', '皮包公司1', '亏大发了时间舍得离开房间', '1238439827', NULL, NULL, NULL, NULL, 0);
INSERT INTO `g_client` VALUES (2, NULL, '0011', '大商铺', '武陵东路55号', NULL, NULL, NULL, '张三', NULL, 0);
INSERT INTO `g_client` VALUES (3, NULL, '0012', '小商铺', '团结西路32号', NULL, NULL, NULL, '李四', NULL, 0);
INSERT INTO `g_client` VALUES (4, NULL, '0013', '中商铺', '光明北路17号', NULL, NULL, NULL, '王五', NULL, 0);
INSERT INTO `g_client` VALUES (5, NULL, '0014', '新商铺', '光明西路', NULL, NULL, NULL, '赵六', NULL, 0);

-- ----------------------------
-- Table structure for g_company
-- ----------------------------
DROP TABLE IF EXISTS `g_company`;
CREATE TABLE `g_company`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parentId` int(10) UNSIGNED DEFAULT NULL COMMENT '上级公司id',
  `name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `addTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bankName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bankNumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bankUser` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fax` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of g_company
-- ----------------------------
INSERT INTO `g_company` VALUES (1, NULL, '深圳市金玉满唐黄金珠宝有限公司', '0755-26530009', '深圳市南山区常兴路国兴大厦702', '2019-02-26 16:07:24', '中国银行深圳市沙头角保税区支行', '6232632000100837367', '深圳市金玉满唐黄金珠宝有限公司', '0755-26530016');
INSERT INTO `g_company` VALUES (2, NULL, '乾州分公司', '251651', '乾州', '2019-03-13 10:07:20', NULL, NULL, NULL, NULL);
INSERT INTO `g_company` VALUES (3, NULL, '吉首分公司', '8520960', '武陵山大道32号', '2019-03-14 09:51:14', '234123142', '213423', '5122323423', '0755-26530016');

-- ----------------------------
-- Table structure for g_nav
-- ----------------------------
DROP TABLE IF EXISTS `g_nav`;
CREATE TABLE `g_nav`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hide` int(11) NOT NULL DEFAULT 0,
  `parent` int(10) UNSIGNED DEFAULT 0,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of g_nav
-- ----------------------------
INSERT INTO `g_nav` VALUES (1, '个人信息', '/admin/self', 0, 0, 'fa fa-cog');
INSERT INTO `g_nav` VALUES (2, '导航菜单', '/nav/index', 0, 0, 'fa fa-bars');
INSERT INTO `g_nav` VALUES (3, '岗位角色', '/role/index', 0, 0, 'fa fa-group');
INSERT INTO `g_nav` VALUES (4, '用户管理', '/admin/index', 0, 0, 'fa fa-user');
INSERT INTO `g_nav` VALUES (5, '客户管理', '/client/index', 0, 0, 'fa fa-street-view');
INSERT INTO `g_nav` VALUES (6, '终端管理', '/terminal/index', 0, 0, 'fa fa-microchip');

-- ----------------------------
-- Table structure for g_role
-- ----------------------------
DROP TABLE IF EXISTS `g_role`;
CREATE TABLE `g_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of g_role
-- ----------------------------
INSERT INTO `g_role` VALUES (1, '超级管理员');
INSERT INTO `g_role` VALUES (2, '普通管理员');
INSERT INTO `g_role` VALUES (3, '操作员');

-- ----------------------------
-- Table structure for g_role_nav
-- ----------------------------
DROP TABLE IF EXISTS `g_role_nav`;
CREATE TABLE `g_role_nav`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `roleId` int(10) UNSIGNED NOT NULL,
  `navId` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roleId`(`roleId`, `navId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of g_role_nav
-- ----------------------------
INSERT INTO `g_role_nav` VALUES (1, 1, 1);
INSERT INTO `g_role_nav` VALUES (2, 1, 2);
INSERT INTO `g_role_nav` VALUES (3, 1, 3);
INSERT INTO `g_role_nav` VALUES (5, 2, 1);
INSERT INTO `g_role_nav` VALUES (24, 2, 3);
INSERT INTO `g_role_nav` VALUES (25, 2, 4);
INSERT INTO `g_role_nav` VALUES (26, 3, 1);

-- ----------------------------
-- Table structure for g_terminal
-- ----------------------------
DROP TABLE IF EXISTS `g_terminal`;
CREATE TABLE `g_terminal`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `userId` int(10) UNSIGNED DEFAULT NULL,
  `addTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `number`(`number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of g_terminal
-- ----------------------------
INSERT INTO `g_terminal` VALUES (1, '100001', 2, NULL, '2019-08-10 15:37:04');
INSERT INTO `g_terminal` VALUES (2, '100002', 3, NULL, '2019-08-10 15:38:06');
INSERT INTO `g_terminal` VALUES (3, '100003', 4, NULL, '2019-08-10 15:39:26');
INSERT INTO `g_terminal` VALUES (4, '100004', 3, NULL, '2019-08-10 16:17:39');
INSERT INTO `g_terminal` VALUES (5, '100005', 1, NULL, '2019-08-10 17:20:01');
INSERT INTO `g_terminal` VALUES (6, '100006', 5, NULL, '2019-08-10 17:20:59');

SET FOREIGN_KEY_CHECKS = 1;
