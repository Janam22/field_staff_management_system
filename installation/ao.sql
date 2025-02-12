-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2025 at 01:04 PM
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
-- Database: `ao`
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
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`) VALUES
(1, 'Janam', 'Pandey', '+9779866077949', 'janampandey2@gmail.com', '2025-02-11-67ab3043027e3.png', '$2y$10$q5mHXA4mgUct1bVoPpblTOJdIKafmV0CQy1RaR8MHLJoX25tBBjnq', NULL, '2023-09-30 04:31:25', '2025-02-11 11:10:59', 1),
(2, 'Prince', 'Yadav', '9813104240', 'prince@bhojmandu.com', '2023-10-09-65241d9daf392.png', '$2y$10$aNvmfwJvPVBlXhGZCLJk2Oqtn5szxGLC1GpX9AFXtBSsRlea22nEe', 'HNowdDUmexgmW8twmQ4pn4172tTgVLOznMXDtubVjdQioK1rcVaNQ3Rt0IVz', '2023-10-09 21:19:53', '2023-10-09 22:07:56', 2),
(3, 'Madhu', NULL, '+9779819295546', 'madhu@bhojmandu.com', '2024-04-04-660e4f25e1696.png', '$2y$10$lqNOnJm77SwJuCsTDxr8jeenissKpOxd7b7y4lcHya0mWZFYhxqdW', 'hGSWvN4U6ktBpdApXCbBHxfBlwFeQSSjFMmkb9v2B3wOs5VgNBy2adzwQ1Ef', '2024-04-04 12:41:37', '2024-04-24 11:24:54', 2),
(4, 'Chandan', 'Sah', '983456666', 'birtamode@bhojmandu.com', '2024-05-10-663e612dc53d3.png', '$2y$10$wUpv/dWojSnWCKt13HOcuOL82HNbI20wg/fHwUmyORuZ0T.KGpB.S', 'hDI2a3aYtpYJ3Fz9HiCwHMy8gqSDfJ0oZwOnm7EpOUu98VGKusT8aKkPGMsD', '2024-05-10 23:47:21', '2024-05-10 23:47:21', 2),
(5, 'Shristi', NULL, '9828367494', 'janam@gmail.com', '2025-01-10-6780b2424a617.png', '$2y$10$q5mHXA4mgUct1bVoPpblTOJdIKafmV0CQy1RaR8MHLJoX25tBBjnq', NULL, '2024-05-19 16:09:05', '2025-01-10 05:38:10', 5);

-- --------------------------------------------------------

--
-- Table structure for table `admin_features`
--

CREATE TABLE `admin_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sub_title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_features`
--

INSERT INTO `admin_features` (`id`, `title`, `sub_title`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, '24h Support', NULL, '24/7 customer support service to support you.', '2023-10-01-65187a25b2aa6.png', 1, '2023-09-08 15:29:24', '2023-10-01 01:27:29'),
(2, 'Easy Payment', NULL, 'Smart and easy payment system to maintain your business.', '2023-10-01-65187a19c99d9.png', 1, '2023-09-08 15:41:25', '2023-10-01 01:27:17'),
(3, 'Fast Delivery', NULL, 'Fastest delivery system to reach your customer.', '2023-10-01-65187a0f2a2b0.png', 1, '2023-09-08 15:42:02', '2023-10-01 01:27:07'),
(4, 'Resonable Price', NULL, 'Start your business in cheap cost. In your budget', '2023-10-01-651879f68a2cd.png', 1, '2023-09-08 15:42:46', '2023-10-01 01:26:42');

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
(5, 'Role for Employee', '[\"contact_message\",\"customerList\"]', 1, '2025-01-08 09:19:46', '2025-01-08 09:59:53');

-- --------------------------------------------------------

--
-- Table structure for table `admin_special_criterias`
--

CREATE TABLE `admin_special_criterias` (
  `title` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `data` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `type`, `image`, `status`, `data`, `created_at`, `updated_at`, `zone_id`) VALUES
(9, 'Pizza Offer', 'general_wise', '2024-05-16-6645c7cceb7e8.png', 0, '6', '2024-05-16 14:31:04', '2024-06-15 18:26:50', 2),
(10, 'Order more', 'general_wise', '2024-05-16-6645c801843c3.png', 1, '3', '2024-05-16 14:31:57', '2024-05-16 14:31:57', 2),
(11, 'new', 'general_wise', '2024-05-16-6645c81746eae.png', 0, '9', '2024-05-16 14:32:19', '2024-06-15 18:27:24', 2),
(12, 'lunch box', 'general_wise', '2024-05-17-66475670f3408.png', 0, '22', '2024-05-17 18:51:56', '2024-06-15 18:27:31', 2),
(13, 'Cashback dhamak', 'general_wise', '2024-05-20-664a66bb9164c.png', 0, '2', '2024-05-20 02:35:15', '2024-05-22 00:36:46', 2),
(14, 'Cashback Dhamaka', 'general_wise', '2024-05-22-664ced395dc92.png', 0, '2', '2024-05-22 00:36:37', '2024-06-03 03:00:16', 2),
(16, 'Imepay', 'general_wise', '2024-06-03-665d8550c6206.png', 0, '2', '2024-06-03 14:41:48', '2024-06-29 11:17:00', 2),
(17, 'food music', 'general_wise', '2024-06-06-6661870b4bba7.png', 0, '2', '2024-06-06 15:38:15', '2024-06-15 18:26:43', 2),
(18, 'food music', 'general_wise', '2024-06-06-6661870c6441b.png', 0, '2', '2024-06-06 15:38:16', '2024-06-06 16:49:52', 2),
(20, 'Barsha offer', 'general_wise', '2024-06-27-667d3eda86d9f.png', 1, '2', '2024-06-27 16:13:42', '2024-06-27 16:13:42', 2),
(21, 'Load & Earn', 'general_wise', '2024-07-09-668d162b30d01.png', 1, '2', '2024-07-07 21:02:45', '2024-07-09 16:36:23', 2),
(22, 'New Product Launch', 'general_wise', '2025-01-13-6784fd42b2758.png', 1, '2023', '2025-01-13 11:47:14', '2025-01-13 12:05:13', 2);

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
(4, 'mail_config', '{\"status\":\"1\",\"name\":\"Knockdoor\",\"host\":\"mail.thinktankinfotech.com\",\"driver\":\"smtp\",\"port\":\"465\",\"username\":\"info@thinktankinfotech.com\",\"email_id\":\"info@thinktankinfotech.com\",\"encryption\":\"ssl\",\"password\":\"ThinkTankInfoTech#@21^^??\"}', NULL, '2025-01-20 16:30:55'),
(15, 'terms_and_conditions', NULL, NULL, '2021-06-29 06:44:49'),
(16, 'business_name', 'Test Website', NULL, NULL),
(18, 'logo', '2023-11-18-6558f60091cf0.png', NULL, NULL),
(19, 'phone', '+9779866077949', NULL, NULL),
(20, 'email_address', 'test@gmail.com', NULL, NULL),
(21, 'address', 'Kathmandu-30, Nepal', NULL, NULL),
(22, 'footer_text', 'All Right Reserved', NULL, NULL),
(23, 'customer_verification', '1', NULL, NULL),
(24, 'map_api_key', 'AIzaSyDGVJSeSmirQdGNkTWfabmY7X544D2Z4iY', NULL, NULL),
(25, 'privacy_policy', NULL, NULL, '2021-06-28 09:46:55'),
(26, 'about_us', NULL, NULL, '2021-06-29 06:43:25'),
(37, 'timezone', 'Asia/Katmandu', NULL, NULL),
(44, 'country', 'NP', NULL, NULL),
(46, 'default_location', '{\"lat\":\"27.7129063\",\"lng\":\"85.3519836\"}', NULL, NULL),
(53, 'maintenance_mode', '0', '2021-09-09 21:33:55', '2025-01-07 06:39:43'),
(65, 'landing_page_text', '{\"header_title_1\":\"Food App\",\"header_title_2\":\"Why stay hungry when you can order from StackFood\",\"header_title_3\":\"Get 10% OFF on your first order\",\"about_title\":\"StackFood is Best Delivery Service Near You\",\"why_choose_us\":\"Why Choose Us?\",\"why_choose_us_title\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\",\"testimonial_title\":\"Trusted by Customer & Restaurant Owner\",\"footer_article\":\"Suspendisse ultrices at diam lectus nullam. Nisl, sagittis viverra enim erat tortor ultricies massa turpis. Arcu pulvinar.\"}', '2021-10-31 15:21:57', '2021-10-31 15:21:57'),
(66, 'landing_page_links', '{\"app_url_android_status\":\"1\",\"app_url_android\":\"http:\\/\\/onelink.to\\/bhojmandu\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"http:\\/\\/onelink.to\\/bhojmandu\",\"web_app_url_status\":\"1\",\"web_app_url\":\"http:\\/\\/onelink.to\\/bhojmandu\",\"order_now_url_status\":null,\"order_now_url\":null}', '2021-10-31 15:21:57', '2021-10-31 15:21:57'),
(68, 'testimonial', '[{\"img\":\"2021-10-28-617aa5a9e4b4a.png\",\"name\":\"Barry Allen\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A\\r\\n                    aliquam amet animi blanditiis consequatur debitis dicta\\r\\n                    distinctio, enim error eum iste libero modi nam natus\\r\\n                    perferendis possimus quasi sint sit tempora voluptatem. Est,\\r\\n                    exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"2021-10-28-617aa9b13c57b.png\",\"name\":\"Sophia Martino\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"2021-10-28-617aa9db9752d.png\",\"name\":\"Alan Turing\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"2021-10-28-617aa9faa8c78.png\",\"name\":\"Ann Marie\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"}]', '2021-10-31 15:21:57', '2021-10-31 15:21:57'),
(71, 'timeformat', '24', NULL, NULL),
(78, 'recaptcha', '{\"status\":\"1\",\"site_key\":\"6Lf8pr0qAAAAABgqOAwm5wLrXmBdr__BFJS2Y6Zu\",\"secret_key\":\"6Lf8pr0qAAAAAEYX6SgutPJ-B3W0L9UnoHIqN3j1\"}', '2025-01-20 16:49:04', '2025-01-20 16:49:04'),
(79, 'language', '[\"en\"]', NULL, '2025-01-05 06:06:19'),
(81, 'digit_after_decimal_point', '0', NULL, NULL),
(82, 'icon', '2023-09-30-651808696a411.png', NULL, NULL),
(97, 'feature', '[]', NULL, NULL),
(99, 'site_direction', 'ltr', '2023-03-20 04:07:28', '2023-03-20 04:07:28'),
(100, 'system_language', '[{\"id\":1,\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":true}]', '2023-07-10 00:56:39', '2025-01-05 06:06:19'),
(106, 'cookies_text', 'Cookies', NULL, NULL),
(107, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"392355796942-r2drt6591gukri46tfbt26hq17d3fm1d.apps.googleusercontent.com\",\"client_secret\":\"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\",\"status\":\"1\"},{\"login_medium\":\"facebook\",\"client_id\":\"0091840060f0ad9a00a6169da9ada5f3\",\"client_secret\":\"ac246c78ce89958c50045bb73c1d13bc\",\"status\":\"1\"}]', '2023-09-06 23:04:50', '2024-12-31 06:08:20'),
(108, 'apple_login', '[{\"login_medium\":\"apple\",\"client_id\":\"YSF8BDNV95\",\"client_secret\":null,\"status\":null,\"team_id\":\"YSF8BDNV95\",\"key_id\":\"FQY743MK9P\",\"service_file\":\"2023-10-16-652c42737cf91.p8\",\"redirect_url\":null}]', '2023-09-06 23:04:50', '2024-05-15 15:10:31'),
(115, 'pm_picture_upload_status', '1', NULL, NULL),
(117, 'landing_page', '1', '2023-09-08 15:23:08', '2024-02-09 04:25:41'),
(119, 'map_api_key_server', 'AIzaSyDGVJSeSmirQdGNkTWfabmY7X544D2Z4iY', NULL, NULL),
(123, 'backgroundChange', '{\"primary_1_hex\":\"#ff0000\",\"primary_1_rgb\":\"255, 0, 0\",\"primary_2_hex\":\"#ff0000\",\"primary_2_rgb\":\"255, 0, 0\"}', NULL, NULL),
(133, 'landing_integration_type', 'none', NULL, NULL),
(134, 'forget_password_mail_status_admin', '1', NULL, NULL),
(135, 'landing_page_images', '{\"top_content_image\":\"double_screen_image.png\",\"about_us_image\":\"about_us_image.png\"}', '2023-11-25 12:28:16', '2023-11-25 12:28:16'),
(153, 'system_php_path', '/usr/bin/php', NULL, NULL),
(193, 'country_picker_status', '0', '2024-07-09 13:53:09', '2024-07-09 13:53:09'),
(194, 'local_storage', '1', '2024-07-09 16:07:20', '2024-07-09 16:07:20'),
(195, '3rd_party_storage', '0', '2024-07-09 16:07:20', '2024-07-09 16:07:20'),
(206, 'email_verification_status', '1', NULL, NULL),
(207, 'phone_verification_status', '1', NULL, NULL);

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
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `reply` text DEFAULT NULL,
  `feedback` varchar(255) DEFAULT '0',
  `seen` tinyint(1) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `reply`, `feedback`, `seen`, `status`, `created_at`, `updated_at`) VALUES
(517, 'SylviaWar', '20xrumer2@farironalds.com', NULL, NULL, 'Roulette is more than just a game of chance; it\'s a captivating experience that offers endless possibilities. Imagine the rush of placing your bet on red or black and watching the wheel spin in anticipation. Whether you\'re a beginner or a seasoned player, roulette promises excitement and the chance to win big. Embrace the challenge, learn the strategies, and enjoy the thrill of this iconic casino game. Start your journey with <a href=https://usacasinohub.com/roulette/>roulette simulator</a> today and let the excitement of the wheel propel you towards unforgettable wins!', NULL, '0', 0, 1, '2024-07-03 23:52:32', '2024-07-03 23:52:32'),
(518, 'Mike Wallace', 'mikefrentee@gmail.com', NULL, NULL, 'Hi there, \r\n \r\nWhile checking your bhojmandu.com for its ranks, I have noticed that there are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.hilkom-seo.com/free-links-cleanup/ \r\n \r\nIt really works, get a free backlinks clean up with us today \r\n \r\n \r\nRegards \r\nMike Wallace\r\n \r\nWhatsapp: https://www.hilkom-seo.com/whatsapp-us/', NULL, '0', 0, 1, '2024-07-04 00:27:52', '2024-07-04 00:27:52'),
(519, 'Mike Baker', 'mikefrentee@gmail.com', NULL, NULL, 'After reviewing your domain in MOZ, it has come to my attention that you may benefit from an increase in authority. \r\n \r\nOur solution will give you a high-quality domain authority score in three months. This will increase your organic visibility and strengthen your website authority, thus strengthening it against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkey-seo.com/moz-authority-seo/ \r\n \r\n \r\nThanks and regards \r\nMike Baker\r\nMonkey Digital \r\nWhatsapp: https://www.monkey-seo.com/whatsapp-us/', NULL, '0', 0, 1, '2024-07-04 03:09:50', '2024-07-04 03:09:50'),
(520, 'Maham Deshotel', 'otis.deshotel@googlemail.com', NULL, NULL, 'The Instagram social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your Instagram  account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out  and lets start work together  ===== > https://tinyurl.com/mw6x9duz\r\n\r\nSee you there!\r\nRegards\r\nMaham', NULL, '0', 0, 1, '2024-07-04 03:12:20', '2024-07-04 03:12:20'),
(521, 'Mikayla Faison', 'faison.mikayla@outlook.com', NULL, NULL, 'Unlock the full potential of your business with Fiverr\'s Pro.\r\n\r\nOur top-tier professionals don\'t just fix your broken website—they enhance your SEO\r\n\r\n Boost your social media presence, and transform your site into a powerful tool that attracts more customers\r\n\r\n And drives your business to NEW HEIGHTS.\r\n\r\n Invest in the Expertise that makes a Huge difference. \r\n\r\nChoose Fiverr Pro today and watch your business grow.\r\n\r\nSimply visit us @ https://go.fiverr.com/visit/?bta=935157&brand=fp\r\n\r\nExplore the difference and power of Fiverr Pro!!!', NULL, '0', 0, 1, '2024-07-04 05:28:00', '2024-07-04 05:28:00'),
(522, 'Masonsuine', 'yjdisantoyjdissemin@gmail.com', NULL, NULL, 'Hi, I wanted to know your price.', NULL, '0', 0, 1, '2024-07-04 20:32:49', '2024-07-04 20:32:49'),
(523, 'Amelia Brown', 'ameliabrown0325@gmail.com', NULL, NULL, 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\nWe go beyond just subscriber numbers. We focus on attracting viewers genuinely interested in your niche, leading to long-term engagement with your content. Our approach leverages optimization, community building, and content promotion for sustainable growth, not quick fixes. Additionally, a dedicated team analyzes your channel and creates a personalized plan to unlock your full potential, all without relying on bots.\r\n\r\nOur packages start from just $60 (USD) per month.\r\n\r\nWould this be of interest?\r\n\r\nKind Regards,\r\nAmelia\r\n\r\nUnsubscribe: https://removeme.click/yt/unsubscribe.php?d=bhojmandu.com', NULL, '0', 0, 1, '2024-07-05 07:53:20', '2024-07-05 07:53:20'),
(524, 'Masonsuine', 'yjdisantoyjdissemin@gmail.com', NULL, NULL, 'Kaixo, zure prezioa jakin nahi nuen.', NULL, '0', 0, 1, '2024-07-05 14:31:10', '2024-07-05 14:31:10'),
(525, 'Mike Passmore', 'mike.passmore@gmail.com', NULL, NULL, 'I noticed that your bhojmandu.com website may be missing out on approximately a thousand visitors daily. Our AI powered traffic system is tailored to enhance your site\'s visibility: https://bit.ly/3L7oaFI\r\nWe\'re offering a free trial that includes four thousand targeted visitors to show the potential benefits. After the trial, we can supply up to 250K targeted visitors per month. This service could greatly amplify your website\'s reach and visitors.', NULL, '0', 0, 1, '2024-07-05 20:11:15', '2024-07-05 20:11:15'),
(526, 'Hicks', 'hicks.adriene78@gmail.com', NULL, NULL, 'Discover how our Premier Agency can dramatically increase your chances of finding your dream Caribbean property. \r\nWe specialize in unlocking access to prime locations and exclusive deals not available elsewhere. \r\nWe have Access to additional Inventory, would you like us to consider adding you to our buyers list then Call Now ☎️ +16615757328\r\nSecure your spot for a personalized journey and make informed decisions.\r\nAvailability is limited – reply now to claim your advantage in the Caribbean Property Real Estate Market. Are you in?\r\n\r\nAlso check out out Premium Caribbean Coastal Properties here: https://stopify.co/5H20W2.link\r\n\r\n������️ Discover Paradise Before It Vanishes! Limited Time Offer, Until September 15. 2024! ������️\r\nYour very own private island is just a Call away—seize the opportunity!\r\nLet us help you . Call Now ☎️ +16612646516  \r\n\r\nRegards,\r\nMark\r\n\r\nYou can also emaiil us at: ccremarketing21@gmail.com\r\nIf you want to promote any product.\r\n\r\n\r\nAlso check out out Premium Caribbean Coastal Properties here: https://stopify.co/5H20W2.link\r\n\r\n������️ Discover Paradise Before It Vanishes! Limited Time Offer, Until May 15. 2024! ������️\r\nYour very own private island is just a Call away—seize the opportunity!\r\nLet us help you . Call Now ☎️ +16612646516  \r\n\r\nRegards,\r\nMark\r\n\r\nYou can also emaiil us at: ccremarketing21@gmail.com\r\nIf you want to promote any product.', NULL, '0', 0, 1, '2024-07-05 21:17:00', '2024-07-05 21:17:00'),
(527, 'Eric Jones', 'ericjonesmyemail@gmail.com', NULL, NULL, 'Hi\r\n\r\nMy name’s Eric and I just found your site bhojmandu.com Administrator.\r\n\r\nIt’s got a lot going for it, but here’s an idea to make it even MORE effective.\r\n\r\nVisit https://rushleadgeneration.com for a live demo now.\r\n\r\nWeb Visitors Into Leads is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It signals you the moment they let you know they’re interested – so that you can talk to that lead while they’re literally looking over your site.\r\n\r\nAnd once you’ve captured their phone number, with our new SMS Text With Lead feature, you can automatically start a text (SMS) conversation… and if they don’t take you up on your offer then, you can follow up with text messages for new offers, content links, even just how you doing? notes to build a relationship.\r\n\r\nVisit https://rushleadgeneration.com to discover what Web Visitors Into Leads can do for your business.\r\n\r\nThe difference between contacting someone within 5 minutes versus a half-hour means you could be converting up to 100X more leads today!\r\n\r\nEric\r\nPS: Studies show that 70% of a site’s visitors disappear and are gone forever after just a moment. Don’t keep losing them. \r\nWeb Visitors Into Leads offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\nVisit https://rushleadgeneration.com to try Web Visitors Into Leads now.\r\n\r\nIf you\'d like to unsubscribe visit https://rushleadgeneration.com/unsubscribe.aspx?d=bhojmandu.com', NULL, '0', 0, 1, '2024-07-07 06:21:31', '2024-07-07 06:21:31'),
(528, 'DavidSeibe', 'collinstamika204@gmail.com', NULL, NULL, 'Make a Guaranteed $13,000 In Just 24 Hours.  Tap here >>>>> https://trk.mail.ru/c/gctk29?ID4262', NULL, '0', 0, 1, '2024-07-07 23:45:26', '2024-07-07 23:45:26'),
(529, 'DavidSeibe', 'collinstamika204@gmail.com', NULL, NULL, 'Make a Guaranteed $13,000 In Just 24 Hours.  Tap here >>>>> https://trk.mail.ru/c/gctk29?ID4262', NULL, '0', 0, 1, '2024-07-07 23:45:36', '2024-07-07 23:45:36'),
(530, 'DavidSeibe', 'collinstamika204@gmail.com', NULL, NULL, 'Make a Guaranteed $13,000 In Just 24 Hours.  Tap here >>>>> https://trk.mail.ru/c/gctk29?ID4262', NULL, '0', 0, 1, '2024-07-07 23:45:46', '2024-07-07 23:45:46'),
(531, 'DavidSeibe', 'collinstamika204@gmail.com', NULL, NULL, 'Make a Guaranteed $13,000 In Just 24 Hours.  Tap here >>>>> https://trk.mail.ru/c/gctk29?ID4262', NULL, '0', 0, 1, '2024-07-07 23:45:51', '2024-07-07 23:45:51'),
(532, 'DavidSeibe', 'collinstamika204@gmail.com', NULL, NULL, 'Make a Guaranteed $13,000 In Just 24 Hours.  Tap here >>>>> https://trk.mail.ru/c/gctk29?ID4262', NULL, '0', 0, 1, '2024-07-07 23:45:57', '2024-07-07 23:45:57'),
(533, 'Kitty Birnie', 'kitty.birnie42@gmail.com', NULL, NULL, 'Unlock the Power of Dropshipping with Shopify: The Ultimate Solution for Your Online Business\r\n\r\nLooking for the best platform to launch your dropshipping business or start a blog? \r\n\r\nShopify is your go-to solution! Here\'s why:\r\n\r\nEase of Use: \r\nShopify’s intuitive interface makes it easy for anyone to set up and manage their online store or blog without any technical skills.\r\n\r\nExtremely Affordable: \r\nWith a range of pricing plans, Shopify offers solutions that fit any budget, ensuring you get the best value for your money.\r\n\r\nComprehensive Tools: \r\nFrom powerful dropshipping integrations to blogging features, Shopify provides all the tools you need to succeed.\r\n\r\nReliable and Scalable: \r\nWhether you\'re just starting out or scaling up, Shopify’s robust infrastructure supports your growth at every stage.\r\n\r\nJoin millions of entrepreneurs who trust Shopify to bring their online business dreams to life. \r\nStart your free trial today and see how easy and affordable success can be!\r\n\r\nSimply Visit Us @ shopify.pxf.io/jr04aa\r\n\r\nAnd begin Your Own Business journey you Dreamed Of.', NULL, '0', 0, 1, '2024-07-08 14:26:22', '2024-07-08 14:26:22');

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
(2, 'admin_employee_login_url', 'staff', 'login_admin_employee', '2023-06-20 16:55:51', '2023-06-20 16:55:51'),
(5, 'header_title', 'Nepal\'s Premium Online Food Delivery Platform', 'admin_landing_page', '2023-06-20 17:59:39', '2023-12-27 03:26:09'),
(6, 'header_sub_title', 'BhojMandu stands as Nepal\'s premium online food delivery platform, redefining culinary experiences.', 'admin_landing_page', '2023-06-20 17:59:39', '2023-12-27 03:26:09'),
(7, 'header_tag_line', 'Start Ordering & Enjoy !', 'admin_landing_page', '2023-06-20 17:59:39', '2023-10-08 11:17:20'),
(8, 'header_app_button_name', 'Order Now', 'admin_landing_page', '2023-06-20 17:59:39', '2023-06-20 17:59:39'),
(9, 'header_app_button_status', '1', 'admin_landing_page', '2023-06-20 17:59:39', '2023-06-20 17:59:39'),
(10, 'header_button_content', 'http://onelink.to/bhojmandu', 'admin_landing_page', '2023-06-20 17:59:39', '2023-10-02 15:04:41'),
(11, 'header_image_content', '{\"header_content_image\":\"2024-01-03-659460ca67ff0.png\",\"header_bg_image\":\"2023-10-02-651a88ac5541b.png\"}', 'admin_landing_page', '2023-06-20 18:01:47', '2024-01-03 01:00:22'),
(12, 'header_floating_content', '{\"header_floating_total_order\":\"25000\",\"header_floating_total_user\":\"15000\",\"header_floating_total_reviews\":\"4952\"}', 'admin_landing_page', '2023-06-20 18:04:04', '2023-10-02 14:52:16'),
(13, 'about_us_image_content', '2024-01-03-659462378e0f1.png', 'admin_landing_page', '2023-06-20 18:10:05', '2024-01-03 01:06:27'),
(14, 'about_us_title', 'BhojMandu', 'admin_landing_page', '2023-06-20 18:10:05', '2023-10-02 14:55:49'),
(15, 'about_us_sub_title', 'is Best Delivery Service Near You', 'admin_landing_page', '2023-06-20 18:10:05', '2023-06-20 18:10:05'),
(16, 'about_us_text', 'We make food delivery more interesting.\r\nFind the greatest deals from the restaurants near you.\r\nTesty & healthy dishes. Bring a restaurant into your home.', 'admin_landing_page', '2023-06-20 18:10:06', '2023-06-20 18:12:42'),
(17, 'about_us_app_button_name', 'Download Now', 'admin_landing_page', '2023-06-20 18:10:06', '2023-06-20 18:10:06'),
(18, 'about_us_app_button_status', '1', 'admin_landing_page', '2023-06-20 18:10:06', '2023-06-20 18:10:06'),
(19, 'about_us_button_content', 'http://onelink.to/bhojmandu', 'admin_landing_page', '2023-06-20 18:10:06', '2023-10-02 15:04:57'),
(54, 'earn_money_reg_image', '2024-01-03-65946388bb138.png', 'admin_landing_page', '2023-06-20 18:51:41', '2024-01-03 01:12:04'),
(55, 'why_choose_us_title', 'Why Choose Us?', 'admin_landing_page', '2023-06-20 18:51:57', '2023-06-20 18:51:57'),
(56, 'why_choose_us_sub_title', 'What so Special About BhojMandu ?', 'admin_landing_page', '2023-06-20 18:51:57', '2023-10-02 15:05:49'),
(57, 'why_choose_us_title_1', 'Find your daily meal', 'admin_landing_page', '2023-06-20 18:53:32', '2023-06-20 18:53:32'),
(58, 'why_choose_us_image_1', '2023-10-01-6518799894d95.png', 'admin_landing_page', '2023-06-20 18:53:32', '2023-10-01 01:25:08'),
(59, 'why_choose_us_title_2', 'Easy to food ordering system', 'admin_landing_page', '2023-06-20 18:53:46', '2023-06-20 18:53:46'),
(60, 'why_choose_us_image_2', '2023-10-01-651879a0ad468.png', 'admin_landing_page', '2023-06-20 18:53:46', '2023-10-01 01:25:16'),
(61, 'why_choose_us_title_3', 'Fastest food delivery service', 'admin_landing_page', '2023-06-20 18:54:02', '2023-06-20 18:54:02'),
(62, 'why_choose_us_image_3', '2023-10-01-651879a818d0f.png', 'admin_landing_page', '2023-06-20 18:54:02', '2023-10-01 01:25:24'),
(63, 'why_choose_us_title_4', 'Track your food order', 'admin_landing_page', '2023-06-20 18:54:19', '2023-06-20 18:54:19'),
(64, 'why_choose_us_image_4', '2023-10-01-651879aeb57d7.png', 'admin_landing_page', '2023-06-20 18:54:19', '2023-10-01 01:25:30'),
(66, 'news_letter_title', 'Sign Up to Our Newsletter', 'admin_landing_page', '2023-06-21 09:25:14', '2023-06-21 09:25:14'),
(67, 'news_letter_sub_title', 'Receive Latest News, Updates and Many Other News Every Week', 'admin_landing_page', '2023-06-21 09:25:14', '2023-06-21 09:25:14'),
(68, 'footer_data', 'BhojMandu 🍔📲 is a tech-savvy On-Demand online food delivery platform, revolutionizing the culinary experience by seamlessly connecting users with their favorite restaurants for hassle-free ordering.', 'admin_landing_page', '2023-06-21 09:26:16', '2024-04-10 20:04:38'),
(92, 'news_letter_title', 'Lets Connect !', 'react_landing_page', '2023-06-21 09:53:57', '2023-06-21 09:53:57'),
(93, 'news_letter_sub_title', 'Stay upto date with restaurants around you. Subscribe with email.', 'react_landing_page', '2023-06-21 09:53:57', '2023-06-21 09:53:57'),
(94, 'footer_data', 'is Best Delivery Service Near You', 'react_landing_page', '2023-06-21 09:55:11', '2023-06-21 09:55:11'),
(95, 'promotional_banner_image', '2023-10-09-652309a765361.png', 'promotional_banner', '2023-09-08 17:11:53', '2023-10-09 01:42:27'),
(96, 'promotional_banner_title', 'Banner', 'promotional_banner', '2023-09-08 17:11:53', '2023-10-19 14:51:49'),
(97, 'about_us', '<p><strong>Introduction:</strong></p>\r\n\r\n<p><strong>BhojMandu</strong> leads the way as a pioneering, tech-savvy food delivery platform in Nepal. We fuse the power of food technology with convenience, reshaping culinary experiences across the nation. Our mission is to deliver unrivaled quality, harnessing cutting-edge technology to meet the evolving needs for convenience and safety in the food industry. Our groundbreaking concept includes night-time delivery, ensuring swift and hassle-free access to delicious meals right to your doorstep. Join us as we redefine the landscape of food delivery in Nepal!</p>\r\n\r\n<p><strong>Vision:</strong></p>\r\n\r\n<p>Our vision is to emerge as the foremost tech-driven provider of groundbreaking food delivery services in Nepal, delivering high-quality, convenient, and safe culinary solutions to both customers and restaurants. We aspire to redefine the landscape of food delivery by leveraging cutting-edge technology to enhance convenience and safety, setting new standards of excellence in the industry.</p>\r\n\r\n<p><strong>Mission:</strong></p>\r\n\r\n<ol>\r\n	<li><strong>Streamlining Culinary Enjoyment:</strong>&nbsp;Simplify the experience of relishing delicious, healthy meals without the hassle of cooking.</li>\r\n	<li><strong>Tech-Centric Solutions:</strong>&nbsp;Provide a reliable, safe, and tech-centric platform for food delivery and cloud kitchen solutions, ensuring efficiency and convenience.</li>\r\n	<li><strong>User-Friendly Experience:</strong>&nbsp;Deliver an efficient, cost-effective, and user-friendly service for both customers and restaurants.</li>\r\n	<li><strong>Tech-Driven Convenience:</strong>&nbsp;Offer a convenient, safe, and tech-driven way for customers to enjoy meals, backed by professional and personalized customer service.</li>\r\n</ol>\r\n\r\n<p><strong>Objectives:</strong></p>\r\n\r\n<ol>\r\n	<li><strong>Tech-Driven Innovation:</strong>&nbsp;Spearhead tech-driven solutions for secure and reliable food delivery and cloud kitchen services.</li>\r\n	<li><strong>User-Friendly Platform:</strong>&nbsp;Develop an easy-to-use and tech-centric platform for seamless interactions between customers and restaurants.</li>\r\n	<li><strong>Comprehensive Culinary Solutions:</strong>&nbsp;Provide a comprehensive range of tech-centric food delivery and cloud kitchen services.</li>\r\n	<li><strong>Customer-Centric Support:</strong>&nbsp;Ensure excellent customer service with a tech-centric approach, prioritizing user experience and satisfaction.</li>\r\n</ol>\r\n\r\n<p><strong>Goals:</strong></p>\r\n\r\n<ol>\r\n	<li><strong>Customer Satisfaction:</strong>&nbsp;Increase customer satisfaction by delivering high-quality services through tech-driven innovations.</li>\r\n	<li><strong>User Base Expansion:</strong>&nbsp;Expand the user base of both customers and restaurants through a user-friendly, tech-centric platform.</li>\r\n	<li><strong>Platform Enrichment:</strong>&nbsp;Enhance platform features through tech-centric advancements for an enriched culinary experience.</li>\r\n	<li><strong>Revenue Growth:</strong>&nbsp;Boost revenue generated by the platform through strategic tech-centric initiatives.</li>\r\n	<li><strong>Tech Leadership:</strong>&nbsp;Establish ourselves as the preferred online food delivery and cloud kitchen company in Nepal with a focus on tech leadership.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>', 'admin_landing_page', '2023-10-02 15:40:03', '2024-06-08 14:48:02'),
(98, 'privacy_policy', '<p>&nbsp;</p>\r\n\r\n<p><strong>PRIVACY POLICY</strong></p>\r\n\r\n<p><em>Last updated: March 12, 2022</em></p>\r\n\r\n<p>This Privacy Policy outlines the policies and procedures of BhojMandu Food Pvt. Ltd. (&quot;the Company,&quot; &quot;We,&quot; &quot;Us,&quot; or &quot;Our&quot;) regarding the collection, use, and disclosure of Your information when You utilize the BhojMandu Food Delivery Service. It also informs You about Your privacy rights and how the law safeguards You.</p>\r\n\r\n<p>By using the BhojMandu Service, You agree to the collection and use of information in accordance with this Privacy Policy.</p>\r\n\r\n<p><strong>Interpretation and Definitions</strong></p>\r\n\r\n<p><strong>Interpretation:</strong> The capitalized words in this document have meanings defined under specific conditions. The defined terms have the same meaning regardless of their appearance in singular or plural form.</p>\r\n\r\n<p><strong>Definitions:</strong> For the purposes of this Privacy Policy:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Account:</strong> A unique account created for You to access our Service or specific parts of our Service.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Application:</strong> The software program provided by the Company and downloaded by You on any electronic device, named BhojMandu Food Delivery.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Company:</strong> Refers to BhojMandu Food Pvt. Ltd., Kathmandu-30, Nepal-44600, also referred to as &quot;the Company,&quot; &quot;We,&quot; &quot;Us,&quot; or &quot;Our&quot; in this Agreement.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Country:</strong> Refers to Nepal.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Device:</strong> Any device that can access the Service, such as a computer, cellphone, or digital tablet.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Personal Data:</strong> Any information relating to an identified or identifiable individual.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Service:</strong> Refers to the Application.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Service Provider:</strong> Any natural or legal person processing data on behalf of the Company, including third-party companies or individuals employed to facilitate or provide services related to the Service.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Third-party Social Media Service:</strong> Any website or social network through which a User can log in or create an account to use the Service.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Usage Data:</strong> Data collected automatically, generated by the use of the Service or from the Service infrastructure itself.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>You:</strong> The individual accessing or using the Service, or the entity on behalf of which such individual is accessing or using the Service.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Collecting and Using Your Personal Data</strong></p>\r\n\r\n<p><strong>Types of Data Collected:</strong></p>\r\n\r\n<p><strong>Personal Data:</strong> While using Our Service, We may ask You to provide personally identifiable information, including but not limited to:</p>\r\n\r\n<ul>\r\n	<li>Email address</li>\r\n	<li>First name and last name</li>\r\n	<li>Phone number</li>\r\n	<li>Address, State, Province, ZIP/Postal code, City</li>\r\n</ul>\r\n\r\n<p><strong>Usage Data:</strong> Usage Data is collected automatically during the use of the Service and may include information such as Your Device&#39;s IP address, browser type, pages visited, time and date of visit, time spent on pages, unique device identifiers, and other diagnostic data.</p>\r\n\r\n<p><strong>Push Notifications:</strong> We will utilize push notifications for order updates, offers, and contact in case of a user&#39;s phone being out of network.</p>\r\n\r\n<p><strong>Information from Third-Party Social Media Services:</strong> The Company allows You to create an account and log in to use the Service through Third-party Social Media Services, including Google, Facebook, and Twitter. If You choose to register through these services, We may collect Personal Data associated with Your Third-party Social Media Service&#39;s account.</p>\r\n\r\n<p><strong>Information Collected while Using the Application:</strong> With Your prior permission, We may collect information regarding Your location to provide and improve features of the Service. This information may be stored on the Company&#39;s servers or a Service Provider&#39;s server.</p>\r\n\r\n<p><strong>Use of Your Personal Data</strong></p>\r\n\r\n<p>The Company may use Personal Data for various purposes, including but not limited to:</p>\r\n\r\n<ul>\r\n	<li>Providing and maintaining the Service.</li>\r\n	<li>Managing Your Account and registration as a user.</li>\r\n	<li>Performance of contracts and undertaking of purchase contracts.</li>\r\n	<li>Contacting You for updates or informative communications related to the Service.</li>\r\n	<li>Providing news, special offers, and general information about goods, services, and events.</li>\r\n	<li>Managing Your requests and attending to Your inquiries.</li>\r\n	<li>Evaluating or conducting business transfers, mergers, or acquisitions.</li>\r\n	<li>Other purposes such as data analysis, identifying trends, and improving our Service.</li>\r\n</ul>\r\n\r\n<p><strong>Sharing Your Personal Information</strong></p>\r\n\r\n<p>We may share Your personal information in the following situations:</p>\r\n\r\n<ul>\r\n	<li>With Service Providers to monitor and analyze the use of our Service and to contact You.</li>\r\n	<li>For business transfers, in connection with any merger, sale of Company assets, financing, or acquisition.</li>\r\n	<li>With Affiliates, requiring them to honor this Privacy Policy.</li>\r\n	<li>With business partners to offer products, services, or promotions.</li>\r\n	<li>With other users in public areas of the Service or through Third-Party Social Media Services, as per Your interactions.</li>\r\n	<li>With Your consent for any other purpose.</li>\r\n</ul>\r\n\r\n<p><strong>Retention of Your Personal Data</strong></p>\r\n\r\n<p>The Company will retain Your Personal Data for as long as necessary for the purposes outlined in this Privacy Policy. Usage Data may be retained for internal analysis purposes.</p>\r\n\r\n<p><strong>Transfer of Your Personal Data</strong></p>\r\n\r\n<p>Your information, including Personal Data, may be processed at the Company&#39;s operating offices and other locations. By submitting such information, You consent to its transfer. The Company will take steps to ensure data security in accordance with this Privacy Policy.</p>\r\n\r\n<p><strong>Disclosure of Your Personal Data</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Business Transactions:</strong> If the Company is involved in a merger, acquisition, or asset sale, Your Personal Data may be transferred with notice.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Law Enforcement:</strong> Under certain circumstances, the Company may disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Other Legal Requirements:</strong> The Company may disclose Your Personal Data in good faith to comply with legal obligations, protect rights or property, prevent wrongdoing, or protect personal safety.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Security of Your Personal Data</strong></p>\r\n\r\n<p>While We strive for commercially acceptable security measures, no transmission over the Internet or electronic storage is 100% secure. We cannot guarantee absolute security but take reasonable steps to protect Your Personal Data.</p>\r\n\r\n<p><strong>Children&#39;s Privacy</strong></p>\r\n\r\n<p>Our Service does not address individuals under the age of 13. We do not knowingly collect personally identifiable information from anyone under 13. If You are a parent or guardian aware of Your child providing Personal Data, please contact Us. We take steps to remove such information from Our servers.</p>\r\n\r\n<p><strong>Links to Other Websites</strong></p>\r\n\r\n<p>Our Service may contain links to third-party websites. We advise reviewing the Privacy Policy of every site You visit as We have no control over their content, policies, or practices.</p>\r\n\r\n<p><strong>Changes to this Privacy Policy</strong></p>\r\n\r\n<p>We may update Our Privacy Policy, and changes become effective when posted on this page. We will notify You via email or a prominent notice on Our Service before changes take effect.</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If You have questions about this Privacy Policy, please contact Us:</p>\r\n\r\n<ul>\r\n	<li>By email:&nbsp;<a href=\"mailto:info@bhojmandu.com\">info@bhojmandu.com</a></li>\r\n	<li>By visiting:&nbsp;<a href=\"http://bhojmandu.com/contact-us\">bhojmandu.com/contact-us</a></li>\r\n	<li>By phone: 01-5909551</li>\r\n</ul>\r\n\r\n<p><strong>Head Office:</strong></p>\r\n\r\n<p>BhojMandu Food Pvt.Ltd. Kathmandu-30, Nepal</p>\r\n\r\n<p><em>Note: If anyone wants to delete...</em> (Add specific instructions for data deletion as needed)</p>', 'admin_landing_page', '2023-10-02 15:40:16', '2024-01-10 23:05:14'),
(99, 'terms_and_conditions', '<p>Last Update: 23-Jan-2024 Time: 9:00 PM (GMT +5:45)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>TERMS &amp; CONDITIONS</strong></p>\r\n\r\n<p>Welcome to BhojMandu! Before you begin using our services, please take a moment to read and understand the following User Terms and Conditions. By accessing our website (https://bhojmandu.com) or using the BhojMandu Food Delivery App, you agree to comply with these terms. If you do not agree with any part of these terms, we kindly ask that you refrain from using our services.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>1. User Conduct</strong></p>\r\n\r\n<p>When using BhojMandu, you agree to abide by all applicable laws and regulations. Respect the rights of others and refrain from engaging in any activities that may disrupt or interfere with the proper functioning of our services.</p>\r\n\r\n<p><strong>2. Account Registration</strong></p>\r\n\r\n<p>To access certain features of our services, you may need to register for an account. Provide accurate and complete information during the registration process. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.</p>\r\n\r\n<p><strong>3. Placing Orders</strong></p>\r\n\r\n<p>When placing orders through BhojMandu, ensure that all details, including delivery address and contact information, are accurate. Any discrepancies or issues should be reported promptly.</p>\r\n\r\n<p><strong>4. Payments and Charges</strong></p>\r\n\r\n<p>Payment for orders should be made through the designated payment methods. By placing an order, you agree to pay all charges associated with the order. BhojMandu reserves the right to update prices and charges with notice.</p>\r\n\r\n<p><strong>5. Delivery</strong></p>\r\n\r\n<p>Delivery times are estimates and may vary based on various factors. BhojMandu strives to provide timely delivery, but we are not liable for any delays or issues beyond our control.</p>\r\n\r\n<p><strong>6. Cancellations and Refunds</strong></p>\r\n\r\n<p>Orders can be canceled within a specified time frame. Refunds, if applicable, will be processed according to our Refund Policy.</p>\r\n\r\n<p><strong>7. User Content</strong></p>\r\n\r\n<p>Any content (reviews, comments, etc.) you submit to BhojMandu remains your property. However, you grant us a non-exclusive, royalty-free, worldwide, perpetual license to use, display, and distribute this content in connection with our services.</p>\r\n\r\n<p><strong>8. Privacy and Data Security</strong></p>\r\n\r\n<p>BhojMandu values your privacy. Our Privacy Policy outlines how we collect, use, and safeguard your information. By using our services, you consent to our privacy practices.</p>\r\n\r\n<p><strong>9. Load Fund</strong></p>\r\n\r\n<p>9.1. Load fund functionality allows you to add funds to your BhojMandu wallet.<br />\r\n9.2. Funds loaded into your BhojMandu wallet are intended for purchases on our platform and cannot be refunded to your original payment method.<br />\r\n9.3. Loaded funds are non-transferable and cannot be converted into cash or transferred to another BhojMandu user.</p>\r\n\r\n<p><strong>10. Loyalty Points</strong></p>\r\n\r\n<p>10.1. Loyalty points are awarded as part of our loyalty program.<br />\r\n10.2. Loyalty points cannot be transferred to another BhojMandu user or converted into cash.<br />\r\n10.3. The purpose of loyalty points is for purchasing items from our platform or adding points to load funds.</p>\r\n\r\n<p><strong>11. Updates and Modifications</strong></p>\r\n\r\n<p>BhojMandu may update these terms from time to time. Continued use of our services after such updates constitutes acceptance of the modified terms.</p>\r\n\r\n<p><strong>12. Refer &amp; Earn Program</strong></p>\r\n\r\n<p>Eligibility: Open to all registered BhojMandu users. Users must be of legal age.<br />\r\nHow it Works: Referrers receive a unique coupon code. Referrers earn a specified amount once their referred friend completes their first order using the provided code.<br />\r\nReferral Criteria: Referee must be a new customer. The unique coupon code must be used during checkout.</p>\r\n\r\n<p><strong>13. Termination</strong></p>\r\n\r\n<p>BhojMandu reserves the right to terminate or suspend your account at any time for violations of these terms or for any other reason. You may also terminate your account by following the provided procedures.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>14. Governing Law</strong></p>\r\n\r\n<p>These terms are governed by the laws applicable to the jurisdiction in which BhojMandu operates its services.<br />\r\nThank you for using BhojMandu! If you have any questions or concerns about these terms, please contact us at [info@bhojmandu.com].</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Vendor Terms &amp; Conditions&nbsp;</strong></p>\r\n\r\n<p>By registering and participating as a vendor on the BhojMandu Food Delivery App, you agree to comply with the following terms and conditions:</p>\r\n\r\n<p><strong>1. Registration and Account:</strong></p>\r\n\r\n<p>1.1 To become a vendor on BhojMandu, you must complete the registration process accurately and provide all required information.<br />\r\n1.2 You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.</p>\r\n\r\n<p>2. Menu and Pricing:</p>\r\n\r\n<p>2.1 You are responsible for providing accurate and up-to-date menu information, including item descriptions and prices.<br />\r\n2.2 BhojMandu reserves the right to review and approve all menu items and pricing. Any changes must be communicated and approved by BhojMandu.</p>\r\n\r\n<p>3. Order Fulfillment:</p>\r\n\r\n<p>3.1 You agree to fulfill orders promptly and within the specified time frame communicated to customers through the BhojMandu platform.<br />\r\n3.2 In the event of unavailability of an item, you must promptly notify BhojMandu and update the menu accordingly.</p>\r\n\r\n<p>4. Quality Assurance:</p>\r\n\r\n<p>4.1 Maintain high standards of food quality, preparation, and presentation.<br />\r\n4.2 BhojMandu reserves the right to assess and monitor the quality of food and service provided to users.</p>\r\n\r\n<p>5. Payments and Commissions:</p>\r\n\r\n<p>5.1 BhojMandu will facilitate payments from users on your behalf, deducting applicable commissions.<br />\r\n5.2 Commissions may vary and are subject to change. Details of commissions will be communicated to vendors.</p>\r\n\r\n<p>6. Refunds and Cancellations:</p>\r\n\r\n<p>6.1 Vendors are responsible for refunding users in case of cancellations or unsatisfactory service.<br />\r\n6.2 BhojMandu may facilitate refunds on behalf of vendors and deduct the refund amount from future payments.</p>\r\n\r\n<p>7. Compliance with Laws:</p>\r\n\r\n<p>7.1 Vendors must comply with all applicable laws and regulations related to food preparation, safety, and hygiene.<br />\r\n7.2 BhojMandu may request and verify necessary licenses and permits from vendors.</p>\r\n\r\n<p>8. Marketing and Promotions:</p>\r\n\r\n<p>8.1 Vendors may be featured in BhojMandu marketing and promotional materials.<br />\r\n8.2 BhojMandu may run promotions or discounts on vendor items at its discretion.</p>\r\n\r\n<p>9. Termination of Agreement:</p>\r\n\r\n<p>9.1 BhojMandu reserves the right to terminate the vendor agreement for violations of these terms or for any reason at its sole discretion.<br />\r\n9.2 Vendors may terminate their participation by providing notice to BhojMandu.</p>\r\n\r\n<p>10. Communication:</p>\r\n\r\n<p>10.1 BhojMandu will communicate important information and updates to vendors through the provided contact details.<br />\r\n10.2 Vendors are responsible for promptly responding to communications from BhojMandu.<br />\r\nBy agreeing to these terms, you acknowledge that you have read, understood, and agreed to comply with the Vendor Terms &amp; Conditions of the BhojMandu Food Delivery App. BhojMandu reserves the right to update these terms periodically, and continued use of the platform implies acceptance of any changes.</p>\r\n\r\n<p>&nbsp;</p>', 'admin_landing_page', '2023-10-02 15:40:47', '2024-02-02 15:17:43'),
(108, 'maintenance_system_setup', '[\"user_mobile_app\",\"user_web_app\",\"deliveryman_app\"]', 'maintenance_mode', '2025-01-03 07:16:18', '2025-01-07 06:07:10'),
(109, 'maintenance_duration_setup', '{\"maintenance_duration\":\"until_change\",\"start_date\":null,\"end_date\":null}', 'maintenance_mode', '2025-01-03 07:16:18', '2025-01-03 07:16:18'),
(110, 'maintenance_message_setup', '{\"business_number\":0,\"business_email\":0,\"maintenance_message\":null,\"message_body\":null}', 'maintenance_mode', '2025-01-03 07:16:18', '2025-01-03 07:16:18');

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
(1, 'Change Password Request', '<p>The following user has forgotten his password &amp; requested to change/reset their password.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>User Name: {userName}</strong></p>', NULL, NULL, NULL, '2023-10-01-65197b63ad76c.png', '', '', 'Footer Text Please contact us for any queries; we’re always happy to help.', '© 2023 KnockDoor. All rights reserved.', 'admin', 'forget_password', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 18:19:43', '2025-01-07 10:33:24', NULL);

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
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logable_id` bigint(20) UNSIGNED NOT NULL,
  `logable_type` varchar(255) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `model` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `action_details` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `before_state` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`before_state`)),
  `after_state` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`after_state`)),
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL COMMENT 'Subscribers email',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `created_at`, `updated_at`) VALUES
(34, 'tjjcdwwtdh.j@rightbliss.beauty', '2024-06-09 08:17:18', '2024-06-09 08:17:18'),
(35, 'tjttthmbmw.j@rightbliss.beauty', '2024-06-10 15:52:30', '2024-06-10 15:52:30'),
(36, 'tjcjqpjwbd.j@rightbliss.beauty', '2024-06-11 23:57:04', '2024-06-11 23:57:04'),
(37, 'tjwpjqhqqj.j@rightbliss.beauty', '2024-06-13 10:09:31', '2024-06-13 10:09:31'),
(38, 'tqqtwbttcc.j@rightbliss.beauty', '2024-06-14 22:27:57', '2024-06-14 22:27:57'),
(39, 'tqdjcmdchh.j@rightbliss.beauty', '2024-06-16 15:02:19', '2024-06-16 15:02:19'),
(40, 'tqcpbtbwpw.j@rightbliss.beauty', '2024-06-18 08:43:12', '2024-06-18 08:43:12'),
(41, 'tqmdtppqtd.j@silesia.life', '2024-06-20 04:49:14', '2024-06-20 04:49:14'),
(42, 'A5a4_generic_b18a5b28_bhojmandu.com@serviseantilogin.com', '2024-06-20 12:43:01', '2024-06-20 12:43:01'),
(43, 'thhqhqwtmj.j@silesia.life', '2024-06-21 10:29:54', '2024-06-21 10:29:54'),
(44, 'thdwjbmcdc.j@silesia.life', '2024-06-22 14:35:38', '2024-06-22 14:35:38'),
(45, 'thpdmjjmjh.j@silesia.life', '2024-06-23 19:01:43', '2024-06-23 19:01:43'),
(46, 'tthwbwtdqd.j@silesia.life', '2024-06-26 20:18:21', '2024-06-26 20:18:21'),
(47, 'ttbbdhdcpj.j@silesia.life', '2024-06-29 03:14:56', '2024-06-29 03:14:56'),
(48, 'ttwhhcbmhc.j@silesia.life', '2024-06-30 23:13:03', '2024-06-30 23:13:03'),
(49, 'tdjmqjpqwh.j@silesia.life', '2024-07-02 19:37:02', '2024-07-02 19:37:02'),
(50, 'unishbantawa2@gmail.com', '2024-07-04 16:01:58', '2024-07-04 16:01:58'),
(51, 'tdtbmdwdtw.j@silesia.life', '2024-07-04 20:41:05', '2024-07-04 20:41:05'),
(52, 'tdchpwmcmd.j@silesia.life', '2024-07-06 13:09:03', '2024-07-06 13:09:03'),
(53, 'tdwmctjmbj.j@silesia.life', '2024-07-08 03:54:35', '2024-07-08 03:54:35'),
(54, 'test@gmail.com', '2025-01-26 10:22:26', '2025-01-26 10:22:26');

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE `notification_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sub_title` text DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `type` enum('admin','customer','professionalman') NOT NULL DEFAULT 'admin',
  `mail_status` enum('active','inactive','disable') NOT NULL DEFAULT 'disable',
  `sms_status` enum('active','inactive','disable') NOT NULL DEFAULT 'disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_settings`
--

INSERT INTO `notification_settings` (`id`, `title`, `sub_title`, `key`, `type`, `mail_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'forget_password', 'Sent_notification_on_forget_password', 'forget_password', 'admin', 'active', 'active', '2024-07-09 13:53:09', '2024-07-09 13:53:09');

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

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`, `otp_hit_count`, `is_blocked`, `is_temp_blocked`, `temp_block_time`, `created_by`, `phone`) VALUES
('2asghosh1992@gmail.com', '5184', '2023-10-16 15:46:09', 0, 0, 0, NULL, 'user', NULL),
('9720@bhojmandu.com', '8282', '2023-10-16 15:48:15', 0, 0, 0, NULL, 'user', NULL),
('9840208996bhojmandu.com', '5404', '2023-10-16 15:59:44', 0, 0, 0, NULL, 'user', NULL),
('hbhjb@@bhojmandu.com', '5323', '2023-10-16 16:02:39', 0, 0, 0, NULL, 'user', NULL),
('shakyaayush82@gmail.com', '2768', '2023-10-19 17:12:56', 0, 0, 0, NULL, 'user', NULL),
('contactsayal@gmail.com', '1539', '2023-10-19 18:15:58', 0, 0, 0, NULL, 'user', NULL),
('esmailypubg@gmail.com', '9572', '2023-10-19 19:11:01', 0, 0, 0, NULL, 'user', NULL),
('kristinakarkey@gmail.com', '2305', '2023-10-19 19:45:49', 0, 0, 0, NULL, 'user', NULL),
('9841080968@bhojmandu.com', '7673', '2023-10-28 23:13:49', 0, 0, 0, NULL, 'user', NULL),
('9822982985@bhojmandu.com', '9473', '2023-11-03 00:28:21', 0, 0, 0, NULL, 'user', NULL),
('rajustha729@gmail.com', '8305', '2023-11-06 02:52:56', 0, 0, 0, NULL, 'user', NULL),
('bipingurung647@gmail.com', '1193', '2023-11-16 15:57:49', 0, 0, 0, NULL, 'user', NULL),
('123lakpha45@gmail.com', '3474', '2023-11-18 00:18:29', 0, 0, 0, NULL, 'user', NULL),
('bibekjungkunwar123@gmail.com', '8889', '2023-11-19 18:38:28', 0, 0, 0, NULL, 'user', NULL),
('Bishalyadav.by123@gmail.com', '5036', '2023-11-29 23:28:06', 0, 0, 0, NULL, 'user', NULL),
('testtest@gmail.com', '6680', '2023-12-01 23:03:31', 0, 0, 0, NULL, 'user', NULL),
('gupta.rajan10191991@gmail.com', '2049', '2023-12-05 22:28:25', 0, 0, 0, NULL, 'user', NULL),
('ashokrasaili08@gmail.com', '2599', '2023-12-18 21:30:06', 0, 0, 0, NULL, 'user', NULL),
('pratikshrestha2055@gmail.com', '9718', '2023-12-22 17:37:58', 0, 0, 0, NULL, 'user', NULL),
('pariyarshishir363@gmail.com', '5959', '2023-12-29 00:25:11', 0, 0, 0, NULL, 'user', NULL),
('sajanas033@gmail.com', '4045', '2023-12-30 17:14:40', 0, 0, 0, NULL, 'user', NULL),
('mission2fly@gmail.com', '2451', '2023-12-30 21:31:44', 0, 0, 0, NULL, 'user', NULL),
('chris.shrestha69@gmail.com', '4077', '2023-12-30 21:40:10', 0, 0, 0, NULL, 'user', NULL),
('sunil@bhojmandu.com', '5054', '2024-01-08 11:44:42', 0, 0, 0, NULL, 'user', NULL),
('kcdeepak6@gmail.com', '3807', '2024-01-10 19:35:09', 0, 0, 0, NULL, 'user', NULL),
('chaudharynischal424@gmail.com', '4523', '2024-01-10 22:09:58', 0, 0, 0, NULL, 'user', NULL),
('arpitnhuchhe11@gmail.com', '9015', '2024-01-14 22:31:13', 0, 0, 0, NULL, 'user', NULL),
('cplayerkhanal@gmail.com', '2262', '2024-01-15 22:35:33', 0, 0, 0, NULL, 'user', NULL),
('kdeenesh842@gmail.com', '3176', '2024-01-17 09:27:25', 0, 0, 0, NULL, 'user', NULL),
('rooneygiri111@gmail.com', '6686', '2024-01-23 01:42:55', 0, 0, 0, NULL, 'user', NULL),
('rrosey208@gmail.com', '5606', '2024-01-23 03:26:55', 0, 0, 0, NULL, 'user', NULL),
('sansube123@gmail.com', '6694', '2024-01-23 04:19:35', 0, 0, 0, NULL, 'user', NULL),
('bibeknepal858@gmail.com', '3678', '2024-01-29 17:07:07', 0, 0, 0, NULL, 'user', NULL),
('pant.sagar101@gmail.com', '2977', '2024-02-01 22:39:41', 0, 0, 0, NULL, 'user', NULL),
('sagarnathpant@gmail.com', '2082', '2024-02-01 22:34:47', 0, 0, 0, NULL, 'user', NULL),
('raajsunil571@gmail.com', '6811', '2024-07-09 16:02:31', 0, 0, 0, NULL, 'user', NULL),
('rajankoirala1998@gmail.com', '7739', '2024-02-02 00:14:40', 0, 0, 0, NULL, 'user', NULL),
('hyolmotenzen53@gmail.com', '2139', '2024-02-06 00:41:40', 0, 0, 0, NULL, 'user', NULL),
('deepamgr12@icloud.com', '9876', '2024-02-22 20:59:48', 0, 0, 0, NULL, 'user', NULL),
('managelunchbox@gmail.com', 'F239JKFNVKTM9WF', '2024-02-25 11:14:51', 0, 0, 0, NULL, 'vendor', NULL),
('samiksubedi87@gmail.com', '8723', '2024-03-05 00:25:36', 0, 0, 0, NULL, 'user', NULL),
('sapkotamessi000@gmail.com', '8395', '2024-03-23 21:50:07', 0, 0, 0, NULL, 'user', NULL),
('djjdjlall@gmail.com', '7157', '2024-03-27 21:07:42', 0, 0, 0, NULL, 'user', NULL),
('nyujanthapa999@gmail.com', '8206', '2024-03-31 23:36:39', 0, 0, 0, NULL, 'user', NULL),
('sabinakhatri357@gmail.com', '9957', '2024-04-07 20:45:42', 0, 0, 0, NULL, 'user', NULL),
('sumitrokaya8@gmail.com', '1753', '2024-04-14 18:15:13', 0, 0, 0, NULL, 'user', NULL),
('karundangal30@gmail.com', '4474', '2024-04-16 01:03:46', 0, 0, 0, NULL, 'user', NULL),
('salonijha12345@gmail.com', '3434', '2024-04-18 13:55:09', 0, 0, 0, NULL, 'user', NULL),
('hamalnirajan03@gmail.com', '6295', '2024-05-01 20:54:07', 0, 0, 0, NULL, 'user', NULL),
('sharmapremraj2003@gmail.com', '9806', '2024-05-02 20:05:27', 0, 0, 0, NULL, 'user', NULL),
('akashyadav141223422@gmail.com', '5802', '2024-05-02 20:49:43', 0, 0, 0, NULL, 'user', NULL),
('samikxamagar2004@gmail.com', '4893', '2024-05-02 21:41:53', 0, 0, 0, NULL, 'user', NULL),
('roshantamang337@gmail.com', '2013', '2024-05-15 20:23:20', 0, 0, 0, NULL, 'user', NULL),
('ksizu98@gmail.com', '3351', '2024-05-15 21:47:30', 0, 0, 0, NULL, 'user', NULL),
('amisskc@gmail.com', '1496', '2024-05-15 21:49:02', 0, 0, 0, NULL, 'user', NULL),
('bipashchau@gmail.com', '2620', '2024-05-16 10:03:45', 0, 0, 0, NULL, 'user', NULL),
('ghimirek3@gmail.com', '6200', '2024-05-16 14:44:46', 0, 0, 0, NULL, 'user', NULL),
('rayamajhinisha12@gmail.com', '5632', '2024-05-24 19:33:22', 0, 0, 0, NULL, 'user', NULL),
('rabinkarki290@gmail.com', '3426', '2024-05-31 16:29:22', 0, 0, 0, NULL, 'user', NULL),
('bidhi.mallik@gmail.com', '7233', '2024-05-31 21:15:51', 0, 0, 0, NULL, 'user', NULL),
('bhattkiran729@gmail.com', '4937', '2024-06-05 13:00:04', 0, 0, 0, NULL, 'user', NULL),
('binitkoirala17@gmail.com', '9855', '2024-06-10 17:52:13', 0, 0, 0, NULL, 'user', NULL),
('pkloves11@gmail.com', '5867', '2024-06-13 18:35:07', 0, 0, 0, NULL, 'user', NULL),
('leonysunny538@gmail.com', '7633', '2024-06-15 17:22:02', 2, 0, 0, NULL, 'user', NULL),
('agrg0082@gmail.com', '5473', '2024-06-17 13:50:55', 0, 0, 0, NULL, 'user', NULL),
('bijayadhakal9866@gmail.com', '7677', '2024-06-20 13:28:15', 0, 0, 0, NULL, 'user', NULL),
('sadaib403@gmail.com', '4904', '2024-06-29 00:28:21', 0, 0, 0, NULL, 'user', NULL),
('santoshthakulla999@gmail.com', '4702', '2024-07-01 00:53:40', 0, 0, 0, NULL, 'user', NULL),
('reyanadhikari07@gmail.com', '5868', '2024-07-01 04:05:13', 0, 0, 0, NULL, 'user', NULL),
('dinesharma921@gmail.com', '6959', '2024-07-02 12:28:52', 0, 0, 0, NULL, 'user', NULL),
('gurungrajani831@gmail.com', '7331', '2024-07-04 21:00:17', 0, 0, 0, NULL, 'user', NULL),
('ksherpa520@gmail.com', '9799', '2024-07-07 02:26:10', 0, 0, 0, NULL, 'user', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_media`
--

INSERT INTO `social_media` (`id`, `name`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'facebook', 'https://www.facebook.com/bhojmandu', 1, NULL, NULL),
(2, 'linkedin', 'https://www.linkedin.com/company/42363872', 1, NULL, NULL),
(3, 'twitter', 'https://twitter.com/bhojmandu', 1, NULL, NULL),
(4, 'instagram', 'https://www.instagram.com/bhojmandu_official', 1, NULL, NULL),
(5, 'pinterest', 'https://www.pinterest.com/bhojmandu', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(14, 'App\\Models\\Banner', '21', 'image', 'public', '2024-07-09 16:36:23', '2024-07-09 16:36:23'),
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
(33, 'App\\Models\\Admin', '5', 'image', 'public', '2025-01-10 05:38:10', '2025-01-10 05:38:10'),
(37, 'App\\Models\\Banner', '22', 'image', 'public', '2025-01-13 11:47:14', '2025-01-13 11:47:14'),
(40, 'App\\Models\\User', '4', 'image', 'public', '2025-01-30 06:53:14', '2025-01-30 06:53:14');

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
(24, 'App\\Models\\DataSetting', 14, 'en', 'about_us_title', 'Knockdoor', NULL, NULL),
(25, 'App\\Models\\DataSetting', 15, 'en', 'about_us_sub_title', 'is Best Delivery Service Near You', NULL, NULL),
(26, 'App\\Models\\DataSetting', 16, 'en', 'about_us_text', 'We make food delivery more interesting.\r\nFind the greatest deals from the restaurants near you.\r\nTasty & healthy dishes. Bring a restaurant into your home.', NULL, NULL),
(27, 'App\\Models\\DataSetting', 17, 'en', 'about_us_app_button_name', 'Download Now', NULL, NULL),
(28, 'App\\Models\\AdminFeature', 1, 'en', 'feature_name', '24h Support', NULL, NULL),
(29, 'App\\Models\\AdminFeature', 1, 'en', 'feature_description', '24/7 customer support service to support you.', NULL, NULL),
(30, 'App\\Models\\AdminFeature', 2, 'en', 'feature_name', 'Easy Payment', NULL, NULL),
(31, 'App\\Models\\AdminFeature', 2, 'en', 'feature_description', 'Smart and easy payment system to maintain your business.', NULL, NULL),
(32, 'App\\Models\\AdminFeature', 3, 'en', 'feature_name', 'Fast Delivery', NULL, NULL),
(33, 'App\\Models\\AdminFeature', 3, 'en', 'feature_description', 'Fastest delivery system to reach your customer.', NULL, NULL),
(34, 'App\\Models\\AdminFeature', 4, 'en', 'feature_name', 'Resonable Price', NULL, NULL),
(35, 'App\\Models\\AdminFeature', 4, 'en', 'feature_description', 'Start your business in cheap cost. In your budget', NULL, NULL),
(39, 'App\\Models\\DataSetting', 57, 'en', 'why_choose_us_title_1', 'Find your daily meal', NULL, NULL),
(40, 'App\\Models\\DataSetting', 59, 'en', 'why_choose_us_title_2', 'Easy to food ordering system', NULL, NULL),
(41, 'App\\Models\\DataSetting', 61, 'en', 'why_choose_us_title_3', 'Fastest food delivery service', NULL, NULL),
(42, 'App\\Models\\DataSetting', 63, 'en', 'why_choose_us_title_4', 'Track your food order', NULL, NULL),
(53, 'App\\Models\\DataSetting', 96, 'en', 'promotional_banner_title', 'Banner', NULL, NULL),
(111, 'App\\Models\\EmailTemplate', 1, 'en', 'title', 'Change Password Request', NULL, NULL),
(112, 'App\\Models\\EmailTemplate', 1, 'en', 'body', '<p>The following user has forgotten his password &amp; requested to change/reset their password.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>User Name: {userName}</strong></p>', NULL, NULL),
(113, 'App\\Models\\EmailTemplate', 1, 'en', 'button_name', '', NULL, NULL),
(114, 'App\\Models\\EmailTemplate', 1, 'en', 'footer_text', 'Footer Text Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(115, 'App\\Models\\EmailTemplate', 1, 'en', 'copyright_text', '© 2023 KnockDoor. All rights reserved.', NULL, NULL),
(116, 'App\\Models\\EmailTemplate', 2, 'en', 'title', 'New Restaurant Registration Request', NULL, NULL),
(117, 'App\\Models\\EmailTemplate', 2, 'en', 'body', '<p>Please find below the details of the new Restaurant registration:</p>\r\n\r\n<p><strong>Restaurant Name: </strong>{restaurantName}</p>\r\n\r\n<p>To review the Restaurant from the respective Module, go to:&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Or you can directly review the Restaurant here &rarr;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL),
(118, 'App\\Models\\EmailTemplate', 2, 'en', 'button_name', 'Review Request', NULL, NULL),
(119, 'App\\Models\\EmailTemplate', 2, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(120, 'App\\Models\\EmailTemplate', 2, 'en', 'copyright_text', '© 2024 Knockdoor. All rights reserved.', NULL, NULL),
(121, 'App\\Models\\EmailTemplate', 21, 'en', 'title', 'Your Registration is Successful!', NULL, NULL),
(122, 'App\\Models\\EmailTemplate', 21, 'en', 'body', '<p>Congratulations!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You&rsquo;ve successfully registered.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL),
(123, 'App\\Models\\EmailTemplate', 21, 'en', 'button_name', '', NULL, NULL),
(124, 'App\\Models\\EmailTemplate', 21, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(125, 'App\\Models\\EmailTemplate', 21, 'en', 'copyright_text', '© 2024 Knockdoor. All rights reserved.', NULL, NULL),
(126, 'App\\Models\\EmailTemplate', 22, 'en', 'title', 'Please Register with The OTP', NULL, NULL),
(127, 'App\\Models\\EmailTemplate', 22, 'en', 'body', '<p>ONE MORE STEP:&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Please copy the following OTP &amp; paste it on your sign-up page to complete your registration.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL),
(128, 'App\\Models\\EmailTemplate', 22, 'en', 'button_name', '', NULL, NULL),
(129, 'App\\Models\\EmailTemplate', 22, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(130, 'App\\Models\\EmailTemplate', 22, 'en', 'copyright_text', '© 2023 Knockdoor. All rights reserved.', NULL, NULL),
(131, 'App\\Models\\EmailTemplate', 23, 'en', 'title', 'Confirm Your Login with OTP.', NULL, NULL),
(132, 'App\\Models\\EmailTemplate', 23, 'en', 'body', '<p>Please copy the following OTP &amp; paste it on your Log in page to confirm your account.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL),
(133, 'App\\Models\\EmailTemplate', 23, 'en', 'button_name', '', NULL, NULL),
(134, 'App\\Models\\EmailTemplate', 23, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(135, 'App\\Models\\EmailTemplate', 23, 'en', 'copyright_text', '© 2023 Knockdoor. All rights reserved.', NULL, NULL),
(136, 'App\\Models\\EmailTemplate', 24, 'en', 'title', 'Please Verify Your Delivery.', NULL, NULL),
(137, 'App\\Models\\EmailTemplate', 24, 'en', 'body', '<p>Please give the following OTP to your Deliveryman to ensure your order.</p>', NULL, NULL),
(138, 'App\\Models\\EmailTemplate', 24, 'en', 'button_name', '', NULL, NULL),
(139, 'App\\Models\\EmailTemplate', 24, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(140, 'App\\Models\\EmailTemplate', 24, 'en', 'copyright_text', '© 2023 Knockdoor. All rights reserved.', NULL, NULL),
(141, 'App\\Models\\EmailTemplate', 25, 'en', 'title', 'Your Order is Successful', NULL, NULL),
(142, 'App\\Models\\EmailTemplate', 25, 'en', 'body', '<p>Hi {userName},</p>\r\n\r\n<p>Your order is successful. Please find your invoice below.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL),
(143, 'App\\Models\\EmailTemplate', 25, 'en', 'button_name', 'Review Request', NULL, NULL),
(144, 'App\\Models\\EmailTemplate', 25, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(145, 'App\\Models\\EmailTemplate', 25, 'en', 'copyright_text', '© 2024 Knockdoor. All rights reserved.', NULL, NULL),
(146, 'App\\Models\\EmailTemplate', 26, 'en', 'title', 'Refund Order', NULL, NULL),
(147, 'App\\Models\\EmailTemplate', 26, 'en', 'body', '<p>Hi {userName},</p>\r\n\r\n<p>We&rsquo;ve refunded your requested amount. Please find your refund invoice below.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL),
(148, 'App\\Models\\EmailTemplate', 26, 'en', 'button_name', '', NULL, NULL),
(149, 'App\\Models\\EmailTemplate', 26, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(150, 'App\\Models\\EmailTemplate', 26, 'en', 'copyright_text', '© 2024 Knockdoor. All rights reserved.', NULL, NULL),
(151, 'App\\Models\\EmailTemplate', 27, 'en', 'title', 'Your Refund Request was Rejected.', NULL, NULL),
(152, 'App\\Models\\EmailTemplate', 27, 'en', 'body', '<p>Dear {userName} ,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The amount you requested for a refund was rejected by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>To know more, please contact us.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL),
(153, 'App\\Models\\EmailTemplate', 27, 'en', 'button_name', '', NULL, NULL),
(154, 'App\\Models\\EmailTemplate', 27, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(155, 'App\\Models\\EmailTemplate', 27, 'en', 'copyright_text', '© 2024 Knockdoor. All rights reserved.', NULL, NULL),
(156, 'App\\Models\\EmailTemplate', 28, 'en', 'title', 'Reset Your Password', NULL, NULL),
(157, 'App\\Models\\EmailTemplate', 28, 'en', 'body', '<p>Please click on this link to reset your Password&nbsp;&rarr;</p>', NULL, NULL),
(158, 'App\\Models\\EmailTemplate', 28, 'en', 'button_name', '', NULL, NULL),
(159, 'App\\Models\\EmailTemplate', 28, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(160, 'App\\Models\\EmailTemplate', 28, 'en', 'copyright_text', '© 2024 Knockdoor. All rights reserved.', NULL, NULL),
(161, 'App\\Models\\EmailTemplate', 29, 'en', 'title', 'Fund Added to your Wallet.', NULL, NULL),
(162, 'App\\Models\\EmailTemplate', 29, 'en', 'body', '<p>Dear {userName}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The Admin has sent funds to your Wallet.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL),
(163, 'App\\Models\\EmailTemplate', 29, 'en', 'button_name', 'Review Request', NULL, NULL),
(164, 'App\\Models\\EmailTemplate', 29, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(165, 'App\\Models\\EmailTemplate', 29, 'en', 'copyright_text', '© 2024 Knockdoor. All rights reserved.', NULL, NULL),
(166, 'App\\Models\\DataSetting', 5, 'en', 'header_title', 'Nepal\'s Premium Online Food Delivery Platform', NULL, NULL),
(167, 'App\\Models\\DataSetting', 6, 'en', 'header_sub_title', 'BhojMandu stands as Nepal\'s premium online food delivery platform, redefining culinary experiences.', NULL, NULL),
(168, 'App\\Models\\DataSetting', 7, 'en', 'header_tag_line', 'Start Ordering & Enjoy !', NULL, NULL),
(169, 'App\\Models\\DataSetting', 8, 'en', 'header_app_button_name', 'Order Now', NULL, NULL),
(264, 'App\\Models\\DataSetting', 24, 'en', 'services_order_title_1', 'Order your food', NULL, NULL),
(265, 'App\\Models\\DataSetting', 25, 'en', 'services_order_title_2', 'Use BhojMandu app', NULL, NULL),
(266, 'App\\Models\\DataSetting', 26, 'en', 'services_order_description_1', 'Manage Order Food Tab very easily by using BhojMandu Restaurant Panel & Restaurant APP', NULL, NULL),
(267, 'App\\Models\\DataSetting', 27, 'en', 'services_order_description_2', 'Manage Order Food Tab', NULL, NULL),
(268, 'App\\Models\\DataSetting', 28, 'en', 'services_order_button_name', 'Download Now', NULL, NULL),
(271, 'App\\Models\\DataSetting', 55, 'en', 'why_choose_us_title', 'Why Choose Us?', NULL, NULL),
(272, 'App\\Models\\DataSetting', 56, 'en', 'why_choose_us_sub_title', 'What so Special About BhojMandu ?', NULL, NULL),
(273, 'App\\Models\\DataSetting', 22, 'en', 'services_title', 'Our Platform', NULL, NULL),
(274, 'App\\Models\\DataSetting', 23, 'en', 'services_sub_title', 'Earn money by using different way', NULL, NULL),
(279, 'App\\Models\\DataSetting', 31, 'en', 'services_manage_restaurant_title_1', 'Manage your order', NULL, NULL),
(280, 'App\\Models\\DataSetting', 32, 'en', 'services_manage_restaurant_title_2', 'Manage your wallet', NULL, NULL),
(281, 'App\\Models\\DataSetting', 33, 'en', 'services_manage_restaurant_description_1', 'Manage customer order very easily by using BhojMandu Restaurant Panel & Restaurant APP', NULL, NULL),
(282, 'App\\Models\\DataSetting', 34, 'en', 'services_manage_restaurant_description_2', 'Manage restaurant wallet and monitor restaurant earnings and transactions.', NULL, NULL),
(283, 'App\\Models\\DataSetting', 35, 'en', 'services_manage_restaurant_button_name', 'Download Now', NULL, NULL),
(284, 'App\\Models\\DataSetting', 45, 'en', 'earn_money_title', 'Earn Money', NULL, NULL),
(285, 'App\\Models\\DataSetting', 46, 'en', 'earn_money_sub_title', 'Earn money by using different platform', NULL, NULL),
(292, 'App\\Models\\DataSetting', 68, 'en', 'footer_data', 'BhojMandu 🍔📲 is a tech-savvy On-Demand online food delivery platform, revolutionizing the culinary experience by seamlessly connecting users with their favorite restaurants for hassle-free ordering.', NULL, NULL),
(293, 'App\\Models\\DataSetting', 97, 'en', 'about_us', '<p><strong>Introduction:</strong></p>\r\n\r\n<p><strong>BhojMandu</strong> leads the way as a pioneering, tech-savvy food delivery platform in Nepal. We fuse the power of food technology with convenience, reshaping culinary experiences across the nation. Our mission is to deliver unrivaled quality, harnessing cutting-edge technology to meet the evolving needs for convenience and safety in the food industry. Our groundbreaking concept includes night-time delivery, ensuring swift and hassle-free access to delicious meals right to your doorstep. Join us as we redefine the landscape of food delivery in Nepal!</p>\r\n\r\n<p><strong>Vision:</strong></p>\r\n\r\n<p>Our vision is to emerge as the foremost tech-driven provider of groundbreaking food delivery services in Nepal, delivering high-quality, convenient, and safe culinary solutions to both customers and restaurants. We aspire to redefine the landscape of food delivery by leveraging cutting-edge technology to enhance convenience and safety, setting new standards of excellence in the industry.</p>\r\n\r\n<p><strong>Mission:</strong></p>\r\n\r\n<ol>\r\n	<li><strong>Streamlining Culinary Enjoyment:</strong>&nbsp;Simplify the experience of relishing delicious, healthy meals without the hassle of cooking.</li>\r\n	<li><strong>Tech-Centric Solutions:</strong>&nbsp;Provide a reliable, safe, and tech-centric platform for food delivery and cloud kitchen solutions, ensuring efficiency and convenience.</li>\r\n	<li><strong>User-Friendly Experience:</strong>&nbsp;Deliver an efficient, cost-effective, and user-friendly service for both customers and restaurants.</li>\r\n	<li><strong>Tech-Driven Convenience:</strong>&nbsp;Offer a convenient, safe, and tech-driven way for customers to enjoy meals, backed by professional and personalized customer service.</li>\r\n</ol>\r\n\r\n<p><strong>Objectives:</strong></p>\r\n\r\n<ol>\r\n	<li><strong>Tech-Driven Innovation:</strong>&nbsp;Spearhead tech-driven solutions for secure and reliable food delivery and cloud kitchen services.</li>\r\n	<li><strong>User-Friendly Platform:</strong>&nbsp;Develop an easy-to-use and tech-centric platform for seamless interactions between customers and restaurants.</li>\r\n	<li><strong>Comprehensive Culinary Solutions:</strong>&nbsp;Provide a comprehensive range of tech-centric food delivery and cloud kitchen services.</li>\r\n	<li><strong>Customer-Centric Support:</strong>&nbsp;Ensure excellent customer service with a tech-centric approach, prioritizing user experience and satisfaction.</li>\r\n</ol>\r\n\r\n<p><strong>Goals:</strong></p>\r\n\r\n<ol>\r\n	<li><strong>Customer Satisfaction:</strong>&nbsp;Increase customer satisfaction by delivering high-quality services through tech-driven innovations.</li>\r\n	<li><strong>User Base Expansion:</strong>&nbsp;Expand the user base of both customers and restaurants through a user-friendly, tech-centric platform.</li>\r\n	<li><strong>Platform Enrichment:</strong>&nbsp;Enhance platform features through tech-centric advancements for an enriched culinary experience.</li>\r\n	<li><strong>Revenue Growth:</strong>&nbsp;Boost revenue generated by the platform through strategic tech-centric initiatives.</li>\r\n	<li><strong>Tech Leadership:</strong>&nbsp;Establish ourselves as the preferred online food delivery and cloud kitchen company in Nepal with a focus on tech leadership.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>', NULL, NULL),
(294, 'App\\Models\\DataSetting', 98, 'en', 'privacy_policy', '<p>&nbsp;</p>\r\n\r\n<p><strong>PRIVACY POLICY</strong></p>\r\n\r\n<p><em>Last updated: March 12, 2022</em></p>\r\n\r\n<p>This Privacy Policy outlines the policies and procedures of BhojMandu Food Pvt. Ltd. (&quot;the Company,&quot; &quot;We,&quot; &quot;Us,&quot; or &quot;Our&quot;) regarding the collection, use, and disclosure of Your information when You utilize the BhojMandu Food Delivery Service. It also informs You about Your privacy rights and how the law safeguards You.</p>\r\n\r\n<p>By using the BhojMandu Service, You agree to the collection and use of information in accordance with this Privacy Policy.</p>\r\n\r\n<p><strong>Interpretation and Definitions</strong></p>\r\n\r\n<p><strong>Interpretation:</strong> The capitalized words in this document have meanings defined under specific conditions. The defined terms have the same meaning regardless of their appearance in singular or plural form.</p>\r\n\r\n<p><strong>Definitions:</strong> For the purposes of this Privacy Policy:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Account:</strong> A unique account created for You to access our Service or specific parts of our Service.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Application:</strong> The software program provided by the Company and downloaded by You on any electronic device, named BhojMandu Food Delivery.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Company:</strong> Refers to BhojMandu Food Pvt. Ltd., Kathmandu-30, Nepal-44600, also referred to as &quot;the Company,&quot; &quot;We,&quot; &quot;Us,&quot; or &quot;Our&quot; in this Agreement.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Country:</strong> Refers to Nepal.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Device:</strong> Any device that can access the Service, such as a computer, cellphone, or digital tablet.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Personal Data:</strong> Any information relating to an identified or identifiable individual.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Service:</strong> Refers to the Application.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Service Provider:</strong> Any natural or legal person processing data on behalf of the Company, including third-party companies or individuals employed to facilitate or provide services related to the Service.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Third-party Social Media Service:</strong> Any website or social network through which a User can log in or create an account to use the Service.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Usage Data:</strong> Data collected automatically, generated by the use of the Service or from the Service infrastructure itself.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>You:</strong> The individual accessing or using the Service, or the entity on behalf of which such individual is accessing or using the Service.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Collecting and Using Your Personal Data</strong></p>\r\n\r\n<p><strong>Types of Data Collected:</strong></p>\r\n\r\n<p><strong>Personal Data:</strong> While using Our Service, We may ask You to provide personally identifiable information, including but not limited to:</p>\r\n\r\n<ul>\r\n	<li>Email address</li>\r\n	<li>First name and last name</li>\r\n	<li>Phone number</li>\r\n	<li>Address, State, Province, ZIP/Postal code, City</li>\r\n</ul>\r\n\r\n<p><strong>Usage Data:</strong> Usage Data is collected automatically during the use of the Service and may include information such as Your Device&#39;s IP address, browser type, pages visited, time and date of visit, time spent on pages, unique device identifiers, and other diagnostic data.</p>\r\n\r\n<p><strong>Push Notifications:</strong> We will utilize push notifications for order updates, offers, and contact in case of a user&#39;s phone being out of network.</p>\r\n\r\n<p><strong>Information from Third-Party Social Media Services:</strong> The Company allows You to create an account and log in to use the Service through Third-party Social Media Services, including Google, Facebook, and Twitter. If You choose to register through these services, We may collect Personal Data associated with Your Third-party Social Media Service&#39;s account.</p>\r\n\r\n<p><strong>Information Collected while Using the Application:</strong> With Your prior permission, We may collect information regarding Your location to provide and improve features of the Service. This information may be stored on the Company&#39;s servers or a Service Provider&#39;s server.</p>\r\n\r\n<p><strong>Use of Your Personal Data</strong></p>\r\n\r\n<p>The Company may use Personal Data for various purposes, including but not limited to:</p>\r\n\r\n<ul>\r\n	<li>Providing and maintaining the Service.</li>\r\n	<li>Managing Your Account and registration as a user.</li>\r\n	<li>Performance of contracts and undertaking of purchase contracts.</li>\r\n	<li>Contacting You for updates or informative communications related to the Service.</li>\r\n	<li>Providing news, special offers, and general information about goods, services, and events.</li>\r\n	<li>Managing Your requests and attending to Your inquiries.</li>\r\n	<li>Evaluating or conducting business transfers, mergers, or acquisitions.</li>\r\n	<li>Other purposes such as data analysis, identifying trends, and improving our Service.</li>\r\n</ul>\r\n\r\n<p><strong>Sharing Your Personal Information</strong></p>\r\n\r\n<p>We may share Your personal information in the following situations:</p>\r\n\r\n<ul>\r\n	<li>With Service Providers to monitor and analyze the use of our Service and to contact You.</li>\r\n	<li>For business transfers, in connection with any merger, sale of Company assets, financing, or acquisition.</li>\r\n	<li>With Affiliates, requiring them to honor this Privacy Policy.</li>\r\n	<li>With business partners to offer products, services, or promotions.</li>\r\n	<li>With other users in public areas of the Service or through Third-Party Social Media Services, as per Your interactions.</li>\r\n	<li>With Your consent for any other purpose.</li>\r\n</ul>\r\n\r\n<p><strong>Retention of Your Personal Data</strong></p>\r\n\r\n<p>The Company will retain Your Personal Data for as long as necessary for the purposes outlined in this Privacy Policy. Usage Data may be retained for internal analysis purposes.</p>\r\n\r\n<p><strong>Transfer of Your Personal Data</strong></p>\r\n\r\n<p>Your information, including Personal Data, may be processed at the Company&#39;s operating offices and other locations. By submitting such information, You consent to its transfer. The Company will take steps to ensure data security in accordance with this Privacy Policy.</p>\r\n\r\n<p><strong>Disclosure of Your Personal Data</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Business Transactions:</strong> If the Company is involved in a merger, acquisition, or asset sale, Your Personal Data may be transferred with notice.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Law Enforcement:</strong> Under certain circumstances, the Company may disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Other Legal Requirements:</strong> The Company may disclose Your Personal Data in good faith to comply with legal obligations, protect rights or property, prevent wrongdoing, or protect personal safety.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Security of Your Personal Data</strong></p>\r\n\r\n<p>While We strive for commercially acceptable security measures, no transmission over the Internet or electronic storage is 100% secure. We cannot guarantee absolute security but take reasonable steps to protect Your Personal Data.</p>\r\n\r\n<p><strong>Children&#39;s Privacy</strong></p>\r\n\r\n<p>Our Service does not address individuals under the age of 13. We do not knowingly collect personally identifiable information from anyone under 13. If You are a parent or guardian aware of Your child providing Personal Data, please contact Us. We take steps to remove such information from Our servers.</p>\r\n\r\n<p><strong>Links to Other Websites</strong></p>\r\n\r\n<p>Our Service may contain links to third-party websites. We advise reviewing the Privacy Policy of every site You visit as We have no control over their content, policies, or practices.</p>\r\n\r\n<p><strong>Changes to this Privacy Policy</strong></p>\r\n\r\n<p>We may update Our Privacy Policy, and changes become effective when posted on this page. We will notify You via email or a prominent notice on Our Service before changes take effect.</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If You have questions about this Privacy Policy, please contact Us:</p>\r\n\r\n<ul>\r\n	<li>By email:&nbsp;<a href=\"mailto:info@bhojmandu.com\">info@bhojmandu.com</a></li>\r\n	<li>By visiting:&nbsp;<a href=\"http://bhojmandu.com/contact-us\">bhojmandu.com/contact-us</a></li>\r\n	<li>By phone: 01-5909551</li>\r\n</ul>\r\n\r\n<p><strong>Head Office:</strong></p>\r\n\r\n<p>BhojMandu Food Pvt.Ltd. Kathmandu-30, Nepal</p>\r\n\r\n<p><em>Note: If anyone wants to delete...</em> (Add specific instructions for data deletion as needed)</p>', NULL, NULL),
(295, 'App\\Models\\DataSetting', 99, 'en', 'terms_and_conditions', '<p>Last Update: 23-Jan-2024 Time: 9:00 PM (GMT +5:45)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>TERMS &amp; CONDITIONS</strong></p>\r\n\r\n<p>Welcome to BhojMandu! Before you begin using our services, please take a moment to read and understand the following User Terms and Conditions. By accessing our website (https://bhojmandu.com) or using the BhojMandu Food Delivery App, you agree to comply with these terms. If you do not agree with any part of these terms, we kindly ask that you refrain from using our services.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>1. User Conduct</strong></p>\r\n\r\n<p>When using BhojMandu, you agree to abide by all applicable laws and regulations. Respect the rights of others and refrain from engaging in any activities that may disrupt or interfere with the proper functioning of our services.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2. Account Registration</strong></p>\r\n\r\n<p>To access certain features of our services, you may need to register for an account. Provide accurate and complete information during the registration process. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>3. Placing Orders</strong></p>\r\n\r\n<p>When placing orders through BhojMandu, ensure that all details, including delivery address and contact information, are accurate. Any discrepancies or issues should be reported promptly.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>4. Payments and Charges</strong></p>\r\n\r\n<p>Payment for orders should be made through the designated payment methods. By placing an order, you agree to pay all charges associated with the order. BhojMandu reserves the right to update prices and charges with notice.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>5. Delivery</strong></p>\r\n\r\n<p>Delivery times are estimates and may vary based on various factors. BhojMandu strives to provide timely delivery, but we are not liable for any delays or issues beyond our control.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>6. Cancellations and Refunds</strong></p>\r\n\r\n<p>Orders can be canceled within a specified time frame. Refunds, if applicable, will be processed according to our Refund Policy.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>7. User Content</strong></p>\r\n\r\n<p>Any content (reviews, comments, etc.) you submit to BhojMandu remains your property. However, you grant us a non-exclusive, royalty-free, worldwide, perpetual license to use, display, and distribute this content in connection with our services.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>8. Privacy and Data Security</strong></p>\r\n\r\n<p>BhojMandu values your privacy. Our Privacy Policy outlines how we collect, use, and safeguard your information. By using our services, you consent to our privacy practices.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>9. Load Fund</strong></p>\r\n\r\n<p>9.1. Load fund functionality allows you to add funds to your BhojMandu wallet.<br />\r\n9.2. Funds loaded into your BhojMandu wallet are intended for purchases on our platform and cannot be refunded to your original payment method.<br />\r\n9.3. Loaded funds are non-transferable and cannot be converted into cash or transferred to another BhojMandu user.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>10. Loyalty Points</strong></p>\r\n\r\n<p>10.1. Loyalty points are awarded as part of our loyalty program.<br />\r\n10.2. Loyalty points cannot be transferred to another BhojMandu user or converted into cash.<br />\r\n10.3. The purpose of loyalty points is for purchasing items from our platform or adding points to load funds.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>11. Updates and Modifications</strong></p>\r\n\r\n<p>BhojMandu may update these terms from time to time. Continued use of our services after such updates constitutes acceptance of the modified terms.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>12. Refer &amp; Earn Program</strong></p>\r\n\r\n<p>Eligibility: Open to all registered BhojMandu users. Users must be of legal age.<br />\r\nHow it Works: Referrers receive a unique coupon code. Referrers earn a specified amount once their referred friend completes their first order using the provided code.<br />\r\nReferral Criteria: Referee must be a new customer. The unique coupon code must be used during checkout.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>13. Termination</strong></p>\r\n\r\n<p>BhojMandu reserves the right to terminate or suspend your account at any time for violations of these terms or for any other reason. You may also terminate your account by following the provided procedures.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>14. Governing Law</strong></p>\r\n\r\n<p>These terms are governed by the laws applicable to the jurisdiction in which BhojMandu operates its services.<br />\r\nThank you for using BhojMandu! If you have any questions or concerns about these terms, please contact us at [info@bhojmandu.com].</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><strong>Vendor Terms &amp; Conditions&nbsp;</strong></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>By registering and participating as a vendor on the BhojMandu Food Delivery App, you agree to comply with the following terms and conditions:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>1. Registration and Account:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>1.1 To become a vendor on BhojMandu, you must complete the registration process accurately and provide all required information.<br />\r\n1.2 You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2. Menu and Pricing:</strong></p>\r\n\r\n<p>2.1 You are responsible for providing accurate and up-to-date menu information, including item descriptions and prices.<br />\r\n2.2 BhojMandu reserves the right to review and approve all menu items and pricing. Any changes must be communicated and approved by BhojMandu.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>3. Order Fulfillment:</strong></p>\r\n\r\n<p>3.1 You agree to fulfill orders promptly and within the specified time frame communicated to customers through the BhojMandu platform.<br />\r\n3.2 In the event of unavailability of an item, you must promptly notify BhojMandu and update the menu accordingly.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>4. Quality Assurance:</strong></p>\r\n\r\n<p>4.1 Maintain high standards of food quality, preparation, and presentation.<br />\r\n4.2 BhojMandu reserves the right to assess and monitor the quality of food and service provided to users.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>5. Payments and Commissions:</strong></p>\r\n\r\n<p>5.1 BhojMandu will facilitate payments from users on your behalf, deducting applicable commissions.<br />\r\n5.2 Commissions may vary and are subject to change. Details of commissions will be communicated to vendors.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>6. Refunds and Cancellations:</strong></p>\r\n\r\n<p>6.1 Vendors are responsible for refunding users in case of cancellations or unsatisfactory service.<br />\r\n6.2 BhojMandu may facilitate refunds on behalf of vendors and deduct the refund amount from future payments.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>7. Compliance with Laws:</strong></p>\r\n\r\n<p>7.1 Vendors must comply with all applicable laws and regulations related to food preparation, safety, and hygiene.<br />\r\n7.2 BhojMandu may request and verify necessary licenses and permits from vendors.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>8. Marketing and Promotions:</strong></p>\r\n\r\n<p>8.1 Vendors may be featured in BhojMandu marketing and promotional materials.<br />\r\n8.2 BhojMandu may run promotions or discounts on vendor items at its discretion.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>9. Termination of Agreement:</strong></p>\r\n\r\n<p>9.1 BhojMandu reserves the right to terminate the vendor agreement for violations of these terms or for any reason at its sole discretion.<br />\r\n9.2 Vendors may terminate their participation by providing notice to BhojMandu.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>10. Communication:</strong></p>\r\n\r\n<p>10.1 BhojMandu will communicate important information and updates to vendors through the provided contact details.<br />\r\n10.2 Vendors are responsible for promptly responding to communications from BhojMandu.<br />\r\nBy agreeing to these terms, you acknowledge that you have read, understood, and agreed to comply with the Vendor Terms &amp; Conditions of the BhojMandu Food Delivery App. BhojMandu reserves the right to update these terms periodically, and continued use of the platform implies acceptance of any changes.</p>', NULL, NULL),
(397, 'App\\Models\\DataSetting', 100, 'en', 'shipping_policy', '<p><br />\r\n<strong>1.Delivery Services:</strong></p>\r\n\r\n<p>BhojMandu strives to provide efficient and timely food delivery services to its users.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2.Delivery Areas:</strong></p>\r\n\r\n<p>We currently offer delivery services within specified geographic regions. Users can check the availability of our services in their area by entering their delivery address on the app.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>3.Order Processing Time:</strong></p>\r\n\r\n<p>Orders are typically processed promptly upon confirmation. The estimated delivery time is displayed during the order placement, and it may vary based on factors such as distance and restaurant preparation time.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>4.Delivery Partners:</strong></p>\r\n\r\n<p>BhojMandu engages reliable delivery partners to fulfill food orders. While we make every effort to ensure timely deliveries, unforeseen circumstances such as traffic, weather conditions, or restaurant preparation times may impact delivery schedules.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>5.Delivery Confirmation:</strong></p>\r\n\r\n<p>Delivery is considered complete once the order has been handed over to the user at the specified delivery address. Users are encouraged to verify their orders upon receipt.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>6.Incorrect Address:</strong></p>\r\n\r\n<p>BhojMandu is not responsible for delivery issues arising from incorrect or incomplete delivery addresses provided by the user. It is the user&#39;s responsibility to ensure the accuracy of the delivery information.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>7.Refund for Non-Delivery:</strong></p>\r\n\r\n<p>In the rare event of non-delivery due to factors within our control, users will be eligible for a refund. Refund requests should be communicated to BhojMandu customer support.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>8.Refund for Delayed Delivery:</strong></p>\r\n\r\n<p>BhojMandu aims to adhere to estimated delivery times, but delays may occur. Refund requests for delayed deliveries will be considered on a case-by-case basis. Users are encouraged to contact customer support for assistance.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>9.Digital Wallet Payments:</strong></p>\r\n\r\n<p>If a user pays through a digital wallet, any refund due to order cancellation will be credited to the user&#39;s BhojMandu wallet.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>10.Order Tracking:</strong></p>\r\n\r\n<p>Users can track the status of their orders in real-time through the BhojMandu app. Order tracking provides users with visibility into the order preparation, dispatch, and estimated delivery times.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Contact Us:</strong></p>\r\n\r\n<p>For any queries or concerns regarding our shipping policy or delivery services, please contact BhojMandu at info@bhojmandu.com. We are committed to providing a seamless and satisfactory food delivery experience for our users.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL),
(398, 'App\\Models\\DataSetting', 101, 'en', 'cancellation_policy', '<h3>&nbsp;</h3>\r\n\r\n<p><strong>1.Order Cancellation:</strong></p>\r\n\r\n<p>BhojMandu reserves the exclusive right to refuse or cancel any transaction/order for restaurants and services that are listed at an incorrect price or are not available. This applies regardless of order confirmation or payment confirmation. If payment has been processed by BhojMandu in such events, the amount will be refunded via the original mode of payment, except for cases where the user paid through a digital wallet. In such instances, the refund will be credited to the user&#39;s BhojMandu wallet. Once an order is placed, BhojMandu does not entertain user requests for order cancellations.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2.Delivery:</strong></p>\r\n\r\n<p>The title and risk of orders pass onto you upon delivery by BhojMandu (via our delivery personnel), and upon your acceptance of the orders. BhojMandu takes every care to deliver orders to the intended recipient but will not be held responsible for any wrong delivery based on the address given by the user or if any person falsely claims to be the recipient. BhojMandu reserves the right to deliver a similar or alternate order for reasons beyond its control, and such actions shall not be deemed as bad delivery. Users do not have the right to refuse the order at the time of receipt and must make the payment accordingly.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>3.Cancellation &amp; Refund Policy:</strong></p>\r\n\r\n<p>BhojMandu generally does not entertain order cancellations once placed on the restaurant. However, if a cancellation request is made before the order is placed on the restaurant, it is subject to the discretion of BhojMandu. In the event of late, bad, or incorrect delivery due to BhojMandu&#39;s process-related issues, the customer is generally not charged for the order, but this is at the discretion of BhojMandu. If the user paid through any digital wallet, the refund will be credited to their BhojMandu wallet in case of order cancellation.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>4.Refund Process:</strong></p>\r\n\r\n<p>The refund process typically takes 24-36 hours (except holidays).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Questions:</strong></p>\r\n\r\n<p>For any further questions on our privacy policy or other inquiries, feel free to contact BhojMandu at info@bhojmandu.com.</p>', NULL, NULL),
(399, 'App\\Models\\DataSetting', 102, 'en', 'refund_policy', '<p>&nbsp;</p>\r\n\r\n<p><strong>1.Order Cancellation:</strong></p>\r\n\r\n<p>BhojMandu reserves the exclusive right to refuse or cancel any transaction/order for restaurants and services that are listed at an incorrect price or are not available. This applies regardless of order confirmation or payment confirmation. If payment has been processed by BhojMandu in such events, the amount will be refunded via the original mode of payment, except for cases where the user paid through a digital wallet. In such instances, the refund will be credited to the user&#39;s BhojMandu wallet. Once an order is placed, BhojMandu does not entertain user requests for order cancellations.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2.Delivery:</strong></p>\r\n\r\n<p>The title and risk of orders pass onto you upon delivery by BhojMandu (via our delivery personnel), and upon your acceptance of the orders. BhojMandu takes every care to deliver orders to the intended recipient but will not be held responsible for any wrong delivery based on the address given by the user or if any person falsely claims to be the recipient. BhojMandu reserves the right to deliver a similar or alternate order for reasons beyond its control, and such actions shall not be deemed as bad delivery. Users do not have the right to refuse the order at the time of receipt and must make the payment accordingly.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>3.Cancellation &amp; Refund Policy:</strong></p>\r\n\r\n<p>BhojMandu generally does not entertain order cancellations once placed on the restaurant. However, if a cancellation request is made before the order is placed on the restaurant, it is subject to the discretion of BhojMandu. In the event of late, bad, or incorrect delivery due to BhojMandu&#39;s process-related issues, the customer is generally not charged for the order, but this is at the discretion of BhojMandu. If the user paid through any digital wallet, the refund will be credited to their BhojMandu wallet in case of order cancellation.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>4.Refund Process:</strong></p>\r\n\r\n<p>The refund process typically takes 24-36 hours (except holidays).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Questions:</strong></p>\r\n\r\n<p>For any further questions on our privacy policy or other inquiries, feel free to contact BhojMandu at info@bhojmandu.com.</p>', NULL, NULL),
(1347, 'App\\Models\\DataSetting', 38, 'en', 'services_manage_delivery_title_1', 'Deliver your food', NULL, NULL),
(1348, 'App\\Models\\DataSetting', 39, 'en', 'services_manage_delivery_title_2', 'Earn by delivery', NULL, NULL),
(1349, 'App\\Models\\DataSetting', 40, 'en', 'services_manage_delivery_description_1', 'Download Delivery Man App from Play store & App Store and Register as Delivery Man to provide food all over the area.', NULL, NULL),
(1350, 'App\\Models\\DataSetting', 41, 'en', 'services_manage_delivery_description_2', 'Become a delivery man and earn from every food delivery', NULL, NULL),
(1351, 'App\\Models\\DataSetting', 42, 'en', 'services_manage_delivery_button_name', 'Download Now', NULL, NULL),
(1446, 'App\\Models\\EmailTemplate', 7, 'en', 'title', 'Your Registration has been Submitted Success', NULL, NULL),
(1447, 'App\\Models\\EmailTemplate', 7, 'en', 'body', '<p>Dear {userName},</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;ve received your Restaurant Registration Request.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Soon you&rsquo;ll know if your Restaurant registration is accepted or declined by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Stay Tuned!</p>', NULL, NULL),
(1448, 'App\\Models\\EmailTemplate', 7, 'en', 'button_name', '', NULL, NULL),
(1449, 'App\\Models\\EmailTemplate', 7, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(1450, 'App\\Models\\EmailTemplate', 7, 'en', 'copyright_text', '© 2024 BhojMandu. All rights reserved.', NULL, NULL),
(1461, 'App\\Models\\DataSetting', 65, 'en', 'testimonial_title', 'Hear it From Our Teams & Restaurants', NULL, NULL),
(1729, 'App\\Models\\Banner', 9, 'en', 'title', 'Pizza Offer', NULL, NULL),
(1730, 'App\\Models\\Banner', 10, 'en', 'title', 'Order more', NULL, NULL),
(1731, 'App\\Models\\Banner', 11, 'en', 'title', 'new', NULL, NULL),
(1788, 'App\\Models\\Banner', 12, 'en', 'title', 'lunch box', NULL, NULL),
(1842, 'App\\Models\\Banner', 13, 'en', 'title', 'Cashback dhamak', NULL, NULL),
(1959, 'App\\Models\\Banner', 14, 'en', 'title', 'Cashback Dhamaka', NULL, NULL),
(1992, 'App\\Models\\EmployeeRole', 1, 'en', 'name', 'Order Department', NULL, NULL),
(2065, 'App\\Models\\Banner', 16, 'en', 'title', 'Imepay', NULL, NULL),
(2247, 'App\\Models\\Banner', 17, 'en', 'title', 'food music', NULL, NULL),
(2248, 'App\\Models\\Banner', 18, 'en', 'title', 'food music', NULL, NULL),
(2611, 'App\\Models\\EmailTemplate', 30, 'en', 'title', NULL, NULL, NULL),
(2612, 'App\\Models\\EmailTemplate', 30, 'en', 'body', NULL, NULL, NULL),
(2613, 'App\\Models\\EmailTemplate', 30, 'en', 'body_2', NULL, NULL, NULL),
(2614, 'App\\Models\\EmailTemplate', 30, 'en', 'button_name', '', NULL, NULL),
(2615, 'App\\Models\\EmailTemplate', 30, 'en', 'footer_text', NULL, NULL, NULL),
(2616, 'App\\Models\\EmailTemplate', 30, 'en', 'copyright_text', NULL, NULL, NULL),
(2617, 'App\\Models\\EmailTemplate', 31, 'en', 'title', NULL, NULL, NULL),
(2618, 'App\\Models\\EmailTemplate', 31, 'en', 'body', NULL, NULL, NULL),
(2619, 'App\\Models\\EmailTemplate', 31, 'en', 'button_name', '', NULL, NULL),
(2620, 'App\\Models\\EmailTemplate', 31, 'en', 'footer_text', NULL, NULL, NULL),
(2621, 'App\\Models\\EmailTemplate', 31, 'en', 'copyright_text', '© 2024 BhojMandu. All rights reserved.', NULL, NULL),
(2622, 'App\\Models\\EmailTemplate', 10, 'en', 'title', 'Congratulations! Your Withdrawal is Approved!', NULL, NULL),
(2623, 'App\\Models\\EmailTemplate', 10, 'en', 'body', '<p>Dear {userName},</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The amount you requested to withdraw is approved by the Admin and transferred to your bank account.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL),
(2624, 'App\\Models\\EmailTemplate', 10, 'en', 'button_name', 'Review Request', NULL, NULL),
(2625, 'App\\Models\\EmailTemplate', 10, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(2626, 'App\\Models\\EmailTemplate', 10, 'en', 'copyright_text', '© 2024 BhojMandu. All rights reserved.', NULL, NULL),
(2627, 'App\\Models\\EmailTemplate', 9, 'en', 'title', 'Your Registration has been Rejected', NULL, NULL),
(2628, 'App\\Models\\EmailTemplate', 9, 'en', 'body', '<p>Dear {userName} ,&nbsp;</p>\r\n\r\n<p>We&rsquo;re sorry to announce that your Restaurant registration was rejected by the Admin.&nbsp;</p>\r\n\r\n<p>To find out more, please contact us.&nbsp;</p>', NULL, NULL),
(2629, 'App\\Models\\EmailTemplate', 9, 'en', 'button_name', '', NULL, NULL),
(2630, 'App\\Models\\EmailTemplate', 9, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(2631, 'App\\Models\\EmailTemplate', 9, 'en', 'copyright_text', '© 2024 BhojMandu. All rights reserved.', NULL, NULL),
(2632, 'App\\Models\\EmailTemplate', 13, 'en', 'title', 'Congratulations! Your Request is Approved!', NULL, NULL),
(2633, 'App\\Models\\EmailTemplate', 13, 'en', 'body', '<p>Dear {userName} ,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your request to join &lsquo;&rsquo;BUY ONE GET ONE&rdquo; campaign is approved by the Admin.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL),
(2634, 'App\\Models\\EmailTemplate', 13, 'en', 'button_name', 'View Status', NULL, NULL),
(2635, 'App\\Models\\EmailTemplate', 13, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(2636, 'App\\Models\\EmailTemplate', 13, 'en', 'copyright_text', '© 2024 BhojMandu. All rights reserved.', NULL, NULL),
(3604, 'App\\Models\\Banner', 20, 'en', 'title', 'Barsha offer', NULL, NULL),
(3872, 'App\\Models\\Banner', 21, 'en', 'title', 'Load & Earn', NULL, NULL),
(3895, 'App\\Models\\EmailTemplate', 3, 'en', 'title', 'New Professionalman Registration Request', NULL, NULL),
(3896, 'App\\Models\\EmailTemplate', 3, 'en', 'body', '<p>Please find below the details of the new Professionalman registration:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Professionalman Name: </strong>{deliveryManName}</p>\r\n\r\n<p>To review the Restaurant from the respective Module, go to:&nbsp;</p>\r\n\r\n<p><strong>Professionalman Management&rarr;New Professionalman</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Or you can directly review the Restaurant here &rarr;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL),
(3897, 'App\\Models\\EmailTemplate', 3, 'en', 'button_name', 'Review Request', NULL, NULL),
(3898, 'App\\Models\\EmailTemplate', 3, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(3899, 'App\\Models\\EmailTemplate', 3, 'en', 'copyright_text', '© 2023 Knockdoor. All rights reserved.', NULL, NULL),
(3900, 'App\\Models\\EmailTemplate', 15, 'en', 'title', 'Your Registration is Completed!', NULL, NULL),
(3901, 'App\\Models\\EmailTemplate', 15, 'en', 'body', '<p>Dear {userName},</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;ve received your Professionalman Registration Request.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Soon you&rsquo;ll know if your Professionalman registration is accepted or declined by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Stay Tuned!</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL),
(3902, 'App\\Models\\EmailTemplate', 15, 'en', 'button_name', '', NULL, NULL),
(3903, 'App\\Models\\EmailTemplate', 15, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(3904, 'App\\Models\\EmailTemplate', 15, 'en', 'copyright_text', '© 2023 Knockdoor. All rights reserved.', NULL, NULL),
(3905, 'App\\Models\\EmailTemplate', 16, 'en', 'title', 'Congratulations! Your Registration is Approve', NULL, NULL),
(3906, 'App\\Models\\EmailTemplate', 16, 'en', 'body', '<p>Dear {professionalManName} ,</p>\n\n<p>&nbsp;</p>\n\n<p>Your registration is approved by the Admin.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p><strong>Here&rsquo;s what to do next:&nbsp;</strong></p>\n\n<ol>\n	<li>Download the Professionalman app</li>\n	<li>Login with the below credentials.</li>\n</ol>\n\n<p><strong>After that,</strong> please set up your account and start delivery!&nbsp;</p>\n\n<p><br />\n<strong>Click here</strong><strong> to download the app&rarr; </strong><em>Download link to the KnockDoor Professionalman app</em></p>', NULL, NULL),
(3907, 'App\\Models\\EmailTemplate', 16, 'en', 'button_name', '', NULL, NULL),
(3908, 'App\\Models\\EmailTemplate', 16, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(3909, 'App\\Models\\EmailTemplate', 16, 'en', 'copyright_text', '© 2023 Knockdoor. All rights reserved.', NULL, NULL);
INSERT INTO `translations` (`id`, `translationable_type`, `translationable_id`, `locale`, `key`, `value`, `created_at`, `updated_at`) VALUES
(3910, 'App\\Models\\EmailTemplate', 17, 'en', 'title', 'Your Registration has been Rejected', NULL, NULL),
(3911, 'App\\Models\\EmailTemplate', 17, 'en', 'body', '<p>Dear {professionalManName},</p>\n\n<p>&nbsp;</p>\n\n<p>We&rsquo;re sorry to announce that your Professionalman registration was rejected by the Admin.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>To find out more, please contact us.</p>\n\n<p>&nbsp;</p>', NULL, NULL),
(3912, 'App\\Models\\EmailTemplate', 17, 'en', 'button_name', '', NULL, NULL),
(3913, 'App\\Models\\EmailTemplate', 17, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(3914, 'App\\Models\\EmailTemplate', 17, 'en', 'copyright_text', '© 2023 Knockdoor. All rights reserved.', NULL, NULL),
(3915, 'App\\Models\\EmailTemplate', 18, 'en', 'title', 'Your Account is Suspended.', NULL, NULL),
(3916, 'App\\Models\\EmailTemplate', 18, 'en', 'body', '<p>Dear {professionalManName},</p>\n\n<p>&nbsp;</p>\n\n<p>Your Professionalman account has been suspended by the Admin.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>Please contact the related person to know more.</p>\n\n<p>&nbsp;</p>', NULL, NULL),
(3917, 'App\\Models\\EmailTemplate', 18, 'en', 'button_name', '', NULL, NULL),
(3918, 'App\\Models\\EmailTemplate', 18, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(3919, 'App\\Models\\EmailTemplate', 18, 'en', 'copyright_text', '© 2023 Knockdoor. All rights reserved.', NULL, NULL),
(3921, 'App\\Models\\AdminRole', 5, 'en', 'name', 'Role for Employee', NULL, NULL),
(3927, 'App\\Models\\Banner', 22, 'en', 'title', 'New Product Launch', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest` varchar(191) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(191) NOT NULL DEFAULT 'zone_wise',
  `order_count` int(11) NOT NULL DEFAULT 0,
  `login_medium` varchar(191) DEFAULT NULL,
  `social_id` varchar(191) DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `wallet_balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `loyalty_point` decimal(24,3) NOT NULL DEFAULT 0.000,
  `ref_code` varchar(191) DEFAULT NULL,
  `ref_by` bigint(20) UNSIGNED DEFAULT NULL,
  `temp_token` varchar(255) DEFAULT NULL,
  `current_language_key` varchar(255) DEFAULT 'en',
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

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
-- Indexes for table `admin_features`
--
ALTER TABLE `admin_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
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
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletters_email_unique` (`email`);

--
-- Indexes for table `notification_settings`
--
ALTER TABLE `notification_settings`
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
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_phone_unique` (`phone`) USING BTREE,
  ADD UNIQUE KEY `users_ref_code_unique` (`ref_code`) USING BTREE,
  ADD KEY `users_zone_id_index` (`zone_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_features`
--
ALTER TABLE `admin_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=534;

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
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
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
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `notification_settings`
--
ALTER TABLE `notification_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

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
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
