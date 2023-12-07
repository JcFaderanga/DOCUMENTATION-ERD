-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2023 at 01:45 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ABM` ()   BEGIN
SELECT 
            strands.strand_name,
            room_status.status,
            room_floors.floor_number,
            strand_room_details.room_number
        FROM 
            strand_room_details
        JOIN
            strands ON strands.strand_code = strand_room_details.strand_code_ID
        JOIN
            room_status ON room_status.status_ID = strand_room_details.room_status_ID
        JOIN
            room_floors ON room_floors.floor_ID = strand_room_details.room_floor_ID  
        JOIN
            grade_level ON grade_level.grade_level_ID = strand_room_details.grade_lvl_ID
   
WHERE strands.strand_name = "ABM";

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ADAS` ()   BEGIN
SELECT 
            strands.strand_name,
            room_status.status,
            room_floors.floor_number,
            strand_room_details.room_number
        FROM 
            strand_room_details
        JOIN
            strands ON strands.strand_code = strand_room_details.strand_code_ID
        JOIN
            room_status ON room_status.status_ID = strand_room_details.room_status_ID
        JOIN
            room_floors ON room_floors.floor_ID = strand_room_details.room_floor_ID  
        JOIN
            grade_level ON grade_level.grade_level_ID = strand_room_details.grade_lvl_ID
   
WHERE strands.strand_name = "ADAS";
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_inner_join` ()   BEGIN
SELECT
    admins.name,
    admins.lastname,
    admins_account.username,
    admins_account.password
FROM
    admins
JOIN
    admins_account
 ON 
    admins.id = admins_account.id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_left_join` ()   BEGIN
SELECT
    admins.name,
    admins.lastname,
    admins_account.username,
    admins_account.password
FROM
    admins
LEFT JOIN
    admins_account
 ON 
    admins.id = admins_account.id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_right_join` ()   BEGIN
SELECT
    admins.name,
    admins.lastname,
    admins_account.username,
    admins_account.password
FROM
    admins
RIGHT JOIN
    admins_account
 ON 
    admins.id = admins_account.id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `alltables` ()   BEGIN

SELECT * FROM admins;
SELECT * FROM admins_account;
SELECT * FROM grade_level;
SELECT * FROM instructor;
SELECT * FROM instructor_startend_date;
SELECT * FROM instructor_subject;
SELECT * FROM room_floors;
SELECT * FROM room_status;
SELECT * FROM strands;
SELECT * FROM strand_room_details;
SELECT * FROM subjects;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `All_rooms` ()   BEGIN
SELECT 
            strands.strand_name,
            room_status.status,
            room_floors.floor_number,
            strand_room_details.room_number
        FROM 
            strand_room_details
        JOIN
            strands ON strands.strand_code = strand_room_details.strand_code_ID
        JOIN
            room_status ON room_status.status_ID = strand_room_details.room_status_ID
        JOIN
            room_floors ON room_floors.floor_ID = strand_room_details.room_floor_ID  
        JOIN
            grade_level ON grade_level.grade_level_ID = strand_room_details.grade_lvl_ID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GAS` ()   BEGIN
SELECT 
            strands.strand_name,
            room_status.status,
            room_floors.floor_number,
            strand_room_details.room_number
        FROM 
            strand_room_details
        JOIN
            strands ON strands.strand_code = strand_room_details.strand_code_ID
        JOIN
            room_status ON room_status.status_ID = strand_room_details.room_status_ID
        JOIN
            room_floors ON room_floors.floor_ID = strand_room_details.room_floor_ID  
        JOIN
            grade_level ON grade_level.grade_level_ID = strand_room_details.grade_lvl_ID
   
WHERE strands.strand_name = "GAS";
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `HE` ()   BEGIN
SELECT 
            strands.strand_name,
            room_status.status,
            room_floors.floor_number,
            strand_room_details.room_number
        FROM 
            strand_room_details
        JOIN
            strands ON strands.strand_code = strand_room_details.strand_code_ID
        JOIN
            room_status ON room_status.status_ID = strand_room_details.room_status_ID
        JOIN
            room_floors ON room_floors.floor_ID = strand_room_details.room_floor_ID  
        JOIN
            grade_level ON grade_level.grade_level_ID = strand_room_details.grade_lvl_ID
   
WHERE strands.strand_name = "HE";
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ICT` ()   BEGIN
SELECT 
            strands.strand_name,
            room_status.status,
            room_floors.floor_number,
            strand_room_details.room_number
        FROM 
            strand_room_details
        JOIN
            strands ON strands.strand_code = strand_room_details.strand_code_ID
        JOIN
            room_status ON room_status.status_ID = strand_room_details.room_status_ID
        JOIN
            room_floors ON room_floors.floor_ID = strand_room_details.room_floor_ID  
        JOIN
            grade_level ON grade_level.grade_level_ID = strand_room_details.grade_lvl_ID
   
WHERE strands.strand_name = "ICT";
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `instructor_innerjoin_specific` ()   BEGIN
SELECT
    instructor.instructor_id,
    instructor.firstname,
    instructor.lastname,
    instructor_startend_date.startDate,
    instructor_startend_date.endDate
FROM
    instructor
LEFT JOIN
    instructor_startend_date
 ON 
    instructor.instructor_id = instructor_startend_date.instructorDate_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `instructor_inner_join` ()   BEGIN
SELECT *
  FROM instructor
INNER JOIN 
  instructor_startend_date 
ON 
  instructor.instructor_id = instructor_startend_date.instructorDate_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `instructor_left_join` ()   BEGIN
SELECT *
FROM 
  instructor
LEFT JOIN
  instructor_startend_date
ON
  instructor.instructor_id = instructor_startend_date.instructorDate_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prof_subject` ()   BEGIN
SELECT 
strands.strand_name,
subjects.subject_name,
instructor_subject.StartTime,
instructor_subject .EndTime
FROM
instructor_subject LEFT JOIN strands ON instructor_subject.strand = strands.strand_code
INNER JOIN subjects ON instructor_subject.subject_code = subjects.subject_code ORDER BY StartTime ASC;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `STEM` ()   BEGIN
SELECT 
            strands.strand_name,
            room_status.status,
            room_floors.floor_number,
            strand_room_details.room_number
        FROM 
            strand_room_details
        JOIN
            strands ON strands.strand_code = strand_room_details.strand_code_ID
        JOIN
            room_status ON room_status.status_ID = strand_room_details.room_status_ID
        JOIN
            room_floors ON room_floors.floor_ID = strand_room_details.room_floor_ID  
        JOIN
            grade_level ON grade_level.grade_level_ID = strand_room_details.grade_lvl_ID
   
WHERE strands.strand_name = "STEM";
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `lastname`) VALUES
(1, 'jc', '123'),
(2, 'Janrey', 'Faderanga'),
(3, 'kyrah', 'pangilinan');

-- --------------------------------------------------------

--
-- Table structure for table `admins_account`
--

CREATE TABLE `admins_account` (
  `id` int(11) NOT NULL,
  `username` varbinary(100) NOT NULL,
  `password` varbinary(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins_account`
--

INSERT INTO `admins_account` (`id`, `username`, `password`) VALUES
(0, 0x6a63, 0x6a636661646572616e6761),
(0, 0x6a63, 0xc7c0bc37dc89692e614bfe3e8d255737),
(0, 0x6a636661646572616e6761, 0xd7a24b5df073acb0ff71bc9cbbffe2b1),
(2, 0x6a63, 0xf989003149797cd2e8211ce6d5dcf8da),
(3, 0x6b79, 0x228029baaf6871bfba8c5f9c78c28834);

-- --------------------------------------------------------

--
-- Table structure for table `grade_level`
--

CREATE TABLE `grade_level` (
  `grade_level_ID` int(11) NOT NULL,
  `grade_level` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grade_level`
--

INSERT INTO `grade_level` (`grade_level_ID`, `grade_level`) VALUES
(11, 'GRADE 11'),
(12, 'GRADE 12');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `instructor_id` int(10) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `DateAndTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`instructor_id`, `firstname`, `lastname`, `DateAndTime`) VALUES
(924511601, 'Janrey Cyril', 'Faderanga', '2023-12-06 22:56:34'),
(924511602, 'Kyrah', 'pangilinan', '2023-12-06 22:56:34'),
(924511603, 'Janrey Cyril', 'Faderanga', '2023-12-06 22:56:34'),
(924511604, 'Jaspher ', 'Cabanero', '2023-12-06 22:56:34'),
(924511605, 'Julius', 'Loresca', '2023-12-06 22:56:34'),
(924511606, 'Jc', 'Faderanga', '2023-12-06 22:56:34'),
(924511607, 'mary grace', 'Santarin', '2023-12-06 22:56:34'),
(924511608, 'Rhaiza', 'Maneclang', '2023-12-06 22:56:34'),
(924511609, 'Jaspher ', 'Cabanero', '2023-12-06 22:56:34'),
(924511610, 'abc', '123', '2023-12-06 22:56:34'),
(924511611, 'julius', 'loresca', '2023-12-06 22:56:34'),
(924511612, 'Christine', 'Alcantara', '2023-12-06 22:56:34'),
(924511613, 'leo', 'abc', '2023-12-06 22:56:34'),
(924511614, 'sam', 'pol', '2023-12-06 22:56:34'),
(924511615, 'sam', 'pol', '2023-12-06 22:56:34'),
(924511616, 'zed', 'dooh', '2023-12-06 22:56:34'),
(924511617, 'zed', 'dooh', '2023-12-06 22:56:34');

-- --------------------------------------------------------

--
-- Table structure for table `instructor_startend_date`
--

CREATE TABLE `instructor_startend_date` (
  `instructorDate_id` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructor_startend_date`
--

INSERT INTO `instructor_startend_date` (`instructorDate_id`, `startDate`, `endDate`) VALUES
(1, '2023-11-01', '2023-11-30'),
(924511602, '2023-11-01', '2023-11-30'),
(924511603, '2023-11-01', '2023-12-31'),
(924511604, '2024-01-01', '2024-01-31'),
(924511605, '2023-11-01', '2023-11-30'),
(924511606, '2023-07-01', '2023-11-30'),
(924511607, '2023-11-01', '2023-11-30'),
(924511608, '2023-11-01', '2023-11-30'),
(924511609, '2023-12-01', '2023-12-31'),
(924511610, '2023-12-01', '2023-12-31'),
(924511611, '2023-12-01', '2023-12-31'),
(924511612, '2023-11-01', '2024-01-04'),
(924511613, '2023-11-27', '2023-12-20'),
(924511614, '2023-12-01', '2023-12-31'),
(924511615, '2023-12-01', '2023-12-31'),
(924511616, '2023-12-20', '2023-11-27'),
(924511617, '2023-12-20', '2023-11-27');

-- --------------------------------------------------------

--
-- Table structure for table `instructor_subject`
--

CREATE TABLE `instructor_subject` (
  `inst_sub_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `strand` varchar(23) NOT NULL,
  `subject_code` varchar(23) NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `DateAndTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructor_subject`
--

INSERT INTO `instructor_subject` (`inst_sub_id`, `instructor_id`, `strand`, `subject_code`, `StartTime`, `EndTime`, `DateAndTime`) VALUES
(1, 924511607, 'SC99000STEM', 'Oral Communication', '12:30:00', '01:30:00', '2023-12-06 22:58:23'),
(2, 924511607, 'SC99000STEM', 'Komunikasyon', '15:00:00', '16:00:00', '2023-12-06 22:58:23'),
(3, 924511607, 'SC99000GAS', 'Empowerment Technologie', '10:00:00', '12:00:00', '2023-12-06 22:58:23'),
(4, 924511607, 'SC99000ICT', 'Earth Science', '08:00:00', '10:00:00', '2023-12-06 22:58:23'),
(5, 924511607, 'SC99000ICT', 'Earth Science', '08:00:00', '10:00:00', '2023-12-06 22:58:23'),
(6, 924511607, 'SC99000ICT', 'Earth Science', '08:00:00', '10:00:00', '2023-12-06 22:58:23'),
(7, 924511606, 'SC99000STEM', 'General Biology 1', '02:00:00', '04:00:00', '2023-12-06 22:58:23'),
(8, 924511606, 'SC99000STEM', 'General Biology 1', '02:00:00', '04:00:00', '2023-12-06 22:58:23'),
(9, 924511602, 'SC99000STEM', 'Komunikasyon', '10:30:00', '00:30:00', '2023-12-06 22:58:23'),
(10, 924511607, 'SC99000HE', 'General Chemistry 1', '04:00:00', '06:00:00', '2023-12-06 22:58:23'),
(11, 924511602, 'SC99000ADAS', 'PEH1', '03:00:00', '04:00:00', '2023-12-06 22:58:23'),
(12, 924511602, 'SC99000ABM', 'Empowerment Technologie', '04:00:00', '05:00:00', '2023-12-06 22:58:23'),
(13, 924511602, 'SC99000ABM', 'Empowerment Technologie', '04:00:00', '05:00:00', '2023-12-06 22:58:23'),
(14, 924511603, 'SC99000STEM', 'Oral Communication', '08:00:00', '10:00:00', '2023-12-06 22:58:23'),
(15, 924511603, 'SC99000STEM', 'General Mathematics', '10:00:00', '00:00:00', '2023-12-06 22:58:23'),
(16, 924511603, 'SC99000ADAS', 'Philosophy', '13:30:00', '14:30:00', '2023-12-06 22:58:23'),
(17, 924511603, 'SC99000ICT', 'Oral Communication', '15:00:00', '16:00:00', '2023-12-06 22:58:23'),
(18, 924511616, 'SC99000ADAS', 'Komunikasyon', '09:48:00', '06:52:00', '2023-12-06 22:58:23'),
(19, 924511616, 'SC99000ADAS', 'Philosophy', '06:46:00', '09:48:00', '2023-12-06 22:58:23'),
(20, 924511608, 'SC99000STEM', 'Oral Communication', '08:00:00', '10:00:00', '2023-12-07 00:28:53'),
(21, 924511608, 'SC99000ADAS', 'General Mathematics', '10:30:00', '11:30:00', '2023-12-07 00:29:24'),
(22, 924511608, 'SC99000ICT', 'Komunikasyon', '13:00:00', '14:00:00', '2023-12-07 00:29:41'),
(23, 924511608, 'SC99000STEM', 'General Biology 1', '15:00:00', '17:00:00', '2023-12-07 00:30:11'),
(24, 924511608, 'SC99000ABM', 'PEH1', '11:30:00', '22:00:00', '2023-12-07 00:31:02'),
(25, 924511608, 'SC99000ICT', 'General Biology 1', '15:00:00', '17:00:00', '2023-12-07 00:34:23');

-- --------------------------------------------------------

--
-- Table structure for table `room_floors`
--

CREATE TABLE `room_floors` (
  `floor_ID` int(11) NOT NULL,
  `floor_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_floors`
--

INSERT INTO `room_floors` (`floor_ID`, `floor_number`) VALUES
(0, 'N/A'),
(1, '1ST FLOOR'),
(2, '2ND FLOOR'),
(3, '3RD FLOOR'),
(4, '4TH FLOOR'),
(5, '5TH FLOOR');

-- --------------------------------------------------------

--
-- Table structure for table `room_status`
--

CREATE TABLE `room_status` (
  `status_ID` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_status`
--

INSERT INTO `room_status` (`status_ID`, `status`) VALUES
(0, 'Available'),
(1, 'Occupied');

-- --------------------------------------------------------

--
-- Table structure for table `strands`
--

CREATE TABLE `strands` (
  `strand_code` varchar(11) NOT NULL,
  `strand_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strands`
--

INSERT INTO `strands` (`strand_code`, `strand_name`) VALUES
('SC99000ABM', 'ABM'),
('SC99000ADAS', 'ADAS'),
('SC99000GAS', 'GAS'),
('SC99000HE', 'HE'),
('SC99000ICT', 'ICT'),
('SC99000STEM', 'STEM');

-- --------------------------------------------------------

--
-- Table structure for table `strand_room_details`
--

CREATE TABLE `strand_room_details` (
  `room_ID` int(11) NOT NULL,
  `strand_code_ID` varchar(20) NOT NULL,
  `grade_lvl_ID` int(11) NOT NULL,
  `room_floor_ID` int(11) NOT NULL,
  `room_status_ID` int(11) NOT NULL,
  `room_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strand_room_details`
--

INSERT INTO `strand_room_details` (`room_ID`, `strand_code_ID`, `grade_lvl_ID`, `room_floor_ID`, `room_status_ID`, `room_number`) VALUES
(1, 'SC99000ABM', 11, 3, 1, 1101),
(2, 'SC99000ABM', 11, 2, 0, 1102),
(3, 'SC99000ABM', 11, 3, 0, 1103),
(4, 'SC99000ABM', 11, 3, 0, 1104),
(5, 'SC99000ABM', 11, 3, 0, 1105),
(6, 'SC99000ABM', 11, 1, 0, 1106),
(7, 'SC99000ABM', 11, 1, 0, 1107),
(8, 'SC99000ABM', 11, 4, 0, 1108),
(9, 'SC99000ABM', 11, 1, 0, 1109),
(10, 'SC99000ABM', 11, 3, 0, 1110),
(11, 'SC99000ABM', 11, 1, 0, 1111),
(12, 'SC99000ABM', 11, 1, 0, 1112),
(13, 'SC99000ABM', 12, 1, 0, 1201),
(14, 'SC99000ABM', 12, 3, 0, 1202),
(15, 'SC99000ABM', 12, 2, 0, 1203),
(16, 'SC99000ABM', 12, 4, 0, 1204),
(17, 'SC99000ABM', 12, 1, 0, 1205),
(18, 'SC99000ABM', 12, 1, 0, 1206),
(19, 'SC99000ABM', 12, 1, 0, 1207),
(20, 'SC99000ABM', 12, 4, 0, 1208),
(21, 'SC99000ABM', 12, 2, 0, 1209),
(22, 'SC99000ABM', 12, 3, 0, 1210),
(23, 'SC99000ABM', 12, 3, 0, 1211),
(24, 'SC99000ABM', 12, 2, 0, 1212),
(25, 'SC99000ADAS', 11, 3, 0, 1101),
(26, 'SC99000ADAS', 11, 2, 0, 1102),
(27, 'SC99000ADAS', 11, 3, 0, 1103),
(28, 'SC99000ADAS', 11, 3, 0, 1104),
(29, 'SC99000ADAS', 11, 3, 0, 1105),
(30, 'SC99000ADAS', 11, 1, 0, 1106),
(31, 'SC99000ADAS', 11, 1, 0, 1107),
(32, 'SC99000ADAS', 11, 4, 0, 1108),
(33, 'SC99000ADAS', 11, 1, 0, 1109),
(34, 'SC99000ADAS', 11, 3, 0, 1110),
(35, 'SC99000ADAS', 11, 1, 0, 1111),
(36, 'SC99000ADAS', 11, 1, 0, 1112),
(37, 'SC99000ADAS', 12, 1, 0, 1201),
(38, 'SC99000ADAS', 12, 3, 0, 1202),
(39, 'SC99000ADAS', 12, 2, 0, 1203),
(40, 'SC99000ADAS', 12, 4, 0, 1204),
(41, 'SC99000ADAS', 12, 1, 0, 1205),
(42, 'SC99000ADAS', 12, 1, 0, 1206),
(43, 'SC99000ADAS', 12, 1, 0, 1207),
(44, 'SC99000ADAS', 12, 4, 0, 1208),
(45, 'SC99000ADAS', 12, 2, 0, 1209),
(46, 'SC99000ADAS', 12, 3, 0, 1210),
(47, 'SC99000ADAS', 12, 3, 0, 1211),
(48, 'SC99000ADAS', 12, 2, 0, 1212),
(49, 'SC99000ICT', 11, 3, 0, 1101),
(50, 'SC99000ICT', 11, 2, 0, 1102),
(51, 'SC99000ICT', 11, 3, 0, 1103),
(52, 'SC99000ICT', 11, 3, 0, 1104),
(53, 'SC99000ICT', 11, 3, 0, 1105),
(54, 'SC99000ICT', 11, 1, 0, 1106),
(55, 'SC99000ICT', 11, 1, 0, 1107),
(56, 'SC99000ICT', 11, 4, 0, 1108),
(57, 'SC99000ICT', 11, 1, 0, 1109),
(58, 'SC99000ICT', 11, 3, 0, 1110),
(59, 'SC99000ICT', 11, 1, 0, 1111),
(60, 'SC99000ICT', 11, 1, 0, 1112),
(61, 'SC99000ICT', 12, 1, 0, 1201),
(62, 'SC99000ICT', 12, 3, 0, 1202),
(63, 'SC99000ICT', 12, 2, 0, 1203),
(64, 'SC99000ICT', 12, 4, 0, 1204),
(65, 'SC99000ICT', 12, 1, 0, 1205),
(66, 'SC99000ICT', 12, 1, 0, 1206),
(67, 'SC99000ICT', 12, 1, 0, 1207),
(68, 'SC99000ICT', 12, 4, 0, 1208),
(69, 'SC99000ICT', 12, 2, 0, 1209),
(70, 'SC99000ICT', 12, 3, 0, 1210),
(71, 'SC99000ICT', 12, 3, 0, 1211),
(72, 'SC99000ICT', 12, 2, 0, 1212),
(73, 'SC99000STEM', 11, 3, 0, 1101),
(74, 'SC99000STEM', 11, 2, 0, 1102),
(75, 'SC99000STEM', 11, 3, 0, 1103),
(76, 'SC99000STEM', 11, 3, 0, 1104),
(77, 'SC99000STEM', 11, 3, 0, 1105),
(78, 'SC99000STEM', 11, 1, 0, 1106),
(79, 'SC99000STEM', 11, 1, 0, 1107),
(80, 'SC99000STEM', 11, 4, 0, 1108),
(81, 'SC99000STEM', 11, 1, 0, 1109),
(82, 'SC99000STEM', 11, 3, 0, 1110),
(83, 'SC99000STEM', 11, 1, 0, 1111),
(84, 'SC99000STEM', 11, 1, 0, 1112),
(85, 'SC99000STEM', 12, 1, 0, 1201),
(86, 'SC99000STEM', 12, 3, 0, 1202),
(87, 'SC99000STEM', 12, 2, 0, 1203),
(88, 'SC99000STEM', 12, 4, 0, 1204),
(89, 'SC99000STEM', 12, 1, 0, 1205),
(90, 'SC99000STEM', 12, 1, 0, 1206),
(91, 'SC99000STEM', 12, 1, 0, 1207),
(92, 'SC99000STEM', 12, 4, 0, 1208),
(93, 'SC99000STEM', 12, 2, 0, 1209),
(94, 'SC99000STEM', 12, 3, 0, 1210),
(95, 'SC99000STEM', 12, 3, 0, 1211),
(96, 'SC99000STEM', 12, 2, 0, 1212),
(97, 'SC99000GAS', 11, 3, 0, 1101),
(98, 'SC99000GAS', 11, 2, 0, 1102),
(99, 'SC99000GAS', 11, 3, 0, 1103),
(100, 'SC99000GAS', 11, 3, 0, 1104),
(101, 'SC99000GAS', 11, 3, 0, 1105),
(102, 'SC99000GAS', 11, 1, 0, 1106),
(103, 'SC99000GAS', 11, 1, 0, 1107),
(104, 'SC99000GAS', 11, 4, 0, 1108),
(105, 'SC99000GAS', 11, 1, 0, 1109),
(106, 'SC99000GAS', 11, 3, 0, 1110),
(107, 'SC99000GAS', 11, 1, 0, 1111),
(108, 'SC99000GAS', 11, 1, 0, 1112),
(109, 'SC99000GAS', 12, 1, 0, 1201),
(110, 'SC99000GAS', 12, 3, 0, 1202),
(111, 'SC99000GAS', 12, 2, 0, 1203),
(112, 'SC99000GAS', 12, 4, 0, 1204),
(113, 'SC99000GAS', 12, 1, 0, 1205),
(114, 'SC99000GAS', 12, 1, 0, 1206),
(115, 'SC99000GAS', 12, 1, 0, 1207),
(116, 'SC99000GAS', 12, 4, 0, 1208),
(117, 'SC99000GAS', 12, 2, 0, 1209),
(118, 'SC99000GAS', 12, 3, 0, 1210),
(119, 'SC99000GAS', 12, 3, 0, 1211),
(120, 'SC99000GAS', 12, 2, 0, 1212),
(121, 'SC99000HE', 11, 3, 0, 1101),
(122, 'SC99000HE', 11, 2, 0, 1102),
(123, 'SC99000HE', 11, 3, 0, 1103),
(124, 'SC99000HE', 11, 3, 0, 1104),
(125, 'SC99000HE', 11, 3, 0, 1105),
(126, 'SC99000HE', 11, 1, 0, 1106),
(127, 'SC99000HE', 11, 1, 0, 1107),
(128, 'SC99000HE', 11, 4, 0, 1108),
(129, 'SC99000HE', 11, 1, 0, 1109),
(130, 'SC99000HE', 11, 3, 0, 1110),
(131, 'SC99000HE', 11, 1, 0, 1111),
(132, 'SC99000HE', 11, 1, 0, 1112),
(133, 'SC99000HE', 12, 1, 0, 1201),
(134, 'SC99000HE', 12, 3, 0, 1202),
(135, 'SC99000HE', 12, 2, 0, 1203),
(136, 'SC99000HE', 12, 4, 0, 1204),
(137, 'SC99000HE', 12, 1, 0, 1205),
(138, 'SC99000HE', 12, 1, 0, 1206),
(139, 'SC99000HE', 12, 1, 0, 1207),
(140, 'SC99000HE', 12, 4, 0, 1208),
(141, 'SC99000HE', 12, 2, 0, 1209),
(142, 'SC99000HE', 12, 3, 0, 1210),
(143, 'SC99000HE', 12, 3, 0, 1211),
(144, 'SC99000HE', 12, 2, 0, 1212);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `grade_level_ID` int(11) NOT NULL,
  `subject_code` varchar(23) NOT NULL,
  `subject_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `grade_level_ID`, `subject_code`, `subject_name`) VALUES
(0, 11, 'Oral Communication', 'Oral Communication'),
(0, 11, 'Komunikasyon', 'Komunikasyon at Pananaliksik sa Wika at Kulturang Pilipino'),
(0, 11, 'General Mathematics', 'General Mathematics'),
(0, 11, 'Earth Science', 'Earth Science'),
(0, 11, 'Philosophy', 'Introduction to the Philosophy of the Human Person'),
(0, 11, 'PEH1', 'Physical Education and Health 1'),
(0, 11, 'Empowerment Technologie', 'Empowerment Technologies'),
(0, 11, 'General Chemistry 1', 'General Chemistry 1'),
(0, 11, 'General Biology 1', 'General Biology 1'),
(0, 11, 'RHGP', 'RHGP'),
(0, 11, '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grade_level`
--
ALTER TABLE `grade_level`
  ADD PRIMARY KEY (`grade_level_ID`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`instructor_id`);

--
-- Indexes for table `instructor_startend_date`
--
ALTER TABLE `instructor_startend_date`
  ADD PRIMARY KEY (`instructorDate_id`);

--
-- Indexes for table `instructor_subject`
--
ALTER TABLE `instructor_subject`
  ADD PRIMARY KEY (`inst_sub_id`);

--
-- Indexes for table `room_floors`
--
ALTER TABLE `room_floors`
  ADD PRIMARY KEY (`floor_ID`);

--
-- Indexes for table `room_status`
--
ALTER TABLE `room_status`
  ADD PRIMARY KEY (`status_ID`);

--
-- Indexes for table `strands`
--
ALTER TABLE `strands`
  ADD PRIMARY KEY (`strand_code`);

--
-- Indexes for table `strand_room_details`
--
ALTER TABLE `strand_room_details`
  ADD PRIMARY KEY (`room_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grade_level`
--
ALTER TABLE `grade_level`
  MODIFY `grade_level_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `instructor`
--
ALTER TABLE `instructor`
  MODIFY `instructor_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=924511618;

--
-- AUTO_INCREMENT for table `instructor_startend_date`
--
ALTER TABLE `instructor_startend_date`
  MODIFY `instructorDate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=924511618;

--
-- AUTO_INCREMENT for table `instructor_subject`
--
ALTER TABLE `instructor_subject`
  MODIFY `inst_sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `room_floors`
--
ALTER TABLE `room_floors`
  MODIFY `floor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `room_status`
--
ALTER TABLE `room_status`
  MODIFY `status_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `strand_room_details`
--
ALTER TABLE `strand_room_details`
  MODIFY `room_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
