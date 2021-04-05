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
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.comment: ~0 rows (approximately)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.commented_post
CREATE TABLE IF NOT EXISTS `commented_post` (
  `post_id` int(4) DEFAULT NULL,
  `user_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.commented_post: ~0 rows (approximately)
/*!40000 ALTER TABLE `commented_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `commented_post` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.email_activate
CREATE TABLE IF NOT EXISTS `email_activate` (
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `password` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_ai_ci DEFAULT NULL,
  `activation_token` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.email_activate: ~1 rows (approximately)
/*!40000 ALTER TABLE `email_activate` DISABLE KEYS */;
INSERT INTO `email_activate` (`email`, `username`, `password`, `name`, `activation_token`) VALUES
	('cnviety2@gmail.com', 'asd', '$2y$10$xl1PPBFtHupqhSHsD5n2z.3fC8yYO7ObSMbloMDJtknsa/tmugWkC', 'dfft', 9343),
	('a@gmail.com', 'a', '$2y$10$sZWgUJP9N/nZ18w2tMl08uvDDTv1IikWb2rig8Qml8VsXDpXmF90K', 'a', 1944);
/*!40000 ALTER TABLE `email_activate` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.image_for_post: ~10 rows (approximately)
/*!40000 ALTER TABLE `image_for_post` DISABLE KEYS */;
INSERT INTO `image_for_post` (`id`, `post_id`, `url`, `created_date`, `is_deleted`) VALUES
	(1, 8, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/0312f5a7-e31b-4781-aeda-3b9fd3f5a6b3168142341_215567647002351_7577830590182473974_n.jpg', '0000-00-00', 0),
	(2, 9, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/36103b22-c226-4977-b087-291a197d8004pjaeaec2ppq61.jpg', '0000-00-00', 0),
	(3, 10, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/eafed741-bf43-4807-891a-5d7a8f8b83f2pjaeaec2ppq61.jpg', '0000-00-00', 0),
	(4, 11, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/4df234d1-856b-481a-8a48-6936486ee825pjaeaec2ppq61.jpg', '0000-00-00', 0),
	(5, 12, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/6971b5b1-173d-4a65-a355-9be9b245b6ddpjaeaec2ppq61.jpg', '0000-00-00', 0),
	(6, 12, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/b7dc976a-96bc-4189-955d-c15c1cc569de166589791_318810386284838_1732472508849436995_n.jpg', '0000-00-00', 0),
	(7, 13, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/d48d349c-e180-4b68-8d4d-96d2126dde58pjaeaec2ppq61.jpg', '0000-00-00', 0),
	(8, 13, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/3089b586-0584-4c37-9c4c-af71d473a505166589791_318810386284838_1732472508849436995_n.jpg', '0000-00-00', 0),
	(9, 14, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/28e76b51-3341-4250-bbea-961f4a46d6depjaeaec2ppq61.jpg', '0000-00-00', 0),
	(10, 14, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/00395803-dbf2-4cc4-9e63-14e7b295d0b2166589791_318810386284838_1732472508849436995_n.jpg', '0000-00-00', 0),
	(11, 15, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/7368d8b3-8334-4bc7-8e31-9ff0c889b843pjaeaec2ppq61.jpg', '0000-00-00', 0),
	(12, 15, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/182626d1-0b55-4c36-9e3e-8212409c7213166589791_318810386284838_1732472508849436995_n.jpg', '0000-00-00', 0),
	(13, 18, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/a12abf7d-7557-474d-95df-1e1633000357pjaeaec2ppq61.jpg', '0000-00-00', 0),
	(14, 18, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/399f64fb-e94a-4c35-9600-512a0b0c691c166589791_318810386284838_1732472508849436995_n.jpg', '0000-00-00', 0),
	(15, 25, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/33e9562c-adc8-4e31-ac51-36d6cff4592freceived_2781347248859301.jpeg', '0000-00-00', 0),
	(16, 25, 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/d7c7faf5-8ebd-4d7a-a2b5-42bd9884698breceived_224003679183926.jpeg', '0000-00-00', 0);
/*!40000 ALTER TABLE `image_for_post` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.image_for_user
CREATE TABLE IF NOT EXISTS `image_for_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.image_for_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `image_for_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_for_user` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.liked_post
CREATE TABLE IF NOT EXISTS `liked_post` (
  `post_id` int(4) DEFAULT NULL,
  `user_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.liked_post: ~0 rows (approximately)
/*!40000 ALTER TABLE `liked_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `liked_post` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.oauth_access_tokens: ~83 rows (approximately)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('049a47374c0932f062c0bade0047569758d1cf51ce0ebb3f388fcf5a55a5126bc3f3cd4ece99f420', NULL, 1, 'appToken', '[]', 0, '2021-04-03 12:34:11', '2021-04-03 12:34:11', '2022-04-03 12:34:11'),
	('0502a5e2410625f0bd53ca32d197a2bbc3d59579f6779515fe00100d67f2a9ba9b9124497201c982', 3, 3, 'appToken', '[]', 0, '2021-04-03 13:59:14', '2021-04-03 13:59:14', '2022-04-03 13:59:14'),
	('051684a08b4297743da5a9551a96d044bbe5d28338bae5d41c2a25efe626ce7c56abb15863405d74', 4, 1, 'appToken', '[]', 1, '2021-03-27 11:24:24', '2021-03-27 11:24:24', '2022-03-27 11:24:24'),
	('06d3d03741c278a22412ed7efa11b0af0da119f11e1afd435245907776cabbcdd030f2cd6e8a205c', 1, 3, 'appToken', '[]', 0, '2021-04-05 12:50:36', '2021-04-05 12:50:36', '2022-04-05 12:50:36'),
	('0741f653eccb12cbfed7cfb72950d5fe73d95477fdd66ba42c8fc968dd692f10d0805bc2dda85c7e', 1, 1, 'appToken', '[]', 1, '2021-03-22 13:49:20', '2021-03-22 13:49:20', '2022-03-22 13:49:20'),
	('09a1486205ba01630639ea353f8e2fb07f1750eb5094dc1aa18fcf2e6bae52f22aaeeed2c4c454ef', 4, 1, 'appToken', '[]', 0, '2021-03-23 12:18:51', '2021-03-23 12:18:51', '2022-03-23 12:18:51'),
	('0c8d083a50d5e6c53dff5cc44e2f98533beb5c45bacac1dfc4740f7827e12ec0447d057f8ee0abf9', 4, 1, 'appToken', '[]', 0, '2021-03-22 12:41:32', '2021-03-22 12:41:32', '2022-03-22 12:41:32'),
	('0cc7b42e551f884660b5cb7d1b9a883b25e23bcc273ba942c4ed32c12fe4b71a938dba87a24a43a4', 4, 1, 'appToken', '[]', 0, '2021-03-27 10:18:22', '2021-03-27 10:18:22', '2022-03-27 10:18:22'),
	('107b92f4c9e7758f8faa285b42c30b85676afbbc55d2ea77b77de14d3157805702bb8dfc178a4b81', 3, 3, 'appToken', '[]', 0, '2021-04-03 13:49:49', '2021-04-03 13:49:49', '2022-04-03 13:49:49'),
	('151fac03c4d4a7fbd5af72f2b75ba685589c2572b7e1f2b86aaad2bffb120f7221a712900b955850', 4, 1, 'appToken', '[]', 0, '2021-03-28 04:47:52', '2021-03-28 04:47:52', '2022-03-28 04:47:52'),
	('16f9052a69f14e610ed2f4507904ed4015a0856b800ca46f8b68feaf7ca79e4a8f96bd8d3df0f0b3', 4, 1, 'appToken', '[]', 0, '2021-03-27 11:35:55', '2021-03-27 11:35:55', '2022-03-27 11:35:55'),
	('19ce185f6f1ce518a5c7246a6177a6d8cae6fe5983383301c4be15901e2c5581966a016d1d7cd372', 3, 3, 'appToken', '[]', 1, '2021-04-03 13:46:07', '2021-04-03 13:46:07', '2022-04-03 13:46:07'),
	('1a40d3996fe8a7a0650f31feb13192f912dec04a88a00664a6ba60ab92d53d32db03a654dbba6795', 4, 1, NULL, '[]', 0, '2021-03-22 12:35:29', '2021-03-22 12:35:29', '2022-03-22 12:35:29'),
	('1b34e0053f2de48c160cb53259be20bec98401576283a676dde2a2d47dcc9b4ddf0b55e646ccc41a', 1, 1, 'appToken', '[]', 0, '2021-03-28 13:51:36', '2021-03-28 13:51:36', '2022-03-28 13:51:36'),
	('1cc8bf47fba02c0bb21bf490ccf8c334fee7cb6ef6b07acc7d66bd2e0e732cc7a7b4309779142fbe', NULL, 1, 'appToken', '[]', 0, '2021-03-29 13:27:24', '2021-03-29 13:27:24', '2022-03-29 13:27:24'),
	('242569108fd074469b22e200cd5a4ef1cbdae581b636e83da9a04243259d6cbaf04ec6f69f4e7ee5', 3, 1, 'appToken', '[]', 0, '2021-04-03 13:23:22', '2021-04-03 13:23:22', '2022-04-03 13:23:22'),
	('2442d5aeb3fb46320483ed4e09cfe1b56e524acabee199574a80cc3423e064605cf82cb7181962be', 3, 3, 'appToken', '[]', 1, '2021-04-03 13:45:26', '2021-04-03 13:45:26', '2022-04-03 13:45:26'),
	('2893f5b934e20eaea8561c6af3a6cf146c9329e05aaf6b3fb62219af47d594e4ffa59a779eb4c600', 3, 1, 'appToken', '[]', 0, '2021-04-03 03:04:03', '2021-04-03 03:04:03', '2022-04-03 03:04:03'),
	('28a2b74855fab6d56c4c76a9639a3830e6ee499a212cbd219d9f94e2a292e1760dd4b760d62405d6', 4, 1, 'appToken', '[]', 1, '2021-03-27 11:27:17', '2021-03-27 11:27:17', '2022-03-27 11:27:17'),
	('2b76d897cf6352e9664d6c13a2a9468df9bd0417bab9e45d2c21afc8b4b3c57e177e8fdcd2005c57', NULL, 1, 'appToken', '[]', 0, '2021-04-03 12:29:31', '2021-04-03 12:29:31', '2022-04-03 12:29:31'),
	('31a043a826c8036e1f5c2c29f994549fba9ec6c331c88d3c67dff94bea64c117589666b248ddea19', 3, 3, 'appToken', '[]', 0, '2021-04-04 00:40:52', '2021-04-04 00:40:52', '2022-04-04 00:40:52'),
	('37810ff23314c5527568ada0fba898348e1be4bdd866635be1527cc97d3ea7951fd7db74e5262ca5', 4, 1, 'appToken', '[]', 0, '2021-03-27 13:41:28', '2021-03-27 13:41:28', '2022-03-27 13:41:28'),
	('379b7f58a80c6985acc03d6291b1fe7bb78982e158ebd080c06bc03ae85f1cbefcb201447ed0d326', NULL, 1, 'appToken', '[]', 0, '2021-03-31 14:18:41', '2021-03-31 14:18:41', '2022-03-31 14:18:41'),
	('3ff95e5bcf6f3d77f30507c3f52121d9063c968269798a45dc86bf6d12f1b70914204c496f891f04', NULL, 1, 'appToken', '[]', 0, '2021-03-31 14:37:34', '2021-03-31 14:37:34', '2022-03-31 14:37:34'),
	('40b67a7712485a895fe742682ccf8ac976aacac1f8f1b60f1e678c5be0b7c46056996a7dcc6fca98', 4, 1, 'appToken', '[]', 0, '2021-03-28 09:44:13', '2021-03-28 09:44:13', '2022-03-28 09:44:13'),
	('41986a27226faf2fcd584f4cb568c7223347f133c1171a1b9199d4107f8888add7f3086dce8f51da', NULL, 1, 'appToken', '[]', 0, '2021-04-03 03:40:14', '2021-04-03 03:40:14', '2022-04-03 03:40:14'),
	('43316bb12bc378c2d9fc89c534adb28871eb6c7b9cf1424a5e1ed79c055ae5d5fe6ac803d4bf001f', 3, 3, 'appToken', '[]', 0, '2021-04-04 12:11:48', '2021-04-04 12:11:48', '2022-04-04 12:11:48'),
	('461df318ef0d7702c39a2180977994a5b58d2a9ce64d0958bcba9c16d47b4e945d8a53151e54424f', 3, 1, 'appToken', '[]', 0, '2021-04-02 03:17:03', '2021-04-02 03:17:03', '2022-04-02 03:17:03'),
	('4a238f04afee51ffce4388dc2f4ff080198a332dfe617c161b293e8b3fa7bcdc6264b41f0b314282', 4, 1, 'appToken', '[]', 1, '2021-03-27 11:20:20', '2021-03-27 11:20:20', '2022-03-27 11:20:20'),
	('4aec712cd8fbfcdd6977a18b670df43a26ab60939447cb115626cba12b642a94c6b61effbefdad2a', 4, 1, 'appToken', '[]', 1, '2021-03-23 12:46:06', '2021-03-23 12:46:06', '2022-03-23 12:46:06'),
	('503d5e20b728e13a600b4f484b283a6ca22a8d21f10ef17b453fc0a04a3ca6805600ae3ab0fc57cb', 3, 1, NULL, '[]', 0, '2021-03-22 12:35:02', '2021-03-22 12:35:02', '2022-03-22 12:35:02'),
	('513fb62c2db68b8f15902602f6e9daa2277a1a656b308a6d741d806470ce05440438485fb8db5f02', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:11:32', '2021-03-27 12:11:32', '2022-03-27 12:11:32'),
	('51a991322aa1443352c7239a357bdc524d3de076c5e48d2c73544e8774144839871c62a58c782466', 3, 1, 'appToken', '[]', 0, '2021-04-03 13:19:03', '2021-04-03 13:19:03', '2022-04-03 13:19:03'),
	('51f2a127557bc55e79c0fce107e82ff7060c9da5e0f32625e9a19f534d90503845ef70e13c58c730', 1, 3, 'appToken', '[]', 1, '2021-04-05 12:50:06', '2021-04-05 12:50:06', '2022-04-05 12:50:06'),
	('577a6ebfedd4234205dad3722fac6dee0ccf0136f2ea5d1c5ac70988edb906d1f8fce8be8f357d99', 5, 1, 'appToken', '[]', 0, '2021-03-22 12:37:55', '2021-03-22 12:37:55', '2022-03-22 12:37:55'),
	('5a7efd3801bb46f96ada41e1d60385735ffbf0967a803cb701094a6ef328151e2c36f4d23a58ad2f', 3, 1, 'appToken', '[]', 1, '2021-04-02 03:11:34', '2021-04-02 03:11:34', '2022-04-02 03:11:34'),
	('5d451451b10958e6ba336b8d93634bd93f08cb58703ec02198d501f713fda49d773d62d3207283bd', 4, 1, 'appToken', '[]', 1, '2021-03-27 11:06:32', '2021-03-27 11:06:32', '2022-03-27 11:06:32'),
	('5d998019174f64393bede990c8167cf81032c291c30ba694350b3dcb38cecc4a41160393266b9f81', NULL, 1, 'appToken', '[]', 0, '2021-04-03 13:00:28', '2021-04-03 13:00:28', '2022-04-03 13:00:28'),
	('5f2e32cb4d5a136775e7f6dc4a30794d9bb29c255803ae92aa120fbfaf6ea1124ea32e528d12d578', 3, 3, 'appToken', '[]', 1, '2021-04-03 13:56:58', '2021-04-03 13:56:58', '2022-04-03 13:56:58'),
	('5f83cddd3d06669a496ce7da3c33d48bbdfddddd6a284eb2f57569c28fce7791a8eb2fd95222b0bd', 3, 1, 'appToken', '[]', 0, '2021-04-01 03:14:27', '2021-04-01 03:14:27', '2022-04-01 03:14:27'),
	('5fd02e74639ba9d17e06494002d8320ef8dec91649a90f6dc8a5cf62f09d6b6b14b56c96fe299ed2', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:29:40', '2021-03-27 12:29:40', '2022-03-27 12:29:40'),
	('61b34f02bb6880bdf03e56da316dc8a94cae0271215d813f48c175849852e1413f8adcf26afc5413', NULL, 1, 'appToken', '[]', 0, '2021-03-31 14:55:39', '2021-03-31 14:55:39', '2022-03-31 14:55:39'),
	('627b687165de3484ea2dcb86b44cf486181d8c4543cd2ed3254b63a09e59c42865419bb48192ed6e', 4, 1, 'appToken', '[]', 1, '2021-03-23 12:48:21', '2021-03-23 12:48:21', '2022-03-23 12:48:21'),
	('63ed0bc101a252a0f9773c7b6678e3114f358615dcb4fa44dad74f360cacf4eab44a105ea7928819', 4, 1, 'appToken', '[]', 0, '2021-03-27 12:38:52', '2021-03-27 12:38:52', '2022-03-27 12:38:52'),
	('695323aacb78d6a448b8ac8ba2a1fb66f3e6aa204227f479288aa989c170fbba616e946720ba1f99', NULL, 1, 'appToken', '[]', 0, '2021-03-29 13:21:57', '2021-03-29 13:21:57', '2022-03-29 13:21:57'),
	('6c64b78889227d927bfd258e7d694e9df0f9f77d5ffa07ea56938c42e95a174185e8e562405ad852', NULL, 1, 'appToken', '[]', 0, '2021-04-03 12:23:22', '2021-04-03 12:23:22', '2022-04-03 12:23:22'),
	('703fbf1fc4e2014e0a16c57deab2b7e739ce0c90bfa8f30f090bc2d881f5a11a2d966a99715a36c1', 4, 1, 'appToken', '[]', 0, '2021-03-27 15:23:46', '2021-03-27 15:23:46', '2022-03-27 15:23:46'),
	('710c66447ced57a233414dd1932bea2eefe6d9a788bcfef90ce20759e8cda7792860e009b8b51eaa', 1, 3, 'appToken', '[]', 1, '2021-04-05 11:05:03', '2021-04-05 11:05:03', '2022-04-05 11:05:03'),
	('72ce827284f23e90c74b9965cb31380d819efad64d371ec5a4ff2729e515b2658702452ae4527e61', NULL, 1, 'appToken', '[]', 0, '2021-04-03 12:54:06', '2021-04-03 12:54:06', '2022-04-03 12:54:06'),
	('7684552c0f567e6c29beb0a7f3c33a82c9385c009a34a2c109725742082e05963b90c1065eb75716', 4, 1, 'appToken', '[]', 1, '2021-03-27 11:20:51', '2021-03-27 11:20:51', '2022-03-27 11:20:51'),
	('76fdcb01a9b4ab75af938b8f459a9dea63f6d4baa7b2071effbc8d74ff6f19b0f5b9d4308aa5d1bc', 4, 1, 'appToken', '[]', 1, '2021-03-28 09:39:51', '2021-03-28 09:39:51', '2022-03-28 09:39:51'),
	('7a7e32f5872b21972d52be2b9e7b2a2af48666aa61e8f9aa554518ad8ff63ab4a533316c3c801f9f', NULL, 1, 'appToken', '[]', 0, '2021-04-03 13:03:48', '2021-04-03 13:03:48', '2022-04-03 13:03:48'),
	('7ab4d51c99b6e8a16d0d2a537637cbf5de8e55bf90449bd14fecc8ddc6a6728e745b2be54869ca3a', 3, 3, 'appToken', '[]', 0, '2021-04-03 13:46:25', '2021-04-03 13:46:25', '2022-04-03 13:46:25'),
	('7acad28e9b900c61bfea46b719c08dc9efbf8f8d50c9719a86dd5ea171fba83f79a88285ee53af07', NULL, 1, 'appToken', '[]', 0, '2021-04-03 12:22:55', '2021-04-03 12:22:55', '2022-04-03 12:22:55'),
	('7efe3ff54c12c82d25f0e230b8bae9884a3a6f7ea5a5bffd34037ec667de189bc4a23a6640d52f15', 4, 1, 'appToken', '[]', 1, '2021-03-23 12:47:06', '2021-03-23 12:47:06', '2022-03-23 12:47:06'),
	('82704e56f2f6fd396ba015fb359e66b09dbdb05bb9ff85c4ecf8bf719a930c29ea06fb958abb04ea', 3, 3, 'appToken', '[]', 1, '2021-04-03 13:40:46', '2021-04-03 13:40:46', '2022-04-03 13:40:46'),
	('841f531d7886edc1882ee3b8c64b396c0e7faaca5e0fb7af5f8e5b81e3a351e39285a76f05729fcc', 4, 1, 'appToken', '[]', 0, '2021-03-23 12:23:43', '2021-03-23 12:23:43', '2022-03-23 12:23:43'),
	('8472c921204ce1c0314ecbbbbf29e14ce7b1ac1a7cf2fbc3d33ad958dd2bccf494bc75b3228a2944', 1, 1, 'appToken', '[]', 0, '2021-03-28 13:52:23', '2021-03-28 13:52:23', '2022-03-28 13:52:23'),
	('84a25b19b0dc47ce8dc5cb20200d651266529cc5b6ab2f40426cd5a45466aedf41bf483533cef56a', 1, 3, 'appToken', '[]', 1, '2021-04-05 12:42:11', '2021-04-05 12:42:11', '2022-04-05 12:42:11'),
	('8679ce6fa823eaba04c2e86aa2f98ecd403153040e5c7fb94db0c96ae163efb6f041da8b91632f3b', NULL, 1, 'appToken', '[]', 0, '2021-04-03 12:52:13', '2021-04-03 12:52:13', '2022-04-03 12:52:13'),
	('8a198608d050a093cd4f5915b3a87f3a23724945206810fa01db8d44ddf66757ded8ef67697511e9', 3, 1, 'appToken', '[]', 0, '2021-04-03 03:04:12', '2021-04-03 03:04:12', '2022-04-03 03:04:12'),
	('8aa6f43e4343adb92541067b72d4273519a8bedbc27af91c75820fe60131db5d8aa94c7d62155e22', NULL, 1, 'appToken', '[]', 0, '2021-04-03 12:30:39', '2021-04-03 12:30:39', '2022-04-03 12:30:39'),
	('8e58490a36ccbcf3423d7666aa8cfc798839b625a860fda2696ff51d9a867408f8e26113104581a0', 3, 1, 'appToken', '[]', 0, '2021-04-03 03:04:19', '2021-04-03 03:04:19', '2022-04-03 03:04:19'),
	('90dc54174029f22ae6e80d75866c272787ff28f6d5b5b97cd652d675497bcaaa9bc328f3bbbaad6f', NULL, 1, 'appToken', '[]', 0, '2021-03-29 13:20:28', '2021-03-29 13:20:28', '2022-03-29 13:20:28'),
	('918f12de1927f4bbadd3a18d9c2b74bb84d7823aff8360bc4a0130e46fdf56ab38c2722120be2f24', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:23:43', '2021-03-27 12:23:43', '2022-03-27 12:23:43'),
	('994d4bcefae6a603aabb4da0fb5ee24823e5a4d3ef55d33f3da3c6cc6dd8b0c24f25560a0b8a93d2', 3, 1, 'appToken', '[]', 1, '2021-03-31 14:55:47', '2021-03-31 14:55:47', '2022-03-31 14:55:47'),
	('9a68968e1cddbfd2eddc4740d5cdf3a7900372c4d98cade9d0e62bfbb51893ae8e3d59c55cc977c6', 2, 1, 'appToken', '[]', 0, '2021-03-31 14:47:12', '2021-03-31 14:47:12', '2022-03-31 14:47:12'),
	('9ba681d5794e3544a5a0f016bfc57be762b712e5db04846f936512f56951f697ab4de9d4d837d304', 4, 1, 'appToken', '[]', 0, '2021-03-27 11:04:12', '2021-03-27 11:04:12', '2022-03-27 11:04:12'),
	('9cff90dc4c94f344180cf4dc8d5c0cdcd73a882f1f13f393cf4add38abb2f25f43b31d2ed61baece', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:20:32', '2021-03-27 12:20:32', '2022-03-27 12:20:32'),
	('aab1881063a2325ad239c798ea8f46566418aea8ad4a9a5d11e6c5490fd9da7cd5f87955bc88acb5', 4, 1, 'appToken', '[]', 0, '2021-03-28 04:47:43', '2021-03-28 04:47:43', '2022-03-28 04:47:43'),
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
	('d3cddf92fa1cd53a808fb4d0b895df5d002e5f3e67321306cca109d9c80407164d3b501b1b8d48f9', 1, 3, 'appToken', '[]', 0, '2021-04-05 12:46:10', '2021-04-05 12:46:10', '2022-04-05 12:46:10'),
	('e0d36e85386709e37d315346d93e6dd5a295b6983eaa4a5d7303ae34c6237a827028a79a60df2e1a', 4, 1, 'appToken', '[]', 0, '2021-03-27 09:45:59', '2021-03-27 09:45:59', '2022-03-27 09:45:59'),
	('e0e2bb7199dacd872c172e3c74f6133bacf2816da4ae26311736bfd92bc846fcc82215a4ae14a424', 4, 1, 'appToken', '[]', 0, '2021-03-23 12:23:35', '2021-03-23 12:23:35', '2022-03-23 12:23:35'),
	('e74f9d7aa7f6d3a2fc820fc038dd0e3e817ae38a4e60c31b94a47b28dcded80d1bd3a7f981041747', 4, 1, 'appToken', '[]', 0, '2021-03-27 10:18:14', '2021-03-27 10:18:14', '2022-03-27 10:18:14'),
	('e7f8f713a8f8490aea2159d0e68aa25a28af2123e63dda6731e5cf84409cacb850c07ae021ff32e3', NULL, 1, 'appToken', '[]', 0, '2021-04-03 13:11:33', '2021-04-03 13:11:33', '2022-04-03 13:11:33'),
	('eaa30c76d8e193bf1e3b22842f9efedb4301ff337b40ee464f61ac5fd55b3b27cedd7f335c2efa56', 4, 1, 'appToken', '[]', 0, '2021-03-27 10:22:46', '2021-03-27 10:22:46', '2022-03-27 10:22:46'),
	('ebd6e98afedef79f40e55a09e2984e04527d0511cd6e3e9ddebf05237f1aa0b72faa746c87a975e9', 4, 1, 'appToken', '[]', 0, '2021-03-22 13:28:23', '2021-03-22 13:28:23', '2022-03-22 13:28:23');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
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

-- Dumping data for table caycanhapi.oauth_personal_access_clients: ~1 rows (approximately)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2021-03-22 12:34:41', '2021-03-22 12:34:41'),
	(2, 3, '2021-04-03 13:31:08', '2021-04-03 13:31:08');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.plant
CREATE TABLE IF NOT EXISTS `plant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.plant: ~0 rows (approximately)
/*!40000 ALTER TABLE `plant` DISABLE KEYS */;
/*!40000 ALTER TABLE `plant` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.post
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `content` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `created_at` date DEFAULT NULL,
  `like` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.post: ~14 rows (approximately)
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`id`, `title`, `content`, `created_at`, `like`, `user_id`, `deleted_at`, `updated_at`) VALUES
	(1, 'abc', 'lorem ipsum', '2021-04-01', 0, 1, NULL, '2021-04-01'),
	(2, 'abc', 'lorem ipsum', '2021-04-01', 0, 1, NULL, '2021-04-01'),
	(3, 'abc', 'lorem ipsum', '2021-04-02', 0, 1, NULL, '2021-04-02'),
	(4, 'abc', 'lorem ipsum', '2021-04-02', 0, 1, NULL, '2021-04-02'),
	(5, 'fffff', 'fff', '2021-04-02', 0, NULL, NULL, '2021-04-02'),
	(6, 'sdsd', 'sdsdsd', '2021-04-02', 0, 3, NULL, '2021-04-02'),
	(7, 'abccccc', 'cccccc', '2021-04-02', 0, 3, NULL, '2021-04-02'),
	(8, 'abccc', 'aaaaaaaaaa', '2021-04-03', 0, 1, NULL, '2021-04-03'),
	(9, 'abccc', 'aaaaaaaaaa', '2021-04-04', 0, 1, NULL, '2021-04-04'),
	(10, 'abccc', 'aaaaaaaaaa', '2021-04-04', 0, 1, NULL, '2021-04-04'),
	(11, 'abccc', 'aaaaaaaaaa', '2021-04-04', 0, 1, NULL, '2021-04-04'),
	(12, 'abccc', 'aaaaaaaaaa', '2021-04-04', 0, 1, NULL, '2021-04-04'),
	(13, 'abccc', 'aaaaaaaaaa', '2021-04-04', 0, 1, NULL, '2021-04-04'),
	(14, 'abccc', 'aaaaaaaaaa', '2021-04-04', 0, 1, NULL, '2021-04-04'),
	(15, 'abccc', 'aaaaaaaaaa', '2021-04-05', 0, 1, NULL, '2021-04-05'),
	(16, 'vvvv', 'vv', '2021-04-05', 0, 1, NULL, '2021-04-05'),
	(17, 'khoa', 'khoa', '2021-04-05', 0, 1, NULL, '2021-04-05'),
	(18, 'abccc', 'aaaaaaaaaa', '2021-04-05', 0, 1, NULL, '2021-04-05'),
	(19, 'ffc', 'ccc', '2021-04-05', 0, 1, NULL, '2021-04-05'),
	(20, 'test hình', 'ccc', '2021-04-05', 0, 1, NULL, '2021-04-05'),
	(21, 'test hình', 'ccc', '2021-04-05', 0, 1, NULL, '2021-04-05'),
	(25, 'ggf', 'ff', '2021-04-05', 0, 1, NULL, '2021-04-05');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.post_tag
CREATE TABLE IF NOT EXISTS `post_tag` (
  `post_id` int(4) DEFAULT NULL,
  `tag_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.post_tag: ~24 rows (approximately)
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES
	(1, 1),
	(1, 2),
	(2, 1),
	(2, 2),
	(3, 1),
	(4, 1),
	(4, 200),
	(5, 2),
	(5, 6),
	(5, 7),
	(5, 8),
	(5, 2),
	(5, 6),
	(5, 7),
	(5, 8),
	(6, 2),
	(6, 8),
	(6, 9),
	(7, 1),
	(7, 5),
	(7, 7),
	(7, 8),
	(14, 1),
	(14, 3),
	(15, 1),
	(15, 3),
	(17, 8),
	(17, 10),
	(18, 1),
	(18, 3),
	(19, 7),
	(19, 7),
	(19, 7),
	(19, 11),
	(19, 7),
	(19, 11),
	(19, 7),
	(19, 11),
	(20, 7),
	(20, 7),
	(20, 7),
	(20, 11),
	(20, 7),
	(20, 11),
	(20, 7),
	(20, 11),
	(20, 1),
	(20, 2),
	(20, 7),
	(20, 11),
	(21, 7),
	(21, 7),
	(21, 7),
	(21, 11),
	(21, 7),
	(21, 11),
	(21, 7),
	(21, 11),
	(21, 1),
	(21, 2),
	(21, 7),
	(21, 11),
	(21, 1),
	(21, 2),
	(21, 7),
	(21, 11),
	(25, 2),
	(25, 8);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL DEFAULT '0',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.role: ~0 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.saved_post
CREATE TABLE IF NOT EXISTS `saved_post` (
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.saved_post: ~0 rows (approximately)
/*!40000 ALTER TABLE `saved_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_post` ENABLE KEYS */;

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
  `role_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(4) DEFAULT '0',
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_ai_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.user: ~0 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `bio`, `role_id`, `is_deleted`, `name`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'rr', 'chronicle1951@gmail.com', '$2y$10$1vyNg.NWLf0AP3S8LtcyVOZ8eDs3MCiKHUUjY4G/ww0e2RvQHdqEK', '', 0, 0, 'sdf', NULL, NULL, '2021-03-31 14:55:40', '2021-03-31 14:55:40', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.user_follow_user
CREATE TABLE IF NOT EXISTS `user_follow_user` (
  `following_user_id` int(11) DEFAULT NULL,
  `followed_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.user_follow_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_follow_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_follow_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
