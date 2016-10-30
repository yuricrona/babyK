-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2016 at 10:31 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `babyk`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` varchar(32) NOT NULL,
  `CODE` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(200) NOT NULL,
  `CREATED_DATE` date NOT NULL,
  `CREATED_BY` varchar(32) NOT NULL,
  `UPDATED_DATE` date NOT NULL,
  `UPDATED_BY` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ID` varchar(32) NOT NULL,
  `CODE` varchar(100) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(200) NOT NULL,
  `CATEGORY_ID` varchar(32) NOT NULL,
  `PRICE` decimal(10,0) NOT NULL,
  `DISCOUNT` int(11) NOT NULL,
  `CREATED_DATE` date NOT NULL,
  `CREATED_BY` varchar(32) NOT NULL,
  `UPDATED_DATE` date NOT NULL,
  `UPDATED_BY` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` varchar(32) NOT NULL,
  `USERNAME` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `CREATED_DATE` date NOT NULL,
  `UPDATED_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_CATEGORY_CODE` (`CODE`),
  ADD KEY `IDX_CATEGORY_CREATED_BY` (`CREATED_BY`),
  ADD KEY `IDX_CATEGORY_UPDATED_BY` (`UPDATED_BY`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_ITEM_CODE` (`CODE`),
  ADD UNIQUE KEY `UK_ITEM_NAME` (`NAME`),
  ADD KEY `IDX_ITEM_CATEGORY_ID` (`CATEGORY_ID`),
  ADD KEY `IDX_ITEM_CREATED_BY` (`CREATED_BY`),
  ADD KEY `IDX_ITEM_UPDATED_BY` (`UPDATED_BY`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_USER_USERNAME` (`USERNAME`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_CATEGORY_CREATED_BY` FOREIGN KEY (`CREATED_BY`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATEGORY_UPDATED_BY` FOREIGN KEY (`UPDATED_BY`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_ITEM_CATEGORY_ID` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ITEM_CREATED_BY` FOREIGN KEY (`CREATED_BY`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ITEM_UPDATED_BY` FOREIGN KEY (`UPDATED_BY`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
