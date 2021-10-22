# SQL-Front 5.1  (Build 4.16)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: final
# ------------------------------------------------------
# Server version 5.5.5-10.4.19-MariaDB

#
# Source for table inventario
#

DROP TABLE IF EXISTS `inventario`;
CREATE TABLE `inventario` (
  `codigo` char(5) NOT NULL,
  `descr` varchar(30) NOT NULL,
  `caract` varchar(30) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `año` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Dumping data for table inventario
#

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES ('E001','Laptop','Intel i5 16Ram DD512','Lenovo',2015,'En uso');
INSERT INTO `inventario` VALUES ('E002','Monitor','21\' Led','Samsung',2000,'En uso');
INSERT INTO `inventario` VALUES ('E003','PC','AMD Ryzen 3 8Ram DD256','Genérico',2016,'En uso');
INSERT INTO `inventario` VALUES ('E005','Impresora','L3150','Epson',2019,'En uso');
INSERT INTO `inventario` VALUES ('E006','Escanner','Genérico','Genius',2002,'En uso');
INSERT INTO `inventario` VALUES ('E007','Monitor','14\'','Micronics',2004,'En uso');
INSERT INTO `inventario` VALUES ('E008','Laptop','Intel i9 32Ram 2TB','HP',2020,'En uso');
INSERT INTO `inventario` VALUES ('E009','Laptop','Intel Pentium 4 4Ram DD128','Akita',1996,'En uso');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table usuarios
#

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `codigo` char(5) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `rol` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Dumping data for table usuarios
#

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('A0001','admin','admin','admin');
INSERT INTO `usuarios` VALUES ('A0002','empleado','empleado','empleado');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
