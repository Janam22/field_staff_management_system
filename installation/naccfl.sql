-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2025 at 10:31 PM
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
-- Database: `naccfl`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `role_id`) VALUES
(1, 'Janam', 'Pandey', '+9779866077949', 'janampandey2@gmail.com', '2025-02-11-67ab3043027e3.png', '$2y$10$q5mHXA4mgUct1bVoPpblTOJdIKafmV0CQy1RaR8MHLJoX25tBBjnq', 1, NULL, '2023-09-30 04:31:25', '2025-02-16 15:19:47', 1),
(2, 'Prince', 'Yadav', '9813104240', 'prince@bhojmandu.com', '2023-10-09-65241d9daf392.png', '$2y$10$aNvmfwJvPVBlXhGZCLJk2Oqtn5szxGLC1GpX9AFXtBSsRlea22nEe', 0, 'HNowdDUmexgmW8twmQ4pn4172tTgVLOznMXDtubVjdQioK1rcVaNQ3Rt0IVz', '2023-10-09 21:19:53', '2023-10-09 22:07:56', 2),
(3, 'Madhu', NULL, '+9779819295546', 'madhu@bhojmandu.com', '2024-04-04-660e4f25e1696.png', '$2y$10$lqNOnJm77SwJuCsTDxr8jeenissKpOxd7b7y4lcHya0mWZFYhxqdW', 0, 'hGSWvN4U6ktBpdApXCbBHxfBlwFeQSSjFMmkb9v2B3wOs5VgNBy2adzwQ1Ef', '2024-04-04 12:41:37', '2024-04-24 11:24:54', 2),
(4, 'Chandan', 'Sah', '983456666', 'birtamode@bhojmandu.com', '2024-05-10-663e612dc53d3.png', '$2y$10$wUpv/dWojSnWCKt13HOcuOL82HNbI20wg/fHwUmyORuZ0T.KGpB.S', 0, 'hDI2a3aYtpYJ3Fz9HiCwHMy8gqSDfJ0oZwOnm7EpOUu98VGKusT8aKkPGMsD', '2024-05-10 23:47:21', '2024-05-10 23:47:21', 2),
(5, 'Shristi', NULL, '9828367494', 'janam@gmail.com', '2025-01-10-6780b2424a617.png', '$2y$10$q5mHXA4mgUct1bVoPpblTOJdIKafmV0CQy1RaR8MHLJoX25tBBjnq', 1, NULL, '2024-05-19 16:09:05', '2025-02-16 12:24:07', 5);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `modules` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `modules`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL),
(5, 'Staff', '[\"attendance\"]', 1, '2025-01-08 09:19:46', '2025-02-16 19:42:06');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_logs`
--

CREATE TABLE `attendance_logs` (
  `id` int(11) NOT NULL,
  `emp_id` bigint(20) NOT NULL,
  `checkin_time` datetime NOT NULL DEFAULT current_timestamp(),
  `ci_lat` varchar(191) NOT NULL,
  `ci_lon` varchar(191) NOT NULL,
  `checkout_time` datetime DEFAULT NULL,
  `co_lat` varchar(191) DEFAULT NULL,
  `co_lon` varchar(191) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance_logs`
--

INSERT INTO `attendance_logs` (`id`, `emp_id`, `checkin_time`, `ci_lat`, `ci_lon`, `checkout_time`, `co_lat`, `co_lon`, `created_at`, `updated_at`) VALUES
(7, 5, '2025-02-17 03:11:01', '27.72713875677', '85.302016287071', NULL, NULL, NULL, '2025-02-17 03:11:01', '2025-02-17 03:11:01');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(4, 'mail_config', '{\"status\":\"1\",\"name\":\"NACCFL\",\"host\":\"mail.thinktankinfotech.com\",\"driver\":\"smtp\",\"port\":\"465\",\"username\":\"info@thinktankinfotech.com\",\"email_id\":\"info@thinktankinfotech.com\",\"encryption\":\"ssl\",\"password\":\"ThinkTankInfoTech#@21^^??\"}', NULL, '2025-02-16 09:36:29'),
(16, 'business_name', 'Field Staff Management System', NULL, NULL),
(18, 'logo', '2025-02-16-67b1a0b670313.png', NULL, NULL),
(19, 'phone', '+977015153170', NULL, NULL),
(20, 'email_address', 'skbks.nepal@gmail.com', NULL, NULL),
(21, 'address', 'Dhobighat-3 Lalitpur Province -3,Nepal', NULL, NULL),
(22, 'footer_text', 'All Right Reserved', NULL, NULL),
(23, 'customer_verification', '1', NULL, NULL),
(37, 'timezone', 'Asia/Katmandu', NULL, NULL),
(44, 'country', 'NP', NULL, NULL),
(78, 'recaptcha', '{\"status\":\"1\",\"site_key\":\"6Lf8pr0qAAAAABgqOAwm5wLrXmBdr__BFJS2Y6Zu\",\"secret_key\":\"6Lf8pr0qAAAAAEYX6SgutPJ-B3W0L9UnoHIqN3j1\"}', '2025-01-20 16:49:04', '2025-01-20 16:49:04'),
(79, 'language', '[\"en\"]', NULL, '2025-01-05 06:06:19'),
(82, 'icon', '2025-02-16-67b1ab9c9d143.png', NULL, NULL),
(97, 'feature', '[]', NULL, NULL),
(100, 'system_language', '[{\"id\":1,\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":true}]', '2023-07-10 00:56:39', '2025-01-05 06:06:19'),
(134, 'forget_password_mail_status_admin', '1', NULL, NULL),
(153, 'system_php_path', '/usr/bin/php', NULL, NULL),
(193, 'country_picker_status', '0', '2024-07-09 13:53:09', '2024-07-09 13:53:09'),
(194, 'local_storage', '1', '2024-07-09 16:07:20', '2024-07-09 16:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `data_settings`
--

CREATE TABLE `data_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_settings`
--

INSERT INTO `data_settings` (`id`, `key`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'admin_login_url', 'admin', 'login_admin', '2023-06-20 16:55:51', '2023-06-20 16:55:51'),
(2, 'admin_employee_login_url', 'staff', 'login_admin_employee', '2023-06-20 16:55:51', '2023-06-20 16:55:51');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `background_image` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `button_name` varchar(100) DEFAULT NULL,
  `button_url` varchar(255) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `copyright_text` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `email_type` varchar(255) DEFAULT NULL,
  `email_template` varchar(255) DEFAULT NULL,
  `privacy` tinyint(1) NOT NULL DEFAULT 0,
  `refund` tinyint(1) NOT NULL DEFAULT 0,
  `cancelation` tinyint(1) NOT NULL DEFAULT 0,
  `contact` tinyint(1) NOT NULL DEFAULT 0,
  `facebook` tinyint(1) NOT NULL DEFAULT 0,
  `instagram` tinyint(1) NOT NULL DEFAULT 0,
  `twitter` tinyint(1) NOT NULL DEFAULT 0,
  `linkedin` tinyint(1) NOT NULL DEFAULT 0,
  `pinterest` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body_2` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `title`, `body`, `background_image`, `image`, `logo`, `icon`, `button_name`, `button_url`, `footer_text`, `copyright_text`, `type`, `email_type`, `email_template`, `privacy`, `refund`, `cancelation`, `contact`, `facebook`, `instagram`, `twitter`, `linkedin`, `pinterest`, `status`, `created_at`, `updated_at`, `body_2`) VALUES
(1, 'Change Password Request', '<p>The following user has forgotten his password &amp; requested to change/reset their password.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>User Name: {userName}</strong></p>', NULL, NULL, NULL, '2023-10-01-65197b63ad76c.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2025 NACCFL. All rights reserved.', 'admin', 'forget_password', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 18:19:43', '2025-02-16 10:52:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_configs`
--

CREATE TABLE `mail_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `host` varchar(191) NOT NULL,
  `driver` varchar(191) NOT NULL,
  `port` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `encryption` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_05_081114_create_admins_table', 1),
(5, '2021_05_05_102600_create_attributes_table', 1),
(6, '2021_05_05_102742_create_categories_table', 1),
(7, '2021_05_06_102004_create_vendors_table', 1),
(8, '2021_05_06_153204_create_restaurants_table', 1),
(9, '2021_05_08_113436_create_add_ons_table', 2),
(47, '2021_05_08_123446_create_food_table', 10),
(48, '2021_05_08_141209_create_currencies_table', 10),
(49, '2021_05_09_050232_create_orders_table', 10),
(50, '2021_05_09_051907_create_reviews_table', 10),
(51, '2021_05_09_054237_create_order_details_table', 10),
(52, '2021_05_10_105324_create_mail_configs_table', 10),
(53, '2021_05_10_152713_create_business_settings_table', 10),
(54, '2021_05_11_111722_create_banners_table', 11),
(55, '2021_05_11_134442_create_coupons_table', 11),
(56, '2021_05_12_053344_create_conversations_table', 11),
(57, '2021_05_12_055454_create_delivery_men_table', 12),
(58, '2021_05_12_060138_create_d_m_reviews_table', 12),
(59, '2021_05_12_060527_create_track_deliverymen_table', 12),
(60, '2021_05_12_061345_create_email_verifications_table', 12),
(61, '2021_05_12_061454_create_delivery_histories_table', 12),
(62, '2021_05_12_061718_create_wishlists_table', 12),
(63, '2021_05_12_061924_create_notifications_table', 12),
(64, '2021_05_12_062152_create_customer_addresses_table', 12),
(68, '2021_05_12_062412_create_order_delivery_histories_table', 13),
(69, '2021_05_19_115112_create_zones_table', 13),
(70, '2021_05_19_120612_create_restaurant_zone_table', 13),
(71, '2021_06_07_103835_add_column_to_vendor_table', 14),
(73, '2021_06_07_112335_add_column_to_vendors_table', 15),
(74, '2021_06_08_162354_add_column_to_restaurants_table', 16),
(77, '2021_06_09_115719_add_column_to_add_ons_table', 17),
(78, '2021_06_10_091547_add_column_to_coupons_table', 18),
(79, '2021_06_12_070530_rename_banners_table', 19),
(80, '2021_06_12_091154_add_column_on_campaigns_table', 20),
(87, '2021_06_12_091848_create_item_campaigns_table', 21),
(92, '2021_06_13_155531_create_campaign_restaurant_table', 22),
(93, '2021_06_14_090520_add_item_campaign_id_column_to_reviews_table', 23),
(94, '2021_06_14_091735_add_item_campaign_id_column_to_order_details_table', 24),
(95, '2021_06_14_120713_create_new_banners_table', 25),
(96, '2021_06_15_103656_add_zone_id_column_to_banners_table', 26),
(97, '2021_06_16_110322_create_discounts_table', 27),
(100, '2021_06_17_150243_create_withdraw_requests_table', 28),
(103, '2016_06_01_000001_create_oauth_auth_codes_table', 30),
(104, '2016_06_01_000002_create_oauth_access_tokens_table', 30),
(105, '2016_06_01_000003_create_oauth_refresh_tokens_table', 30),
(106, '2016_06_01_000004_create_oauth_clients_table', 30),
(107, '2016_06_01_000005_create_oauth_personal_access_clients_table', 30),
(108, '2021_06_21_051135_add_delivery_charge_to_orders_table', 31),
(110, '2021_06_23_080009_add_role_id_to_admins_table', 32),
(111, '2021_06_27_140224_add_interest_column_to_users_table', 33),
(113, '2021_06_27_142558_change_column_to_restaurants_table', 34),
(114, '2021_06_27_152139_add_restaurant_id_column_to_wishlists_table', 35),
(115, '2021_06_28_142443_add_restaurant_id_column_to_customer_addresses_table', 36),
(118, '2021_06_29_134119_add_schedule_column_to_orders_table', 37),
(122, '2021_06_30_084854_add_cm_firebase_token_column_to_users_table', 38),
(123, '2021_06_30_133932_add_code_column_to_coupons_table', 39),
(127, '2021_07_01_151103_change_column_food_id_from_admin_wallet_histories_table', 40),
(129, '2021_07_04_142159_add_callback_column_to_orders_table', 41),
(131, '2021_07_05_155506_add_cm_firebase_token_to_vendors_table', 42),
(133, '2021_07_05_162404_add_otp_to_orders_table', 43),
(134, '2021_07_13_133941_create_admin_roles_table', 44),
(135, '2021_07_14_074431_add_status_to_delivery_men_table', 45),
(136, '2021_07_14_104102_create_vendor_employees_table', 46),
(137, '2021_07_14_110011_create_employee_roles_table', 46),
(138, '2021_07_15_124141_add_cover_photo_to_restaurants_table', 47),
(143, '2021_06_17_145949_create_wallets_table', 48),
(144, '2021_06_19_052600_create_admin_wallets_table', 48),
(145, '2021_07_19_103748_create_delivery_man_wallets_table', 48),
(146, '2021_07_19_105442_create_account_transactions_table', 48),
(147, '2021_07_19_110152_create_order_transactions_table', 48),
(148, '2021_07_19_134356_add_column_to_notifications_table', 49),
(149, '2021_07_25_125316_add_available_to_delivery_men_table', 50),
(150, '2021_07_25_154722_add_columns_to_restaurants_table', 51),
(151, '2021_07_29_162336_add_schedule_order_column_to_restaurants_table', 52),
(152, '2021_07_31_140756_create_phone_verifications_table', 53),
(153, '2021_08_01_151717_add_column_to_order_transactions_table', 54),
(154, '2021_08_01_163520_add_column_to_admin_wallets_table', 54),
(155, '2021_08_02_141909_change_time_column_to_restaurants_table', 55),
(157, '2021_08_02_183356_add_tax_column_to_restaurants_table', 56),
(158, '2021_08_04_215618_add_zone_id_column_to_restaurants_table', 57),
(159, '2021_08_06_123001_add_address_column_to_orders_table', 58),
(160, '2021_08_06_123326_add_zone_wise_topic_column_to_zones_table', 58),
(161, '2021_08_08_112127_add_scheduled_column_on_orders_table', 59),
(162, '2021_08_08_203108_add_status_column_to_users_table', 60),
(163, '2021_08_11_193805_add_product_discount_ammount_column_to_orders_table', 61),
(165, '2021_08_12_112511_add_addons_column_to_order_details_table', 62),
(166, '2021_08_12_195346_add_zone_id_to_notifications_table', 63),
(167, '2021_08_14_110131_create_user_notifications_table', 64),
(168, '2021_08_14_175657_add_order_count_column_to_foods_table', 65),
(169, '2021_08_14_180044_add_order_count_column_to_users_table', 65),
(170, '2021_08_19_051055_add_earnign_column_to_deliverymen_table', 66),
(171, '2021_08_19_051721_add_original_delivery_charge_column_to_orders_table', 66),
(172, '2021_08_19_055839_create_provide_d_m_earnings_table', 67),
(173, '2021_08_19_112810_add_original_delivery_charge_column_to_order_transactions_table', 67),
(174, '2021_08_19_114851_add_columns_to_delivery_man_wallets_table', 67),
(175, '2021_08_21_162616_change_comission_column_to_restaurants_table', 68),
(176, '2021_06_17_054551_create_soft_credentials_table', 69),
(177, '2021_08_22_232507_add_failed_column_to_orders_table', 69),
(178, '2021_09_04_172723_add_column_reviews_section_to_restaurants_table', 69),
(179, '2021_09_11_164936_change_delivery_address_column_to_orders_table', 70),
(180, '2021_09_11_165426_change_address_column_to_customer_addresses_table', 70),
(181, '2021_09_23_120332_change_available_column_to_delivery_men_table', 71),
(182, '2021_10_03_214536_add_active_column_to_restaurants_table', 72),
(183, '2021_10_04_123739_add_priority_column_to_categories_table', 72),
(184, '2021_10_06_200730_add_restaurant_id_column_to_demiverymen_table', 72),
(185, '2021_10_07_223332_add_self_delivery_column_to_restaurants_table', 72),
(186, '2021_10_11_214123_change_add_ons_column_to_order_details_table', 72),
(187, '2021_10_11_215352_add_adjustment_column_to_orders_table', 72),
(188, '2021_10_24_184553_change_column_to_account_transactions_table', 73),
(189, '2021_10_24_185143_change_column_to_add_ons_table', 73),
(190, '2021_10_24_185525_change_column_to_admin_roles_table', 73),
(191, '2021_10_24_185831_change_column_to_admin_wallets_table', 73),
(192, '2021_10_24_190550_change_column_to_coupons_table', 73),
(193, '2021_10_24_190826_change_column_to_delivery_man_wallets_table', 73),
(194, '2021_10_24_191018_change_column_to_discounts_table', 73),
(195, '2021_10_24_191209_change_column_to_employee_roles_table', 73),
(196, '2021_10_24_191343_change_column_to_food_table', 73),
(197, '2021_10_24_191514_change_column_to_item_campaigns_table', 73),
(198, '2021_10_24_191626_change_column_to_orders_table', 73),
(199, '2021_10_24_191938_change_column_to_order_details_table', 73),
(200, '2021_10_24_192341_change_column_to_order_transactions_table', 73),
(201, '2021_10_24_192621_change_column_to_provide_d_m_earnings_table', 73),
(202, '2021_10_24_192820_change_column_type_to_restaurants_table', 73),
(203, '2021_10_24_192959_change_column_type_to_restaurant_wallets_table', 73),
(204, '2021_11_02_123115_add_delivery_time_column_to_restaurants_table', 74),
(205, '2021_11_02_170217_add_total_uses_column_to_coupons_table', 74),
(206, '2021_12_01_131746_add_status_column_to_reviews_table', 75),
(207, '2021_12_01_135115_add_status_column_to_d_m_reviews_table', 75),
(208, '2021_12_13_125126_rename_comlumn_set_menu_to_food_table', 75),
(209, '2021_12_13_132438_add_zone_id_column_to_admins_table', 75),
(210, '2021_12_18_174714_add_application_status_column_to_delivery_men_table', 75),
(211, '2021_12_20_185736_change_status_column_to_vendors_table', 75),
(212, '2021_12_22_114414_create_translations_table', 75),
(213, '2022_01_05_133920_add_sosial_data_column_to_users_table', 75),
(214, '2022_01_05_172441_add_veg_non_veg_column_to_restaurants_table', 75),
(215, '2022_01_20_151449_add_restaurant_id_column_on_employee_roles_table', 76),
(216, '2022_01_31_124517_add_veg_column_to_item_campaigns_table', 76),
(217, '2022_02_01_101248_change_coupon_code_column_length_to_coupons_table', 76),
(218, '2022_02_01_104336_change_column_length_to_notifications_table', 76),
(219, '2022_02_06_160701_change_column_length_to_item_campaigns_table', 76),
(220, '2022_02_06_161110_change_column_length_to_campaigns_table', 76),
(221, '2022_02_07_091359_add_zone_id_column_on_orders_table', 76),
(222, '2022_02_07_101547_change_name_column_to_categories_table', 76),
(223, '2022_02_07_152844_add_zone_id_column_to_order_transactions_table', 76),
(224, '2022_02_07_162330_add_zone_id_column_to_users_table', 76),
(225, '2022_02_07_173644_add_column_to_food_table', 76),
(226, '2022_02_07_181314_add_column_to_delivery_men_table', 76),
(227, '2022_02_07_183001_add_total_order_count_column_to_restaurants_table', 76),
(228, '2022_01_19_060356_create_restaurant_schedule_table', 77),
(229, '2022_03_31_103418_create_wallet_transactions_table', 78),
(230, '2022_03_31_103827_create_loyalty_point_transactions_table', 78),
(231, '2022_04_09_161150_add_wallet_point_columns_to_users_table', 78),
(232, '2022_04_12_121040_create_social_media_table', 78),
(233, '2022_04_17_140353_change_column_transaction_referance_to_orders_table', 78),
(234, '2022_04_10_030533_create_newsletters_table', 79),
(235, '2022_05_14_122133_add_dm_tips_column_to_orders_table', 80),
(236, '2022_05_14_122603_add_dm_tips_column_to_order_transactions_table', 80),
(237, '2022_05_14_131338_add_processing_time_column_to_orders_table', 80),
(238, '2022_05_17_153333_add_ref_code_to_users_table', 80),
(239, '2022_05_22_162129_add_new_columns_to_customer_addresses_table', 80),
(240, '2022_06_26_170341_add_delivery_fee_comission_to_ordertransactions', 80),
(241, '2022_06_29_112637_add_delivery_fee_column_to_zones_table', 80),
(242, '2022_06_29_125553_add_rename_delivery_charge_column_to_restaurants_table', 80),
(243, '2022_06_29_151416_create_time_logs_table', 80),
(244, '2022_07_31_103626_add_free_delivery_by_column_to_orders_table', 81),
(245, '2022_08_06_122044_create_user_infos_table', 82),
(246, '2022_08_06_124645_create_messages_table', 82),
(247, '2022_08_16_095504_update_converstions_table', 82),
(248, '2022_09_13_113428_change_data_column_to_user_notifications_table', 83),
(249, '2022_09_20_002050_create_refunds_table', 84),
(250, '2022_09_20_050949_add_refund_request_cancel_column_to_orders_table', 84),
(251, '2022_09_20_233442_create_refund_reasons_table', 84),
(252, '2022_09_29_095242_create_subscription_packages_table', 84),
(253, '2022_09_29_101701_create_restaurant_subscriptions_table', 84),
(254, '2022_09_29_102521_create_subscription_transactions_table', 84),
(255, '2022_10_04_094314_add_restaurant_model_column_to_restaurants_table', 84),
(256, '2022_11_05_105722_alter_table_order_details_change_variation', 84),
(257, '2022_11_13_144443_create_contact_messages_table', 84),
(258, '2022_11_16_091912_create_expenses_table', 84),
(259, '2022_11_16_092235_add_expense_column_to_order_transactions_table', 84),
(260, '2023_01_05_153438_add_status_col_to_campaign_restaurant_table', 85),
(261, '2023_01_07_162303_add_maximum_delivery_charge_col_to_zones_table', 85),
(262, '2023_01_07_162740_add_maximum_delivery_charge_col_to_restaurants_table', 85),
(263, '2023_01_08_104102_create_vehicles_table', 85),
(264, '2023_01_08_124859_add_vehicle_id_col_to_delivery_men_table', 85),
(265, '2023_01_08_152910_create_tags_table', 85),
(266, '2023_01_08_153321_create_food_tags_table', 85),
(267, '2023_01_09_115851_add_max_cod_order_amount_col_to_zones_table', 85),
(268, '2023_01_09_132704_create_order_cancel_reasons_table', 85),
(269, '2023_01_09_132841_add_cancellation_reason_col_to_orders_table', 85),
(270, '2023_01_09_173540_add_recommended_col_to_foods_table', 85),
(271, '2023_01_09_180114_create_cuisines_table', 85),
(272, '2023_01_09_180928_add_cuisine_id_col_to_restaurants_table', 85),
(273, '2023_01_10_112851_alter_refund_amount_col_to_refunds_table', 85),
(274, '2023_01_10_175439_add_tax_status_col_to_orders_table', 85),
(275, '2023_01_11_142252_add_customer_id_col_to_coupons_table', 85),
(276, '2023_01_12_142420_add_restaurant_id_col_to_expenses_table', 85),
(277, '2023_01_12_143506_add_restaurant_expense_col_to_order_transactions_table', 85),
(278, '2023_01_12_145658_add_coupon_created_by_col_to_orders_table', 85),
(279, '2023_01_14_103226_add_slug_by_col_to_campaigns_table', 85),
(280, '2023_01_14_105544_add_slug_col_to_categories_table', 85),
(281, '2023_01_14_105607_add_slug_by_col_to_restaurants_table', 85),
(282, '2023_01_24_152947_add_vehicle_id_col_to_orders_table', 85),
(283, '2023_01_25_133959_add_slug_col_to_food_table', 85),
(284, '2023_01_25_145750_add_slug_col_to_item_campaigns_table', 85),
(285, '2023_01_28_100238_remane_discription_col_to__order_id_to_expenses_table', 85),
(286, '2023_01_28_100425_add_description_col_to_expenses_table', 85),
(287, '2023_01_28_161813_create_cuisine_restaurants_table', 85),
(288, '2023_01_28_185144_remove_col_cuisine_id_from_restaurant_table', 85),
(289, '2023_01_30_121227_add_col_to_discount_on_product_by_order_table', 85),
(290, '2023_02_01_114155_add_distance_col_to_orders_table', 85),
(291, '2023_02_01_151408_add_commission_percentage_col_to_order_transactions_table', 85),
(292, '2023_02_01_182929_add_discount_amount_by_restaurant_col_to_order_transactions_table', 85),
(293, '2023_02_06_121643_add_fcm_token_web_to_vendors_table', 85),
(294, '2023_02_08_113749_add_ref_by_col_to_users_table', 86),
(295, '2023_02_08_163747_create_withdrawal_methods_table', 86),
(296, '2023_02_08_165109_add_cols_to_withdraw_requests_table', 86),
(297, '2023_02_14_112313_create_incentive_logs_table', 86),
(298, '2023_02_14_112417_create_incentives_table', 86),
(299, '2023_02_14_165851_add_delivery_man_id_col_to_wallet_transactions_table', 86),
(300, '2023_02_14_172250_change_amount_col_to_expenses_table', 86),
(301, '2023_02_15_131107_add_otp_hit_count_cols_in_phone_verifications_table', 86),
(302, '2023_02_16_104809_add_hit_count_at_col_in_password_resets_table', 86),
(303, '2023_02_16_123420_add_increased_delivery_fee_in_zones_table', 86),
(304, '2023_02_16_145350_create_shifts_table', 86),
(305, '2023_02_16_145830_add_shift_id_col_to_time_logs_table', 86),
(306, '2023_02_16_145934_add_shift_id_col_to_delivery_men_table', 86),
(307, '2023_02_18_070327_create_subscriptions_table', 86),
(308, '2023_02_18_070628_create_subscription_logs_table', 86),
(309, '2023_02_18_070757_create_subscription_pauses_table', 86),
(310, '2023_02_18_070826_create_subscription_schedules_table', 86),
(311, '2023_02_18_071042_add_subscription_id_col_to_order_table', 86),
(312, '2023_02_18_071609_add_is_subscription_order_col_to_order_transactions_table', 86),
(313, '2023_02_19_164536_create_visitor_logs_table', 86),
(314, '2023_03_11_120645_add_temp_block_time_col_to_phone_verifications_table', 86),
(315, '2023_03_11_121000_add_temp_block_time_col_to_password_resets_table', 86),
(316, '2023_03_16_163907_add_order_subscription_col_in_restaurant_table', 86),
(317, '2023_03_18_121906_add_order_cancel_note_col_in_orders_table', 86),
(318, '2023_03_18_144849_add_temp_token_col_in_users_table', 86),
(319, '2023_03_19_153620_add_increase_delivery_charge_message_col_in_zones_table', 86),
(320, '2023_03_13_144714_create_logs_table', 87),
(321, '2023_04_08_132653_add_created_by_col_to_password_resets_table', 87),
(322, '2023_04_17_112228_create_notification_messages_table', 87),
(323, '2023_05_07_155839_change_delivery_charge_col_in_admin_wallets_table', 87),
(324, '2023_05_10_162452_create_admin_testimonials_table', 87),
(325, '2023_05_10_184114_create_data_settings_table', 87),
(326, '2023_05_13_115610_create_admin_features_table', 87),
(327, '2023_05_14_092428_create_react_services_table', 87),
(328, '2023_05_14_104308_create_react_promotional_banners_table', 87),
(329, '2023_05_18_161133_create_email_templates_table', 87),
(330, '2023_05_31_154309_create_admin_special_criterias_table', 87),
(331, '2023_06_11_040112_add_cutlery_col_in_orders_table', 87),
(332, '2023_06_11_171524_change_delivery_time_col_in_restaurants_table', 87),
(333, '2023_06_13_112622_add_cutlery_on_restaurants_table', 87),
(334, '2023_07_05_135741_add_service_charge_col_to_orders_table', 88),
(335, '2023_07_05_145800_add_service_charge_col_to_order_transactions_table', 88),
(336, '2023_07_25_130949_create_wallet_payments_table', 88),
(337, '2023_07_25_131036_create_wallet_bonuses_table', 88),
(338, '2023_07_25_131958_add_user_id_col_expenses_table', 88),
(339, '2023_07_26_171058_create_order_payments_table', 88),
(340, '2023_07_31_235517_add_maximum_cart_quantity_col_to_food', 88),
(341, '2023_07_31_235555_add_maximum_cart_quantity_col_to_item_campaigns', 88),
(342, '2023_08_02_043239_add_meta_data_to_restaurants_table', 88),
(343, '2023_08_05_232205_add_payment_status_to_subscription_transactions_table', 88),
(344, '0000_00_00_000000_create_websockets_statistics_entries_table', 89),
(345, '2023_08_30_130431_create_offline_payment_methods_table', 89),
(346, '2023_08_30_130446_create_offline_payments_table', 89),
(347, '2023_08_30_162632_add_announcement_cols_to_restaurants_table', 89),
(348, '2023_08_30_171559_create_guests_table', 89),
(349, '2023_08_30_181336_add_is_guest_col_to_orders_table', 89),
(350, '2023_09_03_174650_add_qr_code_col_to_restaurants_table', 89),
(351, '2023_10_02_114519_create_carts_table', 89),
(352, '2023_10_04_142129_add_free_delivery_distance_col_to_restaurants_table', 89),
(353, '2023_10_18_124954_create_restaurant_configs_table', 89),
(354, '2023_10_19_093057_create_restaurant_tags_table', 89),
(355, '2023_10_22_183705_add_additional_data_col_in_restaurants_table', 89),
(356, '2023_10_25_173519_add_additional_data_col_to_delivery_men_table', 89),
(357, '2023_10_26_105254_change_name_col_on_user_infos', 89),
(358, '2023_10_29_114625_add_created_by_col_to_account_transactions_table', 89),
(359, '2023_10_29_161701_create_disbursements_table', 89),
(360, '2023_10_29_161757_create_disbursement_details_table', 89),
(361, '2023_10_29_183055_create_disbursement_withdrawal_methods_table', 89),
(362, '2023_10_30_093234_add_type_col_to_withdraw_requests_table', 89),
(363, '2023_11_21_132325_add_current_language_key_col_to_users_table', 89),
(364, '2024_03_09_094824_add_is_default_col_to_order_cancel_reasons_table', 90),
(365, '2024_03_19_124736_add_halal_tag_status_col_to_restaurant_configs_table', 90),
(366, '2024_03_19_132910_add_is_halal_col_to_food_table', 90),
(367, '2024_03_21_113032_add_body_2_col_to_email_templates', 90),
(368, '2024_04_21_041436_create_cash_backs_table', 90),
(369, '2024_04_21_042152_create_cash_back_histories_table', 90),
(370, '2024_04_21_115033_add_cashback_ref_amount_cols_to_orders_table', 90),
(371, '2024_04_21_115411_add_extra_packaging_cols_to_restaurant_configs_table', 90),
(372, '2024_04_21_124756_add_extra_packaging_ref_bonus_amount_col_to_order_transactions_table', 90),
(373, '2024_04_21_134012_add_reply_col_to_reviews_table', 90),
(374, '2024_04_22_112655_create_variations_table', 90),
(375, '2024_04_22_112708_create_variation_options_table', 90),
(376, '2024_04_22_115714_create_characteristics_table', 90),
(377, '2024_04_22_115813_create_characteristic_restaurants_table', 90),
(378, '2024_04_22_164150_add_stock_col_to_food_table', 90),
(379, '2024_04_24_115636_create_priority_lists_table', 90),
(380, '2024_04_24_124714_add_variation_option_col_on_cart_table', 90),
(381, '2024_04_24_173317_add_stock_col_to_add_ons_table', 90),
(382, '2024_06_06_115927_create_storages_table', 91),
(383, '2024_06_08_114756_create_advertisements_table', 91),
(384, '2024_06_15_130020_create_notification_settings_table', 91),
(385, '2024_06_26_044400_add_change_file_col_to_messages_table', 91),
(386, '2024_06_30_030925_create_restaurant_notification_settings_table', 91),
(387, '2024_08_12_154153_create_cache_table', 92),
(388, '2024_08_24_110338_add_some_new_cols_to_restaurant_subscriptions_table', 92),
(389, '2024_08_24_111725_add_some_new_cols_to_subscription_transactions_table', 92),
(390, '2024_08_25_175919_create_subscription_billing_and_refund_histories_table', 92),
(391, '2024_09_30_154821_add_is_email_verified_col_to_users_table', 92),
(392, '2024_10_01_164138_add_package_id_col_to_restaurants_table', 92),
(393, '2024_10_03_153429_add_display_name_col_to_zones_table', 92),
(394, '2024_10_05_001615_create_allergies_table', 92),
(395, '2024_10_05_001629_create_nutritions_table', 92),
(396, '2024_10_05_001848_create_allergy_food_table', 92),
(397, '2024_10_05_001952_create_food_nutrition_table', 92),
(398, '2024_10_19_134056_add_phone_col_to_password_resets_table', 92),
(399, '2025_01_06_142701_create_countries_table', 93);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'qFAwGhxq8A6SDmolyxZunXyQ4mxOH0jEezXsgaxP', NULL, 'http://localhost', 1, 0, 0, '2021-06-19 03:27:59', '2021-06-19 03:27:59'),
(2, NULL, 'Laravel Password Grant Client', 'qdV021R3MGGAwRxvvqG0mWgnypwzolzusBq1L5W6', 'users', 'http://localhost', 0, 1, 0, '2021-06-19 03:27:59', '2021-06-19 03:27:59'),
(3, NULL, 'Knockdoor', 'Wrfu8JExrbjXmFA4xAGMITy7F7weF2C7vTnqXqRE', NULL, 'http://localhost', 1, 0, 0, '2025-01-26 11:58:34', '2025-01-26 11:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-06-19 03:27:59', '2021-06-19 03:27:59'),
(2, 3, '2025-01-26 11:58:34', '2025-01-26 11:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint(4) NOT NULL DEFAULT 0,
  `is_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL,
  `created_by` varchar(50) DEFAULT 'user',
  `phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `storages`
--

CREATE TABLE `storages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_type` varchar(255) NOT NULL,
  `data_id` varchar(100) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `storages`
--

INSERT INTO `storages` (`id`, `data_type`, `data_id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\BusinessSetting', '160', NULL, 'public', '2025-01-10 08:33:02', '2025-01-10 08:33:02'),
(10, 'App\\Models\\BusinessSetting', '118', NULL, 'public', '2024-12-31 10:12:57', '2024-12-31 10:12:57'),
(21, 'App\\Models\\BusinessSetting', '198', NULL, 'public', '2024-10-21 15:26:16', '2024-10-21 15:26:16'),
(22, 'App\\Models\\BusinessSetting', '199', NULL, 'public', '2024-10-21 15:26:16', '2024-10-21 15:26:16'),
(23, 'App\\Models\\BusinessSetting', '200', NULL, 'public', '2024-12-31 06:24:18', '2024-12-31 06:24:18'),
(24, 'App\\Models\\BusinessSetting', '196', NULL, 'public', '2025-01-28 05:41:21', '2025-01-28 05:41:21'),
(25, 'App\\Models\\BusinessSetting', '100', NULL, 'public', '2025-01-05 06:05:29', '2025-01-05 06:05:29'),
(26, 'App\\Models\\BusinessSetting', '79', NULL, 'public', '2025-01-05 06:06:19', '2025-01-05 06:06:19'),
(27, 'App\\Models\\BusinessSetting', '53', NULL, 'public', '2025-01-07 06:39:43', '2025-01-07 06:39:43'),
(28, 'App\\Models\\DataSetting', '108', NULL, 'public', '2025-01-07 06:07:10', '2025-01-07 06:07:10'),
(29, 'App\\Models\\DataSetting', '109', NULL, 'public', '2025-01-07 06:07:10', '2025-01-07 06:07:10'),
(30, 'App\\Models\\DataSetting', '110', NULL, 'public', '2025-01-07 06:07:10', '2025-01-07 06:07:10'),
(32, 'App\\Models\\Admin', '1', 'image', 'public', '2025-02-11 11:10:59', '2025-02-11 11:10:59'),
(33, 'App\\Models\\Admin', '5', 'image', 'public', '2025-01-10 05:38:10', '2025-01-10 05:38:10');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `translationable_type` varchar(255) NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `translationable_type`, `translationable_id`, `locale`, `key`, `value`, `created_at`, `updated_at`) VALUES
(111, 'App\\Models\\EmailTemplate', 1, 'en', 'title', 'Change Password Request', NULL, NULL),
(112, 'App\\Models\\EmailTemplate', 1, 'en', 'body', '<p>The following user has forgotten his password &amp; requested to change/reset their password.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>User Name: {userName}</strong></p>', NULL, NULL),
(113, 'App\\Models\\EmailTemplate', 1, 'en', 'button_name', '', NULL, NULL),
(114, 'App\\Models\\EmailTemplate', 1, 'en', 'footer_text', 'Footer Text Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(115, 'App\\Models\\EmailTemplate', 1, 'en', 'copyright_text', '© 2023 NACCFL. All rights reserved.', NULL, NULL),
(156, 'App\\Models\\EmailTemplate', 28, 'en', 'title', 'Reset Your Password', NULL, NULL),
(157, 'App\\Models\\EmailTemplate', 28, 'en', 'body', '<p>Please click on this link to reset your Password&nbsp;&rarr;</p>', NULL, NULL),
(158, 'App\\Models\\EmailTemplate', 28, 'en', 'button_name', '', NULL, NULL),
(159, 'App\\Models\\EmailTemplate', 28, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(160, 'App\\Models\\EmailTemplate', 28, 'en', 'copyright_text', '© 2024 Knockdoor. All rights reserved.', NULL, NULL),
(3921, 'App\\Models\\AdminRole', 5, 'en', 'name', 'Staff', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `data_settings`
--
ALTER TABLE `data_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `mail_configs`
--
ALTER TABLE `mail_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `storages`
--
ALTER TABLE `storages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `storages_data_id_index` (`data_id`),
  ADD KEY `storages_value_index` (`value`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `data_settings`
--
ALTER TABLE `data_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_configs`
--
ALTER TABLE `mail_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `storages`
--
ALTER TABLE `storages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3928;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
