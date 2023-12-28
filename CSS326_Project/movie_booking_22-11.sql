-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 22, 2023 at 02:38 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_booking`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `all_showings`
-- (See below for the actual view)
--
CREATE TABLE `all_showings` (
`ShowID` int(11)
,`MovieID` int(11)
,`Title` varchar(256)
,`CinemaHallID` int(11)
,`hallName` varchar(50)
,`CinemaID` int(11)
,`cinemaName` varchar(64)
,`StartDate` date
,`StartTime` time
);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL,
  `NumberOfSeats` int(11) NOT NULL,
  `Timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` int(11) DEFAULT NULL,
  `UserID` int(11) NOT NULL,
  `ShowID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cinema`
--

CREATE TABLE `cinema` (
  `CinemaID` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `TotalCinemaHalls` int(11) NOT NULL,
  `CityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cinema`
--

INSERT INTO `cinema` (`CinemaID`, `Name`, `TotalCinemaHalls`, `CityID`) VALUES
(1, 'Cinema A', 3, 1),
(2, 'Cinema B', 2, 4),
(3, 'Cinema C', 1, 7),
(4, 'Cinema D', 3, 2),
(5, 'Cinema E', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `cinema_hall`
--

CREATE TABLE `cinema_hall` (
  `CinemaHallID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `TotalSeats` int(11) NOT NULL,
  `CinemaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cinema_hall`
--

INSERT INTO `cinema_hall` (`CinemaHallID`, `Name`, `TotalSeats`, `CinemaID`) VALUES
(1, 'Hall A', 24, 1),
(2, 'Hall B', 24, 1),
(3, 'Hall C', 24, 1),
(4, 'Hall X', 24, 2),
(5, 'Hall Y', 24, 2),
(6, 'Hall Z', 24, 3),
(7, 'Hall P', 24, 4),
(8, 'Hall Q', 24, 4),
(9, 'Hall R', 24, 5);

-- --------------------------------------------------------

--
-- Table structure for table `cinema_seat`
--

CREATE TABLE `cinema_seat` (
  `CinemaSeatID` int(11) NOT NULL,
  `SeatNumber` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `CinemaHall` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cinema_seat`
--

INSERT INTO `cinema_seat` (`CinemaSeatID`, `SeatNumber`, `Type`, `CinemaHall`) VALUES
(1, 1, 0, 1),
(2, 2, 0, 1),
(3, 3, 0, 1),
(4, 4, 0, 1),
(5, 5, 0, 1),
(6, 6, 0, 1),
(7, 7, 0, 1),
(8, 8, 0, 1),
(9, 9, 0, 1),
(10, 10, 0, 1),
(11, 11, 0, 1),
(12, 12, 0, 1),
(13, 13, 0, 1),
(14, 14, 0, 1),
(15, 15, 0, 1),
(16, 16, 0, 1),
(17, 1, 0, 2),
(18, 2, 0, 2),
(19, 3, 0, 2),
(20, 4, 0, 2),
(21, 5, 0, 2),
(22, 6, 0, 2),
(23, 7, 0, 2),
(24, 8, 0, 2),
(25, 9, 0, 2),
(26, 10, 0, 2),
(27, 11, 0, 2),
(28, 12, 0, 2),
(29, 13, 0, 2),
(30, 14, 0, 2),
(31, 15, 0, 2),
(32, 16, 0, 2),
(33, 1, 0, 3),
(34, 2, 0, 3),
(35, 3, 0, 3),
(36, 4, 0, 3),
(37, 5, 0, 3),
(38, 6, 0, 3),
(39, 7, 0, 3),
(40, 8, 0, 3),
(41, 9, 0, 3),
(42, 10, 0, 3),
(43, 11, 0, 3),
(44, 12, 0, 3),
(45, 13, 0, 3),
(46, 14, 0, 3),
(47, 15, 0, 3),
(48, 16, 0, 3),
(49, 1, 0, 4),
(50, 2, 0, 4),
(51, 3, 0, 4),
(52, 4, 0, 4),
(53, 5, 0, 4),
(54, 6, 0, 4),
(55, 7, 0, 4),
(56, 8, 0, 4),
(57, 9, 0, 4),
(58, 10, 0, 4),
(59, 11, 0, 4),
(60, 12, 0, 4),
(61, 13, 0, 4),
(62, 14, 0, 4),
(63, 15, 0, 4),
(64, 16, 0, 4),
(65, 1, 0, 5),
(66, 2, 0, 5),
(67, 3, 0, 5),
(68, 4, 0, 5),
(69, 5, 0, 5),
(70, 6, 0, 5),
(71, 7, 0, 5),
(72, 8, 0, 5),
(73, 9, 0, 5),
(74, 10, 0, 5),
(75, 11, 0, 5),
(76, 12, 0, 5),
(77, 13, 0, 5),
(78, 14, 0, 5),
(79, 15, 0, 5),
(80, 16, 0, 5),
(257, 17, 1, 1),
(258, 18, 1, 1),
(259, 19, 1, 1),
(260, 20, 1, 1),
(261, 21, 1, 1),
(262, 22, 1, 1),
(263, 23, 1, 1),
(264, 24, 1, 1),
(265, 17, 1, 2),
(266, 18, 1, 2),
(267, 19, 1, 2),
(268, 20, 1, 2),
(269, 21, 1, 2),
(270, 22, 1, 2),
(271, 23, 1, 2),
(272, 24, 1, 2),
(273, 17, 1, 3),
(274, 18, 1, 3),
(275, 19, 1, 3),
(276, 20, 1, 3),
(277, 21, 1, 3),
(278, 22, 1, 3),
(279, 23, 1, 3),
(280, 24, 1, 3),
(281, 17, 1, 4),
(282, 18, 1, 4),
(283, 19, 1, 4),
(284, 20, 1, 4),
(285, 21, 1, 4),
(286, 22, 1, 4),
(287, 23, 1, 4),
(288, 24, 1, 4),
(289, 17, 1, 5),
(290, 18, 1, 5),
(291, 19, 1, 5),
(292, 20, 1, 5),
(293, 21, 1, 5),
(294, 22, 1, 5),
(295, 23, 1, 5),
(296, 24, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `CityID` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Province` varchar(64) NOT NULL,
  `ZipCode` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`CityID`, `Name`, `Province`, `ZipCode`) VALUES
(1, 'Bangkok', 'Bangkok', '10100'),
(2, 'Chiang Mai', 'Chiang Mai', '50000'),
(3, 'Phuket', 'Phuket', '83000'),
(4, 'Pattaya', 'Chon Buri', '20150'),
(5, 'Krabi', 'Krabi', '81000'),
(6, 'Hua Hin', 'Prachuap Khiri Khan', '77110'),
(7, 'Ayutthaya', 'Phra Nakhon Si Ayutthaya', '13000'),
(8, 'Koh Samui', 'Surat Thani', '84320'),
(9, 'Pai', 'Mae Hong Son', '58130'),
(10, 'Nakhon Ratchasima', 'Nakhon Ratchasima', '30000');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `MovieID` int(11) NOT NULL,
  `Title` varchar(256) NOT NULL,
  `Description` varchar(512) NOT NULL,
  `Language` varchar(64) NOT NULL,
  `ReleaseDate` date NOT NULL,
  `Country` varchar(64) NOT NULL,
  `Genre` varchar(20) NOT NULL,
  `Img_url` varchar(255) DEFAULT NULL,
  `Duration` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`MovieID`, `Title`, `Description`, `Language`, `ReleaseDate`, `Country`, `Genre`, `Img_url`, `Duration`) VALUES
(0, 'The Lord of the Rings: The Fellowship of the Ring', 'One ring to rule them all', 'English', '2001-12-19', 'New Zealand', 'Adventure', NULL, 178),
(1, 'Inception', 'A mind-bending heist thriller', 'English', '2010-07-08', 'United States', 'Sci-Fi', NULL, 148),
(2, 'The Shawshank Redemption', 'A story of hope and redemption', 'English', '1994-09-23', 'United States', 'Drama', NULL, 142),
(3, 'Pulp Fiction', 'Quentin Tarantino\'s iconic film', 'English', '1994-10-14', 'United States', 'Crime', NULL, 154),
(4, 'The Dark Knight', 'The rise of the Batman', 'English', '2008-07-18', 'United States', 'Action', NULL, 152),
(5, 'Schindler\'s List', 'The story of a man who saved lives', 'English', '1993-12-15', 'United States', 'Biography', NULL, 195),
(6, 'Forrest Gump', 'Life is like a box of chocolates', 'English', '1994-07-06', 'United States', 'Drama', NULL, 142),
(7, 'The Matrix', 'Welcome to the real world', 'English', '1999-03-31', 'United States', 'Action', NULL, 136),
(8, 'Fight Club', 'The first rule of Fight Club is...', 'English', '1999-10-15', 'United States', 'Drama', NULL, 139),
(9, 'The Godfather', 'An offer you can\'t refuse', 'English', '1972-03-24', 'United States', 'Crime', NULL, 175);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Timestamp` datetime NOT NULL,
  `DiscountCouponID` int(11) NOT NULL,
  `RemoteTransactionID` int(11) NOT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `screening`
--

CREATE TABLE `screening` (
  `ShowID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `CinemaHallID` int(11) NOT NULL,
  `MovieID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `screening`
--

INSERT INTO `screening` (`ShowID`, `Date`, `StartTime`, `EndTime`, `CinemaHallID`, `MovieID`) VALUES
(1, '2023-12-01', '09:00:00', '11:58:00', 1, 0),
(2, '2023-12-01', '12:00:00', '14:28:00', 2, 1),
(3, '2023-12-02', '14:30:00', '17:32:00', 3, 2),
(4, '2023-12-02', '18:00:00', '20:34:00', 4, 3),
(5, '2023-12-03', '08:45:00', '11:16:00', 5, 4),
(16, '2023-11-21', '14:45:00', '17:00:00', 1, 5),
(18, '2023-12-09', '18:15:00', '21:30:00', 3, 7),
(19, '2023-12-10', '12:00:00', '14:19:00', 4, 8),
(20, '2023-12-10', '15:00:00', '17:55:00', 5, 9),
(25, '2023-11-21', '14:45:00', '17:00:00', 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `screening_seat`
--

CREATE TABLE `screening_seat` (
  `ShowSeatID` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `CinemaSeatID` int(11) NOT NULL,
  `ShowID` int(11) NOT NULL,
  `BookingID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `screening_seat`
--

INSERT INTO `screening_seat` (`ShowSeatID`, `Status`, `Price`, `CinemaSeatID`, `ShowID`, `BookingID`) VALUES
(1, 0, 550, 1, 1, NULL),
(2, 0, 550, 2, 1, NULL),
(3, 0, 550, 3, 1, NULL),
(4, 0, 550, 4, 1, NULL),
(5, 0, 550, 5, 1, NULL),
(6, 0, 550, 6, 1, NULL),
(7, 0, 550, 7, 1, NULL),
(8, 0, 550, 8, 1, NULL),
(9, 0, 550, 9, 1, NULL),
(10, 0, 550, 10, 1, NULL),
(11, 0, 550, 11, 1, NULL),
(12, 0, 550, 12, 1, NULL),
(13, 0, 550, 13, 1, NULL),
(14, 0, 550, 14, 1, NULL),
(15, 0, 550, 15, 1, NULL),
(16, 0, 550, 16, 1, NULL),
(17, 0, 660, 257, 1, NULL),
(18, 0, 660, 258, 1, NULL),
(19, 0, 660, 259, 1, NULL),
(20, 0, 660, 260, 1, NULL),
(21, 0, 660, 261, 1, NULL),
(22, 0, 660, 262, 1, NULL),
(23, 0, 660, 263, 1, NULL),
(24, 0, 660, 264, 1, NULL),
(25, 0, 550, 1, 16, NULL),
(26, 0, 550, 2, 16, NULL),
(27, 0, 550, 3, 16, NULL),
(28, 0, 550, 4, 16, NULL),
(29, 0, 550, 5, 16, NULL),
(30, 0, 550, 6, 16, NULL),
(31, 0, 550, 7, 16, NULL),
(32, 0, 550, 8, 16, NULL),
(33, 0, 550, 9, 16, NULL),
(34, 0, 550, 10, 16, NULL),
(35, 0, 550, 11, 16, NULL),
(36, 0, 550, 12, 16, NULL),
(37, 0, 550, 13, 16, NULL),
(38, 0, 550, 14, 16, NULL),
(39, 0, 550, 15, 16, NULL),
(40, 0, 550, 16, 16, NULL),
(41, 0, 660, 257, 16, NULL),
(42, 0, 660, 258, 16, NULL),
(43, 0, 660, 259, 16, NULL),
(44, 0, 660, 260, 16, NULL),
(45, 0, 660, 261, 16, NULL),
(46, 0, 660, 262, 16, NULL),
(47, 0, 660, 263, 16, NULL),
(48, 0, 660, 264, 16, NULL),
(49, 0, 550, 1, 25, NULL),
(50, 0, 550, 2, 25, NULL),
(51, 0, 550, 3, 25, NULL),
(52, 0, 550, 4, 25, NULL),
(53, 0, 550, 5, 25, NULL),
(54, 0, 550, 6, 25, NULL),
(55, 0, 550, 7, 25, NULL),
(56, 0, 550, 8, 25, NULL),
(57, 0, 550, 9, 25, NULL),
(58, 0, 550, 10, 25, NULL),
(59, 0, 550, 11, 25, NULL),
(60, 0, 550, 12, 25, NULL),
(61, 0, 550, 13, 25, NULL),
(62, 0, 550, 14, 25, NULL),
(63, 0, 550, 15, 25, NULL),
(64, 0, 550, 16, 25, NULL),
(65, 0, 660, 257, 25, NULL),
(66, 0, 660, 258, 25, NULL),
(67, 0, 660, 259, 25, NULL),
(68, 0, 660, 260, 25, NULL),
(69, 0, 660, 261, 25, NULL),
(70, 0, 660, 262, 25, NULL),
(71, 0, 660, 263, 25, NULL),
(72, 0, 660, 264, 25, NULL),
(73, 0, 550, 17, 2, NULL),
(74, 0, 550, 18, 2, NULL),
(75, 0, 550, 19, 2, NULL),
(76, 0, 550, 20, 2, NULL),
(77, 0, 550, 21, 2, NULL),
(78, 0, 550, 22, 2, NULL),
(79, 0, 550, 23, 2, NULL),
(80, 0, 550, 24, 2, NULL),
(81, 0, 550, 25, 2, NULL),
(82, 0, 550, 26, 2, NULL),
(83, 0, 550, 27, 2, NULL),
(84, 0, 550, 28, 2, NULL),
(85, 0, 550, 29, 2, NULL),
(86, 0, 550, 30, 2, NULL),
(87, 0, 550, 31, 2, NULL),
(88, 0, 550, 32, 2, NULL),
(89, 0, 660, 265, 2, NULL),
(90, 0, 660, 266, 2, NULL),
(91, 0, 660, 267, 2, NULL),
(92, 0, 660, 268, 2, NULL),
(93, 0, 660, 269, 2, NULL),
(94, 0, 660, 270, 2, NULL),
(95, 0, 660, 271, 2, NULL),
(96, 0, 660, 272, 2, NULL),
(97, 0, 550, 33, 3, NULL),
(98, 0, 550, 34, 3, NULL),
(99, 0, 550, 35, 3, NULL),
(100, 0, 550, 36, 3, NULL),
(101, 0, 550, 37, 3, NULL),
(102, 0, 550, 38, 3, NULL),
(103, 0, 550, 39, 3, NULL),
(104, 0, 550, 40, 3, NULL),
(105, 0, 550, 41, 3, NULL),
(106, 0, 550, 42, 3, NULL),
(107, 0, 550, 43, 3, NULL),
(108, 0, 550, 44, 3, NULL),
(109, 0, 550, 45, 3, NULL),
(110, 0, 550, 46, 3, NULL),
(111, 0, 550, 47, 3, NULL),
(112, 0, 550, 48, 3, NULL),
(113, 0, 660, 273, 3, NULL),
(114, 0, 660, 274, 3, NULL),
(115, 0, 660, 275, 3, NULL),
(116, 0, 660, 276, 3, NULL),
(117, 0, 660, 277, 3, NULL),
(118, 0, 660, 278, 3, NULL),
(119, 0, 660, 279, 3, NULL),
(120, 0, 660, 280, 3, NULL),
(121, 0, 550, 33, 18, NULL),
(122, 0, 550, 34, 18, NULL),
(123, 0, 550, 35, 18, NULL),
(124, 0, 550, 36, 18, NULL),
(125, 0, 550, 37, 18, NULL),
(126, 0, 550, 38, 18, NULL),
(127, 0, 550, 39, 18, NULL),
(128, 0, 550, 40, 18, NULL),
(129, 0, 550, 41, 18, NULL),
(130, 0, 550, 42, 18, NULL),
(131, 0, 550, 43, 18, NULL),
(132, 0, 550, 44, 18, NULL),
(133, 0, 550, 45, 18, NULL),
(134, 0, 550, 46, 18, NULL),
(135, 0, 550, 47, 18, NULL),
(136, 0, 550, 48, 18, NULL),
(137, 0, 660, 273, 18, NULL),
(138, 0, 660, 274, 18, NULL),
(139, 0, 660, 275, 18, NULL),
(140, 0, 660, 276, 18, NULL),
(141, 0, 660, 277, 18, NULL),
(142, 0, 660, 278, 18, NULL),
(143, 0, 660, 279, 18, NULL),
(144, 0, 660, 280, 18, NULL),
(145, 0, 550, 49, 4, NULL),
(146, 0, 550, 50, 4, NULL),
(147, 0, 550, 51, 4, NULL),
(148, 0, 550, 52, 4, NULL),
(149, 0, 550, 53, 4, NULL),
(150, 0, 550, 54, 4, NULL),
(151, 0, 550, 55, 4, NULL),
(152, 0, 550, 56, 4, NULL),
(153, 0, 550, 57, 4, NULL),
(154, 0, 550, 58, 4, NULL),
(155, 0, 550, 59, 4, NULL),
(156, 0, 550, 60, 4, NULL),
(157, 0, 550, 61, 4, NULL),
(158, 0, 550, 62, 4, NULL),
(159, 0, 550, 63, 4, NULL),
(160, 0, 550, 64, 4, NULL),
(161, 0, 660, 281, 4, NULL),
(162, 0, 660, 282, 4, NULL),
(163, 0, 660, 283, 4, NULL),
(164, 0, 660, 284, 4, NULL),
(165, 0, 660, 285, 4, NULL),
(166, 0, 660, 286, 4, NULL),
(167, 0, 660, 287, 4, NULL),
(168, 0, 660, 288, 4, NULL),
(169, 0, 550, 49, 19, NULL),
(170, 0, 550, 50, 19, NULL),
(171, 0, 550, 51, 19, NULL),
(172, 0, 550, 52, 19, NULL),
(173, 0, 550, 53, 19, NULL),
(174, 0, 550, 54, 19, NULL),
(175, 0, 550, 55, 19, NULL),
(176, 0, 550, 56, 19, NULL),
(177, 0, 550, 57, 19, NULL),
(178, 0, 550, 58, 19, NULL),
(179, 0, 550, 59, 19, NULL),
(180, 0, 550, 60, 19, NULL),
(181, 0, 550, 61, 19, NULL),
(182, 0, 550, 62, 19, NULL),
(183, 0, 550, 63, 19, NULL),
(184, 0, 550, 64, 19, NULL),
(185, 0, 660, 281, 19, NULL),
(186, 0, 660, 282, 19, NULL),
(187, 0, 660, 283, 19, NULL),
(188, 0, 660, 284, 19, NULL),
(189, 0, 660, 285, 19, NULL),
(190, 0, 660, 286, 19, NULL),
(191, 0, 660, 287, 19, NULL),
(192, 0, 660, 288, 19, NULL),
(193, 0, 550, 65, 5, NULL),
(194, 0, 550, 66, 5, NULL),
(195, 0, 550, 67, 5, NULL),
(196, 0, 550, 68, 5, NULL),
(197, 0, 550, 69, 5, NULL),
(198, 0, 550, 70, 5, NULL),
(199, 0, 550, 71, 5, NULL),
(200, 0, 550, 72, 5, NULL),
(201, 0, 550, 73, 5, NULL),
(202, 0, 550, 74, 5, NULL),
(203, 0, 550, 75, 5, NULL),
(204, 0, 550, 76, 5, NULL),
(205, 0, 550, 77, 5, NULL),
(206, 0, 550, 78, 5, NULL),
(207, 0, 550, 79, 5, NULL),
(208, 0, 550, 80, 5, NULL),
(209, 0, 660, 289, 5, NULL),
(210, 0, 660, 290, 5, NULL),
(211, 0, 660, 291, 5, NULL),
(212, 0, 660, 292, 5, NULL),
(213, 0, 660, 293, 5, NULL),
(214, 0, 660, 294, 5, NULL),
(215, 0, 660, 295, 5, NULL),
(216, 0, 660, 296, 5, NULL),
(217, 0, 550, 65, 20, NULL),
(218, 0, 550, 66, 20, NULL),
(219, 0, 550, 67, 20, NULL),
(220, 0, 550, 68, 20, NULL),
(221, 0, 550, 69, 20, NULL),
(222, 0, 550, 70, 20, NULL),
(223, 0, 550, 71, 20, NULL),
(224, 0, 550, 72, 20, NULL),
(225, 0, 550, 73, 20, NULL),
(226, 0, 550, 74, 20, NULL),
(227, 0, 550, 75, 20, NULL),
(228, 0, 550, 76, 20, NULL),
(229, 0, 550, 77, 20, NULL),
(230, 0, 550, 78, 20, NULL),
(231, 0, 550, 79, 20, NULL),
(232, 0, 550, 80, 20, NULL),
(233, 0, 660, 289, 20, NULL),
(234, 0, 660, 290, 20, NULL),
(235, 0, 660, 291, 20, NULL),
(236, 0, 660, 292, 20, NULL),
(237, 0, 660, 293, 20, NULL),
(238, 0, 660, 294, 20, NULL),
(239, 0, 660, 295, 20, NULL),
(240, 0, 660, 296, 20, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Password` varbinary(50) NOT NULL,
  `Email` varchar(64) NOT NULL,
  `Phone` varchar(16) NOT NULL,
  `Role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Name`, `Password`, `Email`, `Phone`, `Role`) VALUES
(1, 'CripDepress', 0x92e0bbb2c07900d46df455491c1bdbc7, 'gritciaxx@gmail.com', '0647539245', 'customer'),
(4, 'Admin', 0xfed3e1bc4ab5ae028862beb85bd5232b, 'admin@siit.tu.ac.th', '1234567890', 'Admin');

-- --------------------------------------------------------

--
-- Structure for view `all_showings`
--
DROP TABLE IF EXISTS `all_showings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_showings`  AS SELECT `screening`.`ShowID` AS `ShowID`, `screening`.`MovieID` AS `MovieID`, `movie`.`Title` AS `Title`, `screening`.`CinemaHallID` AS `CinemaHallID`, `cinema_hall`.`Name` AS `hallName`, `cinema_hall`.`CinemaID` AS `CinemaID`, `cinema`.`Name` AS `cinemaName`, `screening`.`Date` AS `StartDate`, `screening`.`StartTime` AS `StartTime` FROM (((`screening` join `movie` on((`screening`.`MovieID` = `movie`.`MovieID`))) join `cinema_hall` on((`screening`.`CinemaHallID` = `cinema_hall`.`CinemaHallID`))) join `cinema` on((`cinema_hall`.`CinemaID` = `cinema`.`CinemaID`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BookingID`),
  ADD UNIQUE KEY `UserID` (`UserID`,`ShowID`),
  ADD KEY `UserID_2` (`UserID`,`ShowID`),
  ADD KEY `ShowID` (`ShowID`);

--
-- Indexes for table `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`CinemaID`),
  ADD UNIQUE KEY `CityID` (`CityID`);

--
-- Indexes for table `cinema_hall`
--
ALTER TABLE `cinema_hall`
  ADD PRIMARY KEY (`CinemaHallID`),
  ADD KEY `CinemaID` (`CinemaID`);

--
-- Indexes for table `cinema_seat`
--
ALTER TABLE `cinema_seat`
  ADD PRIMARY KEY (`CinemaSeatID`),
  ADD KEY `CinemaHall` (`CinemaHall`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`CityID`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`MovieID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `BookingID` (`BookingID`);

--
-- Indexes for table `screening`
--
ALTER TABLE `screening`
  ADD PRIMARY KEY (`ShowID`),
  ADD KEY `CinemaHallID_2` (`CinemaHallID`,`MovieID`),
  ADD KEY `MovieID` (`MovieID`),
  ADD KEY `CinemaHallID` (`CinemaHallID`,`MovieID`) USING BTREE;

--
-- Indexes for table `screening_seat`
--
ALTER TABLE `screening_seat`
  ADD PRIMARY KEY (`ShowSeatID`),
  ADD KEY `CinemaSeatID` (`CinemaSeatID`,`ShowID`,`BookingID`),
  ADD KEY `ShowID` (`ShowID`),
  ADD KEY `BookingID` (`BookingID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cinema`
--
ALTER TABLE `cinema`
  MODIFY `CinemaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cinema_hall`
--
ALTER TABLE `cinema_hall`
  MODIFY `CinemaHallID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cinema_seat`
--
ALTER TABLE `cinema_seat`
  MODIFY `CinemaSeatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `CityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `MovieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `screening`
--
ALTER TABLE `screening`
  MODIFY `ShowID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `screening_seat`
--
ALTER TABLE `screening_seat`
  MODIFY `ShowSeatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`ShowID`) REFERENCES `screening` (`ShowID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `cinema`
--
ALTER TABLE `cinema`
  ADD CONSTRAINT `cinema_ibfk_1` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`);

--
-- Constraints for table `cinema_hall`
--
ALTER TABLE `cinema_hall`
  ADD CONSTRAINT `cinema_hall_ibfk_1` FOREIGN KEY (`CinemaID`) REFERENCES `cinema` (`CinemaID`);

--
-- Constraints for table `cinema_seat`
--
ALTER TABLE `cinema_seat`
  ADD CONSTRAINT `cinema_seat_ibfk_1` FOREIGN KEY (`CinemaHall`) REFERENCES `cinema_hall` (`CinemaHallID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`);

--
-- Constraints for table `screening`
--
ALTER TABLE `screening`
  ADD CONSTRAINT `screening_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`),
  ADD CONSTRAINT `screening_ibfk_2` FOREIGN KEY (`CinemaHallID`) REFERENCES `cinema_hall` (`CinemaHallID`);

--
-- Constraints for table `screening_seat`
--
ALTER TABLE `screening_seat`
  ADD CONSTRAINT `screening_seat_ibfk_1` FOREIGN KEY (`ShowID`) REFERENCES `screening` (`ShowID`),
  ADD CONSTRAINT `screening_seat_ibfk_2` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  ADD CONSTRAINT `screening_seat_ibfk_3` FOREIGN KEY (`CinemaSeatID`) REFERENCES `cinema_seat` (`CinemaSeatID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
