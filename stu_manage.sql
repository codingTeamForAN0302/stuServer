/*
 Navicat MySQL Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : stu_manage

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 18/06/2018 22:31:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` int(11) NOT NULL,
  `classname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名',
  `major_id` int(11) DEFAULT NULL COMMENT '所属专业',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '1', 1);
INSERT INTO `class` VALUES (2, '2', 1);
INSERT INTO `class` VALUES (3, '1', 2);
INSERT INTO `class` VALUES (4, '2', 2);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '课程名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '高等数学');
INSERT INTO `course` VALUES (2, '大学物理');
INSERT INTO `course` VALUES (3, '软件工程');
INSERT INTO `course` VALUES (4, 'java开发实践');
INSERT INTO `course` VALUES (5, '大学英语综合');
INSERT INTO `course` VALUES (6, '英语翻译');
INSERT INTO `course` VALUES (7, '俄语文学');
INSERT INTO `course` VALUES (8, 'c语言开发实践');
INSERT INTO `course` VALUES (9, '软件测试');
INSERT INTO `course` VALUES (10, '毛泽东思想理论体系');
INSERT INTO `course` VALUES (11, '马克思主义概论');
INSERT INTO `course` VALUES (12, '线性代数');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `id` int(11) NOT NULL,
  `major_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '专业名称',
  `pid` int(11) DEFAULT 0 COMMENT '所属大类 0代表是顶级分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '软件工程', 6);
INSERT INTO `major` VALUES (2, '物联网', 6);
INSERT INTO `major` VALUES (3, '计算机科学', 6);
INSERT INTO `major` VALUES (4, '智能化', 6);
INSERT INTO `major` VALUES (5, '网络工程', 6);
INSERT INTO `major` VALUES (6, '信息技术学院', 0);
INSERT INTO `major` VALUES (7, '外国语学院', 0);
INSERT INTO `major` VALUES (8, '德语', 7);
INSERT INTO `major` VALUES (9, '商务英语', 7);
INSERT INTO `major` VALUES (10, '英语翻译', 7);
INSERT INTO `major` VALUES (11, '俄语文学', 7);
INSERT INTO `major` VALUES (12, '机电学院', 0);
INSERT INTO `major` VALUES (13, '自动化工程', 12);
INSERT INTO `major` VALUES (14, '数字智能控制', 12);
INSERT INTO `major` VALUES (15, '机械制造', 12);
INSERT INTO `major` VALUES (16, '模具设计制造', 12);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `id` int(11) NOT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '分数',
  `make_up_mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '补考成绩',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (1, 1, 1, 3, '95', NULL);
INSERT INTO `record` VALUES (2, 1, 2, 3, '99', NULL);
INSERT INTO `record` VALUES (3, 2, 3, 3, '80', NULL);
INSERT INTO `record` VALUES (4, 2, 4, 4, '85', NULL);
INSERT INTO `record` VALUES (5, 3, 5, 2, '69', NULL);
INSERT INTO `record` VALUES (6, 3, 4, 2, '78', NULL);
INSERT INTO `record` VALUES (7, 4, 2, 2, '79', NULL);
INSERT INTO `record` VALUES (8, 4, 3, 1, '89', NULL);
INSERT INTO `record` VALUES (9, 5, 1, 2, '64', NULL);
INSERT INTO `record` VALUES (10, 5, 5, 3, '99', NULL);
INSERT INTO `record` VALUES (11, 6, 6, 3, '87', NULL);
INSERT INTO `record` VALUES (12, 6, 1, 1, '75', NULL);
INSERT INTO `record` VALUES (13, 8, 2, 2, '69', NULL);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL COMMENT '所在班级编号',
  `sex` tinyint(4) DEFAULT 1 COMMENT '1男 2女',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '姜晓柳', 21, 1, 2, '1.jpg');
INSERT INTO `student` VALUES (2, '林友梅', 22, 1, 2, '2.jpg');
INSERT INTO `student` VALUES (3, '吴天峰', 22, 1, 1, '3.jpg');
INSERT INTO `student` VALUES (4, '谷林语', 20, 1, 1, '4.jpg');
INSERT INTO `student` VALUES (5, '蔡穗丽', 20, 2, 2, '5.jpg');
INSERT INTO `student` VALUES (6, '赵涵', 21, 2, 2, '6.jpg');
INSERT INTO `student` VALUES (14, '删除测试', 22, 2, 1, '1');
INSERT INTO `student` VALUES (8, '白冰冰', 21, 2, 2, '8.jpg');
INSERT INTO `student` VALUES (9, '钱继峰', 21, 3, 1, '9.jpg');
INSERT INTO `student` VALUES (10, '任翔', 20, 3, 1, '10.jpg');
INSERT INTO `student` VALUES (11, '赵德军', 22, 3, 1, '11.jpg');

-- ----------------------------
-- Table structure for term
-- ----------------------------
DROP TABLE IF EXISTS `term`;
CREATE TABLE `term`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '学期名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of term
-- ----------------------------
INSERT INTO `term` VALUES (1, '大一上');
INSERT INTO `term` VALUES (2, '大一下');
INSERT INTO `term` VALUES (3, '大二上');
INSERT INTO `term` VALUES (4, '大二下');
INSERT INTO `term` VALUES (5, '大三上');
INSERT INTO `term` VALUES (6, '大三下');
INSERT INTO `term` VALUES (7, '大四上');
INSERT INTO `term` VALUES (8, '大四下');

SET FOREIGN_KEY_CHECKS = 1;
