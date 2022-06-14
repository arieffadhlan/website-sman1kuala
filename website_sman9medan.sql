-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jun 2022 pada 20.56
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.0.14

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
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `tampilAgamaSiswa` (IN `agama` ENUM('Islam','Kristen','Hindu','Buddha'))  BEGIN
    SELECT nama_siswa FROM tbl_siswas WHERE agama_siswa = agama;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampilKelasSiswa` (IN `nama_kelas` VARCHAR(255))  BEGIN
    SELECT nama_siswa, tbl_kelas.nama FROM tbl_siswas
    INNER JOIN tbl_kelas ON tbl_kelas.id = id_kelas
    WHERE tbl_kelas.nama = nama_kelas;
END$$

--
-- Fungsi
--
CREATE DEFINER=`root`@`localhost` FUNCTION `jumlahSiswaPerKelas` (`nama_kelas` VARCHAR(255)) RETURNS VARCHAR(255) CHARSET utf8mb4 BEGIN
	DECLARE totalSiswa INT;	
	
	SELECT COUNT(tbl_siswas.id_kelas) INTO totalSiswa
	FROM tbl_siswas
	INNER JOIN tbl_kelas ON tbl_kelas.id = tbl_siswas.id_kelas
	WHERE tbl_kelas.nama = nama_kelas;
	RETURN totalSiswa;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `siswaPriaPerKelas` (`nama_kelas` VARCHAR(255)) RETURNS VARCHAR(255) CHARSET utf8mb4 BEGIN
	DECLARE totalLakiLaki INT;
	
	SELECT COUNT(tbl_siswas.jk_siswa) INTO totalLakiLaki
	FROM tbl_siswas
	INNER JOIN tbl_kelas ON tbl_kelas.id = tbl_siswas.id_kelas
	WHERE tbl_kelas.nama = nama_kelas AND tbl_siswas.jk_siswa = "L";
	RETURN totalLakiLaki;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `siswiPerempuanPerKelas` (`nama_kelas` VARCHAR(255)) RETURNS VARCHAR(255) CHARSET utf8mb4 BEGIN
	DECLARE totalPerempuan INT;
	
	SELECT COUNT(tbl_siswas.jk_siswa) INTO totalPerempuan
	FROM tbl_siswas
	INNER JOIN tbl_kelas ON tbl_kelas.id = tbl_siswas.id_kelas
	WHERE tbl_kelas.nama = nama_kelas AND tbl_siswas.jk_siswa = "P";
	RETURN totalPerempuan;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `direktori_siswa`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `direktori_siswa` (
`nis` char(5)
,`nama_siswa` varchar(255)
,`jk_siswa` enum('L','P')
,`agama_siswa` enum('Islam','Kristen','Hindu','Buddha')
,`ket_siswa` enum('Aktif','Tidak Aktif','Mengundurkan Diri','Pindah','Dikeluarkan')
,`kelas` varchar(255)
,`wali_kelas` varchar(255)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_tbl_akuns`
--

CREATE TABLE `log_tbl_akuns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `aksi` enum('Insert','Update','Delete') NOT NULL,
  `nama_lama` varchar(255) DEFAULT NULL,
  `nama_baru` varchar(255) DEFAULT NULL,
  `email_lama` varchar(255) DEFAULT NULL,
  `email_baru` varchar(255) DEFAULT NULL,
  `password_lama` varchar(255) DEFAULT NULL,
  `password_baru` varchar(255) DEFAULT NULL,
  `foto_lama` varchar(255) DEFAULT NULL,
  `foto_baru` varchar(255) DEFAULT NULL,
  `role_lama` enum('Admin','Superadmin') DEFAULT NULL,
  `role_baru` enum('Admin','Superadmin') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `log_tbl_akuns`
--

INSERT INTO `log_tbl_akuns` (`id`, `aksi`, `nama_lama`, `nama_baru`, `email_lama`, `email_baru`, `password_lama`, `password_baru`, `foto_lama`, `foto_baru`, `role_lama`, `role_baru`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Insert', NULL, 'arief', NULL, 'arief@gmail.com', NULL, '$2y$10$8xS6kM/Qebvj8OdzcuBSYe4qh6dF/Z3h3BS.yBIIPezqSSqVBRwVS', NULL, 'user.png', NULL, 'Admin', '2022-06-13 17:31:42', '2022-06-13 17:31:42', '2022-06-13 17:31:42'),
(2, 'Update', 'arief', 'arief', 'arief@gmail.com', 'arief@gmail.com', '$2y$10$8xS6kM/Qebvj8OdzcuBSYe4qh6dF/Z3h3BS.yBIIPezqSSqVBRwVS', '$2y$10$8xS6kM/Qebvj8OdzcuBSYe4qh6dF/Z3h3BS.yBIIPezqSSqVBRwVS', 'user.png', '2.jpg', 'Admin', 'Admin', '2022-06-13 17:33:33', '2022-06-13 17:33:33', '2022-06-13 17:33:33'),
(3, 'Update', 'arief', 'arief', 'arief@gmail.com', 'arieff@gmail.com', '$2y$10$8xS6kM/Qebvj8OdzcuBSYe4qh6dF/Z3h3BS.yBIIPezqSSqVBRwVS', '$2y$10$58NPHP8LGROY/5KwSkEi3.QSQxw9IwfParXpXzt5JmksuOXMNUNeS', '2.jpg', '2.jpg', 'Admin', 'Admin', '2022-06-13 17:45:42', '2022-06-13 17:45:42', '2022-06-13 17:45:42'),
(4, 'Update', 'arief', 'arief', 'arieff@gmail.com', 'arief@gmail.com', '$2y$10$58NPHP8LGROY/5KwSkEi3.QSQxw9IwfParXpXzt5JmksuOXMNUNeS', '$2y$10$XHQtHtJbJLCgUzDGnId91OTlYdXtU5S6BQHQq6um.8LyrVeTPzq4e', '2.jpg', '2.jpg', 'Admin', 'Superadmin', '2022-06-13 17:46:10', '2022-06-13 17:46:10', '2022-06-13 17:46:10'),
(5, 'Delete', 'arief', NULL, 'arief@gmail.com', NULL, '$2y$10$XHQtHtJbJLCgUzDGnId91OTlYdXtU5S6BQHQq6um.8LyrVeTPzq4e', NULL, '2.jpg', NULL, 'Superadmin', NULL, '2022-06-13 17:46:33', '2022-06-13 17:46:33', '2022-06-13 17:46:33'),
(6, 'Insert', NULL, 'arief', NULL, 'arief@gmail.com', NULL, '$2y$10$BX/SP7YqOUzIa66FFQJKvu12rFFK7fa0Ivw8UMXmsy.BqMFHePf.u', NULL, 'user.png', NULL, 'Superadmin', '2022-06-13 17:46:48', '2022-06-13 17:46:48', '2022-06-13 17:46:48'),
(7, 'Update', 'Admin', 'Admin', 'admin@gmail.com', 'admin@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2.jpg', 'pbol.PNG', 'Superadmin', 'Superadmin', '2022-06-13 18:54:51', '2022-06-13 18:54:51', '2022-06-13 18:54:51'),
(8, 'Update', 'Admin', 'Admin', 'admin@gmail.com', 'admin@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pbol.PNG', '2.jpg', 'Superadmin', 'Superadmin', '2022-06-13 18:55:02', '2022-06-13 18:55:02', '2022-06-13 18:55:02');

--
-- Trigger `log_tbl_akuns`
--
DELIMITER $$
CREATE TRIGGER `hapusLogAkun` BEFORE DELETE ON `log_tbl_akuns` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'id tidak bisa diubah';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_tbl_beritas`
--

CREATE TABLE `log_tbl_beritas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `aksi` enum('Insert','Update','Delete') NOT NULL,
  `id_akun_lama` tinyint(3) UNSIGNED DEFAULT NULL,
  `id_akun_baru` tinyint(3) UNSIGNED DEFAULT NULL,
  `foto_lama` varchar(255) DEFAULT NULL,
  `foto_baru` varchar(255) DEFAULT NULL,
  `judul_lama` varchar(255) DEFAULT NULL,
  `judul_baru` varchar(255) DEFAULT NULL,
  `deskripsi_lama` text DEFAULT NULL,
  `deskripsi_baru` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `log_tbl_beritas`
--

INSERT INTO `log_tbl_beritas` (`id`, `aksi`, `id_akun_lama`, `id_akun_baru`, `foto_lama`, `foto_baru`, `judul_lama`, `judul_baru`, `deskripsi_lama`, `deskripsi_baru`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Update', 1, 1, 'ppdb-online.jpg', '2.jpg', 'PPDB SMAN 9 Medan Jalur Zonasi', 'PPDB SMAN 9 Medan Jalur Zonasi', '<p>Jalur Zonasi diperuntukkan bagi calon peserta didik baru SMA yang memprioritaskan jarak domisili terdekat ke sekolah tujuan berdasarkan alamat pada kartu keluarga yang diterbitkan paling singkat 1 (satu) tahun sebelum tanggal pendaftaran PPDB SMA Tahun Pelajaran 2022/2023.</p>', '<p>Jalur Zonasi diperuntukkan bagi calon peserta didik baru SMA yang memprioritaskan jarak domisili terdekat ke sekolah tujuan berdasarkan alamat pada kartu keluarga yang diterbitkan paling singkat 1 (satu) tahun sebelum tanggal pendaftaran PPDB SMA Tahun Pelajaran 2022/2023.</p>', '2022-06-13 17:49:31', '2022-06-13 17:49:31', '2022-06-13 17:49:31'),
(2, 'Update', 1, 1, '2.jpg', 'ppdb-online.jpg', 'PPDB SMAN 9 Medan Jalur Zonasi', 'PPDB SMAN 9 Medan Jalur Zonasi', '<p>Jalur Zonasi diperuntukkan bagi calon peserta didik baru SMA yang memprioritaskan jarak domisili terdekat ke sekolah tujuan berdasarkan alamat pada kartu keluarga yang diterbitkan paling singkat 1 (satu) tahun sebelum tanggal pendaftaran PPDB SMA Tahun Pelajaran 2022/2023.</p>', '<p>Jalur Zonasi diperuntukkan bagi calon peserta didik baru SMA yang memprioritaskan jarak domisili terdekat ke sekolah tujuan berdasarkan alamat pada kartu keluarga yang diterbitkan paling singkat 1 (satu) tahun sebelum tanggal pendaftaran PPDB SMA Tahun Pelajaran 2022/2023.</p>', '2022-06-13 17:49:49', '2022-06-13 17:49:49', '2022-06-13 17:49:49'),
(3, 'Insert', NULL, 1, NULL, 'ppdb-sumut-2.jpg', NULL, 'a', NULL, '<p>a</p>', '2022-06-13 18:22:05', '2022-06-13 18:22:05', '2022-06-13 18:22:05'),
(4, 'Update', 1, 1, 'ppdb-sumut-2.jpg', 'pbol.PNG', 'a', 'a', '<p>a</p>', '<p>a</p>', '2022-06-13 18:22:13', '2022-06-13 18:22:13', '2022-06-13 18:22:13'),
(5, 'Delete', 1, NULL, 'pbol.PNG', NULL, 'a', NULL, '<p>a</p>', NULL, '2022-06-13 18:22:52', '2022-06-13 18:22:52', '2022-06-13 18:22:52');

--
-- Trigger `log_tbl_beritas`
--
DELIMITER $$
CREATE TRIGGER `hapusLogBerita` BEFORE DELETE ON `log_tbl_beritas` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabel log tbl_berita tidak bisa diubah';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_tbl_bidang_studis`
--

CREATE TABLE `log_tbl_bidang_studis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `aksi` enum('Insert','Update','Delete') NOT NULL,
  `nama_bidangStudi_lama` varchar(255) DEFAULT NULL,
  `nama_bidangStudi_baru` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `log_tbl_bidang_studis`
--
DELIMITER $$
CREATE TRIGGER `hapusLogBidangStudi` BEFORE DELETE ON `log_tbl_bidang_studis` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabel log log_tbl_bidang_studis tidak bisa diubah';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_tbl_ekstrakurikulers`
--

CREATE TABLE `log_tbl_ekstrakurikulers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `aksi` enum('Insert','Update','Delete') NOT NULL,
  `nama_ekstrakurikuler_lama` varchar(255) DEFAULT NULL,
  `nama_ekstrakurikuler_baru` varchar(255) DEFAULT NULL,
  `ikon_lama` varchar(255) DEFAULT NULL,
  `ikon_baru` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `log_tbl_ekstrakurikulers`
--

INSERT INTO `log_tbl_ekstrakurikulers` (`id`, `aksi`, `nama_ekstrakurikuler_lama`, `nama_ekstrakurikuler_baru`, `ikon_lama`, `ikon_baru`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Insert', NULL, 'a', NULL, 'pbol.PNG', '2022-06-13 18:05:20', '2022-06-13 18:05:20', '2022-06-13 18:05:20'),
(2, 'Update', 'a', 'a', 'pbol.PNG', 'ppdb-sumut.jpg', '2022-06-13 18:05:44', '2022-06-13 18:05:44', '2022-06-13 18:05:44'),
(3, 'Update', 'a', 'a', 'ppdb-sumut.jpg', 'pbol.PNG', '2022-06-13 18:09:03', '2022-06-13 18:09:03', '2022-06-13 18:09:03'),
(4, 'Update', 'a', 'a', 'pbol.PNG', 'ppdb-sumut.jpg', '2022-06-13 18:09:14', '2022-06-13 18:09:14', '2022-06-13 18:09:14'),
(5, 'Update', 'a', 'a', 'ppdb-sumut.jpg', 'pbol.PNG', '2022-06-13 18:09:29', '2022-06-13 18:09:29', '2022-06-13 18:09:29'),
(6, 'Delete', 'a', NULL, 'pbol.PNG', NULL, '2022-06-13 18:10:00', '2022-06-13 18:10:00', '2022-06-13 18:10:00'),
(7, 'Insert', NULL, 'a', NULL, 'pbol.PNG', '2022-06-13 18:10:06', '2022-06-13 18:10:06', '2022-06-13 18:10:06'),
(8, 'Update', 'a', 'a', 'pbol.PNG', 'ppdb-sumut.jpg', '2022-06-13 18:10:31', '2022-06-13 18:10:31', '2022-06-13 18:10:31'),
(9, 'Delete', 'a', NULL, 'ppdb-sumut.jpg', NULL, '2022-06-13 18:10:47', '2022-06-13 18:10:47', '2022-06-13 18:10:47'),
(10, 'Insert', NULL, 'a', NULL, 'pbol.PNG', '2022-06-13 18:10:53', '2022-06-13 18:10:53', '2022-06-13 18:10:53'),
(11, 'Update', 'a', 'a', 'pbol.PNG', 'ppdb.jpg', '2022-06-13 18:11:59', '2022-06-13 18:11:59', '2022-06-13 18:11:59'),
(12, 'Delete', 'a', NULL, 'ppdb.jpg', NULL, '2022-06-13 18:13:00', '2022-06-13 18:13:00', '2022-06-13 18:13:00'),
(13, 'Insert', NULL, 'a', NULL, 'pbol.PNG', '2022-06-13 18:13:06', '2022-06-13 18:13:06', '2022-06-13 18:13:06'),
(14, 'Delete', 'a', NULL, 'pbol.PNG', NULL, '2022-06-13 18:14:51', '2022-06-13 18:14:51', '2022-06-13 18:14:51'),
(15, 'Insert', NULL, 'a', NULL, 'pbol.PNG', '2022-06-13 18:15:52', '2022-06-13 18:15:52', '2022-06-13 18:15:52'),
(16, 'Update', 'a', 'a', 'pbol.PNG', 'ppdb-online.jpg', '2022-06-13 18:16:53', '2022-06-13 18:16:53', '2022-06-13 18:16:53'),
(17, 'Delete', 'a', NULL, 'ppdb-online.jpg', NULL, '2022-06-13 18:17:22', '2022-06-13 18:17:22', '2022-06-13 18:17:22'),
(18, 'Insert', NULL, 'a', NULL, 'pbol.PNG', '2022-06-13 18:17:29', '2022-06-13 18:17:29', '2022-06-13 18:17:29'),
(19, 'Update', 'a', 'a', 'pbol.PNG', 'C:\\xampp\\tmp\\phpE5BC.tmp', '2022-06-13 18:18:47', '2022-06-13 18:18:47', '2022-06-13 18:18:47'),
(20, 'Update', 'a', 'a', 'C:\\xampp\\tmp\\phpE5BC.tmp', 'pbol.PNG', '2022-06-13 18:19:31', '2022-06-13 18:19:31', '2022-06-13 18:19:31'),
(21, 'Update', 'a', 'a', 'pbol.PNG', 'ppdb-sumut.jpg', '2022-06-13 18:19:40', '2022-06-13 18:19:40', '2022-06-13 18:19:40'),
(22, 'Delete', 'a', NULL, 'ppdb-sumut.jpg', NULL, '2022-06-13 18:55:48', '2022-06-13 18:55:48', '2022-06-13 18:55:48');

--
-- Trigger `log_tbl_ekstrakurikulers`
--
DELIMITER $$
CREATE TRIGGER `hapusLogEkstrakurikulers` BEFORE DELETE ON `log_tbl_ekstrakurikulers` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabel log log_tbl_ekstrakurikulers tidak bisa diubah';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_tbl_fasilitas`
--

CREATE TABLE `log_tbl_fasilitas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `aksi` enum('Insert','Update','Delete') NOT NULL,
  `nama_fasilitas_lama` varchar(255) DEFAULT NULL,
  `nama_fasilitas_baru` varchar(255) DEFAULT NULL,
  `foto_fasilitas_lama` varchar(255) DEFAULT NULL,
  `foto_fasilitas_baru` varchar(255) DEFAULT NULL,
  `deskripsi_lama` text DEFAULT NULL,
  `deskripsi_baru` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `log_tbl_fasilitas`
--

INSERT INTO `log_tbl_fasilitas` (`id`, `aksi`, `nama_fasilitas_lama`, `nama_fasilitas_baru`, `foto_fasilitas_lama`, `foto_fasilitas_baru`, `deskripsi_lama`, `deskripsi_baru`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Insert', NULL, 'a', NULL, 'pbol.PNG', NULL, 'a', '2022-06-13 18:03:31', '2022-06-13 18:03:31', '2022-06-13 18:03:31'),
(2, 'Delete', 'a', NULL, 'pbol.PNG', NULL, 'a', NULL, '2022-06-13 18:04:07', '2022-06-13 18:04:07', '2022-06-13 18:04:07'),
(3, 'Insert', NULL, 'a', NULL, 'pbol.PNG', NULL, 'a', '2022-06-13 18:04:14', '2022-06-13 18:04:14', '2022-06-13 18:04:14'),
(4, 'Update', 'a', 'a', 'pbol.PNG', 'ppdb-online.jpg', 'a', 'a', '2022-06-13 18:04:45', '2022-06-13 18:04:45', '2022-06-13 18:04:45'),
(5, 'Delete', 'a', NULL, 'ppdb-online.jpg', NULL, 'a', NULL, '2022-06-13 18:05:13', '2022-06-13 18:05:13', '2022-06-13 18:05:13');

--
-- Trigger `log_tbl_fasilitas`
--
DELIMITER $$
CREATE TRIGGER `hapusLogFasilitas` BEFORE DELETE ON `log_tbl_fasilitas` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabel log log_tbl_fasilitas tidak bisa diubah';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_tbl_gurus`
--

CREATE TABLE `log_tbl_gurus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `aksi` enum('Insert','Update','Delete') NOT NULL,
  `nip_lama` char(18) DEFAULT NULL,
  `nip_baru` char(18) DEFAULT NULL,
  `nama_guru_lama` varchar(255) DEFAULT NULL,
  `nama_guru_baru` varchar(255) DEFAULT NULL,
  `id_bidangStudi_lama` tinyint(3) UNSIGNED DEFAULT NULL,
  `id_bidangStudi_baru` tinyint(3) UNSIGNED DEFAULT NULL,
  `gol_guru_lama` varchar(5) DEFAULT NULL,
  `gol_guru_baru` varchar(5) DEFAULT NULL,
  `ket_guru_lama` enum('PNS','GTT APBD','GTT Komite') DEFAULT NULL,
  `ket_guru_baru` enum('PNS','GTT APBD','GTT Komite') DEFAULT NULL,
  `foto_guru_lama` varchar(255) DEFAULT NULL,
  `foto_guru_baru` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `log_tbl_gurus`
--
DELIMITER $$
CREATE TRIGGER `hapusLogGuru` BEFORE DELETE ON `log_tbl_gurus` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabel log log_tbl_gurus tidak bisa diubah';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_tbl_kelas`
--

CREATE TABLE `log_tbl_kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `aksi` enum('Insert','Update','Delete') NOT NULL,
  `nama_lama` varchar(255) DEFAULT NULL,
  `nama_baru` varchar(255) DEFAULT NULL,
  `wali_kelas_lama` char(18) DEFAULT NULL,
  `wali_kelas_baru` char(18) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `log_tbl_kelas`
--
DELIMITER $$
CREATE TRIGGER `hapusLogKelas` BEFORE DELETE ON `log_tbl_kelas` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NPM tidak bisa diubah';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_tbl_pegawais`
--

CREATE TABLE `log_tbl_pegawais` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `aksi` enum('Insert','Update','Delete') NOT NULL,
  `nama_pegawai_lama` varchar(255) DEFAULT NULL,
  `nama_pegawai_baru` varchar(255) DEFAULT NULL,
  `ket_pegawai_lama` varchar(255) DEFAULT NULL,
  `ket_pegawai_baru` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `log_tbl_pegawais`
--
DELIMITER $$
CREATE TRIGGER `hapusLogPegawai` BEFORE DELETE ON `log_tbl_pegawais` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabel log log_tbl_pegawais tidak bisa diubah';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_tbl_prestasis`
--

CREATE TABLE `log_tbl_prestasis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `aksi` enum('Insert','Update','Delete') NOT NULL,
  `nama_prestasi_lama` varchar(255) DEFAULT NULL,
  `nama_prestasi_baru` varchar(255) DEFAULT NULL,
  `deskripsi_lama` text DEFAULT NULL,
  `deskripsi_baru` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `log_tbl_prestasis`
--
DELIMITER $$
CREATE TRIGGER `hapusLogPrestasi` BEFORE DELETE ON `log_tbl_prestasis` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabel log log_tbl_prestasis tidak bisa diubah';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_tbl_siswas`
--

CREATE TABLE `log_tbl_siswas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `aksi` enum('Insert','Update','Delete') NOT NULL,
  `nis_lama` char(5) DEFAULT NULL,
  `nis_baru` char(5) DEFAULT NULL,
  `nisn_lama` char(10) DEFAULT NULL,
  `nisn_baru` char(10) DEFAULT NULL,
  `nama_siswa_lama` varchar(255) DEFAULT NULL,
  `nama_siswa_baru` varchar(255) DEFAULT NULL,
  `jk_siswa_lama` enum('L','P') DEFAULT NULL,
  `jk_siswa_baru` enum('L','P') DEFAULT NULL,
  `agama_siswa_lama` enum('Islam','Kristen','Hindu','Buddha') DEFAULT NULL,
  `agama_siswa_baru` enum('Islam','Kristen','Hindu','Buddha') DEFAULT NULL,
  `ket_siswa_lama` enum('Aktif','Tidak Aktif','Mengundurkan Diri','Pindah','Dikeluarkan') DEFAULT NULL,
  `ket_siswa_baru` enum('Aktif','Tidak Aktif','Mengundurkan Diri','Pindah','Dikeluarkan') DEFAULT NULL,
  `id_kelas_lama` tinyint(3) UNSIGNED DEFAULT NULL,
  `id_kelas_baru` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `log_tbl_siswas`
--

INSERT INTO `log_tbl_siswas` (`id`, `aksi`, `nis_lama`, `nis_baru`, `nisn_lama`, `nisn_baru`, `nama_siswa_lama`, `nama_siswa_baru`, `jk_siswa_lama`, `jk_siswa_baru`, `agama_siswa_lama`, `agama_siswa_baru`, `ket_siswa_lama`, `ket_siswa_baru`, `id_kelas_lama`, `id_kelas_baru`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Update', '11111', '11111', '11111111', '11111111', 'BARUNA ARUTALA', 'BARUNA ARUTALA', 'L', 'P', 'Islam', 'Islam', 'Aktif', 'Aktif', NULL, NULL, '2022-06-13 17:56:05', '2022-06-13 17:56:05', '2022-06-13 17:56:05'),
(2, 'Update', '11111', '11111', '11111111', '11111111', 'BARUNA ARUTALA', 'BARUNA ARUTALA', 'P', 'L', 'Islam', 'Islam', 'Aktif', 'Aktif', NULL, NULL, '2022-06-13 18:35:21', '2022-06-13 18:35:21', '2022-06-13 18:35:21'),
(3, 'Update', '11111', '11111', '11111111', '11111111', 'BARUNA ARUTALA', 'BARUNA ARUTALA', 'L', 'P', 'Islam', 'Islam', 'Aktif', 'Aktif', NULL, NULL, '2022-06-13 18:37:27', '2022-06-13 18:37:27', '2022-06-13 18:37:27'),
(4, 'Insert', NULL, '1', NULL, '1', NULL, '1', NULL, 'L', NULL, 'Islam', NULL, 'Pindah', NULL, 19, '2022-06-13 18:51:26', '2022-06-13 18:51:26', '2022-06-13 18:51:26'),
(5, 'Update', '1', '11112', '1', '1', '1', '1', 'L', 'L', 'Islam', 'Islam', 'Pindah', 'Pindah', 19, 19, '2022-06-13 18:51:44', '2022-06-13 18:51:44', '2022-06-13 18:51:44'),
(6, 'Update', '11112', '11112', '1', '1', '1', 'aaaa', 'L', 'L', 'Islam', 'Islam', 'Pindah', 'Pindah', 19, 19, '2022-06-13 18:51:58', '2022-06-13 18:51:58', '2022-06-13 18:51:58'),
(7, 'Update', '11112', '11112', '1', '1', 'aaaa', 'aaaa', 'L', 'L', 'Islam', 'Islam', 'Pindah', 'Pindah', 19, 1, '2022-06-13 18:52:10', '2022-06-13 18:52:10', '2022-06-13 18:52:10'),
(8, 'Update', '11112', NULL, '1', NULL, 'aaaa', NULL, 'L', NULL, 'Islam', NULL, 'Pindah', NULL, 1, NULL, '2022-06-13 18:52:13', '2022-06-13 18:52:13', '2022-06-13 18:52:13');

--
-- Trigger `log_tbl_siswas`
--
DELIMITER $$
CREATE TRIGGER `hapusLogSiswa` BEFORE DELETE ON `log_tbl_siswas` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabel log log_tbl_siswas tidak bisa diubah';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `tampil_berita`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `tampil_berita` (
`id` bigint(20) unsigned
,`pembuat_berita` varchar(255)
,`foto_pembuat` varchar(255)
,`foto_berita` varchar(255)
,`judul` varchar(255)
,`deskripsi` text
,`waktu_publikasi` timestamp
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_akuns`
--

CREATE TABLE `tbl_akuns` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT 'user.png',
  `role` enum('Admin','Superadmin') NOT NULL DEFAULT 'Admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_akuns`
--

INSERT INTO `tbl_akuns` (`id`, `nama`, `email`, `password`, `foto`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2.jpg', 'Superadmin', '2022-06-01 21:44:24', '2022-06-13 11:55:02'),
(2, 'Vicky', 'vicky@gmail.com', '$2y$10$VnH7xWM4dG0aNr9YfMcv6O4t3TttSlIc740fFiqIt7FrFTM.LjLaC', 'user.png', 'Admin', '2022-06-02 05:31:53', '2022-06-02 05:31:53'),
(4, 'arief', 'arief@gmail.com', '$2y$10$BX/SP7YqOUzIa66FFQJKvu12rFFK7fa0Ivw8UMXmsy.BqMFHePf.u', 'user.png', 'Superadmin', '2022-06-13 10:46:48', '2022-06-13 10:46:48');

--
-- Trigger `tbl_akuns`
--
DELIMITER $$
CREATE TRIGGER `delete_akun` BEFORE DELETE ON `tbl_akuns` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_akuns 
		(aksi, nama_lama, email_lama, password_lama, foto_lama, role_lama, deleted_at)
	VALUES
		('Delete', OLD.nama, OLD.email, OLD.password, OLD.foto, OLD.role, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_akun` AFTER INSERT ON `tbl_akuns` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_akuns 
		(aksi, nama_baru, email_baru, password_baru, foto_baru, role_baru, created_at)
	VALUES
		('Insert', NEW.nama, NEW.email, NEW.password, NEW.foto, NEW.role, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_akun` AFTER UPDATE ON `tbl_akuns` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_akuns 
		(aksi, nama_lama, nama_baru, email_lama, email_baru, password_lama, password_baru, foto_lama, foto_baru, role_lama, role_baru, updated_at)
	VALUES
		('Update', OLD.nama, NEW.nama, OLD.email, NEW.email, OLD.password, NEW.password, OLD.foto, NEW.foto, OLD.role, NEW.role, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_beritas`
--

CREATE TABLE `tbl_beritas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_akun` tinyint(3) UNSIGNED NOT NULL,
  `foto` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_beritas`
--

INSERT INTO `tbl_beritas` (`id`, `id_akun`, `foto`, `judul`, `deskripsi`, `created_at`, `updated_at`) VALUES
(2, 1, 'ppdb.jpg', 'PPDB SMAN 9 Medan Jalur Domisili', '<p>Seleksi Jarak Domisili diperuntukkan bagi calon peserta didik baru SMK yang memprioritaskan jarak domisili ke sekolah tujuan berdasarkan alamat pada kartu keluarga yang diterbitkan paling singkat 1 (satu) tahun sebelum tanggal pendaftaran PPDB SMK Tahun Pelajaran 2022/2023.</p>', '2022-06-01 22:40:07', '2022-06-01 22:40:07'),
(4, 1, 'ppdb-sumut.jpg', 'PPDB Sumut 2022', '<p>Sebelum pelaksanaan proses pembelajaran awal tahun di Satuan Pendidikan dimulai, maka yang dilakukan oleh Satuan Pendidikan adalah kegiatan Penerimaan Peserta Didik Baru yang selanjutnya disingkat PPDB. PPDB pada Satuan Pendidikan Sekolah Menengah Atas, Satuan Pendidikan Sekolah Menengah Kejuruan, Satuan Pendidikan Khusus, dan Pendidikan Layanan Khusus merupakan kewenangan dan tanggungjawab dari Pemerintah Provinsi.</p>', '2022-06-01 23:23:49', '2022-06-01 23:23:49'),
(5, 1, 'ppdb-online.jpg', 'PPDB SMAN 9 Medan Jalur Zonasi', '<p>Jalur Zonasi diperuntukkan bagi calon peserta didik baru SMA yang memprioritaskan jarak domisili terdekat ke sekolah tujuan berdasarkan alamat pada kartu keluarga yang diterbitkan paling singkat 1 (satu) tahun sebelum tanggal pendaftaran PPDB SMA Tahun Pelajaran 2022/2023.</p>', '2022-06-01 23:24:35', '2022-06-13 10:49:49');

--
-- Trigger `tbl_beritas`
--
DELIMITER $$
CREATE TRIGGER `delete_berita` BEFORE DELETE ON `tbl_beritas` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_beritas 
		(aksi, id_akun_lama, foto_lama, judul_lama, deskripsi_lama, updated_at)
	VALUES
		('Delete', OLD.id_akun, OLD.foto, OLD.judul, OLD.deskripsi, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_berita` AFTER INSERT ON `tbl_beritas` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_beritas 
		(aksi, id_akun_baru, foto_baru, judul_baru, deskripsi_baru, created_at)
	VALUES
		('Insert', NEW.id_akun, NEW.foto, NEW.judul, NEW.deskripsi, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_berita` AFTER UPDATE ON `tbl_beritas` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_beritas 
		(aksi, id_akun_lama, id_akun_baru, foto_lama, foto_baru, judul_lama, judul_baru, deskripsi_lama, deskripsi_baru, updated_at)
	VALUES
		('Update', OLD.id_akun, NEW.id_akun, OLD.foto, NEW.foto, OLD.judul, NEW.judul, OLD.deskripsi, NEW.deskripsi, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_bidang_studis`
--

CREATE TABLE `tbl_bidang_studis` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nama_bidangStudi` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_bidang_studis`
--

INSERT INTO `tbl_bidang_studis` (`id`, `nama_bidangStudi`, `created_at`, `updated_at`) VALUES
(1, 'Pendidikan Agama', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(2, 'PKN', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(3, 'Bahasa Indonesia', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(4, 'Bahasa Inggris', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(5, 'Sejarah', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(6, 'Sosiologi', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(7, 'Ekonomi/Akuntansi', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(8, 'Geografi', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(9, 'Penjaskes', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(10, 'Seni Budaya', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(11, 'Matematika', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(12, 'Bahasa Jerman', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(13, 'Biologi', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(14, 'Fisika', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(15, 'Kimia', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(16, 'BP/BK', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(17, 'Prakarya/Kewirausahaan', '2022-05-29 12:44:23', '2022-05-29 12:44:23'),
(18, 'Piket/Pustakawan', '2022-05-29 12:44:23', '2022-05-29 12:44:23');

--
-- Trigger `tbl_bidang_studis`
--
DELIMITER $$
CREATE TRIGGER `delete_bidang_studi` BEFORE DELETE ON `tbl_bidang_studis` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_bidang_studis
		(aksi, nama_bidangStudi_lama, deleted_at)
	VALUES
		('Delete', OLD.nama_bidangStudi, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_bidang_studi` AFTER INSERT ON `tbl_bidang_studis` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_bidang_studis
		(aksi, nama_bidangStudi_baru, created_at)
	VALUES
		('Insert', NEW.nama_bidangStudi, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_bidang_studi` AFTER UPDATE ON `tbl_bidang_studis` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_bidang_studis
		(aksi, nama_bidangStudi_lama, nama_bidangStudi_baru, updated_at)
	VALUES
		('Insert', OLD.nama_bidangStudi, NEW.nama_bidangStudi, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_ekstrakurikulers`
--

CREATE TABLE `tbl_ekstrakurikulers` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nama_ekstrakurikuler` varchar(255) NOT NULL,
  `ikon` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_ekstrakurikulers`
--

INSERT INTO `tbl_ekstrakurikulers` (`id`, `nama_ekstrakurikuler`, `ikon`, `created_at`, `updated_at`) VALUES
(1, 'Paskibraka', 'paskribraka.svg', '2022-05-29 11:19:57', '2022-05-29 11:19:57'),
(2, 'Pramuka', 'pramuka.svg', '2022-05-29 11:22:40', '2022-05-29 11:22:40'),
(3, 'Rohis/Rokris', 'rohis.svg', '2022-05-29 11:23:15', '2022-05-29 11:23:15'),
(4, 'Teater Seni', 'teater-seni.svg', '2022-05-29 11:24:00', '2022-05-29 11:24:00'),
(5, 'Karate', 'karate.svg', '2022-05-29 11:24:13', '2022-05-29 11:24:13'),
(6, 'PMR', 'pmr.svg', '2022-05-29 11:24:45', '2022-05-29 11:24:45'),
(7, 'Futsal', 'futsal.svg', '2022-05-29 11:25:00', '2022-05-29 11:25:00'),
(8, 'Basket', 'basket.svg', '2022-05-29 11:25:25', '2022-05-29 11:44:00');

--
-- Trigger `tbl_ekstrakurikulers`
--
DELIMITER $$
CREATE TRIGGER `delete_ekstrakurikuler` BEFORE DELETE ON `tbl_ekstrakurikulers` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_ekstrakurikulers
		(aksi, nama_ekstrakurikuler_lama, ikon_lama, deleted_at)
	VALUES
		('Delete', OLD.nama_ekstrakurikuler, OLD.ikon, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_ekstrakurikuler` AFTER INSERT ON `tbl_ekstrakurikulers` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_ekstrakurikulers
		(aksi, nama_ekstrakurikuler_baru, ikon_baru, created_at)
	VALUES
		('Insert', NEW.nama_ekstrakurikuler, NEW.ikon, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_ekstrakurikuler` AFTER UPDATE ON `tbl_ekstrakurikulers` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_ekstrakurikulers
		(aksi, nama_ekstrakurikuler_lama, nama_ekstrakurikuler_baru, ikon_lama, ikon_baru, updated_at)
	VALUES
		('Update', OLD.nama_ekstrakurikuler, NEW.nama_ekstrakurikuler, OLD.ikon, NEW.ikon, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_fasilitas`
--

CREATE TABLE `tbl_fasilitas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_fasilitas` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_fasilitas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_fasilitas`
--

INSERT INTO `tbl_fasilitas` (`id`, `nama_fasilitas`, `foto_fasilitas`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Ruang Guru', 'ruang-guru.jpeg', 'Ruang guru sekolah SMAN 9 Medan', '2022-06-01 08:55:46', '2022-06-02 07:09:17'),
(2, 'Ruang Kelas', 'ruang-kelas.jpeg', 'Ruang kelas sekolah SMAN 9 Medan', '2022-06-01 08:56:53', '2022-06-01 08:56:53'),
(3, 'Ruang Kepala Sekolah', 'ruang-kepala-sekolah.jpeg', 'Ruang kepala sekolah SMAN 9 Medan', '2022-06-01 08:57:20', '2022-06-01 08:57:20'),
(4, 'Lab Komputer', 'lab-komputer.jpeg', 'Lab komputer sekolah SMAN 9 Medan', '2022-06-01 08:57:35', '2022-06-02 07:12:23'),
(5, 'Lab Fisika', 'lab-fisika.jpeg', 'Lab fisika sekolah SMAN 9 Medan', '2022-06-02 07:12:00', '2022-06-02 07:12:00'),
(6, 'Lab Biologi', 'lab-biologi.jpeg', 'Lab biologi sekolah SMAN 9 Medan', '2022-06-02 07:12:42', '2022-06-02 07:12:42'),
(7, 'Perpustakaan', 'perpustakaan.jpeg', 'Perpustakaan sekolah SMAN 9 Medan', '2022-06-02 07:13:16', '2022-06-02 07:13:16');

--
-- Trigger `tbl_fasilitas`
--
DELIMITER $$
CREATE TRIGGER `delete_fasilitas` BEFORE DELETE ON `tbl_fasilitas` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_fasilitas
		(aksi, nama_fasilitas_lama, foto_fasilitas_lama, deskripsi_lama, deleted_at)
	VALUES
		('Delete', OLD.nama_fasilitas, OLD.foto_fasilitas, OLD.deskripsi, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_fasilitas` AFTER INSERT ON `tbl_fasilitas` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_fasilitas
		(aksi, nama_fasilitas_baru, foto_fasilitas_baru, deskripsi_baru, created_at)
	VALUES
		('Insert', NEW.nama_fasilitas, NEW.foto_fasilitas, NEW.deskripsi, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_fasilitas` AFTER UPDATE ON `tbl_fasilitas` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_fasilitas
		(aksi, nama_fasilitas_lama, nama_fasilitas_baru, foto_fasilitas_lama, foto_fasilitas_baru, deskripsi_lama, deskripsi_baru, updated_at)
	VALUES
		('Update', OLD.nama_fasilitas, NEW.nama_fasilitas, OLD.foto_fasilitas, NEW.foto_fasilitas, OLD.deskripsi, NEW.deskripsi, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_gurus`
--

CREATE TABLE `tbl_gurus` (
  `nip` char(18) NOT NULL,
  `nama_guru` varchar(255) NOT NULL,
  `id_bidangStudi` tinyint(3) UNSIGNED NOT NULL,
  `gol_guru` varchar(5) NOT NULL,
  `ket_guru` enum('PNS','GTT APBD','GTT Komite') NOT NULL,
  `foto_guru` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_gurus`
--

INSERT INTO `tbl_gurus` (`nip`, `nama_guru`, `id_bidangStudi`, `gol_guru`, `ket_guru`, `foto_guru`, `created_at`, `updated_at`) VALUES
('196204211989031008', 'Drs. Darma Karyadi Sibuea', 3, 'IV/a', 'PNS', NULL, '2022-05-29 12:45:52', '2022-05-29 12:45:52'),
('196207041999031004', 'Joter Tondang, S.PdK ', 1, 'IV/a', 'PNS', NULL, '2022-05-29 12:45:52', '2022-05-29 12:45:52'),
('196208071987032005', 'Lailum Barida', 5, 'IV/a', 'PNS', NULL, '2022-05-29 12:45:52', '2022-05-29 12:45:52'),
('196210051986012001', 'Rosmalia, S.Pd', 5, 'IV/b', 'PNS', NULL, '2022-05-29 12:45:52', '2022-05-29 12:45:52'),
('196409292000032001', 'Ernita Simatupang', 1, 'IV/a', 'PNS', NULL, '2022-05-29 12:45:52', '2022-05-29 12:45:52'),
('197002082007012003', 'Elva Rosa, S.Pd', 2, 'III/b', 'PNS', NULL, '2022-05-29 12:45:52', '2022-05-29 12:45:52'),
('197608282010012006', 'Endang Purwosutanti, S.Pd', 2, 'III/b', 'PNS', NULL, '2022-05-29 12:45:52', '2022-05-29 12:45:52'),
('197804092008041002', 'Arifuddin, S.PdI', 1, 'III/d', 'PNS', NULL, '2022-05-29 12:45:52', '2022-05-29 12:45:52'),
('198203042010011016', 'Jusup Sitepu, S.Pd', 4, 'III/c', 'PNS', NULL, '2022-05-29 12:45:52', '2022-05-29 12:45:52'),
('198208262014112001', 'Mery Gusti Avelin Simanjuntak, S.Pd', 4, 'III/b', 'PNS', NULL, '2022-05-29 12:45:52', '2022-05-29 12:45:52');

--
-- Trigger `tbl_gurus`
--
DELIMITER $$
CREATE TRIGGER `delete_guru` BEFORE DELETE ON `tbl_gurus` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_gurus
		(aksi, nip_lama, nama_guru_lama, id_bidangStudi_lama, gol_guru_lama, ket_guru_lama, foto_guru_lama, deleted_at)
	VALUES
		('Delete', OLD.nip, OLD.nama_guru, OLD.id_bidangStudi, OLD.gol_guru, OLD.ket_guru, OLD.foto_guru, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_guru` AFTER INSERT ON `tbl_gurus` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_gurus
		(aksi, nip_baru, nama_guru_baru, id_bidangStudi_baru, gol_guru_baru, ket_guru_baru, foto_guru_baru, created_at)
	VALUES
		('Insert', NEW.nip, NEW.nama_guru, NEW.id_bidangStudi, NEW.gol_guru, NEW.ket_guru, NEW.foto_guru, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_guru` AFTER UPDATE ON `tbl_gurus` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_gurus
		(aksi, nip_baru, nip_lama, nama_guru_baru, nama_guru_lama, id_bidangStudi_baru, id_bidangStudi_lama, gol_guru_baru, gol_guru_lama, ket_guru_baru, ket_guru_lama, foto_guru_baru, foto_guru_lama, updated_at)
	VALUES
		('Update', NEW.nip, OLD.nip, NEW.nama_guru, OLD.nama_guru, NEW.id_bidangStudi, OLD.id_bidangStudi,  NEW.gol_guru, OLD.gol_guru, NEW.ket_guru, OLD.ket_guru, NEW.foto_guru, OLD.foto_guru, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `wali_kelas` char(18) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`id`, `nama`, `wali_kelas`, `created_at`, `updated_at`) VALUES
(1, 'X MIPA-1', '196204211989031008', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(2, 'X MIPA-2', '196207041999031004', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(3, 'X MIPA-3', '196207041999031004', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(4, 'X MIPA-4', '196208071987032005', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(5, 'X IPS-1', '196208071987032005', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(6, 'X IPS-2', '196210051986012001', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(7, 'X IPS-3', '196210051986012001', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(8, 'XI MIPA-1', '196409292000032001', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(9, 'XI MIPA-2', '196409292000032001', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(10, 'XI MIPA-3', '197002082007012003', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(11, 'XI MIPA-4', '197002082007012003', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(12, 'XI MIPA-5', '197608282010012006', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(13, 'XI MIPA-6', '197608282010012006', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(14, 'XI IPS-1', '197608282010012006', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(15, 'XI IPS-2', '197804092008041002', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(16, 'XI IPS-3', '197804092008041002', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(17, 'XII MIPA-1', '197804092008041002', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(18, 'XII MIPA-2', '198203042010011016', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(19, 'XII MIPA-3', '198203042010011016', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(20, 'XII MIPA-4', '198208262014112001', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(21, 'XII IPS-1', '198208262014112001', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(22, 'XII IPS-2', '198208262014112001', '2022-05-29 05:49:29', '2022-05-29 05:49:29'),
(23, 'XII IPS-3', '196204211989031008', '2022-05-29 05:49:29', '2022-05-28 23:28:27');

--
-- Trigger `tbl_kelas`
--
DELIMITER $$
CREATE TRIGGER `delete_kelas` BEFORE DELETE ON `tbl_kelas` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_kelas
		(aksi, nama_lama, wali_kelas_lama, deleted_at)
	VALUES
		('Delete', OLD.nama, OLD.wali_kelas, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_kelas` AFTER INSERT ON `tbl_kelas` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_kelas
		(aksi, nama_baru, wali_kelas_baru, created_at)
	VALUES
		('Insert', NEW.nama, NEW.wali_kelas, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_kelas` AFTER UPDATE ON `tbl_kelas` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_kelas
		(aksi, nama_lama, nama_baru, wali_kelas_lama, wali_kelas_baru, updated_at)
	VALUES
		('Update', OLD.nama, NEW.nama, OLD.wali_kelas, NEW.wali_kelas, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pegawais`
--

CREATE TABLE `tbl_pegawais` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nama_pegawai` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ket_pegawai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_pegawais`
--

INSERT INTO `tbl_pegawais` (`id`, `nama_pegawai`, `ket_pegawai`, `created_at`, `updated_at`) VALUES
(1, 'Indro', 'PTT', '2022-05-31 16:17:44', '2022-05-31 16:17:44'),
(2, 'Muhammad Arrasyid', 'PTT', '2022-05-31 16:17:44', '2022-05-31 16:17:44'),
(3, 'Nevia Rahma Praminda', 'PTT', '2022-05-31 16:20:44', '2022-05-31 16:20:44'),
(4, 'Sumadi', 'PTT', '2022-05-31 16:20:44', '2022-05-31 16:20:44'),
(6, 'Jasmanto Palepale', 'PTT', '2022-05-31 09:45:31', '2022-05-31 09:52:31');

--
-- Trigger `tbl_pegawais`
--
DELIMITER $$
CREATE TRIGGER `delete_pegawai` BEFORE DELETE ON `tbl_pegawais` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_pegawais 
		(aksi, nama_pegawai_lama, ket_pegawai_lama, deleted_at)
	VALUES
		('Delete', OLD.nama_pegawai, OLD.ket_pegawai, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_pegawai` AFTER INSERT ON `tbl_pegawais` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_pegawais 
		(aksi, nama_pegawai_baru, ket_pegawai_baru, created_at)
	VALUES
		('Insert', NEW.nama_pegawai, NEW.ket_pegawai, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_pegawai` AFTER UPDATE ON `tbl_pegawais` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_pegawais 
		(aksi, nama_pegawai_lama, nama_pegawai_baru, ket_pegawai_lama, ket_pegawai_baru, updated_at)
	VALUES
		('Update', OLD.nama_pegawai, NEW.nama_pegawai, OLD.ket_pegawai, NEW.ket_pegawai, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_prestasis`
--

CREATE TABLE `tbl_prestasis` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_prestasi` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_prestasis`
--

INSERT INTO `tbl_prestasis` (`id`, `nama_prestasi`, `deskripsi`, `created_at`, `updated_at`) VALUES
(3, 'Juara 1 Lomba Debat', '<p>Siswa SMAN 9 Medan, <strong>Albert Lukas Talupan Pangaribuan</strong> memenangkan Juara 1 Lomba Debat se-kota Medan.</p>', '2022-06-02 17:17:17', '2022-06-02 17:17:17');

--
-- Trigger `tbl_prestasis`
--
DELIMITER $$
CREATE TRIGGER `delete_prestasi` BEFORE DELETE ON `tbl_prestasis` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_prestasis
		(aksi, nama_prestasi_lama, deskripsi_lama, deleted_at)
	VALUES
		('Delete', OLD.nama_prestasi, OLD.deskripsi, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_prestasi` AFTER INSERT ON `tbl_prestasis` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_prestasis
		(aksi, nama_prestasi_baru, deskripsi_baru, created_at)
	VALUES
		('Insert', NEW.nama_prestasi, NEW.deskripsi, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_prestasi` AFTER UPDATE ON `tbl_prestasis` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_prestasis
		(aksi, nama_prestasi_lama, nama_prestasi_baru, deskripsi_lama, deskripsi_baru, updated_at)
	VALUES
		('Update', OLD.nama_prestasi, NEW.nama_prestasi, OLD.deskripsi, NEW.deskripsi, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_siswas`
--

CREATE TABLE `tbl_siswas` (
  `nis` char(5) NOT NULL,
  `nisn` char(10) NOT NULL,
  `nama_siswa` varchar(255) NOT NULL,
  `jk_siswa` enum('L','P') NOT NULL,
  `agama_siswa` enum('Islam','Kristen','Hindu','Buddha') NOT NULL,
  `ket_siswa` enum('Aktif','Tidak Aktif','Mengundurkan Diri','Pindah','Dikeluarkan') NOT NULL,
  `id_kelas` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_siswas`
--

INSERT INTO `tbl_siswas` (`nis`, `nisn`, `nama_siswa`, `jk_siswa`, `agama_siswa`, `ket_siswa`, `id_kelas`, `created_at`, `updated_at`) VALUES
('11111', '11111111', 'BARUNA ARUTALA', 'L', 'Islam', 'Aktif', 1, '2022-05-30 10:06:29', '2022-06-13 10:56:05'),
('13519', '47549572', 'AMELIA DIAN LARASATI', 'P', 'Islam', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13521', '51341680', 'Andhika Wira Yudha', 'L', 'Islam', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13522', '54426536', 'ANDREW PRAWIRA TINAMBUNAN', 'L', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13523', '50893400', 'ANDRIANO JOSUA TARIGAN', 'L', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13524', '69707039', 'AQILAH DEFIYANTI', 'P', 'Islam', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13525', '55982798', 'ARIEL ALEXANDRIA TAMPUBOLON', 'L', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13527', '45890569', 'BAGAS ASHARI DAULAY', 'L', 'Islam', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13528', '50893363', 'CHRISTIAN RAHMAT SIBORO', 'L', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13529', '67298856', 'DANIEL MARTOGI SIMATUPANG', 'L', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13530', '53673044', 'ESTER OKTAFIA ZAI', 'P', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13531', '50893375', 'GABRIEL F STEVANUS SIHOMBING', 'L', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13532', '52165215', 'GILBERT EPHANT SITOHANG', 'L', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13533', '51894457', 'GITA SUCI ANDINI', 'P', 'Islam', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13535', '59486324', 'Hertorida .A. Aritonang', 'P', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13536', '60035263', 'IBNU ABDAN SAFII', 'L', 'Islam', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13537', '52494722', 'INDAH SYAFITRI', 'P', 'Islam', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13538', '43879824', 'JAHIA BERTON EDGAR SIBARANI', 'L', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13540', '50812662', 'KENYA ASTRI NABILLA', 'P', 'Islam', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13541', '50893367', 'LEO BINSAR HARA TUA SIRINGO-RINGO', 'L', '', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13542', '60035649', 'Maqdalene W J Br Pakpahan', 'P', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13543', '62085390', 'MHD FADELAN', 'L', 'Islam', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13546', '53014931', 'MUHAMMAD RIZALDI', 'L', 'Islam', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13547', '50614528', 'MUTHIAH ALIFAH', 'P', 'Islam', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13548', '51673465', 'Nabila', 'P', 'Islam', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13549', '51825307', 'NURUL', 'P', 'Islam', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13550', '56074011', 'PODA THEO HAMONANGAN PERANGIN ANGIN', 'L', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13551', '53073085', 'ROSALINDA FORTUNA SILITONGA', 'P', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13552', '53433449', 'Sabrina Sitompul', 'P', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13553', '44854038', 'YUDA YUSTICIA KARO-KARO', 'L', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13554', '69760136', 'ABED NEGO NAPITUPULU', 'L', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13555', '46164135', 'ADARANNA NATALIA DESSABWA SIREGAR', 'P', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13556', '55335513', 'ADEL NATHASYA SITANGGANG', 'P', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13557', '55864093', 'Adelia Putri Mamahit', 'P', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13558', '51508066', 'ADINA HUSNA JP HARAHAP', 'P', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13559', '55897787', 'AHMAD HERU GINTING', 'L', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13560', '53430680', 'AINARO ANDRIO MANIHURUK', 'L', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13561', '51496326', 'ALFINA NUR', 'P', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13562', '58603672', 'alivia sahputri', 'P', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13563', '53865832', 'AMANDA RIZKI AGUSTINA', 'P', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13564', '51416278', 'Anggi Sandriani Br Harahap', 'P', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13565', '69379501', 'APRIANI BR SIPAHUTAR', 'P', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13566', '68996166', 'APRIANTI BR SIPAHUTAR', 'P', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13567', '50817715', 'ARIEF CAHAYANDA', 'L', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13568', '56876998', 'ARINA ULFA HASANAH HASIBUAN', 'P', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13569', '59355144', 'ASRIANTI PRATIWI', 'P', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13570', '62431817', 'BERLLY RIDHOI SIAHAAN', 'P', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13571', '53424133', 'BINTAN ZAHARA', 'P', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13572', '53179557', 'CEVIN RAFAEL MARPAUNG', 'L', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13573', '55563611', 'DIANA AGATHA NAINGGOLAN', 'P', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13574', '54968891', 'FADLAN KHAIRI', 'L', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13577', '43992129', 'GILBERT ATTILA JOSHUA S', 'L', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13578', '61676783', 'Ian Cristian Tarigan', 'L', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13579', '42952023', 'IMELDA PUTRI NDRAHA', 'P', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13580', '50893374', 'JOSUA DIO LAURENSIUS SIHOMBING', 'L', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13581', '46813945', 'KEVIN SIMANJUNTAK', 'L', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13582', '3057848174', 'May Zahara Safriani', 'P', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13583', '56138981', 'MHD UMAR', 'L', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13584', '54531828', 'Nanda Maulana Hsb', 'L', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13585', '52751517', 'NOVIA CHRISTY NABABAN', 'P', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13586', '67111122', 'NURUL RAHMADHANI NURFIK', 'P', 'Islam', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13587', '46933049', 'Only Erlayasi Siahaan', 'P', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13588', '47042475', 'SAMUEL FRANS YENRIKO', 'L', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13589', '57489206', 'YUDISTIRA IYAN FRANCISKUS SINAGA', 'L', 'Kristen', 'Aktif', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13590', '56748696', 'AMELIA FEDORA HASIBUAN', 'P', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13591', '50893404', 'ANDRE SINURAT', 'L', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13592', '53620362', 'AURELIA DESI MALAU', 'P', '', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13593', '53179543', 'AYU  WULANDARI', 'P', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13594', '54663739', 'BAYU LESMANA', 'L', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13595', '9013528151', 'CHARENSIA KRISTIANI NAPITUPULU', 'P', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13596', '56008595', 'CRICIA GITA ULINA BR SIMANJUNTAK', 'P', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13598', '46772902', 'DANIEL SOLIN', 'L', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13599', '28312833', 'Darti Perawati Tamba', 'P', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13600', '57393531', 'DAUD YOGI LUBIS', 'L', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13601', '50493957', 'DAVID PANJAITAN', 'L', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13602', '55466653', 'DELLA TRY ANGGRAINI', 'P', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13603', '47131910', 'DEO GILANG RAMADAN', 'L', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13604', '56191298', 'DESI NATALIA Br SIMBOLON', 'P', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13605', '56749537', 'DEWI ARTHA DINATA SAMOSIR', 'P', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13606', '60035652', 'DIKA RAHEL AVRILIA SITUMEANG', 'P', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13607', '52287532', 'DIMAS ANDREAN', 'L', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13608', '69076106', 'DIMAS ANDREAS SIMBOLON', 'L', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13609', '53492574', 'DIMAS HUTABARAT', 'L', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13610', '75247809', 'DIPA MARGARETHA OKTAVIA PARAPAT', 'P', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13611', '59347819', 'DITA DWI PURWANTI', 'P', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13612', '54881541', 'Dwi Syahfitri', 'P', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13613', '54743445', 'ELSADHAI BR SIMBOLON', 'P', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13614', '62545617', 'ERIKA SIMANJUNTAK', 'P', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13615', '51160332', 'FADYA RAHMAH', 'P', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13616', '55343388', 'FAIZ FADIHILLAH', 'L', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13617', '68143207', 'FAUZI BINTARA JUNAIDI', 'L', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13618', '64321699', 'Febry Fahrezy', 'L', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13619', '47020545', 'GHAZALI NAIBAHO', 'L', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13620', '51918701', 'GHINA PUTRI EFENDI', 'P', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13621', '48642161', 'Guntur Parsaulian Tanjung', 'L', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13623', '66658196', 'KANAYA TITANIA', 'P', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13624', '51486750', 'KHAIRIL LUKMAN', 'L', 'Islam', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13625', '58131717', 'YOSEPH PRATAMA SITINDAON', 'L', 'Kristen', 'Aktif', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13626', '60237435', 'CHINTYA BR SIBARANI', 'P', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13627', '56001116', 'FRISKILA BR GURNING', 'P', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13628', '56944485', 'GLORI CAHAYA GULTOM', 'P', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13629', '55486321', 'GRISELA LAURENSIA BR SILITONGA', 'P', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13630', '58652205', 'IMEL FEBRIANTI LUMBAN TOBING', 'P', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13631', '50893385', 'JENIUS SIMAMORA', 'L', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13632', '64712054', 'JESEN HAIKAL JAYA SIANIPAR', 'L', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13633', '66554285', 'JESSICA ANGGRIANI LUMBANTOBING', 'P', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13634', '42200169', 'JOSEF REPENTER NAINGGOLAN', 'L', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13635', '52762377', 'JOSEP RIFALDI SIMAMORA', 'L', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13636', '53492599', 'JUANA HUTAJULU', 'P', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13637', '43687541', 'JUL KIPLI MALAU', 'L', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13638', '51757506', 'KARTIKA SARI SINAGA', 'P', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13639', '58983642', 'KEVIN MATONDANG', 'L', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13640', '52996598', 'KRISTIAN SIMATUPANG', 'L', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13641', '53280763', 'LENNY BR TOHANG', 'P', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13642', '58408247', 'M. KHAIRIL SAM', 'L', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13643', '51622650', 'MUHAMMAD ALBAKHRI RAMADHAN', 'L', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13646', '60091353', 'MUHAMMAD REVA SYAHPUTRA BATE\'E', 'L', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13647', '51514815', 'MUHAMMAD RIDWAN AL FARIZI', 'L', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13648', '50813002', 'MUHAMMAD RIFQI AZMI', 'L', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13649', '53179540', 'MUTIA FADILLA', 'P', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13650', '54421402', 'Nabila Firka Hasibuan', 'P', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13651', '57187498', 'Nabila Zahra', 'P', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13652', '60199692', 'Naila Zhafira Yasmin Mamahit', 'P', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13654', '67840728', 'Nazla Sabila', 'P', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13655', '57578345', 'NURUL AZMI SHAPUTRI', 'P', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13656', '56558436', 'NURUL HIDAYAH', 'P', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13657', '48755822', 'PUTRA ZULIA', 'L', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13658', '46575540', 'PUTRI ADINA', 'P', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13659', '61164003', 'RAHMAYANTI', 'P', 'Islam', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13660', '50893369', 'RICO ANDRIANO SIBORO', 'L', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13661', '53430671', 'ROY GANDA TUA PERNANDO MALAU', 'L', 'Kristen', 'Aktif', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13662', '46669478', 'BERLIAN HENDERINA', 'P', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13663', '47333873', 'GABRIEL SINURAT', 'L', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13664', '57123798', 'LUIS PERNANDO PURBA', 'L', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13665', '58201198', 'MARIA DESRINA SINAGA', 'P', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13666', '52996576', 'Maria Helena Gultom', 'P', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13667', '55276532', 'Michael Zuan Geri Siahaan', 'L', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13668', '52534286', 'Monalisa Karamoy', 'P', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13669', '53492585', 'NADYA MARGARETHA PARDEDE', 'P', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13670', '56974624', 'NOVENA CRISTANTI NABABAN', 'P', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13671', '53492573', 'PUTRI POLINA BR GINTING MUNTHE', 'P', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13673', '52479320', 'RANGGA ANUGRAH SHAHTY', 'L', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13674', '43886271', 'Rangga Ramadhan', 'L', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13675', '59653703', 'RANI ANGGRAINI', 'P', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13676', '54787652', 'RAnty Ayu Kirani', 'P', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13677', '33069240', 'RIA IRENA AGUSTINA SILABAN', 'P', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13678', '56916518', 'RICARDO ARITONANG', 'L', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13679', '55876756', 'RINDI YOBELISTA TAMBUNAN', 'P', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13680', '53430677', 'RIO CHAROLUS LUMBAN RAJA', 'L', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13681', '65231796', 'RISCA', 'P', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13682', '69095523', 'Rita Yana Nasution', 'P', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13683', '59585690', 'RIZKI AMELIA ANANDA TAMBUNAN', 'P', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13684', '52754396', 'RIZKI NOEL PARDAMEAN PANJAITAN', 'P', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13685', '51013912', 'ROMA ULINA BR SAGALA', 'P', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13686', '55044857', 'SAKINAH', 'P', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13687', '46819811', 'SALSABILA RAGILIA PUTRI', 'P', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13688', '62297908', 'SALWA MUZZALIPA HASENA', 'P', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13689', '44824088', 'SANDY DESPIAN PERMANA', 'L', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13690', '51534781', 'SHESILIA ANGELICA L. TOBING', 'P', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13691', '55998007', 'SITI RAMADHANI', 'P', 'Kristen', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13692', '62268922', 'SRI SAKINAH', 'P', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13693', '66758551', 'SUSANTI', 'P', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13694', '56362190', 'TASYA ARDILA', 'P', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13695', '62639399', 'Tiara Indah Lestari Pane', 'P', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13696', '60035650', 'TRINDAH AINI RUSKA', 'P', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13697', '54906352', 'TSABITAH TRI WULANDARI', 'P', 'Islam', 'Aktif', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13699', '56276533', 'Amri Oktavianus Sianipar', 'L', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13701', '58714966', 'Aron Noris Siregar', 'L', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13702', '64767385', 'AUDREY SAPIRA', 'P', 'Islam', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13703', '48323681', 'BENRI REVAEL PANDAPOTAN AMBARITA', 'L', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13704', '3054574765', 'Bulan Rizki Rahmadani Sembiring', 'P', 'Islam', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13705', '49701774', 'DANI LABERDO CHRISTIAN SIMANJUNTAK', 'L', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13707', '46963862', 'DONI LABERDO CHRISTIAN SIMANJUNTAK', 'L', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13708', '55914924', 'Felix Natan Asimido Sagala', 'L', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13709', '64554929', 'FIRA DESIKA BR BUKIT', 'P', 'Islam', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13710', '59849334', 'Jesica Andriani Sitorus', 'P', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13711', '53609304', 'Linda Lestari Siregar', 'P', 'Islam', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13712', '68782249', 'Lucia Maura Nathalie', 'P', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13714', '45219221', 'NURUL CAHAYA', 'P', 'Islam', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13715', '54300532', 'PUTRI MEY SARAH', 'P', 'Islam', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13716', '44794219', 'ROSMERYA PASARIBU', 'P', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13717', '50893405', 'SABRINA NATALI SINAGA', 'P', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13718', '52439961', 'SAMUEL DONGAN PARULIAN TAMBUNAN', 'L', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13719', '59740638', 'SAMUEL RIVALDO SIMANJUNTAK', 'L', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13720', '53430668', 'SANTA ANGELA ROYTO SILABAN', 'P', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13721', '54403600', 'SARA STEFANY TAMPUBOLON', 'P', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13722', '53492592', 'SHYNTIA SINAGA', 'P', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13724', '45399400', 'TAMARA SARAGIH', 'P', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13725', '57767686', 'TESA LONIKA B.MANALU', 'P', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13726', '49319154', 'TOMY RENALDI JENIUS SIMAMORA', 'L', '', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13727', '58921249', 'TWENI NOVIANTIKA SIREGAR', 'P', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13728', '46979659', 'VALCA SITANGGANG', 'L', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13729', '51237738', 'VETRICIA AUDREY NATALIA BR. TOBING', 'P', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13730', '58050150', 'WANDA NUR AKILA KUSTIAWAN', 'P', 'Islam', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13731', '53964453', 'WIDIA APRIANINGSIH SIHOMBING', 'P', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13732', '67285042', 'YOHANA SAFENIA SIAHAAN', 'P', 'Kristen', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13733', '53492992', 'YUDI PRIMA SIREGAR', 'L', 'Islam', 'Aktif', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13850', '', 'ABYYU FARRAS', 'L', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13851', '', 'AHMAD FAQIH', 'L', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13852', '', 'AHMAD ZIBRIL MOURI D\'ARMAN', 'L', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13853', '', 'ANDREAS CRISTOPEL PASARIBU', 'L', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13854', '', 'ARDIAN ABDILAH', 'L', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13855', '', 'ARSYA MEDIKA BUTAR BUTAR', 'P', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13856', '', 'Arya Dzil Ikram Marpaung', 'L', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13857', '', 'AZIRA TRI AFSARY', 'P', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13858', '', 'DAVINA AZZAHRA NAULI', 'P', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13859', '', 'FAHRI PRASETYA', 'L', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13860', '', 'FITRYA RAMADANI', 'P', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13861', '', 'GRIMONIA HANS GILLY SIRAIT', 'P', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13862', '', 'HAIKAL ZAIN HAWARI SIREGAR', 'L', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13863', '', 'HAIKAL ZAIN HAWARI SIREGAR', 'L', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13864', '', 'INTAN ZAHARA', 'P', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13865', '', 'JELITA ADELIMA Br.SIMANJUNTAK', 'P', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13866', '', 'JESSICA CATRINA SITORUS', 'P', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13867', '', 'JOHAN FEBRIAN SIREGAR', 'L', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13868', '', 'JOSE ALBERTO SINAMBELA', 'L', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13869', '', 'JOSEF TORA TAMBUNAN', 'L', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13870', '', 'MARTA RELINA BR SIAGIAN', 'P', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13871', '', 'MHD. RASYA SIMATUPANG', 'L', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13872', '', 'MIKA FLORENSIA BR NAINGGOLAN', 'P', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13873', '', 'MUTHIA ISNAENI KOTO', 'P', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13874', '', 'NABILA NUR FADIA', 'P', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13875', '', 'NAQIYA FAIRUZA', 'P', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13876', '', 'NOVA AULIA YANTI', 'P', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13877', '', 'PANCA BADIANSYAH SIMANJUNTAK', 'L', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13878', '', 'PASKAULY SINURAT', 'P', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13879', '', 'PHOIBE KLEYNOV CHRISTI BUTAR BUTAR', 'P', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13880', '', 'RAHMANSYAH', 'L', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13881', '', 'SANTAH GREASYA BR SIANIPAR', 'P', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13882', '', 'SASTA OKTAVIA HASIBUAN', 'P', 'Kristen', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13883', '', 'YOGA NAWARISA PINEM', 'P', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13884', '', 'ZHAFIRAH RAMADHANI', 'P', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13885', '', 'ZIAN IKRIMAH', 'P', 'Islam', 'Aktif', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13886', '', 'ADINDA BR PANE', 'P', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13887', '', 'AMANDA', 'P', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13888', '', 'ARIEL PARLUHUTAN TAMBUNAN', 'L', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13889', '', 'ASTI RESTU FATIMAH', 'P', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13890', '', 'AWALUDDIN HASYIM', 'L', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13891', '', 'BASTIAN HARYONO SILITONGA', 'L', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13892', '', 'BELLA NAYSILLA SIRINGO RINGO', 'P', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13893', '', 'BUNGA SYAFRUN WILDA', 'P', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13894', '', 'CHATRINE SIERA OKTAVIANA PURBA', 'P', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13895', '', 'CINDY REGREENA MUNTHE', 'P', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13896', '', 'DINI NABILA', 'P', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13897', '', 'DWI PERMATA SARI L. TOBING', 'P', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13898', '', 'FAREL', 'L', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13899', '', 'FATHUR RAHZA MATONDANG', 'L', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13900', '', 'HASSANDRO SIMAMORA', 'L', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13901', '', 'HEVITA AYU ARUNI SIAHAAN', 'P', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13902', '', 'HISKIA RAHMADANI', 'P', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13903', '', 'ILARY MARGARET SIMANJUNTAK', 'P', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13904', '', 'KEZIA ANGGITA NABABAN', 'P', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13905', '', 'MUHAMMAD HARIRI', 'L', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13906', '', 'MUHAMMAD REVAN', 'L', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13907', '', 'NOVA JOSEVIA PARDEDE', 'P', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13908', '', 'NUR ABSYAHRAH', 'P', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13909', '', 'NURHALIZAH', 'P', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13910', '', 'PANDU AURY SAPUTRA CANIAGO', 'L', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13911', '', 'PUTRI LISTIAWATI', 'P', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13912', '', 'PUTRI NINGSIH ANGGRAINI MARBUN', 'P', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13913', '', 'RAHMA AUDYA MAULIDA', 'P', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13914', '', 'RIFKA MAYSU SAMOSIR', 'P', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13915', '', 'RIRIN BINTANG MARPAUNG', 'P', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13916', '', 'SAMUEL LEONARDO SIRAIT', 'L', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13917', '', 'SHELLY VANYA SIHOMBING', 'P', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13918', '', 'SITI NAJWA', 'P', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13919', '', 'STEVEN IMMANUEL SIAHAAN', 'L', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13920', '', 'SUCITA RAHMA BR. GULTOM', 'P', 'Islam', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13921', '', 'URBA SARI', 'P', 'Kristen', 'Aktif', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13922', '', 'ALBERT DANUARTA BUTAR BUTAR', 'L', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13923', '', 'ALEX ROLAND BAKARA', 'L', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13924', '', 'ALINISA KUSWANDARI', 'P', 'Islam', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13925', '', 'ANGELIA ROTUA LUMBAN BATU', 'P', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13926', '', 'ARDANA BANJARNAHOR', 'L', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13927', '', 'ARTIKA SYAHRANI S. PARANGIN ANGIN', 'P', 'Islam', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13928', '', 'ANGELIA ROTUA LUMBAN BATU', 'P', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13929', '', 'DWI FEBRINA SAHPUTRI ', 'P', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13930', '', 'ELISA TESSALONIKA MARBUN', 'P', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13931', '', 'GERY LUKAS PAHOTTON HUTASOIT', 'L', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13932', '', 'GINA ARINI', 'P', 'Islam', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13933', '', 'HANNA GABRIELLA BR MANURUNG', 'P', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13934', '', 'JELITA ANGELIA SITUMEANG', 'P', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13935', '', 'JULIANA BR. SIMBOLON', 'P', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13936', '', 'KANIA PUTRI AYU', 'P', 'Islam', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13937', '', 'KHAIRUL PRATAMA SIREGAR', 'L', 'Islam', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13938', '', 'LOUIZ STEVAN SINAMBELA', 'L', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13939', '', 'LUNA INDRIANI NAPITUPULU', 'P', 'Islam', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13940', '', 'MARCO FAEL SATRIA NAPITUPULU', 'L', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13941', '', 'MELISA WULANDINI GULTOM', 'P', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13942', '', 'METHA ARDIAN SEPTARI SILALAHI', 'P', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13943', '', 'MICHAEL APANDY HUTAPEA', 'L', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13944', '', 'NADYA SAFWAH', 'P', 'Islam', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13945', '', 'NAZWA AMALIA SIMATUPANG', 'P', 'Islam', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13946', '', 'OLIVIA SIHOMBING', 'P', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13947', '', 'PATUAN RADJA DOLLY MARPAUNG', 'L', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13948', '', 'PUAN MAHARANI ASSYUARA', 'P', 'Islam', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13949', '', 'PUTRI NABILLAH PANE', 'P', 'Islam', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13950', '', 'RAMADHANI SUKMA', 'P', 'Islam', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13951', '', 'RENATA NAINGGOLAN', 'P', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13952', '', 'RIAN RIYADI', 'L', 'Islam', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13953', '', 'ROMA ITO SIPAHUTAR', 'P', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13954', '', 'SATRIA ANDIKA DAMANIK', 'L', 'Islam', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13955', '', 'SEFANYA MARDA GLORY SITOHANG', 'P', 'Kristen', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13956', '', 'SIHOL NANDITO PURBA', 'L', 'Islam', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13957', '', 'TASYA SALSADILA', 'P', 'Islam', 'Aktif', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13958', '', 'ADITYA BLESSIN PASKAH SITOPU', 'L', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13959', '', 'AGNES MUTIARA SITUMORANG', 'P', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13960', '', 'ALFIAN HADI', 'L', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13961', '', 'ANDIKA FIRMAN SIHOMBING', 'L', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13962', '', 'ANDIKA SIAGIAN', 'L', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13963', '', 'BULAN APRIANTI GINTING', 'P', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13964', '', 'CLARA MAGDALENA PANGGABEAN', 'P', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13965', '', 'DANIEL OBRIENT PANJAITAN', 'L', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13966', '', 'DEVI GRACELLA NAINGGOLAN', 'P', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13967', '', 'DHYVANI KUSNANDA', 'P', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13968', '', 'DINDA FELISHA PASARIBU', 'P', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13969', '', 'FITRI ANISA AHMAD', 'P', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13970', '', 'GERIN ANGGRAINI', 'P', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13971', '', 'HAYCAL SARAGIH', 'L', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13972', '', 'INDA DAMAYANTI SIMBOLON', 'P', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13973', '', 'INDRIATI OCTAVIANI SIMANJUNTAK', 'P', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13974', '', 'JOHAN PARULIAN PANJAITAN', 'L', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13975', '', 'JOVIN AREKSA RAMADHAN LIWANDA', 'L', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13976', '', 'JOYCE LIDYA PATRICIA DAELI', 'L', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13977', '', 'M. AKBAR KHARISMA RAFLI', 'L', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13978', '', 'MAWAR ARTAULI SIMANJUNTAK', 'P', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13979', '', 'MHD. NOVRIZAL KHADAFI', 'L', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13980', '', 'MONA ARTA SITORUS', 'P', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13981', '', 'MUHAMMAD NUR ZAHRI', 'L', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13982', '', 'MUHAMMAD WILLY WIJARDI', 'L', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13983', '', 'NAILA AMANDA BR BATUBARA', 'P', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13984', '', 'NAYLA AZ ZAHRA', 'P', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13985', '', 'NESYA AMANDA', 'P', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13986', '', 'ROBERTO CARLOS SIMANJUNTAK', 'L', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13987', '', 'RUTHMAIDA CHAYANI BR GULTOM', 'P', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13988', '', 'SARIDA ZAI', 'P', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13989', '', 'SARTIA BORU SIMARMATA', 'P', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13990', '', 'SILVI DARMAWATI LUMBAN TOBING', 'P', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13991', '', 'SRI AULIA', 'P', 'Islam', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13992', '', 'TERESA PRATIWI HUTAURUK', 'P', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13993', '', 'YOEL RENOL SITINDAON', 'L', 'Kristen', 'Aktif', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13994', '', 'AGUSTIAN MARPAUNG', 'L', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13995', '', 'AHMAD ALFARUNI BARUS', 'L', 'Islam', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13996', '', 'ALLYAH GEA RAMADHANI', 'P', 'Islam', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13997', '', 'ALVIN PUTRA SIHALOHO', 'L', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13998', '', 'Asya Amanda Putri', 'P', 'Islam', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('13999', '', 'BRIGITHA ANGELIKA PANJAITAN', 'P', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14000', '', 'Clara Intan Apriani Simbolon', 'P', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14001', '', 'Egi Adinda Putri', 'P', 'Islam', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14002', '', 'EVAN ANDREAS NAINGGOLAN', 'L', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14003', '', 'FAISAL RIDHO ZALIANDA', 'L', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14004', '', 'HEMAT PARSINTONGAN PASARIBU', 'L', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14005', '', 'HERI KURNIAWAN SITUMEANG', 'L', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14006', '', 'IMA PUTRI AMBARITA', 'P', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14007', '', 'JOHAN ISWARA SIANIPAR', 'L', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14008', '', 'Jonathan Sianturi', 'L', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14009', '', 'KAMISA', 'P', 'Islam', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14010', '', 'KEYSA AULIA PUTRI HARAHAP', 'P', 'Islam', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14011', '', 'M. DAFFA AR RAHMAN PRATAMA', 'L', 'Islam', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14012', '', 'M. ZACKI FADILLAH', 'L', 'Islam', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14013', '', 'MARTHA AGNES MONICA Br SIMAMORA', 'P', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14014', '', 'Meliana Putri Pasaribu', 'P', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14015', '', 'MHD. Reyhan Apriliansyah', 'L', 'Islam', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14016', '', 'MUHAMMAD FADIL', 'L', 'Islam', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14017', '', 'MULIA SUMIAR SIMBOLON', 'L', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14018', '', 'NAOMI RUGUN VALENTINA SITORUS', 'P', '', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14019', '', 'NATALIA RATNA SARI MANURUNG', 'P', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14020', '', 'NATASYA ANGELINA PUTRI SINAGA', 'P', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14021', '', 'Oloan Dapit Waltin Tamba', 'L', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14022', '', 'PUTRI SINAGA', 'P', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14023', '', 'RAFAEL CRESVO ARUAN', 'L', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14024', '', 'REY MAHENDRA MARPAUNG', 'L', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14025', '', 'REYNALDO MARK NAINGGOLAN', 'L', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14026', '', 'Rizcy Putratama Immanuel Nababan', 'L', '', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14027', '', 'SHERIL ADINDA ZAHWA', 'P', 'Islam', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14028', '', 'SRI WURI HANDAYANI', 'P', 'Islam', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14029', '', 'VINSENSIUS FRESCILA', 'L', 'Kristen', 'Aktif', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14030', '', 'Abel Agustin', 'L', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14031', '', 'ADELINA RIANI SINAGA', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14032', '', 'AISYAH AMELIA', 'P', 'Islam', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14033', '', 'CHRISTIN TIARA SIJABAT', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14034', '', 'DAFA HERLINO SRIATMAJA LUBIS', 'L', 'Islam', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14035', '', 'DAVID MORALES BUTAR-BUTAR', 'L', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14036', '', 'DIPAN SUMARSONO PANJAITAN', 'L', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14037', '', 'ELISA NIA SITUMEANG', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14038', '', 'ELVA YOHANA PANGARIBUAN', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14039', '', 'EVA LUSIANA SINAGA', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14040', '', 'FADLI ANDREAS HORONI', 'L', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14041', '', 'FARHAN SULAIMAN', 'L', 'Islam', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14042', '', 'FRANSISCO ANDIKA SINAGA', 'L', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14043', '', 'FRISKA BR SORMIN', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14044', '', 'GRESELA BR SIBARANI', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14045', '', 'IMAN ARYA PUTRA SILITONGA', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14046', '', 'Kasfil Azis', 'L', 'Islam', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14047', '', 'LISA AIRIN NAHAMPUN', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14048', '', 'MHD.ALFARRAIL PUTRA', 'L', 'Islam', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14049', '', 'Mutia Sari Limongga', 'P', 'Islam', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14050', '', 'Nadia Ayu Safitri', 'P', 'Islam', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14051', '', 'NORA LUCIA PANGARIBUAN', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14052', '', 'NOVTI AHNY SARAGI', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14053', '', 'OKTAVIANI PANJAITAN', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14054', '', 'Qaila Olivia S', 'P', 'Islam', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14055', '', 'Qowi Masyahid', 'L', 'Islam', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14056', '', 'Reebecca Tiara Sitorus', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14057', '', 'RIASI OCTAVIAN', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14058', '', 'RUBEN HATOGUAN SIHOTANG', 'L', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14059', '', 'RUGUN RALIN AMELIA OMPUSUNGGU', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14060', '', 'Safira Zitia', 'P', 'Islam', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14061', '', 'Sahira Fharunisa', 'P', 'Islam', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14062', '', 'Shinta Wulan Br Tarigan', 'P', 'Kristen', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14063', '', 'Sulistia Rahmaini', 'P', 'Islam', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14064', '', 'T MHD HAIKAL MULKI MUDA', 'L', 'Islam', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14065', '', 'Tiara Sabika Anhar', 'P', 'Islam', 'Aktif', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14066', '', 'ALDI FAUZAN', 'L', 'Islam', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14067', '', 'ARIES ARDIANSYAH', 'L', 'Islam', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14068', '', 'BERNIKE ESTER FLORENCIA BR.SIMANJUNTAK', 'P', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14069', '', 'daniel marojahan t pandiangan', 'L', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14070', '', 'Farradina Alya', 'P', 'Islam', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14071', '', 'FERDI ANSAH LUBIS', 'L', 'Islam', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14072', '', 'FILDZAH NABILA TAUFIK', 'P', 'Islam', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14073', '', 'Gabriel Lewis Armando Siagian', 'L', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14074', '', 'GABRIEL NICHOLAS SITORUS', 'L', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14075', '', 'Hengki Kurniawan', 'L', 'Islam', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14076', '', 'HOLBEN SUNU DAMANIK', 'L', 'Islam', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14077', '', 'HOTDISON SILITONGA', 'L', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14078', '', 'JOSUA ANGGRO SIMANJUNTAK', 'L', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14079', '', 'JOSUA SIHOMBING', 'L', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14080', '', 'JUAN FRANS RIQUELMI MARPAUNG', 'L', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14081', '', 'JULIUS KRISTIANUS NAINGGOLAN', 'L', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14082', '', 'Khairul Amri', 'L', 'Islam', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14083', '', 'KLOSE JODI MANURUNG', 'L', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14084', '', 'LEONI MARGARETA SAMOSIR', 'P', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14085', '', 'Martha Sihombing', 'P', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14086', '', 'PUTRI CHRISTINA BR TUMANGGOR', 'P', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14087', '', 'Ririn Siti Alam Panjaitan', 'P', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14088', '', 'RONALDO SINAGA', 'L', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_siswas` (`nis`, `nisn`, `nama_siswa`, `jk_siswa`, `agama_siswa`, `ket_siswa`, `id_kelas`, `created_at`, `updated_at`) VALUES
('14089', '', 'ROY SAPUTRA SIBARANI', 'L', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14090', '', 'SAMUEL PURBA', 'L', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14091', '', 'SATRIA ADHI DHUNA WARDANA', 'L', 'Islam', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14092', '', 'SITA ALIA', 'P', 'Islam', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14093', '', 'SOFYANI ANISA PUTRI', 'P', 'Islam', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14094', '', 'STEVEN SALOMO PANGGABEAN', 'L', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14095', '', 'SUNGGUL ELFALDO PARNINGOTAN TARIHORAN', 'L', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14096', '', 'Tiara Sitorus', 'P', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14097', '', 'TRI CINDY UAN REBEKCA BR SITANGGANG', 'P', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14098', '', 'Vibry Andari Hutasuhut', 'P', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14099', '', 'WIKA CRISTINE BRENITA BR. SINULINGGA', 'P', 'Kristen', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14100', '', 'Zaitun Sari', 'P', 'Islam', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14101', '', 'Zsa Zsa Uwaisy', 'P', 'Islam', 'Aktif', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14102', '', 'ANGELIKA WANTRI SONDANG', 'P', '', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14103', '', 'DANIEL NATHANAIL NAPITUPULU', 'L', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14104', '', 'JUAN SIMANULLANG', 'L', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14105', '', 'OLLA MERCY GRACE SILITONGA', 'P', 'Kristen', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14106', '', 'YAZIDA SYAWALIYAH ALKHOLIDI', 'P', 'Islam', 'Aktif', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Trigger `tbl_siswas`
--
DELIMITER $$
CREATE TRIGGER `delete_siswa` BEFORE DELETE ON `tbl_siswas` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_siswas 
		(aksi, nis_lama, nisn_lama, nama_siswa_lama, jk_siswa_lama, agama_siswa_lama, ket_siswa_lama, id_kelas_lama, deleted_at)
	VALUES
		('Update', OLD.nis, OLD.nisn, OLD.nama_siswa, OLD.jk_siswa, OLD.agama_siswa, OLD.ket_siswa, OLD.id_kelas, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_siswa` AFTER INSERT ON `tbl_siswas` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_siswas 
		(aksi, nis_baru, nisn_baru, nama_siswa_baru, jk_siswa_baru, agama_siswa_baru, ket_siswa_baru, id_kelas_baru, created_at)
	VALUES
		('Insert', NEW.nis, NEW.nisn, NEW.nama_siswa, NEW.jk_siswa, NEW.agama_siswa, NEW.ket_siswa, NEW.id_kelas, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_siswa` AFTER UPDATE ON `tbl_siswas` FOR EACH ROW BEGIN
	INSERT INTO log_tbl_siswas 
		(aksi, nis_lama, nis_baru, nisn_lama, nisn_baru, nama_siswa_lama, nama_siswa_baru, jk_siswa_lama, jk_siswa_baru, agama_siswa_lama, agama_siswa_baru, ket_siswa_lama, ket_siswa_baru, id_kelas_lama, id_kelas_baru, updated_at)
	VALUES
		('Update', OLD.nis, NEW.nis, OLD.nisn, NEW.nisn, OLD.nama_siswa, NEW.nama_siswa, OLD.jk_siswa, NEW.jk_siswa, OLD.agama_siswa, NEW.agama_siswa, OLD.ket_siswa, NEW.ket_siswa, OLD.id_kelas, NEW.id_kelas, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `total_siswa`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `total_siswa` (
`Kelas` varchar(255)
,`Wali Kelas` varchar(255)
,`Total Siswa` varchar(255)
,`Siswa Laki-Laki` varchar(255)
,`Siswa Perempuan` varchar(255)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `direktori_siswa`
--
DROP TABLE IF EXISTS `direktori_siswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `direktori_siswa`  AS SELECT `tbl_siswas`.`nis` AS `nis`, `tbl_siswas`.`nama_siswa` AS `nama_siswa`, `tbl_siswas`.`jk_siswa` AS `jk_siswa`, `tbl_siswas`.`agama_siswa` AS `agama_siswa`, `tbl_siswas`.`ket_siswa` AS `ket_siswa`, `tbl_kelas`.`nama` AS `kelas`, `tbl_gurus`.`nama_guru` AS `wali_kelas` FROM ((`tbl_siswas` join `tbl_kelas` on(`tbl_kelas`.`id` = `tbl_siswas`.`id_kelas`)) join `tbl_gurus` on(`tbl_gurus`.`nip` = `tbl_kelas`.`wali_kelas`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `tampil_berita`
--
DROP TABLE IF EXISTS `tampil_berita`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tampil_berita`  AS SELECT `tbl_beritas`.`id` AS `id`, `tbl_akuns`.`nama` AS `pembuat_berita`, `tbl_akuns`.`foto` AS `foto_pembuat`, `tbl_beritas`.`foto` AS `foto_berita`, `tbl_beritas`.`judul` AS `judul`, `tbl_beritas`.`deskripsi` AS `deskripsi`, `tbl_beritas`.`created_at` AS `waktu_publikasi` FROM (`tbl_beritas` join `tbl_akuns` on(`tbl_akuns`.`id` = `tbl_beritas`.`id_akun`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `total_siswa`
--
DROP TABLE IF EXISTS `total_siswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_siswa`  AS SELECT `tbl_kelas`.`nama` AS `Kelas`, `tbl_gurus`.`nama_guru` AS `Wali Kelas`, `jumlahSiswaPerKelas`(`tbl_kelas`.`nama`) AS `Total Siswa`, `siswaPriaPerKelas`(`tbl_kelas`.`nama`) AS `Siswa Laki-Laki`, `siswiPerempuanPerKelas`(`tbl_kelas`.`nama`) AS `Siswa Perempuan` FROM (`tbl_kelas` join `tbl_gurus` on(`tbl_gurus`.`nip` = `tbl_kelas`.`wali_kelas`)) ORDER BY `tbl_kelas`.`nama` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `log_tbl_akuns`
--
ALTER TABLE `log_tbl_akuns`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log_tbl_beritas`
--
ALTER TABLE `log_tbl_beritas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log_tbl_bidang_studis`
--
ALTER TABLE `log_tbl_bidang_studis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log_tbl_ekstrakurikulers`
--
ALTER TABLE `log_tbl_ekstrakurikulers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log_tbl_fasilitas`
--
ALTER TABLE `log_tbl_fasilitas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log_tbl_gurus`
--
ALTER TABLE `log_tbl_gurus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log_tbl_kelas`
--
ALTER TABLE `log_tbl_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log_tbl_pegawais`
--
ALTER TABLE `log_tbl_pegawais`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log_tbl_prestasis`
--
ALTER TABLE `log_tbl_prestasis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log_tbl_siswas`
--
ALTER TABLE `log_tbl_siswas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_akuns`
--
ALTER TABLE `tbl_akuns`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_beritas`
--
ALTER TABLE `tbl_beritas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_berita_akun` (`id_akun`);

--
-- Indeks untuk tabel `tbl_bidang_studis`
--
ALTER TABLE `tbl_bidang_studis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_ekstrakurikulers`
--
ALTER TABLE `tbl_ekstrakurikulers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_fasilitas`
--
ALTER TABLE `tbl_fasilitas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_gurus`
--
ALTER TABLE `tbl_gurus`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `fk_guru_bidangStudi` (`id_bidangStudi`);

--
-- Indeks untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kelas_guru` (`wali_kelas`);

--
-- Indeks untuk tabel `tbl_pegawais`
--
ALTER TABLE `tbl_pegawais`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_prestasis`
--
ALTER TABLE `tbl_prestasis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_siswas`
--
ALTER TABLE `tbl_siswas`
  ADD PRIMARY KEY (`nis`),
  ADD KEY `fk_siswa_kelas` (`id_kelas`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `log_tbl_akuns`
--
ALTER TABLE `log_tbl_akuns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `log_tbl_beritas`
--
ALTER TABLE `log_tbl_beritas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `log_tbl_bidang_studis`
--
ALTER TABLE `log_tbl_bidang_studis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `log_tbl_ekstrakurikulers`
--
ALTER TABLE `log_tbl_ekstrakurikulers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `log_tbl_fasilitas`
--
ALTER TABLE `log_tbl_fasilitas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `log_tbl_gurus`
--
ALTER TABLE `log_tbl_gurus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `log_tbl_kelas`
--
ALTER TABLE `log_tbl_kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `log_tbl_pegawais`
--
ALTER TABLE `log_tbl_pegawais`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `log_tbl_prestasis`
--
ALTER TABLE `log_tbl_prestasis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `log_tbl_siswas`
--
ALTER TABLE `log_tbl_siswas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tbl_akuns`
--
ALTER TABLE `tbl_akuns`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_beritas`
--
ALTER TABLE `tbl_beritas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_bidang_studis`
--
ALTER TABLE `tbl_bidang_studis`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `tbl_ekstrakurikulers`
--
ALTER TABLE `tbl_ekstrakurikulers`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tbl_fasilitas`
--
ALTER TABLE `tbl_fasilitas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `tbl_pegawais`
--
ALTER TABLE `tbl_pegawais`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_prestasis`
--
ALTER TABLE `tbl_prestasis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_beritas`
--
ALTER TABLE `tbl_beritas`
  ADD CONSTRAINT `fk_berita_akun` FOREIGN KEY (`id_akun`) REFERENCES `tbl_akuns` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_gurus`
--
ALTER TABLE `tbl_gurus`
  ADD CONSTRAINT `fk_guru_bidangStudi` FOREIGN KEY (`id_bidangStudi`) REFERENCES `tbl_bidang_studis` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD CONSTRAINT `fk_kelas_guru` FOREIGN KEY (`wali_kelas`) REFERENCES `tbl_gurus` (`nip`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_siswas`
--
ALTER TABLE `tbl_siswas`
  ADD CONSTRAINT `fk_siswa_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `tbl_kelas` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
