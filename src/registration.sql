/*
Navicat MySQL Data Transfer

Source Server         : mysql55
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : registration

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2021-01-14 14:28:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `departmentID` int(11) NOT NULL AUTO_INCREMENT,
  `hospitalID` int(11) NOT NULL,
  `departmentType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departmentName` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `workTime` time NOT NULL,
  `closeTime` time NOT NULL,
  PRIMARY KEY (`departmentID`),
  KEY `department_hospital` (`hospitalID`),
  CONSTRAINT `department_hospital` FOREIGN KEY (`hospitalID`) REFERENCES `hospital` (`hospitalID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('2', '1', '外科', '骨折', '二楼右侧', '08:00:00', '18:00:00');
INSERT INTO `department` VALUES ('3', '1', 'sdf', 'sad', 'sdf', '16:14:00', '14:15:00');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `doctorID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departmentID` int(11) NOT NULL,
  `job` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `expertise` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` float(10,2) NOT NULL,
  PRIMARY KEY (`doctorID`),
  KEY `doctor_departmentID` (`departmentID`),
  CONSTRAINT `doctor_departmentID` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('1', '好医生', '1', '主任医师\r\n主任医师\r\n主任医师', '1', '30', '擅长小儿神经系统疾病，如难治性癫痫的遗传学诊治。限12岁以下儿童就诊', '60.00');

-- ----------------------------
-- Table structure for hospital
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital` (
  `hospitalID` int(11) NOT NULL AUTO_INCREMENT,
  `hospitalName` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `releaseTime` time NOT NULL,
  `stopTime` time NOT NULL,
  `rule` longtext COLLATE utf8mb4_unicode_ci,
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `notice` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`hospitalID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of hospital
-- ----------------------------
INSERT INTO `hospital` VALUES ('1', '大连船舶神经康复医院', '一级甲等', '西岗区', '辽宁省大连市西岗区滨海西路63号', '0', '08:00:00', '18:00:00', '取号地点：西院区门诊楼一层大厅挂号窗口取号', '医院是集医疗、教学、科研于一体的大型三级甲等综合医院，是国家卫生计生委指定的全国疑难重症诊治指导中心，也是最早承担高干保健和外宾医疗任务的医院之一，以学科齐全、技术力量雄厚、特色专科突出、多学科综合优势强大享誉海内外。在2010、2011、2012、2013、2014年复旦大学医院管理研究所公布的“中国最佳医院排行榜”中连续五年名列榜首。', '北京协和医院预约挂号须知\r\n为方便您早日就医康复，请您认真阅读预约挂号须知：\r\n\r\n一、预约实名制：\r\n统一平台电话预约和网上预约挂号均采取实名制注册预约，请您如实提供就诊人员的真实姓名、有效证件号（身份证、护照）、性别、手机号码、社保卡号等基本信息。\r\n\r\n二、预约挂号：\r\n按照北京市卫健委统一平台要求，预约挂号规则如下：\r\n\r\n在同一自然日，同一医院，同一科室，同一就诊单元，同一就诊人，可以预约最多1个号源；\r\n在同一自然周，同一就诊人，可以预约最多14个号源；\r\n在同一自然月，同一就诊人，可以预约最多20个号源；\r\n在同一自然季度，同一就诊人，可以预约最多30个号源。\r\n三、取消预约：\r\n已完成预约的号源，如需办理退号，至少在就诊前一工作日14:00前通过网站、微信公众号、114电话等平台预约渠道进行取消预约。');
INSERT INTO `hospital` VALUES ('2', 'asdf', 'sadf', 'asd', 'asdf', null, '12:05:00', '12:05:00', null, null, null);
INSERT INTO `hospital` VALUES ('5', 'ret', 'ert', 'ert', 'ert', null, '11:25:00', '13:23:00', null, null, null);
INSERT INTO `hospital` VALUES ('10', 'aa', 'aa', 'aa', 'aa', null, '15:36:00', '10:36:00', null, null, null);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createTime` datetime NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`messageID`),
  KEY `message_user` (`userID`),
  CONSTRAINT `message_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `noticeID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`noticeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `signalSrcID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `contractTime` datetime NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `order_patient` (`patientID`),
  KEY `order_signalsrc` (`signalSrcID`),
  CONSTRAINT `order_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`),
  CONSTRAINT `order_signalsrc` FOREIGN KEY (`signalSrcID`) REFERENCES `signalsrc` (`signalSrcID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idCardType` int(11) NOT NULL,
  `idCardNum` char(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` int(11) NOT NULL,
  `birthday` datetime NOT NULL,
  `tel` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mariStatus` int(11) NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objective` int(11) NOT NULL,
  `linkName` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkidCardType` int(11) NOT NULL,
  `linkidCardNum` char(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkTel` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `times` int(11) NOT NULL,
  `unseal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`patientID`),
  KEY `patient_user` (`userID`),
  CONSTRAINT `patient_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of patient
-- ----------------------------

-- ----------------------------
-- Table structure for signalsrc
-- ----------------------------
DROP TABLE IF EXISTS `signalsrc`;
CREATE TABLE `signalsrc` (
  `signalSrcID` int(11) NOT NULL AUTO_INCREMENT,
  `doctorID` int(11) NOT NULL,
  `contractTime` datetime NOT NULL,
  `cost` float(10,2) NOT NULL,
  `remain` int(11) NOT NULL,
  PRIMARY KEY (`signalSrcID`),
  KEY `signalsrc_doctor` (`doctorID`),
  CONSTRAINT `signalsrc_doctor` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of signalsrc
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userPwd` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userTel` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registeDate` datetime DEFAULT NULL,
  `realName` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idCardType` int(11) DEFAULT NULL,
  `idCardNum` char(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userType` int(11) NOT NULL,
  `hospitalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userName` (`userName`),
  KEY `user_hospotal` (`hospitalID`),
  CONSTRAINT `user_hospotal` FOREIGN KEY (`hospitalID`) REFERENCES `hospital` (`hospitalID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zhonghuang', '123456', '12580', '2021-01-05 11:45:28', '黄立志', '1', '123156478942189411', '1', null);
INSERT INTO `user` VALUES ('2', 'xiaohuang', '123456', '12580', '2021-01-05 11:47:00', '黄立志', '1', '894121348946513213', '3', null);
INSERT INTO `user` VALUES ('3', 'dahuang', '123456', '12580', '2021-01-05 11:47:53', '黄立志', '1', '984946546512648978', '2', '1');
INSERT INTO `user` VALUES ('4', 'xxxx', '123456', '12580', '2021-01-09 11:47:29', '你好啊', '1', '234123412341234214', '1', null);
INSERT INTO `user` VALUES ('5', 'wsx', '123456', '1235213', '2021-01-13 17:09:37', '大嘎嘎', '2', '123351254256453143', '1', null);
INSERT INTO `user` VALUES ('8', 'haha', 'haha', '12343524312', '2021-01-10 00:00:00', 'haha', '5', '1436546323414244', '1', null);
INSERT INTO `user` VALUES ('9', 'kaka', 'kaka', '633464356', '2021-01-10 00:00:00', 'kaka', '1', '676875662451525', '1', null);
INSERT INTO `user` VALUES ('10', 'vava', 'vava', '1234365464', '2021-01-10 00:00:00', 'vava', '4', '42346346546141243', '1', null);
INSERT INTO `user` VALUES ('26', '123', '123', '123', '2021-01-14 00:00:00', '123', '3', '123', '2', '5');
INSERT INTO `user` VALUES ('32', 'adsfasf', 'adfasdf', 'asdfsafd', '2021-01-14 00:00:00', 'asdfasdf', '3', '12312345', '2', '2');
