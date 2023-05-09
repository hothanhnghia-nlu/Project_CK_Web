/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100427
 Source Host           : localhost:3306
 Source Schema         : laptop_store

 Target Server Type    : MySQL
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 18/03/2023 10:59:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `categoryID` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`categoryID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('DH011', 'Đồ Họa');
INSERT INTO `categories` VALUES ('GM010', 'Gaming');
INSERT INTO `categories` VALUES ('MB013', 'Macbook');
INSERT INTO `categories` VALUES ('VP012', 'Văn Phòng');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `cmtID` int NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rating` tinyint NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`cmtID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`  (
  `contactID` int NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subject_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`contactID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contacts
-- ----------------------------

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `imageID` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`imageID`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of images
-- ----------------------------

INSERT INTO `images` VALUES ('001', '001',"Dell", './assets/img/product/vanphong/Dell%20Inspiron%2016%205620.jpg', 0);
INSERT INTO `images` VALUES ('002', '001',"Dell", './assets/img/product/vanphong/Dell%20Inspiron%207415.jpg', 0);

INSERT INTO `images` VALUES ('003','002','Dell','./assets/img/product/vanphong/Dell%20Inspiron%2016%205620.jpg',0);
INSERT INTO `images` VALUES ('004','002','Dell','./assets/img/product/vanphong/Dell%20Inspiron%2013%205320.jpg',0);

INSERT INTO `images` VALUES ('005','003','Dell','./assets/img/product/vanphong/Dell%20Inspiron%207415.jpg',0);
INSERT INTO `images` VALUES ('006','003','Dell','./assets/img/product/vanphong/Dell%20Inspiron%2016%205620.jpg',0);

INSERT INTO `images` VALUES ('007','004','Dell','./assets/img/product/vanphong/Dell%20Inspiron%2013%205320.jpg',0);
INSERT INTO `images` VALUES ('008','004','Dell','./assets/img/product/vanphong/Dell%20Inspiron%2016%205620.jpg',0);

INSERT INTO `images` VALUES ('009','005','Dell','./assets/img/product/vanphong/Dell%20Inspiron%2015%205510.jpg',0);
INSERT INTO `images` VALUES ('010','005','Dell','./assets/img/product/vanphong/Dell%20Inspiron%2015%207501.jpg',0);

INSERT INTO `images` VALUES ('011','006','Dell','./assets/img/product/vanphong/Dell%20Inspiron%2015%207501.jpg',0);
INSERT INTO `images` VALUES ('012','006','Dell','./assets/img/product/vanphong/Dell%20Inspiron%2016%205620.jpg',0);

INSERT INTO `images` VALUES ('013','007','Dell','./assets/img/product/vanphong/Dell%20Vostro%205410.jpg',0);
INSERT INTO `images` VALUES ('014','007','Dell','./assets/img/product/vanphong/Dell%20Vostro%2015%205510.jpg',0);

INSERT INTO `images` VALUES ('015','008','Dell','./assets/img/product/vanphong/Dell%20Vostro%2015%205510.jpg',0);
INSERT INTO `images` VALUES ('016','008','Dell','./assets/img/product/vanphong/Dell%20Vostro%2013%205310.jpg',0);

INSERT INTO `images` VALUES ('017','009','Dell','./assets/img/product/vanphong/Dell%20Vostro%2013%205310.jpg',0);
INSERT INTO `images` VALUES ('018','009','Dell','./assets/img/product/vanphong/Dell%20Vostro%2015%205510.jpg',0);

INSERT INTO `images` VALUES ('019','010','Dell','./assets/img/product/vanphong/Dell%20Vostro%2015%205510.jpg',0);
INSERT INTO `images` VALUES ('020','010','Dell','./assets/img/product/vanphong/Dell%20Vostro%2015%205510.jpg',0);

INSERT INTO `images` VALUES ('021','011','Lenovo','./assets/img/product/vanphong/Lenovo%20IdeaPad%205%20Pro%20.jpg',0);
INSERT INTO `images` VALUES ('022','011','Lenovo','./assets/img/product/gaming/Laptop%20Lenovo%20Ideapad%20Gaming%203%2015IAH7.jpg',0);

INSERT INTO `images` VALUES ('023','012','Acer','./assets/img/product/vanphong/Acer%20Swift%203.jpg',0);
INSERT INTO `images` VALUES ('024','012','Acer','./assets/img/product/vanphong/Acer%20Aspire%201%20A115-32.jpg',0);

INSERT INTO `images` VALUES ('025','013','Asus','./assets/img/product/vanphong/Asus%20Zenbook%2014%20Q409%20ZA.jpg',0);
INSERT INTO `images` VALUES ('026','013','Asus','./assets/img/product/vanphong/Asus%20Zenbook%2014%20Q408UG.jpg',0);

INSERT INTO `images` VALUES ('027','014','Acer','./assets/img/product/vanphong/Acer%20Aspire%201%20A115-32.jpg',0);
INSERT INTO `images` VALUES ('028','014','Acer','./assets/img/product/vanphong/Acer%20Swift%203.jpg',0);

INSERT INTO `images` VALUES ('029','015','Asus','./assets/img/product/vanphong/Asus%20Vivobook%20X515JA.jpg',0);
INSERT INTO `images` VALUES ('030','015','Asus','./assets/img/product/vanphong/Asus%20Vivobook%20X515JA.jpg',0);

INSERT INTO `images` VALUES ('031','016','Lenovo','./assets/img/product/vanphong/Lenovo%20ThinkPad%20E14.jpg',0);
INSERT INTO `images` VALUES ('032','016','Dell','./assets/img/product/vanphong/Lenovo%20ThinkPad%20X1%20Nano%202021.jpg',0);

INSERT INTO `images` VALUES ('033','017','Asus','./assets/img/product/vanphong/Asus%20Zenbook%2014%20Q408UG.jpg',0);
INSERT INTO `images` VALUES ('034','017','Asus','./assets/img/product/vanphong/Asus%20Zenbook%2014%20Q409%20ZA.jpg',0);

INSERT INTO `images` VALUES ('035','018','HP','./assets/img/product/vanphong/HP%20ENVY%20x360%2013-bd0063dx.jpg',0);
INSERT INTO `images` VALUES ('036','018','HP','./assets/img/product/vanphong/Laptop%20HP%2014%20-%20dq2020nr.jpg',0);

INSERT INTO `images` VALUES ('037','019','SamSung','./assets/img/product/vanphong/Samsung%20Galaxy%20Book%20Flex%20Alpha%202.jpg',0);
INSERT INTO `images` VALUES ('038','019','Samsung','./assets/img/product/vanphong/Samsung%20Galaxy%20Book%20Flex%20Alpha%202.jpg',0);

INSERT INTO `images` VALUES ('039','020','Acer','./assets/img/product/vanphong/Acer%20Aspire%205%20A514-54.jpg',0);
INSERT INTO `images` VALUES ('040','020','Acer','./assets/img/product/vanphong/Acer%20Aspire%201%20A115-32.jpg',0);

INSERT INTO `images` VALUES ('041','021','HP','./assets/img/product/vanphong/Laptop%20HP%2014%20-%20dq2020nr.jpg',0);
INSERT INTO `images` VALUES ('042','021','HP','./assets/img/product/vanphong/HP%20ENVY%20x360%2013-bd0063dx.jpg',0);

INSERT INTO `images` VALUES ('043','022','Samsung','./assets/img/product/vanphong/Samsung%20Galaxy%20Book%20Pro%2015.jpg',0);
INSERT INTO `images` VALUES ('044','022','Samsung','./assets/img/product/vanphong/Samsung%20Galaxy%20Book%20Pro%20360%2013.jpg',0);

INSERT INTO `images` VALUES ('045','023','Samsung','./assets/img/product/vanphong/Samsung%20Galaxy%20Book%20Pro%20360%2013.jpg',0);
INSERT INTO `images` VALUES ('046','023','Samsung','./assets/img/product/vanphong/Samsung%20Galaxy%20Book%20Pro%2015.jpg',0);

INSERT INTO `images` VALUES ('047','024','MSI','./assets/img/product/vanphong/MSI%20Modern%2015%20A5M%20238VN.jpg',0);
INSERT INTO `images` VALUES ('048','024','MSI','./assets/img/product/vanphong/MSI%20Modern%2015%20A5M%20238VN.jpg',0);

INSERT INTO `images` VALUES ('049','025','HP','./assets/img/product/vanphong/Laptop%20HP%2015%20-%20DW3058CL.jpg',0);
INSERT INTO `images` VALUES ('050','025','HP','./assets/img/product/vanphong/Laptop%20HP%2014%20-%20dq2020nr.jpg',0);

INSERT INTO `images` VALUES ('051','026','Lenovo','./assets/img/product/vanphong/Lenovo%20ThinkPad%20X1%20Nano%202021.jpg',0);
INSERT INTO `images` VALUES ('052','026','Lenovo','./assets/img/product/vanphong/Lenovo%20ThinkPad%20E14.jpg',0);

INSERT INTO `images` VALUES ('053','027','Asus','./assets/img/product/vanphong/Asus%20VivoBook%20M433IA-EB619T.jpg',0);
INSERT INTO `images` VALUES ('054','027','Asus','./assets/img/product/vanphong/Asus%20Vivobook%20X515JA.jpg',0);

INSERT INTO `images` VALUES ('055','028','Asus','./assets/img/product/gaming/Laptop%20Asus%20TUF%20Gaming%20FX506HM.jpg',0);
INSERT INTO `images` VALUES ('056','028','Asus','./assets/img/product/gaming/Laptop%20Asus%20TUF%20Gaming%20FX506LHB.jpg',0);

INSERT INTO `images` VALUES ('057','029','Asus','./assets/img/product/gaming/Laptop%20Asus%20TUF%20Gaming%20FX506LHB.jpg',0);
INSERT INTO `images` VALUES ('058','029','Asus','./assets/img/product/gaming/Laptop%20Asus%20TUF%20Gaming%20FX506HM.jpg',0);

INSERT INTO `images` VALUES ('059','030','Lenovo','./assets/img/product/gaming/Laptop%20Lenovo%20Ideapad%20Gaming%203%2015IAH7.jpg',0);
INSERT INTO `images` VALUES ('060','030','Lenovo','./assets/img/product/gaming/Laptop%20Lenovo%20IdeaPad%20Gaming%203%2015IHU6.jpg',0);

INSERT INTO `images` VALUES ('061','031','Lenovo','./assets/img/product/gaming/Laptop%20Lenovo%20IdeaPad%20Gaming%203%2015IHU6.jpg',0);
INSERT INTO `images` VALUES ('062','031','Lenovo','./assets/img/product/gaming/Laptop%20Lenovo%20Ideapad%20Gaming%203%2015IAH7.jpg',0);

INSERT INTO `images` VALUES ('063','032','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GF63%20Thin%2011UC.jpg',0);
INSERT INTO `images` VALUES ('064','032','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20Pulse%20GL66%2011UDK.jpg',0);

INSERT INTO `images` VALUES ('065','033','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20Pulse%20GL66%2011UDK.jpg',0);
INSERT INTO `images` VALUES ('066','033','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GF63%20Thin%2011UC.jpg',0);

INSERT INTO `images` VALUES ('067','034','Dell','./assets/img/product/gaming/Laptop%20Dell%20Gaming%20G15%205515.jpg',0);
INSERT INTO `images` VALUES ('068','034','Dell','./assets/img/product/gaming/Laptop%20Dell%20Gaming%20Alienware%20m15%20R6.jpg',0);

INSERT INTO `images` VALUES ('069','035','Acer','./assets/img/product/gaming/Laptop%20Acer%20Aspire%207%20Gaming%20A715%2042G%20R4XX.jpg',0);
INSERT INTO `images` VALUES ('070','035','Acer','./assets/img/product/gaming/Laptop%20Acer%20Nitro%205%20Gaming%20AN515%2045%20R6EV.jpg',0);

INSERT INTO `images` VALUES ('071','036','Acer','./assets/img/product/gaming/Laptop%20Acer%20Nitro%205%20Gaming%20AN515%2057%20553E.jpg',0);
INSERT INTO `images` VALUES ('072','036','Acer','./assets/img/product/gaming/Laptop%20Acer%20Aspire%207%20Gaming%20A715%2042G%20R4XX.jpg',0);
INSERT INTO `images` VALUES ('073','037','HP','./assets/img/product/gaming/Laptop%20HP%20VICTUS%2016%20d0292TX.jpg',0);
INSERT INTO `images` VALUES ('074','037','HP','./assets/img/product/gaming/Laptop%20HP%20VICTUS%2016%20d0292TX.jpg',0);

INSERT INTO `images` VALUES ('075','038','Acer','./assets/img/product/gaming/Laptop%20Acer%20Nitro%205%20Gaming%20AN515%2045%20R6EV.jpg',0);
INSERT INTO `images` VALUES ('076','038','Acer','./assets/img/product/gaming/Laptop%20Acer%20Nitro%205%20Gaming%20AN515%2057%20553E.jpg',0);

INSERT INTO `images` VALUES ('077','039','Asus','./assets/img/product/gaming/Laptop%20Asus%20ROG%20Strix%20Gaming%20G513IH.jpg',0);
INSERT INTO `images` VALUES ('078','039','Asus','./assets/img/product/gaming/Laptop%20Asus%20TUF%20Gaming%20FX507Z.jpg',0);

INSERT INTO `images` VALUES ('079','040','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20Bravo%2015%20B5DD.jpg',0);
INSERT INTO `images` VALUES ('080','040','MSI','./assets/img/product/gaming/Laptop%20MSI%20Creator%20Z16P%20B12UGST.jpg',0);

INSERT INTO `images` VALUES ('081','041','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20Alpha%2015%20B5EEK.jpg',0);
INSERT INTO `images` VALUES ('082','041','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20Bravo%2015%20B5DD.jpg',0);

INSERT INTO `images` VALUES ('083','042','MSI','./assets/img/product/gaming/Laptop%20MSI%20Creator%20Z16P%20B12UGST.jpg',0);
INSERT INTO `images` VALUES ('084','042','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20Alpha%2015%20B5EEK.jpg',0);

INSERT INTO `images` VALUES ('085','043','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GE66%20Raider%2011UH.jpg',0);
INSERT INTO `images` VALUES ('086','043','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GS66%20Stealth%2011UG.jpg',0);

INSERT INTO `images` VALUES ('087','044','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GS66%20Stealth%2011UG.jpg',0);
INSERT INTO `images` VALUES ('088','044','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GE66%20Raider%2011UH.jpg',0);

INSERT INTO `images` VALUES ('089','045','Dell','./assets/img/product/gaming/Laptop%20Dell%20Gaming%20Alienware%20m15%20R6.jpg',0);
INSERT INTO `images` VALUES ('090','045','Dell','./assets/img/product/gaming/Laptop%20Dell%20Gaming%20G15%205515.jpg',0);

INSERT INTO `images` VALUES ('091','046','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GE66%20Raider%2011UG.jpg',0);
INSERT INTO `images` VALUES ('092','046','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20Vector%20GP66%2012UGS.jpg',0);

INSERT INTO `images` VALUES ('093','047','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20Vector%20GP66%2012UGS.jpg',0);
INSERT INTO `images` VALUES ('094','047','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GE66%20Raider%2011UG.jpg',0);

INSERT INTO `images` VALUES ('095','048','Asus','./assets/img/product/gaming/Laptop%20Asus%20Gaming%20ROG%20Flow%20Z13%20GZ301Z.jpg',0);
INSERT INTO `images` VALUES ('096','048','Asus','./assets/img/product/gaming/Laptop%20Asus%20TUF%20Gaming%20FX507Z.jpg',0);

INSERT INTO `images` VALUES ('097','049','Asus','./assets/img/product/gaming/Laptop%20Asus%20TUF%20Gaming%20FX507Z.jpg',0);
INSERT INTO `images` VALUES ('098','049','Asus','./assets/img/product/gaming/Laptop%20Asus%20Gaming%20ROG%20Flow%20Z13%20GZ301Z.jpg',0);

INSERT INTO `images` VALUES ('099','050','Lenovo','./assets/img/product/gaming/Laptop%20Lenovo%20Legion%205%2015IAH7.jpg',0);
INSERT INTO `images` VALUES ('100','050','Lenovo','./assets/img/product/gaming/Laptop%20Lenovo%20Gaming%20Legion%205%2015ACH6.jpg',0);

INSERT INTO `images` VALUES ('101','051','Dell','./assets/img/product/gaming/Laptop%20Dell%20Gaming%20G15%205511.jpg',0);
INSERT INTO `images` VALUES ('102','051','Dell','./assets/img/product/gaming/Laptop%20Dell%20Gaming%20G15%205515.jpg',0);

INSERT INTO `images` VALUES ('103','052','Asus','./assets/img/product/gaming/Laptop%20Asus%20ROG%20Strix%20Gaming%20G513R.jpg',0);
INSERT INTO `images` VALUES ('104','052','Asus','./assets/img/product/gaming/Laptop%20Asus%20TUF%20Gaming%20FA507RC.jpg',0);

INSERT INTO `images` VALUES ('105','053','Lenovo','./assets/img/product/gaming/Laptop%20Lenovo%20Gaming%20Legion%205%2015ACH6.jpg',0);
INSERT INTO `images` VALUES ('106','053','Lenovo','./assets/img/product/gaming/Laptop%20Lenovo%20Legion%205%2015IAH7.jpg',0);

INSERT INTO `images` VALUES ('107','054','Asus','./assets/img/product/gaming/Laptop%20Asus%20TUF%20Gaming%20FA507RC.jpg',0);
INSERT INTO `images` VALUES ('108','054','Asus','./assets/img/product/gaming/Laptop%20Asus%20ROG%20Strix%20Gaming%20G513R.jpg',0);

INSERT INTO `images` VALUES ('109','055','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GF63%20Thin%2011UD.jpg',0);
INSERT INTO `images` VALUES ('110','055','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GF63%20Thin%2010SC.jpg',0);

INSERT INTO `images` VALUES ('111','056','Acer','./assets/img/product/gaming/Laptop%20Acer%20Aspire%207%20Gaming%20A715%2042G%20R05G.jpg',0);
INSERT INTO `images` VALUES ('112','056','Acer','./assets/img/product/gaming/Laptop%20Acer%20Nitro%205%20Gaming%20AN515%2057%20553E.jpg',0);

INSERT INTO `images` VALUES ('113','057','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GF63%20Thin%2010SC.jpg',0);
INSERT INTO `images` VALUES ('114','057','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GF63%20Thin%2011UD.jpg',0);

INSERT INTO `images` VALUES ('115','058','Dell','./assets/img/product/mac_dohoa/Dell%20Precision%207510.jpg',0);
INSERT INTO `images` VALUES ('116','058','Dell','./assets/img/product/mac_dohoa/Dell%20Precision%207720.jpg',0);

INSERT INTO `images` VALUES ('117','059','Dell','./assets/img/product/mac_dohoa/Dell%20Precision%207720.jpg',0);
INSERT INTO `images` VALUES ('118','059','Dell','./assets/img/product/mac_dohoa/Dell%20Precision%207510.jpg',0);

INSERT INTO `images` VALUES ('119','060','Dell','./assets/img/product/mac_dohoa/Dell%20Precision%205530.jpg',0);
INSERT INTO `images` VALUES ('120','060','Dell','./assets/img/product/mac_dohoa/Dell%20Precision%207720.jpg',0);

INSERT INTO `images` VALUES ('121','061','Dell','./assets/img/product/mac_dohoa/Dell%20Precision%205550.jpg',0);
INSERT INTO `images` VALUES ('122','061','Dell','./assets/img/product/mac_dohoa/Dell%20Precision%205530.jpg',0);

INSERT INTO `images` VALUES ('123','062','Dell','./assets/img/product/mac_dohoa/Dell%20Precision%205550%20i7.jpg',0);
INSERT INTO `images` VALUES ('124','062','Dell','./assets/img/product/mac_dohoa/Dell%20Precision%205550.jpg',0);

INSERT INTO `images` VALUES ('125','063','HP','./assets/img/product/mac_dohoa/HP%20Zbook%2015%20G2.jpg',0);
INSERT INTO `images` VALUES ('126','063','HP','./assets/img/product/mac_dohoa/HP%20Zbook%2017%20G2.jpg',0);

INSERT INTO `images` VALUES ('127','064','HP','./assets/img/product/mac_dohoa/HP%20Zbook%2017%20G2.jpg',0);
INSERT INTO `images` VALUES ('128','064','HP','./assets/img/product/mac_dohoa/HP%20Zbook%2015%20G2.jpg',0);

INSERT INTO `images` VALUES ('129','065','Macbook','./assets/img/product/mac_dohoa/Macbook%20Air%20M1.jpg"',0);
INSERT INTO `images` VALUES ('130','065','Macbook','./assets/img/product/mac_dohoa/Macbook%20Air%20M2.jpg',0);

INSERT INTO `images` VALUES ('131','066','Macbook','./assets/img/product/mac_dohoa/Macbook%20Air%20M2.jpg',0);
INSERT INTO `images` VALUES ('132','066','Macbook','./assets/img/product/mac_dohoa/Macbook%20Air%20M1.jpg',0);

INSERT INTO `images` VALUES ('133','067','Macbook','./assets/img/product/mac_dohoa/Macbook%20Air%20M2.jpg',0);
INSERT INTO `images` VALUES ('134','067','Macbook','./assets/img/product/mac_dohoa/Macbook%20Air%20M1.jpg',0);

INSERT INTO `images` VALUES ('135','068','Macbook','./assets/img/product/mac_dohoa/Macbook%20Air%20M2.jpg',0);
INSERT INTO `images` VALUES ('136','068','Macbook','./assets/img/product/mac_dohoa/Macbook%20Air%20M2.jpg',0);

INSERT INTO `images` VALUES ('137','069','Macbook','./assets/img/product/mac_dohoa/Macbook%20Pro%20M1.jpg',0);
INSERT INTO `images` VALUES ('138','069','Macbook','./assets/img/product/mac_dohoa/Macbook%20Pro%20M2.jpg',0);

INSERT INTO `images` VALUES ('139','070','Macbook','./assets/img/product/mac_dohoa/Macbook%20Pro%20M1.jpg',0);
INSERT INTO `images` VALUES ('140','070','Macbook','./assets/img/product/mac_dohoa/Macbook%20Pro%20M2.jpg',0);

INSERT INTO `images` VALUES ('141','071','Macbook','./assets/img/product/mac_dohoa/Macbook%20Pro%20M1.jpg',0);
INSERT INTO `images` VALUES ('142','071','Macbook','./assets/img/product/mac_dohoa/Macbook%20Pro%20M2.jpg',0);

INSERT INTO `images` VALUES ('143','072','Macbook','./assets/img/product/mac_dohoa/Macbook%20Pro%20M2.jpg',0);
INSERT INTO `images` VALUES ('144','072','Macbook','./assets/img/product/mac_dohoa/Macbook%20Pro%20M1.jpg',0);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `logID` int NOT NULL,
  `level` tinyint(4) NOT NULL,
  `user_id` int DEFAULT NULL,
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `create_at` datetime NOT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`logID`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `order_id` int(11) NOT NULL,
  `product_id` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` tinyint NULL DEFAULT NULL,
  `price` decimal(10, 1) NULL DEFAULT NULL,
  `total` decimal(65, 1) NULL DEFAULT NULL,
  INDEX `order_id`(`order_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (1, '044', 1, 64990000.0, 64990000.0);
INSERT INTO `order_details` VALUES (1, '071', 2, 64490000.0, 128980000.0);
INSERT INTO `order_details` VALUES (1, '063', 4, 16500000.0, 66000000.0);
INSERT INTO `order_details` VALUES (2, '005', 1, 20990000.0, 20990000.0);
INSERT INTO `order_details` VALUES (3, '046', 1, 59990000.0, 59990000.0);
INSERT INTO `order_details` VALUES (3, '060', 1, 23500000.0, 23500000.0);
INSERT INTO `order_details` VALUES (4, '062', 2, 52990000.0, 105980000.0);
INSERT INTO `order_details` VALUES (5, '069', 10, 33990000.0, 339900000.0);
INSERT INTO `order_details` VALUES (6, '003', 3, 21890000.0, 65670000.0);
INSERT INTO `order_details` VALUES (7, '035', 1, 14990000.0, 14990000.0);
INSERT INTO `order_details` VALUES (8, '040', 5, 18490000.0, 92450000.0);
INSERT INTO `order_details` VALUES (9, '064', 1, 16300000.0, 16300000.0);
INSERT INTO `order_details` VALUES (10, '024', 2, 19990000.0, 39980000.0);
INSERT INTO `order_details` VALUES (10, '023', 1, 29990000.0, 29990000.0);
INSERT INTO `order_details` VALUES (10, '004', 1, 26890000.0, 26890000.0);
INSERT INTO `order_details` VALUES (11, '023', 2, 29990000.0, 59980000.0);
INSERT INTO `order_details` VALUES (12, '065', 1, 33490000.0, 33490000.0);
INSERT INTO `order_details` VALUES (13, '034', 1, 23490000.0, 23490000.0);
INSERT INTO `order_details` VALUES (13, '006', 1, 22490000.0, 22490000.0);
INSERT INTO `order_details` VALUES (14, '014', 7, 10990000.0, 76930000.0);
INSERT INTO `order_details` VALUES (15, '027', 1, 17490000.0, 17490000.0);
INSERT INTO `order_details` VALUES (16, '021', 1, 13990000.0, 13990000.0);
INSERT INTO `order_details` VALUES (17, '011', 1, 22990000.0, 22990000.0);
INSERT INTO `order_details` VALUES (17, '025', 1, 18990000.0, 18990000.0);
INSERT INTO `order_details` VALUES (18, '067', 1, 32990000.0, 32990000.0);
INSERT INTO `order_details` VALUES (19, '056', 3, 20490000.0, 61470000.0);
INSERT INTO `order_details` VALUES (20, '023', 1, 29990000.0, 29990000.0);
INSERT INTO `order_details` VALUES (21, '052', 1, 29190000.0, 29190000.0);
INSERT INTO `order_details` VALUES (22, '064', 3, 16300000.0, 48900000.0);
INSERT INTO `order_details` VALUES (23, '037', 10, 22190000.0, 221900000.0);
INSERT INTO `order_details` VALUES (24, '015', 1, 12890000.0, 12890000.0);
INSERT INTO `order_details` VALUES (25, '072', 1, 45990000.0, 45990000.0);
INSERT INTO `order_details` VALUES (26, '020', 3, 16990000.0, 50970000.0);
INSERT INTO `order_details` VALUES (27, '035', 1, 14990000.0, 14990000.0);
INSERT INTO `order_details` VALUES (27, '063', 10, 16500000.0, 165000000.0);
INSERT INTO `order_details` VALUES (28, '066', 1, 33490000.0, 33490000.0);
INSERT INTO `order_details` VALUES (28, '058', 2, 17500000.0, 35000000.0);
INSERT INTO `order_details` VALUES (28, '003', 1, 21890000.0, 21890000.0);
INSERT INTO `order_details` VALUES (28, '016', 2, 15900000.0, 31800000.0);
INSERT INTO `order_details` VALUES (28, '030', 4, 26190000.0, 104760000.0);
INSERT INTO `order_details` VALUES (28, '064', 1, 16300000.0, 16300000.0);
INSERT INTO `order_details` VALUES (29, '063', 1, 16500000.0, 16500000.0);
INSERT INTO `order_details` VALUES (29, '053', 1, 27990000.0, 27990000.0);
INSERT INTO `order_details` VALUES (30, '045', 1, 61990000.0, 61990000.0);
INSERT INTO `order_details` VALUES (30, '035', 1, 14990000.0, 14990000.0);
INSERT INTO `order_details` VALUES (30, '069', 4, 33990000.0, 135960000.0);
INSERT INTO `order_details` VALUES (30, '018', 1, 20890000.0, 20890000.0);
INSERT INTO `order_details` VALUES (31, '013', 5, 23990000.0, 119950000.0);
INSERT INTO `order_details` VALUES (31, '005', 1, 20990000.0, 20990000.0);
INSERT INTO `order_details` VALUES (31, '070', 1, 52490000.0, 52490000.0);
INSERT INTO `order_details` VALUES (31, '071', 1, 64490000.0, 64490000.0);
INSERT INTO `order_details` VALUES (31, '050', 1, 34690000.0, 34690000.0);
INSERT INTO `order_details` VALUES (32, '036', 1, 24990000.0, 24990000.0);
INSERT INTO `order_details` VALUES (32, '008', 1, 24890000.0, 24890000.0);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderID` int(11) NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_date` datetime NULL DEFAULT NULL,
  `payment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`orderID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 'Hồ Thanh Nghĩa', '0987654321', '20130333@st.hcmuaf.edu.vn', 'Thành phố Biên Hòa, Tỉnh Đồng Nai', '', '2023-04-13 22:40:47', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (2, 'Bùi Quốc Long', '0878423951', '20130314@st.hcmuaf.edu.vn', 'KP.6, P. Linh Trung, TP. Thủ Đức, TP.HCM', 'Giao trước 17h', '2023-04-13 22:42:09', 'Tiền mặt', 0);
INSERT INTO `orders` VALUES (3, 'Diệp Chấn Phong', '0123456789', '20130364@st.hcmuaf.edu.vn', 'KP.6, P. Linh Trung, TP. Thủ Đức, TP.HCM', '', '2023-04-13 23:06:57', 'Tiền mặt', 0);
INSERT INTO `orders` VALUES (4, 'Vũ Nguyễn Hải Đăng', '0155241001', 'vnhdang@vus.edu.vn', 'Trị An, H. Vĩnh Cửu, T. Đồng Nai', '', '2023-04-13 23:08:22', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (5, 'Lê Nguyệt Minh', '0230300636', 'minhleecycling@fpt.com.vn', 'Sư Vạn Hạnh, Q.10, TP.HCM', 'In hóa đơn đỏ cho công ty', '2023-04-13 23:10:11', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (6, 'Nguyễn Thúc Thùy Tiên', '0755891860', 'tienntt@gmail.com', 'Phú Mỹ Hưng, Q.7, TP.HCM', '', '2023-04-13 23:11:18', 'Tiền mặt', 0);
INSERT INTO `orders` VALUES (7, 'Trương Gia Tuệ', '0948055625', 'tuetruong@tma.vn', 'Thành phố Tân Uyên, Tỉnh Bình Dương', 'Giao trước 8h', '2023-04-13 23:12:15', 'Tiền mặt', 0);
INSERT INTO `orders` VALUES (8, 'Đỗ Hậu Hoàng', '0801869407', 'hoanghaudo@microsoft.com', 'Thành phố Dĩ An, Tỉnh Bình Dương', '', '2023-04-13 23:13:09', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (9, 'Trịnh Đức Tâm', '0969788123', 'tamtrinh22@yahoo.com', '35/8 Nguyễn Huệ, P.Bến Nghé, Q.1, TP.HCM', '', '2023-04-13 23:13:58', 'Tiền mặt', 0);
INSERT INTO `orders` VALUES (10, 'Hồ Thanh Nghĩa', '0987654321', '20130333@st.hcmuaf.edu.vn', 'Thành phố Biên Hòa, Tỉnh Đồng Nai', '', '2023-04-13 23:32:59', 'Tiền mặt', 0);
INSERT INTO `orders` VALUES (11, 'Bùi Quốc Long', '0878423951', '20130314@st.hcmuaf.edu.vn', 'KP.6, P. Linh Trung, TP. Thủ Đức, TP.HCM', '', '2023-04-13 23:33:43', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (12, 'Bùi Quốc Long', '0878423951', '20130314@st.hcmuaf.edu.vn', 'KP.6, P. Linh Trung, TP. Thủ Đức, TP.HCM', '', '2023-04-13 23:34:01', 'Tiền mặt', 0);
INSERT INTO `orders` VALUES (13, 'Diệp Chấn Phong', '0123456789', '20130364@st.hcmuaf.edu.vn', 'KP.6, P. Linh Trung, TP. Thủ Đức, TP.HCM', '', '2023-04-13 23:34:51', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (14, 'Diệp Chấn Phong', '0123456789', '20130364@st.hcmuaf.edu.vn', 'KP.6, P. Linh Trung, TP. Thủ Đức, TP.HCM', '', '2023-04-13 23:35:17', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (15, 'Phương Huyền Minh Trang', '0876944765', 'changchang@gmail.com', 'Bãi Sau, TP. Vũng Tàu, T. Bà Rịa - Vũng Tàu', '', '2023-04-13 23:36:57', 'Tiền mặt', 0);
INSERT INTO `orders` VALUES (16, 'Đoàn Thị Mỹ Dung', '0401401537', 'dungdtm@outlook.com', 'Huyện Long Thành, Tỉnh Đồng Nai', '', '2023-04-13 23:42:23', 'Tiền mặt', 0);
INSERT INTO `orders` VALUES (17, 'Đoàn Thị Mỹ Dung', '0401401537', 'dungdtm@outlook.com', 'Huyện Long Thành, Tỉnh Đồng Nai', '', '2023-04-13 23:46:29', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (18, 'Đoàn Thị Mỹ Dung', '0401401537', 'dungdtm@outlook.com', 'Thành phố Biên Hòa, Tỉnh Đồng Nai', '', '2023-04-13 23:46:56', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (19, 'Nguyễn Thúc Thùy Tiên', '0755891860', 'tienntt@gmail.com', 'Phú Mỹ Hưng, Q.7, TP.HCM', 'In hóa đơn đỏ', '2023-04-13 23:48:16', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (20, 'Nguyễn Thúc Thùy Tiên', '0755891860', 'tienntt@gmail.com', 'Phú Mỹ Hưng, Q.7, TP.HCM', '', '2023-04-13 23:48:47', 'Tiền mặt', 0);
INSERT INTO `orders` VALUES (21, 'Hồ Thanh Nghĩa', '0987654321', '20130333@st.hcmuaf.edu.vn', 'KP.6, P. Linh Trung, TP. Thủ Đức, TP.HCM', '', '2023-04-13 23:50:01', 'Tiền mặt', 0);
INSERT INTO `orders` VALUES (22, 'Hồ Thanh Nghĩa', '0987654321', '20130333@st.hcmuaf.edu.vn', 'Thành phố Biên Hòa, Tỉnh Đồng Nai', '', '2023-04-13 23:50:17', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (23, 'Hồ Thanh Nghĩa', '0987654321', '20130333@st.hcmuaf.edu.vn', 'Phú Mỹ Hưng, Q.7, TP.HCM', '', '2023-04-13 23:50:39', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (24, 'Trần Hoàng Bảo Hân', '0637073967', 'hantran2007@gmail.com', 'Huyện Châu Thành, Tỉnh Bà Rịa - Vũng Tàu', '', '2023-04-13 23:55:36', 'Tiền mặt', 0);
INSERT INTO `orders` VALUES (25, 'Trần Hoàng Bảo Hân', '0637073967', 'hantran2007@gmail.com', 'Huyện Châu Thành, Tỉnh Bà Rịa - Vũng Tàu', '', '2023-04-13 23:55:53', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (26, 'Trần Hoàng Bảo Hân', '0637073967', 'hantran2007@gmail.com', 'Huyện Châu Thành, Tỉnh Bà Rịa - Vũng Tàu', '', '2023-04-13 23:56:13', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (27, 'Đỗ Hùng Dũng', '0670129725', 'hungdungdo@gmail.com', 'Đ. Điện Biên Phủ, P.22, Q. Bình Thạnh, TP.HCM', '', '2023-04-14 10:51:18', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (28, 'Nguyễn Phúc Hải', '0374858979', 'haiphuc333@outlook.com', 'Thành phố Biên Hòa, Tỉnh Đồng Nai', '', '2023-04-14 10:59:00', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (29, 'Nguyễn Phúc Hải', '0374858979', 'haiphuc333@outlook.com', 'Thành phố Biên Hòa, Tỉnh Đồng Nai', '', '2023-04-14 10:59:46', 'Tiền mặt', 0);
INSERT INTO `orders` VALUES (30, 'Nguyễn Phúc Hải', '0374858979', 'haiphuc333@outlook.com', 'Thành phố Biên Hòa, Tỉnh Đồng Nai', '', '2023-04-14 11:00:32', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (31, 'Đỗ Hùng Dũng', '0670129725', 'hungdungdo@outlook.com', 'Thành phố Biên Hòa, Tỉnh Đồng Nai', 'In hóa đơn đỏ', '2023-04-14 11:04:09', 'Chuyển khoản', 0);
INSERT INTO `orders` VALUES (32, 'Đỗ Hùng Dũng', '0670129725', 'hungdungdo@outlook.com', 'KP.6, P. Linh Trung, TP. Thủ Đức, TP.HCM', '', '2023-04-14 11:05:24', 'Tiền mặt', 0);

-- ----------------------------
-- Table structure for prices
-- ----------------------------
DROP TABLE IF EXISTS `prices`;
CREATE TABLE `prices`  (
  `product_id` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_price` decimal(10, 1) NULL DEFAULT NULL,
  `out_price` decimal(10, 1) NULL DEFAULT NULL,
  `quanity` int NULL DEFAULT NULL,
  `import_date` datetime NULL DEFAULT NULL,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;
-- ----------------------------
-- Records of prices
-- ----------------------------
INSERT INTO `prices` VALUES ('001', 24990000.0, 29990000.0, 30, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('002', 19890000.0, 22890000.0, 12, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('003', 19890000.0, 21890000.0, 35, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('004', 22000000.0, 26890000.0, 13, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('005', 17000000.0, 20990000.0, 16, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('006', 19000000.0, 22490000.0, 149, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('007', 18990000.0, 21890000.0, 74, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('008', 20000000.0, 24890000.0, 64, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('009', 19990000.0, 22890000.0, 38, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('010', 17000000.0, 21990000.0, 40, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('011', 19000000.0, 22990000.0, 92, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('012', 15900000.0, 19990000.0, 51, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('013', 20000000.0, 23990000.0, 72, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('014', 80000000.0, 10990000.0, 72, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('015', 90000000.0, 12890000.0, 74, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('016', 13890000.0, 15900000.0, 85, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('017', 16690000.0, 19890000.0, 93, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('018', 15890000.0, 20890000.0, 73, '2023-03-17 11:11:11');
INSERT INTO `prices` VALUES ('019', 66000000.0, 10990000.0, 17, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('020', 13440000.0, 16990000.0, 154, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('021', 90000000.0, 13990000.0, 0, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('022', 20000000.0, 24890000.0, 153, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('023', 23890000.0, 29990000.0, 163, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('024', 16890000.0, 19990000.0, 68, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('025', 16090000.0, 18990000.0, 0, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('026', 26990000.0, 31890000.0, 152, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('027', 13000000.0, 17490000.0, 173, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('028', 25990000.0, 30690000.0, 55, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('029', 17900000.0, 19190000.0, 134, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('030', 22890000.0, 26190000.0, 195, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('031', 23500000.0, 17490000.0, 146, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('032', 16890000.0, 22990000.0, 155, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('033', 27990000.0, 33990000.0, 123, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('034', 19990000.0, 23490000.0, 153, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('035', 11600000.0, 14990000.0, 0, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('036', 20890000.0, 24990000.0, 63, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('037', 18890000.0, 22190000.0, 13, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('038', 20490000.0, 22490000.0, 31, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('039', 17770000.0, 21190000.0, 51, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('040', 15990000.0, 18490000.0, 131, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('041', 27990000.0, 32490000.0, 41, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('042', 73390000.0, 79990000.0, 21, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('043', 71290000.0, 77990000.0, 31, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('044', 59900000.0, 64990000.0, 41, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('045', 57990000.0, 61990000.0, 53, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('046', 55000000.0, 59990000.0, 78, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('047', 51300000.0, 55990000.0, 83, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('048', 43490000.0, 49190000.0, 30, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('049', 24990000.0, 28190000.0, 63, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('050', 29090000.0, 34690000.0, 14, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('051', 30990000.0, 33990000.0, 63, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('052', 24890000.0, 29190000.0, 71, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('053', 24890000.0, 27990000.0, 53, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('054', 25890000.0, 27690000.0, 59, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('055', 22000000.0, 26490000.0, 0, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('056', 17880000.0, 20490000.0, 73, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('057', 15990000.0, 18990000.0, 90, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('058', 13000000.0, 17500000.0, 50, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('059', 15090000.0, 19300000.0, 60, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('060', 20190000.0, 23500000.0, 10, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('061', 32600000.0, 36990000.0, 30, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('062', 26890000.0, 52990000.0, 20, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('063', 13890000.0, 16500000.0, 11, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('064', 13600000.0, 16300000.0, 11, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('065', 26890000.0, 33490000.0, 13, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('066', 26890000.0, 33490000.0, 10, '2023-03-17 11:11:12');
INSERT INTO `prices` VALUES ('067', 26500000.0, 32990000.0, 20, '2023-03-17 11:11:13');
INSERT INTO `prices` VALUES ('068', 43330000.0, 46990000.0, 40, '2023-03-17 11:11:13');
INSERT INTO `prices` VALUES ('069', 28890000.0, 33990000.0, 20, '2023-03-17 11:11:13');
INSERT INTO `prices` VALUES ('070', 48900000.0, 52490000.0, 10, '2023-03-17 11:11:13');
INSERT INTO `prices` VALUES ('071', 60000000.0, 64490000.0, 17, '2023-03-17 11:11:13');
INSERT INTO `prices` VALUES ('072', 41990000.0, 45990000.0, 18, '2023-03-17 11:11:13');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `productID` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_id` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `vendor_id` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NULL DEFAULT 0,
  `deleteAt` time NULL DEFAULT NULL,
  PRIMARY KEY (`productID`) USING BTREE,
  INDEX `cat_id`(`cat_id` ASC) USING BTREE,
  INDEX `vendor_id`(`vendor_id` ASC) USING BTREE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`categoryID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendorID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('001', 'VP012', 'Dell Inspiron 16 5620', 'CPU	Intel® Core™ i7-1260P (18MB Cache, 3.40GHZ up to 4.70GHz, 12 cores, 16 Threads)\r\nRAM	16 GB, DDR4, 3200 MHz\r\nỔ cứng	512GB SSD M.2 PCIe NVMe Solid State Drive\r\nCard VGA	Intel® Iris® Xe Graphics\r\nàn hình	16.0 inch FHD+ (1920 x 1200) 60Hz, Anti-Glare Non-Touch 300nits WVA Display with ComfortView Support, 98% sRGB\r\nCamera	1080p at 30 fps FHD camera,	Dual-array microphones\r\nCổng Kết Nối	2x USB 3.2 Gen 1 ports, 1x USB 3.2 Gen 2x2 Type-C® port with DisplayPort® and Power Delivery, 1x HDMI 1.4 port, 1x Headset jack\r\nTrọng lượng	1,87kg\r\nPin	4 Cell, 54 Wh\r\nHệ điều hành	Windows 11 bản quyền\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('002', 'VP012', 'Dell Inspiron 16 5625', 'CPU	 AMD Ryzen™ 5 5625U 6-core/12-thread		\r\nRAM		8GB DDR4, 3200MHz		\r\nỔ cứng	512GB M.2 PCIe NVMe 		\r\nCard VGA	AMD Radeon™ Graphics		\r\nMàn hình	16\", FHD+ 1920x1200, 60Hz, Non-Touch, AG, Wide Viewing Angle, 250 nit, ComfortView		\r\nCamera	FHD 1080p ở tốc độ 30 khung hình / giây		\r\nMicrô		hai dãy		\r\nCổng	2 USB 3.2 Gen 1 ports, 1 USB 3.2 Gen 2 Type-C® port with DisplayPort® and Power Delivery, 1 Headset jack , 1 HDMI 1.4 port, 1 power-adapter port		\r\nTrọng lượng		1.87kg		\r\nPin		4 Cell, 54 Wh		\r\nHệ điều hành		Windows 11 bản quyền\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('003', 'VP012', 'Dell Inspiron 7415', 'CPU	AMD Ryzen 5 5500U		\r\nRAM	 8GB (1x8GB) Up to 3200MHz DDR4		\r\nỔ cứng	256GB PCIe M.2 NVMe Class 35 Solid State Drive		\r\nCard VGA	AMD® Radeon™ Graphics		\r\nMàn hình	14.0-inch FHD Touch		\r\nWebcam	720p at 30 fps HD camera, dual-array microphones		\r\nKết nối 	2 USB 3.2 Gen 1 ports 1 USB 3.2 Gen 1 (Type-C™) port 1 headset (headphone and microphone combo) port 1 HDMI 1.4b port		\r\nTrọng lượng		1.56 kg\r\nPin	 4-Cell 54WHr\r\nHệ điều hành	Window 10 bản quyền\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('004', 'VP012', ' Dell Inspiron 13 5320', 'CPU	Intel® Core™ i5-1240P (12 MB cache, 12 cores, up to 4.40 GHz)		\r\nRAM		16 GB, 2 x 8 GB, LPDDR5, 4800 MHz		\r\nỔ cứng	512GB M.2 NVMe™ PCIe® SSDD		\r\nVGA		Intel® Iris® Xe Graphics		\r\nMàn hình	13.3-inch, QHD+ 2560 x 1600, 60 Hz, anti-glare, non-touch, sRGB 100% (typical), 300 nits (typical), wide-viewing angle, ComfortView Plus		\r\nMux Switch		Không		\r\nCổng kết nối	2 Type-C, 1 HDMI, 1 Jack 3.5 mm, 1 Thunderbolt	\r\nTrọng lượng		1,25 kg		\r\nPin		54WHrs		\r\nHệ điều hành	Windows 11 bản quyền	\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('005', 'VP012', 'Dell Inspiron 15 5510', 'CPU	Intel® Core™ i5-11300H Processor 	\r\nRAM		8GB DDR4 3200MHz		\r\nỔ cứng	SSD 256GB PCIe M.2 NVMe 		\r\nCard VGA	Intel® Iris® Xe Graphics	\r\nMàn hình	15.6-inch, FHD 1920 x 1080, 60 Hz, anti-glare, non-touch, wide-viewing angle		\r\nCamera	720p at 30 fps HD camera, dual-array microphones		\r\nCổng Kết Nối		1 x USB 3.2 Gen 1 Type-C™ port with DisplayPort and PowerDelivery | 2 x USB A 3.2 Gen 1 ports | 1 x Jack 3.5 | 1x HDMI 1.4 port | 1 x Power jack		\r\nTrọng lượng	1.63kg	\r\nPin		4-Cell Battery, 54WHr (Integrated)	\r\nHệ điều hành	Windows 10 bản quyền		\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('006', 'VP012', 'Dell Inspiron 15 7501', 'CPU	 Intel® Core™ i5-10300H Processor 	\r\nRAM		8GB DDR4 3200MHz	\r\nỔ cứng	SSD 256GB PCIe M.2 NVMe 	\r\nCard VGA	Intel® UHD Graphics		\r\nMàn hình	15.6-inch, FHD 1920 x 1080, 60 Hz, anti-glare, non-touch, 95%sRGB, 300 nits, wide-viewing angle		\r\nCamera		720p at 30 fps HD camera, dual-array microphones		\r\nCổng Kết Nối		1 x USB 3.2 Gen 1 Type-C™ port with DisplayPort and PowerDelivery | 2 x USB A 3.2 Gen 1 ports | 1 x Jack 3.5 | 1x HDMI 1.4 port | 1 x Power jack		\r\nTrọng lượng		1.8kg			\r\nPin	3-Cell Battery, 56WHr (Integrated)	\r\nHệ điều hành	Windows 10 bản quyền	\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('007', 'VP012', 'Dell Vostro 5410', 'CPU	 Intel® Core™ i5-11320H Processor (8MB Cache, up to 4.4GHz)		\r\nRAM	8GB, 2x4GB, DDR4, 3200MHz		\r\nỔ cứng	256GB M.2 PCIe NVMe Solid State Drive		\r\nCard VGA	Intel® Iris® Xe Graphics		\r\nMàn hình	14.0Inch FHD (1920 x 1080) Anti-Glare LED Backlight Non-Touch Narrow Border WVA Display		\r\nTrọng lượng		1.44kg		\r\nPin		4 Cell 54Wh		\r\nHệ điều hành	Windows 10 bản quyền		\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('008', 'VP012', 'Dell Vostro 16 5620', 'CPU	Intel® Core™ i5-1240P (12 MB cache, 12 cores, 16 threads, up to 4.40 GHz Turbo)		\r\nRAM		8 GB, DDR4, 3200 MHz		\r\nỔ cứng	256GB, M.2, PCIe NVMe, SSD		\r\nCard VGA	Intel® Iris® Xe Graphics		\r\nMàn hình	16.0-inch 16:10 FHD+ (1920 x 1200) Anti-Glare Non-Touch 250nits WVA Display with ComfortView Support		\r\nCamera	1080p at 30 fps FHD camera | Dual-array microphones\r\nCổng Kết Nối	2x USB 3.2 Gen 1 ports | 1x USB 3.2 Gen 2x2 Type-C® port with DisplayPort® and Power Delivery | 1x HDMI 1.4 port | 1x Headset jack		\r\nTrọng lượng		1,91kg	\r\nPin		4 Cell, 54 Wh		\r\nHệ điều hành	Windows 11 bản quyền		\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('009', 'VP012', 'Dell Vostro 13 5310', 'CPU	Intel Core i5 11300H (up to 4.5Ghz, 8MB cache		\r\nRAM		8GB LPDDR4x 4267Mhz onboard		\r\nỔ cứng	512GB PCIe NVMe SSD (M.2 2230)		\r\nCard VGA	MX450-2GB		\r\nMàn hình	13.3 inch 2.5K, anti-glare, non-touch, wide-viewing angle		\r\nTrọng lượng		1.25 kg		\r\nPin		4cell - 54Wh		\r\nHệ điều hành	Window 11 bản quyền		\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('010', 'VP012', 'Dell Vostro 15 5510', 'CPU	 Intel® Core™ i5-11320H Processor 		\r\nRAM		8GB DDR4 3200MHz		\r\nỔ cứng	SSD 256GB PCIe M.2 NVMe 		\r\nCard VGA	Intel® Iris® Xe Graphics		\r\nMàn hình	15.6-inch, FHD 1920 x 1080, 60 Hz		\r\nCamera	720p at 30 fps HD camera, dual-array microphones		\r\nCổng Kết Nối	1 x USB 3.2 Gen 1 Type-C™ port with DisplayPort and PowerDelivery | 2 x USB A 3.2 Gen 1 ports | 1 x Jack 3.5 | 1x HDMI 1.4 port | 1 x Power jack		\r\nTrọng lượng		1.63kg		\r\nPin		4-Cell Battery, 54WHr (Integrated)	\r\nHệ điều hành	Windows 10 bản quyền	\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('011', 'VP012', 'Lenovo IdeaPad 5 Pro', 'CPU	AMD Ryzen 5 5500U		\r\nRAM	 8GB (1x8GB) Up to 3200MHz DDR4		\r\nỔ cứng	256GB PCIe M.2 NVMe Class 35 Solid State Drive		\r\nCard VGA	AMD® Radeon™ Graphics		\r\nMàn hình	14.0-inch FHD Touch		\r\nWebcam	720p at 30 fps HD camera, dual-array microphones		\r\nKết nối		2 USB 3.2 Gen 1 ports 1 USB 3.2 Gen 1 (Type-C™) port 1 headset (headphone and microphone combo) port 1 HDMI 1.4b port		\r\nTrọng lượng		1.56 kgCPU	AMD Ryzen 5-5600H (3.30GHz up to 4.20GHz, 16MB Cache)		\r\nRAM		8GB DDR4-3200Mhz		\r\nỔ cứng	512GB SSD M.2 2280 PCIe 3.0x4 NVMe		\r\nCard VGA	Integrated AMD Radeon Graphics	\r\nMàn hình	16.0 inch WQXGA (2560x1600) IPS 350nits Anti-glare, 100% sRGB, Dolby Vision, HDR 400, Free-Sync, G-Sync, DC dimmer.		\r\nWebcam	720p + IR + ToF	\r\nTrọng lượng		1.9 kg		\r\nPin	 4 Cell, 75Whs		\r\nHệ điều hành	Windows 11 bản quyền	\r\n', '003', 0, NULL);
INSERT INTO `products` VALUES ('012', 'VP012', 'Acer Swift 3', 'CPU	AMD Ryzen 7 - 5700U\r\nRAM	8GB DDR4\r\nỔ cứng	SSD 512GB PCIe NVMe\r\nCard VGA	AMD Radeon Graphics\r\nMàn hình	14 inch FHD IPS\r\nTrọng lượng	1.19kg\r\nPin	 3 Cells\r\nHệ điều hành	Windows 10 Home\r\n', '006', 0, NULL);
INSERT INTO `products` VALUES ('013', 'VP012', 'Asus Zenbook 14 Q409 ZA', 'CPU	Intel® Core i5-1240P (upto 4.4GHz, 12 lõi | 16 luồng, 12MB Cache)		\r\nRAM		8GB LPDDR5 bus 5200MHz		\r\nỔ cứng	256GB PCIe® x2 SSD	\r\nCard VGA	Intel Iris Xe	\r\nMàn hình	14” 2.8K (2880x1800) 90Hz 100% DCI-P3 color gamut OLED Display, 600 nits	\r\nCamera	3D IR HD camera		\r\nCổng Kết Nối	2 x USB-C with Thunderbolt 4, 1 x USB-A , 1 x microSD, 1 x HDMI, 1x jack 3.5mm		\r\nTrọng lượng		1.39kg	\r\nPin		4 Cell, 75 WHrs		\r\nHệ điều hành	Windows 11 bản quyền		\r\n', '005', 0, NULL);
INSERT INTO `products` VALUES ('014', 'VP012', 'Acer Aspire 1 A115-32', 'CPU	Intel Celeron - N4500		\r\nRAM		4GB DDR4		\r\nỔ cứng	SSD 128GB PCle NVMe		\r\nCard VGA	Intel UHD Graphics		\r\nMàn hình	15.6\", 1920 x 1080 Pixel, 60 Hz, Acer ComfyView Anti-glare LED-backlit		\r\nTrọng lượng		1.9 kg		\r\nPin		48Wh	\r\nHệ điều hành	Windows 11 bản quyền	\r\n', '006', 0, NULL);
INSERT INTO `products` VALUES ('015', 'VP012', 'Asus Vivobook X515JA', 'CPU	Intel® Core™ i3-1005G1 (1.20GHz up to 3.40GHz, 4MB)		\r\nRAM		8GB DDR4		 \r\nỔ cứng	256GB NVMe SSD		\r\nCard VGA	Intel UHD		\r\nMàn hình	15.6\" HD	\r\nCamera	720P HD		\r\nTrọng lượng		1.8 kg		\r\nPin		37Wh		\r\nHệ điều hành	Windows 10 bản quyền	\r\n', '005', 0, NULL);
INSERT INTO `products` VALUES ('016', 'VP012', 'Lenovo ThinkPad E14', 'CPU	Core™ i3-10110U		\r\nRAM		8GB DDR4	\r\nỔ cứng	SSD 256GB			\r\nCard VGA	Intel Graphics HD		\r\nMàn hình	14 inch FHD		\r\nCổng kết nối	USB 2.0, USB 3.1 Gen 1, USB-C 3.1 Gen 1, HDMI, Ethernet (RJ-45), Mic / Headphone Combo Jack		\r\nTrọng lượng			1.69kg		\r\nPin			3-cell 45WHrs		\r\nHệ điều hành	Window 10 bản quyền		\r\n', '003', 0, NULL);
INSERT INTO `products` VALUES ('017', 'VP012', 'Asus Zenbook 14 Q408UG', 'CPU	AMD Ryzen 5 - 5500U		\r\nRAM		8GB LPDDR4x bus 4266MHz		\r\nỔ cứng	256GB M.2 NVMe™ PCIe® SSD (Nâng cấp tối đa 2TB)		\r\nCard VGA	NVIDIA Geforce MX450 2GB GDDR5		\r\nMàn hình	14.0\" FHD IPS (1920 x 1080) chống chói viền siêu mỏng NanoEdge | 100% sRGB		\r\nCamera	3D IR HD camera		\r\nCổng Kết Nối	2 x USB-C 3.2 Gen 2, 1 x USB-A 3.2 Gen 2 (Chỉ truyền dữ liệu), 1 x microSD , 1 x HDMI 		\r\nTrọng lượng		1.15kg		\r\nPin		63Wh		\r\nHệ điều hành	Windows 10 Home		\r\n', '005', 0, NULL);
INSERT INTO `products` VALUES ('018', 'VP012', ' HP ENVY x360 13-bd0063dx', 'CPU	Core i5-1135G7		\r\nRAM		8 GB DDR4 bus3200		\r\nỔ cứng	256 GB PCIe® NVMe™		\r\nCard VGA	Integrated Intel Iris Xe Graphics		\r\nMàn hình	13.3 FHD IPS Touch Screen		\r\nWebcam	HD cam		\r\nKết nối		1 Thunderbolt™ 4 with USB4™ Type-C® 40Gbps | 1 SuperSpeed USB Type-C® 5Gbps | 1 SuperSpeed USB Type-A 5Gbps | 1 AC smart pin | 1 headphone/microphone combo  \r\nTrọng lượng		1.32 kg		\r\nPin		3-cell, 51Wh		\r\nHệ điều hành	Windows 10 bản quyền		\r\n', '004', 0, NULL);
INSERT INTO `products` VALUES ('019', 'VP012', 'Samsung Galaxy Book Flex Alpha 2', 'CPU	Intel Celeron - N4500		\r\nRAM		4GB DDR4		\r\nỔ cứng	SSD 128GB PCle NVMe		\r\nCard VGA	Intel UHD Graphics		\r\nMàn hình	15.6\", 1920 x 1080 Pixel, 60 Hz, Acer ComfyView Anti-glare LED-backlit		\r\nTrọng lượng		1.9 kg		\r\nPin			48Wh		\r\nHệ điều hành	Windows 11 bản quyền		\r\n', '008', 0, NULL);
INSERT INTO `products` VALUES ('020', 'VP012', 'Acer Aspire 5 A514-54', 'CPU	Intel® Core™ i5-1135G7		\r\nRAM		8GB DDR4 Bus 2666 MHz		\r\nỔ cứng	SSD 256GB PCle NVMe		\r\nCard VGA	Intel Iris® Xe Graphics		\r\nMàn hình	14.0\", 1920 x 1080 Pixel, IPS, 60 Hz, Acer ComfyView Anti-glare LED-backlit		\r\nTrọng lượng		1.48 kg		\r\nPin		48Wh	\r\nHệ điều hành	Windows 10 bản quyền	\r\n', '006', 0, NULL);
INSERT INTO `products` VALUES ('021', 'VP012', 'HP 14 - dq2020nr', 'CPU	Intel® Core™ i3-1125G4 (3.00GHz up to 4.10GHz, 6MB Cache)		\r\nRAM		4GB DDR4 3200MHz	\r\nỔ cứng	128GB PCIe NVMe M.2 SSD		\r\nCard VGA	Intel UHD Graphics	\r\nMàn hình	14 Inch FHD (1920 x 1080) Anti-glare 250nits	\r\nTrọng lượng		1.46 kg		\r\nPin		3 Cells 41Whrs	\r\nHệ điều hành	Windows 10 bản quyền	\r\n', '004', 0, NULL);
INSERT INTO `products` VALUES ('022', 'VP012', 'Samsung Galaxy Book Pro 15', 'CPU	Core i5-1135G7 (4 nhân 8 luồng), Turbo 4.2 GHz, 8MB Cache		\r\nRAM		8GB LPDDR4X- 4267MHz		\r\nỔ cứng	SSD 512GB NVMe	\r\nCard VGA	Intel Iris Xe G7 (80 EUs)		\r\nMàn hình	15.6 inch FHD (1920 x 1080) AMOLED Display, 370nits		\r\nWebcam	720p HD wedcam		\r\nKết nối		1 x HDMI, 1 x Thunderbolt™ 4, 1 x USB Type-C, 1 x USB Type-A 3.2 Gen 1, 1 x Headphone out/Mic-in		\r\nTrọng lượng		1.1 kg	\r\nPin		4 Cell - 68Wh		\r\nHệ điều hành	Windows bản quyền		\r\n', '007', 0, NULL);
INSERT INTO `products` VALUES ('023', 'VP012', 'Samsung Galaxy Book Pro 360 13', 'CPU	Core i7-1165G7 (4-Core, 12MB Cache, up to 4.7GHz Max Turbo Frequency)		\r\nRAM		8GB LPDDR4x 4267MHz		\r\nỔ cứng	SSD 256G NVMe		\r\nCard VGA	Intel Iris Xe		\r\nMàn hình	13.3\" Full HD (1920 x 1080) cảm ứng, QLED, phủ màu 100% sRGB, sáng 600 nits		\r\nWebcam	720p HD wedcam 		\r\nTrọng lượng		1 kg		\r\nPin		4 Cell - 54Wh		\r\nHệ điều hành	Windows 11 bản quyền		\r\n', '008', 0, NULL);
INSERT INTO `products` VALUES ('024', 'VP012', 'MSI Modern 15 A5M 238VN', 'CPU	Ryzen 5 5500U		\r\nRAM		8GB DDR4 3200MHz		\r\nỔ cứng	512GB NVMe PCIe SSD		\r\nCard VGA	AMD Radeon Graphics		\r\nMàn hình	15.6 inch FHD(1920 x 1080)		\r\nWebcam	720p HD		\r\nTrọng lượng		1.6kg		\r\nPin		3Cell 52Whrs	\r\nHệ điều hành	Windows 11 bản quyền	\r\n', '002', 0, NULL);
INSERT INTO `products` VALUES ('025', 'VP012', 'HP 15 - DW3058CL', 'CPU	Intel® Core™ i5-1135G7		\r\nRAM		8GB DDR4 3200MHz	\r\nỔ cứng	256GB PCIe NVMe M.2 SSD		\r\nCard VGA	Integrated		\r\nMàn hình	15.6\" diagonal, FHD IPS, micro-edge, BrightView, 250 nits, 45% NTSC		\r\nTrọng lượng		1.75 kg		\r\nPin		3 Cells 41Whrs		\r\nHệ điều hành	Windows 10 bản quyền		\r\n', '003', 0, NULL);
INSERT INTO `products` VALUES ('026', 'VP012', 'Lenovo ThinkPad X1 Nano 2021', 'CPU		Core™ i5-1130G7 Processor		\r\nRAM		8GB LPDDR4x 4267MHz		\r\nỔ cứng		SSD 256 GB		\r\nCard 		VGA	Intel Iris Xe		\r\nMàn hình	13 inch 2K IPS		\r\nTrọng lượng		900gram		\r\nPin		3-cell 48WHrs		\r\nHệ điều hành	Window 10 bản quyền		\r\n', '003', 0, NULL);
INSERT INTO `products` VALUES ('027', 'VP012', 'Asus VivoBook M433IA-EB619T', 'CPU	AMD Ryzen7-4700U		\r\nRAM		8GB DDR4 bus 3200MHz		\r\nỔ cứng	SSD 512GB NVMe		\r\nCard VGA	AMD Radeon Graphics		\r\nMàn hình	14.0 FHD		\r\nWebcam	720p HD camera		\r\nCổng kết nối	HDMI 1.4, USB 3.2, USB 2.0, Thunderbolt™ 4		\r\nTrọng lượng		1.4 kg	\r\nPin		3 Cells\r\nHệ điều hành	Windows 10 bản quyền	\r\n', '005', 0, NULL);
INSERT INTO `products` VALUES ('028', 'GM010', 'Asus TUF Gaming FX506HM', 'CPU	Intel Core i7 Tiger Lake - 11800H		\r\nRAM	 8GB,DDR4 2 khe (1 khe 8 GB + 1 khe rời),3200 MHz	\r\nỔ cứng 	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB),Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)		\r\nCard Màn hình	 Card rời,RTX 3060 6GB		\r\nCamera 	HD webcam		\r\nCổng Kết Nối	LAN (RJ45),3 x USB 3.2,HDMI,Jack tai nghe 3.5 mm,Thunderbolt 4		\r\nTrọng lượng		2.3 kg	\r\nPin		4-cell Li-ion, 90 Wh	\r\nHệ điều hành	Windows 11 Home SL	\r\nĐèn bàn phím	Có	\r\n', '005', 0, NULL);
INSERT INTO `products` VALUES ('029', 'GM010', 'Asus TUF Gaming FX506LHB', 'CPU	Intel Core i5 Comet Lake - 10300H										\r\nRAM		8GB,DDR4 2 khe (1 khe 8 GB + 1 khe rời),2933MHz				\r\nỔ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)										\r\nCard Màn hình		Card rời,GTX 1650 4GB									\r\nMàn hình	15.6\",Full HD (1920 x 1080), 144Hz	\r\nCamera	HD webcam																		\r\nCổng Kết Nối	1x USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNCLAN (RJ45),USB 2.0,2 x USB 3.2,HDMI,Jack tai nghe 3.5mm	\r\nTrọng lượng		2.3 kg									\r\nPin		3-cell Li-ion, 48 Wh	\r\nHệ điều hành	Windows 11 Home SL	\r\nĐèn bàn phím	Có										\r\n', '005', 0, NULL);
INSERT INTO `products` VALUES ('030', 'GM010', 'Lenovo Ideapad Gaming 3 15IAH7', 'CPU	Intel Core i5-12500H (4 nhân hiệu năng cao, 8 nhân tiết kiệm điện)								\r\nRAM		8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz									\r\nỔ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)	\r\nCard Màn hình	Card rời,RTX 3050 4GB								\r\nMàn hình	15.6\"Full HD (1920 x 1080) 120Hz								\r\nCamera	HD webcam		\r\nCổng Kết Nối	LAN (RJ45),HDMI,Jack tai nghe 3.5 mm,2 x USB 3.2,1 x Thunderbolt 4 (hỗ trợ Power Delivery 3.0 và DisplayPort 1.4)												\r\nTrọng lượng		2.315 kg		\r\nPin		60Wh		\r\nHệ điều hành	Windows 11 Home SL		\r\nĐèn bàn phím	Có											\r\n', '003', 0, NULL);
INSERT INTO `products` VALUES ('031', 'GM010', 'Lenovo IdeaPad Gaming 3 15IHU6', 'CPU	Intel Core i5 Tiger Lake - 11300H		\r\nRAM		8 GBDDR4 2 khe (1 khe 4 GB + 1 khe 4 GB)3200 MHz	\r\nỔ cứng	Hỗ trợ thêm 1 khe cắm HDD SATA (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB (2280) / 512 GB (2242))		\r\nCard Màn hình		Card rời GTX 1650 4GB										\r\nMàn hình	15.6\"Full HD (1920 x 1080) 120Hz										\r\nCamera	HD webcam																				\r\nCổng Kết Nối	USB Type-CLAN (RJ45)2 x USB 3.2HDMIJack tai nghe 3.5  mm																					\r\nTrọng lượng		2.25 kg										\r\nPin		45 Wh		\r\nHệ điều hành	Windows 11 Home SL					\r\nĐèn bàn phím	Có		\r\n', '003', 0, NULL);
INSERT INTO `products` VALUES ('032', 'GM010', 'MSI Gaming GF63 Thin 11UC', 'CPU	Intel Core i5 Tiger Lake - 11400H						\r\nRAM		8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz				\r\nỔ cứng	Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)				\r\nCard Màn hình	Card rờiRTX 3050 4GB								\r\nMàn hình	15.6\"Full HD (1920 x 1080)								\r\nCamera	HD webcam																\r\nCổng Kết Nối	USB Type-CLAN (RJ45)3 x USB 3.2HDMIJack tai nghe 3.5 mm					\r\nTrọng lượng		1.86 kg								\r\nPin		3-cell Li-ion, 51 Wh								\r\nHệ điều hành	Windows 10 Home SL								\r\nĐèn bàn phím	Có								\r\n', '002', 0, NULL);
INSERT INTO `products` VALUES ('033', 'GM010', 'MSI Gaming Pulse GL66 11UDK', 'CPU	Intel Core i7 Tiger Lake - 11800H						\r\nRAM		16 GBDDR4 2 khe (1 khe 8 GB + 1 khe 8 GB)3200 MHz						\r\nỔ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)Không hỗ trợ khe cắm HDD						\r\nCard Màn hình		Card rời RTX 3050Ti 4GB						\r\nMàn hình	15.6\"Full HD (1920 x 1080) 144Hz						\r\nCamera	Intel Core i7 Tiger Lake - 11800H												\r\nCổng Kết Nối	USB Type-CLAN (RJ45)USB 2.0HDMIJack tai nghe 3.5 mm2 x USB 3.2						\r\nTrọng lượng		2.25 kg						\r\nPin		3 cell, 53.5 Wh						\r\nHệ điều hành	Windows 10 Home SL						\r\nĐèn bàn phím	Có						\r\n', '002', 0, NULL);
INSERT INTO `products` VALUES ('034', 'GM010', 'Dell Gaming G15 5515', 'CPU	AMD Ryzen 5 - 5600H												\r\nRAM	16 	GBDDR4 2 khe (1 khe 8 GB + 1 khe 8 GB)3200 MHz											\r\nỔ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộngKhông hỗ trợ khe cắm HDD512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB (2280) / 1 TB (2230))											\r\nCard Màn hình		Card rời RTX 3050 4GB											\r\nMàn hình	15.6\"Full HD (1920 x 1080) 120Hz											\r\nCamera	HD webcam																						\r\nCổng Kết Nối	USB Type-CLAN (RJ45)1 x USB 3.22 x USB 2.0HDMIJack tai nghe 3.5 mm							\r\nTrọng lượng		2.8 kg											\r\nPin		3-cell Li-ion, 56 Wh											\r\nHệ điều hành	Windows 11 Home SL + Office Home & Student vĩnh viễn											\r\nĐèn bàn phím	Có											\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('035', 'GM010', 'Acer Aspire 7 Gaming A715 42G R4XX', 'CPU	AMD Ryzen 5 - 5500U										\r\nRAM		8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz										\r\nỔ cứng	256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB), Không hỗ trợ khe cắm HDD, Không hỗ trợ khe cắm SSD M2 mở rộng thêm										\r\nCard Màn hình		Card rời GTX 1650 4GB										\r\nMàn hình	15.6\"Full HD (1920 x 1080)										\r\nCamera	HD webcam																			\r\nCổng Kết Nối	USB Type-CLAN (RJ45)USB 2.0HDMIJack tai nghe 3.5 mm2 x USB 3.2																			\r\nHệ điều hành	Windows 11 Home SL										\r\nĐèn bàn phím	Có										\r\n', '006', 0, NULL);
INSERT INTO `products` VALUES ('036', 'GM010', 'Acer Nitro 5 Gaming AN515 57 553E', 'CPU	Intel Core i5 Tiger Lake - 11400H															\r\nRAM		8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz															\r\nỔ cứng	Hỗ trợ khe cắm HDD SATA 2.5 inch mở rộng (nâng cấp tối đa 2 TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)															\r\nCard Màn hình		Card rời RTX 3050 4GB															\r\nMàn hình	15.6\"Full HD (1920 x 1080) 144Hz															\r\nCamera	HD webcam																												\r\nPin		4-cell Li-ion, 57.5 Wh															\r\nHệ điều hành	Windows 11 Home SL															\r\nĐèn bàn phím	Có															\r\n', '006', 0, NULL);
INSERT INTO `products` VALUES ('037', 'GM010', 'HP VICTUS 16 d0292TX', 'CPU	Windows 11 Home SL										\r\nRAM		8 GBDDR4 2 khe (1 khe 4 GB + 1 khe 4 GB)3200 MHz										\r\nỔ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)										\r\nCard Màn hình		Card rờ iRTX 3050Ti 4GB										\r\nMàn hình	16.1\"Full HD (1920 x 1080) 144Hz										\r\nCamera	HD webcam																				\r\nCổng Kết Nối	USB Type-C3 x USB 3.1LAN (RJ45)HDMIJack tai nghe 3.5 mm											\r\nTrọng lượng		2.46 kg										\r\nPin		4-cell Li-ion, 70 Wh										\r\nHệ điều hành	Windows 11 Home SL										\r\nĐèn bàn phím	Có										\r\n', '004', 0, NULL);
INSERT INTO `products` VALUES ('038', 'GM010', 'Acer Nitro 5 Gaming AN515 45 R6EV', 'CPU	Ryzen 5, 5600H, 3.3GHz													\r\nRAM		8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz													\r\nỔ cứng	Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)					\r\nCard Màn hình		GTX 1650 4GB													\r\nMàn hình	15.6\", Full HD, 144Hz													\r\nCamera	HD webcam																										\r\nCổng Kết Nối	USB Type-CLAN (RJ45)3 x USB 3.2HDMIJack tai nghe 3.5 mm													\r\nTrọng lượng		2.2 kg													\r\nPin		GTX 1650 4GB													\r\nHệ điều hành	Windows 11 Home SL													\r\nĐèn bàn phím	Có													\r\n', '006', 0, NULL);
INSERT INTO `products` VALUES ('039', 'GM010', 'Asus ROG Strix Gaming G513IH', 'CPU	Ryzen 7, 4800H, 2.9GHz										\r\nRAM		8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz										\r\nỔ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)										\r\nCard Màn hình		GTX 1650 4GB										\r\nMàn hình	15.6\", Full HD, 144Hz										\r\nCamera	Không tích hợp																				\r\nCổng Kết Nối	LAN (RJ45)3x Type-A USB 3.2 Gen 1USB Type-C (Power Delivery and DisplayPort), HDMIJack tai nghe 3.5 mm											\r\nTrọng lượng		2.1 kg										\r\nPin		4-cell, 56Wh										\r\nHệ điều hành	Windows 11							\r\nĐèn bàn phím	Có										\r\n', '005', 0, NULL);
INSERT INTO `products` VALUES ('040', 'GM010', 'MSI Gaming Bravo 15 B5DD', 'CPU	Ryzen 5, 5600H, 3.3GHz							\r\nRAM		8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz							\r\nỔ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)Không hỗ trợ khe cắm HDD							\r\nCard Màn hình	RX 5500M 4GB							\r\nMàn hình	15.6\", Full HD							\r\nCamera	HD webcam															\r\nCổng Kết Nối	USB Type-CLAN (RJ45)USB 2.02 x USB 3.2HDMIJack tai nghe 3.5 mm							\r\nTrọng lượng		2.35 kg							\r\nPin		3-cell, 52Wh								\r\nHệ điều hành	Windows 11 Home SL							\r\nĐèn bàn phím	Có							\r\n', '002', 0, NULL);
INSERT INTO `products` VALUES ('041', 'GM010', 'MSI Gaming Alpha 15 B5EEK', 'CPU	Ryzen 7, 5800H, 3.2GHz														\r\nRAM		16 GBDDR4 2 khe (1 khe 8 GB + 1 khe 8 GB)3200 MHz														\r\nỔ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe 3.0 mở rộng (có thể tháo ra, nâng cấp dung lượng không giới hạn), 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác không giới hạn dung lượng)														\r\nCard Màn hình		AMD Radeon RX 6600M, 8 GB														\r\nMàn hình	15.6\", Full HD, 144Hz														\r\nCamera	HD webcam																													\r\nCổng Kết Nối	USB Type-CLAN (RJ45)2 x USB 3.2HDMI1 x USB 2.0Jack tai nghe 3.5 mm								\r\nTrọng lượng		2.35 kg														\r\nPin		4-cell, 90Wh														\r\nHệ điều hành	Windows 11 Home SL														\r\nĐèn bàn phím	Có														\r\n', '002', 0, NULL);
INSERT INTO `products` VALUES ('042', 'GM010', 'MSI Creator Z16P B12UGST', 'CPU	i7, 12700H, 2.30 GHz						\r\nRAM		32 GBDDR5 2 khe (1 khe 16 GB + 1 khe 16 GB)5200 MHz						\r\nỔ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)2 TB SSD NVMe PCIe						\r\nCard Màn hình		RTX 3070Ti Max-Q 8GB						\r\nMàn hình	16\", 2K, 165Hz						\r\nCamera	FHD (30fps@1080p)												\r\nCổng Kết Nối	1 x USB 3.2USB Type-CThunderbolt 4 USB-CJack tai nghe 3.5 mm							\r\nTrọng lượng		2.39 kg						\r\nPin		4-cell, 90Wh						\r\nHệ điều hành	Windows 11 Home SL						\r\nĐèn bàn phím	Có						\r\n', '002', 0, NULL);
INSERT INTO `products` VALUES ('043', 'GM010', 'MSI Gaming GE66 Raider 11UH', 'CPU	i7, 11800H, 2.30 GHz							\r\nRAM		32 GBDDR4 2 khe (1 khe 16 GB + 1 khe 16 GB)3200 MHz							\r\nỔ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)2 TB SSD NVMe PCIe							\r\nCard Màn hình		RTX 3080 16GB							\r\nMàn hình	15.6\", 2K, 240Hz							\r\nCamera	FHD (30fps@1080p)														\r\nCổng Kết Nối	USB Type-CLAN (RJ45)Thunderbolt 4 USB-C3 x USB 3.2HDMIMini DisplayPortJack tai nghe 3.5 mm									\r\nTrọng lượng		2.38 Kg							\r\nPin		4-cell, 99.9Wh							\r\nHệ điều hành	Windows 10 Home SL							\r\nĐèn bàn phím	Có							\r\n', '002', 0, NULL);
INSERT INTO `products` VALUES ('044', 'GM010', 'MSI Gaming GS66 Stealth 11UG', 'CPU	i7, 11800H, 2.30 GHz						\r\nRAM		32 GBDDR4 2 khe (1 khe 16 GB + 1 khe 16 GB)3200 MHz						\r\nỔ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)2 TB SSD NVMe PCIe						\r\nCard Màn hình		RTX 3070 Max-Q 8GB						\r\nMàn hình	15.6\", Full HD, 360Hz						\r\nCamera	Camera IR												\r\nCổng Kết Nối	USB Type-CLAN (RJ45)Thunderbolt 4 USB-C3 x USB 3.2HDMIJack tai nghe 3.5 mm							\r\nTrọng lượng		2.1 Kg						\r\nPin		4-cell, 99.9Wh						\r\nHệ điều hành	Windows 10 \r\nĐèn bàn phím	Có						\r\n', '002', 0, NULL);
INSERT INTO `products` VALUES ('045', 'GM010', 'Dell Gaming Alienware m15 R6', 'CPU	i7, 11800H, 2.30 GHz															\r\nRAM		32 GBDDR4 2 khe (1 khe 16 GB + 1 khe 16 GB)3200 MHz															\r\nỔ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)1 TB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB M.2 2280 PCIe Gen 4 x 4 NVMe / 1 TB M.2 2280 PCIe Gen 3 x 4 NVMe)															\r\nCard Màn hình	RTX 3060 6GB															\r\nMàn hình	15.6\", Full HD, 165Hz															\r\nCamera	HD webcam																										\r\nCổng Kết Nối	LAN (RJ45)Thunderbolt 4 USB-C3 x USB 3.2HDMIJack tai nghe 3.5 mm																\r\nTrọng lượng		2.69 kg															\r\nPin		6-cell Li-ion, 86 Wh															\r\nHệ điều hành	LAN (RJ45)Thunderbolt 4 USB-C3 x USB 3.2HDMIJack tai nghe 3.5 mm															\r\nĐèn bàn phím	Có															\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('046', 'GM010', 'MSI Gaming GE66 Raider 11UG', 'CPU	i7, 11800H, 2.30 GHz							\r\nRAM		16 GBDDR4 2 khe (1 khe 8 GB + 1 khe 8 GB)3200 MHz								\r\nỔ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)2 TB SSD NVMe PCIe							\r\nCard Màn hình		RTX 3070 8GB							\r\nMàn hình	15.6\", Full HD, 360Hz							\r\nCamera	FHD (30fps@1080p)															\r\nCổng Kết Nối	USB Type-CLAN (RJ45)Thunderbolt 4 USB-C3 x USB 3.2HDMIMini DisplayPortJack tai nghe 3.5 mm																															\r\nTrọng lượng	2.38 Kg							\r\nPin	4-cell, 99.9Wh							\r\nHệ điều hành	Windows 10 Home SL							\r\n', '002', 0, NULL);
INSERT INTO `products` VALUES ('047', 'GM010', 'MSI Gaming Vector GP66 12UGS', 'CPU	i7, 12700H, 2.30 GHz									\r\nRAM		16 GBDDR4 2 khe (1 khe 8 GB + 1 khe 8 GB)3200 MHz									\r\nỔ cứng	1 TB SSD M.2 PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)									\r\nCard Màn hình		RTX 3070Ti 8GB									\r\nMàn hình	15.6\", 2K, 165Hz									\r\nCamera	HD webcam																			\r\nCổng Kết Nối	USB Type-CLAN (RJ45)3 x USB 3.2HDMIMini DisplayPortJack tai nghe 3.5 mm																																					\r\nTrọng lượng		2.9 kg									\r\nPin		4-cell, 65Wh									\r\nHệ điều hành	Windows 11 Home SL									\r\nĐèn bàn phím	Có									\r\n', '002', 0, NULL);
INSERT INTO `products` VALUES ('048', 'GM010', 'Asus Gaming ROG Flow Z13 GZ301Z', 'CPU	i7, 12700H, 2.30 GHz											\r\nRAM		16 GBLPDDR5 (8 GB Onboard + 8 GB Onboard)5200 MHz											\r\nỔ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)											\r\nCard Màn hình		RTX 3050 4GB											\r\nMàn hình	13.4\", Full HD+, 120Hz											\r\nCamera	HD webcam																							\r\nCổng Kết Nối	USB 2.01x USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNC1x ROG XG Mobile InterfaceThunderbolt 4 USB-CJack tai nghe 3.5 mm																																															\r\nTrọng lượng		1.18 kg											\r\nPin		4-cell, 56Wh											\r\nHệ điều hành	Windows 11 Home SL												\r\nĐèn bàn phím	Có											\r\n', '005', 0, NULL);
INSERT INTO `products` VALUES ('049', 'GM010', 'Asus TUF Gaming FX507Z', 'CPU	i7, 12700H, 2.30 GHz										\r\nRAM		16 GBDDR5 2 khe (1 khe 8 GB + 1 khe 8 GB)4800 MHz										\r\nỔ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)										\r\nCard Màn hình		RTX 3060 6GB										\r\nMàn hình	15.6\", Full HD, 144Hz										\r\nCamera	HD webcam																					\r\nCổng Kết Nối	LAN (RJ45)1 x USB 3.2 Gen 1 Type-C support DisplayPort / G-SYNCHDMIJack tai nghe 3.5 mm2 x USB 3.21 x Thunderbolt 4 (hỗ trợ DisplayPort)																																										\r\nTrọng lượng		2.2 kg										\r\nPin		4-cell, 90Wh										\r\nHệ điều hành	Windows 11 Home SL										\r\nĐèn bàn phím	Có										\r\n', '005', 0, NULL);
INSERT INTO `products` VALUES ('050', 'GM010', 'Lenovo Legion 5 15IAH7', 'CPU	i5, 12500H, 2.5GHz																			\r\nRAM		8 GBDDR5 2 khe (1 khe 8 GB + 1 khe trống)4800 MHz																			\r\nỔ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB (2280) / 512 GB (2242))																			\r\nCard Màn hình		RTX 3050Ti 4GB																			\r\nMàn hình	15.6\", Full HD, 165Hz																				\r\nCamera	Full HD 																																						\r\nCổng Kết Nối	LAN (RJ45)1 x USB 3.2 (Always on)HDMIJack tai nghe 3.5 mm2 x USB 3.21 x Thunderbolt 4 (hỗ trợ DisplayPort)1 x USB-C 3.2 Gen 2 (hỗ trợ truyền dữ liệu, Power Delivery 135W and DisplayPort 1.4)1 x USB-C 3.2 Gen 2 (support data transfer and DisplayPort 1.4)													\r\nTrọng lượng		2.35 kg																			\r\nPin		80 Wh																			\r\nHệ điều hành	Windows 11 Home SL																			\r\nĐèn bàn phím	Có																			\r\n', '003', 0, NULL);
INSERT INTO `products` VALUES ('051', 'GM010', 'Dell Gaming G15 5511', 'CPU	i7, 11800H, 2.30 GHz																		\r\nRAM		8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz																		\r\nỔ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB M.2 2280 PCIe Gen4 x4 NVMe / 1TB M.2 2280 PCIe Gen3 x4 NVMe)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB PCIe Gen 3 x4 NVMe / 2TB PCIe Gen4 x4 NVMe)																		\r\nCard Màn hình		Card rời RTX 3050 4GB																		\r\nMàn hình	15.6\", Full HD, 120Hz																		\r\nCamera	HD webcam																																					\r\nCổng Kết Nối	LAN (RJ45)3 x USB 3.2USB Type-C (Power Delivery and DisplayPort), HDMIJack tai nghe 3.5 mm																										\r\nTrọng lượng		2.81 kg																		\r\nPin		3-cell, 56Wh																		\r\nHệ điều hành	Windows 11 Home SL + Office Home & Student vĩnh viễn			\r\nĐèn bàn phím	Có																			\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('052', 'GM010', 'Asus ROG Strix Gaming G513R', 'CPU	Ryzen 7, 6800H, 3.2GHz					\r\nRAM		8 GBDDR5 2 khe (1 khe 8 GB + 1 khe trống)4800 MHz					\r\nỔ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)					\r\nCard Màn hình		RTX 3050 4GB					\r\nMàn hình	15.6\", Full HD, 144Hz					\r\nCamera	Không tích 											\r\nCổng Kết Nối	LAN (RJ45)2 x USB 3.22 x USB Type-CHDMIJack tai nghe 3.5 mm												\r\nTrọng lượng		2.1 kg					\r\nPin		4-cell, 56Wh					\r\nHệ điều hành	Windows 11 Home SL					\r\nĐèn bàn phím	Có					\r\n', '005', 0, NULL);
INSERT INTO `products` VALUES ('053', 'GM010', 'Lenovo Gaming Legion 5 15ACH6', 'CPU	Ryzen 7, 5800H, 3.2GHz											\r\nRAM		8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời) 3200 MHz											\r\nỔ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB) 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB (2280) / 512 GB (2242))											\r\nCard Màn hình		RTX 3050Ti 4GB											\r\nMàn hình	15.6\", Full HD, 165Hz											\r\nCamera	HD webcam																						\r\nCổng Kết Nối	LAN (RJ45)1 x USB 3.2 (Always on) 3 x USB 3.22 x USB Type-CHDMIJack tai nghe 3.5 mm					\r\nTrọng lượng		2.4 kg											\r\nPin		60Wh											\r\nHệ điều hành	Windows 11 Home SL											\r\nĐèn bàn phím	Có											\r\n', '003', 0, NULL);
INSERT INTO `products` VALUES ('054', 'GM010', 'Asus TUF Gaming FA507RC', 'CPU	Ryzen 7, 6800H, 3.2GHz											\r\nRAM		8 GBDDR5 2 khe (1 khe 8 GB + 1 khe trống)4800 MHz											\r\nỔ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB (2280) / 512 GB (2230))											\r\nCard Màn hình	RTX 3050 4GB											\r\nMàn hình	15.6\", Full HD, 144Hz											\r\nCamera	HD webcam																							\r\nCổng Kết Nối	LAN (RJ45)2 x USB Type-CHDMIJack tai nghe 3.5 mm2 x USB 3.2												\r\nTrọng lượng		2.2 kg											\r\nPin		4-cell, 56Wh											\r\nHệ điều hành	Windows 11 Home SL											\r\nĐèn bàn phím	Có											\r\n', '005', 0, NULL);
INSERT INTO `products` VALUES ('055', 'GM010', 'MSI Gaming GF63 Thin 11UD', 'CPU	i7, 11800H, 2.30 GHz										\r\nRAM		8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz										\r\nỔ cứng	Hỗ trợ khe cắm HDD SATA 2.5 inch mở rộng (nâng cấp tối đa 2 TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)										\r\nCard Màn hình		NVIDIA GeForce RTX 3050Ti Max-Q, 4GB										\r\nMàn hình	15.6\", Full HD										\r\nCamera	HD webcam																					\r\nCổng Kết Nối	USB Type-CLAN (RJ45)3x Type-A USB 3.2 Gen 1HDMIJack tai nghe 3.5 mm																																											\r\nTrọng lượng		1.86 kg										\r\nPin		3-cell, 51Wh										\r\nHệ điều hành	Windows 11 Home SL										\r\nĐèn bàn phím	Có										\r\n', '002', 0, NULL);
INSERT INTO `products` VALUES ('056', 'GM010', 'Acer Aspire 7 Gaming A715 42G R05G', 'CPU	Ryzen 5, 5500U, 2.1GHz										\r\nRAM		8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz										\r\nỔ cứng	Không hỗ trợ khe cắm SSD M2 mở rộng thêm512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Không hỗ trợ khe cắm HDD										\r\nCard Màn hình		GTX 1650 4GB										\r\nMàn hình	15.6\", Full HD, 144Hz										\r\nCamera	HD webcam																					\r\nCổng Kết Nối	USB Type-CLAN (RJ45)USB 2.02 x USB 3.2HDMIJack tai nghe 3.5 mm																																											\r\nTrọng lượng		2.1 kg										\r\nPin		48Wh										\r\nHệ điều hành	Windows 11 Home SL										\r\nĐèn bàn phím	Có											\r\n', '006', 0, NULL);
INSERT INTO `products` VALUES ('057', 'GM010', 'MSI Gaming GF63 Thin 10SC', 'CPU	i5, 10500H, 2.5GHz										\r\nRAM		8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz										\r\nỔ cứng	Hỗ trợ khe cắm HDD SATA 2.5 inch mở rộng (nâng cấp tối đa 2 TB) 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)										\r\nCard Màn hình		GTX 1650 Max-Q 4GB										\r\nMàn hình	15.6\", Full HD										\r\nCamera	HD webcam																					\r\nCổng Kết Nối	USB Type-CLAN (RJ45) HDMI3x Type-A USB 3.2 Gen 1Jack tai nghe 3.5 mm			\r\nTrọng lượng		1.86 kg										\r\nPin		3-cell, 51Wh										\r\nHệ điều hành	Windows 10 Home SL										\r\nĐèn bàn phím	Có										\r\n', '002', 0, NULL);
INSERT INTO `products` VALUES ('058', 'DH011', 'Dell Precision 7510', 'CPU	Core i7-6820HQ (4 nhân 8 luồng), Turbo 3.6 GHz, Cache 8MB		\r\nRAM		8GB DDR4- 2133 (up max 64G - 4 khe)		\r\nỔ cứng	SSD 256G (max 2 ổ)		\r\nCard VGA	Nvidia Quadro M1000M- 2G		\r\nMàn hình	15.6\" Full HD (1920×1080), IPS 				\r\nCổng kết nối		Lan Gigabit, Wifi 5Ghz, Bluetooth 4, HDMI, Mini DisplayPort,\r\n	USB 3.0 , Thunderbolt 3, audio + mic combo, khe SSD M.2 Nvme			\r\nTrọng lượng		2.8 Kg		\r\nPin		6 Cell 72Wh		\r\nHệ điều hành	Windows 10 Pro		\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('059', 'DH011', 'Dell Precision 7720', 'CPU	Intel Core i7-7820HQ (4 nhân 8 luồng), 2.9 Ghz, Turbo 3.9 GHz, 8MB Cache		\r\nRAM		16 GB – DDR4 Bus 2400 (Up max 64G – 4 khe)		\r\nỔ cứng	SSD 256G 	\r\nCard VGA	Nvidia Quadro M2200- 4G + Intel HD Graphics 630 chạy song song		\r\nMàn hình	15.6 inch Full HD (1920 x 1080)		\r\nTrọng lượng		2.8 Kg		\r\nPin		6 Cell 72Wh		\r\nHệ điều hành	Windows 10 Pro		\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('060', 'DH011', 'Dell Precision 5530', 'CPU	Intel i7-8850H (6 nhân 12 luồng), Turbo 4.3 GHz, Cache 9MB		\r\nRAM		16G - DDR4 bus 2666 (up max 64G - 2 khe)		\r\nỔ cứng	SSD 512 NVMe (max 2 ổ)		\r\nCard VGA	Nvidia Quadro P1000		\r\nMàn hình	15.6 inch Full HD IPS, phủ màu 100% sRGB, viền siêu mỏng		\r\nTrọng lượng		1.9 Kg		\r\nPin		6 Cell 72Wh		\r\nHệ điều hành	Windows 10 Pro		\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('061', 'DH011', 'Dell Precision 5550 Core i5', 'CPU	Intel Core Processor i5-10400H (4 Core, 8MB Cache, 2.60 GHz to 4.60 GHz, 45W, vPro)		\r\nRAM		8GB, DDR4 2933Mhz Non-ECC Memory		\r\nỔ cứng	M.2 256GB PCIe NVMe Class 35 Solid State Drive		\r\nCard VGA	NVIDIA® Quadro® T1000		\r\nMàn hình	15.6\" UltraSharp FHD+, 1920x1200,AG,NT, w/Prem Panel Guar, 100% sRGB		\r\nTrọng lượng		1.86 Kg		\r\nPin		6 Cell 72Wh		\r\nHệ điều hành	Windows 10 Pro		\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('062', 'DH011', 'Dell Precision 5550 Core i7', 'CPU	 Intel Core Processor i7-10750H (6 Core, 12MB Cache, 2.60 GHz to 5.00 GHz, 45W)		\r\nRAM		16GB, DDR4 2933Mhz Non-ECC Memory		\r\nỔ cứng	M.2 512GB PCIe NVMe Class 35 Solid State Drive		\r\nCard VGA	NVIDIA® Quadro® T1000		\r\nMàn hình	15.6\" UltraSharp FHD+, 1920x1200,AG,NT, w/Prem Panel Guar, 100% sRGB		\r\nTrọng lượng		1.86 Kg		\r\nPin		6 Cell 72Wh		\r\nHệ điều hành	Windows 10 Pro		\r\n', '001', 0, NULL);
INSERT INTO `products` VALUES ('063', 'DH011', 'HP Zbook 15 G2', 'CPU	Core i7-6700HQ ( 4 nhân 8 luồng ), Turbo 3.5 GHz, Cache 6MB		\r\nRAM		8 GB - DDR4 bus 2133 (up max 64G - 4 khe)		\r\nỔ cứng	256G SSD (max 2 ổ)		\r\nCard VGA	Nvidia Quadro M1000M- 2G & Intel HD 530 chạy song song		\r\nMàn hình	15.6 inch Full HD (1920 x 1080)			\r\nTrọng lượng		2.5kg		\r\nPin		6 Cell 72Wh		\r\nHệ điều hành	Windows 10 Pro		\r\n', '004', 0, NULL);
INSERT INTO `products` VALUES ('064', 'DH011', 'HP Zbook 17 G2', 'CPU	Intel Core i7-4810MQ (4 nhân 8 luồng), Turbo 3.8 GHz, 6MB Cache		\r\nRAM		8 GB – DDR3L Bus 1600 (Up max 32G – 4 khe)		\r\nỔ cứng	256G SSD (max 4 ổ)		\r\nCard VGA	Nvidia Quadro K4100M-4G {Optimus} 		\r\nMàn hình	17.3 inch Full HD (1920 x 1080) 		\r\nTrọng lượng		3.8kg		\r\nPin		6 Cell 72Wh		\r\nHệ điều hành	Windows 10 Pro		\r\n', '004', 0, NULL);
INSERT INTO `products` VALUES ('065', 'MB013', 'Macbook Air M1 2020 7-Core GPU', 'CPU	Apple M1		\r\nRAM		8GB, LDDR4		\r\nỔ cứng	SSD 256GB		\r\nCard VGA	Onboard 7-Core GPU		\r\nMàn hình	13.3 inch Retina (2560 x 1600), LED Backlit, IPS, 400 nits		\r\nCamera	HD Webcam (720p Webcam)		\r\nCổng kết nối	2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm		\r\nTrọng lượng		1.29kg		\r\nPin		Khoảng 10 tiếng		\r\nHệ điều hành	Mac OS		\r\n', '007', 0, NULL);
INSERT INTO `products` VALUES ('066', 'MB013', 'Macbook Air M1 2020 8-Core GPU', 'CPU	Apple M1		\r\nRAM		8GB, LDDR4		\r\nỔ cứng	SSD 512GB		\r\nCard VGA	Onboard 8-Core GPU		\r\nMàn hình	13.3 inch Retina (2560 x 1600), LED Backlit, IPS, 400 nits		\r\nCamera	HD Webcam (720p Webcam)		\r\nCổng kết nối	2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm		\r\nTrọng lượng		1.29kg		\r\nPin		Khoảng 10 tiếng		\r\nHệ điều hành	Mac OS		\r\n', '007', 0, NULL);
INSERT INTO `products` VALUES ('067', 'MB013', 'Macbook Air M2 2020 8-Core GPU', 'CPU	Apple M2		\r\nRAM		8GB, LDDR4		\r\nỔ cứng	SSD 256GB		\r\nCard VGA	Onboard 8-Core GPU		\r\nMàn hình	13.3 inch Retina (2560 x 1600), LED Backlit, IPS, 400 nits		\r\nCamera	HD Webcam (720p Webcam)		\r\nCổng kết nối	2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm		\r\nTrọng lượng		1.29kg		\r\nPin		Khoảng 10 tiếng		\r\nHệ điều hành	Mac OS		\r\n', '007', 0, NULL);
INSERT INTO `products` VALUES ('068', 'MB013', 'Macbook Air M2 2020 10-Core GPU', 'CPU	Apple M2		\r\nRAM		16GB, LDDR4		\r\nỔ cứng	SSD 512GB		\r\nCard VGA	Onboard 10-Core GPU		\r\nMàn hình	13.3 inch Retina (2560 x 1600), LED Backlit, IPS, 400 nits		\r\nCamera	HD Webcam (720p Webcam)		\r\nCổng kết nối	2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm		\r\nTrọng lượng		1.29kg		\r\nPin		Khoảng 10 tiếng		\r\nHệ điều hành	Mac OS		\r\n', '007', 0, NULL);
INSERT INTO `products` VALUES ('069', 'MB013', 'Macbook Pro 13 inch M1 2020', 'CPU	Apple M1		\r\nRAM		8GB, LDDR4		\r\nỔ cứng	SSD 256GB		\r\nCard VGA	Onboard GPU		\r\nMàn hình	13.3 inch Retina (2560 x 1600), LED Backlit, IPS, 500 nits		\r\nCamera	HD Webcam (720p Webcam)		\r\nCổng kết nối	2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm		\r\nTrọng lượng		1.29kg		\r\nPin			Khoảng 10 tiếng		\r\nHệ điều hành		Mac OS		\r\n', '007', 0, NULL);
INSERT INTO `products` VALUES ('070', 'MB013', 'Macbook Pro 14 inch M1 2021', 'CPU	Apple M1		\r\nRAM		16GB, LDDR4		\r\nỔ cứng	SSD 512GB		\r\nCard VGA	Onboard GPU		\r\nMàn hình	14.2 inch Liquid Retina XDR display (3024 x 1964) up to 120Hz		\r\nCamera	1080p FaceTime HD camera		\r\nCổng kết nối	3 x Thunderbolt 4 (USB-C), Jack tai nghe 3.5 mm, HDMI		\r\nTrọng lượng		1.6kg		\r\nPin		Khoảng 10 tiếng		\r\nHệ điều hành	Mac OS		\r\n', '007', 0, NULL);
INSERT INTO `products` VALUES ('071', 'MB013', 'Macbook Pro 16 inch M1 2021', 'CPU	Apple M1		\r\nRAM		16GB, LDDR4		\r\nỔ cứng	SSD 512GB		\r\nCard VGA	Onboard GPU		\r\nMàn hình	16.2 inch Liquid Retina XDR display (3456 x 2234) up to 120Hz		\r\nCamera	1080p FaceTime HD camera		\r\nCổng kết nối	3 x Thunderbolt 4 (USB-C), Jack tai nghe 3.5 mm, HDMI		\r\nTrọng lượng		2.1kg		\r\nPin		Khoảng 10 tiếng		\r\nHệ điều hành	Mac OS		\r\n', '007', 0, NULL);
INSERT INTO `products` VALUES ('072', 'MB013', 'Macbook Pro 13 inch M2 2022', 'CPU	Apple M2		\r\nRAM		16GB, LDDR4		\r\nỔ cứng	SSD 512GB		\r\nCard VGA	Onboard GPU		\r\nMàn hình	13.3 inch Retina (2560 x 1600), LED Backlit, IPS, 500 nits		\r\nCamera	720p FaceTime HD camera		\r\nCổng kết nối	2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm		\r\nTrọng lượng		1.4kg		\r\nPin		Khoảng 10 tiếng		\r\nHệ điều hành	Mac OS		\r\n', '007', 0, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `birthday` date NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Hồ Thanh Nghĩa', '20130333@st.hcmuaf.edu.vn', '0987654321', 'Thành phố Biên Hòa, Tỉnh Đồng Nai', '2002-05-10', 'nghia', '/MXwDW4kegBvP4LpvcpmLdBmpoaEpd6fNS9YuuSpVdY=', 1);
INSERT INTO `users` VALUES (2, 'Bùi Quốc Long', '20130314@st.hcmuaf.edu.vn', '0878423951', 'KP.6, P. Linh Trung, TP. Thủ Đức, TP.HCM', '2003-11-24', 'long', 'unyrS9T5mfrRigLSJcZwhVZRVv/fMi+JPUsis2z0A9c=', 0);
INSERT INTO `users` VALUES (3, 'Diệp Chấn Phong', '20130364@st.hcmuaf.edu.vn', '0123456789', 'KP.6, P. Linh Trung, TP. Thủ Đức, TP.HCM', '1999-02-20', 'phong', '2T1471GsMSG1Xt8kZ9m8lPwt7taM/RUHQcdIZ4MnlDw=', 1);
INSERT INTO `users` VALUES (4, 'Trịnh Đức Tâm', 'tamtrinh22@yahoo.com', '0969788123', '35/8 Nguyễn Huệ, P.Bến Nghé, Q.1, TP.HCM', '1983-07-21', 'tam22', 'ReKmONNkUuhptjog3OjU2iHTfq5T9PV5iB4clJTONyk=', 0);
INSERT INTO `users` VALUES (5, 'Đoàn Thị Mỹ Dung', 'dungdtm@outlook.com', '0401401537', 'Huyện Long Thành, Tỉnh Đồng Nai', '1974-11-28', 'mydung35', '2O0menAj+0IuA7CgosuHugl5gjYf2lP+dQ6wc4kXkFs=', 0);
INSERT INTO `users` VALUES (6, 'Đỗ Hậu Hoàng', 'hoanghaudo@microsoft.com', '0801869407', 'Thành phố Dĩ An, Tỉnh Bình Dương', '2003-04-11', 'hauhoang', 'YauN2PD+iJGODwvPAQ4q/NDzBHfnooQfvKCXGf/dTd0=', 0);
INSERT INTO `users` VALUES (7, 'Trương Gia Tuệ', 'tuetruong@tma.vn', '0948055625', 'Thành phố Tân Uyên, Tỉnh Bình Dương', '1998-12-06', 'tuetruong111', '59LF/s8wJlMSjcyU/lp+SqdYrUp3zNe0KRAVCeDRmms=', 0);
INSERT INTO `users` VALUES (8, 'Nguyễn Thúc Thùy Tiên', 'tienntt@gmail.com', '0755891860', 'Phú Mỹ Hưng, Q.7, TP.HCM', '1998-08-12', 'misstien', 'wlGF2KiLBUMmOd9aI9FMyAZPY35mkULxNl8riCNKhrM=', 0);
INSERT INTO `users` VALUES (9, 'Lê Nguyệt Minh', 'minhleecycling@fpt.com.vn', '0230300636', 'Sư Vạn Hạnh, Q.10, TP.HCM', '1986-09-02', 'minhlee35', 'iAfHhx2tBCDL5t/IepybFRVQd+kVFBwfGmGjT1WZouk=', 0);
INSERT INTO `users` VALUES (10, 'Vũ Nguyễn Hải Đăng', 'vnhdang@vus.edu.vn', '0155241001', 'Trị An, H. Vĩnh Cửu, T. Đồng Nai', '2000-01-25', 'haidang68', 'yaE65RjVff2c7Spe1JllscbDCQTn/fK8FYITPS4Sak8=', 0);
INSERT INTO `users` VALUES (11, 'Phương Huyền Minh Trang', 'changchang@gmail.com', '0876944765', 'Bãi Sau, TP. Vũng Tàu, T. Bà Rịa - Vũng Tàu', '2002-12-25', 'changchang', 'I5ktFiAYx/dfXjGg90pWyxwFLu1bXts9uWEm1EpMUu0=', 0);
INSERT INTO `users` VALUES (12, 'Trần Hoàng Bảo Hân', 'hantran2007@gmail.com', '0637073967', 'Huyện Châu Thành, Tỉnh Bà Rịa - Vũng Tàu', '2007-06-20', 'hanhancute', 't0wrBUzUrJqwlH3Ava6NeYkY6tfix7ZdrDPSDIP+uzE=', 0);

-- ----------------------------
-- Table structure for vendors
-- ----------------------------
DROP TABLE IF EXISTS `vendors`;
CREATE TABLE `vendors`  (
  `vendorID` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`vendorID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vendors
-- ----------------------------
INSERT INTO `vendors` VALUES ('001', 'Dell', 0);
INSERT INTO `vendors` VALUES ('002', 'MSI', 0);
INSERT INTO `vendors` VALUES ('003', 'Lenovo', 0);
INSERT INTO `vendors` VALUES ('004', 'HP', 0);
INSERT INTO `vendors` VALUES ('005', 'Asus', 0);
INSERT INTO `vendors` VALUES ('006', 'Acer', 0);
INSERT INTO `vendors` VALUES ('007', 'Apple', 0);
INSERT INTO `vendors` VALUES ('008', 'SamSung', 0);

SET FOREIGN_KEY_CHECKS = 1;
