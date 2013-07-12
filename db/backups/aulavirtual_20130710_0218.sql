-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.69-0ubuntu0.11.10.1


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema formanube
--
--
-- Definition of table `formanube`.`adresses`
--

DROP TABLE IF EXISTS `formanube`.`adresses`;
CREATE TABLE  `formanube`.`adresses` (
  `id` int(11) NOT NULL,
  `stree` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `observation` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`adresses`
--

/*!40000 ALTER TABLE `adresses` DISABLE KEYS */;
LOCK TABLES `adresses` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `adresses` ENABLE KEYS */;


--
-- Definition of table `formanube`.`chapters`
--

DROP TABLE IF EXISTS `formanube`.`chapters`;
CREATE TABLE  `formanube`.`chapters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `order` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sections_course_id` (`course_id`),
  CONSTRAINT `sections_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`chapters`
--

/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
LOCK TABLES `chapters` WRITE;
INSERT INTO `formanube`.`chapters` VALUES  (1,3,'Introduccion',NULL,0,NULL,'2013-07-08 21:57:49','2013-07-10 00:24:02'),
 (2,3,'Instalación',NULL,2,NULL,'2013-07-08 21:59:22','2013-07-10 00:24:02'),
 (10,3,'Variables',NULL,1,NULL,'2013-07-09 00:38:08','2013-07-10 00:24:02'),
 (11,3,'Condicionales',NULL,7,NULL,'2013-07-09 00:46:57','2013-07-10 00:24:03'),
 (21,3,'Bucles',NULL,3,NULL,'2013-07-09 03:04:32','2013-07-10 00:24:02'),
 (22,3,'Archivos',NULL,5,NULL,'2013-07-09 03:07:58','2013-07-10 00:24:02'),
 (25,3,'Clases',NULL,6,NULL,'2013-07-09 07:14:15','2013-07-10 00:24:03'),
 (26,3,'Objetos',NULL,8,NULL,'2013-07-09 07:14:22','2013-07-10 00:24:03'),
 (27,3,'Errores',NULL,4,NULL,'2013-07-09 07:15:04','2013-07-10 00:24:02'),
 (28,6,'Introduccion',NULL,1,NULL,'2013-07-10 03:53:27',NULL),
 (29,6,'Historia de Java',NULL,2,NULL,'2013-07-10 03:53:38',NULL),
 (30,6,'Requisitos e Instalación',NULL,3,NULL,'2013-07-10 03:54:00',NULL),
 (31,6,'Comenzando',NULL,4,NULL,'2013-07-10 03:54:10',NULL),
 (32,6,'Variables',NULL,5,NULL,'2013-07-10 03:54:20',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;


--
-- Definition of table `formanube`.`content_audios`
--

DROP TABLE IF EXISTS `formanube`.`content_audios`;
CREATE TABLE  `formanube`.`content_audios` (
  `id` int(11) NOT NULL,
  `link` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_audios_lesson_id` (`lesson_id`),
  CONSTRAINT `content_audios_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`content_audios`
--

/*!40000 ALTER TABLE `content_audios` DISABLE KEYS */;
LOCK TABLES `content_audios` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_audios` ENABLE KEYS */;


--
-- Definition of table `formanube`.`content_documents`
--

DROP TABLE IF EXISTS `formanube`.`content_documents`;
CREATE TABLE  `formanube`.`content_documents` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `document` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lcontent_documents_lesson_id` (`lesson_id`),
  CONSTRAINT `lcontent_documents_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`content_documents`
--

/*!40000 ALTER TABLE `content_documents` DISABLE KEYS */;
LOCK TABLES `content_documents` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_documents` ENABLE KEYS */;


--
-- Definition of table `formanube`.`content_images`
--

DROP TABLE IF EXISTS `formanube`.`content_images`;
CREATE TABLE  `formanube`.`content_images` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `image` blob NOT NULL,
  `link` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_images_lesson_id` (`lesson_id`),
  CONSTRAINT `content_images_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`content_images`
--

/*!40000 ALTER TABLE `content_images` DISABLE KEYS */;
LOCK TABLES `content_images` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_images` ENABLE KEYS */;


--
-- Definition of table `formanube`.`content_presentations`
--

DROP TABLE IF EXISTS `formanube`.`content_presentations`;
CREATE TABLE  `formanube`.`content_presentations` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `prestentation` text NOT NULL,
  `link` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_presentations_lesson_id` (`lesson_id`),
  CONSTRAINT `content_presentations_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`content_presentations`
--

/*!40000 ALTER TABLE `content_presentations` DISABLE KEYS */;
LOCK TABLES `content_presentations` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_presentations` ENABLE KEYS */;


--
-- Definition of table `formanube`.`content_texts`
--

DROP TABLE IF EXISTS `formanube`.`content_texts`;
CREATE TABLE  `formanube`.`content_texts` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_texts_lesson_id` (`lesson_id`),
  CONSTRAINT `content_texts_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`content_texts`
--

/*!40000 ALTER TABLE `content_texts` DISABLE KEYS */;
LOCK TABLES `content_texts` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_texts` ENABLE KEYS */;


--
-- Definition of table `formanube`.`content_videos`
--

DROP TABLE IF EXISTS `formanube`.`content_videos`;
CREATE TABLE  `formanube`.`content_videos` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `link` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_videos_lesson_id` (`lesson_id`),
  CONSTRAINT `content_videos_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`content_videos`
--

/*!40000 ALTER TABLE `content_videos` DISABLE KEYS */;
LOCK TABLES `content_videos` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_videos` ENABLE KEYS */;


--
-- Definition of table `formanube`.`course_audiences`
--

DROP TABLE IF EXISTS `formanube`.`course_audiences`;
CREATE TABLE  `formanube`.`course_audiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `course_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_audiences_course_id` (`course_id`),
  CONSTRAINT `course_audiences_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`course_audiences`
--

/*!40000 ALTER TABLE `course_audiences` DISABLE KEYS */;
LOCK TABLES `course_audiences` WRITE;
INSERT INTO `formanube`.`course_audiences` VALUES  (36,'audiencia 1',3,'2013-07-08 19:26:43',NULL),
 (37,'audiencia 2',3,'2013-07-08 19:26:43',NULL),
 (38,'audiencia 3',3,'2013-07-08 19:26:43',NULL),
 (39,'Personas apasionadas por la programacin',6,'2013-07-10 03:51:49',NULL),
 (40,'Jovenes pasionales',6,'2013-07-10 03:51:49',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_audiences` ENABLE KEYS */;


--
-- Definition of table `formanube`.`course_categories`
--

DROP TABLE IF EXISTS `formanube`.`course_categories`;
CREATE TABLE  `formanube`.`course_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`course_categories`
--

/*!40000 ALTER TABLE `course_categories` DISABLE KEYS */;
LOCK TABLES `course_categories` WRITE;
INSERT INTO `formanube`.`course_categories` VALUES  (1,'Tecnología','',NULL,NULL),
 (2,'Negocios','',NULL,NULL),
 (3,'Diseño','',NULL,NULL),
 (4,'Arte y Fotografía','',NULL,NULL),
 (5,'Salud','',NULL,NULL),
 (6,'Matemáticaas y Cienc','',NULL,NULL),
 (7,'Educación','',NULL,NULL),
 (8,'Idiomas','',NULL,NULL),
 (9,'Humanidades','',NULL,NULL),
 (10,'Ciencias Sociales','',NULL,NULL),
 (11,'Música','',NULL,NULL),
 (12,'Deportes','',NULL,NULL),
 (13,'Juegos','',NULL,NULL),
 (14,'Otros','',NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_categories` ENABLE KEYS */;


--
-- Definition of table `formanube`.`course_faqs`
--

DROP TABLE IF EXISTS `formanube`.`course_faqs`;
CREATE TABLE  `formanube`.`course_faqs` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_faqs_course_id` (`course_id`),
  CONSTRAINT `course_faqs_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`course_faqs`
--

/*!40000 ALTER TABLE `course_faqs` DISABLE KEYS */;
LOCK TABLES `course_faqs` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_faqs` ENABLE KEYS */;


--
-- Definition of table `formanube`.`course_goals`
--

DROP TABLE IF EXISTS `formanube`.`course_goals`;
CREATE TABLE  `formanube`.`course_goals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_goals_course_id` (`course_id`),
  CONSTRAINT `course_goals_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`course_goals`
--

/*!40000 ALTER TABLE `course_goals` DISABLE KEYS */;
LOCK TABLES `course_goals` WRITE;
INSERT INTO `formanube`.`course_goals` VALUES  (48,'meta 3',3,'2013-07-08 19:26:43',NULL),
 (49,'meta 1',3,'2013-07-08 19:26:43',NULL),
 (50,'meta 2',3,'2013-07-08 19:26:43',NULL),
 (51,'dsd',3,'2013-07-08 19:26:43',NULL),
 (52,'Meta 1',6,'2013-07-10 03:51:49',NULL),
 (53,'Meta 2',6,'2013-07-10 03:51:49',NULL),
 (54,'Objetivo 1',6,'2013-07-10 03:51:49',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_goals` ENABLE KEYS */;


--
-- Definition of table `formanube`.`course_requirements`
--

DROP TABLE IF EXISTS `formanube`.`course_requirements`;
CREATE TABLE  `formanube`.`course_requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_requirements_course_id` (`course_id`),
  CONSTRAINT `course_requirements_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`course_requirements`
--

/*!40000 ALTER TABLE `course_requirements` DISABLE KEYS */;
LOCK TABLES `course_requirements` WRITE;
INSERT INTO `formanube`.`course_requirements` VALUES  (30,'requisito 1',3,'2013-07-08 19:26:43',NULL),
 (31,'requisito 2',3,'2013-07-08 19:26:43',NULL),
 (32,'err',3,'2013-07-08 19:26:43',NULL),
 (33,'Nivel medio de Java',6,'2013-07-10 03:51:49',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_requirements` ENABLE KEYS */;


--
-- Definition of table `formanube`.`course_status`
--

DROP TABLE IF EXISTS `formanube`.`course_status`;
CREATE TABLE  `formanube`.`course_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(130) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`course_status`
--

/*!40000 ALTER TABLE `course_status` DISABLE KEYS */;
LOCK TABLES `course_status` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_status` ENABLE KEYS */;


--
-- Definition of table `formanube`.`course_thumbnails`
--

DROP TABLE IF EXISTS `formanube`.`course_thumbnails`;
CREATE TABLE  `formanube`.`course_thumbnails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `file_name` text,
  `file_size` varchar(50) DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_thumbnails_course_id` (`course_id`),
  CONSTRAINT `course_thumbnails_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`course_thumbnails`
--

/*!40000 ALTER TABLE `course_thumbnails` DISABLE KEYS */;
LOCK TABLES `course_thumbnails` WRITE;
INSERT INTO `formanube`.`course_thumbnails` VALUES  (2,3,'course_thumbnail_3.jpg','43.38','image/jpeg','2013-06-27 05:46:58','2013-06-27 05:59:33'),
 (3,6,'course_thumbnail_6.jpg','46.03','image/jpeg','2013-07-10 03:53:14',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_thumbnails` ENABLE KEYS */;


--
-- Definition of table `formanube`.`course_users`
--

DROP TABLE IF EXISTS `formanube`.`course_users`;
CREATE TABLE  `formanube`.`course_users` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `observations` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `testimony` varchar(300) NOT NULL,
  `user_category_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_users_course_id` (`course_id`),
  KEY `course_users_user_category_id` (`user_category_id`),
  CONSTRAINT `course_users_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `course_users_user_category_id` FOREIGN KEY (`user_category_id`) REFERENCES `user_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`course_users`
--

/*!40000 ALTER TABLE `course_users` DISABLE KEYS */;
LOCK TABLES `course_users` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_users` ENABLE KEYS */;


--
-- Definition of table `formanube`.`courses`
--

DROP TABLE IF EXISTS `formanube`.`courses`;
CREATE TABLE  `formanube`.`courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `concurrence` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `course_category_id` int(11) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `timing` varchar(130) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `promo_date_to` datetime DEFAULT NULL,
  `quota` int(11) DEFAULT NULL,
  `course_state_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` text,
  `subtitle` text,
  `keywords` text,
  `summary` text,
  `instruction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_category_id` (`course_category_id`),
  KEY `courses_course_state_id` (`course_state_id`),
  KEY `courses_language_id` (`language_id`),
  CONSTRAINT `courses_course_category_id` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `courses_course_state_id` FOREIGN KEY (`course_state_id`) REFERENCES `course_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `courses_language_id` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`courses`
--

/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
LOCK TABLES `courses` WRITE;
INSERT INTO `formanube`.`courses` VALUES  (3,NULL,NULL,NULL,201,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,10,'2013-06-25 15:52:46','2013-07-10 00:32:46','Programacion en PHP','Guía alfabética para crear imágenes y clips asombrosos con la versión más reciente del software favorito del sector.','photoshop, adobe premier, gimp','0','0'),
 (4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2013-06-25 20:53:13',NULL,'Programacion en JAVA',NULL,NULL,NULL,NULL),
 (5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-06-27 06:35:44',NULL,'Diseña Grafico en Photoshop',NULL,NULL,NULL,NULL),
 (6,NULL,NULL,NULL,1000,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,10,'2013-07-10 03:48:42','2013-07-10 03:56:35','Programacion en Java','Programación avanzada en el lenguaje de programación orientado a objetos Java.','java, clases, objetos, programacion, web','0','0');
UNLOCK TABLES;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;


--
-- Definition of table `formanube`.`despatchs`
--

DROP TABLE IF EXISTS `formanube`.`despatchs`;
CREATE TABLE  `formanube`.`despatchs` (
  `id` int(11) NOT NULL,
  `delivery_day` datetime NOT NULL,
  `receipt_day` datetime NOT NULL,
  `signature` tinyint(1) NOT NULL,
  `receiver` varchar(25) NOT NULL,
  `comments` varchar(50) NOT NULL,
  `addres_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `despatchs_adress_id` (`addres_id`),
  CONSTRAINT `despatchs_adress_id` FOREIGN KEY (`addres_id`) REFERENCES `adresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This are the despatchs of the diplom or certificate';

--
-- Dumping data for table `formanube`.`despatchs`
--

/*!40000 ALTER TABLE `despatchs` DISABLE KEYS */;
LOCK TABLES `despatchs` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `despatchs` ENABLE KEYS */;


--
-- Definition of table `formanube`.`entry_control`
--

DROP TABLE IF EXISTS `formanube`.`entry_control`;
CREATE TABLE  `formanube`.`entry_control` (
  `id` int(10) unsigned NOT NULL,
  `last_entry` datetime NOT NULL,
  `session_length` int(11) NOT NULL COMMENT 'who much time what activ the session of the user',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='entry control of the system';

--
-- Dumping data for table `formanube`.`entry_control`
--

/*!40000 ALTER TABLE `entry_control` DISABLE KEYS */;
LOCK TABLES `entry_control` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `entry_control` ENABLE KEYS */;


--
-- Definition of table `formanube`.`languages`
--

DROP TABLE IF EXISTS `formanube`.`languages`;
CREATE TABLE  `formanube`.`languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`languages`
--

/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
LOCK TABLES `languages` WRITE;
INSERT INTO `formanube`.`languages` VALUES  (1,'Español'),
 (2,'Inglés'),
 (3,'Portugués'),
 (4,'Alemán'),
 (5,'Italiano'),
 (6,'Francés');
UNLOCK TABLES;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;


--
-- Definition of table `formanube`.`lessons`
--

DROP TABLE IF EXISTS `formanube`.`lessons`;
CREATE TABLE  `formanube`.`lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chapter_id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `order` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `section` (`chapter_id`),
  CONSTRAINT `section` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`lessons`
--

/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
LOCK TABLES `lessons` WRITE;
INSERT INTO `formanube`.`lessons` VALUES  (1,10,'Tipos',NULL,1,0,'2013-07-09 21:30:29','2013-07-10 01:01:35'),
 (2,10,'Ambitos',NULL,3,NULL,'2013-07-09 22:12:53','2013-07-10 01:01:36'),
 (3,10,'Strings',NULL,0,NULL,'2013-07-09 22:14:03','2013-07-10 01:01:35'),
 (4,10,'Enteros',NULL,4,NULL,'2013-07-09 22:14:12','2013-07-10 01:01:36'),
 (5,10,'Booleanos',NULL,2,NULL,'2013-07-09 22:14:27','2013-07-10 01:01:36'),
 (8,1,'Que es PHP',NULL,2,NULL,'2013-07-09 23:32:09','2013-07-10 01:02:16'),
 (9,1,'Historia',NULL,1,NULL,'2013-07-09 23:32:22','2013-07-10 01:02:16'),
 (10,1,'Evolución',NULL,0,NULL,'2013-07-09 23:44:01','2013-07-10 01:02:16'),
 (11,28,'¿Qué es Java?',NULL,0,NULL,'2013-07-10 03:55:23',NULL),
 (12,28,'Java en la comunidad',NULL,0,NULL,'2013-07-10 03:55:50',NULL),
 (13,28,'Java como lenguaje de las corporaciones',NULL,0,NULL,'2013-07-10 03:56:04',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;


--
-- Definition of table `formanube`.`material_files`
--

DROP TABLE IF EXISTS `formanube`.`material_files`;
CREATE TABLE  `formanube`.`material_files` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `link` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `material_files_lesson_id` (`lesson_id`),
  CONSTRAINT `material_files_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`material_files`
--

/*!40000 ALTER TABLE `material_files` DISABLE KEYS */;
LOCK TABLES `material_files` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `material_files` ENABLE KEYS */;


--
-- Definition of table `formanube`.`notifications`
--

DROP TABLE IF EXISTS `formanube`.`notifications`;
CREATE TABLE  `formanube`.`notifications` (
  `id` int(10) unsigned NOT NULL,
  `description` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`notifications`
--

/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
LOCK TABLES `notifications` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;


--
-- Definition of table `formanube`.`question_answer`
--

DROP TABLE IF EXISTS `formanube`.`question_answer`;
CREATE TABLE  `formanube`.`question_answer` (
  `id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `correct` tinyint(1) NOT NULL,
  `question_type_multi_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answer` (`question_type_multi_id`),
  CONSTRAINT `answer` FOREIGN KEY (`question_type_multi_id`) REFERENCES `question_type_multi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`question_answer`
--

/*!40000 ALTER TABLE `question_answer` DISABLE KEYS */;
LOCK TABLES `question_answer` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `question_answer` ENABLE KEYS */;


--
-- Definition of table `formanube`.`question_type_blank`
--

DROP TABLE IF EXISTS `formanube`.`question_type_blank`;
CREATE TABLE  `formanube`.`question_type_blank` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `quiz_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_type_blank_quiz_id` (`quiz_id`),
  CONSTRAINT `question_type_blank_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`question_type_blank`
--

/*!40000 ALTER TABLE `question_type_blank` DISABLE KEYS */;
LOCK TABLES `question_type_blank` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `question_type_blank` ENABLE KEYS */;


--
-- Definition of table `formanube`.`question_type_boolean`
--

DROP TABLE IF EXISTS `formanube`.`question_type_boolean`;
CREATE TABLE  `formanube`.`question_type_boolean` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_type_boolean_quiz_id` (`quiz_id`),
  CONSTRAINT `question_type_boolean_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`question_type_boolean`
--

/*!40000 ALTER TABLE `question_type_boolean` DISABLE KEYS */;
LOCK TABLES `question_type_boolean` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `question_type_boolean` ENABLE KEYS */;


--
-- Definition of table `formanube`.`question_type_multi`
--

DROP TABLE IF EXISTS `formanube`.`question_type_multi`;
CREATE TABLE  `formanube`.`question_type_multi` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `quiz_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_type_multi_quiz_id` (`quiz_id`),
  CONSTRAINT `question_type_multi_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`question_type_multi`
--

/*!40000 ALTER TABLE `question_type_multi` DISABLE KEYS */;
LOCK TABLES `question_type_multi` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `question_type_multi` ENABLE KEYS */;


--
-- Definition of table `formanube`.`quizzes`
--

DROP TABLE IF EXISTS `formanube`.`quizzes`;
CREATE TABLE  `formanube`.`quizzes` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quizzes_lesson_id` (`lesson_id`),
  CONSTRAINT `quizzes_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`quizzes`
--

/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
LOCK TABLES `quizzes` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;


--
-- Definition of table `formanube`.`resources`
--

DROP TABLE IF EXISTS `formanube`.`resources`;
CREATE TABLE  `formanube`.`resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `resource_controller` varchar(50) NOT NULL,
  `resource_function` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `added_on` datetime DEFAULT NULL,
  `edited_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `formanube`.`resources`
--

/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
LOCK TABLES `resources` WRITE;
INSERT INTO `formanube`.`resources` VALUES  (1,'controller','login',NULL,'',0,1,NULL,'0000-00-00 00:00:00'),
 (2,'controller','cizacl',NULL,NULL,0,NULL,'0000-00-00 00:00:00',NULL),
 (6,'controller','welcome',NULL,'controlador de bienvenida',0,1,NULL,NULL),
 (7,'function','welcome','test','funcion  de prueba',0,NULL,NULL,NULL),
 (19,'function','courses','my_courses','',1,NULL,'0000-00-00 00:00:00',NULL),
 (9,'controller','courses',NULL,'controlador de cursos',10,NULL,'0000-00-00 00:00:00',NULL),
 (10,'controller','profiles',NULL,'Controlador de perfiles',10,NULL,'0000-00-00 00:00:00',NULL),
 (11,'controller','signin',NULL,'controlador para loguearse',10,NULL,'0000-00-00 00:00:00',NULL),
 (12,'controller','signup',NULL,'controlador para registro de usuario',10,NULL,'0000-00-00 00:00:00',NULL),
 (13,'controller','user_thumbnail',NULL,'controlador para cargar imagen de perfil de usuario',10,NULL,'0000-00-00 00:00:00',NULL),
 (14,'controller','home',NULL,'controlador para visualizar landing page',10,NULL,'0000-00-00 00:00:00',NULL),
 (15,'function','courses','get_my_courses','funcion para mostrar los curso que esta ofreciendo y siguiendo cada usuairo',10,1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
UNLOCK TABLES;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;


--
-- Definition of table `formanube`.`roles`
--

DROP TABLE IF EXISTS `formanube`.`roles`;
CREATE TABLE  `formanube`.`roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `inherit_id` varchar(50) DEFAULT NULL,
  `redirect` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default` tinyint(3) unsigned NOT NULL,
  `order` smallint(5) unsigned NOT NULL DEFAULT '998',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `formanube`.`roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
LOCK TABLES `roles` WRITE;
INSERT INTO `formanube`.`roles` VALUES  (1,'Administrator',NULL,'cizacl','',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (2,'Guest',NULL,'home','',1,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (4,'Alumno-Profesor','[\"2\"]','courses/my_courses','',0,999,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


--
-- Definition of table `formanube`.`rules`
--

DROP TABLE IF EXISTS `formanube`.`rules`;
CREATE TABLE  `formanube`.`rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `resource_controller` text NOT NULL,
  `resource_function` text,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rules_role_id` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `formanube`.`rules`
--

/*!40000 ALTER TABLE `rules` DISABLE KEYS */;
LOCK TABLES `rules` WRITE;
INSERT INTO `formanube`.`rules` VALUES  (1,1,'allow','[null]','[null]',1,'',NULL,NULL),
 (12,2,'allow','[\"login\"]','[null]',1,'',NULL,NULL),
 (15,4,'allow','[\"courses\"]','[null]',1,'',NULL,NULL),
 (16,4,'allow','[\"profiles\"]','[null]',1,'',NULL,NULL),
 (17,2,'allow','[\"signin\"]','[null]',1,'',NULL,NULL),
 (18,2,'allow','[\"signup\"]','[null]',1,'',NULL,NULL),
 (19,2,'allow','[\"home\"]','[null]',1,'',NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `rules` ENABLE KEYS */;


--
-- Definition of table `formanube`.`sessions`
--

DROP TABLE IF EXISTS `formanube`.`sessions`;
CREATE TABLE  `formanube`.`sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `formanube`.`sessions`
--

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
LOCK TABLES `sessions` WRITE;
INSERT INTO `formanube`.`sessions` VALUES  ('45216163661aacbe1b0b85dd46690b16','127.0.0.1','Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.22 (KHTML, like Gecko) Ubuntu Chromium/25.0.1364.160 Chrome/25.0.1364.160 ',1373428393,'a:8:{s:9:\"user_data\";s:0:\"\";s:9:\"logged_in\";b:1;s:10:\"user_email\";s:22:\"guzmanjhonny@gmail.com\";s:7:\"user_id\";i:10;s:9:\"user_name\";s:6:\"Johnny\";s:12:\"user_surname\";s:6:\"Guzman\";s:15:\"user_lastaccess\";s:19:\"2013-07-10 00:12:12\";s:7:\"role_id\";s:1:\"4\";}'),
 ('0810fae130b2b50e99020816ff0a19c7','127.0.0.1','Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.22 (KHTML, like Gecko) Ubuntu Chromium/25.0.1364.160 Chrome/25.0.1364.160 ',1373425266,'');
UNLOCK TABLES;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


--
-- Definition of table `formanube`.`status`
--

DROP TABLE IF EXISTS `formanube`.`status`;
CREATE TABLE  `formanube`.`status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `code` tinyint(4) NOT NULL,
  `status_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `formanube`.`status`
--

/*!40000 ALTER TABLE `status` DISABLE KEYS */;
LOCK TABLES `status` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;


--
-- Definition of table `formanube`.`status_groups`
--

DROP TABLE IF EXISTS `formanube`.`status_groups`;
CREATE TABLE  `formanube`.`status_groups` (
  `id` int(11) DEFAULT NULL,
  `description` varchar(130) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`status_groups`
--

/*!40000 ALTER TABLE `status_groups` DISABLE KEYS */;
LOCK TABLES `status_groups` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `status_groups` ENABLE KEYS */;


--
-- Definition of table `formanube`.`telephones`
--

DROP TABLE IF EXISTS `formanube`.`telephones`;
CREATE TABLE  `formanube`.`telephones` (
  `id` int(11) NOT NULL,
  `number` varchar(50) NOT NULL,
  `description` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='telefon numbers of the users';

--
-- Dumping data for table `formanube`.`telephones`
--

/*!40000 ALTER TABLE `telephones` DISABLE KEYS */;
LOCK TABLES `telephones` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `telephones` ENABLE KEYS */;


--
-- Definition of table `formanube`.`testimonies`
--

DROP TABLE IF EXISTS `formanube`.`testimonies`;
CREATE TABLE  `formanube`.`testimonies` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `testimony` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`testimonies`
--

/*!40000 ALTER TABLE `testimonies` DISABLE KEYS */;
LOCK TABLES `testimonies` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `testimonies` ENABLE KEYS */;


--
-- Definition of table `formanube`.`user_categories`
--

DROP TABLE IF EXISTS `formanube`.`user_categories`;
CREATE TABLE  `formanube`.`user_categories` (
  `id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`user_categories`
--

/*!40000 ALTER TABLE `user_categories` DISABLE KEYS */;
LOCK TABLES `user_categories` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_categories` ENABLE KEYS */;


--
-- Definition of table `formanube`.`user_status`
--

DROP TABLE IF EXISTS `formanube`.`user_status`;
CREATE TABLE  `formanube`.`user_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(130) DEFAULT NULL,
  `code` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`user_status`
--

/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;
LOCK TABLES `user_status` WRITE;
INSERT INTO `formanube`.`user_status` VALUES  (1,'enabled',1),
 (2,'disabled',2),
 (3,'blocked',3),
 (4,'waiting confirmation register',4);
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;


--
-- Definition of table `formanube`.`user_thumbnails`
--

DROP TABLE IF EXISTS `formanube`.`user_thumbnails`;
CREATE TABLE  `formanube`.`user_thumbnails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `file_name` text,
  `file_size` varchar(50) DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formanube`.`user_thumbnails`
--

/*!40000 ALTER TABLE `user_thumbnails` DISABLE KEYS */;
LOCK TABLES `user_thumbnails` WRITE;
INSERT INTO `formanube`.`user_thumbnails` VALUES  (5,10,'user_thumbnail_10.jpg','42.91','image/jpeg','2013-06-25 00:59:13','2013-06-25 01:12:29');
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_thumbnails` ENABLE KEYS */;


--
-- Definition of table `formanube`.`users`
--

DROP TABLE IF EXISTS `formanube`.`users`;
CREATE TABLE  `formanube`.`users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `user_status_code` tinyint(4) NOT NULL,
  `lastaccess` int(11) DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  `edited` datetime DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `desingnation` text,
  `subtitle` varchar(60) DEFAULT NULL,
  `biography` text,
  `language_id` int(11) DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `dni` varchar(24) NOT NULL,
  `studies` varchar(20) NOT NULL,
  `first_entry` datetime NOT NULL,
  `username` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `auth` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `activationcode` text,
  `tokenforgotpassword` text,
  `movil_tel` varchar(100) DEFAULT NULL,
  `home_tel` varchar(100) DEFAULT NULL,
  `observations` text,
  PRIMARY KEY (`id`),
  KEY `users_language_id` (`language_id`),
  KEY `users_role_id` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `formanube`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `formanube`.`users` VALUES  (1,'John','Smith','john.smith@example.com',1,1373425800,'0000-00-00 00:00:00','2013-07-10 02:44:06',0,1,NULL,NULL,NULL,NULL,'','','','0000-00-00 00:00:00','admin','21232f297a57a5a743894a0e4a801fc3',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (10,'Johnny','Guzman','guzmanjhonny@gmail.com',1,1373428098,'2013-06-22 00:08:38','2013-07-10 03:48:18',0,1,'Ing. en sistemas',NULL,'apasionado de la informatica',1,'','','','0000-00-00 00:00:00','jhonnyguzman','c6cc8094c2dc07b700ffcc36d64e2138',4,NULL,NULL,'Lb9ecOwMWfgPcmin5neBudcY3ZBP8cRJuQWAYDHFEnO9on9j3bW',NULL,NULL,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
