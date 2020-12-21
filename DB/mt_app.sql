-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2020 at 09:24 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mt_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `name` varchar(500) NOT NULL,
  `school` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `school`) VALUES
(2, 'nunu@gmail.com', '$2y$10$uYJREOjTGBFRk4zj7B9KTOkWzmKGMKzR5/XYWmIdoSA62sQ.cWJS.', 'Nunu', 'UINAM'),
(3, 'Caca@gmail.com', '$2y$10$ylp1YaA76C1ZyagkpRfvE.kq8CWG5It7ymH2V5e8XF24RK6qQnBLC', 'Caca', 'SD'),
(4, 'saya@gmail.com', '$2y$10$LKPmyDuTlT1RYWdjQo9gF.WZ298TEwQevgHbD/urQf23zg.7.kVc.', 'saya', 'afila'),
(5, 'bisa@gmail.com', '$2y$10$OWwoYMktM4plTZ8VGv9/2eHuyD47TQe68daltysf1DEdsVK9.mS.m', 'saya', 'UIN'),
(6, 'rum@gmail.com', '$2y$10$glyg8Y..9V5HlgPwyiVszecDzB41pJqngfazcsa8jnD.fvF7Q58Ry', 'rum', 'UIN');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
