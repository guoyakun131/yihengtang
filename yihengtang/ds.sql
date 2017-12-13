/*
 Navicat Premium Data Transfer

 Source Server         : QQ
 Source Server Type    : MySQL
 Source Server Version : 50556
 Source Host           : 47.95.123.57:3306
 Source Schema         : ds

 Target Server Type    : MySQL
 Target Server Version : 50556
 File Encoding         : 65001

 Date: 12/12/2017 16:46:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人姓名',
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '市',
  `dis` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '详细地址',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮政编码',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `sel` tinyint(1) DEFAULT 0 COMMENT '0 未选中 1 选中',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收货地址表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 3, '朱先生', '18364175363', '山东省', '泰安市', '岱岳区', '泰山公馆', '9916', 1503243590, 0);
INSERT INTO `address` VALUES (2, 4, '朱先生1', '18364175000', NULL, NULL, NULL, '山东省泰安市清真寺小区', '9999', 1503978599, 1);
INSERT INTO `address` VALUES (3, 4, '123', '123', NULL, NULL, NULL, '123', '123', 1503714698, 0);
INSERT INTO `address` VALUES (4, 4, '996', '18366666666', NULL, NULL, NULL, '123', '321', 1503714939, 0);
INSERT INTO `address` VALUES (5, 4, '123', '321', NULL, NULL, NULL, '123', '312', 1503975609, 0);
INSERT INTO `address` VALUES (7, 4, '111', '1111111111', NULL, NULL, NULL, 'dddddddd', 'eeeeeeee', 1503978897, 0);
INSERT INTO `address` VALUES (11, 7, '连方同', '45652925316', '广东省', '广州市', '海珠区', '淄博', '154125', 1504337213, 1);
INSERT INTO `address` VALUES (13, 10, '朱先生', '18364175363', '广东省', '广州市', '海珠区', '山东省泰安市', '9916', 1505295421, 1);
INSERT INTO `address` VALUES (15, 9, '连方同', '15652925316', '山东省', '淄博市', '临淄区', '临淄区', '255400', 1505704310, 1);
INSERT INTO `address` VALUES (16, 9, '张三', '15652925316', '广东省', '广州市', '海珠区', '珠海', '255400', 1505704507, 0);
INSERT INTO `address` VALUES (17, 16, '王俊', '13683304008', '河北省', '邯郸市', '丛台区', '邯郸市丛台区十一中学', '056002', 1508225361, 1);
INSERT INTO `address` VALUES (18, 14, '汪先生', '13932014097', '河北省', '石家庄市', '长安区', '长安路321号', '060000', 1508246220, 0);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456', '管理员大人');
INSERT INTO `admin` VALUES (2, 'admin1', '111111', '哈哈哈');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `spec` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规格',
  `nums` int(5) DEFAULT NULL COMMENT '用户ID',
  `add_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购物车' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (8, 4, 4, '云南产', 1, 1503911759);
INSERT INTO `cart` VALUES (11, 4, 4, '香港产', 1, 1503912324);
INSERT INTO `cart` VALUES (18, 4, 5, '仙琚', 5, 1503917246);
INSERT INTO `cart` VALUES (59, 4, 5, '启悦', 1, 1503986536);
INSERT INTO `cart` VALUES (72, 7, 5, '启悦', 1, 1505284701);
INSERT INTO `cart` VALUES (80, 10, 5, '启悦', 1, 1505295510);
INSERT INTO `cart` VALUES (81, 10, 4, '香港产', 1, 1505295524);
INSERT INTO `cart` VALUES (82, 10, 4, '山东产', 1, 1505295529);
INSERT INTO `cart` VALUES (98, 9, 5, '保法止', 3, 1505910707);
INSERT INTO `cart` VALUES (99, 9, 5, '启悦', 1, 1505910717);
INSERT INTO `cart` VALUES (104, 17, 16, '100', 1, 1508225631);
INSERT INTO `cart` VALUES (105, 17, 9, '12', 1, 1508225741);
INSERT INTO `cart` VALUES (111, 25, 10, '12', 1, 1508229109);
INSERT INTO `cart` VALUES (113, 31, 13, '11', 1, 1508293454);
INSERT INTO `cart` VALUES (115, 12, 16, '100', 1, 1508313304);
INSERT INTO `cart` VALUES (126, 29, 19, '10', 1, 1509579641);
INSERT INTO `cart` VALUES (129, 50, 18, '10', 1, 1509594746);
INSERT INTO `cart` VALUES (133, 52, 18, '10', 1, 1509801300);
INSERT INTO `cart` VALUES (135, 18, 17, '10', 1, 1510882849);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '评论内容',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `spec` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品规格',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `star` tinyint(1) DEFAULT 0 COMMENT '评分 0-5',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品评价表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 4, 17, '很管用', 7, '启悦', 1505274249, NULL);
INSERT INTO `comment` VALUES (2, 4, 17, '可以', 7, '启悦', 1505274553, NULL);
INSERT INTO `comment` VALUES (3, 4, 17, '可以', 7, '启悦', 1505274595, NULL);
INSERT INTO `comment` VALUES (4, 4, 17, '可以', 7, '启悦', 1505274644, NULL);
INSERT INTO `comment` VALUES (5, 4, 17, '可以', 7, '启悦', 1505279471, NULL);
INSERT INTO `comment` VALUES (6, 5, 17, '可以', 7, '启悦', 1505280755, NULL);
INSERT INTO `comment` VALUES (7, 5, 26, '很棒', 9, '启悦', 1505700919, NULL);
INSERT INTO `comment` VALUES (8, 34, 27, '这是谁', 9, '启悦', 1505704780, NULL);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `price` decimal(10, 2) DEFAULT NULL COMMENT '价格',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品图片',
  `type` tinyint(1) DEFAULT NULL COMMENT '商品类型 1 上新 2 热销',
  `express` decimal(10, 2) DEFAULT NULL COMMENT '运费',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '商品详情',
  `tags` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签',
  `nums` int(5) DEFAULT 0 COMMENT '商品数量',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `spec` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (9, '招生系统', 6800.00, 'upload/1507683894.jpg', 1, 0.00, '<p>招生系统</p>', NULL, 12, 1507705119, '12');
INSERT INTO `goods` VALUES (10, '企业展示', 3200.00, 'upload/1507682944.jpg', 1, 10.00, '<p>企业展示</p>', NULL, 12, 1507704990, '12');
INSERT INTO `goods` VALUES (11, '酒店预订', 10800.00, 'upload/1507683079.jpg', 1, 10.00, '<p>酒店预订</p>', NULL, 100, 1507704949, '100');
INSERT INTO `goods` VALUES (12, '点餐系统', 5800.00, 'upload/1507683118.jpg', 1, 10.00, NULL, NULL, 12, 1507704913, '11');
INSERT INTO `goods` VALUES (13, '看房系统', 98000.00, 'upload/1507683169.jpg', 1, 10.00, '<p style=\"text-align: center;\">每一次新的机遇到来，都会造就一批富翁<br/>良一科技一一与时俱进的富翁缔造者<br/>欲成功者，须快人一步<br/><span style=\"color: rgb(255, 0, 0);\">心动还不快行动?&nbsp;!</span></p><p style=\"text-align: center;\"><br/></p><p style=\"text-align: center;\"><span style=\"color: rgb(192, 0, 0);\">预约看房小程序<span style=\"color: rgb(0, 0, 0);\">---</span></span><span style=\"color: rgb(192, 0, 0);\">帮地产商实现自己的看房、卖房平台梦想！</span></p><p><span style=\"color: rgb(0, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(0, 0, 0);\">你还在发房产彩色宣传页吗？你还在为卖房投入大量人力物力吗？预约看房小程序来帮您！</span></p><p><span style=\"color: rgb(0, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(0, 0, 0);\">功能一，导航到楼盘地点、客服电话、公司实力展示、公告栏；</span></p><p><span style=\"color: rgb(0, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(0, 0, 0);\">功能二，热看楼盘、用户联系电话输入、免费专车看房、用户位置导航；</span></p><p><span style=\"color: rgb(0, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(0, 0, 0);\">功能三，楼盘展示：地理位置优势、核心卖点、小区配套、投资增值、周边解读；</span></p><p><span style=\"color: rgb(0, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(0, 0, 0);\">功能四，计算器：房贷计算器、税费计算器。</span></p><p><span style=\"color: rgb(0, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(0, 0, 0);\">功能五，一劳永逸：一次投入，永远受益，拥有良一房产小程序平台后，用户会裂变式增长，让用户把你的楼盘信息转发给用户，用户会自发的联系到您哦！</span></p><p><span style=\"color: rgb(0, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(0, 0, 0);\"><br/></span></p>', NULL, 12, 1512460067, '12');
INSERT INTO `goods` VALUES (14, '门店小程序', 99.00, 'upload/1507684174.jpg', 1, 10.00, '<p style=\"text-align: center;\">每一次新的机遇到来，都会造就一批富翁<br/>良一科技-----与时俱进的富翁缔造者<br/>欲成功者，须快人一步<br/><span style=\"color: rgb(255, 0, 0);\">心动还不快行动?&nbsp;!</span></p><p><span style=\"color: rgb(255, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(255, 0, 0);\"><span style=\"text-align: left; color: rgb(102, 102, 102); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-style: normal; font-weight: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px; font-variant-ligatures: normal; font-variant-caps: normal;\">“附近的小程序”，可以帮助商户快速、低门槛地在指定地点展示你的店面，以方便被周围的用户找到并使用，辐射方圆5公里。可展示您的店面地址、联系方式、店面图片。</span></span></p><p><span style=\"color: rgb(255, 0, 0);\"><span style=\"text-align: left; color: rgb(102, 102, 102); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-style: normal; font-weight: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px; font-variant-ligatures: normal; font-variant-caps: normal;\"><br/></span></span></p><p><span style=\"color: rgb(255, 0, 0);\"><span style=\"text-align: left; color: rgb(102, 102, 102); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: &quot;Microsoft YaHei&quot;; font-size: 16px; font-style: normal; font-weight: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px; font-variant-ligatures: normal; font-variant-caps: normal;\"><br/></span></span></p><p><span style=\"color: rgb(255, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(255, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(255, 0, 0);\"><br/></span></p>', NULL, 100, 1512459908, '100');
INSERT INTO `goods` VALUES (15, '美业预约系统', 19800.00, 'upload/1507684088.jpg', 1, 0.00, '<p><!--StartFragment --><br/></p><p style=\"text-align: center;\">每一次新的机遇到来，都会造就一批富翁<br/>良一科技一一与时俱进的富翁缔造者<br/>欲成功者，须快人一步<br/>心动还不快行动?&nbsp;!<br/></p><p>&nbsp;</p>', NULL, 11, 1510144942, '11');
INSERT INTO `goods` VALUES (16, '商城小程序', 15900.00, 'upload/1507683304.jpg', 1, 10.00, '<p>&nbsp;</p><p>&nbsp;</p><p style=\"text-align: center;\"><img title=\"1507714633539474.png\" alt=\"QQ图片20171011173427.png\" src=\"/ueditor/php/upload/image/20171011/1507714633539474.png\"/></p><p style=\"text-align: left;\"><br/></p><p style=\"text-align: left;\">商城小程序：创造新的流量入口，一键下单，缩短购物流程，降低获客成本；拓展企业产业链，扩大品牌受众群体。</p><p style=\"text-align: left;\"><br/></p><p style=\"text-align: left;\"><br/></p>', NULL, 100, 1510144921, '100');
INSERT INTO `goods` VALUES (17, '送货系统', 28800.00, 'upload/1508299638.jpg', 1, 0.00, '<p><br/></p><p style=\"text-align: center;\">每一次新的机遇到来，都会造就一批富翁</p><p style=\"text-align: center;\">良一科技——与时俱进的富翁缔造者</p><p style=\"text-align: center;\">欲成功者，须快人一步</p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 0, 0);\">心动还不快行动？！</span></p><p style=\"text-align: center;\"><span style=\"color: rgb(0, 0, 0); font-family: 黑体, SimHei; font-size: 20px;\"></span><span style=\"color: rgb(0, 0, 0); font-family: 黑体, SimHei; font-size: 20px;\"></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(0, 0, 0); font-family: 黑体, SimHei; font-size: 20px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(0, 0, 0); font-family: 黑体, SimHei; font-size: 20px;\">送货小程序</span></p><p><br/></p><p><img title=\"1508486609627037.jpg\" alt=\"IMG_1467.JPG\" src=\"/ueditor/php/upload/image/20171020/1508486609627037.jpg\"/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span style=\"font-size: 20px;\">你开有连锁超市吗？你开有连锁店吗？你是否正在给顾客送货的路上？送货小程序帮你送！</span></p></li><li><p><span style=\"font-size: 20px;\">亮点一：顾客可以线上选择喜欢的商品加入购物车，然后下单，线上约定送货时间，送货地点，信息便会准确地传达到后台，管理人员便会及时安排送货，送货员便会准时送货上门；</span></p></li><li><p><span style=\"font-size: 20px;\">亮点二：同时送货小程序还具有智能推荐距离顾客实时位置最近的店面，客户也可线上选好商品之后，选择到店付，这样就节省了时间、提高了效率。</span></p></li><li><p><span style=\"font-size: 20px;\">亮点三：小程序还设有优惠券、会员卡积分，还设有节假日优惠公告提醒，这些促销活动信息，线上即帮了店家揽客，再也不用散发促销手册了，真是一次投入，永远受益啊！</span></p></li><li><p><span style=\"font-size: 20px;\">亮点四：送货小程序点进去之后，用户不用到店即可查看商品、搜索商品（足不出户即可得知该店面有没有自己需要的商品，比如买药、买酒等）、同时选择自己心仪的商品，对于用户而言省时省力。</span></p></li><li><p><span style=\"font-size: 20px;\">亮点五：对于商家，送货小程序实现了用户选择商品后的送货地址、时间、联系方式，并可导航到送货的目的地，这些功能大大地提高了工作效率。</span></p></li><li><p><span style=\"font-size: 20px;\">亮点六：这种足不出户并可短时间内送达货物的购物方式，提高了用户体验度，可吸引越来越多的用户购买，同时也降低了获客成本，从而实现商家“顾客盈门，日进斗金”的可喜局面。</span></p></li></ul><p><br/></p><p style=\"text-align: center;\"><span style=\"font-size: 20px;\"><img title=\"1509175306394003.png\" alt=\"bg-100.png\" src=\"/ueditor/php/upload/image/20171028/1509175306394003.png\"/></span></p><p><span style=\"font-size: 20px;\"><br/></span></p><p>小程序:&nbsp;就是把实体店里的商品搬到微信小程序来卖，不管是吃喝玩乐、衣食住行等等，只要是花钱的都可以入驻。小程序已成为企业、商家、店铺宣传的利器，是门店必备的营销工具，“帮商家争顾客，帮顾客获利益”。生意能翻一番，利润能翻数倍。<br/><br/>而且客户无需下载安装，不占手机内存，客户用之即来，用完既走。你的店铺会自动出现在微信小程序端口里周边5公里范围，所有微信用户可以找到到你的店。用户还可以把你的小程序转发给他的好友和微信群里面，便会迅速传播开来。<br/><br/>小程序属于你自己的经营平台，一次做成，永远受益，小程序已是信息时代的名片，小程序是你身份的象征！&nbsp;小程序是你身份的象征！小程序是你身份的象征！<br/><br/>微信小程序开发，量身定制满意为止。联系电话：13932014097<br/><br/></p><p><br/></p><p><br/></p>', NULL, 10, 1512459816, '10');
INSERT INTO `goods` VALUES (18, '预约挂号系统', 28000.00, 'upload/1508551476.jpg', 1, 0.00, '<p><!--StartFragment --></p><p style=\"text-align: center;\">每一次新的机遇到来，都会造就一批富翁<br/>良一科技一一与时俱进的富翁缔造者<br/>欲成功者，须快人一步<br/><span style=\"color: rgb(255, 0, 0);\">心动还不快行动?&nbsp;!</span></p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 0, 0);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 0, 0);\">预约挂号小程序</span><br/></p><p>&nbsp;</p><p><br/></p><p><img title=\"1508900742480883.jpg\" alt=\"IMG_1816.JPG\" src=\"/ueditor/php/upload/image/20171025/1508900742480883.jpg\"/></p><p><br/></p><p><br/></p>', NULL, 10, 1512459866, '10');
INSERT INTO `goods` VALUES (19, '开团购系统', 100000.00, 'upload/1508744288.jpg', 1, 0.00, '<p style=\"text-align: center;\">每一次新的机遇到来，都会造就一批富翁<br/>良一科技一一与时俱进的富翁缔造者<br/>欲成功者，须快人一步<br/><span style=\"color: rgb(255, 0, 0);\">心动还不快行动?&nbsp;!</span></p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 0, 0);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 0, 0);\">开团购系统</span></p><p>&nbsp;</p>', NULL, 10, 1509175167, '10');

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT NULL COMMENT '图片类型 1 商品图片 2 评论图片',
  `key_id` int(11) DEFAULT NULL COMMENT '图片类型ID',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片url',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图片表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of img
-- ----------------------------
INSERT INTO `img` VALUES (2, 1, 0, 'upload/1503493359.gif', 1503493359);
INSERT INTO `img` VALUES (3, 1, 4, 'upload/1503493995.jpg', 1503493995);
INSERT INTO `img` VALUES (4, 1, 4, 'upload/1503494475.gif', 1503494475);
INSERT INTO `img` VALUES (5, 1, 4, 'upload/1503494533.gif', 1503494533);
INSERT INTO `img` VALUES (6, 1, 5, 'upload/1503737930.jpg', 1503737930);
INSERT INTO `img` VALUES (7, 1, 5, 'upload/1503737939.jpg', 1503737939);
INSERT INTO `img` VALUES (8, 1, 5, 'upload/1503737950.jpg', 1503737950);
INSERT INTO `img` VALUES (9, 1, 5, 'upload/1503737959.jpg', 1503737959);
INSERT INTO `img` VALUES (10, 1, 16, 'upload/1508226092.jpg', 1508226092);
INSERT INTO `img` VALUES (11, 1, 15, 'upload/1508226347.jpg', 1508226347);
INSERT INTO `img` VALUES (12, 1, 15, 'upload/1508227357.jpg', 1508227357);
INSERT INTO `img` VALUES (13, 1, 16, 'upload/1508290891.jpg', 1508290891);
INSERT INTO `img` VALUES (14, 1, 16, 'upload/1508290916.jpg', 1508290916);
INSERT INTO `img` VALUES (16, 1, 18, 'upload/1508552685.png', 1508552685);
INSERT INTO `img` VALUES (17, 1, 18, 'upload/1508552710.jpg', 1508552710);
INSERT INTO `img` VALUES (18, 1, 18, 'upload/1508552739.jpg', 1508552739);
INSERT INTO `img` VALUES (19, 1, 18, 'upload/1508552772.png', 1508552772);
INSERT INTO `img` VALUES (20, 1, 18, 'upload/1508552801.jpg', 1508552801);
INSERT INTO `img` VALUES (21, 1, 18, 'upload/1508552834.png', 1508552834);
INSERT INTO `img` VALUES (22, 1, 18, 'upload/1508552876.png', 1508552876);
INSERT INTO `img` VALUES (23, 1, 18, 'upload/1508552898.png', 1508552898);
INSERT INTO `img` VALUES (24, 1, 20, 'upload/1508845627.jpg', 1508845627);
INSERT INTO `img` VALUES (25, 1, 20, 'upload/1508845649.jpg', 1508845649);
INSERT INTO `img` VALUES (26, 1, 20, 'upload/1508845668.jpg', 1508845668);
INSERT INTO `img` VALUES (27, 1, 20, 'upload/1508845687.jpg', 1508845687);
INSERT INTO `img` VALUES (28, 1, 20, 'upload/1508845704.jpg', 1508845704);
INSERT INTO `img` VALUES (29, 1, 20, 'upload/1508845724.jpg', 1508845724);
INSERT INTO `img` VALUES (30, 1, 20, 'upload/1508845742.jpg', 1508845742);
INSERT INTO `img` VALUES (31, 1, 20, 'upload/1508845759.jpg', 1508845759);
INSERT INTO `img` VALUES (33, 1, 20, 'upload/1508845819.jpg', 1508845819);
INSERT INTO `img` VALUES (34, 1, 20, 'upload/1508845837.jpg', 1508845837);
INSERT INTO `img` VALUES (37, 1, 14, 'upload/1510021763.jpg', 1510021763);
INSERT INTO `img` VALUES (38, 1, 14, 'upload/1510021783.jpg', 1510021783);
INSERT INTO `img` VALUES (39, 1, 14, 'upload/1510021806.jpg', 1510021806);
INSERT INTO `img` VALUES (40, 1, 14, 'upload/1510021897.jpg', 1510021897);
INSERT INTO `img` VALUES (44, 1, 19, 'upload/1512397681.png', 1512397681);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sum` decimal(10, 2) DEFAULT NULL COMMENT '总金额',
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '留言',
  `is_sms` tinyint(1) DEFAULT 0 COMMENT '是否短信通知 0 否 1 是',
  `express` decimal(10, 0) DEFAULT NULL COMMENT '运费',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `address_id` int(11) DEFAULT NULL COMMENT '收货地址ID',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `order_num` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单编号',
  `status` tinyint(1) DEFAULT 0 COMMENT '0 待付款 1 待发货 2 待收货 3 待评价 4 已完成 5 取消 6 已删除',
  `express_num` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '运单编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (11, 847.50, '快点发货', 0, 0, 4, 1, 1503898996, '41503898996', 2, NULL);
INSERT INTO `order` VALUES (12, 168.00, 'undefined', 0, 0, 4, 1, 1503899571, '41503899571', 1, NULL);
INSERT INTO `order` VALUES (13, 7.50, '11', 0, 0, 4, 1, 1503899637, '41503899637', 3, NULL);
INSERT INTO `order` VALUES (14, 168.00, 'undefined', 0, 0, 4, 1, 1503900951, '41503900951', 1, NULL);
INSERT INTO `order` VALUES (15, 168.00, 'undefined', 0, 0, 4, 1, 1503909902, '41503909902', 1, NULL);
INSERT INTO `order` VALUES (16, 1008.00, 'undefined', 0, 0, 6, 1, 1503937319, '61503937319', 5, NULL);
INSERT INTO `order` VALUES (17, 168.00, 'undefined', 0, 0, 7, 1, 1503976604, '71503976604', 6, NULL);
INSERT INTO `order` VALUES (18, 168.00, 'undefined', 0, 0, 7, 11, 1505283767, '71505283767', 5, NULL);
INSERT INTO `order` VALUES (19, 168.00, 'undefined', 0, 0, 7, 11, 1505283832, '71505283832', 5, NULL);
INSERT INTO `order` VALUES (20, 168.00, 'undefined', 0, 0, 7, 11, 1505283949, '71505283949', 5, NULL);
INSERT INTO `order` VALUES (21, 168.00, 'undefined', 0, 0, 9, 12, 1505293361, '91505293361', 6, NULL);
INSERT INTO `order` VALUES (22, 37.50, '快点发货', 0, 0, 9, 12, 1505294608, '91505294608', 6, NULL);
INSERT INTO `order` VALUES (23, 168.00, 'undefined', 0, 0, 10, 13, 1505295449, '101505295449', 0, NULL);
INSERT INTO `order` VALUES (24, 168.00, 'undefined', 0, 0, 9, 14, 1505318423, '91505318423', 6, NULL);
INSERT INTO `order` VALUES (25, 672.00, 'undefined', 0, 0, 9, 14, 1505486879, '91505486879', 6, NULL);
INSERT INTO `order` VALUES (26, 168.00, 'undefined', 0, 0, 9, 14, 1505487022, '91505487022', 6, NULL);
INSERT INTO `order` VALUES (27, 168.00, 'undefined', 0, 0, 9, 14, 1505487054, '91505487054', 6, NULL);
INSERT INTO `order` VALUES (28, 511.50, 'undefined', 0, 0, 9, 15, 1505704314, '91505704314', 6, NULL);
INSERT INTO `order` VALUES (29, 336.00, 'undefined', 0, 0, 9, 15, 1505910666, '91505910666', 0, NULL);
INSERT INTO `order` VALUES (30, 3910.00, 'undefined', 0, 0, 16, 17, 1508225368, '161508225368', 6, NULL);
INSERT INTO `order` VALUES (31, 10810.00, 'undefined', 0, 0, 16, 17, 1508982139, '161508982139', 0, NULL);

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `nums` int(5) DEFAULT NULL COMMENT '商品数量',
  `goods_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `spec` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规格',
  `price` decimal(10, 2) DEFAULT NULL COMMENT '单价',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_goods
-- ----------------------------
INSERT INTO `order_goods` VALUES (16, 11, 5, 3, '非那雄胺片 外用搭配蔓迪疗效更佳', '启悦', 168.00, 1503898996, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (17, 11, 5, 2, '非那雄胺片 外用搭配蔓迪疗效更佳', '仙琚', 168.00, 1503898996, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (18, 11, 4, 1, '金嗓子喉宝 不看广告看疗效 一片顶过去五片', '山东产', 7.50, 1503898996, 'upload/1503470252.jpg');
INSERT INTO `order_goods` VALUES (19, 12, 5, 1, '非那雄胺片 外用搭配蔓迪疗效更佳', '启悦', 168.00, 1503899571, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (20, 13, 4, 1, '金嗓子喉宝 不看广告看疗效 一片顶过去五片', '云南产', 7.50, 1503899637, 'upload/1503470252.jpg');
INSERT INTO `order_goods` VALUES (21, 14, 5, 1, '非那雄胺片 外用搭配蔓迪疗效更佳', '保法止', 168.00, 1503900951, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (22, 15, 5, 1, '非那雄胺片 外用搭配蔓迪疗效更佳', '启悦', 168.00, 1503909902, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (23, 16, 5, 6, '非那雄胺片 外用搭配蔓迪疗效更佳', '保法止', 168.00, 1503937319, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (24, 17, 5, 1, '非那雄胺片 外用搭配蔓迪疗效更佳', '启悦', 168.00, 1503976604, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (25, 18, 5, 1, '非那雄胺片 外用搭配蔓迪疗效更佳', '启悦', 168.00, 1505283767, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (26, 19, 5, 1, '非那雄胺片 外用搭配蔓迪疗效更佳', '启悦', 168.00, 1505283832, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (27, 20, 5, 1, '非那雄胺片 外用搭配蔓迪疗效更佳', '启悦', 168.00, 1505283949, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (28, 21, 5, 1, '非那雄胺片 外用搭配蔓迪疗效更佳', '启悦', 168.00, 1505293361, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (29, 22, 4, 5, '金嗓子喉宝 不看广告看疗效 一片顶过去五片', '云南产', 7.50, 1505294608, 'upload/1503470252.jpg');
INSERT INTO `order_goods` VALUES (30, 23, 5, 1, '非那雄胺片 外用搭配蔓迪疗效更佳', '启悦', 168.00, 1505295449, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (31, 24, 5, 1, '非那雄胺片 外用搭配蔓迪疗效更佳', '启悦', 168.00, 1505318423, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (32, 25, 5, 4, '非那雄胺片 外用搭配蔓迪疗效更佳', '启悦', 168.00, 1505486879, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (33, 26, 5, 1, '非那雄胺片 外用搭配蔓迪疗效更佳', '启悦', 168.00, 1505487022, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (34, 27, 5, 1, '非那雄胺片 外用搭配蔓迪疗效更佳', '启悦', 168.00, 1505487054, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (35, 28, 4, 1, '金嗓子喉宝 不看广告看疗效 一片顶过去五片', '云南产', 7.50, 1505704314, 'upload/1503470252.jpg');
INSERT INTO `order_goods` VALUES (36, 28, 5, 3, '非那雄胺片 外用搭配蔓迪疗效更佳', '仙琚', 168.00, 1505704314, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (37, 29, 5, 2, '非那雄胺片 外用搭配蔓迪疗效更佳', '启悦', 168.00, 1505910666, 'upload/1503737915.jpg');
INSERT INTO `order_goods` VALUES (38, 30, 16, 1, '商城小程序', '100', 3900.00, 1508225368, 'upload/1507683304.jpg');
INSERT INTO `order_goods` VALUES (39, 31, 11, 1, '酒店预订', '100', 10800.00, 1508982139, 'upload/1507683079.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像url',
  `nick_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '微信唯一标识',
  `add_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, 'https://wx.qlogo.cn/mmopen/RCicEoYCm8PrCsEvibMvepXxxzCRPRvHnlrewKDFWEx7dPq1JTOgeiaTibzxIISQLKN1C0uLojNylPWtic6Nuk8fiaNibOUib5tWKGN3/0', '海超人', 'oquAP0bA1XNF1EXvhklypcfWUSTY', 1503645006);
INSERT INTO `user` VALUES (9, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTV99icsScxmJwRP8K4TIPpVUn3rvngVLxW5dibYsAzPbkchNAO2roAjt7uEuVZhHt7jbpiaoe5W3cQ/0', '海草人', 'oP0770JtYN-8d-4ld8dqvqn1176g', 1505292076);
INSERT INTO `user` VALUES (10, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIib068bXZpyNHK3KxMjq2tS4fKrh1ItDOFuo0ygps3Uicw2iaxbpe5WFnxjqpzWtSLccUacLKYgpia3A/0', '海草人', 'oP0770Falk9_-Cph8QsJ-A1Soe1I', 1505294693);
INSERT INTO `user` VALUES (11, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKnA7rnKxfKTykzPFgr9ybSBQP350VukWUPMIOJ8JfOChDmvwibU0Bd8MQhMMg2ftPT8dyJqYzttibg/0', '王伟', 'oP0770PGZ523bR4RgzXn08gjN1kI', 1505703608);
INSERT INTO `user` VALUES (12, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLPuFLo0taTZBKO0b4xm4UDKohuE54w32WkYnTbwD3ySpMT4uYndV6o0u0jd9ZZXGPs9zzY7PJY8w/0', '小同同学', 'on0sC0ce0cobk3ZSIEA1f3WvMC2M', 1508204915);
INSERT INTO `user` VALUES (13, '', 'rdgztest_KDTGBC', 'on0sC0QBPE2O_WeOCFSBRoB9GYEw', 1508205767);
INSERT INTO `user` VALUES (14, 'https://wx.qlogo.cn/mmopen/vi_32/hO8WtmKpwrzuqBq7Yr95KvNX9z2VOC2Mn6VzvyWK6mDKUjmkickJ5ZKOVibsh9va72v5tAmibDm4DJ3YYTVTbZByg/0', '良一科技', 'on0sC0Y0MH8WDvBdFKYN_RYJMDWc', 1508225211);
INSERT INTO `user` VALUES (15, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKzXP3Z2VoWfUl3s4PDpvjS618ialzQbMw1QYzw4Wn7MzjmHBMba72czIQb34jveiauBtIIfpUy95Pw/0', '、、', 'on0sC0Z3FfncGpRvOd62bq2nWfLo', 1508225250);
INSERT INTO `user` VALUES (16, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibculdjaHRkDfnOibGAUsUD0icwWDCB2icT5aVAN3kLtWS9rK4VQhIxLFgORicFBtfKAYmJXwO46QNRQ/0', '花满池塘得自由', 'on0sC0Skzrpfa69hYw-JUyHzf1tg', 1508225278);
INSERT INTO `user` VALUES (17, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuHpzkOcuqH1xtRhOJUymVHroGqrylxrMsSBwTicPDzDVVdGZ6AGibXwRJpmDWVbl2Y7icgpdB7a7tQ/0', '海草人', 'on0sC0Yk2Li_p1IziJK1_ZxhqaMM', 1508225543);
INSERT INTO `user` VALUES (18, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKOtFRoAkay3R38XMXthUgMRRWaePvibYkWM9oG4PQy6hGDeeJHcVcMuaxA9fl4aGXPOVLHnzNrxPw/0', '王伟', 'on0sC0d83ebUBOc7GyDcds8vJ254', 1508225620);
INSERT INTO `user` VALUES (19, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eomKDhHDIN9W5lvUBtUDZA3eSPePjC099h7X7w1s0avMDamq8pVT5RhxxibpdKYUiaTMD7oeUNC7bNQ/0', '刘鹏', 'on0sC0bjgZ_qoAjiEvQC99SuIwUw', 1508227101);
INSERT INTO `user` VALUES (20, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELgfEf0s3iaYxe7BWlvFlOhXIndXYvlkREgrplONiaeWasBdUPbR2MKaXkZx17RicXp58UWvwMmDY0yg/0', '王志文', 'on0sC0ZcNzBOkBPx8q_E8ajc6Ki4', 1508227121);
INSERT INTO `user` VALUES (21, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKgNQbtic3oYSZ46paCMQP00cfnrjTPrTmhicicOQsLNmKKW51VCnljOS9icWTiaPnK3vLztCmXiajeLAFw/0', '＊', 'on0sC0T5pMBYRZgCEs9-RH2sCS9w', 1508227439);
INSERT INTO `user` VALUES (22, 'https://wx.qlogo.cn/mmopen/vi_32/pu75dibzfiaKcHDLZ0tYxJbAMRtjXo5BUlPBvTAtjRZUibJYXOqDia95lxjhbBhVZQm18c6KXxSbKqcz0kJcg1mlLg/0', '等待', 'on0sC0Y6esDOfEDYfC927zovu6jY', 1508227792);
INSERT INTO `user` VALUES (23, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJLSuWXcIibw5ib0IZAumUZf6Z34Bvic42uEQnZlWqw8Uqxjs6SJDlxl2XrqP85pT7PXJicNc2ibUBpaqA/0', 'Lion', 'on0sC0QtEU4y1Ejg4evU-xcI8dBQ', 1508227855);
INSERT INTO `user` VALUES (24, '', 'rdgztest_XDGFFF', 'on0sC0W0bMTYn5dx-ckqpQRrV_RM', 1508228838);
INSERT INTO `user` VALUES (25, '', 'rdgztest_ODIXHF', 'on0sC0RIc87i1J8OoBXmsf6koRVg', 1508228997);
INSERT INTO `user` VALUES (26, 'https://wx.qlogo.cn/mmopen/vi_32/QuHB4LJgwhRKth1mySxs8DEjdyeMlcibceKHYMT0hee3xMPCY1UG1OrPeaTVJ2iaZaZpT1MKjoUBOtJOqCmfQgQA/0', '金枪鱼', 'on0sC0ZZmIUb0ORcoY62subyYnN8', 1508229193);
INSERT INTO `user` VALUES (27, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJNOwkeYVicU1BrUoeGkpNFO5bK2nhwua1bf3KPeFduzl3t8ibyCuky4XsnyFldVPC94md92gHFicEKQ/0', '元启', 'on0sC0aWd2UN625zeJd24gFGD3yU', 1508242132);
INSERT INTO `user` VALUES (28, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIBv2XEicvz2gxPXheILqkDNthsViamny2QLwhw5Q1KFvdCpURSQCa59s51fdvbmMwZ78ib0licwnfd0w/0', '醫帆風順', 'on0sC0Q-p2u3eSC43kb3edFEzlD4', 1508247087);
INSERT INTO `user` VALUES (29, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLzuDJMn2ghqs0hskAqCct46A1TJ2Pp2MthC2tBaNFdey9HbpdS0pGSmibgFjhTXv9c9EQibF88k1wg/0', '????', 'on0sC0V_yHUdgZs91wiVDnj7vr8U', 1508288708);
INSERT INTO `user` VALUES (30, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLXbp1CNAGmPNHaFFR30JVeRfBk6C0TIOCX2UW8B7nibKaicst4yIy23Qg4N2IyM9eRNft5bVL2JrJg/0', '000000', 'on0sC0c-rcSZCFXDRhTdswCo-75A', 1508289118);
INSERT INTO `user` VALUES (31, '', 'rdgztest_SUHWSL', 'on0sC0ad8HrTSLpux_hzQ-ixQeFg', 1508293280);
INSERT INTO `user` VALUES (32, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqIg5SAsQwBQ6ibtF85R1JZYxVWF4LDR6pH03ClpdCiarMAEUYia7EPibN6pxNichkWxVxskLhWBRu69Yg/0', '酸辣粉爱上花甲粉（崔少鹏）', 'on0sC0e-QOxS2e9zUV0c7jwjwAXM', 1508561593);
INSERT INTO `user` VALUES (33, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIhffuhp2wfcysY0M4RWeglDM4ApzPiaOpYfCX7je1u0SatMKupbSlT72Zcj8AVWIH1a9p7gIJib2Vg/0', '鲍艳举', 'on0sC0aN_-uc_HfNVm4EDhWmh5DY', 1508577926);
INSERT INTO `user` VALUES (34, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKFZqRxpq9Rzwl1aW3cylkv3UOGwmQpJMrsC6dib8Kib4ekGB8dbjbwxcCxnM9mpYIfmg716n45FAZw/0', '????董小姐', 'on0sC0SzycnLDKJ15BoMbXeZhd2I', 1508599825);
INSERT INTO `user` VALUES (35, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL9hYp3X9x803pphY6Nxq0IEmwD4k4IwXiaBUHrPDf1egT1Ycj43j8QUImC3R7lg74NaQJOiaJLUEIw/0', '旺虎', 'on0sC0W8GBfgcdOfRb-Jn0xUG-NE', 1508647214);
INSERT INTO `user` VALUES (36, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq3zXMCVJtMvo0kQxpR46E8ic1xIuny36Rxh3YyA00HbbI6oKNIX9LkMrvTjtH4rnredk0iaa84CKzw/0', '提世凯', 'on0sC0Yndv3x0CxK_w3fCUlnB49Q', 1508733994);
INSERT INTO `user` VALUES (37, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkb1NqZ7EITl69TYawDG4Okic1IHxJS2rc9bvus6dVQgl4DK78yZkgSwL4r35LDxyzE2X4yBAaEVA/0', '七彩少年', 'on0sC0cHzXKAw5XSZTjd9fT0PQzI', 1508905223);
INSERT INTO `user` VALUES (38, 'https://wx.qlogo.cn/mmopen/vi_32/lWfF1X3ty2aVNGiczEerCiacg81UvcqjLBJibD5PzsVLEWffFDNXcV2xHzgUlzibWbxLWibrmskzlibLAtvSS4cJChsw/0', '如意', 'on0sC0Vz7ZVh1V7DkZ9tKnnVinyk', 1508940630);
INSERT INTO `user` VALUES (39, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epMxjWcaLsLM2oCh9liavFicVI8V2zUm32NpX9k8o6N3UOxQnYMqib0oSrDe1MwAuzGECp1L6AXkicxqg/0', '新北方中道灯具    开关', 'on0sC0Smv7o5CroyQfjYeyOJ8DhI', 1508981396);
INSERT INTO `user` VALUES (40, '', 'rdgztest_ZAALML', 'on0sC0fNWrKuwY0XBl_6-cxSjZl8', 1508999025);
INSERT INTO `user` VALUES (41, 'https://wx.qlogo.cn/mmopen/vi_32/z63wJ588cRTMmYe4gYJpAbpEJicPZsRLvicyuK5luIqAEiaPSAZBZlV9C0cSp5icql9UBIJPAq1EsUfa4ibJiat2q8hw/0', '小小青', 'on0sC0aPr4Ayk8ZL1RV2SmLxGQ6o', 1509073131);
INSERT INTO `user` VALUES (42, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erdHnqJ5cpf6oibG5vee3icHO1XRhVv6jG8fVP5O3jbINJkPZxyeINicyYAxUJNaXtunaZlYu2IEeptg/0', '型似孤单', 'on0sC0ck3CJHL1LMt6VQ_N1GaYsI', 1509244589);
INSERT INTO `user` VALUES (43, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKYAL7mwdMQasMrpyziaXJzRLlxndyJAEotMNGHSBL9FICmSZF2ruYiaBtD7rE9vNiaZbSU119KJl1Hg/0', '泽汭', 'on0sC0RAOF_f6AeLwUgAk7ynYuEI', 1509328137);
INSERT INTO `user` VALUES (44, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKKYZzvGo0MjbibTPia15UuQS6TupSfc9ecmHalQczSk6KcHVo7mQPKl4RfxRoWAUmWnUa6DENia7DCg/0', 'A范殿科', 'on0sC0X9N-pehGjT_iNuLauF-r1g', 1509328167);
INSERT INTO `user` VALUES (45, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK3uPoSTpdozLic1OUJmHcEf8CWXJmib28QpP2hhfBcJIEUKQXAjrr9LibKmBck68dHBkCltAxmPMnJA/0', 'GentIeman', 'on0sC0QGDXY40Q2m0fPrWx8j0vKg', 1509350854);
INSERT INTO `user` VALUES (46, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erFTPooxicQkWDSuDrMEIPhmanzzIT36jgoxPkOic8NrGjdT4Zwsa5a8tiaksHeVl3YRN32ajmicEVMQg/0', '小猴子', 'on0sC0T3xzWr_QO6nupLyQT5URJE', 1509367589);
INSERT INTO `user` VALUES (47, 'https://wx.qlogo.cn/mmopen/vi_32/dwSgqx9kibjlaR3baaWMEN8Jxv2XbtpeA3icfzIugUQzdBAIfzZNRRL9SbElr75fwepmp5hpeA2YLET9quGukdJw/0', '阳光照亮', 'on0sC0RfUi_diED43CJpMnioy3a4', 1509438368);
INSERT INTO `user` VALUES (48, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIRiajGPvPVvUsZ6vyQF2C9I1E4kqfiben9vL3XtQ9aMf690QYdicIZ9gibQ7eycutc0MuPn5lF3AsvIQ/0', 'A000杨～杨', 'on0sC0SVde1cQrhWn5NQ-VaeAuTk', 1509440059);
INSERT INTO `user` VALUES (49, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqbud5saOKMqrz8HCDj5icvVeVfr8UPfKwpbvz03bN68aI4nIic354ictUwD0OSKIYL3pOWhibdFclKmg/0', '素衣莫起风尘叹、', 'on0sC0UJyKeKq9HlxZvjxrrnMCRs', 1509460539);
INSERT INTO `user` VALUES (50, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIZfYQUDdBhb41QJVJut4CaAd0PMCDvMiaM1b3XK8kKno6ffSpY0Nmiangsagkecrm0pLlMHY2tTODw/0', '宏图伟业', 'on0sC0YV7Wq3YtbEtPL2UeHFYGM0', 1509594622);
INSERT INTO `user` VALUES (51, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI4fu4ZKh1Bj0NtLo31TMQibFCfSpzB35C0xGBjo3rKicmR7UV4B9aksBJWHbCy8HXtbiczHrt6tVecg/0', '天使爱美丽', 'on0sC0bkAMmiNjTc5phS8iJFuDdU', 1509614434);
INSERT INTO `user` VALUES (52, 'https://wx.qlogo.cn/mmopen/vi_32/icCwK09icmLNic3FgcjFQ93zYcZNE8olkQ6AnVC4ibS17mSWFXg92WNn1xJth2P6f317TdMa7VyVX8HypNgNAB40Nw/0', '橘井泉香', 'on0sC0XeMafGG4IvS0XzAH__No34', 1509800918);
INSERT INTO `user` VALUES (53, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq6NUmC4CoYuWJatyzSusJYOUqWDEliarj9AhO5SoxMryRqE9hlIvbVqRvAWcVoBt9TjBPicnpOWYJw/0', '线上广告-贾飞18003308318', 'on0sC0WTz2KDLXCKdrSKVcshjOso', 1509843319);
INSERT INTO `user` VALUES (54, '', 'rdgztest_SZVFCM', 'on0sC0Ukrm2_bQJ0uvspPAB8maRA', 1509939971);
INSERT INTO `user` VALUES (55, '', 'rdgztest_IQCMPG', 'on0sC0Uuk_li7tUWdxNLaORv6y7o', 1509949976);
INSERT INTO `user` VALUES (56, 'https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLAib7BiaFVcjAgMQWzuLtULHtv1YMPA8zfz8ibyIrTERZR17xSonmnAocvjAsSEguBNAfQWibroeoCSyg/0', 'supang????', 'on0sC0R5ZvaC1KPjKFMvZGkug0ZM', 1509969053);
INSERT INTO `user` VALUES (57, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI2PV3n8ic7ghkjYcx4lUj0DO2kPRExlq2hsPDo1ALrj5njlYdCZ4cSz3yHNpQoUCmysyK9Av9nVPA/0', '邓国军sam', 'on0sC0W7tm7U6U_D-iaqiV3heZ8Q', 1509975686);
INSERT INTO `user` VALUES (58, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIERZsdiaVmyaGQahc0m20QMdr3UgSRBsaVdOcicd1Ol5kstrzVpUCjMIYia1SJ5icWA4VIfiaOZ85oYhg/0', '自然╰ 而然', 'on0sC0YpJ1RJ0kox4FcueyWVdLs0', 1509981926);
INSERT INTO `user` VALUES (59, 'https://wx.qlogo.cn/mmopen/vi_32/JmT9Bdmr8icYGrbum9QiclyM0SposkeY0GviaRvYxxeTW7axM850qt2CChXEjjRicnamaHCNic4ick3u6BWoeIsCicsxw/0', '吾', 'on0sC0QBKg7JlbvXL0LHku9Tzoik', 1510027427);
INSERT INTO `user` VALUES (60, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqeDNNTeJFn4RFibRvrnxF7zib8mZRTSspC0ugOTlrsrVuk9PyTndoZOt44cyo30GcSLEnICCtrrX2g/0', '静待花开', 'on0sC0f_UhbvYvU17-IvI4XycEPM', 1510030245);
INSERT INTO `user` VALUES (61, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoxXuMyicEptPJm1rP53dbIbGKE2KOaybGTXzoP3ND7mvSTSAZExoK79ibtv1WkcVmSTUVLPdsq3ODw/0', '????寻朝阳????', 'on0sC0Zfg_NmzZ7GjG2qpt5vEafU', 1510055464);
INSERT INTO `user` VALUES (62, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIT9lXXm63ialMs769dsArf4I99xfOkqXT4wf47EPzeiauBiavlQlf9bZYicUYxkh9lEeqLaCShHsIDibQ/0', 'iF', 'on0sC0fGiQ5in7K0Kdf8KSQ11_Qw', 1510130450);
INSERT INTO `user` VALUES (63, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJSmTXA1QV3OibId2GHE1RUwUIibLlBo1jFr4JaJRWoPaqib93oTdNdblg1vhWkFIg5TfBV9vm9n0bMg/0', '慧君', 'on0sC0ccF_jC_mv8ekfumoFqPvhA', 1510139425);
INSERT INTO `user` VALUES (64, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLwFtsoLmkutevGfDYKGO5wQtDyQMu5T7crnCDcvJiasFaDYUGaledibticLSJx8vsNCGEYsMskZXm5A/0', '平固店阳光手机店15731003200', 'on0sC0VE7VIdpEl_vLrY6DuDjQW8', 1510144958);
INSERT INTO `user` VALUES (65, 'https://wx.qlogo.cn/mmopen/vi_32/qxdkIict9Eib8wAofrLtvMqYKk6Gh4NFibicZibJaDQqickTvaCC5JmicAG3cFqxZIgBYfOGdRbwJI13cpyROGqEb6SPg/0', '天涯', 'on0sC0Z_qT3YI6Qt9CTUl_ElNHBw', 1510319983);
INSERT INTO `user` VALUES (66, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erWCDibF5KEYBsEDIyxs2Wv7lLZzLr3aexAKvKg39cOmDs47MDBAWoryVgIgibWmzacm4zwjRGDnKUA/0', 'Aa河北昂轩', 'on0sC0bK_Bht-2vHlcIcXv6vh72w', 1510543303);
INSERT INTO `user` VALUES (67, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIsQwxctmaUgjnWw2JHPHjaKIFwSnLy35gVnWS7GH7lVmib1iboK7YS9nCDemw05fRqQpMaxlcME0Aw/0', '胖肉肉', 'on0sC0aYLGzyvCGDaHQ3H003P5YA', 1510551062);
INSERT INTO `user` VALUES (68, 'https://wx.qlogo.cn/mmopen/vi_32/BZAZ5JbDtqqflpqqMGNJelJr5fJxlyJicicTyfUc3BwZYVth9TzIBic5tpZhuWF6Wn8zYRqBiawxcBicLpaFtS3dqrQ/0', '我从不认为我有多好', 'on0sC0Rn3fkUw8_m7Lv5G7RjhHGk', 1510680193);
INSERT INTO `user` VALUES (69, 'https://wx.qlogo.cn/mmopen/vi_32/Q6w4NC8oMB61wLgBibhlM3a21FJK1KfT0NHMqlEiaWsVwmmODDbJoaLUCjbdKv6njFc62icbMtBliawZShFN49Knpg/0', '寒冰', 'on0sC0WH6xmIhLKERJxMugwZpeCU', 1510723309);
INSERT INTO `user` VALUES (70, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKib8YiaZyLp1N8ffQNibYPlqDvldzTmDnVmkKE9gjiaOgCH4b1TjH08d1Ks21HUafOGIY8g3wg5gvxeA/0', '木槿汐', 'on0sC0UIZ3PtIiObRXDu2aiqYN7U', 1510799787);
INSERT INTO `user` VALUES (71, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIyxa93JHHicUI86fv6g1K0gddc2oMdOKehxpDD6ApWCRSjuIjGbeUxJ5fNyGXdvn8O7ZIibOR5UbVw/0', '【蔼泰家居】【龙鹏装饰】', 'on0sC0fgvi6xqM0ImeA5CCICp6zk', 1510805573);
INSERT INTO `user` VALUES (72, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJLdAibmTEpyLENib5ShZ94zcJEh3hFju3wczuldDC6jwEa4ZQrtNdATLiasJc40qVvfk8byUbrR736Q/0', '许飞-软件开发与运营', 'on0sC0aAZmpB_dAPRj8f_fk-L-BE', 1510885329);
INSERT INTO `user` VALUES (73, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEI6jjVVskuhxeONG1D1nDFOmjia7ibztJibdvODTpjjR5JuKnQZeLZu7TD2OjCR11bBkGbF0oticq6Uhg/0', '冰河流域', 'on0sC0ZwlAc5UXrDq1bgypyTpAWY', 1510932652);
INSERT INTO `user` VALUES (74, 'https://wx.qlogo.cn/mmopen/vi_32/YP2qZY6HZBibQSj18ooOFFibJLUBMVvUJea2pvLWe71NsJC7KRd6ePAkGia6EfSNqhySeQLTwMTUxia61nbicKR9qmw/0', '识途', 'on0sC0XhpgjXIUDKDEd6H6SHpFHM', 1510996365);
INSERT INTO `user` VALUES (75, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLfu43exDC5P0Kg5dPJLRT3tHjlvKiaZ3xnZ4yQoQjJr8wQhJwicpmzRDndGCibKyAiaZCkfiaicYblHErw/0', '淘妮', 'on0sC0Qey28GjG8tqh43xVakegPk', 1511666749);
INSERT INTO `user` VALUES (76, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKKUmQ9Vu1Jmd7Zkuclt2zBZcYkfhsibCdtXrI88TnChN5f0SClbcIMmgOtYFyEQTibPg4OoPwvE4bA/0', '相见不如怀念〆', 'on0sC0UAWM_NJqYEeZNGg7BVwXd0', 1511753536);
INSERT INTO `user` VALUES (77, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqP8MWxeqfDvNWBPlZmEsPT4q0Y0v7hPLoRfVIyaeHWydKrfl4vDmKry9RicBAaEibunWud8TDMulCA/0', '苹果????', 'on0sC0ZKu_vWXGuK5UHpSqVZdIHQ', 1511872380);

SET FOREIGN_KEY_CHECKS = 1;
