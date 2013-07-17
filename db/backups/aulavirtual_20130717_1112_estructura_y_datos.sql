-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 17-07-2013 a las 14:08:31
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `aulavirtual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adresses`
--

CREATE TABLE IF NOT EXISTS `adresses` (
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chapters`
--

CREATE TABLE IF NOT EXISTS `chapters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `order` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sections_course_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `chapters`
--

INSERT INTO `chapters` (`id`, `course_id`, `name`, `description`, `order`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 3, 'Introduccion', NULL, 0, NULL, '2013-07-08 21:57:49', '2013-07-10 00:24:02'),
(2, 3, 'Instalaci?n', NULL, 2, NULL, '2013-07-08 21:59:22', '2013-07-10 00:24:02'),
(10, 3, 'Variables', NULL, 1, NULL, '2013-07-09 00:38:08', '2013-07-10 00:24:02'),
(11, 3, 'Condicionales', NULL, 7, NULL, '2013-07-09 00:46:57', '2013-07-10 00:24:03'),
(21, 3, 'Bucles', NULL, 3, NULL, '2013-07-09 03:04:32', '2013-07-10 00:24:02'),
(22, 3, 'Archivos', NULL, 5, NULL, '2013-07-09 03:07:58', '2013-07-10 00:24:02'),
(25, 3, 'Clases', NULL, 6, NULL, '2013-07-09 07:14:15', '2013-07-10 00:24:03'),
(26, 3, 'Objetos', NULL, 8, NULL, '2013-07-09 07:14:22', '2013-07-10 00:24:03'),
(27, 3, 'Errores', NULL, 4, NULL, '2013-07-09 07:15:04', '2013-07-10 00:24:02'),
(28, 6, 'Introduccion', NULL, 1, NULL, '2013-07-10 03:53:27', NULL),
(29, 6, 'Historia de Java', NULL, 2, NULL, '2013-07-10 03:53:38', NULL),
(30, 6, 'Requisitos e Instalaci?n', NULL, 3, NULL, '2013-07-10 03:54:00', NULL),
(31, 6, 'Comenzando', NULL, 4, NULL, '2013-07-10 03:54:10', NULL),
(32, 6, 'Variables', NULL, 5, NULL, '2013-07-10 03:54:20', NULL),
(33, 7, 'Introduccion', NULL, 0, NULL, '2013-07-17 10:41:01', '2013-07-17 10:42:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content_audios`
--

CREATE TABLE IF NOT EXISTS `content_audios` (
  `id` int(11) NOT NULL,
  `link` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_audios_lesson_id` (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content_documents`
--

CREATE TABLE IF NOT EXISTS `content_documents` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `document` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lcontent_documents_lesson_id` (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content_images`
--

CREATE TABLE IF NOT EXISTS `content_images` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `image` blob NOT NULL,
  `link` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_images_lesson_id` (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content_presentations`
--

CREATE TABLE IF NOT EXISTS `content_presentations` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `prestentation` text NOT NULL,
  `link` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_presentations_lesson_id` (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content_texts`
--

CREATE TABLE IF NOT EXISTS `content_texts` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_texts_lesson_id` (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `content_texts`
--

INSERT INTO `content_texts` (`id`, `text`, `lesson_id`) VALUES
(0, '', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content_videos`
--

CREATE TABLE IF NOT EXISTS `content_videos` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `link` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_videos_lesson_id` (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
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
  KEY `courses_language_id` (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `concurrence`, `price`, `course_category_id`, `hours`, `timing`, `cost`, `discount`, `promo_date_to`, `quota`, `course_state_id`, `language_id`, `owner_id`, `created_at`, `updated_at`, `title`, `subtitle`, `keywords`, `summary`, `instruction`) VALUES
(3, NULL, NULL, NULL, 201, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 10, '2013-06-25 15:52:46', '2013-07-10 00:32:46', 'Programacion en PHP', 'Gu?a alfab?tica para crear im?genes y clips asombrosos con la versi?n m?s reciente del software favorito del sector.', 'photoshop, adobe premier, gimp', '0', '0'),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2013-06-25 20:53:13', NULL, 'Programacion en JAVA', NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2013-06-27 06:35:44', NULL, 'Dise?a Grafico en Photoshop', NULL, NULL, NULL, NULL),
(6, NULL, NULL, NULL, 1000, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, '2013-07-10 03:48:42', '2013-07-10 03:56:35', 'Programacion en Java', 'Programaci?n avanzada en el lenguaje de programaci?n orientado a objetos Java.', 'java, clases, objetos, programacion, web', '0', '0'),
(7, NULL, NULL, NULL, 455, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 11, '2013-07-17 10:40:45', '2013-07-17 11:43:50', 'Comandos GIT', 'Este es un curso para aprender comandos basicos de git', 'git, comandos', '0', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_audiences`
--

CREATE TABLE IF NOT EXISTS `course_audiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `course_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_audiences_course_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Volcado de datos para la tabla `course_audiences`
--

INSERT INTO `course_audiences` (`id`, `description`, `course_id`, `created_at`, `updated_at`) VALUES
(36, 'audiencia 1', 3, '2013-07-08 19:26:43', NULL),
(37, 'audiencia 2', 3, '2013-07-08 19:26:43', NULL),
(38, 'audiencia 3', 3, '2013-07-08 19:26:43', NULL),
(39, 'Personas apasionadas por la programacin', 6, '2013-07-10 03:51:49', NULL),
(40, 'Jovenes pasionales', 6, '2013-07-10 03:51:49', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_categories`
--

CREATE TABLE IF NOT EXISTS `course_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `course_categories`
--

INSERT INTO `course_categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Tecnolog?a', '', NULL, NULL),
(2, 'Negocios', '', NULL, NULL),
(3, 'Dise?o', '', NULL, NULL),
(4, 'Arte y Fotograf?a', '', NULL, NULL),
(5, 'Salud', '', NULL, NULL),
(6, 'Matem?ticaas y Cienc', '', NULL, NULL),
(7, 'Educaci?n', '', NULL, NULL),
(8, 'Idiomas', '', NULL, NULL),
(9, 'Humanidades', '', NULL, NULL),
(10, 'Ciencias Sociales', '', NULL, NULL),
(11, 'M?sica', '', NULL, NULL),
(12, 'Deportes', '', NULL, NULL),
(13, 'Juegos', '', NULL, NULL),
(14, 'Otros', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_faqs`
--

CREATE TABLE IF NOT EXISTS `course_faqs` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_faqs_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_goals`
--

CREATE TABLE IF NOT EXISTS `course_goals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_goals_course_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

--
-- Volcado de datos para la tabla `course_goals`
--

INSERT INTO `course_goals` (`id`, `description`, `course_id`, `created_at`, `updated_at`) VALUES
(48, 'meta 3', 3, '2013-07-08 19:26:43', NULL),
(49, 'meta 1', 3, '2013-07-08 19:26:43', NULL),
(50, 'meta 2', 3, '2013-07-08 19:26:43', NULL),
(51, 'dsd', 3, '2013-07-08 19:26:43', NULL),
(52, 'Meta 1', 6, '2013-07-10 03:51:49', NULL),
(53, 'Meta 2', 6, '2013-07-10 03:51:49', NULL),
(54, 'Objetivo 1', 6, '2013-07-10 03:51:49', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_requirements`
--

CREATE TABLE IF NOT EXISTS `course_requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_requirements_course_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `course_requirements`
--

INSERT INTO `course_requirements` (`id`, `description`, `course_id`, `created_at`, `updated_at`) VALUES
(30, 'requisito 1', 3, '2013-07-08 19:26:43', NULL),
(31, 'requisito 2', 3, '2013-07-08 19:26:43', NULL),
(32, 'err', 3, '2013-07-08 19:26:43', NULL),
(33, 'Nivel medio de Java', 6, '2013-07-10 03:51:49', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_status`
--

CREATE TABLE IF NOT EXISTS `course_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(130) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_thumbnails`
--

CREATE TABLE IF NOT EXISTS `course_thumbnails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `file_name` text,
  `file_size` varchar(50) DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_thumbnails_course_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `course_thumbnails`
--

INSERT INTO `course_thumbnails` (`id`, `course_id`, `file_name`, `file_size`, `file_type`, `created_at`, `updated_at`) VALUES
(2, 3, 'course_thumbnail_3.jpg', '43.38', 'image/jpeg', '2013-06-27 05:46:58', '2013-06-27 05:59:33'),
(3, 6, 'course_thumbnail_6.jpg', '46.03', 'image/jpeg', '2013-07-10 03:53:14', NULL),
(4, 7, 'course_thumbnail_7.png', '4.76', 'image/png', '2013-07-17 11:50:25', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_users`
--

CREATE TABLE IF NOT EXISTS `course_users` (
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
  KEY `course_users_user_category_id` (`user_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `course_users`
--

INSERT INTO `course_users` (`id`, `course_id`, `user_id`, `observations`, `status`, `testimony`, `user_category_id`, `created_at`, `updated_at`) VALUES
(1, 6, 11, 'Curso numero 6 ', 0, 'perfeckt', 1, '2013-07-17 00:00:00', NULL),
(2, 4, 11, 'Campo Obsertations: Aqui va algo', 1, 'Testimonio o algo.', 1, '2013-07-17 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curriculums`
--

CREATE TABLE IF NOT EXISTS `curriculums` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `curriculums_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despatchs`
--

CREATE TABLE IF NOT EXISTS `despatchs` (
  `id` int(11) NOT NULL,
  `delivery_day` datetime NOT NULL,
  `receipt_day` datetime NOT NULL,
  `signature` tinyint(1) NOT NULL,
  `receiver` varchar(25) NOT NULL,
  `comments` varchar(50) NOT NULL,
  `addres_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `despatchs_adress_id` (`addres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This are the despatchs of the diplom or certificate';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entry_control`
--

CREATE TABLE IF NOT EXISTS `entry_control` (
  `id` int(10) unsigned NOT NULL,
  `last_entry` datetime NOT NULL,
  `session_length` int(11) NOT NULL COMMENT 'who much time what activ the session of the user',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='entry control of the system';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `languages`
--

INSERT INTO `languages` (`id`, `name`) VALUES
(1, 'Espa?ol'),
(2, 'Ingl?s'),
(3, 'Portugu?s'),
(4, 'Alem?n'),
(5, 'Italiano'),
(6, 'Franc?s');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lessons`
--

CREATE TABLE IF NOT EXISTS `lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chapter_id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `order` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `section` (`chapter_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `lessons`
--

INSERT INTO `lessons` (`id`, `chapter_id`, `name`, `description`, `order`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 10, 'Tipos', NULL, 1, 0, '2013-07-09 21:30:29', '2013-07-10 01:01:35'),
(2, 10, 'Ambitos', NULL, 3, NULL, '2013-07-09 22:12:53', '2013-07-10 01:01:36'),
(3, 10, 'Strings', NULL, 0, NULL, '2013-07-09 22:14:03', '2013-07-10 01:01:35'),
(4, 10, 'Enteros', NULL, 4, NULL, '2013-07-09 22:14:12', '2013-07-10 01:01:36'),
(5, 10, 'Booleanos', NULL, 2, NULL, '2013-07-09 22:14:27', '2013-07-10 01:01:36'),
(8, 1, 'Que es PHP', NULL, 2, NULL, '2013-07-09 23:32:09', '2013-07-10 01:02:16'),
(9, 1, 'Historia', NULL, 1, NULL, '2013-07-09 23:32:22', '2013-07-10 01:02:16'),
(10, 1, 'Evoluci?n', NULL, 0, NULL, '2013-07-09 23:44:01', '2013-07-10 01:02:16'),
(11, 28, '?Qu? es Java?', NULL, 0, NULL, '2013-07-10 03:55:23', NULL),
(12, 28, 'Java en la comunidad', NULL, 0, NULL, '2013-07-10 03:55:50', NULL),
(13, 28, 'Java como lenguaje de las corporaciones', NULL, 0, NULL, '2013-07-10 03:56:04', NULL),
(14, 33, 'Configuracion', NULL, 0, NULL, '2013-07-17 10:41:31', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_files`
--

CREATE TABLE IF NOT EXISTS `material_files` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `link` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `material_files_lesson_id` (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(10) unsigned NOT NULL,
  `description` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `question_answer`
--

CREATE TABLE IF NOT EXISTS `question_answer` (
  `id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `correct` tinyint(1) NOT NULL,
  `question_type_multi_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answer` (`question_type_multi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `question_type_blank`
--

CREATE TABLE IF NOT EXISTS `question_type_blank` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `quiz_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_type_blank_quiz_id` (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `question_type_boolean`
--

CREATE TABLE IF NOT EXISTS `question_type_boolean` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_type_boolean_quiz_id` (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `question_type_multi`
--

CREATE TABLE IF NOT EXISTS `question_type_multi` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `quiz_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_type_multi_quiz_id` (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quizzes`
--

CREATE TABLE IF NOT EXISTS `quizzes` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quizzes_lesson_id` (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resources`
--

CREATE TABLE IF NOT EXISTS `resources` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `resources`
--

INSERT INTO `resources` (`id`, `type`, `resource_controller`, `resource_function`, `description`, `added_by`, `edited_by`, `added_on`, `edited_on`) VALUES
(1, 'controller', 'login', NULL, '', 0, 1, NULL, '0000-00-00 00:00:00'),
(2, 'controller', 'cizacl', NULL, NULL, 0, NULL, '0000-00-00 00:00:00', NULL),
(6, 'controller', 'welcome', NULL, 'controlador de bienvenida', 0, 1, NULL, NULL),
(7, 'function', 'welcome', 'test', 'funcion  de prueba', 0, NULL, NULL, NULL),
(19, 'function', 'courses', 'my_courses', '', 1, NULL, '0000-00-00 00:00:00', NULL),
(9, 'controller', 'courses', NULL, 'controlador de cursos', 10, NULL, '0000-00-00 00:00:00', NULL),
(10, 'controller', 'profiles', NULL, 'Controlador de perfiles', 10, NULL, '0000-00-00 00:00:00', NULL),
(11, 'controller', 'signin', NULL, 'controlador para loguearse', 10, NULL, '0000-00-00 00:00:00', NULL),
(12, 'controller', 'signup', NULL, 'controlador para registro de usuario', 10, NULL, '0000-00-00 00:00:00', NULL),
(13, 'controller', 'user_thumbnail', NULL, 'controlador para cargar imagen de perfil de usuario', 10, NULL, '0000-00-00 00:00:00', NULL),
(14, 'controller', 'home', NULL, 'controlador para visualizar landing page', 10, NULL, '0000-00-00 00:00:00', NULL),
(15, 'function', 'courses', 'get_my_courses', 'funcion para mostrar los curso que esta ofreciendo y siguiendo cada usuairo', 10, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `inherit_id`, `redirect`, `description`, `default`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', NULL, 'cizacl', '', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Guest', NULL, 'home', '', 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Alumno-Profesor', '["2"]', 'courses/my_courses', '', 0, 999, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rules`
--

CREATE TABLE IF NOT EXISTS `rules` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `rules`
--

INSERT INTO `rules` (`id`, `role_id`, `type`, `resource_controller`, `resource_function`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'allow', '[null]', '[null]', 1, '', NULL, NULL),
(12, 2, 'allow', '["login"]', '[null]', 1, '', NULL, NULL),
(15, 4, 'allow', '["courses"]', '[null]', 1, '', NULL, NULL),
(16, 4, 'allow', '["profiles"]', '[null]', 1, '', NULL, NULL),
(17, 2, 'allow', '["signin"]', '[null]', 1, '', NULL, NULL),
(18, 2, 'allow', '["signup"]', '[null]', 1, '', NULL, NULL),
(19, 2, 'allow', '["home"]', '[null]', 1, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
  `id` int(11) NOT NULL,
  `curriculum_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sections_curriculum_id` (`curriculum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('f6499baf96beff198fe2b378dbffd98f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.72 Safari/537.36', 1374068178, 'a:8:{s:9:"user_data";s:0:"";s:9:"logged_in";b:1;s:10:"user_email";s:20:"esteban.jr@gmail.com";s:7:"user_id";i:11;s:9:"user_name";s:6:"walter";s:12:"user_surname";s:12:"juarez rivas";s:15:"user_lastaccess";s:19:"2013-07-16 13:09:27";s:7:"role_id";s:1:"4";}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `code` tinyint(4) NOT NULL,
  `status_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_groups`
--

CREATE TABLE IF NOT EXISTS `status_groups` (
  `id` int(11) DEFAULT NULL,
  `description` varchar(130) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telephones`
--

CREATE TABLE IF NOT EXISTS `telephones` (
  `id` int(11) NOT NULL,
  `number` varchar(50) NOT NULL,
  `description` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='telefon numbers of the users';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testimonies`
--

CREATE TABLE IF NOT EXISTS `testimonies` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `testimony` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `email`, `user_status_code`, `lastaccess`, `added`, `edited`, `added_by`, `edited_by`, `desingnation`, `subtitle`, `biography`, `language_id`, `gender`, `dni`, `studies`, `first_entry`, `username`, `password`, `role_id`, `auth`, `date`, `activationcode`, `tokenforgotpassword`, `movil_tel`, `home_tel`, `observations`) VALUES
(1, 'John', 'Smith', 'john.smith@example.com', 1, 1373425800, '0000-00-00 00:00:00', '2013-07-10 02:44:06', 0, 1, NULL, NULL, NULL, NULL, '', '', '', '0000-00-00 00:00:00', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Johnny', 'Guzman', 'guzmanjhonny@gmail.com', 1, 1373428098, '2013-06-22 00:08:38', '2013-07-10 03:48:18', 0, 1, 'Ing. en sistemas', NULL, 'apasionado de la informatica', 1, '', '', '', '0000-00-00 00:00:00', 'jhonnyguzman', 'c6cc8094c2dc07b700ffcc36d64e2138', 4, NULL, NULL, 'Lb9ecOwMWfgPcmin5neBudcY3ZBP8cRJuQWAYDHFEnO9on9j3bW', NULL, NULL, NULL, NULL),
(11, 'walter', 'juarez rivas', 'esteban.jr@gmail.com', 1, 1374053097, '2013-07-16 12:57:19', '2013-07-17 09:24:57', 0, 1, NULL, NULL, NULL, 1, '', '', '', '0000-00-00 00:00:00', 'estebanjr', '6b0279d0769d46c40579985992c06744', 4, NULL, NULL, 'SogYL7YY37f3QcLhiTXHnXc5RWXuEkPtURUuMeRYpmfiZ1Vk6VW', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_categories`
--

CREATE TABLE IF NOT EXISTS `user_categories` (
  `id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_categories`
--

INSERT INTO `user_categories` (`id`, `category`, `description`) VALUES
(1, 'Estudiante', 'Como estudiante'),
(2, 'Profesor', 'Engloba a los usuari'),
(3, 'Instituciones', 'Engloba a los usuari');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_preferences`
--

CREATE TABLE IF NOT EXISTS `user_preferences` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_status`
--

CREATE TABLE IF NOT EXISTS `user_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(130) DEFAULT NULL,
  `code` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `user_status`
--

INSERT INTO `user_status` (`id`, `name`, `code`) VALUES
(1, 'enabled', 1),
(2, 'disabled', 2),
(3, 'blocked', 3),
(4, 'waiting confirmation register', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_thumbnails`
--

CREATE TABLE IF NOT EXISTS `user_thumbnails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `file_name` text,
  `file_size` varchar(50) DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `user_thumbnails`
--

INSERT INTO `user_thumbnails` (`id`, `user_id`, `file_name`, `file_size`, `file_type`, `created_at`, `updated_at`) VALUES
(5, 10, 'user_thumbnail_10.jpg', '42.91', 'image/jpeg', '2013-06-25 00:59:13', '2013-06-25 01:12:29');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `sections_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `content_audios`
--
ALTER TABLE `content_audios`
  ADD CONSTRAINT `content_audios_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `content_documents`
--
ALTER TABLE `content_documents`
  ADD CONSTRAINT `lcontent_documents_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `content_images`
--
ALTER TABLE `content_images`
  ADD CONSTRAINT `content_images_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `content_presentations`
--
ALTER TABLE `content_presentations`
  ADD CONSTRAINT `content_presentations_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `content_texts`
--
ALTER TABLE `content_texts`
  ADD CONSTRAINT `content_texts_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `content_videos`
--
ALTER TABLE `content_videos`
  ADD CONSTRAINT `content_videos_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_course_category_id` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `courses_course_state_id` FOREIGN KEY (`course_state_id`) REFERENCES `course_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `courses_language_id` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `course_audiences`
--
ALTER TABLE `course_audiences`
  ADD CONSTRAINT `course_audiences_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `course_faqs`
--
ALTER TABLE `course_faqs`
  ADD CONSTRAINT `course_faqs_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `course_goals`
--
ALTER TABLE `course_goals`
  ADD CONSTRAINT `course_goals_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `course_requirements`
--
ALTER TABLE `course_requirements`
  ADD CONSTRAINT `course_requirements_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `course_thumbnails`
--
ALTER TABLE `course_thumbnails`
  ADD CONSTRAINT `course_thumbnails_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `course_users`
--
ALTER TABLE `course_users`
  ADD CONSTRAINT `course_users_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `course_users_user_category_id` FOREIGN KEY (`user_category_id`) REFERENCES `user_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `curriculums`
--
ALTER TABLE `curriculums`
  ADD CONSTRAINT `curriculums_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `despatchs`
--
ALTER TABLE `despatchs`
  ADD CONSTRAINT `despatchs_adress_id` FOREIGN KEY (`addres_id`) REFERENCES `adresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `section` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `material_files`
--
ALTER TABLE `material_files`
  ADD CONSTRAINT `material_files_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `question_answer`
--
ALTER TABLE `question_answer`
  ADD CONSTRAINT `answer` FOREIGN KEY (`question_type_multi_id`) REFERENCES `question_type_multi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `question_type_blank`
--
ALTER TABLE `question_type_blank`
  ADD CONSTRAINT `question_type_blank_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `question_type_boolean`
--
ALTER TABLE `question_type_boolean`
  ADD CONSTRAINT `question_type_boolean_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `question_type_multi`
--
ALTER TABLE `question_type_multi`
  ADD CONSTRAINT `question_type_multi_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_curriculum_id` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculums` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
