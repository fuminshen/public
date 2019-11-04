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

 Date: 09/09/2019 13:49:51
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
  `companyId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系电话',
  `sex` int(10) DEFAULT 0 COMMENT '0表示男，1表示女',
  `idcard` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `companyId`(`companyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of g_admins
-- ----------------------------
INSERT INTO `g_admins` VALUES (1, 'test', 'f216a7ce3d5fa7827e6c77f8ff8fc596', 1, '2019-07-24 12:53:42', 0, '李方', '15074319294', 0, '43310119851030003x');
INSERT INTO `g_admins` VALUES (2, '10001', '7d5416383e9a1cbba1aaed0e178cd911', 2, '2019-07-28 12:43:30', 2, '10001', '15111111111', 1, '433101198510300033');
INSERT INTO `g_admins` VALUES (3, '1111', '60aa93b675f31f8f0a58276ac1a762b2', 3, '2019-07-28 14:29:15', 0, '11', '', 0, '');
INSERT INTO `g_admins` VALUES (4, '2222', '06d594db3f69bbd4e3a3d9cc2afdb3e2', 3, '2019-08-14 16:57:46', 1, '22', '', 0, '');
INSERT INTO `g_admins` VALUES (5, '3333', '8055eb6f7af8b361196d30a843c0bda8', 3, '2019-09-04 10:13:50', 1, '', '', 0, '');
INSERT INTO `g_admins` VALUES (6, '4444', 'cfb8477abe0dcbdf43047200b4a3707a', 3, '2019-09-04 10:14:33', 2, '', '', 0, '');
INSERT INTO `g_admins` VALUES (7, '10002', '458215f95b60b04a71adf805474e9183', 3, '2019-09-06 09:37:35', 2, '吉首业务员', '', 0, '');

-- ----------------------------
-- Table structure for g_client
-- ----------------------------
DROP TABLE IF EXISTS `g_client`;
CREATE TABLE `g_client`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `companyId` int(11) NOT NULL DEFAULT 0,
  `number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `longitude` decimal(19, 8) NOT NULL DEFAULT 0.00000000 COMMENT '经度',
  `latitude` decimal(19, 8) NOT NULL DEFAULT 0.00000000 COMMENT '维度',
  `manager` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系人',
  `userId` int(11) DEFAULT 0,
  `isChecked` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `number`(`number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of g_client
-- ----------------------------
INSERT INTO `g_client` VALUES (1, 1, '42342342', '皮包公司1', '亏大发了时间舍得离开房间', '1238439827', 0.00000000, 0.00000000, NULL, 5, 0);
INSERT INTO `g_client` VALUES (2, 1, '0011', '大商铺', '武陵东路55号', NULL, 0.00000000, 0.00000000, '张三', 4, 1);
INSERT INTO `g_client` VALUES (3, 1, '0012', '小商铺', '团结西路32号', NULL, 0.00000000, 0.00000000, '李四', 5, 1);
INSERT INTO `g_client` VALUES (4, 1, '0013', '中商铺', '光明北路17号', NULL, 0.00000000, 0.00000000, '王五', 4, 1);
INSERT INTO `g_client` VALUES (5, 1, '0014', '新商铺', '光明西路', NULL, 0.00000000, 0.00000000, '赵六', 5, 0);
INSERT INTO `g_client` VALUES (6, 2, '0015', '吉首南杂店', '香桂圆', NULL, 0.00000000, 0.00000000, '龙不良', 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of g_company
-- ----------------------------
INSERT INTO `g_company` VALUES (1, NULL, '总权限', '0743-8888888', '吉首机电街', '2019-02-26 16:07:24', '中国银行深圳市沙头角保税区支行', '6232632000100837367', '深圳市金玉满唐黄金珠宝有限公司', '0755-26530016');
INSERT INTO `g_company` VALUES (2, NULL, '吉首', '8888888', '吉首机电街', '2019-03-13 10:07:20', NULL, NULL, NULL, NULL);
INSERT INTO `g_company` VALUES (3, NULL, '永顺', '8888888', '永顺xx街道', '2019-03-14 09:51:14', '234123142', '213423', '5122323423', '0755-26530016');
INSERT INTO `g_company` VALUES (4, NULL, '龙山', '8888888', '龙山街道', '2019-09-03 15:49:54', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for g_inspection
-- ----------------------------
DROP TABLE IF EXISTS `g_inspection`;
CREATE TABLE `g_inspection`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `clientId` int(10) UNSIGNED NOT NULL,
  `terminalId` int(11) NOT NULL,
  `userId` int(10) UNSIGNED NOT NULL,
  `companyId` int(10) UNSIGNED DEFAULT NULL,
  `longitude` decimal(19, 8) NOT NULL DEFAULT 0.00000000,
  `latitude` decimal(19, 8) NOT NULL DEFAULT 0.00000000,
  `type` int(11) NOT NULL,
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `time_userId_companyId`(`time`, `userId`, `companyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of g_inspection
-- ----------------------------
INSERT INTO `g_inspection` VALUES (1, 2, 0, 4, 0, 0.00000000, 0.00000000, 1, '2019-08-19 11:52:37');
INSERT INTO `g_inspection` VALUES (3, 3, 2, 4, 0, 0.00000000, 0.00000000, 1, '2019-09-03 09:59:15');
INSERT INTO `g_inspection` VALUES (4, 3, 4, 4, 0, 0.00000000, 0.00000000, 1, '2019-09-03 09:59:15');
INSERT INTO `g_inspection` VALUES (5, 2, 12, 4, NULL, 0.00000000, 0.00000000, 2, '2019-09-03 11:00:36');
INSERT INTO `g_inspection` VALUES (6, 6, 14, 2, NULL, 0.00000000, 0.00000000, 2, '2019-09-04 13:50:30');
INSERT INTO `g_inspection` VALUES (7, 4, 15, 4, NULL, 0.00000000, 0.00000000, 2, '2019-09-04 13:57:07');
INSERT INTO `g_inspection` VALUES (8, 2, 17, 4, NULL, 0.00000000, 0.00000000, 2, '2019-09-04 14:03:28');
INSERT INTO `g_inspection` VALUES (9, 4, 18, 4, NULL, 0.00000000, 0.00000000, 4, '2019-09-07 10:57:19');
INSERT INTO `g_inspection` VALUES (10, 4, 19, 4, NULL, 0.00000000, 0.00000000, 4, '2019-09-07 11:00:12');
INSERT INTO `g_inspection` VALUES (11, 4, 20, 4, NULL, 0.00000000, 0.00000000, 4, '2019-09-07 11:01:30');
INSERT INTO `g_inspection` VALUES (12, 4, 21, 4, NULL, 0.00000000, 0.00000000, 4, '2019-09-07 11:02:58');
INSERT INTO `g_inspection` VALUES (13, 2, 22, 4, NULL, 0.00000000, 0.00000000, 4, '2019-09-07 11:28:03');

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of g_nav
-- ----------------------------
INSERT INTO `g_nav` VALUES (1, '个人信息', '/admin/self', 0, 0, 'fa fa-cog');
INSERT INTO `g_nav` VALUES (2, '导航菜单', '/nav/index', 0, 0, 'fa fa-bars');
INSERT INTO `g_nav` VALUES (3, '岗位角色', '/role/index', 0, 0, 'fa fa-group');
INSERT INTO `g_nav` VALUES (4, '用户管理', '/admin/index', 0, 0, 'fa fa-user');
INSERT INTO `g_nav` VALUES (5, '客户管理', '/client/index', 0, 0, 'fa fa-street-view');
INSERT INTO `g_nav` VALUES (6, '终端管理', '/terminal/index', 0, 0, 'fa fa-laptop');
INSERT INTO `g_nav` VALUES (7, '客户分配', '/client/distribute', 0, 0, 'fa fa-group');
INSERT INTO `g_nav` VALUES (8, '客户巡检', '/client/inspectionlist', 0, 0, 'fa fa-cogs');
INSERT INTO `g_nav` VALUES (9, '巡检记录', '/inspection/index', 0, 0, 'fa fa-address-card');
INSERT INTO `g_nav` VALUES (10, '记录汇总', '/inspection/totals', 0, 0, 'fa fa-bar-chart');
INSERT INTO `g_nav` VALUES (11, '地区管理', '/company/index', 0, 0, 'fa fa-sitemap');

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
INSERT INTO `g_role` VALUES (3, '业务员');

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
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of g_role_nav
-- ----------------------------
INSERT INTO `g_role_nav` VALUES (1, 1, 1);
INSERT INTO `g_role_nav` VALUES (2, 1, 2);
INSERT INTO `g_role_nav` VALUES (3, 1, 3);
INSERT INTO `g_role_nav` VALUES (34, 1, 4);
INSERT INTO `g_role_nav` VALUES (35, 1, 5);
INSERT INTO `g_role_nav` VALUES (36, 1, 6);
INSERT INTO `g_role_nav` VALUES (37, 1, 7);
INSERT INTO `g_role_nav` VALUES (38, 1, 8);
INSERT INTO `g_role_nav` VALUES (39, 1, 9);
INSERT INTO `g_role_nav` VALUES (40, 1, 10);
INSERT INTO `g_role_nav` VALUES (41, 1, 11);
INSERT INTO `g_role_nav` VALUES (5, 2, 1);
INSERT INTO `g_role_nav` VALUES (24, 2, 3);
INSERT INTO `g_role_nav` VALUES (25, 2, 4);
INSERT INTO `g_role_nav` VALUES (28, 2, 5);
INSERT INTO `g_role_nav` VALUES (29, 2, 6);
INSERT INTO `g_role_nav` VALUES (30, 2, 7);
INSERT INTO `g_role_nav` VALUES (31, 2, 9);
INSERT INTO `g_role_nav` VALUES (32, 2, 10);
INSERT INTO `g_role_nav` VALUES (26, 3, 1);
INSERT INTO `g_role_nav` VALUES (27, 3, 8);
INSERT INTO `g_role_nav` VALUES (42, 3, 9);

-- ----------------------------
-- Table structure for g_terminal
-- ----------------------------
DROP TABLE IF EXISTS `g_terminal`;
CREATE TABLE `g_terminal`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `posNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `userId` int(10) UNSIGNED DEFAULT NULL,
  `addTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changeId` int(10) UNSIGNED DEFAULT NULL COMMENT '换机时用于替换的前一个设备id',
  `type` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1:新装。2:拆机。3:换机',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `number`(`number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of g_terminal
-- ----------------------------
INSERT INTO `g_terminal` VALUES (1, '100001', NULL, 2, NULL, '2019-08-10 15:37:04', NULL, 0);
INSERT INTO `g_terminal` VALUES (2, '100002', NULL, 3, NULL, '2019-08-10 15:38:06', NULL, 0);
INSERT INTO `g_terminal` VALUES (3, '100003', NULL, 4, NULL, '2019-08-10 15:39:26', NULL, 0);
INSERT INTO `g_terminal` VALUES (5, '100005', NULL, 1, NULL, '2019-08-10 17:20:01', NULL, 0);
INSERT INTO `g_terminal` VALUES (6, '100006', NULL, 5, NULL, '2019-08-10 17:20:59', NULL, 0);
INSERT INTO `g_terminal` VALUES (7, '100007', NULL, 3, NULL, '2019-09-03 10:22:48', NULL, 0);
INSERT INTO `g_terminal` VALUES (12, '10008', '12654621625', 2, 4, '2019-09-03 11:00:36', NULL, 0);
INSERT INTO `g_terminal` VALUES (14, '100008', '1000008', 6, 2, '2019-09-04 13:50:30', NULL, 0);
INSERT INTO `g_terminal` VALUES (15, '100009', '1000009', 4, 4, '2019-09-04 13:57:07', NULL, 0);
INSERT INTO `g_terminal` VALUES (16, '100010', '1000010', 6, 2, '2019-09-04 14:02:16', NULL, 0);
INSERT INTO `g_terminal` VALUES (22, '100111', '1000111', 2, 4, '2019-09-07 11:28:03', 17, 1);

-- ----------------------------
-- Table structure for g_terminal_old
-- ----------------------------
DROP TABLE IF EXISTS `g_terminal_old`;
CREATE TABLE `g_terminal_old`  (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `posNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `userId` int(10) UNSIGNED DEFAULT NULL,
  `addTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changeId` int(10) UNSIGNED DEFAULT NULL COMMENT '换机时用于替换的前一个设备id',
  `type` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1:新装。2:拆机。3:换机',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `number`(`number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of g_terminal_old
-- ----------------------------
INSERT INTO `g_terminal_old` VALUES (17, '100011', '1000011', 2, 4, '2019-09-04 14:03:28', NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
