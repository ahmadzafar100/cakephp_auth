-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 05, 2026 at 06:39 AM
-- Server version: 9.1.0
-- PHP Version: 8.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cake_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
CREATE TABLE IF NOT EXISTS `districts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `state_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `state_id`) VALUES
(1, 'Visakhapatnam', 1),
(2, 'East Godavari', 1),
(3, 'Tawang', 2),
(4, 'Itanagar', 2),
(5, 'Kamrup', 3),
(6, 'Guwahati', 3),
(7, 'Patna', 4),
(8, 'Gaya', 4),
(9, 'Raipur', 5),
(10, 'Bilaspur', 5),
(11, 'Ahmedabad', 7),
(12, 'Surat', 7),
(13, 'Bhopal', 13),
(14, 'Indore', 13),
(15, 'Mumbai', 14),
(16, 'Pune', 14),
(17, 'Chennai', 23),
(18, 'Coimbatore', 23),
(19, 'Hyderabad', 24),
(20, 'Warangal', 24),
(21, 'Lucknow', 26),
(22, 'Kanpur', 26),
(23, 'Kolkata', 28),
(24, 'Darjeeling', 28);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `gender` enum('Male','Female') COLLATE utf8mb4_general_ci NOT NULL,
  `dob` date NOT NULL,
  `photo` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `state_id` int NOT NULL,
  `district_id` int NOT NULL,
  `added_by` int NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `mobile`, `gender`, `dob`, `photo`, `state_id`, `district_id`, `added_by`, `isactive`, `created_at`, `updated_at`) VALUES
(4, 'fd', 'gfd@gmail.com', '2369864376', 'Female', '2025-02-01', '1754387930.png', 0, 0, 0, 1, '2025-08-05 09:58:50', '2025-08-05 09:58:50'),
(6, 'dsffds', 'fdsdf@gmail.com', '7668676876', 'Male', '2000-12-06', '1754309023.jpg', 0, 0, 0, 0, '2025-08-04 12:03:43', '2025-08-04 12:03:43'),
(7, 'dsasad', 'ASD@GMAIL.COM', '3143432243', 'Male', '2025-08-03', '1754393580.jpg', 0, 0, 0, 1, '2025-08-04 06:57:29', '2025-08-05 11:33:00'),
(8, 'fd', 'gfd@gmail.com', '2369864376', 'Female', '2025-02-01', '1754387930.png', 0, 0, 0, 1, '2025-08-05 09:58:50', '2025-08-05 09:58:50'),
(9, 'dsadsa', 'dsasd@gmail.com', '7718798279', 'Male', '1950-01-10', '1754393330.png', 0, 0, 0, 1, '2025-08-05 11:28:50', '2025-08-05 11:28:50'),
(10, 'dsffds', 'fdsdf@gmail.com', '7668676876', 'Male', '2000-12-06', '1754309023.jpg', 0, 0, 0, 0, '2025-08-04 12:03:43', '2025-08-04 12:03:43'),
(11, 'dsffds', 'fdsdf@gmail.com', '7668676876', 'Male', '2000-12-06', '1754309023.jpg', 0, 0, 0, 0, '2025-08-04 12:03:43', '2025-08-04 12:03:43'),
(12, 'dsasad', 'ASD@GMAIL.COM', '3143432243', 'Male', '2025-08-03', '1754393580.jpg', 0, 0, 0, 1, '2025-08-04 06:57:29', '2025-08-05 11:33:00'),
(13, 'fd', 'gfd@gmail.com', '2369864376', 'Female', '2025-02-01', '1754387930.png', 0, 0, 0, 1, '2025-08-05 09:58:50', '2025-08-05 09:58:50'),
(14, 'dsadsa', 'dsasd@gmail.com', '7718798279', 'Male', '1950-01-10', '1754393330.png', 0, 0, 0, 1, '2025-08-05 11:28:50', '2025-08-05 11:28:50'),
(15, 'dsasad', 'ASD@GMAIL.COM', '3143432243', 'Male', '2025-08-03', '1754393580.jpg', 0, 0, 0, 1, '2025-08-04 06:57:29', '2025-08-05 11:33:00'),
(16, 'fd', 'gfd@gmail.com', '2369864376', 'Female', '2025-02-01', '1754387930.png', 0, 0, 0, 1, '2025-08-05 09:58:50', '2025-08-05 09:58:50'),
(17, 'dsadsa', 'dsasd@gmail.com', '7718798279', 'Male', '1950-01-10', '1754393330.png', 0, 0, 0, 1, '2025-08-05 11:28:50', '2025-08-05 11:28:50'),
(18, 'dsffds', 'fdsdf@gmail.com', '7668676876', 'Male', '2000-12-06', '1754309023.jpg', 0, 0, 0, 0, '2025-08-04 12:03:43', '2025-08-04 12:03:43'),
(19, 'dsffds', 'fdsdf@gmail.com', '7668676876', 'Male', '2000-12-06', '1754309023.jpg', 0, 0, 0, 0, '2025-08-04 12:03:43', '2025-08-04 12:03:43'),
(20, 'dsffds', 'fdsdf@gmail.com', '7668676876', 'Male', '2000-12-06', '1754309023.jpg', 0, 0, 0, 0, '2025-08-04 12:03:43', '2025-08-04 12:03:43'),
(21, 'dsffds', 'fdsdf@gmail.com', '7668676876', 'Male', '2000-12-06', '1754309023.jpg', 0, 0, 0, 0, '2025-08-04 12:03:43', '2025-08-04 12:03:43'),
(22, 'dsasad', 'ASD@GMAIL.COM', '3143432243', 'Male', '2025-08-03', '1754393580.jpg', 0, 0, 0, 1, '2025-08-04 06:57:29', '2025-08-05 11:33:00'),
(23, 'fd', 'gfd@gmail.com', '2369864376', 'Female', '2025-02-01', '1754387930.png', 0, 0, 0, 1, '2025-08-05 09:58:50', '2025-08-05 09:58:50'),
(24, 'dsadsa', 'dsasd@gmail.com', '7718798279', 'Male', '1950-01-10', '1754393330.png', 0, 0, 0, 1, '2025-08-05 11:28:50', '2025-08-05 11:28:50'),
(25, 'dsasad', 'ASD@GMAIL.COM', '3143432243', 'Male', '2025-08-03', '1754393580.jpg', 0, 0, 0, 1, '2025-08-04 06:57:29', '2025-08-05 11:33:00'),
(26, 'fd', 'gfd@gmail.com', '2369864376', 'Female', '2025-02-01', '1754387930.png', 0, 0, 0, 1, '2025-08-05 09:58:50', '2025-08-05 09:58:50'),
(27, 'dsadsa', 'dsasd@gmail.com', '7718798279', 'Male', '1950-01-10', '1754393330.png', 0, 0, 0, 1, '2025-08-05 11:28:50', '2025-08-05 11:28:50'),
(28, 'dsasad', 'ASD@GMAIL.COM', '3143432243', 'Male', '2025-08-03', '1754393580.jpg', 0, 0, 0, 1, '2025-08-04 06:57:29', '2025-08-05 11:33:00'),
(29, 'fd', 'gfd@gmail.com', '2369864376', 'Female', '2025-02-01', '1754387930.png', 0, 0, 0, 1, '2025-08-05 09:58:50', '2025-08-05 09:58:50'),
(30, 'dsadsa', 'dsasd@gmail.com', '7718798279', 'Male', '1950-01-10', '1754393330.png', 0, 0, 0, 1, '2025-08-05 11:28:50', '2025-08-05 11:28:50'),
(31, 'dsasad', 'ASD@GMAIL.COM', '3143432243', 'Male', '2025-08-03', '1754393580.jpg', 0, 0, 0, 1, '2025-08-04 06:57:29', '2025-08-05 11:33:00'),
(32, 'fd', 'gfd@gmail.com', '2369864376', 'Female', '2025-02-01', '1754387930.png', 0, 0, 0, 1, '2025-08-05 09:58:50', '2025-08-05 09:58:50'),
(33, 'dsadsa', 'dsasd@gmail.com', '7718798279', 'Male', '1950-01-10', '1754393330.png', 0, 0, 0, 1, '2025-08-05 11:28:50', '2025-08-05 11:28:50'),
(34, 'dsffds', 'fdsdf@gmail.com', '7668676876', 'Male', '2000-12-06', '1754309023.jpg', 0, 0, 0, 0, '2025-08-04 12:03:43', '2025-08-04 12:03:43'),
(35, 'dsffds', 'fdsdf@gmail.com', '7668676876', 'Male', '2000-12-06', '1754309023.jpg', 0, 0, 0, 1, '2025-08-04 12:03:43', '2025-08-06 11:57:15'),
(36, 'dsffds', 'fdsdf@gmail.com', '7668676876', 'Male', '2000-12-06', '1754309023.jpg', 0, 0, 0, 0, '2025-08-04 12:03:43', '2025-08-04 12:03:43'),
(37, 'dsffds', 'fdsdf@gmail.com', '7668676876', 'Male', '2000-12-06', '1754309023.jpg', 0, 0, 0, 0, '2025-08-04 12:03:43', '2025-08-04 12:03:43'),
(38, 'dsffds', 'fdsdf@gmail.com', '7668676876', 'Male', '2000-12-06', '1754309023.jpg', 0, 0, 0, 0, '2025-08-04 12:03:43', '2025-08-04 12:03:43'),
(39, 'dsffds', 'fdsdf@gmail.com', '7668676876', 'Male', '2000-12-06', '1754309023.jpg', 0, 0, 0, 0, '2025-08-04 12:03:43', '2025-08-04 12:03:43'),
(40, 'dsffds', 'fdsdf@gmail.com', '7668676876', 'Male', '2000-12-06', '1754309023.jpg', 0, 0, 0, 0, '2025-08-04 12:03:43', '2025-08-04 12:03:43'),
(41, 'dsffds', 'fdsdf@gmail.com', '7668676876', 'Male', '2000-12-06', '1754309023.jpg', 0, 0, 0, 0, '2025-08-04 12:03:43', '2025-08-06 08:41:43'),
(42, 'dsasad', 'ASD@GMAIL.COM', '3143432243', 'Male', '2025-08-03', '1754393580.jpg', 0, 0, 0, 1, '2025-08-04 06:57:29', '2025-08-05 11:33:00'),
(43, 'Zafar', 'ahmadzafar100@gmail.com', '9616251187', 'Male', '1995-07-10', '1754387930.png', 0, 0, 0, 1, '2025-08-05 09:58:50', '2025-08-06 05:33:29'),
(46, 'Ahmad', 'ahmad@test.com', '8887748326', 'Male', '1995-12-24', '1754557541.png', 0, 0, 0, 1, '2025-08-06 11:01:03', '2025-08-07 09:05:41'),
(47, 'Hakeem Rosa', 'fugijodyz@mailinator.com', '1111111111', 'Female', '1961-05-11', '1754566982.jpg', 26, 22, 0, 1, '2025-08-07 11:40:43', '2025-08-11 09:15:04'),
(50, 'Ahmad Zafar', 'ahmad@test.com', '4323243242', 'Male', '2000-12-01', '1754902409.png', 26, 22, 0, 1, '2025-08-11 08:53:29', '2025-08-11 09:07:54'),
(51, 'Cailin Short', 'gity@mailinator.com', '1111111111', 'Female', '1995-11-29', '1755061328.png', 4, 8, 0, 1, '2025-08-13 05:02:08', '2025-08-13 05:02:08'),
(52, 'Eugenia Duke', 'dihodisab@mailinator.com', '2222222222', 'Female', '1967-02-06', '1755062014.png', 5, 10, 1, 1, '2025-08-13 05:13:34', '2025-08-19 11:19:57'),
(53, 'zafarapi', 'api@gmail.com', '9898989898', 'Male', '1990-03-13', '1764068398.pdf', 1, 1, 1, 1, '2025-11-25 10:59:58', '2025-11-25 10:59:58'),
(54, 'zafarapi', 'api@gmail.com', '9898989898', 'Male', '1990-03-13', '1764068436.pdf', 1, 1, 1, 1, '2025-11-25 11:00:36', '2025-11-25 11:00:36'),
(55, 'laravelapi', 'laravel@gmail.com', '1111111111', 'Male', '2000-10-13', '', 1, 1, 1, 1, '2025-11-26 06:02:47', '2025-11-26 06:02:47'),
(61, 'laravelapi', 'laravel@gmail.com', '1111111111', 'Male', '2000-10-13', 'uploads/1764218830laravelapi.pdf', 1, 1, 1, 1, '2025-11-26 23:17:11', '2025-11-26 23:17:11');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 2),
(3, '0001_01_01_000002_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 8, 'loginToken', '6cb9f1fadb598828dcbb1b1ef13d718a08337fdb905108e4571f85230b1c6606', '[\"*\"]', NULL, NULL, '2025-11-26 01:15:22', '2025-11-26 01:15:22'),
(2, 'App\\Models\\User', 8, 'loginToken', 'ed4bf10eeca965ed83c21f4a3c06f61decf179210efc9a545659cd21208cd2f7', '[\"*\"]', NULL, NULL, '2025-11-26 01:15:43', '2025-11-26 01:15:43'),
(3, 'App\\Models\\User', 8, 'loginToken', '77e81e3355d1a5af609d0f4351a90e57023a0b98425ff1309428ed0b4f0b5e0d', '[\"*\"]', NULL, NULL, '2025-11-26 01:29:23', '2025-11-26 01:29:23'),
(4, 'App\\Models\\User', 8, 'loginToken', '59a7c1a1cb8a4c774a20b9ea0b58f477c9019096ff7b3991989ca2f1c9730bf0', '[\"*\"]', NULL, NULL, '2025-11-26 02:48:18', '2025-11-26 02:48:18'),
(5, 'App\\Models\\User', 8, 'loginToken', '2669064a7554a3fc15c5b9254817d810ca65785eacaa65d9ea653eb73bb28737', '[\"*\"]', '2025-11-26 03:41:15', NULL, '2025-11-26 03:40:24', '2025-11-26 03:41:15'),
(6, 'App\\Models\\User', 8, 'loginToken', 'df7caf1b8d25b49e21f7b607fc2d4c73e5526d4116e70bf2368b008bcc50492d', '[\"*\"]', '2025-11-27 01:05:16', NULL, '2025-11-26 03:43:28', '2025-11-27 01:05:16'),
(7, 'App\\Models\\User', 8, 'loginToken', 'f78619b8791e8bcc214c0ddee4bc866d04914126b1bf1b71783a76a2dd1ff5aa', '[\"*\"]', '2025-11-27 05:14:25', NULL, '2025-11-27 04:24:06', '2025-11-27 05:14:25'),
(8, 'App\\Models\\User', 13, 'loginToken', 'b493c76e9b56fbf922884f25947d459e7d7bc1a40adb6e8f55cca6d63164b31f', '[\"*\"]', NULL, NULL, '2025-11-27 11:04:46', '2025-11-27 11:04:46'),
(9, 'App\\Models\\User', 13, 'loginToken', '05936c363293fedf5f7eb43d4e305692736bfb29ad1e0799ebe44e98929e6ab1', '[\"*\"]', '2025-12-01 06:17:00', NULL, '2025-12-01 04:48:17', '2025-12-01 06:17:00'),
(10, 'App\\Models\\User', 13, 'loginToken', 'cdc78af84280a75151a48e7fc740dbc13cc5c5d3067f5306f06745a253d0183e', '[\"*\"]', NULL, NULL, '2025-12-01 05:56:24', '2025-12-01 05:56:24'),
(11, 'App\\Models\\User', 13, 'loginToken', 'e3d7de150c02dd1b3996c5e4d9009c6f52a803b15ed4cbccdbf7ff11626fd377', '[\"*\"]', NULL, NULL, '2025-12-01 06:16:56', '2025-12-01 06:16:56');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`) VALUES
(1, 'Andhra Pradesh'),
(2, 'Arunachal Pradesh'),
(3, 'Assam'),
(4, 'Bihar'),
(5, 'Chhattisgarh'),
(6, 'Goa'),
(7, 'Gujarat'),
(8, 'Haryana'),
(9, 'Himachal Pradesh'),
(10, 'Jharkhand'),
(11, 'Karnataka'),
(12, 'Kerala'),
(13, 'Madhya Pradesh'),
(14, 'Maharashtra'),
(15, 'Manipur'),
(16, 'Meghalaya'),
(17, 'Mizoram'),
(18, 'Nagaland'),
(19, 'Odisha'),
(20, 'Punjab'),
(21, 'Rajasthan'),
(22, 'Sikkim'),
(23, 'Tamil Nadu'),
(24, 'Telangana'),
(25, 'Tripura'),
(26, 'Uttar Pradesh'),
(27, 'Uttarakhand'),
(28, 'West Bengal'),
(29, 'Andaman and Nicobar Islands'),
(30, 'Chandigarh'),
(31, 'Dadra and Nagar Haveli and Daman and Diu'),
(32, 'Delhi'),
(33, 'Jammu and Kashmir'),
(34, 'Ladakh'),
(35, 'Lakshadweep'),
(36, 'Puducherry');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(5) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user',
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login_ip` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_login_time` timestamp NULL DEFAULT NULL,
  `last_logout_ip` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_logout_time` timestamp NULL DEFAULT NULL,
  `last_password_change_ip` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_password_change_time` timestamp NULL DEFAULT NULL,
  `token_version` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `isactive`, `created_at`, `updated_at`, `last_login_ip`, `last_login_time`, `last_logout_ip`, `last_logout_time`, `last_password_change_ip`, `last_password_change_time`, `token_version`) VALUES
(1, 'Zafar', 'zafar@test.com', '$2y$12$JYiFv3lRsJZpZYrSmAOk4e15frmWtTEjZXgw10gAc166CkuiexB7S', 'user', 1, '2026-05-05 06:15:08', '2026-05-05 06:20:41', NULL, NULL, NULL, NULL, NULL, NULL, 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
