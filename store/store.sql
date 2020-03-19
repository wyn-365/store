/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : store

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-03-19 18:53:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'zz', '123456');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` varchar(32) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '手机数码');
INSERT INTO `category` VALUES ('2', '电脑办公');
INSERT INTO `category` VALUES ('3', '时尚家居');
INSERT INTO `category` VALUES ('4', '高跟鞋');
INSERT INTO `category` VALUES ('5', '图书大全');
INSERT INTO `category` VALUES ('59f56ba6ccb84cb591c66298766b83b5', '时尚女装');
INSERT INTO `category` VALUES ('6', '婚纱礼服');
INSERT INTO `category` VALUES ('7', '测试添加');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `phone` bigint(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `cdate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '3750DF0DDCC54F3F9AA563C8811BE90A', '大姑娘', '1506443571@qq.com', '52522522', '这个网站', '2019-08-22');
INSERT INTO `comment` VALUES ('3', 'D2E9F3AF313241A59424C971064A628C', '大丫头', '1506443571@qq.com', '5283339', '你说的很对', '2019-05-25');
INSERT INTO `comment` VALUES ('4', '3750DF0DDCC54F3F9AA563C8811BE90A', '老王', '1506443571@qq.com', '8786757', '66666666', '2019-08-23');
INSERT INTO `comment` VALUES ('55', '3750DF0DDCC54F3F9AA563C8811BE90A', '楼梦雨', '1506443571@qq.com', '156156165', '是个女生', '2019-08-23');

-- ----------------------------
-- Table structure for gonggao
-- ----------------------------
DROP TABLE IF EXISTS `gonggao`;
CREATE TABLE `gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gonggao
-- ----------------------------
INSERT INTO `gonggao` VALUES ('1', '测试添加', '商城上线');
INSERT INTO `gonggao` VALUES ('2', '美美', '我的妹妹');
INSERT INTO `gonggao` VALUES ('3', '华电', '192班');
INSERT INTO `gonggao` VALUES ('4', '保定莲花池', '这是保定的一个区，老王在此。');
INSERT INTO `gonggao` VALUES ('5', '温泉园区', '老王的居住地');
INSERT INTO `gonggao` VALUES ('6', '哈哈哈哈哈哈哈啊哈哈', '测试测试测试测试测试测试测绘师侧hi回复司合肥克鲁赛德规划法律会计师股份收到货发就开始');
INSERT INTO `gonggao` VALUES ('93', '非常不错', '淘宝京东聚划算天猫');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` varchar(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL,
  `oid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `order_item_fk_0001` (`pid`),
  KEY `order_item_fk_0002` (`oid`),
  CONSTRAINT `order_item_fk_0001` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `order_item_fk_0002` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('0B0B83E315534309B3DA3C992D0DCD0D', '1', '150', '51', 'F3C08AC0E32340379957F806F225AB8F');
INSERT INTO `orderitem` VALUES ('1240749888CD4A66BCF031E475B1772D', '1', '110', '54', '5E5DED7C673347439AC73DE31C1F9E7D');
INSERT INTO `orderitem` VALUES ('228AE88D235B4F389DF04B04846E0C60', '1', '1469', '19', 'DB4C3611C4034FF3AB40B17E57AD939D');
INSERT INTO `orderitem` VALUES ('24F7320A7FBF4C58823436754CA4B7CE', '1', '4288', '15', 'DB4C3611C4034FF3AB40B17E57AD939D');
INSERT INTO `orderitem` VALUES ('565F91CBADA948E49E8EC9B41EE24FAE', '1', '5999', '42', 'DB4C3611C4034FF3AB40B17E57AD939D');
INSERT INTO `orderitem` VALUES ('5799024A6AA04A1190DB6E703C1EBC5E', '1', '4399', '36', 'DB4C3611C4034FF3AB40B17E57AD939D');
INSERT INTO `orderitem` VALUES ('68D5788F65CB46C8AE2A380460D8C8C4', '1', '6599', '40', 'DB4C3611C4034FF3AB40B17E57AD939D');
INSERT INTO `orderitem` VALUES ('6F964A439AC94B9CA5858703DF3318D5', '1', '9999', '60', '5056973140A9432CAC1F282CFD7DB2D5');
INSERT INTO `orderitem` VALUES ('7648CA4C96254A56BB7EA6558A37DC97', '1', '5499', '41', '08A39A2EDADA4B0F9A757105B1FDA2E6');
INSERT INTO `orderitem` VALUES ('80CC5C763ED64A79B210795673D939EA', '1', '1799', '12', '4CD72D49CF5C4A1C85A08BFC8F06BF26');
INSERT INTO `orderitem` VALUES ('A766AD5382A04334BCE89A6AF4910250', '1', '150', '52', 'EC89070EDF0248E88436D701A6489879');
INSERT INTO `orderitem` VALUES ('B6052BA19FF54AD5BCDCDE933B1CF664', '1', '1799', '12', 'DB4C3611C4034FF3AB40B17E57AD939D');
INSERT INTO `orderitem` VALUES ('BAC5A849820B499F980CDD6D337B7E0C', '1', '150', '51', '5056973140A9432CAC1F282CFD7DB2D5');
INSERT INTO `orderitem` VALUES ('BF1557293D51445FA5F8A3052FEB86FB', '1', '150', '51', '551B3955A6244168A95F1D305E1C10A3');
INSERT INTO `orderitem` VALUES ('C661060058F341B2864B28C4590EF8B9', '1', '4199', '33', 'DB4C3611C4034FF3AB40B17E57AD939D');
INSERT INTO `orderitem` VALUES ('C7CECB0D84B347AB880F228CFA7CB02E', '1', '1799', '14', '08A39A2EDADA4B0F9A757105B1FDA2E6');
INSERT INTO `orderitem` VALUES ('D44D15085D434E0E9871B28AD199918A', '1', '150', '51', 'EC89070EDF0248E88436D701A6489879');
INSERT INTO `orderitem` VALUES ('E05787778D1F44A9980E46688E1A6E69', '1', '2298', '11', 'DB4C3611C4034FF3AB40B17E57AD939D');
INSERT INTO `orderitem` VALUES ('EFF9F4D69E4A4157A6EAD3234AE6BB46', '1', '2299', '50', 'C0E2AC2C0E304068B3DFD9269513C5DE');
INSERT INTO `orderitem` VALUES ('F2826D14B0A640F4B7C7D20D0346D289', '1', '150', '51', '26426B886A514707A68B5ACEF720FB43');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` varchar(32) NOT NULL,
  `ordertime` datetime DEFAULT NULL,
  `total` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `order_fk_0001` (`uid`),
  CONSTRAINT `order_fk_0001` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('08A39A2EDADA4B0F9A757105B1FDA2E6', '2019-08-02 18:15:37', '7298', '1', null, '丑人', null, '3750DF0DDCC54F3F9AA563C8811BE90A');
INSERT INTO `orders` VALUES ('26426B886A514707A68B5ACEF720FB43', '2019-09-01 09:24:29', '150', '1', 'sasd', 'dasda', '1212312312', '3750DF0DDCC54F3F9AA563C8811BE90A');
INSERT INTO `orders` VALUES ('4CD72D49CF5C4A1C85A08BFC8F06BF26', '2019-08-03 09:25:31', '1799', '3', '保定市', '美人', '18333603878', '3750DF0DDCC54F3F9AA563C8811BE90A');
INSERT INTO `orders` VALUES ('5056973140A9432CAC1F282CFD7DB2D5', '2020-03-16 19:46:48', '10149', '1', '廊坊', '王亚梅', '15063398', 'D2E9F3AF313241A59424C971064A628C');
INSERT INTO `orders` VALUES ('551B3955A6244168A95F1D305E1C10A3', '2019-08-16 15:23:57', '150', '1', null, null, null, '3750DF0DDCC54F3F9AA563C8811BE90A');
INSERT INTO `orders` VALUES ('5E5DED7C673347439AC73DE31C1F9E7D', '2019-08-15 08:28:23', '110', '1', '温泉园区', '美女', '1111111111', '3750DF0DDCC54F3F9AA563C8811BE90A');
INSERT INTO `orders` VALUES ('C0E2AC2C0E304068B3DFD9269513C5DE', '2019-08-03 08:48:47', '2299', '3', '河北省固安县', '美人', '18333603843', '3750DF0DDCC54F3F9AA563C8811BE90A');
INSERT INTO `orders` VALUES ('DB4C3611C4034FF3AB40B17E57AD939D', '2019-08-02 20:06:04', '31050', '1', null, '丑人', null, '3750DF0DDCC54F3F9AA563C8811BE90A');
INSERT INTO `orders` VALUES ('EC89070EDF0248E88436D701A6489879', '2019-08-15 08:22:17', '300', '1', '保定市莲花池', null, '18333603843', '3750DF0DDCC54F3F9AA563C8811BE90A');
INSERT INTO `orders` VALUES ('F3C08AC0E32340379957F806F225AB8F', '2019-08-16 12:59:17', '150', '1', '朗诗实打实但是', '发鬼地方', '454', '3750DF0DDCC54F3F9AA563C8811BE90A');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` varchar(32) NOT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `pimage` varchar(200) DEFAULT NULL,
  `pdate` date DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `pflag` int(11) DEFAULT '0',
  `cid` varchar(32) DEFAULT NULL,
  `pnumber` int(20) DEFAULT NULL,
  `psale` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `product_fk_0001` (`cid`),
  CONSTRAINT `product_fk_0001` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '适用小米note m4', '1399', '1299', 'products/1/c_0001.jpg', '2015-11-02', '1', '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', '0', '1', null, null);
INSERT INTO `product` VALUES ('10', '华为 Ascend Mate7', '2699', '2599', 'products/1/c_0010.jpg', '2015-11-02', '1', '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', '0', '1', null, null);
INSERT INTO `product` VALUES ('11', 'vivo X5Pro', '2399', '2298', 'products/1/c_0014.jpg', '2015-11-02', '1', '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', '0', '1', null, null);
INSERT INTO `product` VALUES ('12', '努比亚（nubia）My 布拉格', '1899', '1799', 'products/1/c_0013.jpg', '2015-11-02', '0', '努比亚（nubia）My 布拉格 银白 移动联通4G手机 双卡双待【嗨11，下单立减100】金属机身，快速充电！布拉格相机全新体验！', '0', '1', null, null);
INSERT INTO `product` VALUES ('13', '华为 麦芒4', '2599', '2499', 'products/1/c_0012.jpg', '2015-11-02', '1', '华为 麦芒4 晨曦金 全网通版4G手机 双卡双待金属机身 2.5D弧面屏 指纹解锁 光学防抖', '0', '1', null, null);
INSERT INTO `product` VALUES ('14', 'vivo X5M', '1899', '1799', 'products/1/c_0011.jpg', '2015-11-02', '0', 'vivo X5M 移动4G手机 双卡双待 香槟金【购机送蓝牙耳机+蓝牙自拍杆】5.0英寸大屏显示·八核双卡双待·Hi-Fi移动KTV', '0', '1', null, null);
INSERT INTO `product` VALUES ('15', 'Apple iPhone 6 (A1586)', '4399', '4288', 'products/1/c_0015.jpg', '2015-11-02', '1', 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', '0', '1', null, null);
INSERT INTO `product` VALUES ('16', '华为 HUAWEI Mate S 臻享版', '4200', '4087', 'products/1/c_0016.jpg', '2015-11-03', '0', '华为 HUAWEI Mate S 臻享版 手机 极昼金 移动联通双4G(高配)满星评价即返30元话费啦；买就送电源+清水套+创意手机支架；优雅弧屏，mate7升级版', '0', '1', null, null);
INSERT INTO `product` VALUES ('17', '索尼(SONY) E6533 Z3+', '4099', '3999', 'products/1/c_0017.jpg', '2015-11-02', '0', '索尼(SONY) E6533 Z3+ 双卡双4G手机 防水防尘 涧湖绿索尼z3专业防水 2070万像素 移动联通双4G', '0', '1', null, null);
INSERT INTO `product` VALUES ('18', 'HTC One M9+', '3599', '3499', 'products/1/c_0018.jpg', '2015-11-02', '0', 'HTC One M9+（M9pw） 金银汇 移动联通双4G手机5.2英寸，8核CPU，指纹识别，UltraPixel超像素前置相机+2000万/200万后置双镜头相机！降价特卖，惊喜不断！', '0', '1', null, null);
INSERT INTO `product` VALUES ('19', 'HTC Desire 826d 32G 臻珠白', '1599', '1469', 'products/1/c_0020.jpg', '2015-11-02', '1', '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', '0', '1', null, null);
INSERT INTO `product` VALUES ('2', '中兴 AXON', '2899', '2699', 'products/1/c_0002.jpg', '2015-11-05', '1', '中兴 AXON 天机 mini 压力屏版 B2015 华尔金 移动联通电信4G 双卡双待', '0', '1', null, null);
INSERT INTO `product` VALUES ('20', '小米 红米2A 增强版 白色', '649', '549', 'products/1/c_0019.jpg', '2015-11-02', '0', '新增至2GB 内存+16GB容量！4G双卡双待，联芯 4 核 1.5GHz 处理器！', '0', '1', null, null);
INSERT INTO `product` VALUES ('21', '魅族 魅蓝note2 16GB 白色', '1099', '999', 'products/1/c_0021.jpg', '2015-11-02', '0', '现货速抢，抢完即止！5.5英寸1080P分辨率屏幕，64位八核1.3GHz处理器，1300万像素摄像头，双色温双闪光灯！', '0', '1', null, null);
INSERT INTO `product` VALUES ('22', '三星 Galaxy S5 (G9008W) 闪耀白', '2099', '1999', 'products/1/c_0022.jpg', '2015-11-02', '1', '5.1英寸全高清炫丽屏，2.5GHz四核处理器，1600万像素', '0', '1', null, null);
INSERT INTO `product` VALUES ('23', 'sonim XP7700 4G手机', '1799', '1699', 'products/1/c_0023.jpg', '2015-11-09', '1', '三防智能手机 移动/联通双4G 安全 黑黄色 双4G美国军工IP69 30天长待机 3米防水防摔 北斗', '0', '1', null, null);
INSERT INTO `product` VALUES ('24', '努比亚（nubia）Z9精英版 金色', '3988', '3888', 'products/1/c_0024.jpg', '2015-11-02', '1', '移动联通电信4G手机 双卡双待真正的无边框！金色尊贵版！4GB+64GB大内存！', '0', '1', null, null);
INSERT INTO `product` VALUES ('25', 'Apple iPhone 6 Plus (A1524) 16GB 金色', '5188', '4988', 'products/1/c_0025.jpg', '2015-11-02', '0', 'Apple iPhone 6 Plus (A1524) 16GB 金色 移动联通电信4G手机 硬货 硬实力', '0', '1', null, null);
INSERT INTO `product` VALUES ('26', 'Apple iPhone 6s (A1700) 64G 玫瑰金色', '6388', '6088', 'products/1/c_0026.jpg', '2015-11-02', '0', 'Apple iPhone 6 Plus (A1524) 16GB 金色 移动联通电信4G手机 硬货 硬实力', '0', '1', null, null);
INSERT INTO `product` VALUES ('27', '三星 Galaxy Note5（N9200）32G版', '5588', '5388', 'products/1/c_0027.jpg', '2015-11-02', '0', '旗舰机型！5.7英寸大屏，4+32G内存！不一样的SPen更优化的浮窗指令！赠无线充电板！', '0', '1', null, null);
INSERT INTO `product` VALUES ('28', '三星 Galaxy S6 Edge+（G9280）32G版 铂光金', '5999', '5888', 'products/1/c_0028.jpg', '2015-11-02', '0', '赠移动电源+自拍杆+三星OTG金属U盘+无线充电器+透明保护壳', '0', '1', null, null);
INSERT INTO `product` VALUES ('29', 'LG G4（H818）陶瓷白 国际版', '3018', '2978', 'products/1/c_0029.jpg', '2015-11-02', '0', '李敏镐代言，F1.8大光圈1600万后置摄像头，5.5英寸2K屏，3G+32G内存，LG年度旗舰机！', '0', '1', null, null);
INSERT INTO `product` VALUES ('3', '华为荣耀6', '1599', '1499', 'products/1/c_0003.jpg', '2015-11-02', '0', '荣耀 6 (H60-L01) 3GB内存标准版 黑色 移动4G手机', '0', '1', null, null);
INSERT INTO `product` VALUES ('30', '微软(Microsoft) Lumia 640 LTE DS (RM-1113)', '1099', '999', 'products/1/c_0030.jpg', '2015-11-02', '0', '微软首款双网双卡双4G手机，5.0英寸高清大屏，双网双卡双4G！', '0', '1', null, null);
INSERT INTO `product` VALUES ('31', '宏碁（acer）ATC705-N50 ', '2399', '2299', 'products/1/c_0031.jpg', '2015-11-02', '0', '爆款直降，满千减百，品质宏碁，特惠来袭，何必苦等11.11，早买早便宜！', '0', '2', null, null);
INSERT INTO `product` VALUES ('32', 'Apple MacBook Air ', '6788', '6688', 'products/1/c_0032.jpg', '2015-11-02', '0', '宽屏笔记本电脑 128GB 闪存', '0', '2', null, null);
INSERT INTO `product` VALUES ('33', '联想（ThinkPad） 轻薄系列E450C(20EH0001CD)', '4399', '4199', 'products/1/c_0033.jpg', '2015-11-02', '0', '联想（ThinkPad） 轻薄系列E450C(20EH0001CD)14英寸笔记本电脑(i5-4210U 4G 500G 2G独显 Win8.1)', '0', '2', null, null);
INSERT INTO `product` VALUES ('34', '联想（Lenovo）小新V3000经典版', '4599', '4499', 'products/1/c_0034.jpg', '2015-11-02', '0', '14英寸超薄笔记本电脑（i7-5500U 4G 500G+8G SSHD 2G独显 全高清屏）黑色满1000減100，狂减！火力全开，横扫3天！', '0', '2', null, null);
INSERT INTO `product` VALUES ('35', '华硕（ASUS）经典系列R557LI', '3799', '3699', 'products/1/c_0035.jpg', '2015-11-02', '0', '15.6英寸笔记本电脑（i5-5200U 4G 7200转500G 2G独显 D刻 蓝牙 Win8.1 黑色）', '0', '2', null, null);
INSERT INTO `product` VALUES ('36', '华硕（ASUS）X450J', '4599', '4399', 'products/1/c_0036.jpg', '2015-11-02', '0', '14英寸笔记本电脑 （i5-4200H 4G 1TB GT940M 2G独显 蓝牙4.0 D刻 Win8.1 黑色）', '0', '2', null, null);
INSERT INTO `product` VALUES ('37', '戴尔（DELL）灵越 飞匣3000系列', '3399', '3299', 'products/1/c_0037.jpg', '2015-11-03', '0', ' Ins14C-4528B 14英寸笔记本（i5-5200U 4G 500G GT820M 2G独显 Win8）黑', '0', '2', null, null);
INSERT INTO `product` VALUES ('38', '惠普(HP)WASD 暗影精灵', '5699', '5499', 'products/1/c_0038.jpg', '2015-11-02', '0', '15.6英寸游戏笔记本电脑(i5-6300HQ 4G 1TB+128G SSD GTX950M 4G独显 Win10)', '0', '2', null, null);
INSERT INTO `product` VALUES ('39', 'Apple 配备 Retina 显示屏的 MacBook', '11299', '10288', 'products/1/c_0039.jpg', '2015-11-02', '0', 'Pro MF840CH/A 13.3英寸宽屏笔记本电脑 256GB 闪存', '0', '2', null, null);
INSERT INTO `product` VALUES ('4', '联想 P1', '2199', '1999', 'products/1/c_0004.jpg', '2015-11-02', '0', '联想 P1 16G 伯爵金 移动联通4G手机充电5分钟，通话3小时！科技源于超越！品质源于沉淀！5000mAh大电池！高端商务佳配！', '0', '1', null, null);
INSERT INTO `product` VALUES ('40', '机械革命（MECHREVO）MR X6S-M', '6799', '6599', 'products/1/c_0040.jpg', '2015-11-02', '0', '15.6英寸游戏本(I7-4710MQ 8G 64GSSD+1T GTX960M 2G独显 IPS屏 WIN7)黑色', '0', '2', null, null);
INSERT INTO `product` VALUES ('41', '神舟（HASEE） 战神K660D-i7D2', '5699', '5499', 'products/1/c_0041.jpg', '2015-11-02', '0', '15.6英寸游戏本(i7-4710MQ 8G 1TB GTX960M 2G独显 1080P)黑色', '0', '2', null, null);
INSERT INTO `product` VALUES ('42', '微星（MSI）GE62 2QC-264XCN', '6199', '5999', 'products/1/c_0042.jpg', '2015-11-02', '0', '15.6英寸游戏笔记本电脑（i5-4210H 8G 1T GTX960MG DDR5 2G 背光键盘）黑色', '0', '2', null, null);
INSERT INTO `product` VALUES ('43', '雷神（ThundeRobot）G150S', '5699', '5499', 'products/1/c_0043.jpg', '2015-11-02', '0', '15.6英寸游戏本 ( i7-4710MQ 4G 500G GTX950M 2G独显 包无亮点全高清屏) 金', '0', '2', null, null);
INSERT INTO `product` VALUES ('44', '惠普（HP）轻薄系列 HP', '3199', '3099', 'products/1/c_0044.jpg', '2015-11-02', '0', '15-r239TX 15.6英寸笔记本电脑（i5-5200U 4G 500G GT820M 2G独显 win8.1）金属灰', '0', '2', null, null);
INSERT INTO `product` VALUES ('45', '未来人类（Terrans Force）T5', '10999', '9899', 'products/1/c_0045.jpg', '2015-11-02', '0', '15.6英寸游戏本（i7-5700HQ 16G 120G固态+1TB GTX970M 3G GDDR5独显）黑', '0', '2', null, null);
INSERT INTO `product` VALUES ('46', '戴尔（DELL）Vostro 3800-R6308 台式电脑', '3299', '3199', 'products/1/c_0046.jpg', '2015-11-02', '0', '（i3-4170 4G 500G DVD 三年上门服务 Win7）黑', '0', '2', null, null);
INSERT INTO `product` VALUES ('47', '联想（Lenovo）H3050 台式电脑', '5099', '4899', 'products/1/c_0047.jpg', '2015-11-11', '0', '（i5-4460 4G 500G GT720 1G独显 DVD 千兆网卡 Win10）23英寸', '0', '2', null, null);
INSERT INTO `product` VALUES ('48', 'Apple iPad mini 2 ME279CH/A', '2088', '1888', 'products/1/c_0048.jpg', '2015-11-02', '0', '（配备 Retina 显示屏 7.9英寸 16G WLAN 机型 银色）', '0', '2', null, null);
INSERT INTO `product` VALUES ('49', '小米（MI）7.9英寸平板', '1399', '1299', 'products/1/c_0049.jpg', '2015-11-02', '0', 'WIFI 64GB（NVIDIA Tegra K1 2.2GHz 2G 64G 2048*1536视网膜屏 800W）白色', '0', '2', null, null);
INSERT INTO `product` VALUES ('5', '摩托罗拉 moto x（x+1）', '1799', '1699', 'products/1/c_0005.jpg', '2015-11-01', '0', '摩托罗拉 moto x（x+1）(XT1085) 32GB 天然竹 全网通4G手机11月11天！MOTO X震撼特惠来袭！1699元！带你玩转黑科技！天然材质，原生流畅系统！', '0', '1', null, null);
INSERT INTO `product` VALUES ('50', 'Apple iPad Air 2 MGLW2CH/A', '2399', '2299', 'products/1/c_0050.jpg', '2015-11-12', '0', '（9.7英寸 16G WLAN 机型 银色）', '0', '2', null, null);
INSERT INTO `product` VALUES ('51', '短裙', '160', '150', 'store_img/1.png', '2019-08-15', '1', '发送的好看', '0', '59f56ba6ccb84cb591c66298766b83b5', '87', '43');
INSERT INTO `product` VALUES ('52', '测试妈妈服装', '190', '150', 'store_img/2.png', '2019-08-14', '1', '好看', '0', '59f56ba6ccb84cb591c66298766b83b5', '80', '20');
INSERT INTO `product` VALUES ('53', '妈妈衬衣', '150', '143', 'store_img/3.png', '2019-08-14', '1', '非常好看哦', '0', '59f56ba6ccb84cb591c66298766b83b5', '60', '10');
INSERT INTO `product` VALUES ('54', '妈妈裙子', '143', '110', 'store_img/5.png', '2019-08-14', '1', null, '0', '59f56ba6ccb84cb591c66298766b83b5', '40', '6');
INSERT INTO `product` VALUES ('5EC4B15929394921A117F0BBCC5CB732', 'O(∩_∩)O哈哈~', '10', '10', '/store_img//d/e/b/3/6/b/a/7/3595F0C0F7D941FE825A27EFFC077DA9.png', '2019-08-25', '1', '覆盖', '1', '1', '0', '0');
INSERT INTO `product` VALUES ('6', '魅族 MX5 16GB 银黑色', '1899', '1799', 'products/1/c_0006.jpg', '2015-11-02', '0', '魅族 MX5 16GB 银黑色 移动联通双4G手机 双卡双待送原厂钢化膜+保护壳+耳机！5.5英寸大屏幕，3G运行内存，2070万+500万像素摄像头！长期省才是真的省！', '0', '1', null, null);
INSERT INTO `product` VALUES ('60', '白色婚纱', '10000', '9999', 'store_img/60.jpg', '2019-08-16', '1', '婚纱礼服新娘婚纱2019新款齐地婚纱女小个子显瘦韩式婚纱一字肩', '0', '6', '198', '61');
INSERT INTO `product` VALUES ('61', '红色婚纱', '12000', '9800', 'store_img/61.jpg', '2019-08-16', '1', '秀禾服新娘2019新款中式婚纱礼服结婚服古代绣禾和服敬酒秀禾夏季', '0', '6', '80', '80');
INSERT INTO `product` VALUES ('7', '三星 Galaxy On7', '1499', '1398', 'products/1/c_0007.jpg', '2015-11-14', '0', '三星 Galaxy On7（G6000）昂小七 金色 全网通4G手机 双卡双待新品火爆抢购中！京东尊享千元良机！5.5英寸高清大屏！1300+500W像素！评价赢30元话费券！', '0', '1', null, null);
INSERT INTO `product` VALUES ('77D982EBE32A4527BD1A6B231C07B629', 'mam', '10', '10', 'D:\\APP\\Tomcat\\apache-tomcat-8.0.52\\wtpwebapps\\store\\store_img\\/a/b/d/b/d/6/d/e/FD2C91B385904DB69042A1F6EC751649.jpg', '2019-08-15', '1', 'gfg ', '1', '1', null, null);
INSERT INTO `product` VALUES ('7BAE5B4F2027425F846E54DB9F418971', '覆盖', '10', '1', '/store_img//0/b/c/d/4/3/4/e/A607FB7F1C9240C883AFCAD0001513DD.png', '2019-08-25', '1', '光环境', '1', '1', '0', '0');
INSERT INTO `product` VALUES ('8', 'NUU NU5', '1288', '1190', 'products/1/c_0008.jpg', '2015-11-02', '0', 'NUU NU5 16GB 移动联通双4G智能手机 双卡双待 晒单有礼 晨光金香港品牌 2.5D弧度前后钢化玻璃 随机附赠手机套+钢化贴膜 晒单送移动电源+蓝牙耳机', '0', '1', null, null);
INSERT INTO `product` VALUES ('9', '乐视（Letv）乐1pro（X800）', '2399', '2299', 'products/1/c_0009.jpg', '2015-11-02', '0', '乐视（Letv）乐1pro（X800）64GB 金色 移动联通4G手机 双卡双待乐视生态UI+5.5英寸2K屏+高通8核处理器+4GB运行内存+64GB存储+1300万摄像头！', '0', '1', null, null);
INSERT INTO `product` VALUES ('B9D0DFE620454DD59D3BE498EB4B36C9', '规范', '10', '10', '/store_img//2/e/f/7/b/f/3/c/A8DEC15E8E64447DB43B142AF3E63423.png', '2019-08-25', '1', '覆盖', '1', '1', '0', '0');
INSERT INTO `product` VALUES ('DD89ACAB8F004831BC96E53D24DF4415', '导师的', '100', '10', '/store_img//b/7/5/c/9/e/d/8/F980F39B817C491C94D92A991C3D2330.png', '2019-08-25', '1', '梵蒂冈', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(32) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3750DF0DDCC54F3F9AA563C8811BE90A', 'zz', '123456', '美666', 'aaa@store.com', '18333603843', '2019-07-03', '女', '1', null);
INSERT INTO `user` VALUES ('adfdgfsfdsdf', 'wangyining', 'wangyining502', '梦宇', '123456@qq.com', '53245532453', '2010-01-01', '女', '1', null);
INSERT INTO `user` VALUES ('D2E9F3AF313241A59424C971064A628C', 'wang', '123456', '王一宁', '123456@qq.com', '18333603843', '2019-07-18', '男', '1', 'FB717DE4BD3E46098FFD98CCBFE51605');

-- ----------------------------
-- Table structure for user2
-- ----------------------------
DROP TABLE IF EXISTS `user2`;
CREATE TABLE `user2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user2
-- ----------------------------
INSERT INTO `user2` VALUES ('1', 'wang', '202cb962ac59075b964b07152d234b70');
INSERT INTO `user2` VALUES ('2', 'wang1', '202cb962ac59075b964b07152d234b70');
