-- MySQL dump 10.13  Distrib 9.6.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_keuangan_mandiri
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dompet`
--

DROP TABLE IF EXISTS `dompet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dompet` (
  `id_dompet` varchar(10) NOT NULL,
  `nama_dompet` varchar(50) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `saldo_awal` float NOT NULL,
  PRIMARY KEY (`id_dompet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dompet`
--

LOCK TABLES `dompet` WRITE;
/*!40000 ALTER TABLE `dompet` DISABLE KEYS */;
INSERT INTO `dompet` VALUES ('1001','Dompet kUlit','Tunai',500000),('1002','GoPay','e-wallet',700000),('1003','Dana','e-wallet',300000),('1004','BCA','rekening bank',1000000);
/*!40000 ALTER TABLE `dompet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori_pengeluaran`
--

DROP TABLE IF EXISTS `kategori_pengeluaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori_pengeluaran` (
  `id_kategori` varchar(10) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori_pengeluaran`
--

LOCK TABLES `kategori_pengeluaran` WRITE;
/*!40000 ALTER TABLE `kategori_pengeluaran` DISABLE KEYS */;
INSERT INTO `kategori_pengeluaran` VALUES ('3001','Jajan'),('3002','Transportasi'),('3003','Orang Tua'),('3004','DLL');
/*!40000 ALTER TABLE `kategori_pengeluaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemasukan`
--

DROP TABLE IF EXISTS `pemasukan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pemasukan` (
  `id_pemasukan` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `nominal` float NOT NULL,
  `catatan` varchar(100) DEFAULT NULL,
  `id_dompet` varchar(10) NOT NULL,
  `id_sumber` varchar(10) NOT NULL,
  PRIMARY KEY (`id_pemasukan`),
  KEY `fk_pemasukan_dompet` (`id_dompet`),
  KEY `fk_pemasukan_sumber` (`id_sumber`),
  CONSTRAINT `fk_pemasukan_dompet` FOREIGN KEY (`id_dompet`) REFERENCES `dompet` (`id_dompet`),
  CONSTRAINT `fk_pemasukan_sumber` FOREIGN KEY (`id_sumber`) REFERENCES `sumber_pemasukan` (`id_sumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemasukan`
--

LOCK TABLES `pemasukan` WRITE;
/*!40000 ALTER TABLE `pemasukan` DISABLE KEYS */;
INSERT INTO `pemasukan` VALUES ('5001','2026-09-25',5000000,'Gaji','1001','2001'),('5002','2026-09-25',1000000,'Hasil Lembur','1002','2002'),('5003','2026-10-12',500000,'Tambahan Freelance','1004','2003');
/*!40000 ALTER TABLE `pemasukan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengeluaran`
--

DROP TABLE IF EXISTS `pengeluaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengeluaran` (
  `id_pengeluaran` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `nominal` float NOT NULL,
  `catatan` varchar(100) DEFAULT NULL,
  `id_dompet` varchar(10) DEFAULT NULL,
  `id_kategori` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_pengeluaran`),
  KEY `fk_pengeluaran_dompet` (`id_dompet`),
  KEY `fk_pengeluaran_kategori` (`id_kategori`),
  CONSTRAINT `fk_pengeluaran_dompet` FOREIGN KEY (`id_dompet`) REFERENCES `dompet` (`id_dompet`),
  CONSTRAINT `fk_pengeluaran_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_pengeluaran` (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengeluaran`
--

LOCK TABLES `pengeluaran` WRITE;
/*!40000 ALTER TABLE `pengeluaran` DISABLE KEYS */;
INSERT INTO `pengeluaran` VALUES ('6001','2026-10-07',50000,'Bensin','1001','3002'),('6002','2026-09-25',500000,'Kasih Orang Tua','1004','3003'),('6003','2026-10-15',100000,'Nongkrong','1002','3001'),('6004','2026-10-01',50000,'Sumbangan','1003','3004');
/*!40000 ALTER TABLE `pengeluaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sumber_pemasukan`
--

DROP TABLE IF EXISTS `sumber_pemasukan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sumber_pemasukan` (
  `id_sumber` varchar(10) NOT NULL,
  `nama_sumber` varchar(50) NOT NULL,
  PRIMARY KEY (`id_sumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sumber_pemasukan`
--

LOCK TABLES `sumber_pemasukan` WRITE;
/*!40000 ALTER TABLE `sumber_pemasukan` DISABLE KEYS */;
INSERT INTO `sumber_pemasukan` VALUES ('2001','Gaji'),('2002','Lembur'),('2003','Freelance');
/*!40000 ALTER TABLE `sumber_pemasukan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer` (
  `id_transfer` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `nominal` float NOT NULL,
  `biaya_admin` float DEFAULT NULL,
  `catatan` varchar(50) DEFAULT NULL,
  `id_dompet_asal` varchar(10) NOT NULL,
  `id_dompet_tujuan` varchar(10) NOT NULL,
  PRIMARY KEY (`id_transfer`),
  KEY `fk_transfer_asal` (`id_dompet_asal`),
  KEY `fk_transfer_tujuan` (`id_dompet_tujuan`),
  CONSTRAINT `fk_transfer_asal` FOREIGN KEY (`id_dompet_asal`) REFERENCES `dompet` (`id_dompet`),
  CONSTRAINT `fk_transfer_tujuan` FOREIGN KEY (`id_dompet_tujuan`) REFERENCES `dompet` (`id_dompet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer`
--

LOCK TABLES `transfer` WRITE;
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
INSERT INTO `transfer` VALUES ('4001','2026-10-10',500000,2000,'Uang Jajan','1001','1002'),('4002','2026-09-15',300000,NULL,'Freelance','1002','1003'),('4003','2026-08-20',400000,NULL,NULL,'1004','1003');
/*!40000 ALTER TABLE `transfer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-18 21:43:19
