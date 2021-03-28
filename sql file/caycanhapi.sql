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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.image_for_post: ~10 rows (approximately)
/*!40000 ALTER TABLE `image_for_post` DISABLE KEYS */;
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

-- Dumping data for table caycanhapi.oauth_access_tokens: ~38 rows (approximately)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('051684a08b4297743da5a9551a96d044bbe5d28338bae5d41c2a25efe626ce7c56abb15863405d74', 4, 1, 'appToken', '[]', 1, '2021-03-27 11:24:24', '2021-03-27 11:24:24', '2022-03-27 11:24:24'),
	('0741f653eccb12cbfed7cfb72950d5fe73d95477fdd66ba42c8fc968dd692f10d0805bc2dda85c7e', 1, 1, 'appToken', '[]', 1, '2021-03-22 13:49:20', '2021-03-22 13:49:20', '2022-03-22 13:49:20'),
	('09a1486205ba01630639ea353f8e2fb07f1750eb5094dc1aa18fcf2e6bae52f22aaeeed2c4c454ef', 4, 1, 'appToken', '[]', 0, '2021-03-23 12:18:51', '2021-03-23 12:18:51', '2022-03-23 12:18:51'),
	('0c8d083a50d5e6c53dff5cc44e2f98533beb5c45bacac1dfc4740f7827e12ec0447d057f8ee0abf9', 4, 1, 'appToken', '[]', 0, '2021-03-22 12:41:32', '2021-03-22 12:41:32', '2022-03-22 12:41:32'),
	('0cc7b42e551f884660b5cb7d1b9a883b25e23bcc273ba942c4ed32c12fe4b71a938dba87a24a43a4', 4, 1, 'appToken', '[]', 0, '2021-03-27 10:18:22', '2021-03-27 10:18:22', '2022-03-27 10:18:22'),
	('151fac03c4d4a7fbd5af72f2b75ba685589c2572b7e1f2b86aaad2bffb120f7221a712900b955850', 4, 1, 'appToken', '[]', 0, '2021-03-28 04:47:52', '2021-03-28 04:47:52', '2022-03-28 04:47:52'),
	('16f9052a69f14e610ed2f4507904ed4015a0856b800ca46f8b68feaf7ca79e4a8f96bd8d3df0f0b3', 4, 1, 'appToken', '[]', 0, '2021-03-27 11:35:55', '2021-03-27 11:35:55', '2022-03-27 11:35:55'),
	('1a40d3996fe8a7a0650f31feb13192f912dec04a88a00664a6ba60ab92d53d32db03a654dbba6795', 4, 1, NULL, '[]', 0, '2021-03-22 12:35:29', '2021-03-22 12:35:29', '2022-03-22 12:35:29'),
	('1b34e0053f2de48c160cb53259be20bec98401576283a676dde2a2d47dcc9b4ddf0b55e646ccc41a', 1, 1, 'appToken', '[]', 0, '2021-03-28 13:51:36', '2021-03-28 13:51:36', '2022-03-28 13:51:36'),
	('28a2b74855fab6d56c4c76a9639a3830e6ee499a212cbd219d9f94e2a292e1760dd4b760d62405d6', 4, 1, 'appToken', '[]', 1, '2021-03-27 11:27:17', '2021-03-27 11:27:17', '2022-03-27 11:27:17'),
	('37810ff23314c5527568ada0fba898348e1be4bdd866635be1527cc97d3ea7951fd7db74e5262ca5', 4, 1, 'appToken', '[]', 0, '2021-03-27 13:41:28', '2021-03-27 13:41:28', '2022-03-27 13:41:28'),
	('40b67a7712485a895fe742682ccf8ac976aacac1f8f1b60f1e678c5be0b7c46056996a7dcc6fca98', 4, 1, 'appToken', '[]', 0, '2021-03-28 09:44:13', '2021-03-28 09:44:13', '2022-03-28 09:44:13'),
	('4a238f04afee51ffce4388dc2f4ff080198a332dfe617c161b293e8b3fa7bcdc6264b41f0b314282', 4, 1, 'appToken', '[]', 1, '2021-03-27 11:20:20', '2021-03-27 11:20:20', '2022-03-27 11:20:20'),
	('4aec712cd8fbfcdd6977a18b670df43a26ab60939447cb115626cba12b642a94c6b61effbefdad2a', 4, 1, 'appToken', '[]', 1, '2021-03-23 12:46:06', '2021-03-23 12:46:06', '2022-03-23 12:46:06'),
	('503d5e20b728e13a600b4f484b283a6ca22a8d21f10ef17b453fc0a04a3ca6805600ae3ab0fc57cb', 3, 1, NULL, '[]', 0, '2021-03-22 12:35:02', '2021-03-22 12:35:02', '2022-03-22 12:35:02'),
	('513fb62c2db68b8f15902602f6e9daa2277a1a656b308a6d741d806470ce05440438485fb8db5f02', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:11:32', '2021-03-27 12:11:32', '2022-03-27 12:11:32'),
	('577a6ebfedd4234205dad3722fac6dee0ccf0136f2ea5d1c5ac70988edb906d1f8fce8be8f357d99', 5, 1, 'appToken', '[]', 0, '2021-03-22 12:37:55', '2021-03-22 12:37:55', '2022-03-22 12:37:55'),
	('5d451451b10958e6ba336b8d93634bd93f08cb58703ec02198d501f713fda49d773d62d3207283bd', 4, 1, 'appToken', '[]', 1, '2021-03-27 11:06:32', '2021-03-27 11:06:32', '2022-03-27 11:06:32'),
	('5fd02e74639ba9d17e06494002d8320ef8dec91649a90f6dc8a5cf62f09d6b6b14b56c96fe299ed2', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:29:40', '2021-03-27 12:29:40', '2022-03-27 12:29:40'),
	('627b687165de3484ea2dcb86b44cf486181d8c4543cd2ed3254b63a09e59c42865419bb48192ed6e', 4, 1, 'appToken', '[]', 1, '2021-03-23 12:48:21', '2021-03-23 12:48:21', '2022-03-23 12:48:21'),
	('63ed0bc101a252a0f9773c7b6678e3114f358615dcb4fa44dad74f360cacf4eab44a105ea7928819', 4, 1, 'appToken', '[]', 0, '2021-03-27 12:38:52', '2021-03-27 12:38:52', '2022-03-27 12:38:52'),
	('703fbf1fc4e2014e0a16c57deab2b7e739ce0c90bfa8f30f090bc2d881f5a11a2d966a99715a36c1', 4, 1, 'appToken', '[]', 0, '2021-03-27 15:23:46', '2021-03-27 15:23:46', '2022-03-27 15:23:46'),
	('7684552c0f567e6c29beb0a7f3c33a82c9385c009a34a2c109725742082e05963b90c1065eb75716', 4, 1, 'appToken', '[]', 1, '2021-03-27 11:20:51', '2021-03-27 11:20:51', '2022-03-27 11:20:51'),
	('76fdcb01a9b4ab75af938b8f459a9dea63f6d4baa7b2071effbc8d74ff6f19b0f5b9d4308aa5d1bc', 4, 1, 'appToken', '[]', 1, '2021-03-28 09:39:51', '2021-03-28 09:39:51', '2022-03-28 09:39:51'),
	('7efe3ff54c12c82d25f0e230b8bae9884a3a6f7ea5a5bffd34037ec667de189bc4a23a6640d52f15', 4, 1, 'appToken', '[]', 1, '2021-03-23 12:47:06', '2021-03-23 12:47:06', '2022-03-23 12:47:06'),
	('841f531d7886edc1882ee3b8c64b396c0e7faaca5e0fb7af5f8e5b81e3a351e39285a76f05729fcc', 4, 1, 'appToken', '[]', 0, '2021-03-23 12:23:43', '2021-03-23 12:23:43', '2022-03-23 12:23:43'),
	('8472c921204ce1c0314ecbbbbf29e14ce7b1ac1a7cf2fbc3d33ad958dd2bccf494bc75b3228a2944', 1, 1, 'appToken', '[]', 0, '2021-03-28 13:52:23', '2021-03-28 13:52:23', '2022-03-28 13:52:23'),
	('918f12de1927f4bbadd3a18d9c2b74bb84d7823aff8360bc4a0130e46fdf56ab38c2722120be2f24', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:23:43', '2021-03-27 12:23:43', '2022-03-27 12:23:43'),
	('9ba681d5794e3544a5a0f016bfc57be762b712e5db04846f936512f56951f697ab4de9d4d837d304', 4, 1, 'appToken', '[]', 0, '2021-03-27 11:04:12', '2021-03-27 11:04:12', '2022-03-27 11:04:12'),
	('9cff90dc4c94f344180cf4dc8d5c0cdcd73a882f1f13f393cf4add38abb2f25f43b31d2ed61baece', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:20:32', '2021-03-27 12:20:32', '2022-03-27 12:20:32'),
	('aab1881063a2325ad239c798ea8f46566418aea8ad4a9a5d11e6c5490fd9da7cd5f87955bc88acb5', 4, 1, 'appToken', '[]', 0, '2021-03-28 04:47:43', '2021-03-28 04:47:43', '2022-03-28 04:47:43'),
	('b9c89057d8edd9e57e5dd7a3aa19f0cb12b59f04f03dbea408f1177ce6f08060da22158fb3f03d91', 4, 1, 'appToken', '[]', 0, '2021-03-27 12:39:31', '2021-03-27 12:39:31', '2022-03-27 12:39:31'),
	('ba13011a91d43162baa441524971ce71706cecfb66be7e5102f884678a2e154f933c7c33bcd11ac1', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:21:58', '2021-03-27 12:21:58', '2022-03-27 12:21:58'),
	('c528e7b7c8c3bd84d9bb8708289ca30a69e6e2f259c2ba8d523c8c569928ab1d58af516b24e2907e', 4, 1, 'appToken', '[]', 0, '2021-03-25 03:45:28', '2021-03-25 03:45:28', '2022-03-25 03:45:28'),
	('cca2ebb1c72580e969741e112d1c888fae9b6fc3496193684b636101bddb672721dd58a1505fcb99', 4, 1, 'appToken', '[]', 1, '2021-03-27 12:24:02', '2021-03-27 12:24:02', '2022-03-27 12:24:02'),
	('e0d36e85386709e37d315346d93e6dd5a295b6983eaa4a5d7303ae34c6237a827028a79a60df2e1a', 4, 1, 'appToken', '[]', 0, '2021-03-27 09:45:59', '2021-03-27 09:45:59', '2022-03-27 09:45:59'),
	('e0e2bb7199dacd872c172e3c74f6133bacf2816da4ae26311736bfd92bc846fcc82215a4ae14a424', 4, 1, 'appToken', '[]', 0, '2021-03-23 12:23:35', '2021-03-23 12:23:35', '2022-03-23 12:23:35'),
	('e74f9d7aa7f6d3a2fc820fc038dd0e3e817ae38a4e60c31b94a47b28dcded80d1bd3a7f981041747', 4, 1, 'appToken', '[]', 0, '2021-03-27 10:18:14', '2021-03-27 10:18:14', '2022-03-27 10:18:14'),
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.oauth_clients: ~2 rows (approximately)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', 'HJiIqTxzyIFnX04rUJ2dQ5mlEtMxlb3ZgjsXd4Rc', 'http://localhost', 1, 0, 0, '2021-03-22 12:34:41', '2021-03-22 12:34:41'),
	(2, NULL, 'Laravel Password Grant Client', 'UO09uvCNRC9UT0jxgSkyyE2lSU4uWX8GPUnP5QL6', 'http://localhost', 0, 1, 0, '2021-03-22 12:34:41', '2021-03-22 12:34:41');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table caycanhapi.oauth_personal_access_clients: ~1 rows (approximately)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2021-03-22 12:34:41', '2021-03-22 12:34:41');
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
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.post: ~16 rows (approximately)
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

-- Dumping structure for table caycanhapi.post_tag
CREATE TABLE IF NOT EXISTS `post_tag` (
  `post_id` int(4) DEFAULT NULL,
  `tag_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.post_tag: ~18 rows (approximately)
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
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
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.tag: ~11 rows (approximately)
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`id`, `tag_type_id`, `name`, `created_date`, `is_deleted`) VALUES
	(1, 1, 'cây Lan', '2021-03-26', 0),
	(2, 1, 'cây văn phòng', '2021-03-26', 0),
	(3, 1, 'trầu bà', '2021-03-26', 0),
	(4, 1, 'xương rồng', '2021-03-26', 0),
	(5, 1, 'sen đá', '2021-03-26', 0),
	(6, 1, 'dây leo', '2021-03-26', 0),
	(7, 2, 'mẹo vặt', '2021-03-26', 0),
	(8, 2, 'tâm sự', '2021-03-26', 0),
	(9, 2, 'nâng cao', '2021-03-26', 0),
	(10, 2, 'kiến thức', '2021-03-26', 0),
	(11, 2, 'cơ bản', '2021-03-26', 0);
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
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `activation_token` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table caycanhapi.user: ~4 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `bio`, `role_id`, `is_deleted`, `name`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `active`, `activation_token`) VALUES
	(1, 'chronicle', 'chronicle1951@gmail.com', '$2y$10$NUabujVwdjEVVEASHJMbLesxaVTa922HA9AA1SmvqP25HnOsF8Hhq', '', 0, 0, 'khoa', NULL, NULL, '2021-03-28 13:47:40', '2021-03-28 13:51:36', NULL, 1, 3414);
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
