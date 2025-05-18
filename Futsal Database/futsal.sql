-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2025 at 04:10 PM
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
-- Database: `futsal`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `payment_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `fullname`, `contact`, `booking_date`, `location`, `time`, `payment_status`) VALUES
(2, 'Munal Pandey', '9848791255', '2025-05-24', 'Yalla Court', '5:00', 'Paid'),
(3, 'Manish Dalley', '9849721745', '2025-05-22', 'Imadol Futsal', '5:00', 'Pending'),
(4, 'Hello World', '9865642379', '2025-05-13', 'Imadol Futsal', '10 AM', 'Pending'),
(5, 'Michael Don', '9876382787', '2025-05-30', 'Yalla Court', '10 AM', 'Paid'),
(6, 'Ronik Ghale', '9876382787', '2025-05-21', 'Jadibuti Futsal', '5 PM', 'Pending'),
(7, 'Anusuman', '9848752537', '2025-05-31', 'Jadibuti Futsal', '8 PM', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_Id` int(11) NOT NULL,
  `FirstName` varchar(80) NOT NULL,
  `Contact` varchar(10) NOT NULL,
  `Address` varchar(80) NOT NULL,
  `LastName` varchar(80) NOT NULL,
  `Username` varchar(80) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_Id`, `FirstName`, `Contact`, `Address`, `LastName`, `Username`, `Password`) VALUES
(7, 'viom11221', '9848791252', 'Kathmanduabc', 'lal121', 'Viom6969', 'Banana@123'),
(12, 'HelloHello', '9848721833', 'Lalitpur', 'WorldWorld', 'Helloworld123', 'gq+AmR1+vMhs9BaAjdBQKh5K1k3mgWpSO6TFQzsZ9SrY3oCd7yctDXW7sVJWAh24tZXKiKM='),
(13, 'Iam', '9823784835', 'Ktm', 'Pandey', 'Iam123', 'Iam@123'),
(14, 'Munal', '9848791255', 'Ktm', 'Pandey', 'Munal16', 'LMIlrnqMVzwyBI/SpwjkBPqmPgHgkmhnLUlzh4M6wJUfDTI0VGxgC9ghQHCAlXaIDOrLKt8='),
(15, 'Bimarsha', '9848791244', 'Ktm', 'Ghale', 'Bimu123', 'KdHzr26nNsWdNNij16lUxvLnilcdQUv8rVud7VTOJO/vdXsItyBIawyKMcqRJWxRdbRFbQ=='),
(16, 'Manish', '9876876543', 'ktm', 'Man', 'Manish123', 'iofyOQ1MqB+lZQm6v0qMZnhXCJxYrQZrxiXPBJoXSs5w65OmyqoSW6p2u6xzY8c6wSAM27kO'),
(17, 'ImaRonik', '9876382787', 'ktm', 'Ghale', 'Ronik123', '7dYt/l5FxczkX5WVT5kGLVN/qGGyQzCTWYHblXG3atyGkHR8F9LzqQuqi0KK9DR1eUyqAUc='),
(18, 'QWER', '9848781245', 'ktm', 'QWERET', 'Qwer123', 'Apple@123');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_Id` int(11) NOT NULL,
  `Product_Name` varchar(80) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `image_url` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_Id`, `Product_Name`, `Price`, `Quantity`, `image_url`) VALUES
(1, 'Energy Drink', 120, 25, 'drink2.jpeg'),
(2, 'Protein Bar', 180, 20, 'protein.jpeg'),
(3, 'Futsal Jersey', 1200, 12, 'shop2.jpeg'),
(4, 'Shin Guards', 600, 20, 'shop4.jpeg'),
(5, 'Sports Water Bottle', 350, 40, 'drink5.jpeg'),
(6, 'Grip Socks', 250, 35, 'grip.jpeg'),
(7, 'Futsal Ball', 1500, 10, 'shop3.jpeg'),
(8, 'Towel (Sports)', 400, 18, 'towel1.jpeg'),
(9, 'Sandwich (Chicken)', 200, 49, 'drink4.jpeg'),
(10, 'Fresh Juice', 100, 58, 'drink3.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_Id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
