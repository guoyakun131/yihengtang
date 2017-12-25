/*
Navicat MySQL Data Transfer

Source Server         : localhost_3303
Source Server Version : 50717
Source Host           : localhost:3303
Source Database       : yihengtang

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-25 17:59:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(30) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '刘备', '131310');

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `details` varchar(255) DEFAULT NULL COMMENT '标题',
  `time` date DEFAULT NULL,
  `fabulousInt` int(11) unsigned DEFAULT '0' COMMENT '点赞数量',
  `browseInt` int(11) unsigned DEFAULT '0' COMMENT '浏览数据量',
  `img` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `type` varchar(255) DEFAULT NULL COMMENT '文章类型',
  `text` varchar(255) DEFAULT NULL COMMENT '图文',
  `author` varchar(20) DEFAULT NULL COMMENT '作者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('1', '专家提示刚烧开的水不能引用', '2017-12-25', '11', '23', 'https://liangyi120.xin/images/yisheng1.jpg', '1', '<p>我爱你刘备<img alt=\"\" src=\"/apple.jpg\"></img></p>', '刘备');
INSERT INTO `articles` VALUES ('2', '多喝水睡眠足', '2017-12-25', '113', '225', 'https://liangyi120.xin/images/yisheng2.jpg', '1', '假数据假数据假数据假数据假数据假数据s', '张飞');
INSERT INTO `articles` VALUES ('3', '每天坚持跑步', '2017-12-25', '11', '21', 'https://liangyi120.xin/images/yisheng3.jpg', '2', '假数据假数据假数据假数据假数据假数据假数据', '关于');
INSERT INTO `articles` VALUES ('4', '适当运动', '2017-12-25', '11', '29', 'https://liangyi120.xin/images/yisheng4.jpg', '2', '假数据假数据假数据假数据假数据假数据假数据', null);
INSERT INTO `articles` VALUES ('6', '饭后', '2017-12-25', '112', '28', 'https://liangyi120.xin/images/yisheng5.jpg', '3', '假数据假数据假数据假数据假数据假数据', null);
INSERT INTO `articles` VALUES ('7', '专家提示刚烧开的水不能引用', '2017-12-25', '123', '22', 'https://liangyi120.xin/images/yisheng6.jpg', '3', '假数据假数据假数据假数据', null);
INSERT INTO `articles` VALUES ('8', '专家提示刚烧开的水不能引用', '2017-12-25', '43', '221', 'https://liangyi120.xin/images/yisheng7.jpg', '4', '假数据假数据', null);
INSERT INTO `articles` VALUES ('29', '饭前一根烟', '2017-12-25', '0', '0', 'https://liangyi120.xin/微信图片_20171215172724.jpg', '1', '<p style=\"text-align: center;\"><span style=\"font-size: 24px;\">奥术大师</span></p><h1><span style=\"font-size: 24px;\">我的老家就在这里</span></h1><p><span style=\"font-size: 24px;\">你在了啊<br/></span></p>', '刘备');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(255) DEFAULT NULL COMMENT '科室名',
  `experts_id` int(11) DEFAULT NULL COMMENT '关联的医生Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '心脏科', '1');
INSERT INTO `department` VALUES ('2', '呼吸科', '2');
INSERT INTO `department` VALUES ('3', '儿科', '3');
INSERT INTO `department` VALUES ('4', '消化科', '4');
INSERT INTO `department` VALUES ('5', '骨科', '5');
INSERT INTO `department` VALUES ('6', '五官科', '6');
INSERT INTO `department` VALUES ('7', '耳鼻喉科', '7');
INSERT INTO `department` VALUES ('8', '康复科', '8');
INSERT INTO `department` VALUES ('9', '肿瘤科', '9');
INSERT INTO `department` VALUES ('10', '皮肤科', '10');
INSERT INTO `department` VALUES ('11', '妇科', '11');

-- ----------------------------
-- Table structure for disease
-- ----------------------------
DROP TABLE IF EXISTS `disease`;
CREATE TABLE `disease` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diseaseName` varchar(255) DEFAULT NULL COMMENT '疾病名称',
  `experts_id` int(11) DEFAULT NULL COMMENT '关联医生id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of disease
-- ----------------------------
INSERT INTO `disease` VALUES ('1', '冠心病', '1');

-- ----------------------------
-- Table structure for experts
-- ----------------------------
DROP TABLE IF EXISTS `experts`;
CREATE TABLE `experts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '专家姓名',
  `gender` varchar(255) DEFAULT NULL COMMENT '专家性别',
  `position` varchar(255) DEFAULT NULL COMMENT '职位例如：主治医师、教授',
  `profile` varchar(255) DEFAULT NULL COMMENT ' 简介',
  `profiles` varchar(255) DEFAULT NULL COMMENT '详细简介',
  `kanzhenshijian` varchar(255) DEFAULT NULL COMMENT '看诊时间',
  `location` varchar(255) DEFAULT NULL COMMENT '就诊地点',
  `locations` varchar(255) DEFAULT NULL COMMENT '就诊详细地点',
  `amount` decimal(10,0) DEFAULT NULL COMMENT '就诊金额',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  `diseae_id` int(11) DEFAULT NULL COMMENT '疾病id',
  `department_id` int(11) DEFAULT NULL COMMENT '科室id',
  `quantity` int(255) DEFAULT NULL COMMENT '诊断舒数量',
  `u_id` int(11) DEFAULT NULL COMMENT '用户id',
  `numberOfPatients` int(11) NOT NULL,
  `addtime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of experts
-- ----------------------------
INSERT INTO `experts` VALUES ('1', '钱德英', '女', '教授，主任医师', '广东省人民医院资深主任', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', '10010', '', '1', '1', '12', '1', '1', null);
INSERT INTO `experts` VALUES ('2', '黄大年', '男', '教授', '广东省人民医院资深主任', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', '3400', '', '1', '2', '3', '2', '0', null);
INSERT INTO `experts` VALUES ('3', '刘备', '男', '教授', '广东省人民医院资深主任', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', '3400', '', '1', '1', '3', '2', '0', null);
INSERT INTO `experts` VALUES ('4', '张飞', '男', '教授', '广东省人民医院资深主任', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', '3400', '', '1', '1', '3', '1', '0', null);
INSERT INTO `experts` VALUES ('5', '李思思', '男', '教授', '广东省人民医院资深主任', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', '3400', '', '1', '1', '32', '1', '0', null);
INSERT INTO `experts` VALUES ('6', '王五', '男', '教授', '广东省人民医院资深主任', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', '3400', '', '1', '6', '3', '2', '0', null);
INSERT INTO `experts` VALUES ('7', '赵六', '男', '教授', '硕士研究生导师。1985年毕业', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', '3400', '', '1', '7', '331', '2', '0', null);
INSERT INTO `experts` VALUES ('8', '赵武', '男', '教授', '硕士研究生导师。1985年毕业', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', '3400', '', '1', '8', '3', '2', '0', null);
INSERT INTO `experts` VALUES ('9', '李佳', '男', '教授', '硕士研究生导师。1985年毕业。', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', '3400', '', '1', '9', '12', '2', '0', null);
INSERT INTO `experts` VALUES ('10', '吴燕', '男', '教授', '硕士研究生导师。1985年毕业', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', '3400', '', '1', '10', '323', '2', '0', null);
INSERT INTO `experts` VALUES ('11', '王陆强', '男', '教授', '硕士研究生导师。1985年毕业', '硕士研究生导师。1985年毕业于河南医科大学医疗系，现任河南省人民医院骨科主任、河南省关节外科治疗中心主任。', '周二、周四', '海淀区人民医院', '北京市海淀区人民医院A座10楼512室门诊部', '3400', '', '1', '11', '3', '2', '0', null);

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(255) DEFAULT NULL,
  `state` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of img
-- ----------------------------
INSERT INTO `img` VALUES ('1', 'http://img04.tooopen.com/images/20130712/tooopen_17270713.jpg', '1');
INSERT INTO `img` VALUES ('2', 'http://img04.tooopen.com/images/20130617/tooopen_21241404.jpg', '1');
INSERT INTO `img` VALUES ('3', 'http://img04.tooopen.com/images/20130701/tooopen_20083555.jpg', '1');
INSERT INTO `img` VALUES ('4', 'https://liangyi120.xin/images/yisheng2.jpg', '1');
INSERT INTO `img` VALUES ('5', 'https://liangyi120.xin/images/yisheng3.jpg', '0');
INSERT INTO `img` VALUES ('6', 'https://liangyi120.xin/apple.jpg', '0');
INSERT INTO `img` VALUES ('10', 'https://liangyi120.xin/apple.jpg', '0');
INSERT INTO `img` VALUES ('11', 'https://liangyi120.xin/logo.jpg', '0');

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL COMMENT '通知消息',
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notification
-- ----------------------------
INSERT INTO `notification` VALUES ('1', '您预约王医生请明日下午就诊', '1');
INSERT INTO `notification` VALUES ('2', '请今日下午就诊', '1');

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `e_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `treatmenttTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES ('1', '1', '1', '0', '');
INSERT INTO `reservation` VALUES ('2', '2', '1', '1', '2017年12月4下午');
INSERT INTO `reservation` VALUES ('3', '2', '1', '0', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `openid` varchar(255) DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  `openiAndsessionKey` varchar(255) DEFAULT NULL,
  `reservation_id` int(255) DEFAULT NULL COMMENT '预约',
  `notification_id` int(11) DEFAULT NULL,
  `phoneNumber` varchar(16) DEFAULT NULL COMMENT '用户手机号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKmPYSpEgwabMYZFJ0mGjmiaGdHZlQ2Lky7AkITBZmYjcUxkExcyadHmZWiclAJ8PVgJZHGfhNTsd0A/0', '^o^', '2017-12-25 17:47:38', 'on0sC0e3BtYMER4dOJGMMjIz7-F', '7bb1a563-564b-4a15-94f3-46e1592d505b', 'on0sC0e3BtYMER4dOJGMMjIz7-Fg5dnYq1+8iEgI4/iZecGQwQ==', '1', '1', '');
INSERT INTO `user` VALUES ('2', null, null, null, '1212', null, null, '2', null, null);
INSERT INTO `user` VALUES ('7', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKmPYSpEgwabMYZFJ0mGjmiaGdHZlQ2Lky7AkITBZmYjcUxkExcyadHmZWiclAJ8PVgJZHGfhNTsd0A/0', '^o^', '2017-12-25 17:49:29', 'on0sC0e3BtYMER4dOJGMMjIz7-Fg', 'a2c09350-61a3-426f-b76b-de2103ddee59', 'on0sC0e3BtYMER4dOJGMMjIz7-FgfW3IlOQMknq4PHxXnahQTA==', null, null, null);
