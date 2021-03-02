-- phpMyAdmin SQL Dump
-- version 4.9.7deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 17, 2021 at 12:25 PM
-- Server version: 8.0.23-0ubuntu0.20.10.1
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sipd_2021`
--

-- --------------------------------------------------------

--
-- Table structure for table `apbd_temp`
--

CREATE TABLE `apbd_temp` (
  `id` int NOT NULL,
  `kodefungsi` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namafungsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kodesubfungsi` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namasubfungsi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kodeurusanprogram` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namaurusanprogram` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kodeurusanpelaksana` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namaurusanpelaksana` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kodeskpd` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namaskpd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kodeunitskpd` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namaunitskpd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kodeprogram` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namaprogram` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kodekegiatan` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namakegiatan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kodesubkegiatan` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namasubkegiatan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kodelokasi` char(10) NOT NULL DEFAULT '0',
  `namalokasi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '“ “',
  `kodeakunutama` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namaakunutama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kodeakunkelompok` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namaakunkelompok` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kodeakunjenis` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namaakunjenis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kodeakunobjek` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namaakunobjek` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kodeakunrinci` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namaakunrinci` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kodeakunsubrinci` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `namaakunsubrinci` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `namaakunsubsubrinci` varchar(255) NOT NULL,
  `volume` double DEFAULT NULL,
  `satuan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hargasatuan` double DEFAULT NULL,
  `nilaianggaran` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_blkeg`
--

CREATE TABLE `sipd_blkeg` (
  `id_jadwal` int NOT NULL,
  `id_daerah` int NOT NULL,
  `tahun` int NOT NULL,
  `id_unit` int NOT NULL,
  `id_skpd` int NOT NULL,
  `kode_skpd` varchar(35) NOT NULL,
  `nama_skpd` varchar(200) NOT NULL,
  `id_urusan` int NOT NULL,
  `kode_urusan` varchar(5) NOT NULL,
  `nama_urusan` varchar(200) NOT NULL,
  `id_bidang_urusan` int NOT NULL,
  `kode_bidang_urusan` varchar(5) NOT NULL,
  `nama_bidang_urusan` varchar(200) NOT NULL,
  `id_sub_skpd` int NOT NULL,
  `kode_sub_skpd` varchar(35) NOT NULL,
  `nama_sub_skpd` varchar(200) NOT NULL,
  `id_program` int NOT NULL,
  `kode_program` varchar(30) NOT NULL,
  `nama_program` varchar(500) NOT NULL,
  `id_giat` int NOT NULL,
  `kode_giat` varchar(40) NOT NULL,
  `nama_giat` varchar(500) NOT NULL,
  `pagu_giat` decimal(15,2) NOT NULL,
  `rinci_giat` int NOT NULL,
  `id_sub_giat` int NOT NULL,
  `kode_sub_giat` varchar(40) NOT NULL,
  `nama_sub_giat` varchar(500) NOT NULL,
  `pagu` decimal(15,2) NOT NULL,
  `pagu_indikatif` decimal(15,2) NOT NULL,
  `rincian` int NOT NULL,
  `kode_bl` varchar(50) NOT NULL,
  `kode_sbl` varchar(50) NOT NULL,
  `usul_asmas` int NOT NULL,
  `usul_reses` int NOT NULL,
  `stat_asmas` int NOT NULL,
  `stat_reses` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_blkeg_databl`
--

CREATE TABLE `sipd_blkeg_databl` (
  `kode_bl` varchar(50) NOT NULL,
  `kode_sbl` varchar(50) NOT NULL,
  `id_skpd` int NOT NULL,
  `id_sub_skpd` int NOT NULL,
  `nama_sub_skpd` varchar(255) NOT NULL,
  `id_giat` int NOT NULL,
  `nama_giat` varchar(255) NOT NULL,
  `kode_giat` varchar(50) NOT NULL,
  `no_giat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_sub_giat` int NOT NULL,
  `nama_sub_giat` varchar(255) NOT NULL,
  `kode_sub_giat` varchar(50) NOT NULL,
  `no_sub_giat` varchar(10) NOT NULL,
  `id_urusan` int NOT NULL,
  `kode_urusan` int NOT NULL,
  `nama_urusan` varchar(255) NOT NULL,
  `id_bidang_urusan` int NOT NULL,
  `kode_bidang_urusan` varchar(10) NOT NULL,
  `nama_bidang_urusan` varchar(255) NOT NULL,
  `id_program` int NOT NULL,
  `kode_program` varchar(20) NOT NULL,
  `nama_program` varchar(255) NOT NULL,
  `no_program` varchar(10) NOT NULL,
  `waktu_awal` int NOT NULL,
  `waktu_akhir` int NOT NULL,
  `sasaran` varchar(255) DEFAULT NULL,
  `id_unik_sub_bl` varchar(255) NOT NULL,
  `pagu` double NOT NULL,
  `output_sub_giat` int DEFAULT NULL,
  `id_label_pusat` int NOT NULL,
  `label_pusat` varchar(255) DEFAULT NULL,
  `id_label_prov` int NOT NULL,
  `label_prov` varchar(255) DEFAULT NULL,
  `id_label_kokab` int NOT NULL,
  `label_kokab` varchar(255) DEFAULT NULL,
  `id_rpjmd` int NOT NULL,
  `indikator` varchar(255) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `target_1` varchar(255) DEFAULT NULL,
  `target_2` varchar(255) DEFAULT NULL,
  `target_3` varchar(255) DEFAULT NULL,
  `target_4` varchar(255) DEFAULT NULL,
  `target_5` varchar(255) DEFAULT NULL,
  `pagu_n_lalu` double NOT NULL,
  `pagu_n_depan` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_blkeg_indikator_hasil_keg`
--

CREATE TABLE `sipd_blkeg_indikator_hasil_keg` (
  `kode_bl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kode_sbl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hasilteks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `targethasil` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `satuanhasil` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `targethasilteks` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_blkeg_indikator_keg`
--

CREATE TABLE `sipd_blkeg_indikator_keg` (
  `kode_bl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kode_sbl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `outputteks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `targetoutput` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `satuanoutput` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `targetoutputteks` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_blkeg_indikator_prog`
--

CREATE TABLE `sipd_blkeg_indikator_prog` (
  `kode_bl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kode_sbl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `capaianteks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `targetcapaian` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `satuancapaian` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `targetcapaianteks` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_blkeg_indikator_sub_keg`
--

CREATE TABLE `sipd_blkeg_indikator_sub_keg` (
  `kode_bl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kode_sbl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `outputteks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `targetoutput` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `satuanoutput` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `targetoutputteks` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `idoutputbl` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_blkeg_sumberdana`
--

CREATE TABLE `sipd_blkeg_sumberdana` (
  `kode_bl` varchar(20) NOT NULL,
  `kode_sbl` varchar(50) NOT NULL,
  `iddanasubbl` int NOT NULL,
  `iddana` int NOT NULL,
  `kodedana` int NOT NULL,
  `namadana` varchar(255) NOT NULL,
  `pagudana` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_blopd`
--

CREATE TABLE `sipd_blopd` (
  `id_daerah` int NOT NULL,
  `tahun` int NOT NULL,
  `id_unit` int NOT NULL,
  `id_skpd` int NOT NULL,
  `kode_skpd` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_skpd` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_skpd` int NOT NULL,
  `id_jadwal` int NOT NULL,
  `total_giat` int NOT NULL,
  `set_pagu_giat` double NOT NULL,
  `set_pagu_skpd` double NOT NULL,
  `pagu_giat` double NOT NULL,
  `rinci_giat` double NOT NULL,
  `kunci_bl` int NOT NULL,
  `kunci_bl_rinci` int NOT NULL,
  `totalgiat` int NOT NULL,
  `batasanpagu` double NOT NULL,
  `nilaipagu` double NOT NULL,
  `nilaipagumurni` double NOT NULL,
  `nilairincian` double NOT NULL,
  `realisasi` double NOT NULL,
  `kuncibl` int NOT NULL,
  `kunciblrinci` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_blrinc`
--

CREATE TABLE `sipd_blrinc` (
  `id_jadwal` int NOT NULL,
  `id_daerah` int NOT NULL,
  `tahun` int NOT NULL,
  `id_unit` int NOT NULL,
  `id_skpd` int NOT NULL,
  `kode_skpd` varchar(35) NOT NULL,
  `nama_skpd` varchar(200) NOT NULL,
  `id_urusan` int NOT NULL,
  `kode_urusan` varchar(10) NOT NULL,
  `nama_urusan` varchar(200) NOT NULL,
  `id_bidang_urusan` int NOT NULL,
  `kode_bidang_urusan` varchar(20) NOT NULL,
  `nama_bidang_urusan` varchar(200) NOT NULL,
  `id_sub_skpd` int NOT NULL,
  `kode_sub_skpd` varchar(35) NOT NULL,
  `nama_sub_skpd` varchar(200) NOT NULL,
  `id_program` int NOT NULL,
  `kode_program` varchar(40) NOT NULL,
  `nama_program` varchar(200) NOT NULL,
  `id_giat` int NOT NULL,
  `kode_giat` varchar(40) NOT NULL,
  `nama_giat` varchar(500) NOT NULL,
  `id_sub_giat` int NOT NULL,
  `kode_sub_giat` varchar(40) NOT NULL,
  `nama_sub_giat` varchar(500) NOT NULL,
  `pagu` double NOT NULL,
  `id_akun` int NOT NULL,
  `kode_akun` varchar(50) NOT NULL,
  `nama_akun` varchar(200) NOT NULL,
  `lokus_akun_teks` varchar(50) NOT NULL,
  `jenis_bl` varchar(50) NOT NULL,
  `is_paket` tinyint(1) NOT NULL,
  `subs_bl_teks` varchar(50) NOT NULL,
  `ket_bl_teks` varchar(50) NOT NULL,
  `id_standar_harga` int NOT NULL,
  `kode_standar_harga` varchar(50) NOT NULL,
  `nama_komponen` varchar(300) NOT NULL,
  `satuan` varchar(70) NOT NULL,
  `spek` varchar(200) NOT NULL,
  `rincian` double NOT NULL,
  `pajak` double NOT NULL,
  `volume` int NOT NULL,
  `harga_satuan` double NOT NULL,
  `koefisien` varchar(50) NOT NULL,
  `vol_1` int NOT NULL,
  `sat_1` varchar(50) NOT NULL,
  `vol_2` int NOT NULL,
  `sat_2` varchar(50) NOT NULL,
  `vol_3` int NOT NULL,
  `sat_3` varchar(50) NOT NULL,
  `vol_4` int NOT NULL,
  `sat_4` varchar(50) NOT NULL,
  `id_rinci_sub_bl` int NOT NULL,
  `totalpajak` double NOT NULL,
  `pajakmurni` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_jadwal`
--

CREATE TABLE `sipd_jadwal` (
  `id_jadwal` int NOT NULL,
  `is_locked` tinyint(1) NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `waktumulai` datetime NOT NULL,
  `waktuselesai` datetime NOT NULL,
  `id_tahap` enum('1','2','5','6','24','7','30','3','4','8','25','29') NOT NULL,
  `nama_tahap` enum('RKPD','KUA dan PPAS','RAPBD','APBD','Penyesuaian Hasil Evaluasi APBD','APBD Pergeseran','Penetapan APBD Pergeseran','RKPD Perubahan','KUPA dan PPAS','RAPBD Perubahan','Penyesuaian Hasil Evaluasi RAPBD Perubahan','Penetapan APBD Perubahan') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nama_sub_tahap` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipe_tahap` enum('plan','budget') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `setstatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_kamus_tag`
--

CREATE TABLE `sipd_kamus_tag` (
  `id_kamus` int NOT NULL,
  `uraian_teks` varchar(255) NOT NULL,
  `is_locked` int NOT NULL DEFAULT '0',
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_kamus_usulan`
--

CREATE TABLE `sipd_kamus_usulan` (
  `id_kamus` int NOT NULL,
  `id_bidangurusan` int NOT NULL,
  `bidang_urusan` varchar(255) NOT NULL,
  `id_program` int NOT NULL,
  `kode_program` varchar(255) NOT NULL,
  `nama_program` varchar(255) NOT NULL,
  `giat_teks` varchar(255) NOT NULL,
  `pekerjaan` int NOT NULL DEFAULT '0',
  `kelompok` varchar(50) NOT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `anggaran` double NOT NULL,
  `id_unit` int NOT NULL,
  `id_skpd` int NOT NULL,
  `kode_skpd` varchar(22) NOT NULL,
  `nama_skpd` varchar(255) DEFAULT NULL,
  `outuput_teks` varchar(255) DEFAULT NULL,
  `outcome_teks` varchar(255) DEFAULT NULL,
  `prioritas_teks` varchar(255) DEFAULT NULL,
  `jenis_profil` varchar(50) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_kebijakan`
--

CREATE TABLE `sipd_kebijakan` (
  `id_kamus` int NOT NULL,
  `uraian_teks` varchar(255) NOT NULL,
  `is_locked` int NOT NULL DEFAULT '0',
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_master_kegiatan_subk`
--

CREATE TABLE `sipd_master_kegiatan_subk` (
  `id_urusan` int NOT NULL,
  `kode_urusan` varchar(20) NOT NULL,
  `nama_urusan` varchar(255) NOT NULL,
  `id_bidang_urusan` int NOT NULL,
  `kode_bidang_urusan` varchar(20) NOT NULL,
  `nama_bidang_urusan` varchar(255) NOT NULL,
  `id_program` int NOT NULL,
  `kode_program` varchar(20) NOT NULL,
  `nama_program` varchar(255) NOT NULL,
  `id_giat` int NOT NULL,
  `kode_giat` varchar(20) NOT NULL,
  `nama_giat` varchar(255) NOT NULL,
  `id_sub_giat` int NOT NULL,
  `kode_sub_giat` varchar(20) NOT NULL,
  `nama_sub_giat` varchar(255) NOT NULL,
  `is_locked` int NOT NULL DEFAULT '0',
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_master_opd_kegiatan_subk`
--

CREATE TABLE `sipd_master_opd_kegiatan_subk` (
  `id_sub_giat` int NOT NULL,
  `id_skpd` int NOT NULL,
  `kode_skpd` varchar(50) NOT NULL,
  `nama_skpd` varchar(255) NOT NULL,
  `is_deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_master_program`
--

CREATE TABLE `sipd_master_program` (
  `id_urusan` int NOT NULL,
  `kode_urusan` int NOT NULL,
  `nama_urusan` varchar(255) NOT NULL,
  `id_bidang_urusan` int NOT NULL,
  `kode_bidang_urusan` varchar(20) NOT NULL,
  `nama_bidang_urusan` varchar(255) NOT NULL,
  `id_program` int NOT NULL,
  `kode_program` varchar(20) NOT NULL,
  `nama_program` varchar(255) NOT NULL,
  `is_locked` int NOT NULL DEFAULT '0',
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_master_rekening`
--

CREATE TABLE `sipd_master_rekening` (
  `id_akun` int NOT NULL,
  `tahun` int NOT NULL,
  `id_daerah` int NOT NULL,
  `kode_akun` varchar(45) NOT NULL,
  `nama_akun` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_pendapatan` tinyint(1) NOT NULL,
  `is_bl` tinyint(1) NOT NULL,
  `is_pembiayaan` tinyint(1) NOT NULL,
  `id_unik` varchar(1000) NOT NULL,
  `is_locked` tinyint(1) NOT NULL,
  `set_input` tinyint(1) NOT NULL,
  `created_user` int NOT NULL,
  `created_at` date NOT NULL,
  `created_ip` int DEFAULT NULL,
  `updated_user` int NOT NULL DEFAULT '0',
  `updated_at` date DEFAULT NULL,
  `updated_ip` varchar(255) DEFAULT NULL,
  `set_lokus` varchar(255) DEFAULT NULL,
  `is_gaji_asn` tinyint(1) NOT NULL,
  `is_barjas` tinyint(1) NOT NULL,
  `is_bunga` tinyint(1) NOT NULL,
  `is_subsidi` tinyint(1) NOT NULL,
  `is_bagi_hasil` tinyint(1) NOT NULL,
  `is_bankeu_umum` tinyint(1) NOT NULL,
  `is_bankeu_khusus` tinyint(1) NOT NULL,
  `is_btt` tinyint(1) NOT NULL,
  `is_hibah_brg` tinyint(1) NOT NULL,
  `is_hibah_uang` tinyint(1) NOT NULL,
  `is_sosial_brg` tinyint(1) NOT NULL,
  `is_sosial_uang` tinyint(1) NOT NULL,
  `is_bos` tinyint(1) NOT NULL,
  `is_modal_tanah` tinyint(1) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `belanja` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_master_sumberdana`
--

CREATE TABLE `sipd_master_sumberdana` (
  `id_dana` int NOT NULL,
  `tahun` year NOT NULL,
  `id_daerah` int NOT NULL,
  `kode_dana` varchar(20) NOT NULL,
  `nama_dana` varchar(255) NOT NULL,
  `id_unik` varchar(255) NOT NULL,
  `is_locked` int NOT NULL DEFAULT '0',
  `set_input` enum('Ya','Tidak') NOT NULL,
  `created_user` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_ip` int DEFAULT NULL,
  `updated_user` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_ip` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_master_urusan`
--

CREATE TABLE `sipd_master_urusan` (
  `id_bidang_urusan` int NOT NULL,
  `tahun` year NOT NULL,
  `id_daerah` int NOT NULL,
  `id_urusan` int NOT NULL,
  `id_fungsi` int NOT NULL DEFAULT '0',
  `kode_urusan` varchar(10) NOT NULL,
  `nama_urusan` varchar(255) NOT NULL,
  `kode_bidang_urusan` varchar(20) NOT NULL,
  `nama_bidang_urusan` varchar(255) NOT NULL,
  `id_unik` varchar(255) NOT NULL,
  `is_locked` int NOT NULL,
  `created_user` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_misi`
--

CREATE TABLE `sipd_misi` (
  `id_kamus` int NOT NULL,
  `uraian_teks` varchar(255) NOT NULL,
  `is_locked` int NOT NULL DEFAULT '0',
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_pembiayaan`
--

CREATE TABLE `sipd_pembiayaan` (
  `id_unit` int NOT NULL,
  `id_skpd` int NOT NULL,
  `kode_skpd` varchar(255) NOT NULL,
  `nama_skpd` varchar(255) NOT NULL,
  `nilaitotal` double NOT NULL DEFAULT '0',
  `nilaimurni` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_pembiayaan_detail`
--

CREATE TABLE `sipd_pembiayaan_detail` (
  `id_pembiayaan` int NOT NULL,
  `id_unit` int NOT NULL,
  `id_skpd` int NOT NULL,
  `kode_skpd` varchar(255) NOT NULL,
  `nama_skpd` varchar(255) NOT NULL,
  `kode_akun` varchar(50) NOT NULL,
  `nama_akun` varchar(255) NOT NULL,
  `uraian` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `skpd_koordinator` int NOT NULL DEFAULT '0',
  `urusan_koordinator` int NOT NULL DEFAULT '0',
  `program_koordinator` int NOT NULL DEFAULT '0',
  `total` double NOT NULL,
  `created_user` int NOT NULL,
  `createddate` date NOT NULL,
  `createdtime` time NOT NULL,
  `updated_user` int NOT NULL,
  `updateddate` date NOT NULL,
  `updatedtime` time NOT NULL,
  `action` int DEFAULT NULL,
  `rekening` int NOT NULL,
  `user1` int NOT NULL,
  `user2` int NOT NULL,
  `nilaimurni` double NOT NULL,
  `ketegori` enum('pengeluaran','penerimaan') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_pendapatan`
--

CREATE TABLE `sipd_pendapatan` (
  `id_unit` int NOT NULL,
  `id_skpd` int NOT NULL,
  `kode_skpd` varchar(255) NOT NULL,
  `nama_skpd` int NOT NULL,
  `nilaitotal` double NOT NULL,
  `nilaimurni` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_pendapatan_detail`
--

CREATE TABLE `sipd_pendapatan_detail` (
  `id_pendapatan` int NOT NULL,
  `id_unit` int NOT NULL,
  `id_skpd` int NOT NULL,
  `kode_skpd` varchar(255) NOT NULL,
  `nama_skpd` varchar(255) NOT NULL,
  `kode_akun` varchar(50) NOT NULL,
  `nama_akun` varchar(255) NOT NULL,
  `uraian` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `skpd_koordinator` int NOT NULL DEFAULT '0',
  `urusan_koordinator` int NOT NULL DEFAULT '0',
  `program_koordinator` int NOT NULL DEFAULT '0',
  `total` double NOT NULL,
  `created_user` int NOT NULL,
  `createddate` date NOT NULL,
  `createdtime` time NOT NULL,
  `updated_user` int NOT NULL,
  `updateddate` date NOT NULL,
  `updatedtime` time NOT NULL,
  `action` int DEFAULT NULL,
  `rekening` int NOT NULL,
  `user1` int NOT NULL,
  `user2` int NOT NULL,
  `nilaimurni` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_prioritas`
--

CREATE TABLE `sipd_prioritas` (
  `id_kamus` int NOT NULL,
  `uraian_teks` varchar(255) NOT NULL,
  `is_locked` int NOT NULL DEFAULT '0',
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_renstra`
--

CREATE TABLE `sipd_renstra` (
  `id_renstra` int NOT NULL,
  `visi_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `misi_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tujuan_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sasaran_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `strategi_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kebijakan_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_bidang_urusan` int NOT NULL,
  `kode_bidang_urusan` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nama_bidang_urusan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_program` int NOT NULL,
  `kode_program` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nama_program` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `outcome` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_rpjmd` int NOT NULL,
  `id_giat` int NOT NULL,
  `kode_giat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nama_giat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `indikator` varchar(255) NOT NULL,
  `target_1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `target_2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `target_3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `target_4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `target_5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pagu_1` double NOT NULL,
  `pagu_2` double NOT NULL,
  `pagu_3` double NOT NULL,
  `pagu_4` double NOT NULL,
  `pagu_5` double NOT NULL,
  `satuan` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_sub_giat` int NOT NULL,
  `kode_sub_giat` varchar(50) NOT NULL,
  `nama_sub_giat` varchar(255) NOT NULL,
  `indikator_sub` varchar(255) NOT NULL,
  `target_sub_1` varchar(255) NOT NULL,
  `target_sub_2` varchar(255) NOT NULL,
  `target_sub_3` varchar(255) NOT NULL,
  `target_sub_4` varchar(255) NOT NULL,
  `target_sub_5` varchar(255) NOT NULL,
  `pagu_sub_1` double NOT NULL,
  `pagu_sub_2` double NOT NULL,
  `pagu_sub_3` double NOT NULL,
  `pagu_sub_4` double NOT NULL,
  `pagu_sub_5` double NOT NULL,
  `satuan_sub` varchar(50) NOT NULL,
  `id_unit` int NOT NULL,
  `kode_skpd` varchar(255) NOT NULL,
  `nama_skpd` varchar(255) NOT NULL,
  `is_locked` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_rpjmd`
--

CREATE TABLE `sipd_rpjmd` (
  `id_rpjmd` int NOT NULL,
  `visi_teks` varchar(255) NOT NULL,
  `misi_teks` varchar(255) NOT NULL,
  `tujuan_teks` varchar(255) NOT NULL,
  `sasaran_teks` varchar(255) NOT NULL,
  `strategi_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kebijakan_teks` varchar(255) NOT NULL,
  `id_bidang_urusan` int NOT NULL,
  `kode_bidang_urusan` varchar(20) NOT NULL,
  `nama_bidang_urusan` varchar(255) NOT NULL,
  `id_program` int NOT NULL,
  `kode_program` varchar(20) NOT NULL,
  `nama_program` varchar(255) NOT NULL,
  `indikator` varchar(255) NOT NULL,
  `target_1` varchar(50) NOT NULL,
  `target_2` varchar(50) NOT NULL,
  `target_3` varchar(50) NOT NULL,
  `target_4` varchar(50) NOT NULL,
  `target_5` varchar(50) NOT NULL,
  `pagu_1` double NOT NULL,
  `pagu_2` double NOT NULL,
  `pagu_3` double NOT NULL,
  `pagu_4` double NOT NULL,
  `pagu_5` double NOT NULL,
  `kode_skpd` varchar(255) NOT NULL,
  `nama_skpd` varchar(255) NOT NULL,
  `satuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_sasaran`
--

CREATE TABLE `sipd_sasaran` (
  `id_kamus` int NOT NULL,
  `uraian_teks` varchar(255) NOT NULL,
  `is_locked` int NOT NULL DEFAULT '0',
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_ssh`
--

CREATE TABLE `sipd_ssh` (
  `kode_kel_standar_harga` varchar(40) NOT NULL,
  `nama_kel_standar_harga` varchar(500) NOT NULL,
  `id_standar_harga` bigint NOT NULL,
  `kode_standar_harga` varchar(40) NOT NULL,
  `nama_standar_harga` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `spek` varchar(200) NOT NULL,
  `satuan` varchar(100) NOT NULL,
  `harga` double NOT NULL DEFAULT '0',
  `harga_2` double NOT NULL DEFAULT '0',
  `harga_3` double NOT NULL DEFAULT '0',
  `is_locked` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `created_user` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_user` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `kelompok` int NOT NULL,
  `ket_teks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_ssh_akun`
--

CREATE TABLE `sipd_ssh_akun` (
  `id_standar_harga` int NOT NULL,
  `id_akun` int NOT NULL,
  `kode_akun` varchar(255) NOT NULL,
  `nama_akun` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_strategi`
--

CREATE TABLE `sipd_strategi` (
  `id_kamus` int NOT NULL,
  `uraian_teks` varchar(255) NOT NULL,
  `is_locked` int NOT NULL DEFAULT '0',
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_tujuan`
--

CREATE TABLE `sipd_tujuan` (
  `id_kamus` int NOT NULL,
  `uraian_teks` varchar(255) NOT NULL,
  `is_locked` int NOT NULL DEFAULT '0',
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_unit`
--

CREATE TABLE `sipd_unit` (
  `id_unit` int NOT NULL,
  `id_skpd` int NOT NULL,
  `kode_skpd` varchar(255) NOT NULL,
  `nama_skpd` varchar(255) NOT NULL,
  `kunci_skpd` varchar(20) DEFAULT NULL,
  `id_setup_unit` varchar(20) DEFAULT NULL,
  `is_skpd` int NOT NULL DEFAULT '0',
  `posisi` varchar(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_unit_detail`
--

CREATE TABLE `sipd_unit_detail` (
  `bidur_1` int DEFAULT NULL,
  `bidur_2` int DEFAULT NULL,
  `bidur_3` int DEFAULT NULL,
  `kodeunit` varchar(255) NOT NULL,
  `kode_skpd_1` varchar(2) NOT NULL,
  `kode_skpd_2` varchar(4) NOT NULL,
  `namaunit` varchar(255) NOT NULL,
  `komisi` int DEFAULT NULL,
  `namakepala` varchar(255) NOT NULL,
  `nipkepala` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pangkatkepala` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `statuskepala` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `namabendahara` varchar(255) NOT NULL,
  `nipbendahara` varchar(50) NOT NULL,
  `isskpd` tinyint NOT NULL DEFAULT '0',
  `idinduk` int NOT NULL,
  `setupunit` int NOT NULL,
  `ispendapatan` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_user_asmas`
--

CREATE TABLE `sipd_user_asmas` (
  `id_daerah` int NOT NULL,
  `nama_daerah` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_user` int NOT NULL,
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nama_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_locked` int NOT NULL,
  `id_level` int DEFAULT NULL,
  `id_profil` int NOT NULL,
  `jenis_profil` int NOT NULL,
  `id_user_profil` int NOT NULL,
  `nama_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nik` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `npwp` varchar(20) DEFAULT NULL,
  `id_jenis_profil` int NOT NULL,
  `alamat_teks` varchar(255) NOT NULL,
  `kab_kota` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_profil` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `jabatan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `jenis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_user_asmas_detail`
--

CREATE TABLE `sipd_user_asmas_detail` (
  `iduser` int NOT NULL,
  `idlevel` int NOT NULL,
  `nip` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `loginname` varchar(255) NOT NULL,
  `idprofil` int NOT NULL,
  `fraksi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dapil` int DEFAULT NULL,
  `namapengusul` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `alamatteks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `idkabkota` int NOT NULL,
  `idcamat` int DEFAULT NULL,
  `camatteks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `idlurah` int DEFAULT NULL,
  `lurahteks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `npwp` varchar(250) DEFAULT NULL,
  `notelp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `emailteks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `jabatan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `idlurahpengusul` int DEFAULT NULL,
  `iddaerahpengusul` int DEFAULT NULL,
  `namadaerah` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `aktakumham` varchar(255) DEFAULT NULL,
  `suratdom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sertifikat` varchar(255) NOT NULL,
  `ijinop` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_user_dewan`
--

CREATE TABLE `sipd_user_dewan` (
  `id_daerah` int NOT NULL,
  `nama_daerah` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_user` int NOT NULL,
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nama_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_locked` int NOT NULL,
  `id_level` int NOT NULL,
  `id_profil` int NOT NULL,
  `jenis_profil` int NOT NULL,
  `id_user_profil` int NOT NULL,
  `nama_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fraksi_dewan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dapil` int NOT NULL,
  `nik` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jabatan` int NOT NULL,
  `status` enum('Aktif','Non Aktif') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jenis` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_user_dewan_detail`
--

CREATE TABLE `sipd_user_dewan_detail` (
  `iduser` int NOT NULL,
  `idlevel` int NOT NULL,
  `nip` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `loginname` varchar(255) NOT NULL,
  `idprofil` int NOT NULL,
  `fraksi` varchar(255) NOT NULL,
  `dapil` int NOT NULL,
  `namapengusul` varchar(255) NOT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `alamatteks` varchar(255) NOT NULL,
  `idkabkota` int NOT NULL,
  `idcamat` int NOT NULL,
  `camatteks` varchar(255) NOT NULL,
  `idlurah` int NOT NULL,
  `lurahteks` varchar(255) NOT NULL,
  `npwp` varchar(250) DEFAULT NULL,
  `notelp` varchar(20) NOT NULL,
  `emailteks` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `idlurahpengusul` int NOT NULL,
  `iddaerahpengusul` int NOT NULL,
  `daerahpengusul` varchar(255) NOT NULL,
  `idlokasidesa` int NOT NULL,
  `lokasidesateks` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_user_keldes`
--

CREATE TABLE `sipd_user_keldes` (
  `id_lurah` int NOT NULL,
  `kode_lurah` varchar(255) NOT NULL,
  `lurah_teks` varchar(255) NOT NULL,
  `id_camat` int NOT NULL,
  `id_daerah` int NOT NULL,
  `nama_daerah` varchar(255) NOT NULL,
  `id_user` int NOT NULL,
  `login_name` varchar(255) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `is_locked` int NOT NULL,
  `id_level` varchar(255) NOT NULL,
  `id_profil` int NOT NULL,
  `is_desa` int NOT NULL,
  `camat_teks` varchar(255) NOT NULL,
  `kab_kota` varchar(255) NOT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `jenis` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_user_keldes_detail`
--

CREATE TABLE `sipd_user_keldes_detail` (
  `iduser` int NOT NULL,
  `idlevel` int NOT NULL,
  `nip` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `loginname` varchar(255) NOT NULL,
  `idprofil` int NOT NULL,
  `namapengusul` varchar(255) DEFAULT NULL,
  `nik` varchar(50) DEFAULT NULL,
  `alamatteks` varchar(255) NOT NULL,
  `idkabkota` int NOT NULL,
  `idcamat` int NOT NULL,
  `camatteks` varchar(255) NOT NULL,
  `idlurah` int NOT NULL,
  `lurahteks` varchar(255) NOT NULL,
  `npwp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `notelp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `emailteks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `jabatan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `idlurahpengusul` int NOT NULL,
  `iddaerahpengusul` int NOT NULL,
  `daerahpengusul` varchar(255) DEFAULT NULL,
  `idlokasidesa` int NOT NULL,
  `lokasidesateks` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_user_tapd`
--

CREATE TABLE `sipd_user_tapd` (
  `id_user` int NOT NULL,
  `login_name` varchar(255) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `akses_user` varchar(255) NOT NULL,
  `is_locked` int NOT NULL,
  `id_level` int NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `status` enum('Aktif','Tidak') NOT NULL,
  `akses` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_user_unit`
--

CREATE TABLE `sipd_user_unit` (
  `id_unit` int NOT NULL,
  `id_user` int NOT NULL,
  `login_name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nama_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nip` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_level` int NOT NULL,
  `akses_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jabatan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_locked` tinyint NOT NULL,
  `is_login` tinyint NOT NULL,
  `nama_bidang` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `akses` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_usulan_asmas`
--

CREATE TABLE `sipd_usulan_asmas` (
  `id_kamus` int NOT NULL,
  `id_usulan` int NOT NULL,
  `masalah` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_pengusul` int NOT NULL,
  `id_jenis_usul` int NOT NULL,
  `jenis_usul_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bidang_urusan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_bidang_urusan` int NOT NULL,
  `giat_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kelompok` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lokus_usulan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `alamat_teks` varchar(255) DEFAULT NULL,
  `id_kab_kota` int NOT NULL,
  `nama_daerah` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_kecamatan` int NOT NULL,
  `camatteks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_kelurahan` int NOT NULL,
  `lurahteks` int NOT NULL,
  `volume` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `anggaran` double NOT NULL DEFAULT '0',
  `id_unit` int NOT NULL,
  `kode_skpd` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nama_skpd` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_pengantar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_proposal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_rab` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_foto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_foto2` varchar(255) DEFAULT NULL,
  `file_foto3` varchar(255) DEFAULT NULL,
  `created_user` int NOT NULL,
  `created_date` datetime NOT NULL,
  `status_usul` int NOT NULL,
  `status_usulan_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_tolak` tinyint(1) NOT NULL DEFAULT '0',
  `tolak_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_batal` tinyint(1) NOT NULL DEFAULT '0',
  `batal_teks` varchar(255) DEFAULT NULL,
  `nama_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_profil` int NOT NULL,
  `nip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pengusul` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_jenis_profil` tinyint NOT NULL DEFAULT '0',
  `jenis_profil` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rev_skpd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `jenis_belanja` enum('renja','non_renja') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `satuan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `latpeta` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `langpeta` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `usulvolume` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usulanggaran` double NOT NULL DEFAULT '0',
  `rekomteks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `setStatusUsul` int DEFAULT NULL,
  `subgiat` int DEFAULT NULL,
  `mitra_rekomendasi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mitra_koefisien` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mitra_anggaran` double DEFAULT NULL,
  `lurah_rekomendasi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lurah_koefisien` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lurah_anggaran` double DEFAULT NULL,
  `camat_rekomendasi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `camat_koefisiensi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `camat_anggaran` double DEFAULT NULL,
  `skpd_rekomendasi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `skpd_koefisien` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `skpd_anggaran` double DEFAULT NULL,
  `tapd_rekomendasi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tapd_koefisien` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tapd_anggaran` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_usulan_reses`
--

CREATE TABLE `sipd_usulan_reses` (
  `id_kamus` int NOT NULL,
  `id_reses` int NOT NULL,
  `masalah` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_usulan` int NOT NULL,
  `id_pengusul` int NOT NULL,
  `pengusul` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fraksi_dewan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_jenis_usul` int NOT NULL,
  `jenis_usul_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bidang_urusan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_bidang_urusan` int NOT NULL,
  `giat_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kelompok` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lokus_usulan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `alamat_teks` varchar(255) DEFAULT NULL,
  `id_kab_kota` int NOT NULL,
  `nama_daerah` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_kecamatan` int NOT NULL,
  `camatteks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_kelurahan` int NOT NULL,
  `lurahteks` int NOT NULL,
  `volume` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `anggaran` double NOT NULL DEFAULT '0',
  `id_unit` int NOT NULL,
  `kode_skpd` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nama_skpd` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_pengantar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_proposal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_rab` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_foto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_user` int NOT NULL,
  `created_date` datetime NOT NULL,
  `status_usul` int NOT NULL,
  `status_usulan_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_tolak` tinyint(1) NOT NULL DEFAULT '0',
  `tolak_teks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_batal` tinyint(1) NOT NULL DEFAULT '0',
  `batal_teks` varchar(255) DEFAULT NULL,
  `nama_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jenis_belanja` enum('renja','non_renja') NOT NULL,
  `satuan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `latpeta` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `langpeta` varchar(255) DEFAULT NULL,
  `usulvolume` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usulanggaran` double NOT NULL DEFAULT '0',
  `rekomteks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `setStatusUsul` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `subgiat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mitra_rekomendasi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mitra_koefisien` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mitra_anggaran` double DEFAULT NULL,
  `setwan_rekomendasi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `setwan_koefisien` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `setwan_anggaran` double DEFAULT NULL,
  `skpd_rekomendasi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `skpd_koefisien` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `skpd_anggaran` double DEFAULT NULL,
  `tapd_rekomendasi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tapd_koefisien` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tapd_anggaran` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sipd_visi`
--

CREATE TABLE `sipd_visi` (
  `id_kamus` int NOT NULL,
  `uraian_teks` varchar(255) NOT NULL,
  `is_locked` int NOT NULL DEFAULT '0',
  `status` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apbd_temp`
--
ALTER TABLE `apbd_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sipd_blkeg`
--
ALTER TABLE `sipd_blkeg`
  ADD PRIMARY KEY (`id_daerah`,`tahun`,`id_skpd`,`id_urusan`,`id_bidang_urusan`,`id_program`,`id_giat`,`id_sub_giat`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indexes for table `sipd_blkeg_databl`
--
ALTER TABLE `sipd_blkeg_databl`
  ADD PRIMARY KEY (`id_skpd`,`id_sub_skpd`,`id_giat`,`id_sub_giat`,`id_urusan`,`id_bidang_urusan`,`id_program`,`id_rpjmd`),
  ADD KEY `id_unik_sub_bl` (`id_unik_sub_bl`,`id_label_pusat`,`id_label_prov`,`id_label_kokab`);

--
-- Indexes for table `sipd_blkeg_indikator_hasil_keg`
--
ALTER TABLE `sipd_blkeg_indikator_hasil_keg`
  ADD KEY `kode_bl` (`kode_bl`,`kode_sbl`);

--
-- Indexes for table `sipd_blkeg_indikator_keg`
--
ALTER TABLE `sipd_blkeg_indikator_keg`
  ADD KEY `kode_bl` (`kode_bl`,`kode_sbl`);

--
-- Indexes for table `sipd_blkeg_indikator_prog`
--
ALTER TABLE `sipd_blkeg_indikator_prog`
  ADD KEY `kode_bl` (`kode_bl`,`kode_sbl`);

--
-- Indexes for table `sipd_blkeg_indikator_sub_keg`
--
ALTER TABLE `sipd_blkeg_indikator_sub_keg`
  ADD PRIMARY KEY (`idoutputbl`),
  ADD KEY `kode_bl` (`kode_bl`,`kode_sbl`);

--
-- Indexes for table `sipd_blkeg_sumberdana`
--
ALTER TABLE `sipd_blkeg_sumberdana`
  ADD KEY `iddanasubbl` (`iddanasubbl`,`iddana`);

--
-- Indexes for table `sipd_blopd`
--
ALTER TABLE `sipd_blopd`
  ADD PRIMARY KEY (`id_daerah`,`tahun`,`id_skpd`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indexes for table `sipd_blrinc`
--
ALTER TABLE `sipd_blrinc`
  ADD PRIMARY KEY (`id_daerah`,`tahun`,`id_skpd`,`id_urusan`,`id_bidang_urusan`,`id_sub_skpd`,`id_program`,`id_giat`,`id_sub_giat`,`id_akun`,`id_rinci_sub_bl`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indexes for table `sipd_jadwal`
--
ALTER TABLE `sipd_jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_tahap` (`id_tahap`);

--
-- Indexes for table `sipd_kamus_tag`
--
ALTER TABLE `sipd_kamus_tag`
  ADD PRIMARY KEY (`id_kamus`);

--
-- Indexes for table `sipd_kamus_usulan`
--
ALTER TABLE `sipd_kamus_usulan`
  ADD PRIMARY KEY (`id_kamus`),
  ADD KEY `id_program` (`id_program`,`id_unit`);

--
-- Indexes for table `sipd_kebijakan`
--
ALTER TABLE `sipd_kebijakan`
  ADD PRIMARY KEY (`id_kamus`);

--
-- Indexes for table `sipd_master_kegiatan_subk`
--
ALTER TABLE `sipd_master_kegiatan_subk`
  ADD PRIMARY KEY (`id_urusan`,`id_bidang_urusan`,`id_program`,`id_giat`,`id_sub_giat`);

--
-- Indexes for table `sipd_master_opd_kegiatan_subk`
--
ALTER TABLE `sipd_master_opd_kegiatan_subk`
  ADD PRIMARY KEY (`id_sub_giat`,`id_skpd`);

--
-- Indexes for table `sipd_master_program`
--
ALTER TABLE `sipd_master_program`
  ADD PRIMARY KEY (`id_urusan`,`id_bidang_urusan`,`id_program`);

--
-- Indexes for table `sipd_master_rekening`
--
ALTER TABLE `sipd_master_rekening`
  ADD PRIMARY KEY (`id_akun`,`tahun`,`id_daerah`);

--
-- Indexes for table `sipd_master_sumberdana`
--
ALTER TABLE `sipd_master_sumberdana`
  ADD PRIMARY KEY (`id_dana`),
  ADD KEY `id_daerah` (`id_daerah`),
  ADD KEY `id_unik` (`id_unik`);

--
-- Indexes for table `sipd_master_urusan`
--
ALTER TABLE `sipd_master_urusan`
  ADD PRIMARY KEY (`id_bidang_urusan`,`id_daerah`,`id_urusan`,`id_fungsi`);

--
-- Indexes for table `sipd_misi`
--
ALTER TABLE `sipd_misi`
  ADD PRIMARY KEY (`id_kamus`);

--
-- Indexes for table `sipd_pembiayaan_detail`
--
ALTER TABLE `sipd_pembiayaan_detail`
  ADD PRIMARY KEY (`id_pembiayaan`),
  ADD KEY `id_skpd` (`id_skpd`);

--
-- Indexes for table `sipd_pendapatan`
--
ALTER TABLE `sipd_pendapatan`
  ADD PRIMARY KEY (`id_unit`,`id_skpd`);

--
-- Indexes for table `sipd_pendapatan_detail`
--
ALTER TABLE `sipd_pendapatan_detail`
  ADD PRIMARY KEY (`id_pendapatan`),
  ADD KEY `id_skpd` (`id_skpd`),
  ADD KEY `id_unit` (`id_unit`);

--
-- Indexes for table `sipd_prioritas`
--
ALTER TABLE `sipd_prioritas`
  ADD PRIMARY KEY (`id_kamus`);

--
-- Indexes for table `sipd_renstra`
--
ALTER TABLE `sipd_renstra`
  ADD PRIMARY KEY (`id_renstra`),
  ADD KEY `id_bidang_urusan` (`id_bidang_urusan`,`id_program`),
  ADD KEY `id_rpjmd` (`id_rpjmd`,`id_giat`,`id_sub_giat`,`id_unit`);

--
-- Indexes for table `sipd_rpjmd`
--
ALTER TABLE `sipd_rpjmd`
  ADD PRIMARY KEY (`id_rpjmd`),
  ADD KEY `id_bidang_urusan` (`id_bidang_urusan`,`id_program`);

--
-- Indexes for table `sipd_sasaran`
--
ALTER TABLE `sipd_sasaran`
  ADD PRIMARY KEY (`id_kamus`);

--
-- Indexes for table `sipd_ssh`
--
ALTER TABLE `sipd_ssh`
  ADD PRIMARY KEY (`id_standar_harga`),
  ADD KEY `kode_kel_standar_harga` (`kode_kel_standar_harga`,`kode_standar_harga`);

--
-- Indexes for table `sipd_ssh_akun`
--
ALTER TABLE `sipd_ssh_akun`
  ADD PRIMARY KEY (`id_akun`),
  ADD KEY `id_standar_harga` (`id_standar_harga`);

--
-- Indexes for table `sipd_strategi`
--
ALTER TABLE `sipd_strategi`
  ADD PRIMARY KEY (`id_kamus`);

--
-- Indexes for table `sipd_tujuan`
--
ALTER TABLE `sipd_tujuan`
  ADD PRIMARY KEY (`id_kamus`);

--
-- Indexes for table `sipd_unit`
--
ALTER TABLE `sipd_unit`
  ADD PRIMARY KEY (`id_unit`),
  ADD KEY `id_skpd` (`id_skpd`);

--
-- Indexes for table `sipd_unit_detail`
--
ALTER TABLE `sipd_unit_detail`
  ADD PRIMARY KEY (`idinduk`,`setupunit`);

--
-- Indexes for table `sipd_user_asmas_detail`
--
ALTER TABLE `sipd_user_asmas_detail`
  ADD PRIMARY KEY (`iduser`,`idprofil`),
  ADD KEY `idlevel` (`idlevel`),
  ADD KEY `idkabkota` (`idkabkota`,`idcamat`,`idlurah`,`idlurahpengusul`,`iddaerahpengusul`,`aktakumham`);

--
-- Indexes for table `sipd_user_dewan_detail`
--
ALTER TABLE `sipd_user_dewan_detail`
  ADD PRIMARY KEY (`iduser`,`idprofil`),
  ADD KEY `idlevel` (`idlevel`),
  ADD KEY `idkabkota` (`idkabkota`,`idcamat`,`idlurah`,`idlurahpengusul`,`iddaerahpengusul`,`idlokasidesa`);

--
-- Indexes for table `sipd_user_keldes`
--
ALTER TABLE `sipd_user_keldes`
  ADD PRIMARY KEY (`id_lurah`,`id_camat`,`id_daerah`,`id_user`);

--
-- Indexes for table `sipd_user_keldes_detail`
--
ALTER TABLE `sipd_user_keldes_detail`
  ADD PRIMARY KEY (`iduser`),
  ADD KEY `idlevel` (`idlevel`,`idprofil`,`idkabkota`,`idlurah`),
  ADD KEY `idcamat` (`idcamat`);

--
-- Indexes for table `sipd_user_tapd`
--
ALTER TABLE `sipd_user_tapd`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `sipd_user_unit`
--
ALTER TABLE `sipd_user_unit`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_level` (`id_level`),
  ADD KEY `id_unit` (`id_unit`);

--
-- Indexes for table `sipd_usulan_reses`
--
ALTER TABLE `sipd_usulan_reses`
  ADD PRIMARY KEY (`id_reses`,`id_kamus`,`id_usulan`),
  ADD KEY `id_jenis_usul` (`id_jenis_usul`,`id_bidang_urusan`,`id_kab_kota`,`id_kecamatan`,`id_kelurahan`,`id_unit`);

--
-- Indexes for table `sipd_visi`
--
ALTER TABLE `sipd_visi`
  ADD PRIMARY KEY (`id_kamus`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apbd_temp`
--
ALTER TABLE `apbd_temp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
