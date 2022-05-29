-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2022 at 05:59 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `website_sman9medan`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `JkSiswaPerKelas` (`id_kls` INT) RETURNS INT(11) BEGIN
	DECLARE totalLakiLaki INT;
	
	SELECT COUNT(tbl_siswas.jk_siswa) INTO totalLakiLaki
	FROM tbl_siswas
	INNER JOIN tbl_kelas ON tbl_kelas.id = tbl_siswas.id_kelas
	WHERE tbl_siswas.id_kelas = id_kls AND tbl_siswas.jk_siswa = "L";
	RETURN totalLakiLaki;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `JkSiswiPerKelas` (`id_kls` INT) RETURNS INT(11) BEGIN
	DECLARE totalPerempuan INT;
	
	SELECT COUNT(tbl_siswas.jk_siswa) INTO totalPerempuan
	FROM tbl_siswas
	INNER JOIN tbl_kelas ON tbl_kelas.id = tbl_siswas.id_kelas
	WHERE tbl_siswas.id_kelas = id_kls AND tbl_siswas.jk_siswa = "P";
	RETURN totalPerempuan;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `siswaPerKelas` (`id_kls` INT) RETURNS INT(11) BEGIN
	DECLARE totalSiswa INT;	
	
	SELECT COUNT(tbl_siswas.id_kelas) INTO totalSiswa
	FROM tbl_siswas
	INNER JOIN tbl_kelas ON tbl_kelas.id = tbl_siswas.id_kelas
	WHERE tbl_siswas.id_kelas = id_kls;
	RETURN totalSiswa;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `data_guru`
-- (See below for the actual view)
--
CREATE TABLE `data_guru` (
`NIP` bigint(20)
,`nama_guru` text
,`bidang_studi` text
,`wali_kelas` text
,`gol_guru` text
,`ket_guru` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `data_siswa`
-- (See below for the actual view)
--
CREATE TABLE `data_siswa` (
`NIS` bigint(20)
,`nama_siswa` text
,`jk_siswa` enum('L','P')
,`agama_siswa` enum('Islam','Kristen','Hindu','Buddha')
,`kelas` text
);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(19, '2014_10_12_000000_create_users_table', 1),
(20, '2014_10_12_100000_create_password_resets_table', 1),
(21, '2019_08_19_000000_create_failed_jobs_table', 1),
(22, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(23, '2022_05_18_054435_create_tbl_bidang_studis_table', 1),
(24, '2022_05_18_054737_create_tbl_gurus_table', 1),
(25, '2022_05_18_060640_create_tbl_kelas_table', 1),
(26, '2022_05_18_062331_create_tbl_siswas_table', 1),
(27, '2022_05_18_063112_create_tbl_pegawais_table', 1),
(28, '2022_05_18_063430_create_tbl_fasilitas_table', 1),
(29, '2022_05_18_063846_create_tbl_beritas_table', 1),
(30, '2022_05_18_071328_create_tbl_prestasis_table', 1),
(31, '2022_05_18_071614_create_tbl_eskuls_table', 1),
(32, '2022_05_18_071859_create_tbl_oses_table', 1),
(33, '2022_05_18_073053_create_tbl_akuns_table', 2),
(34, '2022_05_18_074005_create_tbl_kalenders_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_beritas`
--

CREATE TABLE `tbl_beritas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul_berita` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_berita` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bidang_studis`
--

CREATE TABLE `tbl_bidang_studis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_bidangStudi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_bidang_studis`
--

INSERT INTO `tbl_bidang_studis` (`id`, `nama_bidangStudi`, `created_at`, `updated_at`) VALUES
(1, 'Pendidikan Agama', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'PKN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Bahasa Indonesia', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Bahasa Inggris', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Sejarah', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Sosiologi', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Ekonomi/Akuntansi', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Geografi', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Penjaskes', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Seni Budaya', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Matematika', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Bahasa Jerman', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Biologi', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Fisika', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Kimia', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'BP/BK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Prakarya/Kewirausahaan', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Piket/Pustakawan', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_eskuls`
--

CREATE TABLE `tbl_eskuls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_eskul` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_eskul` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fasilitas`
--

CREATE TABLE `tbl_fasilitas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_fasilitas` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_pegawai` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gurus`
--

CREATE TABLE `tbl_gurus` (
  `NIP` bigint(20) NOT NULL,
  `nama_guru` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_bidangStudi` bigint(20) UNSIGNED DEFAULT NULL,
  `gol_guru` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_guru` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_guru` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_gurus`
--

INSERT INTO `tbl_gurus` (`NIP`, `nama_guru`, `id_bidangStudi`, `gol_guru`, `ket_guru`, `foto_guru`, `created_at`, `updated_at`) VALUES
(196204211989031008, 'Drs. Darma Karyadi Sibuea', 3, 'IV/a', 'PNS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196207041999031004, 'Joter Tondang, S.PdK ', 1, 'IV/a', 'PNS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196208071987032005, 'Lailum Barida', 5, 'IV/a', 'PNS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196210051986012001, 'Rosmalia, S.Pd', 5, 'IV/b', 'PNS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196409292000032001, 'Ernita Simatupang', 1, 'IV/a', 'PNS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197002082007012003, 'Elva Rosa, S.Pd', 2, 'III/b', 'PNS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197608282010012006, 'Endang Purwosutanti, S.Pd', 2, 'III/b', 'PNS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197804092008041002, 'Arifuddin, S.PdI', 1, 'III/d', 'PNS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198203042010011016, 'Jusup Sitepu, S.Pd', 4, 'III/c', 'PNS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198208262014112001, 'Mery Gusti Avelin Simanjuntak, S.Pd', 4, 'III/b', 'PNS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wali_kelas` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`id`, `nama`, `wali_kelas`, `created_at`, `updated_at`) VALUES
(1, 'X MIPA-1', 196204211989031008, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'X MIPA-2', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'X MIPA-3', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'X MIPA-4', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'X IPS-1', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'X IPS-2', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'X IPS-3', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'XI MIPA-1', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'XI MIPA-2', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'XI MIPA-3', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'XI MIPA-4', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'XI MIPA-5', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'XI MIPA-6', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'XI IPS-1', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'XI IPS-2', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'XI IPS-3', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'XII MIPA-1', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'XII MIPA-2', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'XII MIPA-3', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'XII MIPA-4', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'XII IPS-1', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'XII IPS-2', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'XII IPS-3', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_osis`
--

CREATE TABLE `tbl_osis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `periode` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_osis` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pegawais`
--

CREATE TABLE `tbl_pegawais` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_pegawai` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_pegawai` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prestasis`
--

CREATE TABLE `tbl_prestasis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul_prestasi` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_siswas`
--

CREATE TABLE `tbl_siswas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `NIS` bigint(20) NOT NULL,
  `NISN` bigint(20) UNSIGNED DEFAULT NULL,
  `nama_siswa` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jk_siswa` enum('L','P') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agama_siswa` enum('Islam','Kristen','Hindu','Buddha') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_siswa` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_kelas` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_siswas`
--

INSERT INTO `tbl_siswas` (`id`, `NIS`, `NISN`, `nama_siswa`, `jk_siswa`, `agama_siswa`, `ket_siswa`, `id_kelas`, `created_at`, `updated_at`) VALUES
(256, 13519, 47549572, 'AMELIA DIAN LARASATI', 'P', 'Islam', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 13521, 51341680, 'Andhika Wira Yudha', 'L', 'Islam', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 13522, 54426536, 'ANDREW PRAWIRA TINAMBUNAN', 'L', 'Kristen', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 13523, 50893400, 'ANDRIANO JOSUA TARIGAN', 'L', '', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 13524, 69707039, 'AQILAH DEFIYANTI', 'P', 'Islam', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 13525, 55982798, 'ARIEL ALEXANDRIA TAMPUBOLON', 'L', 'Kristen', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 13527, 45890569, 'BAGAS ASHARI DAULAY', 'L', 'Islam', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 13528, 50893363, 'CHRISTIAN RAHMAT SIBORO', 'L', 'Kristen', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 13529, 67298856, 'DANIEL MARTOGI SIMATUPANG', 'L', 'Kristen', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 13530, 53673044, 'ESTER OKTAFIA ZAI', 'P', 'Kristen', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 13531, 50893375, 'GABRIEL F STEVANUS SIHOMBING', 'L', 'Kristen', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 13532, 52165215, 'GILBERT EPHANT SITOHANG', 'L', 'Kristen', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 13533, 51894457, 'GITA SUCI ANDINI', 'P', 'Islam', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 13535, 59486324, 'Hertorida .A. Aritonang', 'P', 'Kristen', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 13536, 60035263, 'IBNU ABDAN SAFII', 'L', 'Islam', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 13537, 52494722, 'INDAH SYAFITRI', 'P', 'Islam', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 13538, 43879824, 'JAHIA BERTON EDGAR SIBARANI', 'L', 'Kristen', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 13540, 50812662, 'KENYA ASTRI NABILLA', 'P', 'Islam', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 13541, 50893367, 'LEO BINSAR HARA TUA SIRINGO-RINGO', 'L', '', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 13542, 60035649, 'Maqdalene W J Br Pakpahan', 'P', 'Kristen', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 13543, 62085390, 'MHD FADELAN', 'L', 'Islam', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 13546, 53014931, 'MUHAMMAD RIZALDI', 'L', 'Islam', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 13547, 50614528, 'MUTHIAH ALIFAH', 'P', 'Islam', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 13548, 51673465, 'Nabila', 'P', 'Islam', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 13549, 51825307, 'NURUL', 'P', 'Islam', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 13550, 56074011, 'PODA THEO HAMONANGAN PERANGIN ANGIN', 'L', 'Kristen', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 13551, 53073085, 'ROSALINDA FORTUNA SILITONGA', 'P', 'Kristen', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 13552, 53433449, 'Sabrina Sitompul', 'P', 'Kristen', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 13553, 44854038, 'YUDA YUSTICIA KARO-KARO', 'L', 'Kristen', NULL, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 13554, 69760136, 'ABED NEGO NAPITUPULU', 'L', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 13555, 46164135, 'ADARANNA NATALIA DESSABWA SIREGAR', 'P', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 13556, 55335513, 'ADEL NATHASYA SITANGGANG', 'P', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 13557, 55864093, 'Adelia Putri Mamahit', 'P', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 13558, 51508066, 'ADINA HUSNA JP HARAHAP', 'P', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 13559, 55897787, 'AHMAD HERU GINTING', 'L', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 13560, 53430680, 'AINARO ANDRIO MANIHURUK', 'L', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 13561, 51496326, 'ALFINA NUR', 'P', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 13562, 58603672, 'alivia sahputri', 'P', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 13563, 53865832, 'AMANDA RIZKI AGUSTINA', 'P', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 13564, 51416278, 'Anggi Sandriani Br Harahap', 'P', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 13565, 69379501, 'APRIANI BR SIPAHUTAR', 'P', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 13566, 68996166, 'APRIANTI BR SIPAHUTAR', 'P', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 13567, 50817715, 'ARIEF CAHAYANDA', 'L', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 13568, 56876998, 'ARINA ULFA HASANAH HASIBUAN', 'P', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 13569, 59355144, 'ASRIANTI PRATIWI', 'P', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 13570, 62431817, 'BERLLY RIDHOI SIAHAAN', 'P', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 13571, 53424133, 'BINTAN ZAHARA', 'P', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 13572, 53179557, 'CEVIN RAFAEL MARPAUNG', 'L', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 13573, 55563611, 'DIANA AGATHA NAINGGOLAN', 'P', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 13574, 54968891, 'FADLAN KHAIRI', 'L', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 13577, 43992129, 'GILBERT ATTILA JOSHUA S', 'L', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 13578, 61676783, 'Ian Cristian Tarigan', 'L', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 13579, 42952023, 'IMELDA PUTRI NDRAHA', 'P', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 13580, 50893374, 'JOSUA DIO LAURENSIUS SIHOMBING', 'L', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 13581, 46813945, 'KEVIN SIMANJUNTAK', 'L', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 13582, 3057848174, 'May Zahara Safriani', 'P', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 13583, 56138981, 'MHD UMAR', 'L', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 13584, 54531828, 'Nanda Maulana Hsb', 'L', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 13585, 52751517, 'NOVIA CHRISTY NABABAN', 'P', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 13586, 67111122, 'NURUL RAHMADHANI NURFIK', 'P', 'Islam', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 13587, 46933049, 'Only Erlayasi Siahaan', 'P', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 13588, 47042475, 'SAMUEL FRANS YENRIKO', 'L', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 13589, 57489206, 'YUDISTIRA IYAN FRANCISKUS SINAGA', 'L', 'Kristen', NULL, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 13590, 56748696, 'AMELIA FEDORA HASIBUAN', 'P', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 13591, 50893404, 'ANDRE SINURAT', 'L', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 13592, 53620362, 'AURELIA DESI MALAU', 'P', '', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 13593, 53179543, 'AYU  WULANDARI', 'P', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 13594, 54663739, 'BAYU LESMANA', 'L', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 13595, 9013528151, 'CHARENSIA KRISTIANI NAPITUPULU', 'P', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, 13596, 56008595, 'CRICIA GITA ULINA BR SIMANJUNTAK', 'P', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 13598, 46772902, 'DANIEL SOLIN', 'L', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 13599, 28312833, 'Darti Perawati Tamba', 'P', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 13600, 57393531, 'DAUD YOGI LUBIS', 'L', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 13601, 50493957, 'DAVID PANJAITAN', 'L', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, 13602, 55466653, 'DELLA TRY ANGGRAINI', 'P', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, 13603, 47131910, 'DEO GILANG RAMADAN', 'L', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, 13604, 56191298, 'DESI NATALIA Br SIMBOLON', 'P', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, 13605, 56749537, 'DEWI ARTHA DINATA SAMOSIR', 'P', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, 13606, 60035652, 'DIKA RAHEL AVRILIA SITUMEANG', 'P', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, 13607, 52287532, 'DIMAS ANDREAN', 'L', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, 13608, 69076106, 'DIMAS ANDREAS SIMBOLON', 'L', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, 13609, 53492574, 'DIMAS HUTABARAT', 'L', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, 13610, 75247809, 'DIPA MARGARETHA OKTAVIA PARAPAT', 'P', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, 13611, 59347819, 'DITA DWI PURWANTI', 'P', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, 13612, 54881541, 'Dwi Syahfitri', 'P', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, 13613, 54743445, 'ELSADHAI BR SIMBOLON', 'P', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, 13614, 62545617, 'ERIKA SIMANJUNTAK', 'P', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, 13615, 51160332, 'FADYA RAHMAH', 'P', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, 13616, 55343388, 'FAIZ FADIHILLAH', 'L', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, 13617, 68143207, 'FAUZI BINTARA JUNAIDI', 'L', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, 13618, 64321699, 'Febry Fahrezy', 'L', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, 13619, 47020545, 'GHAZALI NAIBAHO', 'L', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, 13620, 51918701, 'GHINA PUTRI EFENDI', 'P', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, 13621, 48642161, 'Guntur Parsaulian Tanjung', 'L', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, 13623, 66658196, 'KANAYA TITANIA', 'P', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, 13624, 51486750, 'KHAIRIL LUKMAN', 'L', 'Islam', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, 13625, 58131717, 'YOSEPH PRATAMA SITINDAON', 'L', 'Kristen', NULL, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 13626, 60237435, 'CHINTYA BR SIBARANI', 'P', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, 13627, 56001116, 'FRISKILA BR GURNING', 'P', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(360, 13628, 56944485, 'GLORI CAHAYA GULTOM', 'P', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(361, 13629, 55486321, 'GRISELA LAURENSIA BR SILITONGA', 'P', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, 13630, 58652205, 'IMEL FEBRIANTI LUMBAN TOBING', 'P', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, 13631, 50893385, 'JENIUS SIMAMORA', 'L', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, 13632, 64712054, 'JESEN HAIKAL JAYA SIANIPAR', 'L', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(365, 13633, 66554285, 'JESSICA ANGGRIANI LUMBANTOBING', 'P', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(366, 13634, 42200169, 'JOSEF REPENTER NAINGGOLAN', 'L', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(367, 13635, 52762377, 'JOSEP RIFALDI SIMAMORA', 'L', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, 13636, 53492599, 'JUANA HUTAJULU', 'P', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, 13637, 43687541, 'JUL KIPLI MALAU', 'L', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(370, 13638, 51757506, 'KARTIKA SARI SINAGA', 'P', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(371, 13639, 58983642, 'KEVIN MATONDANG', 'L', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(372, 13640, 52996598, 'KRISTIAN SIMATUPANG', 'L', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, 13641, 53280763, 'LENNY BR TOHANG', 'P', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, 13642, 58408247, 'M. KHAIRIL SAM', 'L', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, 13643, 51622650, 'MUHAMMAD ALBAKHRI RAMADHAN', 'L', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, 13646, 60091353, 'MUHAMMAD REVA SYAHPUTRA BATE\'E', 'L', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, 13647, 51514815, 'MUHAMMAD RIDWAN AL FARIZI', 'L', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, 13648, 50813002, 'MUHAMMAD RIFQI AZMI', 'L', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(379, 13649, 53179540, 'MUTIA FADILLA', 'P', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(380, 13650, 54421402, 'Nabila Firka Hasibuan', 'P', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(381, 13651, 57187498, 'Nabila Zahra', 'P', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(382, 13652, 60199692, 'Naila Zhafira Yasmin Mamahit', 'P', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(383, 13654, 67840728, 'Nazla Sabila', 'P', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(384, 13655, 57578345, 'NURUL AZMI SHAPUTRI', 'P', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, 13656, 56558436, 'NURUL HIDAYAH', 'P', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(386, 13657, 48755822, 'PUTRA ZULIA', 'L', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(387, 13658, 46575540, 'PUTRI ADINA', 'P', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, 13659, 61164003, 'RAHMAYANTI', 'P', 'Islam', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, 13660, 50893369, 'RICO ANDRIANO SIBORO', 'L', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, 13661, 53430671, 'ROY GANDA TUA PERNANDO MALAU', 'L', 'Kristen', NULL, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, 13662, 46669478, 'BERLIAN HENDERINA', 'P', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, 13663, 47333873, 'GABRIEL SINURAT', 'L', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, 13664, 57123798, 'LUIS PERNANDO PURBA', 'L', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, 13665, 58201198, 'MARIA DESRINA SINAGA', 'P', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, 13666, 52996576, 'Maria Helena Gultom', 'P', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, 13667, 55276532, 'Michael Zuan Geri Siahaan', 'L', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, 13668, 52534286, 'Monalisa Karamoy', 'P', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, 13669, 53492585, 'NADYA MARGARETHA PARDEDE', 'P', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, 13670, 56974624, 'NOVENA CRISTANTI NABABAN', 'P', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, 13671, 53492573, 'PUTRI POLINA BR GINTING MUNTHE', 'P', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, 13673, 52479320, 'RANGGA ANUGRAH SHAHTY', 'L', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, 13674, 43886271, 'Rangga Ramadhan', 'L', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, 13675, 59653703, 'RANI ANGGRAINI', 'P', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(404, 13676, 54787652, 'RAnty Ayu Kirani', 'P', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, 13677, 33069240, 'RIA IRENA AGUSTINA SILABAN', 'P', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, 13678, 56916518, 'RICARDO ARITONANG', 'L', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, 13679, 55876756, 'RINDI YOBELISTA TAMBUNAN', 'P', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, 13680, 53430677, 'RIO CHAROLUS LUMBAN RAJA', 'L', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, 13681, 65231796, 'RISCA', 'P', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(410, 13682, 69095523, 'Rita Yana Nasution', 'P', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, 13683, 59585690, 'RIZKI AMELIA ANANDA TAMBUNAN', 'P', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, 13684, 52754396, 'RIZKI NOEL PARDAMEAN PANJAITAN', 'P', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, 13685, 51013912, 'ROMA ULINA BR SAGALA', 'P', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, 13686, 55044857, 'SAKINAH', 'P', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, 13687, 46819811, 'SALSABILA RAGILIA PUTRI', 'P', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(416, 13688, 62297908, 'SALWA MUZZALIPA HASENA', 'P', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(417, 13689, 44824088, 'SANDY DESPIAN PERMANA', 'L', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(418, 13690, 51534781, 'SHESILIA ANGELICA L. TOBING', 'P', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, 13691, 55998007, 'SITI RAMADHANI', 'P', 'Kristen', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(420, 13692, 62268922, 'SRI SAKINAH', 'P', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(421, 13693, 66758551, 'SUSANTI', 'P', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, 13694, 56362190, 'TASYA ARDILA', 'P', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(423, 13695, 62639399, 'Tiara Indah Lestari Pane', 'P', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(424, 13696, 60035650, 'TRINDAH AINI RUSKA', 'P', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(425, 13697, 54906352, 'TSABITAH TRI WULANDARI', 'P', 'Islam', NULL, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(426, 13699, 56276533, 'Amri Oktavianus Sianipar', 'L', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(427, 13701, 58714966, 'Aron Noris Siregar', 'L', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(428, 13702, 64767385, 'AUDREY SAPIRA', 'P', 'Islam', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(429, 13703, 48323681, 'BENRI REVAEL PANDAPOTAN AMBARITA', 'L', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(430, 13704, 3054574765, 'Bulan Rizki Rahmadani Sembiring', 'P', 'Islam', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(431, 13705, 49701774, 'DANI LABERDO CHRISTIAN SIMANJUNTAK', 'L', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, 13707, 46963862, 'DONI LABERDO CHRISTIAN SIMANJUNTAK', 'L', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, 13708, 55914924, 'Felix Natan Asimido Sagala', 'L', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(434, 13709, 64554929, 'FIRA DESIKA BR BUKIT', 'P', 'Islam', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(435, 13710, 59849334, 'Jesica Andriani Sitorus', 'P', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(436, 13711, 53609304, 'Linda Lestari Siregar', 'P', 'Islam', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(437, 13712, 68782249, 'Lucia Maura Nathalie', 'P', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(438, 13714, 45219221, 'NURUL CAHAYA', 'P', 'Islam', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, 13715, 54300532, 'PUTRI MEY SARAH', 'P', 'Islam', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(440, 13716, 44794219, 'ROSMERYA PASARIBU', 'P', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, 13717, 50893405, 'SABRINA NATALI SINAGA', 'P', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(442, 13718, 52439961, 'SAMUEL DONGAN PARULIAN TAMBUNAN', 'L', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(443, 13719, 59740638, 'SAMUEL RIVALDO SIMANJUNTAK', 'L', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(444, 13720, 53430668, 'SANTA ANGELA ROYTO SILABAN', 'P', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(445, 13721, 54403600, 'SARA STEFANY TAMPUBOLON', 'P', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(446, 13722, 53492592, 'SHYNTIA SINAGA', 'P', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(447, 13724, 45399400, 'TAMARA SARAGIH', 'P', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(448, 13725, 57767686, 'TESA LONIKA B.MANALU', 'P', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(449, 13726, 49319154, 'TOMY RENALDI JENIUS SIMAMORA', 'L', '', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(450, 13727, 58921249, 'TWENI NOVIANTIKA SIREGAR', 'P', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(451, 13728, 46979659, 'VALCA SITANGGANG', 'L', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, 13729, 51237738, 'VETRICIA AUDREY NATALIA BR. TOBING', 'P', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, 13730, 58050150, 'WANDA NUR AKILA KUSTIAWAN', 'P', 'Islam', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(454, 13731, 53964453, 'WIDIA APRIANINGSIH SIHOMBING', 'P', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(455, 13732, 67285042, 'YOHANA SAFENIA SIAHAAN', 'P', 'Kristen', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(456, 13733, 53492992, 'YUDI PRIMA SIREGAR', 'L', 'Islam', NULL, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 13850, NULL, 'ABYYU FARRAS', 'L', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 13851, NULL, 'AHMAD FAQIH', 'L', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 13852, NULL, 'AHMAD ZIBRIL MOURI D\'ARMAN', 'L', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 13853, NULL, 'ANDREAS CRISTOPEL PASARIBU', 'L', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 13854, NULL, 'ARDIAN ABDILAH', 'L', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 13855, NULL, 'ARSYA MEDIKA BUTAR BUTAR', 'P', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 13856, NULL, 'Arya Dzil Ikram Marpaung', 'L', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 13857, NULL, 'AZIRA TRI AFSARY', 'P', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 13858, NULL, 'DAVINA AZZAHRA NAULI', 'P', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 13859, NULL, 'FAHRI PRASETYA', 'L', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 13860, NULL, 'FITRYA RAMADANI', 'P', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 13861, NULL, 'GRIMONIA HANS GILLY SIRAIT', 'P', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 13862, NULL, 'HAIKAL ZAIN HAWARI SIREGAR', 'L', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 13863, NULL, 'HAIKAL ZAIN HAWARI SIREGAR', 'L', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 13864, NULL, 'INTAN ZAHARA', 'P', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 13865, NULL, 'JELITA ADELIMA Br.SIMANJUNTAK', 'P', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 13866, NULL, 'JESSICA CATRINA SITORUS', 'P', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 13867, NULL, 'JOHAN FEBRIAN SIREGAR', 'L', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 13868, NULL, 'JOSE ALBERTO SINAMBELA', 'L', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 13869, NULL, 'JOSEF TORA TAMBUNAN', 'L', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 13870, NULL, 'MARTA RELINA BR SIAGIAN', 'P', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 13871, NULL, 'MHD. RASYA SIMATUPANG', 'L', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 13872, NULL, 'MIKA FLORENSIA BR NAINGGOLAN', 'P', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 13873, NULL, 'MUTHIA ISNAENI KOTO', 'P', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 13874, NULL, 'NABILA NUR FADIA', 'P', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 13875, NULL, 'NAQIYA FAIRUZA', 'P', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 13876, NULL, 'NOVA AULIA YANTI', 'P', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 13877, NULL, 'PANCA BADIANSYAH SIMANJUNTAK', 'L', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 13878, NULL, 'PASKAULY SINURAT', 'P', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 13879, NULL, 'PHOIBE KLEYNOV CHRISTI BUTAR BUTAR', 'P', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 13880, NULL, 'RAHMANSYAH', 'L', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 13881, NULL, 'SANTAH GREASYA BR SIANIPAR', 'P', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 13882, NULL, 'SASTA OKTAVIA HASIBUAN', 'P', 'Kristen', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 13883, NULL, 'YOGA NAWARISA PINEM', 'P', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 13884, NULL, 'ZHAFIRAH RAMADHANI', 'P', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 13885, NULL, 'ZIAN IKRIMAH', 'P', 'Islam', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 13886, NULL, 'ADINDA BR PANE', 'P', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 13887, NULL, 'AMANDA', 'P', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 13888, NULL, 'ARIEL PARLUHUTAN TAMBUNAN', 'L', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 13889, NULL, 'ASTI RESTU FATIMAH', 'P', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 13890, NULL, 'AWALUDDIN HASYIM', 'L', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 13891, NULL, 'BASTIAN HARYONO SILITONGA', 'L', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 13892, NULL, 'BELLA NAYSILLA SIRINGO RINGO', 'P', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 13893, NULL, 'BUNGA SYAFRUN WILDA', 'P', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 13894, NULL, 'CHATRINE SIERA OKTAVIANA PURBA', 'P', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 13895, NULL, 'CINDY REGREENA MUNTHE', 'P', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 13896, NULL, 'DINI NABILA', 'P', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 13897, NULL, 'DWI PERMATA SARI L. TOBING', 'P', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 13898, NULL, 'FAREL', 'L', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 13899, NULL, 'FATHUR RAHZA MATONDANG', 'L', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 13900, NULL, 'HASSANDRO SIMAMORA', 'L', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 13901, NULL, 'HEVITA AYU ARUNI SIAHAAN', 'P', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 13902, NULL, 'HISKIA RAHMADANI', 'P', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 13903, NULL, 'ILARY MARGARET SIMANJUNTAK', 'P', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 13904, NULL, 'KEZIA ANGGITA NABABAN', 'P', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 13905, NULL, 'MUHAMMAD HARIRI', 'L', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 13906, NULL, 'MUHAMMAD REVAN', 'L', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 13907, NULL, 'NOVA JOSEVIA PARDEDE', 'P', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 13908, NULL, 'NUR ABSYAHRAH', 'P', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 13909, NULL, 'NURHALIZAH', 'P', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 13910, NULL, 'PANDU AURY SAPUTRA CANIAGO', 'L', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 13911, NULL, 'PUTRI LISTIAWATI', 'P', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 13912, NULL, 'PUTRI NINGSIH ANGGRAINI MARBUN', 'P', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 13913, NULL, 'RAHMA AUDYA MAULIDA', 'P', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 13914, NULL, 'RIFKA MAYSU SAMOSIR', 'P', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 13915, NULL, 'RIRIN BINTANG MARPAUNG', 'P', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 13916, NULL, 'SAMUEL LEONARDO SIRAIT', 'L', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 13917, NULL, 'SHELLY VANYA SIHOMBING', 'P', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 13918, NULL, 'SITI NAJWA', 'P', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 13919, NULL, 'STEVEN IMMANUEL SIAHAAN', 'L', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 13920, NULL, 'SUCITA RAHMA BR. GULTOM', 'P', 'Islam', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 13921, NULL, 'URBA SARI', 'P', 'Kristen', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 13922, NULL, 'ALBERT DANUARTA BUTAR BUTAR', 'L', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 13923, NULL, 'ALEX ROLAND BAKARA', 'L', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 13924, NULL, 'ALINISA KUSWANDARI', 'P', 'Islam', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 13925, NULL, 'ANGELIA ROTUA LUMBAN BATU', 'P', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 13926, NULL, 'ARDANA BANJARNAHOR', 'L', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 13927, NULL, 'ARTIKA SYAHRANI S. PARANGIN ANGIN', 'P', 'Islam', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 13928, NULL, 'ANGELIA ROTUA LUMBAN BATU', 'P', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 13929, NULL, 'DWI FEBRINA SAHPUTRI ', 'P', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 13930, NULL, 'ELISA TESSALONIKA MARBUN', 'P', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 13931, NULL, 'GERY LUKAS PAHOTTON HUTASOIT', 'L', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 13932, NULL, 'GINA ARINI', 'P', 'Islam', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 13933, NULL, 'HANNA GABRIELLA BR MANURUNG', 'P', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 13934, NULL, 'JELITA ANGELIA SITUMEANG', 'P', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 13935, NULL, 'JULIANA BR. SIMBOLON', 'P', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 13936, NULL, 'KANIA PUTRI AYU', 'P', 'Islam', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 13937, NULL, 'KHAIRUL PRATAMA SIREGAR', 'L', 'Islam', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 13938, NULL, 'LOUIZ STEVAN SINAMBELA', 'L', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 13939, NULL, 'LUNA INDRIANI NAPITUPULU', 'P', 'Islam', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 13940, NULL, 'MARCO FAEL SATRIA NAPITUPULU', 'L', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 13941, NULL, 'MELISA WULANDINI GULTOM', 'P', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 13942, NULL, 'METHA ARDIAN SEPTARI SILALAHI', 'P', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 13943, NULL, 'MICHAEL APANDY HUTAPEA', 'L', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 13944, NULL, 'NADYA SAFWAH', 'P', 'Islam', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 13945, NULL, 'NAZWA AMALIA SIMATUPANG', 'P', 'Islam', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 13946, NULL, 'OLIVIA SIHOMBING', 'P', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 13947, NULL, 'PATUAN RADJA DOLLY MARPAUNG', 'L', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 13948, NULL, 'PUAN MAHARANI ASSYUARA', 'P', 'Islam', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 13949, NULL, 'PUTRI NABILLAH PANE', 'P', 'Islam', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 13950, NULL, 'RAMADHANI SUKMA', 'P', 'Islam', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 13951, NULL, 'RENATA NAINGGOLAN', 'P', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 13952, NULL, 'RIAN RIYADI', 'L', 'Islam', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 13953, NULL, 'ROMA ITO SIPAHUTAR', 'P', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 13954, NULL, 'SATRIA ANDIKA DAMANIK', 'L', 'Islam', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 13955, NULL, 'SEFANYA MARDA GLORY SITOHANG', 'P', 'Kristen', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 13956, NULL, 'SIHOL NANDITO PURBA', 'L', 'Islam', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 13957, NULL, 'TASYA SALSADILA', 'P', 'Islam', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 13958, NULL, 'ADITYA BLESSIN PASKAH SITOPU', 'L', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 13959, NULL, 'AGNES MUTIARA SITUMORANG', 'P', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 13960, NULL, 'ALFIAN HADI', 'L', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 13961, NULL, 'ANDIKA FIRMAN SIHOMBING', 'L', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 13962, NULL, 'ANDIKA SIAGIAN', 'L', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 13963, NULL, 'BULAN APRIANTI GINTING', 'P', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 13964, NULL, 'CLARA MAGDALENA PANGGABEAN', 'P', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 13965, NULL, 'DANIEL OBRIENT PANJAITAN', 'L', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 13966, NULL, 'DEVI GRACELLA NAINGGOLAN', 'P', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 13967, NULL, 'DHYVANI KUSNANDA', 'P', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 13968, NULL, 'DINDA FELISHA PASARIBU', 'P', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 13969, NULL, 'FITRI ANISA AHMAD', 'P', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 13970, NULL, 'GERIN ANGGRAINI', 'P', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 13971, NULL, 'HAYCAL SARAGIH', 'L', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 13972, NULL, 'INDA DAMAYANTI SIMBOLON', 'P', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 13973, NULL, 'INDRIATI OCTAVIANI SIMANJUNTAK', 'P', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 13974, NULL, 'JOHAN PARULIAN PANJAITAN', 'L', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 13975, NULL, 'JOVIN AREKSA RAMADHAN LIWANDA', 'L', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 13976, NULL, 'JOYCE LIDYA PATRICIA DAELI', 'L', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 13977, NULL, 'M. AKBAR KHARISMA RAFLI', 'L', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 13978, NULL, 'MAWAR ARTAULI SIMANJUNTAK', 'P', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 13979, NULL, 'MHD. NOVRIZAL KHADAFI', 'L', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 13980, NULL, 'MONA ARTA SITORUS', 'P', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 13981, NULL, 'MUHAMMAD NUR ZAHRI', 'L', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 13982, NULL, 'MUHAMMAD WILLY WIJARDI', 'L', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 13983, NULL, 'NAILA AMANDA BR BATUBARA', 'P', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 13984, NULL, 'NAYLA AZ ZAHRA', 'P', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 13985, NULL, 'NESYA AMANDA', 'P', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 13986, NULL, 'ROBERTO CARLOS SIMANJUNTAK', 'L', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 13987, NULL, 'RUTHMAIDA CHAYANI BR GULTOM', 'P', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 13988, NULL, 'SARIDA ZAI', 'P', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 13989, NULL, 'SARTIA BORU SIMARMATA', 'P', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 13990, NULL, 'SILVI DARMAWATI LUMBAN TOBING', 'P', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 13991, NULL, 'SRI AULIA', 'P', 'Islam', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 13992, NULL, 'TERESA PRATIWI HUTAURUK', 'P', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 13993, NULL, 'YOEL RENOL SITINDAON', 'L', 'Kristen', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 13994, NULL, 'AGUSTIAN MARPAUNG', 'L', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 13995, NULL, 'AHMAD ALFARUNI BARUS', 'L', 'Islam', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 13996, NULL, 'ALLYAH GEA RAMADHANI', 'P', 'Islam', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 13997, NULL, 'ALVIN PUTRA SIHALOHO', 'L', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 13998, NULL, 'Asya Amanda Putri', 'P', 'Islam', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 13999, NULL, 'BRIGITHA ANGELIKA PANJAITAN', 'P', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 14000, NULL, 'Clara Intan Apriani Simbolon', 'P', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 14001, NULL, 'Egi Adinda Putri', 'P', 'Islam', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 14002, NULL, 'EVAN ANDREAS NAINGGOLAN', 'L', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 14003, NULL, 'FAISAL RIDHO ZALIANDA', 'L', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 14004, NULL, 'HEMAT PARSINTONGAN PASARIBU', 'L', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 14005, NULL, 'HERI KURNIAWAN SITUMEANG', 'L', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 14006, NULL, 'IMA PUTRI AMBARITA', 'P', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 14007, NULL, 'JOHAN ISWARA SIANIPAR', 'L', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 14008, NULL, 'Jonathan Sianturi', 'L', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 14009, NULL, 'KAMISA', 'P', 'Islam', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 14010, NULL, 'KEYSA AULIA PUTRI HARAHAP', 'P', 'Islam', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 14011, NULL, 'M. DAFFA AR RAHMAN PRATAMA', 'L', 'Islam', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 14012, NULL, 'M. ZACKI FADILLAH', 'L', 'Islam', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 14013, NULL, 'MARTHA AGNES MONICA Br SIMAMORA', 'P', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 14014, NULL, 'Meliana Putri Pasaribu', 'P', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 14015, NULL, 'MHD. Reyhan Apriliansyah', 'L', 'Islam', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 14016, NULL, 'MUHAMMAD FADIL', 'L', 'Islam', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 14017, NULL, 'MULIA SUMIAR SIMBOLON', 'L', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 14018, NULL, 'NAOMI RUGUN VALENTINA SITORUS', 'P', '', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 14019, NULL, 'NATALIA RATNA SARI MANURUNG', 'P', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 14020, NULL, 'NATASYA ANGELINA PUTRI SINAGA', 'P', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 14021, NULL, 'Oloan Dapit Waltin Tamba', 'L', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 14022, NULL, 'PUTRI SINAGA', 'P', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 14023, NULL, 'RAFAEL CRESVO ARUAN', 'L', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 14024, NULL, 'REY MAHENDRA MARPAUNG', 'L', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 14025, NULL, 'REYNALDO MARK NAINGGOLAN', 'L', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 14026, NULL, 'Rizcy Putratama Immanuel Nababan', 'L', '', 'Mengundurkan Diri 23-09-2021', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 14027, NULL, 'SHERIL ADINDA ZAHWA', 'P', 'Islam', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 14028, NULL, 'SRI WURI HANDAYANI', 'P', 'Islam', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 14029, NULL, 'VINSENSIUS FRESCILA', 'L', 'Kristen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 14030, NULL, 'Abel Agustin', 'L', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 14031, NULL, 'ADELINA RIANI SINAGA', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 14032, NULL, 'AISYAH AMELIA', 'P', 'Islam', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 14033, NULL, 'CHRISTIN TIARA SIJABAT', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 14034, NULL, 'DAFA HERLINO SRIATMAJA LUBIS', 'L', 'Islam', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 14035, NULL, 'DAVID MORALES BUTAR-BUTAR', 'L', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 14036, NULL, 'DIPAN SUMARSONO PANJAITAN', 'L', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 14037, NULL, 'ELISA NIA SITUMEANG', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 14038, NULL, 'ELVA YOHANA PANGARIBUAN', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 14039, NULL, 'EVA LUSIANA SINAGA', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 14040, NULL, 'FADLI ANDREAS HORONI', 'L', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 14041, NULL, 'FARHAN SULAIMAN', 'L', 'Islam', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 14042, NULL, 'FRANSISCO ANDIKA SINAGA', 'L', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 14043, NULL, 'FRISKA BR SORMIN', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 14044, NULL, 'GRESELA BR SIBARANI', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 14045, NULL, 'IMAN ARYA PUTRA SILITONGA', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 14046, NULL, 'Kasfil Azis', 'L', 'Islam', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 14047, NULL, 'LISA AIRIN NAHAMPUN', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 14048, NULL, 'MHD.ALFARRAIL PUTRA', 'L', 'Islam', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 14049, NULL, 'Mutia Sari Limongga', 'P', 'Islam', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 14050, NULL, 'Nadia Ayu Safitri', 'P', 'Islam', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 14051, NULL, 'NORA LUCIA PANGARIBUAN', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 14052, NULL, 'NOVTI AHNY SARAGI', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 14053, NULL, 'OKTAVIANI PANJAITAN', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 14054, NULL, 'Qaila Olivia S', 'P', 'Islam', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 14055, NULL, 'Qowi Masyahid', 'L', 'Islam', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 14056, NULL, 'Reebecca Tiara Sitorus', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 14057, NULL, 'RIASI OCTAVIAN', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 14058, NULL, 'RUBEN HATOGUAN SIHOTANG', 'L', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 14059, NULL, 'RUGUN RALIN AMELIA OMPUSUNGGU', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 14060, NULL, 'Safira Zitia', 'P', 'Islam', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 14061, NULL, 'Sahira Fharunisa', 'P', 'Islam', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 14062, NULL, 'Shinta Wulan Br Tarigan', 'P', 'Kristen', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 14063, NULL, 'Sulistia Rahmaini', 'P', 'Islam', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 14064, NULL, 'T MHD HAIKAL MULKI MUDA', 'L', 'Islam', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 14065, NULL, 'Tiara Sabika Anhar', 'P', 'Islam', NULL, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 14066, NULL, 'ALDI FAUZAN', 'L', 'Islam', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 14067, NULL, 'ARIES ARDIANSYAH', 'L', 'Islam', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 14068, NULL, 'BERNIKE ESTER FLORENCIA BR.SIMANJUNTAK', 'P', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 14069, NULL, 'daniel marojahan t pandiangan', 'L', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 14070, NULL, 'Farradina Alya', 'P', 'Islam', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 14071, NULL, 'FERDI ANSAH LUBIS', 'L', 'Islam', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 14072, NULL, 'FILDZAH NABILA TAUFIK', 'P', 'Islam', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 14073, NULL, 'Gabriel Lewis Armando Siagian', 'L', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 14074, NULL, 'GABRIEL NICHOLAS SITORUS', 'L', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 14075, NULL, 'Hengki Kurniawan', 'L', 'Islam', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 14076, NULL, 'HOLBEN SUNU DAMANIK', 'L', 'Islam', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 14077, NULL, 'HOTDISON SILITONGA', 'L', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 14078, NULL, 'JOSUA ANGGRO SIMANJUNTAK', 'L', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 14079, NULL, 'JOSUA SIHOMBING', 'L', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 14080, NULL, 'JUAN FRANS RIQUELMI MARPAUNG', 'L', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 14081, NULL, 'JULIUS KRISTIANUS NAINGGOLAN', 'L', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 14082, NULL, 'Khairul Amri', 'L', 'Islam', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 14083, NULL, 'KLOSE JODI MANURUNG', 'L', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 14084, NULL, 'LEONI MARGARETA SAMOSIR', 'P', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 14085, NULL, 'Martha Sihombing', 'P', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 14086, NULL, 'PUTRI CHRISTINA BR TUMANGGOR', 'P', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 14087, NULL, 'Ririn Siti Alam Panjaitan', 'P', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 14088, NULL, 'RONALDO SINAGA', 'L', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 14089, NULL, 'ROY SAPUTRA SIBARANI', 'L', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_siswas` (`id`, `NIS`, `NISN`, `nama_siswa`, `jk_siswa`, `agama_siswa`, `ket_siswa`, `id_kelas`, `created_at`, `updated_at`) VALUES
(240, 14090, NULL, 'SAMUEL PURBA', 'L', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 14091, NULL, 'SATRIA ADHI DHUNA WARDANA', 'L', 'Islam', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 14092, NULL, 'SITA ALIA', 'P', 'Islam', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 14093, NULL, 'SOFYANI ANISA PUTRI', 'P', 'Islam', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 14094, NULL, 'STEVEN SALOMO PANGGABEAN', 'L', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 14095, NULL, 'SUNGGUL ELFALDO PARNINGOTAN TARIHORAN', 'L', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 14096, NULL, 'Tiara Sitorus', 'P', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 14097, NULL, 'TRI CINDY UAN REBEKCA BR SITANGGANG', 'P', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 14098, NULL, 'Vibry Andari Hutasuhut', 'P', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 14099, NULL, 'WIKA CRISTINE BRENITA BR. SINULINGGA', 'P', 'Kristen', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 14100, NULL, 'Zaitun Sari', 'P', 'Islam', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 14101, NULL, 'Zsa Zsa Uwaisy', 'P', 'Islam', NULL, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 14102, NULL, 'ANGELIKA WANTRI SONDANG', 'P', '', 'SISWA BARU MASUK', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 14103, NULL, 'DANIEL NATHANAIL NAPITUPULU', 'L', 'Kristen', 'SISWA BARU MASUK', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 14104, NULL, 'JUAN SIMANULLANG', 'L', 'Kristen', 'SISWA BARU MASUK', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 14105, NULL, 'OLLA MERCY GRACE SILITONGA', 'P', 'Kristen', 'SISWA BARU MASUK', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 14106, NULL, 'YAZIDA SYAWALIYAH ALKHOLIDI', 'P', 'Islam', 'SISWA BARU MASUK', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Yeftha El Imani Pardede', 'yeftha.imani@gmail.com', NULL, '$2y$10$E9L7S2RB.7Um9xkypEy8OObLX2cpY6cBaNs/iPHSNrvJsuw7e5OVa', NULL, '2022-05-24 19:06:20', '2022-05-24 19:06:20');

-- --------------------------------------------------------

--
-- Structure for view `data_guru`
--
DROP TABLE IF EXISTS `data_guru`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_guru`  AS SELECT `tbl_gurus`.`NIP` AS `NIP`, `tbl_gurus`.`nama_guru` AS `nama_guru`, `tbl_bidang_studis`.`nama_bidangStudi` AS `bidang_studi`, `tbl_kelas`.`nama` AS `wali_kelas`, `tbl_gurus`.`gol_guru` AS `gol_guru`, `tbl_gurus`.`ket_guru` AS `ket_guru` FROM ((`tbl_gurus` join `tbl_bidang_studis` on(`tbl_gurus`.`id_bidangStudi` = `tbl_bidang_studis`.`id`)) join `tbl_kelas` on(`tbl_kelas`.`wali_kelas` = `tbl_gurus`.`NIP`)) ;

-- --------------------------------------------------------

--
-- Structure for view `data_siswa`
--
DROP TABLE IF EXISTS `data_siswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_siswa`  AS SELECT `tbl_siswas`.`NIS` AS `NIS`, `tbl_siswas`.`nama_siswa` AS `nama_siswa`, `tbl_siswas`.`jk_siswa` AS `jk_siswa`, `tbl_siswas`.`agama_siswa` AS `agama_siswa`, `tbl_kelas`.`nama` AS `kelas` FROM (`tbl_kelas` join `tbl_siswas` on(`tbl_siswas`.`id_kelas` = `tbl_kelas`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_beritas`
--
ALTER TABLE `tbl_beritas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_bidang_studis`
--
ALTER TABLE `tbl_bidang_studis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_eskuls`
--
ALTER TABLE `tbl_eskuls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_fasilitas`
--
ALTER TABLE `tbl_fasilitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_gurus`
--
ALTER TABLE `tbl_gurus`
  ADD PRIMARY KEY (`NIP`),
  ADD KEY `tbl_gurus_id_bidangstudi_foreign` (`id_bidangStudi`);

--
-- Indexes for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_kelas_wali_kelas_foreign` (`wali_kelas`);

--
-- Indexes for table `tbl_osis`
--
ALTER TABLE `tbl_osis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pegawais`
--
ALTER TABLE `tbl_pegawais`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_prestasis`
--
ALTER TABLE `tbl_prestasis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_siswas`
--
ALTER TABLE `tbl_siswas`
  ADD PRIMARY KEY (`NIS`),
  ADD KEY `tbl_siswas_id_kelas_foreign` (`id_kelas`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_beritas`
--
ALTER TABLE `tbl_beritas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_bidang_studis`
--
ALTER TABLE `tbl_bidang_studis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_eskuls`
--
ALTER TABLE `tbl_eskuls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_fasilitas`
--
ALTER TABLE `tbl_fasilitas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_gurus`
--
ALTER TABLE `tbl_gurus`
  MODIFY `NIP` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198208262014112002;

--
-- AUTO_INCREMENT for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_osis`
--
ALTER TABLE `tbl_osis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pegawais`
--
ALTER TABLE `tbl_pegawais`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_prestasis`
--
ALTER TABLE `tbl_prestasis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_siswas`
--
ALTER TABLE `tbl_siswas`
  MODIFY `NIS` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14107;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_gurus`
--
ALTER TABLE `tbl_gurus`
  ADD CONSTRAINT `tbl_gurus_id_bidangstudi_foreign` FOREIGN KEY (`id_bidangStudi`) REFERENCES `tbl_bidang_studis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD CONSTRAINT `tbl_kelas_wali_kelas_foreign` FOREIGN KEY (`wali_kelas`) REFERENCES `tbl_gurus` (`NIP`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_siswas`
--
ALTER TABLE `tbl_siswas`
  ADD CONSTRAINT `tbl_siswas_id_kelas_foreign` FOREIGN KEY (`id_kelas`) REFERENCES `tbl_kelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
