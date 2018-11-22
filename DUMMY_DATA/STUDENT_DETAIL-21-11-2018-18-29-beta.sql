-- Generation time: Wed, 21 Nov 2018 18:29:57 +0000
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

DROP TABLE IF EXISTS `STUDENT_DETAIL`;
CREATE TABLE `STUDENT_DETAIL` (
  `sd_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sd_address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sd_city` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sd_state` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `phone_number` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `STUDENT_DETAIL` VALUES ('1','Breana','Bradtke','451 Juliana Inlet','Starkbury','Co','frieda.bogan@example','2006-09-03','730-422-91'),
('2','Eulah','Ryan','6965 Lemke Place','Clintonmouth','We','demarco97@example.co','2015-03-13','+28(9)3821'),
('3','Makenzie','Lakin','939 Vince Station Apt. 146','Brakusshire','Al','nsipes@example.org','2012-03-12','076-314-48'),
('4','Lucie','Thompson','401 Kiehn Stream Suite 064','Alisonfurt','Il','christiansen.isaias@','2007-11-27','(977)564-8'),
('5','Kali','Stoltenberg','79027 Kayley Stravenue Apt. 226','Jaketon','Ar','earlene40@example.co','2017-12-24','180.197.43'),
('6','Joannie','Beatty','3255 Lemke Lane Suite 609','Heaneyborough','So','spinka.jacquelyn@exa','1987-05-26','(955)462-6'),
('7','Alejandra','Ritchie','07347 Chanel River','Durganside','Oh','umarvin@example.net','1983-03-17','0544910798'),
('8','Clara','Tillman','18448 Cayla Crescent Apt. 505','West Velvaland','Ha','ward.lavern@example.','1979-09-29','632-029-65'),
('9','Juliet','King','022 Rogers Bridge Suite 127','Bayerstad','Pe','zbashirian@example.c','1990-09-05','0226369973'),
('10','Stacy','Dicki','1402 Leonardo Spring','Shawnaton','Wy','carmela.hayes@exampl','1975-11-02','1-185-590-'),
('11','Amya','Kuhlman','818 Stanton Roads','East Marcellus','Mi','hbradtke@example.net','2003-06-23','1-154-561-'),
('12','Tianna','Medhurst','705 Makenna Greens','Gleasonmouth','Ne','barton.casandra@exam','1996-05-07','446.280.77'),
('13','Willow','Veum','28227 Sidney Route Apt. 402','West Samaramouth','Mo','jena51@example.net','2012-09-06','+13(2)3523'),
('14','Alena','Hegmann','61900 Katrina Via','Ricestad','Di','doug96@example.com','1972-06-14','1-047-277-'),
('15','Clarissa','Rodriguez','836 Schmitt Springs Apt. 965','Rubieview','Wy','ykling@example.com','2015-01-24','606-882-41'),
('16','Macie','Howell','168 Gulgowski Via Apt. 605','Dickinsonfort','Ut','vanessa.steuber@exam','1971-04-30','0888882724'),
('17','Kimberly','Bode','475 Stehr Roads','Funkport','Wi','kenna.rau@example.ne','2007-12-05','335-484-56'),
('18','Kathryne','Armstrong','449 Leuschke Mill Suite 307','West Herbertfurt','Id','jules97@example.org','1977-03-19','421-407-33'),
('19','Nola','Spencer','9880 Kuphal Corner','Torphystad','Ha','dickens.lyda@example','1989-07-24','475.276.18'),
('20','Aliza','Corkery','283 Jarrett Station Apt. 617','Rosaburgh','Id','qsimonis@example.org','1998-03-10','0819783909'),
('21','Amelia','Emmerich','6411 Cassie Rapids','Blandaside','No','stanton.carissa@exam','1998-07-23','275.094.31'),
('22','Corene','Crist','8383 Koss Shoal','Ilenetown','Id','clarabelle42@example','1976-09-03','979-469-57'),
('23','Cassidy','Hessel','7899 Cordell Club Apt. 941','Zariaburgh','In','ghilpert@example.com','1973-04-21','360.833.88'),
('24','Stella','Ritchie','53385 Melody Drive Apt. 918','Carolanneberg','Ok','rodrigo91@example.or','1976-10-09','448.407.85'),
('25','Karlie','Lind','006 Heller Cliffs Suite 254','West Ashtynmouth','Io','kertzmann.jose@examp','1990-06-25','550.402.43'),
('26','Mozelle','Sipes','57469 Al Junctions','Port Laurine','Ar','bkuhlman@example.org','1986-09-29','294.293.85'),
('27','Jazlyn','Kuvalis','43642 Farrell Estate','Kiehnville','We','uberge@example.org','2015-10-16','(799)954-0'),
('28','Ena','Feest','29116 Jayda Village Suite 285','South Jacynthestad','Ca','pfunk@example.net','1981-02-28','+05(3)3585'),
('29','Vicky','Schaden','82459 Rudy Burgs','Vanborough','Ne','ledner.garry@example','1993-05-14','(133)883-6'),
('30','Alice','Marvin','900 Tavares Inlet Apt. 892','Jacobsstad','Wi','kub.jayson@example.o','1989-09-22','0277960840'),
('31','Leanna','Balistreri','89746 DuBuque Ferry Suite 002','Cristburgh','Il','suzanne46@example.ne','1981-09-21','+57(4)2636'),
('32','Trisha','Bauch','127 Mosciski Crossing Apt. 610','Mrazbury','Al','jroob@example.net','1983-03-14','310-438-53'),
('33','Alexandrea','Bechtelar','25721 Swaniawski Fields','Rodriguezborough','Ar','brown.lina@example.n','1972-09-20','245-101-64'),
('34','Zora','Blick','74746 Harrison Mountains','Keelingtown','Te','maggie.johns@example','1981-04-18','1-306-798-'),
('35','Flavie','Torp','262 Graciela Landing','West Jocelyn','Io','ilangosh@example.org','1987-06-06','(259)039-4'),
('36','Cheyenne','Crona','6144 Joesph Islands','Monastad','Te','walter.amir@example.','1984-07-26','(524)383-1'),
('37','Creola','Skiles','15903 Mills Ford','Lake Ardenton','Fl','jkozey@example.org','2000-06-10','+73(7)6141'),
('38','Joanne','Carroll','707 Jenkins Shores Suite 725','Havenport','Ma','o\'keefe.nico@example','2005-05-29','381-986-56'),
('39','Shania','Reynolds','8416 Cecilia Summit','Lake Zachariahport','Ne','jbraun@example.net','2008-03-02','088.907.20'),
('40','Fleta','O\'Conner','2800 Renner Mission','Jastburgh','Ca','brandon.ankunding@ex','1985-12-31','931.478.44'),
('41','Willa','Rau','13586 Denesik Turnpike Suite 554','Adriennestad','Ma','lexus.rath@example.o','1989-03-16','(727)306-0'),
('42','Edyth','Daniel','4159 Isabelle Circle Suite 976','O\'Connerfurt','Ka','daugherty.jessica@ex','1982-03-12','1-977-680-'),
('43','Marguerite','Ziemann','1844 Ankunding Stravenue','Olsonstad','Mi','jwisozk@example.com','2011-08-30','1-962-818-'),
('44','Alanis','Wolf','9213 Katlynn Overpass Apt. 470','Rodriguezchester','Ne','carmella01@example.n','1979-07-18','+40(7)1215'),
('45','Isabella','Oberbrunner','310 Rolfson Brooks Apt. 277','West Nick','Di','rae.marks@example.ne','2006-10-31','1-778-302-'),
('46','Elnora','Eichmann','2077 Glover Divide','South Maudemouth','Ne','casimir.keebler@exam','1998-06-02','786-252-58'),
('47','Ericka','Beatty','03301 Mitchel Wall','Wendellchester','Ut','mward@example.org','2008-10-25','(987)961-3'),
('48','Clare','Reynolds','807 Will Passage Apt. 290','East Alisa','Ke','madisen.hagenes@exam','1988-10-01','(567)061-2'),
('49','Francisca','Hoppe','437 Penelope Manors','Bogisichburgh','Te','noble45@example.net','1985-06-12','178.736.46'),
('50','Kiarra','Stamm','0092 Gorczany Trail Suite 343','Alecland','Te','linda98@example.net','1997-04-09','635-898-08'),
('51','Lucile','Weber','17204 Antonietta Ramp Suite 993','Eileenstad','Io','michael46@example.co','2011-03-05','797.466.41'),
('52','Amira','Lockman','738 Kohler Field Suite 546','Leraview','Ve','schumm.trace@example','2013-07-22','759-059-48'),
('53','Gilda','Wehner','580 Wiza Ports Apt. 226','East Howard','Ha','reynold.schinner@exa','1989-07-07','0473848509'),
('54','Delpha','Emard','747 Lueilwitz Island','East Bobbiehaven','In','heber09@example.com','1995-12-20','790-435-49'),
('55','Cathryn','Nader','545 Corkery Squares Apt. 690','Lake Ruby','Ne','stiedemann.veronica@','2018-04-16','740-509-52'),
('56','Amely','Feest','0909 Wiza Stream','Douglasport','Oh','margarete.hane@examp','1987-04-28','080.018.82'),
('57','Carmela','Brakus','395 Mraz Garden','Port Emmie','Ne','irma.abernathy@examp','1973-06-14','1-610-953-'),
('58','Brionna','Schaden','568 Larkin Brook','Hassanburgh','Pe','jaskolski.allan@exam','1989-02-10','(962)474-8'),
('59','Kaylie','Fahey','63180 Etha Isle Suite 523','Nettieland','Ne','madyson.krajcik@exam','1991-06-27','(076)999-5'),
('60','Eva','Gleichner','30320 Dessie Station','Kirlinmouth','Id','madisyn.dietrich@exa','1988-07-09','1-795-749-'),
('61','Frederique','Kozey','01996 Margarett Path','East Baylee','Te','dspencer@example.net','2016-11-12','0247135999'),
('62','Joana','Marvin','7258 Schinner Station','Sipesburgh','Ne','rpredovic@example.ne','1976-07-09','868.488.00'),
('63','Ardith','Medhurst','08432 Dallin Roads Apt. 837','East Andre','Ge','fstrosin@example.com','1991-10-25','136.242.67'),
('64','Lynn','Miller','5987 Julie Wells','West Donavonshire','Ke','lubowitz.katelynn@ex','1991-10-12','330.628.09'),
('65','Ethyl','Sporer','788 Kovacek Mission Suite 514','Lake Willy','Co','samara.wintheiser@ex','1979-11-12','(480)834-7'),
('66','Queen','Kulas','564 Clinton Bridge','Jazmynport','Te','norberto.bednar@exam','2009-12-22','(513)467-2'),
('67','Ora','Hayes','3178 Marcella Common','Mayertfort','Wa','skoss@example.org','1994-05-30','1-399-161-'),
('68','Shyann','Emard','19718 Kohler Bypass','Andersonburgh','Mi','corene.krajcik@examp','1987-09-20','843.964.42'),
('69','Elouise','Lehner','553 Amelia Mill','West Ottis','Oh','gregorio.dach@exampl','2003-02-14','130-163-07'),
('70','Oceane','Abshire','5969 Schamberger Stravenue','Adonisview','No','ubeer@example.org','1981-09-21','577-965-78'),
('71','Thelma','Batz','292 Rath Burg Apt. 291','Auermouth','Ne','kaycee20@example.org','2009-06-23','147-157-44'),
('72','Samantha','Littel','62054 Mayert Point','Kelsieshire','Vi','bradtke.danielle@exa','2004-04-02','(598)090-1'),
('73','Delores','Pagac','3771 Sipes Spur','East Glenna','Vi','clark.ritchie@exampl','1972-11-21','0438037491'),
('74','Chaya','Hermann','7759 Ritchie Trail Suite 497','West Antoniettabury','Ne','pbuckridge@example.o','2016-06-26','1-193-756-'),
('75','Fae','Volkman','040 Klocko Path','West Grace','Ne','paolo.wiegand@exampl','2011-08-09','1-536-763-'),
('76','Zelma','Grant','979 Louvenia Center Suite 767','Breitenbergbury','Mi','rozella.klocko@examp','1976-09-04','(183)609-5'),
('77','Jordane','Kuphal','8867 Rowe Wall','Lake Shanaberg','Ar','jacobson.garnet@exam','1976-07-19','787.072.96'),
('78','Rafaela','Schroeder','6536 Daniel Ranch','North Stanleyport','Ve','sporer.adriel@exampl','2013-07-06','(333)690-3'),
('79','Edyth','Shields','93025 Corwin Lodge Suite 935','Port Jodyside','Ne','xbernier@example.org','1998-05-27','+13(7)3818'),
('80','Elsa','Bins','0370 Deanna Shores','Janaeport','Il','theodore.strosin@exa','1990-12-26','102.265.07'),
('81','Ebba','Rodriguez','561 Asia Dale','Tessberg','Mi','austin.schultz@examp','1987-04-16','072.652.33'),
('82','Lillian','Bergstrom','4920 Viola Inlet','Lake Antone','Id','pietro.dubuque@examp','2001-11-16','0432093456'),
('83','Dena','Steuber','5498 Wanda Points','West Clementineview','Ne','erwin.reichel@exampl','1987-03-24','1-793-595-'),
('84','Francisca','Roberts','33319 Bettye Crescent','East Vincetown','Ok','lauretta.weimann@exa','2014-03-31','0552051118'),
('85','Elfrieda','Hamill','4853 Faye Cliffs Suite 068','Port Carliburgh','Ka','gmosciski@example.ne','2007-12-11','1-192-595-'),
('86','Angela','Carroll','389 Heather Orchard','Russview','Ca','orland75@example.net','1973-01-03','(402)013-9'),
('87','Laurie','Homenick','43896 Lura Springs Suite 565','Maggiostad','Il','waters.emely@example','1971-05-13','(970)328-6'),
('88','Imogene','Boehm','4772 Muller Camp Suite 606','West Westley','Ma','ransom.cole@example.','1992-09-19','1-075-923-'),
('89','Zoila','Hane','4367 Heathcote Roads Apt. 972','Gailmouth','Fl','lbrakus@example.org','2004-08-08','(484)413-9'),
('90','Katlynn','Rice','77699 Monahan Loop Apt. 584','Lake Shania','Ma','morissette.eusebio@e','2006-04-23','0080655967'),
('91','Elinor','Cole','78377 Hane Locks','South Alexandrinesid','Te','mohammed.boyer@examp','1980-06-28','(766)372-2'),
('92','Martine','Purdy','394 Kerluke Valley','Savionburgh','Ne','zaria60@example.org','1990-06-12','(475)177-0'),
('93','Rossie','Thompson','601 Bosco Brook','East Rafaela','So','erich.padberg@exampl','1989-05-19','1-909-717-'),
('94','Geraldine','Bartoletti','342 Bartoletti Ports','Port Vallie','Wa','rmcglynn@example.com','1972-10-02','0911705530'),
('95','Ara','Hackett','97155 Streich Isle Apt. 258','Janetmouth','Ne','ylynch@example.com','1973-12-01','(424)096-0'),
('96','Reanna','Dickens','875 Doug Forge Apt. 980','Audraview','Te','ruecker.horacio@exam','2017-08-28','104-753-03'),
('97','Abbie','McCullough','922 Derrick Wall Suite 380','South Eldora','Id','kdaniel@example.com','1994-08-13','1-178-647-'),
('98','Leora','Mosciski','0921 Abdiel Land Apt. 153','Maggiomouth','Mo','mills.shawn@example.','1976-06-23','208.492.25'),
('99','Jaunita','Adams','64179 Karley Street','Bernieceland','No','breitenberg.mossie@e','1972-10-17','1-768-227-'),
('100','Magali','Grimes','1661 Patricia Street Apt. 837','Muellerborough','In','gordon91@example.org','2000-08-02','(880)574-3'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

