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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
INSERT INTO `aulavirtual`.`chapters` VALUES  (1,3,'¿Qué es PHP?',NULL,1,NULL,'2013-07-15 23:34:44','2013-07-17 07:35:13'),
 (2,3,'Introducción',NULL,0,NULL,'2013-07-15 23:34:52','2013-07-17 07:35:12'),
 (3,3,'Historia',NULL,2,NULL,'2013-07-15 23:35:00','2013-07-17 07:35:13'),
 (4,3,'Variables',NULL,3,NULL,'2013-07-15 23:35:06','2013-07-17 07:35:13'),
 (5,3,'Tipos de datos',NULL,4,NULL,'2013-07-15 23:35:15','2013-07-17 07:35:13'),
 (6,3,'Sentencias condicionales',NULL,5,NULL,'2013-07-15 23:35:25','2013-07-17 07:35:13'),
 (7,3,'Ciclos',NULL,6,NULL,'2013-07-15 23:35:33','2013-07-17 07:35:13'),
 (8,3,'Entrada/Salida',NULL,7,NULL,'2013-07-15 23:35:52','2013-07-17 07:35:13'),
 (9,3,'Archivos',NULL,8,NULL,'2013-07-15 23:36:21','2013-07-17 07:35:13'),
 (10,6,'Qués es Java',NULL,1,NULL,'2013-07-17 08:18:23',NULL);
CREATE TABLE  `aulavirtual`.`content_audios` (
  `id` int(11) NOT NULL,
  `link` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_audios_lesson_id` (`lesson_id`),
  CONSTRAINT `content_audios_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE  `aulavirtual`.`content_documents` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `document` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lcontent_documents_lesson_id` (`lesson_id`),
  CONSTRAINT `lcontent_documents_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
INSERT INTO `aulavirtual`.`content_texts` VALUES  (4,'\n   \n   \n   \n   \n   \n   \n   &lt;p style=&quot;margin-bottom: 14px; text-align: justify; line-height: 14px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;b&gt;&lt;i&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras consequat est sit amet orci suscipit sollicitudin. Nullam accumsan felis risus, a posuere est adipiscing sit amet. Nulla auctor mauris non erat molestie faucibus. Quisque a tempor felis, ut ultrices elit. Ut venenatis venenatis erat, vel eleifend mauris venenatis at. Fusce vitae risus felis. Curabitur vitae nisi leo. Sed erat elit, pretium sit amet purus ut, consectetur fringilla ante. Vivamus faucibus, neque a feugiat pulvinar, nulla arcu eleifend nisi, quis dapibus erat dolor sed augue. Aenean scelerisque ante vel lectus feugiat sollicitudin. Suspendisse a sodales ipsum. Curabitur ultricies laoreet rhoncus. Maecenas id laoreet tortor, ut elementum elit. Suspendisse elit metus, bibendum sit amet odio ut, tedsdsdmpus ornare ipsum. &amp;nbsp; sdsdsdsddsdsdsds &amp;nbsp;sdsdsd&lt;/i&gt;&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 14px; text-align: justify; line-height: 14px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;b&gt;&lt;i&gt;In varius ipsum vitae rutrum porttitor. Vestibulum ullamcorper orci at urna ornare porttitor. Sed varius nunc vitae dignissim sodales. Ut cursus odio vitae feugiat ornare. Aliquam feugiat ac tortor eu bibendum. Sed vitae dolor nisl. Phasellus lectus risus, pharetra nec pellentesque non, imperdiet nec velit. Ut id elit lacus. Sed interdum risus ac luctus aliquam. Mauris dictum, sapien eu suscipit cursus, velit risus eleifend lectus, et hendrerit mauris dui ut turpis. Proin eu lorem ac elit porttitor semper. Maecenas tristique dapibus urna non malesuada.&lt;/i&gt;&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 14px; text-align: justify; line-height: 14px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;b&gt;&lt;i&gt;Curabitur id sollicitudin neque, ut cursus diam. Suspendisse ullamcorper nulla sit amet porta consectetur. Morbi vitae ullamcorper neque. Etiam rutrum velit a dolor sodales porta. Integer elementum, mauris ut sollicitudin aliquam, nibh nisi rutrum lectus, ac mollis ante velit vulputate sapien. Donec congue id enim a consectetur. Quisque ipsum odio, scelerisque at neque in, tincidunt eleifend nunc. Nullam et nisl euismod, eleifend nisl tempus, placerat nunc. Phasellus ac nunc vestibulum, luctus enim a, egestas turpis.&lt;/i&gt;&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 14px; text-align: justify; line-height: 14px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;b&gt;&lt;i&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in neque id ipsum interdum sodales. Phasellus est augue, ultricies nec erat ut, dictum sagittis ipsum. Nullam quis dolor erat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse at fermentum felis. Integer fermentum venenatis tellus, venenatis sodales purus rhoncus vitae.&lt;/i&gt;&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 14px; text-align: justify; line-height: 14px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;b&gt;&lt;i&gt;In felis nibh, adipiscing in ante nec, dignissim feugiat risus. Nam eu faucibus enim. Nam in eleifend massa. Integer bibendum, turpis at vehicula venenatis, quam ligula consequat urna, eget adipiscing ipsum quam nec ligula. Proin egestas interdum tempor. Etiam non velit bibendum, iaculis libero quis, viverra elit. Proin euismod condimentum enim a adipiscing. Pellentesque dolor nibh, venenatis eu ultricies vitae, posuere non augue. Curabitur tempor quis quam non fringilla. Nulla facilisi. Aenean eros lectus, facilisis vel blandit sed, mattis eget dolor. Sed in dignissim magna, ut ullamcorper massa. Sed accumsan, ipsum nec egestas luctus, erat erat scelerisque leo, in tempor neque lorem et ante. Aliquam erat volutpat. Nunc mi lectus, pretium quis sagittis in, auctor ac magna. Quisque mollis ipsum lacinia, tempor neque id, imperdiet tortor.&lt;/i&gt;&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;              ',21,NULL,NULL,'2013-07-16 03:35:50','2013-07-17 19:29:41'),
 (5,'\n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   \n   &lt;p style=&quot;margin-bottom: 14px; text-align: justify; line-height: 14px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;b&gt;&lt;i&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras consequat est sit amet orci suscipit sollicitudin. Nullam accumsan felis risus, a posuere est adipiscing sit amet. Nulla auctor mauris non erat molestie faucibus. Quisque a tempor felis, ut ultrices elit. Ut venenatis venenatis erat, vel eleifend mauris venenatis at. Fusce vitae risus felis. Curabitur vitae nisi leo. Sed erat elit, pretium sit amet purus ut, consectetur fringilla ante. Vivamus faucibus, neque a feugiat pulvinar, nulla arcu eleifend nisi, quis dapibus erat dolor sed augue. Aenean scelerisque ante vel lectus feugiat sollicitudin. Suspendisse a sodales ipsum. Curabitur ultricies laoreet rhoncus. Maecenas id laoreet tortor, ut elementum elit. Suspendisse elit metus, bibendum sit amet odio ut, tempus ornare ipsum.&lt;/i&gt;&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 14px; text-align: justify; line-height: 14px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;b&gt;&lt;i&gt;In varius ipsum vitae rutrum porttitor. Vestibulum ullamcorper orci at urna ornare porttitor. Sed varius nunc vitae dignissim sodales. Ut cursus odio vitae feugiat ornare. Aliquam feugiat ac tortor eu bibendum. Sed vitae dolor nisl. Phasellus lectus risus, pharetra nec pellentesque non, imperdiet nec velit. Ut id elit lacus. Sed interdum risus ac luctus aliquam. Mauris dictum, sapien eu suscipit cursus, velit risus eleifend lectus, et hendrerit mauris dui ut turpis. Proin eu lorem ac elit porttitor semper. Maecenas tristique dapibus urna non malesuada.&lt;/i&gt;&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; margin-bottom: 14px; line-height: 14px; padding: 0px;&quot;&gt;&lt;font size=&quot;5&quot; color=&quot;#16a765&quot;&gt;&lt;b&gt;dsdsdsdsd &amp;nbsp;sdsdsdd&lt;/b&gt;&lt;/font&gt;&lt;/p&gt;                                          ',22,NULL,NULL,'2013-07-16 03:36:07','2013-07-17 08:13:17');
CREATE TABLE  `aulavirtual`.`content_videos` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `link` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_videos_lesson_id` (`lesson_id`),
  CONSTRAINT `content_videos_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
INSERT INTO `aulavirtual`.`course_audiences` VALUES  (39,'Personas apasionadas por la programacin',6,'2013-07-10 03:51:49',NULL),
 (40,'Jovenes pasionales',6,'2013-07-10 03:51:49',NULL),
 (41,'audiencia 1',3,'2013-07-17 08:11:10',NULL),
 (42,'audiencia 2',3,'2013-07-17 08:11:10',NULL),
 (43,'audiencia 3',3,'2013-07-17 08:11:10',NULL);
CREATE TABLE  `aulavirtual`.`course_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
INSERT INTO `aulavirtual`.`course_goals` VALUES  (52,'Meta 1',6,'2013-07-10 03:51:49',NULL),
 (53,'Meta 2',6,'2013-07-10 03:51:49',NULL),
 (54,'Objetivo 1',6,'2013-07-10 03:51:49',NULL),
 (55,'meta 3',3,'2013-07-17 08:11:09',NULL),
 (56,'meta 1',3,'2013-07-17 08:11:09',NULL),
 (57,'meta 2',3,'2013-07-17 08:11:09',NULL),
 (58,'dsd',3,'2013-07-17 08:11:09',NULL);
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
INSERT INTO `aulavirtual`.`course_requirements` VALUES  (33,'Nivel medio de Java',6,'2013-07-10 03:51:49',NULL),
 (34,'requisito 1',3,'2013-07-17 08:11:10',NULL);
CREATE TABLE  `aulavirtual`.`course_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(130) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
INSERT INTO `aulavirtual`.`course_thumbnails` VALUES  (2,3,'course_thumbnail_3.jpg','43.38','image/jpeg','2013-06-27 05:46:58','2013-06-27 05:59:33'),
 (3,6,'course_thumbnail_6.jpg','46.03','image/jpeg','2013-07-10 03:53:14',NULL);
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
INSERT INTO `aulavirtual`.`courses` VALUES  (3,NULL,NULL,NULL,201,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,10,'2013-06-25 15:52:46','2013-07-17 08:11:09','Programacion en PHP','Guía alfabética para crear imágenes y clips asombrosos con la versión más reciente del software favorito del sector.','photoshop, adobe premier, gimp','0','0'),
 (4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2013-06-25 20:53:13',NULL,'Programacion en JAVA',NULL,NULL,NULL,NULL),
 (5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-06-27 06:35:44',NULL,'Diseña Grafico en Photoshop',NULL,NULL,NULL,NULL),
 (6,NULL,NULL,NULL,1000,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,10,'2013-07-10 03:48:42','2013-07-10 03:56:35','Programacion en Java','Programación avanzada en el lenguaje de programación orientado a objetos Java.','java, clases, objetos, programacion, web','0','0');
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
CREATE TABLE  `aulavirtual`.`entry_control` (
  `id` int(10) unsigned NOT NULL,
  `last_entry` datetime NOT NULL,
  `session_length` int(11) NOT NULL COMMENT 'who much time what activ the session of the user',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='entry control of the system';
CREATE TABLE  `aulavirtual`.`languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
INSERT INTO `aulavirtual`.`languages` VALUES  (1,'Español'),
 (2,'Inglés'),
 (3,'Portugués'),
 (4,'Alemán'),
 (5,'Italiano'),
 (6,'Francés');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
INSERT INTO `aulavirtual`.`lessons` VALUES  (21,'Inicios',NULL,0,NULL,'2013-07-15 23:45:58','2013-07-17 08:16:36',1),
 (22,'PHP en la Web',NULL,1,NULL,'2013-07-15 23:46:05','2013-07-17 08:16:36',1),
 (23,'PHP como lenguaje de referencia',NULL,2,NULL,'2013-07-16 03:37:35','2013-07-17 08:16:36',1),
 (24,'Java',NULL,0,NULL,'2013-07-17 08:18:37',NULL,10);
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
CREATE TABLE  `aulavirtual`.`notifications` (
  `id` int(10) unsigned NOT NULL,
  `description` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE  `aulavirtual`.`question_answer` (
  `id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `correct` tinyint(1) NOT NULL,
  `question_type_multi_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answer` (`question_type_multi_id`),
  CONSTRAINT `answer` FOREIGN KEY (`question_type_multi_id`) REFERENCES `question_type_multi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE  `aulavirtual`.`question_type_blank` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `quiz_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_type_blank_quiz_id` (`quiz_id`),
  CONSTRAINT `question_type_blank_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE  `aulavirtual`.`question_type_boolean` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_type_boolean_quiz_id` (`quiz_id`),
  CONSTRAINT `question_type_boolean_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE  `aulavirtual`.`question_type_multi` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `quiz_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_type_multi_quiz_id` (`quiz_id`),
  CONSTRAINT `question_type_multi_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE  `aulavirtual`.`quizzes` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quizzes_lesson_id` (`lesson_id`),
  CONSTRAINT `quizzes_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
INSERT INTO `aulavirtual`.`roles` VALUES  (1,'Administrator',NULL,'cizacl','',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (2,'Guest',NULL,'home','',1,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (4,'Alumno-Profesor','[\"2\"]','courses/my_courses','',0,999,NULL,NULL);
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
INSERT INTO `aulavirtual`.`rules` VALUES  (1,1,'allow','[null]','[null]',1,'',NULL,NULL),
 (12,2,'allow','[\"login\"]','[null]',1,'',NULL,NULL),
 (15,4,'allow','[\"courses\"]','[null]',1,'',NULL,NULL),
 (16,4,'allow','[\"profiles\"]','[null]',1,'',NULL,NULL),
 (17,2,'allow','[\"signin\"]','[null]',1,'',NULL,NULL),
 (18,2,'allow','[\"signup\"]','[null]',1,'',NULL,NULL),
 (19,2,'allow','[\"home\"]','[null]',1,'',NULL,NULL);
CREATE TABLE  `aulavirtual`.`sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
INSERT INTO `aulavirtual`.`sessions` VALUES  ('70aa51be3ee047e5d44577807ca221d6','127.0.0.1','Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.22 (KHTML, like Gecko) Ubuntu Chromium/25.0.1364.160 Chrome/25.0.1364.160 ',1374049103,'a:8:{s:9:\"user_data\";s:0:\"\";s:9:\"logged_in\";b:1;s:10:\"user_email\";s:22:\"guzmanjhonny@gmail.com\";s:7:\"user_id\";i:10;s:9:\"user_name\";s:6:\"Johnny\";s:12:\"user_surname\";s:6:\"Guzman\";s:15:\"user_lastaccess\";s:19:\"2013-07-15 19:18:22\";s:7:\"role_id\";s:1:\"4\";}'),
 ('f189c8c576bb804825fcff11b7365a63','127.0.0.1','Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.22 (KHTML, like Gecko) Ubuntu Chromium/25.0.1364.160 Chrome/25.0.1364.160 ',1374089329,'a:7:{s:9:\"logged_in\";b:1;s:10:\"user_email\";s:22:\"guzmanjhonny@gmail.com\";s:7:\"user_id\";i:10;s:9:\"user_name\";s:6:\"Johnny\";s:12:\"user_surname\";s:6:\"Guzman\";s:15:\"user_lastaccess\";s:19:\"2013-07-17 03:34:08\";s:7:\"role_id\";s:1:\"4\";}');
CREATE TABLE  `aulavirtual`.`status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `code` tinyint(4) NOT NULL,
  `status_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE  `aulavirtual`.`status_groups` (
  `id` int(11) DEFAULT NULL,
  `description` varchar(130) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE  `aulavirtual`.`telephones` (
  `id` int(11) NOT NULL,
  `number` varchar(50) NOT NULL,
  `description` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='telefon numbers of the users';
CREATE TABLE  `aulavirtual`.`testimonies` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `testimony` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE  `aulavirtual`.`user_categories` (
  `id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE  `aulavirtual`.`user_preferences` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE  `aulavirtual`.`user_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(130) DEFAULT NULL,
  `code` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
INSERT INTO `aulavirtual`.`user_status` VALUES  (1,'enabled',1),
 (2,'disabled',2),
 (3,'blocked',3),
 (4,'waiting confirmation register',4);
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
INSERT INTO `aulavirtual`.`user_thumbnails` VALUES  (5,10,'user_thumbnail_10.jpg','42.91','image/jpeg','2013-06-25 00:59:13','2013-06-25 01:12:29');
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
INSERT INTO `aulavirtual`.`users` VALUES  (1,'John','Smith','john.smith@example.com',1,1373425800,'0000-00-00 00:00:00','2013-07-10 02:44:06',0,1,NULL,NULL,NULL,NULL,'','','','0000-00-00 00:00:00','admin','21232f297a57a5a743894a0e4a801fc3',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (10,'Johnny','Guzman','guzmanjhonny@gmail.com',1,1374089336,'2013-06-22 00:08:38','2013-07-17 19:28:56',0,1,'Ing. en sistemas',NULL,'apasionado de la informatica',1,'','','','0000-00-00 00:00:00','jhonnyguzman','c6cc8094c2dc07b700ffcc36d64e2138',4,NULL,NULL,'Lb9ecOwMWfgPcmin5neBudcY3ZBP8cRJuQWAYDHFEnO9on9j3bW',NULL,NULL,NULL,NULL);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
