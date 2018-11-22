-- Generation time: Wed, 21 Nov 2018 05:12:57 +0000
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

INSERT INTO `EMPLOYEE` VALUES ('107','Elmira','Effertz','xschmitt@marquardt.com','schroeder.lacy@gmail.com','New Emmittfort','Ar','711.964.7032','467384441','2009-06-10','Magnam architecto exercit','1','2'),
('120','Reuben','Walsh','jacobs.malika@gmail.com','md\'amore@gottlieb.com','West Hayleyview','We','(795)632-702','447030321','1972-01-29','Culpa laborum quibusdam q','4','3'),
('146','Johnnie','Murray','carroll.kenneth@wilderman.com','patsy34@starkfahey.com','West Valentina','Mi','897-039-6280','450756199','1993-05-21','Corrupti sint aliquam et ','4','4'),
('154','Albertha','Johnson','mraz.elnora@haagkovacek.org','oda.denesik@hotmail.com','Rutherfordville','Mi','717.625.3813','254255858','2007-02-18','Et veritatis distinctio s','2','5'),
('205','Alexanne','Hirthe','german.grady@yahoo.com','billy.boyle@bayer.info','East Florianland','Ut','1-848-143-49','626866301','1993-04-08','Accusantium voluptatem re','2','5'),
('302','Emmitt','Gislason','ktorp@hotmail.com','lueilwitz.bennie@hotmail.com','West Sidneyburgh','Wi','675.312.4532','411106591','1973-07-16','Sapiente est aut minus et','3','1'),
('307','Jamir','Kemmer','ruthie09@spencer.info','jsipes@hotmail.com','Nathenfort','No','1-012-332-48','369655834','1975-04-24','Rem totam maxime dignissi','3','1'),
('313','Colin','Towne','rafael.volkman@binsbergstrom.info','nader.eveline@armstrong.biz','New Kolbyberg','Fl','(022)220-699','309092627','2008-08-20','Ipsa impedit quas impedit','3','3'),
('350','Krystal','Koepp','rsteuber@hotmail.com','nauer@volkmantreutel.org','Gorczanybury','Mi','234.351.7493','155442107','2011-01-22','Vitae consectetur fugit n','4','2'),
('565','Ephraim','Wolf','maxine30@reilly.com','ydouglas@gmail.com','Schambergerfort','Mi','1-645-164-38','279400944','2014-12-23','Veritatis maxime similiqu','3','4'),
('572','Sarina','Considine','kerluke.devyn@ricestamm.com','glen04@grimes.com','Lake Lorenz','Ar','035.054.8191','687024583','1987-03-28','Enim consequatur quis odi','4','5'),
('578','Rachael','Gutkowski','schaefer.alysha@yahoo.com','parker.glover@davisjohnston.org','Greenholtburgh','In','908.922.0544','364084336','2007-05-10','Aspernatur modi dolorum v','4','4'),
('660','Sid','Feeney','julianne24@yahoo.com','thompson.charley@mannhackett.com','New Peteland','Ne','(566)897-983','970519466','1971-12-25','Qui impedit magnam quia e','2','5'),
('705','Janice','Douglas','ankunding.hanna@hotmail.com','uhartmann@boscobaumbach.com','East Karenland','Ne','479.102.3310','340055378','2014-01-06','Expedita tempore rerum ea','4','1'),
('797','Aaliyah','O\'Connell','iosinski@gmail.com','mjerde@hotmail.com','Strosinchester','Al','033-031-0806','721675873','1998-04-16','Omnis rem aut perspiciati','5','3'),
('887','Lorenza','Thiel','anjali.dibbert@gmail.com','ansley.schuppe@pfeffer.com','Susanaville','Pe','(298)955-614','710363742','1979-05-13','Beatae veritatis nostrum ','2','1'),
('898','Francisca','Runte','fwalter@hotmail.com','xstokes@hotmail.com','Rasheedfurt','In','973.252.3284','336861495','1971-08-15','Excepturi dicta et possim','1','3'),
('920','Darren','Kuvalis','lonie.o\'reilly@yahoo.com','chanelle.larkin@yahoo.com','Karsonstad','Ne','+38(9)387987','798784539','2002-08-17','Magnam consequatur cumque','2','2'),
('937','Sylvan','Romaguera','fahey.willy@oharacartwright.net','paige60@rohan.info','New Aronberg','Id','451-207-0023','452259988','1973-01-19','Qui tenetur omnis volupta','1','2'),
('956','Lysanne','Orn','mallie48@hotmail.com','jimmy62@thiel.net','South Donald','Ve','1-823-832-96','229437328','1976-07-10','Et ea corporis ut volupta','1','4'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

