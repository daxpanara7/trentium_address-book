-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2025 at 05:54 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `address_book`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `slug`, `action`, `data`, `created_at`, `updated_at`) VALUES
(1, '92530e57-a13d-4f1e-b7fb-73b7c1036e27', 'insert', '\"{\\\"slug\\\":\\\"92530e57-a13d-4f1e-b7fb-73b7c1036e27\\\",\\\"first_name\\\":\\\"test first\\\",\\\"last_name\\\":\\\"test last\\\",\\\"profile_pic\\\":\\\"profile_6873cda3848f01.46905168.png\\\",\\\"email\\\":\\\"test@gmail.com\\\",\\\"phone\\\":\\\"1234567890\\\",\\\"street\\\":\\\"test street\\\",\\\"zip_code\\\":\\\"380016\\\",\\\"city_id\\\":\\\"2\\\",\\\"updated_at\\\":\\\"2025-07-13T15:15:47.000000Z\\\",\\\"created_at\\\":\\\"2025-07-13T15:15:47.000000Z\\\"}\"', '2025-07-13 09:45:47', '2025-07-13 09:45:47'),
(2, '92530e57-a13d-4f1e-b7fb-73b7c1036e27', 'update', '\"{\\\"first_name\\\":\\\"test\\\",\\\"last_name\\\":\\\"testing\\\",\\\"email\\\":\\\"testing@gmail.com\\\",\\\"phone\\\":\\\"9090909090\\\",\\\"updated_at\\\":\\\"2025-07-13 15:20:03\\\"}\"', '2025-07-13 09:50:03', '2025-07-13 09:50:03'),
(3, '92530e57-a13d-4f1e-b7fb-73b7c1036e27', 'update', '\"{\\\"first_name\\\":\\\"test 1\\\",\\\"updated_at\\\":\\\"2025-07-13 15:25:25\\\"}\"', '2025-07-13 09:55:25', '2025-07-13 09:55:25'),
(4, '92530e57-a13d-4f1e-b7fb-73b7c1036e27', 'update', '\"[]\"', '2025-07-13 09:55:26', '2025-07-13 09:55:26'),
(5, '92530e57-a13d-4f1e-b7fb-73b7c1036e27', 'delete', '\"{\\\"slug\\\":\\\"92530e57-a13d-4f1e-b7fb-73b7c1036e27\\\",\\\"first_name\\\":\\\"test 1\\\",\\\"last_name\\\":\\\"testing\\\",\\\"profile_pic\\\":\\\"profile_6873cda3848f01.46905168.png\\\",\\\"email\\\":\\\"testing@gmail.com\\\",\\\"phone\\\":\\\"9090909090\\\",\\\"street\\\":\\\"test street\\\",\\\"zip_code\\\":\\\"380016\\\",\\\"city_id\\\":2,\\\"created_at\\\":\\\"2025-07-13T15:15:47.000000Z\\\",\\\"updated_at\\\":\\\"2025-07-13T15:25:25.000000Z\\\",\\\"deleted_at\\\":null}\"', '2025-07-13 09:56:09', '2025-07-13 09:56:09'),
(6, '05f4800d-0a18-4c3a-9c90-3eab7bd758f0', 'insert', '\"{\\\"slug\\\":\\\"05f4800d-0a18-4c3a-9c90-3eab7bd758f0\\\",\\\"first_name\\\":\\\"test first\\\",\\\"last_name\\\":\\\"test last\\\",\\\"profile_pic\\\":\\\"profile_6873d2633e8151.77664029.jpg\\\",\\\"email\\\":\\\"test@gmail.com\\\",\\\"phone\\\":\\\"1234567890\\\",\\\"street\\\":\\\"test street\\\",\\\"zip_code\\\":\\\"380016\\\",\\\"city_id\\\":\\\"2\\\",\\\"updated_at\\\":\\\"2025-07-13T15:36:03.000000Z\\\",\\\"created_at\\\":\\\"2025-07-13T15:36:03.000000Z\\\"}\"', '2025-07-13 10:06:03', '2025-07-13 10:06:03'),
(7, 'eaa343af-73be-45c8-98c2-d85e11131ad9', 'insert', '\"{\\\"slug\\\":\\\"eaa343af-73be-45c8-98c2-d85e11131ad9\\\",\\\"first_name\\\":\\\"test first\\\",\\\"last_name\\\":\\\"test last\\\",\\\"profile_pic\\\":\\\"profile_6873d2a06004c5.60331214.jpg\\\",\\\"email\\\":\\\"tes111t@gmail.com\\\",\\\"phone\\\":\\\"1234567890\\\",\\\"street\\\":\\\"test street\\\",\\\"zip_code\\\":\\\"380016\\\",\\\"city_id\\\":\\\"2\\\",\\\"updated_at\\\":\\\"2025-07-13T15:37:04.000000Z\\\",\\\"created_at\\\":\\\"2025-07-13T15:37:04.000000Z\\\"}\"', '2025-07-13 10:07:04', '2025-07-13 10:07:04');

-- --------------------------------------------------------

--
-- Table structure for table `address_books`
--

CREATE TABLE `address_books` (
  `slug` char(36) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `street` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `address_books`
--

INSERT INTO `address_books` (`slug`, `first_name`, `last_name`, `profile_pic`, `email`, `phone`, `street`, `zip_code`, `city_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
('05f4800d-0a18-4c3a-9c90-3eab7bd758f0', 'test first', 'test last', 'profile_6873d2633e8151.77664029.jpg', 'test@gmail.com', '1234567890', 'test street', '380016', 2, '2025-07-13 10:06:03', '2025-07-13 10:06:03', NULL),
('eaa343af-73be-45c8-98c2-d85e11131ad9', 'test first', 'test last', 'profile_6873d2a06004c5.60331214.jpg', 'tes111t@gmail.com', '1234567890', 'test street', '380016', 2, '2025-07-13 10:07:04', '2025-07-13 10:07:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-address_books__', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:3:{i:0;O:22:\"App\\Models\\AddressBook\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:13:\"address_books\";s:13:\"\0*\0primaryKey\";s:4:\"slug\";s:10:\"\0*\0keyType\";s:6:\"string\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:12:{s:4:\"slug\";s:12:\"abc-uuid-123\";s:10:\"first_name\";s:4:\"Test\";s:9:\"last_name\";s:4:\"User\";s:11:\"profile_pic\";s:8:\"test.png\";s:5:\"email\";s:16:\"test@example.com\";s:5:\"phone\";s:10:\"9876543210\";s:6:\"street\";s:11:\"Test Street\";s:8:\"zip_code\";s:6:\"360001\";s:7:\"city_id\";i:1;s:10:\"created_at\";s:19:\"2025-07-13 21:13:06\";s:10:\"updated_at\";s:19:\"2025-07-13 21:13:06\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:12:{s:4:\"slug\";s:12:\"abc-uuid-123\";s:10:\"first_name\";s:4:\"Test\";s:9:\"last_name\";s:4:\"User\";s:11:\"profile_pic\";s:8:\"test.png\";s:5:\"email\";s:16:\"test@example.com\";s:5:\"phone\";s:10:\"9876543210\";s:6:\"street\";s:11:\"Test Street\";s:8:\"zip_code\";s:6:\"360001\";s:7:\"city_id\";i:1;s:10:\"created_at\";s:19:\"2025-07-13 21:13:06\";s:10:\"updated_at\";s:19:\"2025-07-13 21:13:06\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:4:\"city\";O:15:\"App\\Models\\City\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"cities\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:1;s:4:\"name\";s:6:\"Rajkot\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:1;s:4:\"name\";s:6:\"Rajkot\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:9:{i:0;s:10:\"first_name\";i:1;s:9:\"last_name\";i:2;s:5:\"email\";i:3;s:5:\"phone\";i:4;s:6:\"street\";i:5;s:8:\"zip_code\";i:6;s:7:\"city_id\";i:7;s:11:\"profile_pic\";i:8;s:4:\"slug\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:1;O:22:\"App\\Models\\AddressBook\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:13:\"address_books\";s:13:\"\0*\0primaryKey\";s:4:\"slug\";s:10:\"\0*\0keyType\";s:6:\"string\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:12:{s:4:\"slug\";s:36:\"eaa343af-73be-45c8-98c2-d85e11131ad9\";s:10:\"first_name\";s:10:\"test first\";s:9:\"last_name\";s:9:\"test last\";s:11:\"profile_pic\";s:35:\"profile_6873d2a06004c5.60331214.jpg\";s:5:\"email\";s:17:\"tes111t@gmail.com\";s:5:\"phone\";s:10:\"1234567890\";s:6:\"street\";s:11:\"test street\";s:8:\"zip_code\";s:6:\"380016\";s:7:\"city_id\";i:2;s:10:\"created_at\";s:19:\"2025-07-13 15:37:04\";s:10:\"updated_at\";s:19:\"2025-07-13 15:37:04\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:12:{s:4:\"slug\";s:36:\"eaa343af-73be-45c8-98c2-d85e11131ad9\";s:10:\"first_name\";s:10:\"test first\";s:9:\"last_name\";s:9:\"test last\";s:11:\"profile_pic\";s:35:\"profile_6873d2a06004c5.60331214.jpg\";s:5:\"email\";s:17:\"tes111t@gmail.com\";s:5:\"phone\";s:10:\"1234567890\";s:6:\"street\";s:11:\"test street\";s:8:\"zip_code\";s:6:\"380016\";s:7:\"city_id\";i:2;s:10:\"created_at\";s:19:\"2025-07-13 15:37:04\";s:10:\"updated_at\";s:19:\"2025-07-13 15:37:04\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:4:\"city\";O:15:\"App\\Models\\City\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"cities\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:2;s:4:\"name\";s:9:\"Ahmedabad\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:2;s:4:\"name\";s:9:\"Ahmedabad\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:9:{i:0;s:10:\"first_name\";i:1;s:9:\"last_name\";i:2;s:5:\"email\";i:3;s:5:\"phone\";i:4;s:6:\"street\";i:5;s:8:\"zip_code\";i:6;s:7:\"city_id\";i:7;s:11:\"profile_pic\";i:8;s:4:\"slug\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:2;O:22:\"App\\Models\\AddressBook\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:13:\"address_books\";s:13:\"\0*\0primaryKey\";s:4:\"slug\";s:10:\"\0*\0keyType\";s:6:\"string\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:12:{s:4:\"slug\";s:36:\"05f4800d-0a18-4c3a-9c90-3eab7bd758f0\";s:10:\"first_name\";s:10:\"test first\";s:9:\"last_name\";s:9:\"test last\";s:11:\"profile_pic\";s:35:\"profile_6873d2633e8151.77664029.jpg\";s:5:\"email\";s:14:\"test@gmail.com\";s:5:\"phone\";s:10:\"1234567890\";s:6:\"street\";s:11:\"test street\";s:8:\"zip_code\";s:6:\"380016\";s:7:\"city_id\";i:2;s:10:\"created_at\";s:19:\"2025-07-13 15:36:03\";s:10:\"updated_at\";s:19:\"2025-07-13 15:36:03\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:12:{s:4:\"slug\";s:36:\"05f4800d-0a18-4c3a-9c90-3eab7bd758f0\";s:10:\"first_name\";s:10:\"test first\";s:9:\"last_name\";s:9:\"test last\";s:11:\"profile_pic\";s:35:\"profile_6873d2633e8151.77664029.jpg\";s:5:\"email\";s:14:\"test@gmail.com\";s:5:\"phone\";s:10:\"1234567890\";s:6:\"street\";s:11:\"test street\";s:8:\"zip_code\";s:6:\"380016\";s:7:\"city_id\";i:2;s:10:\"created_at\";s:19:\"2025-07-13 15:36:03\";s:10:\"updated_at\";s:19:\"2025-07-13 15:36:03\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:4:\"city\";r:163;}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:9:{i:0;s:10:\"first_name\";i:1;s:9:\"last_name\";i:2;s:5:\"email\";i:3;s:5:\"phone\";i:4;s:6:\"street\";i:5;s:8:\"zip_code\";i:6;s:7:\"city_id\";i:7;s:11:\"profile_pic\";i:8;s:4:\"slug\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1752421460),
('laravel-cache-address_books_1_', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:22:\"App\\Models\\AddressBook\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:13:\"address_books\";s:13:\"\0*\0primaryKey\";s:4:\"slug\";s:10:\"\0*\0keyType\";s:6:\"string\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:12:{s:4:\"slug\";s:12:\"abc-uuid-123\";s:10:\"first_name\";s:4:\"Test\";s:9:\"last_name\";s:4:\"User\";s:11:\"profile_pic\";s:8:\"test.png\";s:5:\"email\";s:16:\"test@example.com\";s:5:\"phone\";s:10:\"9876543210\";s:6:\"street\";s:11:\"Test Street\";s:8:\"zip_code\";s:6:\"360001\";s:7:\"city_id\";i:1;s:10:\"created_at\";s:19:\"2025-07-13 21:13:06\";s:10:\"updated_at\";s:19:\"2025-07-13 21:13:06\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:12:{s:4:\"slug\";s:12:\"abc-uuid-123\";s:10:\"first_name\";s:4:\"Test\";s:9:\"last_name\";s:4:\"User\";s:11:\"profile_pic\";s:8:\"test.png\";s:5:\"email\";s:16:\"test@example.com\";s:5:\"phone\";s:10:\"9876543210\";s:6:\"street\";s:11:\"Test Street\";s:8:\"zip_code\";s:6:\"360001\";s:7:\"city_id\";i:1;s:10:\"created_at\";s:19:\"2025-07-13 21:13:06\";s:10:\"updated_at\";s:19:\"2025-07-13 21:13:06\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:4:\"city\";O:15:\"App\\Models\\City\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"cities\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:1;s:4:\"name\";s:6:\"Rajkot\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:1;s:4:\"name\";s:6:\"Rajkot\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:9:{i:0;s:10:\"first_name\";i:1;s:9:\"last_name\";i:2;s:5:\"email\";i:3;s:5:\"phone\";i:4;s:6:\"street\";i:5;s:8:\"zip_code\";i:6;s:7:\"city_id\";i:7;s:11:\"profile_pic\";i:8;s:4:\"slug\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1752421483),
('laravel-cache-address_books_4_', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1752421476);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Rajkot', NULL, NULL),
(2, 'Ahmedabad', NULL, NULL),
(3, 'Surat', NULL, NULL),
(4, 'Baroda', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"80234ba2-e7b7-4235-a574-f7ada1750dbe\",\"displayName\":\"App\\\\Mail\\\\PromotionalEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:25:\\\"App\\\\Mail\\\\PromotionalEmail\\\":3:{s:5:\\\"entry\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\AddressBook\\\";s:2:\\\"id\\\";O:35:\\\"Ramsey\\\\Uuid\\\\Lazy\\\\LazyUuidFromString\\\":1:{s:6:\\\"string\\\";s:36:\\\"92530e57-a13d-4f1e-b7fb-73b7c1036e27\\\";}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"test@gmail.com\\\";}}s:6:\\\"mailer\\\";s:3:\\\"log\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1752419747,\"delay\":10}', 0, NULL, 1752419757, 1752419747),
(2, 'default', '{\"uuid\":\"51777e80-53f7-4253-936e-57a7675e01bd\",\"displayName\":\"App\\\\Mail\\\\PromotionalEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:25:\\\"App\\\\Mail\\\\PromotionalEmail\\\":3:{s:5:\\\"entry\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\AddressBook\\\";s:2:\\\"id\\\";O:35:\\\"Ramsey\\\\Uuid\\\\Lazy\\\\LazyUuidFromString\\\":1:{s:6:\\\"string\\\";s:36:\\\"05f4800d-0a18-4c3a-9c90-3eab7bd758f0\\\";}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"test@gmail.com\\\";}}s:6:\\\"mailer\\\";s:3:\\\"log\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1752420963,\"delay\":10}', 0, NULL, 1752420973, 1752420963),
(3, 'default', '{\"uuid\":\"072caacc-e3c0-445c-805d-c4ab27b20732\",\"displayName\":\"App\\\\Mail\\\\PromotionalEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:25:\\\"App\\\\Mail\\\\PromotionalEmail\\\":3:{s:5:\\\"entry\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\AddressBook\\\";s:2:\\\"id\\\";O:35:\\\"Ramsey\\\\Uuid\\\\Lazy\\\\LazyUuidFromString\\\":1:{s:6:\\\"string\\\";s:36:\\\"eaa343af-73be-45c8-98c2-d85e11131ad9\\\";}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:17:\\\"tes111t@gmail.com\\\";}}s:6:\\\"mailer\\\";s:3:\\\"log\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1752421024,\"delay\":10}', 0, NULL, 1752421034, 1752421024);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '0001_01_01_000000_create_users_table', 1),
(11, '0001_01_01_000001_create_cache_table', 1),
(12, '0001_01_01_000002_create_jobs_table', 1),
(13, '2025_07_12_102829_create_cities_table', 1),
(14, '2025_07_12_103006_create_address_books_table', 2),
(15, '2025_07_12_103050_create_activity_logs_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ahUgaymscuxnGZkPR1BAJf19uktBkHiMhEQmaKKb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHlSSjNMMU9qUUtEMndqZTIySjVCRHR5d0ZUNGVHcjhSWXRNSWduQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZGRyZXNzYm9vayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1752421424);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `address_books`
--
ALTER TABLE `address_books`
  ADD PRIMARY KEY (`slug`),
  ADD UNIQUE KEY `address_books_email_unique` (`email`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_city` (`city_id`),
  ADD KEY `idx_zip` (`zip_code`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address_books`
--
ALTER TABLE `address_books`
  ADD CONSTRAINT `address_books_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
