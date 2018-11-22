-- Generation time: Wed, 21 Nov 2018 05:20:11 +0000
-- Host: mysql.hostinger.ro
-- DB name: u574849695_23
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `VENDOR` VALUES ('1','Sporer, Heller and R','NewMexico'),
('2','Haley-Toy','NewMexico'),
('3','O\'Connell-Schamberge','Idaho'),
('4','D\'Amore-Huel','Arizona'),
('5','Howell-Ebert','NewYork'),
('6','D\'Amore-Emmerich','NewJersey'),
('7','Von, Rogahn and Trem','RhodeIsland'),
('8','Jast, Berge and O\'Co','SouthCarolina'),
('9','Jerde Ltd','NorthCarolina'),
('10','Carter PLC','California'),
('11','White LLC','NorthCarolina'),
('12','Buckridge, Halvorson','Nebraska'),
('13','Hammes Group','Virginia'),
('14','Tremblay and Sons','Oregon'),
('15','Wolff, Hills and Sch','Virginia'),
('16','Effertz-Schaden','Pennsylvania'),
('17','Kautzer, Von and Ham','Maine'),
('18','Leuschke, Kassulke a','Maryland'),
('19','Upton, Gulgowski and','Wisconsin'),
('20','Langosh Inc','Pennsylvania'),
('21','Smitham-Schmeler','Ohio'),
('22','Ullrich and Sons','Iowa'),
('23','O\'Kon-Littel','District of Columbia'),
('24','Abbott-Abbott','Tennessee'),
('25','Jakubowski, Sanford ','Louisiana'),
('26','Schultz-Ortiz','Delaware'),
('27','Hane, Kovacek and Th','Kentucky'),
('28','Auer, Cummings and L','Mississippi'),
('29','Douglas-Kirlin','Connecticut'),
('30','Krajcik Inc','Kansas'),
('31','Ortiz-Stiedemann','WestVirginia'),
('32','Bogan-Hauck','Mississippi'),
('33','Balistreri-Haag','Maine'),
('34','Murphy-Harber','Wyoming'),
('35','Tremblay, Swaniawski','Oklahoma'),
('36','Padberg Ltd','Oklahoma'),
('37','Swaniawski-Flatley','Maine'),
('38','Cronin-Hane','Louisiana'),
('39','Hickle PLC','NewHampshire'),
('40','White and Sons','Kentucky'),
('41','Keebler, Will and An','Texas'),
('42','Schmeler-Dach','NewMexico'),
('43','Thiel-Ziemann','Colorado'),
('44','Zemlak, Greenholt an','California'),
('45','Howell PLC','Idaho'),
('46','Boyer, Gutkowski and','Texas'),
('47','Treutel and Sons','Utah'),
('48','King, Hamill and Wun','Oklahoma'),
('49','Beahan-Collier','Arizona'),
('50','Murray Ltd','NewMexico'),
('51','Volkman LLC','Florida'),
('52','Homenick Ltd','NorthCarolina'),
('53','West, Marquardt and ','Vermont'),
('54','Kshlerin and Sons','Florida'),
('55','West LLC','NewYork'),
('56','Stokes-Reinger','Hawaii'),
('57','Upton-Oberbrunner','Arizona'),
('58','Schulist PLC','Idaho'),
('59','Rice, Altenwerth and','Washington'),
('60','Kertzmann, Klocko an','Florida'),
('61','Hills Ltd','Louisiana'),
('62','Hudson, Langworth an','NewYork'),
('63','Schumm-Windler','Illinois'),
('64','Sawayn, Larkin and C','Illinois'),
('65','Langosh, Kuvalis and','WestVirginia'),
('66','Green and Sons','SouthDakota'),
('67','Zboncak, O\'Conner an','Vermont'),
('68','Jacobi, Senger and L','Arkansas'),
('69','Nader-Koepp','Pennsylvania'),
('70','Hansen-Keeling','NorthDakota'),
('71','Lemke-Halvorson','RhodeIsland'),
('72','Kris-Pfannerstill','Delaware'),
('73','Metz-Wiegand','Connecticut'),
('74','Bradtke-Schimmel','NewMexico'),
('75','Ondricka Inc','NorthDakota'),
('76','Beer-DuBuque','Nevada'),
('77','Stracke-Renner','Wisconsin'),
('78','Schaefer, Nitzsche a','Kentucky'),
('79','Emmerich Ltd','Missouri'),
('80','Thompson, Stroman an','Alabama'),
('81','Ankunding-Lindgren','Colorado'),
('82','Goyette, Kling and S','Montana'),
('83','Haag-Bradtke','District of Columbia'),
('84','Rohan Group','Wyoming'),
('85','D\'Amore, Schoen and ','Montana'),
('86','Kulas, Jones and Lin','NorthCarolina'),
('87','Johnston Inc','Montana'),
('88','Russel Inc','Connecticut'),
('89','Leuschke-Block','SouthCarolina'),
('90','Luettgen and Sons','Michigan'),
('91','Metz-Hodkiewicz','Idaho'),
('92','Smitham LLC','Maryland'),
('93','Larkin and Sons','WestVirginia'),
('94','Wyman PLC','Pennsylvania'),
('95','Olson PLC','Alaska'),
('96','Bayer-Pfannerstill','Colorado'),
('97','Veum, Wuckert and Be','Colorado'),
('98','Cronin-Heaney','Alabama'),
('99','Kutch Ltd','SouthDakota'),
('100','Flatley LLC','Ohio'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

