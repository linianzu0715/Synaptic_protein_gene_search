/*
Navicat MySQL Data Transfer

Source Server         : wp
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : x_springboot

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-06-24 08:41:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for brainregion
-- ----------------------------
DROP TABLE IF EXISTS `brainregion`;
CREATE TABLE `brainregion` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(4255) DEFAULT NULL,
  `InterlexID` varchar(255) DEFAULT NULL,
  `ParentID` int(10) DEFAULT NULL,
  PRIMARY KEY (`rowid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brainregion
-- ----------------------------

-- ----------------------------
-- Table structure for disease
-- ----------------------------
DROP TABLE IF EXISTS `disease`;
CREATE TABLE `disease` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `HDOID` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of disease
-- ----------------------------

-- ----------------------------
-- Table structure for diseasegene
-- ----------------------------
DROP TABLE IF EXISTS `diseasegene`;
CREATE TABLE `diseasegene` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `GeneID` int(10) DEFAULT NULL,
  `HDOID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diseasegene
-- ----------------------------

-- ----------------------------
-- Table structure for fullall
-- ----------------------------
DROP TABLE IF EXISTS `fullall`;
CREATE TABLE `fullall` (
  `GeneID` int(10) DEFAULT NULL,
  `Compartment` varchar(255) DEFAULT NULL,
  `HumanEntrez` varchar(255) DEFAULT NULL,
  `HumanName` varchar(255) DEFAULT NULL,
  `MouseEntrez` varchar(255) DEFAULT NULL,
  `MouseName` varchar(255) DEFAULT NULL,
  `RatEntrez` varchar(255) DEFAULT NULL,
  `RatName` varchar(255) DEFAULT NULL,
  `PMID` int(10) DEFAULT NULL,
  `Year` varchar(255) DEFAULT NULL,
  `Paper` varchar(255) DEFAULT NULL,
  `Brain_Region` varchar(255) DEFAULT NULL,
  `Disease` varchar(255) DEFAULT NULL,
  `Species` varchar(255) DEFAULT NULL,
  `Method` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fullall
-- ----------------------------
INSERT INTO `fullall` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for gene
-- ----------------------------
DROP TABLE IF EXISTS `gene`;
CREATE TABLE `gene` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) DEFAULT NULL,
  `MGI` varchar(255) DEFAULT NULL,
  `HumanEntrez` int(10) DEFAULT NULL,
  `MouseEntrez` int(10) DEFAULT NULL,
  `HumanName` varchar(255) DEFAULT NULL,
  `MouseName` varchar(255) DEFAULT NULL,
  `RatEntrez` int(10) DEFAULT NULL,
  `RatName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gene
-- ----------------------------

-- ----------------------------
-- Table structure for genetomodel
-- ----------------------------
DROP TABLE IF EXISTS `genetomodel`;
CREATE TABLE `genetomodel` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `GeneID` int(10) DEFAULT NULL,
  `EntityID` varchar(255) DEFAULT NULL,
  `PMID` int(10) DEFAULT NULL,
  PRIMARY KEY (`rowid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of genetomodel
-- ----------------------------

-- ----------------------------
-- Table structure for go
-- ----------------------------
DROP TABLE IF EXISTS `go`;
CREATE TABLE `go` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `GOID` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of go
-- ----------------------------

-- ----------------------------
-- Table structure for gogene
-- ----------------------------
DROP TABLE IF EXISTS `gogene`;
CREATE TABLE `gogene` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `GeneID` int(10) DEFAULT NULL,
  `SpecieID` int(10) DEFAULT NULL,
  `GOID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gogene
-- ----------------------------

-- ----------------------------
-- Table structure for localisation
-- ----------------------------
DROP TABLE IF EXISTS `localisation`;
CREATE TABLE `localisation` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(4255) DEFAULT NULL,
  PRIMARY KEY (`rowid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of localisation
-- ----------------------------

-- ----------------------------
-- Table structure for method
-- ----------------------------
DROP TABLE IF EXISTS `method`;
CREATE TABLE `method` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(4255) DEFAULT NULL,
  PRIMARY KEY (`rowid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of method
-- ----------------------------

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT COMMENT '列id',
  `PMID` decimal(19,0) DEFAULT NULL COMMENT 'PMID',
  `Year` int(10) DEFAULT NULL COMMENT '年份',
  `Name` varchar(255) DEFAULT NULL COMMENT '名字',
  `Description` varchar(1255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`rowid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='论文';

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for papergene
-- ----------------------------
DROP TABLE IF EXISTS `papergene`;
CREATE TABLE `papergene` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `GeneID` int(10) DEFAULT NULL,
  `PaperPMID` decimal(19,0) DEFAULT NULL,
  `SpeciesTaxID` int(10) DEFAULT NULL,
  `BrainRegionID` int(10) DEFAULT NULL,
  `LocalisationID` int(10) DEFAULT NULL,
  `MethodID` int(10) DEFAULT NULL,
  PRIMARY KEY (`rowid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of papergene
-- ----------------------------

-- ----------------------------
-- Table structure for ppi
-- ----------------------------
DROP TABLE IF EXISTS `ppi`;
CREATE TABLE `ppi` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) DEFAULT NULL,
  `A` int(10) DEFAULT NULL,
  `B` int(10) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `pmid` int(10) DEFAULT NULL,
  `taxID` int(10) DEFAULT NULL,
  PRIMARY KEY (`rowid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ppi
-- ----------------------------

-- ----------------------------
-- Table structure for specieregion
-- ----------------------------
DROP TABLE IF EXISTS `specieregion`;
CREATE TABLE `specieregion` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `BrainRegionID` int(10) DEFAULT NULL,
  `TaxID` int(10) DEFAULT NULL,
  PRIMARY KEY (`rowid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of specieregion
-- ----------------------------

-- ----------------------------
-- Table structure for species
-- ----------------------------
DROP TABLE IF EXISTS `species`;
CREATE TABLE `species` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `TaxID` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `SciName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of species
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `config_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `config_status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `key` (`config_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":1,\"qiniuDomain\":\"http://oss.sukeintel.com.qiniudns.com\",\"qiniuPrefix\":\"upload\",\"qiniuAccessKey\":\"XXXXXXXXXXX\",\"qiniuSecretKey\":\"XXXXXXXXXX\",\"qiniuBucketName\":\"sukeintel\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\"}', '0', '云存储配置信息');
INSERT INTO `sys_config` VALUES ('2', 'test', 'test', '1', '测试');

-- ----------------------------
-- Table structure for sys_config_copy
-- ----------------------------
DROP TABLE IF EXISTS `sys_config_copy`;
CREATE TABLE `sys_config_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `config_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `config_status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `key` (`config_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config_copy
-- ----------------------------
INSERT INTO `sys_config_copy` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":1,\"qiniuDomain\":\"http://oss.sukeintel.com.qiniudns.com\",\"qiniuPrefix\":\"upload\",\"qiniuAccessKey\":\"XXXXXXXXXXX\",\"qiniuSecretKey\":\"XXXXXXXXXX\",\"qiniuBucketName\":\"sukeintel\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\"}', '0', '云存储配置信息');
INSERT INTO `sys_config_copy` VALUES ('2', 'test', 'test', '1', '测试');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '修改定时任务', 'com.suke.czx.modules.job.controller.ScheduleJobController.update()', '{\"jobId\":1,\"beanName\":\"testTask\",\"methodName\":\"test\",\"params\":\"test\",\"cronExpression\":\"0 0/30 * * * ?\",\"status\":0,\"remark\":\"有参数测试\",\"createTime\":\"Dec 1, 2016 11:16:46 PM\"}', '78', '0:0:0:0:0:0:0:1', '2018-01-08 17:22:23');
INSERT INTO `sys_log` VALUES ('2', 'sk', '用户登录', 'com.suke.czx.modules.sys.controller.SysLoginController.login()', '\"sk\"', '1713', '0:0:0:0:0:0:0:1', '2019-04-18 13:59:11');
INSERT INTO `sys_log` VALUES ('3', 'sk', '用户登录', 'com.suke.czx.modules.sys.controller.SysLoginController.login()', '\"sk\"', '11', '0:0:0:0:0:0:0:1', '2019-04-18 13:59:43');
INSERT INTO `sys_log` VALUES ('4', 'admin', '保存配置', 'com.suke.czx.modules.sys.controller.SysConfigController.save()', '{\"id\":2,\"configKey\":\"test\",\"configValue\":\"test\",\"remark\":\"测试\"}', '65', '0:0:0:0:0:0:0:1', '2019-04-18 15:07:25');
INSERT INTO `sys_log` VALUES ('5', 'admin', '保存菜单', 'com.suke.czx.modules.sys.controller.SysMenuController.save()', '{\"menuId\":31,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"测试\",\"type\":0,\"orderNum\":0}', '8', '0:0:0:0:0:0:0:1', '2019-04-18 15:23:03');
INSERT INTO `sys_log` VALUES ('6', 'admin', '删除菜单', 'com.suke.czx.modules.sys.controller.SysMenuController.delete()', '31', '7', '0:0:0:0:0:0:0:1', '2019-04-18 15:24:26');
INSERT INTO `sys_log` VALUES ('7', 'admin', '删除角色', 'com.suke.czx.modules.sys.controller.SysRoleController.delete()', '[5]', '9', '0:0:0:0:0:0:0:1', '2019-04-18 16:00:11');
INSERT INTO `sys_log` VALUES ('8', 'admin', '保存角色', 'com.suke.czx.modules.sys.controller.SysRoleController.save()', '{\"roleId\":6,\"roleName\":\"测试2\",\"remark\":\"测试2\",\"createUserId\":1,\"menuIdList\":[1,3,19,20,21,22],\"createTime\":\"Apr 18, 2019 4:02:00 PM\"}', '76', '0:0:0:0:0:0:0:1', '2019-04-18 16:02:01');
INSERT INTO `sys_log` VALUES ('9', 'admin', '删除角色', 'com.suke.czx.modules.sys.controller.SysRoleController.delete()', '[6]', '5', '0:0:0:0:0:0:0:1', '2019-04-18 16:02:09');
INSERT INTO `sys_log` VALUES ('10', 'admin', '删除用户', 'com.suke.czx.modules.sys.controller.SysUserController.delete()', '[7]', '8', '0:0:0:0:0:0:0:1', '2019-04-18 16:04:59');
INSERT INTO `sys_log` VALUES ('11', 'admin', '保存用户', 'com.suke.czx.modules.sys.controller.SysUserController.save()', '{\"userId\":8,\"username\":\"sk\",\"password\":\"f84d76f5e13503d2ef9580eb8472615c395ea2010ac582035d86a4bd7d9ac73c\",\"salt\":\"v4rnaIJ4zl29yGhXdjOO\",\"email\":\"sk@sk.com\",\"mobile\":\"12345678963\",\"status\":1,\"createUserId\":1,\"createTime\":\"Apr 18, 2019 4:08:20 PM\",\"roleIdList\":[]}', '66', '0:0:0:0:0:0:0:1', '2019-04-18 16:08:21');
INSERT INTO `sys_log` VALUES ('12', 'admin', '删除用户', 'com.suke.czx.modules.sys.controller.SysUserController.delete()', '[8]', '9', '0:0:0:0:0:0:0:1', '2019-04-18 16:08:25');
INSERT INTO `sys_log` VALUES ('13', 'admin', '保存角色', 'com.suke.czx.modules.sys.controller.SysRoleController.save()', '{\"roleId\":7,\"roleName\":\"1\",\"remark\":\"1\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18],\"createTime\":\"Apr 18, 2019 4:09:08 PM\"}', '23', '0:0:0:0:0:0:0:1', '2019-04-18 16:09:08');
INSERT INTO `sys_log` VALUES ('14', 'admin', '保存角色', 'com.suke.czx.modules.sys.controller.SysRoleController.save()', '{\"roleId\":8,\"roleName\":\"2\",\"remark\":\"2\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18],\"createTime\":\"Apr 18, 2019 4:09:15 PM\"}', '9', '0:0:0:0:0:0:0:1', '2019-04-18 16:09:15');
INSERT INTO `sys_log` VALUES ('15', 'admin', '保存角色', 'com.suke.czx.modules.sys.controller.SysRoleController.save()', '{\"roleId\":9,\"roleName\":\"3\",\"remark\":\"3\",\"createUserId\":1,\"menuIdList\":[1,6,7,8,9,10,11,12,13,14],\"createTime\":\"Apr 18, 2019 4:09:22 PM\"}', '8', '0:0:0:0:0:0:0:1', '2019-04-18 16:09:23');
INSERT INTO `sys_log` VALUES ('16', 'admin', '删除角色', 'com.suke.czx.modules.sys.controller.SysRoleController.delete()', '[7,8,9]', '5', '0:0:0:0:0:0:0:1', '2019-04-18 16:09:29');
INSERT INTO `sys_log` VALUES ('17', 'admin', '保存用户', 'com.suke.czx.modules.sys.controller.SysUserController.save()', '{\"userId\":2,\"username\":\"sk\",\"password\":\"cc523ea48e608b07a8ddc08aa774e07a0dc176bebe86bf528bb79775ea73a26b\",\"salt\":\"rKn3NKzdWEyuIqGaoyiZ\",\"email\":\"sk@sk.com\",\"mobile\":\"18365412365\",\"status\":1,\"createUserId\":1,\"createTime\":\"Apr 22, 2019 11:32:18 AM\",\"roleIdList\":[]}', '76', '0:0:0:0:0:0:0:1', '2019-04-22 11:32:18');
INSERT INTO `sys_log` VALUES ('18', 'admin', '删除用户', 'com.suke.czx.modules.sys.controller.SysUserController.delete()', '[2]', '8', '0:0:0:0:0:0:0:1', '2019-04-22 11:32:23');
INSERT INTO `sys_log` VALUES ('19', 'admin', '修改菜单', 'com.suke.czx.modules.sys.controller.SysMenuController.update()', '{\"menuId\":5,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"代码生成\",\"url\":\"modules/gen/generator.html\",\"type\":0,\"icon\":\"fa fa-th-list\",\"orderNum\":4}', '10', '127.0.0.1', '2019-04-28 15:31:25');
INSERT INTO `sys_log` VALUES ('20', 'admin', '修改菜单', 'com.suke.czx.modules.sys.controller.SysMenuController.update()', '{\"menuId\":5,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"代码生成\",\"url\":\"modules/gen/generator.html\",\"type\":0,\"icon\":\"fa fa-th-list\",\"orderNum\":2}', '6', '127.0.0.1', '2019-04-28 15:32:08');
INSERT INTO `sys_log` VALUES ('21', 'admin', '修改APK版本管理数据', 'com.suke.czx.modules.apkversion.controller.ApkVersionController.update()', '{\"id\":1,\"appName\":\"1\",\"updateContent\":\"2\",\"versionCode\":1,\"versionName\":\"2\",\"downloadUrl\":\"2\",\"md5Value\":\"1\",\"fileSize\":\"1\",\"createTime\":\"Apr 28, 2019 4:06:12 PM\",\"updateTime\":\"Apr 28, 2019 4:06:16 PM\",\"userId\":1,\"isForce\":0,\"isIgnorable\":0,\"isSilent\":0}', '12', '127.0.0.1', '2019-05-02 18:28:15');
INSERT INTO `sys_log` VALUES ('25', 'admin', '删除APK版本管理数据', 'com.suke.czx.modules.apkversion.controller.ApkVersionController.delete()', '[2]', '12', '127.0.0.1', '2019-05-02 19:07:03');
INSERT INTO `sys_log` VALUES ('26', 'admin', '保存角色', 'com.suke.czx.modules.sys.controller.SysRoleController.save()', '{\"roleId\":8,\"roleName\":\"测试\",\"remark\":\"测试\",\"createUserId\":1,\"menuIdList\":[40,35,36,37,38,39],\"createTime\":\"Dec 26, 2019 4:57:39 PM\"}', '162', '192.168.0.133', '2019-12-26 16:57:39');
INSERT INTO `sys_log` VALUES ('27', 'admin', '删除角色', 'com.suke.czx.modules.sys.controller.SysRoleController.delete()', '[8,7,6]', '8', '192.168.0.133', '2019-12-26 16:57:51');
INSERT INTO `sys_log` VALUES ('28', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":2,\"name\":\"蒋老师\",\"age\":\"22\",\"address\":\"我的\"}', '6', '127.0.0.1', '2020-06-14 12:09:36');
INSERT INTO `sys_log` VALUES ('29', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":3,\"name\":\"思琪\",\"age\":\"23\",\"address\":\"黄龙山\"}', '16', '127.0.0.1', '2020-06-14 12:10:05');
INSERT INTO `sys_log` VALUES ('30', 'admin', '删除人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.delete()', '[3,2]', '18', '127.0.0.1', '2020-06-14 12:10:17');
INSERT INTO `sys_log` VALUES ('31', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":4,\"name\":\"蒋老师\",\"age\":\"22\",\"address\":\"我的\"}', '12', '127.0.0.1', '2020-06-14 12:10:36');
INSERT INTO `sys_log` VALUES ('32', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":5,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '17', '127.0.0.1', '2020-06-14 12:10:46');
INSERT INTO `sys_log` VALUES ('33', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":6,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:10:49');
INSERT INTO `sys_log` VALUES ('34', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":7,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:10:51');
INSERT INTO `sys_log` VALUES ('35', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":8,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:10:51');
INSERT INTO `sys_log` VALUES ('36', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":9,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:10:51');
INSERT INTO `sys_log` VALUES ('37', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":10,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '4', '127.0.0.1', '2020-06-14 12:10:51');
INSERT INTO `sys_log` VALUES ('38', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":11,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:10:51');
INSERT INTO `sys_log` VALUES ('39', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":12,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:10:52');
INSERT INTO `sys_log` VALUES ('40', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":13,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:10:52');
INSERT INTO `sys_log` VALUES ('41', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":14,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:10:52');
INSERT INTO `sys_log` VALUES ('42', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":15,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:10:52');
INSERT INTO `sys_log` VALUES ('43', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":16,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:10:52');
INSERT INTO `sys_log` VALUES ('44', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":17,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:10:52');
INSERT INTO `sys_log` VALUES ('45', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":18,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:10:53');
INSERT INTO `sys_log` VALUES ('46', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":19,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:10:53');
INSERT INTO `sys_log` VALUES ('47', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":20,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:10:53');
INSERT INTO `sys_log` VALUES ('48', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":21,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '4', '127.0.0.1', '2020-06-14 12:10:53');
INSERT INTO `sys_log` VALUES ('49', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":22,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:10:53');
INSERT INTO `sys_log` VALUES ('50', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":23,\"name\":\"蒋老师\",\"age\":\"23\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:10:53');
INSERT INTO `sys_log` VALUES ('51', 'admin', '修改人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.update()', '{\"id\":4,\"name\":\"蒋老师\",\"age\":\"22\",\"address\":\"我的11\"}', '18', '127.0.0.1', '2020-06-14 12:11:26');
INSERT INTO `sys_log` VALUES ('52', 'admin', '修改人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.update()', '{\"id\":4,\"name\":\"蒋老师\",\"age\":\"22\",\"address\":\"我的11\"}', '3', '127.0.0.1', '2020-06-14 12:11:27');
INSERT INTO `sys_log` VALUES ('53', 'admin', '修改人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.update()', '{\"id\":4,\"name\":\"蒋老师\",\"age\":\"22\",\"address\":\"我的11\"}', '3', '127.0.0.1', '2020-06-14 12:11:28');
INSERT INTO `sys_log` VALUES ('54', 'admin', '修改人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.update()', '{\"id\":4,\"name\":\"蒋老师\",\"age\":\"22\",\"address\":\"我的11\"}', '2', '127.0.0.1', '2020-06-14 12:11:28');
INSERT INTO `sys_log` VALUES ('55', 'admin', '修改人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.update()', '{\"id\":4,\"name\":\"蒋老师\",\"age\":\"22\",\"address\":\"我的11\"}', '2', '127.0.0.1', '2020-06-14 12:11:28');
INSERT INTO `sys_log` VALUES ('56', 'admin', '修改人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.update()', '{\"id\":4,\"name\":\"蒋老师\",\"age\":\"22\",\"address\":\"我的11\"}', '2', '127.0.0.1', '2020-06-14 12:11:28');
INSERT INTO `sys_log` VALUES ('57', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":24,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '14', '127.0.0.1', '2020-06-14 12:11:45');
INSERT INTO `sys_log` VALUES ('58', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":25,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '13', '127.0.0.1', '2020-06-14 12:11:46');
INSERT INTO `sys_log` VALUES ('59', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":26,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:11:46');
INSERT INTO `sys_log` VALUES ('60', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":27,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:11:46');
INSERT INTO `sys_log` VALUES ('61', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":28,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:11:46');
INSERT INTO `sys_log` VALUES ('62', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":29,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:11:46');
INSERT INTO `sys_log` VALUES ('63', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":30,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:11:46');
INSERT INTO `sys_log` VALUES ('64', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":31,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '4', '127.0.0.1', '2020-06-14 12:11:47');
INSERT INTO `sys_log` VALUES ('65', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":32,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:11:47');
INSERT INTO `sys_log` VALUES ('66', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":33,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:11:47');
INSERT INTO `sys_log` VALUES ('67', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":34,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:11:47');
INSERT INTO `sys_log` VALUES ('68', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":35,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:11:47');
INSERT INTO `sys_log` VALUES ('69', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":36,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:11:47');
INSERT INTO `sys_log` VALUES ('70', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":37,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:11:47');
INSERT INTO `sys_log` VALUES ('71', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":38,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:11:48');
INSERT INTO `sys_log` VALUES ('72', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":39,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:11:48');
INSERT INTO `sys_log` VALUES ('73', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":40,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:11:48');
INSERT INTO `sys_log` VALUES ('74', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":41,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '13', '127.0.0.1', '2020-06-14 12:11:48');
INSERT INTO `sys_log` VALUES ('75', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":42,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '4', '127.0.0.1', '2020-06-14 12:11:48');
INSERT INTO `sys_log` VALUES ('76', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":43,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:11:49');
INSERT INTO `sys_log` VALUES ('77', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":44,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:11:49');
INSERT INTO `sys_log` VALUES ('78', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":45,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:11:49');
INSERT INTO `sys_log` VALUES ('79', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":46,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:11:49');
INSERT INTO `sys_log` VALUES ('80', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":47,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:11:49');
INSERT INTO `sys_log` VALUES ('81', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":48,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:11:49');
INSERT INTO `sys_log` VALUES ('82', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":49,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:11:50');
INSERT INTO `sys_log` VALUES ('83', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":50,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:11:50');
INSERT INTO `sys_log` VALUES ('84', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":51,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:11:50');
INSERT INTO `sys_log` VALUES ('85', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":52,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:11:50');
INSERT INTO `sys_log` VALUES ('86', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":53,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '3', '127.0.0.1', '2020-06-14 12:11:50');
INSERT INTO `sys_log` VALUES ('87', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":54,\"name\":\"蒋思琪\",\"age\":\"24\",\"address\":\"我的\"}', '2', '127.0.0.1', '2020-06-14 12:11:50');
INSERT INTO `sys_log` VALUES ('88', 'admin', '保存用户', 'com.suke.czx.modules.sys.controller.SysUserController.save()', '{\"userId\":2,\"username\":\"111\",\"password\":\"$2a$10$ANp6Hp.xSICdt58ZDxBzveXBRltdwnU6GQMOYUZ3YMlKzjd61EPBi\",\"salt\":\"08niVfgOjaZdoogxYLLj\",\"email\":\"111@qq.com\",\"mobile\":\"1111\",\"status\":1,\"createUserId\":1,\"createTime\":\"Jun 14, 2020 12:14:46 PM\",\"roleIdList\":[5]}', '195', '127.0.0.1', '2020-06-14 12:14:46');
INSERT INTO `sys_log` VALUES ('89', 'admin', '删除用户', 'com.suke.czx.modules.sys.controller.SysUserController.delete()', '[2]', '17', '127.0.0.1', '2020-06-14 12:15:04');
INSERT INTO `sys_log` VALUES ('90', 'admin', '删除人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.delete()', '[14,15,16,17,18,19,20,21,22,23]', '6', '127.0.0.1', '2020-06-14 12:31:32');
INSERT INTO `sys_log` VALUES ('91', 'admin', '新增人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.save()', '{\"id\":55,\"name\":\"蒋老师\",\"age\":\"22\",\"address\":\"黄龙山\"}', '14', '127.0.0.1', '2020-06-14 12:32:03');
INSERT INTO `sys_log` VALUES ('92', 'admin', '新增学号管理数据', 'com.suke.czx.modules.student.controller.SysStudentController.save()', '{\"id\":2,\"username\":\"111\",\"password\":\"11111\",\"salt\":\"11111\",\"email\":\"1111\",\"mobile\":\"11111111\",\"status\":0,\"createUserId\":11111,\"createTime\":\"Nov 11, 2011 11:11:11 AM\"}', '12', '127.0.0.1', '2020-06-14 12:56:32');
INSERT INTO `sys_log` VALUES ('93', 'admin', '保存用户', 'com.suke.czx.modules.sys.controller.SysUserController.save()', '{\"userId\":8,\"username\":\"111111\",\"password\":\"$2a$10$0RPG5zyli10PIAaoq4O04uO3VuoEqVk4Us2NsfKPnLVkQGBUOUlPW\",\"salt\":\"NxNl28cpU61VnKtAqgeL\",\"email\":\"111111@qq.com\",\"mobile\":\"111111\",\"status\":1,\"createUserId\":1,\"createTime\":\"Jun 14, 2020 1:02:44 PM\",\"roleIdList\":[5]}', '203', '127.0.0.1', '2020-06-14 13:02:44');
INSERT INTO `sys_log` VALUES ('94', 'admin', '修改角色', 'com.suke.czx.modules.sys.controller.SysRoleController.update()', '{\"roleId\":5,\"roleName\":\"测试\",\"remark\":\"测试\",\"createUserId\":1,\"menuIdList\":[1,41,42,43,44,45,46,47,48,49,50],\"createTime\":\"Dec 26, 2019 4:51:37 PM\"}', '55', '127.0.0.1', '2020-06-14 13:05:24');
INSERT INTO `sys_log` VALUES ('95', 'admin', '保存角色', 'com.suke.czx.modules.sys.controller.SysRoleController.save()', '{\"roleId\":9,\"roleName\":\"学生\",\"remark\":\"学生\",\"createUserId\":1,\"menuIdList\":[1,41,42,43,44,45,46,47,48,49,50],\"createTime\":\"Jun 14, 2020 2:40:49 PM\"}', '104', '127.0.0.1', '2020-06-14 14:40:50');
INSERT INTO `sys_log` VALUES ('96', 'admin', '删除人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.delete()', '[4,5,6,7,8,9,10,11,12,13]', '15', '127.0.0.1', '2020-06-14 14:42:44');
INSERT INTO `sys_log` VALUES ('97', 'admin', '修改密码', 'com.suke.czx.modules.sys.controller.SysUserController.password()', '\"111111\"', '249', '127.0.0.1', '2020-06-14 14:42:54');
INSERT INTO `sys_log` VALUES ('98', 'admin', '新增论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.save()', '{\"rowid\":1,\"pmid\":1,\"year\":1,\"name\":\"1\",\"description\":\"1\"}', '4', '127.0.0.1', '2020-06-15 17:13:32');
INSERT INTO `sys_log` VALUES ('99', 'admin', '删除论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '8', '127.0.0.1', '2020-06-15 22:37:25');
INSERT INTO `sys_log` VALUES ('100', 'admin', '删除论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '6', '127.0.0.1', '2020-06-15 22:39:17');
INSERT INTO `sys_log` VALUES ('101', 'admin', '删除论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '2', '127.0.0.1', '2020-06-15 22:39:21');
INSERT INTO `sys_log` VALUES ('102', 'admin', '修改人员表数据', 'com.suke.czx.modules.person.controller.TbPersonController.update()', '{\"id\":25,\"name\":\"张全蛋\",\"age\":\"24\",\"address\":\"我的\"}', '16', '127.0.0.1', '2020-06-16 09:26:23');
INSERT INTO `sys_log` VALUES ('103', 'admin', '删除论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '1', '127.0.0.1', '2020-06-16 09:27:01');
INSERT INTO `sys_log` VALUES ('104', 'admin', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '3', '127.0.0.1', '2020-06-16 09:28:10');
INSERT INTO `sys_log` VALUES ('105', 'admin', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '3', '127.0.0.1', '2020-06-17 12:43:28');
INSERT INTO `sys_log` VALUES ('106', 'admin', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '3', '127.0.0.1', '2020-06-17 12:44:50');
INSERT INTO `sys_log` VALUES ('107', 'admin', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '3', '127.0.0.1', '2020-06-17 12:45:09');
INSERT INTO `sys_log` VALUES ('108', 'admin', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '4110', '127.0.0.1', '2020-06-17 12:45:39');
INSERT INTO `sys_log` VALUES ('109', 'admin', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '1', '127.0.0.1', '2020-06-17 12:52:28');
INSERT INTO `sys_log` VALUES ('110', 'admin', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '1', '127.0.0.1', '2020-06-17 12:53:49');
INSERT INTO `sys_log` VALUES ('111', 'admin', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '3616', '127.0.0.1', '2020-06-17 12:54:18');
INSERT INTO `sys_log` VALUES ('112', 'admin', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '5761', '127.0.0.1', '2020-06-17 12:54:57');
INSERT INTO `sys_log` VALUES ('113', 'admin', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '8752', '127.0.0.1', '2020-06-17 12:56:20');
INSERT INTO `sys_log` VALUES ('114', 'admin', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '4505', '127.0.0.1', '2020-06-17 12:57:57');
INSERT INTO `sys_log` VALUES ('115', 'admin', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '2631', '127.0.0.1', '2020-06-17 12:58:22');
INSERT INTO `sys_log` VALUES ('116', 'admin', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{}', '4524', '127.0.0.1', '2020-06-17 12:58:37');
INSERT INTO `sys_log` VALUES ('117', 'admin', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{\"sql\":\"select rowid,PMID,Year,Name,Description from paper  where Year \\u003d 2000\"}', '1', '127.0.0.1', '2020-06-17 12:59:43');
INSERT INTO `sys_log` VALUES ('118', 'admin', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{\"sql\":\"select rowid,PMID,Year,Name,Description from paper  where Year \\u003d 2000\"}', '7698', '127.0.0.1', '2020-06-17 13:00:20');
INSERT INTO `sys_log` VALUES ('119', 'admin', '修改角色', 'com.suke.czx.modules.sys.controller.SysRoleController.update()', '{\"roleId\":5,\"roleName\":\"测试\",\"remark\":\"测试\",\"createUserId\":1,\"menuIdList\":[1,2,15,4,23,24,25,26,56,57,58,59,60],\"createTime\":\"Dec 26, 2019 4:51:37 PM\"}', '117', '127.0.0.1', '2020-06-17 13:02:00');
INSERT INTO `sys_log` VALUES ('120', '111111', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{\"sql\":\"select rowid,PMID,Year,Name,Description from paper  where Year \\u003d 2004 and PMID \\u003d 15020595\"}', '1', '127.0.0.1', '2020-06-17 13:05:13');
INSERT INTO `sys_log` VALUES ('121', '111111', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{\"sql\":\"select rowid,PMID,Year,Name,Description from paper  where Year \\u003d 2004 and PMID \\u003d 15020595\"}', '2', '127.0.0.1', '2020-06-17 13:05:30');
INSERT INTO `sys_log` VALUES ('122', '111111', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{\"sql\":\"\"}', '2', '127.0.0.1', '2020-06-17 13:05:45');
INSERT INTO `sys_log` VALUES ('123', '111111', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{\"sql\":\"\"}', '1', '127.0.0.1', '2020-06-17 13:05:57');
INSERT INTO `sys_log` VALUES ('124', '111111', '导出论文数据', 'com.suke.czx.modules.sqlite.controller.PaperController.export()', '{\"sql\":\"\"}', '1', '127.0.0.1', '2020-06-17 14:24:31');
INSERT INTO `sys_log` VALUES ('125', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '16815', '127.0.0.1', '2020-06-17 15:42:51');
INSERT INTO `sys_log` VALUES ('126', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '14228', '127.0.0.1', '2020-06-17 15:43:33');
INSERT INTO `sys_log` VALUES ('127', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '13064', '127.0.0.1', '2020-06-17 15:44:46');
INSERT INTO `sys_log` VALUES ('128', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '14325', '127.0.0.1', '2020-06-17 15:47:10');
INSERT INTO `sys_log` VALUES ('129', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '12965', '127.0.0.1', '2020-06-17 16:11:49');
INSERT INTO `sys_log` VALUES ('130', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '12882', '127.0.0.1', '2020-06-17 16:13:15');
INSERT INTO `sys_log` VALUES ('131', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '11898', '127.0.0.1', '2020-06-17 16:14:35');
INSERT INTO `sys_log` VALUES ('132', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '11506', '127.0.0.1', '2020-06-17 16:15:54');
INSERT INTO `sys_log` VALUES ('133', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '13220', '127.0.0.1', '2020-06-17 16:17:31');
INSERT INTO `sys_log` VALUES ('134', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '12859', '127.0.0.1', '2020-06-17 16:20:48');
INSERT INTO `sys_log` VALUES ('135', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '12175', '127.0.0.1', '2020-06-17 16:24:10');
INSERT INTO `sys_log` VALUES ('136', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '12459', '127.0.0.1', '2020-06-17 16:31:18');
INSERT INTO `sys_log` VALUES ('137', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '12670', '127.0.0.1', '2020-06-17 16:32:23');
INSERT INTO `sys_log` VALUES ('138', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '16462', '127.0.0.1', '2020-06-17 16:37:26');
INSERT INTO `sys_log` VALUES ('139', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '12856', '127.0.0.1', '2020-06-17 16:38:52');
INSERT INTO `sys_log` VALUES ('140', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '12474', '127.0.0.1', '2020-06-17 16:40:54');
INSERT INTO `sys_log` VALUES ('141', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '12259', '127.0.0.1', '2020-06-17 16:42:25');
INSERT INTO `sys_log` VALUES ('142', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '12232', '127.0.0.1', '2020-06-17 16:44:44');
INSERT INTO `sys_log` VALUES ('143', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '12242', '127.0.0.1', '2020-06-17 16:47:02');
INSERT INTO `sys_log` VALUES ('144', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '12605', '127.0.0.1', '2020-06-17 16:48:06');
INSERT INTO `sys_log` VALUES ('145', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '12253', '127.0.0.1', '2020-06-17 16:50:03');
INSERT INTO `sys_log` VALUES ('146', 'admin', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '12713', '127.0.0.1', '2020-06-17 16:52:42');
INSERT INTO `sys_log` VALUES ('147', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '4', '127.0.0.1', '2020-06-20 11:58:09');
INSERT INTO `sys_log` VALUES ('148', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '0', '127.0.0.1', '2020-06-20 11:58:30');
INSERT INTO `sys_log` VALUES ('149', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '0', '127.0.0.1', '2020-06-20 11:58:41');
INSERT INTO `sys_log` VALUES ('150', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '0', '127.0.0.1', '2020-06-20 11:59:05');
INSERT INTO `sys_log` VALUES ('151', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '0', '127.0.0.1', '2020-06-20 12:00:02');
INSERT INTO `sys_log` VALUES ('152', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '0', '127.0.0.1', '2020-06-20 12:00:13');
INSERT INTO `sys_log` VALUES ('153', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '0', '127.0.0.1', '2020-06-20 12:01:43');
INSERT INTO `sys_log` VALUES ('154', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '0', '127.0.0.1', '2020-06-20 12:02:12');
INSERT INTO `sys_log` VALUES ('155', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '385', '127.0.0.1', '2020-06-20 12:19:13');
INSERT INTO `sys_log` VALUES ('156', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '7', '127.0.0.1', '2020-06-20 12:21:30');
INSERT INTO `sys_log` VALUES ('157', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '11', '127.0.0.1', '2020-06-20 12:21:42');
INSERT INTO `sys_log` VALUES ('158', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '21', '127.0.0.1', '2020-06-20 12:21:58');
INSERT INTO `sys_log` VALUES ('159', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '8', '127.0.0.1', '2020-06-20 12:22:34');
INSERT INTO `sys_log` VALUES ('160', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '12', '127.0.0.1', '2020-06-20 12:28:01');
INSERT INTO `sys_log` VALUES ('161', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '28', '127.0.0.1', '2020-06-20 12:28:34');
INSERT INTO `sys_log` VALUES ('162', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '11', '127.0.0.1', '2020-06-20 12:28:57');
INSERT INTO `sys_log` VALUES ('163', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '12', '127.0.0.1', '2020-06-20 12:30:42');
INSERT INTO `sys_log` VALUES ('164', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '14', '127.0.0.1', '2020-06-20 12:32:00');
INSERT INTO `sys_log` VALUES ('165', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '11', '127.0.0.1', '2020-06-20 12:32:05');
INSERT INTO `sys_log` VALUES ('166', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '13', '127.0.0.1', '2020-06-20 12:34:16');
INSERT INTO `sys_log` VALUES ('167', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '11', '127.0.0.1', '2020-06-20 12:34:39');
INSERT INTO `sys_log` VALUES ('168', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '10', '127.0.0.1', '2020-06-20 12:34:55');
INSERT INTO `sys_log` VALUES ('169', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '10', '127.0.0.1', '2020-06-20 12:35:18');
INSERT INTO `sys_log` VALUES ('170', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '10', '127.0.0.1', '2020-06-20 12:35:29');
INSERT INTO `sys_log` VALUES ('171', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '18', '127.0.0.1', '2020-06-20 12:35:40');
INSERT INTO `sys_log` VALUES ('172', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '10', '127.0.0.1', '2020-06-20 12:36:32');
INSERT INTO `sys_log` VALUES ('173', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '12', '127.0.0.1', '2020-06-20 12:37:01');
INSERT INTO `sys_log` VALUES ('174', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '12', '127.0.0.1', '2020-06-20 12:37:29');
INSERT INTO `sys_log` VALUES ('175', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '12', '127.0.0.1', '2020-06-20 12:37:57');
INSERT INTO `sys_log` VALUES ('176', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '12', '127.0.0.1', '2020-06-20 12:38:52');
INSERT INTO `sys_log` VALUES ('177', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '11', '127.0.0.1', '2020-06-20 12:39:14');
INSERT INTO `sys_log` VALUES ('178', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '9', '127.0.0.1', '2020-06-20 12:39:27');
INSERT INTO `sys_log` VALUES ('179', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '13', '127.0.0.1', '2020-06-20 12:40:29');
INSERT INTO `sys_log` VALUES ('180', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '11', '127.0.0.1', '2020-06-20 12:41:15');
INSERT INTO `sys_log` VALUES ('181', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '12', '127.0.0.1', '2020-06-20 12:41:44');
INSERT INTO `sys_log` VALUES ('182', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '9', '127.0.0.1', '2020-06-20 12:42:05');
INSERT INTO `sys_log` VALUES ('183', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '9', '127.0.0.1', '2020-06-20 12:42:47');
INSERT INTO `sys_log` VALUES ('184', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '9', '127.0.0.1', '2020-06-20 12:42:54');
INSERT INTO `sys_log` VALUES ('185', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '9', '127.0.0.1', '2020-06-20 12:43:08');
INSERT INTO `sys_log` VALUES ('186', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '11', '127.0.0.1', '2020-06-20 12:43:36');
INSERT INTO `sys_log` VALUES ('187', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '11', '127.0.0.1', '2020-06-20 12:44:05');
INSERT INTO `sys_log` VALUES ('188', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '15', '127.0.0.1', '2020-06-20 12:44:28');
INSERT INTO `sys_log` VALUES ('189', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '12', '127.0.0.1', '2020-06-20 12:44:57');
INSERT INTO `sys_log` VALUES ('190', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '96', '127.0.0.1', '2020-06-20 12:45:14');
INSERT INTO `sys_log` VALUES ('191', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '12', '127.0.0.1', '2020-06-20 12:45:29');
INSERT INTO `sys_log` VALUES ('192', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '132', '127.0.0.1', '2020-06-20 12:45:45');
INSERT INTO `sys_log` VALUES ('193', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '39', '127.0.0.1', '2020-06-20 12:46:50');
INSERT INTO `sys_log` VALUES ('194', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '171', '127.0.0.1', '2020-06-20 12:47:33');
INSERT INTO `sys_log` VALUES ('195', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '9', '127.0.0.1', '2020-06-20 12:47:42');
INSERT INTO `sys_log` VALUES ('196', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '18', '127.0.0.1', '2020-06-20 12:47:44');
INSERT INTO `sys_log` VALUES ('197', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '110', '127.0.0.1', '2020-06-20 12:48:09');
INSERT INTO `sys_log` VALUES ('198', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '178', '127.0.0.1', '2020-06-20 12:48:35');
INSERT INTO `sys_log` VALUES ('199', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '8', '127.0.0.1', '2020-06-20 12:48:38');
INSERT INTO `sys_log` VALUES ('200', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '7', '127.0.0.1', '2020-06-20 12:48:55');
INSERT INTO `sys_log` VALUES ('201', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '13', '127.0.0.1', '2020-06-20 12:49:46');
INSERT INTO `sys_log` VALUES ('202', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '12', '127.0.0.1', '2020-06-20 12:49:50');
INSERT INTO `sys_log` VALUES ('203', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '13', '127.0.0.1', '2020-06-20 12:50:34');
INSERT INTO `sys_log` VALUES ('204', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '7', '127.0.0.1', '2020-06-20 12:50:47');
INSERT INTO `sys_log` VALUES ('205', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '11', '127.0.0.1', '2020-06-20 12:50:55');
INSERT INTO `sys_log` VALUES ('206', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '106', '127.0.0.1', '2020-06-20 12:52:03');
INSERT INTO `sys_log` VALUES ('207', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '13', '127.0.0.1', '2020-06-20 12:52:42');
INSERT INTO `sys_log` VALUES ('208', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '12', '127.0.0.1', '2020-06-20 12:53:30');
INSERT INTO `sys_log` VALUES ('209', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '11', '127.0.0.1', '2020-06-20 12:53:57');
INSERT INTO `sys_log` VALUES ('210', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '11', '127.0.0.1', '2020-06-20 12:54:14');
INSERT INTO `sys_log` VALUES ('211', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '11', '127.0.0.1', '2020-06-20 12:54:33');
INSERT INTO `sys_log` VALUES ('212', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '10', '127.0.0.1', '2020-06-20 12:54:44');
INSERT INTO `sys_log` VALUES ('213', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '13', '127.0.0.1', '2020-06-20 12:54:58');
INSERT INTO `sys_log` VALUES ('214', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '118', '127.0.0.1', '2020-06-20 12:55:21');
INSERT INTO `sys_log` VALUES ('215', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '10', '127.0.0.1', '2020-06-20 12:56:43');
INSERT INTO `sys_log` VALUES ('216', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '9', '127.0.0.1', '2020-06-20 12:57:03');
INSERT INTO `sys_log` VALUES ('217', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '6', '127.0.0.1', '2020-06-20 12:57:29');
INSERT INTO `sys_log` VALUES ('218', 'admin', '修改角色', 'com.suke.czx.modules.sys.controller.SysRoleController.update()', '{\"roleId\":5,\"roleName\":\"测试\",\"remark\":\"测试\",\"createUserId\":1,\"menuIdList\":[1,2,15,4,23,24,25,26,41,42,43,44,45,56,57,58,59,60,61,62,63,64,65],\"createTime\":\"Dec 26, 2019 4:51:37 PM\"}', '151', '127.0.0.1', '2020-06-20 12:57:49');
INSERT INTO `sys_log` VALUES ('219', 'admin', '保存用户', 'com.suke.czx.modules.sys.controller.SysUserController.save()', '{\"userId\":9,\"username\":\"test\",\"password\":\"$2a$10$BwpaMUIQmqxQkOKxaoZQfuhYCASidtM5eDJPxPkA6hQZd/SAqwXWC\",\"salt\":\"OspE7ZcS3HLs0QcVnumM\",\"email\":\"1111@qq.com\",\"mobile\":\"13344445555\",\"status\":1,\"createUserId\":1,\"createTime\":\"Jun 20, 2020 12:59:23 PM\",\"roleIdList\":[5]}', '105', '127.0.0.1', '2020-06-20 12:59:24');
INSERT INTO `sys_log` VALUES ('220', 'admin', '修改角色', 'com.suke.czx.modules.sys.controller.SysRoleController.update()', '{\"roleId\":5,\"roleName\":\"测试\",\"remark\":\"测试\",\"createUserId\":1,\"menuIdList\":[1,2,15,41,42,43,44,45,56,57,58,59,60,61,62,63,64,65],\"createTime\":\"Dec 26, 2019 4:51:37 PM\"}', '40', '127.0.0.1', '2020-06-20 13:00:12');
INSERT INTO `sys_log` VALUES ('221', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '8', '127.0.0.1', '2020-06-20 13:00:25');
INSERT INTO `sys_log` VALUES ('222', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '6', '127.0.0.1', '2020-06-20 13:00:54');
INSERT INTO `sys_log` VALUES ('223', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '6', '127.0.0.1', '2020-06-20 13:00:59');
INSERT INTO `sys_log` VALUES ('224', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '8', '127.0.0.1', '2020-06-20 13:01:15');
INSERT INTO `sys_log` VALUES ('225', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '7', '127.0.0.1', '2020-06-20 13:01:23');
INSERT INTO `sys_log` VALUES ('226', 'test', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '14780', '127.0.0.1', '2020-06-20 13:02:55');
INSERT INTO `sys_log` VALUES ('227', 'test', '删除数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '14632', '127.0.0.1', '2020-06-20 13:05:09');
INSERT INTO `sys_log` VALUES ('228', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '80', '127.0.0.1', '2020-06-20 13:06:10');
INSERT INTO `sys_log` VALUES ('229', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '13', '127.0.0.1', '2020-06-20 13:17:53');
INSERT INTO `sys_log` VALUES ('230', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '7', '127.0.0.1', '2020-06-20 13:17:55');
INSERT INTO `sys_log` VALUES ('231', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '7', '127.0.0.1', '2020-06-20 13:18:08');
INSERT INTO `sys_log` VALUES ('232', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '7', '127.0.0.1', '2020-06-20 13:18:14');
INSERT INTO `sys_log` VALUES ('233', 'admin', '修改密码', 'com.suke.czx.modules.sys.controller.SysUserController.password()', '\"pl1100..\"', '242', '127.0.0.1', '2020-06-20 13:18:41');
INSERT INTO `sys_log` VALUES ('234', 'admin', '修改密码', 'com.suke.czx.modules.sys.controller.SysUserController.password()', '\"admin\"', '239', '127.0.0.1', '2020-06-20 13:18:47');
INSERT INTO `sys_log` VALUES ('235', 'admin', '修改密码', 'com.suke.czx.modules.sys.controller.SysUserController.password()', '\"admin\"', '246', '127.0.0.1', '2020-06-20 13:18:53');
INSERT INTO `sys_log` VALUES ('236', 'admin', '修改密码', 'com.suke.czx.modules.sys.controller.SysUserController.password()', '\"admin\"', '243', '127.0.0.1', '2020-06-20 13:18:58');
INSERT INTO `sys_log` VALUES ('237', 'admin', '修改密码', 'com.suke.czx.modules.sys.controller.SysUserController.password()', '\"admin\"', '246', '127.0.0.1', '2020-06-20 13:19:08');
INSERT INTO `sys_log` VALUES ('238', 'admin', '修改密码', 'com.suke.czx.modules.sys.controller.SysUserController.password()', '\"123456\"', '238', '127.0.0.1', '2020-06-20 13:19:13');
INSERT INTO `sys_log` VALUES ('239', 'admin', '修改密码', 'com.suke.czx.modules.sys.controller.SysUserController.password()', '\"admin\"', '239', '127.0.0.1', '2020-06-20 13:19:37');
INSERT INTO `sys_log` VALUES ('240', 'admin', '修改密码', 'com.suke.czx.modules.sys.controller.SysUserController.password()', '\"admin\"', '34896', '127.0.0.1', '2020-06-20 13:20:31');
INSERT INTO `sys_log` VALUES ('241', 'test', '修改密码', 'com.suke.czx.modules.sys.controller.SysUserController.password()', '\"test\"', '239', '127.0.0.1', '2020-06-20 13:20:54');
INSERT INTO `sys_log` VALUES ('242', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '230', '127.0.0.1', '2020-06-20 16:46:44');
INSERT INTO `sys_log` VALUES ('243', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '82', '127.0.0.1', '2020-06-23 09:37:52');
INSERT INTO `sys_log` VALUES ('244', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '77', '127.0.0.1', '2020-06-23 10:02:30');
INSERT INTO `sys_log` VALUES ('245', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '9', '127.0.0.1', '2020-06-23 10:02:34');
INSERT INTO `sys_log` VALUES ('246', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '9', '127.0.0.1', '2020-06-23 10:03:16');
INSERT INTO `sys_log` VALUES ('247', 'admin', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '738', '127.0.0.1', '2020-06-23 15:32:48');
INSERT INTO `sys_log` VALUES ('248', 'admin', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '725', '127.0.0.1', '2020-06-23 15:33:13');
INSERT INTO `sys_log` VALUES ('249', 'admin', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '682', '127.0.0.1', '2020-06-23 15:33:40');
INSERT INTO `sys_log` VALUES ('250', 'admin', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '742', '127.0.0.1', '2020-06-23 15:40:51');
INSERT INTO `sys_log` VALUES ('251', 'admin', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '1098', '127.0.0.1', '2020-06-23 15:42:00');
INSERT INTO `sys_log` VALUES ('252', 'admin', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '3070', '127.0.0.1', '2020-06-23 15:43:44');
INSERT INTO `sys_log` VALUES ('253', 'admin', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '2153', '127.0.0.1', '2020-06-23 15:44:14');
INSERT INTO `sys_log` VALUES ('254', 'admin', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '2117', '127.0.0.1', '2020-06-23 15:44:47');
INSERT INTO `sys_log` VALUES ('255', 'admin', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '1290', '127.0.0.1', '2020-06-23 15:45:08');
INSERT INTO `sys_log` VALUES ('256', 'admin', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '1129', '127.0.0.1', '2020-06-23 15:45:52');
INSERT INTO `sys_log` VALUES ('257', 'admin', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '16388', '127.0.0.1', '2020-06-23 15:46:21');
INSERT INTO `sys_log` VALUES ('258', 'admin', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '9842', '127.0.0.1', '2020-06-23 15:46:57');
INSERT INTO `sys_log` VALUES ('259', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '72519', '127.0.0.1', '2020-06-23 16:37:44');
INSERT INTO `sys_log` VALUES ('260', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '44983', '127.0.0.1', '2020-06-23 16:38:17');
INSERT INTO `sys_log` VALUES ('261', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '43047', '127.0.0.1', '2020-06-23 16:38:19');
INSERT INTO `sys_log` VALUES ('262', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '5372', '127.0.0.1', '2020-06-23 16:57:56');
INSERT INTO `sys_log` VALUES ('263', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '5858', '127.0.0.1', '2020-06-23 16:58:27');
INSERT INTO `sys_log` VALUES ('264', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '4379', '127.0.0.1', '2020-06-23 16:58:41');
INSERT INTO `sys_log` VALUES ('265', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '13616', '127.0.0.1', '2020-06-23 16:59:55');
INSERT INTO `sys_log` VALUES ('266', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '11461', '127.0.0.1', '2020-06-23 17:00:05');
INSERT INTO `sys_log` VALUES ('267', 'admin', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '5240', '127.0.0.1', '2020-06-23 17:01:48');
INSERT INTO `sys_log` VALUES ('268', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '6263', '127.0.0.1', '2020-06-23 17:06:29');
INSERT INTO `sys_log` VALUES ('269', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '56539', '127.0.0.1', '2020-06-23 17:08:49');
INSERT INTO `sys_log` VALUES ('270', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '5331', '127.0.0.1', '2020-06-23 17:10:03');
INSERT INTO `sys_log` VALUES ('271', 'admin', '修改角色', 'com.suke.czx.modules.sys.controller.SysRoleController.update()', '{\"roleId\":5,\"roleName\":\"测试\",\"remark\":\"测试\",\"createUserId\":1,\"menuIdList\":[1,2,15,41,42,43,44,45,61,62,63,64,65],\"createTime\":\"Dec 26, 2019 4:51:37 PM\"}', '414', '127.0.0.1', '2020-06-23 17:11:07');
INSERT INTO `sys_log` VALUES ('272', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '6894', '127.0.0.1', '2020-06-23 17:15:37');
INSERT INTO `sys_log` VALUES ('273', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '12574', '127.0.0.1', '2020-06-23 17:16:40');
INSERT INTO `sys_log` VALUES ('274', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '1870', '127.0.0.1', '2020-06-23 17:17:33');
INSERT INTO `sys_log` VALUES ('275', 'test', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '54889', '127.0.0.1', '2020-06-23 17:18:41');
INSERT INTO `sys_log` VALUES ('276', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '95511', '127.0.0.1', '2020-06-23 17:19:30');
INSERT INTO `sys_log` VALUES ('277', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '88346', '127.0.0.1', '2020-06-23 17:23:21');
INSERT INTO `sys_log` VALUES ('278', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '6222', '127.0.0.1', '2020-06-23 17:23:57');
INSERT INTO `sys_log` VALUES ('279', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '11673', '127.0.0.1', '2020-06-23 17:24:53');
INSERT INTO `sys_log` VALUES ('280', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '1760', '127.0.0.1', '2020-06-23 17:26:10');
INSERT INTO `sys_log` VALUES ('281', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '10938', '127.0.0.1', '2020-06-23 17:27:00');
INSERT INTO `sys_log` VALUES ('282', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '12033', '127.0.0.1', '2020-06-23 17:29:03');
INSERT INTO `sys_log` VALUES ('283', 'test', 'getPPI', 'com.suke.czx.modules.person.controller.TbPersonController.getPpi()', null, '6281', '127.0.0.1', '2020-06-23 17:29:43');
INSERT INTO `sys_log` VALUES ('284', 'test', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '1967', '127.0.0.1', '2020-06-23 17:30:38');
INSERT INTO `sys_log` VALUES ('285', 'test', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '1876', '127.0.0.1', '2020-06-23 17:31:46');
INSERT INTO `sys_log` VALUES ('286', 'test', '导出数据', 'com.suke.czx.modules.sqlite.controller.FullallController.export()', '{}', '38391', '127.0.0.1', '2020-06-23 17:33:05');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'modules/sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO `sys_menu` VALUES ('31', '0', 'Swagger', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '在线API', 'swagger/index.html', null, '1', 'fa fa-file-text-o', '1');
INSERT INTO `sys_menu` VALUES ('33', '0', '在线生成', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('34', '33', '代码生成', 'modules/gen/generator.html', null, '1', 'fa fa-sun-o', '1');
INSERT INTO `sys_menu` VALUES ('35', '40', 'APK版本管理', 'modules/apkversion/apkversion.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('36', '40', '查看', null, 'apkversion:apkversion:list,apkversion:apkversion:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('37', '40', '新增', null, 'apkversion:apkversion:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('38', '40', '修改', null, 'apkversion:apkversion:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('39', '40', '删除', null, 'apkversion:apkversion:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('40', '0', 'APP版本管理', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('41', '1', 'PPI', 'modules/sqlite/plugin-snapshot-test.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('42', '41', '查看', null, 'person:tbperson:list,person:tbperson:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('43', '41', '新增', null, 'person:tbperson:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('44', '41', '修改', null, 'person:tbperson:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('45', '41', '删除', null, 'person:tbperson:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('46', '1', '学号管理', 'modules/student/sysstudent.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('47', '46', '查看', null, 'student:sysstudent:list,student:sysstudent:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('48', '46', '新增', null, 'student:sysstudent:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('49', '46', '修改', null, 'student:sysstudent:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('50', '46', '删除', null, 'student:sysstudent:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('56', '1', '论文', 'modules/sqlite/paper.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('57', '56', '查看', null, 'sqlite:paper:list,sqlite:paper:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('58', '56', '新增', null, 'sqlite:paper:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('59', '56', '修改', null, 'sqlite:paper:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('60', '56', '删除', null, 'sqlite:paper:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('61', '1', '视图', 'modules/sqlite/fullall.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('62', '61', '查看', null, 'sqlite:fullall:list,sqlite:fullall:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('63', '61', '新增', null, 'sqlite:fullall:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('64', '61', '修改', null, 'sqlite:fullall:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('65', '61', '删除', null, 'sqlite:fullall:delete', '2', null, '6');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES ('1', 'http://oss.sukeintel.com.qiniudns.com/upload/20190401/1964f6d819b54852a7a87d855f240827.png', '2019-04-01 09:50:31');
INSERT INTO `sys_oss` VALUES ('2', 'http://oss.sukeintel.com/upload/20190401/35d86809a5564d1c82ec95f5ea33b0aa.png', '2019-04-01 11:01:18');
INSERT INTO `sys_oss` VALUES ('3', 'http://oss.sukeintel.com/upload/20190401/e0a49d8bd0ee4f66affc526c01e4fc11.png', '2019-04-01 11:03:05');
INSERT INTO `sys_oss` VALUES ('4', 'http://oss.sukeintel.com/upload/20190401/229117ef71a34d69b113f072f00f2b84.png', '2019-04-01 11:18:18');
INSERT INTO `sys_oss` VALUES ('5', 'http://oss.sukeintel.com/upload/20190401/4669fb66bea94dc48c75d9b0fbdcc1df.png', '2019-04-01 11:51:56');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('4', '管理员', '管理员', '1', '2019-04-18 10:12:05');
INSERT INTO `sys_role` VALUES ('5', '测试', '测试', '1', '2019-12-26 16:51:37');
INSERT INTO `sys_role` VALUES ('9', '学生', '学生', '1', '2020-06-14 14:40:50');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '4', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '4', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '4', '15');
INSERT INTO `sys_role_menu` VALUES ('4', '4', '16');
INSERT INTO `sys_role_menu` VALUES ('10', '4', '21');
INSERT INTO `sys_role_menu` VALUES ('11', '4', '22');
INSERT INTO `sys_role_menu` VALUES ('57', '6', '40');
INSERT INTO `sys_role_menu` VALUES ('58', '6', '35');
INSERT INTO `sys_role_menu` VALUES ('59', '6', '36');
INSERT INTO `sys_role_menu` VALUES ('60', '6', '37');
INSERT INTO `sys_role_menu` VALUES ('61', '6', '38');
INSERT INTO `sys_role_menu` VALUES ('62', '6', '39');
INSERT INTO `sys_role_menu` VALUES ('63', '7', '40');
INSERT INTO `sys_role_menu` VALUES ('64', '7', '35');
INSERT INTO `sys_role_menu` VALUES ('65', '7', '36');
INSERT INTO `sys_role_menu` VALUES ('66', '7', '37');
INSERT INTO `sys_role_menu` VALUES ('67', '7', '38');
INSERT INTO `sys_role_menu` VALUES ('68', '7', '39');
INSERT INTO `sys_role_menu` VALUES ('69', '8', '40');
INSERT INTO `sys_role_menu` VALUES ('70', '8', '35');
INSERT INTO `sys_role_menu` VALUES ('71', '8', '36');
INSERT INTO `sys_role_menu` VALUES ('72', '8', '37');
INSERT INTO `sys_role_menu` VALUES ('73', '8', '38');
INSERT INTO `sys_role_menu` VALUES ('74', '8', '39');
INSERT INTO `sys_role_menu` VALUES ('86', '9', '1');
INSERT INTO `sys_role_menu` VALUES ('87', '9', '41');
INSERT INTO `sys_role_menu` VALUES ('88', '9', '42');
INSERT INTO `sys_role_menu` VALUES ('89', '9', '43');
INSERT INTO `sys_role_menu` VALUES ('90', '9', '44');
INSERT INTO `sys_role_menu` VALUES ('91', '9', '45');
INSERT INTO `sys_role_menu` VALUES ('92', '9', '46');
INSERT INTO `sys_role_menu` VALUES ('93', '9', '47');
INSERT INTO `sys_role_menu` VALUES ('94', '9', '48');
INSERT INTO `sys_role_menu` VALUES ('95', '9', '49');
INSERT INTO `sys_role_menu` VALUES ('96', '9', '50');
INSERT INTO `sys_role_menu` VALUES ('151', '5', '1');
INSERT INTO `sys_role_menu` VALUES ('152', '5', '2');
INSERT INTO `sys_role_menu` VALUES ('153', '5', '15');
INSERT INTO `sys_role_menu` VALUES ('154', '5', '41');
INSERT INTO `sys_role_menu` VALUES ('155', '5', '42');
INSERT INTO `sys_role_menu` VALUES ('156', '5', '43');
INSERT INTO `sys_role_menu` VALUES ('157', '5', '44');
INSERT INTO `sys_role_menu` VALUES ('158', '5', '45');
INSERT INTO `sys_role_menu` VALUES ('159', '5', '61');
INSERT INTO `sys_role_menu` VALUES ('160', '5', '62');
INSERT INTO `sys_role_menu` VALUES ('161', '5', '63');
INSERT INTO `sys_role_menu` VALUES ('162', '5', '64');
INSERT INTO `sys_role_menu` VALUES ('163', '5', '65');

-- ----------------------------
-- Table structure for sys_student
-- ----------------------------
DROP TABLE IF EXISTS `sys_student`;
CREATE TABLE `sys_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='学号管理';

-- ----------------------------
-- Records of sys_student
-- ----------------------------
INSERT INTO `sys_student` VALUES ('2', '111', '11111', '11111', '1111', '11111111', '0', '11111', '2011-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '$2a$10$aBO0nlhfUw4giy3sp5BQJu49xHOfuj578oBaaHo6hN6pIBiBObbEK', 'YzcmCZNvbXocrsz9dm8e', 'yzcheng90@qq.com', '13612345678', '1', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('8', '111111', '$2a$10$0RPG5zyli10PIAaoq4O04uO3VuoEqVk4Us2NsfKPnLVkQGBUOUlPW', 'NxNl28cpU61VnKtAqgeL', '111111@qq.com', '111111', '1', '1', '2020-06-14 13:02:44');
INSERT INTO `sys_user` VALUES ('9', 'test', '$2a$10$BwpaMUIQmqxQkOKxaoZQfuhYCASidtM5eDJPxPkA6hQZd/SAqwXWC', 'OspE7ZcS3HLs0QcVnumM', '1111@qq.com', '13344445555', '1', '1', '2020-06-20 12:59:24');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '7', '5');
INSERT INTO `sys_user_role` VALUES ('2', '2', '5');
INSERT INTO `sys_user_role` VALUES ('3', '8', '5');
INSERT INTO `sys_user_role` VALUES ('4', '9', '5');

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------

-- ----------------------------
-- Table structure for tb_apk_version
-- ----------------------------
DROP TABLE IF EXISTS `tb_apk_version`;
CREATE TABLE `tb_apk_version` (
  `id` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `update_content` varchar(2000) DEFAULT NULL COMMENT '更新内容',
  `version_code` int(11) DEFAULT NULL COMMENT '版本码',
  `version_name` varchar(20) DEFAULT NULL COMMENT '版本号',
  `package_name` varchar(255) DEFAULT NULL COMMENT '包名',
  `download_url` varchar(255) DEFAULT NULL COMMENT '下载地址',
  `app_name` varchar(255) DEFAULT NULL COMMENT 'APP名',
  `md5_value` varchar(255) DEFAULT NULL COMMENT 'MD5值',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_size` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `user_id` int(11) DEFAULT NULL COMMENT '上传人',
  `is_force` tinyint(4) DEFAULT NULL COMMENT '是否强制安装',
  `is_ignorable` tinyint(4) DEFAULT NULL COMMENT '是否可忽略该版本',
  `is_silent` tinyint(4) DEFAULT NULL COMMENT '是否静默下载',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='APK版本管理';

-- ----------------------------
-- Records of tb_apk_version
-- ----------------------------
INSERT INTO `tb_apk_version` VALUES ('00000000000000000001', '2', '1', '2', null, '11111', '1', '1', null, '1', '2019-04-28 16:06:12', '2019-04-28 16:06:16', '1', '0', '1', '1');

-- ----------------------------
-- Table structure for tb_app_update
-- ----------------------------
DROP TABLE IF EXISTS `tb_app_update`;
CREATE TABLE `tb_app_update` (
  `appid` varchar(50) DEFAULT NULL COMMENT 'APPID ',
  `update_content` varchar(500) DEFAULT NULL COMMENT '更新内容',
  `version_code` int(20) DEFAULT NULL COMMENT '版本码',
  `version_name` varchar(50) DEFAULT NULL COMMENT '版本号',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `app_file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `md5` varchar(255) DEFAULT NULL COMMENT 'MD5值',
  `size` varchar(50) DEFAULT NULL COMMENT '文件大小',
  `is_force` varchar(50) DEFAULT NULL COMMENT '是否强制安装',
  `is_ignorable` varchar(50) DEFAULT NULL COMMENT '是否可忽略该版本',
  `is_silent` varchar(50) DEFAULT NULL COMMENT '是否静默下载：有新版本时不提示直接下载',
  `upload_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='APP版本管理';

-- ----------------------------
-- Records of tb_app_update
-- ----------------------------

-- ----------------------------
-- Table structure for tb_person
-- ----------------------------
DROP TABLE IF EXISTS `tb_person`;
CREATE TABLE `tb_person` (
  `id` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '名字',
  `age` varchar(20) DEFAULT NULL COMMENT '年龄',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='人员表';

-- ----------------------------
-- Records of tb_person
-- ----------------------------
INSERT INTO `tb_person` VALUES ('00000000000000000024', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000025', '张全蛋', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000026', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000027', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000028', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000029', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000030', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000031', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000032', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000033', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000034', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000035', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000036', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000037', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000038', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000039', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000040', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000041', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000042', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000043', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000044', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000045', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000046', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000047', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000048', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000049', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000050', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000051', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000052', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000053', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000054', '渣渣辉', '24', '我的');
INSERT INTO `tb_person` VALUES ('00000000000000000055', '渣渣辉', '22', '黄龙山');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
