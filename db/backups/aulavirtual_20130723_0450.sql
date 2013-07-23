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
-- Create schema aulavirtual
--

CREATE DATABASE IF NOT EXISTS aulavirtual;
USE aulavirtual;

--
-- Definition of table `aulavirtual`.`adresses`
--

DROP TABLE IF EXISTS `aulavirtual`.`adresses`;
CREATE TABLE  `aulavirtual`.`adresses` (
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
-- Dumping data for table `aulavirtual`.`adresses`
--

/*!40000 ALTER TABLE `adresses` DISABLE KEYS */;
LOCK TABLES `adresses` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `adresses` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`chapters`
--

DROP TABLE IF EXISTS `aulavirtual`.`chapters`;
CREATE TABLE  `aulavirtual`.`chapters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `order` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chapters_course_id` (`course_id`),
  CONSTRAINT `chapters_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`chapters`
--

/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
LOCK TABLES `chapters` WRITE;
INSERT INTO `aulavirtual`.`chapters` VALUES  (1,3,'¿Qué es PHP?',NULL,1,NULL,'2013-07-15 23:34:44','2013-07-23 07:48:35'),
 (2,3,'Introducción',NULL,0,NULL,'2013-07-15 23:34:52','2013-07-23 07:48:35'),
 (3,3,'Historia',NULL,2,NULL,'2013-07-15 23:35:00','2013-07-23 07:48:36'),
 (4,3,'Variables',NULL,3,NULL,'2013-07-15 23:35:06','2013-07-23 07:48:36'),
 (5,3,'Tipos de datos',NULL,4,NULL,'2013-07-15 23:35:15','2013-07-23 07:48:36'),
 (6,3,'Sentencias condicionales',NULL,5,NULL,'2013-07-15 23:35:25','2013-07-23 07:48:36'),
 (7,3,'Ciclos',NULL,6,NULL,'2013-07-15 23:35:33','2013-07-23 07:48:36'),
 (8,3,'Entrada/Salida',NULL,8,NULL,'2013-07-15 23:35:52','2013-07-23 07:48:36'),
 (9,3,'Archivos',NULL,7,NULL,'2013-07-15 23:36:21','2013-07-23 07:48:36'),
 (10,6,'Qués es Java',NULL,2,NULL,'2013-07-17 08:18:23',NULL),
 (11,3,'Errores',NULL,10,NULL,'2013-07-20 04:58:33','2013-07-23 07:48:36'),
 (14,3,'Clases',NULL,9,NULL,'2013-07-20 06:06:28','2013-07-23 07:48:36'),
 (15,3,'Objetos',NULL,11,NULL,'2013-07-20 06:29:50','2013-07-23 07:48:36'),
 (16,3,'Poliformismo',NULL,12,NULL,'2013-07-20 06:32:40','2013-07-23 07:48:36'),
 (17,3,'Herencia',NULL,13,NULL,'2013-07-20 06:56:59','2013-07-23 07:48:36'),
 (18,3,'Herencia multiple',NULL,14,NULL,'2013-07-20 07:00:27','2013-07-23 07:48:36'),
 (19,3,'Visibilidad de objetos',NULL,15,NULL,'2013-07-20 07:01:11','2013-07-23 07:48:36'),
 (20,3,'MVC en PHP',NULL,16,NULL,'2013-07-20 07:14:10','2013-07-23 07:48:36'),
 (21,3,'Frameworks de PHP',NULL,17,NULL,'2013-07-20 07:17:20','2013-07-23 07:48:36'),
 (23,3,'Futuro del Lenguaje',NULL,18,NULL,'2013-07-20 07:35:56','2013-07-23 07:48:36'),
 (24,3,'Nuevas Versiones',NULL,19,NULL,'2013-07-20 07:36:38','2013-07-23 07:48:36'),
 (25,3,'Ejemplo 1',NULL,20,NULL,'2013-07-20 07:36:59','2013-07-23 07:48:36'),
 (26,3,'Ejemplo 2',NULL,21,NULL,'2013-07-20 07:43:22','2013-07-23 07:48:36'),
 (27,3,'Ejemplo 3',NULL,22,NULL,'2013-07-20 07:50:22','2013-07-23 07:48:36'),
 (28,3,'Ejemplo 4',NULL,23,NULL,'2013-07-20 08:27:46','2013-07-23 07:48:36'),
 (29,3,'Ejemplo 5',NULL,24,NULL,'2013-07-20 08:32:57','2013-07-23 07:48:36'),
 (30,3,'Ejemplo 6',NULL,25,NULL,'2013-07-20 08:34:18','2013-07-23 07:48:37'),
 (31,3,'Ejemplo 7',NULL,26,NULL,'2013-07-20 08:35:53','2013-07-23 07:48:37'),
 (32,3,'Ejemplo 8',NULL,27,NULL,'2013-07-20 08:39:53','2013-07-23 07:48:37');
UNLOCK TABLES;
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`content_audios`
--

DROP TABLE IF EXISTS `aulavirtual`.`content_audios`;
CREATE TABLE  `aulavirtual`.`content_audios` (
  `id` int(11) NOT NULL,
  `link` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_audios_lesson_id` (`lesson_id`),
  CONSTRAINT `content_audios_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`content_audios`
--

/*!40000 ALTER TABLE `content_audios` DISABLE KEYS */;
LOCK TABLES `content_audios` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_audios` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`content_documents`
--

DROP TABLE IF EXISTS `aulavirtual`.`content_documents`;
CREATE TABLE  `aulavirtual`.`content_documents` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `document` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lcontent_documents_lesson_id` (`lesson_id`),
  CONSTRAINT `lcontent_documents_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`content_documents`
--

/*!40000 ALTER TABLE `content_documents` DISABLE KEYS */;
LOCK TABLES `content_documents` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_documents` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`content_images`
--

DROP TABLE IF EXISTS `aulavirtual`.`content_images`;
CREATE TABLE  `aulavirtual`.`content_images` (
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
-- Dumping data for table `aulavirtual`.`content_images`
--

/*!40000 ALTER TABLE `content_images` DISABLE KEYS */;
LOCK TABLES `content_images` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_images` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`content_presentations`
--

DROP TABLE IF EXISTS `aulavirtual`.`content_presentations`;
CREATE TABLE  `aulavirtual`.`content_presentations` (
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
-- Dumping data for table `aulavirtual`.`content_presentations`
--

/*!40000 ALTER TABLE `content_presentations` DISABLE KEYS */;
LOCK TABLES `content_presentations` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_presentations` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`content_texts`
--

DROP TABLE IF EXISTS `aulavirtual`.`content_texts`;
CREATE TABLE  `aulavirtual`.`content_texts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_html` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `description` text,
  `status_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content_texts_lesson_id` (`lesson_id`),
  CONSTRAINT `content_texts_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`content_texts`
--

/*!40000 ALTER TABLE `content_texts` DISABLE KEYS */;
LOCK TABLES `content_texts` WRITE;
INSERT INTO `aulavirtual`.`content_texts` VALUES  (4,'\n   \n   \n   \n   \n   \n   \n   \n   \n   &lt;p style=&quot;margin-bottom: 14px; text-align: justify; line-height: 14px; padding: 0px;&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;font color=&quot;#000000&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras consequat est sit amet orci suscipit sollicitudin. Nullam accumsan felis risus, a posuere est adipiscing sit amet. Nulla auctor mauris non erat molestie faucibus. Quisque a tempor felis, ut ultrices elit. Ut venenatis venenatis erat, vel eleifend mauris venenatis at. Fusce vitae risus felis. Curabitur vitae nisi leo. Sed erat elit, pretium sit amet purus ut, consectetur fringilla ante. Vivamu&lt;/font&gt;&lt;font color=&quot;#16a765&quot;&gt;s faucibus, neque a feu&lt;/font&gt;&lt;font color=&quot;#000000&quot;&gt;giat pulvinar, nulla arcu eleifend nisi, quis dapibus erat dolor sed augue. Aenean scelerisque ante vel lectus feugiat sollicitudin. Suspendisse a sodales ipsum. Curabitur ultricies laoreet rhoncus. Maecenas id laoreet tortor, ut elementum elit. Suspendisse elit metus, bibendum sit amet odio ut, tedsdsdmpus ornare ipsum. &amp;nbsp; sdsdsdsddsdsdsds &amp;nbsp;sdsdsd&lt;/font&gt;&lt;/i&gt;&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 14px; text-align: justify; line-height: 14px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;b&gt;&lt;i&gt;In varius ipsum vitae rutrum porttitor. Vestibulum ullamcorper orci at urna ornare porttitor. Sed varius nunc vitae dignissim sodales. Ut cursus odio vitae feugiat ornare. Aliquam feugiat ac tortor eu bibendum. Sed vitae dolor nisl. Phasellus lectus risus, pharetra nec pellentesque non, imperdiet nec velit. Ut id elit lacus. Sed interdum risus ac luctus aliquam. Mauris dictum, sapien eu suscipit cursus, velit risus eleifend lectus, et hendrerit mauris dui ut turpis. Proin eu lorem ac elit porttitor semper. Maecenas tristique dapibus urna non malesuada.&lt;/i&gt;&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 14px; text-align: justify; line-height: 14px; padding: 0px;&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;font color=&quot;#000000&quot;&gt;Curabitur id sollicitudin neque, ut cursus diam. Suspendisse ullamcorper nulla sit amet porta consectetur. Morbi vitae ullamcorper neque. Etiam rutrum velit a dolor sodales porta. Integer elementum, mauris ut sollicitudin aliquam, nibh nisi rutrum lectus, ac mollis ante velit vulputate sapien. Donec congue id enim a consecte&lt;/font&gt;&lt;font color=&quot;#fa573c&quot;&gt;tur. Quisque ip&lt;/font&gt;&lt;font color=&quot;#000000&quot;&gt;sum odio, scelerisque at neque in, tincidunt eleifend nunc. Nullam et nisl euismod, eleifend nisl tempus, placerat nunc. Phasellus ac nunc vestibulum, luctus enim a, egestas turpis.&lt;/font&gt;&lt;/i&gt;&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 14px; text-align: justify; line-height: 14px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;b&gt;&lt;i&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in neque id ipsum interdum sodales. Phasellus est augue, ultricies nec erat ut, dictum sagittis ipsum. Nullam quis dolor erat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse at fermentum felis. Integer fermentum venenatis tellus, venenatis sodales purus rhoncus vitae.&lt;/i&gt;&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 14px; text-align: justify; line-height: 14px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;b&gt;&lt;i&gt;In felis nibh, adipiscing in ante nec, dignissim feugiat risus. Nam eu faucibus enim. Nam in eleifend massa. Integer bibendum, turpis at vehicula venenatis, quam ligula consequat urna, eget adipiscing ipsum quam nec ligula. Proin egestas interdum tempor. Etiam non velit bibendum, iaculis libero quis, viverra elit. Proin euismod condimentum enim a adipiscing. Pellentesque dolor nibh, venenatis eu ultricies vitae, posuere non augue. Curabitur tempor quis quam non fringilla. Nulla facilisi. Aenean eros lectus, facilisis vel blandit sed, mattis eget dolor. Sed in dignissim magna, ut ullamcorper massa. Sed accumsan, ipsum nec egestas luctus, erat erat scelerisque leo, in tempor neque lorem et ante. Aliquam erat volutpat. Nunc mi lectus, pretium quis sagittis in, auctor ac magna. Quisque mollis ipsum lacinia, tempor neque id, imperdiet tortor.&lt;/i&gt;&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;                  ',21,NULL,NULL,'2013-07-16 03:35:50','2013-07-20 06:31:39'),
 (5,'\n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   &lt;p style=&quot;margin-bottom: 14px; text-align: justify; line-height: 14px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;b&gt;&lt;i&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras consequat est sit amet orci suscipit sollicitudin. Nullam accumsan felis risus, a posuere est adipiscing sit amet. Nulla auctor mauris non erat molestie faucibus. Quisque a tempor felis, ut ultrices elit. Ut venenatis venenatis erat, vel eleifend mauris venenatis at. Fusce vitae risus felis. Curabitur vitae nisi leo. Sed erat elit, pretium sit amet purus ut, consectetur fringilla ante. Vivamus faucibus, neque a feugiat pulvinar, nulla arcu eleifend nisi, quis dapibus erat dolor sed augue. Aenean scelerisque ante vel lectus feugiat sollicitudin. Suspendisse a sodales ipsum. Curabitur ultricies laoreet rhoncus. Maecenas id laoreet tortor, ut elementum elit. Suspendisse elit metus, bibendum sit amet odio ut, tempus ornare ipsum.&lt;/i&gt;&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 14px; text-align: justify; line-height: 14px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;b&gt;&lt;i&gt;In varius ipsum vitae rutrum porttitor. Vestibulum ullamcorper orci at urna ornare porttitor. Sed varius nunc vitae dignissim sodales. Ut cursus odio vitae feugiat ornare. Aliquam feugiat ac tortor eu bibendum. Sed vitae dolor nisl. Phasellus lectus risus, pharetra nec pellentesque non, imperdiet nec velit. Ut id elit lacus. Sed interdum risus ac luctus aliquam. Mauris dictum, sapien eu suscipit cursus, velit risus eleifend lectus, et hendrerit mauris dui ut turpis. Proin eu lorem ac elit porttitor semper. Maecenas tristique dapibus urna non malesuada.&lt;/i&gt;&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; margin-bottom: 14px; line-height: 14px; padding: 0px;&quot;&gt;&lt;font size=&quot;5&quot; color=&quot;#16a765&quot;&gt;&lt;b&gt;dsdsdsdsd &amp;nbsp;sdsdsdd&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;                                              ',22,NULL,NULL,'2013-07-16 03:36:07','2013-07-17 21:06:45'),
 (6,'\n   &lt;div&gt;&lt;b&gt;&lt;font size=&quot;5&quot; color=&quot;#16a765&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/b&gt;&lt;/div&gt;&lt;div&gt;&lt;b&gt;&lt;font size=&quot;5&quot; color=&quot;#16a765&quot;&gt;Esto es una prueba&lt;/font&gt;&lt;/b&gt;&lt;/div&gt;&lt;div&gt;&lt;b&gt;&lt;font size=&quot;5&quot; color=&quot;#16a765&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/b&gt;&lt;/div&gt;&lt;img src=&quot;[removed]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&quot;&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;  ',23,NULL,NULL,'2013-07-20 00:30:58','2013-07-20 04:53:03'),
 (7,'',25,NULL,NULL,'2013-07-20 04:52:04',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_texts` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`content_videos`
--

DROP TABLE IF EXISTS `aulavirtual`.`content_videos`;
CREATE TABLE  `aulavirtual`.`content_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL,
  `file_name` text,
  `file_size` varchar(50) DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` text,
  `pause` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content_videos_lesson_id` (`lesson_id`),
  CONSTRAINT `content_videos_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`content_videos`
--

/*!40000 ALTER TABLE `content_videos` DISABLE KEYS */;
LOCK TABLES `content_videos` WRITE;
INSERT INTO `aulavirtual`.`content_videos` VALUES  (21,32,NULL,NULL,NULL,'youtube','http://www.youtube.com/watch?v=OWHJa0jKJgo',NULL,'2013-07-23 01:28:45',NULL),
 (22,33,NULL,NULL,NULL,'youtube','http://www.youtube.com/watch?v=nhqOxak4D6Y',NULL,'2013-07-23 01:32:53',NULL),
 (23,26,NULL,NULL,NULL,'youtube','http://www.youtube.com/watch?v=OWHJa0jKJgo',NULL,'2013-07-23 02:13:35',NULL),
 (24,27,NULL,NULL,NULL,'youtube','http://www.youtube.com/watch?v=nhqOxak4D6Y',NULL,'2013-07-23 02:18:02',NULL),
 (29,34,'03cd4c25e90f2cad84931fcfa323bba9_34.mp4','5234.69','video/mp4','local',NULL,NULL,'2013-07-23 07:46:54',NULL),
 (30,28,'d4d04735a21f92ca8bb1568e13a71468_28.mp4','5234.69','video/mp4','local',NULL,NULL,'2013-07-23 07:48:45',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_videos` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`course_audiences`
--

DROP TABLE IF EXISTS `aulavirtual`.`course_audiences`;
CREATE TABLE  `aulavirtual`.`course_audiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `course_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_audiences_course_id` (`course_id`),
  CONSTRAINT `course_audiences_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`course_audiences`
--

/*!40000 ALTER TABLE `course_audiences` DISABLE KEYS */;
LOCK TABLES `course_audiences` WRITE;
INSERT INTO `aulavirtual`.`course_audiences` VALUES  (39,'Personas apasionadas por la programacin',6,'2013-07-10 03:51:49',NULL),
 (40,'Jovenes pasionales',6,'2013-07-10 03:51:49',NULL),
 (41,'audiencia 1',3,'2013-07-17 08:11:10',NULL),
 (42,'audiencia 2',3,'2013-07-17 08:11:10',NULL),
 (43,'audiencia 3',3,'2013-07-17 08:11:10',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_audiences` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`course_categories`
--

DROP TABLE IF EXISTS `aulavirtual`.`course_categories`;
CREATE TABLE  `aulavirtual`.`course_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`course_categories`
--

/*!40000 ALTER TABLE `course_categories` DISABLE KEYS */;
LOCK TABLES `course_categories` WRITE;
INSERT INTO `aulavirtual`.`course_categories` VALUES  (1,'Tecnología','',NULL,NULL),
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
-- Definition of table `aulavirtual`.`course_faqs`
--

DROP TABLE IF EXISTS `aulavirtual`.`course_faqs`;
CREATE TABLE  `aulavirtual`.`course_faqs` (
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
-- Dumping data for table `aulavirtual`.`course_faqs`
--

/*!40000 ALTER TABLE `course_faqs` DISABLE KEYS */;
LOCK TABLES `course_faqs` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_faqs` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`course_goals`
--

DROP TABLE IF EXISTS `aulavirtual`.`course_goals`;
CREATE TABLE  `aulavirtual`.`course_goals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_goals_course_id` (`course_id`),
  CONSTRAINT `course_goals_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`course_goals`
--

/*!40000 ALTER TABLE `course_goals` DISABLE KEYS */;
LOCK TABLES `course_goals` WRITE;
INSERT INTO `aulavirtual`.`course_goals` VALUES  (52,'Meta 1',6,'2013-07-10 03:51:49',NULL),
 (53,'Meta 2',6,'2013-07-10 03:51:49',NULL),
 (54,'Objetivo 1',6,'2013-07-10 03:51:49',NULL),
 (55,'meta 3',3,'2013-07-17 08:11:09',NULL),
 (56,'meta 1',3,'2013-07-17 08:11:09',NULL),
 (57,'meta 2',3,'2013-07-17 08:11:09',NULL),
 (58,'dsd',3,'2013-07-17 08:11:09',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_goals` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`course_requirements`
--

DROP TABLE IF EXISTS `aulavirtual`.`course_requirements`;
CREATE TABLE  `aulavirtual`.`course_requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_requirements_course_id` (`course_id`),
  CONSTRAINT `course_requirements_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`course_requirements`
--

/*!40000 ALTER TABLE `course_requirements` DISABLE KEYS */;
LOCK TABLES `course_requirements` WRITE;
INSERT INTO `aulavirtual`.`course_requirements` VALUES  (33,'Nivel medio de Java',6,'2013-07-10 03:51:49',NULL),
 (34,'requisito 1',3,'2013-07-17 08:11:10',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_requirements` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`course_status`
--

DROP TABLE IF EXISTS `aulavirtual`.`course_status`;
CREATE TABLE  `aulavirtual`.`course_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(130) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`course_status`
--

/*!40000 ALTER TABLE `course_status` DISABLE KEYS */;
LOCK TABLES `course_status` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_status` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`course_thumbnails`
--

DROP TABLE IF EXISTS `aulavirtual`.`course_thumbnails`;
CREATE TABLE  `aulavirtual`.`course_thumbnails` (
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
-- Dumping data for table `aulavirtual`.`course_thumbnails`
--

/*!40000 ALTER TABLE `course_thumbnails` DISABLE KEYS */;
LOCK TABLES `course_thumbnails` WRITE;
INSERT INTO `aulavirtual`.`course_thumbnails` VALUES  (2,3,'course_thumbnail_3.jpg','43.38','image/jpeg','2013-06-27 05:46:58','2013-06-27 05:59:33'),
 (3,6,'course_thumbnail_6.jpg','46.03','image/jpeg','2013-07-10 03:53:14',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_thumbnails` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`course_users`
--

DROP TABLE IF EXISTS `aulavirtual`.`course_users`;
CREATE TABLE  `aulavirtual`.`course_users` (
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
  CONSTRAINT `course_users_user_category_id` FOREIGN KEY (`user_category_id`) REFERENCES `user_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `course_users_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`course_users`
--

/*!40000 ALTER TABLE `course_users` DISABLE KEYS */;
LOCK TABLES `course_users` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_users` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`courses`
--

DROP TABLE IF EXISTS `aulavirtual`.`courses`;
CREATE TABLE  `aulavirtual`.`courses` (
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
  CONSTRAINT `courses_language_id` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `courses_course_category_id` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `courses_course_state_id` FOREIGN KEY (`course_state_id`) REFERENCES `course_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`courses`
--

/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
LOCK TABLES `courses` WRITE;
INSERT INTO `aulavirtual`.`courses` VALUES  (3,NULL,NULL,NULL,201,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,10,'2013-06-25 15:52:46','2013-07-17 08:11:09','Programacion en PHP','Guía alfabética para crear imágenes y clips asombrosos con la versión más reciente del software favorito del sector.','photoshop, adobe premier, gimp','0','0'),
 (4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2013-06-25 20:53:13',NULL,'Programacion en JAVA',NULL,NULL,NULL,NULL),
 (5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-06-27 06:35:44',NULL,'Diseña Grafico en Photoshop',NULL,NULL,NULL,NULL),
 (6,NULL,NULL,NULL,1000,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,10,'2013-07-10 03:48:42','2013-07-10 03:56:35','Programacion en Java','Programación avanzada en el lenguaje de programación orientado a objetos Java.','java, clases, objetos, programacion, web','0','0');
UNLOCK TABLES;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`despatchs`
--

DROP TABLE IF EXISTS `aulavirtual`.`despatchs`;
CREATE TABLE  `aulavirtual`.`despatchs` (
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
-- Dumping data for table `aulavirtual`.`despatchs`
--

/*!40000 ALTER TABLE `despatchs` DISABLE KEYS */;
LOCK TABLES `despatchs` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `despatchs` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`entry_control`
--

DROP TABLE IF EXISTS `aulavirtual`.`entry_control`;
CREATE TABLE  `aulavirtual`.`entry_control` (
  `id` int(10) unsigned NOT NULL,
  `last_entry` datetime NOT NULL,
  `session_length` int(11) NOT NULL COMMENT 'who much time what activ the session of the user',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='entry control of the system';

--
-- Dumping data for table `aulavirtual`.`entry_control`
--

/*!40000 ALTER TABLE `entry_control` DISABLE KEYS */;
LOCK TABLES `entry_control` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `entry_control` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`languages`
--

DROP TABLE IF EXISTS `aulavirtual`.`languages`;
CREATE TABLE  `aulavirtual`.`languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`languages`
--

/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
LOCK TABLES `languages` WRITE;
INSERT INTO `aulavirtual`.`languages` VALUES  (1,'Español'),
 (2,'Inglés'),
 (3,'Portugués'),
 (4,'Alemán'),
 (5,'Italiano'),
 (6,'Francés');
UNLOCK TABLES;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`lessons`
--

DROP TABLE IF EXISTS `aulavirtual`.`lessons`;
CREATE TABLE  `aulavirtual`.`lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `order` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `chapter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_chapter_id` (`chapter_id`),
  CONSTRAINT `lessons_chapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`lessons`
--

/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
LOCK TABLES `lessons` WRITE;
INSERT INTO `aulavirtual`.`lessons` VALUES  (21,'Inicios',NULL,3,NULL,'2013-07-15 23:45:58','2013-07-20 09:29:22',1),
 (22,'PHP en la Web',NULL,1,NULL,'2013-07-15 23:46:05','2013-07-20 08:53:06',1),
 (23,'PHP como lenguaje de referencia',NULL,2,NULL,'2013-07-16 03:37:35','2013-07-20 08:53:06',1),
 (24,'Java',NULL,0,NULL,'2013-07-17 08:18:37',NULL,10),
 (25,'Liderazgo',NULL,3,NULL,'2013-07-20 00:43:53','2013-07-20 08:53:06',1),
 (26,'Qué es un variable',NULL,0,NULL,'2013-07-20 01:11:16','2013-07-23 07:33:02',4),
 (27,'Tipos de variables',NULL,1,NULL,'2013-07-20 01:12:00','2013-07-23 07:33:02',4),
 (28,'Strings',NULL,2,NULL,'2013-07-20 01:12:22','2013-07-23 07:33:02',4),
 (29,'Descripcion',NULL,2,NULL,'2013-07-20 08:43:06','2013-07-20 08:45:34',32),
 (30,'Contexto',NULL,0,NULL,'2013-07-20 08:44:14','2013-07-20 08:45:34',32),
 (31,'Panorama',NULL,1,NULL,'2013-07-20 08:45:02','2013-07-20 08:45:34',32),
 (32,'Los 90',NULL,0,NULL,'2013-07-20 11:52:48','2013-07-23 06:37:24',3),
 (33,'Los 2000',NULL,1,NULL,'2013-07-22 16:16:59','2013-07-23 06:37:24',3),
 (34,'2010',NULL,2,NULL,'2013-07-23 04:30:54','2013-07-23 06:37:24',3);
UNLOCK TABLES;
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`material_files`
--

DROP TABLE IF EXISTS `aulavirtual`.`material_files`;
CREATE TABLE  `aulavirtual`.`material_files` (
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
-- Dumping data for table `aulavirtual`.`material_files`
--

/*!40000 ALTER TABLE `material_files` DISABLE KEYS */;
LOCK TABLES `material_files` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `material_files` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`notifications`
--

DROP TABLE IF EXISTS `aulavirtual`.`notifications`;
CREATE TABLE  `aulavirtual`.`notifications` (
  `id` int(10) unsigned NOT NULL,
  `description` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`notifications`
--

/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
LOCK TABLES `notifications` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`question_answer`
--

DROP TABLE IF EXISTS `aulavirtual`.`question_answer`;
CREATE TABLE  `aulavirtual`.`question_answer` (
  `id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `correct` tinyint(1) NOT NULL,
  `question_type_multi_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answer` (`question_type_multi_id`),
  CONSTRAINT `answer` FOREIGN KEY (`question_type_multi_id`) REFERENCES `question_type_multi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`question_answer`
--

/*!40000 ALTER TABLE `question_answer` DISABLE KEYS */;
LOCK TABLES `question_answer` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `question_answer` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`question_type_blank`
--

DROP TABLE IF EXISTS `aulavirtual`.`question_type_blank`;
CREATE TABLE  `aulavirtual`.`question_type_blank` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `quiz_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_type_blank_quiz_id` (`quiz_id`),
  CONSTRAINT `question_type_blank_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`question_type_blank`
--

/*!40000 ALTER TABLE `question_type_blank` DISABLE KEYS */;
LOCK TABLES `question_type_blank` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `question_type_blank` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`question_type_boolean`
--

DROP TABLE IF EXISTS `aulavirtual`.`question_type_boolean`;
CREATE TABLE  `aulavirtual`.`question_type_boolean` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_type_boolean_quiz_id` (`quiz_id`),
  CONSTRAINT `question_type_boolean_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`question_type_boolean`
--

/*!40000 ALTER TABLE `question_type_boolean` DISABLE KEYS */;
LOCK TABLES `question_type_boolean` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `question_type_boolean` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`question_type_multi`
--

DROP TABLE IF EXISTS `aulavirtual`.`question_type_multi`;
CREATE TABLE  `aulavirtual`.`question_type_multi` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `quiz_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_type_multi_quiz_id` (`quiz_id`),
  CONSTRAINT `question_type_multi_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`question_type_multi`
--

/*!40000 ALTER TABLE `question_type_multi` DISABLE KEYS */;
LOCK TABLES `question_type_multi` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `question_type_multi` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`quizzes`
--

DROP TABLE IF EXISTS `aulavirtual`.`quizzes`;
CREATE TABLE  `aulavirtual`.`quizzes` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quizzes_lesson_id` (`lesson_id`),
  CONSTRAINT `quizzes_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`quizzes`
--

/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
LOCK TABLES `quizzes` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`resources`
--

DROP TABLE IF EXISTS `aulavirtual`.`resources`;
CREATE TABLE  `aulavirtual`.`resources` (
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
-- Dumping data for table `aulavirtual`.`resources`
--

/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
LOCK TABLES `resources` WRITE;
INSERT INTO `aulavirtual`.`resources` VALUES  (1,'controller','login',NULL,'',0,1,NULL,'0000-00-00 00:00:00'),
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
-- Definition of table `aulavirtual`.`roles`
--

DROP TABLE IF EXISTS `aulavirtual`.`roles`;
CREATE TABLE  `aulavirtual`.`roles` (
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
-- Dumping data for table `aulavirtual`.`roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
LOCK TABLES `roles` WRITE;
INSERT INTO `aulavirtual`.`roles` VALUES  (1,'Administrator',NULL,'cizacl','',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (2,'Guest',NULL,'home','',1,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (4,'Alumno-Profesor','[\"2\"]','courses/my_courses','',0,999,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`rules`
--

DROP TABLE IF EXISTS `aulavirtual`.`rules`;
CREATE TABLE  `aulavirtual`.`rules` (
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
-- Dumping data for table `aulavirtual`.`rules`
--

/*!40000 ALTER TABLE `rules` DISABLE KEYS */;
LOCK TABLES `rules` WRITE;
INSERT INTO `aulavirtual`.`rules` VALUES  (1,1,'allow','[null]','[null]',1,'',NULL,NULL),
 (12,2,'allow','[\"login\"]','[null]',1,'',NULL,NULL),
 (15,4,'allow','[\"courses\"]','[null]',1,'',NULL,NULL),
 (16,4,'allow','[\"profiles\"]','[null]',1,'',NULL,NULL),
 (17,2,'allow','[\"signin\"]','[null]',1,'',NULL,NULL),
 (18,2,'allow','[\"signup\"]','[null]',1,'',NULL,NULL),
 (19,2,'allow','[\"home\"]','[null]',1,'',NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `rules` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`sessions`
--

DROP TABLE IF EXISTS `aulavirtual`.`sessions`;
CREATE TABLE  `aulavirtual`.`sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `aulavirtual`.`sessions`
--

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
LOCK TABLES `sessions` WRITE;
INSERT INTO `aulavirtual`.`sessions` VALUES  ('000bbf64244e8676bc68d611e0d3b755','127.0.0.1','Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.22 (KHTML, like Gecko) Ubuntu Chromium/25.0.1364.160 Chrome/25.0.1364.160 ',1374565676,'a:8:{s:9:\"user_data\";s:0:\"\";s:9:\"logged_in\";b:1;s:10:\"user_email\";s:22:\"guzmanjhonny@gmail.com\";s:7:\"user_id\";i:10;s:9:\"user_name\";s:6:\"Johnny\";s:12:\"user_surname\";s:6:\"Guzman\";s:15:\"user_lastaccess\";s:19:\"2013-07-22 17:54:29\";s:7:\"role_id\";s:1:\"4\";}');
UNLOCK TABLES;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`status`
--

DROP TABLE IF EXISTS `aulavirtual`.`status`;
CREATE TABLE  `aulavirtual`.`status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `code` tinyint(4) NOT NULL,
  `status_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `aulavirtual`.`status`
--

/*!40000 ALTER TABLE `status` DISABLE KEYS */;
LOCK TABLES `status` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`status_groups`
--

DROP TABLE IF EXISTS `aulavirtual`.`status_groups`;
CREATE TABLE  `aulavirtual`.`status_groups` (
  `id` int(11) DEFAULT NULL,
  `description` varchar(130) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`status_groups`
--

/*!40000 ALTER TABLE `status_groups` DISABLE KEYS */;
LOCK TABLES `status_groups` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `status_groups` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`telephones`
--

DROP TABLE IF EXISTS `aulavirtual`.`telephones`;
CREATE TABLE  `aulavirtual`.`telephones` (
  `id` int(11) NOT NULL,
  `number` varchar(50) NOT NULL,
  `description` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='telefon numbers of the users';

--
-- Dumping data for table `aulavirtual`.`telephones`
--

/*!40000 ALTER TABLE `telephones` DISABLE KEYS */;
LOCK TABLES `telephones` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `telephones` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`testimonies`
--

DROP TABLE IF EXISTS `aulavirtual`.`testimonies`;
CREATE TABLE  `aulavirtual`.`testimonies` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `testimony` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`testimonies`
--

/*!40000 ALTER TABLE `testimonies` DISABLE KEYS */;
LOCK TABLES `testimonies` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `testimonies` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`user_categories`
--

DROP TABLE IF EXISTS `aulavirtual`.`user_categories`;
CREATE TABLE  `aulavirtual`.`user_categories` (
  `id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`user_categories`
--

/*!40000 ALTER TABLE `user_categories` DISABLE KEYS */;
LOCK TABLES `user_categories` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_categories` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`user_preferences`
--

DROP TABLE IF EXISTS `aulavirtual`.`user_preferences`;
CREATE TABLE  `aulavirtual`.`user_preferences` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`user_preferences`
--

/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
LOCK TABLES `user_preferences` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`user_status`
--

DROP TABLE IF EXISTS `aulavirtual`.`user_status`;
CREATE TABLE  `aulavirtual`.`user_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(130) DEFAULT NULL,
  `code` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`user_status`
--

/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;
LOCK TABLES `user_status` WRITE;
INSERT INTO `aulavirtual`.`user_status` VALUES  (1,'enabled',1),
 (2,'disabled',2),
 (3,'blocked',3),
 (4,'waiting confirmation register',4);
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`user_thumbnails`
--

DROP TABLE IF EXISTS `aulavirtual`.`user_thumbnails`;
CREATE TABLE  `aulavirtual`.`user_thumbnails` (
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
-- Dumping data for table `aulavirtual`.`user_thumbnails`
--

/*!40000 ALTER TABLE `user_thumbnails` DISABLE KEYS */;
LOCK TABLES `user_thumbnails` WRITE;
INSERT INTO `aulavirtual`.`user_thumbnails` VALUES  (5,10,'user_thumbnail_10.jpg','42.91','image/jpeg','2013-06-25 00:59:13','2013-06-25 01:12:29');
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_thumbnails` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`users`
--

DROP TABLE IF EXISTS `aulavirtual`.`users`;
CREATE TABLE  `aulavirtual`.`users` (
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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `aulavirtual`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `aulavirtual`.`users` VALUES  (1,'John','Smith','john.smith@example.com',1,1373425800,'0000-00-00 00:00:00','2013-07-10 02:44:06',0,1,NULL,NULL,NULL,NULL,'','','','0000-00-00 00:00:00','admin','21232f297a57a5a743894a0e4a801fc3',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (10,'Johnny','Guzman','guzmanjhonny@gmail.com',1,1374532718,'2013-06-22 00:08:38','2013-07-22 22:38:38',0,1,'Ing. en sistemas',NULL,'apasionado de la informatica',1,'','','','0000-00-00 00:00:00','jhonnyguzman','c6cc8094c2dc07b700ffcc36d64e2138',4,NULL,NULL,'Lb9ecOwMWfgPcmin5neBudcY3ZBP8cRJuQWAYDHFEnO9on9j3bW',NULL,NULL,NULL,NULL),
 (11,'Marcos','Laquaire','marcospreventista@gmail.com',4,NULL,'2013-07-17 22:05:40',NULL,0,NULL,NULL,NULL,NULL,NULL,'','','','0000-00-00 00:00:00','marcos','c5e3539121c4944f2bbe097b425ee774',1,NULL,NULL,'KOjcwhXXnS6YK1vOjh4kYDnMbDmBLkd85ZOm56FEvoYW3b8iNYb',NULL,NULL,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
