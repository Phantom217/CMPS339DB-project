-- Generation time: Wed, 21 Nov 2018 18:03:28 +0000
-- Host: mysql.hostinger.ro
-- DB name: u574849695_24
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `VENDOR`;
CREATE TABLE `VENDOR` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT,
  `v_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v_location` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `VENDOR` VALUES ('1','Sauer-Barton','88033 Lilyan Square Suite 936\nWest Della, AL 62467'),
('2','Hammes PLC','43104 Wendy Court\nNew Haylieton, HI 16284-1763'),
('3','Pagac, Johnson and H','529 Wuckert Track Suite 984\nNikolauston, MA 43043-'),
('4','Kassulke LLC','2676 Collier Square Apt. 367\nVirginiatown, NJ 4381'),
('5','Crona-Von','19368 Sigrid Junction\nEast Carleemouth, MO 07482-1'),
('6','Emard, Lesch and Str','61676 Mann Bypass\nJosiahshire, MI 80495'),
('7','Stokes Inc','324 Sporer Fall Apt. 536\nSouth Fidel, MA 55415'),
('8','Cummings-Ebert','88286 Mertz Fork Suite 940\nHagenesville, OK 45808-'),
('9','Kiehn-Thompson','991 Hauck Field\nLake Clifton, MS 43121'),
('10','Weimann LLC','75263 Durgan Field Apt. 930\nWolffmouth, OH 69303'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

