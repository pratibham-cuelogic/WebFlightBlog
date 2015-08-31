-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 31, 2015 at 09:22 PM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `webflight_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogPosts`
--

CREATE TABLE IF NOT EXISTS `blogPosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id for post',
  `content` text NOT NULL COMMENT 'content of the post',
  `isPublish` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'post is published or not',
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'post is deleted or not',
  `postedBy` int(11) NOT NULL COMMENT 'posted by which user',
  `postedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'posted at what time',
  `updatedBy` int(11) NOT NULL COMMENT 'updated by which user',
  `updatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'updated at what time',
  PRIMARY KEY (`id`),
  KEY `postedBy` (`postedBy`,`updatedBy`),
  KEY `FKey_UpdatedBy_User_Id` (`updatedBy`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Blog post contents and its related data' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `blogPosts`
--

INSERT INTO `blogPosts` (`id`, `content`, `isPublish`, `isDeleted`, `postedBy`, `postedOn`, `updatedBy`, `updatedOn`) VALUES
(1, 'The Wall will Fall one day.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 1, 0, 1, '2015-08-31 12:22:48', 1, '2015-08-30 18:30:00'),
(2, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.\r\n', 1, 0, 1, '2015-08-31 12:32:03', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `postedBy` int(11) NOT NULL,
  `postedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `postedBy` (`postedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id for users',
  `firstName` varchar(40) NOT NULL COMMENT 'FirstName of the User',
  `lastName` varchar(40) NOT NULL COMMENT 'LastName of the User',
  `emailAddress` varchar(60) NOT NULL COMMENT 'Email Address of the user',
  `isEditor` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checks whether the user is editor or guest.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `emailAddress` (`emailAddress`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Storing data of guest and editor for the blog' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `emailAddress`, `isEditor`) VALUES
(1, 'John', 'Snow', 'john@snow.lcl', 1),
(2, 'Mathew', 'Perry', 'mathew@perry.lcl', 0),
(3, 'Flemin', 'Louis', 'flemin@louis.lcl', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogPosts`
--
ALTER TABLE `blogPosts`
  ADD CONSTRAINT `FKey_UpdatedBy_User_Id` FOREIGN KEY (`updatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKey_User_Id` FOREIGN KEY (`postedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `Fkey_comment_user_id` FOREIGN KEY (`postedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
