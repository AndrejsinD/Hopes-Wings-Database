-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 20, 2020 at 06:23 AM
-- Server version: 5.7.29-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hopes_wings`
--

-- --------------------------------------------------------

--
-- Table structure for table `Cash`
--

CREATE TABLE `Cash` (
  `CashID` int(11) NOT NULL,
  `DonationID` int(11) NOT NULL,
  `Amount` decimal(60,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Cash`
--

INSERT INTO `Cash` (`CashID`, `DonationID`, `Amount`) VALUES
(1, 10, '55.20'),
(2, 11, '36.44'),
(3, 12, '46.81'),
(4, 13, '11.00'),
(5, 14, '356755.25');

-- --------------------------------------------------------

--
-- Table structure for table `CheckTable`
--

CREATE TABLE `CheckTable` (
  `CheckID` int(11) NOT NULL,
  `DonationID` int(11) NOT NULL,
  `Amount` decimal(60,2) NOT NULL,
  `CheckNumber` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CheckTable`
--

INSERT INTO `CheckTable` (`CheckID`, `DonationID`, `Amount`, `CheckNumber`) VALUES
(1, 17, '1000.00', 1010),
(2, 18, '35.00', 1563),
(3, 19, '25.00', 995881),
(4, 20, '700.00', 222646),
(5, 21, '1500.00', 102447),
(6, 24, '8471.00', 76566),
(7, 25, '5867.00', 1332);

-- --------------------------------------------------------

--
-- Table structure for table `Donation`
--

CREATE TABLE `Donation` (
  `DonationID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Comment` varchar(6500) DEFAULT NULL,
  `Amount` decimal(60,2) NOT NULL,
  `LetterSent` varchar(5) NOT NULL,
  `DateLastLetterSent` date DEFAULT NULL,
  `DonationType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Donation`
--

INSERT INTO `Donation` (`DonationID`, `Date`, `Comment`, `Amount`, `LetterSent`, `DateLastLetterSent`, `DonationType`) VALUES
(1, '2020-01-17', NULL, '1545.00', 'No', NULL, ''),
(2, '2020-02-25', NULL, '48.60', 'No', NULL, ''),
(3, '2020-02-25', NULL, '48.60', 'No', NULL, ''),
(4, '2020-02-25', NULL, '48.60', 'No', NULL, ''),
(5, '2020-02-25', NULL, '48.60', 'No', NULL, ''),
(6, '2020-02-25', NULL, '48.60', 'No', NULL, ''),
(7, '2020-02-25', NULL, '19.26', 'No', NULL, ''),
(8, '2020-02-25', NULL, '19.26', 'No', NULL, ''),
(9, '2020-02-25', NULL, '244.20', 'No', NULL, ''),
(10, '2020-01-11', 'Cash was neatly folded.', '55.20', 'Yes', NULL, ''),
(11, '2020-02-17', 'Donor wants this to go towards coloring books.', '36.44', 'Yes', NULL, ''),
(12, '2020-03-02', NULL, '45.81', 'No', NULL, ''),
(13, '2020-03-02', 'To help buy coffee.', '11.00', 'No', NULL, ''),
(14, '2020-04-01', 'April Fools!', '356755.25', 'Yes', NULL, ''),
(15, '2020-01-17', NULL, '1556.00', 'Yes', NULL, ''),
(16, '2020-01-22', NULL, '44.27', 'NO', NULL, ''),
(17, '2020-01-13', NULL, '1000.00', 'Yes', NULL, ''),
(18, '2020-01-13', NULL, '35.00', 'Yes', NULL, ''),
(19, '2020-01-13', NULL, '25.00', 'Yes', NULL, ''),
(20, '2020-01-13', NULL, '700.00', 'Yes', NULL, ''),
(21, '2020-01-13', NULL, '1500.00', 'Yes', NULL, ''),
(22, '2020-02-27', NULL, '8.53', 'Yes', NULL, ''),
(23, '2020-02-27', NULL, '1556.00', 'Yes', NULL, ''),
(24, '2020-02-05', NULL, '8471.00', 'Yes', NULL, ''),
(25, '2020-02-25', NULL, '5867.00', 'Yes', NULL, ''),
(26, '2020-01-30', 'Thanks for the table!', '500.00', 'Yes', NULL, ''),
(27, '2020-03-20', 'Pretty cool couch.', '300.00', 'No', NULL, ''),
(28, '2020-02-11', 'Sturdy office desk.', '400.00', 'Yes', NULL, ''),
(29, '2020-01-22', 'Certified bust of Augustus Caesar', '312500.00', 'Yes', NULL, ''),
(30, '2020-03-13', '', '40.00', 'No', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `DonorID` int(11) NOT NULL,
  `DonorName` varchar(6500) NOT NULL,
  `Address` varchar(6500) DEFAULT NULL,
  `City` varchar(6500) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `Zip` int(5) DEFAULT NULL,
  `Comment` varchar(6500) DEFAULT NULL,
  `EmailAddress` varchar(6000) DEFAULT NULL,
  `PhoneNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`DonorID`, `DonorName`, `Address`, `City`, `State`, `Zip`, `Comment`, `EmailAddress`, `PhoneNumber`) VALUES
(1, 'KY Housing Corporation', NULL, 'Frankfort', 'KY', NULL, NULL, NULL, 0),
(2, 'Kroger Rewards', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, '1st Christian Church- Berea', '206 Chestnut Street', 'Berea', 'KY', 40403, NULL, NULL, 0),
(4, 'Lisa Thornsberry', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 'RJ Johnson', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(6, 'Julie Bastian', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 'Victorian Sidor', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(8, 'Sarah Shaffer', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(9, 'Suraya Shalash', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(10, 'Karrie Johns', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(11, 'Cassidy Jewell', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(12, 'CashDonorOne', '101 Chestnut Street', 'Berea', 'KY', 40403, 'Nice donor!', NULL, 0),
(13, 'CashDonorTwo', 'Campus Drive', 'Berea', 'KY', 40403, 'Very Wealthy.', NULL, 0),
(14, 'CashDonorThree', '101 Cardinal Lane', 'Richmond', 'KY', 40475, 'Cool suit.', NULL, 0),
(15, 'CashDonorFour', '3012-3098 Inwood Road', 'Dallas', 'TX', 75235, 'Texas is hot.', NULL, 0),
(16, 'Jonathan Dough', '101 Fairytail Boulevard', 'Atlantis', 'GA', 30301, 'Nice donor!', NULL, 0),
(17, 'Benevity Causes', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(18, 'Kennaria Brown', '614 Nandino Circle', 'Berea', 'KY', 40403, NULL, NULL, 0),
(19, 'Deana Hazelwood', '601 Prospect Street', 'Berea', 'KY', 40403, NULL, NULL, 0),
(20, 'Peoples Bank', '', 'Berea', 'KY', 40403, NULL, NULL, 0),
(21, 'Kentucky Bank', 'PO Box 157', 'Paris', 'KY', 40362, NULL, NULL, 0),
(22, 'Amazon Smiles', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(23, 'Fiscal Court of Madison County', '', 'Richmond', 'KY', 40475, '', NULL, 0),
(24, 'City of Richmond', 'PO Box 1268', 'Richmond', 'KY', 40475, '', NULL, 0),
(25, 'InKindDonor1', '101 Main Street', 'New York', 'NY', 10001, 'From the big apple!', NULL, 0),
(26, 'InKindDonor2', '', 'Denver', 'CO', 80014, 'Hit the slopes.', NULL, 0),
(27, 'InKindDonor3', 'PO Box 201', 'San Bernardino', 'CA', 94201, 'Pretty warm there this time of year.', NULL, 0),
(28, 'InKindDonor4', '', '', '', NULL, 'Chose to withhold his address.', NULL, 0),
(29, 'InKindDonor5', '72 Creek Drive', 'Prompton', 'PA', 18456, 'Do not remember how I found this town.', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `DonorsToDonations`
--

CREATE TABLE `DonorsToDonations` (
  `DTD_ID` int(11) NOT NULL,
  `DonorID` int(11) NOT NULL,
  `DonationID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DonorsToDonations`
--

INSERT INTO `DonorsToDonations` (`DTD_ID`, `DonorID`, `DonationID`) VALUES
(1, 1, 1),
(2, 4, 2),
(3, 5, 3),
(4, 6, 4),
(5, 7, 5),
(6, 8, 6),
(7, 9, 7),
(8, 10, 8),
(9, 11, 9),
(10, 12, 10),
(11, 13, 11),
(12, 14, 12),
(13, 15, 13),
(14, 16, 14),
(15, 1, 15),
(16, 17, 16),
(17, 3, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 1, 23),
(24, 23, 24),
(25, 24, 25),
(26, 25, 26),
(27, 26, 27),
(28, 27, 28),
(29, 28, 29),
(30, 29, 30);

-- --------------------------------------------------------

--
-- Table structure for table `EFT`
--

CREATE TABLE `EFT` (
  `EFTID` int(255) NOT NULL,
  `DonationID` int(255) NOT NULL,
  `Amount` decimal(60,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EFT`
--

INSERT INTO `EFT` (`EFTID`, `DonationID`, `Amount`) VALUES
(1, 1, '1545.00'),
(2, 15, '1556.00'),
(3, 16, '44.27'),
(4, 22, '8.53'),
(5, 23, '1556.00');

-- --------------------------------------------------------

--
-- Table structure for table `Grant`
--

CREATE TABLE `Grant` (
  `GrantID` int(11) NOT NULL,
  `DonationID` int(11) NOT NULL,
  `Amount` decimal(60,2) NOT NULL,
  `GrantName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Grant`
--

INSERT INTO `Grant` (`GrantID`, `DonationID`, `Amount`, `GrantName`) VALUES
(1, 1, '1545.00', 'KY Housing Corporation'),
(2, 15, '1556.00', 'KY Housing Corporation'),
(3, 23, '1556.00', 'KY Housing Corporation'),
(4, 24, '8471.00', 'Fiscal Court of Madison County'),
(5, 25, '5867.00', 'City of Richmond');

-- --------------------------------------------------------

--
-- Table structure for table `In Kind`
--

CREATE TABLE `In Kind` (
  `InKindID` int(11) NOT NULL,
  `DonationID` int(11) NOT NULL,
  `Amount` decimal(60,2) NOT NULL,
  `ItemGiven` varchar(6500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `In Kind`
--

INSERT INTO `In Kind` (`InKindID`, `DonationID`, `Amount`, `ItemGiven`) VALUES
(1, 26, '500.00', 'Table'),
(2, 27, '300.00', 'Couch'),
(3, 28, '400.00', 'Office Desk'),
(4, 29, '312500.00', 'Authentic Caesar Bust'),
(5, 30, '40.00', 'Coffee Maker');

-- --------------------------------------------------------

--
-- Table structure for table `PayPal`
--

CREATE TABLE `PayPal` (
  `PayPalID` int(11) NOT NULL,
  `DonationID` int(11) NOT NULL,
  `Amount` decimal(60,2) NOT NULL,
  `ReceiptNumber` varchar(6500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PayPal`
--

INSERT INTO `PayPal` (`PayPalID`, `DonationID`, `Amount`, `ReceiptNumber`) VALUES
(1, 2, '48.60', NULL),
(2, 3, '48.60', NULL),
(3, 4, '48.60', NULL),
(4, 5, '48.60', NULL),
(5, 6, '48.60', NULL),
(6, 7, '19.26', NULL),
(7, 8, '19.26', NULL),
(8, 9, '244.20', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Cash`
--
ALTER TABLE `Cash`
  ADD PRIMARY KEY (`CashID`),
  ADD KEY `DonationID` (`DonationID`);

--
-- Indexes for table `CheckTable`
--
ALTER TABLE `CheckTable`
  ADD PRIMARY KEY (`CheckID`),
  ADD KEY `DonationID` (`DonationID`);

--
-- Indexes for table `Donation`
--
ALTER TABLE `Donation`
  ADD PRIMARY KEY (`DonationID`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`DonorID`);

--
-- Indexes for table `DonorsToDonations`
--
ALTER TABLE `DonorsToDonations`
  ADD PRIMARY KEY (`DTD_ID`),
  ADD KEY `DonorID` (`DonorID`),
  ADD KEY `DonationID` (`DonationID`);

--
-- Indexes for table `EFT`
--
ALTER TABLE `EFT`
  ADD PRIMARY KEY (`EFTID`),
  ADD KEY `EFT_ibfk_1` (`DonationID`);

--
-- Indexes for table `Grant`
--
ALTER TABLE `Grant`
  ADD PRIMARY KEY (`GrantID`),
  ADD KEY `DonationID` (`DonationID`);

--
-- Indexes for table `In Kind`
--
ALTER TABLE `In Kind`
  ADD PRIMARY KEY (`InKindID`),
  ADD KEY `DonationID` (`DonationID`),
  ADD KEY `DonationID_2` (`DonationID`);

--
-- Indexes for table `PayPal`
--
ALTER TABLE `PayPal`
  ADD PRIMARY KEY (`PayPalID`),
  ADD KEY `DonationID` (`DonationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Cash`
--
ALTER TABLE `Cash`
  MODIFY `CashID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `CheckTable`
--
ALTER TABLE `CheckTable`
  MODIFY `CheckID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `Donation`
--
ALTER TABLE `Donation`
  MODIFY `DonationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `donors`
--
ALTER TABLE `donors`
  MODIFY `DonorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `DonorsToDonations`
--
ALTER TABLE `DonorsToDonations`
  MODIFY `DTD_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `EFT`
--
ALTER TABLE `EFT`
  MODIFY `EFTID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Grant`
--
ALTER TABLE `Grant`
  MODIFY `GrantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `In Kind`
--
ALTER TABLE `In Kind`
  MODIFY `InKindID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `PayPal`
--
ALTER TABLE `PayPal`
  MODIFY `PayPalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Cash`
--
ALTER TABLE `Cash`
  ADD CONSTRAINT `Cash_ibfk_1` FOREIGN KEY (`DonationID`) REFERENCES `Donation` (`DonationID`);

--
-- Constraints for table `CheckTable`
--
ALTER TABLE `CheckTable`
  ADD CONSTRAINT `CheckTable_ibfk_1` FOREIGN KEY (`DonationID`) REFERENCES `Donation` (`DonationID`);

--
-- Constraints for table `DonorsToDonations`
--
ALTER TABLE `DonorsToDonations`
  ADD CONSTRAINT `DonorsToDonations_ibfk_1` FOREIGN KEY (`DonorID`) REFERENCES `donors` (`DonorID`),
  ADD CONSTRAINT `DonorsToDonations_ibfk_2` FOREIGN KEY (`DonationID`) REFERENCES `Donation` (`DonationID`);

--
-- Constraints for table `EFT`
--
ALTER TABLE `EFT`
  ADD CONSTRAINT `EFT_ibfk_1` FOREIGN KEY (`DonationID`) REFERENCES `Donation` (`DonationID`);

--
-- Constraints for table `Grant`
--
ALTER TABLE `Grant`
  ADD CONSTRAINT `Grant_ibfk_1` FOREIGN KEY (`DonationID`) REFERENCES `Donation` (`DonationID`);

--
-- Constraints for table `In Kind`
--
ALTER TABLE `In Kind`
  ADD CONSTRAINT `In Kind_ibfk_1` FOREIGN KEY (`DonationID`) REFERENCES `Donation` (`DonationID`);

--
-- Constraints for table `PayPal`
--
ALTER TABLE `PayPal`
  ADD CONSTRAINT `PayPal_ibfk_1` FOREIGN KEY (`DonationID`) REFERENCES `Donation` (`DonationID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
