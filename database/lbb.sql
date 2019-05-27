/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.36-MariaDB : Database - lbb
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*Table structure for table `detail_siswa` */

DROP TABLE IF EXISTS `detail_siswa`;

CREATE TABLE `detail_siswa` (
  `id_detail_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `nis` varchar(15) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `id_tahun_ajaran` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detail_siswa`),
  KEY `fkIdNis` (`nis`),
  KEY `fkIdKelas` (`id_kelas`),
  KEY `fkIdTahunAjaran` (`id_tahun_ajaran`),
  CONSTRAINT `fkIdKelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  CONSTRAINT `fkIdNis` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`),
  CONSTRAINT `fkIdTahunAjaran` FOREIGN KEY (`id_tahun_ajaran`) REFERENCES `tahun_ajaran` (`id_tahun_ajaran`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

/*Data for the table `detail_siswa` */

insert  into `detail_siswa`(`id_detail_siswa`,`nis`,`id_kelas`,`id_tahun_ajaran`) values (12,'154',15,8),(13,'360',15,8),(14,'408',15,8),(15,'421',15,8),(16,'436',15,8),(17,'441',16,8),(18,'469',16,8),(19,'471',16,8),(20,'495',16,8),(21,'508',16,8),(22,'550',20,8),(23,'559',20,8),(24,'560',20,8),(25,'569',20,8),(26,'597',20,8),(27,'601',17,8),(28,'630',17,8),(29,'637',17,8),(30,'640',17,8),(31,'641',17,8),(32,'650',18,8),(33,'668',18,8),(34,'686',18,8),(35,'687',18,8),(36,'706',18,8),(37,'715',19,8),(38,'736',19,8),(39,'743',19,8),(40,'921',19,8);

/*Table structure for table `detail_ujian` */

DROP TABLE IF EXISTS `detail_ujian`;

CREATE TABLE `detail_ujian` (
  `id_detail_ujian` int(11) NOT NULL AUTO_INCREMENT,
  `id_detail_siswa` int(11) DEFAULT NULL,
  `rata_rata` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detail_ujian`),
  KEY `fk_detail_siswa_ujian` (`id_detail_siswa`),
  CONSTRAINT `fk_detail_siswa_ujian` FOREIGN KEY (`id_detail_siswa`) REFERENCES `detail_siswa` (`id_detail_siswa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detail_ujian` */

/*Table structure for table `guru` */

DROP TABLE IF EXISTS `guru`;

CREATE TABLE `guru` (
  `nip` varchar(11) NOT NULL,
  `nama_guru` varchar(25) DEFAULT NULL,
  `jenis_kelamin_guru` varchar(15) DEFAULT NULL,
  `alamat_guru` varchar(25) DEFAULT NULL,
  `tgl_lahir_guru` date DEFAULT NULL,
  `foto_guru` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nip`),
  UNIQUE KEY `nip` (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `guru` */

insert  into `guru`(`nip`,`nama_guru`,`jenis_kelamin_guru`,`alamat_guru`,`tgl_lahir_guru`,`foto_guru`) values ('1111','Fitra Dwi Prasetya','Laki - Laki','Surabaya','2019-01-28',NULL),('2222','Bagus Eko','Laki - Laki','Mleto','2019-01-21',NULL);

/*Table structure for table `kelas` */

DROP TABLE IF EXISTS `kelas`;

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL AUTO_INCREMENT,
  `kelas` int(11) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `kelas` */

insert  into `kelas`(`id_kelas`,`kelas`,`foto`) values (15,1,NULL),(16,2,NULL),(17,4,NULL),(18,5,NULL),(19,6,NULL),(20,3,NULL);

/*Table structure for table `nilai` */

DROP TABLE IF EXISTS `nilai`;

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL AUTO_INCREMENT,
  `nilai_ulangan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_nilai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `nilai` */

/*Table structure for table `pelajaran` */

DROP TABLE IF EXISTS `pelajaran`;

CREATE TABLE `pelajaran` (
  `id_pelajaran` int(11) NOT NULL AUTO_INCREMENT,
  `mata_pelajaran` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_pelajaran`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `pelajaran` */

insert  into `pelajaran`(`id_pelajaran`,`mata_pelajaran`) values (10,'Matematika'),(11,'Biologi'),(12,'Kimia');

/*Table structure for table `pengumuman` */

DROP TABLE IF EXISTS `pengumuman`;

CREATE TABLE `pengumuman` (
  `id_pengumuman` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `isi_pengumuman` text,
  PRIMARY KEY (`id_pengumuman`),
  KEY `fk_id_user_p` (`id_user`),
  CONSTRAINT `fk_id_user_p` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `pengumuman` */

insert  into `pengumuman`(`id_pengumuman`,`id_user`,`isi_pengumuman`) values (1,1,'Hari ini Tidak Libur\r\n'),(3,1,'Diberitahukan kepada semua jajaran pengurus hari ini libur'),(4,1,'Dikarenakan ada rapat sekolah bahwa harii ini siswa di libur kan'),(5,1,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi perspiciatis veritatis enim quo, ducimus molestias pariatur eos aspernatur, soluta inventore, excepturi voluptas possimus ut similique quis vel, quaerat aut qui?	'),(6,1,'Tes Pengumuman Baru'),(7,1,'Tes Pengumuman'),(8,1,'tes'),(9,1,'Tes Bro'),(10,1,'Tes roooo'),(11,1,'Tes bro'),(12,1,'Coba tambah pengumuman baryu'),(13,1,'Coba Tambah pengumuman tes push notif');

/*Table structure for table `profile` */

DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
  `id_profile` int(11) NOT NULL AUTO_INCREMENT,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_profile`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `profile` */

/*Table structure for table `ranking` */

DROP TABLE IF EXISTS `ranking`;

CREATE TABLE `ranking` (
  `id_ranking` int(11) NOT NULL AUTO_INCREMENT,
  `nama_rangking` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ranking`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ranking` */

/*Table structure for table `raport` */

DROP TABLE IF EXISTS `raport`;

CREATE TABLE `raport` (
  `id_raport` int(11) NOT NULL AUTO_INCREMENT,
  `id_detail_ujian` int(11) DEFAULT NULL,
  `id_ujian` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_raport`),
  KEY `fkIdDetailUjian` (`id_detail_ujian`),
  KEY `fkIdUjian` (`id_ujian`),
  CONSTRAINT `fkIdDetailUjian` FOREIGN KEY (`id_detail_ujian`) REFERENCES `detail_ujian` (`id_detail_ujian`),
  CONSTRAINT `fkIdUjian` FOREIGN KEY (`id_ujian`) REFERENCES `ujian` (`id_ujian`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `raport` */

/*Table structure for table `siswa` */

DROP TABLE IF EXISTS `siswa`;

CREATE TABLE `siswa` (
  `nis` varchar(11) NOT NULL,
  `nama_siswa` varchar(25) DEFAULT NULL,
  `jenis_kelamin_siswa` varchar(15) DEFAULT NULL,
  `alamat_siswa` varchar(25) DEFAULT NULL,
  `tgl_lahir_siswa` date DEFAULT NULL,
  PRIMARY KEY (`nis`),
  UNIQUE KEY `nis` (`nis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `siswa` */

insert  into `siswa`(`nis`,`nama_siswa`,`jenis_kelamin_siswa`,`alamat_siswa`,`tgl_lahir_siswa`) values ('100','Paijo ','Laki - Laki','Mleto 1','1997-08-23'),('154','NGAKAN PUTU ANDRAYOGA K.W','Laki - Laki','PAKIS TIRTOSARI IX 14, SU','2008-02-02'),('360','SUSY HANDAYANI','Perempuan','DUKUH BULAK BTG SUROPAT I','2008-07-18'),('408','DEVI ANGGRAINI','Perempuan','GRIYA KEBRAON TENGAH 6','2008-01-01'),('421','NUNIK MEI IRAWATI','Perempuan','WEDORO UTARA 28 WARU, SID','2008-10-09'),('436','HARDIMAN','Laki - Laki','JL MANUKAN SARI RAYA 3K 1','2008-02-14'),('441','MOCHAMAD SAMSU J.W','Laki - Laki','JL.AR.HAKIM DELES I-18A S','2008-11-25'),('469','PRIMA CITRA WIBOWO','Laki - Laki','KLAMPIS AJI 2 NO 9, PROBO','2008-05-06'),('471','ERIEZA ANDRYANTO','Laki - Laki','DUPAK BANDAREJO  7, SURAB','2008-08-27'),('495','M. IBNU MUNDZIR','Laki - Laki','KLAMPIS NGASEM 55B, LAMPU','2008-12-30'),('508','CANDRA ADHITAMA K.','Laki - Laki','JL SEMOLOWARU SELATAN I 4','2008-03-17'),('550','AGUNG SUNARYANTO','Laki - Laki','JAGIR SIDORESMO 7 NO 122,','2008-07-29'),('559','SULIS TYANINGSIH','Perempuan','KLAMPIS NGASEM 3 16A, DEN','2008-01-31'),('560','YOGA PRAMUDITYA','Laki - Laki','SEMOLOWARU BAHARI BLOK 5','2008-11-11'),('569','H A N D O Y O','Laki - Laki','KRAMPUNG TENGAH 3, SURABA','2008-10-14'),('597','MEIRA WULANINGDIYAH','Perempuan','KEPUTIH 3C NO 16, TULUNGA','2008-09-19'),('601','MOCH. NASRULLAH KHUMAINI','Laki - Laki','TANAH MERAH UTARA7  45, S','2008-06-10'),('630','MOHAMMAD ZAMRONI','Laki - Laki','SINDUJOYO 2 NO 56A, GRESI','2008-08-03'),('637','ERA WIRASTUTI','Perempuan','NGAGEL TIMUR 44, SURABAYA','2008-05-18'),('640','NUNIK WIDYIASTUTI','Perempuan','KARSAH BUNTU 10, SURABAYA','2008-12-10'),('641','HERMAN ZAKARIA','Laki - Laki','CANDI LONTAR, SURABAYA','2008-02-01'),('650','THOHARI','Laki - Laki','SEMOLOWARU UTARA 1 116A,','2008-11-05'),('668','LUTFIYATI','Perempuan','KEBRAON TEGAL NO 33, SURA','2008-09-07'),('686','RONI TEGUH JUWANTO','Laki - Laki','BK TEMENGGUNGAN BL BENDO,','2008-08-08'),('687','FIDYAH RAHMAWATI','Perempuan','JL JOJORAN 5 NO 23, SURAB','2008-10-04'),('706','TETEN RULLYANTO','Laki - Laki','JL TEBEL BARAT RT04 RW02','2008-03-22'),('715','MOCHAMAD ARIEF','Laki - Laki','KAPASMADYA 1A1 NO 1, SURA','2008-01-12'),('736','TRI SETIARINI','Perempuan','BRIGJEN KATAMSO 1 81 D, S','2008-07-28'),('743','ACHMAD BASORI','Laki - Laki','JL.SIWALANKERTO 64E SURAB','2008-04-19'),('921','Bagus Eko','Laki - Laki','Mleto','1970-01-01'),('99','Paijo Update','Laki - Laki','Mleto 1','1997-08-23');

/*Table structure for table `tahun_ajaran` */

DROP TABLE IF EXISTS `tahun_ajaran`;

CREATE TABLE `tahun_ajaran` (
  `id_tahun_ajaran` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_ajaran` int(5) DEFAULT NULL,
  PRIMARY KEY (`id_tahun_ajaran`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `tahun_ajaran` */

insert  into `tahun_ajaran`(`id_tahun_ajaran`,`tahun_ajaran`) values (8,2019);

/*Table structure for table `ujian` */

DROP TABLE IF EXISTS `ujian`;

CREATE TABLE `ujian` (
  `id_ujian` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(15) DEFAULT NULL,
  `id_detail_siswa` int(11) DEFAULT NULL,
  `id_pelajaran` int(11) DEFAULT NULL,
  `nilai_ujian` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ujian`),
  KEY `fkNip` (`nip`),
  KEY `fkIdPelajaran` (`id_pelajaran`),
  KEY `fkIdDetailSiswa` (`id_detail_siswa`),
  CONSTRAINT `fkIdDetailSiswa` FOREIGN KEY (`id_detail_siswa`) REFERENCES `detail_siswa` (`id_detail_siswa`),
  CONSTRAINT `fkIdPelajaran` FOREIGN KEY (`id_pelajaran`) REFERENCES `pelajaran` (`id_pelajaran`),
  CONSTRAINT `fkNip` FOREIGN KEY (`nip`) REFERENCES `guru` (`nip`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

/*Data for the table `ujian` */

insert  into `ujian`(`id_ujian`,`nip`,`id_detail_siswa`,`id_pelajaran`,`nilai_ujian`) values (20,'1111',12,10,90),(21,'1111',12,11,80),(22,'1111',12,12,70),(23,'1111',13,10,70),(24,'1111',13,11,70),(25,'1111',13,12,70),(26,'1111',14,10,60),(27,'1111',14,11,60),(28,'1111',14,12,60),(29,'1111',15,10,80),(30,'1111',15,11,80),(31,'1111',15,12,80),(32,'1111',16,10,50),(33,'1111',16,11,50),(34,'1111',16,12,50),(35,'1111',17,10,90),(36,'1111',17,11,90),(37,'1111',17,12,90),(38,'1111',18,10,80),(39,'1111',18,11,80),(40,'1111',18,12,80),(41,'1111',19,10,70),(42,'1111',19,11,70),(43,'1111',19,12,70),(44,'1111',20,10,60),(45,'1111',20,11,60),(46,'1111',20,12,60),(47,'1111',21,10,50),(48,'1111',21,11,50),(49,'1111',21,12,50),(50,'1111',22,10,90),(51,'1111',22,11,90),(52,'1111',22,12,90),(53,'1111',23,10,80),(54,'1111',23,11,80),(55,'1111',23,12,80),(56,'1111',24,10,70),(57,'1111',24,11,70),(58,'1111',24,12,70),(59,'1111',25,10,60),(60,'1111',25,11,60),(61,'1111',25,12,60),(62,'1111',26,10,50),(63,'1111',26,11,50),(64,'1111',26,12,50),(65,'1111',27,10,90),(66,'1111',27,11,90),(67,'1111',27,12,90),(68,'1111',28,10,80),(69,'1111',28,11,80),(70,'1111',28,12,80),(71,'1111',29,10,70),(72,'1111',29,11,70),(73,'1111',29,12,70),(74,'1111',30,10,60),(75,'1111',30,11,60),(76,'1111',30,12,60),(77,'1111',31,10,50),(78,'1111',31,11,50),(79,'1111',31,12,50);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` int(11) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `level` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id_user`,`username`,`password`,`level`) values (1,123,'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec','A'),(14,1111,'33275a8aa48ea918bd53a9181aa975f15ab0d0645398f5918a006d08675c1cb27d5c645dbd084eee56e675e25ba4019f2ecea37ca9e2995b49fcb12c096a032e','G'),(48,154,'dc76224ce103959668fe797ec4184bc5605c323faa77b22ee62df9d1d139dfe6b9aa61cb42f7ee9707ae1d10143a180a8a48b012ef6d4d63f5187bd9e2b9ada9','S'),(49,360,'3627909a29c31381a071ec27f7c9ca97726182aed29a7ddd2e54353322cfb30abb9e3a6df2ac2c20fe23436311d678564d0c8d305930575f60e2d3d048184d79','S'),(50,408,'a4d9dc124962cf6e5d99068d6de00959675bf8bb330e96501ba303eda15f4c0d9870ef55743adf0cc10fd3a8ed61705b1c8bc59d93b637a3643f368055a9f176','S'),(51,421,'899d3ad8d784038de7b7ce981f13f3693dcaf5f002148de6cc26063e1d984fb950e734ca42801af3f2a25de349751956246ce0bdfcf769c6581d1e793ecdb224','S'),(52,436,'3d1a53452b97598e79b17ad0553dd5ad663e578206564b91e4f2bfe29b651bbb1e8dbfde7e751c7446ce6007d1801fcc05381f65b020ccfb8b3e6e4af8423c42','S'),(53,441,'532d070987041f345225ca98c24bbfd024e20da2307b1538eef7b6d9d2d8357e3b376e0a99de4cbec873fe2f7182116dea5411a1c9fc018a7b3a7cc11458b675','S'),(54,469,'29c668dd940b6f08594373125067f434f7285c6f8bfabc230872c610f836e6e87a2085c87abf1b8670a29dcc4ab4b854e6b856f5af8acc580e20a5503c90720d','S'),(55,471,'95c754ce6d4c1d43ff6ea509fa5694b1d47ba73e186346fe56051d1fc582c020440b698a434abf32f61d9699ae2abd2db9da72c13e267e725a3b86cb9bc6cf26','S'),(56,495,'700ad1ab118adba5d6a5b19cf19f492530d5ba5e6a51038f9d5874d8aa3ba33afa2c4653a61201edcd6d02e149617a2651442749f23be5a4663a5b53062d9923','S'),(57,508,'01b4ca133f1c03f7cef1263495bb674872fc0355b0451cd23acc51d396a67166f1356395abd4c51c177f1282e71dade4d5b963196f490b52d39c2a0ecc9273f3','S'),(58,550,'9872543fffbc7148aa3b8112dff04b886b305d1c96c8bf7cddbfd72caf209bdd5284adf17e585d8d7c98876c4999a3049a675125981a37e7bf67b2cf709dbc80','S'),(59,559,'81ca6a07d5f4f941b52a01afbc0b608c3e0344e1c1644b716d09cd1f3420e4da8d98576af61a0337f470c2b8ea2492af4fc7dddb5865ddae8e52dbf29784ec92','S'),(60,560,'da79b500393269c29fb78461f75af01e8108ef0bf7f9dc6635b60d271b9bd16fe1215f6f72bb8d002d0f248712606cc360a3d68b1f8eab00521b760b20fa855c','S'),(61,569,'8dab88308c59b4c6d6166ddb21ce5b20794746b491b26222e0bd308595f951d39fb5db1c760f236ba0ff1ff0bb0461e33d8979e5ba0c8c8398ce19ff1b069db2','S'),(62,597,'f47dbd431fca91acf025dc684a038319000a746f6def7e651cdc3000d436219090dabdfd71f3ff23a34411244ee62964cdfe2b79156b5812314ef7e8086660b4','S'),(63,601,'e49d8ce6d5a482175cde8195e46e0426d6c01bc86273ac5812fb966868f9dd2aae2e9c22ba18f22b050c9fad0cc01d7da246695e1613d0611ab9c8546ba23e09','S'),(64,630,'ae631cea49c278b087fb848da055bea3aad1445decdceae684d19157e57bddbaaf54aeacda97fbe0717fe2dc36728695c3f329f54e6272834d66b604616ad379','S'),(65,637,'773177d079d116ceaa805896970513ad22d1516352e24529b852be76c992184e06c0efd48964e3062e8c2fa6a158b9de503e9c105a28367a73dfd8e8e796dfef','S'),(66,640,'95de8e30728ed3e273edff1c6a9d8aa811742e846095c50d644f7bc50a429574ec784fe64b81fc3a5d6798dae40aaa079919a95d90f33fb39ace6419243b3a29','S'),(67,641,'4ffccc2ae62d0c42078139ae15214d26c8b031d4277023ca33ee3ed1257b85a231206a8be84e9108f017ae40185126c86a50a4847f9ab96e4d27971ecc23cf96','S'),(68,650,'90d1973132173615ae1803a1996509d69f8650d4e97da52c2486f6cb4c29c15b855b8fe2e6b392adbe56aae49a8a13eddb1917217c7281a9d2f7121091bdf161','S'),(69,668,'4fd58d19901ba7580d98249af0228bb4910820db0e6911e8084ebb7a846849ef0431f1ecd2540905ee99b87111c11739b9dddd17044f5da0beda3e9f93cbad5c','S'),(70,686,'44d82c1126d9c6ffac4492cb355e666f0a76bb001d79728785cd7a9bd4670c8d6d738907d70360005a3d63c04c50537c82c385c9f37ca4a1a6552290055675db','S'),(71,687,'15fa214b1df6f863c3b227d61ca920dafd4ba16235bb81c16b09ecc0bf33ec6a6638f186ff5ec63d71a8b61019554d7de992a097c5fde92f3a897425880ef0f6','S'),(72,706,'fc2a70d6d511d3b703369a006a0e075b239b4358b55330ced8e8be25fdbd3d367186271ee830712d1864ade8f67c9b28a1d3794fdb341a6f0e635bbc3263ceb5','S'),(73,715,'2b3cd8464834d78b069de65ccfff70731eb3db7868bed2d3077e45e579b296344491b21a5af98a4f8ee3337db5c1fea006e81b29644f28fe27dad7731419c8a9','S'),(74,736,'2cd3394822663c34d4fb7316624ca1078919bdab5f77159abb2dd761f79043e2542ec2f54681471c8ae43eac158f09f8160f3b3714c6f8252a446d1dfa249262','S'),(75,743,'e123b36abe204842ee829186f2de9e604f66f634322e3678af903e9d06d03dccdf5accc4d5cd612c2ff75f4c64a283e9500c466e235d7031f77a6329f8be56b9','S'),(76,921,'0330f9553da851978f5f604cef3dcad6a9e557f82cffba01070170b68399a4193e2380113f5798c4efdc8284a81c0125160e608fb46fdd7e98b3cc660981740f','S'),(77,2222,'a8cebf1698dc14282c507b1e1cfb7f2c9d5216aa7bd0854b50561e02c2b99d9a38945ec0f81e55f9699062b1eac6d0083411c839ba2b27c6a15b494463bc5c73','G');

/*Table structure for table `data_pribadi_siswa` */

DROP TABLE IF EXISTS `data_pribadi_siswa`;

/*!50001 DROP VIEW IF EXISTS `data_pribadi_siswa` */;
/*!50001 DROP TABLE IF EXISTS `data_pribadi_siswa` */;

/*!50001 CREATE TABLE  `data_pribadi_siswa`(
 `nis` varchar(11) ,
 `nama_siswa` varchar(25) ,
 `jenis_kelamin_siswa` varchar(15) ,
 `alamat_siswa` varchar(25) ,
 `tgl_lahir_siswa` date ,
 `id_detail_siswa` int(11) ,
 `id_kelas` int(11) ,
 `kelas` int(11) ,
 `id_tahun_ajaran` int(11) ,
 `tahun_ajaran` int(5) 
)*/;

/*Table structure for table `getranking` */

DROP TABLE IF EXISTS `getranking`;

/*!50001 DROP VIEW IF EXISTS `getranking` */;
/*!50001 DROP TABLE IF EXISTS `getranking` */;

/*!50001 CREATE TABLE  `getranking`(
 `id_ujian` int(11) ,
 `nip` varchar(15) ,
 `id_detail_siswa` int(11) ,
 `id_pelajaran` int(11) ,
 `nilai_ujian` int(11) ,
 `kelas` int(11) ,
 `nama_siswa` varchar(25) 
)*/;

/*Table structure for table `view_detail_siswa_print` */

DROP TABLE IF EXISTS `view_detail_siswa_print`;

/*!50001 DROP VIEW IF EXISTS `view_detail_siswa_print` */;
/*!50001 DROP TABLE IF EXISTS `view_detail_siswa_print` */;

/*!50001 CREATE TABLE  `view_detail_siswa_print`(
 `id_detail_siswa` int(11) ,
 `nis` varchar(11) ,
 `nama_siswa` varchar(25) ,
 `kelas` int(11) ,
 `tahun_ajaran` int(5) 
)*/;

/*Table structure for table `view_detail_siswa_ujian` */

DROP TABLE IF EXISTS `view_detail_siswa_ujian`;

/*!50001 DROP VIEW IF EXISTS `view_detail_siswa_ujian` */;
/*!50001 DROP TABLE IF EXISTS `view_detail_siswa_ujian` */;

/*!50001 CREATE TABLE  `view_detail_siswa_ujian`(
 `id_detail_siswa` int(11) ,
 `tahun_ajaran` int(5) ,
 `nis` varchar(11) ,
 `nama_siswa` varchar(25) ,
 `kelas` int(11) 
)*/;

/*Table structure for table `view_ranking` */

DROP TABLE IF EXISTS `view_ranking`;

/*!50001 DROP VIEW IF EXISTS `view_ranking` */;
/*!50001 DROP TABLE IF EXISTS `view_ranking` */;

/*!50001 CREATE TABLE  `view_ranking`(
 `rata` decimal(14,4) ,
 `nip` varchar(15) ,
 `kelas` int(11) ,
 `nama_siswa` varchar(25) ,
 `nis` varchar(11) ,
 `tahun_ajaran` int(5) ,
 `id_detail_siswa` int(11) 
)*/;

/*Table structure for table `view_raport` */

DROP TABLE IF EXISTS `view_raport`;

/*!50001 DROP VIEW IF EXISTS `view_raport` */;
/*!50001 DROP TABLE IF EXISTS `view_raport` */;

/*!50001 CREATE TABLE  `view_raport`(
 `nis` varchar(11) ,
 `nama_siswa` varchar(25) ,
 `kelas` int(11) ,
 `mata_pelajaran` varchar(25) ,
 `nilai_ujian` int(11) ,
 `rata_rata` int(11) 
)*/;

/*Table structure for table `view_raport1` */

DROP TABLE IF EXISTS `view_raport1`;

/*!50001 DROP VIEW IF EXISTS `view_raport1` */;
/*!50001 DROP TABLE IF EXISTS `view_raport1` */;

/*!50001 CREATE TABLE  `view_raport1`(
 `id_detail_siswa` int(11) ,
 `nis` varchar(11) ,
 `nama_siswa` varchar(25) ,
 `kelas` int(11) 
)*/;

/*Table structure for table `view_raport_first` */

DROP TABLE IF EXISTS `view_raport_first`;

/*!50001 DROP VIEW IF EXISTS `view_raport_first` */;
/*!50001 DROP TABLE IF EXISTS `view_raport_first` */;

/*!50001 CREATE TABLE  `view_raport_first`(
 `nis` varchar(11) ,
 `nama_siswa` varchar(25) ,
 `kelas` int(11) 
)*/;

/*Table structure for table `view_raport_full` */

DROP TABLE IF EXISTS `view_raport_full`;

/*!50001 DROP VIEW IF EXISTS `view_raport_full` */;
/*!50001 DROP TABLE IF EXISTS `view_raport_full` */;

/*!50001 CREATE TABLE  `view_raport_full`(
 `id_detail_siswa` int(11) ,
 `nis` varchar(11) ,
 `nama_siswa` varchar(25) ,
 `kelas` int(11) ,
 `mata_pelajaran` varchar(25) ,
 `nilai_ujian` int(11) 
)*/;

/*Table structure for table `view_raport_two` */

DROP TABLE IF EXISTS `view_raport_two`;

/*!50001 DROP VIEW IF EXISTS `view_raport_two` */;
/*!50001 DROP TABLE IF EXISTS `view_raport_two` */;

/*!50001 CREATE TABLE  `view_raport_two`(
 `nis` varchar(11) ,
 `nama_siswa` varchar(25) ,
 `kelas` int(11) ,
 `mata_pelajaran` varchar(25) ,
 `nilai_ujian` int(11) 
)*/;

/*Table structure for table `view_siswa_to_detail` */

DROP TABLE IF EXISTS `view_siswa_to_detail`;

/*!50001 DROP VIEW IF EXISTS `view_siswa_to_detail` */;
/*!50001 DROP TABLE IF EXISTS `view_siswa_to_detail` */;

/*!50001 CREATE TABLE  `view_siswa_to_detail`(
 `nis` varchar(11) ,
 `nama_siswa` varchar(25) ,
 `jenis_kelamin_siswa` varchar(15) ,
 `alamat_siswa` varchar(25) ,
 `tgl_lahir_siswa` date 
)*/;

/*Table structure for table `view_ujian` */

DROP TABLE IF EXISTS `view_ujian`;

/*!50001 DROP VIEW IF EXISTS `view_ujian` */;
/*!50001 DROP TABLE IF EXISTS `view_ujian` */;

/*!50001 CREATE TABLE  `view_ujian`(
 `id_ujian` int(11) ,
 `nip` varchar(11) ,
 `nama_guru` varchar(25) ,
 `id_detail_siswa` int(11) ,
 `nis` varchar(11) ,
 `nama_siswa` varchar(25) ,
 `id_kelas` int(11) ,
 `kelas` int(11) ,
 `id_pelajaran` int(11) ,
 `mata_pelajaran` varchar(25) ,
 `nilai_ujian` int(11) 
)*/;

/*View structure for view data_pribadi_siswa */

/*!50001 DROP TABLE IF EXISTS `data_pribadi_siswa` */;
/*!50001 DROP VIEW IF EXISTS `data_pribadi_siswa` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_pribadi_siswa` AS select `siswa`.`nis` AS `nis`,`siswa`.`nama_siswa` AS `nama_siswa`,`siswa`.`jenis_kelamin_siswa` AS `jenis_kelamin_siswa`,`siswa`.`alamat_siswa` AS `alamat_siswa`,`siswa`.`tgl_lahir_siswa` AS `tgl_lahir_siswa`,`detail_siswa`.`id_detail_siswa` AS `id_detail_siswa`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`tahun_ajaran`.`id_tahun_ajaran` AS `id_tahun_ajaran`,`tahun_ajaran`.`tahun_ajaran` AS `tahun_ajaran` from (((`detail_siswa` left join `siswa` on((`siswa`.`nis` = `detail_siswa`.`nis`))) left join `kelas` on((`kelas`.`id_kelas` = `detail_siswa`.`id_kelas`))) left join `tahun_ajaran` on((`tahun_ajaran`.`id_tahun_ajaran` = `detail_siswa`.`id_tahun_ajaran`))) */;

/*View structure for view getranking */

/*!50001 DROP TABLE IF EXISTS `getranking` */;
/*!50001 DROP VIEW IF EXISTS `getranking` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `getranking` AS select `ujian`.`id_ujian` AS `id_ujian`,`ujian`.`nip` AS `nip`,`ujian`.`id_detail_siswa` AS `id_detail_siswa`,`ujian`.`id_pelajaran` AS `id_pelajaran`,`ujian`.`nilai_ujian` AS `nilai_ujian`,`kelas`.`kelas` AS `kelas`,`siswa`.`nama_siswa` AS `nama_siswa` from (((`ujian` join `detail_siswa` on((`ujian`.`id_detail_siswa` = `detail_siswa`.`id_detail_siswa`))) join `kelas` on((`detail_siswa`.`id_kelas` = `kelas`.`id_kelas`))) join `siswa` on((`detail_siswa`.`nis` = `siswa`.`nis`))) */;

/*View structure for view view_detail_siswa_print */

/*!50001 DROP TABLE IF EXISTS `view_detail_siswa_print` */;
/*!50001 DROP VIEW IF EXISTS `view_detail_siswa_print` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_detail_siswa_print` AS select `detail_siswa`.`id_detail_siswa` AS `id_detail_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama_siswa` AS `nama_siswa`,`kelas`.`kelas` AS `kelas`,max(`tahun_ajaran`.`tahun_ajaran`) AS `tahun_ajaran` from (((`detail_siswa` left join `siswa` on((`siswa`.`nis` = `detail_siswa`.`nis`))) left join `kelas` on((`kelas`.`id_kelas` = `detail_siswa`.`id_kelas`))) left join `tahun_ajaran` on((`tahun_ajaran`.`id_tahun_ajaran` = `tahun_ajaran`.`id_tahun_ajaran`))) group by `siswa`.`nis` */;

/*View structure for view view_detail_siswa_ujian */

/*!50001 DROP TABLE IF EXISTS `view_detail_siswa_ujian` */;
/*!50001 DROP VIEW IF EXISTS `view_detail_siswa_ujian` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_detail_siswa_ujian` AS select `detail_siswa`.`id_detail_siswa` AS `id_detail_siswa`,`tahun_ajaran`.`tahun_ajaran` AS `tahun_ajaran`,`siswa`.`nis` AS `nis`,`siswa`.`nama_siswa` AS `nama_siswa`,`kelas`.`kelas` AS `kelas` from (((`detail_siswa` left join `siswa` on((`siswa`.`nis` = `detail_siswa`.`nis`))) left join `kelas` on((`kelas`.`id_kelas` = `detail_siswa`.`id_kelas`))) left join `tahun_ajaran` on((`tahun_ajaran`.`id_tahun_ajaran` = `detail_siswa`.`id_tahun_ajaran`))) order by `detail_siswa`.`id_detail_siswa` */;

/*View structure for view view_ranking */

/*!50001 DROP TABLE IF EXISTS `view_ranking` */;
/*!50001 DROP VIEW IF EXISTS `view_ranking` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_ranking` AS select avg(`ujian`.`nilai_ujian`) AS `rata`,`ujian`.`nip` AS `nip`,`kelas`.`kelas` AS `kelas`,`siswa`.`nama_siswa` AS `nama_siswa`,`siswa`.`nis` AS `nis`,`tahun_ajaran`.`tahun_ajaran` AS `tahun_ajaran`,`detail_siswa`.`id_detail_siswa` AS `id_detail_siswa` from ((((`ujian` join `detail_siswa` on((`ujian`.`id_detail_siswa` = `detail_siswa`.`id_detail_siswa`))) join `kelas` on((`detail_siswa`.`id_kelas` = `kelas`.`id_kelas`))) join `siswa` on((`detail_siswa`.`nis` = `siswa`.`nis`))) join `tahun_ajaran` on((`tahun_ajaran`.`id_tahun_ajaran` = `detail_siswa`.`id_tahun_ajaran`))) group by `siswa`.`nama_siswa`,`tahun_ajaran`.`tahun_ajaran` order by `kelas`.`kelas`,avg(`ujian`.`nilai_ujian`) desc */;

/*View structure for view view_raport */

/*!50001 DROP TABLE IF EXISTS `view_raport` */;
/*!50001 DROP VIEW IF EXISTS `view_raport` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_raport` AS select `siswa`.`nis` AS `nis`,`siswa`.`nama_siswa` AS `nama_siswa`,`kelas`.`kelas` AS `kelas`,`pelajaran`.`mata_pelajaran` AS `mata_pelajaran`,`ujian`.`nilai_ujian` AS `nilai_ujian`,`detail_ujian`.`rata_rata` AS `rata_rata` from (((((`detail_ujian` left join `detail_siswa` on((`detail_siswa`.`id_detail_siswa` = `detail_ujian`.`id_detail_siswa`))) left join `ujian` on((`ujian`.`id_detail_siswa` = `detail_siswa`.`id_detail_siswa`))) left join `siswa` on((`siswa`.`nis` = `detail_siswa`.`nis`))) left join `kelas` on((`kelas`.`id_kelas` = `detail_siswa`.`id_kelas`))) left join `pelajaran` on((`pelajaran`.`id_pelajaran` = `ujian`.`id_pelajaran`))) */;

/*View structure for view view_raport1 */

/*!50001 DROP TABLE IF EXISTS `view_raport1` */;
/*!50001 DROP VIEW IF EXISTS `view_raport1` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_raport1` AS select `detail_siswa`.`id_detail_siswa` AS `id_detail_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama_siswa` AS `nama_siswa`,`kelas`.`kelas` AS `kelas` from (((`detail_ujian` left join `detail_siswa` on((`detail_siswa`.`id_detail_siswa` = `detail_ujian`.`id_detail_siswa`))) left join `siswa` on((`siswa`.`nis` = `detail_siswa`.`nis`))) left join `kelas` on((`kelas`.`id_kelas` = `detail_siswa`.`id_kelas`))) */;

/*View structure for view view_raport_first */

/*!50001 DROP TABLE IF EXISTS `view_raport_first` */;
/*!50001 DROP VIEW IF EXISTS `view_raport_first` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_raport_first` AS select `siswa`.`nis` AS `nis`,`siswa`.`nama_siswa` AS `nama_siswa`,`kelas`.`kelas` AS `kelas` from (((`detail_ujian` left join `detail_siswa` on((`detail_siswa`.`id_detail_siswa` = `detail_ujian`.`id_detail_siswa`))) left join `siswa` on((`siswa`.`nis` = `detail_siswa`.`nis`))) left join `kelas` on((`kelas`.`id_kelas` = `detail_siswa`.`id_kelas`))) */;

/*View structure for view view_raport_full */

/*!50001 DROP TABLE IF EXISTS `view_raport_full` */;
/*!50001 DROP VIEW IF EXISTS `view_raport_full` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_raport_full` AS select `detail_siswa`.`id_detail_siswa` AS `id_detail_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama_siswa` AS `nama_siswa`,`kelas`.`kelas` AS `kelas`,`pelajaran`.`mata_pelajaran` AS `mata_pelajaran`,`ujian`.`nilai_ujian` AS `nilai_ujian` from ((((`ujian` left join `detail_siswa` on((`detail_siswa`.`id_detail_siswa` = `ujian`.`id_detail_siswa`))) left join `siswa` on((`siswa`.`nis` = `detail_siswa`.`nis`))) left join `kelas` on((`kelas`.`id_kelas` = `detail_siswa`.`id_kelas`))) left join `pelajaran` on((`pelajaran`.`id_pelajaran` = `ujian`.`id_pelajaran`))) */;

/*View structure for view view_raport_two */

/*!50001 DROP TABLE IF EXISTS `view_raport_two` */;
/*!50001 DROP VIEW IF EXISTS `view_raport_two` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_raport_two` AS select `siswa`.`nis` AS `nis`,`siswa`.`nama_siswa` AS `nama_siswa`,`kelas`.`kelas` AS `kelas`,`pelajaran`.`mata_pelajaran` AS `mata_pelajaran`,`ujian`.`nilai_ujian` AS `nilai_ujian` from ((((`ujian` left join `detail_siswa` on((`detail_siswa`.`id_detail_siswa` = `ujian`.`id_detail_siswa`))) left join `siswa` on((`siswa`.`nis` = `detail_siswa`.`nis`))) left join `kelas` on((`kelas`.`id_kelas` = `detail_siswa`.`id_kelas`))) left join `pelajaran` on((`pelajaran`.`id_pelajaran` = `ujian`.`id_pelajaran`))) */;

/*View structure for view view_siswa_to_detail */

/*!50001 DROP TABLE IF EXISTS `view_siswa_to_detail` */;
/*!50001 DROP VIEW IF EXISTS `view_siswa_to_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_siswa_to_detail` AS select `a`.`nis` AS `nis`,`a`.`nama_siswa` AS `nama_siswa`,`a`.`jenis_kelamin_siswa` AS `jenis_kelamin_siswa`,`a`.`alamat_siswa` AS `alamat_siswa`,`a`.`tgl_lahir_siswa` AS `tgl_lahir_siswa` from `siswa` `a` where (not(exists(select 1 from `detail_siswa` `b` where (`b`.`nis` = `a`.`nis`)))) */;

/*View structure for view view_ujian */

/*!50001 DROP TABLE IF EXISTS `view_ujian` */;
/*!50001 DROP VIEW IF EXISTS `view_ujian` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_ujian` AS select `ujian`.`id_ujian` AS `id_ujian`,`guru`.`nip` AS `nip`,`guru`.`nama_guru` AS `nama_guru`,`detail_siswa`.`id_detail_siswa` AS `id_detail_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama_siswa` AS `nama_siswa`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`pelajaran`.`id_pelajaran` AS `id_pelajaran`,`pelajaran`.`mata_pelajaran` AS `mata_pelajaran`,`ujian`.`nilai_ujian` AS `nilai_ujian` from (((((`ujian` left join `guru` on((`guru`.`nip` = `ujian`.`nip`))) left join `detail_siswa` on((`detail_siswa`.`id_detail_siswa` = `ujian`.`id_detail_siswa`))) left join `siswa` on((`siswa`.`nis` = `detail_siswa`.`nis`))) left join `kelas` on((`kelas`.`id_kelas` = `detail_siswa`.`id_kelas`))) left join `pelajaran` on((`pelajaran`.`id_pelajaran` = `ujian`.`id_pelajaran`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
