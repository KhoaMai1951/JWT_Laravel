-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.15 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for caycanhapi
CREATE DATABASE IF NOT EXISTS `caycanhapi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `caycanhapi`;

-- Dumping structure for table caycanhapi.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `content` varchar(225) NOT NULL DEFAULT '0',
  `like` int(11) NOT NULL DEFAULT '0',
  `image_url` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.comment: ~65 rows (approximately)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`id`, `user_id`, `post_id`, `content`, `like`, `image_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 4, 9, 'cmt 1', 1, NULL, '2021-03-01 03:18:48', '2021-05-03 20:07:18', NULL),
	(2, 4, 9, 'cmt 2', 0, NULL, '2021-04-09 03:20:24', '2021-04-09 03:20:24', NULL),
	(3, 4, 9, 'cmt 3', 0, NULL, '2021-04-09 10:21:02', '2021-04-09 10:21:02', NULL),
	(4, 4, 9, 'cmt 4', 0, NULL, '2021-04-09 10:29:07', '2021-04-09 10:29:07', NULL),
	(5, 1, 9, 'cmt 5', 0, NULL, '2021-04-09 10:40:03', '2021-04-09 10:40:03', NULL),
	(6, 1, 9, 'cmt 6', 0, NULL, '2021-04-09 15:51:46', '2021-04-09 15:51:46', NULL),
	(7, 1, 9, 'cmt 7', 0, NULL, '2021-04-09 16:02:13', '2021-04-09 16:02:13', NULL),
	(8, 1, 9, 'cmt 8', 0, NULL, '2021-04-09 16:20:34', '2021-04-09 16:20:34', NULL),
	(9, 1, 9, 'cmt 9', 0, NULL, '2021-04-09 16:20:37', '2021-04-09 16:20:37', NULL),
	(10, 1, 9, 'cmt 10', 0, NULL, '2021-04-09 16:20:39', '2021-04-09 16:20:39', NULL),
	(11, 1, 9, 'cmt 11', 0, NULL, '2021-04-09 16:20:40', '2021-04-09 16:20:40', NULL),
	(12, 1, 9, 'cmt 12', 0, NULL, '2021-04-09 16:20:41', '2021-04-09 16:20:41', NULL),
	(13, 1, 9, 'cmt 13', 0, NULL, '2021-04-09 16:20:42', '2021-04-09 16:20:42', NULL),
	(14, 1, 9, 'cmt 14', 0, NULL, '2021-04-09 16:20:44', '2021-05-03 16:53:43', NULL),
	(15, 1, 9, 'cmt 15', 0, NULL, '2021-04-09 16:20:45', '2021-04-09 16:20:45', NULL),
	(16, 1, 9, 'cmt 16', 0, NULL, '2021-04-09 16:20:47', '2021-04-09 16:20:47', NULL),
	(17, 1, 9, 'cmt 17', 0, NULL, '2021-04-09 16:20:49', '2021-04-09 16:20:49', NULL),
	(18, 1, 9, 'cmt 18', 0, NULL, '2021-04-09 16:20:50', '2021-04-09 16:20:50', NULL),
	(19, 1, 9, 'cmt 19', 0, NULL, '2021-04-09 16:20:52', '2021-04-09 16:20:52', NULL),
	(20, 1, 9, 'cmt 20', 0, NULL, '2021-04-10 10:01:12', '2021-04-10 10:01:12', NULL),
	(21, 1, 9, 'cmt 21', 0, NULL, '2021-04-11 07:50:35', '2021-04-11 07:50:35', NULL),
	(22, 4, 18, 'aaa', 0, NULL, '2021-04-12 15:32:22', '2021-04-12 15:32:22', NULL),
	(23, 4, 18, 'ggg', 0, NULL, '2021-04-12 15:32:44', '2021-04-12 15:32:44', NULL),
	(24, 1, 18, 'cmt', 0, NULL, '2021-04-12 15:33:21', '2021-04-12 15:33:21', NULL),
	(25, 1, 14, 'cmt', 0, NULL, '2021-04-12 15:36:14', '2021-04-12 15:36:14', NULL),
	(26, 1, 14, 'gg', 0, NULL, '2021-04-12 15:37:07', '2021-04-12 15:37:07', NULL),
	(27, 1, 9, 'cmt 22', 0, NULL, '2021-04-12 15:53:30', '2021-04-12 15:53:30', NULL),
	(28, 1, 9, 'cmt 23', 0, NULL, '2021-04-12 15:55:49', '2021-04-12 15:55:49', NULL),
	(29, 1, 9, 'cmt 24', 0, NULL, '2021-04-12 15:56:06', '2021-04-12 15:56:06', NULL),
	(30, 1, 9, 'cmt 25', 0, NULL, '2021-04-12 15:57:09', '2021-04-12 15:57:09', NULL),
	(31, 1, 9, 'cmt 26', 0, NULL, '2021-04-12 16:00:34', '2021-04-12 16:00:34', NULL),
	(32, 1, 9, 'cmt 27', 0, NULL, '2021-04-12 16:01:05', '2021-04-12 16:01:05', NULL),
	(33, 1, 9, 'cmt 28', 0, NULL, '2021-04-12 16:04:42', '2021-04-12 16:04:42', NULL),
	(34, 1, 9, 'cmt 29', 0, NULL, '2021-04-12 16:05:35', '2021-04-12 16:05:35', NULL),
	(35, 1, 9, 'cmt 30', 0, NULL, '2021-04-12 16:07:46', '2021-04-12 16:07:46', NULL),
	(36, 7, 9, 'cmt 31', 0, NULL, '2021-04-12 17:04:25', '2021-04-12 17:04:25', NULL),
	(37, 1, 17, 'cmt', 1, NULL, '2021-04-13 20:06:43', '2021-05-03 21:32:06', NULL),
	(38, 1, 4, 'hi', 0, NULL, '2021-04-17 17:12:35', '2021-04-17 17:12:35', NULL),
	(39, 1, 11, 'nice', 0, NULL, '2021-04-20 11:06:55', '2021-04-20 11:06:55', NULL),
	(40, 1, 18, 'nice', 0, NULL, '2021-04-20 18:03:17', '2021-04-20 18:03:17', NULL),
	(41, 1, 18, 'ff', 0, NULL, '2021-04-20 18:24:45', '2021-04-20 18:24:45', NULL),
	(42, 1, 11, 'hey hey', 0, NULL, '2021-04-21 17:33:19', '2021-04-21 17:33:19', NULL),
	(43, 1, 18, '😃😃😃', 0, NULL, '2021-04-28 16:32:39', '2021-04-28 16:32:39', NULL),
	(44, 1, 12, 'j hay z', 0, NULL, '2021-05-02 21:05:32', '2021-05-02 21:05:32', NULL),
	(45, 1, 14, 'test upload image for comment', 0, '/storage/image_for_comment/e5063435-aa8f-411a-8462-3510f11fda6b172735254_453645012364061_2647792259269094266_n.jpg', '2021-05-03 09:23:16', '2021-05-03 09:23:16', NULL),
	(46, 1, 17, 'test upload', 0, '/storage/image_for_comment/a0856604-5d83-4138-88fb-77ccd2384c38Call-me-Daddyor-else.jpg', '2021-05-03 10:08:30', '2021-05-03 21:31:13', NULL),
	(47, 1, 18, 'test upload', 0, '/storage/image_for_comment/f6bb3392-b7f3-4878-ab23-2687eb6c2d9c1619847938000.jpg', '2021-05-03 10:16:14', '2021-05-03 10:16:14', NULL),
	(48, 1, 18, 'test upload', 0, '/storage/image_for_comment/e1946d15-5091-4f77-bf58-efdf0204748702eb0f7422d2b8e01aee4f5692abf76a--kid-memes-funny-memes.jpg', '2021-05-03 10:25:28', '2021-05-03 10:25:28', NULL),
	(49, 1, 18, 'test upload', 0, NULL, '2021-05-03 11:10:59', '2021-05-03 11:10:59', NULL),
	(50, 1, 18, 'test upload', 0, NULL, '2021-05-03 11:11:19', '2021-05-03 11:11:19', NULL),
	(51, 1, 17, 'a', 1, '/storage/image_for_comment/55e6cf4d-9997-464e-a4c3-07f5926a23fdreceived_395822148337523.jpeg', '2021-05-03 15:33:08', '2021-05-03 21:30:46', NULL),
	(52, 1, 17, 'a', 1, '/storage/image_for_comment/7effd8a0-430f-46bb-926f-fdb38cc5ed98received_395822148337523.jpeg', '2021-05-03 15:33:12', '2021-05-03 21:29:32', NULL),
	(53, 1, 17, 'a', 1, '/storage/image_for_comment/15d6ae66-7513-43ab-953c-ef7dfba5c3cereceived_395822148337523.jpeg', '2021-05-03 15:33:17', '2021-05-03 21:29:30', NULL),
	(54, 1, 15, 'test hình ảnh', 0, '/storage/image_for_comment/4ed5342e-465d-41db-9104-adcc7a9e55767532857.jpg', '2021-05-03 15:35:08', '2021-05-03 15:35:08', NULL),
	(55, 1, 15, 'test hình ảnh', 0, NULL, '2021-05-03 15:35:10', '2021-05-03 15:35:10', NULL),
	(56, 1, 15, 'test', 0, '/storage/image_for_comment/4e675267-1409-45c9-9c6f-083355b0d2deFB_IMG_1620022781265.jpg', '2021-05-03 15:38:13', '2021-05-03 15:38:13', NULL),
	(57, 1, 12, 'test', 0, '/storage/image_for_comment/5d73636e-1202-4555-831d-7ca1d26f5a7ereceived_320142529731007.jpeg', '2021-05-03 15:39:02', '2021-05-03 15:39:02', NULL),
	(58, 1, 18, 'haha', 0, '/storage/image_for_comment/74bc035a-937f-453f-830e-dd0e1ffe51aereceived_320142529731007.jpeg', '2021-05-03 15:40:47', '2021-05-03 15:40:47', NULL),
	(59, 1, 18, 'haha', 0, '/storage/image_for_comment/43d0feb9-3a35-4fd2-bf27-5add97a1333freceived_320142529731007.jpeg', '2021-05-03 15:41:13', '2021-05-03 15:41:13', NULL),
	(60, 1, 18, 'j', 1, '/storage/image_for_comment/b616d887-7d54-48ff-9ed4-b8021b0049cb51bfcab.jpg', '2021-05-03 15:41:28', '2021-05-03 21:24:13', NULL),
	(61, 4, 18, 'ok', 0, '/storage/image_for_comment/36713d54-802b-4abe-b5b6-2db9e7d1661ereceived_476726877111067.jpeg', '2021-05-03 15:42:38', '2021-05-03 21:32:21', NULL),
	(62, 1, 18, 'hay', 1, '/storage/image_for_comment/95c9d617-39cd-4763-871c-7129d488c909received_215422520013161.jpeg', '2021-05-03 15:43:38', '2021-05-03 20:10:29', NULL),
	(63, 4, 18, 'dc', 0, '/storage/image_for_comment/0e633f74-8f08-4ebf-aca6-b1c16763934502eb0f7422d2b8e01aee4f5692abf76a--kid-memes-funny-memes.jpg', '2021-05-03 15:47:52', '2021-05-05 20:09:07', NULL),
	(64, 1, 17, 'ok', 1, '/storage/image_for_comment/4b4185b8-63f9-4abf-8dd2-33068c1e9c04received_169417195090844.jpeg', '2021-05-03 15:50:44', '2021-05-03 21:31:31', NULL),
	(65, 1, 17, 'hi', 0, NULL, '2021-05-03 16:01:50', '2021-05-03 21:31:18', NULL),
	(66, 1, 14, 'test upload image for comment', 0, '/storage/image_for_comment/a81f18d1-4955-462a-ba73-45af4fa5c4b0172735254_453645012364061_2647792259269094266_n.jpg', '2021-05-05 19:03:34', '2021-05-05 19:03:34', NULL),
	(67, 1, 18, 'hay', 0, NULL, '2021-05-05 20:09:19', '2021-05-05 20:09:19', NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.email_activate
CREATE TABLE IF NOT EXISTS `email_activate` (
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `password` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_ai_ci DEFAULT NULL,
  `activation_token` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.email_activate: ~2 rows (approximately)
/*!40000 ALTER TABLE `email_activate` DISABLE KEYS */;
INSERT INTO `email_activate` (`email`, `username`, `password`, `name`, `activation_token`) VALUES
	('cnviety2@gmail.com', 'asd', '$2y$10$xl1PPBFtHupqhSHsD5n2z.3fC8yYO7ObSMbloMDJtknsa/tmugWkC', 'dfft', 9343),
	('a@gmail.com', 'a', '$2y$10$sZWgUJP9N/nZ18w2tMl08uvDDTv1IikWb2rig8Qml8VsXDpXmF90K', 'a', 1944);
/*!40000 ALTER TABLE `email_activate` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.image
CREATE TABLE IF NOT EXISTS `image` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.image: ~0 rows (approximately)
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.image_for_plant
CREATE TABLE IF NOT EXISTS `image_for_plant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plant_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.image_for_plant: ~0 rows (approximately)
/*!40000 ALTER TABLE `image_for_plant` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_for_plant` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.image_for_post
CREATE TABLE IF NOT EXISTS `image_for_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(225) NOT NULL DEFAULT '0',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.image_for_post: ~42 rows (approximately)
/*!40000 ALTER TABLE `image_for_post` DISABLE KEYS */;
INSERT INTO `image_for_post` (`id`, `post_id`, `url`, `created_date`, `is_deleted`) VALUES
	(1, 1, '/uploads/images/store/b63f0060-7024-4cd5-8bad-162a2107ed8bpjaeaec2ppq61.jpg', '0000-00-00', 0),
	(2, 1, '/uploads/images/store/9fd689e8-f654-4688-a35e-e255ac096cd9166589791_318810386284838_1732472508849436995_n.jpg', '0000-00-00', 0),
	(3, 2, '/uploads/images/store/9590c246-c00d-4c90-bdbe-60c87655d1fbpjaeaec2ppq61.jpg', '0000-00-00', 0),
	(4, 2, '/uploads/images/store/29f97de8-9eba-4416-9ec3-cbad610b786c166589791_318810386284838_1732472508849436995_n.jpg', '0000-00-00', 0),
	(20, 6, '/storage/image_for_post/d9d7086a-fd48-4b7d-b0ce-7adabe277de6pjaeaec2ppq61.jpg', '0000-00-00', 0),
	(21, 6, '/storage/image_for_post/c4ed30b4-c291-49d3-92af-bde88402173f166589791_318810386284838_1732472508849436995_n.jpg', '0000-00-00', 0),
	(22, 7, '/storage/image_for_post/e98be2cb-aeaf-4d13-ac6b-3c36c7d61bc3168712583_303393897846080_4442338897972467778_n.jpg', '0000-00-00', 0),
	(23, 7, '/storage/image_for_post/974ac621-262e-4833-a0d7-87f27e02f822166589791_318810386284838_1732472508849436995_n.jpg', '0000-00-00', 0),
	(24, 7, '/storage/image_for_post/cae2fb1f-e1b7-4cd8-b327-35bbe9482d84166278299_1567702360105482_2163745118861548136_n.jpg', '0000-00-00', 0),
	(25, 8, '/storage/image_for_post/dae17ef2-a06d-41a8-ae88-a28df83f30dd1615696350000.jpg', '0000-00-00', 0),
	(26, 8, '/storage/image_for_post/4f76a7c3-d7fa-4dc7-98e8-474a3403b976Cause-Im-Batman.jpg', '0000-00-00', 0),
	(27, 9, '/storage/image_for_post/f6ea6e9e-c1c5-4f0f-963a-a36782efdbecFB_IMG_1617837552044.jpg', '0000-00-00', 0),
	(28, 9, '/storage/image_for_post/4041366d-c86c-4925-9814-9cbfd1e72929FB_IMG_1617836265454.jpg', '0000-00-00', 0),
	(29, 9, '/storage/image_for_post/c8b17e0a-d0bd-4968-bf3b-66f704d043c6FB_IMG_1617793099630.jpg', '0000-00-00', 0),
	(30, 9, '/storage/image_for_post/2503965d-21f6-4e4e-bc03-f58e90337de1FB_IMG_1617773489027.jpg', '0000-00-00', 0),
	(31, 11, '/storage/image_for_post/1adc2ecb-b838-4a3c-9a14-78d1fab7da07images.jpeg', '0000-00-00', 0),
	(32, 11, '/storage/image_for_post/47fdc115-d000-4bb8-9ce4-67dba3cac738fejka-artificial-potted-plant-indoor-outdoor-monstera__0614197_pe686822_s5.webp', '0000-00-00', 0),
	(33, 11, '/storage/image_for_post/ef756d0f-ec1e-4c7c-8d8c-819a7bf131c0Damnuocmautim41421617275598-16-5129-3856-1617335826_r_680x0.jpg', '0000-00-00', 0),
	(34, 11, '/storage/image_for_post/eae41089-7a02-41cc-a06f-5b0f4a2f062edownload-1617263504-1617263517-9885-1617263666_r_680x0.jpg', '0000-00-00', 0),
	(35, 11, '/storage/image_for_post/f7b05351-5d60-44da-9ec6-8b7616b10f0eyucca-cane-plant-in-a-pot-on-a-white-background-royalty-free-image-1580856558.jpg', '0000-00-00', 0),
	(36, 11, '/storage/image_for_post/41fcc67a-ccf0-4a70-a9db-43041f78f2c3tau224281617163081-1617177532-9915-1617241959_680x0.jpg', '0000-00-00', 0),
	(37, 12, '/storage/image_for_post/d1028831-27f6-4aa1-9506-4da119e4588eFB_IMG_1618017531301.jpg', '0000-00-00', 0),
	(38, 12, '/storage/image_for_post/89c48032-024e-421b-9711-dad9f95d45c9FB_IMG_1617944642909.jpg', '0000-00-00', 0),
	(39, 13, '/storage/image_for_post/e5ee8faf-b12c-4f14-b0b4-b845190c48e5FB_IMG_1618017531301.jpg', '0000-00-00', 0),
	(40, 13, '/storage/image_for_post/0f8c191d-5287-4787-8a52-6bf3598575c7FB_IMG_1617944642909.jpg', '0000-00-00', 0),
	(41, 14, '/storage/image_for_post/3a68389c-73f1-44f4-b7f6-aa9d4d50e05b168712583_303393897846080_4442338897972467778_n.jpg', '0000-00-00', 0),
	(42, 14, '/storage/image_for_post/65bd2a1e-f350-4043-a292-24df96a3de97166589791_318810386284838_1732472508849436995_n.jpg', '0000-00-00', 0),
	(43, 14, '/storage/image_for_post/3d60b29e-831f-4fc2-b6a5-087c2a1025eb166278299_1567702360105482_2163745118861548136_n.jpg', '0000-00-00', 0),
	(44, 15, '/storage/image_for_post/91895dcc-42fe-4ee7-9162-4b6a5cb513e4FB_IMG_1618017531301.jpg', '0000-00-00', 0),
	(45, 15, '/storage/image_for_post/8430b122-5713-4c40-941a-2a8db14a8ea2FB_IMG_1617944642909.jpg', '0000-00-00', 0),
	(46, 16, '/storage/image_for_post/0af21801-d948-4c7b-be97-e43d6c77168bFB_IMG_1618017531301.jpg', '0000-00-00', 0),
	(47, 16, '/storage/image_for_post/9b3954ca-efd7-415c-8a22-0319b776cbc3FB_IMG_1617944642909.jpg', '0000-00-00', 0),
	(48, 17, '/storage/image_for_post/14616600-7011-452e-b145-6563768e0ad0FB_IMG_1618017531301.jpg', '0000-00-00', 0),
	(49, 17, '/storage/image_for_post/f1494610-0262-4489-958c-6f9e59486a7aFB_IMG_1617944642909.jpg', '0000-00-00', 0),
	(50, 18, '/storage/image_for_post/5ec3652e-1e9a-4d3f-bbb8-52284e15a61dFB_IMG_1618017531301.jpg', '0000-00-00', 0),
	(51, 18, '/storage/image_for_post/65d4c2ae-e4a6-45a2-a839-8b8585865935FB_IMG_1617944642909.jpg', '0000-00-00', 0),
	(52, 19, '/storage/image_for_post/b9bd2bd1-f79e-4ca8-905a-90a7de07a288168712583_303393897846080_4442338897972467778_n.jpg', '0000-00-00', 0),
	(53, 19, '/storage/image_for_post/1c3b8f40-d613-4cc6-9e3a-ddae1e279387166589791_318810386284838_1732472508849436995_n.jpg', '0000-00-00', 0),
	(54, 19, '/storage/image_for_post/d819c653-77bf-411a-a458-ac2ca9b7c84d166278299_1567702360105482_2163745118861548136_n.jpg', '0000-00-00', 0),
	(55, 20, '/storage/image_for_post/70cd2172-adb2-4a7d-985b-f86b9a633cdf168712583_303393897846080_4442338897972467778_n.jpg', '0000-00-00', 0),
	(56, 20, '/storage/image_for_post/d95d9a67-4653-4e5e-aef6-a830e55e409b166589791_318810386284838_1732472508849436995_n.jpg', '0000-00-00', 0),
	(57, 20, '/storage/image_for_post/acc3f1e7-b948-4ab2-8094-a92c6a31cc26166278299_1567702360105482_2163745118861548136_n.jpg', '0000-00-00', 0),
	(58, 21, '/storage/image_for_post/66e89163-3650-4575-b0c8-4d4cba6c8466received_532844317676190.jpeg', '0000-00-00', 0);
/*!40000 ALTER TABLE `image_for_post` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.image_for_user
CREATE TABLE IF NOT EXISTS `image_for_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.image_for_user: ~2 rows (approximately)
/*!40000 ALTER TABLE `image_for_user` DISABLE KEYS */;
INSERT INTO `image_for_user` (`id`, `user_id`, `url`, `created_at`, `is_deleted`) VALUES
	(15, 4, '/storage/image_for_user/1440c998-4809-4843-8cd3-82960716c3a2171227599_219177479848755_9089002422357136983_n.jpg', '0000-00-00 00:00:00', 0),
	(27, 1, '/storage/image_for_user/e9e8daaa-62ba-4fd3-8d32-95f3d1d07896images (1).jpeg', '0000-00-00 00:00:00', 0);
/*!40000 ALTER TABLE `image_for_user` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.liked_comment
CREATE TABLE IF NOT EXISTS `liked_comment` (
  `comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.liked_comment: ~8 rows (approximately)
/*!40000 ALTER TABLE `liked_comment` DISABLE KEYS */;
INSERT INTO `liked_comment` (`comment_id`, `user_id`) VALUES
	(1, 2),
	(62, 1),
	(60, 1),
	(53, 1),
	(52, 1),
	(51, 1),
	(64, 1),
	(37, 1);
/*!40000 ALTER TABLE `liked_comment` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.liked_post
CREATE TABLE IF NOT EXISTS `liked_post` (
  `post_id` int(4) DEFAULT NULL,
  `user_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.liked_post: ~16 rows (approximately)
/*!40000 ALTER TABLE `liked_post` DISABLE KEYS */;
INSERT INTO `liked_post` (`post_id`, `user_id`) VALUES
	(1, 1),
	(10, 1),
	(14, 1),
	(12, 1),
	(7, 1),
	(9, 1),
	(8, 1),
	(17, 1),
	(11, 1),
	(16, 1),
	(6, 1),
	(21, 1),
	(19, 1),
	(20, 1),
	(15, 1),
	(18, 1);
/*!40000 ALTER TABLE `liked_post` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.migrations: ~9 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(9, '2014_10_12_000000_create_users_table', 1),
	(10, '2014_10_12_100000_create_password_resets_table', 1),
	(11, '2019_08_19_000000_create_failed_jobs_table', 1),
	(12, '2021_03_14_014525_create_images_table', 1),
	(13, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
	(14, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
	(15, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
	(16, '2016_06_01_000004_create_oauth_clients_table', 2),
	(17, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.oauth_access_tokens: ~113 rows (approximately)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('01012f025561d895a6a4bd117c3b51dc51af6af5da85a8540c92117aaf2567e4e5ba3b6c6da88d5c', 1, 3, 'appToken', '[]', 1, '2021-04-09 19:04:17', '2021-04-09 19:04:17', '2022-04-09 19:04:17'),
	('049a47374c0932f062c0bade0047569758d1cf51ce0ebb3f388fcf5a55a5126bc3f3cd4ece99f420', NULL, 1, 'appToken', '[]', 0, '2021-04-03 12:34:11', '2021-04-03 12:34:11', '2022-04-03 12:34:11'),
	('0502a5e2410625f0bd53ca32d197a2bbc3d59579f6779515fe00100d67f2a9ba9b9124497201c982', 3, 3, 'appToken', '[]', 0, '2021-04-03 13:59:14', '2021-04-03 13:59:14', '2022-04-03 13:59:14'),
	('051684a08b4297743da5a9551a96d044bbe5d28338bae5d41c2a25efe626ce7c56abb15863405d74', 4, 1, 'appToken', '[]', 1, '2021-03-27 11:24:24', '2021-03-27 11:24:24', '2022-03-27 11:24:24'),
	('06d3d03741c278a22412ed7efa11b0af0da119f11e1afd435245907776cabbcdd030f2cd6e8a205c', 1, 3, 'appToken', '[]', 0, '2021-04-05 12:50:36', '2021-04-05 12:50:36', '2022-04-05 12:50:36'),
	('0741f653eccb12cbfed7cfb72950d5fe73d95477fdd66ba42c8fc968dd692f10d0805bc2dda85c7e', 1, 1, 'appToken', '[]', 1, '2021-03-22 13:49:20', '2021-03-22 13:49:20', '2022-03-22 13:49:20'),
	('09a1486205ba01630639ea353f8e2fb07f1750eb5094dc1aa18fcf2e6bae52f22aaeeed2c4c454ef', 4, 1, 'appToken', '[]', 0, '2021-03-23 12:18:51', '2021-03-23 12:18:51', '2022-03-23 12:18:51'),
	('0b0742c3545ee8c8c9c5abc3504709597b8da625d086b4528366d01ada1f3ce196ebe3679ea3d336', 1, 3, 'appToken', '[]', 0, '2021-04-07 11:37:10', '2021-04-07 11:37:10', '2022-04-07 11:37:10'),
	('0c8d083a50d5e6c53dff5cc44e2f98533beb5c45bacac1dfc4740f7827e12ec0447d057f8ee0abf9', 4, 1, 'appToken', '[]', 0, '2021-03-22 12:41:32', '2021-03-22 12:41:32', '2022-03-22 12:41:32'),
	('0caec6ef54d5891ffc28994d604bc6f67290c27db6630e71b146997ac5dfb169fd096062f684d57c', NULL, 3, 'appToken', '[]', 0, '2021-04-08 08:28:07', '2021-04-08 08:28:07', '2022-04-08 08:28:07'),
	('0cc7b42e551f884660b5cb7d1b9a883b25e23bcc273ba942c4ed32c12fe4b71a938dba87a24a43a4', 4, 1, 'appToken', '[]', 0, '2021-03-27 10:18:22', '2021-03-27 10:18:22', '2022-03-27 10:18:22'),
	('107b92f4c9e7758f8faa285b42c30b85676afbbc55d2ea77b77de14d3157805702bb8dfc178a4b81', 3, 3, 'appToken', '[]', 0, '2021-04-03 13:49:49', '2021-04-03 13:49:49', '2022-04-03 13:49:49'),
	('11a3c0a5dbe758faa43a257195b01be0f2db3d7a04c6b039a1cc048dfdaa3b3ab231b8b72abe66bc', 1, 3, 'appToken', '[]', 1, '2021-04-19 19:17:44', '2021-04-19 19:17:44', '2022-04-19 19:17:44'),
	('11d0296062bd828785b2c20781cc7db4471c5959edd4e910d992709822f17a579faa2ba22a0af26b', 1, 3, 'appToken', '[]', 1, '2021-04-08 00:42:49', '2021-04-08 00:42:49', '2022-04-08 00:42:49'),
	('14946c1343171056ee78c61ac5d278027a77b06f5ea615c5ca47af2b79fb83f1aa84f01f9b2838f9', 1, 3, 'appToken', '[]', 0, '2021-04-12 18:51:39', '2021-04-12 18:51:39', '2022-04-12 18:51:39'),
	('151fac03c4d4a7fbd5af72f2b75ba685589c2572b7e1f2b86aaad2bffb120f7221a712900b955850', 4, 1, 'appToken', '[]', 0, '2021-03-28 04:47:52', '2021-03-28 04:47:52', '2022-03-28 04:47:52'),
	('16f9052a69f14e610ed2f4507904ed4015a0856b800ca46f8b68feaf7ca79e4a8f96bd8d3df0f0b3', 4, 1, 'appToken', '[]', 0, '2021-03-27 11:35:55', '2021-03-27 11:35:55', '2022-03-27 11:35:55'),
	('17900b309de910a5d7f8dc91fc11c5a56d845841083c52c2d3b34e0825d49b84eeb833758471bc88', 1, 3, 'appToken', '[]', 0, '2021-04-15 11:00:12', '2021-04-15 11:00:12', '2022-04-15 11:00:12'),
	('181f076e0007cf5bb01102c06c4e2e176927020ad9c21d9f4597eb5354061ef94623e99ffcc15681', 4, 3, 'appToken', '[]', 1, '2021-04-08 08:28:14', '2021-04-08 08:28:14', '2022-04-08 08:28:14'),
	('19ce185f6f1ce518a5c7246a6177a6d8cae6fe5983383301c4be15901e2c5581966a016d1d7cd372', 3, 3, 'appToken', '[]', 1, '2021-04-03 13:46:07', '2021-04-03 13:46:07', '2022-04-03 13:46:07'),
	('1a40d3996fe8a7a0650f31feb13192f912dec04a88a00664a6ba60ab92d53d32db03a654dbba6795', 4, 1, NULL, '[]', 0, '2021-03-22 12:35:29', '2021-03-22 12:35:29', '2022-03-22 12:35:29'),
	('1b34e0053f2de48c160cb53259be20bec98401576283a676dde2a2d47dcc9b4ddf0b55e646ccc41a', 1, 1, 'appToken', '[]', 0, '2021-03-28 13:51:36', '2021-03-28 13:51:36', '2022-03-28 13:51:36'),
	('1cc8bf47fba02c0bb21bf490ccf8c334fee7cb6ef6b07acc7d66bd2e0e732cc7a7b4309779142fbe', NULL, 1, 'appToken', '[]', 0, '2021-03-29 13:27:24', '2021-03-29 13:27:24', '2022-03-29 13:27:24'),
	('1cce811c2130b3329d68aab83ed4a4ee61aa66d3f785caf4eb108d29e87b9c6337900d43f0d753fc', 1, 3, 'appToken', '[]', 1, '2021-04-08 05:11:33', '2021-04-08 05:11:33', '2022-04-08 05:11:33'),
	('1ebabf5d84097911d86bf0572f3336bcddc9ec9a10a5417b4e8035f0235e5a15940be9e451e73940', 1, 3, 'appToken', '[]', 1, '2021-04-10 16:51:39', '2021-04-10 16:51:39', '2022-04-10 16:51:39'),
	('1f98692ba5edd46281f44af4faa1c8b58a0a430dee4729dee65b928160a02e4f090a84147a6a79bb', 1, 3, 'appToken', '[]', 0, '2021-04-21 14:24:49', '2021-04-21 14:24:49', '2022-04-21 14:24:49'),
	('21bb207848543e3224ee71f3078411c423851c1e600b170202c5c5974685b0b511c203a392707a4c', 4, 3, 'appToken', '[]', 1, '2021-04-09 01:52:25', '2021-04-09 01:52:25', '2022-04-09 01:52:25'),
	('2405a9eaf50936dab297cbca3a28703f32ab263dacc8eb34b34c634ef03449c6ec405de3796d2a71', 1, 3, 'appToken', '[]', 1, '2021-04-10 17:10:31', '2021-04-10 17:10:31', '2022-04-10 17:10:31'),
	('242569108fd074469b22e200cd5a4ef1cbdae581b636e83da9a04243259d6cbaf04ec6f69f4e7ee5', 3, 1, 'appToken', '[]', 0, '2021-04-03 13:23:22', '2021-04-03 13:23:22', '2022-04-03 13:23:22'),
	('2442d5aeb3fb46320483ed4e09cfe1b56e524acabee199574a80cc3423e064605cf82cb7181962be', 3, 3, 'appToken', '[]', 1, '2021-04-03 13:45:26', '2021-04-03 13:45:26', '2022-04-03 13:45:26'),
	('24b6378e759b8445053cb23d99b9c8c859c21b487dfe58ef5ab356fdf36680073ad83dd5bffd4e42', 1, 3, 'appToken', '[]', 0, '2021-04-22 08:57:22', '2021-04-22 08:57:22', '2022-04-22 08:57:22'),
	('2893f5b934e20eaea8561c6af3a6cf146c9329e05aaf6b3fb62219af47d594e4ffa59a779eb4c600', 3, 1, 'appToken', '[]', 0, '2021-04-03 03:04:03', '2021-04-03 03:04:03', '2022-04-03 03:04:03'),
	('28a2b74855fab6d56c4c76a9639a3830e6ee499a212cbd219d9f94e2a292e1760dd4b760d62405d6', 4, 1, 'appToken', '[]', 1, '2021-03-27 11:27:17', '2021-03-27 11:27:17', '2022-03-27 11:27:17'),
	('28cc3bc93356704cb4aa201775d4d0d890485f7e4067b8861db3c5186497be5071eb3c68101c3a9c', 1, 3, 'appToken', '[]', 1, '2021-04-12 09:21:31', '2021-04-12 09:21:31', '2022-04-12 09:21:31'),
	('290be3715ab8905382a3c4b7ea56bf4a3f6d43fe54079b87abbcd53a1ecba8092f764fd9a1024556', 1, 3, 'appToken', '[]', 1, '2021-04-10 16:52:00', '2021-04-10 16:52:00', '2022-04-10 16:52:00'),
	('2b2b19c9d261153d77572fe2f5bd7017bd5a0629ba2df0bc38564a1f66ef6e75227fd184181630cc', 1, 3, 'appToken', '[]', 0, '2021-04-07 11:41:22', '2021-04-07 11:41:22', '2022-04-07 11:41:22'),
	('2b76d897cf6352e9664d6c13a2a9468df9bd0417bab9e45d2c21afc8b4b3c57e177e8fdcd2005c57', NULL, 1, 'appToken', '[]', 0, '2021-04-03 12:29:31', '2021-04-03 12:29:31', '2022-04-03 12:29:31'),
	('31a043a826c8036e1f5c2c29f994549fba9ec6c331c88d3c67dff94bea64c117589666b248ddea19', 3, 3, 'appToken', '[]', 0, '2021-04-04 00:40:52', '2021-04-04 00:40:52', '2022-04-04 00:40:52'),
	('31c236e5bc8f57d51d5012418034a44fca3909c9db9e874958fd0f8134e611008b256e054d9e083e', 7, 3, 'appToken', '[]', 1, '2021-04-12 17:03:51', '2021-04-12 17:03:51', '2022-04-12 17:03:51'),
	('32f8dcc615b28a7d96c9b09c81caf00682b66e9d285561484700bcdab6a5979811c07ad37e117950', 1, 3, 'appToken', '[]', 0, '2021-04-26 19:38:26', '2021-04-26 19:38:26', '2022-04-26 19:38:26'),
	('37810ff23314c5527568ada0fba898348e1be4bdd866635be1527cc97d3ea7951fd7db74e5262ca5', 4, 1, 'appToken', '[]', 0, '2021-03-27 13:41:28', '2021-03-27 13:41:28', '2022-03-27 13:41:28'),
	('379b7f58a80c6985acc03d6291b1fe7bb78982e158ebd080c06bc03ae85f1cbefcb201447ed0d326', NULL, 1, 'appToken', '[]', 0, '2021-03-31 14:18:41', '2021-03-31 14:18:41', '2022-03-31 14:18:41'),
	('39cc6b4ea9605f69f6f0c33ec828abcbb0fe40d551bdabca6cd2ce580c960bf470634a1904ca03a8', 1, 3, 'appToken', '[]', 0, '2021-04-15 16:14:32', '2021-04-15 16:14:32', '2022-04-15 16:14:32'),
	('3bb1d34d2fd4163494024674f81d3ebdb0d2031d65b0c4e9e7c0674021ded1662d368de123bbabc7', 1, 3, 'appToken', '[]', 1, '2021-04-09 01:52:04', '2021-04-09 01:52:04', '2022-04-09 01:52:04'),
	('3ff95e5bcf6f3d77f30507c3f52121d9063c968269798a45dc86bf6d12f1b70914204c496f891f04', NULL, 1, 'appToken', '[]', 0, '2021-03-31 14:37:34', '2021-03-31 14:37:34', '2022-03-31 14:37:34'),
	('40b67a7712485a895fe742682ccf8ac976aacac1f8f1b60f1e678c5be0b7c46056996a7dcc6fca98', 4, 1, 'appToken', '[]', 0, '2021-03-28 09:44:13', '2021-03-28 09:44:13', '2022-03-28 09:44:13'),
	('41986a27226faf2fcd584f4cb568c7223347f133c1171a1b9199d4107f8888add7f3086dce8f51da', NULL, 1, 'appToken', '[]', 0, '2021-04-03 03:40:14', '2021-04-03 03:40:14', '2022-04-03 03:40:14'),
	('43316bb12bc378c2d9fc89c534adb28871eb6c7b9cf1424a5e1ed79c055ae5d5fe6ac803d4bf001f', 3, 3, 'appToken', '[]', 0, '2021-04-04 12:11:48', '2021-04-04 12:11:48', '2022-04-04 12:11:48'),
	('461df318ef0d7702c39a2180977994a5b58d2a9ce64d0958bcba9c16d47b4e945d8a53151e54424f', 3, 1, 'appToken', '[]', 0, '2021-04-02 03:17:03', '2021-04-02 03:17:03', '2022-04-02 03:17:03'),
	('4a238f04afee51ffce4388dc2f4ff080198a332dfe617c161b293e8b3fa7bcdc6264b41f0b314282', 4, 1, 'appToken', '[]', 1, '2021-03-27 11:20:20', '2021-03-27 11:20:20', '2022-03-27 11:20:20'),
	('4ac6b5571e9a3976a12868f84389e237f9c086c7c730ce2507244bb619c7574e1a4ba4a25d5324b0', 1, 3, 'appToken', '[]', 0, '2021-04-19 11:50:16', '2021-04-19 11:50:16', '2022-04-19 11:50:16'),
	('4aec712cd8fbfcdd6977a18b670df43a26ab60939447cb115626cba12b642a94c6b61effbefdad2a', 4, 1, 'appToken', '[]', 1, '2021-03-23 12:46:06', '2021-03-23 12:46:06', '2022-03-23 12:46:06'),
	('503d5e20b728e13a600b4f484b283a6ca22a8d21f10ef17b453fc0a04a3ca6805600ae3ab0fc57cb', 3, 1, NULL, '[]', 0, '2021-03-22 12:35:02', '2021-03-22 12:35:02', '2022-03-22 12:35:02'),
	('513fb62c2db68b8f15902602f6e9daa2277a1a656b308a6d741d806470ce05440438485fb8db5f02', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:11:32', '2021-03-27 12:11:32', '2022-03-27 12:11:32'),
	('51a991322aa1443352c7239a357bdc524d3de076c5e48d2c73544e8774144839871c62a58c782466', 3, 1, 'appToken', '[]', 0, '2021-04-03 13:19:03', '2021-04-03 13:19:03', '2022-04-03 13:19:03'),
	('51f2a127557bc55e79c0fce107e82ff7060c9da5e0f32625e9a19f534d90503845ef70e13c58c730', 1, 3, 'appToken', '[]', 1, '2021-04-05 12:50:06', '2021-04-05 12:50:06', '2022-04-05 12:50:06'),
	('555cf96dc82d1555b2991522b33f2e560a9ee8fa7bef0940c7d8f6355e4b3c600ae3718d8c997091', 1, 3, 'appToken', '[]', 1, '2021-04-11 20:32:34', '2021-04-11 20:32:34', '2022-04-11 20:32:34'),
	('577a6ebfedd4234205dad3722fac6dee0ccf0136f2ea5d1c5ac70988edb906d1f8fce8be8f357d99', 5, 1, 'appToken', '[]', 0, '2021-03-22 12:37:55', '2021-03-22 12:37:55', '2022-03-22 12:37:55'),
	('5a7efd3801bb46f96ada41e1d60385735ffbf0967a803cb701094a6ef328151e2c36f4d23a58ad2f', 3, 1, 'appToken', '[]', 1, '2021-04-02 03:11:34', '2021-04-02 03:11:34', '2022-04-02 03:11:34'),
	('5ba03ea8e6b8f0c498013fa6de3c0e8913ed4482e538ec95d0c6385b97d09a09db7e809d2b5f3c4f', 1, 3, 'appToken', '[]', 1, '2021-04-19 11:31:22', '2021-04-19 11:31:22', '2022-04-19 11:31:22'),
	('5d451451b10958e6ba336b8d93634bd93f08cb58703ec02198d501f713fda49d773d62d3207283bd', 4, 1, 'appToken', '[]', 1, '2021-03-27 11:06:32', '2021-03-27 11:06:32', '2022-03-27 11:06:32'),
	('5d998019174f64393bede990c8167cf81032c291c30ba694350b3dcb38cecc4a41160393266b9f81', NULL, 1, 'appToken', '[]', 0, '2021-04-03 13:00:28', '2021-04-03 13:00:28', '2022-04-03 13:00:28'),
	('5f2e32cb4d5a136775e7f6dc4a30794d9bb29c255803ae92aa120fbfaf6ea1124ea32e528d12d578', 3, 3, 'appToken', '[]', 1, '2021-04-03 13:56:58', '2021-04-03 13:56:58', '2022-04-03 13:56:58'),
	('5f83cddd3d06669a496ce7da3c33d48bbdfddddd6a284eb2f57569c28fce7791a8eb2fd95222b0bd', 3, 1, 'appToken', '[]', 0, '2021-04-01 03:14:27', '2021-04-01 03:14:27', '2022-04-01 03:14:27'),
	('5fd02e74639ba9d17e06494002d8320ef8dec91649a90f6dc8a5cf62f09d6b6b14b56c96fe299ed2', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:29:40', '2021-03-27 12:29:40', '2022-03-27 12:29:40'),
	('61b34f02bb6880bdf03e56da316dc8a94cae0271215d813f48c175849852e1413f8adcf26afc5413', NULL, 1, 'appToken', '[]', 0, '2021-03-31 14:55:39', '2021-03-31 14:55:39', '2022-03-31 14:55:39'),
	('627b687165de3484ea2dcb86b44cf486181d8c4543cd2ed3254b63a09e59c42865419bb48192ed6e', 4, 1, 'appToken', '[]', 1, '2021-03-23 12:48:21', '2021-03-23 12:48:21', '2022-03-23 12:48:21'),
	('63ed0bc101a252a0f9773c7b6678e3114f358615dcb4fa44dad74f360cacf4eab44a105ea7928819', 4, 1, 'appToken', '[]', 0, '2021-03-27 12:38:52', '2021-03-27 12:38:52', '2022-03-27 12:38:52'),
	('66f264437f58185374c86f5d6cd2ef7901500541b576472c260637ae296e66abce68a087f957f420', 1, 3, 'appToken', '[]', 1, '2021-04-07 11:48:33', '2021-04-07 11:48:33', '2022-04-07 11:48:33'),
	('695323aacb78d6a448b8ac8ba2a1fb66f3e6aa204227f479288aa989c170fbba616e946720ba1f99', NULL, 1, 'appToken', '[]', 0, '2021-03-29 13:21:57', '2021-03-29 13:21:57', '2022-03-29 13:21:57'),
	('6a4b840cd534b5d63a29cd39b763d66f9a8a7ac2590e39b917aaffdadeb202c37a3c83ce5474dfd6', 1, 3, 'appToken', '[]', 0, '2021-04-12 17:04:52', '2021-04-12 17:04:52', '2022-04-12 17:04:52'),
	('6c64b78889227d927bfd258e7d694e9df0f9f77d5ffa07ea56938c42e95a174185e8e562405ad852', NULL, 1, 'appToken', '[]', 0, '2021-04-03 12:23:22', '2021-04-03 12:23:22', '2022-04-03 12:23:22'),
	('703fbf1fc4e2014e0a16c57deab2b7e739ce0c90bfa8f30f090bc2d881f5a11a2d966a99715a36c1', 4, 1, 'appToken', '[]', 0, '2021-03-27 15:23:46', '2021-03-27 15:23:46', '2022-03-27 15:23:46'),
	('710c66447ced57a233414dd1932bea2eefe6d9a788bcfef90ce20759e8cda7792860e009b8b51eaa', 1, 3, 'appToken', '[]', 1, '2021-04-05 11:05:03', '2021-04-05 11:05:03', '2022-04-05 11:05:03'),
	('726b537b8322d6a9549759c95ea634b490fa5e23e38c957e1ff4bd7f30683fff5b04d80998430ce4', 1, 3, 'appToken', '[]', 0, '2021-04-13 15:28:12', '2021-04-13 15:28:12', '2022-04-13 15:28:12'),
	('72ce827284f23e90c74b9965cb31380d819efad64d371ec5a4ff2729e515b2658702452ae4527e61', NULL, 1, 'appToken', '[]', 0, '2021-04-03 12:54:06', '2021-04-03 12:54:06', '2022-04-03 12:54:06'),
	('730aa7b2d8caa60f533e754818a5475cc2faa968ed90eae1257b64822651823209150de858ceedf1', 1, 3, 'appToken', '[]', 1, '2021-04-20 09:52:54', '2021-04-20 09:52:54', '2022-04-20 09:52:54'),
	('7684552c0f567e6c29beb0a7f3c33a82c9385c009a34a2c109725742082e05963b90c1065eb75716', 4, 1, 'appToken', '[]', 1, '2021-03-27 11:20:51', '2021-03-27 11:20:51', '2022-03-27 11:20:51'),
	('76fdcb01a9b4ab75af938b8f459a9dea63f6d4baa7b2071effbc8d74ff6f19b0f5b9d4308aa5d1bc', 4, 1, 'appToken', '[]', 1, '2021-03-28 09:39:51', '2021-03-28 09:39:51', '2022-03-28 09:39:51'),
	('7a7e32f5872b21972d52be2b9e7b2a2af48666aa61e8f9aa554518ad8ff63ab4a533316c3c801f9f', NULL, 1, 'appToken', '[]', 0, '2021-04-03 13:03:48', '2021-04-03 13:03:48', '2022-04-03 13:03:48'),
	('7ab4d51c99b6e8a16d0d2a537637cbf5de8e55bf90449bd14fecc8ddc6a6728e745b2be54869ca3a', 3, 3, 'appToken', '[]', 0, '2021-04-03 13:46:25', '2021-04-03 13:46:25', '2022-04-03 13:46:25'),
	('7acad28e9b900c61bfea46b719c08dc9efbf8f8d50c9719a86dd5ea171fba83f79a88285ee53af07', NULL, 1, 'appToken', '[]', 0, '2021-04-03 12:22:55', '2021-04-03 12:22:55', '2022-04-03 12:22:55'),
	('7efe3ff54c12c82d25f0e230b8bae9884a3a6f7ea5a5bffd34037ec667de189bc4a23a6640d52f15', 4, 1, 'appToken', '[]', 1, '2021-03-23 12:47:06', '2021-03-23 12:47:06', '2022-03-23 12:47:06'),
	('7ff60a23d6252dcde3c99e9a207f0fe2314bf50f981c17d20ef2f48de77333079a0f5816a0626b93', 1, 3, 'appToken', '[]', 1, '2021-04-15 10:32:14', '2021-04-15 10:32:14', '2022-04-15 10:32:14'),
	('82704e56f2f6fd396ba015fb359e66b09dbdb05bb9ff85c4ecf8bf719a930c29ea06fb958abb04ea', 3, 3, 'appToken', '[]', 1, '2021-04-03 13:40:46', '2021-04-03 13:40:46', '2022-04-03 13:40:46'),
	('841f531d7886edc1882ee3b8c64b396c0e7faaca5e0fb7af5f8e5b81e3a351e39285a76f05729fcc', 4, 1, 'appToken', '[]', 0, '2021-03-23 12:23:43', '2021-03-23 12:23:43', '2022-03-23 12:23:43'),
	('8472c921204ce1c0314ecbbbbf29e14ce7b1ac1a7cf2fbc3d33ad958dd2bccf494bc75b3228a2944', 1, 1, 'appToken', '[]', 0, '2021-03-28 13:52:23', '2021-03-28 13:52:23', '2022-03-28 13:52:23'),
	('84a25b19b0dc47ce8dc5cb20200d651266529cc5b6ab2f40426cd5a45466aedf41bf483533cef56a', 1, 3, 'appToken', '[]', 1, '2021-04-05 12:42:11', '2021-04-05 12:42:11', '2022-04-05 12:42:11'),
	('85d6aec0b7ca2a0f63d84b42b0db117d53ce6b6744f201bc4722d8fac1eac7a52970a953607fd53e', 1, 3, 'appToken', '[]', 1, '2021-04-16 09:09:36', '2021-04-16 09:09:36', '2022-04-16 09:09:36'),
	('85f3e39ac5f44d71b3f75dc59043dfb12203f7e2b3de0de68efabe3cdc6b3b9f0c9775b0d64277ff', 1, 3, 'appToken', '[]', 1, '2021-04-10 16:45:56', '2021-04-10 16:45:56', '2022-04-10 16:45:56'),
	('867269979d9bb73e5323cec4331fad6b7faae9a251730de6f5dec9d9ae571126b6af295038f52457', 1, 3, 'appToken', '[]', 0, '2021-04-20 10:02:21', '2021-04-20 10:02:21', '2022-04-20 10:02:21'),
	('8679ce6fa823eaba04c2e86aa2f98ecd403153040e5c7fb94db0c96ae163efb6f041da8b91632f3b', NULL, 1, 'appToken', '[]', 0, '2021-04-03 12:52:13', '2021-04-03 12:52:13', '2022-04-03 12:52:13'),
	('8990e64e4c38572d3ea728fc788dfbe707a3d335e0740372ed0db6320a5b1691fd6ff43abdb47471', 1, 3, 'appToken', '[]', 1, '2021-04-08 05:13:27', '2021-04-08 05:13:27', '2022-04-08 05:13:27'),
	('8a198608d050a093cd4f5915b3a87f3a23724945206810fa01db8d44ddf66757ded8ef67697511e9', 3, 1, 'appToken', '[]', 0, '2021-04-03 03:04:12', '2021-04-03 03:04:12', '2022-04-03 03:04:12'),
	('8aa6f43e4343adb92541067b72d4273519a8bedbc27af91c75820fe60131db5d8aa94c7d62155e22', NULL, 1, 'appToken', '[]', 0, '2021-04-03 12:30:39', '2021-04-03 12:30:39', '2022-04-03 12:30:39'),
	('8b8b14eaa7e9be7ec0ab21e5c4ff58c2fd312c7d615022380bb36080bb98cc52d512f8c394296143', 1, 3, 'appToken', '[]', 1, '2021-04-11 16:07:50', '2021-04-11 16:07:50', '2022-04-11 16:07:50'),
	('8e58490a36ccbcf3423d7666aa8cfc798839b625a860fda2696ff51d9a867408f8e26113104581a0', 3, 1, 'appToken', '[]', 0, '2021-04-03 03:04:19', '2021-04-03 03:04:19', '2022-04-03 03:04:19'),
	('90dc54174029f22ae6e80d75866c272787ff28f6d5b5b97cd652d675497bcaaa9bc328f3bbbaad6f', NULL, 1, 'appToken', '[]', 0, '2021-03-29 13:20:28', '2021-03-29 13:20:28', '2022-03-29 13:20:28'),
	('918f12de1927f4bbadd3a18d9c2b74bb84d7823aff8360bc4a0130e46fdf56ab38c2722120be2f24', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:23:43', '2021-03-27 12:23:43', '2022-03-27 12:23:43'),
	('994d4bcefae6a603aabb4da0fb5ee24823e5a4d3ef55d33f3da3c6cc6dd8b0c24f25560a0b8a93d2', 3, 1, 'appToken', '[]', 1, '2021-03-31 14:55:47', '2021-03-31 14:55:47', '2022-03-31 14:55:47'),
	('9a68968e1cddbfd2eddc4740d5cdf3a7900372c4d98cade9d0e62bfbb51893ae8e3d59c55cc977c6', 2, 1, 'appToken', '[]', 0, '2021-03-31 14:47:12', '2021-03-31 14:47:12', '2022-03-31 14:47:12'),
	('9ba681d5794e3544a5a0f016bfc57be762b712e5db04846f936512f56951f697ab4de9d4d837d304', 4, 1, 'appToken', '[]', 0, '2021-03-27 11:04:12', '2021-03-27 11:04:12', '2022-03-27 11:04:12'),
	('9cff90dc4c94f344180cf4dc8d5c0cdcd73a882f1f13f393cf4add38abb2f25f43b31d2ed61baece', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:20:32', '2021-03-27 12:20:32', '2022-03-27 12:20:32'),
	('a190063d8c94ef9ad77a52039b248d2a8a1080396b5fb7c966d66129c9c9e70c092a8eae7fb3f4f6', 1, 3, 'appToken', '[]', 0, '2021-04-23 19:17:32', '2021-04-23 19:17:32', '2022-04-23 19:17:32'),
	('a90d684a144c3823c89e69350bcb2b83c8d0e15865711241f600f011e3d8b0e645664d18577dfb14', 1, 3, 'appToken', '[]', 0, '2021-04-06 13:00:13', '2021-04-06 13:00:13', '2022-04-06 13:00:13'),
	('aab1881063a2325ad239c798ea8f46566418aea8ad4a9a5d11e6c5490fd9da7cd5f87955bc88acb5', 4, 1, 'appToken', '[]', 0, '2021-03-28 04:47:43', '2021-03-28 04:47:43', '2022-03-28 04:47:43'),
	('abbe3761fea14a09ba60e4fe9e4031952856bf79db3a5352f666605932b0f00df3e368f87ba64b93', 1, 3, 'appToken', '[]', 1, '2021-04-19 11:15:06', '2021-04-19 11:15:06', '2022-04-19 11:15:06'),
	('aeaf745c49394ff7462cdced060d12b5043b1840445258daf7493f61c42299aeb9cd465a3fbdbf01', 1, 3, 'appToken', '[]', 0, '2021-05-03 10:35:32', '2021-05-03 10:35:32', '2022-05-03 10:35:32'),
	('af42dd204693b580a68cb000d8854d6f7a4ada359b193fdc69dbc0886d95a56f508ee12abe75f307', NULL, 1, 'appToken', '[]', 0, '2021-04-03 12:43:29', '2021-04-03 12:43:29', '2022-04-03 12:43:29'),
	('b83a303aaeb651ef1d9769c6f3407e2fe95e3b0cbb86d0b5a11cbdb62b48e7689e5092b39aa7fdcb', 1, 1, 'appToken', '[]', 0, '2021-03-29 13:28:49', '2021-03-29 13:28:49', '2022-03-29 13:28:49'),
	('b8404898990029aa1b67c9b9e37cdc84f9c9259806159821504a288f251baa95a1bd584bb42f5a54', 3, 1, 'appToken', '[]', 0, '2021-04-03 13:19:57', '2021-04-03 13:19:57', '2022-04-03 13:19:57'),
	('b9c89057d8edd9e57e5dd7a3aa19f0cb12b59f04f03dbea408f1177ce6f08060da22158fb3f03d91', 4, 1, 'appToken', '[]', 0, '2021-03-27 12:39:31', '2021-03-27 12:39:31', '2022-03-27 12:39:31'),
	('ba13011a91d43162baa441524971ce71706cecfb66be7e5102f884678a2e154f933c7c33bcd11ac1', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:21:58', '2021-03-27 12:21:58', '2022-03-27 12:21:58'),
	('bc110a3744fef1b9cd4e61e93e2be5336f32962983a3b0b9ff3d05abede6203024aa5156eb1c297a', 1, 3, 'appToken', '[]', 0, '2021-04-05 12:44:25', '2021-04-05 12:44:25', '2022-04-05 12:44:25'),
	('c1c23b63b42dcfe9cecdc88a287412a17895c3399b5499ee350210aa19301a0b7c83675bb1cf899a', 3, 3, NULL, '[]', 0, '2021-04-03 13:38:45', '2021-04-03 13:38:45', '2022-04-03 13:38:45'),
	('c2ab228aacab3d91e141a853b243cc8e098ae46f99aa685c2b0b186ca7c3339c6dc98db133854b9e', NULL, 1, 'appToken', '[]', 0, '2021-03-29 13:33:58', '2021-03-29 13:33:58', '2022-03-29 13:33:58'),
	('c2b5e40e98edb66355470148b9293d7693924e09b8ed9606e8bc3f3e93222f83b95300d714b6a51e', 3, 1, 'appToken', '[]', 0, '2021-04-02 09:48:02', '2021-04-02 09:48:02', '2022-04-02 09:48:02'),
	('c528e7b7c8c3bd84d9bb8708289ca30a69e6e2f259c2ba8d523c8c569928ab1d58af516b24e2907e', 4, 1, 'appToken', '[]', 0, '2021-03-25 03:45:28', '2021-03-25 03:45:28', '2022-03-25 03:45:28'),
	('cca2ebb1c72580e969741e112d1c888fae9b6fc3496193684b636101bddb672721dd58a1505fcb99', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:24:02', '2021-03-27 12:24:02', '2022-03-27 12:24:02'),
	('d29db8f3dc17a536e4dd6a04284f09ada98a9479d005ceb377c0622f08763d94d946561d6edb2140', 1, 3, 'appToken', '[]', 1, '2021-04-08 08:36:06', '2021-04-08 08:36:06', '2022-04-08 08:36:06'),
	('d3923c058adcd977206c224254e1afca8438cd6651383ed11498d35f3f2a5f8814d332fb580f850a', 1, 3, 'appToken', '[]', 1, '2021-04-19 11:49:36', '2021-04-19 11:49:36', '2022-04-19 11:49:36'),
	('d3cddf92fa1cd53a808fb4d0b895df5d002e5f3e67321306cca109d9c80407164d3b501b1b8d48f9', 1, 3, 'appToken', '[]', 0, '2021-04-05 12:46:10', '2021-04-05 12:46:10', '2022-04-05 12:46:10'),
	('d3d062ece4aed30ed31e4412a1573dcd73d1e1faab840c20da4f205d6e946fcdd49a95aec0b88f26', 1, 3, 'appToken', '[]', 1, '2021-04-09 10:39:56', '2021-04-09 10:39:56', '2022-04-09 10:39:56'),
	('d65d804d674b3fe68e943127176b4a9ea6824629499f7b71d7c0e1824f6e483d8f70ff598ffe9381', 1, 3, 'appToken', '[]', 0, '2021-04-06 13:02:05', '2021-04-06 13:02:05', '2022-04-06 13:02:05'),
	('e03b8e2998ac3475e612debd1b1c2c49331309253e77865ca9e9e1115dbfcf6be92308479a01b00b', 1, 3, 'appToken', '[]', 0, '2021-04-11 09:22:54', '2021-04-11 09:22:54', '2022-04-11 09:22:54'),
	('e0d36e85386709e37d315346d93e6dd5a295b6983eaa4a5d7303ae34c6237a827028a79a60df2e1a', 4, 1, 'appToken', '[]', 0, '2021-03-27 09:45:59', '2021-03-27 09:45:59', '2022-03-27 09:45:59'),
	('e0e2bb7199dacd872c172e3c74f6133bacf2816da4ae26311736bfd92bc846fcc82215a4ae14a424', 4, 1, 'appToken', '[]', 0, '2021-03-23 12:23:35', '2021-03-23 12:23:35', '2022-03-23 12:23:35'),
	('e10a6f14be2f83e614b57330e04c850cf22c86597d6aa00cffcd376ba79b6161a5c6d841d3035493', NULL, 3, 'appToken', '[]', 0, '2021-04-12 17:03:22', '2021-04-12 17:03:22', '2022-04-12 17:03:22'),
	('e4245ee1cbce03b3c084af69347e363ab5fada9ed4dcc9eb79ee93cc470a5687dc52c36ee1ee7f5c', 1, 3, 'appToken', '[]', 0, '2021-05-01 15:57:17', '2021-05-01 15:57:17', '2022-05-01 15:57:17'),
	('e717dbd20e484372dd0b7b80dc6b02a2d225ed2cf01c583ec0e3c5faed8373541fcd7950cee0b9f3', 1, 3, 'appToken', '[]', 0, '2021-04-29 07:52:19', '2021-04-29 07:52:19', '2022-04-29 07:52:19'),
	('e74f9d7aa7f6d3a2fc820fc038dd0e3e817ae38a4e60c31b94a47b28dcded80d1bd3a7f981041747', 4, 1, 'appToken', '[]', 0, '2021-03-27 10:18:14', '2021-03-27 10:18:14', '2022-03-27 10:18:14'),
	('e7f8f713a8f8490aea2159d0e68aa25a28af2123e63dda6731e5cf84409cacb850c07ae021ff32e3', NULL, 1, 'appToken', '[]', 0, '2021-04-03 13:11:33', '2021-04-03 13:11:33', '2022-04-03 13:11:33'),
	('eaa30c76d8e193bf1e3b22842f9efedb4301ff337b40ee464f61ac5fd55b3b27cedd7f335c2efa56', 4, 1, 'appToken', '[]', 0, '2021-03-27 10:22:46', '2021-03-27 10:22:46', '2022-03-27 10:22:46'),
	('ebd6e98afedef79f40e55a09e2984e04527d0511cd6e3e9ddebf05237f1aa0b72faa746c87a975e9', 4, 1, 'appToken', '[]', 0, '2021-03-22 13:28:23', '2021-03-22 13:28:23', '2022-03-22 13:28:23'),
	('f69a100fafba06c878b04e2616d7d6088b50279b4dc2fc8a2ba62167e61ce662451539094a136d62', 4, 3, 'appToken', '[]', 1, '2021-04-09 10:39:44', '2021-04-09 10:39:44', '2022-04-09 10:39:44'),
	('f8eaa3bc5d74f3b80b3416efc9b6b050c13d438a8683351a034c91f254b78c6a7f35ed82a313cbeb', 1, 3, 'appToken', '[]', 0, '2021-04-07 11:39:08', '2021-04-07 11:39:08', '2022-04-07 11:39:08'),
	('f998df865d8b085a8d7e61680fbd5cb7ebfa0c1fb4efe640e0048ac415c24cab5e6a8bf020108e02', 1, 3, 'appToken', '[]', 1, '2021-04-08 08:29:50', '2021-04-08 08:29:50', '2022-04-08 08:29:50'),
	('fd93aaa9e806f846e1020686014ae3c76fc19fd50acee4439ff3bb2b149c234342b3645edd1061d4', 1, 3, 'appToken', '[]', 0, '2021-04-28 16:25:42', '2021-04-28 16:25:42', '2022-04-28 16:25:42');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.oauth_auth_codes: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.oauth_clients: ~4 rows (approximately)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', 'HJiIqTxzyIFnX04rUJ2dQ5mlEtMxlb3ZgjsXd4Rc', 'http://localhost', 1, 0, 0, '2021-03-22 12:34:41', '2021-03-22 12:34:41'),
	(2, NULL, 'Laravel Password Grant Client', 'UO09uvCNRC9UT0jxgSkyyE2lSU4uWX8GPUnP5QL6', 'http://localhost', 0, 1, 0, '2021-03-22 12:34:41', '2021-03-22 12:34:41'),
	(3, NULL, 'Laravel Personal Access Client', 'daIn4SzUx1f1NgMFJVaEP4OtMzQNdyyAVb3nfSIQ', 'http://localhost', 1, 0, 0, '2021-04-03 13:31:08', '2021-04-03 13:31:08'),
	(4, NULL, 'Laravel Password Grant Client', 'MpDtuwQBjn5aBKHjBx3KXlWJtYKMEeuP33ih7tX9', 'http://localhost', 0, 1, 0, '2021-04-03 13:31:08', '2021-04-03 13:31:08');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.oauth_personal_access_clients: ~2 rows (approximately)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2021-03-22 12:34:41', '2021-03-22 12:34:41'),
	(2, 3, '2021-04-03 13:31:08', '2021-04-03 13:31:08');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.oauth_refresh_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.post
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `content` varchar(2250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `like` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.post: ~18 rows (approximately)
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`id`, `title`, `content`, `created_at`, `like`, `user_id`, `deleted_at`, `updated_at`) VALUES
	(1, 'abccc', 'Sometimes you may wish to retrieve the first result of a query or perform some other action if no results are found. The firstOr method will return the first result matching the query or, if no results are found, execute the given closure. The value returned by the closure will be considered the result of the firstOr method', '2021-04-06 00:00:00', 1, 4, NULL, '2021-04-22'),
	(2, 'abccc', 'The firstOrNew method, like firstOrCreate, will attempt to locate a record in the database matching the given attributes. However, if a model is not found, a new model instance will be returned. Note that the model returned by firstOrNew has not yet been persisted to the database. You will need to manually call the save method to persist it:', '2021-04-06 00:00:00', 0, 7, NULL, '2021-04-06'),
	(3, 'bài post 1', 'In this example, we assign the name field from the incoming HTTP request to the name attribute of the App\\Models\\Flight model instance. When we call the save method, a record will be inserted into the database. The model\'s created_at and updated_at timestamps will automatically be set when the save method is called, so there is no need to set them manually.', '2021-04-06 00:00:00', 0, 1, NULL, '2021-04-06'),
	(4, 'bài post 2', 'Of course, when using Eloquent, we don\'t only need to retrieve models from the database. We also need to insert new records. Thankfully, Eloquent makes it simple. To insert a new record into the database, you should instantiate a new model instance and set attributes on the model. Then, call the save method on the model instance:', '2021-04-06 00:00:00', 0, 1, NULL, '2021-04-06'),
	(5, 'bài post 3', 'tststs', '2021-04-06 00:00:00', 0, 1, NULL, '2021-04-06'),
	(6, 'bài post 4', 'The save method may also be used to update models that already exist in the database. To update a model, you should retrieve it and set any attributes you wish to update. Then, you should call the model\'s save method. Again, the updated_at timestamp will automatically be updated, so there is no need to manually set its value:', '2021-04-08 00:00:00', 1, 1, NULL, '2021-04-19'),
	(7, 'bài post 5', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-08 00:00:00', 1, 1, NULL, '2021-04-14'),
	(8, 'bài post 6', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-08 00:00:00', 1, 1, NULL, '2021-04-17'),
	(9, 'bài post 7', 'Cây cảnh đặt trong nhà sẽ có cách chăm sóc khác với cây cảnh đặt ngoài trời hay trồng trong đất vườn. Bởi các yếu tố như ánh sáng, độ ẩm sẽ khác nhau, vì vậy việc chăm sóc cây cảnh trong nhà cũng sẽ cầu kỳ hơn. Trong bài viết này, Quang Cảnh Xanh sẽ chia sẻ tới các bạn 8 cách chăm sóc và bảo vệ cây cảnh trong nhà để cây luôn xanh và phát triển tốt.', '2021-04-08 00:00:00', 1, 1, NULL, '2021-04-17'),
	(10, 'bài post 8', 'When issuing a mass update via Eloquent, the saving, saved, updating, and updated model events will not be fired for the updated models. This is because the models are never actually retrieved when issuing a mass update.', '2021-04-09 09:42:09', 1, 1, NULL, '2021-04-09'),
	(11, 'There are a lot of important untold history not taught in schools in the US because of agendas.', 'bbbbbb', '2021-04-10 08:37:11', 1, 1, NULL, '2021-04-21'),
	(12, 'bài post 10', 'The wasChanged method determines if any attributes were changed when the model was last saved within the current request cycle. If needed, you may pass an attribute name to see if a particular attribute was changed:', '2021-04-10 08:46:16', 1, 1, NULL, '2021-04-13'),
	(13, 'bài post 11', 'The getOriginal method returns an array containing the original attributes of the model regardless of any changes to the model since it was retrieved. If needed, you may pass a specific attribute name to get the original value of a particular attribute:', '2021-04-10 08:46:46', 0, 4, NULL, '2021-05-01'),
	(14, 'bài post 12', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-10 08:47:53', 1, 4, NULL, '2021-04-12'),
	(15, 'bài post 13', 'vvv', '2021-04-10 08:49:04', 1, 1, NULL, '2021-04-27'),
	(16, 'bài post 14', 'vvv', '2021-04-10 08:49:27', 1, 1, '2021-05-01 21:29:35', '2021-05-01'),
	(17, 'bài post 15', 'Well depends on what you look for.\nThere are facts in history. We have overlapping sources that confirms that a certain person existed, a certain event took a place, a certain thing was caused by the other, a certain object was in use in a certain way. It\'s just true.\nNow, then we have a thing without enough overlapping sources, mostly covered by something that someone wrote or depicted in other way. With this we have to take in account if that\'s a first-hand relation and if the person could have an agenda in writing less accurately. On this basis we say something probably took place, or could have, or that someone depicted such thing... Just levels of likeness. We know it\'s not really surely true.\nThen we have less clear sources - just mentions of things without further descriptions, pictures, objects, archaeological sites... Those are interpreted. They don\'t lie on purpose, but we only can rely on of what we currently know is most likely. This can be changed with new findings.', '2021-04-10 08:51:57', 1, 1, NULL, '2021-04-21'),
	(18, 'bài post 16', 'In the TextFormField validator function you must return null, it indicates the field has correct value and there are no errors. Returning anything other than null will indicate that the field has an invalid value, i\'ve shared the corrected code of the validator function.', '2021-04-10 08:53:23', 1, 1, NULL, '2021-05-03'),
	(19, 'Tiêu đề chăm sóc cây cảnh', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-22 11:07:08', 1, 1, '2021-04-22 17:14:58', '2021-04-22'),
	(20, 'Tiêu đề chăm sóc cây cảnh', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-22 11:08:03', 1, 1, '2021-04-22 17:14:40', '2021-04-22'),
	(21, 'abc', 'zyz', '2021-04-22 11:09:00', 1, 1, '2021-04-22 17:12:01', '2021-04-22');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.post_tag
CREATE TABLE IF NOT EXISTS `post_tag` (
  `post_id` int(4) DEFAULT NULL,
  `tag_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.post_tag: ~118 rows (approximately)
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES
	(1, 1),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 1),
	(3, 3),
	(4, 2),
	(4, 4),
	(4, 7),
	(4, 8),
	(5, 2),
	(5, 4),
	(5, 7),
	(5, 8),
	(5, 2),
	(5, 4),
	(5, 7),
	(5, 9),
	(6, 1),
	(6, 3),
	(7, 1),
	(7, 3),
	(8, 2),
	(8, 9),
	(9, 2),
	(9, 5),
	(9, 8),
	(9, 11),
	(11, 3),
	(11, 2),
	(11, 8),
	(11, 9),
	(12, 1),
	(12, 4),
	(12, 8),
	(12, 11),
	(13, 1),
	(13, 4),
	(13, 8),
	(13, 11),
	(13, 1),
	(13, 4),
	(13, 8),
	(13, 11),
	(14, 1),
	(14, 3),
	(15, 1),
	(15, 4),
	(15, 8),
	(15, 11),
	(15, 1),
	(15, 4),
	(15, 8),
	(15, 11),
	(15, 1),
	(15, 4),
	(15, 8),
	(15, 11),
	(16, 1),
	(16, 4),
	(16, 8),
	(16, 11),
	(16, 1),
	(16, 4),
	(16, 8),
	(16, 11),
	(16, 1),
	(16, 4),
	(16, 8),
	(16, 11),
	(16, 1),
	(16, 4),
	(16, 8),
	(16, 11),
	(17, 1),
	(17, 4),
	(17, 8),
	(17, 11),
	(17, 1),
	(17, 4),
	(17, 8),
	(17, 11),
	(17, 1),
	(17, 4),
	(17, 8),
	(17, 11),
	(17, 1),
	(17, 4),
	(17, 8),
	(17, 11),
	(17, 1),
	(17, 4),
	(17, 8),
	(17, 11),
	(18, 1),
	(18, 4),
	(18, 8),
	(18, 11),
	(18, 1),
	(18, 4),
	(18, 8),
	(18, 11),
	(18, 1),
	(18, 4),
	(18, 8),
	(18, 11),
	(18, 1),
	(18, 4),
	(18, 8),
	(18, 11),
	(18, 1),
	(18, 4),
	(18, 8),
	(18, 11),
	(18, 1),
	(18, 4),
	(18, 8),
	(18, 11),
	(19, 1),
	(19, 3),
	(20, 1),
	(20, 3),
	(21, 5),
	(21, 9),
	(21, 5),
	(21, 9),
	(21, 5),
	(21, 9),
	(21, 5),
	(21, 9),
	(21, 5),
	(21, 9);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL DEFAULT '0',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.role: ~0 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`, `created_date`, `is_deleted`) VALUES
	(1, 'user', '0000-00-00', 0),
	(2, 'expert', '0000-00-00', 0),
	(3, 'admin', '0000-00-00', 0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.saved_post
CREATE TABLE IF NOT EXISTS `saved_post` (
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.saved_post: ~5 rows (approximately)
/*!40000 ALTER TABLE `saved_post` DISABLE KEYS */;
INSERT INTO `saved_post` (`post_id`, `user_id`) VALUES
	(17, 1),
	(14, 1),
	(21, 1),
	(8, 1);
/*!40000 ALTER TABLE `saved_post` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.server_plant
CREATE TABLE IF NOT EXISTS `server_plant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `common_name` varchar(50) NOT NULL DEFAULT '',
  `scientific_name` varchar(50) DEFAULT NULL,
  `image_url` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pet_friendly` tinyint(4) DEFAULT '0',
  `difficulty` int(11) DEFAULT '1',
  `water_level` int(11) DEFAULT '1',
  `information` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sunlight` int(11) DEFAULT NULL,
  `feed_information` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `common_issue` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `min_temperature` double(22,0) DEFAULT '1',
  `max_temperature` double(22,0) DEFAULT '1',
  `min_ph` double DEFAULT NULL,
  `max_ph` double DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `accepted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.server_plant: ~12 rows (approximately)
/*!40000 ALTER TABLE `server_plant` DISABLE KEYS */;
INSERT INTO `server_plant` (`id`, `common_name`, `scientific_name`, `image_url`, `pet_friendly`, `difficulty`, `water_level`, `information`, `sunlight`, `feed_information`, `common_issue`, `min_temperature`, `max_temperature`, `min_ph`, `max_ph`, `deleted_at`, `updated_at`, `created_at`, `accepted`) VALUES
	(44, 'cây xương rồng', 'various Cactaceae', '/storage/image_for_server_plant/1.png', 1, 2, 4, 'Họ Xương rồng (danh pháp khoa học: Cactaceae) thường là các loài cây mọng nước hai lá mầm và có hoa. Họ Cactaceae có từ 25 đến 220 chi, tùy theo nguồn (90 chi phổ biến nhất), trong đó có từ 1.500 đến 1.800 loài. Những cây xương rồng được biết đến như là có nguồn gốc từ châu Mỹ, nhất là ở những vùng sa mạc. Cũng có một số loại biểu sinh trong rừng nhiệt đới, những loại đó mọc trên những cành cây, vì ở đó mưa rơi xuống đất nhanh, cho nên ở đó thường xuyên bị khô. Cây xương rồng có gai và thân để chứa nước dự trữ.', 1, 'lil3CblFDW26pVTU7MakVddxcE2RbDWIscaBwzywvHNeTgKrv8OAn748QoDDsPE73bN1frelMtdHmOZNOZtDALnGctRlDYT7d4DN', '2yeAfelsiNe83GBOfEijj4SCBts23AaJ0c4SXBMj9a0UuflS4cWSXzWnxIPAWiJEZMQ6qqUOh4liMUN0IfDeqBVxp4NwyhDdjzCX', 22, 31, 5.3, 6.5, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28', 1),
	(45, 'cây nha đam', 'aloe barbadensis miller', '/storage/image_for_server_plant/2.png', 0, 1, 1, 'Có nguồn gốc từ Bắc Phi. Theo truyền thuyết Ai Cập thì nữ hoàng Cléopâtre đã sử dụng nha đam để tạo ra một làn da mịn màng, tươi tắn. Còn đại đế Hy Lạp Alexandros đã dùng nha đam để chữa vết thương cho binh lính của mình trong những cuộc viễn chinh. Những dòng chữ tượng hình và những hình vẽ còn lưu lại trên những bức tường ở những đền đài Ai Cập cho thấy cây nha đam đã được biết đến và sử dụng cách đây hơn 3000 năm. Cho đến tận ngày hôm nay con người đã chứng minh và khẳng định được vai trò của cây nha đam trong cuộc sống con người. Cụ thể hơn là trong lĩnh vực dược phẩm, thực phẩm và mỹ phẩm.', 2, 'rP1GoMmPBLSzj0d32YUFqXKFhnE8WT6U6e5VJnXu8ijBAJMpVo7uyH1ok5EzKyMZRQg5jSWOfg67CRMnQQ1n7iGj2TLPIlFn6OrU', 'RbrAR7hboe5iFpFgXrT8outmUxE39nEYc6CS3TAytsJNPtwxclUQaOw4LuAQ5HtJyl8P5nGEOo9HxRbGdEVH9RJ2t99AnaLcHMyG', 21, 33, 5.1, 6.8, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28', 1),
	(46, 'HupVYkPcSc', 'ybSdXlYr3b', '/storage/image_for_server_plant/3.png', 1, 2, 4, '2Osd3mSN8Tbvz1dAasCDEAQCvOkNiFwNkRnsmDITKOcCfcuhbHI8DrD4vtVba9E9geqdkEaGtLnHrssGbqvp1vtBqqftzLQkrCoy', 2, 'OMJXT50HMTbxuiBweYeXAJUpnykDD6aWPvdI499vstA5VjqvpE0p3TQm60DTUtUIqJkVVUQ3nQhYOHsHoeVhAQFRU5ACiKxTri0Q', 'NSzCJ7y9hnsSg7mWTSvtPyxpzIJ2BLipntCcI4HwLXiXBpZTTihEYVLLInQAIzYAbQnRuMbMOVsl4f4ZO4i8OYhR2i0RWi2O4bRq', 20, 33, 5.7, 6.3, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28', 1),
	(47, 'MYl9m44ciP', '6sLy2fKidM', '/storage/image_for_server_plant/4.png', 0, 2, 3, 'STuAiZxJ4KUVNhqJVBAU9s1q6PlfuPUYCCH1oaM1NQeE8zPHa9d0TBjjX9cOLqGO20KnSzYlJsFpRIgVlIcjIYjOtzhoO21Ejyid', 3, 'AWEOOmox9ISb3dzgMo7L1Xd2RyiqnmtGh2DIwe8wlmEoqPOq01t4rxZzHSCHXulwLxrY2lqCEMPz8QvkB9vUbPbRbzdi1qI4vsXN', 'KNeGNmKvVWX6VdIz4MRGJyI7ThZfhcxB90KQE2Op9k2xb9OPFaOlA1CLM06oZo5l9yGS8AesjLdL0jOnQHgQXZ8bJf9Rv3ffdeQt', 21, 30, 5.2, 6.1, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28', 1),
	(48, 'cây đa búp đỏ', 'ficus elastica', '/storage/image_for_server_plant/5.png', 1, 5, 3, 'Đa búp đỏ hay còn gọi là đa cao su, đa dai (danh pháp hai phần: Ficus elastica) là một loài thực vật có hoa trong chi Đa đề (Ficus), có nguồn gốc ở vùng đông bắc Ấn Độ (Assam), kéo dài về phía nam tới Indonesia (Sumatra và Java).\r\n\r\nNó là loài cây thân gỗ lớn trong nhóm đa đề, có thể cao tới 30–40 m (ít khi thấy cao tới 60 m), với đường kính thân cây tới 2 m, với thân cây phát triển ra từ các rễ khí và rễ trụ để giữ chặt nó vào trong đất và giữ các cành to và nặng. Các lá của nó hình ôvan, bóng mặt, dài khoảng 10–35 cm và rộng 5–15 cm; kích thước lá lớn nhất có ở các cây non (đôi khi dài tới 45 cm), nhưng nhỏ hơn nhiều ở các cây già (thông thường khoảng 10 cm dài). Các lá phát triển ở bên trong một vỏ bọc tại mô phân sinh ở ngọn, gọi là búp đa, và nó sẽ phát triển lớn hơn khi lá mới được phát triển. Khi lá phát triển, nó mở ra và vỏ bọc rụng xuống. Bên trong của lá mới thì một lá non khác đang chờ để được phát triển.\r\n\r\nGiống như các thành viên khác của chi Ficus, hoa của đa búp đỏ cần phải có các loài ong đa đề (họ Agaonidae) chuyên biệt để thụ phấn trong quan hệ đồng tiến hóa. Do mối quan hệ này, đa búp đỏ không sản sinh ra các hoa nhiều màu sắc hay có hương thơm để dẫn dụ các loài côn trùng thụ phấn cho nó. Quả hình ôvan, nhỏ, màu lục-vàng, dài khoảng 1 cm, ăn được nhưng ít khi ăn; nó chứa các hạt và trong đó thì các ấu trùng của loài ong bắp cày thụ phấn cho đa đề có mặt.', 4, 'NratyOGBBIIykYHubvtwdE0WAGHRewy19IWfZZcW7SQMH6dvI85eVCEgRqAnRfNHKxQ61q3HRleM4A0Uemo3giboSei1CPPSQUqk', 'S77pQj40nioDt0Hl1425zCmZJNOk4IPwxBjRW2NUrZcDfuYLtuOVSSWUScrpMHmnAPEzPdHsgVRfC1mNSxO4dc8yUKvLFEAUtRrJ', 22, 30, 5.5, 6.9, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28', 1),
	(49, 'CGoV382UK3', 'VILSriNCnN', '/storage/image_for_server_plant/6.png', 1, 3, 4, 'R2DkXxzs32tPYuFIrrVmsYPStrM7xxyhzJ1OgpqD0EAq3dR9tfC50xWwNFpmmjMiSMzy0LZSvT5goWiBZdiIVkMWO1WX7QKq0ET0', 5, 'wVALETb1W7Ry6ahZnatYY0UXlOfyBNM64CdaF9XaJw8zxlb2fpZJSLcYF8Mp1k3juycAFgxZga2onY1PyTFG30EpbqIhOT53AJ2K', 'cU4psIRoBCvWXxC15zdDpRBYq5r1MuwZVTDIN1m5TLT8RXQ1d0XQ16nvH14v1UMzanIJPin2OJG9OW6OG86gWX8mpVDNvHPWNwyn', 21, 32, 5.5, 7, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28', 1),
	(50, 'pJYeiOeEaW', 'Dsj7JF8HEp', '/storage/image_for_server_plant/7.png', 1, 1, 1, 'JCCIO71TtvYW1reOylWEKcHhwh5I1EUBVjGRP23Rw4n2Iu5uymbKlF7I8YbGOHqSCkBejI0wAiqVFIlGbJnR28R21130KwR55dI2', 3, 'grfgRmzNAoCoJVw11iNAWgL0J50h2PDG4odm5Npm6xFJOZN7tkugDicXe7Is2U9RbeQ82v8kIMk7S2i1vhKUBFvBJxlkr4bLAL1V', 'JPJyzIjoTZJ5SeC1bHHtyq29gbBVJpuAfEnHpOJFa7wsyqsEBkqTfGpx0dbpI9OZoCBz04TJkdeL5iJm4NKRwhuR0EQ5RnhtdKwa', 21, 30, 5.4, 6.1, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28', 1),
	(51, 'cây chuỗi ngọc trai', 'curio rowleyanus', '/storage/image_for_server_plant/8.png', 0, 0, 2, 'Chuỗi ngọc hay được biết đến là cây thanh quan, cây rìa xanh, cây chuỗi vàng, có tên khoa học là Duranta repens thuộc họ cỏ roi ngựa (Verbenaceae). Chuỗi ngọc là cây có khả năng sinh trưởng và phát triển nhanh (có thể cao từ 0.2 – 3m) thường được sử dụng trồng làm cây công trình như: ở công viên, vỉa hè, khu đô thị,…\r\nChuỗi ngọc là loài cây cảnh thường sống theo bụi, có nguồn gốc từ Tây Ấn và Nam Mỹ. Cây có kích thước nhỏ, lá hình bầu dục dài từ 2 – 5cm, lá mọc đối xứng nhau hoặc vòng 3 lá, lá cây thường có màu vàng óng khi non và xanh nhẵn khi về già. Vì là cây phát triển nhanh nên để kìm hãm cây mọc thì người ta có thể cắt tỉa bớt cành lá của cây hoặc tạo hòn non bộ với dáng khác nhau.', 4, '5zk5zHIyorOlbZv8lZyL1ZagBZblbt3EwbifJdD2Qxe2kqyPLQeLrD3tsXEyNNS3R6gf5wyejZcPiA2NAkDbRMLxPYN5fESaMBg8', 'DJFHQw8xQT46HYKj99LiWAwVpmAPH6JadCEo1JeNCv1WJujyDAMgSYKi8gnuRCaRarG9QhMPjLpI8CilPTjrgFvqsLeScsGQruah', 21, 31, 5.1, 6.9, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28', 1),
	(52, 'QAKGDuMN7y', 'HXH8H5zU6S', '/storage/image_for_server_plant/9.png', 0, 5, 2, 'R9iykHyS5H52fmPD7hlofPxYHJr2BiWd52uu2i14K4UYJD8jRwnFvDqdDf8pPGHXJ23h6LaMslf1eQbxejeixtFWk5efv3M8MTwK', 1, 'g8yOPYGZ0bfu7RK07wOhCjueHLHlFIMgz0ceIHDVQR6MxKfGSNWJQUFOVECIytC4IECZC7Uhx9PQVXVH23x8uXJFjJWahFgN31NB', 'Vu0lO6Th3UQiJGaYYLWzzpTmC2tjTyvKd20k0Ufh5Z5ZIFdKJDCwEoQiypERCOOmSrjgPldkYd3E1O7xIlOIR5v39Nubv4y7n5Rg', 20, 33, 5.4, 6, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28', 1),
	(53, 'trầu bà Nam Mỹ', 'monstera', '/storage/image_for_server_plant/10.png', 0, 5, 2, 'TtTMuwwCzLeW34GDjmCGnwfONAUAsI3vhas52vREJ2KJZJpF5juLh1a9hlxW6F8mD1MlDQUuoZ7fMQOk8eUywnOgagPcR8tcnwed', 4, 'gVpzTAf4XNMJE3HUuQ2R3NmUfuJ07PiLWd49xBnBEkpUOR4Y9LrENm5M1RY84Hfrir6BSijgjvGsQtNZEUMGfBJs0uPCjCcPdeiM', '9Qzvb7kbN3n0nW5uYiJN6jS8UvNRGRwEARghCwoC5fEUcxET7hJVYLV9H7LFfgmYoXuN90Zngr0FxTQWfChiGzhlnK9kG9rqs1Fw', 20, 32, 5.5, 6.5, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28', 1),
	(54, 'MfER8R350F', 'IVGjM98dOh', '/storage/image_for_server_plant/11.png', 0, 5, 1, 'my3Tc28Ckk6xgBcQeJVDDCFhFq4xbXcTXLkbBHomqoiqmHaSTBqRpSrxLNtvd6289VWreWuVirIdt7EzJfaBrNLKaxVH6Lyk3tcR', 3, 'wc4aqlUxjo2FXJOeVZmNQZpw7y3VlMT8NE5w6C03L5haokoc95RF57DGXeYstF8KGdCDYMcPNfBrJyhQICwzAty0HYlIkJ7cB8if', '0LcSBltfhq3OGHm0Zgerfk4gJuH7GzxYf8W3tOroTnvABRBQVQrosN9xCJDJMvvqpuNuPPlDrGfpiiA1omBYuUNB1NS4anRPjBo5', 22, 32, 5.4, 6.3, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28', 1),
	(55, 'y1y2IQqeBy', 'zWRkMDW6nh', '/storage/image_for_server_plant/12.png', 0, 5, 5, 'j5AV01Ag3EClKy0pTwFmhlHzYhe5YI8IlCM3d9MGXSNO3SROKmxNujbYWJTWzTD5B4DtsvDa3sNVJM5WNsQ8NJQrib0z8Gpdubl6', 2, 'LoUBQcGIAzfruZ1kXcXuGK2bLhFXoLNCt0da3GDtBROA29RGllmBugNISHHkQqWNhGSPBRnNyZJUNN4GRkNo6cW1JgNx8xSHmm6s', 'gOqMPmAPepyze00Zse0fxJvOoi9UCpQ12cm8MWUgjVYy2xNJJ1YSyV3MTYPFNI2yckt8ySjlGEVJfkVGpRjJDsu3XGreFkGYSd5G', 21, 29, 5.2, 7, NULL, '2021-04-27 09:55:28', '2021-04-27 09:55:28', 0);
/*!40000 ALTER TABLE `server_plant` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.server_plant_user_edit
CREATE TABLE IF NOT EXISTS `server_plant_user_edit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_plant_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `common_name` varchar(50) NOT NULL DEFAULT '',
  `scientific_name` varchar(50) DEFAULT NULL,
  `pet_friendly` tinyint(4) DEFAULT '0',
  `difficulty` int(11) DEFAULT '1',
  `water_level` int(11) DEFAULT '1',
  `information` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sunlight` int(11) DEFAULT NULL,
  `feed_information` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `common_issue` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `min_temperature` double(22,0) DEFAULT '1',
  `max_temperature` double(22,0) DEFAULT '1',
  `min_ph` double DEFAULT NULL,
  `max_ph` double DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `accepted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.server_plant_user_edit: ~0 rows (approximately)
/*!40000 ALTER TABLE `server_plant_user_edit` DISABLE KEYS */;
INSERT INTO `server_plant_user_edit` (`id`, `server_plant_id`, `user_id`, `common_name`, `scientific_name`, `pet_friendly`, `difficulty`, `water_level`, `information`, `sunlight`, `feed_information`, `common_issue`, `min_temperature`, `max_temperature`, `min_ph`, `max_ph`, `deleted_at`, `updated_at`, `created_at`, `accepted`) VALUES
	(66, 44, 1, 'cây xương rồng', 'various Cactaceae', 1, 1, 4, 'Họ Xương rồng (danh pháp khoa học: Cactaceae) thường là các loài cây mọng nước hai lá mầm và có hoa. Họ Cactaceae có từ 25 đến 220 chi, tùy theo nguồn (90 chi phổ biến nhất), trong đó có từ 1.500 đến 1.800 loài. Những cây xương rồng được biết đến như là có nguồn gốc từ châu Mỹ, nhất là ở những vùng sa mạc. Cũng có một số loại biểu sinh trong rừng nhiệt đới, những loại đó mọc trên những cành cây, vì ở đó mưa rơi xuống đất nhanh, cho nên ở đó thường xuyên bị khô. Cây xương rồng có gai và thân để chứa nước dự trữ.', 1, 'lil3CblFDW26pVTU7MakVddxcE2RbDWIscaBwzywvHNeTgKrv8OAn748QoDDsPE73bN1frelMtdHmOZNOZtDALnGctRlDYT7d4DN', '2yeAfelsiNe83GBOfEijj4SCBts23AaJ0c4SXBMj9a0UuflS4cWSXzWnxIPAWiJEZMQ6qqUOh4liMUN0IfDeqBVxp4NwyhDdjzCX', 31, 22, NULL, NULL, NULL, '2021-04-30 15:26:33', '2021-04-30 15:26:33', 0);
/*!40000 ALTER TABLE `server_plant_user_edit` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.tag
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_type_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(225) NOT NULL DEFAULT '0',
  `created_date` date NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.tag: ~11 rows (approximately)
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`id`, `tag_type_id`, `name`, `created_date`, `deleted_at`) VALUES
	(1, 1, 'cây Lan', '2021-03-26', NULL),
	(2, 1, 'cây văn phòng', '2021-03-26', NULL),
	(3, 1, 'trầu bà', '2021-03-26', NULL),
	(4, 1, 'xương rồng', '2021-03-26', NULL),
	(5, 1, 'sen đá', '2021-03-26', NULL),
	(6, 1, 'dây leo', '2021-03-26', NULL),
	(7, 2, 'mẹo vặt', '2021-03-26', NULL),
	(8, 2, 'tâm sự', '2021-03-26', NULL),
	(9, 2, 'nâng cao', '2021-03-26', NULL),
	(10, 2, 'kiến thức', '2021-03-26', NULL),
	(11, 2, 'cơ bản', '2021-03-26', NULL);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.tag_type
CREATE TABLE IF NOT EXISTS `tag_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL DEFAULT '0',
  `created_date` date NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.tag_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `tag_type` DISABLE KEYS */;
INSERT INTO `tag_type` (`id`, `name`, `created_date`, `is_deleted`) VALUES
	(1, 'Loại Cây', '2021-03-26', 0),
	(2, 'Nội dung', '2021-03-26', 0);
/*!40000 ALTER TABLE `tag_type` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.task
CREATE TABLE IF NOT EXISTS `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plant_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `description` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `from_date` date NOT NULL DEFAULT '0000-00-00',
  `to_date` date NOT NULL DEFAULT '0000-00-00',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.task: ~0 rows (approximately)
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `email` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `bio` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `role_id` int(11) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) DEFAULT '0',
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_ai_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.user: ~5 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `bio`, `role_id`, `is_deleted`, `name`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'chronicle11109', 'chronicle1951@gmail.com', '$2y$10$hbysJrQYpZhOTzNT6JffcuAoyZDnzz2NdnDpYvwq7AePlY8U.BtCu', 'Welcome to my feed, where people come for enjoyment.', 2, 0, 'Mai Đăng Khoa', NULL, NULL, '2021-03-31 14:55:40', '2021-04-17 15:50:23', NULL),
	(4, 'lampart', 'dangkhoa.lampart@gmail.com', '$2y$10$1vyNg.NWLf0AP3S8LtcyVOZ8eDs3MCiKHUUjY4G/ww0e2RvQHdqEK', 'I am a rare species, not a stereotype.', 1, 0, 'Nguyễn Văn A', NULL, NULL, '2021-04-08 08:28:07', '2021-04-08 08:28:07', NULL),
	(5, 'z', 'dangkhoa@gmail.com', '$2y$10$1vyNg.NWLf0AP3S8LtcyVOZ8eDs3MCiKHUUjY4G/ww0e2RvQHdqEK', ' I’m not ashamed to be me. What’s wrong with being amazingly unique?', 1, 0, 'Mai Đăng Khoa', NULL, NULL, '2021-04-11 16:46:45', '2021-04-11 16:46:46', NULL),
	(6, 'plantcare', 'plantcare@gmail.com', '$2y$10$1vyNg.NWLf0AP3S8LtcyVOZ8eDs3MCiKHUUjY4G/ww0e2RvQHdqEK', 'I’m writing my autobiography on my Facebook account.', 1, 0, 'Plant Care', NULL, NULL, '2021-04-11 16:47:30', '2021-04-11 16:47:31', NULL),
	(7, 'chronicle1111', 'khoa@gmail.com', '$2y$10$apLDytxUt8rOU/jxWRsSHOBm.f2EyQ5KKOUETXD6Rd6tYGUkKS9dC', '', 1, 0, 'khoa', NULL, NULL, '2021-04-12 17:03:22', '2021-04-12 17:03:22', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.user_follow_user
CREATE TABLE IF NOT EXISTS `user_follow_user` (
  `user_id` int(11) DEFAULT NULL,
  `follower_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.user_follow_user: ~5 rows (approximately)
/*!40000 ALTER TABLE `user_follow_user` DISABLE KEYS */;
INSERT INTO `user_follow_user` (`user_id`, `follower_user_id`) VALUES
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(7, 1);
/*!40000 ALTER TABLE `user_follow_user` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.user_plant
CREATE TABLE IF NOT EXISTS `user_plant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.user_plant: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_plant` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_plant` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
