-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 16, 2025 at 04:12 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `api_keys`
--

INSERT INTO `api_keys` (`id`, `api_key`, `description`, `created_at`) VALUES
(1, 'Lalatendu@594', 'Test API key', '2025-01-16 14:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `api_logs`
--

CREATE TABLE `api_logs` (
  `id` int(11) NOT NULL,
  `api_key_id` int(11) DEFAULT NULL,
  `endpoint` varchar(255) DEFAULT NULL,
  `accessed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `api_logs`
--

INSERT INTO `api_logs` (`id`, `api_key_id`, `endpoint`, `accessed_at`) VALUES
(1, 1, '/apifont.php?api_key=abc123xyz', '2025-01-16 14:47:58'),
(2, 1, '/apifont.php?api_key=abc123xyz', '2025-01-16 14:48:23'),
(3, 1, '/apifont.php?api_key=abc123xyz', '2025-01-16 14:50:46'),
(4, 1, '/apifont.php', '2025-01-16 14:50:52'),
(5, 1, '/apifont.php?api_key=abc123xyz', '2025-01-16 15:04:53'),
(6, 1, '/apifont.php?api_key=abc123xyz', '2025-01-16 15:05:05'),
(7, 1, '/apifont.php?api_key=Lalatendu@594', '2025-01-16 15:06:41'),
(8, 1, '/apifont.php', '2025-01-16 15:07:07'),
(9, 1, '/apifont.php?api_key=Lalatendu@594', '2025-01-16 15:08:16'),
(10, 1, '/apifont.php?api_key=Lalatendu@594', '2025-01-16 15:08:24'),
(11, 1, '/apifont.php', '2025-01-16 15:09:47'),
(12, 1, '/apifont.php', '2025-01-16 15:09:50'),
(13, 1, '/apifont.php', '2025-01-16 15:11:35'),
(14, 1, '/apifont.php', '2025-01-16 15:11:38'),
(15, 1, '/apifont.php', '2025-01-16 15:11:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_key` (`api_key`);

--
-- Indexes for table `api_logs`
--
ALTER TABLE `api_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_key_id` (`api_key_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `api_logs`
--
ALTER TABLE `api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_logs`
--
ALTER TABLE `api_logs`
  ADD CONSTRAINT `api_logs_ibfk_1` FOREIGN KEY (`api_key_id`) REFERENCES `api_keys` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
