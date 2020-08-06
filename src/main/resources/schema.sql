-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2020 at 05:07 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lvtn`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` bigint(20) NOT NULL,
  `name` text DEFAULT NULL,
  `status` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `status`) VALUES
(5, 'Sầu riêng', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `cus_order`
--

CREATE TABLE `cus_order` (
  `order_id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `status_order` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cus_order`
--

INSERT INTO `cus_order` (`order_id`, `created_at`, `updated_at`, `user_id`, `status_order`) VALUES
(1, '2020-08-06 16:17:34', '2020-08-06 16:17:34', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fruit`
--

CREATE TABLE `fruit` (
  `fruit_id` bigint(20) NOT NULL,
  `price` bigint(20) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fruit`
--

INSERT INTO `fruit` (`fruit_id`, `price`, `quantity`, `name`, `category_id`, `status`) VALUES
(9, 100000, 0, 'Sầu riêng phun thuốc độc', 5, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `import_invoice`
--

CREATE TABLE `import_invoice` (
  `import_id` bigint(20) NOT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `von` bigint(20) DEFAULT NULL,
  `fruit_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `date` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `fruit_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `price` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`fruit_id`, `order_id`, `price`, `created_at`, `updated_at`, `note`, `amount`) VALUES
(9, 1, 10000000, '2020-08-06 17:09:13', '2020-08-06 17:09:13', 'sth', 99);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `permission_id` bigint(20) NOT NULL,
  `permission_name` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`permission_id`, `permission_name`) VALUES
(2, 'STAFF'),
(1, 'ADMIN'),
(3, 'CUSTOMER');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` bigint(20) NOT NULL,
  `address` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `address`, `name`, `phone`) VALUES
(1, '232/3, Long Thuan, Long', 'Tan Sang', '0583217159'),
(2, '232/3, Long Thuan, Long', 'trang', '6754352345');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `address`, `fullname`, `image`, `created_at`, `updated_at`, `password`, `username`, `status`, `email`, `phone`) VALUES
(10, '232/3, Long Thuan, Long', 'Tan Sang', '/resources/static/img/avatar/user.png', '2020-08-06 13:59:19', '2020-08-06 14:22:43', '$2a$10$LE3jy.pbgHDR2.HB75.YIurFLLbEXldXPzy453cVEgSaLozns4khW', 'staff', b'1', 'sang09685@gmail.com', '213123'),
(7, '232/3, Long Thuan, Long Phước, Quận 9', 'Trần Nguyễn Tấn Sang', '/resources/static/img/avatar/user.png', '2020-08-06 13:11:45', '2020-08-06 13:12:17', '$2a$10$IRgo6RnNlresgGWjA3KdmuJTd0h3RAb8G8dItZXwUnZKZj.CBycw6', 'admin', b'1', 'sang@gmail.com', '2341234');

-- --------------------------------------------------------

--
-- Table structure for table `user_permission`
--

CREATE TABLE `user_permission` (
  `user_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_permission`
--

INSERT INTO `user_permission` (`user_id`, `permission_id`) VALUES
(7, 1)
(10, 2)

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `cus_order`
--
ALTER TABLE `cus_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `FKfe5hlygpnjjasq01nq5n0oxaq` (`user_id`);

--
-- Indexes for table `fruit`
--
ALTER TABLE `fruit`
  ADD PRIMARY KEY (`fruit_id`),
  ADD KEY `FKat5cmawo74etgjcrvxlpmh3w9` (`category_id`);

--
-- Indexes for table `import_invoice`
--
ALTER TABLE `import_invoice`
  ADD PRIMARY KEY (`import_id`),
  ADD KEY `FKcnvtcmer5sqsx2fdplbp8fq79` (`fruit_id`),
  ADD KEY `FKtr4w6mg3txgsibh37g62ltt44` (`supplier_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`fruit_id`,`order_id`),
  ADD KEY `FK9cj9w6djg9vqipwcoc26ew8hr` (`order_id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`) USING HASH,
  ADD UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`) USING HASH,
  ADD UNIQUE KEY `UK_589idila9li6a4arw1t8ht1gx` (`phone`) USING HASH;

--
-- Indexes for table `user_permission`
--
ALTER TABLE `user_permission`
  ADD PRIMARY KEY (`permission_id`,`user_id`),
  ADD KEY `FK7c2x74rinbtf33lhdcyob20sh` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cus_order`
--
ALTER TABLE `cus_order`
  MODIFY `order_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fruit`
--
ALTER TABLE `fruit`
  MODIFY `fruit_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `import_invoice`
--
ALTER TABLE `import_invoice`
  MODIFY `import_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `permission_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
