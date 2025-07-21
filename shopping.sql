-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Sep 19, 2022 at 02:49 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'e6e061838856bf47e1de730719fb2609', '2017-01-24 16:21:18', '07-09-2022 08:52:45 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Head Caps', 'caps', '2022-01-18 19:18:52', ''),
(4, 'Pads', 'pads', '2022-01-18 19:19:32', ''),
(5, 'Face Mask', 'mask', '2022-01-18 19:19:54', ''),
(6, 'Diapers', 'diapers', '2022-01-18 19:17:37', '23-01-2022 12:22:24 AM'),
(7, 'Wet Wipes', 'wipes', '2022-01-24 06:52:04', NULL),
(9, 'Nebuliser', 'nebuliser', '2022-01-24 06:54:26', NULL),
(10, 'Gloves', 'gloves', '2022-01-25 05:50:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 1, '3', 1, '2022-01-19 19:32:57', 'COD', 'Delivered'),
(13, 1, '10', 1, '2022-02-14 09:17:19', 'Debit / Credit card', NULL),
(14, 6, '10', 1, '2022-04-07 02:06:47', 'COD', 'Delivered'),
(15, 7, '9', 1, '2022-05-03 04:02:18', 'COD', NULL),
(16, 8, '14', 1, '2022-05-10 06:21:05', 'COD', 'in Process'),
(17, 8, '10', 1, '2022-09-14 15:02:38', 'Debit / Credit card', 'Delivered'),
(18, 8, '1', 1, '2022-09-15 08:31:51', 'Debit / Credit card', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2022-01-19 19:32:57'),
(5, 14, 'Delivered', 'delivered', '2022-04-07 02:13:54'),
(6, 16, 'in Process', 'shipped', '2022-05-10 06:22:50'),
(7, 17, 'Delivered', 'done', '2022-09-14 15:03:50');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(7, 10, 5, 5, 5, 'Kushal', 'GOOD', 'nice', '2022-05-10 06:18:18');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 6, 8, 'Adult Diapers Premium (Extra Large)', 'Matrix', 400, 1000, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 18px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">General</div><ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Made of high-quality non-woven material which will speedily absorb liquid and avoid seepage, will also maintain dryness of your skin.</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"></li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Size</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">Extra Large: 120 – 170 cm/48” – 68”</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Packaging</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">10 Pcs in a Packet</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Certification</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">CE, ISO 9001: 2015</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">MADE IN INDIA</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"></li></ul></li></ul>', 'd1.png', 'd11.png', 'd111.png', 1200, 'In Stock', '2022-01-25 04:54:35', ''),
(3, 6, 8, 'Adult Diapers Premium (Medium)', 'Matrix', 300, 800, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 18px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">General</div><ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Made of high-quality non-woven material which will speedily absorb liquid and avoid seepage, will also maintain dryness of your skin.</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"></li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Size</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"> Medium: 76 – 101 cm /30” – 40” </li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Packaging</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">10 Pcs in a Packet</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Certification</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">CE, ISO 9001: 2015</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">MADE IN INDIA</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"></li></ul></li></ul>', 'd3.png', 'd33.png', 'd333.png', 0, 'Out of Stock', '2022-01-25 05:35:15', ''),
(5, 10, NULL, 'Disposable PE Gloves', 'Star', 1000, 1200, '<ul><li>Polyethylene Gloves (HDPE)<br></li><li>Single Use Only<br></li><li>Packaging: 100 Pcs in a box<br></li><li>Certifications: CE, ISO 9001: 2015<br></li><li>MADE IN INDIA<br></li></ul>', 'g1.png', 'g11.png', 'g111.png', 0, 'In Stock', '2022-01-25 05:44:17', ''),
(6, 10, NULL, 'Household Gloves', 'Matrix', 700, 1000, '<ul><li>Disposable Rubber Gloves<br></li><li>Colors Available: BLUE, ORANGE, YELLOW<br></li><li>Packaging: 1 Pair in a Packet<br></li><li>Certifications: CE, ISO 9001: 2015<br></li><li>MADE IN MALAYSIA<br></li></ul>', 'g2.png', 'g22.png', 'g222.png', 35, 'In Stock', '2022-01-25 05:50:07', ''),
(7, 4, 2, 'Sanitary Pads', 'Matrix', 30, 70, '<ul><li>Extra Absorbent, Extra Comfort<br></li><li>Size: 240 mm and 280 mm<br></li><li>Packing: 7 pcs in a packet<br></li><li>Master Bag: 180 packets in one HDPE Gunny Bag<br></li><li>Certification: CE, ISO 9001: 2015<br></li></ul>', '7.png', '777.png', '777.png', 20, 'In Stock', '2022-02-12 04:10:17', ''),
(8, 4, 3, 'Under Pads', 'Matrix', 300, 1000, '<ul><li>PE back-sheet & Non-woven surface<br></li><li>Core: Tissue paper + Fluff Pulp + SAP<br></li><li>Size: 60 cm X 90 cm<br></li><li>Packaging: 10 Pcs in a Packet<br></li><li>Certification: CE, ISO 9001: 2015<br></li></ul>', '8.png', '88.png', '888.png', 0, 'In Stock', '2022-02-12 04:14:54', ''),
(9, 5, NULL, 'Face Mask', 'Matrix', 400, 1100, '<ul><li>Made from 100% virgin raw material<br></li><li>Available in 2ply/3ply and 4ply<br></li><li>Available in Elastic (Loop) & Ribbon (Tie-On) Type<br></li><li>Colors Available: Blue, Green & White<br></li><li>Packing: 100 Pcs in a Box<br></li><li>Certification: CE, ISO 9001: 2015<br></li></ul>', '9.png', '99.png', '999.png', 10, 'In Stock', '2022-02-12 04:17:03', ''),
(10, 3, NULL, 'Head Cap', 'Matrix', 400, 1200, '<ul><li>Made from 100% virgin raw material<br></li><li>Available in Bouffant (Nurse) Cap&Surgeon (Doctor) Cap Type<br></li><li>Colors Available: Blue, Green & White<br></li><li>Packing: 100 Pcs in a Box<br></li><li>Certification: CE, ISO 9001: 2015<br></li></ul>', '10.png', '1010.png', '101010.png', 0, 'In Stock', '2022-02-12 04:26:17', ''),
(11, 7, NULL, 'Wet Wipes', 'Matrix', 100, 300, '<ul><li>Contains: RO Treated Aqua with Chlorhexidine, Glycerin, Menthol,<br></li><li>Allantion& Fragrance.<br></li><li>Sizes Available:24 x 32 CM, 32 x 32 cm<br></li><li>Packaging: 10 Pcs in one Packet<br></li></ul>', '11.png', '1111.png', '111111.png', 0, 'In Stock', '2022-02-12 04:38:17', ''),
(13, 9, NULL, 'Nebuliser', 'Starneb', 1100, 2599, '<ul><li>Power:220V/60HZ<br></li><li>Power Consumption:180VA<br></li><li>Medication Capacity:6ml<br></li><li>Dimensions:230x150x220mm<br></li></ul>', '13.png', '1313.png', '131313.png', 0, 'In Stock', '2022-02-12 04:44:24', ''),
(14, 5, NULL, 'N95 Mask', 'Matrix', 600, 1500, '<ul><li>Made from 100% virgin raw material<br></li><li>Available in 2ply/3ply and 4ply<br></li><li>Available in Elastic (Loop) & Ribbon (Tie-On) Type<br></li><li>Colors Available: Blue, Green & White<br></li><li>Packing: 100 Pcs in a Box<br></li><li>Certification: CE, ISO 9001: 2015<br></li></ul>', '14.png', '1414.png', '141414.png', 0, 'In Stock', '2022-02-12 04:52:15', ''),
(15, 7, NULL, 'Baby Wet Wipes', 'Matrix', 100, 250, '<ul><li>Contains: RO Treated Aqua with Chlorhexidine, Glycerin, Menthol,<br></li><li>Allantion& Fragrance.<br></li><li>Sizes Available:24 x 32 CM, 32 x 32 cm<br></li><li>Packaging: 10 Pcs in one Packet<br></li></ul>', '15.png', '1515.png', '151515.png', 50, 'In Stock', '2022-02-12 05:05:13', ''),
(16, 10, NULL, 'Surgical gloves', 'Matrix', 240, 500, '<ul><li>Disposable Gloves<br></li><li>Colors Available: White<br></li><li>Packaging: 10 Pair in a Packet<br></li><li>Certifications: CE, ISO 9001: 2015<br></li><li>MADE IN MALAYSIA<br></li></ul>', '16.png', '1616.png', '161616.png', 30, 'In Stock', '2022-02-12 05:16:23', ''),
(27, 6, 8, 'diaper', 'matrix', 100, 200, 'diapers for adults', 'd2.png', 'd22.png', 'd222.png', 100, 'In Stock', '2022-05-10 06:29:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(2, 4, 'Sanitary Pads', '2022-01-26 16:24:52', '26-01-2022 11:03:40 PM'),
(3, 4, 'Under Pads', '2022-01-26 16:29:09', ''),
(8, 6, 'Adult Diapers', '2022-01-27 04:13:54', ''),
(9, 6, 'Kids Diapers', '2022-01-27 04:36:45', '');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'kushalchow2222@gmail.com', 0x3a3a3100000000000000000000000000, '2022-01-24 06:20:03', NULL, 1),
(31, 'kushal_mikkilineni@srmap.edu.in', 0x3a3a3100000000000000000000000000, '2022-01-25 03:53:10', NULL, 0),
(32, 'kushalchow2222@gmail.com', 0x3a3a3100000000000000000000000000, '2022-01-25 03:53:19', NULL, 1),
(33, 'kushalchow2222@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-14 09:17:00', '14-02-2022 02:48:42 PM', 1),
(34, 'aravind@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-07 02:05:48', '07-04-2022 07:42:33 AM', 1),
(35, 'shiva@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-03 04:00:20', NULL, 1),
(36, 'urop@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-10 06:19:49', '10-05-2022 11:52:00 AM', 1),
(37, 'urop@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-10 06:30:12', '10-05-2022 12:00:36 PM', 1),
(38, 'urop@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-11 06:22:27', NULL, 1),
(39, 'kushal@gmail.com', 0x3a3a3100000000000000000000000000, '2022-09-14 15:02:00', NULL, 0),
(40, 'urop@gmail.com', 0x3a3a3100000000000000000000000000, '2022-09-14 15:02:16', '14-09-2022 08:33:00 PM', 1),
(41, 'urop@gmail.com', 0x3a3a3100000000000000000000000000, '2022-09-15 08:05:57', '15-09-2022 01:36:38 PM', 1),
(42, 'urop@gmail.com', 0x3a3a3100000000000000000000000000, '2022-09-15 08:30:12', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(1, 'kushal', 'kushalchow2222@gmail.com', 7210789789, '6347e156a4da2275c25453a49bb1a8fe', '15-11-112,vdos colony', 'Telangana', 'Khammam', 507002, '15-11-112,vdos colony', 'Telangana', 'Khammam', 507002, '2022-01-24 06:19:41', NULL),
(6, 'aravind', 'aravind@gmail.com', 9123456789, 'b9130c656a1cd6feb47de244145189c1', '15-11-113', 'Telangana', 'Khammam', 507002, '15-11-113,vdos colony', 'Telangana', 'Khammam', 507002, '2022-04-07 02:05:35', NULL),
(7, 'shivakesh', 'shiva@gmail.com', 9999999911, '25d55ad283aa400af464c76d713c07ad', '15-11-112,vdos colony', 'Telangana', 'Khammam', 507002, '15-11-112,vdos colony', 'Telangana', 'Khammam', 507002, '2022-05-03 03:59:56', NULL),
(8, 'urop', 'urop@gmail.com', 9090909090, '8030ba6a83c617f01795f478dbc35955', '15-11-112,vdos colony', 'Telangana', 'Khammam', 507002, '15-11-112,vdos colony', 'Telangana', 'Khammam', 507002, '2022-05-10 06:19:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
