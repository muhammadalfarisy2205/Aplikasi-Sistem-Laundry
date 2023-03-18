-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.1.48-MariaDB-0ubuntu0.18.04.1 - Ubuntu 18.04
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table zhiemy.tb_detail_transaksi
CREATE TABLE IF NOT EXISTS `tb_detail_transaksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_paket` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `keterangan` text,
  PRIMARY KEY (`id`),
  KEY `id_transaksi` (`id_transaksi`),
  KEY `id_paket` (`id_paket`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table zhiemy.tb_detail_transaksi: ~0 rows (approximately)

-- Dumping structure for table zhiemy.tb_member
CREATE TABLE IF NOT EXISTS `tb_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `tlp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table zhiemy.tb_member: ~0 rows (approximately)
INSERT INTO `tb_member` (`id`, `nama`, `alamat`, `jenis_kelamin`, `tlp`) VALUES
	(2, 'asdsa', 'dasdasd', 'L', '213123');

-- Dumping structure for table zhiemy.tb_outlet
CREATE TABLE IF NOT EXISTS `tb_outlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text,
  `tlp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table zhiemy.tb_outlet: ~2 rows (approximately)
INSERT INTO `tb_outlet` (`id`, `nama`, `alamat`, `tlp`) VALUES
	(3, 'Empang', 'Jalan Empang', '123'),
	(4, 'Ciomas', 'Jalan Raya Ciomas', '123'),
	(5, 'kia ucull', 'jln.kurucut', '0987654321');

-- Dumping structure for table zhiemy.tb_paket
CREATE TABLE IF NOT EXISTS `tb_paket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_outlet` int(11) NOT NULL DEFAULT '0',
  `jenis` enum('kiloan','selimut','bed_cover','kaos','lainnya') DEFAULT NULL,
  `nama_paket` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_outlet` (`id_outlet`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table zhiemy.tb_paket: ~0 rows (approximately)
INSERT INTO `tb_paket` (`id`, `id_outlet`, `jenis`, `nama_paket`, `harga`) VALUES
	(1, 4, 'kiloan', 'ada', 2323);

-- Dumping structure for table zhiemy.tb_transaksi
CREATE TABLE IF NOT EXISTS `tb_transaksi` (
  `id` int(11) NOT NULL,
  `id_outlet` int(11) DEFAULT NULL,
  `kode_invoice` varchar(100) DEFAULT NULL,
  `id_member` int(11) DEFAULT NULL,
  `tgl` int(11) DEFAULT NULL,
  `batas_waktu` datetime DEFAULT NULL,
  `tgl_bayar` datetime DEFAULT NULL,
  `biaya_tambahan` int(11) DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `pajak` int(11) DEFAULT NULL,
  `status` enum('baru','proses','selesai','diambil') DEFAULT NULL,
  `dibayar` enum('dibayar','belum dibayar') DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_outlet` (`id_outlet`),
  KEY `id_member` (`id_member`),
  KEY `kode_invoice` (`kode_invoice`),
  KEY `id_user` (`id_user`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table zhiemy.tb_transaksi: ~0 rows (approximately)
INSERT INTO `tb_transaksi` (`id`, `id_outlet`, `kode_invoice`, `id_member`, `tgl`, `batas_waktu`, `tgl_bayar`, `biaya_tambahan`, `diskon`, `pajak`, `status`, `dibayar`, `id_user`) VALUES
	(0, 3, '23232', 2, 2022, '2022-12-17 04:42:01', '2022-12-24 04:42:01', 2222, 2, 3, 'baru', '', NULL);

-- Dumping structure for table zhiemy.tb_user
CREATE TABLE IF NOT EXISTS `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` text,
  `id_outlet` int(11) NOT NULL DEFAULT '0',
  `role` enum('admin','kasir','owner') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_outlet` (`id_outlet`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table zhiemy.tb_user: ~3 rows (approximately)
INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `id_outlet`, `role`) VALUES
	(1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 0, 'admin'),
	(8, 'Muhammad Alfarisi', 'alfarisi', '21232f297a57a5a743894a0e4a801fc3', 4, 'owner'),
	(9, 'Eman Supriatna', 'eman', '21232f297a57a5a743894a0e4a801fc3', 4, 'kasir');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
