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
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_texts_lesson_id` (`lesson_id`),
  CONSTRAINT `content_texts_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`content_texts`
--

/*!40000 ALTER TABLE `content_texts` DISABLE KEYS */;
LOCK TABLES `content_texts` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_texts` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`content_videos`
--

DROP TABLE IF EXISTS `aulavirtual`.`content_videos`;
CREATE TABLE  `aulavirtual`.`content_videos` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `link` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_videos_lesson_id` (`lesson_id`),
  CONSTRAINT `content_videos_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`content_videos`
--

/*!40000 ALTER TABLE `content_videos` DISABLE KEYS */;
LOCK TABLES `content_videos` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_videos` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`course_audiences`
--

DROP TABLE IF EXISTS `aulavirtual`.`course_audiences`;
CREATE TABLE  `aulavirtual`.`course_audiences` (
  `id` int(11) NOT NULL,
  `type_audience` text NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_audiences_course_id` (`course_id`),
  CONSTRAINT `course_audiences_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`course_audiences`
--

/*!40000 ALTER TABLE `course_audiences` DISABLE KEYS */;
LOCK TABLES `course_audiences` WRITE;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`course_categories`
--

/*!40000 ALTER TABLE `course_categories` DISABLE KEYS */;
LOCK TABLES `course_categories` WRITE;
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
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_goals_course_id` (`course_id`),
  CONSTRAINT `course_goals_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`course_goals`
--

/*!40000 ALTER TABLE `course_goals` DISABLE KEYS */;
LOCK TABLES `course_goals` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `course_goals` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`course_requirements`
--

DROP TABLE IF EXISTS `aulavirtual`.`course_requirements`;
CREATE TABLE  `aulavirtual`.`course_requirements` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_requirements_course_id` (`course_id`),
  CONSTRAINT `course_requirements_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`course_requirements`
--

/*!40000 ALTER TABLE `course_requirements` DISABLE KEYS */;
LOCK TABLES `course_requirements` WRITE;
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
  `id` int(11) NOT NULL,
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
  `languaje_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_category_id` (`course_category_id`),
  KEY `courses_course_state_id` (`course_state_id`),
  KEY `courses_language_id` (`languaje_id`),
  CONSTRAINT `courses_language_id` FOREIGN KEY (`languaje_id`) REFERENCES `languages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `courses_course_category_id` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `courses_course_state_id` FOREIGN KEY (`course_state_id`) REFERENCES `course_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`courses`
--

/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
LOCK TABLES `courses` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`curriculums`
--

DROP TABLE IF EXISTS `aulavirtual`.`curriculums`;
CREATE TABLE  `aulavirtual`.`curriculums` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `curriculums_course_id` (`course_id`),
  CONSTRAINT `curriculums_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`curriculums`
--

/*!40000 ALTER TABLE `curriculums` DISABLE KEYS */;
LOCK TABLES `curriculums` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `curriculums` ENABLE KEYS */;


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
  `id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section` (`section_id`),
  CONSTRAINT `section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`lessons`
--

/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
LOCK TABLES `lessons` WRITE;
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `aulavirtual`.`resources`
--

/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
LOCK TABLES `resources` WRITE;
INSERT INTO `aulavirtual`.`resources` VALUES  (1,'controller','login',NULL,'',0,1,NULL,'0000-00-00 00:00:00'),
 (2,'controller','cizacl',NULL,NULL,0,NULL,'0000-00-00 00:00:00',NULL),
 (6,'controller','welcome',NULL,'controlador de bienvenida',0,1,NULL,NULL),
 (7,'function','welcome','test','funcion  de prueba',0,NULL,NULL,NULL),
 (8,'controller','main',NULL,'controlador principal de administración una vez que el usuario se autentifica',1,NULL,'0000-00-00 00:00:00',NULL);
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
 (2,'Guest',NULL,'login','',1,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (4,'Alumno','[\"2\"]','main','',0,999,NULL,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `aulavirtual`.`rules`
--

/*!40000 ALTER TABLE `rules` DISABLE KEYS */;
LOCK TABLES `rules` WRITE;
INSERT INTO `aulavirtual`.`rules` VALUES  (1,1,'allow','[null]','[null]',1,'',NULL,NULL),
 (12,2,'allow','[\"login\"]','[null]',1,'',NULL,NULL),
 (13,4,'allow','[\"main\"]','[null]',1,'',NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `rules` ENABLE KEYS */;


--
-- Definition of table `aulavirtual`.`sections`
--

DROP TABLE IF EXISTS `aulavirtual`.`sections`;
CREATE TABLE  `aulavirtual`.`sections` (
  `id` int(11) NOT NULL,
  `curriculum_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sections_curriculum_id` (`curriculum_id`),
  CONSTRAINT `sections_curriculum_id` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculums` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aulavirtual`.`sections`
--

/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
LOCK TABLES `sections` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;


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
INSERT INTO `aulavirtual`.`sessions` VALUES  ('6719a401756328ebaab93f2ad8553d15','127.0.0.1','Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.22 (KHTML, like Gecko) Ubuntu Chromium/25.0.1364.160 Chrome/25.0.1364.160 ',1372123336,'a:7:{s:9:\"logged_in\";b:1;s:10:\"user_email\";s:22:\"guzmanjhonny@gmail.com\";s:7:\"user_id\";i:10;s:9:\"user_name\";s:6:\"Johnny\";s:12:\"user_surname\";s:6:\"Guzman\";s:15:\"user_lastaccess\";s:19:\"2013-06-22 23:42:02\";s:7:\"role_id\";s:1:\"1\";}');
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `aulavirtual`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `aulavirtual`.`users` VALUES  (1,'John','Smith','john.smith@example.com',1,1372088398,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,NULL,NULL,NULL,NULL,'','','','0000-00-00 00:00:00','admin','21232f297a57a5a743894a0e4a801fc3',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (10,'Johnny','Guzman','guzmanjhonny@gmail.com',1,1372108977,'2013-06-22 00:08:38','2013-06-24 22:35:51',0,NULL,'Ing. en sistemas',NULL,'apasionado de la informatica',1,'','','','0000-00-00 00:00:00','jhonnyguzman','c6cc8094c2dc07b700ffcc36d64e2138',1,NULL,NULL,'Lb9ecOwMWfgPcmin5neBudcY3ZBP8cRJuQWAYDHFEnO9on9j3bW',NULL,NULL,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
