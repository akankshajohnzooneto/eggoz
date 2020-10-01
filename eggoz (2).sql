-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2020 at 09:51 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eggoz`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `addressLine1` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `addressLine2` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `locality` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `cityID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `version` int(11) DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `addressLine1`, `addressLine2`, `locality`, `cityID`, `latitude`, `longitude`, `version`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'fsdfsd', 'uuu', 'df', 23, NULL, NULL, 0, '2020-09-30 14:20:27', '2020-09-30 14:20:27', NULL),
(2, 'SK nagar', 'motihari', 'bihar', 23, NULL, NULL, 0, '2020-09-30 14:55:22', '2020-09-30 14:55:22', NULL),
(3, 'lorem', 'ipsum', 'dummy', 22, NULL, NULL, 0, '2020-09-30 16:51:07', '2020-09-30 16:51:07', NULL),
(4, 'jhjhj', 'jhjh', 'jhjh', 22, NULL, NULL, 0, '2020-09-30 17:05:46', '2020-09-30 17:05:46', NULL),
(5, 'jhjhj', 'kkjk', 'kjkj', 22, NULL, NULL, 0, '2020-09-30 17:07:27', '2020-09-30 17:07:27', NULL),
(6, 'kjkj', 'jhjhj', 'rrr', 22, NULL, NULL, 0, '2020-09-30 17:09:07', '2020-09-30 17:09:07', NULL),
(7, 'kjkj', 'kjkjk', 'jhkhj', 22, NULL, NULL, 0, '2020-09-30 17:10:29', '2020-09-30 17:10:29', NULL),
(8, 'jhjhj', 'kjkjk', 'hjhj', 22, NULL, NULL, 0, '2020-09-30 17:11:09', '2020-09-30 17:11:09', NULL),
(9, 'jhjhj', 'jkjk', 'jkjkjk', 22, NULL, NULL, 0, '2020-09-30 17:12:19', '2020-09-30 17:12:19', NULL),
(10, 'jkkjk', 'kjkj', 'nnj', 22, NULL, NULL, 0, '2020-09-30 17:14:05', '2020-09-30 17:14:05', NULL),
(11, 'lorem', 'ipsum', 'dummy', 22, NULL, NULL, 0, '2020-09-30 17:14:57', '2020-09-30 17:14:57', NULL),
(12, 'hello', 'ji', 'jhjhj', 22, NULL, NULL, 0, '2020-09-30 17:44:37', '2020-09-30 17:44:37', NULL),
(13, 'lorem', 'ipsum', 'dummy', 23, NULL, NULL, 0, '2020-09-30 19:06:00', '2020-09-30 19:06:00', NULL),
(14, 'lorem ipsum', 'dummy', 'new delhi', 23, NULL, NULL, 0, '2020-09-30 19:08:19', '2020-09-30 19:08:19', NULL),
(15, 'Round street', 'egde', 'new delhi', 22, NULL, NULL, 0, '2020-09-30 19:09:01', '2020-09-30 19:09:01', NULL),
(16, 'Round street', 'egde', 'new delhi', 22, NULL, NULL, 0, '2020-09-30 19:09:11', '2020-09-30 19:09:11', NULL),
(17, 'hello', 'ji', 'jhjhj', 22, NULL, NULL, 0, '2020-09-30 19:10:58', '2020-09-30 19:10:58', NULL),
(18, 'L-center', 'DK', 'new delhi', 23, NULL, NULL, 0, '2020-09-30 19:15:05', '2020-09-30 19:15:05', NULL),
(19, 'lorem', 'ipsum', 'new delhi', 22, NULL, NULL, 0, '2020-09-30 19:15:44', '2020-09-30 19:15:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `id` bigint(20) NOT NULL,
  `farmid` bigint(20) NOT NULL,
  `size` int(11) NOT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(256) DEFAULT 'system',
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT 0,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `isPublished` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `locationHierarchyID` int(11) DEFAULT NULL,
  `countryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `timezone`, `version`, `latitude`, `longitude`, `isPublished`, `createdAt`, `updatedAt`, `deletedAt`, `state`, `locationHierarchyID`, `countryID`) VALUES
(22, 'Delhi', 'GMT+5:30', 0, 28.6472799, 76.8130644, 1, '2020-09-30 13:15:32', '2020-09-30 13:15:32', NULL, 'Delhi', NULL, 1),
(23, 'Mumbai', 'GMT+5:30', 0, 19.0825223, 72.7410978, 1, '2020-09-30 13:23:37', '2020-09-30 13:23:37', NULL, 'Maharashtra', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` bigint(20) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  `primary_phone` int(11) DEFAULT NULL,
  `alternate_phone` int(11) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `contacttype` int(11) NOT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(256) DEFAULT 'system',
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `status`, `created_at`) VALUES
(1, 'India', 1, '2020-09-29 08:33:56');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL,
  `customer` bigint(20) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(256) DEFAULT 'system',
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_transaction`
--

CREATE TABLE `customer_transaction` (
  `id` bigint(20) NOT NULL,
  `customer` bigint(20) NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  `sku_quantity` int(11) NOT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(256) DEFAULT 'system',
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `egg_inventory`
--

CREATE TABLE `egg_inventory` (
  `id` bigint(20) NOT NULL,
  `flockid` bigint(20) NOT NULL,
  `farmid` bigint(20) NOT NULL,
  `size` bigint(20) NOT NULL,
  `logistics` bigint(20) DEFAULT NULL,
  `warehouse` bigint(20) DEFAULT NULL,
  `batchid` bigint(20) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `stage` bigint(20) NOT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(256) DEFAULT 'system',
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_id` int(11) NOT NULL,
  `docsUrl` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `employeeType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `farm`
--

CREATE TABLE `farm` (
  `id` bigint(20) NOT NULL,
  `name` varchar(80) NOT NULL,
  `address_id` int(11) NOT NULL,
  `capacity` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(256) DEFAULT 'system',
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farm`
--

INSERT INTO `farm` (`id`, `name`, `address_id`, `capacity`, `created_at`, `update_at`, `deleted_at`, `created_by`, `version`) VALUES
(2, 'lorem', 1, 34, '2020-09-30 08:50:27', '2020-09-30 08:50:27', NULL, 'system', 1),
(3, 'Classics', 2, 345, '2020-09-30 10:28:17', '2020-09-30 09:25:22', NULL, 'system', 0),
(4, 'Kishan lal', 3, 0, '2020-09-30 11:21:07', '2020-09-30 11:21:07', NULL, 'system', 1),
(5, 'Egg', 13, 1000, '2020-09-30 13:36:00', '2020-09-30 13:36:00', NULL, 'system', 1),
(6, 'Grain', 14, 10000, '2020-09-30 13:38:26', '2020-09-30 13:38:19', NULL, 'system', 0),
(7, 'Wheat', 18, 247, '2020-09-30 13:45:15', '2020-09-30 13:45:06', NULL, 'system', 0);

-- --------------------------------------------------------

--
-- Table structure for table `farmer`
--

CREATE TABLE `farmer` (
  `id` bigint(20) NOT NULL,
  `farm_id` int(11) NOT NULL,
  `farmer` varchar(255) NOT NULL,
  `address_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(256) NOT NULL DEFAULT 'system',
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `farmer`
--

INSERT INTO `farmer` (`id`, `farm_id`, `farmer`, `address_id`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `version`) VALUES
(5, 2, 'kjkjkj', 10, '0000-00-00 00:00:00', NULL, NULL, 'system', 0),
(6, 2, 'Ritik', 11, '2020-09-30 11:44:57', NULL, NULL, 'system', 0),
(7, 3, 'lalu', 12, '2020-09-30 12:14:37', NULL, NULL, 'system', 0),
(10, 3, 'lalus', 17, '2020-09-30 13:40:58', NULL, NULL, 'system', 0),
(11, 3, 'John doe', 19, '2020-09-30 13:45:44', NULL, NULL, 'system', 0);

-- --------------------------------------------------------

--
-- Table structure for table `farm_inventory`
--

CREATE TABLE `farm_inventory` (
  `id` bigint(20) NOT NULL,
  `flockid` bigint(20) NOT NULL,
  `farmid` bigint(20) NOT NULL,
  `stage` bigint(20) NOT NULL,
  `size` bigint(20) NOT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(256) DEFAULT 'system',
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flock`
--

CREATE TABLE `flock` (
  `id` bigint(20) NOT NULL,
  `name` varchar(80) NOT NULL,
  `flock_type` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(256) DEFAULT 'system',
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flock`
--

INSERT INTO `flock` (`id`, `name`, `flock_type`, `quantity`, `created_date`, `updated_date`, `created_by`, `version`) VALUES
(5, 'Sheep', 2, 3, '2020-09-30 11:54:28', '2020-09-30 12:38:06', 'system', 2),
(7, 'Horses', 2, 24, '2020-09-30 19:05:17', '2020-09-30 19:05:28', 'system', 2),
(10, 'Hen', 1, 25, '2020-09-30 19:14:19', '2020-09-30 19:14:25', 'system', 2);

-- --------------------------------------------------------

--
-- Table structure for table `logistics_transactions`
--

CREATE TABLE `logistics_transactions` (
  `id` bigint(20) NOT NULL,
  `driver` int(11) NOT NULL,
  `batch` bigint(20) DEFAULT NULL,
  `locationType` int(11) NOT NULL,
  `sourceLocation` bigint(20) NOT NULL,
  `destinationLocation` bigint(20) NOT NULL,
  `vehicleno` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(256) DEFAULT 'system',
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qc`
--

CREATE TABLE `qc` (
  `id` bigint(20) NOT NULL,
  `qc_date` date NOT NULL,
  `batch` bigint(20) NOT NULL,
  `broken_eggs` bigint(20) DEFAULT NULL,
  `discarded_eggs` bigint(20) DEFAULT NULL,
  `discard_reason` text DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(256) DEFAULT 'system',
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sku`
--

CREATE TABLE `sku` (
  `id` bigint(20) NOT NULL,
  `sku_type` bigint(20) NOT NULL,
  `sku_name` varchar(80) NOT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(256) DEFAULT 'system',
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sku_items`
--

CREATE TABLE `sku_items` (
  `id` bigint(20) NOT NULL,
  `skuid` bigint(20) NOT NULL,
  `batchid` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(256) DEFAULT 'system',
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sku_type`
--

CREATE TABLE `sku_type` (
  `id` bigint(20) NOT NULL,
  `name` bigint(20) NOT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(256) DEFAULT 'system',
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stage`
--

CREATE TABLE `stage` (
  `id` bigint(20) NOT NULL,
  `name` bigint(20) NOT NULL,
  `stagetype` int(11) NOT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(256) DEFAULT 'system',
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `name`, `country_id`, `status`, `created_at`) VALUES
(1, 'zxzxzx', 2, 0, '2020-09-29 12:03:45'),
(2, 'lorem', 2, 1, '2020-09-29 15:35:20'),
(3, 'Dhaka', 3, 1, '2020-09-29 15:43:12'),
(4, 'Delhi', 1, 1, '2020-09-29 15:45:46'),
(5, 'lorem', 0, 1, '2020-09-30 05:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email_id`, `password`, `status`) VALUES
(1, 'admin', 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` bigint(20) NOT NULL,
  `warehouse` bigint(20) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(256) DEFAULT 'system',
  `version` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `primary_phone` (`primary_phone`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_transaction`
--
ALTER TABLE `customer_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `egg_inventory`
--
ALTER TABLE `egg_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `farm`
--
ALTER TABLE `farm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmer`
--
ALTER TABLE `farmer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_inventory`
--
ALTER TABLE `farm_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flock`
--
ALTER TABLE `flock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logistics_transactions`
--
ALTER TABLE `logistics_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qc`
--
ALTER TABLE `qc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sku`
--
ALTER TABLE `sku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sku_items`
--
ALTER TABLE `sku_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sku_type`
--
ALTER TABLE `sku_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stage`
--
ALTER TABLE `stage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_transaction`
--
ALTER TABLE `customer_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `egg_inventory`
--
ALTER TABLE `egg_inventory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1219;

--
-- AUTO_INCREMENT for table `farm`
--
ALTER TABLE `farm`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `farmer`
--
ALTER TABLE `farmer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `farm_inventory`
--
ALTER TABLE `farm_inventory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flock`
--
ALTER TABLE `flock`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `logistics_transactions`
--
ALTER TABLE `logistics_transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qc`
--
ALTER TABLE `qc`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sku`
--
ALTER TABLE `sku`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sku_items`
--
ALTER TABLE `sku_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sku_type`
--
ALTER TABLE `sku_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stage`
--
ALTER TABLE `stage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
