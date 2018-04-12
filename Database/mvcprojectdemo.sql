-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2016 at 12:04 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvcprojectdemo`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(10) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `numofproduct` int(15) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `numofproduct`, `description`) VALUES
(1, 'Module', 0, ''),
(2, 'KIT phÃ¡t triá»ƒn', 0, ''),
(3, 'Máº¡ch náº¡p', 0, ''),
(4, 'Cáº£m biáº¿n', 0, ''),
(5, 'Tool', 0, ''),
(6, 'Há»™p nhá»±a- Há»™p ', 0, ''),
(7, 'IC-IC chá»©c nÄƒng', 0, ''),
(8, 'ROBOT- MÃ´ hÃ¬nh', 0, ''),
(9, 'IC nguá»“n', 0, ''),
(10, 'Vi Ä‘iá»u khiá»ƒn', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phone` int(20) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `username`, `password`, `phone`, `gender`) VALUES
(1, 'xcvcvcvcv', '123456asdsd', 'asdsd', 0, ''),
(2, 'xcvcvcvcv', '123456asdsd', 'asdsd', 0, ''),
(3, 'xcvcvcvcv', '123456asdsd', 'asdsd', 0, ''),
(4, '', 'sdfdfdj', 'fl;dkfldfkdf', 0, ''),
(5, '', 'sdfdf', 'sdfdfdf', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(10) NOT NULL,
  `productname` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `ordereddate` date NOT NULL,
  `requireddate` date NOT NULL,
  `shippeddate` date NOT NULL,
  `shippername` varchar(20) NOT NULL,
  `shiptoaddress` varchar(50) NOT NULL,
  `shiptocity` varchar(20) NOT NULL,
  `shiptocountry` varchar(20) NOT NULL,
  `orderstatus` varchar(50) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `productname`, `name`, `ordereddate`, `requireddate`, `shippeddate`, `shippername`, `shiptoaddress`, `shiptocity`, `shiptocountry`, `orderstatus`, `quantity`) VALUES
(1, 'Äá»“ng Há»“ Äa NÄƒ', 'Äá»“ng Há»“ Äa NÄƒng 100A', '0000-00-00', '0000-00-00', '0000-00-00', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(20) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `unitprice` int(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `producedate` date NOT NULL,
  `warranty` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `productname`, `quantity`, `unitprice`, `description`, `category_name`, `producedate`, `warranty`, `image`) VALUES
(4, 'Cáº£m biáº¿n lÆ°u lÆ°á»£ng', 4, 95000, ' ', 'Cáº£m biáº¿n', '2016-10-11', '', '/uploads/cbluuluong.jpg'),
(5, 'MÃ¡y In 3d Maker H1', 2, 7500000, ' ', 'Tool', '2016-10-26', '', '/uploads/mayin3d.jpg'),
(6, 'MÃ¡y TÃ­nh NhÃºng Nano', 0, 850000, ' ', 'Máº¡ch náº¡p', '0000-00-00', '', '/uploads/mtnhung.jpg'),
(7, 'Kit PhÃ¡t Triá»ƒn', 0, 400000, ' ', 'KIT phÃ¡t triá»ƒn', '0000-00-00', '', '/uploads/kitpt.jpg'),
(8, 'Máº¡ch Khuáº¿ch Äáº¡i Ã‚m Thanh', 0, 35000, ' ', 'Module', '0000-00-00', '', '/uploads/mkd.jpg'),
(9, 'Máº¡ch PhÃ¡t RF 315Mhz', 0, 40000, ' ', 'Module', '0000-00-00', '', '/uploads/machrf.jpg'),
(10, 'Máº¡ch Giáº£m Ãp MPPT', 0, 165000, ' ', 'Vi Ä‘iá»u khiá»ƒn', '0000-00-00', '', '/uploads/machga.jpg'),
(11, 'SÃ² NÃ³ng Láº¡nh', 0, 155000, ' ', 'Cáº£m biáº¿n', '0000-00-00', '', '/uploads/sononglanh.jpg'),
(12, 'Nguá»“n ZEQI 5V 2.5A', 0, 130000, ' ', 'Module', '0000-00-00', '', '/uploads/nguonzeqi.jpg'),
(13, 'Táº£n Nhiá»‡t NhÃ´m', 0, 70000, ' ', 'IC-IC chá»©c nÄƒng', '0000-00-00', '', '/uploads/tannhiet.jpg'),
(14, 'Khung Xe Tank', 0, 1800000, '', 'ROBOT- MÃ´ hÃ¬nh', '0000-00-00', '', '/uploads/xetank.jpg'),
(15, 'Camera USB 2MP', 0, 480000, ' ', 'Module', '0000-00-00', '', '/uploads/camera.jpg'),
(16, 'Äá»“ng Há»“ Äa NÄƒng 100A', 0, 290000, ' ', 'Cáº£m biáº¿n', '0000-00-00', '', '/uploads/donghoda.jpg'),
(17, 'Náº¹p Táº£n Nhiá»‡t', 0, 10000, ' ', 'Tool', '0000-00-00', '', '/uploads/neptn.jpg'),
(18, 'Há»‡ Thá»‘ng Thá»•i KhÃ­ Láº¡nh', 0, 950000, ' ', 'Vi Ä‘iá»u khiá»ƒn', '0000-00-00', '', '/uploads/htkhilanh.jpg'),
(19, 'Máº¡ch Chuyá»ƒn Giao Tiáº¿p USB', 0, 120000, ' ', 'Vi Ä‘iá»u khiá»ƒn', '0000-00-00', '', '/uploads/mchuyengt.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `gender` smallint(2) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `name`, `password`, `gender`, `address`, `email`, `phone`) VALUES
(3, '123456', 'abc', '1', 1, 'abc', 'guardianangel_149@yahoo.com', '0905119948'),
(4, '1234568901m123', 'abc', '123', 1, 'abc', 'anhnn4@fpt.edu.vn', '0905119948'),
(5, '1234568901m123', 'abc', '123', 1, 'abc', 'anhnn4@fpt.edu.vn', '0905119948'),
(6, 'administrator1', 'asdsd', '123', 1, '', 'guardianangel_149@yahoo.com', ''),
(7, 'administrator', '', '123', 1, 'asdsd', 'guardianangel_149@yahoo.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendor_id` int(10) NOT NULL,
  `vendor_name` varchar(20) NOT NULL,
  `officephone` int(20) NOT NULL,
  `mobilephone` int(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `fax` int(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `descriptions` varchar(50) NOT NULL,
  `homepage` varchar(50) NOT NULL,
  `products` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_id`, `vendor_name`, `officephone`, `mobilephone`, `email`, `fax`, `address`, `city`, `country`, `state`, `descriptions`, `homepage`, `products`) VALUES
(1, 'slfdkfkdjf', 0, 0, 'guardianangel_149@yahoo.com', 0, '', '', 'asdsdsds', '', '', '', '');

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
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendor_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
