-- Generation time: Wed, 21 Nov 2018 18:24:52 +0000
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

DROP TABLE IF EXISTS `SCHEDULE`;
CREATE TABLE `SCHEDULE` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `s_to` datetime(6) NOT NULL,
  `s_from` datetime(6) NOT NULL,
  PRIMARY KEY (`s_id`),
  KEY `FK_SCHEDULE_TEACHER` (`teacher_id`),
  CONSTRAINT `FK_SCHEDULE_TEACHER` FOREIGN KEY (`teacher_id`) REFERENCES `TEACHER` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `SCHEDULE` VALUES ('1','1','0000-00-00 00:00:00.000000','0000-00-00 00:00:00.000000'),
('2','2','0000-00-00 00:00:00.000000','2015-12-18 00:00:00.000000'),
('3','3','0000-00-00 00:00:00.000000','0000-00-00 00:00:00.000000'),
('4','4','0000-00-00 00:00:00.000000','0000-00-00 00:00:00.000000'),
('5','5','0000-00-00 00:00:00.000000','0000-00-00 00:00:00.000000'),
('6','6','0000-00-00 00:00:00.000000','0000-00-00 00:00:00.000000'),
('7','7','0000-00-00 00:00:00.000000','0000-00-00 00:00:00.000000'),
('8','8','0000-00-00 00:00:00.000000','0000-00-00 00:00:00.000000'),
('9','9','0000-00-00 00:00:00.000000','0000-00-00 00:00:00.000000'),
('10','10','0000-00-00 00:00:00.000000','2019-02-01 00:00:00.000000'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

