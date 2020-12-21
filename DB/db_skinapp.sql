-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2020 at 01:14 PM
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
-- Database: `db_skinapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_card`
--

CREATE TABLE `tb_card` (
  `id_crprod` int(11) NOT NULL,
  `nm_crprod` varchar(100) NOT NULL,
  `size_crprod` varchar(50) NOT NULL,
  `quantity_crprod` varchar(50) NOT NULL,
  `hrg_crprod` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_myorderpage`
--

CREATE TABLE `tb_myorderpage` (
  `id_order` int(11) NOT NULL,
  `alm_order` varchar(100) NOT NULL,
  `gb_order` varchar(50) NOT NULL,
  `color_order` varchar(50) NOT NULL,
  `size_order` int(50) NOT NULL,
  `quantity_order` varchar(50) NOT NULL,
  `hrga_order` varchar(100) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `order_time` datetime NOT NULL,
  `order_payment` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_prod`
--

CREATE TABLE `tb_prod` (
  `id_prod` int(11) NOT NULL,
  `nm_prod` varchar(50) NOT NULL,
  `detail_prod` text NOT NULL,
  `hrg_prod` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_profdok`
--

CREATE TABLE `tb_profdok` (
  `id_dok` int(11) NOT NULL,
  `nm_dok` varchar(100) NOT NULL,
  `spes_dok` varchar(100) NOT NULL,
  `klinik_dok` varchar(100) NOT NULL,
  `nope_dok` int(20) NOT NULL,
  `about_dok` text NOT NULL,
  `schedule_dok` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `passagain` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kodepos` varchar(50) NOT NULL,
  `nope` int(50) NOT NULL,
  `kota` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_card`
--
ALTER TABLE `tb_card`
  ADD PRIMARY KEY (`id_crprod`);

--
-- Indexes for table `tb_myorderpage`
--
ALTER TABLE `tb_myorderpage`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `tb_prod`
--
ALTER TABLE `tb_prod`
  ADD PRIMARY KEY (`id_prod`);

--
-- Indexes for table `tb_profdok`
--
ALTER TABLE `tb_profdok`
  ADD PRIMARY KEY (`id_dok`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_card`
--
ALTER TABLE `tb_card`
  MODIFY `id_crprod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_myorderpage`
--
ALTER TABLE `tb_myorderpage`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_prod`
--
ALTER TABLE `tb_prod`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_profdok`
--
ALTER TABLE `tb_profdok`
  MODIFY `id_dok` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
