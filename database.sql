-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Nov 22, 2023 at 05:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bloodbank`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `findall_Donor_admin` ()   BEGIN 
  SELECT * 
  FROM Donor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `find_Donor_rs` (IN `id` INT)   BEGIN
  SELECT DonorName,DonorAge,DonorGender,DonorBloodGroup,DonorBloodQuantity,DonorDate,DonorPhone
  FROM Donor
  where StaffID=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_on_bloodspecimen` ()   BEGIN
  UPDATE BloodSpecimen BS
  SET BS.BloodQuantity = (
      SELECT SUM(D.DonorBloodQuantity)
      FROM Donor D
      INNER JOIN RecordingStaff RS ON D.StaffID = RS.StaffID
      WHERE D.DonorBloodGroup = BS.BloodGroup AND RS.HospitalID = BS.HospitalID);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bloodspecimen`
--

CREATE TABLE `bloodspecimen` (
  `SpecimenID` int(11) NOT NULL,
  `BloodGroup` varchar(10) NOT NULL,
  `BloodQuantity` float DEFAULT NULL,
  `HospitalID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bloodspecimen`
--

INSERT INTO `bloodspecimen` (`SpecimenID`, `BloodGroup`, `BloodQuantity`, `HospitalID`) VALUES
(701, 'A+', 3.75, 1000),
(702, 'A-', NULL, 1000),
(703, 'B+', NULL, 1000),
(704, 'B-', NULL, 1000),
(705, 'O+', NULL, 1000),
(706, 'O-', NULL, 1000),
(707, 'AB+', NULL, 1000),
(708, 'AB-', NULL, 1000),
(709, 'A+', NULL, 2000),
(710, 'A-', NULL, 2000),
(711, 'B+', 1.6, 2000),
(712, 'B-', NULL, 2000),
(713, 'O+', NULL, 2000),
(714, 'O-', NULL, 2000),
(715, 'AB+', NULL, 2000),
(716, 'AB-', NULL, 2000),
(717, 'A+', NULL, 3000),
(718, 'A-', NULL, 3000),
(719, 'B+', NULL, 3000),
(720, 'B-', NULL, 3000),
(721, 'O+', 1, 3000),
(722, 'O-', NULL, 3000),
(723, 'AB+', NULL, 3000),
(724, 'AB-', NULL, 3000),
(725, 'A+', NULL, 4000),
(726, 'A-', NULL, 4000),
(727, 'B+', NULL, 4000),
(728, 'B-', NULL, 4000),
(729, 'O+', 1.32, 4000),
(730, 'O-', NULL, 4000),
(731, 'AB+', NULL, 4000),
(732, 'AB-', NULL, 4000),
(733, 'A+', 0.8, 5000),
(734, 'A-', NULL, 5000),
(735, 'B+', NULL, 5000),
(736, 'B-', NULL, 5000),
(738, 'O+', NULL, 5000),
(739, 'O-', NULL, 5000),
(740, 'AB+', NULL, 5000),
(741, 'AB-', NULL, 5000),
(742, 'A+', NULL, 6000),
(743, 'A-', NULL, 6000),
(744, 'B+', 1.1, 6000),
(745, 'B-', NULL, 6000),
(746, 'O+', NULL, 6000),
(747, 'O-', NULL, 6000),
(748, 'AB+', NULL, 6000),
(749, 'AB-', NULL, 6000),
(750, 'A+', NULL, 7000),
(751, 'A-', NULL, 7000),
(752, 'B+', NULL, 7000),
(753, 'B-', NULL, 7000),
(754, 'O+', 0.75, 7000),
(755, 'O-', NULL, 7000),
(756, 'AB+', NULL, 7000),
(757, 'AB-', NULL, 7000),
(758, 'A+', NULL, 8000),
(759, 'A-', NULL, 8000),
(760, 'B+', NULL, 8000),
(761, 'B-', NULL, 8000),
(762, 'O+', 1.1, 8000),
(763, 'O-', NULL, 8000),
(764, 'AB+', NULL, 8000),
(765, 'AB-', NULL, 8000),
(766, 'A+', NULL, 9000),
(767, 'A-', NULL, 9000),
(768, 'B+', NULL, 9000),
(769, 'B-', NULL, 9000),
(770, 'O+', NULL, 9000),
(771, 'O-', NULL, 9000),
(772, 'AB+', NULL, 9000),
(773, 'AB-', 4.5, 9000),
(774, 'A+', NULL, 10000),
(775, 'A-', NULL, 10000),
(776, 'B+', 1, 10000),
(777, 'B-', NULL, 10000),
(778, 'O+', NULL, 10000),
(779, 'O-', NULL, 10000),
(780, 'AB+', NULL, 10000),
(781, 'AB-', NULL, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `CityID` int(11) NOT NULL,
  `CityName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`CityID`, `CityName`) VALUES
(1, 'Delhi'),
(2, 'Mumbai'),
(3, 'Kochi'),
(4, 'Chennai'),
(5, 'Pune'),
(6, 'Jaipur'),
(7, 'Kolkata'),
(8, 'Hyderabad'),
(9, 'Ahmedabad'),
(10, 'Bangalore');

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `DonorId` int(11) NOT NULL,
  `DonorName` varchar(100) NOT NULL,
  `DonorAge` varchar(10) DEFAULT NULL,
  `DonorGender` varchar(10) DEFAULT NULL,
  `DonorBloodGroup` varchar(10) DEFAULT NULL,
  `DonorBloodQuantity` float DEFAULT NULL,
  `DonorDate` date DEFAULT NULL,
  `DonorPhone` bigint(20) DEFAULT NULL,
  `CityID` int(11) NOT NULL,
  `StaffID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`DonorId`, `DonorName`, `DonorAge`, `DonorGender`, `DonorBloodGroup`, `DonorBloodQuantity`, `DonorDate`, `DonorPhone`, `CityID`, `StaffID`) VALUES
(61100, 'Olivia Bennett', '32', 'F', 'A+', 1.25, '2023-05-12', 9055512340, 1, 101100),
(61150, 'Liam Anderson', '26', 'M', 'B+', 1.6, '2023-05-10', 7023463548, 2, 101150),
(61200, 'Sophia Carter', '30', 'F', 'O+', 1, '2023-05-11', 9837647926, 3, 101200),
(61250, 'Noah Parker', '33', 'M', 'O+', 1.32, '2023-05-16', 7027884799, 4, 101250),
(61300, 'Ava Mitchell', '28', 'F', 'A+', 0.8, '2023-06-07', 9887784870, 5, 101300),
(61350, 'Jackson Turner', '30', 'M', 'B+', 1.1, '2023-06-04', 9079845756, 6, 101350),
(61400, 'Isabella Foster', '26', 'F', 'O+', 0.75, '2023-05-20', 9087897781, 7, 101400),
(61450, 'Ethan Harrison', '29', 'M', 'O+', 1.1, '2023-06-01', 7083471783, 8, 101450),
(61500, 'Mia Reynolds', '26', 'F', 'AB-', 1.5, '2023-05-22', 9934547832, 9, 101500),
(61550, 'Aiden Sullivan', '30', 'M', 'B+', 1, '2023-06-10', 7098475980, 10, 101550),
(61600, 'Ishaan Peng', '25', 'M', 'AB-', 1, '2023-05-21', 1111444489, 9, 101500),
(61700, 'Ishaan Peng', '25', 'M', 'A+', 1, '2023-05-21', 1111444489, 1, 101100);

--
-- Triggers `donor`
--
DELIMITER $$
CREATE TRIGGER `increment_blood_quantity` AFTER INSERT ON `donor` FOR EACH ROW BEGIN
    UPDATE BloodSpecimen
    SET BloodQuantity = BloodQuantity + NEW.DonorBloodQuantity
    WHERE HospitalID = (
        SELECT HospitalID
        FROM RecordingStaff
        WHERE StaffID = NEW.StaffID
    ) AND BloodGroup = NEW.DonorBloodGroup;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `HospitalID` int(11) NOT NULL,
  `HospitalName` varchar(100) NOT NULL,
  `CityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`HospitalID`, `HospitalName`, `CityID`) VALUES
(1000, 'Grace Mercy General Hospital', 1),
(2000, 'Hope Springs Medical Center', 2),
(3000, 'Sunrise Health and Wellness Hospital', 3),
(4000, 'Harmony Care Hospital', 4),
(5000, 'Evergreen Community Medical Center', 5),
(6000, 'Serenity Memorial Hospital', 6),
(7000, 'Beacon Hill Medical Center', 7),
(8000, 'Unity Regional Hospital', 8),
(9000, 'Oasis Medical Plaza', 9),
(10000, 'Tranquil Grove Healthcare Center', 10);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `ManagerID` int(11) NOT NULL,
  `ManagerName` varchar(100) NOT NULL,
  `ManagerPhone` bigint(20) NOT NULL,
  `HospitalID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`ManagerID`, `ManagerName`, `ManagerPhone`, `HospitalID`) VALUES
(1100, 'Alice Johnson', 5551234, 1000),
(1150, 'Bob Smith', 5555678, 2000),
(1200, 'Carol Davis', 5559876, 3000),
(1250, 'David Miller', 5554321, 4000),
(1300, 'Emily Wilson', 5558765, 5000),
(1350, 'Frank Taylor', 5552345, 6000),
(1400, 'Grace Anderson', 5556789, 7000),
(1450, 'Henry Parker', 5553456, 8000),
(1500, 'Isabel Brown', 5557890, 9000),
(1550, 'Jack Harris', 5556543, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int(100) NOT NULL,
  `name` varchar(190) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `usertype` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `name`, `username`, `password`, `email`, `phone`, `address`, `usertype`) VALUES
(1, 'admin', 'super_admin', 'admin', NULL, NULL, NULL, 'admin'),
(2, 'diya', 'diyamaria', 'trial', NULL, NULL, NULL, 'staff'),
(3, 'Natasha', 'nat', '123', 'djbhc@gtdjg.com', NULL, NULL, 'staff'),
(4, 'hfje', 'dbms', '123', 'fhdhd@hf.com', NULL, NULL, 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `RecipientID` int(11) NOT NULL,
  `ReciName` varchar(100) NOT NULL,
  `ReciAge` int(11) DEFAULT NULL,
  `ReciGender` varchar(10) DEFAULT NULL,
  `ReciBloodGrp` varchar(100) DEFAULT NULL,
  `ReciBloodQuantity` float DEFAULT NULL,
  `ReciPhone` bigint(20) DEFAULT NULL,
  `ReciDate` date DEFAULT NULL,
  `CityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`RecipientID`, `ReciName`, `ReciAge`, `ReciGender`, `ReciBloodGrp`, `ReciBloodQuantity`, `ReciPhone`, `ReciDate`, `CityID`) VALUES
(1001, 'Sara Sharma', 28, 'Female', 'A+', 2, 9876543211, '2023-05-15', 1),
(1002, 'Raj Singh', 35, 'Male', 'B+', 1.5, 8765432100, '2023-06-20', 2),
(1003, 'Aisha Patel', 40, 'Female', 'O+', 2.3, 7654321099, '2023-07-10', 3),
(1004, 'Kabir Kapoor', 25, 'Male', 'O+', 1.8, 6543210988, '2023-08-05', 4),
(1005, 'Zara Gupta', 32, 'Female', 'A+', 2.5, 5432109877, '2023-09-12', 5),
(1006, 'Arjun Kumar', 22, 'Male', 'B+', 1.7, 4321098766, '2023-10-18', 6),
(1007, 'Ananya Sharma', 38, 'Female', 'O+', 2.1, 3210987655, '2023-11-25', 7),
(1008, 'Karan Yadav', 29, 'Male', 'O+', 1.9, 2109876544, '2023-12-30', 8),
(1009, 'Pooja Verma', 33, 'Female', 'AB-', 1.6, 1098765433, '2024-01-14', 9),
(1010, 'Rohan Kumar', 27, 'Male', 'B+', 2.2, 9876543210, '2024-02-22', 10),
(1011, 'ben', 23, 'Male', 'AB-', 2, 249747978, '2024-02-22', 9),
(10111, 'ben', 23, 'Male', 'AB-', 2, 98498489127, '2024-03-07', 9);

--
-- Triggers `recipient`
--
DELIMITER $$
CREATE TRIGGER `decrement_blood_quantity` AFTER INSERT ON `recipient` FOR EACH ROW BEGIN
    UPDATE BloodSpecimen BS
    INNER JOIN City C ON BS.BloodGroup = NEW.ReciBloodGrp
    SET BS.BloodQuantity = BS.BloodQuantity - NEW.ReciBloodQuantity
    WHERE C.CityID = NEW.CityID AND BS.BloodGroup = NEW.ReciBloodGrp;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `recordingstaff`
--

CREATE TABLE `recordingstaff` (
  `StaffID` int(11) NOT NULL,
  `StaffName` varchar(100) NOT NULL,
  `StaffPhone` bigint(20) DEFAULT NULL,
  `HospitalID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `recordingstaff`
--

INSERT INTO `recordingstaff` (`StaffID`, `StaffName`, `StaffPhone`, `HospitalID`) VALUES
(101100, 'Harper Bennett', 9078411847, 1000),
(101150, 'Logan Anderson', 9834720824, 2000),
(101200, 'Avery Carter', 7024182462, 3000),
(101250, 'Mason Parker', 9023467912, 4000),
(101300, 'Addison Mitchell', 9927423478, 5000),
(101350, 'Riley Turner', 9932128455, 6000),
(101400, 'Quinn Foster', 7047237512, 7000),
(101450, 'Cameron Harrison', 9878467853, 8000),
(101500, 'Morgan Reynolds', 9841515460, 9000),
(101550, 'Jordan Sullivan', 9024792313, 10000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bloodspecimen`
--
ALTER TABLE `bloodspecimen`
  ADD PRIMARY KEY (`SpecimenID`,`BloodGroup`,`HospitalID`),
  ADD KEY `HospitalID` (`HospitalID`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`CityID`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`DonorId`),
  ADD KEY `StaffID` (`StaffID`),
  ADD KEY `CityID` (`CityID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`HospitalID`),
  ADD KEY `CityID` (`CityID`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`ManagerID`),
  ADD KEY `HospitalID` (`HospitalID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`,`username`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`RecipientID`),
  ADD KEY `CityID` (`CityID`);

--
-- Indexes for table `recordingstaff`
--
ALTER TABLE `recordingstaff`
  ADD PRIMARY KEY (`StaffID`),
  ADD KEY `HospitalID` (`HospitalID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bloodspecimen`
--
ALTER TABLE `bloodspecimen`
  ADD CONSTRAINT `bloodspecimen_ibfk_1` FOREIGN KEY (`HospitalID`) REFERENCES `hospital` (`HospitalID`);

--
-- Constraints for table `donor`
--
ALTER TABLE `donor`
  ADD CONSTRAINT `donor_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `recordingstaff` (`StaffID`),
  ADD CONSTRAINT `donor_ibfk_2` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`);

--
-- Constraints for table `hospital`
--
ALTER TABLE `hospital`
  ADD CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`HospitalID`) REFERENCES `hospital` (`HospitalID`);

--
-- Constraints for table `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`);

--
-- Constraints for table `recordingstaff`
--
ALTER TABLE `recordingstaff`
  ADD CONSTRAINT `recordingstaff_ibfk_1` FOREIGN KEY (`HospitalID`) REFERENCES `hospital` (`HospitalID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
