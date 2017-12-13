/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3303
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3303
 Source Schema         : yihengtang

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 13/12/2017 17:54:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章发布时间',
  `fabulousInt` int(255) DEFAULT NULL COMMENT '点赞数量',
  `browseInt` int(11) DEFAULT NULL COMMENT '浏览数据量',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片地址',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章类型',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图文',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '作者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES (1, '专家提示刚烧开的水不能引用', '2017-11-24', 11, 23, 'https://liangyi120.xin/images/yisheng1.jpg', '1', '假数据假数据假数据假数据假 <image src=\'{{img}}\'></image>数据假数据假数据假数据假数据假数据假数据假数据假数据', '刘备');
INSERT INTO `articles` VALUES (2, '多喝水睡眠足', '2017-11-24', 113, 225, 'https://liangyi120.xin/images/yisheng2.jpg', '1', '假数据假数据假数据假数据假数据假数据s', '张飞');
INSERT INTO `articles` VALUES (3, '每天坚持跑步', '2017-11-24', 11, 21, 'https://liangyi120.xin/images/yisheng3.jpg', '2', '假数据假数据假数据假数据假数据假数据假数据', '关于');
INSERT INTO `articles` VALUES (4, '适当运动', '2017-11-24', 11, 29, 'https://liangyi120.xin/images/yisheng4.jpg', '2', '假数据假数据假数据假数据假数据假数据假数据', NULL);
INSERT INTO `articles` VALUES (6, '饭后', '2017-11-24', 112, 28, 'https://liangyi120.xin/images/yisheng5.jpg', '3', '假数据假数据假数据假数据假数据假数据', NULL);
INSERT INTO `articles` VALUES (7, '专家提示刚烧开的水不能引用', '2017-11-24', 123, 22, 'https://liangyi120.xin/images/yisheng6.jpg', '3', '假数据假数据假数据假数据', NULL);
INSERT INTO `articles` VALUES (8, '专家提示刚烧开的水不能引用', '2017-11-24', 43, 221, 'https://liangyi120.xin/images/yisheng7.jpg', '4', '假数据假数据', NULL);
INSERT INTO `articles` VALUES (9, '专家提示刚烧开的水不能引用', '2017-11-24', 14, 422, 'https://liangyi120.xin/images/yisheng8.jpg', '4', NULL, NULL);
INSERT INTO `articles` VALUES (10, '专家提示刚烧开的水不能引用', '2017-11-24', 18, 20, 'https://liangyi120.xin/images/yisheng9.jpg', '5', NULL, NULL);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '科室名',
  `experts_id` int(11) DEFAULT NULL COMMENT '关联的医生Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '心脏科', 1);
INSERT INTO `department` VALUES (2, '呼吸科', 2);
INSERT INTO `department` VALUES (3, '儿科', 3);
INSERT INTO `department` VALUES (4, '消化科', 4);
INSERT INTO `department` VALUES (5, '骨科', 5);
INSERT INTO `department` VALUES (6, '五官科', 6);
INSERT INTO `department` VALUES (7, '耳鼻喉科', 7);
INSERT INTO `department` VALUES (8, '康复科', 8);
INSERT INTO `department` VALUES (9, '肿瘤科', 9);
INSERT INTO `department` VALUES (10, '皮肤科', 10);
INSERT INTO `department` VALUES (11, '妇科', 11);

-- ----------------------------
-- Table structure for disease
-- ----------------------------
DROP TABLE IF EXISTS `disease`;
CREATE TABLE `disease`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diseaseName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '疾病名称',
  `experts_id` int(11) DEFAULT NULL COMMENT '关联医生id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of disease
-- ----------------------------
INSERT INTO `disease` VALUES (1, '冠心病', 1);

-- ----------------------------
-- Table structure for experts
-- ----------------------------
DROP TABLE IF EXISTS `experts`;
CREATE TABLE `experts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '专家姓名',
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '专家性别',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位例如：主治医师、教授',
  `profile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT ' 简介',
  `profiles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详细简介',
  `kanzhenshijian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '看诊时间',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '就诊地点',
  `locations` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '就诊详细地点',
  `amount` decimal(10, 0) DEFAULT NULL COMMENT '就诊金额',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
  `diseae_id` int(11) DEFAULT NULL COMMENT '疾病id',
  `department_id` int(11) DEFAULT NULL COMMENT '科室id',
  `quantity` int(255) DEFAULT NULL COMMENT '诊断舒数量',
  `u_id` int(11) DEFAULT NULL COMMENT '用户id',
  `numberOfPatients` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of experts
-- ----------------------------
INSERT INTO `experts` VALUES (1, '钱德英', '女', '教授，主任医师', '广东省人民医院资深主任', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', 10010, '', 1, 1, 12, 1, 1);
INSERT INTO `experts` VALUES (2, '黄大年', '男', '教授', '广东省人民医院资深主任', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', 3400, '', 1, 2, 3, 2, 0);
INSERT INTO `experts` VALUES (3, '刘备', '男', '教授', '广东省人民医院资深主任', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', 3400, '', 1, 1, 3, 2, 0);
INSERT INTO `experts` VALUES (4, '张飞', '男', '教授', '广东省人民医院资深主任', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', 3400, '', 1, 1, 3, 1, 0);
INSERT INTO `experts` VALUES (5, '李思思', '男', '教授', '广东省人民医院资深主任', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', 3400, '', 1, 1, 32, 1, 0);
INSERT INTO `experts` VALUES (6, '王五', '男', '教授', '广东省人民医院资深主任', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', 3400, '', 1, 6, 3, 2, 0);
INSERT INTO `experts` VALUES (7, '赵六', '男', '教授', '硕士研究生导师。1985年毕业', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', 3400, '', 1, 7, 331, 2, 0);
INSERT INTO `experts` VALUES (8, '赵武', '男', '教授', '硕士研究生导师。1985年毕业', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', 3400, '', 1, 8, 3, 2, 0);
INSERT INTO `experts` VALUES (9, '李佳', '男', '教授', '硕士研究生导师。1985年毕业。', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', 3400, '', 1, 9, 12, 2, 0);
INSERT INTO `experts` VALUES (10, '吴燕', '男', '教授', '硕士研究生导师。1985年毕业', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', 3400, '', 1, 10, 323, 2, 0);
INSERT INTO `experts` VALUES (11, '王陆强', '男', '教授', '硕士研究生导师。1985年毕业', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', 3400, '', 1, 11, 3, 2, 0);

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '通知消息',
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notification
-- ----------------------------
INSERT INTO `notification` VALUES (1, '您预约王医生请明日下午就诊', 1);
INSERT INTO `notification` VALUES (2, '请今日下午就诊', 1);

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `e_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `treatmenttTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES (1, 1, 1, 0, '');
INSERT INTO `reservation` VALUES (2, 2, 1, 1, '2017年12月4下午');
INSERT INTO `reservation` VALUES (3, 2, 1, 0, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `session` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `openiAndsessionKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reservation_id` int(255) DEFAULT NULL COMMENT '预约',
  `notification_id` int(11) DEFAULT NULL,
  `phoneNumber` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户手机号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'on0sC0e3BtYMER4dOJGMMjIz7-Fg', '2102b180-89d2-4197-9bb2-c510965da53c', 'on0sC0e3BtYMER4dOJGMMjIz7-FgagyeyyvzgwlOLEwktwKCIw==', 1, 1, '');
INSERT INTO `user` VALUES (2, '1212', NULL, NULL, 2, NULL, NULL);
INSERT INTO `user` VALUES (3, 'on0sC0QtEU4y1Ejg4evU-xcI8dBQ', 'c96307f4-7df1-438b-9706-3f5b001b5b71', 'on0sC0QtEU4y1Ejg4evU-xcI8dBQxIcFRtDgSbXFY9f+xpKGUQ==', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
