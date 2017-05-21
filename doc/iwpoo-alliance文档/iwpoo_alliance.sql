/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.113
Source Server Version : 50173
Source Host           : 192.168.1.113:3306
Source Database       : iwpoo_alliance

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-07-16 11:45:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `alliance_hot_article`
-- ----------------------------
DROP TABLE IF EXISTS `alliance_hot_article`;
CREATE TABLE `alliance_hot_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) DEFAULT '0' COMMENT '媒体ID',
  `hot_article_name` varchar(255) DEFAULT NULL COMMENT '热门文章标题',
  `exposure_num` int(11) DEFAULT NULL COMMENT '热门文章曝光量',
  `read_num` int(11) DEFAULT NULL COMMENT '热门文章阅读量',
  `hot_article_link` varchar(255) DEFAULT NULL COMMENT '热门文章原文链接',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alliance_hot_article
-- ----------------------------
INSERT INTO `alliance_hot_article` VALUES ('64', '224', 'ddddd', '2222', '23333', 'http://www.baidu.com');
INSERT INTO `alliance_hot_article` VALUES ('114', '13', '小狗和小猫打架了么', '1234556', '1235555', 'http://xiaogou.xiaomeo.com');
INSERT INTO `alliance_hot_article` VALUES ('72', '13', '热文添加测试', '88888', '7777', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('42', '440', '989898', '9898', '9898', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('44', '336', '444444', '44', '444', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('45', '336', '6565', '565', '6565', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('47', '13', '修改测试', '33333', '2222', 'http://47.47.sss');
INSERT INTO `alliance_hot_article` VALUES ('34', '224', '修改278678', '222678678', '222678678', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('31', '224', '修改3', '3333', '33333', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('65', '224', '1313', '4124', '324234', 'http://www.baidu.com');
INSERT INTO `alliance_hot_article` VALUES ('49', '0', 'qq', '11', '11', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('50', '0', '3323', '233', '3232', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('51', '14', '测试1', '111', '111', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('52', '15', '测试2', '222', '222', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('53', '0', '测试3', '333', '333', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('55', '224', '测试5yy', '55555', '555555', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('56', '224', '测试6', '666', '666', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('57', '319', '测试7', '7877', '777', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('58', '224', '修改11', '12121212', '121212', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('59', '224', '添加288', '22888', '2228888', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('60', '224', '添加37867', '333367868', '33367867', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('61', '319', '最终测试1', '111', '111', 'http://www.wo.com');
INSERT INTO `alliance_hot_article` VALUES ('69', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('113', '13', '1235', '2135', '1235', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('115', '13', '公司', '123', '123', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('77', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('78', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('79', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('80', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('81', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('82', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('83', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('84', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('85', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('86', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('87', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('88', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('89', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('90', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('91', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('92', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('93', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('94', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('95', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('96', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('97', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('98', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('99', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('100', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('101', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('102', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('103', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('104', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('105', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('106', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('107', '13', '热文添加测试', '11111', '222', 'http://sss.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('108', '0', '添加', '123', '1234', 'http://hhh.sss.sss');
INSERT INTO `alliance_hot_article` VALUES ('109', '13', '更多', '123', '1234', 'http://sss.sss.ss');
INSERT INTO `alliance_hot_article` VALUES ('110', '13', 'fff', '2222', '2222', 'http://sss.sss.ddd');
INSERT INTO `alliance_hot_article` VALUES ('111', '13', 'fdsfas', '1231', '123123', 'http://sss.sss.sss');

-- ----------------------------
-- Table structure for `alliance_picture`
-- ----------------------------
DROP TABLE IF EXISTS `alliance_picture`;
CREATE TABLE `alliance_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) DEFAULT '0' COMMENT '媒体ID',
  `picture_url` varchar(255) DEFAULT '' COMMENT '图片路径',
  `description` varchar(512) DEFAULT NULL COMMENT '图片简介,描述',
  `weight` int(11) DEFAULT '0' COMMENT '权重',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int(3) DEFAULT '0' COMMENT '标记位 是否显示 0默认显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alliance_picture
-- ----------------------------
INSERT INTO `alliance_picture` VALUES ('49', '13', '/images/prove-images/20150715163532951016.jpg', '换个房间66', '16', null, null, '0');
INSERT INTO `alliance_picture` VALUES ('3', '13', '/images/prove-images/3.jpg', '这还是', '2', '2015-07-10 12:11:57', '2015-07-10 12:12:02', '0');
INSERT INTO `alliance_picture` VALUES ('46', '13', '/images/prove-images/4.jpg', '2222', '5', null, null, '1');

-- ----------------------------
-- Table structure for `media`
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '媒体ID',
  `media_name` varchar(255) DEFAULT NULL COMMENT '媒体名称',
  `media_portrait` varchar(255) DEFAULT NULL COMMENT '媒体头像',
  `phone` varchar(20) DEFAULT '' COMMENT '联系电话',
  `identity_card` varchar(20) DEFAULT '' COMMENT '身份证号',
  `media_materials` text COMMENT '媒体资料简介',
  `weixin_pubilc` varchar(255) DEFAULT NULL COMMENT '微信公众号',
  `contacts` varchar(255) DEFAULT NULL COMMENT '联系人',
  `contacts_mail` varchar(255) DEFAULT NULL COMMENT '联系人邮箱',
  `contacts_weixin` varchar(255) DEFAULT NULL COMMENT '联系人的微信',
  `status` int(11) DEFAULT '1' COMMENT '状态栏',
  `two_dimension_code` varchar(255) DEFAULT NULL COMMENT '二维码图片地址',
  `weight` int(11) DEFAULT '1000' COMMENT '权重，数值大的排在前面',
  PRIMARY KEY (`media_id`)
) ENGINE=MyISAM AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES ('227', '的司法', '/images/media-images/20150715164956819746.jpg', '123', '123', '123', '123', null, null, null, '1', '/images/media-images/20150715164956821893.jpg', '45');
INSERT INTO `media` VALUES ('14', '财经修改', '/images/media-images/20150714184059729996.jpg', '4444', '1111', '修改修改修改修改', 'asdf', '小黑黑', 'xiaohei@163.com', 'weixinhao', '0', '/images/media-images/20150714184059733713.jpg', '4');
INSERT INTO `media` VALUES ('225', '123789', '/images/media-images/20150715164533832934.jpg', '123', '123', '123', '123', null, null, null, '1', '/images/media-images/20150715164533835900.jpg', '19');
INSERT INTO `media` VALUES ('13', '晨读修改', '/images/media-images/1.jpg', '33333', '11111', '修改修改修改修改修改', '12345', '小黄黄', 'xiaohuang@163.com', 'weixinhao', '0', '/images/media-images/erweima.png', '3');
INSERT INTO `media` VALUES ('226', '前往二七巍峨', '/images/media-images/20150715164828885925.jpg', '123', '123', '123', '123', null, null, null, '1', '/images/media-images/20150715164828887090.jpg', '45');
INSERT INTO `media` VALUES ('23', '11111', '/images/media-images/20150715114411128703.jpg', '111111', '111111', '修改修改修改修改修改修改', '111111', '花姑娘1', 'xiao@163.com', 'weixinhao', '0', '/images/media-images/20150715114543086019.jpg', '7');
INSERT INTO `media` VALUES ('223', '湖景房', '/images/media-images/', '234', '123', '123', '', null, null, null, '1', '/images/media-images/', '15');
INSERT INTO `media` VALUES ('211', '虾米王子', '/images/media-images/20150715115743225641.jpg', '213', '123', '123', '123', null, null, null, '0', '/images/media-images/20150715115714518932.jpg', '15');
INSERT INTO `media` VALUES ('222', '广发华福', '/images/media-images/20150715163338547381.jpg', '', '123', '华国锋', '', null, null, null, '1', '/images/media-images/20150715163338551038.jpg', '345');
INSERT INTO `media` VALUES ('212', '发', '/images/media-images/20150715121257432407.jpg', '', '', '个非官方', '', null, null, null, '3', '/images/media-images/20150715121257436588.jpg', '66');
INSERT INTO `media` VALUES ('213', '换个', '/images/media-images/', '', '', '房改房', '', null, null, null, '1', '/images/media-images/20150715121232759123.jpg', '16');
INSERT INTO `media` VALUES ('214', '秦莞尔', '/images/media-images/20150715155116458839.jpg', '123', '123', '法师打发第三方', 'sdf', null, null, null, '1', '/images/media-images/20150715155116461440.jpg', '11');
INSERT INTO `media` VALUES ('215', '秦莞尔', '/images/media-images/20150715155139854805.jpg', '123', '123', '法师打发第三方', 'sdf', null, null, null, '1', '/images/media-images/20150715155139858221.jpg', '11');
INSERT INTO `media` VALUES ('216', '大幅度', '/images/media-images/20150715155258327604.jpg', '123', '123', '123123123', '123123', null, null, null, '1', '/images/media-images/20150715155258331214.jpg', '13');
INSERT INTO `media` VALUES ('217', '晋江经济报', '/images/media-images/20150715155515857519.jpg', '888', '888', '8888', '888', null, null, null, '1', '/images/media-images/20150715155515859830.jpg', '10');
INSERT INTO `media` VALUES ('218', '345', '/images/media-images/20150715155932779943.jpg', '345', '345', '345', '345', null, null, null, '1', '/images/media-images/20150715155932781589.jpg', '55');
INSERT INTO `media` VALUES ('219', '12345678', '/images/media-images/20150715160958462338.jpg', '123', '123', '123', '123', null, null, null, '1', '/images/media-images/20150715160958465071.jpg', '17');
INSERT INTO `media` VALUES ('220', '国际化功夫', '/images/media-images/20150715162617690324.jpg', '234', '123', '213', '12', null, null, null, '1', '/images/media-images/20150715162617693721.jpg', '15');
INSERT INTO `media` VALUES ('221', '6677', '/images/media-images/20150715162650325449.jpg', '6767', '123', '123', '123', null, null, null, '1', '/images/media-images/20150715162650329823.jpg', '16');

-- ----------------------------
-- Table structure for `statistics_media`
-- ----------------------------
DROP TABLE IF EXISTS `statistics_media`;
CREATE TABLE `statistics_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL DEFAULT '0' COMMENT '媒体ID',
  `read_num` int(11) DEFAULT '0' COMMENT '累计阅读量',
  `new_read_num` int(11) DEFAULT '0' COMMENT '昨日新增阅读量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of statistics_media
-- ----------------------------
INSERT INTO `statistics_media` VALUES ('1', '13', '666', '67611111');
INSERT INTO `statistics_media` VALUES ('2', '23', '8888', '5555');
INSERT INTO `statistics_media` VALUES ('3', '212', '333', '333');
INSERT INTO `statistics_media` VALUES ('4', '219', '4545', '45454');
INSERT INTO `statistics_media` VALUES ('5', '220', '0', '0');
INSERT INTO `statistics_media` VALUES ('6', '221', '0', '0');
INSERT INTO `statistics_media` VALUES ('7', '222', '45', '456');
INSERT INTO `statistics_media` VALUES ('8', '223', '0', '0');
INSERT INTO `statistics_media` VALUES ('9', '224', '0', '0');
INSERT INTO `statistics_media` VALUES ('10', '225', '0', '0');
INSERT INTO `statistics_media` VALUES ('11', '226', '0', '0');
INSERT INTO `statistics_media` VALUES ('12', '227', '0', '0');
