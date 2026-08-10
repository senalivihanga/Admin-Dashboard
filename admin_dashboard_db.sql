-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2026 at 10:44 AM
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
-- Database: `admin_dashboard_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `nic`, `password`, `name`, `email`, `created_at`) VALUES
(1, '199912345678', 'password123', 'Admin Name', 'admin@railway.gov.lk', '2026-08-03 08:59:39');

-- --------------------------------------------------------

--
-- Table structure for table `assigned_system_users`
--

CREATE TABLE `assigned_system_users` (
  `id` int(11) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `computer_id` varchar(50) NOT NULL,
  `role` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assigned_system_users`
--

INSERT INTO `assigned_system_users` (`id`, `nic`, `name`, `computer_id`, `role`, `created_at`) VALUES
(1, '199812345678', 'A. B. Perera', 'CMP-001', 'Immediate Boss', '2026-08-03 09:19:10'),
(2, '199287654321', 'S. K. Silva', 'CMP-002', 'Subject Clerk', '2026-08-03 09:19:10'),
(3, '198533445566', 'M. N. Fernando', 'CMP-003', 'Final Approval', '2026-08-03 09:19:10');

-- --------------------------------------------------------

--
-- Table structure for table `quarters_details`
--

CREATE TABLE `quarters_details` (
  `quarter_id` int(11) NOT NULL,
  `number_of_quarters` varchar(50) NOT NULL,
  `score_measure` varchar(50) DEFAULT NULL,
  `type_of_quarters` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `other_details` text DEFAULT NULL,
  `sub_departments` varchar(150) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `owner_computer_no` varchar(50) DEFAULT NULL,
  `old_booking` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quarters_details`
--

INSERT INTO `quarters_details` (`quarter_id`, `number_of_quarters`, `score_measure`, `type_of_quarters`, `address`, `other_details`, `sub_departments`, `status`, `owner_computer_no`, `old_booking`, `created_at`) VALUES
(1, 'Q-01', '85', 'Grade I Bungalow', 'No. 12, Railway Avenue, Colombo 10', 'Newly renovated', 'Operations', 'Occupied', 'CMP-103', 'View Records', '2026-08-04 00:10:51'),
(2, 'Q-02', '70', 'Grade II Quarters', 'Station Road, Gampaha', 'Standard maintenance required', 'Signal & Telecom', 'Vacant', '--', 'View Records', '2026-08-04 00:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `computer_id` varchar(50) NOT NULL,
  `quarter_assigned` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nic`, `name`, `computer_id`, `quarter_assigned`, `created_at`) VALUES
(1, '199812345678', 'A. B. Perera', 'CMP-001', 'Quarter A-1', '2026-08-03 08:59:39'),
(2, '199287654321', 'S. K. Silva', 'CMP-002', 'Quarter B-4', '2026-08-03 08:59:39'),
(3, '198533445566', 'M. N. Fernando', 'CMP-003', 'Quarter C-2', '2026-08-03 08:59:39');

-- --------------------------------------------------------

--
-- Table structure for table `view_system_users`
--

CREATE TABLE `view_system_users` (
  `id` int(11) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `computer_id` varchar(50) NOT NULL,
  `role` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `view_system_users`
--

INSERT INTO `view_system_users` (`id`, `nic`, `name`, `computer_id`, `role`, `created_at`) VALUES
(1, '199812345678', 'A. B. Perera', 'CMP-001', 'Immediate Boss', '2026-08-03 09:43:27'),
(2, '199287654321', 'S. K. Silva', 'CMP-002', 'Subject Clerk', '2026-08-03 09:43:27'),
(3, '198533445566', 'M. N. Fernando', 'CMP-003', 'Final Approval', '2026-08-03 09:43:27');

-- --------------------------------------------------------

--
-- Table structure for table `waiting_lists`
--

CREATE TABLE `waiting_lists` (
  `id` int(11) NOT NULL,
  `list_type` enum('general','guard','station_master','controller','deputy_commissioner') NOT NULL,
  `nic` varchar(20) NOT NULL,
  `computer_no` varchar(50) DEFAULT NULL,
  `resident_name` varchar(150) NOT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `housing_type` varchar(50) DEFAULT NULL,
  `workplace` varchar(150) DEFAULT NULL,
  `allocated_date` date DEFAULT NULL,
  `other` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `waiting_lists`
--

INSERT INTO `waiting_lists` (`id`, `list_type`, `nic`, `computer_no`, `resident_name`, `designation`, `housing_type`, `workplace`, `allocated_date`, `other`, `created_at`) VALUES
(1, 'general', '199812345678', 'CMP-101', 'A. B. Perera', 'Clerk', 'Grade II', 'Colombo Fort', '2026-01-10', 'None', '2026-08-03 23:47:11'),
(2, 'guard', '199287654321', 'CMP-102', 'S. K. Silva', 'Train Guard', 'Grade III', 'Maradana', '2026-02-14', 'Pending verification', '2026-08-03 23:47:11'),
(3, 'station_master', '198533445566', 'CMP-103', 'M. N. Fernando', 'Station Master', 'Grade I', 'Gampaha', '2026-03-01', 'Urgent', '2026-08-03 23:47:11'),
(4, 'controller', '199022334455', 'CMP-104', 'T. G. Rathnayake', 'Controller', 'Grade I', 'HQ Colombo', '2026-03-10', 'None', '2026-08-03 23:47:11'),
(5, 'deputy_commissioner', '198211223344', 'CMP-105', 'W. M. D. Wickramasinghe', 'Deputy Commissioner', 'Executive', 'Main Office', '2026-04-05', 'Approved', '2026-08-03 23:47:11'),
(6, 'general', '199812345678', 'CMP-101', 'A. B. Perera', 'Clerk', 'Grade II', 'Colombo Fort', '2026-01-10', 'None', '2026-08-03 23:49:02'),
(7, 'guard', '199287654321', 'CMP-102', 'S. K. Silva', 'Train Guard', 'Grade III', 'Maradana', '2026-02-14', 'Pending verification', '2026-08-03 23:49:02'),
(8, 'station_master', '198533445566', 'CMP-103', 'M. N. Fernando', 'Station Master', 'Grade I', 'Gampaha', '2026-03-01', 'Urgent', '2026-08-03 23:49:02'),
(9, 'controller', '199022334455', 'CMP-104', 'T. G. Rathnayake', 'Controller', 'Grade I', 'HQ Colombo', '2026-03-10', 'None', '2026-08-03 23:49:02'),
(10, 'deputy_commissioner', '198211223344', 'CMP-105', 'W. M. D. Wickramasinghe', 'Deputy Commissioner', 'Executive', 'Main Office', '2026-04-05', 'Approved', '2026-08-03 23:49:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nic` (`nic`);

--
-- Indexes for table `assigned_system_users`
--
ALTER TABLE `assigned_system_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nic` (`nic`);

--
-- Indexes for table `quarters_details`
--
ALTER TABLE `quarters_details`
  ADD PRIMARY KEY (`quarter_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nic` (`nic`);

--
-- Indexes for table `view_system_users`
--
ALTER TABLE `view_system_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nic` (`nic`);

--
-- Indexes for table `waiting_lists`
--
ALTER TABLE `waiting_lists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assigned_system_users`
--
ALTER TABLE `assigned_system_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quarters_details`
--
ALTER TABLE `quarters_details`
  MODIFY `quarter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `view_system_users`
--
ALTER TABLE `view_system_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `waiting_lists`
--
ALTER TABLE `waiting_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
