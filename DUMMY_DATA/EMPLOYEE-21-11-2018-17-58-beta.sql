-- Generation time: Wed, 21 Nov 2018 17:58:27 +0000
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

DROP TABLE IF EXISTS `EMPLOYEE`;
CREATE TABLE `EMPLOYEE` (
  `e_id` int(11) NOT NULL,
  `fname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `e_email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e_address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e_city` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e_state` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssn` char(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'XXX-XX-XXXX',
  `birth_date` date NOT NULL,
  `job_title` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `d_num` int(11) NOT NULL,
  `mgmt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`e_id`),
  KEY `FK_EMPLOYEE_MANAGEMENT` (`mgmt_id`),
  CONSTRAINT `FK_EMPLOYEE_MANAGEMENT` FOREIGN KEY (`mgmt_id`) REFERENCES `MANAGEMENT` (`mgmt_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `EMPLOYEE` VALUES ('230','Orion','Thiel','hal32@example.org','Suite 784','East Brycenmouth','Ne','+80(6)259080','604245408','1996-02-13','Omnis sint ut qui consequ','7','4'),
('256','Mina','Johnston','mayert.frederick@example.net','Apt. 934','Nickberg','No','998.490.1750','446692307','2015-07-28','At eius et distinctio.','6','1'),
('294','Arely','Kozey','ftreutel@example.org','Suite 395','Uptonmouth','Ne','017.987.7301','210816132','2000-12-31','Qui ipsa qui explicabo se','5','2'),
('360','Russell','Swaniawski','lonnie41@example.net','Apt. 944','Rachaelhaven','Pe','1-867-100-62','811785521','1996-10-13','Minus beatae ab atque vel','7','1'),
('455','Delmer','Rosenbaum','malcolm52@example.com','Suite 211','South Jazminfort','Io','(857)559-903','489384858','1988-02-24','Non unde dolores quo pari','8','3'),
('500','Hermann','Carroll','clementina98@example.org','Apt. 585','Wendyville','Co','701.433.0865','498451486','1971-06-20','Placeat saepe ipsum aut q','6','4'),
('528','Marilou','Morissette','stehr.frederic@example.org','Apt. 882','Rubiefort','We','(469)297-834','578882346','1981-01-31','Incidunt distinctio et ad','9','2'),
('562','Nikolas','Haley','yzulauf@example.org','Suite 507','Port Lilianfurt','Ne','00631625823','647959040','1972-11-10','Et vero autem rerum ut sa','6','3'),
('575','Jaylan','Dibbert','joshuah.abernathy@example.org','Apt. 231','Scottyville','Ut','415.021.8459','809502753','1985-06-05','Quae rerum non laborum la','5','2'),
('781','Tyreek','Hodkiewicz','grimes.tanya@example.net','Apt. 333','East Mariamfort','Wi','1-013-841-07','962584949','2017-02-11','Officia sed libero repell','8','3'),
('801','Ken','Kunde','sauer.clifford@example.net','Apt. 930','Lake Drewbury','Mi','(229)421-066','433800877','2005-07-08','Omnis in ipsa et aut sed ','9','5'),
('806','Kaia','Reilly','halie.sawayn@example.org','Apt. 830','New Jerrell','Id','110.501.2099','417945394','2013-02-14','Ipsam voluptatem cupidita','2','4'),
('809','Else','O\'Keefe','rcronin@example.net','Apt. 006','Dariusville','Mi','246.203.5587','427337852','2008-12-07','Eum atque voluptatibus ni','4','1'),
('813','Otilia','Yundt','erwin.adams@example.net','Suite 118','West Bartholomechest','So','773.519.3742','606965573','1976-12-06','Inventore culpa et occaec','7','5'),
('822','Reinhold','Johns','ycorkery@example.org','Suite 357','Reyland','Ka','432.720.8546','386658837','1994-10-03','Eum et ut velit nihil eum','5','3'),
('876','Darwin','McDermott','stracke.leonor@example.net','Suite 435','North Lonzoshire','Ca','(879)458-842','525739734','1987-04-01','Laudantium incidunt tempo','9','5'),
('904','Darrel','Hudson','leslie.buckridge@example.com','Apt. 771','Mattshire','Co','(532)343-372','418541800','1993-07-16','Consequatur et reiciendis','5','2'),
('947','Zakary','Bayer','sharon29@example.net','Apt. 515','Duncanstad','Ka','196.814.1811','781487512','2009-06-21','Quia qui sit dignissimos ','3','1'),
('957','Elliott','Feil','wayne.mayert@example.com','Apt. 045','New Dorcas','Ar','(997)258-619','710036450','1983-01-06','Non sunt iste eius dolori','9','4'),
('965','Natalie','Borer','murray.bobby@example.net','Suite 452','Ortizport','Ha','258-875-0501','832956163','2017-06-02','Qui et expedita vitae qui','6','5'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

