-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 21, 2024 at 09:14 PM
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
-- Database: `coursecraft`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_courses`
--

CREATE TABLE `all_courses` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` varchar(100) NOT NULL,
  `brief_description` text NOT NULL,
  `course_code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `all_courses`
--

INSERT INTO `all_courses` (`id`, `title`, `date`, `brief_description`, `course_code`) VALUES
(1, 'AI Engineering', '2024-03-27', 'In AI Prompt Engineering, the focus is on understanding how to formulate prompts effectively to elicit the desired responses from the AI model.', 'AIA-101'),
(5, 'Python: Data Science', '2024-06-13', 'Python Data Science\" is a comprehensive course designed to equip learners with the fundamental skills and knowledge required to leverage Python for various data science tasks.', 'PYD-101'),
(6, 'Web Development', '2025-03-21', 'This course provides a comprehensive introduction to web development, covering both front-end and back-end technologies.', 'WD-101'),
(7, 'Machine Learning Fundamentals', '2024-03-30', 'This course offers a foundational understanding of machine learning concepts and techniques. ', 'ML-101'),
(8, 'Python: Django Rest API', '2024-03-30', 'Explore the world of RESTful web services with Django, a high-level Python web framework. ', 'PYD-201'),
(9, 'AI SFT Learning', '2024-03-30', 'SFT\" stands for \"Supervised Fine-Tuning.\" In the context of machine learning and artificial intelligence, fine-tuning refers to the process of taking a pre-trained model and further training it on a specific task or dataset to improve its performance on that task.', 'AIA-201'),
(10, 'Prompt Engineering', '2024-03-29', 'Prompt Engineering offers a comprehensive exploration into the principles and practices of engineering, equipping students with the knowledge and skills to tackle real-world challenges with innovation and precision.', 'PE-101'),
(11, 'AI prompt ', '2024-03-29', 'ewjfljeslk; fjk;sadjflsjlaf', 'AIA-101');

-- --------------------------------------------------------

--
-- Table structure for table `already_course_offering_teacher`
--

CREATE TABLE `already_course_offering_teacher` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `teacher_name` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `already_course_offering_teacher`
--

INSERT INTO `already_course_offering_teacher` (`id`, `course_id`, `teacher_id`, `teacher_name`, `course_name`) VALUES
(1, 5, 3, 'Gareth Keenan', 'Python: Data Science'),
(2, 1, 3, 'Gareth Keenan', 'AI Engineering'),
(3, 1, 5, 'Devid Brant', 'AI Engineering'),
(4, 1, 6, 'Alice Johnson', 'AI Engineering'),
(5, 5, 8, 'Emma Davis', 'Python: Data Science'),
(6, 5, 5, 'Devid Brant', 'Python: Data Science'),
(7, 5, 12, 'Nadia Islam', 'Python: Data Science'),
(8, 5, 10, 'Ayesha Rahman', 'Python: Data Science'),
(9, 6, 12, 'Nadia Islam', 'Web Development'),
(10, 6, 20, 'Mehnaz Begum', 'Web Development'),
(11, 6, 3, 'Gareth Keenan', 'Web Development'),
(12, 6, 20, 'Mehnaz Begum', 'Web Development'),
(13, 6, 59, 'Sumaiya Akhter', 'Web Development'),
(14, 10, 6, 'Alice Johnson', 'Prompt Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_student`
--

CREATE TABLE `enrolled_student` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `teacher_name` varchar(255) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `student_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrolled_student`
--

INSERT INTO `enrolled_student` (`id`, `course_id`, `course_name`, `course_code`, `teacher_id`, `teacher_name`, `student_id`, `student_name`) VALUES
(1, 5, 'Python: Data Science', 'PYD-101', 3, 'Gareth Keenan', 4, 'Jim Carrey'),
(2, 5, 'Python: Data Science', 'PYD-101', 3, 'Gareth Keenan', 65, 'Micheal Scarn'),
(3, 1, 'AI Engineering', 'AIA-101', 6, 'Alice Johnson', 65, 'Micheal Scarn'),
(4, 6, 'Web Development', 'WD-101', 12, 'Nadia Islam', 65, 'Micheal Scarn'),
(5, 5, 'Python: Data Science', 'PYD-101', 3, 'Gareth Keenan', 23, 'Aisha Rahman'),
(6, 6, 'Web Development', 'WD-101', 12, 'Nadia Islam', 23, 'Aisha Rahman'),
(7, 5, 'Python: Data Science', 'PYD-101', 3, 'Gareth Keenan', 24, 'Rafiqul Islam'),
(8, 6, 'Web Development', 'WD-101', 3, 'Gareth Keenan', 25, 'Tahmina Begum'),
(9, 1, 'AI Engineering', 'AIA-101', 3, 'Gareth Keenan', 25, 'Tahmina Begum'),
(10, 5, 'Python: Data Science', 'PYD-101', 3, 'Gareth Keenan', 30, 'Shakil Ahmed'),
(11, 5, 'Python: Data Science', 'PYD-101', 3, 'Gareth Keenan', 41, 'Shuvo Ahmed'),
(12, 1, 'AI Engineering', 'AIA-101', 3, 'Gareth Keenan', 41, 'Shuvo Ahmed'),
(13, 6, 'Web Development', 'WD-101', 3, 'Gareth Keenan', 41, 'Shuvo Ahmed'),
(14, 6, 'Web Development', 'WD-101', 20, 'Mehnaz Begum', 65, 'Micheal Scarn'),
(15, 1, 'AI Engineering', 'AIA-101', 6, 'Alice Johnson', 65, 'Micheal Scarn'),
(16, 5, 'Python: Data Science', 'PYD-101', 5, 'Devid Brant', 65, 'Micheal Scarn'),
(17, 6, 'Web Development', 'WD-101', 20, 'Mehnaz Begum', 65, 'Micheal Scarn');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `username`, `name`, `usertype`, `password`) VALUES
(1, 'ArfatulAsif', 'ArfatulAsif', 'admin', 'arfatulasif'),
(3, 'Gareth12', 'Gareth Keenan', 'Teacher', 'gareth12'),
(4, 'Jim12', 'Jim Carrey', 'Student', 'jim12'),
(5, 'Devid12', 'Devid Brant', 'Teacher', '12'),
(6, 'Alice34', 'Alice Johnson', 'Teacher', '12'),
(7, 'Bob56', 'Bob Smith', 'Teacher', '12'),
(8, 'Emma78', 'Emma Davis', 'Teacher', '12'),
(9, 'Farhan12', 'Farhan Ahmed', 'Teacher', '12'),
(10, 'Ayesha34', 'Ayesha Rahman', 'Teacher', '12'),
(11, 'Tanjim56', 'Tanjim Khan', 'Teacher', '12'),
(12, 'Nadia78', 'Nadia Islam', 'Teacher', '12'),
(13, 'Reza90', 'Reza Chowdhury', 'Teacher', '12'),
(14, 'Riya23', 'Riya Akhtar', 'Teacher', '12'),
(15, 'Samiul45', 'Samiul Hassan', 'Teacher', '12'),
(16, 'Fariha67', 'Fariha Hossain', 'Teacher', '12'),
(17, 'Imran89', 'Imran Ali', 'Teacher', '12'),
(18, 'Nusrat11', 'Nusrat Jahan', 'Teacher', '12'),
(19, 'Arif22', 'Arif Ahmed', 'Teacher', '12'),
(20, 'Mehnaz33', 'Mehnaz Begum', 'Teacher', '12'),
(21, 'Sadia12', 'Sadia Akter', 'Student', '13'),
(22, 'Rakib34', 'Rakib Hasan', 'Student', '13'),
(23, 'Aisha56', 'Aisha Rahman', 'Student', '13'),
(24, 'Rafiq78', 'Rafiqul Islam', 'Student', '13'),
(25, 'Tahmina90', 'Tahmina Begum', 'Student', '13'),
(26, 'Arman23', 'Arman Hossain', 'Student', '13'),
(27, 'Nusrat45', 'Nusrat Jahan', 'Student', '13'),
(28, 'Sumon67', 'Sumon Ahmed', 'Student', '13'),
(29, 'Nadia89', 'Nadia Akhter', 'Student', '13'),
(30, 'Shakil11', 'Shakil Ahmed', 'Student', '13'),
(31, 'Faria22', 'Faria Rahman', 'Student', '13'),
(32, 'Samiul33', 'Samiul Haque', 'Student', '13'),
(33, 'Tamanna44', 'Tamanna Rahman', 'Student', '13'),
(34, 'Rahim66', 'Rahim Mia', 'Student', '13'),
(35, 'Sabrina88', 'Sabrina Khan', 'Student', '13'),
(36, 'Imran10', 'Imran Hossain', 'Student', '13'),
(37, 'Jannat23', 'Jannatul Ferdous', 'Student', '13'),
(38, 'Munir45', 'Munir Hasan', 'Student', '13'),
(39, 'Ayesha67', 'Ayesha Begum', 'Student', '13'),
(40, 'Shakila89', 'Shakila Akhter', 'Student', '13'),
(41, 'Shuvo11', 'Shuvo Ahmed', 'Student', '13'),
(42, 'Nadia22', 'Nadia Rahman', 'Student', '13'),
(43, 'Farid33', 'Farid Islam', 'Student', '13'),
(44, 'Tithi44', 'Tithi Akhter', 'Student', '13'),
(45, 'Sajjad55', 'Sajjad Hossain', 'Student', '13'),
(46, 'Ruma66', 'Ruma Begum', 'Student', '13'),
(47, 'Asif77', 'Asif Khan', 'Student', '13'),
(48, 'Sumi88', 'Sumi Akhter', 'Student', '13'),
(49, 'Imtiaz99', 'Imtiaz Ahmed', 'Student', '13'),
(50, 'Rumi12', 'Rumi Begum', 'Student', '13'),
(51, 'Fahim34', 'Fahim Rahman', 'Student', '13'),
(52, 'Tania56', 'Tania Akhter', 'Student', '13'),
(53, 'Nazia44', 'Nazia Islam', 'Teacher', '12'),
(54, 'Rahim66', 'Rahim Hossain', 'Teacher', '12'),
(55, 'Shaila88', 'Shaila Khan', 'Teacher', '12'),
(56, 'Jamil10', 'Jamil Rahman', 'Teacher', '12'),
(57, 'Ayesha22', 'Ayesha Begum', 'Teacher', '12'),
(58, 'Shakil33', 'Shakil Ahmed', 'Teacher', '12'),
(59, 'Sumaiya45', 'Sumaiya Akhter', 'Teacher', '12'),
(60, 'Farid67', 'Farid Khan', 'Teacher', '12'),
(61, 'Tasnim89', 'Tasnim Hossain', 'Teacher', '12'),
(62, 'Rehana11', 'Rehana Ali', 'Teacher', '12'),
(63, 'Rashid23', 'Rashid Ahmed', 'Teacher', '12'),
(64, 'Fahmida34', 'Fahmida Rahman', 'Teacher', '12'),
(65, 'student1', 'Micheal Scarn', 'Student', 'student1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_courses`
--
ALTER TABLE `all_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `already_course_offering_teacher`
--
ALTER TABLE `already_course_offering_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `enrolled_student`
--
ALTER TABLE `enrolled_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `all_courses`
--
ALTER TABLE `all_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `already_course_offering_teacher`
--
ALTER TABLE `already_course_offering_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `enrolled_student`
--
ALTER TABLE `enrolled_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `already_course_offering_teacher`
--
ALTER TABLE `already_course_offering_teacher`
  ADD CONSTRAINT `already_course_offering_teacher_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `all_courses` (`id`),
  ADD CONSTRAINT `already_course_offering_teacher_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `registration` (`id`);

--
-- Constraints for table `enrolled_student`
--
ALTER TABLE `enrolled_student`
  ADD CONSTRAINT `enrolled_student_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `all_courses` (`id`),
  ADD CONSTRAINT `enrolled_student_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `registration` (`id`),
  ADD CONSTRAINT `enrolled_student_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `registration` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
