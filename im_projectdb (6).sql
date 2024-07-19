-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2024 at 12:48 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `im_projectdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `messageID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `contactInfo` varchar(255) NOT NULL,
  `concerns` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`messageID`, `userID`, `fullName`, `contactInfo`, `concerns`) VALUES
(6, 6, 'mart kraig a. barbon', 'schton@gmail.com', 'great service'),
(7, 14, 'John Doe', '09666420210', 'Best company');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(10) NOT NULL,
  `userID` int(11) NOT NULL,
  `dateOrdered` datetime NOT NULL DEFAULT current_timestamp(),
  `productType` varchar(255) NOT NULL,
  `quantity` int(10) NOT NULL,
  `size` varchar(255) NOT NULL,
  `productFile` blob NOT NULL,
  `details` varchar(255) NOT NULL,
  `orderType` enum('Non-priority','Priority') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `paymentStatus` enum('Unverified','Verified') NOT NULL,
  `status` enum('Pending','In-progress','Completed','Canceled') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `userID`, `dateOrdered`, `productType`, `quantity`, `size`, `productFile`, `details`, `orderType`, `price`, `paymentStatus`, `status`) VALUES
(1, 6, '2024-07-19 00:00:00', 'Brochures', 20, '8.5\" x 11\"', 0x62653637326464336335303730363039623630336139616564343838376336372e706e67, 'sdfgh', 'Non-priority', '450.00', 'Unverified', 'Pending'),
(2, 14, '2024-07-19 00:00:00', 'Tarpaulin', 15, '5 x 6 ft', 0x64636561636264643137633663333038386639343665346536616339303134352e706e67, 'buec', 'Non-priority', '3000.00', 'Verified', 'Pending'),
(4, 6, '2024-07-19 00:00:00', 'Signages', 5, '350\" x 350\"', 0x38383661616534653961306365333665616634336434376231323430663061622e706e67, 'qwqwe', 'Non-priority', '2250.00', 'Verified', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `paymentid` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `refnumber` int(100) NOT NULL,
  `method` varchar(255) NOT NULL,
  `cardnumber` varchar(100) NOT NULL,
  `amountpaid` decimal(10,2) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`paymentid`, `userID`, `refnumber`, `method`, `cardnumber`, `amountpaid`, `timestamp`, `paymentType`) VALUES
(1, 6, 13958207, 'Gcash', '12333333333', '135.00', '2024-07-19 20:03:36', 'online'),
(2, 14, 5202649, 'PayPal', '12121212121', '900.00', '2024-07-19 20:06:08', 'onsite'),
(3, 6, 14868673, '', '12312317456', '1355.00', '2024-07-19 20:07:22', 'onsite'),
(4, 6, 78921577, 'PayPal', '12313123131', '675.00', '2024-07-19 21:44:04', 'onsite'),
(5, 6, 26252567, 'PayMaya', '12312312312', '530.00', '2024-07-19 21:44:52', 'onsite'),
(6, 6, 3125958, 'Gcash', '11212312312', '54.00', '2024-07-19 22:07:29', 'online');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `account_type` enum('Admin','Employee','Customer') NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `account_type`, `last_name`, `first_name`, `email`, `password`, `createdAt`) VALUES
(1, 'Admin', '', '', 'admin@gmail.com', 'admin', '2024-07-10 11:24:39'),
(2, 'Employee', '', '', 'employee@gmail.com', 'employee', '2024-07-13 17:25:16'),
(6, 'Customer', 'barbon', 'mart', 'schton@gmail.com', '123', '2024-07-11 13:08:30'),
(14, 'Customer', 'Doe', 'John', 'jd@gmail.com', '1', '2024-07-16 22:43:13'),
(19, 'Admin', '', '', 'admv2@gmail.com', 'admv2', '2024-07-17 21:42:32'),
(20, 'Employee', '', '', 'empv2@gmail.com', 'emp', '2024-07-17 23:57:50'),
(22, 'Employee', '', '', 'akari@gmail.com', '9', '2024-07-18 00:06:19'),
(23, 'Customer', 'Barbz', 'Marbz', 'mb@gmail.com', '5', '2024-07-18 20:43:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`messageID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`paymentid`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `paymentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
