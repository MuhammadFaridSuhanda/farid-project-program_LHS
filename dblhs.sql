/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.1.36-community-log : Database - dblhs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dblhs` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dblhs`;

/*Table structure for table `tbl_dosen` */

DROP TABLE IF EXISTS `tbl_dosen`;

CREATE TABLE `tbl_dosen` (
  `nidn` char(10) NOT NULL,
  `namadosen` varchar(30) DEFAULT NULL,
  `d_jeniskelamin` varchar(30) DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`nidn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_dosen` */

insert  into `tbl_dosen`(`nidn`,`namadosen`,`d_jeniskelamin`,`alamat`) values ('1243657809','Rini Asmara','Perempuan','Jl.Kenanga'),('2353464565','Eka Iswandi','Laki-Laki','Jl.Purus'),('2453554657','Isnardi','Laki-Laki','Jl.Abdi'),('4576329821','Novinaldi','Laki-Laki','Jl.Ikan'),('8709332145','Mike Febriani','Laki-Laki','Jl.Khatib');

/*Table structure for table `tbl_mahasiswa` */

DROP TABLE IF EXISTS `tbl_mahasiswa`;

CREATE TABLE `tbl_mahasiswa` (
  `nobp` char(10) NOT NULL,
  `namamhs` varchar(30) DEFAULT NULL,
  `jeniskelamin` varchar(30) DEFAULT NULL,
  `jurusan` varchar(30) DEFAULT NULL,
  `kelas` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`nobp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_mahasiswa` */

/*Table structure for table `tbl_matakuliah` */

DROP TABLE IF EXISTS `tbl_matakuliah`;

CREATE TABLE `tbl_matakuliah` (
  `idmatkul` char(10) NOT NULL,
  `namamatkul` varchar(30) DEFAULT NULL,
  `m_nidn` char(10) DEFAULT NULL,
  `sks` varchar(30) DEFAULT NULL,
  `semester` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idmatkul`),
  KEY `m_nidn` (`m_nidn`),
  CONSTRAINT `tbl_matakuliah_ibfk_1` FOREIGN KEY (`m_nidn`) REFERENCES `tbl_dosen` (`nidn`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_matakuliah` */

/*Table structure for table `tbl_nilai` */

DROP TABLE IF EXISTS `tbl_nilai`;

CREATE TABLE `tbl_nilai` (
  `n_nobp` char(10) DEFAULT NULL,
  `n_idmatkul` char(10) DEFAULT NULL,
  `jumlahkehadiran` varchar(10) DEFAULT NULL,
  `nilaitugas` double DEFAULT NULL,
  `nilaiuts` double DEFAULT NULL,
  `nilaiuas` double DEFAULT NULL,
  `nilaiakhir` double DEFAULT NULL,
  `keterangan` varchar(30) DEFAULT NULL,
  KEY `n_nobp` (`n_nobp`),
  KEY `n_idmatkul` (`n_idmatkul`),
  CONSTRAINT `tbl_nilai_ibfk_1` FOREIGN KEY (`n_nobp`) REFERENCES `tbl_mahasiswa` (`nobp`) ON UPDATE CASCADE,
  CONSTRAINT `tbl_nilai_ibfk_2` FOREIGN KEY (`n_idmatkul`) REFERENCES `tbl_matakuliah` (`idmatkul`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_nilai` */

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `iduser` char(10) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`iduser`,`username`,`password`,`email`,`lastlogin`) values ('A001','Farid','202cb962ac59075b964b07152d234b70','faridsuhanda@gmail.com','2024-01-21 19:15:46'),('A002','Wahyu','250cf8b51c773f3f8dc8b4be867a9a02','wahyuaulia@gmail.com','2024-01-21 19:08:20'),('A003','Zaki','68053af2923e00204c3ca7c6a3150cf7','ahmadzaki@gmail.com',NULL),('A004','Jaka','ff1f60f70a01f5ad0a9fbb322e947a81','jakaabimanyu@gmail.com',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
