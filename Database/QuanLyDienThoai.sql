-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 29, 2019 at 09:23 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanlydienthoai`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

DROP TABLE IF EXISTS `chitietdonhang`;
CREATE TABLE IF NOT EXISTS `chitietdonhang` (
  `sodh` int(11) NOT NULL,
  `MaDT` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soluong` int(11) DEFAULT NULL,
  `gia` int(11) DEFAULT NULL,
  `thanhtien` int(11) DEFAULT NULL,
  PRIMARY KEY (`sodh`,`MaDT`),
  KEY `FK_Orderitem` (`MaDT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`sodh`, `MaDT`, `soluong`, `gia`, `thanhtien`) VALUES
(2, 'DT045', 1, 13990000, 13990000),
(3, 'DT044', 1, 6990000, 6990000),
(3, 'DT036', 1, 2990000, 2990000),
(4, 'DT044', 1, 6990000, 6990000),
(4, 'DT003', 1, 4090000, 4090000);

-- --------------------------------------------------------

--
-- Table structure for table `dienthoai`
--

DROP TABLE IF EXISTS `dienthoai`;
CREATE TABLE IF NOT EXISTS `dienthoai` (
  `MaDT` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TenDT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MaLoai` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Gia` int(10) NOT NULL,
  `HinhAnh` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MoTa` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaDT`),
  KEY `MaLoai` (`MaLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dienthoai`
--

INSERT INTO `dienthoai` (`MaDT`, `TenDT`, `MaLoai`, `Gia`, `HinhAnh`, `MoTa`) VALUES
('DT001', 'SamSung Galaxy A6 Plus 2018 Xanh', '1', 5090000, 'samsung-galaxy-a6-plus-2018-xanh.png', 'Màn hình: 6\", Full HD+\r\nHĐH: Android 8.0 (Oreo)\r\nCPU: Qualcomm Snapdragon 450 8 nhân\r\nRAM: 4 GB, ROM: 32 GB\r\nCamera: Chính 16 MP & Phụ 5 MP, Selfie: 24 MP\r\nPIN: 3500 mAh'),
('DT002', 'SamSung Galaxy A10 Red', '1', 2890000, 'samsung-galaxy-a10-red.png', 'Màn hình: 6.2\", HD+\r\nHĐH: Android 9.0 (Pie)\r\nCPU: Exynos 7884 8 nhân\r\nRAM: 2 GB, ROM: 32 GB\r\nCamera: 13 MP, Selfie: 5 MP\r\nPIN: 3400 mAh'),
('DT003', 'SamSung Galaxy A30 32GB', '1', 4090000, 'samsung-galaxy-a30-32gb.png', 'Màn hình: 6.4\", Full HD+\r\nHĐH: Android 9.0 (Pie)\r\nCPU: Exynos 7904 8 nhân 64-bit\r\nRAM: 3 GB, ROM: 32 GB\r\nCamera: Chính 16 MP & Phụ 5 MP, Selfie: 16 MP\r\nPIN: 4000 mAh'),
('DT004', 'SamSung Galaxy A80 Gold', '1', 9290000, 'samsung-galaxy-a80-gold.png', 'Màn hình: 6.7\", Full HD+\r\nHĐH: Android 9.0 (Pie)\r\nCPU: Snapdragon 730 8 nhân\r\nRAM: 8 GB, ROM: 128 GB\r\nCamera: Chính 48 MP & Phụ 8 MP, TOF 3D, Selfie: Chính 48 MP & Phụ 8 MP, TOF 3D\r\nPIN: 3700 mAh'),
('DT005', 'SamSung Galaxy J2 Core', '1', 1990000, 'samsung-galaxy-j2-core.png', 'Màn hình: 5\", qHD\r\nHĐH: Android Go Edition\r\nCPU: Qualcomm Snapdragon 425 4 nhân\r\nRAM: 1 GB, ROM: 8 GB\r\nCamera: 8 MP, Selfie: 5 MP\r\nPIN: 2600 mAh'),
('DT006', 'SamSung Galaxy J4 Core', '1', 3090000, 'samsung-galaxy-j4-core.png', 'Màn hình: 6.0\", HD+\r\nHĐH: Android Go Edition\r\nCPU: Qualcomm Snapdragon 425 4 nhân\r\nRAM: 1 GB, ROM: 16 GB\r\nCamera: 8 MP, Selfie: 5 MP\r\nPIN: 3300 mAh'),
('DT007', 'SamSung Galaxy M20', '1', 4690000, 'samsung-galaxy-m20.png', 'Màn hình: 6.3\", Full HD+\r\nHĐH: Android 8.1 (Oreo)\r\nCPU: Exynos 7904 8 nhân\r\nRAM: 3 GB, ROM: 32 GB\r\nCamera: Chính 13 MP & Phụ 5 MP, Selfie: 8 MP\r\nPIN: 5000 mAh'),
('DT008', 'SamSung Galaxy Note 9 Black', '1', 19990000, 'samsung-galaxy-note-9-black.png', 'Màn hình:	Super AMOLED, 6.4\", Quad HD+ (2K+)\r\nHệ điều hành:	Android 8.1 (Oreo)\r\nCamera sau:	Chính 12 MP & Phụ 12 MP\r\nCamera trước:	8 MP\r\nCPU:	Exynos 9810 8 nhân 64-bit\r\nRAM:	6 GB\r\nBộ nhớ trong:	128 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 512 GB\r\nThẻ SIM:\r\n2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G'),
('DT009', 'SamSung Galaxy S10 White', '1', 22990000, 'samsung-galaxy-s10-white.png', 'Màn hình:	Dynamic AMOLED, 6.4\", Quad HD+ (2K+)\r\nHệ điều hành:	Android 9.0 (Pie)\r\nCamera sau:	Chính 12 MP & Phụ 12 MP, 16 MP\r\nCamera trước:	Chính 10 MP & Phụ 8 MP\r\nCPU:	Exynos 9820 8 nhân 64-bit\r\nRAM:	8 GB\r\nBộ nhớ trong:	128 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 512 GB\r\nThẻ SIM:\r\n2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G\r\nHOTSIM VIETTEL GÔGÔ 4G (3GB data/ tháng). Giá từ 150.000đ\r\nDung lượng pin:	4100 mAh, có sạc nhanh'),
('DT010', 'Xiaomi Mi 8 Black', '2', 10990000, 'xiaomi-mi-8-black.png', 'Màn hình:	Super AMOLED, 6.21\", Full HD+\r\nHệ điều hành:	Android 8.1 (Oreo)\r\nCamera sau:	Chính 12 MP & Phụ 12 MP\r\nCamera trước:	20 MP\r\nCPU:	Snapdragon 845 8 nhân\r\nRAM:	6 GB\r\nBộ nhớ trong:	64 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G\r\nHOTSIM VIETTEL GÔGÔ 4G (3GB data/ tháng). Giá từ 150.000đ\r\nDung lượng pin:	3400 mAh, có sạc nhanh'),
('DT011', 'Xiaomi Mi 8 Lite 6GB Black', '2', 6490000, 'xiaomi-mi-8-lite-6gb-black.png', 'Màn hình: 6.26\", Full HD+\r\nHĐH: Android 8.1 (Oreo)\r\nCPU: Qualcomm Snapdragon 660 8 nhân\r\nRAM: 6 GB, ROM: 128 GB\r\nCamera: Chính 12 MP & Phụ 5 MP, Selfie: 24 MP\r\nPIN: 3350 mAh'),
('DT012', 'Xiaomi Mi 8 lite Black', '2', 5990000, 'xiaomi-mi-8-lite-black.png', 'Màn hình: 6.26\", Full HD+\r\nHĐH: Android 8.1 (Oreo)\r\nCPU: Qualcomm Snapdragon 660 8 nhân\r\nRAM: 6 GB, ROM: 128 GB\r\nCamera: Chính 12 MP & Phụ 5 MP, Selfie: 24 MP\r\nPIN: 3350 mAh'),
('DT013', 'Xiaomi Mi 9 Se Blue', '2', 8490000, 'xiaomi-mi-9-se-blue.png', 'Màn hình:	Super AMOLED, 5.97\", Full HD+\r\nHệ điều hành:	Android 9.0 (Pie)\r\nCamera sau:	Chính 48 MP & Phụ 13 MP, 8 MP\r\nCamera trước:	20 MP\r\nCPU:	Snapdragon 712 8 nhân 64-bit\r\nRAM:	6 GB\r\nBộ nhớ trong:	64 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G\r\nHOTSIM VIETTEL GÔGÔ 4G (3GB data/ tháng). Giá từ 250.000đ\r\nDung lượng pin:	3070 mAh, có sạc nhanh'),
('DT014', 'Xiaomi Mi A2 Lite Gold', '2', 2990000, 'xiaomi-mi-a2-lite-gold.png', 'Màn hình: 5.84\", Full HD+\r\nHĐH: Android 8 Oreo (Android One)\r\nCPU: Snapdragon 625 8 nhân\r\nRAM: 3 GB, ROM: 32 GB\r\nCamera: Chính 12 MP & Phụ 5 MP, Selfie: 5 MP\r\nPIN: 4000 mAh'),
('DT015', 'Xiaomi Redmi 7 16GB Black', '2', 2990000, 'xiaomi-redmi-7-16gb-black.png', 'Màn hình: 6.26\", HD+\r\nHĐH: Android 9.0 (Pie)\r\nCPU: Qualcomm Snapdragon 632 8 nhân 64-bit\r\nRAM: 2 GB, ROM: 16 GB\r\nCamera: Chính 12 MP & Phụ 2 MP, Selfie: 8 MP\r\nPIN: 4000 mAh'),
('DT016', 'Xiaomi Redmi 7 Blue', '2', 3690000, 'xiaomi-redmi-7-blue.png', 'Màn hình:	IPS LCD, 6.26\", HD+\r\nHệ điều hành:	Android 9.0 (Pie)\r\nCamera sau:	Chính 12 MP & Phụ 2 MP\r\nCamera trước:	8 MP\r\nCPU:	Qualcomm Snapdragon 632 8 nhân 64-bit\r\nRAM:	2 GB\r\nBộ nhớ trong:	16 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 512 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G\r\nHOTSIM VIETTEL GÔGÔ 4G (3GB data/ tháng). Giá từ 250.000đ\r\nDung lượng pin:	4000 mAh'),
('DT017', 'Xiaomi Redmi Go Black', '2', 1490000, 'xiaomi-redmi-go-black.png', 'Màn hình:	IPS LCD, 5\", HD\r\nHệ điều hành:	Android 8 Oreo (Go Edition)\r\nCamera sau:	8 MP\r\nCamera trước:	5 MP\r\nCPU:	Qualcomm Snapdragon 425 4 nhân 64-bit\r\nRAM:	1 GB\r\nBộ nhớ trong:	8 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 128 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G\r\nHOTSIM VIETTEL GÔGÔ 4G (3GB data/ tháng). Giá từ 250.000đ\r\nDung lượng pin:	3000 mAh'),
('DT018', 'Xiaomi Redmi Note 6 Pro 32GB Black', '2', 4290000, 'xiaomi-redmi-note-6-pro-32gb-black.png', 'Màn hình: 6.26\", Full HD+\r\nHĐH: Android 8.1 (Oreo)\r\nCPU: Qualcomm Snapdragon 636 8 nhân\r\nRAM: 3 GB, ROM: 32 GB\r\nCamera: Chính 12 MP & Phụ 5 MP, Selfie: Chính 20 MP & Phụ 2 MP\r\nPIN: 4000 mAh'),
('DT019', 'Xiaomi Redmi Note 6 Pro Black', '2', 4290000, 'xiaomi-redmi-note-6-pro-black.png', 'Màn hình:	IPS LCD, 6.26\", Full HD+\r\nHệ điều hành:	Android 8.1 (Oreo)\r\nCamera sau:	Chính 12 MP & Phụ 5 MP\r\nCamera trước:	Chính 20 MP & Phụ 2 MP\r\nCPU:	Qualcomm Snapdragon 636 8 nhân 64-bit\r\nRAM:	3 GB\r\nBộ nhớ trong:	32 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:\r\n2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G\r\nHOTSIM VIETTEL GÔGÔ 4G (3GB data/ tháng). Giá từ 250.000đ\r\nDung lượng pin:	4000 mAh'),
('DT020', 'Xiaomi Redmi Note 7', '2', 4990000, 'xiaomi-redmi-note-7.png', 'Màn hình:	IPS LCD, 6.3\", Full HD+\r\nHệ điều hành:	Android 9.0 (Pie)\r\nCamera sau:	Chính 48 MP & Phụ 5 MP\r\nCamera trước:	13 MP\r\nCPU:	Qualcomm Snapdragon 660 8 nhân\r\nRAM:	4 GB\r\nBộ nhớ trong:	64 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:\r\n2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G\r\nHOTSIM VIETTEL GÔGÔ 4G (3GB data/ tháng). Giá từ 250.000đ\r\nDung lượng pin:	4000 mAh, có sạc nhanh'),
('DT021', 'Iphone 6S Plus 32GB', '3', 9990000, 'iphone-6s-plus-32gb.png', 'Màn hình: 5.5\", Retina HD\r\nHĐH: iOS 12\r\nCPU: Apple A9 2 nhân 64-bit\r\nRAM: 2 GB, ROM: 32 GB\r\nCamera: 12 MP, Selfie: 5 MP\r\nPIN: 2750 mAh'),
('DT022', 'Iphone 7 Gold', '3', 11990000, 'iphone-7-gold.png', 'Màn hình:	LED-backlit IPS LCD, 4.7\", Retina HD\r\nHệ điều hành:	iOS 12\r\nCamera sau:	12 MP\r\nCamera trước:	7 MP\r\nCPU:	Apple A10 Fusion 4 nhân 64-bit\r\nRAM:	2 GB\r\nBộ nhớ trong:	32 GB\r\nThẻ SIM:\r\n1 Nano SIM, Hỗ trợ 4G\r\nHOTSIM VIETTEL GÔGÔ 4G (3GB data/ tháng). Giá từ 150.000đ\r\nDung lượng pin:	1960 mAh'),
('DT023', 'Iphone 7 Plus Gold', '3', 12990000, 'iphone-7-plus-gold.png', 'Màn hình:	LED-backlit IPS LCD, 5.5\", Retina HD\r\nHệ điều hành:	iOS 12\r\nCamera sau:	Chính 12 MP & Phụ 12 MP\r\nCamera trước:	7 MP\r\nCPU:	Apple A10 Fusion 4 nhân 64-bit\r\nRAM:	3 GB\r\nBộ nhớ trong:	32 GB\r\nThẻ SIM:\r\n1 Nano SIM, Hỗ trợ 4G\r\nHOTSIM VIETTEL GÔGÔ 4G (3GB data/ tháng). Giá từ 250.000đ\r\nDung lượng pin:	2900 mAh'),
('DT024', 'Iphone 8 Plus', '3', 18990000, 'iphone-8-plus.png', 'Màn hình:	LED-backlit IPS LCD, 5.5\", Retina HD\r\nHệ điều hành:	iOS 12\r\nCamera sau:	Chính 12 MP & Phụ 12 MP\r\nCamera trước:	7 MP\r\nCPU:	Apple A11 Bionic 6 nhân\r\nRAM:	3 GB\r\nBộ nhớ trong:	64 GB\r\nThẻ SIM:\r\n1 Nano SIM, Hỗ trợ 4G\r\nHOTSIM VIETTEL GÔGÔ 4G (3GB data/ tháng). Giá từ 250.000đ\r\nDung lượng pin:	2691 mAh, có sạc nhanh'),
('DT025', 'Iphone X 64GB', '3', 21990000, 'iphone-x-64gb.png', 'Màn hình:	OLED, 5.8\", Super Retina\r\nHệ điều hành:	iOS 12\r\nCamera sau:	Chính 12 MP & Phụ 12 MP\r\nCamera trước:	7 MP\r\nCPU:	Apple A11 Bionic 6 nhân\r\nRAM:	3 GB\r\nBộ nhớ trong:	64 GB'),
('DT026', 'Iphone X 256GB H2', '3', 27990000, 'iphone-x-256gb-h2.png', 'Màn hình: 5.8\", Super Retina\r\nHĐH: iOS 12\r\nCPU: Apple A11 Bionic 6 nhân\r\nRAM: 3 GB, ROM: 256 GB\r\nCamera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP\r\nPIN: 2716 mAh'),
('DT027', 'Iphone XR 128GB Red', '3', 21990000, 'iphone-xr-128gb-red.png', 'Màn hình: 6.1\", Liquid Retina\r\nHĐH: iOS 12\r\nCPU: Apple A12 Bionic 6 nhân\r\nRAM: 3 GB, ROM: 128 GB\r\nCamera: 12 MP, Selfie: 7 MP\r\nPIN: 2942 mAh'),
('DT028', 'Iphone XR 256GB White', '3', 19890000, 'iphone-xr-256gb-white.png', 'Màn hình: 6.1\", Liquid Retina\r\nHĐH: iOS 12\r\nCPU: Apple A12 Bionic 6 nhân\r\nRAM: 3 GB, ROM: 256 GB\r\nCamera: 12 MP, Selfie: 7 MP\r\nPIN: 2942 mAh'),
('DT029', 'Iphone XR Black', '3', 21990000, 'iphone-xr-black.png', 'Màn hình:	IPS LCD, 6.1\", Liquid Retina\r\nHệ điều hành:	iOS 12\r\nCamera sau:	12 MP\r\nCamera trước:	7 MP\r\nCPU:	Apple A12 Bionic 6 nhân\r\nRAM:	3 GB\r\nBộ nhớ trong:	64 GB\r\nThẻ SIM:\r\nNano SIM & eSIM, Hỗ trợ 4G\r\nHOTSIM VIETTEL GÔGÔ 4G (3GB data/ tháng). Giá từ 250.000đ\r\nDung lượng pin:	2942 mAh, có sạc nhanh'),
('DT030', 'Iphone XS 256GB White', '3', 35990000, 'iphone-xs-256gb-white.png', 'Màn hình: 5.8\", Super Retina\r\nHĐH: iOS 12\r\nCPU: Apple A12 Bionic 6 nhân\r\nRAM: 4 GB, ROM: 256 GB\r\nCamera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP\r\nPIN: 2658 mAh'),
('DT031', 'Iphone XS Gold', '3', 26990000, 'iphone-xs-gold.png', 'Màn hình:	OLED, 5.8\", Super Retina\r\nHệ điều hành:	iOS 12\r\nCamera sau:	Chính 12 MP & Phụ 12 MP\r\nCamera trước:	7 MP\r\nCPU:	Apple A12 Bionic 6 nhân\r\nRAM:	4 GB\r\nBộ nhớ trong:	64 GB\r\nThẻ SIM:\r\nNano SIM & eSIM, Hỗ trợ 4G\r\nHOTSIM VIETTEL GÔGÔ 4G (3GB data/ tháng). Giá từ 250.000đ\r\nDung lượng pin:	2658 mAh, có sạc nhanh'),
('DT032', 'Iphone XS Max 256GB White', '3', 35990000, 'iphone-xs-max-256gb-white.png', 'Màn hình: 6.5\", Super Retina\r\nHĐH: iOS 12\r\nCPU: Apple A12 Bionic 6 nhân\r\nRAM: 4 GB, ROM: 256 GB\r\nCamera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP\r\nPIN: 3174 mAh'),
('DT033', 'Iphone XS Max 512GB Gold', '3', 39990000, 'iphone-xs-max-512gb-gold.png', 'Màn hình: 6.5\", Super Retina\r\nHĐH: iOS 12\r\nCPU: Apple A12 Bionic 6 nhân\r\nRAM: 4 GB, ROM: 512 GB\r\nCamera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP\r\nPIN: 3174 mAh'),
('DT034', 'Iphone XS Max Gray', '3', 35990000, 'iphone-xs-max-gray.png', 'Màn hình: 6.5\", Super Retina\r\nHĐH: iOS 12\r\nCPU: Apple A12 Bionic 6 nhân\r\nRAM: 4 GB, ROM: 64 GB\r\nCamera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP\r\nPIN: 3174 mAh'),
('DT035', 'Oppo A1K', '4', 3190000, 'oppo-a1k.png', 'Màn hình: 6.1\", HD+\r\nHĐH: Android 9.0 (Pie)\r\nCPU: MediaTek MT6762R 8 nhân\r\nRAM: 2 GB, ROM: 32 GB\r\nCamera: 8 MP, Selfie: 5 MP\r\nPIN: 4000 mAh'),
('DT036', 'Oppo A3S 16GB Red', '4', 2990000, 'oppo-a3s-16gb-red.png', 'Màn hình: 6.2\", HD+\r\nHĐH: Android 8.1 (Oreo)\r\nCPU: Qualcomm Snapdragon 450 8 nhân\r\nRAM: 2 GB, ROM: 16 GB\r\nCamera: Chính 13 MP & Phụ 2 MP, Selfie: 8 MP\r\nPIN: 4230 mAh'),
('DT037', 'Oppo A3S 32GB', '4', 3790000, 'oppo-a3s-32gb.png', 'Màn hình: 6.2\", HD+\r\nHĐH: Android 8.1 (Oreo)\r\nCPU: Qualcomm Snapdragon 450 8 nhân\r\nRAM: 3 GB, ROM: 32 GB\r\nCamera: Chính 13 MP & Phụ 2 MP, Selfie: 8 MP\r\nPIN: 4230 mAh'),
('DT039', 'Oppo A5S Red', '4', 3990000, 'oppo-a5s-red.png', 'Màn hình: 6.2\", HD+\r\nHĐH: Android 8.1 (Oreo)\r\nCPU: MediaTek Helio P35 8 nhân 64-bit\r\nRAM: 3 GB, ROM: 32 GB\r\nCamera: Chính 13 MP & Phụ 2 MP, Selfie: 8 MP\r\nPIN: 4230 mAh'),
('DT040', 'Oppo A7 32GB Gold', '4', 3990000, 'oppo-a7-32gb-gold.png', 'Màn hình: 6.2\", HD+\r\nHĐH: ColorOS 5.2 (Android 8.1)\r\nCPU: Qualcomm Snapdragon 450 8 nhân\r\nRAM: 3 GB, ROM: 32 GB\r\nCamera: Chính 13 MP & Phụ 2 MP, Selfie: 16 MP\r\nPIN: 4230 mAh'),
('DT041', 'Oppo A7', '4', 5080000, 'ipxr.jpg', 'Màn hình:IPS LCD, 6.2');

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
CREATE TABLE IF NOT EXISTS `donhang` (
  `sodh` int(11) NOT NULL AUTO_INCREMENT,
  `ngaydh` datetime DEFAULT NULL,
  `tendn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hoten` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diachi` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dienthoai` int(50) DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trangthai` int(11) DEFAULT NULL,
  PRIMARY KEY (`sodh`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`sodh`, `ngaydh`, `tendn`, `hoten`, `diachi`, `dienthoai`, `email`, `trangthai`) VALUES
(1, '2019-06-25 00:00:00', 'thang', 'thang', 'thuduc', 133546, 'trducthang0603@gmail.com', 2),
(2, '2019-06-25 00:00:00', 'thang', 'thang', 'thuduc', 133546, 'trducthang0603@gmail.com', 2),
(3, '2019-06-25 00:00:00', 'NguyenTuan', 'Nguyen Ngoc Tuan', 'Phu Yen', 37499, 'nguyenngoctuan@gmail.com', 1),
(4, '2019-06-25 00:00:00', 'thang', 'thang', 'thuduc', 1335465454, 'trducthang0603@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE IF NOT EXISTS `khachhang` (
  `TenDN` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MatKhau` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `HoTen` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DiaChi` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DienThoai` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`TenDN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`TenDN`, `MatKhau`, `HoTen`, `DiaChi`, `DienThoai`, `Email`) VALUES
('', '', '', '', '', ''),
('NguyenTuan', '1998', 'Nguyen Ngoc Tuan', 'Phu Yen', '03749988297', 'nguyenngoctuan@gmail.com'),
('PhanPhong', '1998', 'Phan Xuan Phong', 'Nghe An', '0388948838', 'phanxuanphong37@gmail.com'),
('TranThang', '1998', 'Tran Duc Thang', 'Hue', '0383457744', 'tranducthangHue@gmail.com'),
('admin', '123', 'ADMIN', 'HCMC', '0383457744', 'tranducthangHue@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `loaidienthoai`
--



DROP TABLE IF EXISTS `loaidienthoai`;
CREATE TABLE IF NOT EXISTS `loaidienthoai` (
  `MaLoai` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TenHang` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MaLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `loaidienthoai`
--

INSERT INTO `loaidienthoai` (`MaLoai`, `TenHang`) VALUES
('1', 'SamSung'),
('2', 'XiaoMi'),
('3', 'Iphone'),
('4', 'Oppo');


SELECT TenHang from LoaiDienThoai where MaLoai = 2
--
-- Constraints for dumped tables
--

--
-- Constraints for table `dienthoai`
--
ALTER TABLE `dienthoai`
  ADD CONSTRAINT `dienthoai_ibfk_1` FOREIGN KEY (`MaLoai`) REFERENCES `loaidienthoai` (`MaLoai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;