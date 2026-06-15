-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2026 at 10:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `training_center_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tc_attendance`
--

CREATE TABLE `tc_attendance` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` varchar(100) DEFAULT NULL,
  `attendance_id` varchar(100) DEFAULT NULL,
  `attendance_date` date DEFAULT NULL,
  `staff_id` varchar(100) DEFAULT NULL,
  `staff_name` mediumtext DEFAULT NULL,
  `staff_number` mediumtext DEFAULT NULL,
  `staff_role` mediumtext DEFAULT NULL,
  `fn_present` mediumtext DEFAULT NULL,
  `an_present` mediumtext DEFAULT NULL,
  `present_code` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tc_attendance`
--

INSERT INTO `tc_attendance` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `attendance_id`, `attendance_date`, `staff_id`, `staff_name`, `staff_number`, `staff_role`, `fn_present`, `an_present`, `present_code`, `deleted`) VALUES
(1, '2026-05-29 17:45:57', '2026-05-29 17:45:57', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'ZG5HdjJza1VXRDUyTmFqSFBLdjlGcWpEem1JMTlDZ29xck9zNm4yR0hoOD0=', '2026-05-29', 'Sld0VENCNWI5cEwzck1YZ0NNNlY2bVpxSE9vU2dQRU0waENEWUJNZ3Jzbz0=', 'Manager', '9378974398', 'manager', 'P', 'P', 'PP', 0),
(2, '2026-05-29 17:45:57', '2026-05-29 17:45:57', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', '1', '2026-05-29', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 'Subha', '9834758648', 'staff', 'P', 'P', 'PP', 0),
(3, '2026-05-29 17:46:05', '2026-05-29 17:46:05', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'ZnZUb3V6VXNhYXRUaTdQQlhuQkQ4N2piSXVRM1k3WXZ1MHF3aDd2dkdLdz0=', '2026-05-28', 'Sld0VENCNWI5cEwzck1YZ0NNNlY2bVpxSE9vU2dQRU0waENEWUJNZ3Jzbz0=', 'Manager', '9378974398', 'manager', 'P', 'P', 'PP', 0),
(4, '2026-05-29 17:46:05', '2026-05-29 17:46:05', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', '3', '2026-05-28', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 'Subha', '9834758648', 'staff', 'P', 'P', 'PP', 0),
(5, '2026-05-29 17:46:14', '2026-05-29 17:46:14', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'Z3ppbHZub0lzRytWdFRwTnBueWVpNmVoNUExVGtxdGtOU1ptSStUby8wMD0=', '2026-05-27', 'Sld0VENCNWI5cEwzck1YZ0NNNlY2bVpxSE9vU2dQRU0waENEWUJNZ3Jzbz0=', 'Manager', '9378974398', 'manager', 'A', 'P', 'AP', 0),
(6, '2026-05-29 17:46:14', '2026-05-29 17:46:14', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', '5', '2026-05-27', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 'Subha', '9834758648', 'staff', 'P', 'P', 'PP', 0),
(7, '2026-06-09 05:20:18', '2026-06-09 05:20:18', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'ZkZNL3ltWE51cUlxSEN5bTEzRnZ6MjlBa2ZOWm5DeldlVG9pbzFHcEhaUT0=', '2026-06-09', 'Sld0VENCNWI5cEwzck1YZ0NNNlY2bVpxSE9vU2dQRU0waENEWUJNZ3Jzbz0=', 'Manager', '9378974398', 'manager', 'P', 'P', 'PP', 0),
(8, '2026-06-09 05:20:18', '2026-06-09 05:20:18', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', '7', '2026-06-09', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 'Subha', '9834758648', 'staff', 'P', 'P', 'PP', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_audit_logs`
--

CREATE TABLE `tc_audit_logs` (
  `id` int(11) NOT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `record_id` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `action_type` varchar(20) DEFAULT NULL,
  `query_text` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tc_audit_logs`
--

INSERT INTO `tc_audit_logs` (`id`, `table_name`, `record_id`, `username`, `action_type`, `query_text`, `created_at`) VALUES
(1, 'tc_users', '1', 'Lakshmi', 'LOGIN', 'USER LOGIN SUCCESS', '2026-06-09 04:16:05'),
(2, 'tc_logins', '138', 'Lakshmi', 'LOGIN_RECORD', 'INSERT INTO tc_logins (user_id,login_date_time) VALUES (:user_id,:login_date_time)', '2026-06-09 04:16:05'),
(3, 'tc_logins', 'Multiple/Where', 'Lakshmi', 'UPDATE', 'UPDATE tc_logins SET logout_date_time = :upd_logout_date_time WHERE (id = :id) AND company_id = :comp_company_id', '2026-06-09 05:00:34'),
(4, 'DATABASE', '0', 'Lakshmi', 'BACKUP', 'BACKUP TRIGGERED', '2026-06-09 05:00:34'),
(5, 'tc_users', 'elZnUXdxQmlFK2RNcTc1MkxtQWs2OFE2V1d1V214bEsvTTc2aVZBc296ND0=', 'Lakshmi', 'LOGOUT', 'USER LOGOUT - Backup created: backup_training_center_db_2026-06-09_05-00-34.sql', '2026-06-09 05:00:35');

-- --------------------------------------------------------

--
-- Table structure for table `tc_bank`
--

CREATE TABLE `tc_bank` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `bank_id` mediumtext DEFAULT NULL,
  `bank_name` mediumtext DEFAULT NULL,
  `account_number` mediumtext DEFAULT NULL,
  `account_name` mediumtext DEFAULT NULL,
  `branch` mediumtext DEFAULT NULL,
  `ifsc_code` mediumtext DEFAULT NULL,
  `payment_mode` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tc_bank`
--

INSERT INTO `tc_bank` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `bank_id`, `bank_name`, `account_number`, `account_name`, `branch`, `ifsc_code`, `payment_mode`, `deleted`) VALUES
(1, '2026-05-27 17:17:19', '2026-05-27 17:17:19', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'UXVrRVY3N1U1bXRLVnlvcjZCS2EwbjdlYUs0MGplQlUzMGxHSjJITHoxVT0=', 'Axis', '9834759845934', 'Kumar', '', '', 'cFVxeExkL1dPT2JLS2Yra3BGVGdUMGtUbFByRjZpTmJoc2tUWmJpdTEzdz0=', 0),
(2, '2026-06-01 10:17:09', '2026-06-01 10:17:09', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=', 'IOB', '983475984357934', 'Kumar', '', '', 'c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_company`
--

CREATE TABLE `tc_company` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `company_name` mediumtext DEFAULT NULL,
  `company_email` mediumtext DEFAULT NULL,
  `company_mobile` mediumtext DEFAULT NULL,
  `company_address` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `gst` mediumtext DEFAULT NULL,
  `branch` mediumtext DEFAULT NULL,
  `logo_image` mediumtext DEFAULT NULL,
  `company_details` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tc_company`
--

INSERT INTO `tc_company` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `company_name`, `company_email`, `company_mobile`, `company_address`, `deleted`, `gst`, `branch`, `logo_image`, `company_details`) VALUES
(1, '2026-05-28 13:08:41', '2026-05-28 13:08:41', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'We Grow Skill Campus', 'wegrowskillcampus@gmail.com', '9898989898', 'sivakasi', 0, '27ABCDE1234F2Z5', 'Sivakasi', 'company_1779520085_6a1152556254d.png', 'Mm9TTDFkd1NMTjB5bThSc0dPelFtV3l2YlpMcXhUSXZ5Smx0NnhJbitwck0vU2FrS0pOVXlsVVF3dnFlaFR0NlpjaWN5c3FLY0cyb21aZTcyQkFIcGh5MWRsZW85V0QzT0ZheHZoa3lBY0ZraGwxRGRVdnpKaG5NeTZVLzErL0FHYzIrSjd5TVFhclZCaTJGV2kyOFhSNDlvTlRVUCtvMElRTjhOS3NGcTBRPQ=='),
(2, '2026-05-28 13:08:28', '2026-05-28 13:08:28', 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'We Grow Skill Campus', 'wegrowskillcampus@gmail.com', '9874999933', 'Srivilliputhur', 0, '27ABCDE1234F2Z4', 'Srivilliputhur', 'company_1779429506_6a0ff0822e9f0.png', 'Mm9TTDFkd1NMTjB5bThSc0dPelFtYmJySnQwSEhSNVE0U2U3Q1NpMzNUMUYraysrbTJpbFNJWFN6MkY0czBtcjN1emZxc3FHbHZOaGQ4S2NyUGpTTllBTm5CUDN4NUg4cSthZXpBVTdORjlpWXQxN2FReFgwaGtXeDQ5T2c3YVBWVHZVRzZpUXh1VzF5RVZhNjRkNlVRbit1eEZyUEFDb00xbjhTYWtQczRJPQ==');

-- --------------------------------------------------------

--
-- Table structure for table `tc_course`
--

CREATE TABLE `tc_course` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `course_id` mediumtext DEFAULT NULL,
  `course_name` mediumtext DEFAULT NULL,
  `course_duration` mediumtext DEFAULT NULL,
  `course_fee` mediumtext DEFAULT NULL,
  `fees_amount` varchar(255) DEFAULT '0.00',
  `gst_amount` varchar(255) DEFAULT '0.00',
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tc_course`
--

INSERT INTO `tc_course` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `course_id`, `course_name`, `course_duration`, `course_fee`, `fees_amount`, `gst_amount`, `deleted`) VALUES
(1, '2026-05-29 14:11:45', '2026-05-29 14:11:45', '1', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', 'PHP', '5', '10000', '10000', '0.00', 0),
(2, '2026-06-06 16:31:29', '2026-06-06 16:31:29', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'MzBRNUdoeWJaS0xOV0k2elBhbjd6aDM5MzdYZHFDbHZ2dEpOM2lzKzNPbz0=', 'python', '5', '30000', '30000', '0.00', 0),
(3, '2026-06-09 04:12:37', '2026-06-09 04:12:37', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'cEs4bm5xU1ZXNTJwVnowdXhVZFdzdVpiVFFZRXIzSkxwanBxMU1Wd3pVND0=', 'AI Python Full Stack', '6', '29999', '29999', '0.00', 0),
(4, '2026-06-12 13:47:33', '2026-06-12 13:47:33', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'VlNyMDBQRGlqREhnZW0yMWJMaXZ6RUtGQURPUHRZL3UraXVoVkNpOGJoUT0=', 'AI JAVA', '6', '35400.00', '30000', '5400.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_course_closure`
--

CREATE TABLE `tc_course_closure` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `closure_id` mediumtext DEFAULT NULL,
  `closure_date` mediumtext DEFAULT NULL,
  `course_type` mediumtext DEFAULT NULL,
  `student_id` mediumtext DEFAULT NULL,
  `enrollment_id` mediumtext DEFAULT NULL,
  `student_name` mediumtext DEFAULT NULL,
  `course_closed` int(11) DEFAULT 2,
  `certificate_got` int(11) NOT NULL DEFAULT 2,
  `placed` int(11) NOT NULL DEFAULT 2,
  `company_name` mediumtext DEFAULT NULL,
  `company_address` mediumtext DEFAULT NULL,
  `designation` mediumtext DEFAULT NULL,
  `ctc` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tc_course_enquiry`
--

CREATE TABLE `tc_course_enquiry` (
  `id` int(11) NOT NULL,
  `enquiry_id` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `degree_completed` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `converted_type` varchar(255) DEFAULT 'none',
  `converted_id` varchar(255) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `enquiry_date` date DEFAULT NULL,
  `father_spouse_name` mediumtext DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tc_course_enquiry`
--

INSERT INTO `tc_course_enquiry` (`id`, `enquiry_id`, `company_id`, `name`, `mobile_number`, `degree_completed`, `address`, `course_id`, `converted_type`, `converted_id`, `deleted`, `created_date_time`, `updated_date_time`, `enquiry_date`, `father_spouse_name`, `dob`, `description`) VALUES
(1, '001/26-27', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'Subhash', '3894759843', 'B.E', 'Sivakasi', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', 'enrollment', 'a2crR2dLSW5QeDVsbkFhMWs3TVVvNGNac3I5NzBwdVloSTY1UjJ5R0RmMD0=', 0, '2026-05-30 18:11:23', '2026-05-30 18:11:23', '2026-05-30', NULL, NULL, NULL),
(2, '002/26-27', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'kumar', '9874583476', 'BSC', 'sivakasi', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', 'none', NULL, 0, '2026-06-02 17:43:29', '2026-06-02 17:43:29', '2026-06-02', NULL, NULL, NULL),
(3, '003/26-27', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'kumar', '8734985983', 'BSC', 'sivakasi', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', 'enrollment', 'UzMxdDFUMjZvd2pVS2dmTUNrazlrYUFXQS8xVGJZNCtPeHlRNmZLZDF2cz0=', 0, '2026-06-05 05:20:44', '2026-06-05 05:20:44', '2026-06-05', 'selvam', '2000-06-04', 'done'),
(4, '004/26-27', 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'test', '8347854395', 'BSC', 'Sivakkasi', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', 'none', NULL, 0, '2026-06-06 16:14:52', '2026-06-06 16:14:52', '2026-06-06', 'selvam', '2000-06-04', 'Medical coding related ask'),
(5, '005/26-27', 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'test', '9875964589', 'BCOM', 'sivakasi', 'MzBRNUdoeWJaS0xOV0k2elBhbjd6aDM5MzdYZHFDbHZ2dEpOM2lzKzNPbz0=', 'none', NULL, 0, '2026-06-06 16:32:27', '2026-06-06 16:32:27', '2026-06-06', '', '2026-06-03', 'skhfjkds'),
(6, '006/26-27', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'nmbsf', '9837489758', 'jsbhfjkds', 'kjhsdkfj', 'cEs4bm5xU1ZXNTJwVnowdXhVZFdzdVpiVFFZRXIzSkxwanBxMU1Wd3pVND0=', 'none', NULL, 0, '2026-06-12 16:58:20', '2026-06-12 16:58:20', '2026-06-12', 'sjhfdsjkdjkfhksdhfklds', '0000-00-00', 'jkjhdsfkjsd');

-- --------------------------------------------------------

--
-- Table structure for table `tc_daily_reports`
--

CREATE TABLE `tc_daily_reports` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `report_id` mediumtext DEFAULT NULL,
  `user_id` mediumtext DEFAULT NULL,
  `role_id` mediumtext DEFAULT NULL,
  `role_name` mediumtext DEFAULT NULL,
  `user_name` mediumtext DEFAULT NULL,
  `report_date` date DEFAULT NULL,
  `activity_details` mediumtext DEFAULT NULL,
  `hours_spent` decimal(4,2) DEFAULT NULL,
  `custom_id` mediumtext DEFAULT NULL,
  `unique_number` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tc_daily_reports`
--

INSERT INTO `tc_daily_reports` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `report_id`, `user_id`, `role_id`, `role_name`, `user_name`, `report_date`, `activity_details`, `hours_spent`, `custom_id`, `unique_number`, `deleted`) VALUES
(1, '2026-06-05 04:26:08', '2026-06-05 04:26:56', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'Y3F1NW1sTkRKenBOY3hGekhEVEJzTGQ2VkY2Q0VtRERIWTRrTEtuMHhTVT0=', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 'cFlxWHg1N2RYSzg5OEczMGFSTmNvaFJjU2tQdEJlZVJoR1ZLL3ZYZitzUT0=', 'staff', 'Subha', '2026-06-05', 'detailsjhgjghj', 8.00, NULL, 'TnpmbEZyQkM0S09nZnp6NlVNTitXZz09', 0),
(2, '2026-06-05 04:27:06', '2026-06-05 04:27:10', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'U0dTMEwvaGhudVpBQ0U0NzVMQW1EZDhSK2RXbVp5VjVuYnp2TUNxSHNzbz0=', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 'cFlxWHg1N2RYSzg5OEczMGFSTmNvaFJjU2tQdEJlZVJoR1ZLL3ZYZitzUT0=', 'staff', 'Subha', '2026-06-05', 'test', 8.00, NULL, 'VVlWeEsrTkJEelhGWTJROXNScDV4UT09', 1),
(3, '2026-06-05 10:49:34', '2026-06-05 10:49:34', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'OUh2U3NLZEcvUEhDaHh4VmRjV2d2dlF0MTY3WWJiQ2ErdTdJMjZHUzVscz0=', 'Sld0VENCNWI5cEwzck1YZ0NNNlY2bVpxSE9vU2dQRU0waENEWUJNZ3Jzbz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'manager', 'Manager', '2026-06-05', 'done', 8.00, NULL, 'NUtiQ3E4bkRTSGhOeERuWXRJVEV1UT09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_enrollment`
--

CREATE TABLE `tc_enrollment` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` varchar(100) DEFAULT NULL,
  `enrollment_id` mediumtext DEFAULT NULL,
  `enrollment_number` varchar(255) DEFAULT NULL,
  `student_id` varchar(100) DEFAULT NULL,
  `student_name` mediumtext DEFAULT NULL,
  `father_spouse_name` mediumtext DEFAULT NULL,
  `address` mediumtext DEFAULT NULL,
  `mobile_number` mediumtext DEFAULT NULL,
  `parent_contact_no` mediumtext DEFAULT NULL,
  `course_id` mediumtext DEFAULT NULL,
  `duration` mediumtext DEFAULT NULL,
  `from_time` mediumtext DEFAULT NULL,
  `to_time` mediumtext DEFAULT NULL,
  `staff_id` mediumtext DEFAULT NULL,
  `fees_type` mediumtext DEFAULT NULL,
  `num_installments` int(11) DEFAULT NULL,
  `fees_amount` decimal(10,2) DEFAULT NULL,
  `paid_amount` decimal(10,2) DEFAULT NULL,
  `balance_amount` decimal(10,2) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `blood_group` mediumtext DEFAULT NULL,
  `candidate_photo` mediumtext DEFAULT NULL,
  `course_closed` int(11) NOT NULL DEFAULT 2,
  `lead_source` mediumtext DEFAULT NULL,
  `referred_staff_id` mediumtext DEFAULT NULL,
  `payment_id` mediumtext DEFAULT NULL,
  `username` mediumtext DEFAULT NULL,
  `password` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tc_enrollment`
--

INSERT INTO `tc_enrollment` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `enrollment_id`, `enrollment_number`, `student_id`, `student_name`, `father_spouse_name`, `address`, `mobile_number`, `parent_contact_no`, `course_id`, `duration`, `from_time`, `to_time`, `staff_id`, `fees_type`, `num_installments`, `fees_amount`, `paid_amount`, `balance_amount`, `dob`, `doj`, `blood_group`, `candidate_photo`, `course_closed`, `lead_source`, `referred_staff_id`, `payment_id`, `username`, `password`, `deleted`) VALUES
(1, '2026-05-29 15:08:15', '2026-06-02 14:18:39', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'TFlyaklJRE4zYVhSaUVMMVg0NnZLZm1KVExJRWhZcjJ2UnQ0dC9DeDNVMD0=', 'ENT001/26-27', 'a1BhMmJoaVB6QmpsQ0FTT01JTDI3UT09', 'Selvam', 'sjdhgdsf', 'sdmbjhdsfds', '9843758974', '', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', '5', '', '', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 'Installment', 3, 10000.00, 3500.00, 6500.00, '2000-05-22', '2026-03-01', '', NULL, 2, 'instagram', '', NULL, 'WGE26001', 'a1BhMmJoaVB6QmpsQ0FTT01JTDI3UT09', 0),
(2, '2026-05-29 15:15:39', '2026-06-05 05:17:00', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'R1R5TXlIVWZnZ0RkZ1B2T2R5MDhscVdSWFUwZktHQ2Jld2ZGSVp1ZTIvOD0=', 'ENT002/26-27', 'a1V2MnhPNjY3Vm5hb1R6OXI0NmRYUT09', 'Cheran', 'Senthil', 'dsjfhdsjk', '0903487589', '', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', '5', '', '', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 'Installment', 2, 10000.00, 0.00, 10000.00, '1990-05-20', '2026-05-29', '', NULL, 2, '', '', NULL, 'WGE26002', 'NHBSMEZjSVpYK0RTbGFla1lqS2EzUT09', 0),
(3, '2026-05-30 18:12:51', '2026-05-30 18:12:51', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'a2crR2dLSW5QeDVsbkFhMWs3TVVvNGNac3I5NzBwdVloSTY1UjJ5R0RmMD0=', 'ENT003/26-27', 'WE9nMkVrOUJZWitIQytUaUltRkVIdz09', 'Subhash', 'Kumar', 'Sivakasi', '3894759843', '', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', '5', '', '', '', 'Full Payment', NULL, 10000.00, 10000.00, 0.00, '2000-05-21', '2026-05-27', '', NULL, 2, '', '', NULL, 'WGE26003', 'Y2FVZzdsQndlKzc2MFFWNDVJMDdIQT09', 0),
(6, '2026-06-02 11:06:58', '2026-06-03 17:03:23', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'ODV4SGw1ZU9Rb3hWZGpWY2ZOemMzczRMcWVXSmpsNDUzWVNEOXprNzIyND0=', 'ENT004/26-27', 'UElpbWlna2FHcllXUWFGMXcwZ2VKUT09', 'Senthil', 'kumar', 'dkjfhkdsjf', '8347598437', '', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', '5', '', '', '', 'Installment', 5, 10000.00, 2000.00, 8000.00, '2000-06-02', '2026-04-02', 'B-', NULL, 2, '', '', NULL, 'WGF26001', 'RVZmaW02WWZSanNWRlpJUjgxcGw2Zz09', 0),
(7, '2026-06-02 15:46:52', '2026-06-02 15:46:52', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'Mzk3aXVINEhaTTJBQVhHVzkyOTQxYkRjUlh1WktIa0x5bDFGd201K0p4az0=', 'ENT007/26-27', 'UWhkdnB1UU9Wbnk2YXF0YmY5VExaQT09', 'kumar', 'kavin', 'sivakasi', '3847586438', '', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', '5', '', '', '', 'Installment', 2, 10000.00, 5000.00, 5000.00, '2000-06-09', '2026-06-22', 'B+', NULL, 2, 'facebook', '', NULL, 'WGF26002', 'eWhXMGZLZUNSbWNNN1BQUXQyZzdBZz09', 0),
(8, '2026-06-02 18:27:09', '2026-06-02 18:27:09', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'enh2VG1JbFhJeEVRUXJzWEhTa25lUXJLa0pUTXV1MnJSdUlWK3BFUkY0RT0=', 'ENT008/26-27', 'cjEwcW0vM2NMd2J3WjVlOEZCWk5wZz09', 'cxcvcx', 'sjdhfkjds', 's,mdnfkds', '9834798593', '', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', '5', '', '', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 'Full Payment', NULL, 10000.00, 10000.00, 0.00, '2000-07-02', '2026-06-09', 'B-', NULL, 2, '', '', NULL, 'WGF26003', 'akxHbmxRY013czZHa3N5S2ViS1MzUT09', 0),
(9, '2026-06-04 15:30:59', '2026-06-04 15:30:59', 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b3g5dnJFNzRJM04wOTk0VTQ3NERteDQ2WmhQU3FFSEVEeU5FSGl1dDJLMD0=', 'ENT009/26-27', 'RzJ1RDVHekxubXhEdGNCRWhkNjEydz09', 'cvdf', 'sdfkjds', 'sdfhkjdsf', '9348759843', '', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', '5', '', '', '', 'Full Payment', NULL, 10000.00, 10000.00, 0.00, '2026-07-03', '2026-06-12', '', NULL, 2, '', '', NULL, 'WGF26004', 'cE8raHE1cHNQZlAwaVRpSVV5TFZZUT09', 0),
(10, '2026-06-04 15:32:48', '2026-06-04 15:32:48', 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RWRiVXRnck0zVjIvc05QQldYUndQM0FHTmVCYy9HaVZ1Y0JpT2JBNG5pQT0=', 'ENT010/26-27', 'S2IyVkk2RFJvbUJoWjl1LzhyTmdJdz09', 'test', 'test', 'sdfdsf', '9837458974', '', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', '5', '', '', 'cDBuYVlvZWRoRVpUQzVoZHZiREdLRDdpNjZUOEVSdDVtL3pRT21UOGljRT0=', 'Full Payment', NULL, 10000.00, 10000.00, 0.00, '2026-06-11', '2026-06-25', '', NULL, 2, '', '', NULL, 'WGF26005', 'NUZtZTIyeU9QakYwZTdtZExWNG55dz09', 0),
(11, '2026-06-05 05:21:20', '2026-06-05 05:21:20', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'UzMxdDFUMjZvd2pVS2dmTUNrazlrYUFXQS8xVGJZNCtPeHlRNmZLZDF2cz0=', 'ENT011/26-27', 'SVFPallTbFQybU5HTHAwYXMxcWJmQT09', 'kumar', 'selvam', 'sivakasi', '8734985983', '', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', '5', '', '', '', 'Installment', 2, 10000.00, 5000.00, 5000.00, '2000-06-04', '2026-06-16', '', NULL, 2, '', '', NULL, 'WGF26006', 'Zi9SMlZYOHZRcHp4RTk0aVB6d3J4QT09', 0),
(12, '2026-06-09 04:36:39', '2026-06-09 04:36:39', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'M25DaEF6UjFCdmdsVFlPLzgwSU44bmdZYkIvcjdhQTIvZDlISGNSVnZ6OD0=', 'ENT012/26-27', 'NEd0UG9WMjJzck1qbm4rRjN5cGQ4QT09', 'Aswanth', 'priya', 'thiruthangal', '7639109843', '', 'cEs4bm5xU1ZXNTJwVnowdXhVZFdzdVpiVFFZRXIzSkxwanBxMU1Wd3pVND0=', '6', '23:00', '02:00', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 'Installment', 5, 29999.00, 4000.00, 25999.00, '2001-01-01', '2026-06-10', '', NULL, 2, '', '', NULL, 'WGF26007', 'U0RCekRjRnhZWXBrOTRQd2l5L05jZz09', 0),
(13, '2026-06-11 15:21:52', '2026-06-11 18:05:26', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'U2QrUnd4U2NVZnlEQkYxTWo1Tit5b1prcG5BQmVOUnAxN0dqVUx1VkU1dz0=', 'ENT013/26-27', 'QVVlR0ZPeGVWVVpaaDBNRWltLyt4UT09', 'Test Student', 'Father', 'Address Test', '9876543210', '', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', '5', '', '', '', 'Installment', 2, 10000.00, 5000.00, 5000.00, '1999-12-12', '0000-00-00', '', NULL, 2, '', '', NULL, 'WGF26008', 'N0cxaStRa3A5SlFoR2FveWo3d1BmZz09', 0),
(14, '2026-06-11 15:54:53', '2026-06-11 15:54:53', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'OWdzQlMvejhHUDUxVXFSS2ttZ0dZQjc0WStrZUdEbXdpSkJDa1duNy9qZz0=', 'ENT014/26-27', 'SU5VQk05N2VXaDdjbDFXUm85TThlUT09', 'Sugumar', 'subhash', 'sivakasi', '8934759873', '', 'MzBRNUdoeWJaS0xOV0k2elBhbjd6aDM5MzdYZHFDbHZ2dEpOM2lzKzNPbz0=', '5', '12:00', '14:00', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 'Installment', 4, 30000.00, 7500.00, 22500.00, '1990-06-18', '2026-06-10', '', NULL, 2, 'website', '', NULL, 'WGF26009', 'c1JBR01rbXltMlI3U3JsSGR2cENVUT09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_enrollment_internship`
--

CREATE TABLE `tc_enrollment_internship` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `enrollment_internship_id` mediumtext DEFAULT NULL,
  `enrollment_number` varchar(255) DEFAULT NULL,
  `student_id` mediumtext DEFAULT NULL,
  `student_name` mediumtext DEFAULT NULL,
  `father_spouse_name` mediumtext DEFAULT NULL,
  `address` mediumtext DEFAULT NULL,
  `mobile_number` mediumtext DEFAULT NULL,
  `parent_contact_no` mediumtext DEFAULT NULL,
  `course_id` mediumtext DEFAULT NULL,
  `duration` mediumtext DEFAULT NULL,
  `from_time` mediumtext DEFAULT NULL,
  `to_time` mediumtext DEFAULT NULL,
  `staff_id` mediumtext DEFAULT NULL,
  `fees_type` mediumtext DEFAULT NULL,
  `num_installments` int(11) DEFAULT NULL,
  `fees_amount` decimal(10,2) DEFAULT NULL,
  `paid_amount` decimal(10,2) DEFAULT NULL,
  `balance_amount` decimal(10,2) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `blood_group` mediumtext DEFAULT NULL,
  `candidate_photo` mediumtext DEFAULT NULL,
  `course_closed` int(11) NOT NULL DEFAULT 2,
  `lead_source` mediumtext DEFAULT NULL,
  `referred_staff_id` mediumtext DEFAULT NULL,
  `username` mediumtext DEFAULT NULL,
  `password` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tc_enrollment_internship`
--

INSERT INTO `tc_enrollment_internship` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `enrollment_internship_id`, `enrollment_number`, `student_id`, `student_name`, `father_spouse_name`, `address`, `mobile_number`, `parent_contact_no`, `course_id`, `duration`, `from_time`, `to_time`, `staff_id`, `fees_type`, `num_installments`, `fees_amount`, `paid_amount`, `balance_amount`, `dob`, `doj`, `blood_group`, `candidate_photo`, `course_closed`, `lead_source`, `referred_staff_id`, `username`, `password`, `deleted`) VALUES
(1, '2026-06-02 17:35:08', '2026-06-02 17:35:08', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'bEtDeTU1Q2JNYWd4bzVjeG1DTUlhTlRJcFhnV0NhRDUycUtBYVlWQVF6az0=', 'ENI001/26-27', 'WGhhakRZb1FTNkQ3RDhDSUF6OWh6dz09', 'John Doe', 'Senior Doe', '123 Main St, New York', '9876543210', '', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', '5', '', '', '', 'Installment', 3, 10000.00, 3333.33, 6666.67, '0000-00-00', '2026-06-02', '', NULL, 2, '', '', 'WGIF26001', 'WGhhakRZb1FTNkQ3RDhDSUF6OWh6dz09', 0),
(2, '2026-06-09 04:48:22', '2026-06-09 04:48:22', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'Ui9wWmRJSTB4NkEyb1cxWnMwSHBLVnViMis3MVdoVDZxYWRPRDMvN1ZSWT0=', 'ENI002/26-27', 'ZmVRcWZPbEFNQ3lYcFlnQTIvRWhxQT09', 'kavin', 'gfhg', 'gjh', '8888888888', '', 'cEs4bm5xU1ZXNTJwVnowdXhVZFdzdVpiVFFZRXIzSkxwanBxMU1Wd3pVND0=', '6', '22:00', '15:00', 'Sld0VENCNWI5cEwzck1YZ0NNNlY2bVpxSE9vU2dQRU0waENEWUJNZ3Jzbz0=', 'Installment', 4, 29999.00, 7499.75, 22499.25, '0000-00-00', '0000-00-00', '', NULL, 2, '', '', 'WGIF26002', 'ZmVRcWZPbEFNQ3lYcFlnQTIvRWhxQT09', 0),
(3, '2026-06-11 15:57:32', '2026-06-11 15:57:32', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'QVFnVUM3WDduMi83TDA5bklnS21SM1BoNitDZUp1T1NGRW90UmlxQkxaaz0=', 'ENI003/26-27', 'dnlidGpyUkM3QUVFVW1PR05NUmFsdz09', 'Chozhan', 'Ayyanar', 'Meenakshi Amman, Sivakasi', '9873498734', '', 'MzBRNUdoeWJaS0xOV0k2elBhbjd6aDM5MzdYZHFDbHZ2dEpOM2lzKzNPbz0=', '15', '00:00', '14:00', 'Sld0VENCNWI5cEwzck1YZ0NNNlY2bVpxSE9vU2dQRU0waENEWUJNZ3Jzbz0=', 'Installment', 2, 5000.00, 2500.00, 2500.00, '1998-06-10', '2026-06-10', '', NULL, 2, 'website', '', 'WGIF26003', 'M1BKbzlTaGhNbUM5TnpCcEszRUJnZz09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_event`
--

CREATE TABLE `tc_event` (
  `id` int(11) NOT NULL,
  `event_id` varchar(255) DEFAULT NULL,
  `event_number` mediumtext DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `event_description` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tc_expense_category`
--

CREATE TABLE `tc_expense_category` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `expense_category_id` mediumtext DEFAULT NULL,
  `expense_category_name` mediumtext DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tc_expense_category`
--

INSERT INTO `tc_expense_category` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `expense_category_id`, `expense_category_name`, `description`, `deleted`) VALUES
(1, '2026-06-01 10:30:48', '2026-06-01 10:30:48', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'My9RVUNPVTdieStROUdTbllHK1RmREFmdzZBZDNGRkJ3bFVJMmc0RzRoZz0=', 'travel allowance', 'allowances for travel', 0),
(2, '2026-06-09 04:49:32', '2026-06-09 04:49:32', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RlB4a3YxNkNjU29aREFVdkVPTmtSZktIMFdheDI3M3FhbnN5ZHF6eHVZND0=', 'tea and coffee', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_expense_entry`
--

CREATE TABLE `tc_expense_entry` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `expense_entry_id` mediumtext DEFAULT NULL,
  `expense_category_id` mediumtext DEFAULT NULL,
  `expense_entry_date` mediumtext DEFAULT NULL,
  `payment_mode` mediumtext DEFAULT NULL,
  `bank` mediumtext DEFAULT NULL,
  `amount` mediumtext DEFAULT NULL,
  `total_amount` mediumtext DEFAULT NULL,
  `attachments` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `expense_entry_number` mediumtext DEFAULT NULL,
  `description` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tc_expense_entry`
--

INSERT INTO `tc_expense_entry` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `expense_entry_id`, `expense_category_id`, `expense_entry_date`, `payment_mode`, `bank`, `amount`, `total_amount`, `attachments`, `deleted`, `expense_entry_number`, `description`) VALUES
(1, '2026-06-01 10:31:30', '2026-06-05 05:25:17', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'ZG9UYVpjb3huc1VGRjl4UmRtSy9PMjJCL09Bak9zK3M0Wml2bDVvR1pKaz0=', 'My9RVUNPVTdieStROUdTbllHK1RmREFmdzZBZDNGRkJ3bFVJMmc0RzRoZz0=', '2026-06-01', 'c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=,UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', 'YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=,', '1000.00,1000.00', '2000.00', '1780290090_1779447504_6a1036d011aad_4__1_.doc,1780617317_WhatsApp_Image_2026-05-20_at_3.36.57_PM.jpeg,1780617317_WhatsApp_Image_2026-04-21_at_18.47.07.jpeg', 0, '001/26-27', 'paid'),
(2, '2026-06-05 05:26:11', '2026-06-05 05:26:11', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'cndQdk1zYjlZRVAyVS8yNVN1YkNOWHI1SUVoWkR5S09mT2puQjRSeTJ4VT0=', 'My9RVUNPVTdieStROUdTbllHK1RmREFmdzZBZDNGRkJ3bFVJMmc0RzRoZz0=', '2026-06-05', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', '', '2000.00', '2000.00', '1780617371_Training_Center_Project_Mobile_App_And_Publish_Guide.pdf,1780617371_boy.jpg,1780617371_girl.jpg', 0, '002/26-27', 'checked'),
(3, '2026-06-09 04:50:05', '2026-06-09 04:50:21', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'ajd1aTVnNEI2WDhMUWgzOXQ0eWppeTlaVFZwRFpXYUUrK1ZvQmtTTjJoTT0=', 'RlB4a3YxNkNjU29aREFVdkVPTmtSZktIMFdheDI3M3FhbnN5ZHF6eHVZND0=', '2026-06-09', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', '', '2000.00', '2000.00', '1780960805_JS-Syllabus__1__3_.docx,1780960805_WhatsApp_Image_2026-06-02_at_1.32.56_PM.jpeg', 0, '003/26-27', 'hjgjh'),
(4, '2026-06-09 04:51:06', '2026-06-09 04:51:06', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'UEZLMlNRMi9FNDM2WWc5eDQ2R2gxUnBqR280QUhRWVFobXpUL0Z0cG1TWT0=', 'RlB4a3YxNkNjU29aREFVdkVPTmtSZktIMFdheDI3M3FhbnN5ZHF6eHVZND0=', '2026-06-09', 'c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=', 'YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=', '2000.00', '2000.00', '1780960866_qrcode_docs.google.com.png', 0, '004/26-27', 'vfhg'),
(5, '2026-06-09 04:54:49', '2026-06-09 04:54:49', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'Z3NBK2hXN0J2U0MvVkhta3VmQjRYd1o1V0ZnZjgxQktHUmhDdDBja3JvVT0=', 'My9RVUNPVTdieStROUdTbllHK1RmREFmdzZBZDNGRkJ3bFVJMmc0RzRoZz0=', '2026-06-09', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', '', '666.00', '666.00', '1780961089_WhatsApp_Image_2026-05-20_at_3.54.20_PM.jpeg,1780961089_WhatsApp_Image_2026-05-20_at_3.36.57_PM.jpeg', 0, '005/26-27', 'gjhgj'),
(6, '2026-06-09 14:23:01', '2026-06-09 14:23:01', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'WVBFdzFJU0ZnenRtV0hNMUhHZFltU09abEVCb2RKZ3pFbjhzY2o3Z015WT0=', 'RlB4a3YxNkNjU29aREFVdkVPTmtSZktIMFdheDI3M3FhbnN5ZHF6eHVZND0=', '2026-06-09', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=,c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=', ',YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=', '300.00,300.00', '600.00', '1780995181_WhatsApp_Image_2026-04-25_at_16.31.05.jpeg,1780995181_WhatsApp_Image_2026-04-24_at_10.52.23.jpeg,1780995181_WhatsApp_Image_2026-04-24_at_10.39.30.jpeg', 0, '006/26-27', 'kjfhjhfdsjkfd\r\nbdfnds'),
(7, '2026-06-09 14:29:58', '2026-06-09 14:29:58', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b29xS08xQVJTY1RObmxoUHVKU2E1ZnE2Qlg1TW40TC83UHVwNDhkUkJnMD0=', 'My9RVUNPVTdieStROUdTbllHK1RmREFmdzZBZDNGRkJ3bFVJMmc0RzRoZz0=', '2026-06-09', 'c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=,UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', 'YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=,', '200.00,300.00', '500.00', '1780995598_lithium-ion_solar_battery.jpg,1780995598_Bifacial_Solar_Panel.jpg,1780995598_Polycrystalline_Solar_Panel.jpg', 0, '007/26-27', 'mnxkmczx'),
(8, '2026-06-11 15:53:17', '2026-06-11 15:53:17', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'Y3pyR1N6cVNtWCtENjRKQVhVM1VOOCt4RFdBRVlZbEY1dTErRVF3Q1JEYz0=', 'RlB4a3YxNkNjU29aREFVdkVPTmtSZktIMFdheDI3M3FhbnN5ZHF6eHVZND0=', '2026-06-11', 'c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=,UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', 'YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=,', '300.00,200.00', '500.00', '1781173396_IMG_9755_1_.jpg,1781173396_IMG_9771_1_.jpg,1781173396_IMG_9629_1_.jpg', 0, '008/26-27', 'lksdjfkldsnlf');

-- --------------------------------------------------------

--
-- Table structure for table `tc_installments`
--

CREATE TABLE `tc_installments` (
  `id` int(11) NOT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `enrollment_id` varchar(255) DEFAULT NULL,
  `course_type` varchar(50) DEFAULT NULL,
  `installment_number` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tc_installments`
--

INSERT INTO `tc_installments` (`id`, `company_id`, `enrollment_id`, `course_type`, `installment_number`, `due_date`, `amount`, `deleted`, `created_date_time`, `updated_date_time`) VALUES
(1, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'TFlyaklJRE4zYVhSaUVMMVg0NnZLZm1KVExJRWhZcjJ2UnQ0dC9DeDNVMD0=', 'training', 1, '2026-03-01', 3333.33, 0, '2026-06-02 14:18:39', '2026-06-02 14:18:39'),
(2, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'TFlyaklJRE4zYVhSaUVMMVg0NnZLZm1KVExJRWhZcjJ2UnQ0dC9DeDNVMD0=', 'training', 2, '2026-05-01', 3333.33, 0, '2026-06-02 14:18:39', '2026-06-02 14:18:39'),
(3, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'TFlyaklJRE4zYVhSaUVMMVg0NnZLZm1KVExJRWhZcjJ2UnQ0dC9DeDNVMD0=', 'training', 3, '2026-06-01', 3333.34, 0, '2026-06-02 14:18:39', '2026-06-02 14:18:39'),
(9, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'Mzk3aXVINEhaTTJBQVhHVzkyOTQxYkRjUlh1WktIa0x5bDFGd201K0p4az0=', 'training', 1, '2026-06-22', 5000.00, 0, '2026-06-02 15:46:52', '2026-06-02 15:46:52'),
(10, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'Mzk3aXVINEhaTTJBQVhHVzkyOTQxYkRjUlh1WktIa0x5bDFGd201K0p4az0=', 'training', 2, '2026-09-22', 5000.00, 0, '2026-06-02 15:46:52', '2026-06-02 15:46:52'),
(11, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'bEtDeTU1Q2JNYWd4bzVjeG1DTUlhTlRJcFhnV0NhRDUycUtBYVlWQVF6az0=', 'internship', 1, '2026-06-02', 3333.33, 0, '2026-06-02 17:35:08', '2026-06-02 17:35:08'),
(12, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'bEtDeTU1Q2JNYWd4bzVjeG1DTUlhTlRJcFhnV0NhRDUycUtBYVlWQVF6az0=', 'internship', 2, '2026-06-04', 3333.33, 0, '2026-06-02 17:35:08', '2026-06-02 17:35:08'),
(13, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'bEtDeTU1Q2JNYWd4bzVjeG1DTUlhTlRJcFhnV0NhRDUycUtBYVlWQVF6az0=', 'internship', 3, '2026-06-05', 3333.34, 0, '2026-06-02 17:35:08', '2026-06-02 17:35:08'),
(14, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'ODV4SGw1ZU9Rb3hWZGpWY2ZOemMzczRMcWVXSmpsNDUzWVNEOXprNzIyND0=', 'training', 1, '2026-04-02', 2000.00, 0, '2026-06-03 17:03:23', '2026-06-03 17:03:23'),
(15, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'ODV4SGw1ZU9Rb3hWZGpWY2ZOemMzczRMcWVXSmpsNDUzWVNEOXprNzIyND0=', 'training', 2, '2026-05-02', 2000.00, 0, '2026-06-03 17:03:23', '2026-06-03 17:03:23'),
(16, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'ODV4SGw1ZU9Rb3hWZGpWY2ZOemMzczRMcWVXSmpsNDUzWVNEOXprNzIyND0=', 'training', 3, '2026-06-02', 2000.00, 0, '2026-06-03 17:03:23', '2026-06-03 17:03:23'),
(17, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'ODV4SGw1ZU9Rb3hWZGpWY2ZOemMzczRMcWVXSmpsNDUzWVNEOXprNzIyND0=', 'training', 4, '2026-07-02', 2000.00, 0, '2026-06-03 17:03:23', '2026-06-03 17:03:23'),
(18, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'ODV4SGw1ZU9Rb3hWZGpWY2ZOemMzczRMcWVXSmpsNDUzWVNEOXprNzIyND0=', 'training', 5, '2026-08-02', 2000.00, 0, '2026-06-03 17:03:23', '2026-06-03 17:03:23'),
(19, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'R1R5TXlIVWZnZ0RkZ1B2T2R5MDhscVdSWFUwZktHQ2Jld2ZGSVp1ZTIvOD0=', 'training', 1, '2026-05-29', 5000.00, 0, '2026-06-05 05:17:00', '2026-06-05 05:17:00'),
(20, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'R1R5TXlIVWZnZ0RkZ1B2T2R5MDhscVdSWFUwZktHQ2Jld2ZGSVp1ZTIvOD0=', 'training', 2, '2026-08-29', 5000.00, 0, '2026-06-05 05:17:00', '2026-06-05 05:17:00'),
(21, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'UzMxdDFUMjZvd2pVS2dmTUNrazlrYUFXQS8xVGJZNCtPeHlRNmZLZDF2cz0=', 'training', 1, '2026-06-16', 5000.00, 0, '2026-06-05 05:21:20', '2026-06-05 05:21:20'),
(22, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'UzMxdDFUMjZvd2pVS2dmTUNrazlrYUFXQS8xVGJZNCtPeHlRNmZLZDF2cz0=', 'training', 2, '2026-09-16', 5000.00, 0, '2026-06-05 05:21:20', '2026-06-05 05:21:20'),
(23, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'M25DaEF6UjFCdmdsVFlPLzgwSU44bmdZYkIvcjdhQTIvZDlISGNSVnZ6OD0=', 'training', 1, '2026-06-10', 5999.80, 0, '2026-06-09 04:36:39', '2026-06-09 04:36:39'),
(24, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'M25DaEF6UjFCdmdsVFlPLzgwSU44bmdZYkIvcjdhQTIvZDlISGNSVnZ6OD0=', 'training', 2, '2026-07-10', 5999.80, 0, '2026-06-09 04:36:39', '2026-06-09 04:36:39'),
(25, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'M25DaEF6UjFCdmdsVFlPLzgwSU44bmdZYkIvcjdhQTIvZDlISGNSVnZ6OD0=', 'training', 3, '2026-08-10', 5999.80, 0, '2026-06-09 04:36:39', '2026-06-09 04:36:39'),
(26, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'M25DaEF6UjFCdmdsVFlPLzgwSU44bmdZYkIvcjdhQTIvZDlISGNSVnZ6OD0=', 'training', 4, '2026-10-10', 5999.80, 0, '2026-06-09 04:36:39', '2026-06-09 04:36:39'),
(27, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'M25DaEF6UjFCdmdsVFlPLzgwSU44bmdZYkIvcjdhQTIvZDlISGNSVnZ6OD0=', 'training', 5, '2026-11-10', 5999.80, 0, '2026-06-09 04:36:39', '2026-06-09 04:36:39'),
(28, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'OWdzQlMvejhHUDUxVXFSS2ttZ0dZQjc0WStrZUdEbXdpSkJDa1duNy9qZz0=', 'training', 1, '2026-06-10', 7500.00, 0, '2026-06-11 15:54:53', '2026-06-11 15:54:53'),
(29, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'OWdzQlMvejhHUDUxVXFSS2ttZ0dZQjc0WStrZUdEbXdpSkJDa1duNy9qZz0=', 'training', 2, '2026-07-10', 7500.00, 0, '2026-06-11 15:54:53', '2026-06-11 15:54:53'),
(30, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'OWdzQlMvejhHUDUxVXFSS2ttZ0dZQjc0WStrZUdEbXdpSkJDa1duNy9qZz0=', 'training', 3, '2026-09-10', 7500.00, 0, '2026-06-11 15:54:53', '2026-06-11 15:54:53'),
(31, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'OWdzQlMvejhHUDUxVXFSS2ttZ0dZQjc0WStrZUdEbXdpSkJDa1duNy9qZz0=', 'training', 4, '2026-10-10', 7500.00, 0, '2026-06-11 15:54:53', '2026-06-11 15:54:53'),
(32, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'QVFnVUM3WDduMi83TDA5bklnS21SM1BoNitDZUp1T1NGRW90UmlxQkxaaz0=', 'internship', 1, '2026-06-10', 2500.00, 0, '2026-06-11 15:57:32', '2026-06-11 15:57:32'),
(33, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'QVFnVUM3WDduMi83TDA5bklnS21SM1BoNitDZUp1T1NGRW90UmlxQkxaaz0=', 'internship', 2, '2026-06-18', 2500.00, 0, '2026-06-11 15:57:32', '2026-06-11 15:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `tc_logins`
--

CREATE TABLE `tc_logins` (
  `id` int(11) NOT NULL,
  `login_date_time` datetime DEFAULT NULL,
  `logout_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tc_logins`
--

INSERT INTO `tc_logins` (`id`, `login_date_time`, `logout_date_time`, `company_id`, `user_id`, `deleted`) VALUES
(1, '2026-05-27 16:46:17', NULL, NULL, 1, 0),
(2, '2026-05-27 16:47:01', NULL, NULL, 2, 0),
(3, '2026-05-27 16:58:13', NULL, NULL, 2, 0),
(4, '2026-05-27 17:05:19', NULL, NULL, 2, 0),
(5, '2026-05-27 17:06:19', NULL, NULL, 2, 0),
(6, '2026-05-27 17:35:40', NULL, NULL, 3, 0),
(7, '2026-05-27 17:58:56', NULL, NULL, 1, 0),
(8, '2026-05-27 18:05:14', NULL, NULL, 1, 0),
(9, '2026-05-27 18:06:07', '2026-05-27 18:10:51', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 1, 0),
(10, '2026-05-27 18:11:25', NULL, NULL, 1, 0),
(11, '2026-05-27 18:13:17', NULL, NULL, 1, 0),
(12, '2026-05-27 18:14:57', NULL, NULL, 1, 0),
(13, '2026-05-27 18:16:04', NULL, NULL, 1, 0),
(14, '2026-05-27 18:17:06', NULL, NULL, 1, 0),
(15, '2026-05-27 18:22:44', NULL, NULL, 1, 0),
(16, '2026-05-27 18:23:15', NULL, NULL, 3, 0),
(17, '2026-05-27 18:31:45', NULL, NULL, 1, 0),
(18, '2026-05-28 12:24:35', NULL, NULL, 1, 0),
(19, '2026-05-28 12:50:01', NULL, NULL, 4, 0),
(20, '2026-05-28 12:55:42', NULL, NULL, 1, 0),
(21, '2026-05-28 12:57:27', NULL, NULL, 5, 0),
(22, '2026-05-28 13:05:33', NULL, NULL, 1, 0),
(23, '2026-05-28 14:08:05', NULL, NULL, 1, 0),
(24, '2026-05-28 14:09:25', NULL, NULL, 6, 0),
(25, '2026-05-28 14:41:44', NULL, NULL, 1, 0),
(26, '2026-05-28 16:04:53', NULL, NULL, 1, 0),
(27, '2026-05-28 16:38:19', NULL, NULL, 1, 0),
(28, '2026-05-29 14:08:44', NULL, NULL, 1, 0),
(29, '2026-05-29 14:15:32', NULL, NULL, 1, 0),
(30, '2026-05-29 14:54:10', NULL, NULL, 1, 0),
(31, '2026-05-29 14:55:36', NULL, NULL, 1, 0),
(32, '2026-05-29 14:56:12', NULL, NULL, 1, 0),
(33, '2026-05-29 14:56:35', NULL, NULL, 2, 0),
(34, '2026-05-29 15:04:04', NULL, NULL, 1, 0),
(35, '2026-05-29 15:08:56', NULL, NULL, 1, 0),
(36, '2026-05-29 15:16:29', NULL, NULL, 2, 0),
(37, '2026-05-29 15:17:20', NULL, NULL, 2, 0),
(38, '2026-05-29 15:19:44', NULL, NULL, 1, 0),
(39, '2026-05-29 15:20:00', NULL, NULL, 2, 0),
(40, '2026-05-29 17:36:28', NULL, NULL, 2, 0),
(41, '2026-05-29 17:43:43', NULL, NULL, 2, 0),
(42, '2026-05-29 17:45:06', '2026-05-29 18:28:44', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 1, 0),
(43, '2026-05-29 18:20:50', NULL, NULL, 2, 0),
(44, '2026-05-30 10:39:35', NULL, NULL, 2, 0),
(45, '2026-05-30 14:02:21', NULL, NULL, 1, 0),
(46, '2026-05-30 15:55:02', NULL, NULL, 2, 0),
(47, '2026-05-30 17:36:10', NULL, NULL, 1, 0),
(48, '2026-05-30 17:37:28', NULL, NULL, 3, 0),
(49, '2026-06-01 10:12:05', NULL, NULL, 1, 0),
(50, '2026-06-01 10:40:18', NULL, NULL, 2, 0),
(51, '2026-06-01 10:50:04', NULL, NULL, 1, 0),
(52, '2026-06-01 10:50:28', '2026-06-01 10:50:57', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 1, 0),
(53, '2026-06-01 10:51:26', NULL, NULL, 3, 0),
(54, '2026-06-01 10:55:40', NULL, NULL, 1, 0),
(55, '2026-06-01 10:57:47', NULL, NULL, 2, 0),
(56, '2026-06-01 11:02:52', NULL, NULL, 3, 0),
(57, '2026-06-01 11:03:36', NULL, NULL, 2, 0),
(58, '2026-06-01 14:50:12', NULL, NULL, 1, 0),
(59, '2026-06-01 14:52:15', '2026-06-01 16:13:55', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 1, 0),
(60, '2026-06-01 16:07:53', NULL, NULL, 1, 0),
(61, '2026-06-01 16:08:19', NULL, NULL, 2, 0),
(62, '2026-06-01 16:09:18', NULL, NULL, 1, 0),
(63, '2026-06-01 16:14:13', NULL, NULL, 1, 0),
(64, '2026-06-01 16:18:45', NULL, NULL, 1, 0),
(65, '2026-06-01 16:26:42', NULL, NULL, 2, 0),
(66, '2026-06-01 16:35:52', NULL, NULL, 1, 0),
(67, '2026-06-01 16:36:24', NULL, NULL, 1, 0),
(68, '2026-06-01 16:36:48', NULL, NULL, 3, 0),
(69, '2026-06-01 16:55:15', NULL, NULL, 1, 0),
(70, '2026-06-01 17:38:43', NULL, NULL, 1, 0),
(71, '2026-06-01 17:57:54', NULL, NULL, 1, 0),
(72, '2026-06-01 18:30:06', NULL, NULL, 1, 0),
(73, '2026-06-02 10:03:06', NULL, NULL, 1, 0),
(74, '2026-06-02 10:36:28', NULL, NULL, 1, 0),
(75, '2026-06-02 10:41:03', NULL, NULL, 1, 0),
(76, '2026-06-02 10:45:28', NULL, NULL, 1, 0),
(77, '2026-06-02 10:46:04', NULL, NULL, 1, 0),
(78, '2026-06-02 14:09:42', NULL, NULL, 1, 0),
(79, '2026-06-02 14:24:22', NULL, NULL, 1, 0),
(80, '2026-06-02 16:31:22', NULL, NULL, 1, 0),
(81, '2026-06-02 16:45:11', '2026-06-02 16:45:44', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 1, 0),
(82, '2026-06-02 16:54:36', NULL, NULL, 1, 0),
(83, '2026-06-02 17:32:31', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 1, 0),
(84, '2026-06-02 17:39:22', NULL, NULL, 1, 0),
(85, '2026-06-03 05:35:33', NULL, NULL, 1, 0),
(86, '2026-06-03 13:01:11', NULL, NULL, 1, 0),
(87, '2026-06-03 17:00:08', NULL, NULL, 1, 0),
(88, '2026-06-04 10:10:49', NULL, NULL, 1, 0),
(89, '2026-06-04 10:52:54', NULL, NULL, 2, 0),
(90, '2026-06-04 10:53:16', NULL, NULL, 1, 0),
(91, '2026-06-04 13:47:44', NULL, NULL, 2, 0),
(92, '2026-06-04 14:09:38', NULL, NULL, 1, 0),
(93, '2026-06-04 14:17:16', NULL, NULL, 1, 0),
(94, '2026-06-04 14:33:28', NULL, NULL, 2, 0),
(95, '2026-06-04 14:39:29', NULL, NULL, 1, 0),
(96, '2026-06-04 14:39:47', NULL, NULL, 2, 0),
(97, '2026-06-04 14:48:38', NULL, NULL, 1, 0),
(98, '2026-06-04 14:49:08', NULL, NULL, 8, 0),
(99, '2026-06-04 14:50:14', NULL, NULL, 8, 0),
(100, '2026-06-04 14:55:25', NULL, NULL, 2, 0),
(101, '2026-06-04 15:03:45', NULL, NULL, 1, 0),
(102, '2026-06-04 15:04:02', NULL, NULL, 1, 0),
(103, '2026-06-04 15:04:33', NULL, NULL, 8, 0),
(104, '2026-06-04 15:30:24', NULL, NULL, 1, 0),
(105, '2026-06-04 15:31:56', NULL, NULL, 3, 0),
(106, '2026-06-04 16:26:58', NULL, NULL, 1, 0),
(107, '2026-06-05 02:40:11', NULL, NULL, 1, 0),
(108, '2026-06-05 03:39:31', NULL, NULL, 1, 0),
(109, '2026-06-05 04:24:13', NULL, NULL, 2, 0),
(110, '2026-06-05 04:30:59', NULL, NULL, 1, 0),
(111, '2026-06-05 04:34:05', NULL, NULL, 2, 0),
(112, '2026-06-05 04:34:21', NULL, NULL, 2, 0),
(113, '2026-06-05 04:35:27', NULL, NULL, 1, 0),
(114, '2026-06-05 04:36:18', NULL, NULL, 8, 0),
(115, '2026-06-05 09:43:44', NULL, NULL, 1, 0),
(116, '2026-06-05 10:49:21', NULL, NULL, 1, 0),
(117, '2026-06-05 10:51:12', NULL, NULL, 2, 0),
(118, '2026-06-05 11:29:15', NULL, NULL, 1, 0),
(119, '2026-06-05 15:47:36', NULL, NULL, 1, 0),
(120, '2026-06-06 13:00:58', NULL, NULL, 1, 0),
(121, '2026-06-06 13:37:32', NULL, NULL, 3, 0),
(122, '2026-06-06 16:14:00', NULL, NULL, 3, 0),
(123, '2026-06-06 16:31:13', NULL, NULL, 1, 0),
(124, '2026-06-06 16:31:46', NULL, NULL, 3, 0),
(125, '2026-06-06 18:21:02', NULL, NULL, 1, 0),
(126, '2026-06-08 09:51:50', NULL, NULL, 1, 0),
(127, '2026-06-08 10:14:05', NULL, NULL, 1, 0),
(128, '2026-06-08 14:26:04', NULL, NULL, 1, 0),
(129, '2026-06-08 17:05:28', '2026-06-08 17:41:55', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 1, 0),
(130, '2026-06-08 17:42:04', NULL, NULL, 2, 0),
(131, '2026-06-08 17:43:22', NULL, NULL, 1, 0),
(132, '2026-06-08 17:47:36', NULL, NULL, 11, 0),
(133, '2026-06-08 17:48:09', NULL, NULL, 2, 0),
(134, '2026-06-08 17:49:04', NULL, NULL, 1, 0),
(135, '2026-06-08 17:49:34', NULL, NULL, 11, 0),
(136, '2026-06-08 17:50:30', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 1, 0),
(137, '2026-06-09 03:54:04', NULL, NULL, 1, 0),
(138, '2026-06-09 04:16:05', NULL, NULL, 1, 0),
(139, '2026-06-09 04:57:37', NULL, NULL, 2, 0),
(140, '2026-06-09 04:58:14', NULL, NULL, 1, 0),
(141, '2026-06-09 05:00:56', NULL, NULL, 1, 0),
(142, '2026-06-09 05:02:07', NULL, NULL, 2, 0),
(143, '2026-06-09 05:12:09', NULL, NULL, 1, 0),
(144, '2026-06-09 05:20:08', NULL, NULL, 1, 0),
(145, '2026-06-09 05:26:17', NULL, NULL, 1, 0),
(146, '2026-06-09 09:29:29', NULL, NULL, 1, 0),
(147, '2026-06-09 12:58:41', NULL, NULL, 1, 0),
(148, '2026-06-10 10:35:30', NULL, NULL, 1, 0),
(149, '2026-06-11 15:16:59', NULL, NULL, 1, 0),
(150, '2026-06-11 15:51:33', NULL, NULL, 1, 0),
(151, '2026-06-11 16:37:06', NULL, NULL, 1, 0),
(152, '2026-06-11 16:38:43', NULL, NULL, 1, 0),
(153, '2026-06-11 16:40:45', NULL, NULL, 1, 0),
(154, '2026-06-11 18:04:55', NULL, NULL, 1, 0),
(155, '2026-06-12 10:51:49', NULL, NULL, 1, 0),
(156, '2026-06-12 10:51:57', NULL, NULL, 1, 0),
(157, '2026-06-12 10:52:15', NULL, NULL, 1, 0),
(158, '2026-06-12 10:53:12', NULL, NULL, 1, 0),
(159, '2026-06-12 11:42:40', NULL, NULL, 1, 0),
(160, '2026-06-12 12:11:07', NULL, NULL, 1, 0),
(161, '2026-06-13 10:07:16', NULL, NULL, 1, 0),
(162, '2026-06-15 10:23:27', NULL, NULL, 1, 0),
(163, '2026-06-15 11:55:14', NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_payment`
--

CREATE TABLE `tc_payment` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` varchar(100) DEFAULT NULL,
  `payment_id` mediumtext DEFAULT NULL,
  `course_type` mediumtext DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_mode` mediumtext DEFAULT NULL,
  `bank` mediumtext DEFAULT NULL,
  `amount` mediumtext DEFAULT NULL,
  `paid_amount` varchar(255) DEFAULT '0.00',
  `cgst_amount` varchar(255) DEFAULT '0.00',
  `sgst_amount` varchar(255) DEFAULT '0.00',
  `total_amount` mediumtext DEFAULT NULL,
  `student_id` varchar(100) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `enrollment_id` varchar(100) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tc_payment`
--

INSERT INTO `tc_payment` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `payment_id`, `course_type`, `payment_date`, `payment_mode`, `bank`, `amount`, `paid_amount`, `cgst_amount`, `sgst_amount`, `total_amount`, `student_id`, `description`, `enrollment_id`, `deleted`) VALUES
(1, '2026-06-02 10:31:33', '2026-06-02 10:31:33', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC001/26-27', 'training', '2026-06-02', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', '', '3500.00', '3500.00', '0.00', '0.00', '3500.00', 'a1BhMmJoaVB6QmpsQ0FTT01JTDI3UT09', 'paid', 'TFlyaklJRE4zYVhSaUVMMVg0NnZLZm1KVExJRWhZcjJ2UnQ0dC9DeDNVMD0=', 0),
(2, '2026-06-02 11:07:06', '2026-06-02 11:07:06', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC002/26-27', 'training', '2026-06-02', 'c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=', 'YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=', '2500.00', '2500.00', '0.00', '0.00', '2500.00', 'UElpbWlna2FHcllXUWFGMXcwZ2VKUT09', 'Enrollment payment', 'ODV4SGw1ZU9Rb3hWZGpWY2ZOemMzczRMcWVXSmpsNDUzWVNEOXprNzIyND0=', 0),
(3, '2026-06-02 15:48:28', '2026-06-02 15:48:28', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC003/26-27', 'training', '2026-06-02', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', '', '5000.00', '5000.00', '0.00', '0.00', '5000.00', 'UWhkdnB1UU9Wbnk2YXF0YmY5VExaQT09', 'Enrollment payment', 'Mzk3aXVINEhaTTJBQVhHVzkyOTQxYkRjUlh1WktIa0x5bDFGd201K0p4az0=', 0),
(4, '2026-06-02 16:40:39', '2026-06-02 16:40:39', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC004/26-27', 'training', '2026-06-02', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', '', '300.00', '300.00', '0.00', '0.00', '300.00', 'UWhkdnB1UU9Wbnk2YXF0YmY5VExaQT09', '', 'Mzk3aXVINEhaTTJBQVhHVzkyOTQxYkRjUlh1WktIa0x5bDFGd201K0p4az0=', 0),
(5, '2026-06-02 17:35:35', '2026-06-02 17:35:35', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC005/26-27', 'internship', '2026-06-02', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', '', '3333.33', '3333.33', '0.00', '0.00', '3333.33', 'WGhhakRZb1FTNkQ3RDhDSUF6OWh6dz09', 'Enrollment payment', 'bEtDeTU1Q2JNYWd4bzVjeG1DTUlhTlRJcFhnV0NhRDUycUtBYVlWQVF6az0=', 0),
(6, '2026-06-02 18:26:14', '2026-06-02 18:26:14', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC006/26-27', 'training', '2026-06-02', 'c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=,UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', 'YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=,', '200.00,300.00', '500.00', '0.00', '0.00', '500.00', 'UElpbWlna2FHcllXUWFGMXcwZ2VKUT09', 'cdcx', 'ODV4SGw1ZU9Rb3hWZGpWY2ZOemMzczRMcWVXSmpsNDUzWVNEOXprNzIyND0=', 0),
(7, '2026-06-02 18:27:18', '2026-06-02 18:27:18', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC007/26-27', 'training', '2026-06-02', 'c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=', 'YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=', '10000.00', '10000.00', '0.00', '0.00', '10000.00', 'cjEwcW0vM2NMd2J3WjVlOEZCWk5wZz09', 'Enrollment payment', 'enh2VG1JbFhJeEVRUXJzWEhTa25lUXJLa0pUTXV1MnJSdUlWK3BFUkY0RT0=', 0),
(8, '2026-06-05 05:01:04', '2026-06-05 05:01:04', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC008/26-27', 'training', '2026-06-05', 'c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=,UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', 'YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=,', '100.00,200.00', '300.00', '0.00', '0.00', '300.00', 'UWhkdnB1UU9Wbnk2YXF0YmY5VExaQT09', '', 'Mzk3aXVINEhaTTJBQVhHVzkyOTQxYkRjUlh1WktIa0x5bDFGd201K0p4az0=', 0),
(9, '2026-06-05 05:21:26', '2026-06-05 05:21:26', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC009/26-27', 'training', '2026-06-05', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', '', '5000.00', '5000.00', '0.00', '0.00', '5000.00', 'SVFPallTbFQybU5HTHAwYXMxcWJmQT09', 'Enrollment payment', 'UzMxdDFUMjZvd2pVS2dmTUNrazlrYUFXQS8xVGJZNCtPeHlRNmZLZDF2cz0=', 0),
(10, '2026-06-09 04:36:49', '2026-06-09 04:36:49', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC010/26-27', 'training', '2026-06-09', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', '', '4000.00', '4000.00', '0.00', '0.00', '4000.00', 'NEd0UG9WMjJzck1qbm4rRjN5cGQ4QT09', 'Enrollment payment', 'M25DaEF6UjFCdmdsVFlPLzgwSU44bmdZYkIvcjdhQTIvZDlISGNSVnZ6OD0=', 0),
(11, '2026-06-09 04:48:30', '2026-06-09 04:48:30', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC011/26-27', 'internship', '2026-06-09', 'c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=', 'YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=', '7499.75', '7499.75', '0.00', '0.00', '7499.75', 'ZmVRcWZPbEFNQ3lYcFlnQTIvRWhxQT09', 'Enrollment payment', 'Ui9wWmRJSTB4NkEyb1cxWnMwSHBLVnViMis3MVdoVDZxYWRPRDMvN1ZSWT0=', 0),
(12, '2026-06-09 16:06:06', '2026-06-09 16:06:06', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC012/26-27', 'training', '2026-06-09', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=,c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=', ',YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=', '200.00,300.00', '500.00', '0.00', '0.00', '500.00', 'SVFPallTbFQybU5HTHAwYXMxcWJmQT09', 'jkhdsfkds', 'UzMxdDFUMjZvd2pVS2dmTUNrazlrYUFXQS8xVGJZNCtPeHlRNmZLZDF2cz0=', 0),
(13, '2026-06-11 15:52:28', '2026-06-11 15:52:28', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC013/26-27', 'training', '2026-06-11', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=,c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=', ',YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=', '100.00,300.00', '400.00', '0.00', '0.00', '400.00', 'SVFPallTbFQybU5HTHAwYXMxcWJmQT09', 'paid through \r\nthe gpay', 'UzMxdDFUMjZvd2pVS2dmTUNrazlrYUFXQS8xVGJZNCtPeHlRNmZLZDF2cz0=', 0),
(14, '2026-06-11 15:55:17', '2026-06-11 15:55:17', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC014/26-27', 'training', '2026-06-11', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=,c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=', ',YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=', '2000.00,5500.00', '7500.00', '0.00', '0.00', '7500.00', 'SU5VQk05N2VXaDdjbDFXUm85TThlUT09', 'Enrollment payment', 'OWdzQlMvejhHUDUxVXFSS2ttZ0dZQjc0WStrZUdEbXdpSkJDa1duNy9qZz0=', 0),
(15, '2026-06-11 15:57:41', '2026-06-11 15:57:41', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC015/26-27', 'internship', '2026-06-11', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', '', '2500.00', '2500.00', '0.00', '0.00', '2500.00', 'dnlidGpyUkM3QUVFVW1PR05NUmFsdz09', 'Enrollment payment', 'QVFnVUM3WDduMi83TDA5bklnS21SM1BoNitDZUp1T1NGRW90UmlxQkxaaz0=', 0),
(16, '2026-06-12 12:09:33', '2026-06-12 12:09:33', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC016/26-27', 'training', '2026-06-12', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=,c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=', ',YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=', '4000.00,3000.00', '7000.00', '0.00', '0.00', '7000.00', 'QVVlR0ZPeGVWVVpaaDBNRWltLyt4UT09', 'xcvcxv', 'U2QrUnd4U2NVZnlEQkYxTWo1Tit5b1prcG5BQmVOUnAxN0dqVUx1VkU1dz0=', 0),
(17, '2026-06-12 12:14:22', '2026-06-12 12:14:22', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC017/26-27', 'training', '2026-06-12', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=,c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=', ',YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=', '5000.00,2000.00', '7000.00', '0.00', '0.00', '7000.00', 'SU5VQk05N2VXaDdjbDFXUm85TThlUT09', '', 'OWdzQlMvejhHUDUxVXFSS2ttZ0dZQjc0WStrZUdEbXdpSkJDa1duNy9qZz0=', 0),
(18, '2026-06-12 12:39:19', '2026-06-12 12:39:19', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC018/26-27', 'training', '2026-06-12', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', '', '5000.50', '5000.50', '450.05', '450.05', '5900.60', 'SU5VQk05N2VXaDdjbDFXUm85TThlUT09', '5000.50', 'OWdzQlMvejhHUDUxVXFSS2ttZ0dZQjc0WStrZUdEbXdpSkJDa1duNy9qZz0=', 0),
(19, '2026-06-13 10:31:17', '2026-06-13 10:31:17', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'REC019/26-27', 'training', '2026-06-13', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=,c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=', ',YlpEWWlFWWIxWEN0WUs4WnBvbDAyclJsdjNXRTI3enoyTkczK3ZSVnFGaz0=', '1000.00,1000.00', '1694.92', '152.54', '152.54', '2000.00', 'NEd0UG9WMjJzck1qbm4rRjN5cGQ4QT09', 'tax 18%', 'M25DaEF6UjFCdmdsVFlPLzgwSU44bmdZYkIvcjdhQTIvZDlISGNSVnZ6OD0=', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_payment_mode`
--

CREATE TABLE `tc_payment_mode` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `payment_mode_id` mediumtext DEFAULT NULL,
  `payment_mode_name` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tc_payment_mode`
--

INSERT INTO `tc_payment_mode` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `payment_mode_id`, `payment_mode_name`, `deleted`) VALUES
(1, '2026-06-01 10:16:53', '2026-06-01 10:16:53', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'UVF2eDYrbDY0Vm4wclBxTkNCbTIwME5FNGhzajNlUGpJdDU3MWZKaDVjMD0=', 'cash', 0),
(2, '2026-06-01 10:17:02', '2026-06-01 10:17:02', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'c01DYnhuemhxT1dRRGdPYldxZGpWdlZCTXR3NXFYaU5ZQStpeERGc1VOUT0=', 'gpay', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_payroll`
--

CREATE TABLE `tc_payroll` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `payroll_id` mediumtext DEFAULT NULL,
  `payroll_number` mediumtext DEFAULT NULL,
  `staff_id` mediumtext DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `monthly_salary` decimal(10,2) DEFAULT NULL,
  `per_day_salary` decimal(10,2) DEFAULT NULL,
  `cl_days` decimal(3,1) NOT NULL DEFAULT 0.0,
  `lop_days` decimal(3,1) NOT NULL DEFAULT 0.0,
  `total_deduction` decimal(10,2) DEFAULT NULL,
  `incentive_amount` decimal(10,2) DEFAULT NULL,
  `total_references` int(11) DEFAULT 0,
  `net_salary` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tc_payroll`
--

INSERT INTO `tc_payroll` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `payroll_id`, `payroll_number`, `staff_id`, `month`, `year`, `monthly_salary`, `per_day_salary`, `cl_days`, `lop_days`, `total_deduction`, `incentive_amount`, `total_references`, `net_salary`, `payment_date`, `deleted`) VALUES
(1, '2026-05-29 17:46:20', '2026-05-29 17:46:20', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'cSs1Vk9QdlVWaEQ3SjVYWGQ1K1pTbUQ2ZGErY0VIT0crTUkwNENlWFdPND0=', 'ek4wd1lzdDNaZ1lEblVuSk9kbk5Ndz09', 'Sld0VENCNWI5cEwzck1YZ0NNNlY2bVpxSE9vU2dQRU0waENEWUJNZ3Jzbz0=', 5, 2026, 20000.00, 645.16, 0.5, 0.0, 0.00, 0.00, 0, 20000.00, '2026-05-29', 0),
(2, '2026-05-29 17:46:20', '2026-05-29 17:46:20', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'cSs1Vk9QdlVWaEQ3SjVYWGQ1K1pTbjFWeHVXNy9BdWhRYUs3akcrQytsbz0=', 'ek4wd1lzdDNaZ1lEblVuSk9kbk5Ndz09', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 5, 2026, 20000.00, 645.16, 0.0, 0.0, 0.00, 0.00, 0, 20000.00, '2026-05-29', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_roles`
--

CREATE TABLE `tc_roles` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `role_id` mediumtext DEFAULT NULL,
  `role_name` mediumtext DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tc_roles`
--

INSERT INTO `tc_roles` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `role_id`, `role_name`, `description`, `deleted`) VALUES
(1, '2026-05-25 15:38:12', '2026-06-01 11:01:36', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'cFlxWHg1N2RYSzg5OEczMGFSTmNvaFJjU2tQdEJlZVJoR1ZLL3ZYZitzUT0=', 'staff', 'handle training', 0),
(2, '2026-05-25 15:38:26', '2026-06-09 05:01:33', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'manager', 'Need to handle Management', 0),
(3, '2026-05-26 14:18:27', '2026-06-08 17:52:01', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RXZ5NE1pZjRlVUExSk5VUXY2TUpuYUcwOVBSMUt2NjNPZ3NWMWZSeEplZz0=', 'aspirants', 'these are students', 0),
(4, '2026-05-27 13:10:43', '2026-05-29 14:16:28', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'management', 'Whole management', 0),
(5, '2026-06-09 04:08:27', NULL, NULL, 'akFWazNXLzdDenBRNHNxK1QyRE1ubFFaRzRNWXFtbGJFL2JDSE1KbGJBOD0=', 'incharge', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_role_permissions`
--

CREATE TABLE `tc_role_permissions` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `role_id` mediumtext DEFAULT NULL,
  `permission_page` mediumtext DEFAULT NULL,
  `permission_action` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tc_role_permissions`
--

INSERT INTO `tc_role_permissions` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `role_id`, `permission_page`, `permission_action`, `deleted`) VALUES
(520, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'course', 'V$$A$$E$$D', 0),
(521, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'course_closure', 'V$$A$$E$$D', 0),
(522, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'tasks', 'V$$A$$E$$D', 0),
(523, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'event', 'V$$A$$E$$D', 0),
(524, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'enrollment', 'V$$A$$E$$D', 0),
(525, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'enrollment_internship', 'V$$A$$E$$D', 0),
(526, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'course_enquiry', 'V$$A$$E$$D', 0),
(527, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'attendance', 'V$$A$$E$$D', 0),
(528, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'payroll', 'V$$A$$E$$D', 0),
(529, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'receipt', 'V$$A$$E$$D', 0),
(530, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'payment_mode', 'V$$A$$E$$D', 0),
(531, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'bank', 'V$$A$$E$$D', 0),
(532, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'expense_category', 'V$$A$$E$$D', 0),
(533, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'expense_entry', 'V$$A$$E$$D', 0),
(534, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'daily_reports', 'V', 0),
(535, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'report_enrollment', 'V', 0),
(536, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'report_payroll', 'V', 0),
(537, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'report_payments', 'V', 0),
(538, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'report_attendance', 'V', 0),
(539, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'report_placement', 'V', 0),
(540, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'student_attendance', 'V', 0),
(541, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'student_tasks', 'V', 0),
(542, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'student_reports', 'V', 0),
(543, '2026-05-29 14:16:28', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'daily_report', 'V', 0),
(544, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'course', 'V$$A$$E$$D', 0),
(545, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'course_closure', 'V$$A$$E$$D', 0),
(546, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'tasks', 'V$$A$$E$$D', 0),
(547, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'event', 'V$$A$$E$$D', 0),
(548, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'enrollment', 'V$$A$$E$$D', 0),
(549, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'enrollment_internship', 'V$$A$$E$$D', 0),
(550, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'course_enquiry', 'V$$A$$E$$D', 0),
(551, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'attendance', 'V$$A$$E$$D', 0),
(552, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'payroll', 'V$$A$$E$$D', 0),
(553, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'receipt', 'V$$A$$E$$D', 0),
(554, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'payment_mode', 'V$$A$$E$$D', 0),
(555, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'bank', 'V$$A$$E$$D', 0),
(556, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'expense_category', 'V$$A$$E$$D', 0),
(557, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'expense_entry', 'V$$A$$E$$D', 0),
(558, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'daily_reports', 'V', 0),
(559, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'report_enrollment', 'V', 0),
(560, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'report_payroll', 'V', 0),
(561, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'report_payments', 'V', 0),
(562, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'report_attendance', 'V', 0),
(563, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'report_placement', 'V', 0),
(564, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'student_attendance', 'V', 0),
(565, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'student_tasks', 'V', 0),
(566, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'student_reports', 'V', 0),
(567, '2026-05-29 14:16:28', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'daily_report', 'V', 0),
(644, '2026-06-01 11:01:36', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'cFlxWHg1N2RYSzg5OEczMGFSTmNvaFJjU2tQdEJlZVJoR1ZLL3ZYZitzUT0=', 'course_enquiry', 'V$$A$$E$$D', 0),
(645, '2026-06-01 11:01:36', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'cFlxWHg1N2RYSzg5OEczMGFSTmNvaFJjU2tQdEJlZVJoR1ZLL3ZYZitzUT0=', 'student_attendance', 'V$$A$$E$$D', 0),
(646, '2026-06-01 11:01:36', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'cFlxWHg1N2RYSzg5OEczMGFSTmNvaFJjU2tQdEJlZVJoR1ZLL3ZYZitzUT0=', 'student_tasks', 'V$$A$$E$$D', 0),
(647, '2026-06-01 11:01:36', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'cFlxWHg1N2RYSzg5OEczMGFSTmNvaFJjU2tQdEJlZVJoR1ZLL3ZYZitzUT0=', 'student_reports', 'V$$A$$E$$D', 0),
(648, '2026-06-01 11:01:36', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'cFlxWHg1N2RYSzg5OEczMGFSTmNvaFJjU2tQdEJlZVJoR1ZLL3ZYZitzUT0=', 'daily_report', 'V$$A$$E$$D', 0),
(649, '2026-06-01 11:01:36', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'cFlxWHg1N2RYSzg5OEczMGFSTmNvaFJjU2tQdEJlZVJoR1ZLL3ZYZitzUT0=', 'course_enquiry', 'V$$A$$E$$D', 0),
(650, '2026-06-01 11:01:36', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'cFlxWHg1N2RYSzg5OEczMGFSTmNvaFJjU2tQdEJlZVJoR1ZLL3ZYZitzUT0=', 'student_attendance', 'V$$A$$E$$D', 0),
(651, '2026-06-01 11:01:36', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'cFlxWHg1N2RYSzg5OEczMGFSTmNvaFJjU2tQdEJlZVJoR1ZLL3ZYZitzUT0=', 'student_tasks', 'V$$A$$E$$D', 0),
(652, '2026-06-01 11:01:36', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'cFlxWHg1N2RYSzg5OEczMGFSTmNvaFJjU2tQdEJlZVJoR1ZLL3ZYZitzUT0=', 'student_reports', 'V$$A$$E$$D', 0),
(653, '2026-06-01 11:01:36', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'cFlxWHg1N2RYSzg5OEczMGFSTmNvaFJjU2tQdEJlZVJoR1ZLL3ZYZitzUT0=', 'daily_report', 'V$$A$$E$$D', 0),
(654, '2026-06-08 17:52:01', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RXZ5NE1pZjRlVUExSk5VUXY2TUpuYUcwOVBSMUt2NjNPZ3NWMWZSeEplZz0=', 'student_tasks', 'V', 0),
(655, '2026-06-08 17:52:01', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RXZ5NE1pZjRlVUExSk5VUXY2TUpuYUcwOVBSMUt2NjNPZ3NWMWZSeEplZz0=', 'student_reports', 'V', 0),
(656, '2026-06-08 17:52:01', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RXZ5NE1pZjRlVUExSk5VUXY2TUpuYUcwOVBSMUt2NjNPZ3NWMWZSeEplZz0=', 'daily_report', 'V$$A$$E$$D', 0),
(657, '2026-06-08 17:52:01', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'RXZ5NE1pZjRlVUExSk5VUXY2TUpuYUcwOVBSMUt2NjNPZ3NWMWZSeEplZz0=', 'student_profile', 'V$$A$$E', 0),
(658, '2026-06-08 17:52:01', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RXZ5NE1pZjRlVUExSk5VUXY2TUpuYUcwOVBSMUt2NjNPZ3NWMWZSeEplZz0=', 'student_tasks', 'V', 0),
(659, '2026-06-08 17:52:01', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RXZ5NE1pZjRlVUExSk5VUXY2TUpuYUcwOVBSMUt2NjNPZ3NWMWZSeEplZz0=', 'student_reports', 'V', 0),
(660, '2026-06-08 17:52:01', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RXZ5NE1pZjRlVUExSk5VUXY2TUpuYUcwOVBSMUt2NjNPZ3NWMWZSeEplZz0=', 'daily_report', 'V$$A$$E$$D', 0),
(661, '2026-06-08 17:52:01', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'RXZ5NE1pZjRlVUExSk5VUXY2TUpuYUcwOVBSMUt2NjNPZ3NWMWZSeEplZz0=', 'student_profile', 'V$$A$$E', 0),
(662, '2026-06-09 04:08:27', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'akFWazNXLzdDenBRNHNxK1QyRE1ubFFaRzRNWXFtbGJFL2JDSE1KbGJBOD0=', 'course', 'V$$A$$E$$D', 0),
(663, '2026-06-09 04:08:27', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'akFWazNXLzdDenBRNHNxK1QyRE1ubFFaRzRNWXFtbGJFL2JDSE1KbGJBOD0=', 'course_closure', 'V$$A$$E$$D', 0),
(664, '2026-06-09 04:08:27', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'akFWazNXLzdDenBRNHNxK1QyRE1ubFFaRzRNWXFtbGJFL2JDSE1KbGJBOD0=', 'enrollment', 'V$$A$$E$$D', 0),
(665, '2026-06-09 04:08:27', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'akFWazNXLzdDenBRNHNxK1QyRE1ubFFaRzRNWXFtbGJFL2JDSE1KbGJBOD0=', 'enrollment_internship', 'V$$A$$E$$D', 0),
(666, '2026-06-09 04:08:27', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'akFWazNXLzdDenBRNHNxK1QyRE1ubFFaRzRNWXFtbGJFL2JDSE1KbGJBOD0=', 'course_enquiry', 'V$$A$$E$$D', 0),
(667, '2026-06-09 04:08:27', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'akFWazNXLzdDenBRNHNxK1QyRE1ubFFaRzRNWXFtbGJFL2JDSE1KbGJBOD0=', 'attendance', 'V$$A$$E$$D', 0),
(668, '2026-06-09 04:08:27', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'akFWazNXLzdDenBRNHNxK1QyRE1ubFFaRzRNWXFtbGJFL2JDSE1KbGJBOD0=', 'course', 'V$$A$$E$$D', 0),
(669, '2026-06-09 04:08:27', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'akFWazNXLzdDenBRNHNxK1QyRE1ubFFaRzRNWXFtbGJFL2JDSE1KbGJBOD0=', 'course_closure', 'V$$A$$E$$D', 0),
(670, '2026-06-09 04:08:27', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'akFWazNXLzdDenBRNHNxK1QyRE1ubFFaRzRNWXFtbGJFL2JDSE1KbGJBOD0=', 'tasks', 'V$$A$$E$$D', 0),
(671, '2026-06-09 04:08:27', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'akFWazNXLzdDenBRNHNxK1QyRE1ubFFaRzRNWXFtbGJFL2JDSE1KbGJBOD0=', 'report_enrollment', 'V', 0),
(672, '2026-06-09 04:08:27', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'akFWazNXLzdDenBRNHNxK1QyRE1ubFFaRzRNWXFtbGJFL2JDSE1KbGJBOD0=', 'report_payments', 'V', 0),
(673, '2026-06-09 04:08:27', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'akFWazNXLzdDenBRNHNxK1QyRE1ubFFaRzRNWXFtbGJFL2JDSE1KbGJBOD0=', 'report_expense', 'V', 0),
(674, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'course', 'V$$A$$E$$D', 0),
(675, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'course_closure', 'V$$A$$E$$D', 0),
(676, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'tasks', 'V$$A$$E$$D', 0),
(677, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'event', 'V$$A$$E$$D', 0),
(678, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'enrollment', 'V$$A$$E$$D', 0),
(679, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'enrollment_internship', 'V$$A$$E$$D', 0),
(680, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'course_enquiry', 'V$$A$$E$$D', 0),
(681, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'attendance', 'V$$A$$E$$D', 0),
(682, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'receipt', 'V$$A$$E$$D', 0),
(683, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'expense_entry', 'V$$A$$E$$D', 0),
(684, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'daily_reports', 'V$$A$$E$$D', 0),
(685, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'report_enrollment', 'V', 0),
(686, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'report_attendance', 'V', 0),
(687, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'report_placement', 'V', 0),
(688, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'student_attendance', 'V$$A$$E$$D', 0),
(689, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'student_tasks', 'V', 0),
(690, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'student_reports', 'V', 0),
(691, '2026-06-09 05:01:33', NULL, 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'daily_report', 'V$$A$$E$$D', 0),
(692, '2026-06-09 05:01:33', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'course', 'V$$A$$E$$D', 0),
(693, '2026-06-09 05:01:33', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'course_closure', 'V$$A$$E$$D', 0),
(694, '2026-06-09 05:01:33', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'tasks', 'V$$A$$E$$D', 0),
(695, '2026-06-09 05:01:33', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'event', 'V$$A$$E$$D', 0),
(696, '2026-06-09 05:01:33', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'enrollment', 'V$$A$$E$$D', 0),
(697, '2026-06-09 05:01:33', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'enrollment_internship', 'V$$A$$E$$D', 0),
(698, '2026-06-09 05:01:33', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'course_enquiry', 'V$$A$$E$$D', 0),
(699, '2026-06-09 05:01:33', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'attendance', 'V$$A$$E$$D', 0),
(700, '2026-06-09 05:01:33', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'receipt', 'V$$A$$E$$D', 0),
(701, '2026-06-09 05:01:33', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'expense_entry', 'V$$A$$E$$D', 0),
(702, '2026-06-09 05:01:33', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'daily_reports', 'V$$A$$E$$D', 0),
(703, '2026-06-09 05:01:33', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'student_attendance', 'V$$A$$E$$D', 0),
(704, '2026-06-09 05:01:33', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'student_tasks', 'V', 0),
(705, '2026-06-09 05:01:33', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'student_reports', 'V', 0),
(706, '2026-06-09 05:01:33', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'daily_report', 'V$$A$$E$$D', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_staff`
--

CREATE TABLE `tc_staff` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `staff_id` mediumtext DEFAULT NULL,
  `staff_name` mediumtext DEFAULT NULL,
  `staff_number` mediumtext DEFAULT NULL,
  `role_id` mediumtext DEFAULT NULL,
  `course_id` mediumtext DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `username` mediumtext DEFAULT NULL,
  `password` mediumtext DEFAULT NULL,
  `address` mediumtext DEFAULT NULL,
  `role` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tc_staff`
--

INSERT INTO `tc_staff` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `staff_id`, `staff_name`, `staff_number`, `role_id`, `course_id`, `salary`, `username`, `password`, `address`, `role`, `deleted`) VALUES
(1, '2026-05-29 15:06:46', '2026-05-29 15:07:05', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'Sld0VENCNWI5cEwzck1YZ0NNNlY2bVpxSE9vU2dQRU0waENEWUJNZ3Jzbz0=', 'Manager', '9378974398', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', '', 20000.00, 'Manager', 'TGVIZFUrQmU1b3B6elN1Z1RJQnJYZz09', '', 'manager', 0),
(2, '2026-05-29 15:07:37', '2026-05-29 15:07:37', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 'Subha', '9834758648', 'cFlxWHg1N2RYSzg5OEczMGFSTmNvaFJjU2tQdEJlZVJoR1ZLL3ZYZitzUT0=', '', 20000.00, 'Subha', 'VUFGcEN5VU9tWXQwWjhKeUc5c1h0UT09', '', 'staff', 0),
(3, '2026-06-04 15:31:47', '2026-06-04 15:31:47', 'MW5INjVsRjhNVmxnUnJYN3g1NE1uY3pNSGVINW5QSnptYzRoa01tQmxtaz0=', 'cDBuYVlvZWRoRVpUQzVoZHZiREdLRDdpNjZUOEVSdDVtL3pRT21UOGljRT0=', 'srivi manager', '9834759874', 'b28yZjZ1em94cXhxcFU1ZDhtWlkxWHVqbTIydXpzeUJzMVlZd01uZzlDWT0=', 'Y0FFWHl4UmNRRzh3NFJnaHNybFliZ3djR2l2VEtLOTVRR0Nib0Qwbm9uZz0=', 10000.00, 'SriviManager', 'Wk50Y21VSlN0cWRxMjA3SmwvUmhuUT09', '', 'manager', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_student_attendance`
--

CREATE TABLE `tc_student_attendance` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `attendance_number` mediumtext DEFAULT NULL,
  `attendance_date` date DEFAULT NULL,
  `staff_id` mediumtext DEFAULT NULL,
  `student_id` mediumtext DEFAULT NULL,
  `fn_present` mediumtext DEFAULT NULL,
  `an_present` mediumtext DEFAULT NULL,
  `present_code` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tc_student_attendance`
--

INSERT INTO `tc_student_attendance` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `attendance_number`, `attendance_date`, `staff_id`, `student_id`, `fn_present`, `an_present`, `present_code`, `deleted`) VALUES
(1, '2026-05-29 15:16:03', '2026-05-29 15:16:03', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'SATT001/26-27', '2026-05-29', 'Sld0VENCNWI5cEwzck1YZ0NNNlY2bVpxSE9vU2dQRU0waENEWUJNZ3Jzbz0=', 'a1BhMmJoaVB6QmpsQ0FTT01JTDI3UT09', 'P', 'P', 'PP', 0),
(2, '2026-05-29 15:16:03', '2026-05-29 15:16:03', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'SATT001/26-27', '2026-05-29', 'Sld0VENCNWI5cEwzck1YZ0NNNlY2bVpxSE9vU2dQRU0waENEWUJNZ3Jzbz0=', 'a1V2MnhPNjY3Vm5hb1R6OXI0NmRYUT09', 'P', 'P', 'PP', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_student_reports`
--

CREATE TABLE `tc_student_reports` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `report_id` mediumtext DEFAULT NULL,
  `student_id` mediumtext DEFAULT NULL,
  `report_date` date DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `work_done` longtext DEFAULT NULL,
  `remarks` longtext DEFAULT NULL,
  `attachment` mediumtext DEFAULT NULL,
  `status` mediumtext DEFAULT 'Pending',
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tc_student_reports`
--

INSERT INTO `tc_student_reports` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `report_id`, `student_id`, `report_date`, `task_id`, `work_done`, `remarks`, `attachment`, `status`, `deleted`) VALUES
(1, '2026-06-01 10:56:49', '2026-06-01 10:56:49', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', '001/26-27', 'WGE26001', '2026-06-01', 1, 'Task completed. attachment given', '', '1780291609_react_js_complete_beginner_guide.pdf', 'Pending', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_student_tasks`
--

CREATE TABLE `tc_student_tasks` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `task_id` mediumtext DEFAULT NULL,
  `task_title` mediumtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `assigned_by` mediumtext DEFAULT NULL,
  `assigned_to_student` mediumtext DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `priority` mediumtext DEFAULT NULL,
  `status` mediumtext DEFAULT 'Pending',
  `completion_percentage` int(11) DEFAULT 0,
  `attachments` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tc_student_tasks`
--

INSERT INTO `tc_student_tasks` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `task_id`, `task_title`, `description`, `assigned_by`, `assigned_to_student`, `start_date`, `due_date`, `priority`, `status`, `completion_percentage`, `attachments`, `deleted`) VALUES
(1, '2026-06-01 10:41:44', '2026-06-01 10:41:44', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', '001/26-27', 'Array methods in Javascript', 'Exercise given regarding array methods. complete and report me within the deadline.', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 'WGE26001', '2026-06-01', '2026-06-01', 'High', 'Pending', 0, '1780290704_1779447504_6a1036d011aad_3_.doc', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_tasks`
--

CREATE TABLE `tc_tasks` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `task_id` mediumtext DEFAULT NULL,
  `title` mediumtext DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `assigned_to` mediumtext DEFAULT NULL,
  `assigned_by` mediumtext DEFAULT NULL,
  `status` mediumtext DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `custom_id` mediumtext DEFAULT NULL,
  `unique_number` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tc_tasks`
--

INSERT INTO `tc_tasks` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `task_id`, `title`, `description`, `assigned_to`, `assigned_by`, `status`, `due_date`, `custom_id`, `unique_number`, `deleted`) VALUES
(1, '2026-06-01 11:03:22', '2026-06-01 11:03:22', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', NULL, 'Need to finish', 'check', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 'bzRMRFR3OUlKWU5QMkYvUDJka2NRMFlpRW12NVhVU3hsNmQydmhuYStJUT0=', 'pending', '2026-06-01', 'YndlMjZtSGk0NGZaK2lVV1R6TmxmSmhRZVIwQzJreGZzREE4azEwb3c1MD0=', 'dFhoNmpNOFFtRzZCOE1jd0czbXJ6Zz09', 0),
(2, '2026-06-09 05:15:00', '2026-06-09 05:15:00', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', NULL, 'need to check events in live', 'sjdhfdsjkf', 'eHpzY1pWN0gyWUlOc3NTbWJYR0lGMUlCS3FnQ21vc2daMjRweWphVWpvbz0=', 'elZnUXdxQmlFK2RNcTc1MkxtQWs2OFE2V1d1V214bEsvTTc2aVZBc296ND0=', 'pending', '2026-06-09', 'dUFTTUM5NVVFeE9hbC9EWjVrTDd5Mmc0Qk1XaEFtemsrNGhwaTlsRHRrMD0=', 'QlpqekRsdE5FbDk5U0Npb0t5amQ2UT09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_task_comments`
--

CREATE TABLE `tc_task_comments` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` mediumtext DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `user_role` mediumtext DEFAULT NULL,
  `username` mediumtext DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tc_task_comments`
--

INSERT INTO `tc_task_comments` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `task_id`, `user_role`, `username`, `comment`, `deleted`) VALUES
(1, '2026-06-01 10:52:21', NULL, 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 1, 'management', 'ThavaBalan', 'Exercise  given complete it', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tc_users`
--

CREATE TABLE `tc_users` (
  `id` int(11) NOT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `company_id` mediumtext DEFAULT NULL,
  `user_id` mediumtext DEFAULT NULL,
  `username` mediumtext DEFAULT NULL,
  `password` mediumtext DEFAULT NULL,
  `role` mediumtext DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `name` mediumtext DEFAULT NULL,
  `email` mediumtext DEFAULT NULL,
  `mobile` mediumtext DEFAULT NULL,
  `custom_id` mediumtext DEFAULT NULL,
  `unique_number` mediumtext DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tc_users`
--

INSERT INTO `tc_users` (`id`, `created_date_time`, `updated_date_time`, `company_id`, `user_id`, `username`, `password`, `role`, `role_id`, `name`, `email`, `mobile`, `custom_id`, `unique_number`, `deleted`) VALUES
(1, '2026-05-28 16:04:41', '2026-05-28 16:04:41', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'elZnUXdxQmlFK2RNcTc1MkxtQWs2OFE2V1d1V214bEsvTTc2aVZBc296ND0=', 'Lakshmi', 'NENqZjNTNkhLMUZsZHhDbDZ5NFVwUT09', 'admin', NULL, 'Wegrow', NULL, '9876542310', NULL, 'U2hsSWlPUWErZzN0K084WU96RjY1Zz09', 0),
(2, '2026-05-29 17:23:04', '2026-05-29 18:20:28', 'VjF5N2FMOWEvN2MrMVAyU1J6SThORVFxZEVlMVV0cnJTTUZVY05lK211UT0=', 'OURNcjhZMEhwUGd2dWpQaWY4U09iM1VWTlRoU1ZxWWZodkpuSDFwVDVoYz0=', 'Director', 'K3N5cU9oRWx3djl0VzZSZUNxdzVjUT09', 'director', '', 'Director', NULL, '8437598494', NULL, 'enZsL24wbzZuckpuZU9qWXBEcVBVZz09', 0),
(3, '2026-05-30 17:37:05', '2026-05-30 17:37:05', NULL, 'bzRMRFR3OUlKWU5QMkYvUDJka2NRMFlpRW12NVhVU3hsNmQydmhuYStJUT0=', 'ThavaBalan', 'SDBiaEtkNUorc0xwdE9iL2J1UkMxQT09', 'management', 'RnczMnIyVWpqVEtmYkJlTUJsVU0vMS9la2hINEs1SERVQjl2YVFlY3ZDaz0=', 'ThavaBalan', NULL, '7784849494', NULL, 'Z1dsS2dPRFVUakIvVUVvTm11NmMxQT09', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tc_attendance`
--
ALTER TABLE `tc_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_company_id` (`company_id`),
  ADD KEY `idx_attendance_date` (`attendance_date`),
  ADD KEY `idx_staff_id` (`staff_id`),
  ADD KEY `idx_deleted` (`deleted`);

--
-- Indexes for table `tc_audit_logs`
--
ALTER TABLE `tc_audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_table_name` (`table_name`),
  ADD KEY `idx_record_id` (`record_id`),
  ADD KEY `idx_action_type` (`action_type`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `tc_bank`
--
ALTER TABLE `tc_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_company`
--
ALTER TABLE `tc_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_course`
--
ALTER TABLE `tc_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_course_closure`
--
ALTER TABLE `tc_course_closure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_course_enquiry`
--
ALTER TABLE `tc_course_enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_daily_reports`
--
ALTER TABLE `tc_daily_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`(100)),
  ADD KEY `idx_report_date` (`report_date`),
  ADD KEY `idx_company_id` (`company_id`(100)),
  ADD KEY `idx_deleted` (`deleted`);

--
-- Indexes for table `tc_enrollment`
--
ALTER TABLE `tc_enrollment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_company_id` (`company_id`),
  ADD KEY `idx_student_id` (`student_id`),
  ADD KEY `idx_deleted` (`deleted`),
  ADD KEY `idx_doj` (`doj`);

--
-- Indexes for table `tc_enrollment_internship`
--
ALTER TABLE `tc_enrollment_internship`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_company_id` (`company_id`(100)),
  ADD KEY `idx_student_id` (`student_id`(100)),
  ADD KEY `idx_deleted` (`deleted`),
  ADD KEY `idx_doj` (`doj`);

--
-- Indexes for table `tc_event`
--
ALTER TABLE `tc_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_expense_category`
--
ALTER TABLE `tc_expense_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_expense_entry`
--
ALTER TABLE `tc_expense_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_installments`
--
ALTER TABLE `tc_installments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_logins`
--
ALTER TABLE `tc_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_payment`
--
ALTER TABLE `tc_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_enrollment_id` (`enrollment_id`),
  ADD KEY `idx_student_id` (`student_id`),
  ADD KEY `idx_payment_date` (`payment_date`),
  ADD KEY `idx_deleted` (`deleted`);

--
-- Indexes for table `tc_payment_mode`
--
ALTER TABLE `tc_payment_mode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_payroll`
--
ALTER TABLE `tc_payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_roles`
--
ALTER TABLE `tc_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_role_permissions`
--
ALTER TABLE `tc_role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_staff`
--
ALTER TABLE `tc_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_student_attendance`
--
ALTER TABLE `tc_student_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_company_id` (`company_id`(100)),
  ADD KEY `idx_attendance_date` (`attendance_date`),
  ADD KEY `idx_deleted` (`deleted`);

--
-- Indexes for table `tc_student_reports`
--
ALTER TABLE `tc_student_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_student_tasks`
--
ALTER TABLE `tc_student_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_tasks`
--
ALTER TABLE `tc_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_task_comments`
--
ALTER TABLE `tc_task_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_users`
--
ALTER TABLE `tc_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tc_attendance`
--
ALTER TABLE `tc_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tc_audit_logs`
--
ALTER TABLE `tc_audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tc_bank`
--
ALTER TABLE `tc_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tc_company`
--
ALTER TABLE `tc_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tc_course`
--
ALTER TABLE `tc_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tc_course_closure`
--
ALTER TABLE `tc_course_closure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tc_course_enquiry`
--
ALTER TABLE `tc_course_enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tc_daily_reports`
--
ALTER TABLE `tc_daily_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tc_enrollment`
--
ALTER TABLE `tc_enrollment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tc_enrollment_internship`
--
ALTER TABLE `tc_enrollment_internship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tc_event`
--
ALTER TABLE `tc_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tc_expense_category`
--
ALTER TABLE `tc_expense_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tc_expense_entry`
--
ALTER TABLE `tc_expense_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tc_installments`
--
ALTER TABLE `tc_installments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tc_logins`
--
ALTER TABLE `tc_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `tc_payment`
--
ALTER TABLE `tc_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tc_payment_mode`
--
ALTER TABLE `tc_payment_mode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tc_payroll`
--
ALTER TABLE `tc_payroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tc_roles`
--
ALTER TABLE `tc_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tc_role_permissions`
--
ALTER TABLE `tc_role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=707;

--
-- AUTO_INCREMENT for table `tc_staff`
--
ALTER TABLE `tc_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tc_student_attendance`
--
ALTER TABLE `tc_student_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tc_student_reports`
--
ALTER TABLE `tc_student_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tc_student_tasks`
--
ALTER TABLE `tc_student_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tc_tasks`
--
ALTER TABLE `tc_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tc_task_comments`
--
ALTER TABLE `tc_task_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tc_users`
--
ALTER TABLE `tc_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
