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

 Date: 05/01/2023 21:51:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `categoryID` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`categoryID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('DH011', 'Đồ Họa');
INSERT INTO `category` VALUES ('GM010', 'Gaming');
INSERT INTO `category` VALUES ('MB013', 'Macbook');
INSERT INTO `category` VALUES ('VP012', 'Văn Phòng');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `feedbackID` int NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subject_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`feedbackID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `order_id` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NULL DEFAULT 0,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `FK_PD`(`product_id` ASC) USING BTREE,
  CONSTRAINT `FK_PD` FOREIGN KEY (`product_id`) REFERENCES `product` (`productID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderID` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_date` datetime NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`orderID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `productID` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cat_id` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `brand` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `discription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `quantity` int NULL DEFAULT 0,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `discount` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`productID`) USING BTREE,
  INDEX `FK_CAT`(`cat_id` ASC) USING BTREE,
  CONSTRAINT `FK_CAT` FOREIGN KEY (`cat_id`) REFERENCES `category` (`categoryID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('001', 'VP012', 'Dell Inspiron 16 5620', 'Dell', './assets/img/product/vanphong/Dell%20Inspiron%2016%205620.jpg', 'CPU	Intel® Core™ i7-1260P (18MB Cache, 3.40GHZ up to 4.70GHz, 12 cores, 16 Threads)\nRAM	16 GB, DDR4, 3200 MHz\nỔ cứng	512GB SSD M.2 PCIe NVMe Solid State Drive\nCard VGA	Intel® Iris® Xe Graphics\nMàn hình	16.0 inch FHD+ (1920 x 1200) 60Hz, Anti-Glare Non-Touch 300nits WVA Display with ComfortView Support, 98% sRGB\nCamera	1080p at 30 fps FHD camera\n	Dual-array microphones\nCổng Kết Nối	2x USB 3.2 Gen 1 ports\n	1x USB 3.2 Gen 2x2 Type-C® port with DisplayPort® and Power Delivery\n	1x HDMI 1.4 port\n	1x Headset jack\nTrọng lượng	1,87kg\nPin	4 Cell, 54 Wh\nHệ điều hành	Windows 11 bản quyền\n', 10, 29990000.00, 24990000.00);
INSERT INTO product VALUES ('002','VP012','Dell Inspiron 16 5625','Dell','./assets/img/product/vanphong/Dell%20Inspiron%2016%205620.jpg',
'CPU	 AMD Ryzen™ 5 5625U 6-core/12-thread
RAM	8GB DDR4, 3200MHz
Ổ cứng	512GB M.2 PCIe NVMe 
Card VGA	AMD Radeon™ Graphics
Màn hình	16", FHD+ 1920x1200, 60Hz, Non-Touch, AG, Wide Viewing Angle, 250 nit, ComfortView
Camera	FHD 1080p ở tốc độ 30 khung hình / giây
	Micrô hai dãy
Cổng	2 USB 3.2 Gen 1 ports
	1 USB 3.2 Gen 2 Type-C® port with DisplayPort® and Power Delivery
	1 Headset jack
	1 HDMI 1.4 port
	1 power-adapter port
Trọng lượng	1.87kg
Pin	4 Cell, 54 Wh
Hệ điều hành	Windows 11 bản quyền
',100,'22890000', '19890000');
INSERT INTO product VALUES ('003','VP012','Dell Inspiron 7415','Dell','./assets/img/product/vanphong/Dell%20Inspiron%207415.jpg',
'CPU	AMD Ryzen 5 5500U
RAM	 8GB (1x8GB) Up to 3200MHz DDR4
Ổ cứng	256GB PCIe M.2 NVMe Class 35 Solid State Drive
Card VGA	AMD® Radeon™ Graphics
Màn hình	14.0-inch FHD Touch
Webcam	720p at 30 fps HD camera, dual-array microphones
Kết nối	2 USB 3.2 Gen 1 ports 1 USB 3.2 Gen 1 (Type-C™) port 1 headset (headphone and microphone combo) port 1 HDMI 1.4b port
Trọng lượng	1.56 kg
Pin	 4-Cell 54WHr
Hệ điều hành	Window 10 bản quyền
',134,'21890000', '');
INSERT INTO product VALUES ('004','VP012',' Dell Inspiron 13 5320','Dell','./assets/img/product/vanphong/Dell%20Inspiron%2013%205320.jpg',
'CPU	Intel® Core™ i5-1240P (12 MB cache, 12 cores, up to 4.40 GHz)
RAM	16 GB, 2 x 8 GB, LPDDR5, 4800 MHz
Ổ cứng	512GB M.2 NVMe™ PCIe® SSDD
VGA	Intel® Iris® Xe Graphics
Màn hình	13.3-inch, QHD+ 2560 x 1600, 60 Hz, anti-glare, non-touch, sRGB 100% (typical), 300 nits (typical), wide-viewing angle, ComfortView Plus
Mux Switch	Không
Cổng kết nối	2 Type-C
	1 HDMI
	1 Jack 3.5 mm
	1 Thunderbolt
	
Trọng lượng	1,25 kg
Pin	54WHrs
Hệ điều hành	Windows 11 bản quyền
',34,'26890000', '');
-- chua them img
INSERT INTO product VALUES ('005','VP012','Dell Inspiron 15 5510','Dell','./assets/img/product/vanphong/Dell%20Inspiron%2015%205510.jpg',
'CPU	Intel® Core™ i5-11300H Processor 
RAM	8GB DDR4 3200MHz
Ổ cứng	SSD 256GB PCIe M.2 NVMe 
Card VGA	Intel® Iris® Xe Graphics
Màn hình	15.6-inch, FHD 1920 x 1080, 60 Hz, anti-glare, non-touch, wide-viewing angle
Camera	720p at 30 fps HD camera, dual-array microphones
Cổng Kết Nối	1 x USB 3.2 Gen 1 Type-C™ port with DisplayPort and PowerDelivery | 2 x USB A 3.2 Gen 1 ports | 1 x Jack 3.5 | 1x HDMI 1.4 port | 1 x Power jack
Trọng lượng	1.63kg
Pin	4-Cell Battery, 54WHr (Integrated)
Hệ điều hành	Windows 10 bản quyền
',78,'20990000', '');
INSERT INTO product VALUES ('006','VP012','Dell Inspiron 15 7501','Dell','./assets/img/product/vanphong/Dell%20Inspiron%2015%207501.jpg',
'CPU	 Intel® Core™ i5-10300H Processor 
RAM	8GB DDR4 3200MHz
Ổ cứng	SSD 256GB PCIe M.2 NVMe 
Card VGA	Intel® UHD Graphics
Màn hình	15.6-inch, FHD 1920 x 1080, 60 Hz, anti-glare, non-touch, 95%sRGB, 300 nits, wide-viewing angle
Camera	720p at 30 fps HD camera, dual-array microphones
Cổng Kết Nối	1 x USB 3.2 Gen 1 Type-C™ port with DisplayPort and PowerDelivery | 2 x USB A 3.2 Gen 1 ports | 1 x Jack 3.5 | 1x HDMI 1.4 port | 1 x Power jack
Trọng lượng	1.8kg
Pin	3-Cell Battery, 56WHr (Integrated)
Hệ điều hành	Windows 10 bản quyền
',54,'22490000', '');
INSERT INTO product VALUES ('007','VP012','Dell Vostro 5410','Dell','./assets/img/product/vanphong/Dell%20Vostro%205410.jpg',
'CPU	 Intel® Core™ i5-11320H Processor (8MB Cache, up to 4.4GHz)
RAM	8GB, 2x4GB, DDR4, 3200MHz
Ổ cứng	256GB M.2 PCIe NVMe Solid State Drive
Card VGA	Intel® Iris® Xe Graphics
Màn hình	14.0Inch FHD (1920 x 1080) Anti-Glare LED Backlight Non-Touch Narrow Border WVA Display
Trọng lượng	1.44kg
Pin	4 Cell 54Wh
Hệ điều hành	Windows 10 bản quyền
',345,'21890000', '');
INSERT INTO product VALUES ('008','VP012','Dell Vostro 16 5620','Dell','./assets/img/product/vanphong/Dell%20Vostro%2015%205510.jpg',
'CPU	Intel® Core™ i5-1240P (12 MB cache, 12 cores, 16 threads, up to 4.40 GHz Turbo)
RAM	8 GB, DDR4, 3200 MHz
Ổ cứng	256GB, M.2, PCIe NVMe, SSD
Card VGA	Intel® Iris® Xe Graphics
Màn hình	16.0-inch 16:10 FHD+ (1920 x 1200) Anti-Glare Non-Touch 250nits WVA Display with ComfortView Support
Camera	1080p at 30 fps FHD camera
	Dual-array microphones
Cổng Kết Nối	2x USB 3.2 Gen 1 ports
	1x USB 3.2 Gen 2x2 Type-C® port with DisplayPort® and Power Delivery
	1x HDMI 1.4 port
	1x Headset jack
Trọng lượng	1,91kg
Pin	4 Cell, 54 Wh
Hệ điều hành	Windows 11 bản quyền
',53,'24890000', '');
INSERT INTO product VALUES ('009','VP012','Dell Vostro 13 5310','Dell','./assets/img/product/vanphong/Dell%20Vostro%2013%205310.jpg',
'CPU	Intel Core i5 11300H (up to 4.5Ghz, 8MB cache
RAM	8GB LPDDR4x 4267Mhz onboard
Ổ cứng	512GB PCIe NVMe SSD (M.2 2230)
Card VGA	MX450-2GB
Màn hình	13.3 inch 2.5K, anti-glare, non-touch, wide-viewing angle
Trọng lượng	1.25 kg
Pin	4cell - 54Wh
Hệ điều hành	Window 11 bản quyền
',0,'22890000', '');
INSERT INTO product VALUES ('010','VP012','Dell Vostro 15 5510','Dell','./assets/img/product/vanphong/Dell%20Vostro%2015%205510.jpg',
'CPU	 Intel® Core™ i5-11320H Processor 
RAM	8GB DDR4 3200MHz
Ổ cứng	SSD 256GB PCIe M.2 NVMe 
Card VGA	Intel® Iris® Xe Graphics
Màn hình	15.6-inch, FHD 1920 x 1080, 60 Hz,
Camera	720p at 30 fps HD camera, dual-array microphones
Cổng Kết Nối	1 x USB 3.2 Gen 1 Type-C™ port with DisplayPort and PowerDelivery | 2 x USB A 3.2 Gen 1 ports | 1 x Jack 3.5 | 1x HDMI 1.4 port | 1 x Power jack
Trọng lượng	1.63kg
Pin	4-Cell Battery, 54WHr (Integrated)
Hệ điều hành	Windows 10 bản quyền
',45,'21990000', '');
INSERT INTO product VALUES ('011','VP012','Lenovo IdeaPad 5 Pro','Lenovo','./assets/img/product/vanphong/Lenovo%20IdeaPad%205%20Pro%20.jpg',
'CPU	AMD Ryzen 5 5500U
RAM	 8GB (1x8GB) Up to 3200MHz DDR4
Ổ cứng	256GB PCIe M.2 NVMe Class 35 Solid State Drive
Card VGA	AMD® Radeon™ Graphics
Màn hình	14.0-inch FHD Touch
Webcam	720p at 30 fps HD camera, dual-array microphones
Kết nối	2 USB 3.2 Gen 1 ports 1 USB 3.2 Gen 1 (Type-C™) port 1 headset (headphone and microphone combo) port 1 HDMI 1.4b port
Trọng lượng	1.56 kgCPU	AMD Ryzen 5-5600H (3.30GHz up to 4.20GHz, 16MB Cache)
RAM	8GB DDR4-3200Mhz
Ổ cứng	512GB SSD M.2 2280 PCIe 3.0x4 NVMe
Card VGA	Integrated AMD Radeon Graphics
Màn hình	16.0 inch WQXGA (2560x1600) IPS 350nits Anti-glare, 100% sRGB, Dolby Vision, HDR 400, Free-Sync, G-Sync, DC dimmer.
Webcam	720p + IR + ToF
Trọng lượng	1.9 kg
Pin	 4 Cell, 75Whs
Hệ điều hành	Windows 11 bản quyền
',87,'22990000', '');
INSERT INTO product VALUES ('012','VP012','Acer Swift 3','Acer','./assets/img/product/vanphong/Acer%20Swift%203.jpg',
'CPU	AMD Ryzen 7 - 5700U
RAM	8GB DDR4
Ổ cứng	SSD 512GB PCIe NVMe
Card VGA	AMD Radeon Graphics
Màn hình	14 inch FHD IPS
Trọng lượng	1.19kg
Pin	 3 Cells
Hệ điều hành	Windows 10 Home
',56,'19990000', '');
INSERT INTO product VALUES ('013','VP012','Asus Zenbook 14 Q409 ZA','Asus','./assets/img/product/vanphong/Asus%20Zenbook%2014%20Q409%20ZA.jpg',
'CPU	Intel® Core i5-1240P (upto 4.4GHz, 12 lõi | 16 luồng, 12MB Cache)
RAM	8GB LPDDR5 bus 5200MHz
Ổ cứng	256GB PCIe® x2 SSD
Card VGA	Intel Iris Xe
Màn hình	14” 2.8K (2880x1800) 90Hz 100% DCI-P3 color gamut OLED Display, 600 nits
Camera	3D IR HD camera
Cổng Kết Nối	2 x USB-C with Thunderbolt 4, 1 x USB-A , 1 x microSD, 1 x HDMI, 1x jack 3.5mm
Trọng lượng	1.39kg
Pin	4 Cell, 75 WHrs
Hệ điều hành	Windows 11 bản quyền
',45,'23990000', '');
INSERT INTO product VALUES ('014','VP012','Acer Aspire 1 A115-32','Acer','./assets/img/product/vanphong/Acer%20Aspire%201%20A115-32.jpg',
'CPU	Intel Celeron - N4500
RAM	4GB DDR4
Ổ cứng	SSD 128GB PCle NVMe
Card VGA	Intel UHD Graphics
Màn hình	15.6", 1920 x 1080 Pixel, 60 Hz, Acer ComfyView Anti-glare LED-backlit
Trọng lượng	1.9 kg
Pin	48Wh
Hệ điều hành	Windows 11 bản quyền
',34,'10990000', '');
INSERT INTO product VALUES ('015','VP012','Asus Vivobook X515JA','Asus','./assets/img/product/vanphong/Asus%20Vivobook%20X515JA.jpg',
'CPU	Intel® Core™ i3-1005G1 (1.20GHz up to 3.40GHz, 4MB)
RAM	8GB DDR4 
Ổ cứng	256GB NVMe SSD
Card VGA	Intel UHD
Màn hình	15.6" HD
Camera	720P HD
Trọng lượng	1.8 kg
Pin	37Wh
Hệ điều hành	Windows 10 bản quyền
',23,'12890000', '9890000');
INSERT INTO product VALUES ('016','VP012','Lenovo ThinkPad E14','Lenovo','./assets/img/product/vanphong/Lenovo%20ThinkPad%20E14.jpg',
'CPU	Core™ i3-10110U
RAM	8GB DDR4
Ổ cứng	SSD 256GB
Card VGA	Intel Graphics HD
Màn hình	14 inch FHD
Cổng kết nối	USB 2.0, USB 3.1 Gen 1, USB-C 3.1 Gen 1, HDMI, Ethernet (RJ-45),
	Mic / Headphone Combo Jack
Trọng lượng	1.69kg
Pin	3-cell 45WHrs
Hệ điều hành	Window 10 bản quyền
',78,'15900000', '');
INSERT INTO product VALUES ('017','VP012','Asus Zenbook 14 Q408UG','Asus','./assets/img/product/vanphong/Asus%20Zenbook%2014%20Q408UG.jpg',
'CPU	AMD Ryzen 5 - 5500U
RAM	8GB LPDDR4x bus 4266MHz
Ổ cứng	256GB M.2 NVMe™ PCIe® SSD (Nâng cấp tối đa 2TB)
Card VGA	NVIDIA Geforce MX450 2GB GDDR5
Màn hình	14.0" FHD IPS (1920 x 1080) chống chói viền siêu mỏng NanoEdge | 100% sRGB
Camera	3D IR HD camera
Cổng Kết Nối	2 x USB-C 3.2 Gen 2,
	1 x USB-A 3.2 Gen 2 (Chỉ truyền dữ liệu), 1 x microSD ,
	1 x HDMI
Trọng lượng	1.15kg
Pin	63Wh
Hệ điều hành	Windows 10 Home
',51,'19890000', '');
INSERT INTO product VALUES ('018','VP012',' HP ENVY x360 13-bd0063dx','HP','./assets/img/product/vanphong/HP%20ENVY%20x360%2013-bd0063dx.jpg',
'CPU	Core i5-1135G7
RAM	8 GB DDR4 bus3200
Ổ cứng	256 GB PCIe® NVMe™
Card VGA	Integrated Intel Iris Xe Graphics
Màn hình	13.3 FHD IPS Touch Screen
Webcam	HD cam
Kết nối	1 Thunderbolt™ 4 with USB4™ Type-C® 40Gbps
	1 SuperSpeed USB Type-C® 5Gbps
	1 SuperSpeed USB Type-A 5Gbps
	1 AC smart pin
	1 headphone/microphone combo
Trọng lượng	1.32 kg
Pin	3-cell, 51Wh
Hệ điều hành	Windows 10 bản quyền
',73,'20890000', '');
INSERT INTO product VALUES ('019','VP012','Samsung Galaxy Book Flex Alpha 2','Samsung','./assets/img/product/vanphong/Samsung%20Galaxy%20Book%20Flex%20Alpha%202.jpg',
'CPU	Intel Celeron - N4500
RAM	4GB DDR4
Ổ cứng	SSD 128GB PCle NVMe
Card VGA	Intel UHD Graphics
Màn hình	15.6", 1920 x 1080 Pixel, 60 Hz, Acer ComfyView Anti-glare LED-backlit
Trọng lượng	1.9 kg
Pin	48Wh
Hệ điều hành	Windows 11 bản quyền
',94,'10990000', '');
INSERT INTO product VALUES ('020','VP012','Acer Aspire 5 A514-54','Acer','./assets/img/product/vanphong/Acer%20Aspire%205%20A514-54.jpg',
'CPU	Intel® Core™ i5-1135G7
RAM	8GB DDR4 Bus 2666 MHz
Ổ cứng	SSD 256GB PCle NVMe
Card VGA	Intel Iris® Xe Graphics
Màn hình	14.0", 1920 x 1080 Pixel, IPS, 60 Hz, Acer ComfyView Anti-glare LED-backlit
Trọng lượng	1.48 kg
Pin	48Wh
Hệ điều hành	Windows 10 bản quyền
',48,'16990000', '');
INSERT INTO product VALUES ('021','VP012','Laptop HP 14 - dq2020nr','HP','./assets/img/product/vanphong/Laptop%20HP%2014%20-%20dq2020nr.jpg',
'CPU	Intel® Core™ i3-1125G4 (3.00GHz up to 4.10GHz, 6MB Cache)
RAM	4GB DDR4 3200MHz
Ổ cứng	128GB PCIe NVMe M.2 SSD
Card VGA	Intel UHD Graphics
Màn hình	14 Inch FHD (1920 x 1080) Anti-glare 250nits
Trọng lượng	1.46 kg
Pin	3 Cells 41Whrs
Hệ điều hành	Windows 10 bản quyền
',80,'13990000', '');
INSERT INTO product VALUES ('022','VP012','Samsung Galaxy Book Pro 15','Samsung','./assets/img/product/vanphong/Samsung%20Galaxy%20Book%20Pro%2015.jpg',
'CPU	Core i5-1135G7 (4 nhân 8 luồng), Turbo 4.2 GHz, 8MB Cache
RAM	8GB LPDDR4X- 4267MHz
Ổ cứng	SSD 512GB NVMe
Card VGA	Intel Iris Xe G7 (80 EUs)
Màn hình	15.6 inch FHD (1920 x 1080) AMOLED Display, 370nits
Webcam	720p HD wedcam
Kết nối	1 x HDMI, 1 x Thunderbolt™ 4, 1 x USB Type-C, 1 x USB Type-A 3.2 Gen 1, 1 x Headphone out/Mic-in
Trọng lượng	1.1 kg
Pin	4 Cell - 68Wh
Hệ điều hành	Windows bản quyền
',34,'24890000', '');
INSERT INTO product VALUES ('023','VP012','Samsung Galaxy Book Pro 360 13','Samsung','./assets/img/product/vanphong/Samsung%20Galaxy%20Book%20Pro%20360%2013.jpg',
'CPU	Core i7-1165G7 (4-Core, 12MB Cache, up to 4.7GHz Max Turbo Frequency)
RAM	8GB LPDDR4x 4267MHz
Ổ cứng	SSD 256G NVMe
Card VGA	Intel Iris Xe
Màn hình	13.3" Full HD (1920 x 1080) cảm ứng, QLED, phủ màu 100% sRGB, sáng 600 nits
Webcam	720p HD wedcam 
Trọng lượng	1 kg
Pin	4 Cell - 54Wh
Hệ điều hành	Windows 11 bản quyền
',65,'29990000', '');
INSERT INTO product VALUES ('024','VP012','MSI Modern 15 A5M 238VN','MSI','./assets/img/product/vanphong/MSI%20Modern%2015%20A5M%20238VN.jpg',
'CPU	Ryzen 5 5500U
RAM	8GB DDR4 3200MHz
Ổ cứng	512GB NVMe PCIe SSD
Card VGA	AMD Radeon Graphics
Màn hình	15.6 inch FHD(1920 x 1080)
Webcam	720p HD
Trọng lượng	1.6kg
Pin	3Cell 52Whrs
Hệ điều hành	Windows 11 bản quyền
',23,'19990000', '');
INSERT INTO product VALUES ('025','VP012','Laptop HP 15 - DW3058CL','HP','./assets/img/product/vanphong/Laptop%20HP%2015%20-%20DW3058CL.jpg',
'CPU	Intel® Core™ i5-1135G7
RAM	8GB DDR4 3200MHz
Ổ cứng	256GB PCIe NVMe M.2 SSD
Card VGA	Integrated
Màn hình	15.6" diagonal, FHD IPS, micro-edge, BrightView, 250 nits, 45% NTSC
Trọng lượng	1.75 kg
Pin	3 Cells 41Whrs
Hệ điều hành	Windows 10 bản quyền
',23,'18990000', '');
INSERT INTO product VALUES ('026','VP012','Lenovo ThinkPad X1 Nano 2021','Lennovo','./assets/img/product/vanphong/Lenovo%20ThinkPad%20X1%20Nano%202021.jpg',
'CPU	Core™ i5-1130G7 Processor
RAM	8GB LPDDR4x 4267MHz
Ổ cứng	SSD 256 GB
Card VGA	Intel Iris Xe
Màn hình	13 inch 2K IPS
Trọng lượng	900gram
Pin	3-cell 48WHrs
Hệ điều hành	Window 10 bản quyền
',32,'31890000', '');
INSERT INTO product VALUES ('027','VP012','Asus VivoBook M433IA-EB619T','Asus','./assets/img/product/vanphong/Asus%20VivoBook%20M433IA-EB619T.jpg',
'CPU	AMD Ryzen7-4700U
RAM	8GB DDR4 bus 3200MHz
Ổ cứng	SSD 512GB NVMe
Card VGA	AMD Radeon Graphics
Màn hình	14.0 FHD
Webcam	720p HD camera
Cổng kết nối	HDMI 1.4, USB 3.2, USB 2.0, Thunderbolt™ 4
Trọng lượng	1.4 kg
Pin	3 Cells
Hệ điều hành	Windows 10 bản quyền
',21,'17490000', '');
-- laptopgaming
INSERT INTO product VALUES ('028','GM010','Laptop Asus TUF Gaming FX506HM','Asus','./assets/img/product/gaming/Laptop%20Asus%20TUF%20Gaming%20FX506HM.jpg',
'CPU Intel Core i7 Tiger Lake - 11800H
RAM 8GB,DDR4 2 khe (1 khe 8 GB + 1 khe rời),3200 MHz
Ổ cứng 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB),Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)
Card Màn hình Card rời,RTX 3060 6GB
Camera HD webcam
Cổng Kết Nối LAN (RJ45),3 x USB 3.2,HDMI,Jack tai nghe 3.5 mm,Thunderbolt 4
Trọng lượng	2.3 kg
Pin	4-cell Li-ion, 90 Wh	
Hệ điều hành	Windows 11 Home SL	
Đèn bàn phím	Có	
',11,'30690000','');
INSERT INTO product VALUES ('029','GM010','Laptop Asus TUF Gaming FX506LHB','Asus','./assets/img/product/gaming/Laptop%20Asus%20TUF%20Gaming%20FX506LHB.jpg',
'CPU	Intel Core i5 Comet Lake - 10300H									
RAM	8GB,DDR4 2 khe (1 khe 8 GB + 1 khe rời),2933MHz									
Ổ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)									
Card Màn hình	Card rời,GTX 1650 4GB									
Màn hình	15.6",Full HD (1920 x 1080), 144Hz									
Camera	HD webcam																		
Cổng Kết Nối	1x USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNCLAN (RJ45),USB 2.0,2 x USB 3.2,HDMI,Jack tai nghe 3.5mm																	
Trọng lượng	2.3 kg									
Pin	3-cell Li-ion, 48 Wh									
Hệ điều hành	Windows 11 Home SL
Đèn bàn phím	Có									
',34,'19190000','');
INSERT INTO product VALUES ('030','GM010','Laptop Lenovo Ideapad Gaming 3 15IAH7','Lenovo','./assets/img/product/gaming/Laptop%20Lenovo%20Ideapad%20Gaming%203%2015IAH7.jpg',
'CPU	Intel Core i5-12500H (4 nhân hiệu năng cao, 8 nhân tiết kiệm điện)								
RAM	8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz								
Ổ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)								
Card Màn hình	Card rời,RTX 3050 4GB								
Màn hình	15.6"Full HD (1920 x 1080) 120Hz								
Camera	HD webcam																		
Cổng Kết Nối	LAN (RJ45),HDMI,Jack tai nghe 3.5 mm,2 x USB 3.2,1 x Thunderbolt 4 (hỗ trợ Power Delivery 3.0 và DisplayPort 1.4)																
Trọng lượng	2.315 kg								
Pin	60Wh								
Hệ điều hành	Windows 11 Home SL								
Đèn bàn phím	Có									
',44,'26190000','');
INSERT INTO product VALUES ('031','GM010','Laptop Lenovo IdeaPad Gaming 3 15IHU6','Lenovo','./assets/img/product/gaming/Laptop%20Lenovo%20IdeaPad%20Gaming%203%2015IHU6.jpg',
'CPU	Intel Core i5 Tiger Lake - 11300H										
RAM	8 GBDDR4 2 khe (1 khe 4 GB + 1 khe 4 GB)3200 MHz										
Ổ cứng	Hỗ trợ thêm 1 khe cắm HDD SATA (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB (2280) / 512 GB (2242))										
Card Màn hình	Card rờiGTX 1650 4GB										
Màn hình	15.6"Full HD (1920 x 1080) 120Hz										
Camera	HD webcam																				
Cổng Kết Nối	USB Type-CLAN (RJ45)2 x USB 3.2HDMIJack tai nghe 3.5 mm																			
Trọng lượng	2.25 kg										
Pin	45 Wh										
Hệ điều hành	Windows 11 Home SL										
Đèn bàn phím	Có										
',92,'17490000','');
INSERT INTO product VALUES ('032','GM010','Laptop MSI Gaming GF63 Thin 11UC','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GF63%20Thin%2011UC.jpg',
'CPU	Intel Core i5 Tiger Lake - 11400H								
RAM	8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz								
Ổ cứng	Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)								
Card Màn hình	Card rờiRTX 3050 4GB								
Màn hình	15.6"Full HD (1920 x 1080)								
Camera	HD webcam																
Cổng Kết Nối	USB Type-CLAN (RJ45)3 x USB 3.2HDMIJack tai nghe 3.5 mm								
Trọng lượng	1.86 kg								
Pin	3-cell Li-ion, 51 Wh								
Hệ điều hành	Windows 10 Home SL								
Đèn bàn phím	Có								
',89,'22990000','');
INSERT INTO product VALUES ('033','GM010','Laptop MSI Gaming Pulse GL66 11UDK','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20Pulse%20GL66%2011UDK.jpg',
'CPU	Intel Core i7 Tiger Lake - 11800H						
RAM	16 GBDDR4 2 khe (1 khe 8 GB + 1 khe 8 GB)3200 MHz						
Ổ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)Không hỗ trợ khe cắm HDD						
Card Màn hình	Card rờiRTX 3050Ti 4GB						
Màn hình	15.6"Full HD (1920 x 1080) 144Hz						
Camera	Intel Core i7 Tiger Lake - 11800H												
Cổng Kết Nối	USB Type-CLAN (RJ45)USB 2.0HDMIJack tai nghe 3.5 mm2 x USB 3.2						
Trọng lượng	2.25 kg						
Pin	3 cell, 53.5 Wh						
Hệ điều hành	Windows 10 Home SL						
Đèn bàn phím	Có						
',45,'33990000','');
INSERT INTO product VALUES ('034','GM010','Laptop Dell Gaming G15 5515','Dell','./assets/img/product/gaming/Laptop%20Dell%20Gaming%20G15%205515.jpg',
'CPU	AMD Ryzen 5 - 5600H											
RAM	16 GBDDR4 2 khe (1 khe 8 GB + 1 khe 8 GB)3200 MHz											
Ổ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộngKhông hỗ trợ khe cắm HDD512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB (2280) / 1 TB (2230))											
Card Màn hình	Card rờiRTX 3050 4GB											
Màn hình	15.6"Full HD (1920 x 1080) 120Hz											
Camera	HD webcam																						
Cổng Kết Nối	USB Type-CLAN (RJ45)1 x USB 3.22 x USB 2.0HDMIJack tai nghe 3.5 mm												
Trọng lượng	2.8 kg											
Pin	3-cell Li-ion, 56 Wh											
Hệ điều hành	Windows 11 Home SL + Office Home & Student vĩnh viễn											
Đèn bàn phím	Có											
',32,'23490000','');
INSERT INTO product VALUES ('035','GM010','Laptop Acer Aspire 7 Gaming A715 42G R4XX','Acer','./assets/img/product/gaming/Laptop%20Acer%20Aspire%207%20Gaming%20A715%2042G%20R4XX.jpg',
'CPU	AMD Ryzen 5 - 5500U										
RAM	8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz										
Ổ cứng	256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Không hỗ trợ khe cắm HDDKhông hỗ trợ khe cắm SSD M2 mở rộng thêm										
Card Màn hình	Card rờiGTX 1650 4GB										
Màn hình	15.6"Full HD (1920 x 1080)										
Camera	HD webcam																			
Cổng Kết Nối	USB Type-CLAN (RJ45)USB 2.0HDMIJack tai nghe 3.5 mm2 x USB 3.2											
Trọng lượng	Windows 11 Home SL										
Pin	HD webcam										
Hệ điều hành	Windows 11 Home SL										
Đèn bàn phím	Có										
',21,'14990000','');
INSERT INTO product VALUES ('036','GM010','Laptop Acer Nitro 5 Gaming AN515 57 553E','Acer','./assets/img/product/gaming/Laptop%20Acer%20Nitro%205%20Gaming%20AN515%2057%20553E.jpg',
'CPU	Intel Core i5 Tiger Lake - 11400H															
RAM	8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz															
Ổ cứng	Hỗ trợ khe cắm HDD SATA 2.5 inch mở rộng (nâng cấp tối đa 2 TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)															
Card Màn hình	Card rờiRTX 3050 4GB															
Màn hình	15.6"Full HD (1920 x 1080) 144Hz															
Camera	HD webcam																														
Cổng Kết Nối	Card rờiRTX 3050 4GB															
Trọng lượng	Windows 11 Home SL															
Pin	4-cell Li-ion, 57.5 Wh															
Hệ điều hành	Windows 11 Home SL															
Đèn bàn phím	Có															
',17,'24990000','');
INSERT INTO product VALUES ('037','GM010','Laptop HP VICTUS 16 d0292TX','HP','./assets/img/product/gaming/Laptop%20HP%20VICTUS%2016%20d0292TX.jpg',
'CPU	Windows 11 Home SL										
RAM	8 GBDDR4 2 khe (1 khe 4 GB + 1 khe 4 GB)3200 MHz										
Ổ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)										
Card Màn hình	Card rờiRTX 3050Ti 4GB										
Màn hình	16.1"Full HD (1920 x 1080) 144Hz										
Camera	HD webcam																				
Cổng Kết Nối	USB Type-C3 x USB 3.1LAN (RJ45)HDMIJack tai nghe 3.5 mm											
Trọng lượng	2.46 kg										
Pin	4-cell Li-ion, 70 Wh										
Hệ điều hành	Windows 11 Home SL										
Đèn bàn phím	Có										
',95,'22190000','');
INSERT INTO product VALUES ('038','GM010','Laptop Acer Nitro 5 Gaming AN515 45 R6EV','Acer','./assets/img/product/gaming/Laptop%20Acer%20Nitro%205%20Gaming%20AN515%2045%20R6EV.jpg',
'CPU	Ryzen 5, 5600H, 3.3GHz													
RAM	8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz													
Ổ cứng	Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)													
Card Màn hình	GTX 1650 4GB													
Màn hình	15.6", Full HD, 144Hz													
Camera	HD webcam																										
Cổng Kết Nối	USB Type-CLAN (RJ45)3 x USB 3.2HDMIJack tai nghe 3.5 mm													
Trọng lượng	2.2 kg													
Pin	GTX 1650 4GB													
Hệ điều hành	Windows 11 Home SL													
Đèn bàn phím	Có													
',43,'22490000','');
INSERT INTO product VALUES ('039','GM010','Laptop Asus ROG Strix Gaming G513IH','Asus','./assets/img/product/gaming/Laptop%20Asus%20ROG%20Strix%20Gaming%20G513IH.jpg',
'CPU	Ryzen 7, 4800H, 2.9GHz										
RAM	8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz										
Ổ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)										
Card Màn hình	GTX 1650 4GB										
Màn hình	15.6", Full HD, 144Hz										
Camera	Không tích hợp																				
Cổng Kết Nối	LAN (RJ45)3x Type-A USB 3.2 Gen 1USB Type-C (Power Delivery and DisplayPort)HDMIJack tai nghe 3.5 mm											
Trọng lượng	2.1 kg										
Pin	4-cell, 56Wh										
Hệ điều hành	LAN (RJ45)3x Type-A USB 3.2 Gen 1USB Type-C (Power Delivery and DisplayPort)HDMIJack tai nghe 3.5 mm										
Đèn bàn phím	Có										
',33,'21190000','');
INSERT INTO product VALUES ('040','GM010','Laptop MSI Gaming Bravo 15 B5DD','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20Bravo%2015%20B5DD.jpg',
'CPU	Ryzen 5, 5600H, 3.3GHz							
RAM	8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz							
Ổ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)Không hỗ trợ khe cắm HDD							
Card Màn hình	RX 5500M 4GB							
Màn hình	15.6", Full HD							
Camera	HD webcam															
Cổng Kết Nối	USB Type-CLAN (RJ45)USB 2.02 x USB 3.2HDMIJack tai nghe 3.5 mm							
Trọng lượng	2.35 kg							
Pin	3-cell, 52Wh							
Hệ điều hành	Windows 11 Home SL							
Đèn bàn phím	Có							
',0,'18490000','');
INSERT INTO product VALUES ('041','GM010','Laptop MSI Gaming Alpha 15 B5EEK','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20Alpha%2015%20B5EEK.jpg',
'CPU	Ryzen 7, 5800H, 3.2GHz														
RAM	16 GBDDR4 2 khe (1 khe 8 GB + 1 khe 8 GB)3200 MHz														
Ổ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe 3.0 mở rộng (có thể tháo ra, nâng cấp dung lượng không giới hạn)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác không giới hạn dung lượng)														
Card Màn hình	AMD Radeon RX 6600M, 8 GB														
Màn hình	15.6", Full HD, 144Hz														
Camera	HD webcam																													
Cổng Kết Nối	USB Type-CLAN (RJ45)2 x USB 3.2HDMI1 x USB 2.0Jack tai nghe 3.5 mm															
Trọng lượng	2.35 kg														
Pin	4-cell, 90Wh														
Hệ điều hành	Windows 11 Home SL														
Đèn bàn phím	Có														
',43,'32490000','');
INSERT INTO product VALUES ('042','GM010','Laptop MSI Creator Z16P B12UGST','MSI','./assets/img/product/gaming/Laptop%20MSI%20Creator%20Z16P%20B12UGST.jpg',
'CPU	i7, 12700H, 2.30 GHz						
RAM	32 GBDDR5 2 khe (1 khe 16 GB + 1 khe 16 GB)5200 MHz						
Ổ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)2 TB SSD NVMe PCIe						
Card Màn hình	RTX 3070Ti Max-Q 8GB						
Màn hình	16", 2K, 165Hz						
Camera	FHD (30fps@1080p)												
Cổng Kết Nối	1 x USB 3.2USB Type-CThunderbolt 4 USB-CJack tai nghe 3.5 mm							
Trọng lượng	2.39 kg						
Pin	4-cell, 90Wh						
Hệ điều hành	Windows 11 Home SL						
Đèn bàn phím	Có						
',65,'79990000','');
INSERT INTO product VALUES ('043','GM010','Laptop MSI Gaming GE66 Raider 11UH','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GE66%20Raider%2011UH.jpg',
'CPU	i7, 11800H, 2.30 GHz							
RAM	32 GBDDR4 2 khe (1 khe 16 GB + 1 khe 16 GB)3200 MHz							
Ổ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)2 TB SSD NVMe PCIe							
Card Màn hình	RTX 3080 16GB							
Màn hình	15.6", 2K, 240Hz							
Camera	FHD (30fps@1080p)														
Cổng Kết Nối	USB Type-CLAN (RJ45)Thunderbolt 4 USB-C3 x USB 3.2HDMIMini DisplayPortJack tai nghe 3.5 mm									
Trọng lượng	2.38 Kg							
Pin	4-cell, 99.9Wh							
Hệ điều hành	Windows 10 Home SL							
Đèn bàn phím	Có							
',47,'77990000','');
INSERT INTO product VALUES ('044','GM010','Laptop MSI Gaming GS66 Stealth 11UG','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GS66%20Stealth%2011UG.jpg',
'CPU	i7, 11800H, 2.30 GHz						
RAM	32 GBDDR4 2 khe (1 khe 16 GB + 1 khe 16 GB)3200 MHz						
Ổ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)2 TB SSD NVMe PCIe						
Card Màn hình	RTX 3070 Max-Q 8GB						
Màn hình	15.6", Full HD, 360Hz						
Camera	Camera IR												
Cổng Kết Nối	USB Type-CLAN (RJ45)Thunderbolt 4 USB-C3 x USB 3.2HDMIJack tai nghe 3.5 mm							
Trọng lượng	2.1 Kg						
Pin	4-cell, 99.9Wh						
Hệ điều hành	USB Type-CLAN (RJ45)Thunderbolt 4 USB-C3 x USB 3.2HDMIJack tai nghe 3.5 mm						
Đèn bàn phím	Có						
',34,'64990000','');
INSERT INTO product VALUES ('045','GM010','Laptop Dell Gaming Alienware m15 R6','Dell','./assets/img/product/gaming/Laptop%20Dell%20Gaming%20Alienware%20m15%20R6.jpg',
'CPU	i7, 11800H, 2.30 GHz															
RAM	32 GBDDR4 2 khe (1 khe 16 GB + 1 khe 16 GB)3200 MHz															
Ổ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)1 TB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB M.2 2280 PCIe Gen 4 x 4 NVMe / 1 TB M.2 2280 PCIe Gen 3 x 4 NVMe)															
Card Màn hình	RTX 3060 6GB															
Màn hình	15.6", Full HD, 165Hz															
Camera	HD webcam																										
Cổng Kết Nối	LAN (RJ45)Thunderbolt 4 USB-C3 x USB 3.2HDMIJack tai nghe 3.5 mm																
Trọng lượng	2.69 kg															
Pin	6-cell Li-ion, 86 Wh															
Hệ điều hành	LAN (RJ45)Thunderbolt 4 USB-C3 x USB 3.2HDMIJack tai nghe 3.5 mm															
Đèn bàn phím	Có															
',9,'61990000','');
INSERT INTO product VALUES ('046','GM010','Laptop MSI Gaming GE66 Raider 11UG','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GE66%20Raider%2011UG.jpg',
'CPU	i7, 11800H, 2.30 GHz							
RAM	16 GBDDR4 2 khe (1 khe 8 GB + 1 khe 8 GB)3200 MHz							
Ổ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)2 TB SSD NVMe PCIe							
Card Màn hình	RTX 3070 8GB							
Màn hình	15.6", Full HD, 360Hz							
Camera	FHD (30fps@1080p)															
Cổng Kết Nối	USB Type-CLAN (RJ45)Thunderbolt 4 USB-C3 x USB 3.2HDMIMini DisplayPortJack tai nghe 3.5 mm																															
Trọng lượng	2.38 Kg							
Pin	4-cell, 99.9Wh							
Hệ điều hành	Windows 10 Home SL							
',42,'59990000','');
INSERT INTO product VALUES ('047','GM010','Laptop MSI Gaming Vector GP66 12UGS','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20Vector%20GP66%2012UGS.jpg',
'CPU	i7, 12700H, 2.30 GHz									
RAM	16 GBDDR4 2 khe (1 khe 8 GB + 1 khe 8 GB)3200 MHz									
Ổ cứng	1 TB SSD M.2 PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)									
Card Màn hình	RTX 3070Ti 8GB									
Màn hình	15.6", 2K, 165Hz									
Camera	HD webcam																			
Cổng Kết Nối	USB Type-CLAN (RJ45)3 x USB 3.2HDMIMini DisplayPortJack tai nghe 3.5 mm																																					
Trọng lượng	2.9 kg									
Pin	4-cell, 65Wh									
Hệ điều hành	Windows 11 Home SL									
Đèn bàn phím	Có									
',54,'55990000','');
INSERT INTO product VALUES ('048','GM010','Laptop Asus Gaming ROG Flow Z13 GZ301Z','Asus','./assets/img/product/gaming/Laptop%20Asus%20Gaming%20ROG%20Flow%20Z13%20GZ301Z.jpg',
'CPU	i7, 12700H, 2.30 GHz											
RAM	16 GBLPDDR5 (8 GB Onboard + 8 GB Onboard)5200 MHz											
Ổ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)											
Card Màn hình	RTX 3050 4GB											
Màn hình	13.4", Full HD+, 120Hz											
Camera	HD webcam																							
Cổng Kết Nối	USB 2.01x USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNC1x ROG XG Mobile InterfaceThunderbolt 4 USB-CJack tai nghe 3.5 mm																																															
Trọng lượng	1.18 kg											
Pin	4-cell, 56Wh											
Hệ điều hành	Windows 11 Home SL											
Đèn bàn phím	Có											
',43,'49190000','');
INSERT INTO product VALUES ('049','GM010','Laptop Asus TUF Gaming FX507Z','Asus','./assets/img/product/gaming/Laptop%20Asus%20TUF%20Gaming%20FX507Z.jpg',
'CPU	i7, 12700H, 2.30 GHz										
RAM	16 GBDDR5 2 khe (1 khe 8 GB + 1 khe 8 GB)4800 MHz										
Ổ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)										
Card Màn hình	RTX 3060 6GB										
Màn hình	15.6", Full HD, 144Hz										
Camera	HD webcam																					
Cổng Kết Nối	LAN (RJ45)1 x USB 3.2 Gen 1 Type-C support DisplayPort / G-SYNCHDMIJack tai nghe 3.5 mm2 x USB 3.21 x Thunderbolt 4 (hỗ trợ DisplayPort)																																										
Trọng lượng	2.2 kg										
Pin	4-cell, 90Wh										
Hệ điều hành	Windows 11 Home SL										
Đèn bàn phím	Có										
',40,'28190000','');
INSERT INTO product VALUES ('050','GM010','Laptop Lenovo Legion 5 15IAH7','Lenovo','./assets/img/product/gaming/Laptop%20Lenovo%20Legion%205%2015IAH7.jpg',
'CPU	i5, 12500H, 2.5GHz																			
RAM	8 GBDDR5 2 khe (1 khe 8 GB + 1 khe trống)4800 MHz																			
Ổ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB (2280) / 512 GB (2242))																			
Card Màn hình	RTX 3050Ti 4GB																			
Màn hình	15.6", Full HD, 165Hz																			
Camera	Full HD Webcam																																							
Cổng Kết Nối	LAN (RJ45)1 x USB 3.2 (Always on)HDMIJack tai nghe 3.5 mm2 x USB 3.21 x Thunderbolt 4 (hỗ trợ DisplayPort)1 x USB-C 3.2 Gen 2 (hỗ trợ truyền dữ liệu, Power Delivery 135W and DisplayPort 1.4)1 x USB-C 3.2 Gen 2 (support data transfer and DisplayPort 1.4)																																																																															
Trọng lượng	2.35 kg																			
Pin	80 Wh																			
Hệ điều hành	Windows 11 Home SL																			
Đèn bàn phím	Có																			
',97,'34690000','');
INSERT INTO product VALUES ('051','GM010','Laptop Dell Gaming G15 5511','Dell','./assets/img/product/gaming/Laptop%20Dell%20Gaming%20G15%205511.jpg',
'CPU	i7, 11800H, 2.30 GHz																		
RAM	8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz																		
Ổ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB M.2 2280 PCIe Gen4 x4 NVMe / 1TB M.2 2280 PCIe Gen3 x4 NVMe)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB PCIe Gen 3 x4 NVMe / 2TB PCIe Gen4 x4 NVMe)																		
Card Màn hình	Card rờiRTX 3050 4GB																		
Màn hình	15.6", Full HD, 120Hz																		
Camera	HD webcam																																					
Cổng Kết Nối	LAN (RJ45)3 x USB 3.2USB Type-C (Power Delivery and DisplayPort)HDMIJack tai nghe 3.5 mm																																																																											
Trọng lượng	2.81 kg																		
Pin	3-cell, 56Wh																		
Hệ điều hành	Windows 11 Home SL + Office Home & Student vĩnh viễn																		
Đèn bàn phím	Có																			
',05,'33990000','');
INSERT INTO product VALUES ('052','GM010','Laptop Asus ROG Strix Gaming G513R','Asus','./assets/img/product/gaming/Laptop%20Asus%20ROG%20Strix%20Gaming%20G513R.jpg',
'CPU	Ryzen 7, 6800H, 3.2GHz					
RAM	8 GBDDR5 2 khe (1 khe 8 GB + 1 khe trống)4800 MHz					
Ổ cứng	512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)					
Card Màn hình	RTX 3050 4GB					
Màn hình	15.6", Full HD, 144Hz					
Camera	Không tích 											
Cổng Kết Nối	LAN (RJ45)2 x USB 3.22 x USB Type-CHDMIJack tai nghe 3.5 mm												
Trọng lượng	2.1 kg					
Pin	4-cell, 56Wh					
Hệ điều hành	Windows 11 Home SL					
Đèn bàn phím	Có					
',60,'29190000','');
INSERT INTO product VALUES ('053','GM010','Laptop Lenovo Gaming Legion 5 15ACH6','Lenovo','./assets/img/product/gaming/Laptop%20Lenovo%20Gaming%20Legion%205%2015ACH6.jpg',
'CPU	Ryzen 7, 5800H, 3.2GHz											
RAM	8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz											
Ổ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB (2280) / 512 GB (2242))											
Card Màn hình	RTX 3050Ti 4GB											
Màn hình	15.6", Full HD, 165Hz											
Camera	HD webcam																						
Cổng Kết Nối	LAN (RJ45)1 x USB 3.2 (Always on)3 x USB 3.22 x USB Type-CHDMIJack tai nghe 3.5 mm																								
Trọng lượng	2.4 kg											
Pin	60Wh											
Hệ điều hành	Windows 11 Home SL											
Đèn bàn phím	Có											
',40,'27990000','');
INSERT INTO product VALUES ('054','GM010','Laptop Asus TUF Gaming FA507RC','Asus','./assets/img/product/gaming/Laptop%20Asus%20TUF%20Gaming%20FA507RC.jpg',
'CPU	Ryzen 7, 6800H, 3.2GHz											
RAM	8 GBDDR5 2 khe (1 khe 8 GB + 1 khe trống)4800 MHz											
Ổ cứng	Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB (2280) / 512 GB (2230))											
Card Màn hình	RTX 3050 4GB											
Màn hình	15.6", Full HD, 144Hz											
Camera	HD webcam																							
Cổng Kết Nối	LAN (RJ45)2 x USB Type-CHDMIJack tai nghe 3.5 mm2 x USB 3.2												
Trọng lượng	2.2 kg											
Pin	4-cell, 56Wh											
Hệ điều hành	Windows 11 Home SL											
Đèn bàn phím	Có											
',20,'27690000','');
INSERT INTO product VALUES ('055','GM010','Laptop MSI Gaming GF63 Thin 11UD','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GF63%20Thin%2011UD.jpg',
'CPU	i7, 11800H, 2.30 GHz										
RAM	8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz										
Ổ cứng	Hỗ trợ khe cắm HDD SATA 2.5 inch mở rộng (nâng cấp tối đa 2 TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)										
Card Màn hình	NVIDIA GeForce RTX 3050Ti Max-Q, 4GB										
Màn hình	15.6", Full HD										
Camera	HD webcam																					
Cổng Kết Nối	USB Type-CLAN (RJ45)3x Type-A USB 3.2 Gen 1HDMIJack tai nghe 3.5 mm																																											
Trọng lượng	1.86 kg										
Pin	3-cell, 51Wh										
Hệ điều hành	Windows 11 Home SL										
Đèn bàn phím	Có										
',30,'26490000','');
INSERT INTO product VALUES ('056','GM010','Laptop Acer Aspire 7 Gaming A715 42G R05G','Acer','./assets/img/product/gaming/Laptop%20Acer%20Aspire%207%20Gaming%20A715%2042G%20R05G.jpg',
'CPU	Ryzen 5, 5500U, 2.1GHz										
RAM	8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz										
Ổ cứng	Không hỗ trợ khe cắm SSD M2 mở rộng thêm512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Không hỗ trợ khe cắm HDD										
Card Màn hình	GTX 1650 4GB										
Màn hình	15.6", Full HD, 144Hz										
Camera	HD webcam																					
Cổng Kết Nối	USB Type-CLAN (RJ45)USB 2.02 x USB 3.2HDMIJack tai nghe 3.5 mm																																											
Trọng lượng	2.1 kg										
Pin	48Wh										
Hệ điều hành	Windows 11 Home SL										
Đèn bàn phím	Có											
',44,'20490000','');
INSERT INTO product VALUES ('057','GM010','Laptop MSI Gaming GF63 Thin 10SC','MSI','./assets/img/product/gaming/Laptop%20MSI%20Gaming%20GF63%20Thin%2010SC.jpg',
'CPU	i5, 10500H, 2.5GHz										
RAM	8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz										
Ổ cứng	Hỗ trợ khe cắm HDD SATA 2.5 inch mở rộng (nâng cấp tối đa 2 TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)										
Card Màn hình	GTX 1650 Max-Q 4GB										
Màn hình	15.6", Full HD										
Camera	HD webcam																					
Cổng Kết Nối	USB Type-CLAN (RJ45)HDMI3x Type-A USB 3.2 Gen 1Jack tai nghe 3.5 mm																																											
Trọng lượng	1.86 kg										
Pin	3-cell, 51Wh										
Hệ điều hành	Windows 10 Home SL										
Đèn bàn phím	Có										
',87,'18990000','');
-- laptopmac_dohoa

INSERT INTO product VALUES ('058','DH011','Dell Precision 7510','Dell','./assets/img/product/mac_dohoa/Dell%20Precision%207510.jpg',
'CPU	Core i7-6820HQ (4 nhân 8 luồng), Turbo 3.6 GHz, Cache 8MB
RAM	8GB DDR4- 2133 (up max 64G - 4 khe)
Ổ cứng	SSD 256G (max 2 ổ)
Card VGA	Nvidia Quadro M1000M- 2G
Màn hình	15.6" Full HD (1920×1080), IPS 
Camera	
Cổng kết nối	Lan Gigabit, Wifi 5Ghz, Bluetooth 4, HDMI, Mini DisplayPort,
	USB 3.0 , Thunderbolt 3, audio + mic combo, khe SSD M.2 Nvme
Trọng lượng	2.8 Kg
Pin	6 Cell 72Wh
Hệ điều hành	Windows 10 Pro
',51,'17500000', '');
INSERT INTO product VALUES ('059','DH011','Dell Precision 7720','Dell','./assets/img/product/mac_dohoa/Dell%20Precision%207720.jpg',
'CPU	Intel Core i7-7820HQ (4 nhân 8 luồng), 2.9 Ghz, Turbo 3.9 GHz, 8MB Cache
RAM	16 GB – DDR4 Bus 2400 (Up max 64G – 4 khe)
Ổ cứng	SSD 256G 
Card VGA	Nvidia Quadro M2200- 4G + Intel HD Graphics 630 chạy song song
Màn hình	15.6 inch Full HD (1920 x 1080)   IPS
Trọng lượng	2.8 Kg
Pin	6 Cell 72Wh
Hệ điều hành	Windows 10 Pro
',63,'19300000', '');
INSERT INTO product VALUES ('060','DH011','Dell Precision 5530','Dell','./assets/img/product/mac_dohoa/Dell%20Precision%205530.jpg',
'CPU	Intel i7-8850H (6 nhân 12 luồng), Turbo 4.3 GHz, Cache 9MB
RAM	16G - DDR4 bus 2666 (up max 64G - 2 khe)
Ổ cứng	SSD 512 NVMe (max 2 ổ)
Card VGA	Nvidia Quadro P1000
Màn hình	15.6 inch Full HD IPS, phủ màu 100% sRGB, viền siêu mỏng
Trọng lượng	1.9 Kg
Pin	6 Cell 72Wh
Hệ điều hành	Windows 10 Pro
',5,'23500000', '');
INSERT INTO product VALUES ('061','DH011','Dell Precision 5550 Core i5','Dell','./assets/img/product/mac_dohoa/Dell%20Precision%205550.jpg',
'CPU	Intel Core Processor i5-10400H (4 Core, 8MB Cache, 2.60 GHz to 4.60 GHz, 45W, vPro)
RAM	8GB, DDR4 2933Mhz Non-ECC Memory
Ổ cứng	M.2 256GB PCIe NVMe Class 35 Solid State Drive
Card VGA	NVIDIA® Quadro® T1000
Màn hình	15.6" UltraSharp FHD+, 1920x1200,AG,NT, w/Prem Panel Guar, 100% sRGB
Trọng lượng	1.86 Kg
Pin	6 Cell 72Wh
Hệ điều hành	Windows 10 Pro
',77,'36990000', '');
INSERT INTO product VALUES ('062','DH011','Dell Precision 5550 Core i7','Dell','./assets/img/product/mac_dohoa/Dell%20Precision%205550%20i7.jpg',
'CPU	 Intel Core Processor i7-10750H (6 Core, 12MB Cache, 2.60 GHz to 5.00 GHz, 45W)
RAM	16GB, DDR4 2933Mhz Non-ECC Memory
Ổ cứng	M.2 512GB PCIe NVMe Class 35 Solid State Drive
Card VGA	NVIDIA® Quadro® T1000
Màn hình	15.6" UltraSharp FHD+, 1920x1200,AG,NT, w/Prem Panel Guar, 100% sRGB
Trọng lượng	1.86 Kg
Pin	6 Cell 72Wh
Hệ điều hành	Windows 10 Pro
',1,'52990000', '');
INSERT INTO product VALUES ('063','DH011','HP Zbook 15 G2','HP','./assets/img/product/mac_dohoa/HP%20Zbook%2015%20G2.jpg',
'CPU	Core i7-6700HQ ( 4 nhân 8 luồng ), Turbo 3.5 GHz, Cache 6MB
RAM	8 GB - DDR4 bus 2133 (up max 64G - 4 khe)
Ổ cứng	256G SSD (max 2 ổ)
Card VGA	Nvidia Quadro M1000M- 2G & Intel HD 530 chạy song song
Màn hình	15.6 inch Full HD (1920 x 1080)
Trọng lượng	2.5kg
Pin	6 Cell 72Wh
Hệ điều hành	Windows 10 Pro
',32,'16500000', '');
INSERT INTO product VALUES ('064','DH011','HP Zbook 17 G2','HP','./assets/img/product/mac_dohoa/HP%20Zbook%2017%20G2.jpg',
'CPU	Intel Core i7-4810MQ (4 nhân 8 luồng), Turbo 3.8 GHz, 6MB Cache
RAM	8 GB – DDR3L Bus 1600 (Up max 32G – 4 khe)
Ổ cứng	256G SSD (max 4 ổ)
Card VGA	Nvidia Quadro K4100M-4G {Optimus} 
Màn hình	17.3 inch Full HD (1920 x 1080) 
Trọng lượng	3.8kg
Pin	6 Cell 72Wh
Hệ điều hành	Windows 10 Pro
',98,'16300000', '');
INSERT INTO product VALUES ('065','MB013','Macbook Air M1 2020 7-Core GPU','Macbook','./assets/img/product/mac_dohoa/Macbook%20Air%20M1.jpg"',
'CPU	Apple M1
RAM	8GB, LDDR4
Ổ cứng	SSD 256GB
Card VGA	Onboard 7-Core GPU
Màn hình	13.3 inch Retina (2560 x 1600), LED Backlit, IPS, 400 nits
Camera	HD Webcam (720p Webcam)
Cổng kết nối	2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm
Trọng lượng	1.29kg
Pin	Khoảng 10 tiếng
Hệ điều hành	Mac OS
',50,'33490000', '');
INSERT INTO product VALUES ('066','MB013','Macbook Air M1 2020 8-Core GPU','Macbook','./assets/img/product/mac_dohoa/Macbook%20Air%20M1.jpg',
'CPU	Apple M1
RAM	8GB, LDDR4
Ổ cứng	SSD 512GB
Card VGA	Onboard 8-Core GPU
Màn hình	13.3 inch Retina (2560 x 1600), LED Backlit, IPS, 400 nits
Camera	HD Webcam (720p Webcam)
Cổng kết nối	2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm
Trọng lượng	1.29kg
Pin	Khoảng 10 tiếng
Hệ điều hành	Mac OS
',98,'33490000', '31990000');
INSERT INTO product VALUES ('067','MB013','Macbook Air M2 2020 8-Core GPU','Macbook','./assets/img/product/mac_dohoa/Macbook%20Air%20M2.jpg',
'CPU	Apple M2
RAM	8GB, LDDR4
Ổ cứng	SSD 256GB
Card VGA	Onboard 8-Core GPU
Màn hình	13.3 inch Retina (2560 x 1600), LED Backlit, IPS, 400 nits
Camera	HD Webcam (720p Webcam)
Cổng kết nối	2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm
Trọng lượng	1.29kg
Pin	Khoảng 10 tiếng
Hệ điều hành	Mac OS
',51,'32990000', '');
INSERT INTO product VALUES ('068','MB013','Macbook Air M2 2020 10-Core GPU','Macbook','./assets/img/product/mac_dohoa/Macbook%20Air%20M2.jpg',
'CPU	Apple M2
RAM	16GB, LDDR4
Ổ cứng	SSD 512GB
Card VGA	Onboard 10-Core GPU
Màn hình	13.3 inch Retina (2560 x 1600), LED Backlit, IPS, 400 nits
Camera	HD Webcam (720p Webcam)
Cổng kết nối	2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm
Trọng lượng	1.29kg
Pin	Khoảng 10 tiếng
Hệ điều hành	Mac OS
',10,'46990000', '');
INSERT INTO product VALUES ('069','MB013','Macbook Pro 13 inch M1 2020','Macbook','./assets/img/product/mac_dohoa/Macbook%20Pro%20M1.jpg',
'CPU	Apple M1
RAM	8GB, LDDR4
Ổ cứng	SSD 256GB
Card VGA	Onboard GPU
Màn hình	13.3 inch Retina (2560 x 1600), LED Backlit, IPS, 500 nits
Camera	HD Webcam (720p Webcam)
Cổng kết nối	2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm
Trọng lượng	1.29kg
Pin	Khoảng 10 tiếng
Hệ điều hành	Mac OS
',20,'33990000', '');
INSERT INTO product VALUES ('070','MB013','Macbook Pro 14 inch M1 2021','Macbook','./assets/img/product/mac_dohoa/Macbook%20Pro%20M1.jpg',
'CPU	Apple M1
RAM	16GB, LDDR4
Ổ cứng	SSD 512GB
Card VGA	Onboard GPU
Màn hình	14.2 inch Liquid Retina XDR display (3024 x 1964) up to 120Hz
Camera	1080p FaceTime HD camera
Cổng kết nối	3 x Thunderbolt 4 (USB-C), Jack tai nghe 3.5 mm, HDMI
Trọng lượng	1.6kg
Pin	Khoảng 10 tiếng
Hệ điều hành	Mac OS
',30,'52490000', '');
INSERT INTO product VALUES ('071','MB013','Macbook Pro 16 inch M1 2021','Macbook','./assets/img/product/mac_dohoa/Macbook%20Pro%20M1.jpg',
'CPU	Apple M1
RAM	16GB, LDDR4
Ổ cứng	SSD 512GB
Card VGA	Onboard GPU
Màn hình	16.2 inch Liquid Retina XDR display (3456 x 2234) up to 120Hz
Camera	1080p FaceTime HD camera
Cổng kết nối	3 x Thunderbolt 4 (USB-C), Jack tai nghe 3.5 mm, HDMI
Trọng lượng	2.1kg
Pin	Khoảng 10 tiếng
Hệ điều hành	Mac OS
',37,'64490000', '58000000');
INSERT INTO product VALUES ('072','MB013','Macbook Pro 13 inch M2 2022','Macbook','./assets/img/product/mac_dohoa/Macbook%20Pro%20M2.jpg',
'CPU	Apple M2
RAM	16GB, LDDR4
Ổ cứng	SSD 512GB
Card VGA	Onboard GPU
Màn hình	13.3 inch Retina (2560 x 1600), LED Backlit, IPS, 500 nits
Camera	720p FaceTime HD camera
Cổng kết nối	2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm
Trọng lượng	1.4kg
Pin	Khoảng 10 tiếng
Hệ điều hành	Mac OS
',40,'45990000', '');
-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Hồ Thanh Nghĩa', '20130333@st.hcmuaf.edu.vn', '0789456123', 'nghia', 'htn1005', 1);
INSERT INTO `user` VALUES (2, 'Bùi Quốc Long', '20130314@st.hcmuaf.edu.vn', '0987654213', 'long', '12345', 0);
INSERT INTO `user` VALUES (3, 'Diệp Chấn Phong', '20130364@st.hcmuaf.edu.vn', '0373555646', 'phong', '123', 1);

SET FOREIGN_KEY_CHECKS = 1;
