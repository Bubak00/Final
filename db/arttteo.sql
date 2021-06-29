-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2021 at 12:54 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arttteo`
--

-- --------------------------------------------------------

--
-- Table structure for table `balance_histories`
--

CREATE TABLE `balance_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `balance_before_transaction` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `balance_histories`
--

INSERT INTO `balance_histories` (`id`, `user_id`, `amount`, `balance_before_transaction`, `created_at`, `updated_at`) VALUES
(1, 1, 500, 3000, '2021-06-12 15:13:05', '2021-06-12 15:13:05'),
(2, 1, 500, 3500, '2021-06-12 15:13:35', '2021-06-12 15:13:35'),
(3, 1, 500, 4000, '2021-06-12 18:13:41', '2021-06-12 18:13:41'),
(4, 1, 500, 4500, '2021-06-12 18:14:03', '2021-06-12 18:14:03'),
(5, 1, 500, 5000, '2021-06-12 18:14:19', '2021-06-12 18:14:19'),
(6, 1, 500, 5500, '2021-06-12 18:14:32', '2021-06-12 18:14:32'),
(7, 2, 100, 100, '2021-06-12 18:34:39', '2021-06-12 18:34:39'),
(8, 2, 100, 100, '2021-06-12 18:34:40', '2021-06-12 18:34:40'),
(9, 2, 9000, 9000, '2021-06-12 18:34:51', '2021-06-12 18:34:51'),
(10, 2, 90000, 90000, '2021-06-12 18:34:57', '2021-06-12 18:34:57'),
(11, 2, 90000, 90000, '2021-06-12 18:37:53', '2021-06-12 18:37:53'),
(12, 1, 500, -276800, '2021-06-12 18:40:03', '2021-06-12 18:40:03'),
(13, 1, 900000, -276300, '2021-06-12 18:40:10', '2021-06-12 18:40:10'),
(14, 2, 900000, 90000, '2021-06-12 18:40:15', '2021-06-12 18:40:15'),
(15, 2, 9000000, 9000000, '2021-06-12 18:49:05', '2021-06-12 18:49:05'),
(16, 1, 90000000, -8466300, '2021-06-12 18:49:54', '2021-06-12 18:49:54'),
(17, 2, 9, 9, '2021-06-12 18:50:04', '2021-06-12 18:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_06_12_184143_create_balance_histories_table', 2),
(5, '2021_06_12_212729_create_transfers_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_user_id` bigint(20) UNSIGNED NOT NULL,
  `recipient_user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `commission_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transfers`
--

INSERT INTO `transfers` (`id`, `sender_user_id`, `recipient_user_id`, `amount`, `commission_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 100, 1, '2021-06-12 18:19:33', '2021-06-12 18:19:33'),
(2, 1, 2, 100, 1, '2021-06-12 18:21:33', '2021-06-12 18:21:33'),
(3, 1, 2, 100, 1, '2021-06-12 18:24:57', '2021-06-12 18:24:57'),
(4, 1, 2, 100, 1, '2021-06-12 18:34:39', '2021-06-12 18:34:39'),
(5, 1, 2, 100, 1, '2021-06-12 18:34:40', '2021-06-12 18:34:40'),
(6, 1, 2, 9000, 90, '2021-06-12 18:34:51', '2021-06-12 18:34:51'),
(7, 1, 2, 90000, 900, '2021-06-12 18:34:57', '2021-06-12 18:34:57'),
(8, 1, 2, 90000, 900, '2021-06-12 18:37:53', '2021-06-12 18:37:53'),
(9, 1, 2, 9000000, 90000, '2021-06-12 18:49:05', '2021-06-12 18:49:05'),
(10, 1, 2, 9, 0, '2021-06-12 18:50:04', '2021-06-12 18:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` smallint(5) UNSIGNED NOT NULL DEFAULT 2,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `balance`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'nika', 'test@gmail.com', 81533691, NULL, '$2y$10$8wpD/s47SC4xqTkB40Ebwu1FUX58NtTu2N537UeukGr7DEWDDDNIO', 1, NULL, '2021-06-12 12:53:34', '2021-06-12 18:50:04'),
(2, 'nika', 'test2@gmail.com', 9, NULL, '$2y$10$9rY6aytm8/V8B6xXecY0xudzts39dAnViYDdBkAgc/n2h2GlVNPKC', 2, NULL, '2021-06-12 18:15:14', '2021-06-12 18:50:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance_histories`
--
ALTER TABLE `balance_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `balance_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfers__sender_user_id_foreign` (`sender_user_id`),
  ADD KEY `transfers__recipient_user_id_foreign` (`recipient_user_id`);

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
-- AUTO_INCREMENT for table `balance_histories`
--
ALTER TABLE `balance_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `balance_histories`
--
ALTER TABLE `balance_histories`
  ADD CONSTRAINT `balance_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers__recipient_user_id_foreign` FOREIGN KEY (`recipient_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `transfers__sender_user_id_foreign` FOREIGN KEY (`sender_user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
