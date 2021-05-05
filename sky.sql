/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : sky

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2021-05-05 14:01:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for apply_info
-- ----------------------------
DROP TABLE IF EXISTS `apply_info`;
CREATE TABLE `apply_info` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `apply_build` varchar(32) DEFAULT NULL,
  `apply_floor` varchar(32) DEFAULT NULL,
  `apply_room` varchar(32) DEFAULT NULL,
  `apply_lesson` varchar(32) DEFAULT NULL COMMENT '1~12课时',
  `apply_object` int DEFAULT NULL COMMENT '0:个人;1:社团组织;2:教师',
  `apply_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `apply_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reject_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '驳回理由',
  `apply_person` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `apply_status` int DEFAULT NULL COMMENT '0:未审核;1:通过;2:驳回.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_info
-- ----------------------------
INSERT INTO `apply_info` VALUES ('47', 'A', '1', '101', '3,4,5,6', '2', '2021-04-18 00:00:00', '数据库结构与设计', null, 'ailun', '1');
INSERT INTO `apply_info` VALUES ('48', 'A', '1', '101', '3,4,5,6', '2', '2021-04-19 00:00:00', 'java语言开发', null, 'ailun', '1');
INSERT INTO `apply_info` VALUES ('49', 'A', '1', '101', '3,4,5,6,7,8', '2', '2021-04-20 00:00:00', '游戏引擎开发与设计', null, 'ailun', '1');
INSERT INTO `apply_info` VALUES ('51', 'A', '1', '101', '1,2,3,4', '2', '2021-04-22 00:00:00', 'C语言设计', null, 'ailun', '0');
INSERT INTO `apply_info` VALUES ('52', 'A', '1', '101', '1,2,3,4', '1', '2021-04-22 00:00:00', '动漫社团建', null, 'ailun', '1');
INSERT INTO `apply_info` VALUES ('53', 'A', '1', '101', '8,9,10,11,12', '2', '2021-04-21 00:00:00', '计算机组成原理', null, 'ailun', '1');
INSERT INTO `apply_info` VALUES ('54', 'A', '1', '101', '8,9,10,11,12', '2', '2021-04-22 00:00:00', '数字图像处理', null, 'ailun', '1');
INSERT INTO `apply_info` VALUES ('55', 'A', '1', '101', '4,5,6,7,8', '2', '2021-04-23 00:00:00', '数据库开发', null, 'ailun', '1');
INSERT INTO `apply_info` VALUES ('56', 'A', '1', '101', '8,9,10,11', '2', '2021-04-19 00:00:00', 'java语言', null, 'ailun', '1');
INSERT INTO `apply_info` VALUES ('57', 'A', '1', '101', '8,9,10,11', '2', '2021-04-18 00:00:00', 'C语言设计', '课程选择冲突', 'admin', '1');
INSERT INTO `apply_info` VALUES ('58', 'A', '1', '102', '6,7,8', '2', '2021-04-20 00:00:00', 'Java开发', '课程选择冲突', null, '2');
INSERT INTO `apply_info` VALUES ('59', 'A', '1', '101', '9,10,11,12', '2', '2021-04-24 00:00:00', 'C语言设计', '课程选择冲突  理由不充分', null, '2');
INSERT INTO `apply_info` VALUES ('60', 'A', '1', '101', '4,5,6', '2', '2021-04-24 00:00:00', 'C语言设计', '课程选择冲突  理由不充分', 'abc', '1');
INSERT INTO `apply_info` VALUES ('61', 'A', '1', '101', '10,11,12', '2', '2021-04-24 00:00:00', '前端开发', '课程选择冲突  理由不充分', null, '2');
INSERT INTO `apply_info` VALUES ('62', 'A', '1', '101', '2,3,4', '2', '2021-04-21 00:00:00', '计算机班会', null, 'ailun', '0');

-- ----------------------------
-- Table structure for block
-- ----------------------------
DROP TABLE IF EXISTS `block`;
CREATE TABLE `block` (
  `id` int NOT NULL AUTO_INCREMENT,
  `block_code` varchar(32) DEFAULT NULL,
  `block_name` varchar(32) DEFAULT NULL,
  `block_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '大楼类型:\r\n  1.教学楼\r\n  2.实验楼',
  `status` varchar(8) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of block
-- ----------------------------
INSERT INTO `block` VALUES ('1', 'A', 'A幢', '1', '1');
INSERT INTO `block` VALUES ('2', 'B', 'B幢', '1', '1');
INSERT INTO `block` VALUES ('3', 'C', 'C幢', '1', '1');
INSERT INTO `block` VALUES ('4', 'D', 'D幢', '1', '1');
INSERT INTO `block` VALUES ('5', 'E', 'E幢', '1', '1');
INSERT INTO `block` VALUES ('6', 'F', 'F幢', '1', '0');
INSERT INTO `block` VALUES ('7', '1', '1号实验楼', '2', '1');
INSERT INTO `block` VALUES ('8', '2', '2号实验楼', '2', '1');
INSERT INTO `block` VALUES ('9', '3', '3号实验楼', '2', '1');
INSERT INTO `block` VALUES ('10', '4', '4号实验楼', '2', '1');
INSERT INTO `block` VALUES ('11', '5', '5号实验楼', '2', '1');
INSERT INTO `block` VALUES ('12', '6', '6号实验楼', '2', '1');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(48) DEFAULT NULL,
  `dept_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(8) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '2017001', '计算机科学与技术1701', '1-8', '1');
INSERT INTO `class` VALUES ('2', '2017002', '计算机科学与技术1702', '1-8', '1');
INSERT INTO `class` VALUES ('3', '2017003', '计算机科学与技术1703', '1-8', '1');
INSERT INTO `class` VALUES ('4', '2017004', '电子信息工程1701', '1-9', '1');
INSERT INTO `class` VALUES ('5', '2017005', '电子信息工程1702', '1-9', '1');
INSERT INTO `class` VALUES ('6', '2017006', '电子信息工程1703', '1-9', '1');
INSERT INTO `class` VALUES ('7', '2017007', '高分子材料与工程1701', '1-10', '1');
INSERT INTO `class` VALUES ('8', '2017008', '高分子材料与工程1702', '1-10', '1');
INSERT INTO `class` VALUES ('9', '2017009', '高分子材料与工程1703', '1-10', '1');
INSERT INTO `class` VALUES ('10', '2017010', '工业设计1701', '1-11', '1');
INSERT INTO `class` VALUES ('11', '2017011', '工业设计1702', '1-11', '1');
INSERT INTO `class` VALUES ('12', '2017012', '工业设计1703', '1-11', '1');
INSERT INTO `class` VALUES ('13', '2017013', '机械设计制造及其自动化1701', '1-12', '1');
INSERT INTO `class` VALUES ('14', '2017014', '机械设计制造及其自动化1702', '1-12', '1');
INSERT INTO `class` VALUES ('15', '2017015', '机械设计制造及其自动化1703', '1-12', '1');
INSERT INTO `class` VALUES ('16', '2017016', '应用心理学1701', '1-13', '1');
INSERT INTO `class` VALUES ('17', '2017017', '应用心理学1702', '1-13', '1');
INSERT INTO `class` VALUES ('18', '2017018', '应用心理学1703', '1-13', '1');
INSERT INTO `class` VALUES ('19', '2017019', '应用化学1701', '1-14', '1');
INSERT INTO `class` VALUES ('20', '2017020', '应用化学1702', '1-14', '1');
INSERT INTO `class` VALUES ('21', '2017021', '应用化学1703', '1-14', '1');
INSERT INTO `class` VALUES ('22', '2017022', '数学与应用数学1701', '1-15', '1');
INSERT INTO `class` VALUES ('23', '2017023', '数学与应用数学1702', '1-15', '1');
INSERT INTO `class` VALUES ('24', '2017024', '数学与应用数学1703', '1-15', '1');
INSERT INTO `class` VALUES ('25', '2017025', '市场营销1701', '2-16', '1');
INSERT INTO `class` VALUES ('26', '2017026', '市场营销1702', '2-16', '1');
INSERT INTO `class` VALUES ('27', '2017027', '市场营销1703', '2-16', '1');
INSERT INTO `class` VALUES ('28', '2017028', '会计学1701', '2-17', '1');
INSERT INTO `class` VALUES ('29', '2017029', '会计学1702', '2-17', '1');
INSERT INTO `class` VALUES ('30', '2017030', '会计学1703', '2-17', '1');
INSERT INTO `class` VALUES ('31', '2017031', '电子商务1701', '2-18', '1');
INSERT INTO `class` VALUES ('32', '2017032', '电子商务1702', '2-18', '1');
INSERT INTO `class` VALUES ('33', '2017033', '电子商务1703', '2-18', '1');
INSERT INTO `class` VALUES ('34', '2017034', '旅游管理1701', '2-19', '1');
INSERT INTO `class` VALUES ('35', '2017035', '旅游管理1702', '2-19', '1');
INSERT INTO `class` VALUES ('36', '2017036', '旅游管理1703', '2-19', '1');
INSERT INTO `class` VALUES ('37', '2017037', '音乐表演1701', '3-20', '1');
INSERT INTO `class` VALUES ('38', '2017038', '音乐表演1702', '3-20', '1');
INSERT INTO `class` VALUES ('39', '2017039', '音乐表演1703', '3-20', '1');
INSERT INTO `class` VALUES ('40', '2017040', '广播电视编导1701', '3-21', '1');
INSERT INTO `class` VALUES ('41', '2017041', '广播电视编导1702', '3-21', '1');
INSERT INTO `class` VALUES ('42', '2017042', '广播电视编导1703', '3-21', '1');
INSERT INTO `class` VALUES ('43', '2017043', '播音与主持艺术1701', '3-22', '1');
INSERT INTO `class` VALUES ('44', '2017044', '播音与主持艺术1702', '3-22', '1');
INSERT INTO `class` VALUES ('45', '2017045', '播音与主持艺术1703', '3-22', '1');
INSERT INTO `class` VALUES ('46', '2017046', '动画1701', '3-23', '1');
INSERT INTO `class` VALUES ('47', '2017047', '动画1702', '3-23', '1');
INSERT INTO `class` VALUES ('48', '2017048', '动画1703', '3-23', '1');
INSERT INTO `class` VALUES ('49', '2017049', '视觉传达设计1701', '3-24', '1');
INSERT INTO `class` VALUES ('50', '2017050', '视觉传达设计1702', '3-24', '1');
INSERT INTO `class` VALUES ('51', '2017051', '视觉传达设计1703', '3-24', '1');
INSERT INTO `class` VALUES ('52', '2017052', '环境设计1701', '3-25', '1');
INSERT INTO `class` VALUES ('53', '2017053', '环境设计1702', '3-25', '1');
INSERT INTO `class` VALUES ('54', '2017054', '环境设计1703', '3-25', '1');
INSERT INTO `class` VALUES ('55', '2017055', '产品设计1701', '3-26', '1');
INSERT INTO `class` VALUES ('56', '2017056', '产品设计1702', '3-26', '1');
INSERT INTO `class` VALUES ('57', '2017057', '产品设计1703', '3-26', '1');
INSERT INTO `class` VALUES ('58', '2017058', '服装与服饰设计1701', '3-27', '1');
INSERT INTO `class` VALUES ('59', '2017059', '服装与服饰设计1702', '3-27', '1');
INSERT INTO `class` VALUES ('60', '2017060', '服装与服饰设计1703', '3-27', '1');
INSERT INTO `class` VALUES ('61', '2017061', '临床医学1701', '4-28', '1');
INSERT INTO `class` VALUES ('62', '2017062', '临床医学1702', '4-28', '1');
INSERT INTO `class` VALUES ('63', '2017063', '临床医学1703', '4-28', '1');
INSERT INTO `class` VALUES ('64', '2017064', '临床医学1704', '4-28', '1');
INSERT INTO `class` VALUES ('65', '2017065', '临床医学1705', '4-28', '1');
INSERT INTO `class` VALUES ('66', '2017066', '临床医学1706', '4-28', '1');
INSERT INTO `class` VALUES ('67', '2017067', '护理学1701', '4-29', '1');
INSERT INTO `class` VALUES ('68', '2017068', '护理学1702', '4-29', '1');
INSERT INTO `class` VALUES ('69', '2017069', '护理学1703', '4-29', '1');
INSERT INTO `class` VALUES ('70', '2017070', '护理学1704', '4-29', '1');
INSERT INTO `class` VALUES ('71', '2017071', '护理学1705', '4-29', '1');
INSERT INTO `class` VALUES ('72', '2017072', '护理学1706', '4-29', '1');
INSERT INTO `class` VALUES ('73', '2017073', '汉语言文学1701', '5-31', '1');
INSERT INTO `class` VALUES ('74', '2017074', '汉语言文学1702', '5-31', '1');
INSERT INTO `class` VALUES ('75', '2017075', '汉语言文学1703', '5-31', '1');
INSERT INTO `class` VALUES ('76', '2017076', '汉语言文学1704', '5-31', '1');
INSERT INTO `class` VALUES ('77', '2017077', '法学1701', '5-32', '1');
INSERT INTO `class` VALUES ('78', '2017078', '法学1702', '5-32', '1');
INSERT INTO `class` VALUES ('79', '2017079', '法学1703', '5-32', '1');
INSERT INTO `class` VALUES ('80', '2017080', '英语1701', '6-33', '1');
INSERT INTO `class` VALUES ('81', '2017081', '英语1702', '6-33', '1');
INSERT INTO `class` VALUES ('82', '2017082', '英语1703', '6-33', '1');
INSERT INTO `class` VALUES ('83', '2017083', '英语1704', '6-33', '1');
INSERT INTO `class` VALUES ('84', '2017084', '英语1705', '6-33', '1');
INSERT INTO `class` VALUES ('85', '2017085', '英语1706', '6-33', '1');
INSERT INTO `class` VALUES ('86', '2017086', '体育教育1701', '7-34', '1');
INSERT INTO `class` VALUES ('87', '2017087', '体育教育1702', '7-34', '1');
INSERT INTO `class` VALUES ('88', '2017088', '体育教育1703', '7-34', '1');
INSERT INTO `class` VALUES ('89', '2017089', '体育教育1704', '7-34', '1');
INSERT INTO `class` VALUES ('90', '2017090', '体育教育1705', '7-34', '1');
INSERT INTO `class` VALUES ('91', '2018001', '计算机科学与技术1801', '1-8', '1');
INSERT INTO `class` VALUES ('92', '2018002', '计算机科学与技术1802', '1-8', '1');
INSERT INTO `class` VALUES ('93', '2018003', '计算机科学与技术1803', '1-8', '1');
INSERT INTO `class` VALUES ('94', '2018004', '电子信息工程1801', '1-9', '1');
INSERT INTO `class` VALUES ('95', '2018005', '电子信息工程1802', '1-9', '1');
INSERT INTO `class` VALUES ('96', '2018006', '电子信息工程1803', '1-9', '1');
INSERT INTO `class` VALUES ('97', '2018007', '高分子材料与工程1801', '1-10', '1');
INSERT INTO `class` VALUES ('98', '2018008', '高分子材料与工程1802', '1-10', '1');
INSERT INTO `class` VALUES ('99', '2018009', '高分子材料与工程1803', '1-10', '1');
INSERT INTO `class` VALUES ('100', '2018010', '工业设计1801', '1-11', '1');
INSERT INTO `class` VALUES ('101', '2018011', '工业设计1802', '1-11', '1');
INSERT INTO `class` VALUES ('102', '2018012', '工业设计1803', '1-11', '1');
INSERT INTO `class` VALUES ('103', '2018013', '机械设计制造及其自动化1801', '1-12', '1');
INSERT INTO `class` VALUES ('104', '2018014', '机械设计制造及其自动化1802', '1-12', '1');
INSERT INTO `class` VALUES ('105', '2018015', '机械设计制造及其自动化1803', '1-12', '1');
INSERT INTO `class` VALUES ('106', '2018016', '应用心理学1801', '1-13', '1');
INSERT INTO `class` VALUES ('107', '2018017', '应用心理学1802', '1-13', '1');
INSERT INTO `class` VALUES ('108', '2018018', '应用心理学1803', '1-13', '1');
INSERT INTO `class` VALUES ('109', '2018019', '应用化学1801', '1-14', '1');
INSERT INTO `class` VALUES ('110', '2018020', '应用化学1802', '1-14', '1');
INSERT INTO `class` VALUES ('111', '2018021', '应用化学1803', '1-14', '1');
INSERT INTO `class` VALUES ('112', '2018022', '数学与应用数学1801', '1-15', '1');
INSERT INTO `class` VALUES ('113', '2018023', '数学与应用数学1802', '1-15', '1');
INSERT INTO `class` VALUES ('114', '2018024', '数学与应用数学1803', '1-15', '1');
INSERT INTO `class` VALUES ('115', '2018025', '市场营销1801', '2-16', '1');
INSERT INTO `class` VALUES ('116', '2018026', '市场营销1802', '2-16', '1');
INSERT INTO `class` VALUES ('117', '2018027', '市场营销1803', '2-16', '1');
INSERT INTO `class` VALUES ('118', '2018028', '会计学1801', '2-17', '1');
INSERT INTO `class` VALUES ('119', '2018029', '会计学1802', '2-17', '1');
INSERT INTO `class` VALUES ('120', '2018030', '会计学1803', '2-17', '1');
INSERT INTO `class` VALUES ('121', '2018031', '电子商务1801', '2-18', '1');
INSERT INTO `class` VALUES ('122', '2018032', '电子商务1802', '2-18', '1');
INSERT INTO `class` VALUES ('123', '2018033', '电子商务1803', '2-18', '1');
INSERT INTO `class` VALUES ('124', '2018034', '旅游管理1801', '2-19', '1');
INSERT INTO `class` VALUES ('125', '2018035', '旅游管理1802', '2-19', '1');
INSERT INTO `class` VALUES ('126', '2018036', '旅游管理1803', '2-19', '1');
INSERT INTO `class` VALUES ('127', '2018037', '音乐表演1801', '3-20', '1');
INSERT INTO `class` VALUES ('128', '2018038', '音乐表演1802', '3-20', '1');
INSERT INTO `class` VALUES ('129', '2018039', '音乐表演1803', '3-20', '1');
INSERT INTO `class` VALUES ('130', '2018040', '广播电视编导1801', '3-21', '1');
INSERT INTO `class` VALUES ('131', '2018041', '广播电视编导1802', '3-21', '1');
INSERT INTO `class` VALUES ('132', '2018042', '广播电视编导1803', '3-21', '1');
INSERT INTO `class` VALUES ('133', '2018043', '播音与主持艺术1801', '3-22', '1');
INSERT INTO `class` VALUES ('134', '2018044', '播音与主持艺术1802', '3-22', '1');
INSERT INTO `class` VALUES ('135', '2018045', '播音与主持艺术1803', '3-22', '1');
INSERT INTO `class` VALUES ('136', '2018046', '动画1801', '3-23', '1');
INSERT INTO `class` VALUES ('137', '2018047', '动画1802', '3-23', '1');
INSERT INTO `class` VALUES ('138', '2018048', '动画1803', '3-23', '1');
INSERT INTO `class` VALUES ('139', '2018049', '视觉传达设计1801', '3-24', '1');
INSERT INTO `class` VALUES ('140', '2018050', '视觉传达设计1802', '3-24', '1');
INSERT INTO `class` VALUES ('141', '2018051', '视觉传达设计1803', '3-24', '1');
INSERT INTO `class` VALUES ('142', '2018052', '环境设计1801', '3-25', '1');
INSERT INTO `class` VALUES ('143', '2018053', '环境设计1802', '3-25', '1');
INSERT INTO `class` VALUES ('144', '2018054', '环境设计1803', '3-25', '1');
INSERT INTO `class` VALUES ('145', '2018055', '产品设计1801', '3-26', '1');
INSERT INTO `class` VALUES ('146', '2018056', '产品设计1802', '3-26', '1');
INSERT INTO `class` VALUES ('147', '2018057', '产品设计1803', '3-26', '1');
INSERT INTO `class` VALUES ('148', '2018058', '服装与服饰设计1801', '3-27', '1');
INSERT INTO `class` VALUES ('149', '2018059', '服装与服饰设计1802', '3-27', '1');
INSERT INTO `class` VALUES ('150', '2018060', '服装与服饰设计1803', '3-27', '1');
INSERT INTO `class` VALUES ('151', '2018061', '临床医学1801', '4-28', '1');
INSERT INTO `class` VALUES ('152', '2018062', '临床医学1802', '4-28', '1');
INSERT INTO `class` VALUES ('153', '2018063', '临床医学1803', '4-28', '1');
INSERT INTO `class` VALUES ('154', '2018064', '临床医学1804', '4-28', '1');
INSERT INTO `class` VALUES ('155', '2018065', '临床医学1805', '4-28', '1');
INSERT INTO `class` VALUES ('156', '2018066', '临床医学1806', '4-28', '1');
INSERT INTO `class` VALUES ('157', '2018067', '护理学1801', '4-29', '1');
INSERT INTO `class` VALUES ('158', '2018068', '护理学1802', '4-29', '1');
INSERT INTO `class` VALUES ('159', '2018069', '护理学1803', '4-29', '1');
INSERT INTO `class` VALUES ('160', '2018070', '护理学1804', '4-29', '1');
INSERT INTO `class` VALUES ('161', '2018071', '护理学1805', '4-29', '1');
INSERT INTO `class` VALUES ('162', '2018072', '护理学1806', '4-29', '1');
INSERT INTO `class` VALUES ('163', '2018073', '汉语言文学1801', '5-31', '1');
INSERT INTO `class` VALUES ('164', '2018074', '汉语言文学1802', '5-31', '1');
INSERT INTO `class` VALUES ('165', '2018075', '汉语言文学1803', '5-31', '1');
INSERT INTO `class` VALUES ('166', '2018076', '汉语言文学1804', '5-31', '1');
INSERT INTO `class` VALUES ('167', '2018077', '法学1801', '5-32', '1');
INSERT INTO `class` VALUES ('168', '2018078', '法学1802', '5-32', '1');
INSERT INTO `class` VALUES ('169', '2018079', '法学1803', '5-32', '1');
INSERT INTO `class` VALUES ('170', '2018080', '英语1801', '6-33', '1');
INSERT INTO `class` VALUES ('171', '2018081', '英语1802', '6-33', '1');
INSERT INTO `class` VALUES ('172', '2018082', '英语1803', '6-33', '1');
INSERT INTO `class` VALUES ('173', '2018083', '英语1804', '6-33', '1');
INSERT INTO `class` VALUES ('174', '2018084', '英语1805', '6-33', '1');
INSERT INTO `class` VALUES ('175', '2018085', '英语1806', '6-33', '1');
INSERT INTO `class` VALUES ('176', '2018086', '体育教育1801', '7-34', '1');
INSERT INTO `class` VALUES ('177', '2018087', '体育教育1802', '7-34', '1');
INSERT INTO `class` VALUES ('178', '2018088', '体育教育1803', '7-34', '1');
INSERT INTO `class` VALUES ('179', '2018089', '体育教育1804', '7-34', '1');
INSERT INTO `class` VALUES ('180', '2018090', '体育教育1805', '7-34', '1');
INSERT INTO `class` VALUES ('181', '2019001', '计算机科学与技术1901', '1-8', '1');
INSERT INTO `class` VALUES ('182', '2019002', '计算机科学与技术1902', '1-8', '1');
INSERT INTO `class` VALUES ('183', '2019003', '计算机科学与技术1903', '1-8', '1');
INSERT INTO `class` VALUES ('184', '2019004', '电子信息工程1901', '1-9', '1');
INSERT INTO `class` VALUES ('185', '2019005', '电子信息工程1902', '1-9', '1');
INSERT INTO `class` VALUES ('186', '2019006', '电子信息工程1903', '1-9', '1');
INSERT INTO `class` VALUES ('187', '2019007', '高分子材料与工程1901', '1-10', '1');
INSERT INTO `class` VALUES ('188', '2019008', '高分子材料与工程1902', '1-10', '1');
INSERT INTO `class` VALUES ('189', '2019009', '高分子材料与工程1903', '1-10', '1');
INSERT INTO `class` VALUES ('190', '2019010', '工业设计1901', '1-11', '1');
INSERT INTO `class` VALUES ('191', '2019011', '工业设计1902', '1-11', '1');
INSERT INTO `class` VALUES ('192', '2019012', '工业设计1903', '1-11', '1');
INSERT INTO `class` VALUES ('193', '2019013', '机械设计制造及其自动化1901', '1-12', '1');
INSERT INTO `class` VALUES ('194', '2019014', '机械设计制造及其自动化1902', '1-12', '1');
INSERT INTO `class` VALUES ('195', '2019015', '机械设计制造及其自动化1903', '1-12', '1');
INSERT INTO `class` VALUES ('196', '2019016', '应用心理学1901', '1-13', '1');
INSERT INTO `class` VALUES ('197', '2019017', '应用心理学1902', '1-13', '1');
INSERT INTO `class` VALUES ('198', '2019018', '应用心理学1903', '1-13', '1');
INSERT INTO `class` VALUES ('199', '2019019', '应用化学1901', '1-14', '1');
INSERT INTO `class` VALUES ('200', '2019020', '应用化学1902', '1-14', '1');
INSERT INTO `class` VALUES ('201', '2019021', '应用化学1903', '1-14', '1');
INSERT INTO `class` VALUES ('202', '2019022', '数学与应用数学1901', '1-15', '1');
INSERT INTO `class` VALUES ('203', '2019023', '数学与应用数学1902', '1-15', '1');
INSERT INTO `class` VALUES ('204', '2019024', '数学与应用数学1903', '1-15', '1');
INSERT INTO `class` VALUES ('205', '2019025', '市场营销1901', '2-16', '1');
INSERT INTO `class` VALUES ('206', '2019026', '市场营销1902', '2-16', '1');
INSERT INTO `class` VALUES ('207', '2019027', '市场营销1903', '2-16', '1');
INSERT INTO `class` VALUES ('208', '2019028', '会计学1901', '2-17', '1');
INSERT INTO `class` VALUES ('209', '2019029', '会计学1902', '2-17', '1');
INSERT INTO `class` VALUES ('210', '2019030', '会计学1903', '2-17', '1');
INSERT INTO `class` VALUES ('211', '2019031', '电子商务1901', '2-18', '1');
INSERT INTO `class` VALUES ('212', '2019032', '电子商务1902', '2-18', '1');
INSERT INTO `class` VALUES ('213', '2019033', '电子商务1903', '2-18', '1');
INSERT INTO `class` VALUES ('214', '2019034', '旅游管理1901', '2-19', '1');
INSERT INTO `class` VALUES ('215', '2019035', '旅游管理1902', '2-19', '1');
INSERT INTO `class` VALUES ('216', '2019036', '旅游管理1903', '2-19', '1');
INSERT INTO `class` VALUES ('217', '2019037', '音乐表演1901', '3-20', '1');
INSERT INTO `class` VALUES ('218', '2019038', '音乐表演1902', '3-20', '1');
INSERT INTO `class` VALUES ('219', '2019039', '音乐表演1903', '3-20', '1');
INSERT INTO `class` VALUES ('220', '2019040', '广播电视编导1901', '3-21', '1');
INSERT INTO `class` VALUES ('221', '2019041', '广播电视编导1902', '3-21', '1');
INSERT INTO `class` VALUES ('222', '2019042', '广播电视编导1903', '3-21', '1');
INSERT INTO `class` VALUES ('223', '2019043', '播音与主持艺术1901', '3-22', '1');
INSERT INTO `class` VALUES ('224', '2019044', '播音与主持艺术1902', '3-22', '1');
INSERT INTO `class` VALUES ('225', '2019045', '播音与主持艺术1903', '3-22', '1');
INSERT INTO `class` VALUES ('226', '2019046', '动画1901', '3-23', '1');
INSERT INTO `class` VALUES ('227', '2019047', '动画1902', '3-23', '1');
INSERT INTO `class` VALUES ('228', '2019048', '动画1903', '3-23', '1');
INSERT INTO `class` VALUES ('229', '2019049', '视觉传达设计1901', '3-24', '1');
INSERT INTO `class` VALUES ('230', '2019050', '视觉传达设计1902', '3-24', '1');
INSERT INTO `class` VALUES ('231', '2019051', '视觉传达设计1903', '3-24', '1');
INSERT INTO `class` VALUES ('232', '2019052', '环境设计1901', '3-25', '1');
INSERT INTO `class` VALUES ('233', '2019053', '环境设计1902', '3-25', '1');
INSERT INTO `class` VALUES ('234', '2019054', '环境设计1903', '3-25', '1');
INSERT INTO `class` VALUES ('235', '2019055', '产品设计1901', '3-26', '1');
INSERT INTO `class` VALUES ('236', '2019056', '产品设计1902', '3-26', '1');
INSERT INTO `class` VALUES ('237', '2019057', '产品设计1903', '3-26', '1');
INSERT INTO `class` VALUES ('238', '2019058', '服装与服饰设计1901', '3-27', '1');
INSERT INTO `class` VALUES ('239', '2019059', '服装与服饰设计1902', '3-27', '1');
INSERT INTO `class` VALUES ('240', '2019060', '服装与服饰设计1903', '3-27', '1');
INSERT INTO `class` VALUES ('241', '2019061', '临床医学1901', '4-28', '1');
INSERT INTO `class` VALUES ('242', '2019062', '临床医学1902', '4-28', '1');
INSERT INTO `class` VALUES ('243', '2019063', '临床医学1903', '4-28', '1');
INSERT INTO `class` VALUES ('244', '2019064', '临床医学1904', '4-28', '1');
INSERT INTO `class` VALUES ('245', '2019065', '临床医学1905', '4-28', '1');
INSERT INTO `class` VALUES ('246', '2019066', '临床医学1906', '4-28', '1');
INSERT INTO `class` VALUES ('247', '2019067', '护理学1901', '4-29', '1');
INSERT INTO `class` VALUES ('248', '2019068', '护理学1902', '4-29', '1');
INSERT INTO `class` VALUES ('249', '2019069', '护理学1903', '4-29', '1');
INSERT INTO `class` VALUES ('250', '2019070', '护理学1904', '4-29', '1');
INSERT INTO `class` VALUES ('251', '2019071', '护理学1905', '4-29', '1');
INSERT INTO `class` VALUES ('252', '2019072', '护理学1906', '4-29', '1');
INSERT INTO `class` VALUES ('253', '2019073', '汉语言文学1901', '5-31', '1');
INSERT INTO `class` VALUES ('254', '2019074', '汉语言文学1902', '5-31', '1');
INSERT INTO `class` VALUES ('255', '2019075', '汉语言文学1903', '5-31', '1');
INSERT INTO `class` VALUES ('256', '2019076', '汉语言文学1904', '5-31', '1');
INSERT INTO `class` VALUES ('257', '2019077', '法学1901', '5-32', '1');
INSERT INTO `class` VALUES ('258', '2019078', '法学1902', '5-32', '1');
INSERT INTO `class` VALUES ('259', '2019079', '法学1903', '5-32', '1');
INSERT INTO `class` VALUES ('260', '2019080', '英语1901', '6-33', '1');
INSERT INTO `class` VALUES ('261', '2019081', '英语1902', '6-33', '1');
INSERT INTO `class` VALUES ('262', '2019082', '英语1903', '6-33', '1');
INSERT INTO `class` VALUES ('263', '2019083', '英语1904', '6-33', '1');
INSERT INTO `class` VALUES ('264', '2019084', '英语1905', '6-33', '1');
INSERT INTO `class` VALUES ('265', '2019085', '英语1906', '6-33', '1');
INSERT INTO `class` VALUES ('266', '2019086', '体育教育1901', '7-34', '1');
INSERT INTO `class` VALUES ('267', '2019087', '体育教育1902', '7-34', '1');
INSERT INTO `class` VALUES ('268', '2019088', '体育教育1903', '7-34', '1');
INSERT INTO `class` VALUES ('269', '2019089', '体育教育1904', '7-34', '1');
INSERT INTO `class` VALUES ('270', '2019090', '体育教育1905', '7-34', '1');
INSERT INTO `class` VALUES ('271', '2020001', '计算机科学与技术2001', '1-8', '1');
INSERT INTO `class` VALUES ('272', '2020002', '计算机科学与技术2002', '1-8', '1');
INSERT INTO `class` VALUES ('273', '2020003', '计算机科学与技术2003', '1-8', '1');
INSERT INTO `class` VALUES ('274', '2020004', '电子信息工程2001', '1-9', '1');
INSERT INTO `class` VALUES ('275', '2020005', '电子信息工程2002', '1-9', '1');
INSERT INTO `class` VALUES ('276', '2020006', '电子信息工程2003', '1-9', '1');
INSERT INTO `class` VALUES ('277', '2020007', '高分子材料与工程2001', '1-10', '1');
INSERT INTO `class` VALUES ('278', '2020008', '高分子材料与工程2002', '1-10', '1');
INSERT INTO `class` VALUES ('279', '2020009', '高分子材料与工程2003', '1-10', '1');
INSERT INTO `class` VALUES ('280', '2020010', '工业设计2001', '1-11', '1');
INSERT INTO `class` VALUES ('281', '2020011', '工业设计2002', '1-11', '1');
INSERT INTO `class` VALUES ('282', '2020012', '工业设计2003', '1-11', '1');
INSERT INTO `class` VALUES ('283', '2020013', '机械设计制造及其自动化2001', '1-12', '1');
INSERT INTO `class` VALUES ('284', '2020014', '机械设计制造及其自动化2002', '1-12', '1');
INSERT INTO `class` VALUES ('285', '2020015', '机械设计制造及其自动化2003', '1-12', '1');
INSERT INTO `class` VALUES ('286', '2020016', '应用心理学2001', '1-13', '1');
INSERT INTO `class` VALUES ('287', '2020017', '应用心理学2002', '1-13', '1');
INSERT INTO `class` VALUES ('288', '2020018', '应用心理学2003', '1-13', '1');
INSERT INTO `class` VALUES ('289', '2020019', '应用化学2001', '1-14', '1');
INSERT INTO `class` VALUES ('290', '2020020', '应用化学2002', '1-14', '1');
INSERT INTO `class` VALUES ('291', '2020021', '应用化学2003', '1-14', '1');
INSERT INTO `class` VALUES ('292', '2020022', '数学与应用数学2001', '1-15', '1');
INSERT INTO `class` VALUES ('293', '2020023', '数学与应用数学2002', '1-15', '1');
INSERT INTO `class` VALUES ('294', '2020024', '数学与应用数学2003', '1-15', '1');
INSERT INTO `class` VALUES ('295', '2020025', '市场营销2001', '2-16', '1');
INSERT INTO `class` VALUES ('296', '2020026', '市场营销2002', '2-16', '1');
INSERT INTO `class` VALUES ('297', '2020027', '市场营销2003', '2-16', '1');
INSERT INTO `class` VALUES ('298', '2020028', '会计学2001', '2-17', '1');
INSERT INTO `class` VALUES ('299', '2020029', '会计学2002', '2-17', '1');
INSERT INTO `class` VALUES ('300', '2020030', '会计学2003', '2-17', '1');
INSERT INTO `class` VALUES ('301', '2020031', '电子商务2001', '2-18', '1');
INSERT INTO `class` VALUES ('302', '2020032', '电子商务2002', '2-18', '1');
INSERT INTO `class` VALUES ('303', '2020033', '电子商务2003', '2-18', '1');
INSERT INTO `class` VALUES ('304', '2020034', '旅游管理2001', '2-19', '1');
INSERT INTO `class` VALUES ('305', '2020035', '旅游管理2002', '2-19', '1');
INSERT INTO `class` VALUES ('306', '2020036', '旅游管理2003', '2-19', '1');
INSERT INTO `class` VALUES ('307', '2020037', '音乐表演2001', '3-20', '1');
INSERT INTO `class` VALUES ('308', '2020038', '音乐表演2002', '3-20', '1');
INSERT INTO `class` VALUES ('309', '2020039', '音乐表演2003', '3-20', '1');
INSERT INTO `class` VALUES ('310', '2020040', '广播电视编导2001', '3-21', '1');
INSERT INTO `class` VALUES ('311', '2020041', '广播电视编导2002', '3-21', '1');
INSERT INTO `class` VALUES ('312', '2020042', '广播电视编导2003', '3-21', '1');
INSERT INTO `class` VALUES ('313', '2020043', '播音与主持艺术2001', '3-22', '1');
INSERT INTO `class` VALUES ('314', '2020044', '播音与主持艺术2002', '3-22', '1');
INSERT INTO `class` VALUES ('315', '2020045', '播音与主持艺术2003', '3-22', '1');
INSERT INTO `class` VALUES ('316', '2020046', '动画2001', '3-23', '1');
INSERT INTO `class` VALUES ('317', '2020047', '动画2002', '3-23', '1');
INSERT INTO `class` VALUES ('318', '2020048', '动画2003', '3-23', '1');
INSERT INTO `class` VALUES ('319', '2020049', '视觉传达设计2001', '3-24', '1');
INSERT INTO `class` VALUES ('320', '2020050', '视觉传达设计2002', '3-24', '1');
INSERT INTO `class` VALUES ('321', '2020051', '视觉传达设计2003', '3-24', '1');
INSERT INTO `class` VALUES ('322', '2020052', '环境设计2001', '3-25', '1');
INSERT INTO `class` VALUES ('323', '2020053', '环境设计2002', '3-25', '1');
INSERT INTO `class` VALUES ('324', '2020054', '环境设计2003', '3-25', '1');
INSERT INTO `class` VALUES ('325', '2020055', '产品设计2001', '3-26', '1');
INSERT INTO `class` VALUES ('326', '2020056', '产品设计2002', '3-26', '1');
INSERT INTO `class` VALUES ('327', '2020057', '产品设计2003', '3-26', '1');
INSERT INTO `class` VALUES ('328', '2020058', '服装与服饰设计2001', '3-27', '1');
INSERT INTO `class` VALUES ('329', '2020059', '服装与服饰设计2002', '3-27', '1');
INSERT INTO `class` VALUES ('330', '2020060', '服装与服饰设计2003', '3-27', '1');
INSERT INTO `class` VALUES ('331', '2020061', '临床医学2001', '4-28', '1');
INSERT INTO `class` VALUES ('332', '2020062', '临床医学2002', '4-28', '1');
INSERT INTO `class` VALUES ('333', '2020063', '临床医学2003', '4-28', '1');
INSERT INTO `class` VALUES ('334', '2020064', '临床医学2004', '4-28', '1');
INSERT INTO `class` VALUES ('335', '2020065', '临床医学2005', '4-28', '1');
INSERT INTO `class` VALUES ('336', '2020066', '临床医学2006', '4-28', '1');
INSERT INTO `class` VALUES ('337', '2020067', '护理学2001', '4-29', '1');
INSERT INTO `class` VALUES ('338', '2020068', '护理学2002', '4-29', '1');
INSERT INTO `class` VALUES ('339', '2020069', '护理学2003', '4-29', '1');
INSERT INTO `class` VALUES ('340', '2020070', '护理学2004', '4-29', '1');
INSERT INTO `class` VALUES ('341', '2020071', '护理学2005', '4-29', '1');
INSERT INTO `class` VALUES ('342', '2020072', '护理学2006', '4-29', '1');
INSERT INTO `class` VALUES ('343', '2020073', '汉语言文学2001', '5-31', '1');
INSERT INTO `class` VALUES ('344', '2020074', '汉语言文学2002', '5-31', '1');
INSERT INTO `class` VALUES ('345', '2020075', '汉语言文学2003', '5-31', '1');
INSERT INTO `class` VALUES ('346', '2020076', '汉语言文学2004', '5-31', '1');
INSERT INTO `class` VALUES ('347', '2020077', '法学2001', '5-32', '1');
INSERT INTO `class` VALUES ('348', '2020078', '法学2002', '5-32', '1');
INSERT INTO `class` VALUES ('349', '2020079', '法学2003', '5-32', '1');
INSERT INTO `class` VALUES ('350', '2020080', '英语2001', '6-33', '1');
INSERT INTO `class` VALUES ('351', '2020081', '英语2002', '6-33', '1');
INSERT INTO `class` VALUES ('352', '2020082', '英语2003', '6-33', '1');
INSERT INTO `class` VALUES ('353', '2020083', '英语2004', '6-33', '1');
INSERT INTO `class` VALUES ('354', '2020084', '英语2005', '6-33', '1');
INSERT INTO `class` VALUES ('355', '2020085', '英语2006', '6-33', '1');
INSERT INTO `class` VALUES ('356', '2020086', '体育教育2001', '7-34', '1');
INSERT INTO `class` VALUES ('357', '2020087', '体育教育2002', '7-34', '1');
INSERT INTO `class` VALUES ('358', '2020088', '体育教育2003', '7-34', '1');
INSERT INTO `class` VALUES ('359', '2020089', '体育教育2004', '7-34', '1');
INSERT INTO `class` VALUES ('360', '2020090', '体育教育2005', '7-34', '1');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(32) DEFAULT NULL,
  `dept_name` varchar(32) DEFAULT NULL,
  `dept_fullname` varchar(64) DEFAULT NULL,
  `dept_pcode` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dept_status` varchar(8) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '1', '理工分院', null, '0', '1');
INSERT INTO `dept` VALUES ('2', '2', '经管分院', null, '0', '1');
INSERT INTO `dept` VALUES ('3', '3', '艺传分院', null, '0', '1');
INSERT INTO `dept` VALUES ('4', '4', '护理分院', null, '0', '1');
INSERT INTO `dept` VALUES ('5', '5', '文法分院', null, '0', '1');
INSERT INTO `dept` VALUES ('6', '6', '外语分院', null, '0', '1');
INSERT INTO `dept` VALUES ('7', '7', '体育分院', null, '0', '1');
INSERT INTO `dept` VALUES ('8', '1-8', '计算机科学与技术', '理工分院', '1', '1');
INSERT INTO `dept` VALUES ('9', '1-9', '电子信息工程', '理工分院', '1', '1');
INSERT INTO `dept` VALUES ('10', '1-10', '高分子材料与工程', '理工分院', '1', '1');
INSERT INTO `dept` VALUES ('11', '1-11', '工业设计', '理工分院', '1', '1');
INSERT INTO `dept` VALUES ('12', '1-12', '机械设计制造及其自动化', '理工分院', '1', '1');
INSERT INTO `dept` VALUES ('13', '1-13', '应用心理学', '理工分院', '1', '1');
INSERT INTO `dept` VALUES ('14', '1-14', '应用化学', '理工分院', '1', '1');
INSERT INTO `dept` VALUES ('15', '1-15', '数学与应用数学', '理工分院', '1', '1');
INSERT INTO `dept` VALUES ('16', '2-16', '市场营销', '经管分院', '2', '1');
INSERT INTO `dept` VALUES ('17', '2-17', '会计学', '经管分院', '2', '1');
INSERT INTO `dept` VALUES ('18', '2-18', '电子商务', '经管分院', '2', '1');
INSERT INTO `dept` VALUES ('19', '2-19', '旅游管理', '经管分院', '2', '1');
INSERT INTO `dept` VALUES ('20', '3-20', '音乐表演', '艺传分院', '3', '1');
INSERT INTO `dept` VALUES ('21', '3-21', '广播电视编导', '艺传分院', '3', '1');
INSERT INTO `dept` VALUES ('22', '3-22', '播音与主持艺术', '艺传分院', '3', '1');
INSERT INTO `dept` VALUES ('23', '3-23', '动画', '艺传分院', '3', '1');
INSERT INTO `dept` VALUES ('24', '3-24', '视觉传达设计', '艺传分院', '3', '1');
INSERT INTO `dept` VALUES ('25', '3-25', '环境设计', '艺传分院', '3', '1');
INSERT INTO `dept` VALUES ('26', '3-26', '产品设计', '艺传分院', '3', '1');
INSERT INTO `dept` VALUES ('27', '3-27', '服装与服饰设计', '艺传分院', '3', '1');
INSERT INTO `dept` VALUES ('28', '4-28', '临床医学', '护理分院', '4', '1');
INSERT INTO `dept` VALUES ('29', '4-29', '护理学', '护理分院', '4', '1');
INSERT INTO `dept` VALUES ('31', '5-31', '汉语言文学', '文法分院', '5', '1');
INSERT INTO `dept` VALUES ('32', '5-32', '法学', '文法分院', '5', '1');
INSERT INTO `dept` VALUES ('33', '6-33', '英语', '外语分院', '6', '1');
INSERT INTO `dept` VALUES ('34', '7-34', '体育教育', '体育分院', '7', '1');

-- ----------------------------
-- Table structure for lesson
-- ----------------------------
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE `lesson` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lesson_name` varchar(128) DEFAULT NULL,
  `dept_code` varchar(32) DEFAULT NULL,
  `status` varchar(8) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lesson
-- ----------------------------
INSERT INTO `lesson` VALUES ('1', 'C语言设计', '1-8', '1');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_code` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `menu_name` varchar(32) DEFAULT NULL,
  `menu_pcode` varchar(32) DEFAULT NULL,
  `menu_url` varchar(64) DEFAULT NULL,
  `menu_sort` int DEFAULT NULL,
  `menu_status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '01', '信息管理', '01', null, '1', '1', '2020-12-24 10:27:43', null);
INSERT INTO `menu` VALUES ('2', '02', '教室管理', '02', '', '2', '1', '2020-12-24 10:27:52', null);
INSERT INTO `menu` VALUES ('3', '03', '申请审核', '03', null, '3', '1', '2020-10-19 14:54:53', null);
INSERT INTO `menu` VALUES ('4', '04', '系统设置', '04', '/system/modify', '4', '1', '2021-04-20 15:37:05', null);
INSERT INTO `menu` VALUES ('5', '05', '消息查看', '05', '/message/index', '5', '1', '2021-03-25 09:55:52', null);
INSERT INTO `menu` VALUES ('6', '0101', '教师信息查询', '01', '/msg/teacher', '1', '1', '2020-10-20 15:17:57', null);
INSERT INTO `menu` VALUES ('7', '0102', '学生信息查询', '01', '/msg/student', '1', '1', '2020-10-20 15:18:06', null);
INSERT INTO `menu` VALUES ('8', '0201', '教室查询', '02', '/order/index', '2', '1', '2020-11-10 15:02:26', null);
INSERT INTO `menu` VALUES ('9', '0202', '教室申请', '02', '/order/orderRoom', '2', '1', '2021-03-05 09:47:31', null);
INSERT INTO `menu` VALUES ('10', '0103', '创建新账户', '01', '/msg/createOne', '1', '1', '2020-12-24 14:17:13', null);
INSERT INTO `menu` VALUES ('11', '0301', '查看申请', '03', '/apply/index', '1', '1', '2021-03-05 16:29:25', null);
INSERT INTO `menu` VALUES ('12', '0203', '教室报修', '02', '/order/repairRoom', '3', '1', '2021-04-19 16:42:45', null);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_code` varchar(32) DEFAULT NULL,
  `send_user_code` varchar(32) DEFAULT NULL,
  `mess_title` varchar(64) DEFAULT NULL,
  `mess_content` varchar(255) DEFAULT NULL,
  `mess_type` int DEFAULT NULL COMMENT '0:公告;1:教室审核;2:报修',
  `mess_url` varchar(255) DEFAULT NULL,
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `valid_time` timestamp NULL DEFAULT NULL COMMENT '有效期限',
  `third_id` varchar(32) DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '0:未读;1:已读.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('66', 'admin', 'ailun', '申请使用教室，教室:A-101，课时:3,4,5,6', null, '1', null, '2021-04-23 13:04:37', null, '47', '1');
INSERT INTO `message` VALUES ('67', 'ailun', '管理员', '您的教室申请已通过，教室:A-101，课时:3,4,5,6', null, '1', null, '2021-04-23 13:05:10', null, '47', '0');
INSERT INTO `message` VALUES ('68', 'admin', 'ailun', '申请使用教室，教室:A-101，课时:3,4,5,6', null, '1', null, '2021-04-23 13:05:41', null, '48', '1');
INSERT INTO `message` VALUES ('69', 'ailun', '管理员', '您的教室申请已通过，教室:A-101，课时:3,4,5,6', null, '1', null, '2021-04-23 13:05:51', null, '48', '0');
INSERT INTO `message` VALUES ('70', 'admin', 'ailun', '申请使用教室，教室:A-101，课时:3,4,5,6,7,8', null, '1', null, '2021-04-23 13:09:05', null, '49', '1');
INSERT INTO `message` VALUES ('71', 'ailun', '管理员', '您的教室申请已通过，教室:A-101，课时:3,4,5,6,7,8', null, '1', null, '2021-04-23 13:09:17', null, '49', '0');
INSERT INTO `message` VALUES ('72', 'admin', 'ailun', '申请使用教室，教室:A-101，课时:2,3,4,5,6,7,8', null, '1', null, '2021-04-23 13:10:12', null, '50', '1');
INSERT INTO `message` VALUES ('73', 'admin', 'ailun', '申请使用教室，教室:A-101，课时:1,2,3,4', null, '1', null, '2021-04-23 13:12:19', null, '51', '1');
INSERT INTO `message` VALUES ('74', 'admin', 'ailun', '申请使用教室，教室:A-101，课时:1,2,3,4', null, '1', null, '2021-04-23 13:30:24', null, '52', '1');
INSERT INTO `message` VALUES ('75', 'ailun', '管理员', '您的教室申请已通过，教室:A-101，课时:1,2,3,4', null, '1', null, '2021-04-23 13:30:31', null, '52', '0');
INSERT INTO `message` VALUES ('76', 'admin', 'ailun', '申请使用教室，教室:A-101，课时:8,9,10,11,12', null, '1', null, '2021-04-23 13:31:03', null, '53', '1');
INSERT INTO `message` VALUES ('77', 'ailun', '管理员', '您的教室申请已通过，教室:A-101，课时:8,9,10,11,12', null, '1', null, '2021-04-23 13:31:11', null, '53', '0');
INSERT INTO `message` VALUES ('78', 'admin', 'ailun', '申请使用教室，教室:A-101，课时:8,9,10,11,12', null, '1', null, '2021-04-23 13:31:41', null, '54', '1');
INSERT INTO `message` VALUES ('79', 'ailun', '管理员', '您的教室申请已通过，教室:A-101，课时:8,9,10,11,12', null, '1', null, '2021-04-23 13:31:48', null, '54', '0');
INSERT INTO `message` VALUES ('80', 'admin', 'ailun', '申请使用教室，教室:A-101，课时:4,5,6,7,8', null, '1', null, '2021-04-23 13:45:43', null, '55', '1');
INSERT INTO `message` VALUES ('81', 'ailun', '管理员', '您的教室申请已通过，教室:A-101，课时:4,5,6,7,8', null, '1', null, '2021-04-23 13:45:58', null, '55', '0');
INSERT INTO `message` VALUES ('82', 'admin', 'ailun', '申请使用教室，教室:A-101，课时:8,9,10,11', null, '1', null, '2021-04-23 13:47:20', null, '56', '1');
INSERT INTO `message` VALUES ('83', 'ailun', '管理员', '您的教室申请已通过，教室:A-101，课时:8,9,10,11', null, '1', null, '2021-04-23 13:48:29', null, '56', '0');
INSERT INTO `message` VALUES ('84', 'admin', 'admin', '发现教室故障请立即确认，教室:A-101', null, '2', null, '2021-04-23 14:48:26', null, '27', '1');
INSERT INTO `message` VALUES ('85', 'admin', 'ailun', '发现教室故障请立即确认，教室:A-101', null, '2', null, '2021-04-23 14:49:35', null, '28', '1');
INSERT INTO `message` VALUES ('86', 'admin', 'ailun', '发现教室故障请立即确认，教室:A-101', null, '2', null, '2021-04-23 14:50:55', null, '29', '1');
INSERT INTO `message` VALUES ('87', 'admin', 'admin', '申请使用教室，教室:A-101，课时:8,9,10,11', null, '1', null, '2021-04-24 08:37:02', null, '57', '1');
INSERT INTO `message` VALUES ('88', 'admin', '管理员', '您的教室申请已通过，教室:A-101，课时:8,9,10,11', null, '1', null, '2021-04-24 08:37:16', null, '57', '1');
INSERT INTO `message` VALUES ('89', 'admin', 'admin', '申请使用教室，教室:A-102，课时:6,7,8', null, '1', null, '2021-04-24 08:37:39', null, '58', '1');
INSERT INTO `message` VALUES ('90', 'admin', 'admin', '申请使用教室，教室:A-101，课时:9,10,11,12', null, '1', null, '2021-04-24 11:23:39', null, '59', '1');
INSERT INTO `message` VALUES ('91', 'admin', 'abc', '申请使用教室，教室:A-101，课时:4,5,6', null, '1', null, '2021-04-24 11:24:48', null, '60', '1');
INSERT INTO `message` VALUES ('92', 'abc', '管理员', '您的教室申请已通过，教室:A-101，课时:4,5,6', null, '1', null, '2021-04-24 11:25:03', null, '60', '0');
INSERT INTO `message` VALUES ('93', 'admin', 'abc', '申请使用教室，教室:A-101，课时:10,11,12', null, '1', null, '2021-04-24 11:25:30', null, '61', '1');
INSERT INTO `message` VALUES ('94', 'admin', 'ailun', '申请使用教室，教室:A-101，课时:2,3,4', null, '1', null, '2021-04-24 14:15:21', null, '62', '1');

-- ----------------------------
-- Table structure for order_room
-- ----------------------------
DROP TABLE IF EXISTS `order_room`;
CREATE TABLE `order_room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_code` varchar(32) DEFAULT NULL,
  `user` varchar(32) DEFAULT NULL,
  `date_time` date DEFAULT NULL,
  `week_time` int DEFAULT NULL,
  `time_start` int DEFAULT NULL,
  `time_end` int DEFAULT NULL,
  `is_for_lesson` int DEFAULT '0',
  `is_for_organization` int DEFAULT '0',
  `lesson_code` varchar(128) DEFAULT NULL,
  `organization_code` varchar(128) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `remark` varchar(1024) DEFAULT NULL,
  `status` varchar(8) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_room
-- ----------------------------
INSERT INTO `order_room` VALUES ('31', 'A-101', 'ailun', '2021-04-18', '1', '3', '6', null, null, null, null, 'admin', '数据库结构与设计', '1');
INSERT INTO `order_room` VALUES ('32', 'A-101', 'ailun', '2021-04-19', '2', '3', '6', null, null, null, null, 'admin', 'java语言开发', '1');
INSERT INTO `order_room` VALUES ('33', 'A-101', 'ailun', '2021-04-20', '3', '3', '8', null, null, null, null, 'admin', '游戏引擎开发与设计', '1');
INSERT INTO `order_room` VALUES ('34', 'A-101', 'ailun', '2021-04-22', '5', '1', '4', null, null, null, null, 'admin', '动漫社团建', '1');
INSERT INTO `order_room` VALUES ('35', 'A-101', 'ailun', '2021-04-21', '4', '8', '12', null, null, null, null, 'admin', '计算机组成原理', '1');
INSERT INTO `order_room` VALUES ('36', 'A-101', 'ailun', '2021-04-22', '5', '8', '12', null, null, null, null, 'admin', '数字图像处理', '1');
INSERT INTO `order_room` VALUES ('37', 'A-101', 'ailun', '2021-04-23', '6', '4', '8', null, null, null, null, 'admin', '数据库开发', '1');
INSERT INTO `order_room` VALUES ('38', 'A-101', 'ailun', '2021-04-19', '2', '8', '11', null, null, null, null, 'admin', 'java语言', '1');
INSERT INTO `order_room` VALUES ('39', 'A-101', 'admin', '2021-04-18', '1', '8', '11', null, null, null, null, 'admin', 'C语言设计', '1');
INSERT INTO `order_room` VALUES ('40', 'A-101', 'abc', '2021-04-24', '7', '4', '6', null, null, null, null, 'admin', 'C语言设计', '1');

-- ----------------------------
-- Table structure for repair
-- ----------------------------
DROP TABLE IF EXISTS `repair`;
CREATE TABLE `repair` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repair_obj` varchar(128) DEFAULT NULL COMMENT '损坏设备',
  `repair_mess` varchar(255) DEFAULT NULL COMMENT '损坏信息',
  `room_code` varchar(32) DEFAULT NULL COMMENT '教室编码',
  `repair_img` varchar(255) DEFAULT NULL COMMENT '图片',
  `repair_status` varchar(32) DEFAULT NULL COMMENT '0:未读 1:已处理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repair
-- ----------------------------
INSERT INTO `repair` VALUES ('26', '1', '没声音了', 'A-101', 'M2RVbUNsQUZ0bGxQWGdQV3JzL2JRWlB5MVBRREFKdzRMNEZZMnlDVzZYZ1ZoOEVDdzBGdXFRPT0.jpg', '0');
INSERT INTO `repair` VALUES ('27', '1', '没声音了', 'A-101', 'M2RVbUNsQUZ0bGxQWGdQV3JzL2JRWDc0VDBmMzRLc2ZEaEVrWk01RFNTN1J5KzhPS2xwQ05RPT0.jpg', '0');
INSERT INTO `repair` VALUES ('28', '1', '没声音了', 'A-101', 'M2RVbUNsQUZ0bGxQWGdQV3JzL2JRWDc0VDBmMzRLc2ZEaEVrWk01RFNTN1J5KzhPS2xwQ05RPT0.jpg', '1');
INSERT INTO `repair` VALUES ('29', '2', '无法使用', 'A-101', 'M2RVbUNsQUZ0bGxQWGdQV3JzL2JRWDc0VDBmMzRLc2ZEaEVrWk01RFNTN1J5KzhPS2xwQ05RPT0.jpg', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_code` varchar(12) DEFAULT NULL,
  `role_name` varchar(20) DEFAULT NULL,
  `role_status` int NOT NULL DEFAULT '1',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '0', '管理员', '1', null);
INSERT INTO `role` VALUES ('2', '01', '教师', '1', null);
INSERT INTO `role` VALUES ('3', '02', '学生', '1', null);
INSERT INTO `role` VALUES ('4', '9999', '默认角色', '1', null);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_code` varchar(12) DEFAULT NULL,
  `menu_code` varchar(12) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '9999', '01', '2020-10-19 15:06:28', null, '1');
INSERT INTO `role_menu` VALUES ('2', '9999', '02', '2020-10-19 15:06:37', null, '1');
INSERT INTO `role_menu` VALUES ('3', '9999', '04', '2020-10-19 15:06:55', null, '1');
INSERT INTO `role_menu` VALUES ('4', '9999', '05', '2020-10-19 15:07:01', null, '1');
INSERT INTO `role_menu` VALUES ('5', '01', '01', '2020-10-19 15:07:28', null, '1');
INSERT INTO `role_menu` VALUES ('6', '01', '02', '2020-10-19 15:07:32', null, '1');
INSERT INTO `role_menu` VALUES ('7', '01', '04', '2020-10-19 15:07:39', null, '1');
INSERT INTO `role_menu` VALUES ('8', '01', '05', '2020-10-19 15:08:43', null, '1');
INSERT INTO `role_menu` VALUES ('9', '01', '0101', '2020-10-19 15:09:02', null, '1');
INSERT INTO `role_menu` VALUES ('10', '02', '01', '2020-10-19 15:11:55', null, '1');
INSERT INTO `role_menu` VALUES ('11', '02', '02', '2020-10-19 15:12:00', null, '1');
INSERT INTO `role_menu` VALUES ('12', '02', '04', '2020-10-19 15:12:36', null, '1');
INSERT INTO `role_menu` VALUES ('13', '02', '05', '2020-10-19 15:12:39', null, '1');
INSERT INTO `role_menu` VALUES ('14', '02', '0102', '2020-10-19 15:12:47', null, '1');
INSERT INTO `role_menu` VALUES ('15', '0', '01', '2020-10-19 15:13:43', null, '1');
INSERT INTO `role_menu` VALUES ('16', '0', '02', '2020-10-19 15:13:46', null, '1');
INSERT INTO `role_menu` VALUES ('17', '0', '03', '2020-10-19 15:13:49', null, '1');
INSERT INTO `role_menu` VALUES ('18', '0', '04', '2020-10-19 15:13:53', null, '1');
INSERT INTO `role_menu` VALUES ('19', '0', '05', '2020-10-19 15:13:58', null, '1');
INSERT INTO `role_menu` VALUES ('20', '0', '0101', '2020-10-19 15:14:12', null, '1');
INSERT INTO `role_menu` VALUES ('21', '0', '0102', '2020-10-19 15:14:18', null, '1');
INSERT INTO `role_menu` VALUES ('22', '0', '0201', '2020-11-10 15:09:54', null, '1');
INSERT INTO `role_menu` VALUES ('23', '0', '0202', '2020-11-10 15:09:59', null, '1');
INSERT INTO `role_menu` VALUES ('24', '01', '0201', '2020-11-10 15:10:16', null, '1');
INSERT INTO `role_menu` VALUES ('25', '01', '0202', '2020-11-10 15:10:21', null, '1');
INSERT INTO `role_menu` VALUES ('26', '0', '0103', '2020-12-24 10:31:02', null, '1');
INSERT INTO `role_menu` VALUES ('28', '0', '0301', '2021-03-05 14:58:20', null, '1');
INSERT INTO `role_menu` VALUES ('30', '0', '0203', '2021-04-19 16:40:12', null, '1');
INSERT INTO `role_menu` VALUES ('31', '9999', '0102', '2021-04-22 16:26:04', null, '1');
INSERT INTO `role_menu` VALUES ('32', '9999', '0201', '2021-04-22 14:30:12', null, '1');
INSERT INTO `role_menu` VALUES ('33', '01', '0102', '2021-04-22 16:27:35', null, '1');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_code` varchar(32) DEFAULT NULL,
  `block_code` varchar(32) DEFAULT NULL,
  `floor` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `have_curtain` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '是否有幕布：\r\n0没有\r\n1有\r\n9待维修',
  `have_projector` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '是否有投影仪:\r\n0没有\r\n1有\r\n9待维修',
  `have_microphone` varchar(8) DEFAULT '1' COMMENT '是否有话筒:\r\n0没有\r\n1有\r\n9待维修',
  `capacity` int DEFAULT '0',
  `status` varchar(8) DEFAULT '1',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=865 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', '101', 'A', '1', '1', '9', '9', '47', '1', '投影仪：无法使用');
INSERT INTO `room` VALUES ('2', '102', 'A', '1', '9', '1', '9', '49', '1', null);
INSERT INTO `room` VALUES ('3', '103', 'A', '1', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('4', '104', 'A', '1', '1', '1', '0', '42', '1', null);
INSERT INTO `room` VALUES ('5', '105', 'A', '1', '9', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('6', '106', 'A', '1', '1', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('7', '107', 'A', '1', '1', '0', '9', '54', '1', null);
INSERT INTO `room` VALUES ('8', '108', 'A', '1', '1', '1', '0', '38', '1', null);
INSERT INTO `room` VALUES ('9', '109', 'A', '1', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('10', '110', 'A', '1', '1', '1', '9', '60', '1', null);
INSERT INTO `room` VALUES ('11', '111', 'A', '1', '1', '1', '0', '45', '1', null);
INSERT INTO `room` VALUES ('12', '112', 'A', '1', '1', '0', '1', '36', '1', null);
INSERT INTO `room` VALUES ('13', '201', 'A', '2', '1', '9', '1', '40', '1', null);
INSERT INTO `room` VALUES ('14', '202', 'A', '2', '1', '1', '9', '55', '1', null);
INSERT INTO `room` VALUES ('15', '203', 'A', '2', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('16', '204', 'A', '2', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('17', '205', 'A', '2', '1', '1', '9', '59', '1', null);
INSERT INTO `room` VALUES ('18', '206', 'A', '2', '1', '0', '1', '40', '1', null);
INSERT INTO `room` VALUES ('19', '207', 'A', '2', '1', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('20', '208', 'A', '2', '1', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('21', '209', 'A', '2', '9', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('22', '210', 'A', '2', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('23', '211', 'A', '2', '9', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('24', '212', 'A', '2', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('25', '301', 'A', '3', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('26', '302', 'A', '3', '1', '9', '1', '50', '1', null);
INSERT INTO `room` VALUES ('27', '303', 'A', '3', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('28', '304', 'A', '3', '0', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('29', '305', 'A', '3', '0', '1', '0', '60', '1', null);
INSERT INTO `room` VALUES ('30', '306', 'A', '3', '1', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('31', '307', 'A', '3', '9', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('32', '308', 'A', '3', '1', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('33', '309', 'A', '3', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('34', '310', 'A', '3', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('35', '311', 'A', '3', '1', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('36', '312', 'A', '3', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('37', '401', 'A', '4', '1', '1', '9', '56', '1', null);
INSERT INTO `room` VALUES ('38', '402', 'A', '4', '9', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('39', '403', 'A', '4', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('40', '404', 'A', '4', '1', '0', '1', '44', '1', null);
INSERT INTO `room` VALUES ('41', '405', 'A', '4', '9', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('42', '406', 'A', '4', '1', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('43', '407', 'A', '4', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('44', '408', 'A', '4', '1', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('45', '409', 'A', '4', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('46', '410', 'A', '4', '1', '0', '1', '41', '1', null);
INSERT INTO `room` VALUES ('47', '411', 'A', '4', '1', '0', '0', '43', '1', null);
INSERT INTO `room` VALUES ('48', '412', 'A', '4', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('49', '501', 'A', '5', '1', '1', '9', '43', '1', null);
INSERT INTO `room` VALUES ('50', '502', 'A', '5', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('51', '503', 'A', '5', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('52', '504', 'A', '5', '0', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('53', '505', 'A', '5', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('54', '506', 'A', '5', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('55', '507', 'A', '5', '1', '1', '9', '52', '1', null);
INSERT INTO `room` VALUES ('56', '508', 'A', '5', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('57', '509', 'A', '5', '1', '1', '0', '35', '1', null);
INSERT INTO `room` VALUES ('58', '510', 'A', '5', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('59', '511', 'A', '5', '1', '1', '0', '47', '1', null);
INSERT INTO `room` VALUES ('60', '512', 'A', '5', '1', '1', '0', '41', '1', null);
INSERT INTO `room` VALUES ('61', '601', 'A', '6', '9', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('62', '602', 'A', '6', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('63', '603', 'A', '6', '1', '1', '9', '53', '1', null);
INSERT INTO `room` VALUES ('64', '604', 'A', '6', '1', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('65', '605', 'A', '6', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('66', '606', 'A', '6', '1', '1', '9', '51', '1', null);
INSERT INTO `room` VALUES ('67', '607', 'A', '6', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('68', '608', 'A', '6', '0', '0', '1', '51', '1', null);
INSERT INTO `room` VALUES ('69', '609', 'A', '6', '1', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('70', '610', 'A', '6', '9', '1', '9', '45', '1', null);
INSERT INTO `room` VALUES ('71', '611', 'A', '6', '1', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('72', '612', 'A', '6', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('73', '101', 'B', '1', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('74', '102', 'B', '1', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('75', '103', 'B', '1', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('76', '104', 'B', '1', '9', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('77', '105', 'B', '1', '1', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('78', '106', 'B', '1', '0', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('79', '107', 'B', '1', '0', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('80', '108', 'B', '1', '0', '1', '0', '45', '1', null);
INSERT INTO `room` VALUES ('81', '109', 'B', '1', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('82', '110', 'B', '1', '0', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('83', '111', 'B', '1', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('84', '112', 'B', '1', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('85', '201', 'B', '2', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('86', '202', 'B', '2', '1', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('87', '203', 'B', '2', '1', '0', '9', '41', '1', '话筒：null');
INSERT INTO `room` VALUES ('88', '204', 'B', '2', '9', '1', '9', '42', '1', null);
INSERT INTO `room` VALUES ('89', '205', 'B', '2', '1', '9', '1', '54', '1', null);
INSERT INTO `room` VALUES ('90', '206', 'B', '2', '1', '9', '1', '55', '1', null);
INSERT INTO `room` VALUES ('91', '207', 'B', '2', '1', '0', '1', '56', '1', null);
INSERT INTO `room` VALUES ('92', '208', 'B', '2', '0', '0', '1', '51', '1', null);
INSERT INTO `room` VALUES ('93', '209', 'B', '2', '1', '0', '1', '53', '1', null);
INSERT INTO `room` VALUES ('94', '210', 'B', '2', '1', '9', '1', '53', '1', null);
INSERT INTO `room` VALUES ('95', '211', 'B', '2', '1', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('96', '212', 'B', '2', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('97', '301', 'B', '3', '1', '0', '1', '57', '1', null);
INSERT INTO `room` VALUES ('98', '302', 'B', '3', '0', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('99', '303', 'B', '3', '1', '1', '9', '42', '1', null);
INSERT INTO `room` VALUES ('100', '304', 'B', '3', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('101', '305', 'B', '3', '1', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('102', '306', 'B', '3', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('103', '307', 'B', '3', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('104', '308', 'B', '3', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('105', '309', 'B', '3', '1', '1', '0', '50', '1', null);
INSERT INTO `room` VALUES ('106', '310', 'B', '3', '9', '1', '9', '48', '1', null);
INSERT INTO `room` VALUES ('107', '311', 'B', '3', '9', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('108', '312', 'B', '3', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('109', '401', 'B', '4', '1', '1', '9', '49', '1', null);
INSERT INTO `room` VALUES ('110', '402', 'B', '4', '1', '1', '9', '51', '1', null);
INSERT INTO `room` VALUES ('111', '403', 'B', '4', '1', '1', '0', '48', '1', null);
INSERT INTO `room` VALUES ('112', '404', 'B', '4', '0', '9', '1', '53', '1', null);
INSERT INTO `room` VALUES ('113', '405', 'B', '4', '0', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('114', '406', 'B', '4', '1', '0', '1', '51', '1', null);
INSERT INTO `room` VALUES ('115', '407', 'B', '4', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('116', '408', 'B', '4', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('117', '409', 'B', '4', '1', '0', '0', '59', '1', null);
INSERT INTO `room` VALUES ('118', '410', 'B', '4', '0', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('119', '411', 'B', '4', '1', '1', '9', '51', '1', null);
INSERT INTO `room` VALUES ('120', '412', 'B', '4', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('121', '501', 'B', '5', '1', '1', '0', '48', '1', null);
INSERT INTO `room` VALUES ('122', '502', 'B', '5', '9', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('123', '503', 'B', '5', '1', '1', '9', '56', '1', null);
INSERT INTO `room` VALUES ('124', '504', 'B', '5', '0', '1', '9', '50', '1', null);
INSERT INTO `room` VALUES ('125', '505', 'B', '5', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('126', '506', 'B', '5', '1', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('127', '507', 'B', '5', '1', '9', '1', '44', '1', null);
INSERT INTO `room` VALUES ('128', '508', 'B', '5', '1', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('129', '509', 'B', '5', '9', '1', '9', '48', '1', null);
INSERT INTO `room` VALUES ('130', '510', 'B', '5', '1', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('131', '511', 'B', '5', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('132', '512', 'B', '5', '1', '9', '1', '43', '1', null);
INSERT INTO `room` VALUES ('133', '601', 'B', '6', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('134', '602', 'B', '6', '1', '1', '9', '35', '1', null);
INSERT INTO `room` VALUES ('135', '603', 'B', '6', '1', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('136', '604', 'B', '6', '1', '9', '1', '50', '1', null);
INSERT INTO `room` VALUES ('137', '605', 'B', '6', '0', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('138', '606', 'B', '6', '9', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('139', '607', 'B', '6', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('140', '608', 'B', '6', '1', '1', '0', '60', '1', null);
INSERT INTO `room` VALUES ('141', '609', 'B', '6', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('142', '610', 'B', '6', '0', '1', '0', '57', '1', null);
INSERT INTO `room` VALUES ('143', '611', 'B', '6', '1', '9', '1', '36', '1', null);
INSERT INTO `room` VALUES ('144', '612', 'B', '6', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('145', '101', 'C', '1', '1', '9', '1', '59', '1', null);
INSERT INTO `room` VALUES ('146', '102', 'C', '1', '1', '9', '1', '58', '1', null);
INSERT INTO `room` VALUES ('147', '103', 'C', '1', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('148', '104', 'C', '1', '9', '1', '0', '45', '1', null);
INSERT INTO `room` VALUES ('149', '105', 'C', '1', '0', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('150', '106', 'C', '1', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('151', '107', 'C', '1', '1', '9', '0', '46', '1', null);
INSERT INTO `room` VALUES ('152', '108', 'C', '1', '1', '1', '9', '47', '1', null);
INSERT INTO `room` VALUES ('153', '109', 'C', '1', '1', '9', '1', '37', '1', null);
INSERT INTO `room` VALUES ('154', '110', 'C', '1', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('155', '111', 'C', '1', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('156', '112', 'C', '1', '1', '1', '0', '60', '1', null);
INSERT INTO `room` VALUES ('157', '201', 'C', '2', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('158', '202', 'C', '2', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('159', '203', 'C', '2', '1', '1', '0', '44', '1', null);
INSERT INTO `room` VALUES ('160', '204', 'C', '2', '0', '1', '0', '48', '1', null);
INSERT INTO `room` VALUES ('161', '205', 'C', '2', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('162', '206', 'C', '2', '0', '0', '1', '58', '1', null);
INSERT INTO `room` VALUES ('163', '207', 'C', '2', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('164', '208', 'C', '2', '1', '1', '0', '50', '1', null);
INSERT INTO `room` VALUES ('165', '209', 'C', '2', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('166', '210', 'C', '2', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('167', '211', 'C', '2', '1', '9', '1', '37', '1', null);
INSERT INTO `room` VALUES ('168', '212', 'C', '2', '1', '1', '9', '41', '1', null);
INSERT INTO `room` VALUES ('169', '301', 'C', '3', '0', '9', '1', '59', '1', null);
INSERT INTO `room` VALUES ('170', '302', 'C', '3', '1', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('171', '303', 'C', '3', '1', '0', '1', '54', '1', null);
INSERT INTO `room` VALUES ('172', '304', 'C', '3', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('173', '305', 'C', '3', '1', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('174', '306', 'C', '3', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('175', '307', 'C', '3', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('176', '308', 'C', '3', '9', '1', '0', '53', '1', null);
INSERT INTO `room` VALUES ('177', '309', 'C', '3', '1', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('178', '310', 'C', '3', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('179', '311', 'C', '3', '1', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('180', '312', 'C', '3', '1', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('181', '401', 'C', '4', '1', '1', '9', '35', '1', null);
INSERT INTO `room` VALUES ('182', '402', 'C', '4', '1', '0', '1', '45', '1', null);
INSERT INTO `room` VALUES ('183', '403', 'C', '4', '9', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('184', '404', 'C', '4', '1', '0', '0', '56', '1', null);
INSERT INTO `room` VALUES ('185', '405', 'C', '4', '9', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('186', '406', 'C', '4', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('187', '407', 'C', '4', '1', '1', '9', '38', '1', null);
INSERT INTO `room` VALUES ('188', '408', 'C', '4', '9', '1', '0', '46', '1', null);
INSERT INTO `room` VALUES ('189', '409', 'C', '4', '1', '9', '1', '53', '1', null);
INSERT INTO `room` VALUES ('190', '410', 'C', '4', '1', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('191', '411', 'C', '4', '1', '9', '1', '39', '1', null);
INSERT INTO `room` VALUES ('192', '412', 'C', '4', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('193', '501', 'C', '5', '1', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('194', '502', 'C', '5', '1', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('195', '503', 'C', '5', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('196', '504', 'C', '5', '1', '1', '0', '46', '1', null);
INSERT INTO `room` VALUES ('197', '505', 'C', '5', '1', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('198', '506', 'C', '5', '1', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('199', '507', 'C', '5', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('200', '508', 'C', '5', '1', '1', '0', '43', '1', null);
INSERT INTO `room` VALUES ('201', '509', 'C', '5', '1', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('202', '510', 'C', '5', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('203', '511', 'C', '5', '9', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('204', '512', 'C', '5', '0', '0', '1', '45', '1', null);
INSERT INTO `room` VALUES ('205', '601', 'C', '6', '1', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('206', '602', 'C', '6', '0', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('207', '603', 'C', '6', '1', '9', '1', '56', '1', null);
INSERT INTO `room` VALUES ('208', '604', 'C', '6', '0', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('209', '605', 'C', '6', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('210', '606', 'C', '6', '1', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('211', '607', 'C', '6', '1', '1', '0', '36', '1', null);
INSERT INTO `room` VALUES ('212', '608', 'C', '6', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('213', '609', 'C', '6', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('214', '610', 'C', '6', '1', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('215', '611', 'C', '6', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('216', '612', 'C', '6', '1', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('217', '101', 'D', '1', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('218', '102', 'D', '1', '1', '1', '9', '50', '1', null);
INSERT INTO `room` VALUES ('219', '103', 'D', '1', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('220', '104', 'D', '1', '1', '1', '9', '38', '1', null);
INSERT INTO `room` VALUES ('221', '105', 'D', '1', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('222', '106', 'D', '1', '1', '1', '0', '59', '1', null);
INSERT INTO `room` VALUES ('223', '107', 'D', '1', '1', '9', '1', '51', '1', null);
INSERT INTO `room` VALUES ('224', '108', 'D', '1', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('225', '109', 'D', '1', '1', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('226', '110', 'D', '1', '1', '1', '0', '35', '1', null);
INSERT INTO `room` VALUES ('227', '111', 'D', '1', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('228', '112', 'D', '1', '0', '0', '1', '45', '1', null);
INSERT INTO `room` VALUES ('229', '201', 'D', '2', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('230', '202', 'D', '2', '1', '0', '1', '53', '1', null);
INSERT INTO `room` VALUES ('231', '203', 'D', '2', '9', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('232', '204', 'D', '2', '9', '1', '9', '50', '1', null);
INSERT INTO `room` VALUES ('233', '205', 'D', '2', '0', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('234', '206', 'D', '2', '1', '1', '9', '41', '1', null);
INSERT INTO `room` VALUES ('235', '207', 'D', '2', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('236', '208', 'D', '2', '1', '1', '9', '49', '1', null);
INSERT INTO `room` VALUES ('237', '209', 'D', '2', '1', '1', '9', '56', '1', null);
INSERT INTO `room` VALUES ('238', '210', 'D', '2', '0', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('239', '211', 'D', '2', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('240', '212', 'D', '2', '0', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('241', '301', 'D', '3', '1', '1', '0', '50', '1', null);
INSERT INTO `room` VALUES ('242', '302', 'D', '3', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('243', '303', 'D', '3', '1', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('244', '304', 'D', '3', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('245', '305', 'D', '3', '9', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('246', '306', 'D', '3', '1', '1', '9', '52', '1', null);
INSERT INTO `room` VALUES ('247', '307', 'D', '3', '1', '9', '1', '44', '1', null);
INSERT INTO `room` VALUES ('248', '308', 'D', '3', '1', '9', '1', '55', '1', null);
INSERT INTO `room` VALUES ('249', '309', 'D', '3', '1', '1', '9', '55', '1', null);
INSERT INTO `room` VALUES ('250', '310', 'D', '3', '1', '1', '0', '52', '1', null);
INSERT INTO `room` VALUES ('251', '311', 'D', '3', '1', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('252', '312', 'D', '3', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('253', '401', 'D', '4', '1', '1', '9', '36', '1', null);
INSERT INTO `room` VALUES ('254', '402', 'D', '4', '1', '9', '1', '35', '1', null);
INSERT INTO `room` VALUES ('255', '403', 'D', '4', '1', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('256', '404', 'D', '4', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('257', '405', 'D', '4', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('258', '406', 'D', '4', '1', '9', '1', '55', '1', null);
INSERT INTO `room` VALUES ('259', '407', 'D', '4', '0', '1', '0', '49', '1', null);
INSERT INTO `room` VALUES ('260', '408', 'D', '4', '9', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('261', '409', 'D', '4', '1', '1', '0', '57', '1', null);
INSERT INTO `room` VALUES ('262', '410', 'D', '4', '1', '1', '9', '56', '1', null);
INSERT INTO `room` VALUES ('263', '411', 'D', '4', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('264', '412', 'D', '4', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('265', '501', 'D', '5', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('266', '502', 'D', '5', '1', '1', '9', '58', '1', null);
INSERT INTO `room` VALUES ('267', '503', 'D', '5', '1', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('268', '504', 'D', '5', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('269', '505', 'D', '5', '1', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('270', '506', 'D', '5', '0', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('271', '507', 'D', '5', '9', '1', '9', '38', '1', null);
INSERT INTO `room` VALUES ('272', '508', 'D', '5', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('273', '509', 'D', '5', '9', '1', '9', '46', '1', null);
INSERT INTO `room` VALUES ('274', '510', 'D', '5', '9', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('275', '511', 'D', '5', '1', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('276', '512', 'D', '5', '0', '0', '1', '41', '1', null);
INSERT INTO `room` VALUES ('277', '601', 'D', '6', '9', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('278', '602', 'D', '6', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('279', '603', 'D', '6', '0', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('280', '604', 'D', '6', '1', '1', '0', '39', '1', null);
INSERT INTO `room` VALUES ('281', '605', 'D', '6', '1', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('282', '606', 'D', '6', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('283', '607', 'D', '6', '0', '9', '1', '45', '1', null);
INSERT INTO `room` VALUES ('284', '608', 'D', '6', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('285', '609', 'D', '6', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('286', '610', 'D', '6', '1', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('287', '611', 'D', '6', '1', '9', '1', '46', '1', null);
INSERT INTO `room` VALUES ('288', '612', 'D', '6', '1', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('289', '101', 'E', '1', '1', '0', '1', '54', '1', null);
INSERT INTO `room` VALUES ('290', '102', 'E', '1', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('291', '103', 'E', '1', '9', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('292', '104', 'E', '1', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('293', '105', 'E', '1', '1', '1', '9', '35', '1', null);
INSERT INTO `room` VALUES ('294', '106', 'E', '1', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('295', '107', 'E', '1', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('296', '108', 'E', '1', '9', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('297', '109', 'E', '1', '1', '0', '1', '44', '1', null);
INSERT INTO `room` VALUES ('298', '110', 'E', '1', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('299', '111', 'E', '1', '9', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('300', '112', 'E', '1', '9', '1', '9', '58', '1', null);
INSERT INTO `room` VALUES ('301', '201', 'E', '2', '9', '9', '1', '45', '1', null);
INSERT INTO `room` VALUES ('302', '202', 'E', '2', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('303', '203', 'E', '2', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('304', '204', 'E', '2', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('305', '205', 'E', '2', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('306', '206', 'E', '2', '1', '0', '1', '57', '1', null);
INSERT INTO `room` VALUES ('307', '207', 'E', '2', '1', '1', '0', '45', '1', null);
INSERT INTO `room` VALUES ('308', '208', 'E', '2', '1', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('309', '209', 'E', '2', '0', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('310', '210', 'E', '2', '0', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('311', '211', 'E', '2', '1', '0', '1', '53', '1', null);
INSERT INTO `room` VALUES ('312', '212', 'E', '2', '1', '9', '1', '40', '1', null);
INSERT INTO `room` VALUES ('313', '301', 'E', '3', '1', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('314', '302', 'E', '3', '9', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('315', '303', 'E', '3', '1', '1', '0', '44', '1', null);
INSERT INTO `room` VALUES ('316', '304', 'E', '3', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('317', '305', 'E', '3', '9', '1', '9', '42', '1', null);
INSERT INTO `room` VALUES ('318', '306', 'E', '3', '9', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('319', '307', 'E', '3', '0', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('320', '308', 'E', '3', '1', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('321', '309', 'E', '3', '1', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('322', '310', 'E', '3', '1', '1', '9', '51', '1', null);
INSERT INTO `room` VALUES ('323', '311', 'E', '3', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('324', '312', 'E', '3', '1', '0', '1', '50', '1', null);
INSERT INTO `room` VALUES ('325', '401', 'E', '4', '1', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('326', '402', 'E', '4', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('327', '403', 'E', '4', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('328', '404', 'E', '4', '1', '9', '1', '54', '1', null);
INSERT INTO `room` VALUES ('329', '405', 'E', '4', '1', '1', '9', '55', '1', null);
INSERT INTO `room` VALUES ('330', '406', 'E', '4', '1', '1', '0', '52', '1', null);
INSERT INTO `room` VALUES ('331', '407', 'E', '4', '1', '1', '9', '60', '1', null);
INSERT INTO `room` VALUES ('332', '408', 'E', '4', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('333', '409', 'E', '4', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('334', '410', 'E', '4', '1', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('335', '411', 'E', '4', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('336', '412', 'E', '4', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('337', '501', 'E', '5', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('338', '502', 'E', '5', '9', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('339', '503', 'E', '5', '0', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('340', '504', 'E', '5', '1', '1', '0', '39', '1', null);
INSERT INTO `room` VALUES ('341', '505', 'E', '5', '1', '0', '1', '37', '1', null);
INSERT INTO `room` VALUES ('342', '506', 'E', '5', '0', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('343', '507', 'E', '5', '0', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('344', '508', 'E', '5', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('345', '509', 'E', '5', '1', '1', '9', '59', '1', null);
INSERT INTO `room` VALUES ('346', '510', 'E', '5', '1', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('347', '511', 'E', '5', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('348', '512', 'E', '5', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('349', '601', 'E', '6', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('350', '602', 'E', '6', '1', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('351', '603', 'E', '6', '9', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('352', '604', 'E', '6', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('353', '605', 'E', '6', '1', '1', '0', '60', '1', null);
INSERT INTO `room` VALUES ('354', '606', 'E', '6', '1', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('355', '607', 'E', '6', '9', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('356', '608', 'E', '6', '1', '0', '1', '41', '1', null);
INSERT INTO `room` VALUES ('357', '609', 'E', '6', '0', '1', '0', '59', '1', null);
INSERT INTO `room` VALUES ('358', '610', 'E', '6', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('359', '611', 'E', '6', '1', '1', '0', '35', '1', null);
INSERT INTO `room` VALUES ('360', '612', 'E', '6', '1', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('361', '101', 'F', '1', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('362', '102', 'F', '1', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('363', '103', 'F', '1', '0', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('364', '104', 'F', '1', '1', '1', '0', '49', '1', null);
INSERT INTO `room` VALUES ('365', '105', 'F', '1', '1', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('366', '106', 'F', '1', '0', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('367', '107', 'F', '1', '1', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('368', '108', 'F', '1', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('369', '109', 'F', '1', '1', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('370', '110', 'F', '1', '1', '0', '0', '36', '1', null);
INSERT INTO `room` VALUES ('371', '111', 'F', '1', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('372', '112', 'F', '1', '1', '1', '0', '36', '1', null);
INSERT INTO `room` VALUES ('373', '201', 'F', '2', '1', '9', '1', '44', '1', null);
INSERT INTO `room` VALUES ('374', '202', 'F', '2', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('375', '203', 'F', '2', '1', '1', '0', '42', '1', null);
INSERT INTO `room` VALUES ('376', '204', 'F', '2', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('377', '205', 'F', '2', '0', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('378', '206', 'F', '2', '0', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('379', '207', 'F', '2', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('380', '208', 'F', '2', '1', '1', '0', '49', '1', null);
INSERT INTO `room` VALUES ('381', '209', 'F', '2', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('382', '210', 'F', '2', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('383', '211', 'F', '2', '9', '1', '9', '49', '1', null);
INSERT INTO `room` VALUES ('384', '212', 'F', '2', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('385', '301', 'F', '3', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('386', '302', 'F', '3', '9', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('387', '303', 'F', '3', '1', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('388', '304', 'F', '3', '1', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('389', '305', 'F', '3', '1', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('390', '306', 'F', '3', '9', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('391', '307', 'F', '3', '1', '0', '1', '47', '1', null);
INSERT INTO `room` VALUES ('392', '308', 'F', '3', '1', '1', '0', '51', '1', null);
INSERT INTO `room` VALUES ('393', '309', 'F', '3', '9', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('394', '310', 'F', '3', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('395', '311', 'F', '3', '1', '1', '0', '48', '1', null);
INSERT INTO `room` VALUES ('396', '312', 'F', '3', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('397', '401', 'F', '4', '1', '9', '1', '51', '1', null);
INSERT INTO `room` VALUES ('398', '402', 'F', '4', '9', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('399', '403', 'F', '4', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('400', '404', 'F', '4', '0', '9', '0', '55', '1', null);
INSERT INTO `room` VALUES ('401', '405', 'F', '4', '9', '1', '9', '45', '1', null);
INSERT INTO `room` VALUES ('402', '406', 'F', '4', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('403', '407', 'F', '4', '1', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('404', '408', 'F', '4', '1', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('405', '409', 'F', '4', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('406', '410', 'F', '4', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('407', '411', 'F', '4', '1', '0', '1', '54', '1', null);
INSERT INTO `room` VALUES ('408', '412', 'F', '4', '1', '1', '0', '48', '1', null);
INSERT INTO `room` VALUES ('409', '501', 'F', '5', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('410', '502', 'F', '5', '1', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('411', '503', 'F', '5', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('412', '504', 'F', '5', '1', '0', '1', '41', '1', null);
INSERT INTO `room` VALUES ('413', '505', 'F', '5', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('414', '506', 'F', '5', '1', '0', '1', '46', '1', null);
INSERT INTO `room` VALUES ('415', '507', 'F', '5', '9', '1', '0', '58', '1', null);
INSERT INTO `room` VALUES ('416', '508', 'F', '5', '1', '9', '0', '41', '1', null);
INSERT INTO `room` VALUES ('417', '509', 'F', '5', '9', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('418', '510', 'F', '5', '1', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('419', '511', 'F', '5', '1', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('420', '512', 'F', '5', '1', '1', '0', '57', '1', null);
INSERT INTO `room` VALUES ('421', '601', 'F', '6', '1', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('422', '602', 'F', '6', '1', '1', '9', '49', '1', null);
INSERT INTO `room` VALUES ('423', '603', 'F', '6', '9', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('424', '604', 'F', '6', '1', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('425', '605', 'F', '6', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('426', '606', 'F', '6', '1', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('427', '607', 'F', '6', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('428', '608', 'F', '6', '9', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('429', '609', 'F', '6', '1', '0', '1', '56', '1', null);
INSERT INTO `room` VALUES ('430', '610', 'F', '6', '1', '1', '0', '38', '1', null);
INSERT INTO `room` VALUES ('431', '611', 'F', '6', '1', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('432', '612', 'F', '6', '1', '9', '1', '54', '1', null);
INSERT INTO `room` VALUES ('433', '101', '1', '1', '1', '9', '0', '36', '1', null);
INSERT INTO `room` VALUES ('434', '102', '1', '1', '1', '1', '9', '60', '1', null);
INSERT INTO `room` VALUES ('435', '103', '1', '1', '1', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('436', '104', '1', '1', '0', '1', '0', '37', '1', null);
INSERT INTO `room` VALUES ('437', '105', '1', '1', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('438', '106', '1', '1', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('439', '107', '1', '1', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('440', '108', '1', '1', '1', '1', '9', '42', '1', null);
INSERT INTO `room` VALUES ('441', '109', '1', '1', '9', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('442', '110', '1', '1', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('443', '111', '1', '1', '1', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('444', '112', '1', '1', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('445', '201', '1', '2', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('446', '202', '1', '2', '1', '1', '0', '56', '1', null);
INSERT INTO `room` VALUES ('447', '203', '1', '2', '9', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('448', '204', '1', '2', '0', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('449', '205', '1', '2', '1', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('450', '206', '1', '2', '1', '9', '1', '36', '1', null);
INSERT INTO `room` VALUES ('451', '207', '1', '2', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('452', '208', '1', '2', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('453', '209', '1', '2', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('454', '210', '1', '2', '1', '1', '9', '52', '1', null);
INSERT INTO `room` VALUES ('455', '211', '1', '2', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('456', '212', '1', '2', '1', '1', '0', '56', '1', null);
INSERT INTO `room` VALUES ('457', '301', '1', '3', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('458', '302', '1', '3', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('459', '303', '1', '3', '1', '1', '0', '39', '1', null);
INSERT INTO `room` VALUES ('460', '304', '1', '3', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('461', '305', '1', '3', '1', '9', '1', '60', '1', null);
INSERT INTO `room` VALUES ('462', '306', '1', '3', '1', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('463', '307', '1', '3', '9', '9', '1', '39', '1', null);
INSERT INTO `room` VALUES ('464', '308', '1', '3', '0', '1', '9', '46', '1', null);
INSERT INTO `room` VALUES ('465', '309', '1', '3', '1', '9', '1', '52', '1', null);
INSERT INTO `room` VALUES ('466', '310', '1', '3', '1', '9', '9', '35', '1', null);
INSERT INTO `room` VALUES ('467', '311', '1', '3', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('468', '312', '1', '3', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('469', '401', '1', '4', '1', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('470', '402', '1', '4', '1', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('471', '403', '1', '4', '1', '9', '1', '55', '1', null);
INSERT INTO `room` VALUES ('472', '404', '1', '4', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('473', '405', '1', '4', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('474', '406', '1', '4', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('475', '407', '1', '4', '9', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('476', '408', '1', '4', '1', '1', '9', '44', '1', null);
INSERT INTO `room` VALUES ('477', '409', '1', '4', '1', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('478', '410', '1', '4', '0', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('479', '411', '1', '4', '1', '1', '0', '59', '1', null);
INSERT INTO `room` VALUES ('480', '412', '1', '4', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('481', '501', '1', '5', '1', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('482', '502', '1', '5', '1', '1', '9', '44', '1', null);
INSERT INTO `room` VALUES ('483', '503', '1', '5', '0', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('484', '504', '1', '5', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('485', '505', '1', '5', '1', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('486', '506', '1', '5', '1', '1', '0', '52', '1', null);
INSERT INTO `room` VALUES ('487', '507', '1', '5', '1', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('488', '508', '1', '5', '9', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('489', '509', '1', '5', '9', '0', '9', '48', '1', null);
INSERT INTO `room` VALUES ('490', '510', '1', '5', '1', '9', '1', '48', '1', null);
INSERT INTO `room` VALUES ('491', '511', '1', '5', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('492', '512', '1', '5', '1', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('493', '601', '1', '6', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('494', '602', '1', '6', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('495', '603', '1', '6', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('496', '604', '1', '6', '1', '0', '9', '58', '1', null);
INSERT INTO `room` VALUES ('497', '605', '1', '6', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('498', '606', '1', '6', '0', '0', '1', '58', '1', null);
INSERT INTO `room` VALUES ('499', '607', '1', '6', '1', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('500', '608', '1', '6', '0', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('501', '609', '1', '6', '1', '1', '9', '50', '1', null);
INSERT INTO `room` VALUES ('502', '610', '1', '6', '1', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('503', '611', '1', '6', '1', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('504', '612', '1', '6', '1', '1', '0', '37', '1', null);
INSERT INTO `room` VALUES ('505', '101', '2', '1', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('506', '102', '2', '1', '1', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('507', '103', '2', '1', '1', '1', '0', '57', '1', null);
INSERT INTO `room` VALUES ('508', '104', '2', '1', '9', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('509', '105', '2', '1', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('510', '106', '2', '1', '1', '1', '9', '57', '1', null);
INSERT INTO `room` VALUES ('511', '107', '2', '1', '1', '9', '1', '40', '1', null);
INSERT INTO `room` VALUES ('512', '108', '2', '1', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('513', '109', '2', '1', '1', '1', '9', '52', '1', null);
INSERT INTO `room` VALUES ('514', '110', '2', '1', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('515', '111', '2', '1', '9', '1', '9', '36', '1', null);
INSERT INTO `room` VALUES ('516', '112', '2', '1', '1', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('517', '201', '2', '2', '0', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('518', '202', '2', '2', '1', '1', '9', '40', '1', null);
INSERT INTO `room` VALUES ('519', '203', '2', '2', '1', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('520', '204', '2', '2', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('521', '205', '2', '2', '0', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('522', '206', '2', '2', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('523', '207', '2', '2', '1', '9', '0', '39', '1', null);
INSERT INTO `room` VALUES ('524', '208', '2', '2', '9', '1', '9', '54', '1', null);
INSERT INTO `room` VALUES ('525', '209', '2', '2', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('526', '210', '2', '2', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('527', '211', '2', '2', '1', '0', '1', '45', '1', null);
INSERT INTO `room` VALUES ('528', '212', '2', '2', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('529', '301', '2', '3', '1', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('530', '302', '2', '3', '0', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('531', '303', '2', '3', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('532', '304', '2', '3', '0', '1', '9', '47', '1', null);
INSERT INTO `room` VALUES ('533', '305', '2', '3', '1', '0', '1', '54', '1', null);
INSERT INTO `room` VALUES ('534', '306', '2', '3', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('535', '307', '2', '3', '1', '1', '0', '58', '1', null);
INSERT INTO `room` VALUES ('536', '308', '2', '3', '1', '9', '1', '40', '1', null);
INSERT INTO `room` VALUES ('537', '309', '2', '3', '1', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('538', '310', '2', '3', '1', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('539', '311', '2', '3', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('540', '312', '2', '3', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('541', '401', '2', '4', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('542', '402', '2', '4', '0', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('543', '403', '2', '4', '1', '1', '9', '42', '1', null);
INSERT INTO `room` VALUES ('544', '404', '2', '4', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('545', '405', '2', '4', '1', '0', '1', '51', '1', null);
INSERT INTO `room` VALUES ('546', '406', '2', '4', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('547', '407', '2', '4', '1', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('548', '408', '2', '4', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('549', '409', '2', '4', '9', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('550', '410', '2', '4', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('551', '411', '2', '4', '0', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('552', '412', '2', '4', '1', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('553', '501', '2', '5', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('554', '502', '2', '5', '1', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('555', '503', '2', '5', '1', '0', '1', '46', '1', null);
INSERT INTO `room` VALUES ('556', '504', '2', '5', '9', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('557', '505', '2', '5', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('558', '506', '2', '5', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('559', '507', '2', '5', '1', '0', '1', '54', '1', null);
INSERT INTO `room` VALUES ('560', '508', '2', '5', '1', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('561', '509', '2', '5', '1', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('562', '510', '2', '5', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('563', '511', '2', '5', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('564', '512', '2', '5', '1', '0', '1', '46', '1', null);
INSERT INTO `room` VALUES ('565', '601', '2', '6', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('566', '602', '2', '6', '1', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('567', '603', '2', '6', '9', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('568', '604', '2', '6', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('569', '605', '2', '6', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('570', '606', '2', '6', '1', '0', '1', '57', '1', null);
INSERT INTO `room` VALUES ('571', '607', '2', '6', '9', '9', '1', '43', '1', null);
INSERT INTO `room` VALUES ('572', '608', '2', '6', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('573', '609', '2', '6', '1', '9', '1', '45', '1', null);
INSERT INTO `room` VALUES ('574', '610', '2', '6', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('575', '611', '2', '6', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('576', '612', '2', '6', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('577', '101', '3', '1', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('578', '102', '3', '1', '1', '1', '0', '37', '1', null);
INSERT INTO `room` VALUES ('579', '103', '3', '1', '1', '0', '0', '54', '1', null);
INSERT INTO `room` VALUES ('580', '104', '3', '1', '1', '0', '1', '50', '1', null);
INSERT INTO `room` VALUES ('581', '105', '3', '1', '1', '9', '1', '52', '1', null);
INSERT INTO `room` VALUES ('582', '106', '3', '1', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('583', '107', '3', '1', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('584', '108', '3', '1', '1', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('585', '109', '3', '1', '1', '9', '1', '48', '1', null);
INSERT INTO `room` VALUES ('586', '110', '3', '1', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('587', '111', '3', '1', '0', '9', '1', '58', '1', null);
INSERT INTO `room` VALUES ('588', '112', '3', '1', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('589', '201', '3', '2', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('590', '202', '3', '2', '1', '1', '0', '39', '1', null);
INSERT INTO `room` VALUES ('591', '203', '3', '2', '1', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('592', '204', '3', '2', '1', '0', '1', '37', '1', null);
INSERT INTO `room` VALUES ('593', '205', '3', '2', '1', '9', '1', '35', '1', null);
INSERT INTO `room` VALUES ('594', '206', '3', '2', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('595', '207', '3', '2', '1', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('596', '208', '3', '2', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('597', '209', '3', '2', '1', '1', '0', '53', '1', null);
INSERT INTO `room` VALUES ('598', '210', '3', '2', '1', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('599', '211', '3', '2', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('600', '212', '3', '2', '1', '0', '1', '55', '1', null);
INSERT INTO `room` VALUES ('601', '301', '3', '3', '9', '0', '1', '48', '1', null);
INSERT INTO `room` VALUES ('602', '302', '3', '3', '9', '9', '1', '41', '1', null);
INSERT INTO `room` VALUES ('603', '303', '3', '3', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('604', '304', '3', '3', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('605', '305', '3', '3', '1', '9', '1', '59', '1', null);
INSERT INTO `room` VALUES ('606', '306', '3', '3', '9', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('607', '307', '3', '3', '1', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('608', '308', '3', '3', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('609', '309', '3', '3', '1', '1', '9', '35', '1', null);
INSERT INTO `room` VALUES ('610', '310', '3', '3', '9', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('611', '311', '3', '3', '1', '1', '9', '40', '1', null);
INSERT INTO `room` VALUES ('612', '312', '3', '3', '0', '0', '0', '47', '1', null);
INSERT INTO `room` VALUES ('613', '401', '3', '4', '1', '1', '0', '53', '1', null);
INSERT INTO `room` VALUES ('614', '402', '3', '4', '1', '1', '0', '40', '1', null);
INSERT INTO `room` VALUES ('615', '403', '3', '4', '0', '1', '9', '56', '1', null);
INSERT INTO `room` VALUES ('616', '404', '3', '4', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('617', '405', '3', '4', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('618', '406', '3', '4', '1', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('619', '407', '3', '4', '9', '9', '1', '56', '1', null);
INSERT INTO `room` VALUES ('620', '408', '3', '4', '1', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('621', '409', '3', '4', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('622', '410', '3', '4', '1', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('623', '411', '3', '4', '9', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('624', '412', '3', '4', '0', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('625', '501', '3', '5', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('626', '502', '3', '5', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('627', '503', '3', '5', '1', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('628', '504', '3', '5', '1', '9', '1', '59', '1', null);
INSERT INTO `room` VALUES ('629', '505', '3', '5', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('630', '506', '3', '5', '1', '1', '9', '55', '1', null);
INSERT INTO `room` VALUES ('631', '507', '3', '5', '1', '1', '0', '55', '1', null);
INSERT INTO `room` VALUES ('632', '508', '3', '5', '9', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('633', '509', '3', '5', '1', '1', '9', '54', '1', null);
INSERT INTO `room` VALUES ('634', '510', '3', '5', '1', '1', '0', '57', '1', null);
INSERT INTO `room` VALUES ('635', '511', '3', '5', '0', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('636', '512', '3', '5', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('637', '601', '3', '6', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('638', '602', '3', '6', '9', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('639', '603', '3', '6', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('640', '604', '3', '6', '1', '1', '0', '54', '1', null);
INSERT INTO `room` VALUES ('641', '605', '3', '6', '1', '1', '9', '36', '1', null);
INSERT INTO `room` VALUES ('642', '606', '3', '6', '1', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('643', '607', '3', '6', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('644', '608', '3', '6', '1', '1', '0', '36', '1', null);
INSERT INTO `room` VALUES ('645', '609', '3', '6', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('646', '610', '3', '6', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('647', '611', '3', '6', '1', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('648', '612', '3', '6', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('649', '101', '4', '1', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('650', '102', '4', '1', '1', '9', '1', '41', '1', null);
INSERT INTO `room` VALUES ('651', '103', '4', '1', '1', '1', '9', '51', '1', null);
INSERT INTO `room` VALUES ('652', '104', '4', '1', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('653', '105', '4', '1', '1', '1', '0', '42', '1', null);
INSERT INTO `room` VALUES ('654', '106', '4', '1', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('655', '107', '4', '1', '1', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('656', '108', '4', '1', '1', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('657', '109', '4', '1', '0', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('658', '110', '4', '1', '1', '1', '9', '36', '1', null);
INSERT INTO `room` VALUES ('659', '111', '4', '1', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('660', '112', '4', '1', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('661', '201', '4', '2', '1', '1', '9', '56', '1', null);
INSERT INTO `room` VALUES ('662', '202', '4', '2', '9', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('663', '203', '4', '2', '1', '9', '1', '58', '1', null);
INSERT INTO `room` VALUES ('664', '204', '4', '2', '1', '1', '9', '58', '1', null);
INSERT INTO `room` VALUES ('665', '205', '4', '2', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('666', '206', '4', '2', '1', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('667', '207', '4', '2', '0', '1', '0', '55', '1', null);
INSERT INTO `room` VALUES ('668', '208', '4', '2', '1', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('669', '209', '4', '2', '0', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('670', '210', '4', '2', '1', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('671', '211', '4', '2', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('672', '212', '4', '2', '0', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('673', '301', '4', '3', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('674', '302', '4', '3', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('675', '303', '4', '3', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('676', '304', '4', '3', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('677', '305', '4', '3', '1', '1', '0', '45', '1', null);
INSERT INTO `room` VALUES ('678', '306', '4', '3', '1', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('679', '307', '4', '3', '0', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('680', '308', '4', '3', '0', '9', '1', '54', '1', null);
INSERT INTO `room` VALUES ('681', '309', '4', '3', '1', '9', '0', '41', '1', null);
INSERT INTO `room` VALUES ('682', '310', '4', '3', '1', '9', '1', '35', '1', null);
INSERT INTO `room` VALUES ('683', '311', '4', '3', '1', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('684', '312', '4', '3', '1', '1', '9', '48', '1', null);
INSERT INTO `room` VALUES ('685', '401', '4', '4', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('686', '402', '4', '4', '1', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('687', '403', '4', '4', '1', '9', '0', '38', '1', null);
INSERT INTO `room` VALUES ('688', '404', '4', '4', '1', '1', '0', '48', '1', null);
INSERT INTO `room` VALUES ('689', '405', '4', '4', '1', '9', '0', '40', '1', null);
INSERT INTO `room` VALUES ('690', '406', '4', '4', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('691', '407', '4', '4', '9', '1', '9', '51', '1', null);
INSERT INTO `room` VALUES ('692', '408', '4', '4', '1', '1', '0', '57', '1', null);
INSERT INTO `room` VALUES ('693', '409', '4', '4', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('694', '410', '4', '4', '1', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('695', '411', '4', '4', '1', '0', '1', '42', '1', null);
INSERT INTO `room` VALUES ('696', '412', '4', '4', '0', '9', '1', '56', '1', null);
INSERT INTO `room` VALUES ('697', '501', '4', '5', '1', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('698', '502', '4', '5', '0', '0', '0', '37', '1', null);
INSERT INTO `room` VALUES ('699', '503', '4', '5', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('700', '504', '4', '5', '9', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('701', '505', '4', '5', '1', '1', '9', '41', '1', null);
INSERT INTO `room` VALUES ('702', '506', '4', '5', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('703', '507', '4', '5', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('704', '508', '4', '5', '1', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('705', '509', '4', '5', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('706', '510', '4', '5', '0', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('707', '511', '4', '5', '1', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('708', '512', '4', '5', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('709', '601', '4', '6', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('710', '602', '4', '6', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('711', '603', '4', '6', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('712', '604', '4', '6', '9', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('713', '605', '4', '6', '0', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('714', '606', '4', '6', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('715', '607', '4', '6', '1', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('716', '608', '4', '6', '0', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('717', '609', '4', '6', '1', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('718', '610', '4', '6', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('719', '611', '4', '6', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('720', '612', '4', '6', '9', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('721', '101', '5', '1', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('722', '102', '5', '1', '1', '1', '0', '49', '1', null);
INSERT INTO `room` VALUES ('723', '103', '5', '1', '0', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('724', '104', '5', '1', '9', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('725', '105', '5', '1', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('726', '106', '5', '1', '1', '1', '9', '42', '1', null);
INSERT INTO `room` VALUES ('727', '107', '5', '1', '1', '9', '1', '59', '1', null);
INSERT INTO `room` VALUES ('728', '108', '5', '1', '1', '0', '1', '54', '1', null);
INSERT INTO `room` VALUES ('729', '109', '5', '1', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('730', '110', '5', '1', '1', '0', '9', '55', '1', null);
INSERT INTO `room` VALUES ('731', '111', '5', '1', '0', '1', '1', '59', '1', null);
INSERT INTO `room` VALUES ('732', '112', '5', '1', '1', '1', '9', '41', '1', null);
INSERT INTO `room` VALUES ('733', '201', '5', '2', '1', '1', '9', '46', '1', null);
INSERT INTO `room` VALUES ('734', '202', '5', '2', '1', '1', '0', '47', '1', null);
INSERT INTO `room` VALUES ('735', '203', '5', '2', '1', '1', '0', '36', '1', null);
INSERT INTO `room` VALUES ('736', '204', '5', '2', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('737', '205', '5', '2', '1', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('738', '206', '5', '2', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('739', '207', '5', '2', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('740', '208', '5', '2', '1', '1', '9', '54', '1', null);
INSERT INTO `room` VALUES ('741', '209', '5', '2', '9', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('742', '210', '5', '2', '1', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('743', '211', '5', '2', '1', '0', '1', '45', '1', null);
INSERT INTO `room` VALUES ('744', '212', '5', '2', '0', '0', '1', '60', '1', null);
INSERT INTO `room` VALUES ('745', '301', '5', '3', '0', '0', '1', '54', '1', null);
INSERT INTO `room` VALUES ('746', '302', '5', '3', '9', '0', '1', '56', '1', null);
INSERT INTO `room` VALUES ('747', '303', '5', '3', '1', '0', '1', '58', '1', null);
INSERT INTO `room` VALUES ('748', '304', '5', '3', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('749', '305', '5', '3', '1', '0', '1', '38', '1', null);
INSERT INTO `room` VALUES ('750', '306', '5', '3', '1', '1', '9', '55', '1', null);
INSERT INTO `room` VALUES ('751', '307', '5', '3', '0', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('752', '308', '5', '3', '1', '0', '1', '49', '1', null);
INSERT INTO `room` VALUES ('753', '309', '5', '3', '1', '1', '0', '59', '1', null);
INSERT INTO `room` VALUES ('754', '310', '5', '3', '9', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('755', '311', '5', '3', '1', '1', '9', '53', '1', null);
INSERT INTO `room` VALUES ('756', '312', '5', '3', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('757', '401', '5', '4', '0', '1', '1', '43', '1', null);
INSERT INTO `room` VALUES ('758', '402', '5', '4', '1', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('759', '403', '5', '4', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('760', '404', '5', '4', '1', '1', '0', '53', '1', null);
INSERT INTO `room` VALUES ('761', '405', '5', '4', '1', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('762', '406', '5', '4', '1', '1', '9', '36', '1', null);
INSERT INTO `room` VALUES ('763', '407', '5', '4', '0', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('764', '408', '5', '4', '0', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('765', '409', '5', '4', '1', '1', '1', '38', '1', null);
INSERT INTO `room` VALUES ('766', '410', '5', '4', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('767', '411', '5', '4', '1', '1', '1', '45', '1', null);
INSERT INTO `room` VALUES ('768', '412', '5', '4', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('769', '501', '5', '5', '1', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('770', '502', '5', '5', '1', '0', '9', '41', '1', null);
INSERT INTO `room` VALUES ('771', '503', '5', '5', '1', '0', '1', '49', '1', null);
INSERT INTO `room` VALUES ('772', '504', '5', '5', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('773', '505', '5', '5', '1', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('774', '506', '5', '5', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('775', '507', '5', '5', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('776', '508', '5', '5', '1', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('777', '509', '5', '5', '9', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('778', '510', '5', '5', '0', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('779', '511', '5', '5', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('780', '512', '5', '5', '1', '1', '0', '50', '1', null);
INSERT INTO `room` VALUES ('781', '601', '5', '6', '1', '1', '1', '54', '1', null);
INSERT INTO `room` VALUES ('782', '602', '5', '6', '0', '1', '1', '56', '1', null);
INSERT INTO `room` VALUES ('783', '603', '5', '6', '1', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('784', '604', '5', '6', '1', '1', '0', '36', '1', null);
INSERT INTO `room` VALUES ('785', '605', '5', '6', '1', '9', '1', '49', '1', null);
INSERT INTO `room` VALUES ('786', '606', '5', '6', '0', '0', '0', '50', '1', null);
INSERT INTO `room` VALUES ('787', '607', '5', '6', '9', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('788', '608', '5', '6', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('789', '609', '5', '6', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('790', '610', '5', '6', '9', '1', '1', '50', '1', null);
INSERT INTO `room` VALUES ('791', '611', '5', '6', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('792', '612', '5', '6', '0', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('793', '101', '6', '1', '9', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('794', '102', '6', '1', '1', '0', '1', '51', '1', null);
INSERT INTO `room` VALUES ('795', '103', '6', '1', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('796', '104', '6', '1', '1', '1', '9', '41', '1', null);
INSERT INTO `room` VALUES ('797', '105', '6', '1', '1', '1', '9', '38', '1', null);
INSERT INTO `room` VALUES ('798', '106', '6', '1', '1', '1', '9', '58', '1', null);
INSERT INTO `room` VALUES ('799', '107', '6', '1', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('800', '108', '6', '1', '1', '9', '1', '57', '1', null);
INSERT INTO `room` VALUES ('801', '109', '6', '1', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('802', '110', '6', '1', '0', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('803', '111', '6', '1', '1', '1', '0', '47', '1', null);
INSERT INTO `room` VALUES ('804', '112', '6', '1', '1', '9', '1', '47', '1', null);
INSERT INTO `room` VALUES ('805', '201', '6', '2', '1', '9', '1', '36', '1', null);
INSERT INTO `room` VALUES ('806', '202', '6', '2', '1', '9', '1', '55', '1', null);
INSERT INTO `room` VALUES ('807', '203', '6', '2', '1', '9', '1', '55', '1', null);
INSERT INTO `room` VALUES ('808', '204', '6', '2', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('809', '205', '6', '2', '1', '1', '1', '44', '1', null);
INSERT INTO `room` VALUES ('810', '206', '6', '2', '1', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('811', '207', '6', '2', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('812', '208', '6', '2', '1', '1', '9', '55', '1', null);
INSERT INTO `room` VALUES ('813', '209', '6', '2', '1', '9', '1', '49', '1', null);
INSERT INTO `room` VALUES ('814', '210', '6', '2', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('815', '211', '6', '2', '0', '1', '1', '53', '1', null);
INSERT INTO `room` VALUES ('816', '212', '6', '2', '1', '1', '1', '37', '1', null);
INSERT INTO `room` VALUES ('817', '301', '6', '3', '1', '9', '1', '45', '1', null);
INSERT INTO `room` VALUES ('818', '302', '6', '3', '9', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('819', '303', '6', '3', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('820', '304', '6', '3', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('821', '305', '6', '3', '1', '9', '1', '40', '1', null);
INSERT INTO `room` VALUES ('822', '306', '6', '3', '9', '1', '9', '35', '1', null);
INSERT INTO `room` VALUES ('823', '307', '6', '3', '1', '1', '9', '44', '1', null);
INSERT INTO `room` VALUES ('824', '308', '6', '3', '1', '1', '1', '57', '1', null);
INSERT INTO `room` VALUES ('825', '309', '6', '3', '1', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('826', '310', '6', '3', '1', '1', '0', '48', '1', null);
INSERT INTO `room` VALUES ('827', '311', '6', '3', '1', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('828', '312', '6', '3', '1', '1', '1', '60', '1', null);
INSERT INTO `room` VALUES ('829', '401', '6', '4', '1', '1', '0', '39', '1', null);
INSERT INTO `room` VALUES ('830', '402', '6', '4', '1', '1', '1', '35', '1', null);
INSERT INTO `room` VALUES ('831', '403', '6', '4', '1', '1', '1', '46', '1', null);
INSERT INTO `room` VALUES ('832', '404', '6', '4', '9', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('833', '405', '6', '4', '1', '1', '0', '55', '1', null);
INSERT INTO `room` VALUES ('834', '406', '6', '4', '9', '9', '1', '43', '1', null);
INSERT INTO `room` VALUES ('835', '407', '6', '4', '1', '1', '9', '40', '1', null);
INSERT INTO `room` VALUES ('836', '408', '6', '4', '1', '9', '0', '39', '1', null);
INSERT INTO `room` VALUES ('837', '409', '6', '4', '1', '9', '1', '38', '1', null);
INSERT INTO `room` VALUES ('838', '410', '6', '4', '9', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('839', '411', '6', '4', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('840', '412', '6', '4', '1', '1', '1', '40', '1', null);
INSERT INTO `room` VALUES ('841', '501', '6', '5', '1', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('842', '502', '6', '5', '1', '1', '1', '51', '1', null);
INSERT INTO `room` VALUES ('843', '503', '6', '5', '9', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('844', '504', '6', '5', '1', '1', '1', '41', '1', null);
INSERT INTO `room` VALUES ('845', '505', '6', '5', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('846', '506', '6', '5', '1', '1', '1', '36', '1', null);
INSERT INTO `room` VALUES ('847', '507', '6', '5', '9', '1', '1', '52', '1', null);
INSERT INTO `room` VALUES ('848', '508', '6', '5', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('849', '509', '6', '5', '1', '9', '1', '55', '1', null);
INSERT INTO `room` VALUES ('850', '510', '6', '5', '0', '1', '1', '48', '1', null);
INSERT INTO `room` VALUES ('851', '511', '6', '5', '1', '1', '9', '40', '1', null);
INSERT INTO `room` VALUES ('852', '512', '6', '5', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('853', '601', '6', '6', '9', '1', '9', '54', '1', null);
INSERT INTO `room` VALUES ('854', '602', '6', '6', '0', '9', '1', '45', '1', null);
INSERT INTO `room` VALUES ('855', '603', '6', '6', '0', '1', '0', '52', '1', null);
INSERT INTO `room` VALUES ('856', '604', '6', '6', '1', '1', '1', '39', '1', null);
INSERT INTO `room` VALUES ('857', '605', '6', '6', '1', '0', '1', '58', '1', null);
INSERT INTO `room` VALUES ('858', '606', '6', '6', '1', '1', '1', '58', '1', null);
INSERT INTO `room` VALUES ('859', '607', '6', '6', '1', '1', '1', '55', '1', null);
INSERT INTO `room` VALUES ('860', '608', '6', '6', '1', '0', '1', '43', '1', null);
INSERT INTO `room` VALUES ('861', '609', '6', '6', '1', '1', '1', '42', '1', null);
INSERT INTO `room` VALUES ('862', '610', '6', '6', '1', '1', '1', '47', '1', null);
INSERT INTO `room` VALUES ('863', '611', '6', '6', '1', '1', '1', '49', '1', null);
INSERT INTO `room` VALUES ('864', '612', '6', '6', '1', '1', '1', '44', '1', null);

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seat_code` varchar(32) DEFAULT NULL,
  `seat_row` int DEFAULT NULL,
  `seat_col` int DEFAULT NULL,
  `room_code` varchar(32) DEFAULT NULL,
  `status` varchar(8) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seat
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `sex` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '0:男;1:女',
  `identity_code` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证号码',
  `class_code` varchar(16) DEFAULT NULL,
  `nation` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '汉族',
  `politics` varchar(16) DEFAULT '0' COMMENT '政治面貌;0:群众\r\n1:团员\r\n2:党员',
  `enter_time` timestamp NULL DEFAULT NULL COMMENT '入学日期',
  `birth_time` timestamp NULL DEFAULT NULL COMMENT '生日',
  `is_inland` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '是否内陆户口',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `user_code` varchar(32) DEFAULT NULL,
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=709 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '20170011001', '艾伦', '0', '33033000', '2017001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', 'ailun', '1');
INSERT INTO `student` VALUES ('2', '20170011002', '陈祥旭', '0', '33033001', '2017001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('3', '20170011003', '常怡', '0', '33033002', '2017001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('4', '20170011004', '昌坚', '0', '33033003', '2017001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('5', '20170011005', '魏有广', '0', '33033004', '2017001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('6', '20170011006', '程章远', '0', '33033005', '2017001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('7', '20170021007', '蔚红琴', '0', '33033006', '2017002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('8', '20170021008', '昌文杰', '0', '33033007', '2017002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('9', '20170021009', '韦柏存', '0', '33033008', '2017002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('10', '20170021010', '叶佳妮', '0', '33033009', '2017002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('11', '20170021011', '程小宁', '0', '33033010', '2017002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('12', '20170021012', '姚国勤', '0', '33033011', '2017002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('13', '20170021013', '常语', '0', '33033012', '2017002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('14', '20170021014', '温顺', '0', '33033013', '2017002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('15', '20170021015', '楚梓涵', '0', '33033014', '2017002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('16', '20170021016', '游珺涵', '0', '33033015', '2017002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('17', '20170021017', '蔡丰翼', '0', '33033016', '2017002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('18', '20170031018', '于浩天', '0', '33033017', '2017003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('19', '20170031019', '程炜', '0', '33033018', '2017003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('20', '20170031020', '温琦惟', '0', '33033019', '2017003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('21', '20170031021', '芮行华', '0', '33033020', '2017003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('22', '20170031022', '楚梓', '0', '33033021', '2017003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('23', '20170031023', '余峰', '0', '33033022', '2017003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('24', '20170041024', '吴易奚', '0', '33033023', '2017004', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('25', '20170041025', '于盎', '0', '33033024', '2017004', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('26', '20170041026', '苍景元', '0', '33033025', '2017004', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('27', '20170051027', '郁崇旺', '0', '33033026', '2017005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('28', '20170051028', '阎谚', '0', '33033027', '2017005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('29', '20170051029', '宇文纬', '0', '33033028', '2017005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('30', '20170051030', '姚志敏', '0', '33033029', '2017005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('31', '20170051031', '叶洁妮', '0', '33033030', '2017005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('32', '20170061032', '曹庆霞', '0', '33033031', '2017006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('33', '20170061033', '程杨鸿', '0', '33033032', '2017006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('34', '20170061034', '姚巧蓉', '0', '33033033', '2017006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('35', '20170061035', '程中棋', '0', '33033034', '2017006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('36', '20170061036', '云娟', '0', '33033035', '2017006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('37', '20170071037', '蔡兴泽', '0', '33033036', '2017007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('38', '20170071038', '芮行', '0', '33033037', '2017007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('39', '20170071039', '吴今', '0', '33033038', '2017007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('40', '20170071040', '尤廷梁', '0', '33033039', '2017007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('41', '20170081041', '武春平', '0', '33033040', '2017008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('42', '20170081042', '常颖澜', '0', '33033041', '2017008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('43', '20170081043', '冉三财', '0', '33033042', '2017008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('44', '20170081044', '仰笑', '0', '33033043', '2017008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('45', '20170081045', '程中琳', '0', '33033044', '2017008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('46', '20170091046', '冉芷汀', '0', '33033045', '2017009', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('47', '20170091047', '芮常敏', '0', '33033046', '2017009', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('48', '20170101048', '温窈彤', '0', '33033047', '2017010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('49', '20170101049', '卫东', '0', '33033048', '2017010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('50', '20170101050', '常学梅', '0', '33033049', '2017010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('51', '20170101051', '余马寿', '0', '33033050', '2017010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('52', '20170101052', '王华', '0', '33033051', '2017010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('53', '20170111053', '游恒懿', '0', '33033052', '2017011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('54', '20170111054', '姚新花', '0', '33033053', '2017011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('55', '20170111055', '于世雄', '0', '33033054', '2017011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('56', '20170111056', '车汶桦', '0', '33033055', '2017011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('57', '20170121057', '吴燕芬', '0', '33033056', '2017012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('58', '20170121058', '温曼彤', '0', '33033057', '2017012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('59', '20170121059', '尤启澄', '0', '33033058', '2017012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('60', '20170121060', '楚梓馨', '0', '33033059', '2017012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('61', '20170131061', '褚文鹏', '0', '33033060', '2017013', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('62', '20170131062', '曹成', '0', '33033061', '2017013', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('63', '20170131063', '于长江', '0', '33033062', '2017013', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('64', '20170141064', '万青', '0', '33033063', '2017014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('65', '20170141065', '仰灏愉', '0', '33033064', '2017014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('66', '20170141066', '仰灏明', '0', '33033065', '2017014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('67', '20170141067', '常益', '0', '33033066', '2017014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('68', '20170151068', '魏广文', '0', '33033067', '2017015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('69', '20170151069', '尹赫瑜', '0', '33033068', '2017015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('70', '20170151070', '万佳惠', '0', '33033069', '2017015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('71', '20170151071', '楚钰', '0', '33033070', '2017015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('72', '20170161072', '蔡哲', '0', '33033071', '2017016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('73', '20170161073', '陈晓', '0', '33033072', '2017016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('74', '20170161074', '于鸿铭', '0', '33033073', '2017016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('75', '20170161075', '褚立军', '0', '33033074', '2017016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('76', '20170161076', '芮志', '0', '33033075', '2017016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('77', '20170171077', '尤雅', '0', '33033076', '2017017', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('78', '20170171078', '应谕铭', '0', '33033077', '2017017', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('79', '20170171079', '尤庭梁', '0', '33033078', '2017017', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('80', '20170181080', '易小妹', '0', '33033079', '2017018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('81', '20170181081', '仰灏天', '0', '33033080', '2017018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('82', '20170181082', '韦嘉', '0', '33033081', '2017018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('83', '20170181083', '尤嘉怡', '0', '33033082', '2017018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('84', '20170191084', '程相东', '0', '33033083', '2017019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('85', '20170191085', '常菲杨', '0', '33033084', '2017019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('86', '20170191086', '柴文藻', '0', '33033085', '2017019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('87', '20170191087', '云祥宇', '0', '33033086', '2017019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('88', '20170201088', '昌明哲', '0', '33033087', '2017020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('89', '20170201089', '韦清', '0', '33033088', '2017020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('90', '20170201090', '叶琛琨', '0', '33033089', '2017020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('91', '20170201091', '应凯淇', '0', '33033090', '2017020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('92', '20170211092', '武雅鑫', '0', '33033091', '2017021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('93', '20170211093', '冉卓昀', '0', '33033092', '2017021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('94', '20170211094', '乌艳艳', '0', '33033093', '2017021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('95', '20170211095', '王瑛', '0', '33033094', '2017021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('96', '20170221096', '芮一丹', '0', '33033095', '2017022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('97', '20170221097', '魏立文', '0', '33033096', '2017022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('98', '20170221098', '褚家伟', '0', '33033097', '2017022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('99', '20170221099', '芮炀', '0', '33033098', '2017022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('100', '20170231100', '冉打', '0', '33033099', '2017023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('101', '20170231101', '魏宏伟', '0', '33033100', '2017023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('102', '20170231102', '楚雪', '0', '33033101', '2017023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('103', '20170231103', '云波学', '0', '33033102', '2017023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('104', '20170231104', '尹秉智', '0', '33033103', '2017023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('105', '20170241105', '云布龙', '0', '33033104', '2017024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('106', '20170241106', '常海澜', '0', '33033105', '2017024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('107', '20170241107', '魏小钰', '0', '33033106', '2017024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('108', '20170241108', '常妤', '0', '33033107', '2017024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('109', '20170241109', '车冬阳', '0', '33033108', '2017024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('110', '20170251110', '金金华', '0', '33033109', '2017025', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('111', '20170251111', '郁胜', '0', '33033110', '2017025', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('112', '20170251112', '叶宣彤', '0', '33033111', '2017025', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('113', '20170261113', '苍翰梁', '0', '33033112', '2017026', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('114', '20170271114', '楚雅', '0', '33033113', '2017027', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('115', '20170281115', '于纹华', '0', '33033114', '2017028', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('116', '20170291116', '蔡宛言', '0', '33033115', '2017029', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('117', '20170301117', '云扬善', '0', '33033116', '2017030', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('118', '20170311118', '温琪彤', '0', '33033117', '2017031', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('119', '20170321119', '汪素君', '0', '33033118', '2017032', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('120', '20170331120', '应洛妍', '0', '33033119', '2017033', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('121', '20170341121', '韦建才', '0', '33033120', '2017034', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('122', '20170351122', '蔡文洪', '0', '33033121', '2017035', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('123', '20170361123', '楚馨', '0', '33033122', '2017036', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('124', '20170371124', '池雄', '0', '33033123', '2017037', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('125', '20170381125', '韦云清', '0', '33033124', '2017038', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('126', '20170391126', '颜影明', '0', '33033125', '2017039', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('127', '20170401127', '曹馨化', '0', '33033126', '2017040', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('128', '20170411128', '郁超', '0', '33033127', '2017041', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('129', '20170421129', '柴雯频', '0', '33033128', '2017042', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('130', '20170431130', '蔡曹奕', '0', '33033129', '2017043', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('131', '20170441131', '应晨雨', '0', '33033130', '2017044', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('132', '20170451132', '韦雨宏', '0', '33033131', '2017045', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('133', '20170461133', '昌丽娜', '0', '33033132', '2017046', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('134', '20170471134', '柴子霁', '0', '33033133', '2017047', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('135', '20170481135', '车鸣', '0', '33033134', '2017048', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('136', '20170491136', '俞心放', '0', '33033135', '2017049', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('137', '20170501137', '昌星怡', '0', '33033136', '2017050', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('138', '20170511138', '褚钧梓', '0', '33033137', '2017051', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('139', '20170521139', '蔡东悦', '0', '33033138', '2017052', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('140', '20170531140', '褚跃德', '0', '33033139', '2017053', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('141', '20170541141', '车驰', '0', '33033140', '2017054', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('142', '20170551142', '褚凌希', '0', '33033141', '2017055', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('143', '20170561143', '卫童博', '0', '33033142', '2017056', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('144', '20170571144', '姚晴婕', '0', '33033143', '2017057', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('145', '20170581145', '武钊阳', '0', '33033144', '2017058', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('146', '20170591146', '存思蓉', '0', '33033145', '2017059', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('147', '20170601147', '云晨景', '0', '33033146', '2017060', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('148', '20170611148', '武天琨', '0', '33033147', '2017061', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('149', '20170621149', '万润祺', '0', '33033148', '2017062', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('150', '20170631150', '冉竞丹', '0', '33033149', '2017063', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('151', '20170641151', '魏瑶晖', '0', '33033150', '2017064', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('152', '20170651152', '汪铮铮', '0', '33033151', '2017065', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('153', '20170661153', '万涵羽', '0', '33033152', '2017066', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('154', '20170671154', '楚梁', '0', '33033153', '2017067', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('155', '20170681155', '蔡子泽', '0', '33033154', '2017068', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('156', '20170691156', '蔡明衡', '0', '33033155', '2017069', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('157', '20170701157', '魏丽', '0', '33033156', '2017070', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('158', '20170711158', '蔡哲然', '0', '33033157', '2017071', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('159', '20170721159', '云华', '0', '33033158', '2017072', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('160', '20170731160', '颜秋莉', '0', '33033159', '2017073', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('161', '20170741161', '应凯', '0', '33033160', '2017074', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('162', '20170751162', '蔡弘峰', '0', '33033161', '2017075', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('163', '20170761163', '常雷', '0', '33033162', '2017076', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('164', '20170771164', '严九香', '0', '33033163', '2017077', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('165', '20170781165', '程若岚', '0', '33033164', '2017078', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('166', '20170791166', '阎育辉', '0', '33033165', '2017079', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('167', '20170801167', '俞木', '0', '33033166', '2017080', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('168', '20170811168', '冉红涛', '0', '33033167', '2017081', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('169', '20170821169', '楚琳', '0', '33033168', '2017082', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('170', '20170831170', '余汉婵', '0', '33033169', '2017083', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('171', '20170841171', '常语', '0', '33033170', '2017084', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('172', '20170851172', '俞思源', '0', '33033171', '2017085', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('173', '20170861173', '吴湘涛', '0', '33033172', '2017086', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('174', '20170871174', '楚妍', '0', '33033173', '2017087', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('175', '20170881175', '蔡细纯', '0', '33033174', '2017088', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('176', '20170891176', '叶馨文', '0', '33033175', '2017089', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('177', '20170901177', '仰兵', '0', '33033176', '2017090', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('178', '20180011001', '褚浩', '0', '33033177', '2018001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('179', '20180011002', '温梓稀', '0', '33033178', '2018001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('180', '20180011003', '常海钰', '0', '33033179', '2018001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('181', '20180011004', '颜可洋', '0', '33033180', '2018001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('182', '20180011005', '颜恋滟', '0', '33033181', '2018001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('183', '20180011006', '于昊宇', '0', '33033182', '2018001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('184', '20180021007', '常乐', '0', '33033183', '2018002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('185', '20180021008', '陈东慧', '0', '33033184', '2018002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('186', '20180021009', '颜佳淇', '0', '33033185', '2018002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('187', '20180021010', '尤杰', '0', '33033186', '2018002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('188', '20180021011', '万宗帅', '0', '33033187', '2018002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('189', '20180021012', '仰营', '0', '33033188', '2018002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('190', '20180021013', '云诗琪', '0', '33033189', '2018002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('191', '20180021014', '常永胜', '0', '33033190', '2018002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('192', '20180021015', '吴汉明', '0', '33033191', '2018002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('193', '20180021016', '卫弘', '0', '33033192', '2018002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('194', '20180021017', '尤静', '0', '33033193', '2018002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('195', '20180031018', '于桐', '0', '33033194', '2018003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('196', '20180031019', '颜心兰', '0', '33033195', '2018003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('197', '20180031020', '蔡弘业', '0', '33033196', '2018003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('198', '20180031021', '武霞', '0', '33033197', '2018003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('199', '20180031022', '昌淼', '0', '33033198', '2018003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('200', '20180031023', '常海兴', '0', '33033199', '2018003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('201', '20180041024', '程静', '0', '33033200', '2018004', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('202', '20180041025', '游莉', '0', '33033201', '2018004', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('203', '20180041026', '柴蓉蓉', '0', '33033202', '2018004', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('204', '20180051027', '郁凯', '0', '33033203', '2018005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('205', '20180051028', '易丽萍', '0', '33033204', '2018005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('206', '20180051029', '常盎甜', '0', '33033205', '2018005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('207', '20180051030', '严佩语', '0', '33033206', '2018005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('208', '20180051031', '阎霜', '0', '33033207', '2018005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('209', '20180061032', '池作清', '0', '33033208', '2018006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('210', '20180061033', '褚梓钧', '0', '33033209', '2018006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('211', '20180061034', '乌艾', '0', '33033210', '2018006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('212', '20180061035', '柴青森', '0', '33033211', '2018006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('213', '20180061036', '俞瑛', '0', '33033212', '2018006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('214', '20180071037', '韦汝艾', '0', '33033213', '2018007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('215', '20180071038', '吴彦憬', '0', '33033214', '2018007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('216', '20180071039', '万里', '0', '33033215', '2018007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('217', '20180071040', '池振东', '0', '33033216', '2018007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('218', '20180081041', '蔡宝东', '0', '33033217', '2018008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('219', '20180081042', '乌赫男', '0', '33033218', '2018008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('220', '20180081043', '游珺琇', '0', '33033219', '2018008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('221', '20180081044', '云英', '0', '33033220', '2018008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('222', '20180081045', '俞圆', '0', '33033221', '2018008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('223', '20180091046', '尹秋星', '0', '33033222', '2018009', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('224', '20180091047', '蔚盛图', '0', '33033223', '2018009', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('225', '20180101048', '云栖', '0', '33033224', '2018010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('226', '20180101049', '武传亮', '0', '33033225', '2018010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('227', '20180101050', '叶秉琨', '0', '33033226', '2018010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('228', '20180101051', '温佳彤', '0', '33033227', '2018010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('229', '20180101052', '王艳娇', '0', '33033228', '2018010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('230', '20180111053', '游子豪', '0', '33033229', '2018011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('231', '20180111054', '尤霆梁', '0', '33033230', '2018011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('232', '20180111055', '程玉耒', '0', '33033231', '2018011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('233', '20180111056', '吴恒', '0', '33033232', '2018011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('234', '20180121057', '韦洁伊', '0', '33033233', '2018012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('235', '20180121058', '魏晓冬', '0', '33033234', '2018012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('236', '20180121059', '芮纹', '0', '33033235', '2018012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('237', '20180121060', '颜朗湛', '0', '33033236', '2018012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('238', '20180131061', '常雨', '0', '33033237', '2018013', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('239', '20180131062', '常予晴', '0', '33033238', '2018013', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('240', '20180131063', '余以娥', '0', '33033239', '2018013', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('241', '20180141064', '冉海星', '0', '33033240', '2018014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('242', '20180141065', '游静波', '0', '33033241', '2018014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('243', '20180141066', '韦艾江', '0', '33033242', '2018014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('244', '20180141067', '曹敏', '0', '33033243', '2018014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('245', '20180151068', '尤慧勇', '0', '33033244', '2018015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('246', '20180151069', '温梅清', '0', '33033245', '2018015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('247', '20180151070', '尹赫稳', '0', '33033246', '2018015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('248', '20180151071', '武冬', '0', '33033247', '2018015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('249', '20180161072', '池吏锋', '0', '33033248', '2018016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('250', '20180161073', '蔡艺航', '0', '33033249', '2018016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('251', '20180161074', '尤丽君', '0', '33033250', '2018016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('252', '20180161075', '阎胜江', '0', '33033251', '2018016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('253', '20180161076', '程飞', '0', '33033252', '2018016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('254', '20180171077', '郁展诗', '0', '33033253', '2018017', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('255', '20180171078', '游瑞祺', '0', '33033254', '2018017', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('256', '20180171079', '游桂超', '0', '33033255', '2018017', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('257', '20180181080', '云惟壮', '0', '33033256', '2018018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('258', '20180181081', '于晴', '0', '33033257', '2018018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('259', '20180181082', '池昕雪', '0', '33033258', '2018018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('260', '20180181083', '俞体磨', '0', '33033259', '2018018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('261', '20180191084', '汪洋海', '0', '33033260', '2018019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('262', '20180191085', '常杨', '0', '33033261', '2018019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('263', '20180191086', '余瑞蕊', '0', '33033262', '2018019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('264', '20180191087', '常妍冰', '0', '33033263', '2018019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('265', '20180201088', '褚丽娜', '0', '33033264', '2018020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('266', '20180201089', '武翠翠', '0', '33033265', '2018020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('267', '20180201090', '尹神舟', '0', '33033266', '2018020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('268', '20180201091', '楚琪', '0', '33033267', '2018020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('269', '20180211092', '韦艾汝', '0', '33033268', '2018021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('270', '20180211093', '严灼林', '0', '33033269', '2018021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('271', '20180211094', '易正群易静', '0', '33033270', '2018021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('272', '20180211095', '楚琛', '0', '33033271', '2018021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('273', '20180221096', '汪畅', '0', '33033272', '2018022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('274', '20180221097', '蔡燕芬', '0', '33033273', '2018022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('275', '20180221098', '严剑炜', '0', '33033274', '2018022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('276', '20180221099', '昌妮', '0', '33033275', '2018022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('277', '20180231100', '楚海', '0', '33033276', '2018023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('278', '20180231101', '云丹', '0', '33033277', '2018023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('279', '20180231102', '乌艾呀', '0', '33033278', '2018023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('280', '20180231103', '昌巍', '0', '33033279', '2018023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('281', '20180231104', '程菲菲', '0', '33033280', '2018023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('282', '20180241105', '仰迎', '0', '33033281', '2018024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('283', '20180241106', '仰义豪', '0', '33033282', '2018024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('284', '20180241107', '楚彦', '0', '33033283', '2018024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('285', '20180241108', '吴灿卿', '0', '33033284', '2018024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('286', '20180241109', '姚树华', '0', '33033285', '2018024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('287', '20180251110', '楚晨', '0', '33033286', '2018025', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('288', '20180251111', '苍灏东', '0', '33033287', '2018025', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('289', '20180251112', '蔡子博', '0', '33033288', '2018025', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('290', '20180261113', '褚荣富', '0', '33033289', '2018026', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('291', '20180271114', '昌明珏', '0', '33033290', '2018027', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('292', '20180281115', '王紫瀚', '0', '33033291', '2018028', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('293', '20180291116', '武玉梅', '0', '33033292', '2018029', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('294', '20180301117', '常琨', '0', '33033293', '2018030', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('295', '20180311118', '温卿', '0', '33033294', '2018031', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('296', '20180321119', '卫夫', '0', '33033295', '2018032', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('297', '20180331120', '郁金姗', '0', '33033296', '2018033', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('298', '20180341121', '昌旭荣', '0', '33033297', '2018034', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('299', '20180351122', '常志喜', '0', '33033298', '2018035', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('300', '20180361123', '褚桓麟', '0', '33033299', '2018036', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('301', '20180371124', '姚文', '0', '33033300', '2018037', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('302', '20180381125', '韦洁', '0', '33033301', '2018038', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('303', '20180391126', '韦宏怀', '0', '33033302', '2018039', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('304', '20180401127', '王明涛', '0', '33033303', '2018040', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('305', '20180411128', '程诚', '0', '33033304', '2018041', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('306', '20180421129', '车红梅', '0', '33033305', '2018042', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('307', '20180431130', '武嘉琦', '0', '33033306', '2018043', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('308', '20180441131', '池例锋', '0', '33033307', '2018044', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('309', '20180451132', '易继岚', '0', '33033308', '2018045', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('310', '20180461133', '车皓阳', '0', '33033309', '2018046', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('311', '20180471134', '常乐怡', '0', '33033310', '2018047', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('312', '20180481135', '俞鸣洋', '0', '33033311', '2018048', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('313', '20180491136', '楚楠', '0', '33033312', '2018049', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('314', '20180501137', '孟兰', '0', '33033313', '2018050', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('315', '20180511138', '姚国文', '0', '33033314', '2018051', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('316', '20180521139', '常甜盎', '0', '33033315', '2018052', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('317', '20180531140', '常城', '0', '33033316', '2018053', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('318', '20180541141', '昌紫燕', '0', '33033317', '2018054', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('319', '20180551142', '郁秋艳', '0', '33033318', '2018055', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('320', '20180561143', '常滢', '0', '33033319', '2018056', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('321', '20180571144', '蔡瑞哲', '0', '33033320', '2018057', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('322', '20180581145', '汪小语', '0', '33033321', '2018058', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('323', '20180591146', '冉子骥', '0', '33033322', '2018059', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('324', '20180601147', '蔡建忠', '0', '33033323', '2018060', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('325', '20180611148', '王紫耘', '0', '33033324', '2018061', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('326', '20180621149', '褚逸宸', '0', '33033325', '2018062', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('327', '20180631150', '蔡嘉昊', '0', '33033326', '2018063', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('328', '20180641151', '易继超', '0', '33033327', '2018064', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('329', '20180651152', '易莒岚', '0', '33033328', '2018065', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('330', '20180661153', '宇文硕', '0', '33033329', '2018066', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('331', '20180671154', '蔡花', '0', '33033330', '2018067', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('332', '20180681155', '常思语', '0', '33033331', '2018068', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('333', '20180691156', '万雨佳', '0', '33033332', '2018069', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('334', '20180701157', '楚舒', '0', '33033333', '2018070', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('335', '20180711158', '吴春芗', '0', '33033334', '2018071', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('336', '20180721159', '郁颂斌', '0', '33033335', '2018072', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('337', '20180731160', '乌柏男', '0', '33033336', '2018073', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('338', '20180741161', '武婷', '0', '33033337', '2018074', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('339', '20180751162', '温祈彤', '0', '33033338', '2018075', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('340', '20180761163', '仰映澄', '0', '33033339', '2018076', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('341', '20180771164', '温源', '0', '33033340', '2018077', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('342', '20180781165', '武艳霞', '0', '33033341', '2018078', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('343', '20180791166', '车聃', '0', '33033342', '2018079', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('344', '20180801167', '池毓娇', '0', '33033343', '2018080', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('345', '20180811168', '余洋昆', '0', '33033344', '2018081', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('346', '20180821169', '苍洪静', '0', '33033345', '2018082', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('347', '20180831170', '宇文地', '0', '33033346', '2018083', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('348', '20180841171', '常立华', '0', '33033347', '2018084', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('349', '20180851172', '万敏江', '0', '33033348', '2018085', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('350', '20180861173', '严铁良', '0', '33033349', '2018086', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('351', '20180871174', '柴书阳', '0', '33033350', '2018087', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('352', '20180881175', '楚杰', '0', '33033351', '2018088', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('353', '20180891176', '仰珩于', '0', '33033352', '2018089', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('354', '20180901177', '万馨菱', '0', '33033353', '2018090', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('355', '20190011001', '褚颖荣', '0', '33033354', '2019001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('356', '20190011002', '冉丛铵', '0', '33033355', '2019001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('357', '20190011003', '严积章', '0', '33033356', '2019001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('358', '20190011004', '云桂桂', '0', '33033357', '2019001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('359', '20190011005', '叶子', '0', '33033358', '2019001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('360', '20190011006', '程蒙', '0', '33033359', '2019001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('361', '20190021007', '颜奇淇', '0', '33033360', '2019002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('362', '20190021008', '汪思彤', '0', '33033361', '2019002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('363', '20190021009', '于闻浩', '0', '33033362', '2019002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('364', '20190021010', '王琪逸', '0', '33033363', '2019002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('365', '20190021011', '万雅芬', '0', '33033364', '2019002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('366', '20190021012', '常雨', '0', '33033365', '2019002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('367', '20190021013', '阎浩然', '0', '33033366', '2019002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('368', '20190021014', '韦芳', '0', '33033367', '2019002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('369', '20190021015', '郁佳真', '0', '33033368', '2019002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('370', '20190021016', '曹译匀', '0', '33033369', '2019002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('371', '20190021017', '应丽波', '0', '33033370', '2019002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('372', '20190031018', '曹文雯', '0', '33033371', '2019003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('373', '20190031019', '余芝慧', '0', '33033372', '2019003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('374', '20190031020', '温清', '0', '33033373', '2019003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('375', '20190031021', '卫来', '0', '33033374', '2019003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('376', '20190031022', '尹赫哲', '0', '33033375', '2019003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('377', '20190031023', '曹钰蠃', '0', '33033376', '2019003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('378', '20190041024', '吴国立', '0', '33033377', '2019004', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('379', '20190041025', '韦金葵', '0', '33033378', '2019004', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('380', '20190041026', '常慧雯', '0', '33033379', '2019004', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('381', '20190051027', '尤欢', '0', '33033380', '2019005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('382', '20190051028', '颜海燕', '0', '33033381', '2019005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('383', '20190051029', '程中槐', '0', '33033382', '2019005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('384', '20190051030', '昌蕾', '0', '33033383', '2019005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('385', '20190051031', '游旺', '0', '33033384', '2019005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('386', '20190061032', '叶兆颖', '0', '33033385', '2019006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('387', '20190061033', '楚雯', '0', '33033386', '2019006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('388', '20190061034', '冉光理', '0', '33033387', '2019006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('389', '20190061035', '应萍', '0', '33033388', '2019006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('390', '20190061036', '冉伟', '0', '33033389', '2019006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('391', '20190071037', '温传铭', '0', '33033390', '2019007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('392', '20190071038', '于案', '0', '33033391', '2019007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('393', '20190071039', '姚佳婕', '0', '33033392', '2019007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('394', '20190071040', '车防', '0', '33033393', '2019007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('395', '20190081041', '云国新', '0', '33033394', '2019008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('396', '20190081042', '尹赫圆', '0', '33033395', '2019008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('397', '20190081043', '程可萦', '0', '33033396', '2019008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('398', '20190081044', '柴子钤', '0', '33033397', '2019008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('399', '20190081045', '云静', '0', '33033398', '2019008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('400', '20190091046', '苍辉', '0', '33033399', '2019009', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('401', '20190091047', '云海军', '0', '33033400', '2019009', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('402', '20190101048', '常惠兰', '0', '33033401', '2019010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('403', '20190101049', '云宇航', '0', '33033402', '2019010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('404', '20190101050', '昌勇', '0', '33033403', '2019010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('405', '20190101051', '常慧雯', '0', '33033404', '2019010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('406', '20190101052', '蔚青蒲', '0', '33033405', '2019010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('407', '20190111053', '姚煜翔', '0', '33033406', '2019011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('408', '20190111054', '芮鸿娟', '0', '33033407', '2019011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('409', '20190111055', '文方', '0', '33033408', '2019011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('410', '20190111056', '楚韵', '0', '33033409', '2019011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('411', '20190121057', '冉财乐', '0', '33033410', '2019012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('412', '20190121058', '昌思淼', '0', '33033411', '2019012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('413', '20190121059', '宇文荣宇文鸿雁', '0', '33033412', '2019012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('414', '20190121060', '余政道', '0', '33033413', '2019012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('415', '20190131061', '应宁宁', '0', '33033414', '2019013', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('416', '20190131062', '乌欣桉', '0', '33033415', '2019013', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('417', '20190131063', '汪益名', '0', '33033416', '2019013', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('418', '20190141064', '程刚', '0', '33033417', '2019014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('419', '20190141065', '蔡林静', '0', '33033418', '2019014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('420', '20190141066', '常慧英', '0', '33033419', '2019014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('421', '20190141067', '叶雨唯', '0', '33033420', '2019014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('422', '20190151068', '于静文', '0', '33033421', '2019015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('423', '20190151069', '昌霖霖', '0', '33033422', '2019015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('424', '20190151070', '昌宁宁', '0', '33033423', '2019015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('425', '20190151071', '汪小畅', '0', '33033424', '2019015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('426', '20190161072', '尤泳俞', '0', '33033425', '2019016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('427', '20190161073', '俞坚', '0', '33033426', '2019016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('428', '20190161074', '于帅', '0', '33033427', '2019016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('429', '20190161075', '曹莉', '0', '33033428', '2019016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('430', '20190161076', '常轩歌', '0', '33033429', '2019016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('431', '20190171077', '常潆', '0', '33033430', '2019017', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('432', '20190171078', '万婷婷', '0', '33033431', '2019017', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('433', '20190171079', '武雅欣', '0', '33033432', '2019017', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('434', '20190181080', '车晴', '0', '33033433', '2019018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('435', '20190181081', '楚桐', '0', '33033434', '2019018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('436', '20190181082', '蔡昊泽', '0', '33033435', '2019018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('437', '20190181083', '曹钰樱', '0', '33033436', '2019018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('438', '20190191084', '程歆迪', '0', '33033437', '2019019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('439', '20190191085', '应榆铭', '0', '33033438', '2019019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('440', '20190191086', '容祖儿', '0', '33033439', '2019019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('441', '20190191087', '蔡泽', '0', '33033440', '2019019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('442', '20190201088', '顽儿', '0', '33033441', '2019020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('443', '20190201089', '阎燚', '0', '33033442', '2019020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('444', '20190201090', '余泽瑞', '0', '33033443', '2019020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('445', '20190201091', '程淇', '0', '33033444', '2019020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('446', '20190211092', '汪畅语', '0', '33033445', '2019021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('447', '20190211093', '蔡子哲', '0', '33033446', '2019021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('448', '20190211094', '程绍珊', '0', '33033447', '2019021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('449', '20190211095', '程庆', '0', '33033448', '2019021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('450', '20190221096', '曹玉花', '0', '33033449', '2019022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('451', '20190221097', '池荆', '0', '33033450', '2019022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('452', '20190221098', '柴华', '0', '33033451', '2019022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('453', '20190221099', '曹钰颖', '0', '33033452', '2019022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('454', '20190231100', '柴艳瑛', '0', '33033453', '2019023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('455', '20190231101', '程立嘉', '0', '33033454', '2019023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('456', '20190231102', '叶金云', '0', '33033455', '2019023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('457', '20190231103', '吴彦捷', '0', '33033456', '2019023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('458', '20190231104', '程琳珊', '0', '33033457', '2019023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('459', '20190241105', '常心雨', '0', '33033458', '2019024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('460', '20190241106', '汪明', '0', '33033459', '2019024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('461', '20190241107', '阎程亮', '0', '33033460', '2019024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('462', '20190241108', '易洋', '0', '33033461', '2019024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('463', '20190241109', '车靓', '0', '33033462', '2019024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('464', '20190251110', '昌连珍', '0', '33033463', '2019025', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('465', '20190251111', '常礼恒', '0', '33033464', '2019025', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('466', '20190251112', '游珺钥', '0', '33033465', '2019025', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('467', '20190261113', '阎寒', '0', '33033466', '2019026', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('468', '20190271114', '蔡妃花', '0', '33033467', '2019027', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('469', '20190281115', '卫蓓蓓', '0', '33033468', '2019028', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('470', '20190291116', '应光泽', '0', '33033469', '2019029', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('471', '20190301117', '常潆', '0', '33033470', '2019030', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('472', '20190311118', '蔡轩哲', '0', '33033471', '2019031', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('473', '20190321119', '昌霖', '0', '33033472', '2019032', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('474', '20190331120', '武建萍', '0', '33033473', '2019033', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('475', '20190341121', '汪洋', '0', '33033474', '2019034', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('476', '20190351122', '芮冰', '0', '33033475', '2019035', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('477', '20190361123', '郁伯庯', '0', '33033476', '2019036', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('478', '20190371124', '昌春兰', '0', '33033477', '2019037', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('479', '20190381125', '蔡皓泽', '0', '33033478', '2019038', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('480', '20190391126', '芮嘉', '0', '33033479', '2019039', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('481', '20190401127', '车云', '0', '33033480', '2019040', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('482', '20190411128', '芮婉莹', '0', '33033481', '2019041', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('483', '20190421129', '芮冰', '0', '33033482', '2019042', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('484', '20190431130', '常星宸', '0', '33033483', '2019043', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('485', '20190441131', '于庚歆', '0', '33033484', '2019044', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('486', '20190451132', '程敬荣', '0', '33033485', '2019045', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('487', '20190461133', '云泓一', '0', '33033486', '2019046', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('488', '20190471134', '尤朝艳', '0', '33033487', '2019047', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('489', '20190481135', '云涛', '0', '33033488', '2019048', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('490', '20190491136', '池砚', '0', '33033489', '2019049', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('491', '20190501137', '云泓壹', '0', '33033490', '2019050', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('492', '20190511138', '车笛', '0', '33033491', '2019051', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('493', '20190521139', '冉担铵', '0', '33033492', '2019052', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('494', '20190531140', '曹莹', '0', '33033493', '2019053', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('495', '20190541141', '池雪', '0', '33033494', '2019054', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('496', '20190551142', '卫小芳', '0', '33033495', '2019055', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('497', '20190561143', '程传垚', '0', '33033496', '2019056', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('498', '20190571144', '王紫翰', '0', '33033497', '2019057', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('499', '20190581145', '常莹仪', '0', '33033498', '2019058', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('500', '20190591146', '楚星', '0', '33033499', '2019059', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('501', '20190601147', '陈镇彬', '0', '33033500', '2019060', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('502', '20190611148', '严晨瑞', '0', '33033501', '2019061', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('503', '20190621149', '魏博冰', '0', '33033502', '2019062', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('504', '20190631150', '宇文党', '0', '33033503', '2019063', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('505', '20190641151', '柴友森', '0', '33033504', '2019064', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('506', '20190651152', '郁丹彤', '0', '33033505', '2019065', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('507', '20190661153', '姚西宁', '0', '33033506', '2019066', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('508', '20190671154', '褚文欣', '0', '33033507', '2019067', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('509', '20190681155', '车竞阳', '0', '33033508', '2019068', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('510', '20190691156', '柴同福', '0', '33033509', '2019069', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('511', '20190701157', '苍红竞', '0', '33033510', '2019070', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('512', '20190711158', '韦怡灵', '0', '33033511', '2019071', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('513', '20190721159', '叶倩钰', '0', '33033512', '2019072', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('514', '20190731160', '卫峙廷', '0', '33033513', '2019073', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('515', '20190741161', '叶朝霞', '0', '33033514', '2019074', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('516', '20190751162', '王畦芎', '0', '33033515', '2019075', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('517', '20190761163', '俞天模', '0', '33033516', '2019076', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('518', '20190771164', '蔡晓', '0', '33033517', '2019077', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('519', '20190781165', '芮可卿', '0', '33033518', '2019078', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('520', '20190791166', '褚虎成', '0', '33033519', '2019079', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('521', '20190801167', '万雨琴', '0', '33033520', '2019080', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('522', '20190811168', '蔡振宇', '0', '33033521', '2019081', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('523', '20190821169', '易轩萱', '0', '33033522', '2019082', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('524', '20190831170', '严佩珊', '0', '33033523', '2019083', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('525', '20190841171', '常圣楠', '0', '33033524', '2019084', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('526', '20190851172', '程立雪', '0', '33033525', '2019085', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('527', '20190861173', '于子涵', '0', '33033526', '2019086', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('528', '20190871174', '颜觉淇', '0', '33033527', '2019087', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('529', '20190881175', '褚顺华', '0', '33033528', '2019088', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('530', '20190891176', '车新', '0', '33033529', '2019089', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('531', '20190901177', '褚云富', '0', '33033530', '2019090', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('532', '20200011001', '楚玥', '0', '33033531', '2020001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('533', '20200011002', '于闻华', '0', '33033532', '2020001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('534', '20200011003', '阎正勇', '0', '33033533', '2020001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('535', '20200011004', '曹锐钊', '0', '33033534', '2020001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('536', '20200011005', '阎帆', '0', '33033535', '2020001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('537', '20200011006', '应泽俊', '0', '33033536', '2020001', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('538', '20200021007', '于涛', '0', '33033537', '2020002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('539', '20200021008', '冉竞珏', '0', '33033538', '2020002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('540', '20200021009', '池利锋', '0', '33033539', '2020002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('541', '20200021010', '颜修洪', '0', '33033540', '2020002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('542', '20200021011', '褚洪宇', '0', '33033541', '2020002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('543', '20200021012', '蔡睿哲', '0', '33033542', '2020002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('544', '20200021013', '芮卿', '0', '33033543', '2020002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('545', '20200021014', '王嘉畦', '0', '33033544', '2020002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('546', '20200021015', '游紫雯', '0', '33033545', '2020002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('547', '20200021016', '叶柯', '0', '33033546', '2020002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('548', '20200021017', '俞放', '0', '33033547', '2020002', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('549', '20200031018', '池历锋', '0', '33033548', '2020003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('550', '20200031019', '尤顺开', '0', '33033549', '2020003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('551', '20200031020', '常潆潆', '0', '33033550', '2020003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('552', '20200031021', '王华英', '0', '33033551', '2020003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('553', '20200031022', '仰灏隽', '0', '33033552', '2020003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('554', '20200031023', '容王珍', '0', '33033553', '2020003', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('555', '20200041024', '池杨', '0', '33033554', '2020004', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('556', '20200041025', '颜丹晨', '0', '33033555', '2020004', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('557', '20200041026', '天啸', '0', '33033556', '2020004', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('558', '20200051027', '常海钰', '0', '33033557', '2020005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('559', '20200051028', '池哲银', '0', '33033558', '2020005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('560', '20200051029', '常潆潆', '0', '33033559', '2020005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('561', '20200051030', '宇文聪化', '0', '33033560', '2020005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('562', '20200051031', '柴光森', '0', '33033561', '2020005', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('563', '20200061032', '楚妍泽', '0', '33033562', '2020006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('564', '20200061033', '云春来', '0', '33033563', '2020006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('565', '20200061034', '车沐蔓', '0', '33033564', '2020006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('566', '20200061035', '应宁', '0', '33033565', '2020006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('567', '20200061036', '乌日', '0', '33033566', '2020006', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('568', '20200071037', '仰剑豪', '0', '33033567', '2020007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('569', '20200071038', '常潆仪', '0', '33033568', '2020007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('570', '20200071039', '常菲杨', '0', '33033569', '2020007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('571', '20200071040', '常超', '0', '33033570', '2020007', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('572', '20200081041', '楚轩', '0', '33033571', '2020008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('573', '20200081042', '常鑫甜', '0', '33033572', '2020008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('574', '20200081043', '蔡适', '0', '33033573', '2020008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('575', '20200081044', '卫炳申', '0', '33033574', '2020008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('576', '20200081045', '吴诗琪', '0', '33033575', '2020008', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('577', '20200091046', '苍思澄', '0', '33033576', '2020009', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('578', '20200091047', '常怡雯', '0', '33033577', '2020009', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('579', '20200101048', '蔡彩霞', '0', '33033578', '2020010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('580', '20200101049', '云飞扬', '0', '33033579', '2020010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('581', '20200101050', '仰宇豪', '0', '33033580', '2020010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('582', '20200101051', '阎格', '0', '33033581', '2020010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('583', '20200101052', '俞孟然', '0', '33033582', '2020010', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('584', '20200111053', '汪道诚', '0', '33033583', '2020011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('585', '20200111054', '于鹏谦', '0', '33033584', '2020011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('586', '20200111055', '应敏', '0', '33033585', '2020011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('587', '20200111056', '阎鹏', '0', '33033586', '2020011', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('588', '20200121057', '尤捷', '0', '33033587', '2020012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('589', '20200121058', '颜琅淇', '0', '33033588', '2020012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('590', '20200121059', '余小德', '0', '33033589', '2020012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('591', '20200121060', '游敏捷', '0', '33033590', '2020012', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('592', '20200131061', '魏羽飞', '0', '33033591', '2020013', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('593', '20200131062', '游鸿明', '0', '33033592', '2020013', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('594', '20200131063', '王行', '0', '33033593', '2020013', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('595', '20200141064', '余远昆', '0', '33033594', '2020014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('596', '20200141065', '楚凯', '0', '33033595', '2020014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('597', '20200141066', '卫铲臣', '0', '33033596', '2020014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('598', '20200141067', '蔡璧霞', '0', '33033597', '2020014', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('599', '20200151068', '常怡澜', '0', '33033598', '2020015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('600', '20200151069', '程玉富', '0', '33033599', '2020015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('601', '20200151070', '云春苓', '0', '33033600', '2020015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('602', '20200151071', '吴灿馨', '0', '33033601', '2020015', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('603', '20200161072', '蔚青雅', '0', '33033602', '2020016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('604', '20200161073', '常佳鸣', '0', '33033603', '2020016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('605', '20200161074', '易明富', '0', '33033604', '2020016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('606', '20200161075', '颜子淇', '0', '33033605', '2020016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('607', '20200161076', '仰沁萱', '0', '33033606', '2020016', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('608', '20200171077', '云翔宇', '0', '33033607', '2020017', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('609', '20200171078', '蔡晨烜', '0', '33033608', '2020017', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('610', '20200171079', '程卫星', '0', '33033609', '2020017', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('611', '20200181080', '阎振强', '0', '33033610', '2020018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('612', '20200181081', '曹敬平', '0', '33033611', '2020018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('613', '20200181082', '曹海', '0', '33033612', '2020018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('614', '20200181083', '温柯彤', '0', '33033613', '2020018', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('615', '20200191084', '楚浩:', '0', '33033614', '2020019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('616', '20200191085', '于文桦', '0', '33033615', '2020019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('617', '20200191086', '易金莲', '0', '33033616', '2020019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('618', '20200191087', '魏源', '0', '33033617', '2020019', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('619', '20200201088', '褚小六', '0', '33033618', '2020020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('620', '20200201089', '楚哲', '0', '33033619', '2020020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('621', '20200201090', '褚健', '0', '33033620', '2020020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('622', '20200201091', '芮渝萍', '0', '33033621', '2020020', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('623', '20200211092', '卫华', '0', '33033622', '2020021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('624', '20200211093', '曹丽娟', '0', '33033623', '2020021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('625', '20200211094', '易大攸', '0', '33033624', '2020021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('626', '20200211095', '常滢', '0', '33033625', '2020021', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('627', '20200221096', '池钰', '0', '33033626', '2020022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('628', '20200221097', '常书婷', '0', '33033627', '2020022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('629', '20200221098', '俞晶云', '0', '33033628', '2020022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('630', '20200221099', '温豕稀', '0', '33033629', '2020022', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('631', '20200231100', '万震宇', '0', '33033630', '2020023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('632', '20200231101', '严四风', '0', '33033631', '2020023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('633', '20200231102', '阎子钧', '0', '33033632', '2020023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('634', '20200231103', '温乐彤', '0', '33033633', '2020023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('635', '20200231104', '王紫涵', '0', '33033634', '2020023', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('636', '20200241105', '余文椁', '0', '33033635', '2020024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('637', '20200241106', '蔚明静', '0', '33033636', '2020024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('638', '20200241107', '韦霖', '0', '33033637', '2020024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('639', '20200241108', '芮阳', '0', '33033638', '2020024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('640', '20200241109', '王治函', '0', '33033639', '2020024', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('641', '20200251110', '珏琦', '0', '33033640', '2020025', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('642', '20200251111', '游羽茜', '0', '33033641', '2020025', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('643', '20200251112', '吴彦琛', '0', '33033642', '2020025', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('644', '20200261113', '乌莉莉', '0', '33033643', '2020026', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('645', '20200271114', '冉偲陈', '0', '33033644', '2020027', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('646', '20200281115', '仰珩玉', '0', '33033645', '2020028', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('647', '20200291116', '颜春艳', '0', '33033646', '2020029', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('648', '20200301117', '蔡春兄', '0', '33033647', '2020030', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('649', '20200311118', '温蔓彤', '0', '33033648', '2020031', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('650', '20200321119', '楚韦', '0', '33033649', '2020032', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('651', '20200331120', '严建淳', '0', '33033650', '2020033', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('652', '20200341121', '姚雨婕', '0', '33033651', '2020034', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('653', '20200351122', '王亚军', '0', '33033652', '2020035', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('654', '20200361123', '温琦琦', '0', '33033653', '2020036', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('655', '20200371124', '王莎莎', '0', '33033654', '2020037', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('656', '20200381125', '万佳雨', '0', '33033655', '2020038', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('657', '20200391126', '褚家瑞', '0', '33033656', '2020039', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('658', '20200401127', '褚浩泽', '0', '33033657', '2020040', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('659', '20200411128', '冉打二', '0', '33033658', '2020041', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('660', '20200421129', '蔡景熙', '0', '33033659', '2020042', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('661', '20200431130', '易仕岚', '0', '33033660', '2020043', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('662', '20200441131', '苍浩', '0', '33033661', '2020044', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('663', '20200451132', '程绣娟', '0', '33033662', '2020045', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('664', '20200461133', '于智旭', '0', '33033663', '2020046', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('665', '20200471134', '昌倪', '0', '33033664', '2020047', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('666', '20200481135', '余飞燕', '0', '33033665', '2020048', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('667', '20200491136', '郁祉霖', '0', '33033666', '2020049', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('668', '20200501137', '郁家宁', '0', '33033667', '2020050', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('669', '20200511138', '云耕', '0', '33033668', '2020051', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('670', '20200521139', '冉偲铵', '0', '33033669', '2020052', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('671', '20200531140', '蔡清华', '0', '33033670', '2020053', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('672', '20200541141', '应佳雯', '0', '33033671', '2020054', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('673', '20200551142', '郁金淼', '0', '33033672', '2020055', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('674', '20200561143', '常爱琴', '0', '33033673', '2020056', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('675', '20200571144', '武玥玚', '0', '33033674', '2020057', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('676', '20200581145', '俞诞生', '0', '33033675', '2020058', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('677', '20200591146', '常恒礼', '0', '33033676', '2020059', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('678', '20200601147', '尤声', '0', '33033677', '2020060', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('679', '20200611148', '王婧懿', '0', '33033678', '2020061', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('680', '20200621149', '车明栌', '0', '33033679', '2020062', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('681', '20200631150', '阎伟然', '0', '33033680', '2020063', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('682', '20200641151', '卫铧', '0', '33033681', '2020064', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('683', '20200651152', '云中飞', '0', '33033682', '2020065', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('684', '20200661153', '昌伟', '0', '33033683', '2020066', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('685', '20200671154', '尤瑞德', '0', '33033684', '2020067', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('686', '20200681155', '楚皓', '0', '33033685', '2020068', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('687', '20200691156', '蔡轩昂', '0', '33033686', '2020069', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('688', '20200701157', '蔚明雨', '0', '33033687', '2020070', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('689', '20200711158', '王海英', '0', '33033688', '2020071', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('690', '20200721159', '褚水桥', '0', '33033689', '2020072', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('691', '20200731160', '车婷', '0', '33033690', '2020073', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('692', '20200741161', '易继明', '0', '33033691', '2020074', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('693', '20200751162', '苍灏梁', '0', '33033692', '2020075', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('694', '20200761163', '易明仕', '0', '33033693', '2020076', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('695', '20200771164', '于在海', '0', '33033694', '2020077', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('696', '20200781165', '常心雨', '0', '33033695', '2020078', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('697', '20200791166', '武军', '0', '33033696', '2020079', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('698', '20200801167', '蔡旭泽', '0', '33033697', '2020080', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('699', '20200811168', '于洋', '0', '33033698', '2020081', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('700', '20200821169', '车博', '0', '33033699', '2020082', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('701', '20200831170', '郁雷', '0', '33033700', '2020083', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('702', '20200841171', '吴美兴', '0', '33033701', '2020084', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('703', '20200851172', '郁思贤', '0', '33033702', '2020085', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('704', '20200861173', '宇文城', '0', '33033703', '2020086', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('705', '20200871174', '韦月清', '0', '33033704', '2020087', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('706', '20200881175', '尹赫宁', '0', '33033705', '2020088', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('707', '20200891176', '易潇雄', '0', '33033706', '2020089', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');
INSERT INTO `student` VALUES ('708', '20200901177', '叶童童', '0', '33033707', '2020090', '汉族', '0', null, '1999-08-14 00:00:00', '1', '', '', '1');

-- ----------------------------
-- Table structure for sys_parameters
-- ----------------------------
DROP TABLE IF EXISTS `sys_parameters`;
CREATE TABLE `sys_parameters` (
  `param_id` int NOT NULL AUTO_INCREMENT,
  `param_value` varchar(64) NOT NULL,
  `param_name` varchar(64) DEFAULT NULL,
  `param_desc` varchar(255) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `creator_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(1024) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_parameters
-- ----------------------------
INSERT INTO `sys_parameters` VALUES ('1', '2017', '2017级', 'Grade', '1', '2020-10-26 15:28:20', null, '1');
INSERT INTO `sys_parameters` VALUES ('2', '2018', '2018级', 'Grade', '1', '2020-10-26 15:29:04', null, '1');
INSERT INTO `sys_parameters` VALUES ('3', '2019', '2019级', 'Grade', '1', '2020-10-26 15:29:24', null, '1');
INSERT INTO `sys_parameters` VALUES ('4', '2020', '2020级', 'Grade', '1', '2020-10-26 15:29:41', null, '1');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(16) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `sex` varchar(8) DEFAULT NULL,
  `identity_code` varchar(48) DEFAULT NULL,
  `dept_code` varchar(16) DEFAULT NULL,
  `nation` varchar(32) DEFAULT NULL,
  `politics` varchar(16) DEFAULT NULL,
  `birth_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `address` varchar(255) DEFAULT NULL,
  `user_code` varchar(32) DEFAULT NULL,
  `status` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', 'ailun', '艾伦', '0', null, '1-8', '汉族', null, '2021-04-20 14:51:08', null, 'ailun', '1');
INSERT INTO `teacher` VALUES ('2', 'yehui', '叶慧', '1', null, '3-20', null, null, '2021-04-22 16:42:53', null, 'yehui', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `user_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `user_pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_nickname` varchar(32) DEFAULT NULL COMMENT '用户昵称',
  `user_name` varchar(32) DEFAULT NULL COMMENT '用户姓名',
  `user_email` varchar(32) DEFAULT NULL COMMENT '用户邮箱',
  `user_tel` varchar(32) DEFAULT NULL COMMENT '用户电话',
  `status` varchar(8) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'admin', '45590ccf662977ae789a07b1833fd9b3', null, null, '管理员', '1791289550@qq.com', '17376552318', '1');
INSERT INTO `user` VALUES ('24', 'ailun', '45590ccf662977ae789a07b1833fd9b3', null, null, '艾伦', 'isailun@gmail.com', '17376552318', '1');
INSERT INTO `user` VALUES ('38', 'abc', 'a5390098f12938930e690531bbe6ce8d', null, null, 'abc', 'isailun@gmail.com', '17376552318', '1');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role_code` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', 'admin', '0');
INSERT INTO `user_role` VALUES ('2', 'ailun', '01');
INSERT INTO `user_role` VALUES ('4', 'abc', '9999');

-- ----------------------------
-- Procedure structure for setRand
-- ----------------------------
DROP PROCEDURE IF EXISTS `setRand`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setRand`()
BEGIN 
	declare ran int;
	declare i int;
	set i = 1;
	WHILE i<=864 DO
		set ran =FLOOR(RAND()*10)+1;
		CASE ran
			WHEN 9
			THEN UPDATE room set have_microphone = '9' WHERE id = i;
			WHEN 10
			THEN UPDATE room set have_microphone = '0' WHERE id = i;
			ELSE UPDATE room set have_microphone = '1' WHERE id = i;
		END CASE;
		set i = i+1;
	END WHILE ;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t1_order_room`;
DELIMITER ;;
CREATE TRIGGER `t1_order_room` BEFORE INSERT ON `order_room` FOR EACH ROW BEGIN  
SET new.week_time = DAYOFWEEK(new.date_time);
END
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
