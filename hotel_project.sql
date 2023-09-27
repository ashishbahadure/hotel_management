-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2022 at 06:13 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'VEG'),
(3, 'NONVEG'),
(4, 'STARTER');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` text DEFAULT NULL,
  `customer_mobile` text DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `due_payment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_mobile`, `customer_address`, `due_payment`) VALUES
(1, 'ABCD XYZ', '1234567890', 'Ahmednagar', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

CREATE TABLE `dish` (
  `dish_id` int(11) NOT NULL,
  `category_id` text DEFAULT NULL,
  `dish_name` text DEFAULT NULL,
  `dish_price` text DEFAULT NULL,
  `dish_details` text DEFAULT NULL,
  `dish_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dish`
--

INSERT INTO `dish` (`dish_id`, `category_id`, `dish_name`, `dish_price`, `dish_details`, `dish_image`) VALUES
(1, '1', 'HARA BHARA KABAB', '200', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))', 'hara-bhara-kabab-500x500.jpg'),
(2, '1', 'SHAHI PANEER', '350', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))', 'hara-bhara-kabab-500x500.jpg'),
(3, '1', 'PANEER MASALA', '280', 'Paneer Masala is an easy to make dish of paneer where paneer cubes are simmered in an onion tomato ...\r\nIngredients\r\n400 g Paneer (Cubed)\r\n1/2 tsp Salt\r\n1/2 tsp Red Chilli Powder\r\n1/2 tsp Turmeric Powder\r\n2 tbsp Vegetable Oil', 'Paneer-Masala-1-3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_table`
--

CREATE TABLE `hotel_table` (
  `hotel_table_id` int(11) NOT NULL,
  `table_name` text DEFAULT NULL,
  `status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel_table`
--

INSERT INTO `hotel_table` (`hotel_table_id`, `table_name`, `status`) VALUES
(1, 'R1T3', 'free'),
(2, 'R1T1', 'free'),
(3, 'R1T2', 'free'),
(4, 'R1T4', 'free');

-- --------------------------------------------------------

--
-- Table structure for table `order_dishes`
--

CREATE TABLE `order_dishes` (
  `order_dishes_id` int(11) NOT NULL,
  `order_id` text DEFAULT NULL,
  `dish_id` text DEFAULT NULL,
  `dish_name` text DEFAULT NULL,
  `dish_price` text DEFAULT NULL,
  `dish_qty` text DEFAULT NULL,
  `dish_total` text NOT NULL,
  `dish_image` text DEFAULT NULL,
  `dish_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_dishes`
--

INSERT INTO `order_dishes` (`order_dishes_id`, `order_id`, `dish_id`, `dish_name`, `dish_price`, `dish_qty`, `dish_total`, `dish_image`, `dish_details`) VALUES
(1, '9', '1', 'HARA BHARA KABAB', '200', '8', '', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(2, '10', '2', 'SHAHI PANEER', '350', '2', '', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(4, '12', '3', 'PANEER MASALA', '280', '2', '', 'Paneer-Masala-1-3.jpg', 'Paneer Masala is an easy to make dish of paneer where paneer cubes are simmered in an onion tomato ...\r\nIngredients\r\n400 g Paneer (Cubed)\r\n1/2 tsp Salt\r\n1/2 tsp Red Chilli Powder\r\n1/2 tsp Turmeric Powder\r\n2 tbsp Vegetable Oil'),
(9, '13', '2', 'SHAHI PANEER', '350', '1', '350', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(23, '14', '1', 'HARA BHARA KABAB', '200', '1', '200', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(24, '14', '2', 'SHAHI PANEER', '350', '2', '700', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(30, '14', '3', 'PANEER MASALA', '280', '1', '280', 'Paneer-Masala-1-3.jpg', 'Paneer Masala is an easy to make dish of paneer where paneer cubes are simmered in an onion tomato ...\r\nIngredients\r\n400 g Paneer (Cubed)\r\n1/2 tsp Salt\r\n1/2 tsp Red Chilli Powder\r\n1/2 tsp Turmeric Powder\r\n2 tbsp Vegetable Oil'),
(31, '15', '1', 'HARA BHARA KABAB', '200', '1', '200', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(32, '11', '1', 'HARA BHARA KABAB', '200', '1', '200', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(33, '16', '1', 'HARA BHARA KABAB', '200', '1', '200', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(34, '17', '1', 'HARA BHARA KABAB', '200', '1', '200', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(35, '18', '1', 'HARA BHARA KABAB', '200', '1', '200', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(36, '18', '2', 'SHAHI PANEER', '350', '1', '350', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(37, '17', '2', 'SHAHI PANEER', '350', '1', '350', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(38, '19', '1', 'HARA BHARA KABAB', '200', '1', '200', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(39, '20', '1', 'HARA BHARA KABAB', '200', '1', '200', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(40, '20', '2', 'SHAHI PANEER', '350', '2', '700', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(41, '21', '1', 'HARA BHARA KABAB', '200', '1', '200', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(42, '22', '1', 'HARA BHARA KABAB', '200', '1', '200', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(43, '23', '1', 'HARA BHARA KABAB', '200', '1', '200', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(44, '23', '2', 'SHAHI PANEER', '350', '1', '350', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(45, '24', '2', 'SHAHI PANEER', '350', '1', '350', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(46, '25', '1', 'HARA BHARA KABAB', '200', '1', '200', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(47, '26', '1', 'HARA BHARA KABAB', '200', '1', '200', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(48, '27', '1', 'HARA BHARA KABAB', '200', '1', '200', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(49, '28', '1', 'HARA BHARA KABAB', '200', '4', '800', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))'),
(50, '29', '3', 'PANEER MASALA', '280', '4', '1120', 'Paneer-Masala-1-3.jpg', 'Paneer Masala is an easy to make dish of paneer where paneer cubes are simmered in an onion tomato ...\r\nIngredients\r\n400 g Paneer (Cubed)\r\n1/2 tsp Salt\r\n1/2 tsp Red Chilli Powder\r\n1/2 tsp Turmeric Powder\r\n2 tbsp Vegetable Oil'),
(51, '29', '2', 'SHAHI PANEER', '350', '1', '350', 'hara-bhara-kabab-500x500.jpg', 'Hara bhara kabab are North Indian vegetarian kabab made with plenty of leafy greens and veggies like ...\r\nIngredients\r\n300 grams potatoes ((2 large or 3 medium))\r\n½ cup coriander leaves ((with tender stalks, cilantro))\r\n1 cup green peas ((frozen or fresh))\r\n1 to 3 green chilies ((less spicy kind))\r\n120 grams spinach ((palak - 3½ cups))');

-- --------------------------------------------------------

--
-- Table structure for table `order_tbl`
--

CREATE TABLE `order_tbl` (
  `order_tbl_id` int(11) NOT NULL,
  `customer_id` text DEFAULT NULL,
  `hotel_table_id` text DEFAULT NULL,
  `order_amt` text DEFAULT NULL,
  `paid_amt` text DEFAULT NULL,
  `pending_amt` text DEFAULT NULL,
  `order_date` text DEFAULT NULL,
  `entry_time` text DEFAULT NULL,
  `exit_time` text DEFAULT NULL,
  `status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_tbl`
--

INSERT INTO `order_tbl` (`order_tbl_id`, `customer_id`, `hotel_table_id`, `order_amt`, `paid_amt`, `pending_amt`, `order_date`, `entry_time`, `exit_time`, `status`) VALUES
(11, '', '2', '200', '200', '0', '2022-09-27', '16:6', '16:52', 'complete'),
(13, '', '3', '350', '350', '0', '2022-09-29', '16:12', '16:53', 'complete'),
(14, '', '1', '1180', '1180', '0', '2022-09-27', '16:35', '16:47', 'complete'),
(15, '', '1', '200', '200', '0', '2022-09-29', '16:50', '16:50', 'complete'),
(16, '', '1', '200', '200', '0', '2022-09-29', '16:53', '16:53', 'complete'),
(17, '', '1', '550', '550', '0', '2022-09-29', '16:53', '15:26', 'complete'),
(18, '', '2', '550', '550', '0', '2022-09-29', '16:54', '16:54', 'complete'),
(19, '', '1', '200', '200', '0', '2022-09-29', '15:32', '15:32', 'complete'),
(20, '', '1', '900', '900', '0', '2022-09-29', '15:52', '15:52', 'complete'),
(21, '', '1', '200', '200', '0', '2022-09-29', '15:53', '15:54', 'complete'),
(22, '', '1', '200', '200', '0', '2022-09-29', '15:57', '15:57', 'complete'),
(23, '', '1', '550', '550', '0', '2022-09-29', '16:1', '16:19', 'complete'),
(24, '', '3', '350', '350', '0', '2022-09-29', '16:4', '16:4', 'complete'),
(25, '', '1', '200', '90', '110', '2022-09-29', '16:23', '16:23', 'complete'),
(26, '', '1', '200', '200', '0', '2022-09-29', '16:36', '16:36', 'complete'),
(27, '', '1', '200', '200', '0', '2022-09-29', '16:41', '16:43', 'complete'),
(28, '', '1', '800', '800', '0', '2022-12-30', '10:25', '10:27', 'complete'),
(29, '', '2', '1470', '1470', '0', '2022-12-30', '10:27', '10:28', 'complete');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`dish_id`);

--
-- Indexes for table `hotel_table`
--
ALTER TABLE `hotel_table`
  ADD PRIMARY KEY (`hotel_table_id`);

--
-- Indexes for table `order_dishes`
--
ALTER TABLE `order_dishes`
  ADD PRIMARY KEY (`order_dishes_id`);

--
-- Indexes for table `order_tbl`
--
ALTER TABLE `order_tbl`
  ADD PRIMARY KEY (`order_tbl_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dish`
--
ALTER TABLE `dish`
  MODIFY `dish_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hotel_table`
--
ALTER TABLE `hotel_table`
  MODIFY `hotel_table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_dishes`
--
ALTER TABLE `order_dishes`
  MODIFY `order_dishes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `order_tbl`
--
ALTER TABLE `order_tbl`
  MODIFY `order_tbl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
