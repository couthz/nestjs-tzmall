/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : tz_shops

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 05/12/2023 09:32:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for content_categories
-- ----------------------------
DROP TABLE IF EXISTS `content_categories`;
CREATE TABLE `content_categories` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `customOrder` int NOT NULL DEFAULT '0' COMMENT '分类排序',
  `deletedAt` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `mpath` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `parentId` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a03aea27707893300382b6f18ae` (`parentId`),
  FULLTEXT KEY `IDX_d6aaf8517ca57297a8c3a44d3d` (`name`),
  CONSTRAINT `FK_a03aea27707893300382b6f18ae` FOREIGN KEY (`parentId`) REFERENCES `content_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content_categories
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for content_comments
-- ----------------------------
DROP TABLE IF EXISTS `content_comments`;
CREATE TABLE `content_comments` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `body` text COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `mpath` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `parentId` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `postId` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_982a849f676860e5d6beb607f20` (`parentId`),
  KEY `FK_5e1c3747a0031f305e94493361f` (`postId`),
  FULLTEXT KEY `IDX_5f70a0489331d4346e46ea4d88` (`body`),
  CONSTRAINT `FK_5e1c3747a0031f305e94493361f` FOREIGN KEY (`postId`) REFERENCES `content_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_982a849f676860e5d6beb607f20` FOREIGN KEY (`parentId`) REFERENCES `content_comments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content_comments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for content_posts
-- ----------------------------
DROP TABLE IF EXISTS `content_posts`;
CREATE TABLE `content_posts` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标题',
  `body` text COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `summary` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章描述',
  `keywords` text COLLATE utf8mb4_general_ci COMMENT '关键字',
  `type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'markdown' COMMENT '文章类型',
  `publishedAt` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发布时间',
  `customOrder` int NOT NULL DEFAULT '0' COMMENT '自定义文章排序',
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `deletedAt` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `categoryId` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4027367881933f659d02f367e92` (`categoryId`),
  FULLTEXT KEY `IDX_9ef6db9d13df6882d36c8af0cc` (`title`),
  FULLTEXT KEY `IDX_e51068c39974ca11fae5d44c88` (`body`),
  FULLTEXT KEY `IDX_f43723dc196c18767a3893a3f7` (`summary`),
  CONSTRAINT `FK_4027367881933f659d02f367e92` FOREIGN KEY (`categoryId`) REFERENCES `content_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content_posts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for content_posts_tags_content_tags
-- ----------------------------
DROP TABLE IF EXISTS `content_posts_tags_content_tags`;
CREATE TABLE `content_posts_tags_content_tags` (
  `contentPostsId` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `contentTagsId` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`contentPostsId`,`contentTagsId`),
  KEY `IDX_1e8c41827d0d509e70de1f6b70` (`contentPostsId`),
  KEY `IDX_888e6754015ee17f9e22faae57` (`contentTagsId`),
  CONSTRAINT `FK_1e8c41827d0d509e70de1f6b70e` FOREIGN KEY (`contentPostsId`) REFERENCES `content_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_888e6754015ee17f9e22faae578` FOREIGN KEY (`contentTagsId`) REFERENCES `content_tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content_posts_tags_content_tags
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for content_tags
-- ----------------------------
DROP TABLE IF EXISTS `content_tags`;
CREATE TABLE `content_tags` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签描述',
  `deletedAt` datetime(6) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `IDX_6f504a08a58010e15c55b1eb23` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content_tags
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, 1698743829544, 'HXTsWH1698743829544');
INSERT INTO `migrations` VALUES (2, 1701083939439, 'IIGOHl1701083939439');
INSERT INTO `migrations` VALUES (3, 1701148566410, 'Ecxbkh1701148566410');
INSERT INTO `migrations` VALUES (4, 1701148658444, 'XXfqRG1701148658444');
INSERT INTO `migrations` VALUES (5, 1701152514117, 'HHdGgX1701152514117');
INSERT INTO `migrations` VALUES (6, 1701667918109, 'LMBgrv1701667918109');
COMMIT;

-- ----------------------------
-- Table structure for tz_order
-- ----------------------------
DROP TABLE IF EXISTS `tz_order`;
CREATE TABLE `tz_order` (
  `order_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_number` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '订购流水号',
  `total_count` int DEFAULT NULL COMMENT '订单商品总数',
  `user_id` bigint NOT NULL COMMENT '订购用户ID',
  `total_pay` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `pay_type` enum('1','2') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '支付方式1 微信支付 2 支付宝',
  `buyer_remark` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单备注',
  `status` int NOT NULL DEFAULT '100' COMMENT '订单状态 100-待付款 101-已付款待发货 102-已发货待收货 103-已收货待评价 104-交易成功 200-交易关闭',
  `transfee` decimal(15,2) DEFAULT '0.00' COMMENT '订单运费',
  `order_addr_id` bigint unsigned DEFAULT NULL COMMENT '用户订单地址Id',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '订购时间',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '订单更新时间',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `dvy_time` datetime DEFAULT NULL COMMENT '发货时间',
  `finally_time` datetime DEFAULT NULL COMMENT '完成时间',
  `cancel_time` datetime DEFAULT NULL COMMENT '取消时间',
  `is_payed` int NOT NULL DEFAULT '0' COMMENT '是否支付 0 未支付 1 已支付',
  `delete_status` int NOT NULL DEFAULT '0' COMMENT '状态(1为已删除,0为未删除)',
  `reduce_amount` decimal(15,2) DEFAULT '0.00' COMMENT '优惠总额',
  `close_type` enum('0','1','2','3','4') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '订单关闭类型 0-订单活跃 1-超时未支付 2-退款关闭 3-卖家关闭 4-买家关闭',
  `prod_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称，以逗号分隔',
  `change_price` decimal(10,2) DEFAULT NULL COMMENT '商家改价',
  `user_mobile` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_wechat` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_number_userid_unique_ind` (`order_number`,`user_id`),
  UNIQUE KEY `order_number_unique_ind` (`order_number`),
  UNIQUE KEY `IDX_833d6865f234d894fad00a172c` (`order_number`),
  UNIQUE KEY `REL_8ced78aef02528e4d1938be025` (`order_addr_id`),
  CONSTRAINT `FK_8ced78aef02528e4d1938be025d` FOREIGN KEY (`order_addr_id`) REFERENCES `tz_order_addr` (`order_addr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_order
-- ----------------------------
BEGIN;
INSERT INTO `tz_order` VALUES (1, 'c066a0b2-2dd8-49c2-8f18-4dc140ea477b', 1, 2, 10999.00, '1', NULL, 100, 0.00, 1, '2023-12-04 20:35:31.681370', '2023-12-05 08:37:09.042088', NULL, NULL, NULL, NULL, 0, 0, 0.00, '0', NULL, NULL, '', '');
INSERT INTO `tz_order` VALUES (2, '8efa2417-a836-48e3-a85b-0bab0ab0effe', 1, 2, 10999.00, '1', NULL, 100, 0.00, 2, '2023-12-04 20:58:32.106252', '2023-12-05 08:36:38.676953', NULL, NULL, NULL, NULL, 0, 0, 0.00, '0', NULL, NULL, '', '');
INSERT INTO `tz_order` VALUES (3, 'dfa3b1ce-a9c9-405b-a990-066f9ec49d79', 1, 2, 10999.00, '1', NULL, 100, 0.00, 3, '2023-12-04 20:59:26.732378', '2023-12-05 08:36:38.006391', NULL, NULL, NULL, NULL, 0, 0, 0.00, '0', NULL, NULL, '', '');
INSERT INTO `tz_order` VALUES (4, 'c25dcc08-1df1-4c29-aab1-1af8267c9a50', 1, 2, 10999.00, '1', NULL, 100, 0.00, 4, '2023-12-04 21:00:40.226801', '2023-12-05 08:36:37.328549', NULL, NULL, NULL, NULL, 0, 0, 0.00, '0', NULL, NULL, '', '');
INSERT INTO `tz_order` VALUES (5, '406399f0-c9dc-4d89-a501-43af2de25140', 1, 2, 10999.00, '1', NULL, 100, 0.00, 5, '2023-12-04 21:04:22.832820', '2023-12-05 08:36:36.633176', NULL, NULL, NULL, NULL, 0, 0, 0.00, '0', NULL, NULL, '', '');
INSERT INTO `tz_order` VALUES (6, '962fcd9e-1757-4327-9b72-43e1ea6d7424', 1, 2, 10999.00, '1', NULL, 100, 0.00, 6, '2023-12-04 21:05:54.951422', '2023-12-05 08:36:36.002387', NULL, NULL, NULL, NULL, 0, 0, 0.00, '0', NULL, NULL, '', '');
INSERT INTO `tz_order` VALUES (7, 'b5e43d0f-651e-41f6-9e57-3c8b25f77455', 1, 2, 10999.00, '1', NULL, 100, 0.00, 7, '2023-12-04 21:06:58.139203', '2023-12-05 08:36:35.201129', NULL, NULL, NULL, NULL, 0, 0, 0.00, '0', NULL, NULL, '', '');
INSERT INTO `tz_order` VALUES (8, 'a98d8aa0-db49-4110-b9fb-1bcbb8bd46ab', 1, 2, 10999.00, '1', NULL, 100, 0.00, 8, '2023-12-04 21:30:05.581094', '2023-12-05 08:36:34.524409', NULL, NULL, NULL, NULL, 0, 0, 0.00, '0', NULL, NULL, '', '');
INSERT INTO `tz_order` VALUES (9, '195f3146-5ad7-4315-ab93-a7c2ae72901e', 1, 2, 10999.00, '1', NULL, 100, 0.00, 9, '2023-12-04 21:30:28.203943', '2023-12-05 08:36:33.672627', NULL, NULL, NULL, NULL, 0, 0, 0.00, '0', NULL, NULL, '', '');
INSERT INTO `tz_order` VALUES (10, '733fe285-f53a-4b97-a526-2f2e4a70b50a', 1, 2, 10999.00, '1', NULL, 100, 0.00, 10, '2023-12-04 21:32:09.430575', '2023-12-04 21:32:09.430575', NULL, NULL, NULL, NULL, 0, 0, NULL, '0', NULL, NULL, '', '');
INSERT INTO `tz_order` VALUES (11, '72fd4b3a-0d88-4761-a8f7-7f817776e893', 1, 2, 10999.00, '1', NULL, 100, 0.00, 11, '2023-12-04 21:34:47.085732', '2023-12-04 21:34:47.085732', NULL, NULL, NULL, NULL, 0, 0, NULL, '0', NULL, NULL, '', '');
INSERT INTO `tz_order` VALUES (12, '13ea9fb2-a14a-4891-9d20-a20cc7456660', 1, 2, 10999.00, '1', NULL, 100, 0.00, 12, '2023-12-04 21:36:14.701311', '2023-12-04 21:36:14.701311', NULL, NULL, NULL, NULL, 0, 0, NULL, '0', NULL, NULL, '', '');
COMMIT;

-- ----------------------------
-- Table structure for tz_order_addr
-- ----------------------------
DROP TABLE IF EXISTS `tz_order_addr`;
CREATE TABLE `tz_order_addr` (
  `order_addr_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `addr_id` bigint unsigned NOT NULL COMMENT '地址ID',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID',
  `receiver` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人',
  `province_id` bigint DEFAULT NULL COMMENT '省ID',
  `province` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '省',
  `area_id` bigint DEFAULT NULL COMMENT '区域ID',
  `area` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区',
  `city_id` bigint DEFAULT NULL COMMENT '城市ID',
  `city` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '城市',
  `addr` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `post_code` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮编',
  `mobile` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '建立时间',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`order_addr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_order_addr
-- ----------------------------
BEGIN;
INSERT INTO `tz_order_addr` VALUES (1, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` VALUES (2, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` VALUES (3, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` VALUES (4, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` VALUES (5, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` VALUES (6, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` VALUES (7, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` VALUES (8, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` VALUES (9, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` VALUES (10, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` VALUES (11, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` VALUES (12, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
COMMIT;

-- ----------------------------
-- Table structure for tz_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tz_order_item`;
CREATE TABLE `tz_order_item` (
  `order_item_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '订单项ID',
  `order_id` bigint unsigned NOT NULL COMMENT '订单ID',
  `order_number` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单order_number',
  `prod_id` bigint unsigned NOT NULL COMMENT '产品ID',
  `sku_id` bigint unsigned NOT NULL COMMENT '产品SkuID',
  `item_count` int NOT NULL DEFAULT '0' COMMENT '购物车产品个数',
  `prod_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `sku_name` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku名称',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品主图片路径',
  `price` decimal(15,2) NOT NULL COMMENT '产品价格',
  `user_id` bigint NOT NULL COMMENT '用户Id',
  `total_pay` decimal(15,2) NOT NULL COMMENT '商品总金额',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '购物时间',
  `comm_sts` enum('0','1') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '评论状态 0 未评论 1 已评论',
  `add_shopcart_date` datetime DEFAULT NULL COMMENT '加入购物车时间',
  `aftersale_status` int NOT NULL COMMENT '售后状态：0 未售后 100 退款中 101 换货中 200 退款成功 201 换货成功 300 退款关闭 301 换货关闭',
  `delivery_status` enum('0','1') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '发货状态 0 未发货 1 已发货 2 已收货',
  `dvy_flow_numbers` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_number` (`order_number`),
  KEY `FK_fbe47b28f30750ed81a745ba5f6` (`order_id`),
  CONSTRAINT `FK_fbe47b28f30750ed81a745ba5f6` FOREIGN KEY (`order_id`) REFERENCES `tz_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_order_item
-- ----------------------------
BEGIN;
INSERT INTO `tz_order_item` VALUES (1, 3, 'dfa3b1ce-a9c9-405b-a990-066f9ec49d79', 4, 120, 1, 'Apple iPhone XS Max 移动联通电信4G手机  公开版 金色 64GB ', '公开版 金色 64GB ', NULL, 10999.00, 2, 10999.00, '2023-12-04 20:59:26.753168', '0', '2023-12-04 18:25:54', 0, '0', NULL);
INSERT INTO `tz_order_item` VALUES (2, 8, 'a98d8aa0-db49-4110-b9fb-1bcbb8bd46ab', 4, 120, 1, 'Apple iPhone XS Max 移动联通电信4G手机  公开版 金色 64GB ', '公开版 金色 64GB ', NULL, 10999.00, 2, 10999.00, '2023-12-04 21:30:05.671402', '0', '2023-12-04 18:25:54', 0, '0', NULL);
INSERT INTO `tz_order_item` VALUES (3, 9, '195f3146-5ad7-4315-ab93-a7c2ae72901e', 4, 120, 1, 'Apple iPhone XS Max 移动联通电信4G手机  公开版 金色 64GB ', '公开版 金色 64GB ', NULL, 10999.00, 2, 10999.00, '2023-12-04 21:30:28.221156', '0', '2023-12-04 18:25:54', 0, '0', NULL);
INSERT INTO `tz_order_item` VALUES (4, 10, '733fe285-f53a-4b97-a526-2f2e4a70b50a', 4, 120, 1, 'Apple iPhone XS Max 移动联通电信4G手机  公开版 金色 64GB ', '公开版 金色 64GB ', NULL, 10999.00, 2, 10999.00, '2023-12-04 21:32:09.478142', '0', '2023-12-04 18:25:54', 0, '0', NULL);
INSERT INTO `tz_order_item` VALUES (5, 11, '72fd4b3a-0d88-4761-a8f7-7f817776e893', 4, 120, 1, 'Apple iPhone XS Max 移动联通电信4G手机  公开版 金色 64GB ', '公开版 金色 64GB ', NULL, 10999.00, 2, 10999.00, '2023-12-04 21:34:47.098146', '0', '2023-12-04 18:25:54', 0, '0', NULL);
INSERT INTO `tz_order_item` VALUES (6, 12, '13ea9fb2-a14a-4891-9d20-a20cc7456660', 4, 120, 1, 'Apple iPhone XS Max 移动联通电信4G手机  公开版 金色 64GB ', '公开版 金色 64GB ', NULL, 10999.00, 2, 10999.00, '2023-12-04 21:36:14.742651', '0', '2023-12-04 18:25:54', 0, '0', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tz_order_payment
-- ----------------------------
DROP TABLE IF EXISTS `tz_order_payment`;
CREATE TABLE `tz_order_payment` (
  `payment_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '订单支付单据ID',
  `pay_no` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付单号',
  `biz_pay_no` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '外部订单流水号',
  `order_number` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'order表中的订单号',
  `pay_type` enum('1','2') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '支付方式1 微信支付 2 支付宝',
  `pay_type_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付方式名称',
  `total_pay` decimal(15,2) DEFAULT NULL COMMENT '支付金额',
  `is_clearing` int DEFAULT NULL COMMENT '是否清算 0:否 1:是',
  `user_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `clearing_time` datetime DEFAULT NULL COMMENT '清算时间',
  `version` int DEFAULT NULL COMMENT '版本号',
  `pay_status` int NOT NULL DEFAULT '0' COMMENT '是否支付 0 未支付 1 已支付',
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `primary_order_no` (`order_number`),
  UNIQUE KEY `IDX_5653541d598daef11f71247541` (`order_number`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_order_payment
-- ----------------------------
BEGIN;
INSERT INTO `tz_order_payment` VALUES (1, NULL, NULL, '8efa2417-a836-48e3-a85b-0bab0ab0effe', '1', NULL, 10999.00, 0, '2', '2023-12-04 20:58:32.149215', NULL, NULL, 0);
INSERT INTO `tz_order_payment` VALUES (2, NULL, NULL, 'dfa3b1ce-a9c9-405b-a990-066f9ec49d79', '1', NULL, 10999.00, 0, '2', '2023-12-04 20:59:26.747873', NULL, NULL, 0);
INSERT INTO `tz_order_payment` VALUES (3, NULL, NULL, 'c25dcc08-1df1-4c29-aab1-1af8267c9a50', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:00:40.242761', NULL, NULL, 0);
INSERT INTO `tz_order_payment` VALUES (4, NULL, NULL, '406399f0-c9dc-4d89-a501-43af2de25140', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:04:22.850262', NULL, NULL, 0);
INSERT INTO `tz_order_payment` VALUES (5, NULL, NULL, '962fcd9e-1757-4327-9b72-43e1ea6d7424', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:05:54.971926', NULL, NULL, 0);
INSERT INTO `tz_order_payment` VALUES (6, NULL, NULL, 'b5e43d0f-651e-41f6-9e57-3c8b25f77455', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:06:58.159181', NULL, NULL, 0);
INSERT INTO `tz_order_payment` VALUES (7, NULL, NULL, 'a98d8aa0-db49-4110-b9fb-1bcbb8bd46ab', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:30:05.604510', NULL, NULL, 0);
INSERT INTO `tz_order_payment` VALUES (8, NULL, NULL, '195f3146-5ad7-4315-ab93-a7c2ae72901e', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:30:28.217562', NULL, NULL, 0);
INSERT INTO `tz_order_payment` VALUES (9, NULL, NULL, '733fe285-f53a-4b97-a526-2f2e4a70b50a', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:32:09.449994', NULL, NULL, 0);
INSERT INTO `tz_order_payment` VALUES (10, NULL, NULL, '72fd4b3a-0d88-4761-a8f7-7f817776e893', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:34:47.093774', NULL, NULL, 0);
INSERT INTO `tz_order_payment` VALUES (11, NULL, NULL, '13ea9fb2-a14a-4891-9d20-a20cc7456660', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:36:14.717686', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for tz_prod
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod`;
CREATE TABLE `tz_prod` (
  `prod_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `prod_name` varchar(300) COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `ori_price` decimal(15,2) DEFAULT '0.00' COMMENT '原价',
  `price` decimal(15,2) DEFAULT NULL COMMENT '现价',
  `cost_price` decimal(15,2) DEFAULT NULL COMMENT '成本价',
  `brief` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '简要描述,卖点等',
  `content` text COLLATE utf8mb4_general_ci COMMENT '详细描述',
  `pic` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品主图',
  `imgs` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品图片，以,分割',
  `category_id` bigint unsigned DEFAULT NULL COMMENT '商品分类',
  `sold_num` int DEFAULT NULL COMMENT '销量',
  `total_stocks` int DEFAULT '0' COMMENT '总库存',
  `return_num` int DEFAULT NULL COMMENT '退货数量',
  `delivery_template_id` bigint DEFAULT NULL COMMENT '运费模板id',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `putaway_time` datetime DEFAULT NULL COMMENT '上架时间',
  `version` int DEFAULT NULL COMMENT '版本 乐观锁',
  `content_img` text COLLATE utf8mb4_general_ci COMMENT '内容中的图片',
  `status` int NOT NULL DEFAULT '0' COMMENT '默认是1，表示正常状态, -1表示删除, 0下架',
  PRIMARY KEY (`prod_id`),
  KEY `prod_putaway_idx` (`putaway_time`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_prod
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod` VALUES (4, 'Apple iPhone XS Max 移动联通电信4G手机 ', 25.00, 25.00, NULL, '6.5英寸大屏，支持双卡。', '<div style=\"margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, \'Microsoft YaHei\', \'Hiragino Sans GB\', u5b8bu4f53, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\" align=\"center\">\n<table id=\"__01\" style=\"text-align: center;\" border=\"0\" width=\"750\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td><img class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\" src=\"https://img30.360buyimg.com/cms/jfs/t1/4626/32/3475/220504/5b997365E80a1373f/279c244f12161cb3.jpg\" alt=\"\" width=\"750\" height=\"1991\" /></td>\n</tr>\n<tr>\n<td><img class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\" src=\"https://img12.360buyimg.com/cms/jfs/t1/3397/21/3533/236322/5b99759aE73795787/f782e04a140c8f16.jpg\" alt=\"\" width=\"750\" height=\"2052\" /></td>\n</tr>\n<tr>\n<td><img class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\" src=\"https://img11.360buyimg.com/cms/jfs/t1/5274/3/3465/245167/5b997365E16b81bc9/93e07e40f3af5e62.jpg\" alt=\"\" width=\"750\" height=\"2250\" /></td>\n</tr>\n<tr>\n<td><img class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\" src=\"https://img30.360buyimg.com/cms/jfs/t1/2322/11/3524/269574/5b997365E26f81a7a/e01fc9486da9eda1.jpg\" alt=\"\" width=\"750\" height=\"2327\" /></td>\n</tr>\n<tr>\n<td><img class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\" src=\"https://img13.360buyimg.com/cms/jfs/t1/5074/21/3432/296470/5b997364Ee966f7a0/7f424d41479db45d.jpg\" alt=\"\" width=\"750\" height=\"2561\" /></td>\n</tr>\n<tr>\n<td><img class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\" src=\"https://img13.360buyimg.com/cms/jfs/t1/5770/18/3580/288371/5b997365Ea2c58cb4/176b9a40ccd4e56b.jpg\" alt=\"\" width=\"750\" height=\"2668\" /></td>\n</tr>\n<tr>\n<td><img class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\" src=\"https://img11.360buyimg.com/cms/jfs/t1/227/21/3811/268132/5b997364E3d6c51b2/92d2a3a559e3baa8.jpg\" alt=\"\" width=\"750\" height=\"2850\" /></td>\n</tr>\n<tr>\n<td><img class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\" src=\"https://img20.360buyimg.com/cms/jfs/t1/3787/5/3493/125020/5b997363E3c9f5910/ddbd08a556744630.jpg\" alt=\"\" width=\"750\" height=\"1486\" /></td>\n</tr>\n<tr>\n<td><img class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\" src=\"https://img30.360buyimg.com/cms/jfs/t1/1687/5/3327/266718/5b997366E9cc80e69/9e40ceae1fef4466.jpg\" alt=\"\" width=\"750\" height=\"3376\" /></td>\n</tr>\n<tr>\n<td><img class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\" src=\"https://img30.360buyimg.com/cms/jfs/t1/457/6/3849/283318/5b997363E0c5ab7a9/6f636f0a286bc87c.jpg\" alt=\"\" width=\"750\" height=\"2455\" /></td>\n</tr>\n<tr>\n<td><img class=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\" src=\"https://img10.360buyimg.com/cms/jfs/t1/397/25/3796/217624/5b9975a8E5ee578af/4d8f05a606fa5c4a.jpg\" alt=\"\" width=\"750\" height=\"2703\" /></td>\n</tr>\n</tbody>\n</table>\n</div>', 'https://lmg.jj20.com/up/allimg/tp09/2106110T4305357-0-lp.jpg', 'https://lmg.jj20.com/up/allimg/tp09/2106110T4305357-0-lp.jpg,https://c-ssl.dtstatic.com/uploads/item/201807/29/20180729215028_xijpn.thumb.1000_0.jpg', 85, 0, 16, 0, 47, '2019-03-29 14:40:00.000000', '2023-06-03 21:05:36.000000', '2023-06-03 21:05:36', 89, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for tz_prod_attrvalue
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod_attrvalue`;
CREATE TABLE `tz_prod_attrvalue` (
  `attr_value_id` bigint NOT NULL,
  `attr_id` bigint DEFAULT NULL COMMENT '销售属性id',
  `attr_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '销售属性名',
  `attr_value_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '销售属性值\n',
  `prod_id` bigint unsigned DEFAULT NULL COMMENT '产品ID',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态(1为正常,0为删除)',
  PRIMARY KEY (`attr_value_id`),
  KEY `FK_aef59e2b7137e8fdd2244f43de8` (`prod_id`),
  CONSTRAINT `FK_aef59e2b7137e8fdd2244f43de8` FOREIGN KEY (`prod_id`) REFERENCES `tz_prod` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_prod_attrvalue
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod_attrvalue` VALUES (1, 101, '颜色', '红色', 4, '2023-11-28 16:33:19.000000', '2023-11-28 16:33:22.000000', 1);
INSERT INTO `tz_prod_attrvalue` VALUES (2, 101, '颜色', '蓝色', 4, '2023-11-28 16:33:19.000000', '2023-11-28 16:33:22.000000', 1);
INSERT INTO `tz_prod_attrvalue` VALUES (3, 102, '尺码', 'XL', 4, '2023-11-28 16:34:01.000000', '2023-11-28 16:34:03.000000', 1);
INSERT INTO `tz_prod_attrvalue` VALUES (4, 102, '尺码', 'XXL', 4, '2023-11-29 16:34:24.000000', '2023-11-28 16:34:27.000000', 1);
INSERT INTO `tz_prod_attrvalue` VALUES (5, 102, '尺码', 'L', 4, '2023-11-29 16:34:24.000000', '2023-11-28 16:34:27.000000', 1);
COMMIT;

-- ----------------------------
-- Table structure for tz_prod_cate_attr
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod_cate_attr`;
CREATE TABLE `tz_prod_cate_attr` (
  `attr_id` bigint NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL COMMENT '类目ID',
  `attr_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `status` enum('1','0') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '状态(1为正常,0为删除)',
  PRIMARY KEY (`attr_id`),
  KEY `FK_414ece9c292a063cecfcdcd2f91` (`category_id`),
  CONSTRAINT `FK_414ece9c292a063cecfcdcd2f91` FOREIGN KEY (`category_id`) REFERENCES `tz_prod_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_prod_cate_attr
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod_cate_attr` VALUES (101, 85, '颜色', '2023-11-28 16:30:48.000000', '2023-11-28 16:30:51.000000', '1');
INSERT INTO `tz_prod_cate_attr` VALUES (102, 85, '尺码', '2023-11-28 16:31:24.000000', '2023-11-28 16:31:28.000000', '1');
COMMIT;

-- ----------------------------
-- Table structure for tz_prod_cate_reference
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod_cate_reference`;
CREATE TABLE `tz_prod_cate_reference` (
  `category_id` bigint unsigned NOT NULL,
  `prod_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`category_id`,`prod_id`),
  KEY `IDX_0de15f9434b654ed4a76244583` (`category_id`),
  KEY `IDX_b78629c7998b76eb57f4d44d26` (`prod_id`),
  CONSTRAINT `FK_0de15f9434b654ed4a76244583f` FOREIGN KEY (`category_id`) REFERENCES `tz_prod_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_b78629c7998b76eb57f4d44d266` FOREIGN KEY (`prod_id`) REFERENCES `tz_prod` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_prod_cate_reference
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod_cate_reference` VALUES (85, 4);
COMMIT;

-- ----------------------------
-- Table structure for tz_prod_category
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod_category`;
CREATE TABLE `tz_prod_category` (
  `category_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint unsigned NOT NULL COMMENT '父节点',
  `category_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品类目名称',
  `icon` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类目图标',
  `pic` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类目的显示图片',
  `seq` int NOT NULL COMMENT '排序',
  `status` enum('1','0') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '状态(1为正常,0为删除)',
  `rec_time` datetime NOT NULL COMMENT '记录时间',
  `grade` int NOT NULL COMMENT '分类层级',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `delete_time` datetime(6) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_prod_category
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod_category` VALUES (85, 0, '数码', NULL, '2019/04/4f148d81d60941b695cb77370a073653.jpg', 1, '1', '2019-04-21 17:28:32', 0, '2023-11-28 14:21:17.658926', '2023-12-05 09:18:37.113458', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tz_prod_tag
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod_tag`;
CREATE TABLE `tz_prod_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分组标签id',
  `title` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分组标题',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '默认类型(0:商家自定义,1:系统默认)',
  `prod_count` bigint DEFAULT NULL COMMENT '商品数量',
  `style` int DEFAULT NULL COMMENT '列表样式(0:一列一个,1:一列两个,2:一列三个)',
  `seq` int DEFAULT NULL COMMENT '排序',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `delete_time` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `status` enum('1','0') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '状态(1为正常,0为删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_prod_tag
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod_tag` VALUES (1, '每日上新', 0, 0, 2, 3, '2019-04-18 14:27:02.000000', '2019-04-18 14:27:06.000000', NULL, '1');
INSERT INTO `tz_prod_tag` VALUES (2, '商城热卖', 0, 0, 1, 2, '2019-04-18 14:27:27.000000', '2019-04-18 14:27:30.000000', NULL, '1');
INSERT INTO `tz_prod_tag` VALUES (3, '更多宝贝', 1, 0, 0, 1, '2019-04-18 10:07:17.000000', '2019-04-18 10:07:17.000000', NULL, '1');
COMMIT;

-- ----------------------------
-- Table structure for tz_prod_tag_reference
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod_tag_reference`;
CREATE TABLE `tz_prod_tag_reference` (
  `tag_id` bigint NOT NULL,
  `prod_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`tag_id`,`prod_id`),
  KEY `IDX_4f6ee71cf55107f742b84add2f` (`tag_id`),
  KEY `IDX_42478dfcb513226dc19b76589f` (`prod_id`),
  CONSTRAINT `FK_42478dfcb513226dc19b76589f4` FOREIGN KEY (`prod_id`) REFERENCES `tz_prod` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_4f6ee71cf55107f742b84add2f2` FOREIGN KEY (`tag_id`) REFERENCES `tz_prod_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_prod_tag_reference
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod_tag_reference` VALUES (1, 4);
INSERT INTO `tz_prod_tag_reference` VALUES (2, 4);
INSERT INTO `tz_prod_tag_reference` VALUES (3, 4);
COMMIT;

-- ----------------------------
-- Table structure for tz_shopcart_item
-- ----------------------------
DROP TABLE IF EXISTS `tz_shopcart_item`;
CREATE TABLE `tz_shopcart_item` (
  `shopcart_item_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sku_id` bigint unsigned NOT NULL COMMENT 'sku_id',
  `prod_id` bigint unsigned NOT NULL COMMENT '产品ID',
  `user_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `item_count` int NOT NULL DEFAULT '0' COMMENT '购物车产品个数',
  `add_date` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '购物时间',
  PRIMARY KEY (`shopcart_item_id`),
  UNIQUE KEY `uk_user_shop_sku` (`sku_id`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `FK_c8de2345a3ad0ef8b46e19f3bc0` (`prod_id`),
  CONSTRAINT `FK_734b7c269f309b1dad753397a06` FOREIGN KEY (`sku_id`) REFERENCES `tz_sku` (`sku_id`),
  CONSTRAINT `FK_c8de2345a3ad0ef8b46e19f3bc0` FOREIGN KEY (`prod_id`) REFERENCES `tz_prod` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_shopcart_item
-- ----------------------------
BEGIN;
INSERT INTO `tz_shopcart_item` VALUES (1, 120, 4, '2', 1, '2023-12-04 18:25:54.485808');
INSERT INTO `tz_shopcart_item` VALUES (2, 118, 4, '2', 1, '2023-12-05 00:37:30.135811');
COMMIT;

-- ----------------------------
-- Table structure for tz_sku
-- ----------------------------
DROP TABLE IF EXISTS `tz_sku`;
CREATE TABLE `tz_sku` (
  `sku_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '单品ID',
  `prod_id` bigint unsigned NOT NULL COMMENT '商品ID',
  `ori_price` decimal(15,2) DEFAULT NULL COMMENT '原价',
  `price` decimal(15,2) DEFAULT NULL COMMENT '价格',
  `stocks` int NOT NULL COMMENT '商品在付款减库存的状态下，该sku上未付款的订单数量',
  `actual_stocks` int DEFAULT NULL COMMENT '实际库存',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `pic` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku图片',
  `sku_name` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku名称',
  `prod_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态(1为启用,0为禁用)',
  `is_delete` int NOT NULL DEFAULT '0' COMMENT '状态(1为已删除,0为未删除)',
  `attr` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所有销售属性值的json串',
  PRIMARY KEY (`sku_id`),
  KEY `prod_id` (`prod_id`),
  CONSTRAINT `FK_44e012a4eff46ee595eaadfd34d` FOREIGN KEY (`prod_id`) REFERENCES `tz_prod` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_sku
-- ----------------------------
BEGIN;
INSERT INTO `tz_sku` VALUES (10, 4, 25.00, 25.00, 2, 2, '2019-05-14 10:00:41.000000', '2023-12-04 16:48:44.903190', NULL, '公开版 金色 64GB ', 'Apple iPhone XS Max 移动联通电信4G手机  公开版 金色 64GB ', 10, 1, 0, '[\"1\",\"3\"]');
INSERT INTO `tz_sku` VALUES (117, 4, 25.00, 25.00, 5, 4, '2023-07-27 10:33:14.000000', '2023-12-04 21:31:32.958380', NULL, '公开版 金色 64GB ', 'Apple iPhone XS Max 移动联通电信4G手机  公开版 金色 64GB ', 2, 1, 0, '[\"1\",\"5\"]');
INSERT INTO `tz_sku` VALUES (118, 4, 25.00, 25.00, 4, 5, '2023-07-27 09:33:27.000000', '2023-12-04 16:48:46.155252', NULL, '公开版 金色 64GB ', 'Apple iPhone XS Max 移动联通电信4G手机  公开版 金色 64GB ', 1, 1, 0, '[\"2\",\"3\"]');
INSERT INTO `tz_sku` VALUES (119, 4, 25.00, 25.00, 6, 6, '2018-11-22 15:21:34.000000', '2023-12-04 16:48:47.546833', NULL, '公开版 金色 64GB ', 'Apple iPhone XS Max 移动联通电信4G手机  公开版 金色 64GB ', 0, 1, 0, '[\"2\",\"4\"]');
INSERT INTO `tz_sku` VALUES (120, 4, 10999.00, 10999.00, 2, 3, '2018-12-29 13:48:46.000000', '2023-12-04 21:36:14.000000', NULL, '公开版 金色 64GB ', 'Apple iPhone XS Max 移动联通电信4G手机  公开版 金色 64GB ', 3, 1, 0, '[\"2\",\"5\"]');
COMMIT;

-- ----------------------------
-- Table structure for tz_user
-- ----------------------------
DROP TABLE IF EXISTS `tz_user`;
CREATE TABLE `tz_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nick_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户昵称',
  `real_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '真实姓名',
  `user_mail` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户邮箱',
  `login_password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录密码',
  `pay_password` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付密码',
  `user_mobile` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号码',
  `modify_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `user_regtime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '注册时间',
  `user_regip` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '注册IP',
  `user_lasttime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `user_lastip` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后登录IP',
  `user_memo` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `sex` char(1) COLLATE utf8mb4_general_ci DEFAULT 'M' COMMENT 'M(男) or F(女)',
  `birth_date` char(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '例如：2009-11-27',
  `pic` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像图片路径',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态 1 正常 0 无效',
  `score` int DEFAULT NULL COMMENT '用户积分',
  `open_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `union_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_wechat` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户微信号',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ud_user_union_id` (`union_id`),
  UNIQUE KEY `ud_user_unique_mobile` (`user_mobile`),
  UNIQUE KEY `ud_user_mail` (`user_mail`),
  UNIQUE KEY `IDX_a0a4cdd86b111016fdd2eee909` (`user_mail`),
  UNIQUE KEY `IDX_e70ba19c42f3ccab403877cff4` (`user_mobile`),
  UNIQUE KEY `IDX_91e431587fa852f7559592117b` (`union_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_user
-- ----------------------------
BEGIN;
INSERT INTO `tz_user` VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-04 16:03:41.977334', '2023-12-04 16:03:41.977334', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 1, NULL, 'o9jrG5RwyLHpeihkdN5vPhhd_6l0', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tz_user_addr
-- ----------------------------
DROP TABLE IF EXISTS `tz_user_addr`;
CREATE TABLE `tz_user_addr` (
  `addr_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '用户ID',
  `receiver` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人',
  `province_id` bigint DEFAULT NULL COMMENT '省ID',
  `province` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '省',
  `city` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '城市',
  `city_id` bigint DEFAULT NULL COMMENT '城市ID',
  `area` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区',
  `area_id` bigint DEFAULT NULL COMMENT '区ID',
  `post_code` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮编',
  `addr` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `mobile` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机',
  `status` int NOT NULL COMMENT '状态,1正常，0无效',
  `common_addr` int NOT NULL DEFAULT '0' COMMENT '是否默认地址 1是',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '建立时间',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`addr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_user_addr
-- ----------------------------
BEGIN;
INSERT INTO `tz_user_addr` VALUES (4, '2', '王大锤', 110000000000, '北京市', '市辖区', 110100000000, '东城区', 110101000000, NULL, '北京大学', '13121878788', 1, 1, '2023-07-11 16:33:06.000000', 0, '2023-07-11 16:33:06.000000');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
