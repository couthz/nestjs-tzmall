/*
 Navicat Premium Data Transfer

 Source Server         : docker
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : localhost:13306
 Source Schema         : tz_shops

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 14/10/2024 19:57:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tz_area
-- ----------------------------
DROP TABLE IF EXISTS `tz_area`;
CREATE TABLE `tz_area` (
  `area_id` bigint NOT NULL AUTO_INCREMENT,
  `area_name` varchar(50) DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `level` int DEFAULT NULL,
  PRIMARY KEY (`area_id`),
  KEY `parent_id` (`parent_id`) COMMENT '上级id'
) ENGINE=InnoDB AUTO_INCREMENT=659006000001 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tz_area
-- ----------------------------
BEGIN;
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110000000000, '北京市', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110100000000, '市辖区', 110000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110101000000, '东城区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110102000000, '西城区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110105000000, '朝阳区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110106000000, '丰台区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110107000000, '石景山区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110108000000, '海淀区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110109000000, '门头沟区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110111000000, '房山区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110112000000, '通州区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110113000000, '顺义区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110114000000, '昌平区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110115000000, '大兴区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110116000000, '怀柔区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110117000000, '平谷区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110118000000, '密云区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (110119000000, '延庆区', 110100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120000000000, '天津市', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120100000000, '市辖区', 120000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120101000000, '和平区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120102000000, '河东区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120103000000, '河西区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120104000000, '南开区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120105000000, '河北区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120106000000, '红桥区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120110000000, '东丽区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120111000000, '西青区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120112000000, '津南区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120113000000, '北辰区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120114000000, '武清区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120115000000, '宝坻区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120116000000, '滨海新区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120117000000, '宁河区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120118000000, '静海区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (120119000000, '蓟州区', 120100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130000000000, '河北省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130100000000, '石家庄市', 130000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130101000000, '市辖区', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130102000000, '长安区', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130104000000, '桥西区', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130105000000, '新华区', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130107000000, '井陉矿区', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130108000000, '裕华区', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130109000000, '藁城区', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130110000000, '鹿泉区', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130111000000, '栾城区', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130121000000, '井陉县', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130123000000, '正定县', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130125000000, '行唐县', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130126000000, '灵寿县', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130127000000, '高邑县', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130128000000, '深泽县', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130129000000, '赞皇县', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130130000000, '无极县', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130131000000, '平山县', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130132000000, '元氏县', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130133000000, '赵县', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130171000000, '石家庄高新技术产业开发区', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130172000000, '石家庄循环化工园区', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130181000000, '辛集市', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130183000000, '晋州市', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130184000000, '新乐市', 130100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130200000000, '唐山市', 130000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130201000000, '市辖区', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130202000000, '路南区', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130203000000, '路北区', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130204000000, '古冶区', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130205000000, '开平区', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130207000000, '丰南区', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130208000000, '丰润区', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130209000000, '曹妃甸区', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130224000000, '滦南县', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130225000000, '乐亭县', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130227000000, '迁西县', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130229000000, '玉田县', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130271000000, '唐山市芦台经济技术开发区', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130272000000, '唐山市汉沽管理区', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130273000000, '唐山高新技术产业开发区', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130274000000, '河北唐山海港经济开发区', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130281000000, '遵化市', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130283000000, '迁安市', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130284000000, '滦州市', 130200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130300000000, '秦皇岛市', 130000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130301000000, '市辖区', 130300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130302000000, '海港区', 130300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130303000000, '山海关区', 130300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130304000000, '北戴河区', 130300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130306000000, '抚宁区', 130300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130321000000, '青龙满族自治县', 130300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130322000000, '昌黎县', 130300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130324000000, '卢龙县', 130300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130371000000, '秦皇岛市经济技术开发区', 130300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130372000000, '北戴河新区', 130300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130400000000, '邯郸市', 130000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130401000000, '市辖区', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130402000000, '邯山区', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130403000000, '丛台区', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130404000000, '复兴区', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130406000000, '峰峰矿区', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130407000000, '肥乡区', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130408000000, '永年区', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130423000000, '临漳县', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130424000000, '成安县', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130425000000, '大名县', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130426000000, '涉县', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130427000000, '磁县', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130430000000, '邱县', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130431000000, '鸡泽县', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130432000000, '广平县', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130433000000, '馆陶县', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130434000000, '魏县', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130435000000, '曲周县', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130471000000, '邯郸经济技术开发区', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130473000000, '邯郸冀南新区', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130481000000, '武安市', 130400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130500000000, '邢台市', 130000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130501000000, '市辖区', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130502000000, '桥东区', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130503000000, '桥西区', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130521000000, '邢台县', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130522000000, '临城县', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130523000000, '内丘县', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130524000000, '柏乡县', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130525000000, '隆尧县', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130526000000, '任县', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130527000000, '南和县', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130528000000, '宁晋县', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130529000000, '巨鹿县', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130530000000, '新河县', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130531000000, '广宗县', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130532000000, '平乡县', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130533000000, '威县', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130534000000, '清河县', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130535000000, '临西县', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130571000000, '河北邢台经济开发区', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130581000000, '南宫市', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130582000000, '沙河市', 130500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130600000000, '保定市', 130000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130601000000, '市辖区', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130602000000, '竞秀区', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130606000000, '莲池区', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130607000000, '满城区', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130608000000, '清苑区', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130609000000, '徐水区', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130623000000, '涞水县', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130624000000, '阜平县', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130626000000, '定兴县', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130627000000, '唐县', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130628000000, '高阳县', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130629000000, '容城县', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130630000000, '涞源县', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130631000000, '望都县', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130632000000, '安新县', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130633000000, '易县', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130634000000, '曲阳县', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130635000000, '蠡县', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130636000000, '顺平县', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130637000000, '博野县', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130638000000, '雄县', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130671000000, '保定高新技术产业开发区', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130672000000, '保定白沟新城', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130681000000, '涿州市', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130682000000, '定州市', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130683000000, '安国市', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130684000000, '高碑店市', 130600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130700000000, '张家口市', 130000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130701000000, '市辖区', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130702000000, '桥东区', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130703000000, '桥西区', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130705000000, '宣化区', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130706000000, '下花园区', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130708000000, '万全区', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130709000000, '崇礼区', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130722000000, '张北县', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130723000000, '康保县', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130724000000, '沽源县', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130725000000, '尚义县', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130726000000, '蔚县', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130727000000, '阳原县', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130728000000, '怀安县', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130730000000, '怀来县', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130731000000, '涿鹿县', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130732000000, '赤城县', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130771000000, '张家口市高新技术产业开发区', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130772000000, '张家口市察北管理区', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130773000000, '张家口市塞北管理区', 130700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130800000000, '承德市', 130000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130801000000, '市辖区', 130800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130802000000, '双桥区', 130800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130803000000, '双滦区', 130800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130804000000, '鹰手营子矿区', 130800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130821000000, '承德县', 130800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130822000000, '兴隆县', 130800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130824000000, '滦平县', 130800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130825000000, '隆化县', 130800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130826000000, '丰宁满族自治县', 130800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130827000000, '宽城满族自治县', 130800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130828000000, '围场满族蒙古族自治县', 130800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130871000000, '承德高新技术产业开发区', 130800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130881000000, '平泉市', 130800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130900000000, '沧州市', 130000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130901000000, '市辖区', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130902000000, '新华区', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130903000000, '运河区', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130921000000, '沧县', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130922000000, '青县', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130923000000, '东光县', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130924000000, '海兴县', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130925000000, '盐山县', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130926000000, '肃宁县', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130927000000, '南皮县', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130928000000, '吴桥县', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130929000000, '献县', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130930000000, '孟村回族自治县', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130971000000, '河北沧州经济开发区', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130972000000, '沧州高新技术产业开发区', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130973000000, '沧州渤海新区', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130981000000, '泊头市', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130982000000, '任丘市', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130983000000, '黄骅市', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (130984000000, '河间市', 130900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131000000000, '廊坊市', 130000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131001000000, '市辖区', 131000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131002000000, '安次区', 131000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131003000000, '广阳区', 131000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131022000000, '固安县', 131000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131023000000, '永清县', 131000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131024000000, '香河县', 131000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131025000000, '大城县', 131000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131026000000, '文安县', 131000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131028000000, '大厂回族自治县', 131000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131071000000, '廊坊经济技术开发区', 131000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131081000000, '霸州市', 131000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131082000000, '三河市', 131000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131100000000, '衡水市', 130000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131101000000, '市辖区', 131100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131102000000, '桃城区', 131100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131103000000, '冀州区', 131100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131121000000, '枣强县', 131100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131122000000, '武邑县', 131100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131123000000, '武强县', 131100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131124000000, '饶阳县', 131100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131125000000, '安平县', 131100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131126000000, '故城县', 131100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131127000000, '景县', 131100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131128000000, '阜城县', 131100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131171000000, '河北衡水高新技术产业开发区', 131100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131172000000, '衡水滨湖新区', 131100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (131182000000, '深州市', 131100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140000000000, '山西省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140100000000, '太原市', 140000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140101000000, '市辖区', 140100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140105000000, '小店区', 140100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140106000000, '迎泽区', 140100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140107000000, '杏花岭区', 140100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140108000000, '尖草坪区', 140100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140109000000, '万柏林区', 140100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140110000000, '晋源区', 140100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140121000000, '清徐县', 140100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140122000000, '阳曲县', 140100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140123000000, '娄烦县', 140100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140171000000, '山西转型综合改革示范区', 140100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140181000000, '古交市', 140100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140200000000, '大同市', 140000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140201000000, '市辖区', 140200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140212000000, '新荣区', 140200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140213000000, '平城区', 140200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140214000000, '云冈区', 140200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140215000000, '云州区', 140200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140221000000, '阳高县', 140200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140222000000, '天镇县', 140200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140223000000, '广灵县', 140200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140224000000, '灵丘县', 140200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140225000000, '浑源县', 140200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140226000000, '左云县', 140200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140271000000, '山西大同经济开发区', 140200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140300000000, '阳泉市', 140000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140301000000, '市辖区', 140300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140302000000, '城区', 140300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140303000000, '矿区', 140300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140311000000, '郊区', 140300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140321000000, '平定县', 140300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140322000000, '盂县', 140300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140400000000, '长治市', 140000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140401000000, '市辖区', 140400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140412000000, '潞州区', 140400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140413000000, '上党区', 140400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140414000000, '屯留区', 140400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140415000000, '潞城区', 140400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140423000000, '襄垣县', 140400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140425000000, '平顺县', 140400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140426000000, '黎城县', 140400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140427000000, '壶关县', 140400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140428000000, '长子县', 140400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140429000000, '武乡县', 140400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140430000000, '沁县', 140400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140431000000, '沁源县', 140400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140471000000, '山西长治高新技术产业园区', 140400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140500000000, '晋城市', 140000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140501000000, '市辖区', 140500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140502000000, '城区', 140500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140521000000, '沁水县', 140500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140522000000, '阳城县', 140500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140524000000, '陵川县', 140500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140525000000, '泽州县', 140500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140581000000, '高平市', 140500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140600000000, '朔州市', 140000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140601000000, '市辖区', 140600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140602000000, '朔城区', 140600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140603000000, '平鲁区', 140600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140621000000, '山阴县', 140600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140622000000, '应县', 140600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140623000000, '右玉县', 140600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140671000000, '山西朔州经济开发区', 140600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140681000000, '怀仁市', 140600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140700000000, '晋中市', 140000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140701000000, '市辖区', 140700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140702000000, '榆次区', 140700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140721000000, '榆社县', 140700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140722000000, '左权县', 140700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140723000000, '和顺县', 140700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140724000000, '昔阳县', 140700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140725000000, '寿阳县', 140700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140726000000, '太谷县', 140700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140727000000, '祁县', 140700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140728000000, '平遥县', 140700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140729000000, '灵石县', 140700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140781000000, '介休市', 140700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140800000000, '运城市', 140000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140801000000, '市辖区', 140800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140802000000, '盐湖区', 140800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140821000000, '临猗县', 140800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140822000000, '万荣县', 140800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140823000000, '闻喜县', 140800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140824000000, '稷山县', 140800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140825000000, '新绛县', 140800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140826000000, '绛县', 140800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140827000000, '垣曲县', 140800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140828000000, '夏县', 140800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140829000000, '平陆县', 140800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140830000000, '芮城县', 140800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140881000000, '永济市', 140800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140882000000, '河津市', 140800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140900000000, '忻州市', 140000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140901000000, '市辖区', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140902000000, '忻府区', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140921000000, '定襄县', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140922000000, '五台县', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140923000000, '代县', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140924000000, '繁峙县', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140925000000, '宁武县', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140926000000, '静乐县', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140927000000, '神池县', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140928000000, '五寨县', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140929000000, '岢岚县', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140930000000, '河曲县', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140931000000, '保德县', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140932000000, '偏关县', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140971000000, '五台山风景名胜区', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (140981000000, '原平市', 140900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141000000000, '临汾市', 140000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141001000000, '市辖区', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141002000000, '尧都区', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141021000000, '曲沃县', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141022000000, '翼城县', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141023000000, '襄汾县', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141024000000, '洪洞县', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141025000000, '古县', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141026000000, '安泽县', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141027000000, '浮山县', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141028000000, '吉县', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141029000000, '乡宁县', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141030000000, '大宁县', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141031000000, '隰县', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141032000000, '永和县', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141033000000, '蒲县', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141034000000, '汾西县', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141081000000, '侯马市', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141082000000, '霍州市', 141000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141100000000, '吕梁市', 140000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141101000000, '市辖区', 141100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141102000000, '离石区', 141100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141121000000, '文水县', 141100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141122000000, '交城县', 141100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141123000000, '兴县', 141100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141124000000, '临县', 141100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141125000000, '柳林县', 141100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141126000000, '石楼县', 141100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141127000000, '岚县', 141100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141128000000, '方山县', 141100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141129000000, '中阳县', 141100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141130000000, '交口县', 141100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141181000000, '孝义市', 141100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (141182000000, '汾阳市', 141100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150000000000, '内蒙古自治区', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150100000000, '呼和浩特市', 150000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150101000000, '市辖区', 150100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150102000000, '新城区', 150100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150103000000, '回民区', 150100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150104000000, '玉泉区', 150100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150105000000, '赛罕区', 150100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150121000000, '土默特左旗', 150100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150122000000, '托克托县', 150100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150123000000, '和林格尔县', 150100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150124000000, '清水河县', 150100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150125000000, '武川县', 150100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150171000000, '呼和浩特金海工业园区', 150100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150172000000, '呼和浩特经济技术开发区', 150100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150200000000, '包头市', 150000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150201000000, '市辖区', 150200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150202000000, '东河区', 150200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150203000000, '昆都仑区', 150200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150204000000, '青山区', 150200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150205000000, '石拐区', 150200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150206000000, '白云鄂博矿区', 150200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150207000000, '九原区', 150200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150221000000, '土默特右旗', 150200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150222000000, '固阳县', 150200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150223000000, '达尔罕茂明安联合旗', 150200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150271000000, '包头稀土高新技术产业开发区', 150200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150300000000, '乌海市', 150000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150301000000, '市辖区', 150300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150302000000, '海勃湾区', 150300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150303000000, '海南区', 150300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150304000000, '乌达区', 150300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150400000000, '赤峰市', 150000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150401000000, '市辖区', 150400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150402000000, '红山区', 150400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150403000000, '元宝山区', 150400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150404000000, '松山区', 150400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150421000000, '阿鲁科尔沁旗', 150400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150422000000, '巴林左旗', 150400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150423000000, '巴林右旗', 150400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150424000000, '林西县', 150400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150425000000, '克什克腾旗', 150400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150426000000, '翁牛特旗', 150400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150428000000, '喀喇沁旗', 150400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150429000000, '宁城县', 150400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150430000000, '敖汉旗', 150400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150500000000, '通辽市', 150000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150501000000, '市辖区', 150500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150502000000, '科尔沁区', 150500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150521000000, '科尔沁左翼中旗', 150500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150522000000, '科尔沁左翼后旗', 150500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150523000000, '开鲁县', 150500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150524000000, '库伦旗', 150500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150525000000, '奈曼旗', 150500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150526000000, '扎鲁特旗', 150500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150571000000, '通辽经济技术开发区', 150500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150581000000, '霍林郭勒市', 150500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150600000000, '鄂尔多斯市', 150000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150601000000, '市辖区', 150600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150602000000, '东胜区', 150600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150603000000, '康巴什区', 150600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150621000000, '达拉特旗', 150600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150622000000, '准格尔旗', 150600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150623000000, '鄂托克前旗', 150600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150624000000, '鄂托克旗', 150600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150625000000, '杭锦旗', 150600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150626000000, '乌审旗', 150600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150627000000, '伊金霍洛旗', 150600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150700000000, '呼伦贝尔市', 150000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150701000000, '市辖区', 150700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150702000000, '海拉尔区', 150700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150703000000, '扎赉诺尔区', 150700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150721000000, '阿荣旗', 150700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150722000000, '莫力达瓦达斡尔族自治旗', 150700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150723000000, '鄂伦春自治旗', 150700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150724000000, '鄂温克族自治旗', 150700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150725000000, '陈巴尔虎旗', 150700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150726000000, '新巴尔虎左旗', 150700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150727000000, '新巴尔虎右旗', 150700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150781000000, '满洲里市', 150700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150782000000, '牙克石市', 150700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150783000000, '扎兰屯市', 150700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150784000000, '额尔古纳市', 150700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150785000000, '根河市', 150700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150800000000, '巴彦淖尔市', 150000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150801000000, '市辖区', 150800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150802000000, '临河区', 150800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150821000000, '五原县', 150800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150822000000, '磴口县', 150800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150823000000, '乌拉特前旗', 150800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150824000000, '乌拉特中旗', 150800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150825000000, '乌拉特后旗', 150800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150826000000, '杭锦后旗', 150800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150900000000, '乌兰察布市', 150000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150901000000, '市辖区', 150900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150902000000, '集宁区', 150900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150921000000, '卓资县', 150900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150922000000, '化德县', 150900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150923000000, '商都县', 150900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150924000000, '兴和县', 150900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150925000000, '凉城县', 150900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150926000000, '察哈尔右翼前旗', 150900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150927000000, '察哈尔右翼中旗', 150900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150928000000, '察哈尔右翼后旗', 150900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150929000000, '四子王旗', 150900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (150981000000, '丰镇市', 150900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152200000000, '兴安盟', 150000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152201000000, '乌兰浩特市', 152200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152202000000, '阿尔山市', 152200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152221000000, '科尔沁右翼前旗', 152200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152222000000, '科尔沁右翼中旗', 152200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152223000000, '扎赉特旗', 152200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152224000000, '突泉县', 152200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152500000000, '锡林郭勒盟', 150000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152501000000, '二连浩特市', 152500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152502000000, '锡林浩特市', 152500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152522000000, '阿巴嘎旗', 152500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152523000000, '苏尼特左旗', 152500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152524000000, '苏尼特右旗', 152500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152525000000, '东乌珠穆沁旗', 152500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152526000000, '西乌珠穆沁旗', 152500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152527000000, '太仆寺旗', 152500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152528000000, '镶黄旗', 152500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152529000000, '正镶白旗', 152500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152530000000, '正蓝旗', 152500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152531000000, '多伦县', 152500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152571000000, '乌拉盖管委会', 152500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152900000000, '阿拉善盟', 150000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152921000000, '阿拉善左旗', 152900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152922000000, '阿拉善右旗', 152900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152923000000, '额济纳旗', 152900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (152971000000, '内蒙古阿拉善经济开发区', 152900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210000000000, '辽宁省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210100000000, '沈阳市', 210000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210101000000, '市辖区', 210100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210102000000, '和平区', 210100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210103000000, '沈河区', 210100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210104000000, '大东区', 210100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210105000000, '皇姑区', 210100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210106000000, '铁西区', 210100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210111000000, '苏家屯区', 210100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210112000000, '浑南区', 210100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210113000000, '沈北新区', 210100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210114000000, '于洪区', 210100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210115000000, '辽中区', 210100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210123000000, '康平县', 210100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210124000000, '法库县', 210100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210181000000, '新民市', 210100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210200000000, '大连市', 210000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210201000000, '市辖区', 210200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210202000000, '中山区', 210200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210203000000, '西岗区', 210200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210204000000, '沙河口区', 210200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210211000000, '甘井子区', 210200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210212000000, '旅顺口区', 210200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210213000000, '金州区', 210200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210214000000, '普兰店区', 210200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210224000000, '长海县', 210200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210281000000, '瓦房店市', 210200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210283000000, '庄河市', 210200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210300000000, '鞍山市', 210000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210301000000, '市辖区', 210300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210302000000, '铁东区', 210300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210303000000, '铁西区', 210300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210304000000, '立山区', 210300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210311000000, '千山区', 210300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210321000000, '台安县', 210300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210323000000, '岫岩满族自治县', 210300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210381000000, '海城市', 210300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210400000000, '抚顺市', 210000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210401000000, '市辖区', 210400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210402000000, '新抚区', 210400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210403000000, '东洲区', 210400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210404000000, '望花区', 210400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210411000000, '顺城区', 210400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210421000000, '抚顺县', 210400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210422000000, '新宾满族自治县', 210400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210423000000, '清原满族自治县', 210400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210500000000, '本溪市', 210000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210501000000, '市辖区', 210500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210502000000, '平山区', 210500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210503000000, '溪湖区', 210500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210504000000, '明山区', 210500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210505000000, '南芬区', 210500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210521000000, '本溪满族自治县', 210500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210522000000, '桓仁满族自治县', 210500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210600000000, '丹东市', 210000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210601000000, '市辖区', 210600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210602000000, '元宝区', 210600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210603000000, '振兴区', 210600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210604000000, '振安区', 210600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210624000000, '宽甸满族自治县', 210600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210681000000, '东港市', 210600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210682000000, '凤城市', 210600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210700000000, '锦州市', 210000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210701000000, '市辖区', 210700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210702000000, '古塔区', 210700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210703000000, '凌河区', 210700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210711000000, '太和区', 210700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210726000000, '黑山县', 210700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210727000000, '义县', 210700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210781000000, '凌海市', 210700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210782000000, '北镇市', 210700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210800000000, '营口市', 210000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210801000000, '市辖区', 210800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210802000000, '站前区', 210800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210803000000, '西市区', 210800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210804000000, '鲅鱼圈区', 210800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210811000000, '老边区', 210800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210881000000, '盖州市', 210800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210882000000, '大石桥市', 210800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210900000000, '阜新市', 210000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210901000000, '市辖区', 210900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210902000000, '海州区', 210900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210903000000, '新邱区', 210900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210904000000, '太平区', 210900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210905000000, '清河门区', 210900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210911000000, '细河区', 210900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210921000000, '阜新蒙古族自治县', 210900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (210922000000, '彰武县', 210900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211000000000, '辽阳市', 210000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211001000000, '市辖区', 211000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211002000000, '白塔区', 211000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211003000000, '文圣区', 211000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211004000000, '宏伟区', 211000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211005000000, '弓长岭区', 211000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211011000000, '太子河区', 211000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211021000000, '辽阳县', 211000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211081000000, '灯塔市', 211000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211100000000, '盘锦市', 210000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211101000000, '市辖区', 211100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211102000000, '双台子区', 211100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211103000000, '兴隆台区', 211100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211104000000, '大洼区', 211100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211122000000, '盘山县', 211100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211200000000, '铁岭市', 210000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211201000000, '市辖区', 211200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211202000000, '银州区', 211200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211204000000, '清河区', 211200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211221000000, '铁岭县', 211200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211223000000, '西丰县', 211200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211224000000, '昌图县', 211200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211281000000, '调兵山市', 211200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211282000000, '开原市', 211200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211300000000, '朝阳市', 210000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211301000000, '市辖区', 211300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211302000000, '双塔区', 211300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211303000000, '龙城区', 211300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211321000000, '朝阳县', 211300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211322000000, '建平县', 211300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211324000000, '喀喇沁左翼蒙古族自治县', 211300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211381000000, '北票市', 211300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211382000000, '凌源市', 211300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211400000000, '葫芦岛市', 210000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211401000000, '市辖区', 211400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211402000000, '连山区', 211400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211403000000, '龙港区', 211400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211404000000, '南票区', 211400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211421000000, '绥中县', 211400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211422000000, '建昌县', 211400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (211481000000, '兴城市', 211400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220000000000, '吉林省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220100000000, '长春市', 220000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220101000000, '市辖区', 220100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220102000000, '南关区', 220100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220103000000, '宽城区', 220100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220104000000, '朝阳区', 220100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220105000000, '二道区', 220100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220106000000, '绿园区', 220100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220112000000, '双阳区', 220100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220113000000, '九台区', 220100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220122000000, '农安县', 220100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220171000000, '长春经济技术开发区', 220100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220172000000, '长春净月高新技术产业开发区', 220100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220173000000, '长春高新技术产业开发区', 220100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220174000000, '长春汽车经济技术开发区', 220100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220182000000, '榆树市', 220100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220183000000, '德惠市', 220100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220200000000, '吉林市', 220000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220201000000, '市辖区', 220200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220202000000, '昌邑区', 220200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220203000000, '龙潭区', 220200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220204000000, '船营区', 220200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220211000000, '丰满区', 220200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220221000000, '永吉县', 220200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220271000000, '吉林经济开发区', 220200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220272000000, '吉林高新技术产业开发区', 220200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220273000000, '吉林中国新加坡食品区', 220200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220281000000, '蛟河市', 220200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220282000000, '桦甸市', 220200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220283000000, '舒兰市', 220200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220284000000, '磐石市', 220200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220300000000, '四平市', 220000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220301000000, '市辖区', 220300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220302000000, '铁西区', 220300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220303000000, '铁东区', 220300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220322000000, '梨树县', 220300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220323000000, '伊通满族自治县', 220300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220381000000, '公主岭市', 220300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220382000000, '双辽市', 220300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220400000000, '辽源市', 220000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220401000000, '市辖区', 220400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220402000000, '龙山区', 220400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220403000000, '西安区', 220400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220421000000, '东丰县', 220400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220422000000, '东辽县', 220400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220500000000, '通化市', 220000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220501000000, '市辖区', 220500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220502000000, '东昌区', 220500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220503000000, '二道江区', 220500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220521000000, '通化县', 220500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220523000000, '辉南县', 220500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220524000000, '柳河县', 220500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220581000000, '梅河口市', 220500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220582000000, '集安市', 220500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220600000000, '白山市', 220000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220601000000, '市辖区', 220600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220602000000, '浑江区', 220600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220605000000, '江源区', 220600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220621000000, '抚松县', 220600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220622000000, '靖宇县', 220600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220623000000, '长白朝鲜族自治县', 220600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220681000000, '临江市', 220600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220700000000, '松原市', 220000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220701000000, '市辖区', 220700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220702000000, '宁江区', 220700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220721000000, '前郭尔罗斯蒙古族自治县', 220700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220722000000, '长岭县', 220700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220723000000, '乾安县', 220700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220771000000, '吉林松原经济开发区', 220700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220781000000, '扶余市', 220700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220800000000, '白城市', 220000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220801000000, '市辖区', 220800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220802000000, '洮北区', 220800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220821000000, '镇赉县', 220800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220822000000, '通榆县', 220800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220871000000, '吉林白城经济开发区', 220800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220881000000, '洮南市', 220800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (220882000000, '大安市', 220800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (222400000000, '延边朝鲜族自治州', 220000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (222401000000, '延吉市', 222400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (222402000000, '图们市', 222400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (222403000000, '敦化市', 222400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (222404000000, '珲春市', 222400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (222405000000, '龙井市', 222400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (222406000000, '和龙市', 222400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (222424000000, '汪清县', 222400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (222426000000, '安图县', 222400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230000000000, '黑龙江省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230100000000, '哈尔滨市', 230000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230101000000, '市辖区', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230102000000, '道里区', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230103000000, '南岗区', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230104000000, '道外区', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230108000000, '平房区', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230109000000, '松北区', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230110000000, '香坊区', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230111000000, '呼兰区', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230112000000, '阿城区', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230113000000, '双城区', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230123000000, '依兰县', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230124000000, '方正县', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230125000000, '宾县', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230126000000, '巴彦县', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230127000000, '木兰县', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230128000000, '通河县', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230129000000, '延寿县', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230183000000, '尚志市', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230184000000, '五常市', 230100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230200000000, '齐齐哈尔市', 230000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230201000000, '市辖区', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230202000000, '龙沙区', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230203000000, '建华区', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230204000000, '铁锋区', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230205000000, '昂昂溪区', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230206000000, '富拉尔基区', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230207000000, '碾子山区', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230208000000, '梅里斯达斡尔族区', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230221000000, '龙江县', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230223000000, '依安县', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230224000000, '泰来县', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230225000000, '甘南县', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230227000000, '富裕县', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230229000000, '克山县', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230230000000, '克东县', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230231000000, '拜泉县', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230281000000, '讷河市', 230200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230300000000, '鸡西市', 230000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230301000000, '市辖区', 230300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230302000000, '鸡冠区', 230300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230303000000, '恒山区', 230300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230304000000, '滴道区', 230300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230305000000, '梨树区', 230300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230306000000, '城子河区', 230300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230307000000, '麻山区', 230300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230321000000, '鸡东县', 230300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230381000000, '虎林市', 230300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230382000000, '密山市', 230300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230400000000, '鹤岗市', 230000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230401000000, '市辖区', 230400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230402000000, '向阳区', 230400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230403000000, '工农区', 230400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230404000000, '南山区', 230400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230405000000, '兴安区', 230400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230406000000, '东山区', 230400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230407000000, '兴山区', 230400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230421000000, '萝北县', 230400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230422000000, '绥滨县', 230400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230500000000, '双鸭山市', 230000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230501000000, '市辖区', 230500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230502000000, '尖山区', 230500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230503000000, '岭东区', 230500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230505000000, '四方台区', 230500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230506000000, '宝山区', 230500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230521000000, '集贤县', 230500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230522000000, '友谊县', 230500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230523000000, '宝清县', 230500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230524000000, '饶河县', 230500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230600000000, '大庆市', 230000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230601000000, '市辖区', 230600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230602000000, '萨尔图区', 230600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230603000000, '龙凤区', 230600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230604000000, '让胡路区', 230600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230605000000, '红岗区', 230600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230606000000, '大同区', 230600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230621000000, '肇州县', 230600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230622000000, '肇源县', 230600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230623000000, '林甸县', 230600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230624000000, '杜尔伯特蒙古族自治县', 230600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230671000000, '大庆高新技术产业开发区', 230600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230700000000, '伊春市', 230000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230701000000, '市辖区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230702000000, '伊春区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230703000000, '南岔区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230704000000, '友好区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230705000000, '西林区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230706000000, '翠峦区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230707000000, '新青区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230708000000, '美溪区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230709000000, '金山屯区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230710000000, '五营区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230711000000, '乌马河区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230712000000, '汤旺河区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230713000000, '带岭区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230714000000, '乌伊岭区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230715000000, '红星区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230716000000, '上甘岭区', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230722000000, '嘉荫县', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230781000000, '铁力市', 230700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230800000000, '佳木斯市', 230000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230801000000, '市辖区', 230800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230803000000, '向阳区', 230800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230804000000, '前进区', 230800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230805000000, '东风区', 230800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230811000000, '郊区', 230800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230822000000, '桦南县', 230800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230826000000, '桦川县', 230800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230828000000, '汤原县', 230800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230881000000, '同江市', 230800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230882000000, '富锦市', 230800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230883000000, '抚远市', 230800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230900000000, '七台河市', 230000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230901000000, '市辖区', 230900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230902000000, '新兴区', 230900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230903000000, '桃山区', 230900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230904000000, '茄子河区', 230900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (230921000000, '勃利县', 230900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231000000000, '牡丹江市', 230000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231001000000, '市辖区', 231000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231002000000, '东安区', 231000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231003000000, '阳明区', 231000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231004000000, '爱民区', 231000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231005000000, '西安区', 231000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231025000000, '林口县', 231000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231071000000, '牡丹江经济技术开发区', 231000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231081000000, '绥芬河市', 231000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231083000000, '海林市', 231000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231084000000, '宁安市', 231000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231085000000, '穆棱市', 231000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231086000000, '东宁市', 231000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231100000000, '黑河市', 230000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231101000000, '市辖区', 231100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231102000000, '爱辉区', 231100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231121000000, '嫩江县', 231100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231123000000, '逊克县', 231100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231124000000, '孙吴县', 231100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231181000000, '北安市', 231100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231182000000, '五大连池市', 231100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231200000000, '绥化市', 230000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231201000000, '市辖区', 231200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231202000000, '北林区', 231200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231221000000, '望奎县', 231200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231222000000, '兰西县', 231200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231223000000, '青冈县', 231200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231224000000, '庆安县', 231200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231225000000, '明水县', 231200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231226000000, '绥棱县', 231200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231281000000, '安达市', 231200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231282000000, '肇东市', 231200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (231283000000, '海伦市', 231200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (232700000000, '大兴安岭地区', 230000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (232701000000, '漠河市', 232700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (232721000000, '呼玛县', 232700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (232722000000, '塔河县', 232700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (232761000000, '加格达奇区', 232700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (232762000000, '松岭区', 232700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (232763000000, '新林区', 232700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (232764000000, '呼中区', 232700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310000000000, '上海市', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310100000000, '市辖区', 310000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310101000000, '黄浦区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310104000000, '徐汇区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310105000000, '长宁区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310106000000, '静安区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310107000000, '普陀区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310109000000, '虹口区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310110000000, '杨浦区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310112000000, '闵行区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310113000000, '宝山区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310114000000, '嘉定区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310115000000, '浦东新区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310116000000, '金山区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310117000000, '松江区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310118000000, '青浦区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310120000000, '奉贤区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (310151000000, '崇明区', 310100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320000000000, '江苏省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320100000000, '南京市', 320000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320101000000, '市辖区', 320100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320102000000, '玄武区', 320100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320104000000, '秦淮区', 320100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320105000000, '建邺区', 320100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320106000000, '鼓楼区', 320100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320111000000, '浦口区', 320100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320113000000, '栖霞区', 320100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320114000000, '雨花台区', 320100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320115000000, '江宁区', 320100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320116000000, '六合区', 320100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320117000000, '溧水区', 320100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320118000000, '高淳区', 320100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320200000000, '无锡市', 320000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320201000000, '市辖区', 320200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320205000000, '锡山区', 320200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320206000000, '惠山区', 320200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320211000000, '滨湖区', 320200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320213000000, '梁溪区', 320200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320214000000, '新吴区', 320200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320281000000, '江阴市', 320200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320282000000, '宜兴市', 320200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320300000000, '徐州市', 320000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320301000000, '市辖区', 320300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320302000000, '鼓楼区', 320300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320303000000, '云龙区', 320300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320305000000, '贾汪区', 320300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320311000000, '泉山区', 320300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320312000000, '铜山区', 320300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320321000000, '丰县', 320300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320322000000, '沛县', 320300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320324000000, '睢宁县', 320300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320371000000, '徐州经济技术开发区', 320300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320381000000, '新沂市', 320300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320382000000, '邳州市', 320300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320400000000, '常州市', 320000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320401000000, '市辖区', 320400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320402000000, '天宁区', 320400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320404000000, '钟楼区', 320400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320411000000, '新北区', 320400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320412000000, '武进区', 320400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320413000000, '金坛区', 320400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320481000000, '溧阳市', 320400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320500000000, '苏州市', 320000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320501000000, '市辖区', 320500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320505000000, '虎丘区', 320500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320506000000, '吴中区', 320500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320507000000, '相城区', 320500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320508000000, '姑苏区', 320500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320509000000, '吴江区', 320500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320571000000, '苏州工业园区', 320500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320581000000, '常熟市', 320500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320582000000, '张家港市', 320500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320583000000, '昆山市', 320500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320585000000, '太仓市', 320500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320600000000, '南通市', 320000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320601000000, '市辖区', 320600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320602000000, '崇川区', 320600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320611000000, '港闸区', 320600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320612000000, '通州区', 320600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320623000000, '如东县', 320600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320671000000, '南通经济技术开发区', 320600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320681000000, '启东市', 320600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320682000000, '如皋市', 320600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320684000000, '海门市', 320600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320685000000, '海安市', 320600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320700000000, '连云港市', 320000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320701000000, '市辖区', 320700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320703000000, '连云区', 320700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320706000000, '海州区', 320700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320707000000, '赣榆区', 320700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320722000000, '东海县', 320700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320723000000, '灌云县', 320700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320724000000, '灌南县', 320700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320771000000, '连云港经济技术开发区', 320700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320772000000, '连云港高新技术产业开发区', 320700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320800000000, '淮安市', 320000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320801000000, '市辖区', 320800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320803000000, '淮安区', 320800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320804000000, '淮阴区', 320800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320812000000, '清江浦区', 320800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320813000000, '洪泽区', 320800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320826000000, '涟水县', 320800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320830000000, '盱眙县', 320800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320831000000, '金湖县', 320800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320871000000, '淮安经济技术开发区', 320800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320900000000, '盐城市', 320000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320901000000, '市辖区', 320900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320902000000, '亭湖区', 320900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320903000000, '盐都区', 320900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320904000000, '大丰区', 320900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320921000000, '响水县', 320900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320922000000, '滨海县', 320900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320923000000, '阜宁县', 320900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320924000000, '射阳县', 320900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320925000000, '建湖县', 320900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320971000000, '盐城经济技术开发区', 320900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (320981000000, '东台市', 320900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321000000000, '扬州市', 320000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321001000000, '市辖区', 321000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321002000000, '广陵区', 321000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321003000000, '邗江区', 321000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321012000000, '江都区', 321000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321023000000, '宝应县', 321000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321071000000, '扬州经济技术开发区', 321000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321081000000, '仪征市', 321000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321084000000, '高邮市', 321000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321100000000, '镇江市', 320000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321101000000, '市辖区', 321100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321102000000, '京口区', 321100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321111000000, '润州区', 321100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321112000000, '丹徒区', 321100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321171000000, '镇江新区', 321100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321181000000, '丹阳市', 321100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321182000000, '扬中市', 321100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321183000000, '句容市', 321100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321200000000, '泰州市', 320000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321201000000, '市辖区', 321200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321202000000, '海陵区', 321200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321203000000, '高港区', 321200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321204000000, '姜堰区', 321200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321271000000, '泰州医药高新技术产业开发区', 321200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321281000000, '兴化市', 321200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321282000000, '靖江市', 321200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321283000000, '泰兴市', 321200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321300000000, '宿迁市', 320000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321301000000, '市辖区', 321300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321302000000, '宿城区', 321300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321311000000, '宿豫区', 321300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321322000000, '沭阳县', 321300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321323000000, '泗阳县', 321300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321324000000, '泗洪县', 321300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (321371000000, '宿迁经济技术开发区', 321300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330000000000, '浙江省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330100000000, '杭州市', 330000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330101000000, '市辖区', 330100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330102000000, '上城区', 330100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330103000000, '下城区', 330100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330104000000, '江干区', 330100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330105000000, '拱墅区', 330100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330106000000, '西湖区', 330100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330108000000, '滨江区', 330100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330109000000, '萧山区', 330100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330110000000, '余杭区', 330100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330111000000, '富阳区', 330100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330112000000, '临安区', 330100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330122000000, '桐庐县', 330100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330127000000, '淳安县', 330100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330182000000, '建德市', 330100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330200000000, '宁波市', 330000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330201000000, '市辖区', 330200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330203000000, '海曙区', 330200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330205000000, '江北区', 330200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330206000000, '北仑区', 330200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330211000000, '镇海区', 330200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330212000000, '鄞州区', 330200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330213000000, '奉化区', 330200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330225000000, '象山县', 330200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330226000000, '宁海县', 330200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330281000000, '余姚市', 330200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330282000000, '慈溪市', 330200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330300000000, '温州市', 330000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330301000000, '市辖区', 330300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330302000000, '鹿城区', 330300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330303000000, '龙湾区', 330300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330304000000, '瓯海区', 330300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330305000000, '洞头区', 330300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330324000000, '永嘉县', 330300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330326000000, '平阳县', 330300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330327000000, '苍南县', 330300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330328000000, '文成县', 330300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330329000000, '泰顺县', 330300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330371000000, '温州经济技术开发区', 330300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330381000000, '瑞安市', 330300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330382000000, '乐清市', 330300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330400000000, '嘉兴市', 330000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330401000000, '市辖区', 330400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330402000000, '南湖区', 330400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330411000000, '秀洲区', 330400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330421000000, '嘉善县', 330400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330424000000, '海盐县', 330400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330481000000, '海宁市', 330400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330482000000, '平湖市', 330400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330483000000, '桐乡市', 330400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330500000000, '湖州市', 330000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330501000000, '市辖区', 330500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330502000000, '吴兴区', 330500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330503000000, '南浔区', 330500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330521000000, '德清县', 330500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330522000000, '长兴县', 330500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330523000000, '安吉县', 330500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330600000000, '绍兴市', 330000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330601000000, '市辖区', 330600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330602000000, '越城区', 330600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330603000000, '柯桥区', 330600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330604000000, '上虞区', 330600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330624000000, '新昌县', 330600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330681000000, '诸暨市', 330600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330683000000, '嵊州市', 330600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330700000000, '金华市', 330000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330701000000, '市辖区', 330700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330702000000, '婺城区', 330700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330703000000, '金东区', 330700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330723000000, '武义县', 330700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330726000000, '浦江县', 330700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330727000000, '磐安县', 330700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330781000000, '兰溪市', 330700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330782000000, '义乌市', 330700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330783000000, '东阳市', 330700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330784000000, '永康市', 330700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330800000000, '衢州市', 330000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330801000000, '市辖区', 330800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330802000000, '柯城区', 330800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330803000000, '衢江区', 330800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330822000000, '常山县', 330800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330824000000, '开化县', 330800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330825000000, '龙游县', 330800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330881000000, '江山市', 330800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330900000000, '舟山市', 330000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330901000000, '市辖区', 330900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330902000000, '定海区', 330900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330903000000, '普陀区', 330900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330921000000, '岱山县', 330900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (330922000000, '嵊泗县', 330900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331000000000, '台州市', 330000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331001000000, '市辖区', 331000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331002000000, '椒江区', 331000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331003000000, '黄岩区', 331000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331004000000, '路桥区', 331000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331022000000, '三门县', 331000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331023000000, '天台县', 331000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331024000000, '仙居县', 331000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331081000000, '温岭市', 331000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331082000000, '临海市', 331000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331083000000, '玉环市', 331000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331100000000, '丽水市', 330000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331101000000, '市辖区', 331100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331102000000, '莲都区', 331100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331121000000, '青田县', 331100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331122000000, '缙云县', 331100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331123000000, '遂昌县', 331100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331124000000, '松阳县', 331100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331125000000, '云和县', 331100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331126000000, '庆元县', 331100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331127000000, '景宁畲族自治县', 331100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (331181000000, '龙泉市', 331100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340000000000, '安徽省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340100000000, '合肥市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340101000000, '市辖区', 340100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340102000000, '瑶海区', 340100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340103000000, '庐阳区', 340100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340104000000, '蜀山区', 340100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340111000000, '包河区', 340100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340121000000, '长丰县', 340100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340122000000, '肥东县', 340100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340123000000, '肥西县', 340100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340124000000, '庐江县', 340100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340171000000, '合肥高新技术产业开发区', 340100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340172000000, '合肥经济技术开发区', 340100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340173000000, '合肥新站高新技术产业开发区', 340100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340181000000, '巢湖市', 340100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340200000000, '芜湖市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340201000000, '市辖区', 340200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340202000000, '镜湖区', 340200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340203000000, '弋江区', 340200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340207000000, '鸠江区', 340200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340208000000, '三山区', 340200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340221000000, '芜湖县', 340200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340222000000, '繁昌县', 340200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340223000000, '南陵县', 340200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340225000000, '无为县', 340200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340271000000, '芜湖经济技术开发区', 340200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340272000000, '安徽芜湖长江大桥经济开发区', 340200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340300000000, '蚌埠市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340301000000, '市辖区', 340300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340302000000, '龙子湖区', 340300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340303000000, '蚌山区', 340300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340304000000, '禹会区', 340300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340311000000, '淮上区', 340300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340321000000, '怀远县', 340300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340322000000, '五河县', 340300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340323000000, '固镇县', 340300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340371000000, '蚌埠市高新技术开发区', 340300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340372000000, '蚌埠市经济开发区', 340300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340400000000, '淮南市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340401000000, '市辖区', 340400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340402000000, '大通区', 340400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340403000000, '田家庵区', 340400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340404000000, '谢家集区', 340400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340405000000, '八公山区', 340400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340406000000, '潘集区', 340400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340421000000, '凤台县', 340400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340422000000, '寿县', 340400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340500000000, '马鞍山市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340501000000, '市辖区', 340500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340503000000, '花山区', 340500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340504000000, '雨山区', 340500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340506000000, '博望区', 340500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340521000000, '当涂县', 340500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340522000000, '含山县', 340500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340523000000, '和县', 340500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340600000000, '淮北市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340601000000, '市辖区', 340600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340602000000, '杜集区', 340600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340603000000, '相山区', 340600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340604000000, '烈山区', 340600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340621000000, '濉溪县', 340600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340700000000, '铜陵市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340701000000, '市辖区', 340700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340705000000, '铜官区', 340700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340706000000, '义安区', 340700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340711000000, '郊区', 340700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340722000000, '枞阳县', 340700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340800000000, '安庆市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340801000000, '市辖区', 340800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340802000000, '迎江区', 340800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340803000000, '大观区', 340800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340811000000, '宜秀区', 340800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340822000000, '怀宁县', 340800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340825000000, '太湖县', 340800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340826000000, '宿松县', 340800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340827000000, '望江县', 340800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340828000000, '岳西县', 340800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340871000000, '安徽安庆经济开发区', 340800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340881000000, '桐城市', 340800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (340882000000, '潜山市', 340800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341000000000, '黄山市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341001000000, '市辖区', 341000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341002000000, '屯溪区', 341000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341003000000, '黄山区', 341000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341004000000, '徽州区', 341000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341021000000, '歙县', 341000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341022000000, '休宁县', 341000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341023000000, '黟县', 341000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341024000000, '祁门县', 341000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341100000000, '滁州市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341101000000, '市辖区', 341100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341102000000, '琅琊区', 341100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341103000000, '南谯区', 341100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341122000000, '来安县', 341100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341124000000, '全椒县', 341100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341125000000, '定远县', 341100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341126000000, '凤阳县', 341100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341171000000, '苏滁现代产业园', 341100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341172000000, '滁州经济技术开发区', 341100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341181000000, '天长市', 341100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341182000000, '明光市', 341100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341200000000, '阜阳市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341201000000, '市辖区', 341200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341202000000, '颍州区', 341200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341203000000, '颍东区', 341200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341204000000, '颍泉区', 341200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341221000000, '临泉县', 341200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341222000000, '太和县', 341200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341225000000, '阜南县', 341200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341226000000, '颍上县', 341200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341271000000, '阜阳合肥现代产业园区', 341200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341272000000, '阜阳经济技术开发区', 341200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341282000000, '界首市', 341200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341300000000, '宿州市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341301000000, '市辖区', 341300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341302000000, '埇桥区', 341300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341321000000, '砀山县', 341300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341322000000, '萧县', 341300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341323000000, '灵璧县', 341300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341324000000, '泗县', 341300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341371000000, '宿州马鞍山现代产业园区', 341300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341372000000, '宿州经济技术开发区', 341300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341500000000, '六安市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341501000000, '市辖区', 341500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341502000000, '金安区', 341500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341503000000, '裕安区', 341500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341504000000, '叶集区', 341500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341522000000, '霍邱县', 341500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341523000000, '舒城县', 341500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341524000000, '金寨县', 341500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341525000000, '霍山县', 341500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341600000000, '亳州市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341601000000, '市辖区', 341600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341602000000, '谯城区', 341600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341621000000, '涡阳县', 341600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341622000000, '蒙城县', 341600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341623000000, '利辛县', 341600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341700000000, '池州市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341701000000, '市辖区', 341700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341702000000, '贵池区', 341700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341721000000, '东至县', 341700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341722000000, '石台县', 341700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341723000000, '青阳县', 341700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341800000000, '宣城市', 340000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341801000000, '市辖区', 341800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341802000000, '宣州区', 341800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341821000000, '郎溪县', 341800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341822000000, '广德县', 341800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341823000000, '泾县', 341800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341824000000, '绩溪县', 341800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341825000000, '旌德县', 341800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341871000000, '宣城市经济开发区', 341800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (341881000000, '宁国市', 341800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350000000000, '福建省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350100000000, '福州市', 350000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350101000000, '市辖区', 350100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350102000000, '鼓楼区', 350100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350103000000, '台江区', 350100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350104000000, '仓山区', 350100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350105000000, '马尾区', 350100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350111000000, '晋安区', 350100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350112000000, '长乐区', 350100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350121000000, '闽侯县', 350100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350122000000, '连江县', 350100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350123000000, '罗源县', 350100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350124000000, '闽清县', 350100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350125000000, '永泰县', 350100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350128000000, '平潭县', 350100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350181000000, '福清市', 350100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350200000000, '厦门市', 350000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350201000000, '市辖区', 350200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350203000000, '思明区', 350200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350205000000, '海沧区', 350200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350206000000, '湖里区', 350200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350211000000, '集美区', 350200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350212000000, '同安区', 350200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350213000000, '翔安区', 350200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350300000000, '莆田市', 350000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350301000000, '市辖区', 350300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350302000000, '城厢区', 350300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350303000000, '涵江区', 350300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350304000000, '荔城区', 350300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350305000000, '秀屿区', 350300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350322000000, '仙游县', 350300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350400000000, '三明市', 350000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350401000000, '市辖区', 350400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350402000000, '梅列区', 350400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350403000000, '三元区', 350400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350421000000, '明溪县', 350400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350423000000, '清流县', 350400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350424000000, '宁化县', 350400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350425000000, '大田县', 350400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350426000000, '尤溪县', 350400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350427000000, '沙县', 350400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350428000000, '将乐县', 350400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350429000000, '泰宁县', 350400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350430000000, '建宁县', 350400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350481000000, '永安市', 350400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350500000000, '泉州市', 350000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350501000000, '市辖区', 350500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350502000000, '鲤城区', 350500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350503000000, '丰泽区', 350500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350504000000, '洛江区', 350500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350505000000, '泉港区', 350500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350521000000, '惠安县', 350500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350524000000, '安溪县', 350500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350525000000, '永春县', 350500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350526000000, '德化县', 350500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350527000000, '金门县', 350500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350581000000, '石狮市', 350500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350582000000, '晋江市', 350500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350583000000, '南安市', 350500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350600000000, '漳州市', 350000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350601000000, '市辖区', 350600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350602000000, '芗城区', 350600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350603000000, '龙文区', 350600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350622000000, '云霄县', 350600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350623000000, '漳浦县', 350600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350624000000, '诏安县', 350600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350625000000, '长泰县', 350600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350626000000, '东山县', 350600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350627000000, '南靖县', 350600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350628000000, '平和县', 350600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350629000000, '华安县', 350600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350681000000, '龙海市', 350600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350700000000, '南平市', 350000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350701000000, '市辖区', 350700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350702000000, '延平区', 350700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350703000000, '建阳区', 350700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350721000000, '顺昌县', 350700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350722000000, '浦城县', 350700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350723000000, '光泽县', 350700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350724000000, '松溪县', 350700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350725000000, '政和县', 350700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350781000000, '邵武市', 350700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350782000000, '武夷山市', 350700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350783000000, '建瓯市', 350700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350800000000, '龙岩市', 350000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350801000000, '市辖区', 350800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350802000000, '新罗区', 350800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350803000000, '永定区', 350800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350821000000, '长汀县', 350800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350823000000, '上杭县', 350800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350824000000, '武平县', 350800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350825000000, '连城县', 350800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350881000000, '漳平市', 350800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350900000000, '宁德市', 350000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350901000000, '市辖区', 350900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350902000000, '蕉城区', 350900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350921000000, '霞浦县', 350900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350922000000, '古田县', 350900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350923000000, '屏南县', 350900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350924000000, '寿宁县', 350900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350925000000, '周宁县', 350900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350926000000, '柘荣县', 350900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350981000000, '福安市', 350900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (350982000000, '福鼎市', 350900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360000000000, '江西省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360100000000, '南昌市', 360000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360101000000, '市辖区', 360100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360102000000, '东湖区', 360100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360103000000, '西湖区', 360100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360104000000, '青云谱区', 360100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360105000000, '湾里区', 360100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360111000000, '青山湖区', 360100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360112000000, '新建区', 360100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360121000000, '南昌县', 360100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360123000000, '安义县', 360100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360124000000, '进贤县', 360100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360200000000, '景德镇市', 360000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360201000000, '市辖区', 360200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360202000000, '昌江区', 360200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360203000000, '珠山区', 360200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360222000000, '浮梁县', 360200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360281000000, '乐平市', 360200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360300000000, '萍乡市', 360000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360301000000, '市辖区', 360300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360302000000, '安源区', 360300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360313000000, '湘东区', 360300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360321000000, '莲花县', 360300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360322000000, '上栗县', 360300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360323000000, '芦溪县', 360300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360400000000, '九江市', 360000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360401000000, '市辖区', 360400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360402000000, '濂溪区', 360400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360403000000, '浔阳区', 360400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360404000000, '柴桑区', 360400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360423000000, '武宁县', 360400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360424000000, '修水县', 360400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360425000000, '永修县', 360400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360426000000, '德安县', 360400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360428000000, '都昌县', 360400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360429000000, '湖口县', 360400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360430000000, '彭泽县', 360400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360481000000, '瑞昌市', 360400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360482000000, '共青城市', 360400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360483000000, '庐山市', 360400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360500000000, '新余市', 360000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360501000000, '市辖区', 360500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360502000000, '渝水区', 360500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360521000000, '分宜县', 360500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360600000000, '鹰潭市', 360000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360601000000, '市辖区', 360600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360602000000, '月湖区', 360600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360603000000, '余江区', 360600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360681000000, '贵溪市', 360600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360700000000, '赣州市', 360000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360701000000, '市辖区', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360702000000, '章贡区', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360703000000, '南康区', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360704000000, '赣县区', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360722000000, '信丰县', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360723000000, '大余县', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360724000000, '上犹县', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360725000000, '崇义县', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360726000000, '安远县', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360727000000, '龙南县', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360728000000, '定南县', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360729000000, '全南县', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360730000000, '宁都县', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360731000000, '于都县', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360732000000, '兴国县', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360733000000, '会昌县', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360734000000, '寻乌县', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360735000000, '石城县', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360781000000, '瑞金市', 360700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360800000000, '吉安市', 360000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360801000000, '市辖区', 360800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360802000000, '吉州区', 360800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360803000000, '青原区', 360800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360821000000, '吉安县', 360800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360822000000, '吉水县', 360800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360823000000, '峡江县', 360800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360824000000, '新干县', 360800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360825000000, '永丰县', 360800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360826000000, '泰和县', 360800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360827000000, '遂川县', 360800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360828000000, '万安县', 360800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360829000000, '安福县', 360800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360830000000, '永新县', 360800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360881000000, '井冈山市', 360800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360900000000, '宜春市', 360000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360901000000, '市辖区', 360900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360902000000, '袁州区', 360900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360921000000, '奉新县', 360900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360922000000, '万载县', 360900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360923000000, '上高县', 360900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360924000000, '宜丰县', 360900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360925000000, '靖安县', 360900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360926000000, '铜鼓县', 360900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360981000000, '丰城市', 360900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360982000000, '樟树市', 360900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (360983000000, '高安市', 360900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361000000000, '抚州市', 360000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361001000000, '市辖区', 361000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361002000000, '临川区', 361000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361003000000, '东乡区', 361000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361021000000, '南城县', 361000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361022000000, '黎川县', 361000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361023000000, '南丰县', 361000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361024000000, '崇仁县', 361000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361025000000, '乐安县', 361000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361026000000, '宜黄县', 361000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361027000000, '金溪县', 361000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361028000000, '资溪县', 361000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361030000000, '广昌县', 361000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361100000000, '上饶市', 360000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361101000000, '市辖区', 361100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361102000000, '信州区', 361100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361103000000, '广丰区', 361100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361121000000, '上饶县', 361100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361123000000, '玉山县', 361100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361124000000, '铅山县', 361100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361125000000, '横峰县', 361100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361126000000, '弋阳县', 361100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361127000000, '余干县', 361100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361128000000, '鄱阳县', 361100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361129000000, '万年县', 361100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361130000000, '婺源县', 361100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (361181000000, '德兴市', 361100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370000000000, '山东省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370100000000, '济南市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370101000000, '市辖区', 370100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370102000000, '历下区', 370100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370103000000, '市中区', 370100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370104000000, '槐荫区', 370100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370105000000, '天桥区', 370100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370112000000, '历城区', 370100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370113000000, '长清区', 370100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370114000000, '章丘区', 370100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370115000000, '济阳区', 370100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370124000000, '平阴县', 370100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370126000000, '商河县', 370100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370171000000, '济南高新技术产业开发区', 370100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370200000000, '青岛市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370201000000, '市辖区', 370200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370202000000, '市南区', 370200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370203000000, '市北区', 370200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370211000000, '黄岛区', 370200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370212000000, '崂山区', 370200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370213000000, '李沧区', 370200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370214000000, '城阳区', 370200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370215000000, '即墨区', 370200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370271000000, '青岛高新技术产业开发区', 370200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370281000000, '胶州市', 370200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370283000000, '平度市', 370200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370285000000, '莱西市', 370200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370300000000, '淄博市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370301000000, '市辖区', 370300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370302000000, '淄川区', 370300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370303000000, '张店区', 370300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370304000000, '博山区', 370300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370305000000, '临淄区', 370300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370306000000, '周村区', 370300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370321000000, '桓台县', 370300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370322000000, '高青县', 370300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370323000000, '沂源县', 370300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370400000000, '枣庄市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370401000000, '市辖区', 370400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370402000000, '市中区', 370400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370403000000, '薛城区', 370400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370404000000, '峄城区', 370400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370405000000, '台儿庄区', 370400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370406000000, '山亭区', 370400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370481000000, '滕州市', 370400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370500000000, '东营市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370501000000, '市辖区', 370500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370502000000, '东营区', 370500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370503000000, '河口区', 370500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370505000000, '垦利区', 370500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370522000000, '利津县', 370500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370523000000, '广饶县', 370500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370571000000, '东营经济技术开发区', 370500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370572000000, '东营港经济开发区', 370500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370600000000, '烟台市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370601000000, '市辖区', 370600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370602000000, '芝罘区', 370600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370611000000, '福山区', 370600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370612000000, '牟平区', 370600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370613000000, '莱山区', 370600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370634000000, '长岛县', 370600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370671000000, '烟台高新技术产业开发区', 370600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370672000000, '烟台经济技术开发区', 370600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370681000000, '龙口市', 370600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370682000000, '莱阳市', 370600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370683000000, '莱州市', 370600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370684000000, '蓬莱市', 370600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370685000000, '招远市', 370600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370686000000, '栖霞市', 370600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370687000000, '海阳市', 370600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370700000000, '潍坊市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370701000000, '市辖区', 370700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370702000000, '潍城区', 370700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370703000000, '寒亭区', 370700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370704000000, '坊子区', 370700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370705000000, '奎文区', 370700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370724000000, '临朐县', 370700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370725000000, '昌乐县', 370700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370772000000, '潍坊滨海经济技术开发区', 370700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370781000000, '青州市', 370700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370782000000, '诸城市', 370700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370783000000, '寿光市', 370700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370784000000, '安丘市', 370700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370785000000, '高密市', 370700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370786000000, '昌邑市', 370700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370800000000, '济宁市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370801000000, '市辖区', 370800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370811000000, '任城区', 370800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370812000000, '兖州区', 370800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370826000000, '微山县', 370800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370827000000, '鱼台县', 370800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370828000000, '金乡县', 370800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370829000000, '嘉祥县', 370800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370830000000, '汶上县', 370800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370831000000, '泗水县', 370800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370832000000, '梁山县', 370800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370871000000, '济宁高新技术产业开发区', 370800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370881000000, '曲阜市', 370800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370883000000, '邹城市', 370800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370900000000, '泰安市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370901000000, '市辖区', 370900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370902000000, '泰山区', 370900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370911000000, '岱岳区', 370900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370921000000, '宁阳县', 370900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370923000000, '东平县', 370900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370982000000, '新泰市', 370900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (370983000000, '肥城市', 370900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371000000000, '威海市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371001000000, '市辖区', 371000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371002000000, '环翠区', 371000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371003000000, '文登区', 371000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371071000000, '威海火炬高技术产业开发区', 371000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371072000000, '威海经济技术开发区', 371000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371073000000, '威海临港经济技术开发区', 371000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371082000000, '荣成市', 371000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371083000000, '乳山市', 371000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371100000000, '日照市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371101000000, '市辖区', 371100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371102000000, '东港区', 371100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371103000000, '岚山区', 371100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371121000000, '五莲县', 371100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371122000000, '莒县', 371100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371171000000, '日照经济技术开发区', 371100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371200000000, '莱芜市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371201000000, '市辖区', 371200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371202000000, '莱城区', 371200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371203000000, '钢城区', 371200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371300000000, '临沂市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371301000000, '市辖区', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371302000000, '兰山区', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371311000000, '罗庄区', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371312000000, '河东区', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371321000000, '沂南县', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371322000000, '郯城县', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371323000000, '沂水县', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371324000000, '兰陵县', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371325000000, '费县', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371326000000, '平邑县', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371327000000, '莒南县', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371328000000, '蒙阴县', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371329000000, '临沭县', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371371000000, '临沂高新技术产业开发区', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371372000000, '临沂经济技术开发区', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371373000000, '临沂临港经济开发区', 371300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371400000000, '德州市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371401000000, '市辖区', 371400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371402000000, '德城区', 371400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371403000000, '陵城区', 371400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371422000000, '宁津县', 371400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371423000000, '庆云县', 371400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371424000000, '临邑县', 371400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371425000000, '齐河县', 371400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371426000000, '平原县', 371400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371427000000, '夏津县', 371400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371428000000, '武城县', 371400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371471000000, '德州经济技术开发区', 371400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371472000000, '德州运河经济开发区', 371400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371481000000, '乐陵市', 371400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371482000000, '禹城市', 371400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371500000000, '聊城市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371501000000, '市辖区', 371500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371502000000, '东昌府区', 371500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371521000000, '阳谷县', 371500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371522000000, '莘县', 371500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371523000000, '茌平县', 371500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371524000000, '东阿县', 371500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371525000000, '冠县', 371500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371526000000, '高唐县', 371500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371581000000, '临清市', 371500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371600000000, '滨州市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371601000000, '市辖区', 371600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371602000000, '滨城区', 371600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371603000000, '沾化区', 371600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371621000000, '惠民县', 371600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371622000000, '阳信县', 371600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371623000000, '无棣县', 371600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371625000000, '博兴县', 371600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371681000000, '邹平市', 371600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371700000000, '菏泽市', 370000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371701000000, '市辖区', 371700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371702000000, '牡丹区', 371700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371703000000, '定陶区', 371700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371721000000, '曹县', 371700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371722000000, '单县', 371700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371723000000, '成武县', 371700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371724000000, '巨野县', 371700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371725000000, '郓城县', 371700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371726000000, '鄄城县', 371700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371728000000, '东明县', 371700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371771000000, '菏泽经济技术开发区', 371700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (371772000000, '菏泽高新技术开发区', 371700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410000000000, '河南省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410100000000, '郑州市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410101000000, '市辖区', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410102000000, '中原区', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410103000000, '二七区', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410104000000, '管城回族区', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410105000000, '金水区', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410106000000, '上街区', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410108000000, '惠济区', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410122000000, '中牟县', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410171000000, '郑州经济技术开发区', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410172000000, '郑州高新技术产业开发区', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410173000000, '郑州航空港经济综合实验区', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410181000000, '巩义市', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410182000000, '荥阳市', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410183000000, '新密市', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410184000000, '新郑市', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410185000000, '登封市', 410100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410200000000, '开封市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410201000000, '市辖区', 410200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410202000000, '龙亭区', 410200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410203000000, '顺河回族区', 410200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410204000000, '鼓楼区', 410200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410205000000, '禹王台区', 410200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410212000000, '祥符区', 410200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410221000000, '杞县', 410200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410222000000, '通许县', 410200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410223000000, '尉氏县', 410200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410225000000, '兰考县', 410200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410300000000, '洛阳市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410301000000, '市辖区', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410302000000, '老城区', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410303000000, '西工区', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410304000000, '瀍河回族区', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410305000000, '涧西区', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410306000000, '吉利区', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410311000000, '洛龙区', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410322000000, '孟津县', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410323000000, '新安县', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410324000000, '栾川县', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410325000000, '嵩县', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410326000000, '汝阳县', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410327000000, '宜阳县', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410328000000, '洛宁县', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410329000000, '伊川县', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410371000000, '洛阳高新技术产业开发区', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410381000000, '偃师市', 410300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410400000000, '平顶山市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410401000000, '市辖区', 410400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410402000000, '新华区', 410400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410403000000, '卫东区', 410400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410404000000, '石龙区', 410400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410411000000, '湛河区', 410400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410421000000, '宝丰县', 410400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410422000000, '叶县', 410400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410423000000, '鲁山县', 410400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410425000000, '郏县', 410400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410471000000, '平顶山高新技术产业开发区', 410400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410472000000, '平顶山市新城区', 410400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410481000000, '舞钢市', 410400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410482000000, '汝州市', 410400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410500000000, '安阳市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410501000000, '市辖区', 410500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410502000000, '文峰区', 410500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410503000000, '北关区', 410500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410505000000, '殷都区', 410500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410506000000, '龙安区', 410500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410522000000, '安阳县', 410500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410523000000, '汤阴县', 410500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410526000000, '滑县', 410500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410527000000, '内黄县', 410500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410571000000, '安阳高新技术产业开发区', 410500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410581000000, '林州市', 410500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410600000000, '鹤壁市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410601000000, '市辖区', 410600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410602000000, '鹤山区', 410600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410603000000, '山城区', 410600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410611000000, '淇滨区', 410600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410621000000, '浚县', 410600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410622000000, '淇县', 410600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410671000000, '鹤壁经济技术开发区', 410600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410700000000, '新乡市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410701000000, '市辖区', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410702000000, '红旗区', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410703000000, '卫滨区', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410704000000, '凤泉区', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410711000000, '牧野区', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410721000000, '新乡县', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410724000000, '获嘉县', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410725000000, '原阳县', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410726000000, '延津县', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410727000000, '封丘县', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410728000000, '长垣县', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410771000000, '新乡高新技术产业开发区', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410772000000, '新乡经济技术开发区', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410773000000, '新乡市平原城乡一体化示范区', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410781000000, '卫辉市', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410782000000, '辉县市', 410700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410800000000, '焦作市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410801000000, '市辖区', 410800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410802000000, '解放区', 410800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410803000000, '中站区', 410800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410804000000, '马村区', 410800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410811000000, '山阳区', 410800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410821000000, '修武县', 410800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410822000000, '博爱县', 410800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410823000000, '武陟县', 410800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410825000000, '温县', 410800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410871000000, '焦作城乡一体化示范区', 410800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410882000000, '沁阳市', 410800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410883000000, '孟州市', 410800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410900000000, '濮阳市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410901000000, '市辖区', 410900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410902000000, '华龙区', 410900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410922000000, '清丰县', 410900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410923000000, '南乐县', 410900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410926000000, '范县', 410900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410927000000, '台前县', 410900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410928000000, '濮阳县', 410900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410971000000, '河南濮阳工业园区', 410900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (410972000000, '濮阳经济技术开发区', 410900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411000000000, '许昌市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411001000000, '市辖区', 411000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411002000000, '魏都区', 411000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411003000000, '建安区', 411000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411024000000, '鄢陵县', 411000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411025000000, '襄城县', 411000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411071000000, '许昌经济技术开发区', 411000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411081000000, '禹州市', 411000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411082000000, '长葛市', 411000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411100000000, '漯河市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411101000000, '市辖区', 411100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411102000000, '源汇区', 411100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411103000000, '郾城区', 411100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411104000000, '召陵区', 411100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411121000000, '舞阳县', 411100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411122000000, '临颍县', 411100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411171000000, '漯河经济技术开发区', 411100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411200000000, '三门峡市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411201000000, '市辖区', 411200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411202000000, '湖滨区', 411200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411203000000, '陕州区', 411200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411221000000, '渑池县', 411200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411224000000, '卢氏县', 411200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411271000000, '河南三门峡经济开发区', 411200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411281000000, '义马市', 411200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411282000000, '灵宝市', 411200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411300000000, '南阳市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411301000000, '市辖区', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411302000000, '宛城区', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411303000000, '卧龙区', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411321000000, '南召县', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411322000000, '方城县', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411323000000, '西峡县', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411324000000, '镇平县', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411325000000, '内乡县', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411326000000, '淅川县', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411327000000, '社旗县', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411328000000, '唐河县', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411329000000, '新野县', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411330000000, '桐柏县', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411371000000, '南阳高新技术产业开发区', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411372000000, '南阳市城乡一体化示范区', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411381000000, '邓州市', 411300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411400000000, '商丘市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411401000000, '市辖区', 411400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411402000000, '梁园区', 411400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411403000000, '睢阳区', 411400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411421000000, '民权县', 411400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411422000000, '睢县', 411400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411423000000, '宁陵县', 411400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411424000000, '柘城县', 411400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411425000000, '虞城县', 411400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411426000000, '夏邑县', 411400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411471000000, '豫东综合物流产业聚集区', 411400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411472000000, '河南商丘经济开发区', 411400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411481000000, '永城市', 411400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411500000000, '信阳市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411501000000, '市辖区', 411500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411502000000, '浉河区', 411500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411503000000, '平桥区', 411500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411521000000, '罗山县', 411500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411522000000, '光山县', 411500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411523000000, '新县', 411500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411524000000, '商城县', 411500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411525000000, '固始县', 411500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411526000000, '潢川县', 411500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411527000000, '淮滨县', 411500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411528000000, '息县', 411500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411571000000, '信阳高新技术产业开发区', 411500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411600000000, '周口市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411601000000, '市辖区', 411600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411602000000, '川汇区', 411600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411621000000, '扶沟县', 411600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411622000000, '西华县', 411600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411623000000, '商水县', 411600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411624000000, '沈丘县', 411600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411625000000, '郸城县', 411600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411626000000, '淮阳县', 411600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411627000000, '太康县', 411600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411628000000, '鹿邑县', 411600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411671000000, '河南周口经济开发区', 411600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411681000000, '项城市', 411600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411700000000, '驻马店市', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411701000000, '市辖区', 411700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411702000000, '驿城区', 411700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411721000000, '西平县', 411700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411722000000, '上蔡县', 411700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411723000000, '平舆县', 411700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411724000000, '正阳县', 411700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411725000000, '确山县', 411700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411726000000, '泌阳县', 411700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411727000000, '汝南县', 411700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411728000000, '遂平县', 411700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411729000000, '新蔡县', 411700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (411771000000, '河南驻马店经济开发区', 411700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (419000000000, '省直辖县级行政区划', 410000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (419001000000, '济源市', 419000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420000000000, '湖北省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420100000000, '武汉市', 420000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420101000000, '市辖区', 420100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420102000000, '江岸区', 420100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420103000000, '江汉区', 420100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420104000000, '硚口区', 420100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420105000000, '汉阳区', 420100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420106000000, '武昌区', 420100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420107000000, '青山区', 420100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420111000000, '洪山区', 420100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420112000000, '东西湖区', 420100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420113000000, '汉南区', 420100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420114000000, '蔡甸区', 420100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420115000000, '江夏区', 420100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420116000000, '黄陂区', 420100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420117000000, '新洲区', 420100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420200000000, '黄石市', 420000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420201000000, '市辖区', 420200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420202000000, '黄石港区', 420200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420203000000, '西塞山区', 420200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420204000000, '下陆区', 420200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420205000000, '铁山区', 420200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420222000000, '阳新县', 420200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420281000000, '大冶市', 420200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420300000000, '十堰市', 420000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420301000000, '市辖区', 420300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420302000000, '茅箭区', 420300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420303000000, '张湾区', 420300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420304000000, '郧阳区', 420300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420322000000, '郧西县', 420300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420323000000, '竹山县', 420300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420324000000, '竹溪县', 420300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420325000000, '房县', 420300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420381000000, '丹江口市', 420300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420500000000, '宜昌市', 420000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420501000000, '市辖区', 420500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420502000000, '西陵区', 420500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420503000000, '伍家岗区', 420500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420504000000, '点军区', 420500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420505000000, '猇亭区', 420500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420506000000, '夷陵区', 420500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420525000000, '远安县', 420500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420526000000, '兴山县', 420500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420527000000, '秭归县', 420500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420528000000, '长阳土家族自治县', 420500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420529000000, '五峰土家族自治县', 420500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420581000000, '宜都市', 420500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420582000000, '当阳市', 420500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420583000000, '枝江市', 420500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420600000000, '襄阳市', 420000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420601000000, '市辖区', 420600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420602000000, '襄城区', 420600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420606000000, '樊城区', 420600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420607000000, '襄州区', 420600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420624000000, '南漳县', 420600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420625000000, '谷城县', 420600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420626000000, '保康县', 420600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420682000000, '老河口市', 420600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420683000000, '枣阳市', 420600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420684000000, '宜城市', 420600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420700000000, '鄂州市', 420000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420701000000, '市辖区', 420700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420702000000, '梁子湖区', 420700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420703000000, '华容区', 420700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420704000000, '鄂城区', 420700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420800000000, '荆门市', 420000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420801000000, '市辖区', 420800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420802000000, '东宝区', 420800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420804000000, '掇刀区', 420800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420822000000, '沙洋县', 420800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420881000000, '钟祥市', 420800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420882000000, '京山市', 420800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420900000000, '孝感市', 420000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420901000000, '市辖区', 420900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420902000000, '孝南区', 420900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420921000000, '孝昌县', 420900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420922000000, '大悟县', 420900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420923000000, '云梦县', 420900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420981000000, '应城市', 420900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420982000000, '安陆市', 420900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (420984000000, '汉川市', 420900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421000000000, '荆州市', 420000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421001000000, '市辖区', 421000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421002000000, '沙市区', 421000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421003000000, '荆州区', 421000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421022000000, '公安县', 421000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421023000000, '监利县', 421000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421024000000, '江陵县', 421000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421071000000, '荆州经济技术开发区', 421000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421081000000, '石首市', 421000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421083000000, '洪湖市', 421000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421087000000, '松滋市', 421000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421100000000, '黄冈市', 420000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421101000000, '市辖区', 421100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421102000000, '黄州区', 421100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421121000000, '团风县', 421100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421122000000, '红安县', 421100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421123000000, '罗田县', 421100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421124000000, '英山县', 421100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421125000000, '浠水县', 421100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421126000000, '蕲春县', 421100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421127000000, '黄梅县', 421100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421171000000, '龙感湖管理区', 421100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421181000000, '麻城市', 421100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421182000000, '武穴市', 421100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421200000000, '咸宁市', 420000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421201000000, '市辖区', 421200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421202000000, '咸安区', 421200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421221000000, '嘉鱼县', 421200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421222000000, '通城县', 421200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421223000000, '崇阳县', 421200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421224000000, '通山县', 421200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421281000000, '赤壁市', 421200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421300000000, '随州市', 420000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421301000000, '市辖区', 421300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421303000000, '曾都区', 421300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421321000000, '随县', 421300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (421381000000, '广水市', 421300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (422800000000, '恩施土家族苗族自治州', 420000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (422801000000, '恩施市', 422800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (422802000000, '利川市', 422800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (422822000000, '建始县', 422800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (422823000000, '巴东县', 422800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (422825000000, '宣恩县', 422800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (422826000000, '咸丰县', 422800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (422827000000, '来凤县', 422800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (422828000000, '鹤峰县', 422800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (429000000000, '省直辖县级行政区划', 420000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (429004000000, '仙桃市', 429000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (429005000000, '潜江市', 429000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (429006000000, '天门市', 429000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (429021000000, '神农架林区', 429000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430000000000, '湖南省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430100000000, '长沙市', 430000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430101000000, '市辖区', 430100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430102000000, '芙蓉区', 430100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430103000000, '天心区', 430100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430104000000, '岳麓区', 430100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430105000000, '开福区', 430100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430111000000, '雨花区', 430100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430112000000, '望城区', 430100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430121000000, '长沙县', 430100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430181000000, '浏阳市', 430100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430182000000, '宁乡市', 430100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430200000000, '株洲市', 430000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430201000000, '市辖区', 430200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430202000000, '荷塘区', 430200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430203000000, '芦淞区', 430200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430204000000, '石峰区', 430200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430211000000, '天元区', 430200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430212000000, '渌口区', 430200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430223000000, '攸县', 430200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430224000000, '茶陵县', 430200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430225000000, '炎陵县', 430200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430271000000, '云龙示范区', 430200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430281000000, '醴陵市', 430200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430300000000, '湘潭市', 430000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430301000000, '市辖区', 430300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430302000000, '雨湖区', 430300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430304000000, '岳塘区', 430300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430321000000, '湘潭县', 430300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430371000000, '湖南湘潭高新技术产业园区', 430300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430372000000, '湘潭昭山示范区', 430300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430373000000, '湘潭九华示范区', 430300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430381000000, '湘乡市', 430300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430382000000, '韶山市', 430300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430400000000, '衡阳市', 430000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430401000000, '市辖区', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430405000000, '珠晖区', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430406000000, '雁峰区', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430407000000, '石鼓区', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430408000000, '蒸湘区', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430412000000, '南岳区', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430421000000, '衡阳县', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430422000000, '衡南县', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430423000000, '衡山县', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430424000000, '衡东县', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430426000000, '祁东县', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430471000000, '衡阳综合保税区', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430472000000, '湖南衡阳高新技术产业园区', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430473000000, '湖南衡阳松木经济开发区', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430481000000, '耒阳市', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430482000000, '常宁市', 430400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430500000000, '邵阳市', 430000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430501000000, '市辖区', 430500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430502000000, '双清区', 430500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430503000000, '大祥区', 430500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430511000000, '北塔区', 430500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430521000000, '邵东县', 430500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430522000000, '新邵县', 430500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430523000000, '邵阳县', 430500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430524000000, '隆回县', 430500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430525000000, '洞口县', 430500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430527000000, '绥宁县', 430500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430528000000, '新宁县', 430500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430529000000, '城步苗族自治县', 430500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430581000000, '武冈市', 430500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430600000000, '岳阳市', 430000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430601000000, '市辖区', 430600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430602000000, '岳阳楼区', 430600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430603000000, '云溪区', 430600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430611000000, '君山区', 430600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430621000000, '岳阳县', 430600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430623000000, '华容县', 430600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430624000000, '湘阴县', 430600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430626000000, '平江县', 430600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430671000000, '岳阳市屈原管理区', 430600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430681000000, '汨罗市', 430600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430682000000, '临湘市', 430600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430700000000, '常德市', 430000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430701000000, '市辖区', 430700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430702000000, '武陵区', 430700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430703000000, '鼎城区', 430700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430721000000, '安乡县', 430700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430722000000, '汉寿县', 430700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430723000000, '澧县', 430700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430724000000, '临澧县', 430700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430725000000, '桃源县', 430700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430726000000, '石门县', 430700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430771000000, '常德市西洞庭管理区', 430700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430781000000, '津市市', 430700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430800000000, '张家界市', 430000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430801000000, '市辖区', 430800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430802000000, '永定区', 430800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430811000000, '武陵源区', 430800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430821000000, '慈利县', 430800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430822000000, '桑植县', 430800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430900000000, '益阳市', 430000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430901000000, '市辖区', 430900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430902000000, '资阳区', 430900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430903000000, '赫山区', 430900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430921000000, '南县', 430900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430922000000, '桃江县', 430900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430923000000, '安化县', 430900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430971000000, '益阳市大通湖管理区', 430900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430972000000, '湖南益阳高新技术产业园区', 430900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (430981000000, '沅江市', 430900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431000000000, '郴州市', 430000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431001000000, '市辖区', 431000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431002000000, '北湖区', 431000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431003000000, '苏仙区', 431000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431021000000, '桂阳县', 431000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431022000000, '宜章县', 431000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431023000000, '永兴县', 431000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431024000000, '嘉禾县', 431000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431025000000, '临武县', 431000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431026000000, '汝城县', 431000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431027000000, '桂东县', 431000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431028000000, '安仁县', 431000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431081000000, '资兴市', 431000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431100000000, '永州市', 430000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431101000000, '市辖区', 431100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431102000000, '零陵区', 431100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431103000000, '冷水滩区', 431100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431121000000, '祁阳县', 431100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431122000000, '东安县', 431100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431123000000, '双牌县', 431100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431124000000, '道县', 431100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431125000000, '江永县', 431100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431126000000, '宁远县', 431100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431127000000, '蓝山县', 431100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431128000000, '新田县', 431100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431129000000, '江华瑶族自治县', 431100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431171000000, '永州经济技术开发区', 431100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431172000000, '永州市金洞管理区', 431100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431173000000, '永州市回龙圩管理区', 431100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431200000000, '怀化市', 430000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431201000000, '市辖区', 431200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431202000000, '鹤城区', 431200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431221000000, '中方县', 431200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431222000000, '沅陵县', 431200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431223000000, '辰溪县', 431200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431224000000, '溆浦县', 431200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431225000000, '会同县', 431200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431226000000, '麻阳苗族自治县', 431200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431227000000, '新晃侗族自治县', 431200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431228000000, '芷江侗族自治县', 431200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431229000000, '靖州苗族侗族自治县', 431200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431230000000, '通道侗族自治县', 431200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431271000000, '怀化市洪江管理区', 431200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431281000000, '洪江市', 431200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431300000000, '娄底市', 430000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431301000000, '市辖区', 431300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431302000000, '娄星区', 431300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431321000000, '双峰县', 431300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431322000000, '新化县', 431300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431381000000, '冷水江市', 431300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (431382000000, '涟源市', 431300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (433100000000, '湘西土家族苗族自治州', 430000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (433101000000, '吉首市', 433100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (433122000000, '泸溪县', 433100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (433123000000, '凤凰县', 433100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (433124000000, '花垣县', 433100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (433125000000, '保靖县', 433100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (433126000000, '古丈县', 433100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (433127000000, '永顺县', 433100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (433130000000, '龙山县', 433100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (433172000000, '湖南吉首经济开发区', 433100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (433173000000, '湖南永顺经济开发区', 433100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440000000000, '广东省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440100000000, '广州市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440101000000, '市辖区', 440100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440103000000, '荔湾区', 440100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440104000000, '越秀区', 440100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440105000000, '海珠区', 440100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440106000000, '天河区', 440100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440111000000, '白云区', 440100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440112000000, '黄埔区', 440100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440113000000, '番禺区', 440100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440114000000, '花都区', 440100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440115000000, '南沙区', 440100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440117000000, '从化区', 440100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440118000000, '增城区', 440100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440200000000, '韶关市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440201000000, '市辖区', 440200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440203000000, '武江区', 440200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440204000000, '浈江区', 440200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440205000000, '曲江区', 440200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440222000000, '始兴县', 440200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440224000000, '仁化县', 440200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440229000000, '翁源县', 440200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440232000000, '乳源瑶族自治县', 440200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440233000000, '新丰县', 440200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440281000000, '乐昌市', 440200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440282000000, '南雄市', 440200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440300000000, '深圳市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440301000000, '市辖区', 440300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440303000000, '罗湖区', 440300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440304000000, '福田区', 440300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440305000000, '南山区', 440300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440306000000, '宝安区', 440300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440307000000, '龙岗区', 440300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440308000000, '盐田区', 440300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440309000000, '龙华区', 440300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440310000000, '坪山区', 440300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440311000000, '光明区', 440300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440400000000, '珠海市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440401000000, '市辖区', 440400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440402000000, '香洲区', 440400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440403000000, '斗门区', 440400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440404000000, '金湾区', 440400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440500000000, '汕头市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440501000000, '市辖区', 440500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440507000000, '龙湖区', 440500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440511000000, '金平区', 440500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440512000000, '濠江区', 440500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440513000000, '潮阳区', 440500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440514000000, '潮南区', 440500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440515000000, '澄海区', 440500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440523000000, '南澳县', 440500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440600000000, '佛山市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440601000000, '市辖区', 440600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440604000000, '禅城区', 440600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440605000000, '南海区', 440600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440606000000, '顺德区', 440600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440607000000, '三水区', 440600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440608000000, '高明区', 440600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440700000000, '江门市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440701000000, '市辖区', 440700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440703000000, '蓬江区', 440700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440704000000, '江海区', 440700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440705000000, '新会区', 440700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440781000000, '台山市', 440700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440783000000, '开平市', 440700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440784000000, '鹤山市', 440700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440785000000, '恩平市', 440700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440800000000, '湛江市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440801000000, '市辖区', 440800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440802000000, '赤坎区', 440800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440803000000, '霞山区', 440800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440804000000, '坡头区', 440800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440811000000, '麻章区', 440800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440823000000, '遂溪县', 440800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440825000000, '徐闻县', 440800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440881000000, '廉江市', 440800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440882000000, '雷州市', 440800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440883000000, '吴川市', 440800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440900000000, '茂名市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440901000000, '市辖区', 440900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440902000000, '茂南区', 440900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440904000000, '电白区', 440900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440981000000, '高州市', 440900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440982000000, '化州市', 440900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (440983000000, '信宜市', 440900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441200000000, '肇庆市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441201000000, '市辖区', 441200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441202000000, '端州区', 441200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441203000000, '鼎湖区', 441200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441204000000, '高要区', 441200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441223000000, '广宁县', 441200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441224000000, '怀集县', 441200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441225000000, '封开县', 441200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441226000000, '德庆县', 441200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441284000000, '四会市', 441200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441300000000, '惠州市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441301000000, '市辖区', 441300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441302000000, '惠城区', 441300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441303000000, '惠阳区', 441300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441322000000, '博罗县', 441300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441323000000, '惠东县', 441300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441324000000, '龙门县', 441300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441400000000, '梅州市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441401000000, '市辖区', 441400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441402000000, '梅江区', 441400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441403000000, '梅县区', 441400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441422000000, '大埔县', 441400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441423000000, '丰顺县', 441400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441424000000, '五华县', 441400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441426000000, '平远县', 441400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441427000000, '蕉岭县', 441400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441481000000, '兴宁市', 441400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441500000000, '汕尾市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441501000000, '市辖区', 441500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441502000000, '城区', 441500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441521000000, '海丰县', 441500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441523000000, '陆河县', 441500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441581000000, '陆丰市', 441500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441600000000, '河源市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441601000000, '市辖区', 441600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441602000000, '源城区', 441600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441621000000, '紫金县', 441600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441622000000, '龙川县', 441600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441623000000, '连平县', 441600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441624000000, '和平县', 441600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441625000000, '东源县', 441600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441700000000, '阳江市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441701000000, '市辖区', 441700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441702000000, '江城区', 441700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441704000000, '阳东区', 441700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441721000000, '阳西县', 441700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441781000000, '阳春市', 441700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441800000000, '清远市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441801000000, '市辖区', 441800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441802000000, '清城区', 441800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441803000000, '清新区', 441800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441821000000, '佛冈县', 441800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441823000000, '阳山县', 441800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441825000000, '连山壮族瑶族自治县', 441800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441826000000, '连南瑶族自治县', 441800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441881000000, '英德市', 441800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441882000000, '连州市', 441800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900000000, '东莞市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900003000, '东城街道办事处', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900004000, '南城街道办事处', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900005000, '万江街道办事处', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900006000, '莞城街道办事处', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900101000, '石碣镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900102000, '石龙镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900103000, '茶山镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900104000, '石排镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900105000, '企石镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900106000, '横沥镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900107000, '桥头镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900108000, '谢岗镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900109000, '东坑镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900110000, '常平镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900111000, '寮步镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900112000, '樟木头镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900113000, '大朗镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900114000, '黄江镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900115000, '清溪镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900116000, '塘厦镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900117000, '凤岗镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900118000, '大岭山镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900119000, '长安镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900121000, '虎门镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900122000, '厚街镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900123000, '沙田镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900124000, '道滘镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900125000, '洪梅镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900126000, '麻涌镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900127000, '望牛墩镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900128000, '中堂镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900129000, '高埗镇', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900401000, '松山湖管委会', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900402000, '东莞港', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (441900403000, '东莞生态园', 441900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000000000, '中山市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000001000, '石岐区街道办事处', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000002000, '东区街道办事处', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000003000, '火炬开发区街道办事处', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000004000, '西区街道办事处', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000005000, '南区街道办事处', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000006000, '五桂山街道办事处', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000100000, '小榄镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000101000, '黄圃镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000102000, '民众镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000103000, '东凤镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000104000, '东升镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000105000, '古镇镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000106000, '沙溪镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000107000, '坦洲镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000108000, '港口镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000109000, '三角镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000110000, '横栏镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000111000, '南头镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000112000, '阜沙镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000113000, '南朗镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000114000, '三乡镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000115000, '板芙镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000116000, '大涌镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (442000117000, '神湾镇', 442000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445100000000, '潮州市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445101000000, '市辖区', 445100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445102000000, '湘桥区', 445100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445103000000, '潮安区', 445100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445122000000, '饶平县', 445100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445200000000, '揭阳市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445201000000, '市辖区', 445200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445202000000, '榕城区', 445200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445203000000, '揭东区', 445200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445222000000, '揭西县', 445200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445224000000, '惠来县', 445200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445281000000, '普宁市', 445200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445300000000, '云浮市', 440000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445301000000, '市辖区', 445300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445302000000, '云城区', 445300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445303000000, '云安区', 445300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445321000000, '新兴县', 445300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445322000000, '郁南县', 445300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (445381000000, '罗定市', 445300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450000000000, '广西壮族自治区', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450100000000, '南宁市', 450000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450101000000, '市辖区', 450100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450102000000, '兴宁区', 450100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450103000000, '青秀区', 450100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450105000000, '江南区', 450100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450107000000, '西乡塘区', 450000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450108000000, '良庆区', 450100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450109000000, '邕宁区', 450100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450110000000, '武鸣区', 450100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450123000000, '隆安县', 450100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450124000000, '马山县', 450100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450125000000, '上林县', 450100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450126000000, '宾阳县', 450100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450127000000, '横县', 450100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450200000000, '柳州市', 450000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450201000000, '市辖区', 450200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450202000000, '城中区', 450200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450203000000, '鱼峰区', 450200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450204000000, '柳南区', 450200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450205000000, '柳北区', 450200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450206000000, '柳江区', 450200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450222000000, '柳城县', 450200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450223000000, '鹿寨县', 450200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450224000000, '融安县', 450200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450225000000, '融水苗族自治县', 450200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450226000000, '三江侗族自治县', 450200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450300000000, '桂林市', 450000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450301000000, '市辖区', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450302000000, '秀峰区', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450303000000, '叠彩区', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450304000000, '象山区', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450305000000, '七星区', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450311000000, '雁山区', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450312000000, '临桂区', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450321000000, '阳朔县', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450323000000, '灵川县', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450324000000, '全州县', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450325000000, '兴安县', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450326000000, '永福县', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450327000000, '灌阳县', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450328000000, '龙胜各族自治县', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450329000000, '资源县', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450330000000, '平乐县', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450332000000, '恭城瑶族自治县', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450381000000, '荔浦市', 450300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450400000000, '梧州市', 450000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450401000000, '市辖区', 450400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450403000000, '万秀区', 450400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450405000000, '长洲区', 450400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450406000000, '龙圩区', 450400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450421000000, '苍梧县', 450400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450422000000, '藤县', 450400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450423000000, '蒙山县', 450400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450481000000, '岑溪市', 450400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450500000000, '北海市', 450000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450501000000, '市辖区', 450500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450502000000, '海城区', 450500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450503000000, '银海区', 450500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450512000000, '铁山港区', 450500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450521000000, '合浦县', 450500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450600000000, '防城港市', 450000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450601000000, '市辖区', 450600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450602000000, '港口区', 450600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450603000000, '防城区', 450600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450621000000, '上思县', 450600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450681000000, '东兴市', 450600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450700000000, '钦州市', 450000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450701000000, '市辖区', 450700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450702000000, '钦南区', 450700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450703000000, '钦北区', 450700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450721000000, '灵山县', 450700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450722000000, '浦北县', 450700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450800000000, '贵港市', 450000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450801000000, '市辖区', 450800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450802000000, '港北区', 450800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450803000000, '港南区', 450800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450804000000, '覃塘区', 450800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450821000000, '平南县', 450800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450881000000, '桂平市', 450800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450900000000, '玉林市', 450000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450901000000, '市辖区', 450900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450902000000, '玉州区', 450900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450903000000, '福绵区', 450900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450921000000, '容县', 450900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450922000000, '陆川县', 450900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450923000000, '博白县', 450900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450924000000, '兴业县', 450900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (450981000000, '北流市', 450900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451000000000, '百色市', 450000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451001000000, '市辖区', 451000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451002000000, '右江区', 451000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451021000000, '田阳县', 451000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451022000000, '田东县', 451000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451023000000, '平果县', 451000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451024000000, '德保县', 451000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451026000000, '那坡县', 451000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451027000000, '凌云县', 451000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451028000000, '乐业县', 451000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451029000000, '田林县', 451000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451030000000, '西林县', 451000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451031000000, '隆林各族自治县', 451000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451081000000, '靖西市', 451000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451100000000, '贺州市', 450000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451101000000, '市辖区', 451100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451102000000, '八步区', 451100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451103000000, '平桂区', 451100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451121000000, '昭平县', 451100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451122000000, '钟山县', 451100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451123000000, '富川瑶族自治县', 451100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451200000000, '河池市', 450000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451201000000, '市辖区', 451200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451202000000, '金城江区', 451200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451203000000, '宜州区', 451200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451221000000, '南丹县', 451200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451222000000, '天峨县', 451200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451223000000, '凤山县', 451200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451224000000, '东兰县', 451200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451225000000, '罗城仫佬族自治县', 451200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451226000000, '环江毛南族自治县', 451200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451227000000, '巴马瑶族自治县', 451200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451228000000, '都安瑶族自治县', 451200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451229000000, '大化瑶族自治县', 451200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451300000000, '来宾市', 450000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451301000000, '市辖区', 451300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451302000000, '兴宾区', 451300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451321000000, '忻城县', 451300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451322000000, '象州县', 451300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451323000000, '武宣县', 451300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451324000000, '金秀瑶族自治县', 451300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451381000000, '合山市', 451300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451400000000, '崇左市', 450000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451401000000, '市辖区', 451400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451402000000, '江州区', 451400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451421000000, '扶绥县', 451400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451422000000, '宁明县', 451400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451423000000, '龙州县', 451400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451424000000, '大新县', 451400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451425000000, '天等县', 451400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (451481000000, '凭祥市', 451400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460000000000, '海南省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460100000000, '海口市', 460000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460101000000, '市辖区', 460100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460105000000, '秀英区', 460100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460106000000, '龙华区', 460100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460107000000, '琼山区', 460100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460108000000, '美兰区', 460100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460200000000, '三亚市', 460000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460201000000, '市辖区', 460200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460202000000, '海棠区', 460200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460203000000, '吉阳区', 460200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460204000000, '天涯区', 460200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460205000000, '崖州区', 460200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460300000000, '三沙市', 460000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460321000000, '西沙群岛', 460300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460322000000, '南沙群岛', 460300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460323000000, '中沙群岛的岛礁及其海域', 460300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (460400000000, '儋州市', 460000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469000000000, '省直辖县级行政区划', 460000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469001000000, '五指山市', 469000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469002000000, '琼海市', 469000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469005000000, '文昌市', 469000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469006000000, '万宁市', 469000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469007000000, '东方市', 469000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469021000000, '定安县', 469000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469022000000, '屯昌县', 469000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469023000000, '澄迈县', 469000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469024000000, '临高县', 469000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469025000000, '白沙黎族自治县', 469000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469026000000, '昌江黎族自治县', 469000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469027000000, '乐东黎族自治县', 469000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469028000000, '陵水黎族自治县', 469000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469029000000, '保亭黎族苗族自治县', 469000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (469030000000, '琼中黎族苗族自治县', 469000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500000000000, '重庆市', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500100000000, '市辖区', 500000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500101000000, '万州区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500102000000, '涪陵区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500103000000, '渝中区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500104000000, '大渡口区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500105000000, '江北区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500106000000, '沙坪坝区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500107000000, '九龙坡区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500108000000, '南岸区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500109000000, '北碚区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500110000000, '綦江区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500111000000, '大足区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500112000000, '渝北区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500113000000, '巴南区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500114000000, '黔江区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500115000000, '长寿区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500116000000, '江津区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500117000000, '合川区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500118000000, '永川区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500119000000, '南川区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500120000000, '璧山区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500151000000, '铜梁区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500152000000, '潼南区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500153000000, '荣昌区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500154000000, '开州区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500155000000, '梁平区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500156000000, '武隆区', 500100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500200000000, '县', 500000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500229000000, '城口县', 500200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500230000000, '丰都县', 500200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500231000000, '垫江县', 500200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500233000000, '忠县', 500200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500235000000, '云阳县', 500200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500236000000, '奉节县', 500200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500237000000, '巫山县', 500200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500238000000, '巫溪县', 500200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500240000000, '石柱土家族自治县', 500200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500241000000, '秀山土家族苗族自治县', 500200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500242000000, '酉阳土家族苗族自治县', 500200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (500243000000, '彭水苗族土家族自治县', 500200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510000000000, '四川省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510100000000, '成都市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510101000000, '市辖区', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510104000000, '锦江区', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510105000000, '青羊区', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510106000000, '金牛区', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510107000000, '武侯区', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510108000000, '成华区', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510112000000, '龙泉驿区', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510113000000, '青白江区', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510114000000, '新都区', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510115000000, '温江区', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510116000000, '双流区', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510117000000, '郫都区', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510121000000, '金堂县', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510129000000, '大邑县', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510131000000, '蒲江县', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510132000000, '新津县', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510181000000, '都江堰市', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510182000000, '彭州市', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510183000000, '邛崃市', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510184000000, '崇州市', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510185000000, '简阳市', 510100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510300000000, '自贡市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510301000000, '市辖区', 510300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510302000000, '自流井区', 510300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510303000000, '贡井区', 510300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510304000000, '大安区', 510300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510311000000, '沿滩区', 510300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510321000000, '荣县', 510300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510322000000, '富顺县', 510300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510400000000, '攀枝花市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510401000000, '市辖区', 510400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510402000000, '东区', 510400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510403000000, '西区', 510400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510411000000, '仁和区', 510400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510421000000, '米易县', 510400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510422000000, '盐边县', 510400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510500000000, '泸州市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510501000000, '市辖区', 510500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510502000000, '江阳区', 510500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510503000000, '纳溪区', 510500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510504000000, '龙马潭区', 510500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510521000000, '泸县', 510500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510522000000, '合江县', 510500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510524000000, '叙永县', 510500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510525000000, '古蔺县', 510500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510600000000, '德阳市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510601000000, '市辖区', 510600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510603000000, '旌阳区', 510600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510604000000, '罗江区', 510600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510623000000, '中江县', 510600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510681000000, '广汉市', 510600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510682000000, '什邡市', 510600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510683000000, '绵竹市', 510600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510700000000, '绵阳市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510701000000, '市辖区', 510700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510703000000, '涪城区', 510700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510704000000, '游仙区', 510700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510705000000, '安州区', 510700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510722000000, '三台县', 510700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510723000000, '盐亭县', 510700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510725000000, '梓潼县', 510700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510726000000, '北川羌族自治县', 510700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510727000000, '平武县', 510700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510781000000, '江油市', 510700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510800000000, '广元市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510801000000, '市辖区', 510800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510802000000, '利州区', 510800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510811000000, '昭化区', 510800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510812000000, '朝天区', 510800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510821000000, '旺苍县', 510800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510822000000, '青川县', 510800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510823000000, '剑阁县', 510800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510824000000, '苍溪县', 510800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510900000000, '遂宁市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510901000000, '市辖区', 510900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510903000000, '船山区', 510900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510904000000, '安居区', 510900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510921000000, '蓬溪县', 510900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510922000000, '射洪县', 510900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (510923000000, '大英县', 510900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511000000000, '内江市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511001000000, '市辖区', 511000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511002000000, '市中区', 511000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511011000000, '东兴区', 511000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511024000000, '威远县', 511000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511025000000, '资中县', 511000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511071000000, '内江经济开发区', 511000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511083000000, '隆昌市', 511000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511100000000, '乐山市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511101000000, '市辖区', 511100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511102000000, '市中区', 511100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511111000000, '沙湾区', 511100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511112000000, '五通桥区', 511100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511113000000, '金口河区', 511100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511123000000, '犍为县', 511100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511124000000, '井研县', 511100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511126000000, '夹江县', 511100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511129000000, '沐川县', 511100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511132000000, '峨边彝族自治县', 511100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511133000000, '马边彝族自治县', 511100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511181000000, '峨眉山市', 511100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511300000000, '南充市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511301000000, '市辖区', 511300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511302000000, '顺庆区', 511300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511303000000, '高坪区', 511300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511304000000, '嘉陵区', 511300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511321000000, '南部县', 511300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511322000000, '营山县', 511300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511323000000, '蓬安县', 511300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511324000000, '仪陇县', 511300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511325000000, '西充县', 511300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511381000000, '阆中市', 511300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511400000000, '眉山市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511401000000, '市辖区', 511400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511402000000, '东坡区', 511400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511403000000, '彭山区', 511400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511421000000, '仁寿县', 511400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511423000000, '洪雅县', 511400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511424000000, '丹棱县', 511400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511425000000, '青神县', 511400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511500000000, '宜宾市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511501000000, '市辖区', 511500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511502000000, '翠屏区', 511500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511503000000, '南溪区', 511500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511504000000, '叙州区', 511500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511523000000, '江安县', 511500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511524000000, '长宁县', 511500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511525000000, '高县', 511500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511526000000, '珙县', 511500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511527000000, '筠连县', 511500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511528000000, '兴文县', 511500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511529000000, '屏山县', 511500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511600000000, '广安市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511601000000, '市辖区', 511600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511602000000, '广安区', 511600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511603000000, '前锋区', 511600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511621000000, '岳池县', 511600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511622000000, '武胜县', 511600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511623000000, '邻水县', 511600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511681000000, '华蓥市', 511600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511700000000, '达州市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511701000000, '市辖区', 511700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511702000000, '通川区', 511700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511703000000, '达川区', 511700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511722000000, '宣汉县', 511700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511723000000, '开江县', 511700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511724000000, '大竹县', 511700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511725000000, '渠县', 511700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511771000000, '达州经济开发区', 511700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511781000000, '万源市', 511700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511800000000, '雅安市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511801000000, '市辖区', 511800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511802000000, '雨城区', 511800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511803000000, '名山区', 511800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511822000000, '荥经县', 511800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511823000000, '汉源县', 511800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511824000000, '石棉县', 511800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511825000000, '天全县', 511800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511826000000, '芦山县', 511800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511827000000, '宝兴县', 511800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511900000000, '巴中市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511901000000, '市辖区', 511900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511902000000, '巴州区', 511900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511903000000, '恩阳区', 511900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511921000000, '通江县', 511900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511922000000, '南江县', 511900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511923000000, '平昌县', 511900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (511971000000, '巴中经济开发区', 511900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (512000000000, '资阳市', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (512001000000, '市辖区', 512000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (512002000000, '雁江区', 512000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (512021000000, '安岳县', 512000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (512022000000, '乐至县', 512000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513200000000, '阿坝藏族羌族自治州', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513201000000, '马尔康市', 513200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513221000000, '汶川县', 513200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513222000000, '理县', 513200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513223000000, '茂县', 513200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513224000000, '松潘县', 513200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513225000000, '九寨沟县', 513200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513226000000, '金川县', 513200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513227000000, '小金县', 513200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513228000000, '黑水县', 513200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513230000000, '壤塘县', 513200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513231000000, '阿坝县', 513200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513232000000, '若尔盖县', 513200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513233000000, '红原县', 513200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513300000000, '甘孜藏族自治州', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513301000000, '康定市', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513322000000, '泸定县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513323000000, '丹巴县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513324000000, '九龙县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513325000000, '雅江县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513326000000, '道孚县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513327000000, '炉霍县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513328000000, '甘孜县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513329000000, '新龙县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513330000000, '德格县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513331000000, '白玉县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513332000000, '石渠县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513333000000, '色达县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513334000000, '理塘县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513335000000, '巴塘县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513336000000, '乡城县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513337000000, '稻城县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513338000000, '得荣县', 513300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513400000000, '凉山彝族自治州', 510000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513401000000, '西昌市', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513422000000, '木里藏族自治县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513423000000, '盐源县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513424000000, '德昌县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513425000000, '会理县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513426000000, '会东县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513427000000, '宁南县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513428000000, '普格县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513429000000, '布拖县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513430000000, '金阳县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513431000000, '昭觉县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513432000000, '喜德县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513433000000, '冕宁县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513434000000, '越西县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513435000000, '甘洛县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513436000000, '美姑县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (513437000000, '雷波县', 513400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520000000000, '贵州省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520100000000, '贵阳市', 520000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520101000000, '市辖区', 520100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520102000000, '南明区', 520100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520103000000, '云岩区', 520100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520111000000, '花溪区', 520100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520112000000, '乌当区', 520100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520113000000, '白云区', 520100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520115000000, '观山湖区', 520100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520121000000, '开阳县', 520100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520122000000, '息烽县', 520100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520123000000, '修文县', 520100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520181000000, '清镇市', 520100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520200000000, '六盘水市', 520000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520201000000, '钟山区', 520200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520203000000, '六枝特区', 520200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520221000000, '水城县', 520200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520281000000, '盘州市', 520200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520300000000, '遵义市', 520000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520301000000, '市辖区', 520300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520302000000, '红花岗区', 520300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520303000000, '汇川区', 520300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520304000000, '播州区', 520300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520322000000, '桐梓县', 520300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520323000000, '绥阳县', 520300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520324000000, '正安县', 520300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520325000000, '道真仡佬族苗族自治县', 520300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520326000000, '务川仡佬族苗族自治县', 520300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520327000000, '凤冈县', 520300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520328000000, '湄潭县', 520300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520329000000, '余庆县', 520300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520330000000, '习水县', 520300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520381000000, '赤水市', 520300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520382000000, '仁怀市', 520300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520400000000, '安顺市', 520000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520401000000, '市辖区', 520400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520402000000, '西秀区', 520400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520403000000, '平坝区', 520400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520422000000, '普定县', 520400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520423000000, '镇宁布依族苗族自治县', 520400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520424000000, '关岭布依族苗族自治县', 520400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520425000000, '紫云苗族布依族自治县', 520400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520500000000, '毕节市', 520000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520501000000, '市辖区', 520500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520502000000, '七星关区', 520500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520521000000, '大方县', 520500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520522000000, '黔西县', 520500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520523000000, '金沙县', 520500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520524000000, '织金县', 520500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520525000000, '纳雍县', 520500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520526000000, '威宁彝族回族苗族自治县', 520500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520527000000, '赫章县', 520500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520600000000, '铜仁市', 520000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520601000000, '市辖区', 520600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520602000000, '碧江区', 520600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520603000000, '万山区', 520600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520621000000, '江口县', 520600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520622000000, '玉屏侗族自治县', 520600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520623000000, '石阡县', 520600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520624000000, '思南县', 520600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520625000000, '印江土家族苗族自治县', 520600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520626000000, '德江县', 520600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520627000000, '沿河土家族自治县', 520600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (520628000000, '松桃苗族自治县', 520600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522300000000, '黔西南布依族苗族自治州', 520000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522301000000, '兴义市', 522300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522302000000, '兴仁市', 522300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522323000000, '普安县', 522300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522324000000, '晴隆县', 522300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522325000000, '贞丰县', 522300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522326000000, '望谟县', 522300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522327000000, '册亨县', 522300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522328000000, '安龙县', 522300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522600000000, '黔东南苗族侗族自治州', 520000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522601000000, '凯里市', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522622000000, '黄平县', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522623000000, '施秉县', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522624000000, '三穗县', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522625000000, '镇远县', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522626000000, '岑巩县', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522627000000, '天柱县', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522628000000, '锦屏县', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522629000000, '剑河县', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522630000000, '台江县', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522631000000, '黎平县', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522632000000, '榕江县', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522633000000, '从江县', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522634000000, '雷山县', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522635000000, '麻江县', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522636000000, '丹寨县', 522600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522700000000, '黔南布依族苗族自治州', 520000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522701000000, '都匀市', 522700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522702000000, '福泉市', 522700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522722000000, '荔波县', 522700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522723000000, '贵定县', 522700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522725000000, '瓮安县', 522700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522726000000, '独山县', 522700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522727000000, '平塘县', 522700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522728000000, '罗甸县', 522700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522729000000, '长顺县', 522700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522730000000, '龙里县', 522700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522731000000, '惠水县', 522700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (522732000000, '三都水族自治县', 522700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530000000000, '云南省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530100000000, '昆明市', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530101000000, '市辖区', 530100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530102000000, '五华区', 530100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530103000000, '盘龙区', 530100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530111000000, '官渡区', 530100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530112000000, '西山区', 530100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530113000000, '东川区', 530100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530114000000, '呈贡区', 530100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530115000000, '晋宁区', 530100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530124000000, '富民县', 530100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530125000000, '宜良县', 530100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530126000000, '石林彝族自治县', 530100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530127000000, '嵩明县', 530100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530128000000, '禄劝彝族苗族自治县', 530100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530129000000, '寻甸回族彝族自治县', 530100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530181000000, '安宁市', 530100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530300000000, '曲靖市', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530301000000, '市辖区', 530300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530302000000, '麒麟区', 530300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530303000000, '沾益区', 530300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530304000000, '马龙区', 530300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530322000000, '陆良县', 530300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530323000000, '师宗县', 530300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530324000000, '罗平县', 530300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530325000000, '富源县', 530300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530326000000, '会泽县', 530300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530381000000, '宣威市', 530300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530400000000, '玉溪市', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530401000000, '市辖区', 530400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530402000000, '红塔区', 530400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530403000000, '江川区', 530400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530422000000, '澄江县', 530400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530423000000, '通海县', 530400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530424000000, '华宁县', 530400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530425000000, '易门县', 530400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530426000000, '峨山彝族自治县', 530400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530427000000, '新平彝族傣族自治县', 530400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530428000000, '元江哈尼族彝族傣族自治县', 530400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530500000000, '保山市', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530501000000, '市辖区', 530500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530502000000, '隆阳区', 530500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530521000000, '施甸县', 530500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530523000000, '龙陵县', 530500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530524000000, '昌宁县', 530500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530581000000, '腾冲市', 530500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530600000000, '昭通市', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530601000000, '市辖区', 530600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530602000000, '昭阳区', 530600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530621000000, '鲁甸县', 530600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530622000000, '巧家县', 530600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530623000000, '盐津县', 530600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530624000000, '大关县', 530600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530625000000, '永善县', 530600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530626000000, '绥江县', 530600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530627000000, '镇雄县', 530600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530628000000, '彝良县', 530600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530629000000, '威信县', 530600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530681000000, '水富市', 530600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530700000000, '丽江市', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530701000000, '市辖区', 530700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530702000000, '古城区', 530700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530721000000, '玉龙纳西族自治县', 530700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530722000000, '永胜县', 530700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530723000000, '华坪县', 530700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530724000000, '宁蒗彝族自治县', 530700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530800000000, '普洱市', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530801000000, '市辖区', 530800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530802000000, '思茅区', 530800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530821000000, '宁洱哈尼族彝族自治县', 530800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530822000000, '墨江哈尼族自治县', 530800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530823000000, '景东彝族自治县', 530800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530824000000, '景谷傣族彝族自治县', 530800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530825000000, '镇沅彝族哈尼族拉祜族自治县', 530800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530826000000, '江城哈尼族彝族自治县', 530800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530827000000, '孟连傣族拉祜族佤族自治县', 530800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530828000000, '澜沧拉祜族自治县', 530800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530829000000, '西盟佤族自治县', 530800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530900000000, '临沧市', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530901000000, '市辖区', 530900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530902000000, '临翔区', 530900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530921000000, '凤庆县', 530900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530922000000, '云县', 530900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530923000000, '永德县', 530900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530924000000, '镇康县', 530900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530925000000, '双江拉祜族佤族布朗族傣族自治县', 530900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530926000000, '耿马傣族佤族自治县', 530900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (530927000000, '沧源佤族自治县', 530900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532300000000, '楚雄彝族自治州', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532301000000, '楚雄市', 532300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532322000000, '双柏县', 532300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532323000000, '牟定县', 532300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532324000000, '南华县', 532300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532325000000, '姚安县', 532300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532326000000, '大姚县', 532300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532327000000, '永仁县', 532300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532328000000, '元谋县', 532300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532329000000, '武定县', 532300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532331000000, '禄丰县', 532300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532500000000, '红河哈尼族彝族自治州', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532501000000, '个旧市', 532500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532502000000, '开远市', 532500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532503000000, '蒙自市', 532500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532504000000, '弥勒市', 532500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532523000000, '屏边苗族自治县', 532500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532524000000, '建水县', 532500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532525000000, '石屏县', 532500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532527000000, '泸西县', 532500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532528000000, '元阳县', 532500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532529000000, '红河县', 532500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532530000000, '金平苗族瑶族傣族自治县', 532500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532531000000, '绿春县', 532500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532532000000, '河口瑶族自治县', 532500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532600000000, '文山壮族苗族自治州', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532601000000, '文山市', 532600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532622000000, '砚山县', 532600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532623000000, '西畴县', 532600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532624000000, '麻栗坡县', 532600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532625000000, '马关县', 532600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532626000000, '丘北县', 532600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532627000000, '广南县', 532600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532628000000, '富宁县', 532600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532800000000, '西双版纳傣族自治州', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532801000000, '景洪市', 532800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532822000000, '勐海县', 532800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532823000000, '勐腊县', 532800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532900000000, '大理白族自治州', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532901000000, '大理市', 532900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532922000000, '漾濞彝族自治县', 532900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532923000000, '祥云县', 532900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532924000000, '宾川县', 532900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532925000000, '弥渡县', 532900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532926000000, '南涧彝族自治县', 532900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532927000000, '巍山彝族回族自治县', 532900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532928000000, '永平县', 532900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532929000000, '云龙县', 532900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532930000000, '洱源县', 532900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532931000000, '剑川县', 532900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (532932000000, '鹤庆县', 532900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (533100000000, '德宏傣族景颇族自治州', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (533102000000, '瑞丽市', 533100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (533103000000, '芒市', 533100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (533122000000, '梁河县', 533100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (533123000000, '盈江县', 533100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (533124000000, '陇川县', 533100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (533300000000, '怒江傈僳族自治州', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (533301000000, '泸水市', 533300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (533323000000, '福贡县', 533300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (533324000000, '贡山独龙族怒族自治县', 533300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (533325000000, '兰坪白族普米族自治县', 533300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (533400000000, '迪庆藏族自治州', 530000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (533401000000, '香格里拉市', 533400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (533422000000, '德钦县', 533400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (533423000000, '维西傈僳族自治县', 533400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540000000000, '西藏自治区', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540100000000, '拉萨市', 540000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540101000000, '市辖区', 540100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540102000000, '城关区', 540100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540103000000, '堆龙德庆区', 540100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540104000000, '达孜区', 540100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540121000000, '林周县', 540100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540122000000, '当雄县', 540100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540123000000, '尼木县', 540100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540124000000, '曲水县', 540100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540127000000, '墨竹工卡县', 540100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540171000000, '格尔木藏青工业园区', 540100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540172000000, '拉萨经济技术开发区', 540100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540173000000, '西藏文化旅游创意园区', 540100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540174000000, '达孜工业园区', 540100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540200000000, '日喀则市', 540000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540202000000, '桑珠孜区', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540221000000, '南木林县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540222000000, '江孜县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540223000000, '定日县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540224000000, '萨迦县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540225000000, '拉孜县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540226000000, '昂仁县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540227000000, '谢通门县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540228000000, '白朗县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540229000000, '仁布县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540230000000, '康马县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540231000000, '定结县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540232000000, '仲巴县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540233000000, '亚东县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540234000000, '吉隆县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540235000000, '聂拉木县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540236000000, '萨嘎县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540237000000, '岗巴县', 540200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540300000000, '昌都市', 540000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540302000000, '卡若区', 540300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540321000000, '江达县', 540300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540322000000, '贡觉县', 540300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540323000000, '类乌齐县', 540300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540324000000, '丁青县', 540300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540325000000, '察雅县', 540300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540326000000, '八宿县', 540300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540327000000, '左贡县', 540300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540328000000, '芒康县', 540300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540329000000, '洛隆县', 540300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540330000000, '边坝县', 540300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540400000000, '林芝市', 540000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540402000000, '巴宜区', 540400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540421000000, '工布江达县', 540400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540422000000, '米林县', 540400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540423000000, '墨脱县', 540400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540424000000, '波密县', 540400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540425000000, '察隅县', 540400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540426000000, '朗县', 540400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540500000000, '山南市', 540000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540501000000, '市辖区', 540500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540502000000, '乃东区', 540500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540521000000, '扎囊县', 540500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540522000000, '贡嘎县', 540500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540523000000, '桑日县', 540500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540524000000, '琼结县', 540500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540525000000, '曲松县', 540500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540526000000, '措美县', 540500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540527000000, '洛扎县', 540500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540528000000, '加查县', 540500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540529000000, '隆子县', 540500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540530000000, '错那县', 540500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540531000000, '浪卡子县', 540500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540600000000, '那曲市', 540000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540602000000, '色尼区', 540600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540621000000, '嘉黎县', 540600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540622000000, '比如县', 540600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540623000000, '聂荣县', 540600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540624000000, '安多县', 540600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540625000000, '申扎县', 540600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540626000000, '索县', 540600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540627000000, '班戈县', 540600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540628000000, '巴青县', 540600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540629000000, '尼玛县', 540600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (540630000000, '双湖县', 540600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (542500000000, '阿里地区', 540000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (542521000000, '普兰县', 542500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (542522000000, '札达县', 542500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (542523000000, '噶尔县', 542500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (542524000000, '日土县', 542500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (542525000000, '革吉县', 542500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (542526000000, '改则县', 542500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (542527000000, '措勤县', 542500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610000000000, '陕西省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610100000000, '西安市', 610000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610101000000, '市辖区', 610100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610102000000, '新城区', 610100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610103000000, '碑林区', 610100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610104000000, '莲湖区', 610100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610111000000, '灞桥区', 610100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610112000000, '未央区', 610100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610113000000, '雁塔区', 610100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610114000000, '阎良区', 610100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610115000000, '临潼区', 610100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610116000000, '长安区', 610100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610117000000, '高陵区', 610100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610118000000, '鄠邑区', 610100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610122000000, '蓝田县', 610100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610124000000, '周至县', 610100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610200000000, '铜川市', 610000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610201000000, '市辖区', 610200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610202000000, '王益区', 610200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610203000000, '印台区', 610200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610204000000, '耀州区', 610200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610222000000, '宜君县', 610200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610300000000, '宝鸡市', 610000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610301000000, '市辖区', 610300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610302000000, '渭滨区', 610300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610303000000, '金台区', 610300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610304000000, '陈仓区', 610300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610322000000, '凤翔县', 610300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610323000000, '岐山县', 610300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610324000000, '扶风县', 610300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610326000000, '眉县', 610300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610327000000, '陇县', 610300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610328000000, '千阳县', 610300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610329000000, '麟游县', 610300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610330000000, '凤县', 610300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610331000000, '太白县', 610300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610400000000, '咸阳市', 610000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610401000000, '市辖区', 610400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610402000000, '秦都区', 610400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610403000000, '杨陵区', 610400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610404000000, '渭城区', 610400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610422000000, '三原县', 610400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610423000000, '泾阳县', 610400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610424000000, '乾县', 610400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610425000000, '礼泉县', 610400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610426000000, '永寿县', 610400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610428000000, '长武县', 610400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610429000000, '旬邑县', 610400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610430000000, '淳化县', 610400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610431000000, '武功县', 610400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610481000000, '兴平市', 610400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610482000000, '彬州市', 610400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610500000000, '渭南市', 610000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610501000000, '市辖区', 610500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610502000000, '临渭区', 610500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610503000000, '华州区', 610500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610522000000, '潼关县', 610500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610523000000, '大荔县', 610500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610524000000, '合阳县', 610500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610525000000, '澄城县', 610500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610526000000, '蒲城县', 610500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610527000000, '白水县', 610500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610528000000, '富平县', 610500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610581000000, '韩城市', 610500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610582000000, '华阴市', 610500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610600000000, '延安市', 610000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610601000000, '市辖区', 610600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610602000000, '宝塔区', 610600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610603000000, '安塞区', 610600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610621000000, '延长县', 610600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610622000000, '延川县', 610600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610623000000, '子长县', 610600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610625000000, '志丹县', 610600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610626000000, '吴起县', 610600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610627000000, '甘泉县', 610600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610628000000, '富县', 610600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610629000000, '洛川县', 610600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610630000000, '宜川县', 610600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610631000000, '黄龙县', 610600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610632000000, '黄陵县', 610600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610700000000, '汉中市', 610000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610701000000, '市辖区', 610700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610702000000, '汉台区', 610700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610703000000, '南郑区', 610700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610722000000, '城固县', 610700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610723000000, '洋县', 610700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610724000000, '西乡县', 610700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610725000000, '勉县', 610700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610726000000, '宁强县', 610700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610727000000, '略阳县', 610700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610728000000, '镇巴县', 610700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610729000000, '留坝县', 610700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610730000000, '佛坪县', 610700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610800000000, '榆林市', 610000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610801000000, '市辖区', 610800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610802000000, '榆阳区', 610800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610803000000, '横山区', 610800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610822000000, '府谷县', 610800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610824000000, '靖边县', 610800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610825000000, '定边县', 610800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610826000000, '绥德县', 610800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610827000000, '米脂县', 610800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610828000000, '佳县', 610800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610829000000, '吴堡县', 610800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610830000000, '清涧县', 610800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610831000000, '子洲县', 610800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610881000000, '神木市', 610800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610900000000, '安康市', 610000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610901000000, '市辖区', 610900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610902000000, '汉滨区', 610900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610921000000, '汉阴县', 610900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610922000000, '石泉县', 610900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610923000000, '宁陕县', 610900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610924000000, '紫阳县', 610900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610925000000, '岚皋县', 610900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610926000000, '平利县', 610900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610927000000, '镇坪县', 610900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610928000000, '旬阳县', 610900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (610929000000, '白河县', 610900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (611000000000, '商洛市', 610000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (611001000000, '市辖区', 611000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (611002000000, '商州区', 611000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (611021000000, '洛南县', 611000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (611022000000, '丹凤县', 611000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (611023000000, '商南县', 611000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (611024000000, '山阳县', 611000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (611025000000, '镇安县', 611000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (611026000000, '柞水县', 611000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620000000000, '甘肃省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620100000000, '兰州市', 620000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620101000000, '市辖区', 620100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620102000000, '城关区', 620100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620103000000, '七里河区', 620100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620104000000, '西固区', 620100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620105000000, '安宁区', 620100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620111000000, '红古区', 620100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620121000000, '永登县', 620100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620122000000, '皋兰县', 620100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620123000000, '榆中县', 620100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620171000000, '兰州新区', 620100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620200000000, '嘉峪关市', 620000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620201000000, '市辖区', 620200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620300000000, '金昌市', 620000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620301000000, '市辖区', 620300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620302000000, '金川区', 620300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620321000000, '永昌县', 620300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620400000000, '白银市', 620000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620401000000, '市辖区', 620400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620402000000, '白银区', 620400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620403000000, '平川区', 620400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620421000000, '靖远县', 620400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620422000000, '会宁县', 620400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620423000000, '景泰县', 620400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620500000000, '天水市', 620000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620501000000, '市辖区', 620500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620502000000, '秦州区', 620500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620503000000, '麦积区', 620500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620521000000, '清水县', 620500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620522000000, '秦安县', 620500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620523000000, '甘谷县', 620500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620524000000, '武山县', 620500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620525000000, '张家川回族自治县', 620500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620600000000, '武威市', 620000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620601000000, '市辖区', 620600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620602000000, '凉州区', 620600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620621000000, '民勤县', 620600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620622000000, '古浪县', 620600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620623000000, '天祝藏族自治县', 620600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620700000000, '张掖市', 620000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620701000000, '市辖区', 620700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620702000000, '甘州区', 620700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620721000000, '肃南裕固族自治县', 620700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620722000000, '民乐县', 620700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620723000000, '临泽县', 620700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620724000000, '高台县', 620700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620725000000, '山丹县', 620700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620800000000, '平凉市', 620000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620801000000, '市辖区', 620800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620802000000, '崆峒区', 620800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620821000000, '泾川县', 620800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620822000000, '灵台县', 620800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620823000000, '崇信县', 620800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620825000000, '庄浪县', 620800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620826000000, '静宁县', 620800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620881000000, '华亭市', 620800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620900000000, '酒泉市', 620000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620901000000, '市辖区', 620900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620902000000, '肃州区', 620900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620921000000, '金塔县', 620900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620922000000, '瓜州县', 620900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620923000000, '肃北蒙古族自治县', 620900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620924000000, '阿克塞哈萨克族自治县', 620900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620981000000, '玉门市', 620900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (620982000000, '敦煌市', 620900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621000000000, '庆阳市', 620000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621001000000, '市辖区', 621000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621002000000, '西峰区', 621000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621021000000, '庆城县', 621000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621022000000, '环县', 621000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621023000000, '华池县', 621000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621024000000, '合水县', 621000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621025000000, '正宁县', 621000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621026000000, '宁县', 621000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621027000000, '镇原县', 621000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621100000000, '定西市', 620000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621101000000, '市辖区', 621100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621102000000, '安定区', 621100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621121000000, '通渭县', 621100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621122000000, '陇西县', 621100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621123000000, '渭源县', 621100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621124000000, '临洮县', 621100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621125000000, '漳县', 621100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621126000000, '岷县', 621100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621200000000, '陇南市', 620000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621201000000, '市辖区', 621200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621202000000, '武都区', 621200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621221000000, '成县', 621200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621222000000, '文县', 621200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621223000000, '宕昌县', 621200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621224000000, '康县', 621200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621225000000, '西和县', 621200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621226000000, '礼县', 621200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621227000000, '徽县', 621200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (621228000000, '两当县', 621200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (622900000000, '临夏回族自治州', 620000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (622901000000, '临夏市', 622900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (622921000000, '临夏县', 622900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (622922000000, '康乐县', 622900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (622923000000, '永靖县', 622900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (622924000000, '广河县', 622900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (622925000000, '和政县', 622900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (622926000000, '东乡族自治县', 622900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (622927000000, '积石山保安族东乡族撒拉族自治县', 622900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (623000000000, '甘南藏族自治州', 620000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (623001000000, '合作市', 623000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (623021000000, '临潭县', 623000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (623022000000, '卓尼县', 623000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (623023000000, '舟曲县', 623000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (623024000000, '迭部县', 623000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (623025000000, '玛曲县', 623000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (623026000000, '碌曲县', 623000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (623027000000, '夏河县', 623000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630000000000, '青海省', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630100000000, '西宁市', 630000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630101000000, '市辖区', 630100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630102000000, '城东区', 630100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630103000000, '城中区', 630100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630104000000, '城西区', 630100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630105000000, '城北区', 630100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630121000000, '大通回族土族自治县', 630100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630122000000, '湟中县', 630100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630123000000, '湟源县', 630100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630200000000, '海东市', 630000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630202000000, '乐都区', 630200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630203000000, '平安区', 630200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630222000000, '民和回族土族自治县', 630200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630223000000, '互助土族自治县', 630200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630224000000, '化隆回族自治县', 630200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (630225000000, '循化撒拉族自治县', 630200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632200000000, '海北藏族自治州', 630000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632221000000, '门源回族自治县', 632200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632222000000, '祁连县', 632200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632223000000, '海晏县', 632200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632224000000, '刚察县', 632200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632300000000, '黄南藏族自治州', 630000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632321000000, '同仁县', 632300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632322000000, '尖扎县', 632300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632323000000, '泽库县', 632300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632324000000, '河南蒙古族自治县', 632300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632500000000, '海南藏族自治州', 630000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632521000000, '共和县', 632500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632522000000, '同德县', 632500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632523000000, '贵德县', 632500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632524000000, '兴海县', 632500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632525000000, '贵南县', 632500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632600000000, '果洛藏族自治州', 630000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632621000000, '玛沁县', 632600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632622000000, '班玛县', 632600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632623000000, '甘德县', 632600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632624000000, '达日县', 632600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632625000000, '久治县', 632600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632626000000, '玛多县', 632600000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632700000000, '玉树藏族自治州', 630000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632701000000, '玉树市', 632700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632722000000, '杂多县', 632700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632723000000, '称多县', 632700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632724000000, '治多县', 632700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632725000000, '囊谦县', 632700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632726000000, '曲麻莱县', 632700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632800000000, '海西蒙古族藏族自治州', 630000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632801000000, '格尔木市', 632800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632802000000, '德令哈市', 632800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632803000000, '茫崖市', 632800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632821000000, '乌兰县', 632800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632822000000, '都兰县', 632800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632823000000, '天峻县', 632800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (632857000000, '大柴旦行政委员会', 632800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640000000000, '宁夏回族自治区', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640100000000, '银川市', 640000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640101000000, '市辖区', 640100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640104000000, '兴庆区', 640100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640105000000, '西夏区', 640100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640106000000, '金凤区', 640100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640121000000, '永宁县', 640100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640122000000, '贺兰县', 640100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640181000000, '灵武市', 640100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640200000000, '石嘴山市', 640000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640201000000, '市辖区', 640200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640202000000, '大武口区', 640200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640205000000, '惠农区', 640200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640221000000, '平罗县', 640200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640300000000, '吴忠市', 640000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640301000000, '市辖区', 640300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640302000000, '利通区', 640300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640303000000, '红寺堡区', 640300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640323000000, '盐池县', 640300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640324000000, '同心县', 640300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640381000000, '青铜峡市', 640300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640400000000, '固原市', 640000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640401000000, '市辖区', 640400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640402000000, '原州区', 640400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640422000000, '西吉县', 640400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640423000000, '隆德县', 640400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640424000000, '泾源县', 640400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640425000000, '彭阳县', 640400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640500000000, '中卫市', 640000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640501000000, '市辖区', 640500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640502000000, '沙坡头区', 640500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640521000000, '中宁县', 640500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (640522000000, '海原县', 640500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650000000000, '新疆维吾尔自治区', 0, 1);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650100000000, '乌鲁木齐市', 650000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650101000000, '市辖区', 650100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650102000000, '天山区', 650100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650103000000, '沙依巴克区', 650100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650104000000, '新市区', 650100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650105000000, '水磨沟区', 650100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650106000000, '头屯河区', 650100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650107000000, '达坂城区', 650100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650109000000, '米东区', 650100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650121000000, '乌鲁木齐县', 650100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650171000000, '乌鲁木齐经济技术开发区', 650100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650172000000, '乌鲁木齐高新技术产业开发区', 650100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650200000000, '克拉玛依市', 650000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650201000000, '市辖区', 650200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650202000000, '独山子区', 650200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650203000000, '克拉玛依区', 650200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650204000000, '白碱滩区', 650200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650205000000, '乌尔禾区', 650200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650400000000, '吐鲁番市', 650000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650402000000, '高昌区', 650400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650421000000, '鄯善县', 650400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650422000000, '托克逊县', 650400000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650500000000, '哈密市', 650000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650502000000, '伊州区', 650500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650521000000, '巴里坤哈萨克自治县', 650500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (650522000000, '伊吾县', 650500000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652300000000, '昌吉回族自治州', 650000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652301000000, '昌吉市', 652300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652302000000, '阜康市', 652300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652323000000, '呼图壁县', 652300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652324000000, '玛纳斯县', 652300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652325000000, '奇台县', 652300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652327000000, '吉木萨尔县', 652300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652328000000, '木垒哈萨克自治县', 652300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652700000000, '博尔塔拉蒙古自治州', 650000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652701000000, '博乐市', 652700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652702000000, '阿拉山口市', 652700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652722000000, '精河县', 652700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652723000000, '温泉县', 652700000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652800000000, '巴音郭楞蒙古自治州', 650000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652801000000, '库尔勒市', 652800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652822000000, '轮台县', 652800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652823000000, '尉犁县', 652800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652824000000, '若羌县', 652800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652825000000, '且末县', 652800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652826000000, '焉耆回族自治县', 652800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652827000000, '和静县', 652800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652828000000, '和硕县', 652800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652829000000, '博湖县', 652800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652871000000, '库尔勒经济技术开发区', 652800000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652900000000, '阿克苏地区', 650000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652901000000, '阿克苏市', 652900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652922000000, '温宿县', 652900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652923000000, '库车县', 652900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652924000000, '沙雅县', 652900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652925000000, '新和县', 652900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652926000000, '拜城县', 652900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652927000000, '乌什县', 652900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652928000000, '阿瓦提县', 652900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (652929000000, '柯坪县', 652900000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653000000000, '克孜勒苏柯尔克孜自治州', 650000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653001000000, '阿图什市', 653000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653022000000, '阿克陶县', 653000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653023000000, '阿合奇县', 653000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653024000000, '乌恰县', 653000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653100000000, '喀什地区', 650000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653101000000, '喀什市', 653100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653121000000, '疏附县', 653100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653122000000, '疏勒县', 653100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653123000000, '英吉沙县', 653100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653124000000, '泽普县', 653100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653125000000, '莎车县', 653100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653126000000, '叶城县', 653100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653127000000, '麦盖提县', 653100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653128000000, '岳普湖县', 653100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653129000000, '伽师县', 653100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653130000000, '巴楚县', 653100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653131000000, '塔什库尔干塔吉克自治县', 653100000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653200000000, '和田地区', 650000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653201000000, '和田市', 653200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653221000000, '和田县', 653200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653222000000, '墨玉县', 653200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653223000000, '皮山县', 653200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653224000000, '洛浦县', 653200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653225000000, '策勒县', 653200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653226000000, '于田县', 653200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (653227000000, '民丰县', 653200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654000000000, '伊犁哈萨克自治州', 650000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654002000000, '伊宁市', 654000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654003000000, '奎屯市', 654000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654004000000, '霍尔果斯市', 654000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654021000000, '伊宁县', 654000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654022000000, '察布查尔锡伯自治县', 654000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654023000000, '霍城县', 654000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654024000000, '巩留县', 654000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654025000000, '新源县', 654000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654026000000, '昭苏县', 654000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654027000000, '特克斯县', 654000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654028000000, '尼勒克县', 654000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654200000000, '塔城地区', 650000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654201000000, '塔城市', 654200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654202000000, '乌苏市', 654200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654221000000, '额敏县', 654200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654223000000, '沙湾县', 654200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654224000000, '托里县', 654200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654225000000, '裕民县', 654200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654226000000, '和布克赛尔蒙古自治县', 654200000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654300000000, '阿勒泰地区', 650000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654301000000, '阿勒泰市', 654300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654321000000, '布尔津县', 654300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654322000000, '富蕴县', 654300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654323000000, '福海县', 654300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654324000000, '哈巴河县', 654300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654325000000, '青河县', 654300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (654326000000, '吉木乃县', 654300000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (659000000000, '自治区直辖县级行政区划', 650000000000, 2);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (659001000000, '石河子市', 659000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (659002000000, '阿拉尔市', 659000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (659003000000, '图木舒克市', 659000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (659004000000, '五家渠市', 659000000000, 3);
INSERT INTO `tz_area` (`area_id`, `area_name`, `parent_id`, `level`) VALUES (659006000000, '铁门关市', 659000000000, 3);
COMMIT;

-- ----------------------------
-- Table structure for tz_attach_file
-- ----------------------------
DROP TABLE IF EXISTS `tz_attach_file`;
CREATE TABLE `tz_attach_file` (
  `file_id` bigint NOT NULL AUTO_INCREMENT,
  `file_path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `file_type` varchar(20) DEFAULT NULL COMMENT '文件类型',
  `file_size` int DEFAULT NULL COMMENT '文件大小',
  `upload_time` datetime DEFAULT NULL COMMENT '上传时间',
  `file_join_id` bigint DEFAULT NULL COMMENT '文件关联的表主键id',
  `file_join_type` tinyint DEFAULT NULL COMMENT '文件关联表类型：1 商品表  FileJoinType',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_attach_file
-- ----------------------------
BEGIN;
INSERT INTO `tz_attach_file` (`file_id`, `file_path`, `file_type`, `file_size`, `upload_time`, `file_join_id`, `file_join_type`) VALUES (1, '2019/07/6aeea212368e4796ad83e17381d62c38.png', 'png', 26409, '2019-07-01 17:26:44', NULL, NULL);
INSERT INTO `tz_attach_file` (`file_id`, `file_path`, `file_type`, `file_size`, `upload_time`, `file_join_id`, `file_join_type`) VALUES (2, '2019/07/44097d528be24d48bf54eb0bd596ebc0.jpg', 'jpg', 22379, '2019-07-02 11:30:16', NULL, NULL);
INSERT INTO `tz_attach_file` (`file_id`, `file_path`, `file_type`, `file_size`, `upload_time`, `file_join_id`, `file_join_type`) VALUES (3, '2019/07/ec73013a82d44306ac477c7bfbaad209.jpg', 'jpg', 41935, '2019-07-02 11:30:26', NULL, NULL);
INSERT INTO `tz_attach_file` (`file_id`, `file_path`, `file_type`, `file_size`, `upload_time`, `file_join_id`, `file_join_type`) VALUES (4, '2019/07/94a2a3b53b9b4643ad80fec10ef96e28.jpg', 'jpg', 19692, '2019-07-02 11:30:47', NULL, NULL);
INSERT INTO `tz_attach_file` (`file_id`, `file_path`, `file_type`, `file_size`, `upload_time`, `file_join_id`, `file_join_type`) VALUES (5, '2019/07/ac0b289260174f0b9757afce4da9c115.jpg', 'jpg', 25583, '2019-07-02 11:31:14', NULL, NULL);
INSERT INTO `tz_attach_file` (`file_id`, `file_path`, `file_type`, `file_size`, `upload_time`, `file_join_id`, `file_join_type`) VALUES (6, '2019/07/5f3cd673cee046218c5916e004346d4c.jpg', 'jpg', 25583, '2019-07-02 11:32:30', NULL, NULL);
INSERT INTO `tz_attach_file` (`file_id`, `file_path`, `file_type`, `file_size`, `upload_time`, `file_join_id`, `file_join_type`) VALUES (7, '2019/07/44a492a2ec1942a9b7fefe813ba27b78.jpg', 'jpg', 40107, '2019-07-02 17:14:38', NULL, NULL);
INSERT INTO `tz_attach_file` (`file_id`, `file_path`, `file_type`, `file_size`, `upload_time`, `file_join_id`, `file_join_type`) VALUES (8, '2019/07/bb485486c4334af283738f9192ae806b.gif', 'gif', 10320, '2019-07-23 19:09:20', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tz_brand
-- ----------------------------
DROP TABLE IF EXISTS `tz_brand`;
CREATE TABLE `tz_brand` (
  `brand_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `brand_name` varchar(30) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `brand_pic` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `user_id` varchar(36) NOT NULL DEFAULT '' COMMENT '用户ID',
  `memo` varchar(50) DEFAULT NULL COMMENT '备注',
  `seq` int DEFAULT '1' COMMENT '顺序',
  `status` int NOT NULL DEFAULT '1' COMMENT '默认是1，表示正常状态,0为下线状态',
  `brief` varchar(100) DEFAULT NULL COMMENT '简要描述',
  `content` text COMMENT '内容',
  `rec_time` datetime DEFAULT NULL COMMENT '记录时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `first_char` varchar(1) DEFAULT NULL COMMENT '品牌首字母',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='品牌表';

-- ----------------------------
-- Records of tz_brand
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tz_category
-- ----------------------------
DROP TABLE IF EXISTS `tz_category`;
CREATE TABLE `tz_category` (
  `category_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `shop_id` bigint NOT NULL COMMENT '店铺ID',
  `parent_id` bigint unsigned NOT NULL COMMENT '父节点',
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '产品类目名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '类目图标',
  `pic` varchar(300) DEFAULT NULL COMMENT '类目的显示图片',
  `seq` int NOT NULL COMMENT '排序',
  `status` int NOT NULL DEFAULT '1' COMMENT '默认是1，表示正常状态,0为下线状态',
  `rec_time` datetime NOT NULL COMMENT '记录时间',
  `grade` int NOT NULL COMMENT '分类层级',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb3 COMMENT='产品类目';

-- ----------------------------
-- Records of tz_category
-- ----------------------------
BEGIN;
INSERT INTO `tz_category` (`category_id`, `shop_id`, `parent_id`, `category_name`, `icon`, `pic`, `seq`, `status`, `rec_time`, `grade`, `update_time`) VALUES (85, 1, 0, '手机数码', NULL, '2019/04/4f148d81d60941b695cb77370a073653.jpg', 1, 1, '2019-04-21 17:28:32', 0, '2019-04-27 11:22:09');
INSERT INTO `tz_category` (`category_id`, `shop_id`, `parent_id`, `category_name`, `icon`, `pic`, `seq`, `status`, `rec_time`, `grade`, `update_time`) VALUES (87, 1, 0, '美妆护肤', NULL, '2019/04/84f1a591a9ed46f68d46eee55c130b34.jpg', 1, 1, '2019-04-21 17:30:45', 0, '2019-04-27 10:46:12');
INSERT INTO `tz_category` (`category_id`, `shop_id`, `parent_id`, `category_name`, `icon`, `pic`, `seq`, `status`, `rec_time`, `grade`, `update_time`) VALUES (88, 1, 0, '运动服饰', NULL, '2019/04/68f081f04c2644319d882a8828f4741c.jpg', 1, 1, '2019-04-21 17:31:12', 0, '2019-04-27 10:38:31');
INSERT INTO `tz_category` (`category_id`, `shop_id`, `parent_id`, `category_name`, `icon`, `pic`, `seq`, `status`, `rec_time`, `grade`, `update_time`) VALUES (93, 1, 85, '手机通讯', NULL, '2019/04/647401fe37b04c19a74adc2353085a24.jpg', 1, 1, '2019-04-21 18:04:03', 0, NULL);
INSERT INTO `tz_category` (`category_id`, `shop_id`, `parent_id`, `category_name`, `icon`, `pic`, `seq`, `status`, `rec_time`, `grade`, `update_time`) VALUES (94, 1, 85, '智能设备', NULL, '2019/04/b5f5f75e0e4f4669a2f079be1f2c4418.jpg', 1, 1, '2019-04-21 18:04:32', 0, NULL);
INSERT INTO `tz_category` (`category_id`, `shop_id`, `parent_id`, `category_name`, `icon`, `pic`, `seq`, `status`, `rec_time`, `grade`, `update_time`) VALUES (95, 1, 0, '美味零食', NULL, '2019/04/3483eafc86674a74bcf9da6100769a9a.jpg', 1, 1, '2019-04-21 21:46:01', 0, '2019-04-27 11:23:27');
INSERT INTO `tz_category` (`category_id`, `shop_id`, `parent_id`, `category_name`, `icon`, `pic`, `seq`, `status`, `rec_time`, `grade`, `update_time`) VALUES (96, 1, 85, '珠宝钟表', NULL, '2019/04/f2f502eae04c4e9ab5982d57cc4e6333.jpg', 1, 1, '2019-04-26 17:20:49', 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tz_category_brand
-- ----------------------------
DROP TABLE IF EXISTS `tz_category_brand`;
CREATE TABLE `tz_category_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint DEFAULT NULL COMMENT '分类id',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌id',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `brand_id` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_category_brand
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tz_category_prop
-- ----------------------------
DROP TABLE IF EXISTS `tz_category_prop`;
CREATE TABLE `tz_category_prop` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint DEFAULT NULL COMMENT '分类id',
  `prop_id` bigint DEFAULT NULL COMMENT '商品属性id即表tz_prod_prop中的prop_id',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `prop_id` (`prop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_category_prop
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tz_delivery
-- ----------------------------
DROP TABLE IF EXISTS `tz_delivery`;
CREATE TABLE `tz_delivery` (
  `dvy_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dvy_name` varchar(50) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `company_home_url` varchar(255) DEFAULT NULL COMMENT '公司主页',
  `rec_time` datetime NOT NULL COMMENT '建立时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `query_url` varchar(520) NOT NULL COMMENT '物流查询接口',
  PRIMARY KEY (`dvy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COMMENT='物流公司';

-- ----------------------------
-- Records of tz_delivery
-- ----------------------------
BEGIN;
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (14, '顺丰快递公司', 'http://www.sf-express.com', '2015-08-20 11:58:03', '2017-03-22 17:12:27', 'http://www.kuaidi100.com/query?type=shunfeng&postid={dvyFlowId}&id=11');
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (15, '申通快递公司', 'http://www.sto-express.com', '2015-08-20 11:58:24', '2015-08-20 12:04:23', 'http://www.kuaidi100.com/query?type=shentong&postid={dvyFlowId}&id=11');
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (16, '中通速递', 'http://www.zto.cn', '2015-08-20 11:58:48', '2015-08-20 12:04:31', 'http://www.kuaidi100.com/query?type=zhongtong&postid={dvyFlowId}&id=11');
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (17, '安信达', 'http://www.anxinda.com', '2015-12-22 10:19:33', '2015-12-22 10:37:26', 'http://www.kuaidi100.com/query?type=anxindakuaixi&postid={dvyFlowId}&id=11');
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (18, 'EMS', 'http://www.ems.com.cn', '2015-12-22 10:38:15', '2015-12-22 10:38:15', 'http://www.kuaidi100.com/query?type=ems&postid={dvyFlowId}&id=11');
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (19, '凡客如风达', 'http://www.rufengda.com', '2015-12-22 10:38:55', '2015-12-22 10:38:55', 'http://www.kuaidi100.com/query?type=rufengda&postid={dvyFlowId}&id=11');
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (20, '汇通快递', 'http://www.htky365.com', '2015-12-22 10:39:46', '2015-12-22 10:39:46', 'http://www.kuaidi100.com/query?type=huitongkuaidi&postid={dvyFlowId}&id=11');
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (21, '天天快递', 'http://www.ttkdex.com', '2015-12-22 10:40:44', '2015-12-22 10:40:44', 'http://www.kuaidi100.com/query?type=tiantian&postid={dvyFlowId}&id=11');
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (22, '佳吉快运', 'http://www.jiaji.com', '2015-12-22 10:42:55', '2015-12-22 10:42:55', 'http://www.kuaidi100.com/query?type=jiajiwuliu&postid={dvyFlowId}&id=11');
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (23, '速尔快递', 'http://www.sure56.com', '2015-12-22 10:43:35', '2015-12-22 10:43:35', 'http://www.kuaidi100.com/query?type=suer&postid={dvyFlowId}&id=11');
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (24, '信丰物流', 'http://www.xf-express.com.cn', '2015-12-22 10:44:17', '2015-12-22 10:44:17', 'http://www.kuaidi100.com/query?type=xinfengwuliu&postid={dvyFlowId}&id=11');
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (25, '韵达快递', 'http://www.yundaex.com', '2015-12-22 10:44:51', '2015-12-22 10:44:51', 'http://www.kuaidi100.com/query?type=yunda&postid={dvyFlowId}&id=11');
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (26, '优速快递', 'http://www.uc56.com', '2015-12-22 10:45:20', '2015-12-22 10:45:20', 'http://www.kuaidi100.com/query?type=youshuwuliu&postid={dvyFlowId}&id=11');
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (27, '中邮物流', 'http://www.cnpl.com.cn', '2015-12-22 10:45:58', '2015-12-22 10:45:58', 'http://www.kuaidi100.com/query?type=zhongyouwuliu&postid={dvyFlowId}&id=11');
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (28, '圆通快递', 'http://www.yto.net.cn', '2015-12-22 11:44:18', '2015-12-22 11:44:18', 'http://www.kuaidi100.com/query?type=yuantong&postid={dvyFlowId}&id=11');
INSERT INTO `tz_delivery` (`dvy_id`, `dvy_name`, `company_home_url`, `rec_time`, `modify_time`, `query_url`) VALUES (29, '宅急送', 'http://www.zjs.com.cn', '2015-12-22 11:45:55', '2015-12-22 11:45:55', 'http://www.kuaidi100.com/query?type=zhaijisong&postid={dvyFlowId}&id=11');
COMMIT;

-- ----------------------------
-- Table structure for tz_hot_search
-- ----------------------------
DROP TABLE IF EXISTS `tz_hot_search`;
CREATE TABLE `tz_hot_search` (
  `hot_search_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` bigint DEFAULT NULL COMMENT '店铺ID 0为全局热搜',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `rec_date` datetime NOT NULL COMMENT '录入时间',
  `seq` int DEFAULT NULL COMMENT '顺序',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态 0下线 1上线',
  `title` varchar(255) NOT NULL COMMENT '热搜标题',
  PRIMARY KEY (`hot_search_id`) USING BTREE,
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='热搜';

-- ----------------------------
-- Records of tz_hot_search
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tz_index_img
-- ----------------------------
DROP TABLE IF EXISTS `tz_index_img`;
CREATE TABLE `tz_index_img` (
  `img_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `img_url` varchar(200) NOT NULL COMMENT '图片',
  `des` varchar(200) DEFAULT '' COMMENT '说明文字,描述',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `link` varchar(200) DEFAULT NULL COMMENT '链接',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `seq` int DEFAULT '0' COMMENT '顺序',
  `upload_time` datetime DEFAULT NULL COMMENT '上传时间',
  `relation` bigint DEFAULT NULL COMMENT '关联',
  `type` int DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`img_id`) USING BTREE,
  KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='主页轮播图';

-- ----------------------------
-- Records of tz_index_img
-- ----------------------------
BEGIN;
INSERT INTO `tz_index_img` (`img_id`, `shop_id`, `img_url`, `des`, `title`, `link`, `status`, `seq`, `upload_time`, `relation`, `type`) VALUES (2, 1, '2019/04/f676a8a8dbcb4e5c9bc907ef059aedb9.jpg', '', NULL, NULL, 1, 1, '2018-12-20 15:22:19', 73, 0);
INSERT INTO `tz_index_img` (`img_id`, `shop_id`, `img_url`, `des`, `title`, `link`, `status`, `seq`, `upload_time`, `relation`, `type`) VALUES (4, 1, '2019/04/52b0082c60c04fc99dd03288548f2841.dpg', '', NULL, NULL, 1, 120, '2019-04-17 17:12:37', 76, 0);
INSERT INTO `tz_index_img` (`img_id`, `shop_id`, `img_url`, `des`, `title`, `link`, `status`, `seq`, `upload_time`, `relation`, `type`) VALUES (5, 1, '2019/04/c2d830afc56d469f96825e91e464d155.jpg', '', NULL, NULL, 1, 10, '2019-04-22 09:57:34', 76, 0);
COMMIT;

-- ----------------------------
-- Table structure for tz_login_hist
-- ----------------------------
DROP TABLE IF EXISTS `tz_login_hist`;
CREATE TABLE `tz_login_hist` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `area` varchar(100) DEFAULT NULL COMMENT '地区',
  `country` varchar(100) DEFAULT NULL COMMENT '国家',
  `user_id` varchar(100) DEFAULT NULL COMMENT '用户id',
  `ip` varchar(64) NOT NULL DEFAULT '' COMMENT 'IP',
  `login_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='登录历史表';

-- ----------------------------
-- Records of tz_login_hist
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tz_message
-- ----------------------------
DROP TABLE IF EXISTS `tz_message`;
CREATE TABLE `tz_message` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '留言创建时间',
  `user_name` varchar(36) DEFAULT NULL COMMENT '姓名',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `contact` varchar(36) DEFAULT NULL COMMENT '联系方式',
  `content` text COMMENT '留言内容',
  `reply` text COMMENT '留言回复',
  `status` tinyint DEFAULT NULL COMMENT '状态：0:未审核 1审核通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tz_message
-- ----------------------------
BEGIN;
INSERT INTO `tz_message` (`id`, `create_time`, `user_name`, `email`, `contact`, `content`, `reply`, `status`) VALUES (1, '2018-10-16 00:11:02', 'djr', '123456', 'nihao', '<p>aaaaaaqqqqffff</p>', '<p>??</p>', 0);
INSERT INTO `tz_message` (`id`, `create_time`, `user_name`, `email`, `contact`, `content`, `reply`, `status`) VALUES (9, '2018-11-30 08:00:00', '111', '111', '111', '<p>11111dddd</p>', '<p>111</p>', 1);
INSERT INTO `tz_message` (`id`, `create_time`, `user_name`, `email`, `contact`, `content`, `reply`, `status`) VALUES (10, '2019-03-15 18:48:05', 'yami', '643254332@qq.com', '15534243444', '<p>hello</p>', '<p>hi</p>', 0);
COMMIT;

-- ----------------------------
-- Table structure for tz_notice
-- ----------------------------
DROP TABLE IF EXISTS `tz_notice`;
CREATE TABLE `tz_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `shop_id` bigint DEFAULT NULL COMMENT '店铺id',
  `title` varchar(36) DEFAULT NULL COMMENT '公告标题',
  `content` text COMMENT '公告内容',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态(1:公布 0:撤回)',
  `is_top` tinyint DEFAULT NULL COMMENT '是否置顶',
  `publish_time` timestamp NULL DEFAULT NULL COMMENT '发布时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tz_notice
-- ----------------------------
BEGIN;
INSERT INTO `tz_notice` (`id`, `shop_id`, `title`, `content`, `status`, `is_top`, `publish_time`, `update_time`) VALUES (1, 1, '两种意见 | 早餐绝配，松软到怀疑人生的酵母面包', '<p style=\"text-align: justify;\"><span style=\"color: #222222; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;\">这款酵母面包我吹爆，不愧是销量超900万的爆品，非常新鲜，松软到怀疑人生，感觉跟超市里卖的那种小面包不太一样。因为是用天然酵母混合面粉发酵，制作周期比人工合成的速发酵母要长很多，但很松软，是那种自然的甜味，也不容易长胖，跟咖啡搭配简直绝了，已经成了我每天早餐的绝配。</span></p>\n<p style=\"text-align: justify;\">&nbsp;</p>\n<p style=\"text-align: justify;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://img-test.gz-yami.com/2019/04/3b6bf397f22c42249e463661a522c88c.jpg\" alt=\"\" width=\"750\" height=\"450\" /></p>', 1, 1, '2019-04-22 14:33:41', '2019-04-27 15:24:27');
INSERT INTO `tz_notice` (`id`, `shop_id`, `title`, `content`, `status`, `is_top`, `publish_time`, `update_time`) VALUES (2, 1, '超大容量折叠包，再也不担心旅游购物买爆', '<p><span style=\"color: #222222; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://img-test.gz-yami.com/2019/04/febc23ad9cab40a3b7a9557df244b948.jpg\" alt=\"\" width=\"750\" height=\"450\" /></span></p>\n<p>&nbsp;</p>\n<p style=\"text-align: justify;\"><span style=\"color: #222222; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;\">出国旅游，购物时很容易不小心就放飞自我，买一大堆东西，发现装不下了。这时，我就会从包里拿出严选折叠手提袋，优雅地解决&ldquo;爆买&rdquo;后无处安放的尴尬。</span></p>\n<p style=\"text-align: justify;\"><span style=\"color: #222222; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;\">这个手提袋容量巨大，双层防水面料，但非常轻，收纳起来只有手掌厚度和大小，放在包里一点不占空间。真的超能装，打开后最多能装25L，抵半个行李箱了。袋子一侧能直接套入拉杆，稳稳地放在箱子上，拖起来毫不费力。我每次长途旅行必备它，平时拿去买菜、健身房也很好用。</span></p>', 1, 1, '2019-04-22 15:54:55', '2019-04-27 15:24:39');
INSERT INTO `tz_notice` (`id`, `shop_id`, `title`, `content`, `status`, `is_top`, `publish_time`, `update_time`) VALUES (3, 1, '同是纯棉，为什么它睡起来如此舒服', '<p style=\"text-align: justify;\"><span style=\"font-size: 20px;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://img-test.gz-yami.com/2019/04/b837e346051a4c51a5d0d22e137187fe.jpg\" alt=\"\" width=\"670\" height=\"480\" /></span></p>\n<p style=\"text-align: justify;\">&nbsp;</p>\n<p style=\"text-align: justify;\"><span style=\"font-size: 20px;\"><span style=\"color: #222222; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;\">说到床品，我一直很想要那种五星级酒店的面料，但每次都搞不懂那些纺织名词，稀里糊涂就买了，结果往往是不好睡。</span><br /></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: 16px;\"><span style=\"color: #222222; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;\">后来查了一下，只有贡缎才具有这种光滑细腻的质感，但织法工艺难度高，一套动辄六七百。同事推荐了严选这款四件套，是用60支的优质长绒棉，每平方英寸400根线织成的，非常细密柔软。</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: 16px;\"><span style=\"color: #222222; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;\">第一天睡觉的时候我惊呆了，同样是纯棉床品，为什么它睡起来如此舒服，竟然有着丝绸一样的顺滑触感。而且厚薄适中，透气性也不错，一年四季都能用，非常推荐。</span></span></p>\n<p>&nbsp;</p>', 1, 1, '2019-04-22 16:28:18', '2019-04-27 15:25:00');
COMMIT;

-- ----------------------------
-- Table structure for tz_order
-- ----------------------------
DROP TABLE IF EXISTS `tz_order`;
CREATE TABLE `tz_order` (
  `order_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_number` varchar(50) NOT NULL COMMENT '订购流水号',
  `total_count` int DEFAULT NULL COMMENT '订单商品总数',
  `user_id` bigint NOT NULL COMMENT '订购用户ID',
  `total_pay` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `transfee` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单运费',
  `reduce_amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '优惠总额',
  `pay_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '支付方式1 微信支付 2 支付宝',
  `actual_total_pay` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实付金额(商品总价+运费-优惠金额+改价)',
  `buyer_remark` varchar(1024) DEFAULT NULL COMMENT '订单备注',
  `status` int NOT NULL DEFAULT '100' COMMENT '订单状态 100-待付款 101-已付款待发货 102-已发货待收货 105-部分发货 103-已收货待评价 104-交易成功 106-支付中 200-交易关闭',
  `order_addr_id` bigint unsigned DEFAULT NULL COMMENT '用户订单地址Id',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '订购时间',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '订单更新时间',
  `pay_time` datetime DEFAULT NULL COMMENT '付款成功时间',
  `dvy_time` datetime DEFAULT NULL COMMENT '发货时间',
  `finally_time` datetime DEFAULT NULL COMMENT '完成时间',
  `cancel_time` datetime DEFAULT NULL COMMENT '取消时间',
  `is_payed` int NOT NULL DEFAULT '0' COMMENT '是否支付 0 未支付 1 已支付',
  `delete_status` int NOT NULL DEFAULT '0' COMMENT '状态(1为已删除,0为未删除)',
  `close_type` enum('0','1','2','3','4') NOT NULL DEFAULT '0' COMMENT '订单关闭类型 0-订单活跃 1-超时未支付 2-退款关闭 3-卖家关闭 4-买家关闭',
  `prod_name` varchar(255) DEFAULT NULL COMMENT '商品名称，以逗号分隔',
  `change_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商家改价',
  `user_mobile` varchar(50) DEFAULT NULL,
  `user_wechat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_number_userid_unique_ind` (`order_number`,`user_id`),
  UNIQUE KEY `order_number_unique_ind` (`order_number`),
  UNIQUE KEY `IDX_833d6865f234d894fad00a172c` (`order_number`),
  UNIQUE KEY `REL_8ced78aef02528e4d1938be025` (`order_addr_id`),
  CONSTRAINT `FK_8ced78aef02528e4d1938be025d` FOREIGN KEY (`order_addr_id`) REFERENCES `tz_order_addr` (`order_addr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tz_order_addr
-- ----------------------------
DROP TABLE IF EXISTS `tz_order_addr`;
CREATE TABLE `tz_order_addr` (
  `order_addr_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `addr_id` bigint unsigned NOT NULL COMMENT '地址ID',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID',
  `receiver` varchar(50) DEFAULT NULL COMMENT '收货人',
  `province_id` bigint DEFAULT NULL COMMENT '省ID',
  `province` varchar(100) DEFAULT NULL COMMENT '省',
  `area_id` bigint DEFAULT NULL COMMENT '区域ID',
  `area` varchar(20) DEFAULT NULL COMMENT '区',
  `city_id` bigint DEFAULT NULL COMMENT '城市ID',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `addr` varchar(1000) DEFAULT NULL COMMENT '地址',
  `post_code` varchar(15) DEFAULT NULL COMMENT '邮编',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '建立时间',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`order_addr_id`),
  KEY `order_addr_id` (`order_addr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_order_addr
-- ----------------------------
BEGIN;
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (1, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (2, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (3, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (4, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (5, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (6, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (7, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (8, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (9, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (10, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (11, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (12, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (13, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (14, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (15, 4, 2, '王大锤', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (16, 4, 2, '王大锤', 150000000000, '内蒙古自治区', 150621000000, '达拉特旗', 150600000000, '鄂尔多斯市', '北京大学', NULL, '13121878788', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (17, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (18, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (19, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (20, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (21, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (22, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (23, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (24, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (25, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (26, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (27, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (28, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (29, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (30, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (31, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (32, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (33, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (34, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (35, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (36, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (37, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (38, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (39, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (40, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (41, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (42, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (43, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (44, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (45, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (46, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (47, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (48, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (49, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (50, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (51, 8, 2, '黎明', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121767688', '2024-04-17 06:28:09.068000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (52, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (53, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (54, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (55, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (56, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (57, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (58, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (59, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (60, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (61, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (62, 4, 2, '王大锤', 230000000000, '黑龙江省', 232701000000, '漠河市', 232700000000, '大兴安岭地区', '例子', NULL, '15611753721', '2023-07-11 16:33:06.000000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (63, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (64, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (65, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (66, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (67, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (68, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (69, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (70, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (71, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (72, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (73, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (74, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (75, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (76, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (77, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (78, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (79, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (80, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (81, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (82, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (83, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (84, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (85, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (86, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (87, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (88, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (89, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (90, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (91, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (92, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (93, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (94, 7, 2, '豆豆', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '里斯本', NULL, '13121234322', '2024-04-17 06:21:34.566000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (95, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (96, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (97, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (98, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (99, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (100, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (101, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (102, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (103, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (104, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (105, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (106, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (107, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (108, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (109, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (110, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (111, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (112, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (113, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (114, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
INSERT INTO `tz_order_addr` (`order_addr_id`, `addr_id`, `user_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`) VALUES (115, 6, 2, '豆豆的', 310000000000, '上海市', 310101000000, '黄浦区', 310100000000, '市辖区', '里斯本', NULL, '13121342344', '2024-04-17 06:19:36.304000', 0);
COMMIT;

-- ----------------------------
-- Table structure for tz_order_delivery
-- ----------------------------
DROP TABLE IF EXISTS `tz_order_delivery`;
CREATE TABLE `tz_order_delivery` (
  `delivery_id` bigint NOT NULL,
  `delivery_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `delivery_data` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dvy_flow_code` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `delivery_state` int DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  UNIQUE KEY `dvy_flow_number_idx` (`delivery_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tz_order_delivery
-- ----------------------------
BEGIN;
INSERT INTO `tz_order_delivery` (`delivery_id`, `delivery_number`, `delivery_data`, `dvy_flow_code`, `delivery_state`) VALUES (12, '123456', '[{\"AcceptTime\":\"2014/06/25 08:05:37\",\"AcceptStation\":\"正在派件..(派件人:邓裕富,电话:18718866310)[深圳 市]\",\"Remark\":null},{\"AcceptTime\":\"2014/06/25 04:01:28\",\"AcceptStation\":\"快件在 深圳集散中心 ,准备送往下一站 深圳 [深圳市]\",\"Remark\":null},{\"AcceptTime\":\"2014/06/25 01:41:06\",\"AcceptStation\":\"快件在 深圳集散中心 [深圳市]\",\"Remark\":null},{\"AcceptTime\":\"2014/06/24 20:18:58\",\"AcceptStation\":\"已收件[深圳市]\",\"Remark\":null},{\"AcceptTime\":\"2014/06/24 20:55:28\",\"AcceptStation\":\"快件在 深圳 ,准备送往下一站 深圳集散中心 [深圳市]\",\"Remark\":null},{\"AcceptTime\":\"2014/06/25 10:23:03\",\"AcceptStation\":\"派件已签收[深圳市]\",\"Remark\":null},{\"AcceptTime\":\"2014/06/25 10:23:03\",\"AcceptStation\":\"签收人是：已签收[深圳市]\",\"Remark\":null}]', 'SF', 2);
COMMIT;

-- ----------------------------
-- Table structure for tz_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tz_order_item`;
CREATE TABLE `tz_order_item` (
  `order_item_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '订单项ID',
  `order_id` bigint unsigned NOT NULL COMMENT '订单ID',
  `order_number` varchar(50) NOT NULL COMMENT '订单order_number',
  `prod_id` bigint unsigned NOT NULL COMMENT '产品ID',
  `sku_id` bigint unsigned NOT NULL COMMENT '产品SkuID',
  `item_count` int NOT NULL DEFAULT '0' COMMENT '购物车产品个数',
  `prod_name` varchar(120) NOT NULL COMMENT '产品名称',
  `sku_name` varchar(120) DEFAULT NULL COMMENT 'sku名称',
  `pic` varchar(255) DEFAULT NULL COMMENT '产品主图片路径',
  `price` decimal(15,2) NOT NULL COMMENT '产品价格',
  `user_id` bigint NOT NULL COMMENT '用户Id',
  `total_pay` decimal(15,2) NOT NULL COMMENT '商品总金额',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '购物时间',
  `comm_sts` enum('0','1') NOT NULL DEFAULT '0' COMMENT '评论状态 0 未评论 1 已评论',
  `add_shopcart_date` datetime DEFAULT NULL COMMENT '加入购物车时间',
  `aftersale_status` int NOT NULL COMMENT '售后状态：0 未售后 100 退款中 101 换货中 200 退款成功 201 换货成功 300 退款关闭 301 换货关闭',
  `delivery_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '发货状态 0 未发货 1 已发货 2 已收货',
  `delivery_ids` bigint DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_number` (`order_number`),
  KEY `FK_fbe47b28f30750ed81a745ba5f6` (`order_id`),
  CONSTRAINT `FK_fbe47b28f30750ed81a745ba5f6` FOREIGN KEY (`order_id`) REFERENCES `tz_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_order_item
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tz_order_payment
-- ----------------------------
DROP TABLE IF EXISTS `tz_order_payment`;
CREATE TABLE `tz_order_payment` (
  `payment_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '订单支付单据ID',
  `pay_no` varchar(36) DEFAULT NULL COMMENT '支付单号',
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '第三方支付交易号',
  `order_number` varchar(36) DEFAULT NULL COMMENT 'order表中的订单号',
  `pay_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '支付方式1 微信支付 2 支付宝',
  `pay_type_name` varchar(50) DEFAULT NULL COMMENT '支付方式名称',
  `actual_total_pay` decimal(15,2) DEFAULT NULL COMMENT '支付金额',
  `is_clearing` int DEFAULT NULL COMMENT '是否清算 0:否 1:是',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `clearing_time` datetime DEFAULT NULL COMMENT '清算时间',
  `version` int DEFAULT NULL COMMENT '版本号',
  `pay_status` int NOT NULL DEFAULT '0' COMMENT '是否支付 0 未支付 1 已支付',
  `initial_pay_time` datetime DEFAULT NULL COMMENT '前端发起支付时间',
  `frontend_pay_time` datetime DEFAULT NULL COMMENT '前端完成支付时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付回调成功时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `pay_raw_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '第三方返回的支付回调数据',
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `primary_order_no` (`order_number`),
  UNIQUE KEY `IDX_5653541d598daef11f71247541` (`order_number`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_order_payment
-- ----------------------------
BEGIN;
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (1, NULL, NULL, '8efa2417-a836-48e3-a85b-0bab0ab0effe', '1', NULL, 10999.00, 0, '2', '2023-12-04 20:58:32.149215', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (2, NULL, NULL, 'dfa3b1ce-a9c9-405b-a990-066f9ec49d79', '1', NULL, 10999.00, 0, '2', '2023-12-04 20:59:26.747873', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (3, NULL, NULL, 'c25dcc08-1df1-4c29-aab1-1af8267c9a50', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:00:40.242761', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (4, NULL, NULL, '406399f0-c9dc-4d89-a501-43af2de25140', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:04:22.850262', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (5, NULL, NULL, '962fcd9e-1757-4327-9b72-43e1ea6d7424', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:05:54.971926', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (6, NULL, NULL, 'b5e43d0f-651e-41f6-9e57-3c8b25f77455', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:06:58.159181', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (7, NULL, NULL, 'a98d8aa0-db49-4110-b9fb-1bcbb8bd46ab', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:30:05.604510', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (8, NULL, NULL, '195f3146-5ad7-4315-ab93-a7c2ae72901e', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:30:28.217562', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (9, NULL, NULL, '733fe285-f53a-4b97-a526-2f2e4a70b50a', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:32:09.449994', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (10, NULL, NULL, '72fd4b3a-0d88-4761-a8f7-7f817776e893', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:34:47.093774', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (11, NULL, NULL, '13ea9fb2-a14a-4891-9d20-a20cc7456660', '1', NULL, 10999.00, 0, '2', '2023-12-04 21:36:14.717686', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (12, NULL, NULL, 'f9cbd147-f7b0-4c28-86d9-0a62f7270234', '1', NULL, 25.00, 0, '2', '2024-02-21 10:23:51.013132', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (13, NULL, NULL, '7e4a5547-1892-43e2-adf9-06db1413f578', '1', NULL, 25.00, 0, '2', '2024-02-21 10:24:26.002525', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (14, NULL, NULL, '9596639b-2d78-427b-892f-b8641ecf1723', '1', NULL, 25.00, 0, '2', '2024-02-21 10:24:50.233640', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (15, NULL, NULL, 'e13b3186-b98d-4f80-8cf1-9b9800303687', '1', NULL, 100.00, 0, '2', '2024-04-17 05:57:44.483140', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (24, NULL, NULL, '1e1fddfb-57ca-4b2f-92d2-2ac8e3366d53', '1', NULL, 125.00, 0, '2', '2024-04-18 05:18:18.966146', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (26, NULL, NULL, '50800ac1-8cff-4137-9bea-23500ee6612e', '1', NULL, 50.00, 0, '2', '2024-04-19 02:48:57.486609', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (27, NULL, NULL, '93856980-b9a2-43e2-bbf8-cfc06feaa440', '1', NULL, 50.00, 0, '2', '2024-04-19 02:50:32.487722', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (28, NULL, NULL, 'b1e492b5-36f1-490c-b136-f017c38db9c9', '1', NULL, 50.00, 0, '2', '2024-04-19 02:57:39.382672', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (29, NULL, NULL, '5c4cd7e4-5de6-4c56-a526-91835a40bda3', '1', NULL, 75.00, 0, '2', '2024-04-19 03:00:16.876701', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (30, NULL, NULL, 'fcceef0c-7c3a-48ac-9481-4752624c2ee2', '1', NULL, 75.00, 0, '2', '2024-04-19 03:01:15.210765', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (31, NULL, NULL, 'a873aa6f-3a79-4800-9bfb-a9b937eb39a4', '1', NULL, 75.00, 0, '2', '2024-04-19 03:13:00.768849', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (32, NULL, NULL, '7120e3a2-e288-4368-961b-c3dac779a18b', '1', NULL, 75.00, 0, '2', '2024-04-19 03:15:10.944613', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (33, NULL, NULL, 'd995b25d-0e0f-4e6c-97b2-d0af5b5e30ea', '1', NULL, 75.00, 0, '2', '2024-04-19 03:18:45.943085', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (34, NULL, NULL, '4b60905c-efec-407f-9433-27af647e7ca2', '1', NULL, 75.00, 0, '2', '2024-04-19 03:21:02.150097', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (35, NULL, NULL, '9ab85cf3-5c78-4c0c-bcb8-ae670571ccc5', '1', NULL, 75.00, 0, '2', '2024-04-19 03:21:37.136620', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (36, NULL, NULL, '6ccdc6b3-003c-4a89-814f-379f19b99f8d', '1', NULL, 75.00, 0, '2', '2024-04-19 03:25:45.069281', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (37, NULL, NULL, '2a900e59-f7cb-4c17-a52a-3d77012f1100', '1', NULL, 100.00, 0, '2', '2024-04-19 03:38:03.932115', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (38, NULL, NULL, '11713498947.344252', '1', NULL, 100.00, 0, '2', '2024-04-19 03:55:47.444206', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (39, NULL, NULL, '11713499118.99368152', '1', NULL, 100.00, 0, '2', '2024-04-19 03:58:39.102751', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (40, NULL, NULL, '11713499368.34917022', '1', NULL, 100.00, 0, '2', '2024-04-19 04:02:48.437307', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (41, NULL, NULL, '11713499425.94565282', '1', NULL, 100.00, 0, '2', '2024-04-19 04:03:46.040563', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (42, NULL, NULL, '1171349953894602', '1', NULL, 100.00, 0, '2', '2024-04-19 04:05:38.842704', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (43, NULL, NULL, '1171350324629172', '1', NULL, 100.00, 0, '2', '2024-04-19 05:07:26.329697', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (44, NULL, NULL, '1171350328370702', '1', NULL, 100.00, 0, '2', '2024-04-19 05:08:03.301846', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (45, NULL, NULL, '1171350447533802', '1', NULL, 50.00, 0, '2', '2024-04-19 05:27:55.256648', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (46, NULL, NULL, '1171497250552752', '1', NULL, 75.00, 0, '2', '2024-05-06 05:15:05.616339', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (47, NULL, NULL, '1171497545323102', '1', NULL, 75.00, 0, '2', '2024-05-06 06:04:13.435521', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (48, NULL, NULL, '1171497811374992', '1', NULL, 75.00, 0, '2', '2024-05-06 06:48:33.964876', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (49, NULL, NULL, '1171497852457702', '1', NULL, 75.00, 0, '2', '2024-05-06 06:55:24.194206', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (50, NULL, NULL, '1171532760765432', '1', NULL, 25.00, 0, '2', '2024-05-10 07:53:28.059638', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (51, NULL, NULL, '1171532873919152', '1', NULL, 25.00, 0, '2', '2024-05-10 08:12:19.741602', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (52, NULL, NULL, '1171532909351172', '1', NULL, 25.00, 0, '2', '2024-05-10 08:18:13.231841', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (53, NULL, NULL, '1171533134398822', '1', NULL, 25.00, 0, '2', '2024-05-10 08:55:43.512733', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (54, NULL, NULL, '1171533183636642', '1', NULL, 98991.00, 0, '2', '2024-05-10 09:03:56.482630', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (55, NULL, NULL, '1171533209971902', '1', NULL, 25.00, 0, '2', '2024-05-10 09:08:19.825602', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (56, NULL, NULL, '1171533237877732', '1', NULL, 25.00, 0, '2', '2024-05-10 09:12:58.959976', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (57, NULL, NULL, '1171533301553622', '1', NULL, 50.00, 0, '2', '2024-05-10 09:23:35.676269', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (58, NULL, NULL, '1171533326765242', '1', NULL, 50.00, 0, '2', '2024-05-10 09:27:47.243059', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (59, NULL, NULL, '1171533336930412', '1', NULL, 50.00, 0, '2', '2024-05-10 09:29:30.076396', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (60, NULL, NULL, '1171533351236802', '1', NULL, 50.00, 0, '2', '2024-05-10 09:31:52.525674', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (61, NULL, NULL, '1171533404769512', '1', NULL, 25.00, 0, '2', '2024-05-10 09:40:48.119530', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (62, NULL, NULL, '1171533411622612', '1', NULL, 25.00, 0, '2', '2024-05-10 09:41:56.844955', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (63, NULL, NULL, '1171533414969562', '1', NULL, 25.00, 0, '2', '2024-05-10 09:42:29.225077', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (64, NULL, NULL, '1171539863560252', '1', NULL, 25.00, 0, '2', '2024-05-11 03:37:15.225010', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (65, NULL, NULL, '1171539891781522', '1', NULL, 25.00, 0, '2', '2024-05-11 03:41:58.077463', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (66, NULL, NULL, '1171539912554882', '1', NULL, 25.00, 0, '2', '2024-05-11 03:45:25.343158', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (67, NULL, NULL, '1171539932629792', '1', NULL, 25.00, 0, '2', '2024-05-11 11:48:46.162193', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (68, NULL, NULL, '1171540344186272', '1', NULL, 25.00, 0, '2', '2024-05-11 12:57:21.553901', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (69, NULL, NULL, '1171540359837632', '1', NULL, 25.00, 0, '2', '2024-05-11 12:59:58.427242', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (70, NULL, NULL, '1171540369413362', '1', NULL, 25.00, 0, '2', '2024-05-11 13:01:34.854930', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (71, NULL, NULL, '1171540388028342', '1', NULL, 25.00, 0, '2', '2024-05-11 13:04:40.337718', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (72, NULL, NULL, '1171540393429412', '1', NULL, 25.00, 0, '2', '2024-05-11 13:05:34.191627', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (73, NULL, NULL, '1171540448525032', '1', NULL, 25.00, 0, '2', '2024-05-11 13:14:45.890397', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (74, NULL, NULL, '1171540722846522', '1', NULL, 25.00, 0, '2', '2024-05-11 14:00:28.968468', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (75, NULL, NULL, '1171541232161822', '1', NULL, 25.00, 0, '2', '2024-05-11 15:25:21.508011', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (76, NULL, NULL, '1171541246960562', '1', NULL, 25.00, 0, '2', '2024-05-11 15:27:49.357183', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (77, NULL, NULL, '1171541410460342', '1', NULL, 25.00, 0, '2', '2024-05-11 15:55:04.465067', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (78, NULL, NULL, '1171541426421722', '1', NULL, 25.00, 0, '2', '2024-05-11 15:57:44.967434', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (79, NULL, NULL, '1171541444691172', '1', NULL, 25.00, 0, '2', '2024-05-11 16:00:47.047222', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (80, NULL, NULL, '1171541456561812', '1', NULL, 25.00, 0, '2', '2024-05-11 16:02:45.776078', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (81, NULL, NULL, '1171541473758992', '1', NULL, 25.00, 0, '2', '2024-05-11 16:05:37.873838', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (82, NULL, NULL, '1171627555629492', '1', NULL, 25.00, 0, '2', '2024-05-21 07:12:36.483424', NULL, NULL, 0, '2024-05-21 15:12:37', NULL, NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (83, NULL, NULL, '1171627573224402', '1', NULL, 25.00, 0, '2', '2024-05-21 07:15:32.310129', NULL, NULL, 0, '2024-05-21 15:15:32', '2024-05-21 15:16:06', NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (84, NULL, NULL, '1171627598929162', '1', NULL, 25.00, 0, '2', '2024-05-21 07:19:49.945399', NULL, NULL, 0, '2024-05-21 15:19:50', '2024-05-21 15:19:58', NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (85, NULL, NULL, '1171627607419042', '1', NULL, 25.00, 0, '2', '2024-05-21 07:21:14.332322', NULL, NULL, 0, '2024-05-21 15:21:14', '2024-05-21 15:21:28', NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (86, NULL, NULL, '1171627612851872', '1', NULL, 25.00, 0, '2', '2024-05-21 07:22:08.181035', NULL, NULL, 0, '2024-05-21 15:22:08', '2024-05-21 15:22:19', NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (87, NULL, NULL, '1171627616985412', '1', NULL, 25.00, 0, '2', '2024-05-21 07:22:49.510269', NULL, NULL, 0, '2024-05-21 15:22:50', '2024-05-21 15:23:00', NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (88, NULL, NULL, '1171627642380842', '1', NULL, 25.00, 0, '2', '2024-05-21 07:27:04.115983', NULL, NULL, 0, '2024-05-21 15:27:04', '2024-05-21 15:27:18', NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (89, NULL, NULL, '1171627659655432', '1', NULL, 25.00, 0, '2', '2024-05-21 07:29:57.057222', NULL, NULL, 0, '2024-05-21 15:29:57', '2024-05-21 15:30:08', NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (90, NULL, NULL, '1171627674940402', '1', NULL, 25.00, 0, '2', '2024-05-21 07:32:30.000354', NULL, NULL, 0, '2024-05-21 15:32:30', '2024-05-21 15:32:57', NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (91, NULL, NULL, '1171627684464972', '1', NULL, 25.00, 0, '2', '2024-05-21 07:34:04.894525', NULL, NULL, 0, '2024-05-21 15:34:05', '2024-05-21 15:34:22', NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (92, NULL, NULL, '1171627692576752', '1', NULL, 25.00, 0, '2', '2024-05-21 07:35:25.153458', NULL, NULL, 0, '2024-05-21 15:35:25', '2024-05-21 15:35:33', NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (93, NULL, NULL, '1171627709330322', '1', NULL, 25.00, 0, '2', '2024-05-21 07:38:14.055222', NULL, NULL, 0, '2024-05-21 15:38:14', '2024-05-21 15:38:25', NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (94, NULL, NULL, '1171627724310472', '1', NULL, 25.00, 0, '2', '2024-05-21 07:40:43.361948', NULL, NULL, 0, '2024-05-21 15:40:43', '2024-05-21 15:40:55', NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (95, NULL, NULL, '1171627736753112', '1', NULL, 25.00, 0, '2', '2024-05-21 07:42:47.565119', NULL, NULL, 0, '2024-05-21 15:42:48', '2024-05-21 15:42:59', NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (96, NULL, NULL, '1171627752959992', '1', NULL, 25.00, 0, '2', '2024-05-21 07:45:29.851344', NULL, NULL, 0, '2024-05-21 15:45:30', '2024-05-21 15:45:44', NULL, NULL, NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (97, '3172889116214612', NULL, '1172889116211692', '1', '微信支付', 25.00, 0, '2', '2024-10-14 07:32:42.237119', NULL, NULL, 0, NULL, NULL, NULL, '2024-10-14 07:32:42', NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (98, '3172889183582112', NULL, '1172889183527672', '1', '微信支付', 25.00, 0, '2', '2024-10-14 07:43:55.830709', NULL, NULL, 0, '2024-10-14 15:43:56', NULL, NULL, '2024-10-14 07:43:55', NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (99, '3172889199070412', NULL, '1172889199093452', '1', '微信支付', 25.00, 0, '2', '2024-10-14 07:46:30.306444', NULL, NULL, 0, '2024-10-14 15:46:30', '2024-10-14 15:46:30', NULL, '2024-10-14 07:46:30', NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (100, '3172889213318222', NULL, '1172889213282662', '1', '微信支付', 25.00, 0, '2', '2024-10-14 07:48:53.107778', NULL, NULL, 0, '2024-10-14 15:48:53', '2024-10-14 15:48:53', NULL, '2024-10-14 07:48:53', NULL);
INSERT INTO `tz_order_payment` (`payment_id`, `pay_no`, `transaction_id`, `order_number`, `pay_type`, `pay_type_name`, `actual_total_pay`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`, `initial_pay_time`, `frontend_pay_time`, `pay_time`, `update_time`, `pay_raw_data`) VALUES (101, '3172889250221912', NULL, '1172889250161062', '1', '微信支付', 25.00, 0, '2', '2024-10-14 07:55:02.022240', NULL, NULL, 0, '2024-10-14 15:55:02', '2024-10-14 15:55:02', NULL, '2024-10-14 07:55:02', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tz_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `tz_order_refund`;
CREATE TABLE `tz_order_refund` (
  `refund_id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `shop_id` bigint NOT NULL COMMENT '店铺ID',
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `order_number` varchar(50) NOT NULL COMMENT '订单流水号',
  `order_amount` double(12,2) NOT NULL COMMENT '订单总金额',
  `order_item_id` bigint NOT NULL DEFAULT '0' COMMENT '订单项ID 全部退款是0',
  `refund_sn` varchar(50) NOT NULL COMMENT '退款编号',
  `flow_trade_no` varchar(100) NOT NULL COMMENT '订单支付流水号',
  `out_refund_no` varchar(200) DEFAULT NULL COMMENT '第三方退款单号(微信退款单号)',
  `pay_type` int DEFAULT NULL COMMENT '订单支付方式 1 微信支付 2 支付宝',
  `pay_type_name` varchar(50) DEFAULT NULL COMMENT '订单支付名称',
  `user_id` varchar(50) NOT NULL COMMENT '买家ID',
  `goods_num` int DEFAULT NULL COMMENT '退货数量',
  `refund_amount` decimal(10,2) NOT NULL COMMENT '退款金额',
  `apply_type` int NOT NULL DEFAULT '0' COMMENT '申请类型:1,仅退款,2退款退货',
  `refund_sts` int NOT NULL DEFAULT '0' COMMENT '处理状态:1为待审核,2为同意,3为不同意',
  `return_money_sts` int NOT NULL DEFAULT '0' COMMENT '处理退款状态: 0:退款处理中 1:退款成功 -1:退款失败',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `handel_time` datetime DEFAULT NULL COMMENT '卖家处理时间',
  `refund_time` datetime DEFAULT NULL COMMENT '退款时间',
  `photo_files` varchar(150) DEFAULT NULL COMMENT '文件凭证json',
  `buyer_msg` varchar(300) DEFAULT NULL COMMENT '申请原因',
  `seller_msg` varchar(300) DEFAULT NULL COMMENT '卖家备注',
  `express_name` varchar(50) DEFAULT NULL COMMENT '物流公司名称',
  `express_no` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `ship_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_message` varchar(300) DEFAULT NULL COMMENT '收货备注',
  PRIMARY KEY (`refund_id`),
  UNIQUE KEY `refund_sn_unique` (`refund_sn`),
  KEY `order_number` (`order_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tz_order_refund
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tz_order_settlement
-- ----------------------------
DROP TABLE IF EXISTS `tz_order_settlement`;
CREATE TABLE `tz_order_settlement` (
  `settlement_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '支付结算单据ID',
  `pay_no` varchar(36) DEFAULT NULL COMMENT '支付单号',
  `biz_pay_no` varchar(255) DEFAULT NULL COMMENT '外部订单流水号',
  `order_number` varchar(36) DEFAULT NULL COMMENT 'order表中的订单号',
  `pay_type` int DEFAULT NULL COMMENT '支付方式 1 微信支付 2 支付宝',
  `pay_type_name` varchar(50) DEFAULT NULL COMMENT '支付方式名称',
  `pay_amount` decimal(15,2) DEFAULT NULL COMMENT '支付金额',
  `is_clearing` int DEFAULT NULL COMMENT '是否清算 0:否 1:是',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `clearing_time` datetime DEFAULT NULL COMMENT '清算时间',
  `version` int DEFAULT NULL COMMENT '版本号',
  `pay_status` int DEFAULT NULL COMMENT '支付状态',
  PRIMARY KEY (`settlement_id`),
  UNIQUE KEY `primary_order_no` (`order_number`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tz_order_settlement
-- ----------------------------
BEGIN;
INSERT INTO `tz_order_settlement` (`settlement_id`, `pay_no`, `biz_pay_no`, `order_number`, `pay_type`, `pay_type_name`, `pay_amount`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`) VALUES (1, '1145634947151826944', NULL, '1145634946149388288', 1, NULL, 1.01, 0, '51540df5255e4d22903b0f83921095ff', '2019-07-01 18:07:11', NULL, 1, 1);
INSERT INTO `tz_order_settlement` (`settlement_id`, `pay_no`, `biz_pay_no`, `order_number`, `pay_type`, `pay_type_name`, `pay_amount`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`) VALUES (2, '1146346113691947008', NULL, '1146346112622399488', 1, NULL, 1.01, 0, '51540df5255e4d22903b0f83921095ff', '2019-07-03 17:13:06', NULL, 0, 0);
INSERT INTO `tz_order_settlement` (`settlement_id`, `pay_no`, `biz_pay_no`, `order_number`, `pay_type`, `pay_type_name`, `pay_amount`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`) VALUES (3, '1146346763158949888', NULL, '1146346762332672000', 1, NULL, 7103.00, 0, '51540df5255e4d22903b0f83921095ff', '2019-07-03 17:15:41', NULL, 0, 0);
INSERT INTO `tz_order_settlement` (`settlement_id`, `pay_no`, `biz_pay_no`, `order_number`, `pay_type`, `pay_type_name`, `pay_amount`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`) VALUES (4, '1146346992977448960', NULL, '1146346992126005248', 1, NULL, 1.01, 0, '51540df5255e4d22903b0f83921095ff', '2019-07-03 17:16:36', NULL, 0, 0);
INSERT INTO `tz_order_settlement` (`settlement_id`, `pay_no`, `biz_pay_no`, `order_number`, `pay_type`, `pay_type_name`, `pay_amount`, `is_clearing`, `user_id`, `create_time`, `clearing_time`, `version`, `pay_status`) VALUES (5, '1146347417931747328', NULL, '1146347329394184192', 1, NULL, 1.01, 0, '51540df5255e4d22903b0f83921095ff', '2019-07-03 17:17:56', NULL, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for tz_pick_addr
-- ----------------------------
DROP TABLE IF EXISTS `tz_pick_addr`;
CREATE TABLE `tz_pick_addr` (
  `addr_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `addr_name` varchar(36) DEFAULT NULL COMMENT '自提点名称',
  `addr` varchar(1000) DEFAULT NULL COMMENT '地址',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `province_id` bigint DEFAULT NULL COMMENT '省份ID',
  `province` varchar(32) DEFAULT NULL COMMENT '省份',
  `city_id` bigint DEFAULT NULL COMMENT '城市ID',
  `city` varchar(32) DEFAULT NULL COMMENT '城市',
  `area_id` bigint DEFAULT NULL COMMENT '区/县ID',
  `area` varchar(32) DEFAULT NULL COMMENT '区/县',
  `shop_id` bigint DEFAULT NULL COMMENT '店铺id',
  PRIMARY KEY (`addr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户配送地址';

-- ----------------------------
-- Records of tz_pick_addr
-- ----------------------------
BEGIN;
INSERT INTO `tz_pick_addr` (`addr_id`, `addr_name`, `addr`, `mobile`, `province_id`, `province`, `city_id`, `city`, `area_id`, `area`, `shop_id`) VALUES (1, '测试', '大学城附近', '18888888888', 440000000000, '广东省', 440100000000, '广州市', 440113000000, '番禺区', 1);
COMMIT;

-- ----------------------------
-- Table structure for tz_prod
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod`;
CREATE TABLE `tz_prod` (
  `prod_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `prod_name` varchar(300) NOT NULL COMMENT '商品名称',
  `ori_price` decimal(15,2) DEFAULT '0.00' COMMENT '原价',
  `price` decimal(15,2) DEFAULT NULL COMMENT '现价',
  `cost_price` decimal(15,2) DEFAULT NULL COMMENT '成本价',
  `brief` varchar(500) DEFAULT NULL COMMENT '简要描述,卖点等',
  `content` text COMMENT '详细描述',
  `pic` varchar(255) DEFAULT NULL COMMENT '商品主图',
  `imgs` varchar(1000) DEFAULT NULL COMMENT '商品图片，以,分割',
  `category_id` bigint unsigned DEFAULT NULL COMMENT '商品分类',
  `sold_num` int DEFAULT NULL COMMENT '销量',
  `total_stocks` int DEFAULT '0' COMMENT '总库存',
  `return_num` int DEFAULT NULL COMMENT '退货数量',
  `delivery_template_id` bigint DEFAULT NULL COMMENT '运费模板id',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `putaway_time` datetime DEFAULT NULL COMMENT '上架时间',
  `version` int DEFAULT NULL COMMENT '版本 乐观锁',
  `content_img` text COMMENT '内容中的图片',
  `status` int NOT NULL DEFAULT '0' COMMENT '默认是1，表示正常状态, -1表示删除, 0下架',
  PRIMARY KEY (`prod_id`),
  KEY `prod_putaway_idx` (`putaway_time`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_prod
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod` (`prod_id`, `prod_name`, `ori_price`, `price`, `cost_price`, `brief`, `content`, `pic`, `imgs`, `category_id`, `sold_num`, `total_stocks`, `return_num`, `delivery_template_id`, `create_time`, `update_time`, `putaway_time`, `version`, `content_img`, `status`) VALUES (4, 'faded glory女士抓绒外套', 25.00, 25.00, NULL, '女士抓绒外套', 'faded glory女士抓绒外套', '/upload/prod_sku_img_4.jpg', '/upload/prod_sku_img_4.jpg,/upload/prod_sku_img_45.jpg', 85, 0, 1111, 0, 47, '2019-03-29 14:40:00.000000', '2024-10-14 10:01:58.966866', '2023-06-03 21:05:36', 89, '/upload/prod_sku_img_4.jpg,/upload/prod_sku_img_45.jpg', 1);
INSERT INTO `tz_prod` (`prod_id`, `prod_name`, `ori_price`, `price`, `cost_price`, `brief`, `content`, `pic`, `imgs`, `category_id`, `sold_num`, `total_stocks`, `return_num`, `delivery_template_id`, `create_time`, `update_time`, `putaway_time`, `version`, `content_img`, `status`) VALUES (5, '纯原小香风白色外套', 25.00, 25.00, NULL, '小香风白色外套', '纯原小香风白色外套', '/upload/prod_sku_img_10.jpg', '/upload/prod_sku_img_10.jpg,/upload/prod_sku_img_11.jpg', 85, 0, 1111, 0, 47, '2019-03-29 14:40:00.000000', '2024-10-14 10:02:00.400328', '2023-06-03 21:05:36', 89, '/upload/prod_sku_img_10.jpg,/upload/prod_sku_img_11.jpg', 1);
INSERT INTO `tz_prod` (`prod_id`, `prod_name`, `ori_price`, `price`, `cost_price`, `brief`, `content`, `pic`, `imgs`, `category_id`, `sold_num`, `total_stocks`, `return_num`, `delivery_template_id`, `create_time`, `update_time`, `putaway_time`, `version`, `content_img`, `status`) VALUES (6, '冬季羽绒服短款时尚大方', 25.00, 25.00, NULL, '冬季羽绒服', '冬季羽绒服短款时尚大方', '/upload/prod_sku_img_9.jpg', '/upload/prod_sku_img_9.jpg', 85, 0, 1111, 0, 47, '2019-03-29 14:40:00.000000', '2024-10-14 10:02:01.719523', '2023-06-03 21:05:36', 89, '/upload/prod_sku_img_9.jpg', 1);
INSERT INTO `tz_prod` (`prod_id`, `prod_name`, `ori_price`, `price`, `cost_price`, `brief`, `content`, `pic`, `imgs`, `category_id`, `sold_num`, `total_stocks`, `return_num`, `delivery_template_id`, `create_time`, `update_time`, `putaway_time`, `version`, `content_img`, `status`) VALUES (7, '男女同款骷髅图案黑色卫衣', 25.00, 25.00, NULL, '骷髅图案黑色卫衣', '男女同款骷髅图案黑色卫衣', '/upload/prod_sku_img_1.jpg', '/upload/prod_sku_img_1.jpg', 85, 0, 1111, 0, 47, '2019-03-29 14:40:00.000000', '2024-10-14 10:02:03.535669', '2023-06-03 21:05:36', 89, '/upload/prod_sku_img_1.jpg', 1);
INSERT INTO `tz_prod` (`prod_id`, `prod_name`, `ori_price`, `price`, `cost_price`, `brief`, `content`, `pic`, `imgs`, `category_id`, `sold_num`, `total_stocks`, `return_num`, `delivery_template_id`, `create_time`, `update_time`, `putaway_time`, `version`, `content_img`, `status`) VALUES (8, '冬季羽绒服长款时尚大方', 25.00, 25.00, NULL, '冬季羽绒服', '冬季羽绒服长款时尚大方', '/upload/prod_sku_img_6.jpg', '/upload/prod_sku_img_6.jpg', 85, 0, 1111, 0, 47, '2019-03-29 14:40:00.000000', '2024-10-14 10:01:57.624053', '2023-06-03 21:05:36', 89, '/upload/prod_sku_img_6.jpg', 1);
INSERT INTO `tz_prod` (`prod_id`, `prod_name`, `ori_price`, `price`, `cost_price`, `brief`, `content`, `pic`, `imgs`, `category_id`, `sold_num`, `total_stocks`, `return_num`, `delivery_template_id`, `create_time`, `update_time`, `putaway_time`, `version`, `content_img`, `status`) VALUES (9, '冬季迷彩色加绒卫裤', 25.00, 25.00, NULL, '迷彩色加绒卫裤', '冬季迷彩色加绒卫裤', '/upload/prod_sku_img_14.jpg', '/upload/prod_sku_img_14.jpg', 86, 0, 1111, 0, 47, '2019-03-29 14:40:00.000000', '2024-10-14 10:02:04.788040', '2023-06-03 21:05:36', 89, '/upload/prod_sku_img_14.jpg，/upload/prod_sku_img_15.jpg', 1);
INSERT INTO `tz_prod` (`prod_id`, `prod_name`, `ori_price`, `price`, `cost_price`, `brief`, `content`, `pic`, `imgs`, `category_id`, `sold_num`, `total_stocks`, `return_num`, `delivery_template_id`, `create_time`, `update_time`, `putaway_time`, `version`, `content_img`, `status`) VALUES (10, '女士背带牛仔裤', 25.00, 25.00, NULL, '背带牛仔裤', '背带牛仔裤', '/upload/prod_sku_img_16.jpg', '/upload/prod_sku_img_16.jpg', 86, 0, 1111, 0, 47, '2019-03-29 14:40:00.000000', '2024-10-14 10:02:06.905225', '2023-06-03 21:05:36', 89, '/upload/prod_sku_img_14.jpg，/upload/prod_sku_img_15.jpg', 1);
COMMIT;

-- ----------------------------
-- Table structure for tz_prod_attrvalue
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod_attrvalue`;
CREATE TABLE `tz_prod_attrvalue` (
  `attr_value_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attr_id` bigint DEFAULT NULL COMMENT '销售属性id',
  `attr_name` varchar(255) DEFAULT NULL COMMENT '销售属性名',
  `attr_value_name` varchar(255) DEFAULT NULL COMMENT '销售属性值\n',
  `prod_id` bigint unsigned DEFAULT NULL COMMENT '产品ID',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态(1为正常,0为删除)',
  `pic` varchar(255) DEFAULT NULL COMMENT '主属性对应的图片',
  PRIMARY KEY (`attr_value_id`),
  KEY `FK_aef59e2b7137e8fdd2244f43de8` (`prod_id`),
  CONSTRAINT `FK_aef59e2b7137e8fdd2244f43de8` FOREIGN KEY (`prod_id`) REFERENCES `tz_prod` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_prod_attrvalue
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (75, 101, '颜色', '蓝色', 4, '2024-01-25 11:15:52.164374', '2024-10-14 10:07:57.876587', 1, '/upload/prod_sku_img_4.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (76, 101, '颜色', '绿色', 4, '2024-01-25 11:15:52.192076', '2024-10-14 10:07:59.421518', 1, '/upload/prod_sku_img_4.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (77, 101, '颜色', '黑色', 4, '2024-01-25 11:15:52.195793', '2024-10-14 10:08:00.882679', 1, '/upload/prod_sku_img_4.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (78, 101, '颜色', '红色', 4, '2024-01-25 11:15:52.200192', '2024-10-14 10:08:02.250017', 1, '/upload/prod_sku_img_4.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (79, 102, '尺码', 'XL', 4, '2024-01-25 11:15:52.219409', '2024-10-14 10:08:03.804742', 1, '/upload/prod_sku_img_4.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (80, 102, '尺码', 'XXL', 4, '2024-01-25 11:15:52.224654', '2024-10-14 10:08:05.004728', 1, '/upload/prod_sku_img_4.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (81, 102, '尺码', 'L', 4, '2024-01-25 11:15:52.227923', '2024-10-14 10:08:16.940012', 1, '/upload/prod_sku_img_4.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (82, 101, '颜色', '蓝色', 5, '2024-01-25 11:15:52.164374', '2024-10-14 10:08:48.016210', 1, '/upload/prod_sku_img_10.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (83, 102, '尺码', 'XL', 5, '2024-01-25 11:15:52.164374', '2024-10-14 10:08:49.613987', 1, '/upload/prod_sku_img_10.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (84, 101, '颜色', '蓝色', 6, '2024-01-25 11:15:52.164374', '2024-10-14 10:08:52.899731', 1, '/upload/prod_sku_img_9.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (85, 102, '尺码', 'XL', 6, '2024-01-25 11:15:52.164374', '2024-10-14 10:09:01.396522', 1, '/upload/prod_sku_img_9.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (86, 101, '颜色', '蓝色', 7, '2024-01-25 11:15:52.164374', '2024-10-14 10:09:04.738475', 1, '/upload/prod_sku_img_1.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (87, 102, '尺码', 'XL', 7, '2024-01-25 11:15:52.164374', '2024-10-14 10:09:14.719486', 1, '/upload/prod_sku_img_1.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (88, 101, '颜色', '蓝色', 8, '2024-01-25 11:15:52.164374', '2024-10-14 10:09:16.959434', 1, '/upload/prod_sku_img_6.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (89, 102, '尺码', 'XL', 8, '2024-01-25 11:15:52.164374', '2024-10-14 10:09:18.480476', 1, '/upload/prod_sku_img_6.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (90, 101, '颜色', '蓝色', 9, '2024-01-25 11:15:52.164374', '2024-10-14 10:09:27.070444', 1, '/upload/prod_sku_img_14.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (91, 102, '尺码', 'XL', 9, '2024-01-25 11:15:52.164374', '2024-10-14 10:09:55.731738', 1, '/upload/prod_sku_img_14.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (92, 101, '颜色', '蓝色', 9, '2024-01-25 11:15:52.164374', '2024-10-14 10:09:57.831735', 1, '/upload/prod_sku_img_16.jpg');
INSERT INTO `tz_prod_attrvalue` (`attr_value_id`, `attr_id`, `attr_name`, `attr_value_name`, `prod_id`, `create_time`, `update_time`, `status`, `pic`) VALUES (93, 102, '尺码', 'XL', 9, '2024-01-25 11:15:52.164374', '2024-10-14 10:09:59.212818', 1, '/upload/prod_sku_img_16.jpg');
COMMIT;

-- ----------------------------
-- Table structure for tz_prod_cate_attr
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod_cate_attr`;
CREATE TABLE `tz_prod_cate_attr` (
  `attr_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned DEFAULT NULL COMMENT '类目ID',
  `attr_name` varchar(255) NOT NULL,
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态(1为正常,0为删除)',
  `is_main_attr` tinyint(1) DEFAULT '0' COMMENT '是否为主要属性(需要配图,且要求主属性的id必须最小)',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_prod_cate_attr
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod_cate_attr` (`attr_id`, `category_id`, `attr_name`, `create_time`, `update_time`, `status`, `is_main_attr`) VALUES (101, 85, '颜色', '2023-11-28 16:30:48.000000', '2024-01-12 11:23:01.885315', '1', 1);
INSERT INTO `tz_prod_cate_attr` (`attr_id`, `category_id`, `attr_name`, `create_time`, `update_time`, `status`, `is_main_attr`) VALUES (102, 85, '尺码', '2023-11-28 16:31:24.000000', '2024-01-12 11:23:03.931822', '1', 0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_prod_cate_reference
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod_cate_reference` (`category_id`, `prod_id`) VALUES (85, 4);
INSERT INTO `tz_prod_cate_reference` (`category_id`, `prod_id`) VALUES (85, 5);
INSERT INTO `tz_prod_cate_reference` (`category_id`, `prod_id`) VALUES (85, 6);
INSERT INTO `tz_prod_cate_reference` (`category_id`, `prod_id`) VALUES (85, 7);
INSERT INTO `tz_prod_cate_reference` (`category_id`, `prod_id`) VALUES (85, 8);
INSERT INTO `tz_prod_cate_reference` (`category_id`, `prod_id`) VALUES (85, 9);
COMMIT;

-- ----------------------------
-- Table structure for tz_prod_category
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod_category`;
CREATE TABLE `tz_prod_category` (
  `category_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint unsigned NOT NULL COMMENT '父节点',
  `category_name` varchar(50) NOT NULL COMMENT '产品类目名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '类目图标',
  `pic` varchar(300) DEFAULT NULL COMMENT '类目的显示图片',
  `seq` int NOT NULL COMMENT '排序',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态(1为正常,0为删除)',
  `rec_time` datetime NOT NULL COMMENT '记录时间',
  `grade` int NOT NULL COMMENT '分类层级',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `delete_time` datetime(6) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_prod_category
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod_category` (`category_id`, `parent_id`, `category_name`, `icon`, `pic`, `seq`, `status`, `rec_time`, `grade`, `create_time`, `update_time`, `delete_time`) VALUES (85, 0, '上装', NULL, '2019/04/4f148d81d60941b695cb77370a073653.jpg', 1, '1', '2019-04-21 17:28:32', 0, '2023-11-28 14:21:17.658926', '2023-12-05 09:18:37.113458', NULL);
INSERT INTO `tz_prod_category` (`category_id`, `parent_id`, `category_name`, `icon`, `pic`, `seq`, `status`, `rec_time`, `grade`, `create_time`, `update_time`, `delete_time`) VALUES (86, 0, '下装', NULL, '2019/04/4f148d81d60941b695cb77370a073653.jpg', 1, '1', '2019-04-21 17:28:32', 0, '2023-11-28 14:21:17.658926', '2024-04-24 00:56:34.246411', NULL);
INSERT INTO `tz_prod_category` (`category_id`, `parent_id`, `category_name`, `icon`, `pic`, `seq`, `status`, `rec_time`, `grade`, `create_time`, `update_time`, `delete_time`) VALUES (87, 0, '帽子', NULL, '2019/04/4f148d81d60941b695cb77370a073653.jpg', 1, '1', '2019-04-21 17:28:32', 0, '2023-11-28 14:21:17.658926', '2024-04-24 00:56:38.007347', NULL);
INSERT INTO `tz_prod_category` (`category_id`, `parent_id`, `category_name`, `icon`, `pic`, `seq`, `status`, `rec_time`, `grade`, `create_time`, `update_time`, `delete_time`) VALUES (88, 0, '饰品', NULL, '2019/04/4f148d81d60941b695cb77370a073653.jpg', 1, '1', '2019-04-21 17:28:32', 0, '2023-11-28 14:21:17.658926', '2024-04-24 00:56:48.246498', NULL);
INSERT INTO `tz_prod_category` (`category_id`, `parent_id`, `category_name`, `icon`, `pic`, `seq`, `status`, `rec_time`, `grade`, `create_time`, `update_time`, `delete_time`) VALUES (89, 0, '袜子', NULL, '2019/04/4f148d81d60941b695cb77370a073653.jpg', 1, '1', '2019-04-21 17:28:32', 0, '2023-11-28 14:21:17.658926', '2024-04-24 00:56:51.243296', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tz_prod_comment
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod_comment`;
CREATE TABLE `tz_prod_comment` (
  `prod_comm_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `prod_id` bigint unsigned NOT NULL COMMENT '商品ID',
  `order_item_id` bigint unsigned DEFAULT NULL COMMENT '订单项ID',
  `user_id` varchar(36) DEFAULT NULL COMMENT '评论用户ID',
  `content` varchar(500) DEFAULT '' COMMENT '评论内容',
  `reply_content` varchar(500) DEFAULT '' COMMENT '掌柜回复',
  `rec_time` datetime DEFAULT NULL COMMENT '记录时间',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `reply_sts` int DEFAULT '0' COMMENT '是否回复 0:未回复  1:已回复',
  `postip` varchar(16) DEFAULT NULL COMMENT 'IP来源',
  `score` tinyint DEFAULT '0' COMMENT '得分，0-5分',
  `useful_counts` int DEFAULT '0' COMMENT '有用的计数',
  `pics` varchar(1000) DEFAULT NULL COMMENT '晒图的json字符串',
  `is_anonymous` int DEFAULT '0' COMMENT '是否匿名(1:是  0:否)',
  `status` int DEFAULT NULL COMMENT '是否显示，1:为显示，0:待审核， -1：不通过审核，不显示。 如果需要审核评论，则是0,，否则1',
  `evaluate` tinyint DEFAULT NULL COMMENT '评价(0好评 1中评 2差评)',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `prod_attr_desc` varchar(100) DEFAULT NULL COMMENT '商品属性描述',
  `avatar_url` varchar(100) DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`prod_comm_id`),
  KEY `prod_id` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='商品评论';

-- ----------------------------
-- Records of tz_prod_comment
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod_comment` (`prod_comm_id`, `prod_id`, `order_item_id`, `user_id`, `content`, `reply_content`, `rec_time`, `reply_time`, `reply_sts`, `postip`, `score`, `useful_counts`, `pics`, `is_anonymous`, `status`, `evaluate`, `nick_name`, `prod_attr_desc`, `avatar_url`) VALUES (1, 4, 1, '1', '太傻逼了哈哈哈哈哈哈哈哈哈', '', '2024-04-24 19:18:57', '2024-04-24 19:18:59', 0, NULL, 0, 2, NULL, 1, 1, NULL, 'hz', '颜色:灰色;尺码:L', NULL);
INSERT INTO `tz_prod_comment` (`prod_comm_id`, `prod_id`, `order_item_id`, `user_id`, `content`, `reply_content`, `rec_time`, `reply_time`, `reply_sts`, `postip`, `score`, `useful_counts`, `pics`, `is_anonymous`, `status`, `evaluate`, `nick_name`, `prod_attr_desc`, `avatar_url`) VALUES (2, 4, 1, '1', '太2傻逼了哈哈哈哈哈哈哈哈哈', '', '2024-04-24 19:18:57', '2024-04-24 19:18:59', 0, NULL, 0, 2, NULL, 0, 1, NULL, '挖大锤', '颜色:灰色;尺码:L', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tz_prod_favorite
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod_favorite`;
CREATE TABLE `tz_prod_favorite` (
  `favorite_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `prod_id` bigint unsigned NOT NULL COMMENT '商品ID',
  `rec_time` datetime NOT NULL COMMENT '收藏时间',
  `user_id` varchar(36) NOT NULL DEFAULT '' COMMENT '用户ID',
  PRIMARY KEY (`favorite_id`),
  KEY `prod_id` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='商品收藏表';

-- ----------------------------
-- Records of tz_prod_favorite
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tz_prod_prop
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod_prop`;
CREATE TABLE `tz_prod_prop` (
  `prop_id` bigint NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `prop_name` varchar(20) DEFAULT NULL COMMENT '属性名称',
  `rule` tinyint DEFAULT NULL COMMENT 'ProdPropRule 1:销售属性(规格); 2:参数属性;',
  `shop_id` bigint DEFAULT NULL COMMENT '店铺id',
  PRIMARY KEY (`prop_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_prod_prop
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod_prop` (`prop_id`, `prop_name`, `rule`, `shop_id`) VALUES (80, '内存', 1, 1);
INSERT INTO `tz_prod_prop` (`prop_id`, `prop_name`, `rule`, `shop_id`) VALUES (81, '颜色', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for tz_prod_prop_value
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod_prop_value`;
CREATE TABLE `tz_prod_prop_value` (
  `value_id` bigint NOT NULL AUTO_INCREMENT COMMENT '属性值ID',
  `prop_value` varchar(20) DEFAULT NULL COMMENT '属性值名称',
  `prop_id` bigint DEFAULT NULL COMMENT '属性ID',
  PRIMARY KEY (`value_id`),
  KEY `prop_id` (`prop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_prod_prop_value
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod_prop_value` (`value_id`, `prop_value`, `prop_id`) VALUES (381, '32G', 80);
INSERT INTO `tz_prod_prop_value` (`value_id`, `prop_value`, `prop_id`) VALUES (382, '64G', 80);
INSERT INTO `tz_prod_prop_value` (`value_id`, `prop_value`, `prop_id`) VALUES (383, '128G', 80);
INSERT INTO `tz_prod_prop_value` (`value_id`, `prop_value`, `prop_id`) VALUES (384, '红', 81);
INSERT INTO `tz_prod_prop_value` (`value_id`, `prop_value`, `prop_id`) VALUES (385, '黄', 81);
INSERT INTO `tz_prod_prop_value` (`value_id`, `prop_value`, `prop_id`) VALUES (386, '蓝', 81);
COMMIT;

-- ----------------------------
-- Table structure for tz_prod_tag
-- ----------------------------
DROP TABLE IF EXISTS `tz_prod_tag`;
CREATE TABLE `tz_prod_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分组标签id',
  `title` varchar(36) DEFAULT NULL COMMENT '分组标题',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '默认类型(0:商家自定义,1:系统默认)',
  `prod_count` bigint DEFAULT NULL COMMENT '商品数量',
  `style` int DEFAULT NULL COMMENT '列表样式(0:一列一个,1:一列两个,2:一列三个)',
  `seq` int DEFAULT NULL COMMENT '排序',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `delete_time` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态(1为正常,0为删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_prod_tag
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod_tag` (`id`, `title`, `is_default`, `prod_count`, `style`, `seq`, `create_time`, `update_time`, `delete_time`, `status`) VALUES (1, '每日上新', 0, 0, 2, 3, '2019-04-18 14:27:02.000000', '2019-04-18 14:27:06.000000', NULL, '1');
INSERT INTO `tz_prod_tag` (`id`, `title`, `is_default`, `prod_count`, `style`, `seq`, `create_time`, `update_time`, `delete_time`, `status`) VALUES (2, '商城热卖', 0, 0, 1, 2, '2019-04-18 14:27:27.000000', '2019-04-18 14:27:30.000000', NULL, '1');
INSERT INTO `tz_prod_tag` (`id`, `title`, `is_default`, `prod_count`, `style`, `seq`, `create_time`, `update_time`, `delete_time`, `status`) VALUES (3, '更多宝贝', 1, 0, 0, 1, '2019-04-18 10:07:17.000000', '2019-04-18 10:07:17.000000', NULL, '1');
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
  CONSTRAINT `FK_42478dfcb513226dc19b76589f4` FOREIGN KEY (`prod_id`) REFERENCES `tz_prod` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_prod_tag_reference
-- ----------------------------
BEGIN;
INSERT INTO `tz_prod_tag_reference` (`tag_id`, `prod_id`) VALUES (1, 4);
INSERT INTO `tz_prod_tag_reference` (`tag_id`, `prod_id`) VALUES (1, 5);
INSERT INTO `tz_prod_tag_reference` (`tag_id`, `prod_id`) VALUES (1, 6);
INSERT INTO `tz_prod_tag_reference` (`tag_id`, `prod_id`) VALUES (1, 7);
INSERT INTO `tz_prod_tag_reference` (`tag_id`, `prod_id`) VALUES (1, 8);
INSERT INTO `tz_prod_tag_reference` (`tag_id`, `prod_id`) VALUES (1, 9);
INSERT INTO `tz_prod_tag_reference` (`tag_id`, `prod_id`) VALUES (2, 4);
INSERT INTO `tz_prod_tag_reference` (`tag_id`, `prod_id`) VALUES (3, 4);
COMMIT;

-- ----------------------------
-- Table structure for tz_seller_addr
-- ----------------------------
DROP TABLE IF EXISTS `tz_seller_addr`;
CREATE TABLE `tz_seller_addr` (
  `seller_addr_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `receiver` varchar(50) DEFAULT NULL COMMENT '收货人',
  `province_id` bigint DEFAULT NULL COMMENT '省ID',
  `province` varchar(100) DEFAULT NULL COMMENT '省',
  `area_id` bigint DEFAULT NULL COMMENT '区域ID',
  `area` varchar(20) DEFAULT NULL COMMENT '区',
  `city_id` bigint DEFAULT NULL COMMENT '城市ID',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `addr` varchar(1000) DEFAULT NULL COMMENT '地址',
  `post_code` varchar(15) DEFAULT NULL COMMENT '邮编',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `create_time` datetime NOT NULL COMMENT '建立时间',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `status` int DEFAULT NULL COMMENT '1:使用 0:禁用',
  `default_consign_addr` tinyint NOT NULL DEFAULT '1' COMMENT '默认发货地址',
  `default_return_addr` tinyint NOT NULL DEFAULT '1' COMMENT '默认收货地址',
  PRIMARY KEY (`seller_addr_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='用户订单配送地址';

-- ----------------------------
-- Records of tz_seller_addr
-- ----------------------------
BEGIN;
INSERT INTO `tz_seller_addr` (`seller_addr_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`, `status`, `default_consign_addr`, `default_return_addr`) VALUES (1, '小丽', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '小关东里', '100054', '15000000000', '2019-07-01 18:07:11', 0, 1, 0, 1);
INSERT INTO `tz_seller_addr` (`seller_addr_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`, `status`, `default_consign_addr`, `default_return_addr`) VALUES (2, 'user', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '惠新东街', NULL, '15000000000', '2019-07-03 17:13:06', 0, 1, 1, 0);
INSERT INTO `tz_seller_addr` (`seller_addr_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`, `status`, `default_consign_addr`, `default_return_addr`) VALUES (3, 'user', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '清河', NULL, '15000000000', '2019-07-03 17:15:41', 0, 1, 0, 0);
INSERT INTO `tz_seller_addr` (`seller_addr_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`, `status`, `default_consign_addr`, `default_return_addr`) VALUES (5, 'user', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '大兴', NULL, '15000000000', '2019-07-03 17:16:36', 0, 1, 0, 0);
INSERT INTO `tz_seller_addr` (`seller_addr_id`, `receiver`, `province_id`, `province`, `area_id`, `area`, `city_id`, `city`, `addr`, `post_code`, `mobile`, `create_time`, `version`, `status`, `default_consign_addr`, `default_return_addr`) VALUES (6, 'user', 110000000000, '北京市', 110101000000, '东城区', 110100000000, '市辖区', '天通苑', NULL, '15000000000', '2019-07-03 17:17:56', 0, 1, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for tz_shop_detail
-- ----------------------------
DROP TABLE IF EXISTS `tz_shop_detail`;
CREATE TABLE `tz_shop_detail` (
  `shop_id` bigint NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `shop_name` varchar(50) DEFAULT NULL COMMENT '店铺名称(数字、中文，英文(可混合，不可有特殊字符)，可修改)、不唯一',
  `user_id` varchar(36) DEFAULT NULL COMMENT '店长用户id',
  `shop_type` tinyint DEFAULT NULL COMMENT '店铺类型',
  `intro` varchar(200) DEFAULT NULL COMMENT '店铺简介(可修改)',
  `shop_notice` varchar(50) DEFAULT NULL COMMENT '店铺公告(可修改)',
  `shop_industry` tinyint DEFAULT NULL COMMENT '店铺行业(餐饮、生鲜果蔬、鲜花等)',
  `shop_owner` varchar(20) DEFAULT NULL COMMENT '店长',
  `mobile` varchar(20) DEFAULT NULL COMMENT '店铺绑定的手机(登录账号：唯一)',
  `tel` varchar(20) DEFAULT NULL COMMENT '店铺联系电话',
  `shop_lat` varchar(20) DEFAULT NULL COMMENT '店铺所在纬度(可修改)',
  `shop_lng` varchar(20) DEFAULT NULL COMMENT '店铺所在经度(可修改)',
  `shop_address` varchar(100) DEFAULT NULL COMMENT '店铺详细地址',
  `province` varchar(10) DEFAULT NULL COMMENT '店铺所在省份（描述）',
  `city` varchar(10) DEFAULT NULL COMMENT '店铺所在城市（描述）',
  `area` varchar(10) DEFAULT NULL COMMENT '店铺所在区域（描述）',
  `pca_code` varchar(20) DEFAULT NULL COMMENT '店铺省市区代码，用于回显',
  `shop_logo` varchar(200) DEFAULT NULL COMMENT '店铺logo(可修改)',
  `shop_photos` varchar(1000) DEFAULT NULL COMMENT '店铺相册',
  `open_time` varchar(100) DEFAULT NULL COMMENT '每天营业时间段(可修改)',
  `shop_status` tinyint DEFAULT NULL COMMENT '店铺状态(-1:未开通 0: 停业中 1:营业中)，可修改',
  `transport_type` tinyint DEFAULT NULL COMMENT '0:商家承担运费; 1:买家承担运费',
  `fixed_freight` decimal(15,2) DEFAULT NULL COMMENT '固定运费',
  `full_free_shipping` decimal(15,2) DEFAULT NULL COMMENT '满X包邮',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_distribution` tinyint DEFAULT NULL COMMENT '分销开关(0:开启 1:关闭)',
  PRIMARY KEY (`shop_id`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `shop_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tz_shop_detail
-- ----------------------------
BEGIN;
INSERT INTO `tz_shop_detail` (`shop_id`, `shop_name`, `user_id`, `shop_type`, `intro`, `shop_notice`, `shop_industry`, `shop_owner`, `mobile`, `tel`, `shop_lat`, `shop_lng`, `shop_address`, `province`, `city`, `area`, `pca_code`, `shop_logo`, `shop_photos`, `open_time`, `shop_status`, `transport_type`, `fixed_freight`, `full_free_shipping`, `create_time`, `update_time`, `is_distribution`) VALUES (1, 'mall4j小店1', NULL, NULL, 'mall4j小店 爱你哟', NULL, NULL, NULL, NULL, '020-123456', NULL, NULL, '大学城北', '广东省', '广州市', '番禺区', '44/4401/440113', '2018/08/78a6a63cf02d4965912bc5047f49afa0.jpg', '2018/08/c7a50f443a85462d8129d83cf0f7eb91.jpg,2018/08/79791fc749444ef1ab4d2ca56fe9363f.jpg', '00:00:00 - 00:20:00', 1, NULL, NULL, NULL, '2018-08-30 11:10:05', NULL, 1);
INSERT INTO `tz_shop_detail` (`shop_id`, `shop_name`, `user_id`, `shop_type`, `intro`, `shop_notice`, `shop_industry`, `shop_owner`, `mobile`, `tel`, `shop_lat`, `shop_lng`, `shop_address`, `province`, `city`, `area`, `pca_code`, `shop_logo`, `shop_photos`, `open_time`, `shop_status`, `transport_type`, `fixed_freight`, `full_free_shipping`, `create_time`, `update_time`, `is_distribution`) VALUES (2, 'mall4j大店2', NULL, NULL, 'mall4j大店 店大大', NULL, NULL, NULL, NULL, '010-123456', NULL, NULL, '天安门哟', '北京市', '市辖区', '东城区', '11/1101/110101', '2018/08/0907446e05c44431be5d27ec7c277ee6.jpg', '2018/08/5f97fc62c18d4d2292f8101fa0291e85.jpg', '06:00:00 - 00:00:00', 1, NULL, NULL, NULL, '2018-08-31 10:16:06', NULL, NULL);
INSERT INTO `tz_shop_detail` (`shop_id`, `shop_name`, `user_id`, `shop_type`, `intro`, `shop_notice`, `shop_industry`, `shop_owner`, `mobile`, `tel`, `shop_lat`, `shop_lng`, `shop_address`, `province`, `city`, `area`, `pca_code`, `shop_logo`, `shop_photos`, `open_time`, `shop_status`, `transport_type`, `fixed_freight`, `full_free_shipping`, `create_time`, `update_time`, `is_distribution`) VALUES (3, 'mall4j3', NULL, NULL, 'mall4j 店铺描述', NULL, NULL, NULL, NULL, '010-211111111', NULL, NULL, '大学城北', '天津市', '市辖区', '和平区', '12/1201/120101', '2018/09/4bb8b326f85a4c6aad251c561a17f0c4.png', '2018/09/63c3d47beb5544f9b30103721002ca2e.jpg,2018/09/899e1ebf3c6c467d8d8630a3c18720db.jpg', '00:02:00 - 00:00:00', 1, NULL, NULL, NULL, '2018-09-06 18:50:00', '2018-09-29 09:50:05', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tz_shopcart_item
-- ----------------------------
DROP TABLE IF EXISTS `tz_shopcart_item`;
CREATE TABLE `tz_shopcart_item` (
  `shopcart_item_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sku_id` bigint unsigned NOT NULL COMMENT 'sku_id',
  `prod_id` bigint unsigned NOT NULL COMMENT '产品ID',
  `user_id` varchar(50) NOT NULL COMMENT '用户ID',
  `item_count` int NOT NULL DEFAULT '0' COMMENT '购物车产品个数',
  `add_date` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '购物时间',
  `is_checked` tinyint DEFAULT NULL COMMENT '是否选中： 1为选中，0为没有选中',
  `is_valid` tinyint DEFAULT NULL COMMENT '是否有效： 1为有效,0为无效',
  PRIMARY KEY (`shopcart_item_id`),
  UNIQUE KEY `uk_user_shop_sku` (`sku_id`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `FK_c8de2345a3ad0ef8b46e19f3bc0` (`prod_id`),
  KEY `sku_id` (`sku_id`) USING BTREE,
  CONSTRAINT `FK_734b7c269f309b1dad753397a06` FOREIGN KEY (`sku_id`) REFERENCES `tz_sku` (`sku_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_c8de2345a3ad0ef8b46e19f3bc0` FOREIGN KEY (`prod_id`) REFERENCES `tz_prod` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_shopcart_item
-- ----------------------------
BEGIN;
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
  `pic` varchar(500) DEFAULT NULL COMMENT 'sku图片',
  `sku_name` varchar(120) DEFAULT NULL COMMENT 'sku名称',
  `prod_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态(1为启用,0为禁用)',
  `is_delete` int NOT NULL DEFAULT '0' COMMENT '状态(1为已删除,0为未删除)',
  `attr` varchar(100) DEFAULT NULL COMMENT '所有销售属性值的json串,sku的属性值组合一定是按照属性名的id从小到大排列的',
  `category_id` bigint DEFAULT NULL COMMENT '商品分类ID',
  PRIMARY KEY (`sku_id`),
  KEY `prod_id` (`prod_id`),
  CONSTRAINT `FK_44e012a4eff46ee595eaadfd34d` FOREIGN KEY (`prod_id`) REFERENCES `tz_prod` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_sku
-- ----------------------------
BEGIN;
INSERT INTO `tz_sku` (`sku_id`, `prod_id`, `ori_price`, `price`, `stocks`, `actual_stocks`, `create_time`, `update_time`, `pic`, `sku_name`, `prod_name`, `version`, `status`, `is_delete`, `attr`, `category_id`) VALUES (223, 4, 25.00, 25.00, 76, 5, '2024-01-25 11:15:52.232037', '2024-10-14 09:51:31.119394', '/upload/prod_sku_img_4.jpg', '蓝色 XL', 'faded glory女士抓绒外套 蓝色 XL', 0, 1, 0, '[\"75\",\"79\"]', 85);
INSERT INTO `tz_sku` (`sku_id`, `prod_id`, `ori_price`, `price`, `stocks`, `actual_stocks`, `create_time`, `update_time`, `pic`, `sku_name`, `prod_name`, `version`, `status`, `is_delete`, `attr`, `category_id`) VALUES (224, 4, 25.00, 25.00, 49, 6, '2024-01-25 11:15:52.237090', '2024-10-14 09:51:33.535077', '/upload/prod_sku_img_4.jpg', '蓝色 XXL', 'faded glory女士抓绒外套 蓝色 XXL', 0, 1, 0, '[\"75\",\"80\"]', 85);
INSERT INTO `tz_sku` (`sku_id`, `prod_id`, `ori_price`, `price`, `stocks`, `actual_stocks`, `create_time`, `update_time`, `pic`, `sku_name`, `prod_name`, `version`, `status`, `is_delete`, `attr`, `category_id`) VALUES (225, 4, 10999.00, 10999.00, 104, 3, '2024-01-25 11:15:52.244055', '2024-10-14 09:51:36.007856', '/upload/prod_sku_img_4.jpg', '蓝色 L', 'faded glory女士抓绒外套 蓝色 L', 0, 1, 0, '[\"75\",\"81\"]', 85);
INSERT INTO `tz_sku` (`sku_id`, `prod_id`, `ori_price`, `price`, `stocks`, `actual_stocks`, `create_time`, `update_time`, `pic`, `sku_name`, `prod_name`, `version`, `status`, `is_delete`, `attr`, `category_id`) VALUES (226, 5, 25.00, 25.00, 1111, 1111, '2024-01-25 11:15:52.247873', '2024-10-14 09:51:55.204493', '/upload/prod_sku_img_10.jpg', '蓝色 XL', '纯原小香风白色外套 蓝色 XL', 0, 1, 0, '[\"82\",\"83\"]', 85);
INSERT INTO `tz_sku` (`sku_id`, `prod_id`, `ori_price`, `price`, `stocks`, `actual_stocks`, `create_time`, `update_time`, `pic`, `sku_name`, `prod_name`, `version`, `status`, `is_delete`, `attr`, `category_id`) VALUES (227, 6, 25.00, 25.00, 1111, 1111, '2024-01-25 11:15:52.250187', '2024-10-14 09:52:14.241124', '/upload/prod_sku_img_9.jpg', '绿色 XXL', '冬季羽绒服短款时尚大方 绿色 XXL', 0, 1, 0, '[\"84\",\"85\"]', 85);
INSERT INTO `tz_sku` (`sku_id`, `prod_id`, `ori_price`, `price`, `stocks`, `actual_stocks`, `create_time`, `update_time`, `pic`, `sku_name`, `prod_name`, `version`, `status`, `is_delete`, `attr`, `category_id`) VALUES (228, 7, 25.00, 25.00, 1111, 1111, '2024-01-25 11:15:52.253077', '2024-10-14 09:52:22.429013', '/upload/prod_sku_img_1.jpg', '绿色 L', '男女同款骷髅图案黑色卫衣 绿色 L', 0, 1, 0, '[\"86\",\"87\"]', 85);
INSERT INTO `tz_sku` (`sku_id`, `prod_id`, `ori_price`, `price`, `stocks`, `actual_stocks`, `create_time`, `update_time`, `pic`, `sku_name`, `prod_name`, `version`, `status`, `is_delete`, `attr`, `category_id`) VALUES (229, 8, 25.00, 25.00, 1111, 1111, '2024-01-25 11:15:52.255646', '2024-10-14 09:52:28.833871', '/upload/prod_sku_img_6.jpg', '黑色 XL', '李维斯xxxl冬季羽绒服长款时尚大方 黑色 XL', 0, 1, 0, '[\"88\",\"89\"]', 85);
INSERT INTO `tz_sku` (`sku_id`, `prod_id`, `ori_price`, `price`, `stocks`, `actual_stocks`, `create_time`, `update_time`, `pic`, `sku_name`, `prod_name`, `version`, `status`, `is_delete`, `attr`, `category_id`) VALUES (230, 9, 25.00, 25.00, 1111, 1111, '2024-01-25 11:15:52.257736', '2024-10-14 10:03:10.783199', '/upload/prod_sku_img_14.jpg', '黑色 XXL', '冬季加绒卫裤 黑色 XXL', 0, 1, 0, '[\"90\",\"91\"]', 86);
INSERT INTO `tz_sku` (`sku_id`, `prod_id`, `ori_price`, `price`, `stocks`, `actual_stocks`, `create_time`, `update_time`, `pic`, `sku_name`, `prod_name`, `version`, `status`, `is_delete`, `attr`, `category_id`) VALUES (231, 4, 25.00, 25.00, 1111, 1111, '2024-01-25 11:15:52.260667', '2024-10-14 09:51:38.099464', '/upload/prod_sku_img_4.jpg', '黑色 L', 'faded glory女士抓绒外套 黑色 L', 0, 1, 0, '[\"77\",\"81\"]', 85);
INSERT INTO `tz_sku` (`sku_id`, `prod_id`, `ori_price`, `price`, `stocks`, `actual_stocks`, `create_time`, `update_time`, `pic`, `sku_name`, `prod_name`, `version`, `status`, `is_delete`, `attr`, `category_id`) VALUES (232, 4, 25.00, 25.00, 1111, 1111, '2024-01-25 11:15:52.264833', '2024-10-14 09:51:40.353171', '/upload/prod_sku_img_4.jpg', '红色 XL', 'faded glory女士抓绒外套 红色 XL', 0, 1, 0, '[\"78\",\"79\"]', 85);
INSERT INTO `tz_sku` (`sku_id`, `prod_id`, `ori_price`, `price`, `stocks`, `actual_stocks`, `create_time`, `update_time`, `pic`, `sku_name`, `prod_name`, `version`, `status`, `is_delete`, `attr`, `category_id`) VALUES (233, 4, 25.00, 25.00, 1111, 1111, '2024-01-25 11:15:52.266994', '2024-10-14 09:51:42.311434', '/upload/prod_sku_img_4.jpg', '红色 XXL', 'faded glory女士抓绒外套 红色 XXL', 0, 1, 0, '[\"78\",\"80\"]', 85);
INSERT INTO `tz_sku` (`sku_id`, `prod_id`, `ori_price`, `price`, `stocks`, `actual_stocks`, `create_time`, `update_time`, `pic`, `sku_name`, `prod_name`, `version`, `status`, `is_delete`, `attr`, `category_id`) VALUES (234, 4, 25.00, 25.00, 1111, 1111, '2024-01-25 11:15:52.270868', '2024-10-14 09:51:44.129715', '/upload/prod_sku_img_4.jpg', '红色 L', 'faded glory女士抓绒外套红色 L', 0, 1, 0, '[\"78\",\"81\"]', 85);
INSERT INTO `tz_sku` (`sku_id`, `prod_id`, `ori_price`, `price`, `stocks`, `actual_stocks`, `create_time`, `update_time`, `pic`, `sku_name`, `prod_name`, `version`, `status`, `is_delete`, `attr`, `category_id`) VALUES (235, 10, 25.00, 25.00, 1111, 1111, '2024-01-25 11:15:52.257736', '2024-10-14 10:09:47.956307', '/upload/prod_sku_img_16.jpg', '黑色 XXL', '女士背带牛仔裤', 0, 1, 0, '[\"92\",\"93\"]', 86);
COMMIT;

-- ----------------------------
-- Table structure for tz_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `tz_sms_log`;
CREATE TABLE `tz_sms_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  `user_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `content` varchar(100) NOT NULL DEFAULT '' COMMENT '短信内容',
  `mobile_code` varchar(50) NOT NULL DEFAULT '' COMMENT '手机验证码',
  `type` int NOT NULL DEFAULT '0' COMMENT '短信类型  1:注册  2:验证',
  `rec_date` datetime NOT NULL COMMENT '发送时间',
  `response_code` varchar(50) DEFAULT NULL COMMENT '发送短信返回码',
  `status` int NOT NULL DEFAULT '0' COMMENT '状态  1:有效  0：失效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COMMENT='短信记录表';

-- ----------------------------
-- Records of tz_sms_log
-- ----------------------------
BEGIN;
INSERT INTO `tz_sms_log` (`id`, `user_id`, `user_phone`, `content`, `mobile_code`, `type`, `rec_date`, `response_code`, `status`) VALUES (15, '25477c53-6f67-4309-9e10-a26876ebfddb', '13726236870', '感谢您对xxx的支持。您的验证码是129619，请勿把验证码泄漏给第三方。', '129619', 0, '2019-04-24 11:20:29', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for tz_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `tz_sys_config`;
CREATE TABLE `tz_sys_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`param_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of tz_sys_config
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tz_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `tz_sys_log`;
CREATE TABLE `tz_sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=843 DEFAULT CHARSET=utf8mb3 COMMENT='系统日志';

-- ----------------------------
-- Records of tz_sys_log
-- ----------------------------
BEGIN;
INSERT INTO `tz_sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (831, 'admin', '删除菜单', 'com.yami.shop.sys.controller.SysMenuController.delete()', '168', 8, '127.0.0.1', '2019-06-26 14:04:22');
INSERT INTO `tz_sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (832, 'admin', '删除菜单', 'com.yami.shop.sys.controller.SysMenuController.delete()', '229', 1, '127.0.0.1', '2019-06-26 14:31:31');
INSERT INTO `tz_sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (833, 'admin', '删除菜单', 'com.yami.shop.sys.controller.SysMenuController.delete()', '231', 6, '127.0.0.1', '2019-06-26 14:31:37');
INSERT INTO `tz_sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (834, 'admin', '删除菜单', 'com.yami.shop.sys.controller.SysMenuController.delete()', '232', 8, '127.0.0.1', '2019-06-26 14:31:38');
INSERT INTO `tz_sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (835, 'admin', '删除菜单', 'com.yami.shop.sys.controller.SysMenuController.delete()', '233', 25, '127.0.0.1', '2019-06-26 14:31:42');
INSERT INTO `tz_sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (836, 'admin', '删除菜单', 'com.yami.shop.sys.controller.SysMenuController.delete()', '229', 6, '127.0.0.1', '2019-06-26 14:31:46');
INSERT INTO `tz_sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (837, 'admin', '删除分类', 'com.yami.shop.admin.controller.CategoryController.delete()', '92', 536, '127.0.0.1', '2019-07-01 11:14:38');
INSERT INTO `tz_sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (838, 'admin', '保存角色', 'com.yami.shop.sys.controller.SysRoleController.save()', '{\"roleId\":1,\"roleName\":\"管理员\",\"remark\":\"测试\",\"menuIdList\":[34,70,71,72,73,74,75,136,137,138,139,140,239,240,241,242,243,306,307,308,309,310,51,57,58,59,60,63,300,301,302,303,305,131,132,133,134,135,163,164,165,166,167,174,175,176,177,178,201,202,203,204,205,206,125,126,127,128,129,130,230,91,92,93,99,100,101,107,108,146,184,185,1,312,313,314,315,316,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,6,7,8,9,10,11,12,13,14,27,29,-666666],\"createTime\":\"2019-07-03T00:39:49.339+0000\"}', 106, '127.0.0.1', '2019-07-03 08:39:49');
INSERT INTO `tz_sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (839, 'admin', '保存配置', 'com.yami.shop.sys.controller.SysConfigController.save()', '{\"id\":1,\"paramKey\":\"测试\",\"paramValue\":\"1\",\"remark\":\"1\"}', 17, '127.0.0.1', '2019-07-03 08:57:59');
INSERT INTO `tz_sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (840, 'admin', '删除配置', 'com.yami.shop.sys.controller.SysConfigController.delete()', '[1]', 18, '127.0.0.1', '2019-07-03 08:58:20');
INSERT INTO `tz_sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (841, 'admin', '新增公告管理', 'com.yami.shop.admin.controller.NoticeController.save()', '{\"id\":4,\"shopId\":1,\"title\":\"测试\",\"content\":\"<p>1111</p>\",\"status\":1,\"isTop\":1,\"publishTime\":\"2019-07-03T02:05:55.730+0000\",\"updateTime\":\"2019-07-03T02:05:55.730+0000\"}', 26, '127.0.0.1', '2019-07-03 10:05:56');
INSERT INTO `tz_sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (842, 'admin', '删除公告管理', 'com.yami.shop.admin.controller.NoticeController.removeById()', '4', 37, '127.0.0.1', '2019-07-03 20:00:24');
COMMIT;

-- ----------------------------
-- Table structure for tz_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `tz_sys_menu`;
CREATE TABLE `tz_sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8mb3 COMMENT='菜单管理';

-- ----------------------------
-- Records of tz_sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (1, 0, '系统管理', '', '', 0, 'system', 3);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (2, 1, '管理员列表', 'sys/user', '', 1, 'admin', 1);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (3, 1, '角色管理', 'sys/role', '', 1, 'role', 2);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (4, 1, '菜单管理', 'sys/menu', '', 1, 'menu', 3);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (15, 2, '查看', NULL, 'sys:user:page,sys:user:info', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (16, 2, '新增', '', 'sys:user:save,sys:role:list', 2, '', 1);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (17, 2, '修改', '', 'sys:user:update,sys:role:list', 2, '', 2);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (18, 2, '删除', '', 'sys:user:delete', 2, '', 3);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (19, 3, '查看', NULL, 'sys:role:page,sys:role:info', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:page,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:page', 1, 'log', 7);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (34, 0, '产品管理', '', '', 0, 'admin', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (51, 34, '规格管理', 'prod/spec', '', 1, '', 2);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (57, 51, '查看', '', 'prod:spec:page', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (58, 51, '添加', '', 'prod:spec:save', 2, '', 1);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (59, 51, '修改', '', 'prod:spec:update,prod:spec:info', 2, '', 2);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (60, 51, '删除', '', 'prod:spec:delete', 2, '', 3);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (63, 0, '门店管理', '', '', 0, 'store', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (70, 34, '产品管理', 'prod/prodList', '', 1, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (71, 70, '产品管理', '', 'prod:prod:page', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (72, 70, '查看产品', '', 'prod:prod:info', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (73, 70, '新增产品', '', 'prod:prod:save', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (74, 70, '修改产品', '', 'prod:prod:update', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (75, 70, '删除产品', '', 'prod:prod:delete', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (91, 0, '订单管理', '', '', 0, 'order', 2);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (92, 91, '订单管理', 'order/order', '', 1, NULL, 1);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (93, 92, '查看', '', 'order:order:page', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (99, 92, '保存', '', 'order:order:save', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (100, 92, '修改', '', 'order:order:update', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (101, 92, '删除', '', 'order:order:delete', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (107, 92, '详情', '', 'order:order:info', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (108, 92, '支付', '', 'order:order:pay', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (125, 0, '会员管理', '', '', 0, 'vip', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (126, 125, '会员管理', 'user/user', '', 1, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (127, 126, '查看', '', 'admin:user:page', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (128, 126, '新增', '', 'admin:user:save', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (129, 126, '修改', '', 'admin:user:update,admin:user:info', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (130, 126, '删除', '', 'admin:user:delete', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (131, 63, '自提点管理', 'shop/pickAddr', '', 1, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (132, 131, '查看', '', 'shop:pickAddr:page', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (133, 131, '保存', '', 'shop:pickAddr:save', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (134, 131, '修改', '', 'shop:pickAddr:update,shop:pickAddr:info', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (135, 131, '删除', '', 'shop:pickAddr:delete', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (136, 34, '分类管理', 'prod/category', '', 1, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (137, 136, '查看', '', 'prod:category:page', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (138, 136, '新增', '', 'prod:category:save', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (139, 136, '修改', '', 'prod:category:info,prod:category:update', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (140, 136, '删除', '', 'prod:category:delete', 2, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (146, 92, '发货', '', 'order:order:delivery', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (163, 63, '运费模板', 'shop/transport', '', 1, NULL, 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (164, 163, '查看', '', 'shop:transport:page,shop:shopDetail:info,shop:transfee:info,admin:area:page,shop:transcity:info', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (165, 163, '修改', '', 'shop:transport:update,shop:transport:info,shop:transfee:update,admin:area:page', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (166, 163, '新增', '', 'shop:transport:save,shop:transfee:save', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (167, 163, '删除', '', 'shop:transport:delete,shop:transfee:delete', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (174, 63, '轮播图管理', 'admin/indexImg', '', 1, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (175, 174, '查看', '', 'admin:indexImg:page', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (176, 174, '新增', '', 'admin:indexImg:save', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (177, 174, '修改', '', 'admin:indexImg:info,admin:indexImg:update', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (178, 174, '删除', '', 'admin:indexImg:delete', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (184, 92, '导出待发货订单', '', 'order:order:waitingConsignmentExcel', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (185, 92, '导出销售记录', '', 'order:order:soldExcel', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (201, 63, '热搜管理', 'shop/hotSearch', '', 1, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (202, 201, '查询热搜', '', 'admin:hotSearch:page', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (203, 201, '查询热搜详情', '', 'admin:hotSearch:page', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (204, 201, '添加热搜', '', 'admin:hotSearch:save', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (205, 201, '修改热搜', '', 'admin:hotSearch:update', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (206, 201, '删除热搜', '', 'admin:hotSearch:delete', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (230, 126, '添加', '', 'user:addr:save', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (239, 34, '分组管理', 'prod/prodTag', 'prod:prodTag', 1, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (240, 239, '添加商品分组', '', 'prod:prodTag:save', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (241, 239, '修改商品分组', '', 'prod:prodTag:update', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (242, 239, '删除商品分组', '', 'prod:prodTag:delete', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (243, 239, '查看商品分组', '', 'prod:prodTag:info,prod:prodTag:page', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (300, 63, '公告管理', 'shop/notice', '', 1, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (301, 300, '添加公告', '', 'shop:notice:save', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (302, 300, '修改公告', '', 'shop:notice:update', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (303, 300, '查看公告', '', 'shop:notice:info,shop:notice:page', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (305, 300, '删除公告', '', 'shop:notice:delete', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (306, 34, '评论管理', 'prod/prodComm', '', 1, '', 1);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (307, 306, '查看', '', 'prod:prodComm:page,prod:prodComm:info', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (308, 306, '添加', '', 'prod:prodComm:save', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (309, 306, '修改', '', 'prod:prodComm:update', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (310, 306, '删除', '', 'prod:prodComm:delete', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (312, 1, '地址管理', 'sys/area', '', 1, 'dangdifill', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (313, 312, '新增地址', '', 'admin:area:save', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (314, 312, '修改地址', '', 'admin:area:update', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (315, 312, '删除地址', '', 'admin:area:delete', 2, '', 0);
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (316, 312, '查看地址', '', 'admin:area:info,admin:area:page,admin:area:list', 2, '', 0);
COMMIT;

-- ----------------------------
-- Table structure for tz_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `tz_sys_role`;
CREATE TABLE `tz_sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='角色';

-- ----------------------------
-- Records of tz_sys_role
-- ----------------------------
BEGIN;
INSERT INTO `tz_sys_role` (`role_id`, `role_name`, `remark`, `create_user_id`, `create_time`) VALUES (1, '管理员', '测试', NULL, '2019-07-03 08:39:49');
COMMIT;

-- ----------------------------
-- Table structure for tz_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tz_sys_role_menu`;
CREATE TABLE `tz_sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb3 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of tz_sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1, 1, 34);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2, 1, 70);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (3, 1, 71);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (4, 1, 72);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (5, 1, 73);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (6, 1, 74);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (7, 1, 75);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (8, 1, 136);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (9, 1, 137);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (10, 1, 138);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (11, 1, 139);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (12, 1, 140);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (13, 1, 239);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (14, 1, 240);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (15, 1, 241);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (16, 1, 242);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (17, 1, 243);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (18, 1, 306);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (19, 1, 307);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (20, 1, 308);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (21, 1, 309);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (22, 1, 310);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (23, 1, 51);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (24, 1, 57);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (25, 1, 58);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (26, 1, 59);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (27, 1, 60);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (28, 1, 63);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (29, 1, 300);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (30, 1, 301);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (31, 1, 302);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (32, 1, 303);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (33, 1, 305);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (34, 1, 131);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (35, 1, 132);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (36, 1, 133);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (37, 1, 134);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (38, 1, 135);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (39, 1, 163);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (40, 1, 164);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (41, 1, 165);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (42, 1, 166);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (43, 1, 167);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (44, 1, 174);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (45, 1, 175);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (46, 1, 176);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (47, 1, 177);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (48, 1, 178);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (49, 1, 201);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (50, 1, 202);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (51, 1, 203);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (52, 1, 204);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (53, 1, 205);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (54, 1, 206);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (55, 1, 125);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (56, 1, 126);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (57, 1, 127);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (58, 1, 128);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (59, 1, 129);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (60, 1, 130);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (61, 1, 230);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (62, 1, 91);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (63, 1, 92);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (64, 1, 93);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (65, 1, 99);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (66, 1, 100);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (67, 1, 101);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (68, 1, 107);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (69, 1, 108);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (70, 1, 146);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (71, 1, 184);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (72, 1, 185);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (73, 1, 1);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (74, 1, 312);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (75, 1, 313);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (76, 1, 314);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (77, 1, 315);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (78, 1, 316);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (79, 1, 2);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (80, 1, 15);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (81, 1, 16);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (82, 1, 17);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (83, 1, 18);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (84, 1, 3);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (85, 1, 19);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (86, 1, 20);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (87, 1, 21);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (88, 1, 22);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (89, 1, 4);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (90, 1, 23);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (91, 1, 24);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (92, 1, 25);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (93, 1, 26);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (94, 1, 6);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (95, 1, 7);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (96, 1, 8);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (97, 1, 9);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (98, 1, 10);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (99, 1, 11);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (100, 1, 12);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (101, 1, 13);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (102, 1, 14);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (103, 1, 27);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (104, 1, 29);
INSERT INTO `tz_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (105, 1, -666666);
COMMIT;

-- ----------------------------
-- Table structure for tz_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `tz_sys_user`;
CREATE TABLE `tz_sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `shop_id` bigint DEFAULT NULL COMMENT '用户所在的商城Id',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='系统用户';

-- ----------------------------
-- Records of tz_sys_user
-- ----------------------------
BEGIN;
INSERT INTO `tz_sys_user` (`user_id`, `username`, `password`, `email`, `mobile`, `status`, `create_user_id`, `create_time`, `shop_id`) VALUES (1, 'admin', '{bcrypt}$2a$10$AV9Xz.3ck4RsXiad5ArcBO5.ZKwlpcnJzs740BHY..fsSp0PnM/Zu', 'root@123.com', '13612345678', 1, 1, '2016-11-11 11:11:11', 1);
COMMIT;

-- ----------------------------
-- Table structure for tz_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tz_sys_user_role`;
CREATE TABLE `tz_sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of tz_sys_user_role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tz_transcity
-- ----------------------------
DROP TABLE IF EXISTS `tz_transcity`;
CREATE TABLE `tz_transcity` (
  `transcity_id` bigint NOT NULL AUTO_INCREMENT,
  `transfee_id` bigint DEFAULT NULL COMMENT '运费项id',
  `city_id` bigint DEFAULT NULL COMMENT '城市id',
  PRIMARY KEY (`transcity_id`),
  KEY `transfee_id` (`transfee_id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=667 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tz_transcity
-- ----------------------------
BEGIN;
INSERT INTO `tz_transcity` (`transcity_id`, `transfee_id`, `city_id`) VALUES (655, 119, 440118000000);
INSERT INTO `tz_transcity` (`transcity_id`, `transfee_id`, `city_id`) VALUES (656, 119, 440117000000);
INSERT INTO `tz_transcity` (`transcity_id`, `transfee_id`, `city_id`) VALUES (657, 119, 440115000000);
INSERT INTO `tz_transcity` (`transcity_id`, `transfee_id`, `city_id`) VALUES (658, 119, 440114000000);
INSERT INTO `tz_transcity` (`transcity_id`, `transfee_id`, `city_id`) VALUES (659, 119, 440113000000);
INSERT INTO `tz_transcity` (`transcity_id`, `transfee_id`, `city_id`) VALUES (660, 119, 440112000000);
INSERT INTO `tz_transcity` (`transcity_id`, `transfee_id`, `city_id`) VALUES (661, 119, 440111000000);
INSERT INTO `tz_transcity` (`transcity_id`, `transfee_id`, `city_id`) VALUES (662, 119, 440106000000);
INSERT INTO `tz_transcity` (`transcity_id`, `transfee_id`, `city_id`) VALUES (663, 119, 440105000000);
INSERT INTO `tz_transcity` (`transcity_id`, `transfee_id`, `city_id`) VALUES (664, 119, 440104000000);
INSERT INTO `tz_transcity` (`transcity_id`, `transfee_id`, `city_id`) VALUES (665, 119, 440103000000);
INSERT INTO `tz_transcity` (`transcity_id`, `transfee_id`, `city_id`) VALUES (666, 119, 440101000000);
COMMIT;

-- ----------------------------
-- Table structure for tz_transcity_free
-- ----------------------------
DROP TABLE IF EXISTS `tz_transcity_free`;
CREATE TABLE `tz_transcity_free` (
  `transcity_free_id` bigint NOT NULL AUTO_INCREMENT COMMENT '指定条件包邮城市项id',
  `transfee_free_id` bigint DEFAULT NULL COMMENT '指定条件包邮项id',
  `free_city_id` bigint DEFAULT NULL COMMENT '城市id',
  PRIMARY KEY (`transcity_free_id`),
  KEY `transfee_free_id` (`transfee_free_id`),
  KEY `city_id` (`free_city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2326 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tz_transcity_free
-- ----------------------------
BEGIN;
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (18, NULL, 52994);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (19, NULL, 52995);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (339, 32, 2376);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1351, 49, 72);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1352, 49, 2800);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1353, 49, 2801);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1354, 49, 2802);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1355, 49, 2803);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1356, 49, 2804);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1357, 49, 2805);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1358, 49, 2806);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1359, 49, 2807);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1360, 49, 2808);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1361, 49, 2809);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1362, 49, 2810);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1363, 49, 2812);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1364, 49, 2814);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1365, 49, 2816);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1366, 49, 2901);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1367, 49, 2953);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1368, 49, 3065);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1369, 49, 78);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1370, 49, 2813);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1371, 49, 2815);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1372, 49, 2817);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1373, 49, 2820);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1374, 49, 2822);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1375, 49, 2823);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1376, 49, 2824);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1377, 49, 2825);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1378, 49, 2826);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1379, 49, 2830);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1380, 49, 2833);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1381, 49, 2834);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1382, 49, 2835);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1383, 49, 2837);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1384, 49, 2841);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1385, 49, 2919);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1386, 49, 51035);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1387, 49, 51036);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1388, 49, 51037);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1389, 49, 51038);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1390, 49, 51039);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1391, 49, 51040);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1392, 49, 51041);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1393, 49, 51042);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1394, 49, 51043);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1395, 49, 51044);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1396, 49, 51045);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1397, 49, 51046);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1398, 49, 51047);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1399, 49, 51048);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1400, 49, 51049);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1401, 49, 51050);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1402, 49, 51051);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1403, 49, 51052);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1404, 49, 113);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1405, 49, 114);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1406, 49, 115);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1407, 49, 119);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1408, 49, 123);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1409, 49, 126);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1410, 49, 128);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1411, 49, 129);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1412, 49, 130);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1413, 49, 131);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1414, 49, 132);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1415, 49, 133);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1416, 49, 134);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1417, 49, 135);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1418, 49, 136);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1419, 49, 137);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1420, 49, 138);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1421, 49, 139);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1422, 49, 140);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1423, 49, 141);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1424, 49, 4164);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1425, 49, 48131);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1426, 49, 48132);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1427, 49, 48133);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1428, 49, 48201);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1429, 49, 48202);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1430, 49, 48203);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1431, 49, 48204);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1432, 49, 48205);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1433, 49, 48206);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1434, 49, 48207);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1435, 49, 50950);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1436, 49, 50951);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1437, 49, 50952);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1438, 49, 50953);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1439, 49, 50954);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1440, 49, 50995);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1441, 49, 51026);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1442, 49, 51027);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1443, 49, 51028);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1444, 49, 142);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1445, 49, 148);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1446, 49, 164);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1447, 49, 199);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1448, 49, 224);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1449, 49, 239);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1450, 49, 248);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1451, 49, 258);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1452, 49, 264);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1453, 49, 274);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1454, 49, 275);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1455, 49, 412);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1456, 49, 420);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1457, 49, 427);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1458, 49, 438);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1459, 49, 446);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1460, 49, 454);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1461, 49, 458);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1462, 49, 468);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1463, 49, 475);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1464, 49, 482);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1465, 49, 489);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1466, 49, 495);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1467, 49, 502);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1468, 49, 517);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1469, 49, 527);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1470, 49, 538);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1471, 49, 549);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1472, 49, 2780);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1473, 49, 904);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1474, 49, 911);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1475, 49, 919);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1476, 49, 925);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1477, 49, 933);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1478, 49, 939);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1479, 49, 951);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1480, 49, 959);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1481, 49, 965);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1482, 49, 972);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1483, 49, 978);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1484, 49, 984);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1485, 49, 988);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1486, 49, 1114);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1487, 49, 1116);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1488, 49, 1121);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1489, 49, 1124);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1490, 49, 1127);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1491, 49, 1132);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1492, 49, 1137);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1493, 49, 1140);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1494, 49, 1151);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1495, 49, 1159);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1496, 49, 1167);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1497, 49, 1174);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1498, 49, 1180);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1499, 49, 1201);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1500, 49, 1206);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1501, 49, 2971);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1502, 49, 1158);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1503, 49, 1213);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1504, 49, 1233);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1505, 49, 1243);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1506, 49, 1250);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1507, 49, 1255);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1508, 49, 1262);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1509, 49, 1273);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1510, 49, 1280);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1511, 49, 1290);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1512, 49, 1298);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1513, 49, 1303);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1514, 49, 1315);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1515, 49, 1317);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1516, 49, 1329);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1517, 49, 1332);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1518, 49, 1341);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1519, 49, 1352);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1520, 49, 1362);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1521, 49, 1370);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1522, 49, 1381);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1523, 49, 1387);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1524, 49, 1396);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1525, 49, 1405);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1526, 49, 1413);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1527, 49, 1421);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1528, 49, 1432);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1529, 49, 1441);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1530, 49, 1458);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1531, 49, 1466);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1532, 49, 1475);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1533, 49, 1477);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1534, 49, 1479);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1535, 49, 2922);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1536, 49, 2980);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1537, 49, 2983);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1538, 49, 3154);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1539, 49, 1482);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1540, 49, 1488);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1541, 49, 1495);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1542, 49, 1501);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1543, 49, 1511);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1544, 49, 1522);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1545, 49, 1530);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1546, 49, 1540);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1547, 49, 1544);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1548, 49, 1555);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1549, 49, 1560);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1550, 49, 1574);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1551, 49, 1586);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1552, 49, 1592);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1553, 49, 1601);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1554, 49, 1607);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1555, 49, 1609);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1556, 49, 1611);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1557, 49, 1617);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1558, 49, 1627);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1559, 49, 1634);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1560, 49, 1643);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1561, 49, 1650);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1562, 49, 1655);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1563, 49, 1657);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1564, 49, 1659);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1565, 49, 1666);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1566, 49, 1672);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1567, 49, 1677);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1568, 49, 1684);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1569, 49, 1690);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1570, 49, 1698);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1571, 49, 1704);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1572, 49, 1705);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1573, 49, 1709);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1574, 49, 1715);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1575, 49, 1720);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1576, 49, 1726);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1577, 49, 1740);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1578, 49, 1746);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1579, 49, 1749);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1580, 49, 1753);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1581, 49, 1757);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1582, 49, 1761);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1583, 49, 1792);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1584, 49, 1806);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1585, 49, 1818);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1586, 49, 3044);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1587, 49, 3168);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1588, 49, 1827);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1589, 49, 1832);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1590, 49, 1836);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1591, 49, 1842);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1592, 49, 1845);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1593, 49, 1857);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1594, 49, 1861);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1595, 49, 1874);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1596, 49, 1885);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1597, 49, 1898);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1598, 49, 1911);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1599, 49, 1930);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1600, 49, 1946);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1601, 49, 1950);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1602, 49, 1954);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1603, 49, 1960);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1604, 49, 1962);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1605, 49, 1977);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1606, 49, 1983);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1607, 49, 1988);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1608, 49, 1993);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1609, 49, 2005);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1610, 49, 2016);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1611, 49, 2022);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1612, 49, 2033);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1613, 49, 2042);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1614, 49, 2047);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1615, 49, 2058);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1616, 49, 2065);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1617, 49, 2070);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1618, 49, 2084);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1619, 49, 2103);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1620, 49, 2121);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1621, 49, 3034);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1622, 49, 3115);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1623, 49, 3137);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1624, 49, 3173);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1625, 49, 3690);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1626, 49, 3698);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1627, 49, 3699);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1628, 49, 3701);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1629, 49, 3702);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1630, 49, 3703);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1631, 49, 3704);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1632, 49, 3705);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1633, 49, 3706);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1634, 49, 3707);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1635, 49, 3708);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1636, 49, 3709);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1637, 49, 3710);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1638, 49, 3711);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1639, 49, 2144);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1640, 49, 2150);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1641, 49, 2155);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1642, 49, 2169);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1643, 49, 2180);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1644, 49, 2189);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1645, 49, 2196);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1646, 49, 2205);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1647, 49, 2222);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1648, 49, 2235);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1649, 49, 2247);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1650, 49, 2258);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1651, 49, 2270);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1652, 49, 2281);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1653, 49, 2291);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1654, 49, 2298);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1655, 49, 2304);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1656, 49, 2309);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1657, 49, 2318);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1658, 49, 2332);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1659, 49, 2336);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1660, 49, 2347);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1661, 49, 2360);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1662, 49, 2366);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1663, 49, 4108);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1975, 51, 72);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1976, 51, 2800);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1977, 51, 2801);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1978, 51, 2802);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1979, 51, 2803);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1980, 51, 2804);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1981, 51, 2805);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1982, 51, 2806);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1983, 51, 2807);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1984, 51, 2808);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1985, 51, 2809);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1986, 51, 2810);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1987, 51, 2812);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1988, 51, 2814);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1989, 51, 2816);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1990, 51, 2901);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1991, 51, 2953);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1992, 51, 3065);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1993, 51, 78);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1994, 51, 2813);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1995, 51, 2815);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1996, 51, 2817);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1997, 51, 2820);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1998, 51, 2822);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (1999, 51, 2823);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2000, 51, 2824);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2001, 51, 2825);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2002, 51, 2826);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2003, 51, 2830);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2004, 51, 2833);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2005, 51, 2834);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2006, 51, 2835);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2007, 51, 2837);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2008, 51, 2841);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2009, 51, 2919);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2010, 51, 51035);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2011, 51, 51036);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2012, 51, 51037);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2013, 51, 51038);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2014, 51, 51039);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2015, 51, 51040);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2016, 51, 51041);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2017, 51, 51042);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2018, 51, 51043);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2019, 51, 51044);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2020, 51, 51045);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2021, 51, 51046);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2022, 51, 51047);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2023, 51, 51048);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2024, 51, 51049);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2025, 51, 51050);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2026, 51, 51051);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2027, 51, 51052);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2028, 51, 113);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2029, 51, 114);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2030, 51, 115);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2031, 51, 119);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2032, 51, 123);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2033, 51, 126);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2034, 51, 128);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2035, 51, 129);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2036, 51, 130);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2037, 51, 131);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2038, 51, 132);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2039, 51, 133);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2040, 51, 134);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2041, 51, 135);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2042, 51, 136);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2043, 51, 137);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2044, 51, 138);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2045, 51, 139);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2046, 51, 140);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2047, 51, 141);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2048, 51, 4164);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2049, 51, 48131);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2050, 51, 48132);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2051, 51, 48133);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2052, 51, 48201);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2053, 51, 48202);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2054, 51, 48203);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2055, 51, 48204);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2056, 51, 48205);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2057, 51, 48206);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2058, 51, 48207);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2059, 51, 50950);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2060, 51, 50951);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2061, 51, 50952);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2062, 51, 50953);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2063, 51, 50954);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2064, 51, 50995);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2065, 51, 51026);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2066, 51, 51027);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2067, 51, 51028);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2068, 51, 142);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2069, 51, 148);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2070, 51, 164);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2071, 51, 199);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2072, 51, 224);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2073, 51, 239);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2074, 51, 248);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2075, 51, 258);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2076, 51, 264);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2077, 51, 274);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2078, 51, 275);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2079, 51, 412);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2080, 51, 420);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2081, 51, 427);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2082, 51, 438);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2083, 51, 446);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2084, 51, 454);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2085, 51, 458);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2086, 51, 468);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2087, 51, 475);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2088, 51, 482);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2089, 51, 489);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2090, 51, 495);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2091, 51, 502);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2092, 51, 517);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2093, 51, 527);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2094, 51, 538);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2095, 51, 549);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2096, 51, 2780);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2097, 51, 904);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2098, 51, 911);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2099, 51, 919);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2100, 51, 925);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2101, 51, 933);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2102, 51, 939);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2103, 51, 951);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2104, 51, 959);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2105, 51, 965);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2106, 51, 972);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2107, 51, 978);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2108, 51, 984);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2109, 51, 988);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2110, 51, 1000);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2111, 51, 1007);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2112, 51, 1016);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2113, 51, 1022);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2114, 51, 1025);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2115, 51, 1032);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2116, 51, 1042);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2117, 51, 1053);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2118, 51, 1058);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2119, 51, 1060);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2120, 51, 1072);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2121, 51, 1081);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2122, 51, 1090);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2123, 51, 1099);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2124, 51, 1108);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2125, 51, 1112);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2126, 51, 2900);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2127, 51, 1114);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2128, 51, 1116);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2129, 51, 1121);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2130, 51, 1124);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2131, 51, 1127);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2132, 51, 1132);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2133, 51, 1137);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2134, 51, 1140);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2135, 51, 1151);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2136, 51, 1159);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2137, 51, 1167);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2138, 51, 1174);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2139, 51, 1180);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2140, 51, 1201);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2141, 51, 1206);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2142, 51, 2971);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2143, 51, 1158);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2144, 51, 1213);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2145, 51, 1233);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2146, 51, 1243);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2147, 51, 1250);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2148, 51, 1255);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2149, 51, 1262);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2150, 51, 1273);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2151, 51, 1280);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2152, 51, 1290);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2153, 51, 1298);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2154, 51, 1303);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2155, 51, 1315);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2156, 51, 1317);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2157, 51, 1329);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2158, 51, 1332);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2159, 51, 1341);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2160, 51, 1352);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2161, 51, 1362);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2162, 51, 1370);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2163, 51, 1381);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2164, 51, 1387);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2165, 51, 1396);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2166, 51, 1405);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2167, 51, 1413);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2168, 51, 1421);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2169, 51, 1432);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2170, 51, 1441);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2171, 51, 1458);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2172, 51, 1466);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2173, 51, 1475);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2174, 51, 1477);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2175, 51, 1479);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2176, 51, 2922);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2177, 51, 2980);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2178, 51, 2983);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2179, 51, 3154);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2180, 51, 1482);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2181, 51, 1488);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2182, 51, 1495);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2183, 51, 1501);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2184, 51, 1511);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2185, 51, 1522);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2186, 51, 1530);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2187, 51, 1540);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2188, 51, 1544);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2189, 51, 1555);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2190, 51, 1560);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2191, 51, 1574);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2192, 51, 1586);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2193, 51, 1592);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2194, 51, 1601);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2195, 51, 1607);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2196, 51, 1609);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2197, 51, 1611);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2198, 51, 1617);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2199, 51, 1627);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2200, 51, 1634);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2201, 51, 1643);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2202, 51, 1650);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2203, 51, 1655);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2204, 51, 1657);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2205, 51, 1659);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2206, 51, 1666);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2207, 51, 1672);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2208, 51, 1677);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2209, 51, 1684);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2210, 51, 1690);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2211, 51, 1698);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2212, 51, 1704);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2213, 51, 1705);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2214, 51, 1709);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2215, 51, 1715);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2216, 51, 1720);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2217, 51, 1726);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2218, 51, 1740);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2219, 51, 1746);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2220, 51, 1749);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2221, 51, 1753);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2222, 51, 1757);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2223, 51, 1761);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2224, 51, 1792);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2225, 51, 1806);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2226, 51, 1818);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2227, 51, 3044);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2228, 51, 3168);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2229, 51, 1827);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2230, 51, 1832);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2231, 51, 1836);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2232, 51, 1842);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2233, 51, 1845);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2234, 51, 1857);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2235, 51, 1861);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2236, 51, 1874);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2237, 51, 1885);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2238, 51, 1898);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2239, 51, 1911);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2240, 51, 1930);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2241, 51, 1946);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2242, 51, 1950);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2243, 51, 1954);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2244, 51, 1960);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2245, 51, 1962);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2246, 51, 1977);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2247, 51, 1983);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2248, 51, 1988);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2249, 51, 1993);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2250, 51, 2005);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2251, 51, 2016);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2252, 51, 2022);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2253, 51, 2033);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2254, 51, 2042);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2255, 51, 2047);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2256, 51, 2058);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2257, 51, 2065);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2258, 51, 2070);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2259, 51, 2084);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2260, 51, 2103);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2261, 51, 2144);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2262, 51, 2150);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2263, 51, 2155);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2264, 51, 2169);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2265, 51, 2180);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2266, 51, 2189);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2267, 51, 2196);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2268, 51, 2205);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2269, 51, 2222);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2270, 51, 2235);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2271, 51, 2247);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2272, 51, 2258);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2273, 51, 2270);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2274, 51, 2281);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2275, 51, 2291);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2276, 51, 2298);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2277, 51, 2304);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2278, 51, 2309);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2279, 51, 2318);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2280, 51, 2332);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2281, 51, 2336);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2282, 51, 2347);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2283, 51, 2360);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2284, 51, 2366);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2285, 51, 4108);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2286, 58, 24145);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2287, 58, 24146);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2288, 58, 24147);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2289, 58, 24148);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2290, 58, 24149);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2291, 58, 24150);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2292, 58, 24151);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2293, 58, 24152);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2294, 58, 24153);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2295, 58, 24154);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2296, 58, 24155);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2297, 58, 24156);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2298, 58, 24157);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2299, 58, 24158);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2300, 58, 24159);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2301, 58, 24160);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2302, 58, 24161);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2303, 58, 24162);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2304, 58, 24163);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2305, 58, 24164);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2306, 58, 24165);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2307, 58, 24166);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2308, 58, 24167);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2309, 58, 24168);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2310, 58, 24169);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2311, 58, 24170);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2312, 58, 24171);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2313, 58, 24172);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2314, 58, 51839);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2315, 59, 5538);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2316, 60, 440301000000);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2317, 60, 440303000000);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2318, 60, 440304000000);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2319, 60, 440305000000);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2320, 60, 440306000000);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2321, 60, 440307000000);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2322, 60, 440308000000);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2323, 60, 440309000000);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2324, 60, 440310000000);
INSERT INTO `tz_transcity_free` (`transcity_free_id`, `transfee_free_id`, `free_city_id`) VALUES (2325, 60, 440311000000);
COMMIT;

-- ----------------------------
-- Table structure for tz_transfee
-- ----------------------------
DROP TABLE IF EXISTS `tz_transfee`;
CREATE TABLE `tz_transfee` (
  `transfee_id` bigint NOT NULL AUTO_INCREMENT COMMENT '运费项id',
  `transport_id` bigint DEFAULT NULL COMMENT '运费模板id',
  `continuous_piece` decimal(15,2) DEFAULT NULL COMMENT '续件数量',
  `first_piece` decimal(15,2) DEFAULT NULL COMMENT '首件数量',
  `continuous_fee` decimal(15,2) DEFAULT NULL COMMENT '续件费用',
  `first_fee` decimal(15,2) DEFAULT NULL COMMENT '首件费用',
  PRIMARY KEY (`transfee_id`),
  KEY `transport_id` (`transport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tz_transfee
-- ----------------------------
BEGIN;
INSERT INTO `tz_transfee` (`transfee_id`, `transport_id`, `continuous_piece`, `first_piece`, `continuous_fee`, `first_fee`) VALUES (101, 50, 0.02, 0.01, 1.00, 2.00);
INSERT INTO `tz_transfee` (`transfee_id`, `transport_id`, `continuous_piece`, `first_piece`, `continuous_fee`, `first_fee`) VALUES (115, 47, 1.00, 1.00, 0.00, 0.00);
INSERT INTO `tz_transfee` (`transfee_id`, `transport_id`, `continuous_piece`, `first_piece`, `continuous_fee`, `first_fee`) VALUES (118, 48, 7.00, 7.00, 7.00, 7.00);
INSERT INTO `tz_transfee` (`transfee_id`, `transport_id`, `continuous_piece`, `first_piece`, `continuous_fee`, `first_fee`) VALUES (119, 48, 1.00, 1.00, 1.00, 1.00);
INSERT INTO `tz_transfee` (`transfee_id`, `transport_id`, `continuous_piece`, `first_piece`, `continuous_fee`, `first_fee`) VALUES (120, 51, 4.00, 7.00, 6.00, 8.00);
COMMIT;

-- ----------------------------
-- Table structure for tz_transfee_free
-- ----------------------------
DROP TABLE IF EXISTS `tz_transfee_free`;
CREATE TABLE `tz_transfee_free` (
  `transfee_free_id` bigint NOT NULL AUTO_INCREMENT COMMENT '指定条件包邮项id',
  `transport_id` bigint DEFAULT NULL COMMENT '运费模板id',
  `free_type` tinyint DEFAULT NULL COMMENT '包邮方式 （0 满x件/重量/体积包邮 1满金额包邮 2满x件/重量/体积且满金额包邮）',
  `amount` decimal(15,2) DEFAULT NULL COMMENT '需满金额',
  `piece` decimal(15,2) DEFAULT NULL COMMENT '包邮x件/重量/体积',
  PRIMARY KEY (`transfee_free_id`),
  KEY `transport_id` (`transport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tz_transfee_free
-- ----------------------------
BEGIN;
INSERT INTO `tz_transfee_free` (`transfee_free_id`, `transport_id`, `free_type`, `amount`, `piece`) VALUES (32, 53, 1, 88.00, NULL);
INSERT INTO `tz_transfee_free` (`transfee_free_id`, `transport_id`, `free_type`, `amount`, `piece`) VALUES (49, 67, 0, NULL, 1.75);
INSERT INTO `tz_transfee_free` (`transfee_free_id`, `transport_id`, `free_type`, `amount`, `piece`) VALUES (51, 68, 0, NULL, 3.50);
INSERT INTO `tz_transfee_free` (`transfee_free_id`, `transport_id`, `free_type`, `amount`, `piece`) VALUES (58, 56, 0, NULL, 10.00);
INSERT INTO `tz_transfee_free` (`transfee_free_id`, `transport_id`, `free_type`, `amount`, `piece`) VALUES (59, 56, 1, 10.00, NULL);
INSERT INTO `tz_transfee_free` (`transfee_free_id`, `transport_id`, `free_type`, `amount`, `piece`) VALUES (60, 51, 0, 300.00, 1.00);
COMMIT;

-- ----------------------------
-- Table structure for tz_transport
-- ----------------------------
DROP TABLE IF EXISTS `tz_transport`;
CREATE TABLE `tz_transport` (
  `transport_id` bigint NOT NULL AUTO_INCREMENT COMMENT '运费模板id',
  `trans_name` varchar(36) DEFAULT NULL COMMENT '运费模板名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `shop_id` bigint DEFAULT NULL COMMENT '店铺id',
  `charge_type` tinyint DEFAULT NULL COMMENT '收费方式（0 按件数,1 按重量 2 按体积）',
  `is_free_fee` tinyint DEFAULT NULL COMMENT '是否包邮 0:不包邮 1:包邮',
  `has_free_condition` tinyint DEFAULT NULL COMMENT '是否含有包邮条件 0 否 1是',
  PRIMARY KEY (`transport_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tz_transport
-- ----------------------------
BEGIN;
INSERT INTO `tz_transport` (`transport_id`, `trans_name`, `create_time`, `shop_id`, `charge_type`, `is_free_fee`, `has_free_condition`) VALUES (47, '包邮', '2018-11-21 17:17:07', 1, 0, 1, 0);
INSERT INTO `tz_transport` (`transport_id`, `trans_name`, `create_time`, `shop_id`, `charge_type`, `is_free_fee`, `has_free_condition`) VALUES (48, '广州单独计算运费', '2018-11-21 17:20:09', 1, 0, 0, 0);
INSERT INTO `tz_transport` (`transport_id`, `trans_name`, `create_time`, `shop_id`, `charge_type`, `is_free_fee`, `has_free_condition`) VALUES (51, '深圳包邮', '2019-04-13 13:42:38', 1, 0, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for tz_user
-- ----------------------------
DROP TABLE IF EXISTS `tz_user`;
CREATE TABLE `tz_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `user_mail` varchar(100) DEFAULT NULL COMMENT '用户邮箱',
  `login_password` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `pay_password` varchar(50) DEFAULT NULL COMMENT '支付密码',
  `user_mobile` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `modify_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `user_regtime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '注册时间',
  `user_regip` varchar(50) DEFAULT NULL COMMENT '注册IP',
  `user_lasttime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `user_lastip` varchar(50) DEFAULT NULL COMMENT '最后登录IP',
  `user_memo` varchar(500) DEFAULT NULL COMMENT '备注',
  `sex` char(1) DEFAULT 'M' COMMENT 'M(男) or F(女)',
  `birth_date` char(10) DEFAULT NULL COMMENT '例如：2009-11-27',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '头像图片路径',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态 1 正常 0 无效',
  `score` int DEFAULT NULL COMMENT '用户积分',
  `open_id` varchar(255) DEFAULT NULL,
  `union_id` varchar(255) DEFAULT NULL,
  `user_wechat` varchar(255) DEFAULT NULL COMMENT '用户微信号',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ud_user_union_id` (`union_id`),
  UNIQUE KEY `ud_user_unique_mobile` (`user_mobile`),
  UNIQUE KEY `ud_user_mail` (`user_mail`),
  UNIQUE KEY `IDX_a0a4cdd86b111016fdd2eee909` (`user_mail`),
  UNIQUE KEY `IDX_e70ba19c42f3ccab403877cff4` (`user_mobile`),
  UNIQUE KEY `IDX_91e431587fa852f7559592117b` (`union_id`)
) ENGINE=InnoDB AUTO_INCREMENT=172478945 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_user
-- ----------------------------
BEGIN;
INSERT INTO `tz_user` (`user_id`, `nick_name`, `real_name`, `user_mail`, `login_password`, `pay_password`, `user_mobile`, `modify_time`, `user_regtime`, `user_regip`, `user_lasttime`, `user_lastip`, `user_memo`, `sex`, `birth_date`, `avatar_url`, `status`, `score`, `open_id`, `union_id`, `user_wechat`) VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-14 10:20:28.802374', '2023-12-04 16:03:41.977334', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 1, NULL, 'demo', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tz_user_addr
-- ----------------------------
DROP TABLE IF EXISTS `tz_user_addr`;
CREATE TABLE `tz_user_addr` (
  `addr_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` varchar(36) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `receiver` varchar(50) DEFAULT NULL COMMENT '收货人',
  `province_id` bigint DEFAULT NULL COMMENT '省ID',
  `province` varchar(100) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `city_id` bigint DEFAULT NULL COMMENT '城市ID',
  `area` varchar(20) DEFAULT NULL COMMENT '区',
  `area_id` bigint DEFAULT NULL COMMENT '区ID',
  `post_code` varchar(15) DEFAULT NULL COMMENT '邮编',
  `addr` varchar(1000) DEFAULT NULL COMMENT '地址',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `status` int NOT NULL COMMENT '状态,1正常，0无效',
  `common_addr` int NOT NULL DEFAULT '0' COMMENT '是否默认地址 1是',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '建立时间',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`addr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tz_user_addr
-- ----------------------------
BEGIN;
INSERT INTO `tz_user_addr` (`addr_id`, `user_id`, `receiver`, `province_id`, `province`, `city`, `city_id`, `area`, `area_id`, `post_code`, `addr`, `mobile`, `status`, `common_addr`, `create_time`, `version`, `update_time`) VALUES (6, '2', '豆豆的', 310000000000, '上海市', '市辖区', 310100000000, '黄浦区', 310101000000, NULL, '里斯本', '13121342344', 1, 1, '2024-04-17 06:19:36.304080', 0, '2024-05-15 09:32:09.000000');
INSERT INTO `tz_user_addr` (`addr_id`, `user_id`, `receiver`, `province_id`, `province`, `city`, `city_id`, `area`, `area_id`, `post_code`, `addr`, `mobile`, `status`, `common_addr`, `create_time`, `version`, `update_time`) VALUES (7, '2', '小b', 110000000000, '北京市', '市辖区', 110100000000, '东城区', 110101000000, NULL, '里斯本', '13121234322', 1, 0, '2024-04-17 06:21:34.566377', 0, '2024-05-15 14:42:55.000000');
INSERT INTO `tz_user_addr` (`addr_id`, `user_id`, `receiver`, `province_id`, `province`, `city`, `city_id`, `area`, `area_id`, `post_code`, `addr`, `mobile`, `status`, `common_addr`, `create_time`, `version`, `update_time`) VALUES (9, '2', '里斯', 110000000000, '北京市', '市辖区', 110100000000, '海淀区', 110108000000, NULL, '小营北路', '13121767688', 1, 0, '2024-05-15 14:40:58.369846', 0, '2024-05-15 14:40:58.369846');
COMMIT;

-- ----------------------------
-- Table structure for tz_user_collection
-- ----------------------------
DROP TABLE IF EXISTS `tz_user_collection`;
CREATE TABLE `tz_user_collection` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '收藏表',
  `prod_id` bigint DEFAULT NULL COMMENT '商品id',
  `user_id` varchar(36) NOT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tz_user_collection
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
