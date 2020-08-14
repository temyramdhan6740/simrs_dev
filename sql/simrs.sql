/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.6.21 : Database - simrs_dev
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`simrs_dev` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `simrs_dev`;

/*Table structure for table `tbl_agama` */

DROP TABLE IF EXISTS `tbl_agama`;

CREATE TABLE `tbl_agama` (
  `id_agama` int(11) NOT NULL AUTO_INCREMENT,
  `agama` varchar(30) NOT NULL,
  PRIMARY KEY (`id_agama`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_agama` */

insert  into `tbl_agama`(`id_agama`,`agama`) values (1,'ISLAM'),(2,'KRISTEN'),(3,'HINDU'),(4,'BUDHA');

/*Table structure for table `tbl_bidang` */

DROP TABLE IF EXISTS `tbl_bidang`;

CREATE TABLE `tbl_bidang` (
  `id_bidang` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bidang` varchar(35) NOT NULL,
  PRIMARY KEY (`id_bidang`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_bidang` */

insert  into `tbl_bidang`(`id_bidang`,`nama_bidang`) values (1,'BIDANG 1'),(2,'BIDANG 2'),(3,'bidang 33');

/*Table structure for table `tbl_departemen` */

DROP TABLE IF EXISTS `tbl_departemen`;

CREATE TABLE `tbl_departemen` (
  `id_departemen` int(11) NOT NULL AUTO_INCREMENT,
  `nama_departemen` varchar(40) NOT NULL,
  PRIMARY KEY (`id_departemen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_departemen` */

insert  into `tbl_departemen`(`id_departemen`,`nama_departemen`) values (1,'DEPARTEMEN 1'),(2,'KEAMANAN'),(3,'KEUANGAN');

/*Table structure for table `tbl_diagnosa_penyakit` */

DROP TABLE IF EXISTS `tbl_diagnosa_penyakit`;

CREATE TABLE `tbl_diagnosa_penyakit` (
  `kode_diagnosa` varchar(6) NOT NULL,
  `nama_penyakit` varchar(50) NOT NULL,
  `ciri_ciri_penyakit` text NOT NULL,
  `keterangan` text NOT NULL,
  `ciri_ciri_umum` text NOT NULL,
  PRIMARY KEY (`kode_diagnosa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_diagnosa_penyakit` */

/*Table structure for table `tbl_dokter` */

DROP TABLE IF EXISTS `tbl_dokter`;

CREATE TABLE `tbl_dokter` (
  `kode_dokter` varchar(20) NOT NULL,
  `nama_dokter` varchar(30) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `id_agama` int(11) NOT NULL,
  `alamat_tinggal` text NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `id_status_menikah` int(11) NOT NULL,
  `id_spesialis` int(11) NOT NULL,
  `no_izin_praktek` varchar(20) NOT NULL,
  `golongan_darah` varchar(2) NOT NULL,
  `alumni` varchar(40) NOT NULL,
  PRIMARY KEY (`kode_dokter`),
  KEY `id_agama` (`id_agama`),
  KEY `id_spesialis` (`id_spesialis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_dokter` */

insert  into `tbl_dokter`(`kode_dokter`,`nama_dokter`,`jenis_kelamin`,`tempat_lahir`,`tanggal_lahir`,`id_agama`,`alamat_tinggal`,`no_hp`,`id_status_menikah`,`id_spesialis`,`no_izin_praktek`,`golongan_darah`,`alumni`) values ('001','dr. Aminuddin, Sp.THT-KL (K),.','L','Bandung','1980-05-11',1,'Bandung','0822410159167',1,1,'123456','A','Universitas Padjajaran'),('002','dr. Dianawaty Amiruddin, M.Si,','P','Garut','1978-09-08',1,'Bandung','0822410159167',1,2,'78910','AB','Universitas Padjajaran'),('003','Dr. dr. Ema Alasiry, Sp.A (K)','P','Bandung','1978-09-01',1,'Bandung','0822410159167',1,3,'111213','A','Universitas Padjajaran');

/*Table structure for table `tbl_gedung_rawat_inap` */

DROP TABLE IF EXISTS `tbl_gedung_rawat_inap`;

CREATE TABLE `tbl_gedung_rawat_inap` (
  `kode_gedung_rawat_inap` varchar(20) NOT NULL,
  `nama_gedung` varchar(40) NOT NULL,
  PRIMARY KEY (`kode_gedung_rawat_inap`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_gedung_rawat_inap` */

insert  into `tbl_gedung_rawat_inap`(`kode_gedung_rawat_inap`,`nama_gedung`) values ('GDCND','GEDUNG CUT NYAK DHIEN'),('GDMLYHT','GEDUNG MALAYAHATI'),('TKMR','GEDUNG TEUKU UMAR');

/*Table structure for table `tbl_jabatan` */

DROP TABLE IF EXISTS `tbl_jabatan`;

CREATE TABLE `tbl_jabatan` (
  `id_jabatan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jabatan` varchar(30) NOT NULL,
  PRIMARY KEY (`id_jabatan`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_jabatan` */

insert  into `tbl_jabatan`(`id_jabatan`,`nama_jabatan`) values (1,'JABATAN 1'),(2,'JABATAN 2'),(3,'PENGANGGUNG JAWAB LAB');

/*Table structure for table `tbl_jadwal_praktek_dokter` */

DROP TABLE IF EXISTS `tbl_jadwal_praktek_dokter`;

CREATE TABLE `tbl_jadwal_praktek_dokter` (
  `id_jadwal` int(11) NOT NULL AUTO_INCREMENT,
  `kode_dokter` varchar(20) NOT NULL,
  `hari` varchar(13) NOT NULL,
  `jam_mulai` varchar(13) NOT NULL,
  `jam_selesai` varchar(13) NOT NULL,
  `id_poliklinik` int(11) NOT NULL,
  PRIMARY KEY (`id_jadwal`),
  KEY `id_poliklinik` (`id_poliklinik`),
  KEY `kode_dokter` (`kode_dokter`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_jadwal_praktek_dokter` */

insert  into `tbl_jadwal_praktek_dokter`(`id_jadwal`,`kode_dokter`,`hari`,`jam_mulai`,`jam_selesai`,`id_poliklinik`) values (1,'0001','SENIN','08.00','11.30',3),(2,'0003','RABU','10.00','12.00',2),(3,'0002','JUMAT','11.00','13.00',2),(4,'003','SENIN','07.00','12.00',3),(5,'002','SELASA','07.00','12.00',30);

/*Table structure for table `tbl_jenis_bayar` */

DROP TABLE IF EXISTS `tbl_jenis_bayar`;

CREATE TABLE `tbl_jenis_bayar` (
  `id_jenis_bayar` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_bayar` varchar(30) NOT NULL,
  PRIMARY KEY (`id_jenis_bayar`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_jenis_bayar` */

insert  into `tbl_jenis_bayar`(`id_jenis_bayar`,`jenis_bayar`) values (1,'Bayar Sendiri'),(2,'BPJS');

/*Table structure for table `tbl_jenjang` */

DROP TABLE IF EXISTS `tbl_jenjang`;

CREATE TABLE `tbl_jenjang` (
  `kode_jenjang` varchar(10) NOT NULL,
  `nama_jenjang` varchar(40) NOT NULL,
  PRIMARY KEY (`kode_jenjang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_jenjang` */

insert  into `tbl_jenjang`(`kode_jenjang`,`nama_jenjang`) values ('J1','JENJANG 1'),('J2','JENJANG 2'),('J3','JENJANG 3'),('J4','JENJANG 4');

/*Table structure for table `tbl_jenjang_pendidikan` */

DROP TABLE IF EXISTS `tbl_jenjang_pendidikan`;

CREATE TABLE `tbl_jenjang_pendidikan` (
  `id_jenjang_pendidikan` int(11) NOT NULL AUTO_INCREMENT,
  `jenjang_pendidikan` varchar(20) NOT NULL,
  PRIMARY KEY (`id_jenjang_pendidikan`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_jenjang_pendidikan` */

insert  into `tbl_jenjang_pendidikan`(`id_jenjang_pendidikan`,`jenjang_pendidikan`) values (1,'SD'),(2,'SMP'),(3,'SMA'),(4,'D3'),(5,'D4'),(6,'S1'),(7,'S2');

/*Table structure for table `tbl_kategori_barang` */

DROP TABLE IF EXISTS `tbl_kategori_barang`;

CREATE TABLE `tbl_kategori_barang` (
  `id_kategori_barang` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) NOT NULL,
  PRIMARY KEY (`id_kategori_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_kategori_barang` */

insert  into `tbl_kategori_barang`(`id_kategori_barang`,`nama_kategori`) values (1,'Obat Penenang'),(2,'Obat Tidur');

/*Table structure for table `tbl_kategori_tindakan` */

DROP TABLE IF EXISTS `tbl_kategori_tindakan`;

CREATE TABLE `tbl_kategori_tindakan` (
  `kode_kategori_tindakan` varchar(6) NOT NULL,
  `kategori_tindakan` varchar(40) NOT NULL,
  PRIMARY KEY (`kode_kategori_tindakan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_kategori_tindakan` */

insert  into `tbl_kategori_tindakan`(`kode_kategori_tindakan`,`kategori_tindakan`) values ('GG001','Tindakan Gigi'),('JT001','Tindakan jantung');

/*Table structure for table `tbl_menu` */

DROP TABLE IF EXISTS `tbl_menu`;

CREATE TABLE `tbl_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `url` varchar(30) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `is_main_menu` int(11) NOT NULL,
  `is_aktif` enum('y','n') NOT NULL COMMENT 'y=yes,n=no',
  `tabel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_menu` */

insert  into `tbl_menu`(`id_menu`,`title`,`url`,`icon`,`is_main_menu`,`is_aktif`,`tabel`) values (1,'KELOLA MENU','kelolamenu','fa fa-server',0,'y','tbl_menu'),(2,'KELOLA PENGGUNA','user','fa fa-user-o',0,'y','tbl_user'),(3,'level PENGGUNA','userlevel','fa fa-users',0,'n',NULL),(6,'DATA JENJANG','jenjang','fa fa-area-chart',19,'y',NULL),(7,'DATA JABATAN','jabatan','fa fa-briefcase',19,'y',NULL),(8,'DATA PEGAWAI','pegawai','fa fa-users',0,'y','tbl_pegawai'),(9,'Contoh Form','welcome/form','fa fa-id-card',0,'n',NULL),(13,'DATA DOKTER','dokter','fa fa-graduation-cap',0,'y','tbl_dokter'),(14,'JADWAL PRAKTEK DOKTER','jadwalpraktek','fa fa-calendar',0,'y','tbl_jadwal_praktek_dokter'),(15,'DATA POLIKLINIK','poliklinik','fa fa-university',19,'y',NULL),(16,'DATA SPESIALIS','spesialis','fa fa-heartbeat',19,'y',NULL),(17,'DATA DEPARTEMEN','departemen','fa fa-building',19,'y',NULL),(18,'DATA BIDANG PEGAWAI','bidang','fa fa-binoculars',19,'y',NULL),(19,'data master','#','fa fa-id-card',0,'y',NULL),(20,'data gedung','gedung','fa fa-building-o',19,'y',NULL),(21,'data pasien','pasien','fa fa-id-card-o',0,'y','tbl_pasien'),(22,'form pendaftaran','pendaftaran/create','fa fa-sticky-note-o',0,'y',NULL),(23,'data ruang rawat inap','ruangranap','fa fa-building',19,'y',NULL),(24,'data tempat tidur','tempattidur','fa fa-bed',0,'y','tbl_tempat_tidur'),(25,'laporan rawat jalan','pendaftaran/index/ralan','fa fa-bed',0,'y','tbl_rawat_inap'),(26,'laporan rawat inap','pendaftaran/index/ranap','fa fa-id-card',0,'y','tbl_rawat_inap'),(27,'data obat dan alkes','dataobat','fa fa-medkit',30,'y',NULL),(28,'data kategori barang','kategoribarang','fa fa-picture-o',30,'y',NULL),(29,'data satuan barang','datasatuan','fa fa-object-group',30,'y',NULL),(30,'MODUL APOTEK','#','fa fa-bed',0,'y',NULL),(31,'LAPORAN PENGADAAN OBAT','pengadaan','fa fa-area-chart',30,'y',NULL),(32,'laporan penjualan','penjualan','fa fa-money',30,'y',NULL),(33,'Profile Rumah Sakit','profile/update/1','fa fa-id-card-o',0,'y','tbl_profil_rumah_sakit'),(34,'Data Supplier','supplier','fa fa-area-chart',30,'y',NULL),(35,'MENU TINDAKAN','#','fa fa-graduation-cap',0,'y',NULL),(36,'DATA DIGANOSA PENYAKIT','diagnosa','fa fa-bar-chart',35,'y',NULL),(37,'data kategori tindakan','kategoritindakan','fa fa-microchip',35,'y',NULL),(38,'data pemeriksaan lab','periksalabor','fa fa-bed',35,'y',NULL),(39,'data tindakan','data_tindakan','fa fa-map-o',35,'y',NULL);

/*Table structure for table `tbl_obat_alkes_bhp` */

DROP TABLE IF EXISTS `tbl_obat_alkes_bhp`;

CREATE TABLE `tbl_obat_alkes_bhp` (
  `kode_barang` varchar(6) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `id_kategori_barang` int(11) NOT NULL,
  `id_satuan_barang` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_obat_alkes_bhp` */

insert  into `tbl_obat_alkes_bhp`(`kode_barang`,`nama_barang`,`id_kategori_barang`,`id_satuan_barang`,`harga`) values ('001','BETADIN',1,1,45000),('002','OBAT BATUK',1,1,40000);

/*Table structure for table `tbl_pasien` */

DROP TABLE IF EXISTS `tbl_pasien`;

CREATE TABLE `tbl_pasien` (
  `no_rekamedis` varchar(10) NOT NULL,
  `nama_pasien` varchar(30) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `golongan_darah` varchar(3) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nama_ibu` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `id_agama` int(11) NOT NULL,
  `status_menikah` varchar(30) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `id_pekerjaan` int(11) NOT NULL,
  PRIMARY KEY (`no_rekamedis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_pasien` */

insert  into `tbl_pasien`(`no_rekamedis`,`nama_pasien`,`jenis_kelamin`,`golongan_darah`,`tempat_lahir`,`tanggal_lahir`,`nama_ibu`,`alamat`,`id_agama`,`status_menikah`,`no_hp`,`id_pekerjaan`) values ('0002','Ujang','L','A','Cibiru','2020-02-13','hh','ghjg',1,'1','00876',1),('3211','AA','L','A','Cibiru','2020-02-13','hh','hjbhb',1,'1','00',1);

/*Table structure for table `tbl_pegawai` */

DROP TABLE IF EXISTS `tbl_pegawai`;

CREATE TABLE `tbl_pegawai` (
  `nik` int(20) NOT NULL,
  `nama_pegawai` varchar(50) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `npwp` varchar(25) NOT NULL,
  `id_jenjang_pendidikan` int(11) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `kode_jenjang` varchar(10) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  `id_bidang` int(11) NOT NULL,
  PRIMARY KEY (`nik`),
  KEY `id_bidang` (`id_bidang`),
  KEY `id_departemen` (`id_departemen`),
  KEY `id_jabatan` (`id_jabatan`),
  KEY `id_pendidikan` (`id_jenjang_pendidikan`),
  KEY `kode_jenjang` (`kode_jenjang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_pegawai` */

insert  into `tbl_pegawai`(`nik`,`nama_pegawai`,`jenis_kelamin`,`npwp`,`id_jenjang_pendidikan`,`tempat_lahir`,`tanggal_lahir`,`id_jabatan`,`kode_jenjang`,`id_departemen`,`id_bidang`) values (0,'temy','L','123',6,'Cibiru','2020-01-11',1,'J1',1,1);

/*Table structure for table `tbl_pekerjaan` */

DROP TABLE IF EXISTS `tbl_pekerjaan`;

CREATE TABLE `tbl_pekerjaan` (
  `id_pekerjaan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pekerjaan` varchar(40) NOT NULL,
  PRIMARY KEY (`id_pekerjaan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_pekerjaan` */

insert  into `tbl_pekerjaan`(`id_pekerjaan`,`nama_pekerjaan`) values (1,'PNS'),(2,'SWASTA');

/*Table structure for table `tbl_pemeriksaan_laboratorium` */

DROP TABLE IF EXISTS `tbl_pemeriksaan_laboratorium`;

CREATE TABLE `tbl_pemeriksaan_laboratorium` (
  `kode_periksa` varchar(6) NOT NULL,
  `nama_periksa` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  PRIMARY KEY (`kode_periksa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_pemeriksaan_laboratorium` */

insert  into `tbl_pemeriksaan_laboratorium`(`kode_periksa`,`nama_periksa`,`tarif`) values ('DR','Darah',45000),('SB','Urin',40000);

/*Table structure for table `tbl_pendaftaran` */

DROP TABLE IF EXISTS `tbl_pendaftaran`;

CREATE TABLE `tbl_pendaftaran` (
  `no_registrasi` varchar(10) NOT NULL,
  `no_rawat` varchar(18) NOT NULL,
  `no_rekamedis` varchar(6) NOT NULL,
  `cara_masuk` varchar(30) NOT NULL,
  `tanggal_daftar` datetime NOT NULL,
  `kode_dokter_penanggung_jawab` int(11) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `nama_penanggung_jawab` varchar(30) NOT NULL,
  `hubungan_dengan_penanggung_jawab` varchar(30) NOT NULL,
  `alamat_penanggung_jawab` text NOT NULL,
  `id_jenis_bayar` int(11) NOT NULL,
  `asal_rujukan` varchar(50) NOT NULL,
  PRIMARY KEY (`no_rawat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_pendaftaran` */

insert  into `tbl_pendaftaran`(`no_registrasi`,`no_rawat`,`no_rekamedis`,`cara_masuk`,`tanggal_daftar`,`kode_dokter_penanggung_jawab`,`id_poli`,`nama_penanggung_jawab`,`hubungan_dengan_penanggung_jawab`,`alamat_penanggung_jawab`,`id_jenis_bayar`,`asal_rujukan`) values ('0001','2019/11/28/0001','000001','RAWAT INAP','2019-11-28 00:00:00',1,21,'PJ','saudara kandung','Garut',1,'Puskesmas'),('0001','2020/02/13/0001','1','RAWAT JALAN','2020-02-13 00:00:00',3,1,'001','saudara kandung','111',2,'BPJS'),('0002','2020/02/13/0002','2','RAWAT JALAN','2020-02-13 00:00:00',1,1,'2','saudara kandung','2',1,'j'),('0001','2020/02/16/0001','1','RAWAT JALAN','2020-02-16 00:00:00',1,14,'001','saudara kandung','juhg',1,'s'),('0002','2020/02/16/0002','3211','RAWAT JALAN','2020-02-16 00:00:00',2,1,'Ujang','saudara kandung','ASAS',1,'asd');

/*Table structure for table `tbl_pengadaan_detail` */

DROP TABLE IF EXISTS `tbl_pengadaan_detail`;

CREATE TABLE `tbl_pengadaan_detail` (
  `id_pengadaan` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(6) NOT NULL,
  `qty` int(11) NOT NULL,
  `no_faktur` varchar(10) NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`id_pengadaan`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_pengadaan_detail` */

insert  into `tbl_pengadaan_detail`(`id_pengadaan`,`kode_barang`,`qty`,`no_faktur`,`harga`) values (17,'001',40,'TR00020',10000),(19,'002',10,'TR00020',50000),(20,'001',5,'FK0031',10),(21,'002',70,'',45000),(22,'001',70,'',45000),(23,'001',70,'BR00034',45000),(24,'002',70,'BR00034',45000);

/*Table structure for table `tbl_pengadaan_obat_alkes_bhp` */

DROP TABLE IF EXISTS `tbl_pengadaan_obat_alkes_bhp`;

CREATE TABLE `tbl_pengadaan_obat_alkes_bhp` (
  `no_faktur` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_supplier` varchar(8) NOT NULL,
  PRIMARY KEY (`no_faktur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_pengadaan_obat_alkes_bhp` */

insert  into `tbl_pengadaan_obat_alkes_bhp`(`no_faktur`,`tanggal`,`kode_supplier`) values ('FK0031','2017-12-13','0001'),('TR00020','2017-12-12','kimia fa');

/*Table structure for table `tbl_penjualan_detail` */

DROP TABLE IF EXISTS `tbl_penjualan_detail`;

CREATE TABLE `tbl_penjualan_detail` (
  `id_penjualan` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `no_faktur` varchar(8) NOT NULL,
  PRIMARY KEY (`id_penjualan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_penjualan_detail` */

insert  into `tbl_penjualan_detail`(`id_penjualan`,`kode_barang`,`qty`,`no_faktur`) values (3,1,1,'1234'),(4,1,1,'1234');

/*Table structure for table `tbl_penjualan_obat_alkes_bhp` */

DROP TABLE IF EXISTS `tbl_penjualan_obat_alkes_bhp`;

CREATE TABLE `tbl_penjualan_obat_alkes_bhp` (
  `no_faktur` varchar(8) NOT NULL,
  `tanggal` date NOT NULL,
  `nama_pembeli` varchar(50) NOT NULL,
  PRIMARY KEY (`no_faktur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_penjualan_obat_alkes_bhp` */

insert  into `tbl_penjualan_obat_alkes_bhp`(`no_faktur`,`tanggal`,`nama_pembeli`) values ('1234','2017-12-24','');

/*Table structure for table `tbl_pj_riwayat_tindakan` */

DROP TABLE IF EXISTS `tbl_pj_riwayat_tindakan`;

CREATE TABLE `tbl_pj_riwayat_tindakan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_riwayat_tindakan` int(11) NOT NULL,
  `kode_pj` varchar(20) NOT NULL,
  `keterangan` enum('dokter','petugas','dokter_dan_petugas') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_pj_riwayat_tindakan` */

insert  into `tbl_pj_riwayat_tindakan`(`id`,`id_riwayat_tindakan`,`kode_pj`,`keterangan`) values (1,11,'001','dokter');

/*Table structure for table `tbl_poliklinik` */

DROP TABLE IF EXISTS `tbl_poliklinik`;

CREATE TABLE `tbl_poliklinik` (
  `id_poliklinik` int(11) NOT NULL AUTO_INCREMENT,
  `nama_poliklinik` varchar(40) NOT NULL,
  PRIMARY KEY (`id_poliklinik`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_poliklinik` */

insert  into `tbl_poliklinik`(`id_poliklinik`,`nama_poliklinik`) values (1,'Poliklinik Gigi Spesialis'),(2,'Poliklinik Penyakit Dalam'),(3,'Poliklinik Anak'),(4,'Poliklinik Kandungan dan Kebidanan (Obgy'),(5,'Dokter Umum'),(6,'Poliklinik Telinga Hidung Tenggorokan'),(7,'Poliklinik Kedokteran Jiwa atau Psikiatr'),(8,'Poliklinik Mata'),(9,'Medical Check Up'),(10,'Poliklinik Radiologi'),(11,'Laboratorium'),(12,'Home Care'),(13,'Poliklinik Andrologi'),(14,'Poliklinik Saraf'),(15,'Poliklinik Jantung dan Pembuluh Darah'),(16,'Poliklinik Bedah'),(17,'Poliklinik Pulmonologi dan Kedokteran Re'),(18,'Poliklinik Kedokteran Fisik dan Rehabili'),(19,'Poliklinik Patologi Anatomi'),(20,'Poliklinik Gizi'),(21,'Poliklinik Gigi Umum'),(22,'Poliklinik Anestesiologi dan Terapi Inte'),(23,'Poliklinik Penyakit Kulit dan Kelamin'),(24,'Poliklinik Akupunktur'),(25,'Poliklinik Farmakologi'),(26,'Poliklinik Kedokteran Forensik'),(27,'Poliklinik Kedokteran Olahraga'),(28,'Poliklinik Mikrobiologi'),(29,'Poliklinik Patologi'),(30,'Poliklinik Kulit');

/*Table structure for table `tbl_profil_rumah_sakit` */

DROP TABLE IF EXISTS `tbl_profil_rumah_sakit`;

CREATE TABLE `tbl_profil_rumah_sakit` (
  `id` int(11) NOT NULL,
  `nama_rumah_sakit` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `propinsi` varchar(30) NOT NULL,
  `kabupaten` varchar(30) NOT NULL,
  `no_telpon` varchar(13) NOT NULL,
  `logo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_profil_rumah_sakit` */

insert  into `tbl_profil_rumah_sakit`(`id`,`nama_rumah_sakit`,`alamat`,`propinsi`,`kabupaten`,`no_telpon`,`logo`) values (1,'Sistem Informasi Rumah Sakit','Jl A.H Nasution No.105','Jawa Barat','Bandung','021-32432323','logo-rs3.jpg');

/*Table structure for table `tbl_rawat_inap` */

DROP TABLE IF EXISTS `tbl_rawat_inap`;

CREATE TABLE `tbl_rawat_inap` (
  `no_rawat` varchar(18) NOT NULL,
  `tanggal_masuk` datetime NOT NULL,
  `tanggal_keluar` datetime NOT NULL,
  `kode_tempat_tidur` varchar(20) NOT NULL,
  PRIMARY KEY (`no_rawat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_rawat_inap` */

insert  into `tbl_rawat_inap`(`no_rawat`,`tanggal_masuk`,`tanggal_keluar`,`kode_tempat_tidur`) values ('2017/12/05/0002','2017-12-05 00:00:00','0000-00-00 00:00:00','004'),('2017/12/05/0005','2017-12-05 00:00:00','0000-00-00 00:00:00','004'),('2017/12/05/0006','2017-12-05 00:00:00','0000-00-00 00:00:00','001'),('2019/11/28/0001','2019-11-28 00:00:00','0000-00-00 00:00:00','001');

/*Table structure for table `tbl_riwayat_pemberian_obat` */

DROP TABLE IF EXISTS `tbl_riwayat_pemberian_obat`;

CREATE TABLE `tbl_riwayat_pemberian_obat` (
  `id_riwayat` int(11) NOT NULL AUTO_INCREMENT,
  `no_rawat` varchar(18) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_barang` varchar(6) NOT NULL,
  `jumlah` int(11) NOT NULL,
  PRIMARY KEY (`id_riwayat`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_riwayat_pemberian_obat` */

insert  into `tbl_riwayat_pemberian_obat`(`id_riwayat`,`no_rawat`,`tanggal`,`kode_barang`,`jumlah`) values (1,'2017/12/20/0001','2017-12-20','001',1),(2,'2017/12/20/0001','2017-12-20','002',2),(3,'2017/12/17/0001','2017-12-21','001',1),(4,'2017/12/17/0001','2017-12-21','001',4),(5,'2019/11/28/0001','2019-11-28','001',1);

/*Table structure for table `tbl_riwayat_pemeriksaan_laboratorium` */

DROP TABLE IF EXISTS `tbl_riwayat_pemeriksaan_laboratorium`;

CREATE TABLE `tbl_riwayat_pemeriksaan_laboratorium` (
  `id_riwayat` int(11) NOT NULL AUTO_INCREMENT,
  `no_rawat` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_periksa` varchar(6) NOT NULL,
  PRIMARY KEY (`id_riwayat`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_riwayat_pemeriksaan_laboratorium` */

insert  into `tbl_riwayat_pemeriksaan_laboratorium`(`id_riwayat`,`no_rawat`,`tanggal`,`kode_periksa`) values (7,'2017/12/17/0001','2017-12-21','DR'),(8,'2017/12/17/0001','2017-12-21','sb'),(9,'2019/11/28/0001','2019-11-28','DR');

/*Table structure for table `tbl_riwayat_pemeriksaan_laboratorium_detail` */

DROP TABLE IF EXISTS `tbl_riwayat_pemeriksaan_laboratorium_detail`;

CREATE TABLE `tbl_riwayat_pemeriksaan_laboratorium_detail` (
  `id_rawat_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_rawat` int(18) NOT NULL,
  `kode_sub_periksa` varchar(6) NOT NULL,
  `hasil` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_rawat_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_riwayat_pemeriksaan_laboratorium_detail` */

insert  into `tbl_riwayat_pemeriksaan_laboratorium_detail`(`id_rawat_detail`,`id_rawat`,`kode_sub_periksa`,`hasil`,`keterangan`) values (3,7,'gd',10,'ok'),(4,7,'hg',20,'ok'),(5,8,'sb',40,'normal'),(6,9,'gd',10,''),(7,9,'hg',10,'');

/*Table structure for table `tbl_riwayat_tindakan` */

DROP TABLE IF EXISTS `tbl_riwayat_tindakan`;

CREATE TABLE `tbl_riwayat_tindakan` (
  `id_riwayat_tindakan` int(11) NOT NULL AUTO_INCREMENT,
  `kode_tindakan` varchar(6) NOT NULL,
  `no_rawat` varchar(18) NOT NULL,
  `hasil_periksa` varchar(100) NOT NULL,
  `perkembangan` varchar(100) NOT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id_riwayat_tindakan`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_riwayat_tindakan` */

insert  into `tbl_riwayat_tindakan`(`id_riwayat_tindakan`,`kode_tindakan`,`no_rawat`,`hasil_periksa`,`perkembangan`,`tanggal`) values (6,'0003','2017/12/17/0001','ok','ok','2017-12-19 00:00:00'),(7,'002','2017/12/17/0001','ok','ok','2017-12-19 00:00:00'),(8,'0001','2017/12/17/0001','OK','OK','2017-12-19 00:00:00'),(9,'002','2017/12/20/0001','luka sudah kering','sudah lebih baik','2017-12-20 00:00:00'),(10,'0003','2017/12/20/0001','suhu tubuh normal','normal','2017-12-20 00:00:00'),(11,'0003','2019/11/28/0001','39','Demam','2019-11-28 00:00:00');

/*Table structure for table `tbl_ruang_rawat_inap` */

DROP TABLE IF EXISTS `tbl_ruang_rawat_inap`;

CREATE TABLE `tbl_ruang_rawat_inap` (
  `kode_ruang_rawat_inap` varchar(30) NOT NULL,
  `kode_gedung_rawat_inap` varchar(30) NOT NULL,
  `nama_ruangan` varchar(35) NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `tarif` int(11) NOT NULL,
  PRIMARY KEY (`kode_ruang_rawat_inap`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_ruang_rawat_inap` */

insert  into `tbl_ruang_rawat_inap`(`kode_ruang_rawat_inap`,`kode_gedung_rawat_inap`,`nama_ruangan`,`kelas`,`tarif`) values ('','','RUANG KEMBANG SEPATU','VIP',34000),('CNDMLT','GDCND','RUANGAN MELATI','KELAS 1',50000),('KMRSPT','TKMR','RUANG MELATI','VIP',60000),('MLHYTMWR','GDMLYHT','RUAG MAWAR','VIP',100000),('RKLSA','GDCND','RUANG TESTING','KELAS 2',34000);

/*Table structure for table `tbl_satuan_barang` */

DROP TABLE IF EXISTS `tbl_satuan_barang`;

CREATE TABLE `tbl_satuan_barang` (
  `id_satuan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(60) NOT NULL,
  PRIMARY KEY (`id_satuan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_satuan_barang` */

insert  into `tbl_satuan_barang`(`id_satuan`,`nama_satuan`) values (1,'botol'),(2,'ampul');

/*Table structure for table `tbl_spesialis` */

DROP TABLE IF EXISTS `tbl_spesialis`;

CREATE TABLE `tbl_spesialis` (
  `id_spesialis` int(11) NOT NULL AUTO_INCREMENT,
  `spesialis` varchar(40) NOT NULL,
  PRIMARY KEY (`id_spesialis`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_spesialis` */

insert  into `tbl_spesialis`(`id_spesialis`,`spesialis`) values (1,'UROLOGI'),(2,'RADIOLOGI'),(3,'BEDAH ANAK'),(4,'BEDAH SYARAF'),(5,'PENYAKIT DALAM'),(6,'BEDAH UMUM'),(7,'KULIT DAN KELAMIN'),(8,'REHAB MEDIK DAN FISIK'),(9,'ORTHOPEDI DAN TRAUMATOLOGI'),(10,'JANTUNG DAN PEMBULUH DARAH'),(11,'ANAK'),(12,'OBGIEN'),(13,'MATA'),(14,'ANDROLOGI'),(15,'THT');

/*Table structure for table `tbl_status_menikah` */

DROP TABLE IF EXISTS `tbl_status_menikah`;

CREATE TABLE `tbl_status_menikah` (
  `id_status_menikah` int(11) NOT NULL AUTO_INCREMENT,
  `status_menikah` varchar(30) NOT NULL,
  PRIMARY KEY (`id_status_menikah`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_status_menikah` */

insert  into `tbl_status_menikah`(`id_status_menikah`,`status_menikah`) values (1,'kawin'),(2,'belum kawin'),(3,'duda'),(4,'janda');

/*Table structure for table `tbl_sub_pemeriksaan_laboratoirum` */

DROP TABLE IF EXISTS `tbl_sub_pemeriksaan_laboratoirum`;

CREATE TABLE `tbl_sub_pemeriksaan_laboratoirum` (
  `kode_sub_periksa` varchar(6) NOT NULL,
  `kode_periksa` varchar(6) NOT NULL,
  `nama_pemeriksaan` varchar(50) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `nilai_rujukan` int(11) NOT NULL,
  PRIMARY KEY (`kode_sub_periksa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_sub_pemeriksaan_laboratoirum` */

insert  into `tbl_sub_pemeriksaan_laboratoirum`(`kode_sub_periksa`,`kode_periksa`,`nama_pemeriksaan`,`satuan`,`nilai_rujukan`) values ('','DR2','TESTING','mg',10),('gd','DR','gula darah','mkl',0),('hg','DR','Hemoglobin','gdr',0),('sb','sb','tinggi suhu badan','celcius',10),('TTS','DR2','TEST KEDUA','MG',10);

/*Table structure for table `tbl_supplier` */

DROP TABLE IF EXISTS `tbl_supplier`;

CREATE TABLE `tbl_supplier` (
  `kode_supplier` varchar(6) NOT NULL,
  `nama_supplier` varchar(60) NOT NULL,
  `alamat` text NOT NULL,
  `no_telpon` varchar(13) NOT NULL,
  PRIMARY KEY (`kode_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_supplier` */

insert  into `tbl_supplier`(`kode_supplier`,`nama_supplier`,`alamat`,`no_telpon`) values ('0001','kimia farma','jl bandung no 20 kota bandung','021-34563');

/*Table structure for table `tbl_tempat_tidur` */

DROP TABLE IF EXISTS `tbl_tempat_tidur`;

CREATE TABLE `tbl_tempat_tidur` (
  `kode_tempat_tidur` varchar(10) NOT NULL,
  `kode_ruang_rawat_inap` varchar(20) NOT NULL,
  `status` enum('kosong','diisi') NOT NULL,
  PRIMARY KEY (`kode_tempat_tidur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_tempat_tidur` */

insert  into `tbl_tempat_tidur`(`kode_tempat_tidur`,`kode_ruang_rawat_inap`,`status`) values ('001','CNDMLT','diisi'),('002','MLHYTMWR','kosong'),('003','RUAG MAWAR','kosong'),('004','MLHYTMWR','kosong'),('006','CNDMLT','kosong');

/*Table structure for table `tbl_tindakan` */

DROP TABLE IF EXISTS `tbl_tindakan`;

CREATE TABLE `tbl_tindakan` (
  `kode_tindakan` varchar(6) NOT NULL,
  `jenis_tindakan` enum('rawat_jalan','rawat_inap','','') NOT NULL,
  `nama_tindakan` varchar(30) NOT NULL,
  `kode_kategori_tindakan` varchar(6) NOT NULL,
  `tarif` int(11) NOT NULL,
  `tindakan_oleh` enum('dokter','petugas','dokter_dan_petugas','') NOT NULL,
  `id_poliklinik` int(11) DEFAULT NULL,
  PRIMARY KEY (`kode_tindakan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_tindakan` */

insert  into `tbl_tindakan`(`kode_tindakan`,`jenis_tindakan`,`nama_tindakan`,`kode_kategori_tindakan`,`tarif`,`tindakan_oleh`,`id_poliklinik`) values ('0001','rawat_jalan','PEMERIKSAAN GIGI','GG001',45000,'dokter',1),('0003','rawat_inap','PEMERIKSAAN SUHU TUBUH','JT001',34000,'petugas',1),('002','rawat_jalan','LEPAS PERBAN','GG001',35000,'dokter_dan_petugas',1);

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `id_users` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `images` text NOT NULL,
  `id_user_level` int(11) NOT NULL,
  `is_aktif` enum('y','n') NOT NULL,
  PRIMARY KEY (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`id_users`,`full_name`,`email`,`password`,`images`,`id_user_level`,`is_aktif`) values (1,'System Administrator','admsys@rs.go.id','827ccb0eea8a706c4c34a16891f84e7b','cc.png',1,'y'),(2,'Kontributor','sys@rs.go.id','e807f1fcf82d132f9bb018ca6738a19f','cc.png',2,'y'),(3,'temy','temyramdhan6740@gmail.com','827ccb0eea8a706c4c34a16891f84e7b','Call-Centre-PNG-Photo1.png',1,'y'),(4,'Tisue Magic','tisue@a.com','827ccb0eea8a706c4c34a16891f84e7b','',2,'y');

/*Table structure for table `tbl_user_level` */

DROP TABLE IF EXISTS `tbl_user_level`;

CREATE TABLE `tbl_user_level` (
  `id_user_level` int(11) NOT NULL AUTO_INCREMENT,
  `nama_level` varchar(30) NOT NULL,
  PRIMARY KEY (`id_user_level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_user_level` */

insert  into `tbl_user_level`(`id_user_level`,`nama_level`) values (1,'Super Admin'),(2,'Admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
