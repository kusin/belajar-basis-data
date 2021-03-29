-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2020 at 07:47 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sma6`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` int(10) NOT NULL,
  `nisn` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kelas_pengaturan`
--

CREATE TABLE `tb_kelas_pengaturan` (
  `id_kelas` int(10) NOT NULL,
  `jenjang_kelas` varchar(100) DEFAULT NULL,
  `nama_kelas` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kelas_pengaturan`
--

INSERT INTO `tb_kelas_pengaturan` (`id_kelas`, `jenjang_kelas`, `nama_kelas`, `status`) VALUES
(1, 'X', 'X-1', 'Aktif'),
(2, 'X', 'X-2', 'Aktif'),
(3, 'X', 'X-3', 'Aktif'),
(4, 'X', 'X-4', 'Aktif'),
(5, 'X', 'X-5', 'Aktif'),
(6, 'X', 'X-6', 'Aktif'),
(7, 'X', 'X-7', 'Aktif'),
(8, 'X', 'X-8', 'Aktif'),
(9, 'X', 'X-9', 'Aktif'),
(10, 'X', 'X-10', 'Aktif'),
(11, 'XI', 'XI-IPA-1', 'Aktif'),
(12, 'XI', 'XI-IPA-2', 'Aktif'),
(13, 'XI', 'XI-IPA-3', 'Aktif'),
(14, 'XI', 'XI-IPA-4', 'Aktif'),
(15, 'XI', 'XI-IPA-5', 'Aktif'),
(16, 'XI', 'XI-IPS-1', 'Aktif'),
(17, 'XI', 'XI-IPS-2', 'Aktif'),
(18, 'XI', 'XI-IPS-3', 'Aktif'),
(19, 'XI', 'XI-IPS-4', 'Aktif'),
(20, 'XI', 'XI-IPS-5', 'Aktif'),
(21, 'XII', 'XII-IPA-1', 'Aktif'),
(22, 'XII', 'XII-IPA-2', 'Aktif'),
(23, 'XII', 'XII-IPA-3', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `nisn` varchar(100) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jns_kelamin` varchar(100) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` varchar(100) DEFAULT NULL,
  `agama` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `telp_rumah` varchar(100) DEFAULT NULL,
  `berat_badan` varchar(100) DEFAULT NULL,
  `tinggi_badan` varchar(100) DEFAULT NULL,
  `golongan_darah` varchar(100) DEFAULT NULL,
  `anak_status` varchar(100) DEFAULT NULL,
  `anak_ke` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `create_add` datetime DEFAULT NULL,
  `create_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_siswa`
--

INSERT INTO `tb_siswa` (`nisn`, `nama`, `jns_kelamin`, `tempat_lahir`, `tanggal_lahir`, `agama`, `alamat`, `telp_rumah`, `berat_badan`, `tinggi_badan`, `golongan_darah`, `anak_status`, `anak_ke`, `status`, `create_add`, `create_update`) VALUES
('11140910000101', 'Aryajaya Alamsyah', 'Laki-Laki', 'Jakarta', '1995-10-12', 'Islam', 'Jl. Pipit 3 No 146, Depok Jaya, Pancoran mas', '021-775-7844', '60', '170', 'A', 'Kandung', '1', 'Siswa Alumni', NULL, NULL),
('11140910000102', 'Ahmad Bilal', 'Laki-Laki', 'Jakarta', '2017-06-12', 'Islam', 'Pondok Cabe', '021-7757846', '65', '178', 'O', 'Kandung', '1', 'Siswa Aktif', '2017-06-12 17:37:15', '2017-06-12 17:38:02'),
('11140910000103', 'Nurhayati, Ph.D', 'Perempuan', 'Padang', '1969-01-01', 'Islam', 'Tanah Kusir', '021-775-0001', '40', '150', 'AB', 'Kandung', '1', 'Siswa Alumni', NULL, NULL),
('11140910000104', 'Imam Shofi', 'Laki-Laki', 'Semarang', '19972-12-01', 'Islam', 'Ciputat Raya', '081210012002', '65', '175', 'AB', 'Kandung', '7', 'Siswa Alumni', NULL, NULL),
('11140910000105', 'Sri Sumarni, SE', 'Perempuan', 'Surakarta', '1969-01-01', 'Islam', 'Jl. Pipit 3 No 146', '021-775-7844', '60', '160', 'O', 'Kandung', '4', 'Siswa Alumni', NULL, NULL),
('1234567890-', 'lalalal', 'Laki-Laki', 'ertyui', '2018-12-04', 'Kristen', 'asdfghjkl', 'asdfghjkl', '4545', '5454', 'A', 'Kandung', '5', 'Siswa Alumni', '2018-12-11 14:19:05', '2018-12-11 14:19:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id_kelas`,`nisn`);

--
-- Indexes for table `tb_kelas_pengaturan`
--
ALTER TABLE `tb_kelas_pengaturan`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`nisn`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_kelas_pengaturan`
--
ALTER TABLE `tb_kelas_pengaturan`
  MODIFY `id_kelas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
