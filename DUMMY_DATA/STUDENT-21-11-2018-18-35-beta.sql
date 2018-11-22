-- Generation time: Wed, 21 Nov 2018 18:35:49 +0000
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

DROP TABLE IF EXISTS `STUDENT`;
CREATE TABLE `STUDENT` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stud_detail_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `FK_STUDENT_DETAIL` (`stud_detail_id`),
  CONSTRAINT `FK_STUDENT_DETAIL` FOREIGN KEY (`stud_detail_id`) REFERENCES `STUDENT_DETAIL` (`sd_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `STUDENT` VALUES ('1','Helena','Hahn','1'),
('2','Angie','Gutmann','2'),
('3','Patsy','Cruickshank','3'),
('4','Julianne','Toy','4'),
('5','Ruby','O\'Kon','5'),
('6','Sincere','Legros','6'),
('7','Neva','Schumm','7'),
('8','Shaina','Rice','8'),
('9','Antonina','Kertzmann','9'),
('10','Angie','Leffler','10'),
('11','Madge','Mertz','11'),
('12','Marcella','Walter','12'),
('13','Lavonne','Padberg','13'),
('14','Belle','McLaughlin','14'),
('15','Jeanette','Stamm','15'),
('16','Nikita','Sipes','16'),
('17','Patricia','Steuber','17'),
('18','Edythe','Dare','18'),
('19','Marcia','Feil','19'),
('20','Rosalinda','O\'Connell','20'),
('21','Edythe','Homenick','21'),
('22','Annalise','Collins','22'),
('23','Adrianna','Bosco','23'),
('24','Tiffany','Block','24'),
('25','Marlee','Batz','25'),
('26','Elvera','Kessler','26'),
('27','Gilda','Wisoky','27'),
('28','Nyasia','Greenholt','28'),
('29','Annamarie','Hessel','29'),
('30','Anissa','Cummings','30'),
('31','Cassie','Lang','31'),
('32','Lucile','Bashirian','32'),
('33','Rubie','Wiza','33'),
('34','Virginia','Mohr','34'),
('35','Vernice','Morissette','35'),
('36','Julianne','Pollich','36'),
('37','Nicolette','Wolff','37'),
('38','Rita','Beier','38'),
('39','Micaela','Von','39'),
('40','Jenifer','Pagac','40'),
('41','Lavina','Schaden','41'),
('42','Josie','Schuppe','42'),
('43','Rubie','McCullough','43'),
('44','Laisha','Schoen','44'),
('45','Alexane','Spinka','45'),
('46','Casandra','Reichel','46'),
('47','Bernice','Schimmel','47'),
('48','Anika','Hudson','48'),
('49','Hope','Zieme','49'),
('50','Winona','Doyle','50'),
('51','Chelsea','Metz','51'),
('52','Lucinda','Hickle','52'),
('53','Wilhelmine','Wolf','53'),
('54','Susana','Orn','54'),
('55','Tiana','Hoeger','55'),
('56','Rhianna','Rau','56'),
('57','Gertrude','Olson','57'),
('58','Cordia','McGlynn','58'),
('59','Tierra','Pouros','59'),
('60','Arlie','Gottlieb','60'),
('61','Melisa','Hauck','61'),
('62','Lois','Mitchell','62'),
('63','Amya','Gorczany','63'),
('64','Haylee','Kutch','64'),
('65','Blanche','Jenkins','65'),
('66','Treva','Wunsch','66'),
('67','Alisha','Yost','67'),
('68','Lacy','Kulas','68'),
('69','Cecelia','Wyman','69'),
('70','Megane','Gleichner','70'),
('71','Tierra','Volkman','71'),
('72','Ida','Hegmann','72'),
('73','Daphnee','Lindgren','73'),
('74','Kenya','Johns','74'),
('75','Flavie','Volkman','75'),
('76','Evangeline','Goodwin','76'),
('77','Susanna','Maggio','77'),
('78','Kelsie','Pacocha','78'),
('79','Callie','Glover','79'),
('80','Genevieve','Batz','80'),
('81','Marlen','Bogisich','81'),
('82','Lea','Franecki','82'),
('83','Darlene','Hane','83'),
('84','Anna','Mertz','84'),
('85','Liliane','Heidenreich','85'),
('86','Alize','Harvey','86'),
('87','Kenya','Keebler','87'),
('88','Eloisa','Casper','88'),
('89','Jewel','VonRueden','89'),
('90','Birdie','Reilly','90'),
('91','Florence','Powlowski','91'),
('92','Whitney','Kuhic','92'),
('93','Jodie','Lynch','93'),
('94','Elna','Harber','94'),
('95','Nettie','McLaughlin','95'),
('96','Alisa','Hayes','96'),
('97','Aryanna','Wuckert','97'),
('98','Cathryn','Beahan','98'),
('99','Eveline','Goyette','99'),
('100','Hillary','Carter','100'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

