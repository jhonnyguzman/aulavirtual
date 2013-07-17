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
-- Create schema dugnadin_rsdb
--

CREATE DATABASE IF NOT EXISTS dugnadin_rsdb;
USE dugnadin_rsdb;

--
-- Definition of table `dugnadin_rsdb`.`actividad_users`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`actividad_users`;
CREATE TABLE  `dugnadin_rsdb`.`actividad_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `actividad_id` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `cuerpo` text COLLATE utf8_unicode_ci NOT NULL,
  `imagen_file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imagen_file_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `imagen_file_size` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dugnadin_rsdb`.`actividad_users`
--

/*!40000 ALTER TABLE `actividad_users` DISABLE KEYS */;
LOCK TABLES `actividad_users` WRITE;
INSERT INTO `dugnadin_rsdb`.`actividad_users` VALUES  (1,13,4,'2012-04-10','2012-04-10 23:05:48','0000-00-00 00:00:00','asd asd','T7OuuWqS.gif','image/gif','0.929688','asd ads'),
 (2,21,5,'2012-08-13','2012-08-16 20:28:54','0000-00-00 00:00:00','joda bardo ','b66rMsot.gif','image/gif','1.095703','rivadavia 1212');
UNLOCK TABLES;
/*!40000 ALTER TABLE `actividad_users` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`actividades`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`actividades`;
CREATE TABLE  `dugnadin_rsdb`.`actividades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `puntos` int(11) NOT NULL,
  `energia` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `nivel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dugnadin_rsdb`.`actividades`
--

/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
LOCK TABLES `actividades` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`badges`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`badges`;
CREATE TABLE  `dugnadin_rsdb`.`badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `descripcion` text,
  `imagen_file_name` varchar(255) NOT NULL,
  `imagen_file_size` varchar(20) DEFAULT NULL,
  `imagen_file_type` varchar(255) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dugnadin_rsdb`.`badges`
--

/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
LOCK TABLES `badges` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `badges` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`categorias`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`categorias`;
CREATE TABLE  `dugnadin_rsdb`.`categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(130) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `imagen_file_name` varchar(255) DEFAULT NULL,
  `imagen_file_size` varchar(255) DEFAULT NULL,
  `imagen_file_type` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dugnadin_rsdb`.`categorias`
--

/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
LOCK TABLES `categorias` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`contenido_imagenes`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`contenido_imagenes`;
CREATE TABLE  `dugnadin_rsdb`.`contenido_imagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenido_id` int(11) NOT NULL,
  `imagen_file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imagen_file_size` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `imagen_file_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dugnadin_rsdb`.`contenido_imagenes`
--

/*!40000 ALTER TABLE `contenido_imagenes` DISABLE KEYS */;
LOCK TABLES `contenido_imagenes` WRITE;
INSERT INTO `dugnadin_rsdb`.`contenido_imagenes` VALUES  (1,1,'25OFM9a0.jpg','25.971680','image/jpeg',1,'2012-04-02 19:22:13','0000-00-00 00:00:00','Imagen de prueba'),
 (3,4,'GhDlz2km.jpg','44.286133','image/jpeg',1,'2012-04-06 20:53:56','0000-00-00 00:00:00','Test 2'),
 (4,10,'Mj2VDcXQ.jpg','8.930664','image/jpeg',1,'2012-04-12 11:31:50','0000-00-00 00:00:00','Salud Mental'),
 (5,12,'L7yty7VA.jpg','77.206055','image/jpeg',1,'2012-04-12 11:45:38','0000-00-00 00:00:00','Feria'),
 (6,36,'BJ5wRgZt.jpg','25.199219','image/jpeg',1,'2013-03-26 22:07:45','0000-00-00 00:00:00','ascascsacs'),
 (7,37,'WSy0oLxW.jpg','8.168945','image/jpeg',1,'2013-03-27 10:19:51','0000-00-00 00:00:00','empresa 2'),
 (8,40,'OdijKV3V.jpg','8.168945','image/jpeg',1,'2013-03-27 13:30:00','0000-00-00 00:00:00','ascascsacs'),
 (9,51,'pxTr300K.jpg','73.051758','image/jpeg',1,'2013-05-10 12:22:44','0000-00-00 00:00:00','dia de la madre'),
 (11,52,'8xdGoH6J.jpg','23.522461','image/jpeg',1,'2013-05-13 12:23:06','0000-00-00 00:00:00','Pobres 1'),
 (12,52,'KZa3UQlX.jpg','25.165039','image/jpeg',4,'2013-05-13 12:23:20','0000-00-00 00:00:00','pobres 2'),
 (13,52,'oeA4mKIi.jpg','156.404297','image/jpeg',2,'2013-05-13 12:24:12','0000-00-00 00:00:00','Pobres 3'),
 (14,52,'Yftxzmv8.jpg','33.663086','image/jpeg',3,'2013-05-13 12:25:43','0000-00-00 00:00:00','Pobres 4'),
 (15,50,'4rti8VaD.jpg','22.992188','image/jpeg',1,'2013-05-13 18:22:42','0000-00-00 00:00:00','Guemes 1'),
 (16,50,'WiZJ6ICL.jpg','38.368164','image/jpeg',2,'2013-05-13 18:22:57','0000-00-00 00:00:00','Guemes 2'),
 (17,50,'Kj05CR2f.png','16.571289','image/png',3,'2013-05-13 18:23:12','0000-00-00 00:00:00','Guemes 3'),
 (18,50,'mR3V3pZr.jpg','35.078125','image/jpeg',4,'2013-05-13 18:23:26','0000-00-00 00:00:00','Guemes 4');
UNLOCK TABLES;
/*!40000 ALTER TABLE `contenido_imagenes` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`contenido_users`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`contenido_users`;
CREATE TABLE  `dugnadin_rsdb`.`contenido_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenido_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dugnadin_rsdb`.`contenido_users`
--

/*!40000 ALTER TABLE `contenido_users` DISABLE KEYS */;
LOCK TABLES `contenido_users` WRITE;
INSERT INTO `dugnadin_rsdb`.`contenido_users` VALUES  (2,14,13,'2012-04-19 11:49:39','0000-00-00 00:00:00'),
 (3,8,13,'2012-04-19 11:50:44','0000-00-00 00:00:00'),
 (4,53,74,'2013-05-17 22:15:15','0000-00-00 00:00:00'),
 (5,32,74,'2013-05-17 23:04:03','0000-00-00 00:00:00'),
 (6,53,82,'2013-05-17 23:07:18','0000-00-00 00:00:00'),
 (7,32,82,'2013-05-17 23:07:54','0000-00-00 00:00:00'),
 (8,33,74,'2013-05-17 23:10:17','0000-00-00 00:00:00'),
 (9,53,85,'2013-05-20 02:19:26','0000-00-00 00:00:00'),
 (10,50,82,'2013-06-07 14:57:50','0000-00-00 00:00:00'),
 (11,49,82,'2013-06-07 14:59:43','0000-00-00 00:00:00'),
 (12,35,82,'2013-06-07 14:59:52','0000-00-00 00:00:00'),
 (13,47,82,'2013-06-07 15:12:45','0000-00-00 00:00:00'),
 (14,34,82,'2013-06-07 15:14:53','0000-00-00 00:00:00'),
 (15,33,82,'2013-06-07 15:16:44','0000-00-00 00:00:00'),
 (16,31,82,'2013-06-07 15:20:17','0000-00-00 00:00:00');
UNLOCK TABLES;
/*!40000 ALTER TABLE `contenido_users` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`contenido_videos`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`contenido_videos`;
CREATE TABLE  `dugnadin_rsdb`.`contenido_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenido_id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dugnadin_rsdb`.`contenido_videos`
--

/*!40000 ALTER TABLE `contenido_videos` DISABLE KEYS */;
LOCK TABLES `contenido_videos` WRITE;
INSERT INTO `dugnadin_rsdb`.`contenido_videos` VALUES  (1,1,'http://www.youtube.com/watch?v=V-fXayx1WnE','Este video esta bueno che','2012-04-02 19:16:12','0000-00-00 00:00:00',1),
 (2,4,'http://www.youtube.com/watch?v=V-fXayx1WnE','Este video esta bueno che','2012-04-06 20:49:48','0000-00-00 00:00:00',1),
 (3,9,'http://www.youtube.com/watch?v=yxsR8FyFumg&feature=g-all-pls','test','2012-05-01 21:05:15','2012-05-01 21:06:41',1),
 (4,36,'http://www.youtube.com/watch?v=XqgE2ODoeMw','cbcf','2013-03-26 22:08:28','0000-00-00 00:00:00',1),
 (5,51,'http://www.youtube.com/watch?v=93XLO-Ti1qk','dia de la madre','2013-05-10 12:24:21','0000-00-00 00:00:00',1),
 (6,52,'http://www.youtube.com/watch?v=6h4HbhH7okU','Ayuda a los pobres','2013-05-10 12:42:58','0000-00-00 00:00:00',1),
 (7,52,'http://www.youtube.com/watch?v=lzuLYV8PLhw','Porque Somos Pobres','2013-05-13 12:27:06','0000-00-00 00:00:00',2),
 (8,50,'http://www.youtube.com/watch?v=zXtuFdGcWuQ','Guemes 1','2013-05-13 18:24:21','0000-00-00 00:00:00',1),
 (9,50,'http://www.youtube.com/watch?v=03hsobXjA6w','Guemes 2','2013-05-13 18:24:59','0000-00-00 00:00:00',2);
UNLOCK TABLES;
/*!40000 ALTER TABLE `contenido_videos` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`contenidos`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`contenidos`;
CREATE TABLE  `dugnadin_rsdb`.`contenidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bajada` text COLLATE utf8_unicode_ci NOT NULL,
  `cuerpo` text COLLATE utf8_unicode_ci NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tipo` enum('noticia','mision','causa','rse') COLLATE utf8_unicode_ci NOT NULL,
  `monto_total` float NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `bajada_html` text COLLATE utf8_unicode_ci NOT NULL,
  `cuerpo_html` text COLLATE utf8_unicode_ci NOT NULL,
  `contenido_imagenes_count` int(11) NOT NULL DEFAULT '0',
  `contenido_videos_count` int(11) NOT NULL DEFAULT '0',
  `direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `monto_acumulado` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dugnadin_rsdb`.`contenidos`
--

/*!40000 ALTER TABLE `contenidos` DISABLE KEYS */;
LOCK TABLES `contenidos` WRITE;
INSERT INTO `dugnadin_rsdb`.`contenidos` VALUES  (8,'Huerta Compartida','Los niños participan en el preparado, mantenimiento y cosecha de una huerta orgánica, así como en el diseño y construcción de una reserva natural; a través de cuyas tareas incorporan variados conocimientos acerca de la naturaleza y las culturas. Asimismo, se complementan estos trabajos con la prepar','Se recorren diferentes textos literarios a partir de los cuales los niños realizan actividades plásticas y expresiones musicales en relación a los argumentos de cada obra. En algunos casos se establecen relaciones entre diferentes textos, incentivando a la reflexión acerca de valores universales (solidaridad, igualdad, libertad, etc.) o al conocimiento de cuestiones culturales o ecológicos. Asimismo, se reelaboran los textos leídos de manera personal a través de diferentes propuestas como: representaciones teatrales; títeres; confección de libros artesanales, etc.\n\nSe recorren diferentes textos literarios a partir de los cuales los niños realizan actividades plásticas y expresiones musicales en relación a los argumentos de cada obra. En algunos casos se establecen relaciones entre diferentes textos, incentivando a la reflexión acerca de valores universales (solidaridad, igualdad, libertad, etc.) o al conocimiento de cuestiones culturales o ecológicos. Asimismo, se reelaboran los textos leídos de manera personal a través de diferentes propuestas como: representaciones teatrales; títeres; confección de libros artesanales, etc.','0000-00-00',0,12,'2012-04-09 23:53:19','0000-00-00 00:00:00','mision',0,'2012-04-09 20:00:00','<p>Los niños participan en el preparado, mantenimiento y cosecha de una huerta orgánica, así como en el diseño y construcción de una reserva natural; a través de cuyas tareas incorporan variados conocimientos acerca de la naturaleza y las culturas. Asimismo, se complementan estos trabajos con la prepar</p>\n','<p>Se recorren diferentes textos literarios a partir de los cuales los niños realizan actividades plásticas y expresiones musicales en relación a los argumentos de cada obra. En algunos casos se establecen relaciones entre diferentes textos, incentivando a la reflexión acerca de valores universales (solidaridad, igualdad, libertad, etc.) o al conocimiento de cuestiones culturales o ecológicos. Asimismo, se reelaboran los textos leídos de manera personal a través de diferentes propuestas como: representaciones teatrales; títeres; confección de libros artesanales, etc.</p>\n\n<p>Se recorren diferentes textos literarios a partir de los cuales los niños realizan actividades plásticas y expresiones musicales en relación a los argumentos de cada obra. En algunos casos se establecen relaciones entre diferentes textos, incentivando a la reflexión acerca de valores universales (solidaridad, igualdad, libertad, etc.) o al conocimiento de cuestiones culturales o ecológicos. Asimismo, se reelaboran los textos leídos de manera personal a través de diferentes propuestas como: representaciones teatrales; títeres; confección de libros artesanales, etc.</p>\n',0,0,'Lamadrid 318, San Miguel de Tucuman, Tucuman, Argentina',NULL),
 (9,'Brindar formación y actualización','La Fundación Pampa Central (FuPac) es una entidad sin fines de lucro y sin Compromisos ideológicos, Religiosos, Partidarios o Gubernamentales, que tiene como objetivos sociales:','* Producir un ámbito cultural de contacto, comunicación e intercambio entre ambientes de producción de conocimientos y miembros, sectores e instituciones de la sociedad, a través de la organización de encuentros y exposiciones (conferencias, cursos, talleres, jornadas, etc.), así como mediante el funcionamiento de un museo, una biblioteca, un archivo y un centro de investigación que favorezcan el conocimiento y difusión del patrimonio histórico-cultural regional y argentino. Si bien la orientación central y general de las actividades está dada por cuestiones histórico-sociales bajo un enfoque interdisciplinario amplio, no se plantean las mismas en forma excluyente de otros temas y problemas.\n\n* Brindar formación y actualización tanto a nivel de áreas temáticas como de procedimientos de enseñanza y de investigación, en particular dirigidos a alumnos y docentes de los niveles educativos EGB y Polimodal.\n\n* Promover la transposición de conocimientos al ámbito de la comunidad.\n\n- Producir actividades innovadoras y alternativas a la educación formal para los niños de edad preescolar y a los escolares de los niveles EGB y Polimodal.\n\n- Promover la educación continua de los adultos a lo largo de la vida, proveyéndoles de un espacio (ambiente) de educación no formal donde desarrollar iniciativas que se correspondan con los objetivos aquí establecidos.\n\n* Fomentar (asesorando, colaborando, coordinando y dirigiendo) la realización de proyectos de educación, de investigación, [link aqui](http://google.com \"Ejemplo de agustin\") de difusión y de recreación, ya sean individuales, grupales o institucionales. http://google.com.ar\n','2012-04-09',0,12,'2012-04-09 23:55:11','2012-05-11 23:31:13','noticia',0,'0000-00-00 00:00:00','<p>La Fundación Pampa Central (FuPac) es una entidad sin fines de lucro y sin Compromisos ideológicos, Religiosos, Partidarios o Gubernamentales, que tiene como objetivos sociales:</p>\n','<ul>\n<li><p>Producir un ámbito cultural de contacto, comunicación e intercambio entre ambientes de producción de conocimientos y miembros, sectores e instituciones de la sociedad, a través de la organización de encuentros y exposiciones (conferencias, cursos, talleres, jornadas, etc.), así como mediante el funcionamiento de un museo, una biblioteca, un archivo y un centro de investigación que favorezcan el conocimiento y difusión del patrimonio histórico-cultural regional y argentino. Si bien la orientación central y general de las actividades está dada por cuestiones histórico-sociales bajo un enfoque interdisciplinario amplio, no se plantean las mismas en forma excluyente de otros temas y problemas.</p></li>\n<li><p>Brindar formación y actualización tanto a nivel de áreas temáticas como de procedimientos de enseñanza y de investigación, en particular dirigidos a alumnos y docentes de los niveles educativos EGB y Polimodal.</p></li>\n<li><p>Promover la transposición de conocimientos al ámbito de la comunidad.</p></li>\n<li><p>Producir actividades innovadoras y alternativas a la educación formal para los niños de edad preescolar y a los escolares de los niveles EGB y Polimodal.</p></li>\n<li><p>Promover la educación continua de los adultos a lo largo de la vida, proveyéndoles de un espacio (ambiente) de educación no formal donde desarrollar iniciativas que se correspondan con los objetivos aquí establecidos.</p></li>\n<li><p>Fomentar (asesorando, colaborando, coordinando y dirigiendo) la realización de proyectos de educación, de investigación, <a href=\"http://google.com\" title=\"Ejemplo de agustin\">link aqui</a> de difusión y de recreación, ya sean individuales, grupales o institucionales. <a href=\"http://google.com.ar\">http://google.com.ar</a></p></li>\n</ul>\n',0,1,'',NULL),
 (10,'Salud Mental','Salud mental…un espacio para vos…para mì…para ellos…para nosotros…para todos\n','Para vos…”tenès que hacer un tratamiento” (…) \nPara mì…”tengo que pedir ayuda” (…) \nPara ellos…”mis hijos lo necesitan” (…) \nPara nosotros…”probemos que sucede en la pareja” (…) \nPara todos…” mi familia y yo iremos” (…) \n“¿y si me animo en grupo?”(…)\n\n\nHablemos, pues, sin miedo, pero también sin pretensiones. \nSencillamente, con cierto sentido del humor que disimule el lógico patetismo del asunto.\n\nHablemos de todo un poco, quiero decir: De esos problemáticos dioses...De los evidentes gusanos...De los cambiantes rostros de los hombres.\n\nNo sé gran cosa de estos curiosos problemas pero lo que sé, lo sé de verdad pues son experiencias mías y no historias leídas en los libros.\n\nY puedo hablar del amor o del miedo como un santo de sus éxtasis, o un mago de teatro en una reunión casera entre gente de confianza y de sus trucos.\n\nNo esperen otra cosa. No me critiquen luego, no sean perversos, caramba. Ni mezquinos.\n\nLes advierto: sean más modestos, pues también ustedes están destinados a alimentar a los gusanos antes mencionados.\n\nDe modo que, con excepción de los locos y de los invisibles dioses, tal vez inexistentes, todos los demás harán bien en escucharme sino con respeto por lo menos con condescendencia.','2012-04-12',0,15,'2012-04-12 11:31:16','0000-00-00 00:00:00','noticia',0,'0000-00-00 00:00:00','<p>Salud mental…un espacio para vos…para mì…para ellos…para nosotros…para todos</p>\n','<p>Para vos…”tenès que hacer un tratamiento” (…) \nPara mì…”tengo que pedir ayuda” (…) \nPara ellos…”mis hijos lo necesitan” (…) \nPara nosotros…”probemos que sucede en la pareja” (…) \nPara todos…” mi familia y yo iremos” (…) \n“¿y si me animo en grupo?”(…)</p>\n\n<p>Hablemos, pues, sin miedo, pero también sin pretensiones. \nSencillamente, con cierto sentido del humor que disimule el lógico patetismo del asunto.</p>\n\n<p>Hablemos de todo un poco, quiero decir: De esos problemáticos dioses...De los evidentes gusanos...De los cambiantes rostros de los hombres.</p>\n\n<p>No sé gran cosa de estos curiosos problemas pero lo que sé, lo sé de verdad pues son experiencias mías y no historias leídas en los libros.</p>\n\n<p>Y puedo hablar del amor o del miedo como un santo de sus éxtasis, o un mago de teatro en una reunión casera entre gente de confianza y de sus trucos.</p>\n\n<p>No esperen otra cosa. No me critiquen luego, no sean perversos, caramba. Ni mezquinos.</p>\n\n<p>Les advierto: sean más modestos, pues también ustedes están destinados a alimentar a los gusanos antes mencionados.</p>\n\n<p>De modo que, con excepción de los locos y de los invisibles dioses, tal vez inexistentes, todos los demás harán bien en escucharme sino con respeto por lo menos con condescendencia.</p>\n',1,0,'',NULL),
 (11,'Objetivo Social','* Promover, difundir, participar en cuestiones relacionadas con lo social, cultural de la ona sometida a estudio dentro del territorio bonaerense.\n* Propender el adelanto, mejoramiento y progreso del vecindario peticionar ante las autoridades municipales, provinciales y nacionales, gestionando la realización de mejoras de la zona a considerar\n* Propiciar la formación de institutos médicos asistenciales, educacionales, bibliotecas, emprendimientos de cuidado infantil de 3 edad.\n* Brindar consultorio jurídico gratuito a cargo de profesionales.\n* Celebrar convenios, intercambios, acuerdos con otras instituciones civiles, fundaciones, organismos de carácter municipal, nacional, provincial e internacional y toda otra entidad privada para el logro del objetivo social.','','0000-00-00',1,15,'2012-04-12 11:36:39','0000-00-00 00:00:00','causa',0,'0000-00-00 00:00:00','<ul>\n<li>Promover, difundir, participar en cuestiones relacionadas con lo social, cultural de la ona sometida a estudio dentro del territorio bonaerense.</li>\n<li>Propender el adelanto, mejoramiento y progreso del vecindario peticionar ante las autoridades municipales, provinciales y nacionales, gestionando la realización de mejoras de la zona a considerar</li>\n<li>Propiciar la formación de institutos médicos asistenciales, educacionales, bibliotecas, emprendimientos de cuidado infantil de 3 edad.</li>\n<li>Brindar consultorio jurídico gratuito a cargo de profesionales.</li>\n<li>Celebrar convenios, intercambios, acuerdos con otras instituciones civiles, fundaciones, organismos de carácter municipal, nacional, provincial e internacional y toda otra entidad privada para el logro del objetivo social.</li>\n</ul>\n','',0,0,'',NULL),
 (12,'INFORME FINAL SOBRE EL PROGRAMA NACIONAL BANCO POPULAR DE LA BUENA FÉ EN CACHARI','Desde la convocatoria realizada en el mes de Abril del Año 2011, el equipo promotor, junto a la Comisión Directiva de la ONG \"Ecos del Pueblo\", realizó actividades que involucran lo social y las muestras de emprendedores con sus distintas alternativas.','Estas actividades vincularon a los grupos en una cordial convivencia, sembrada de conocimientos de los más antiguos miembros, a los más nuevos.\nSe realizaron seis Ferias de Exposición, entre Abril y Diciembre del 2011, una de ellas con el acompañamiento de ANSES, (inflables y personal con atención al público), otra con espectáculos musicales en vivo, donde actuó Hernan Bertellys, y las demás con dinámicas diferentes (Kermesse, otras), recibiendo prestatarios invitados de otros Bancos de la Regional A.U.A (Artistas Unidos Azuleños) a la cual pertenece nuestro \"Banquito\" de Cachari, siendo uno de los nueve Bancos que la conforman.\nDesde el comienzo se fijó como día de “Vida de Centro”, todos los jueves, a partir de las 18 Hs. En estas reuniones se cobran las cuotas, se comentan los avances de cada proyecto, se vive una verdadera CONVIVENCIA GRUPAL. También se realizaron charlas dictadas por diferentes motivos, algunos propuestos por los prestatarios y otros desde la Comisión Directiva de la ONG. Dos de ellas, fue con el Señor Lucas Lorusso del Ministerio de Desarrollo Social de la Nación, quien realizó jornada de inscripción del “Monotributo Social”, explicando sus alcances. Otra, con el Encargado de la Cooperativa de Agua Potable de Cachari donde explicó los distintos procesos de potabilización y cuales eran los motivos por el cual, diferentes lugares de la localidad, todavía no poseen red de agua.\nDesde el comienzo se realizó todos los sábados de cada mes, en el horario de 10 am a 13 Hs, el Programa Radial en vivo, \"ECOS DEL PUEBLO\", donde se difundieron todas las actividades y los alcances del Banco Popular de la Buena Fe, de la ONG en general y de distintas Instituciones de la Comunidad (espacio gratuito para ellas).\nHasta el momento se han entregado $ 180.000 a varios grupos, contribuyendo de esta manera, a realizar el sueño del emprendimiento de cada prestatario, quedando en espera, grupos “semilla”, capacitándose.\nActualmente, se sigue trabajando en pos del bienestar general, desde una Educación Popular radicada en la Participación de Políticas Sociales y el desarrollo cotidiano en nuestra Economía Social para toda la Comunidad cachariense','2012-04-12',1,16,'2012-04-12 11:45:10','0000-00-00 00:00:00','noticia',0,'0000-00-00 00:00:00','<p>Desde la convocatoria realizada en el mes de Abril del Año 2011, el equipo promotor, junto a la Comisión Directiva de la ONG \"Ecos del Pueblo\", realizó actividades que involucran lo social y las muestras de emprendedores con sus distintas alternativas.</p>\n','<p>Estas actividades vincularon a los grupos en una cordial convivencia, sembrada de conocimientos de los más antiguos miembros, a los más nuevos.\nSe realizaron seis Ferias de Exposición, entre Abril y Diciembre del 2011, una de ellas con el acompañamiento de ANSES, (inflables y personal con atención al público), otra con espectáculos musicales en vivo, donde actuó Hernan Bertellys, y las demás con dinámicas diferentes (Kermesse, otras), recibiendo prestatarios invitados de otros Bancos de la Regional A.U.A (Artistas Unidos Azuleños) a la cual pertenece nuestro \"Banquito\" de Cachari, siendo uno de los nueve Bancos que la conforman.\nDesde el comienzo se fijó como día de “Vida de Centro”, todos los jueves, a partir de las 18 Hs. En estas reuniones se cobran las cuotas, se comentan los avances de cada proyecto, se vive una verdadera CONVIVENCIA GRUPAL. También se realizaron charlas dictadas por diferentes motivos, algunos propuestos por los prestatarios y otros desde la Comisión Directiva de la ONG. Dos de ellas, fue con el Señor Lucas Lorusso del Ministerio de Desarrollo Social de la Nación, quien realizó jornada de inscripción del “Monotributo Social”, explicando sus alcances. Otra, con el Encargado de la Cooperativa de Agua Potable de Cachari donde explicó los distintos procesos de potabilización y cuales eran los motivos por el cual, diferentes lugares de la localidad, todavía no poseen red de agua.\nDesde el comienzo se realizó todos los sábados de cada mes, en el horario de 10 am a 13 Hs, el Programa Radial en vivo, \"ECOS DEL PUEBLO\", donde se difundieron todas las actividades y los alcances del Banco Popular de la Buena Fe, de la ONG en general y de distintas Instituciones de la Comunidad (espacio gratuito para ellas).\nHasta el momento se han entregado $ 180.000 a varios grupos, contribuyendo de esta manera, a realizar el sueño del emprendimiento de cada prestatario, quedando en espera, grupos “semilla”, capacitándose.\nActualmente, se sigue trabajando en pos del bienestar general, desde una Educación Popular radicada en la Participación de Políticas Sociales y el desarrollo cotidiano en nuestra Economía Social para toda la Comunidad cachariense</p>\n',1,0,'',NULL),
 (13,'Integración Cacharí','\"He\'ll do,\" said Bildad, eyeing me, and then went on spelling away at his book in a mumbling tone quite audible. I thought him the queerest old Quaker I ever saw, especially as Peleg, his friend and old shipmate, seemed such a blusterer. But I said nothing, only looking round me sharply.\n\nPeleg now threw open a chest, and drawing forth the ship\'s articles, placed pen and ink before him, and seated himself at a little table. I began to think it was high time to settle with myself at what terms I would be willing to engage for the voyage. I was already aware that in the whaling business they paid no wages; but all hands, including the captain, received certain shares of the profits called lays, and that these lays were proportioned to the degree of importance pertaining to the respective duties of the ship\'s company.\n\nI was also aware that being a green hand at whaling, my own lay would not be very large; but considering that I was used to the sea, could steer a ship, splice a rope, and all that, I made no doubt that from all I had heard I should be offered at least the 275th lay that is, the 275th part of the clear net proceeds of the voyage, whatever that might eventually amount to. And though the 275th lay was what they call a rather LONG LAY, yet it was better than nothing; and if we had a lucky voyage, might pretty nearly pay for the clothing I would wear out on it, not to speak of my three years\' beef and board, for which I would not have to pay one stiver. It might be thought that this was a poor way to accumulate a princely fortune and so it was,','','0000-00-00',1,16,'2012-04-12 11:46:59','0000-00-00 00:00:00','causa',0,'0000-00-00 00:00:00','<p>\"He\'ll do,\" said Bildad, eyeing me, and then went on spelling away at his book in a mumbling tone quite audible. I thought him the queerest old Quaker I ever saw, especially as Peleg, his friend and old shipmate, seemed such a blusterer. But I said nothing, only looking round me sharply.</p>\n\n<p>Peleg now threw open a chest, and drawing forth the ship\'s articles, placed pen and ink before him, and seated himself at a little table. I began to think it was high time to settle with myself at what terms I would be willing to engage for the voyage. I was already aware that in the whaling business they paid no wages; but all hands, including the captain, received certain shares of the profits called lays, and that these lays were proportioned to the degree of importance pertaining to the respective duties of the ship\'s company.</p>\n\n<p>I was also aware that being a green hand at whaling, my own lay would not be very large; but considering that I was used to the sea, could steer a ship, splice a rope, and all that, I made no doubt that from all I had heard I should be offered at least the 275th lay that is, the 275th part of the clear net proceeds of the voyage, whatever that might eventually amount to. And though the 275th lay was what they call a rather LONG LAY, yet it was better than nothing; and if we had a lucky voyage, might pretty nearly pay for the clothing I would wear out on it, not to speak of my three years\' beef and board, for which I would not have to pay one stiver. It might be thought that this was a poor way to accumulate a princely fortune and so it was,</p>\n','',0,0,'',NULL),
 (15,'Otra causa mas...','este este un test','afsdfsdf','0000-00-00',1,12,'2012-05-01 23:13:03','2012-05-12 00:42:40','causa',1000,'0000-00-00 00:00:00','<p>este este un test</p>\n','<p>afsdfsdf</p>\n',0,0,'',NULL),
 (16,'editar','editar','','0000-00-00',1,19,'2012-08-04 22:28:59','0000-00-00 00:00:00','causa',0,'0000-00-00 00:00:00','<p>editar</p>\n','',0,0,'',NULL),
 (17,'editar','editar','','0000-00-00',1,20,'2012-08-04 22:30:21','0000-00-00 00:00:00','mision',0,'0000-00-00 00:00:00','<p>editar</p>\n','',0,0,'',NULL),
 (18,'editar','editar','','0000-00-00',1,22,'2012-08-16 21:41:03','0000-00-00 00:00:00','causa',0,'0000-00-00 00:00:00','<p>editar</p>\n','',0,0,'',NULL),
 (19,'causa','Intro de edfbdfbdfbfbfdbdjemplo','dbdbdfb','0000-00-00',1,23,'2013-03-15 18:39:47','2013-03-15 18:40:54','causa',0,'0000-00-00 00:00:00','<p>Intro de edfbdfbdfbfbfdbdjemplo</p>\n','<p>dbdbdfb</p>\n',0,0,'',NULL),
 (20,'dona a su causa','dgbdfdfbvfbxcbv<df<sdgdgvxvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv','vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv','0000-00-00',1,24,'2013-03-26 13:33:06','2013-03-26 13:33:45','causa',156678,'0000-00-00 00:00:00','<p>dgbdfdfbvfbxcbv&lt;df&lt;sdgdgvxvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv</p>\n','<p>vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv</p>\n',0,0,'',NULL),
 (21,'ayudar ','Es que esta bella joven ostenta una cintura de solo 40 centímetros, siendo una de las más pequeñas en el mundo. \n\nA pesar de que muchos especulan con una enfermedad de índole alimenticia, ella asegura que en realidad sólo tiene un organismo híper acelerado que le hace quemar calorías constantemente ','Es que esta bella joven ostenta una cintura de solo 40 centímetros, siendo una de las más pequeñas en el mundo. \n\nA pesar de que muchos especulan con una enfermedad de índole alimenticia, ella asegura que en realidad sólo tiene un organismo híper acelerado que le hace quemar calorías constantemente y que ingiere tres grandes comidas al día en las que incluye pizzas, papas fritas y chocolates.\nEs que esta bella joven ostenta una cintura de solo 40 centímetros, siendo una de las más pequeñas en el mundo. \n\nA pesar de que muchos especulan con una enfermedad de índole alimenticia, ella asegura que en realidad sólo tiene un organismo híper acelerado que le hace quemar calorías constantemente y que ingiere tres grandes comidas al día en las que incluye pizzas, papas fritas y chocolates.\n','0000-00-00',1,25,'2013-03-26 13:40:03','2013-03-26 13:40:52','causa',2.14748e+09,'0000-00-00 00:00:00','<p>Es que esta bella joven ostenta una cintura de solo 40 centímetros, siendo una de las más pequeñas en el mundo.</p>\n\n<p>A pesar de que muchos especulan con una enfermedad de índole alimenticia, ella asegura que en realidad sólo tiene un organismo híper acelerado que le hace quemar calorías constantemente</p>\n','<p>Es que esta bella joven ostenta una cintura de solo 40 centímetros, siendo una de las más pequeñas en el mundo.</p>\n\n<p>A pesar de que muchos especulan con una enfermedad de índole alimenticia, ella asegura que en realidad sólo tiene un organismo híper acelerado que le hace quemar calorías constantemente y que ingiere tres grandes comidas al día en las que incluye pizzas, papas fritas y chocolates.\nEs que esta bella joven ostenta una cintura de solo 40 centímetros, siendo una de las más pequeñas en el mundo.</p>\n\n<p>A pesar de que muchos especulan con una enfermedad de índole alimenticia, ella asegura que en realidad sólo tiene un organismo híper acelerado que le hace quemar calorías constantemente y que ingiere tres grandes comidas al día en las que incluye pizzas, papas fritas y chocolates.</p>\n',0,0,'',NULL),
 (22,'ayudar 3','Es que esta bella joven ostenta una cintura de solo 40 centímetros, siendo una de las más pequeñas en el mundo. \n\nA pesar de que muchos especulan con una enfermedad de índole alimenticia, ella asegura que en realidad sólo tiene un organismo híper acelerado que le hace quemar calorías constantemente ','Es que esta bella joven ostenta una cintura de solo 40 centímetros, siendo una de las más pequeñas en el mundo. \n\nA pesar de que muchos especulan con una enfermedad de índole alimenticia, ella asegura que en realidad sólo tiene un organismo híper acelerado que le hace quemar calorías constantemente y que ingiere tres grandes comidas al día en las que incluye pizzas, papas fritas y chocolates.\nEs que esta bella joven ostenta una cintura de solo 40 centímetros, siendo una de las más pequeñas en el mundo. \n\nA pesar de que muchos especulan con una enfermedad de índole alimenticia, ella asegura que en realidad sólo tiene un organismo híper acelerado que le hace quemar calorías constantemente y que ingiere tres grandes comidas al día en las que incluye pizzas, papas fritas y chocolates.\n','0000-00-00',1,26,'2013-03-26 13:42:50','2013-03-26 13:43:05','causa',0,'0000-00-00 00:00:00','<p>Es que esta bella joven ostenta una cintura de solo 40 centímetros, siendo una de las más pequeñas en el mundo.</p>\n\n<p>A pesar de que muchos especulan con una enfermedad de índole alimenticia, ella asegura que en realidad sólo tiene un organismo híper acelerado que le hace quemar calorías constantemente</p>\n','<p>Es que esta bella joven ostenta una cintura de solo 40 centímetros, siendo una de las más pequeñas en el mundo.</p>\n\n<p>A pesar de que muchos especulan con una enfermedad de índole alimenticia, ella asegura que en realidad sólo tiene un organismo híper acelerado que le hace quemar calorías constantemente y que ingiere tres grandes comidas al día en las que incluye pizzas, papas fritas y chocolates.\nEs que esta bella joven ostenta una cintura de solo 40 centímetros, siendo una de las más pequeñas en el mundo.</p>\n\n<p>A pesar de que muchos especulan con una enfermedad de índole alimenticia, ella asegura que en realidad sólo tiene un organismo híper acelerado que le hace quemar calorías constantemente y que ingiere tres grandes comidas al día en las que incluye pizzas, papas fritas y chocolates.</p>\n',0,0,'',NULL),
 (23,'ayudar 4','on encantadores, talentosos y foman parte de lo más fino de Hollywood. Pero, ¿te habías dado cuenta cuán bajitos son?\n\nLa altura promedio para hombres en Estados Unidos es un estimado de 1,75 m. Estos famosos, con toda la información que la red nos ofrece, miden menos que eso.','Tiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.\n\nEl pronóstico es muy similar para Tafí del Valle, con posibles lluvias y cielo nublado. Por las noches, la temperatura descenderá en los Valles por debajo de los 15º.','0000-00-00',1,27,'2013-03-26 13:45:01','2013-03-26 13:46:12','causa',0,'0000-00-00 00:00:00','<p>on encantadores, talentosos y foman parte de lo más fino de Hollywood. Pero, ¿te habías dado cuenta cuán bajitos son?</p>\n\n<p>La altura promedio para hombres en Estados Unidos es un estimado de 1,75 m. Estos famosos, con toda la información que la red nos ofrece, miden menos que eso.</p>\n','<p>Tiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.</p>\n\n<p>Las temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.</p>\n\n<p>El pronóstico es muy similar para Tafí del Valle, con posibles lluvias y cielo nublado. Por las noches, la temperatura descenderá en los Valles por debajo de los 15º.</p>\n',0,0,'',NULL),
 (24,'ayudar 5','Tiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.\n\nEl pronó','Tiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.\n\nEl pronóstico es muy similar para Tafí del Valle, con posibles lluvias y cielo nublado. Por las noches, la temperatura descenderá en los Valles por debajo de los 15º.','0000-00-00',1,28,'2013-03-26 13:48:13','2013-03-26 13:48:33','causa',0,'0000-00-00 00:00:00','<p>Tiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.</p>\n\n<p>Las temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.</p>\n\n<p>El pronó</p>\n','<p>Tiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.</p>\n\n<p>Las temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.</p>\n\n<p>El pronóstico es muy similar para Tafí del Valle, con posibles lluvias y cielo nublado. Por las noches, la temperatura descenderá en los Valles por debajo de los 15º.</p>\n',0,0,'',NULL),
 (25,'ayuda 6','Intro de Tiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.\n','','0000-00-00',1,29,'2013-03-26 13:50:27','2013-03-26 13:50:39','causa',0,'0000-00-00 00:00:00','<p>Intro de Tiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.</p>\n\n<p>Las temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.</p>\n','',0,0,'',NULL),
 (26,'ayuda 7','Intro de ejemploTiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos ais','','0000-00-00',1,30,'2013-03-26 13:52:12','2013-03-26 13:52:32','causa',0,'0000-00-00 00:00:00','<p>Intro de ejemploTiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.</p>\n\n<p>Las temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos ais</p>\n','',0,0,'',NULL),
 (27,'ayudar 8','iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.\n\nEl pronós','','0000-00-00',1,31,'2013-03-26 13:58:16','2013-03-26 13:58:28','causa',0,'0000-00-00 00:00:00','<p>iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.</p>\n\n<p>Las temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.</p>\n\n<p>El pronós</p>\n','',0,0,'',NULL),
 (28,'ayuda 9','iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.\n\nEl pronós','','0000-00-00',1,32,'2013-03-26 13:59:52','2013-03-26 14:00:04','causa',0,'0000-00-00 00:00:00','<p>iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.</p>\n\n<p>Las temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.</p>\n\n<p>El pronós</p>\n','',0,0,'',NULL),
 (29,'ayuda 10','iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.\n\nEl pronós','','0000-00-00',1,33,'2013-03-26 14:01:02','2013-05-29 18:52:46','causa',20000,'0000-00-00 00:00:00','<p>iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.</p>\n\n<p>Las temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.</p>\n\n<p>El pronós</p>\n','',0,0,'',NULL),
 (30,'ayuda 12','iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.\n\nEl pronós','','0000-00-00',1,34,'2013-03-26 14:02:11','2013-03-26 14:02:23','causa',0,'0000-00-00 00:00:00','<p>iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.</p>\n\n<p>Las temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.</p>\n\n<p>El pronós</p>\n','',0,0,'',NULL),
 (31,'ayuda12','Intro de ejemploiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aisl','','0000-00-00',1,35,'2013-03-26 14:03:36','2013-06-07 15:20:17','causa',0,'0000-00-00 00:00:00','<p>Intro de ejemploiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.</p>\n\n<p>Las temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aisl</p>\n','',0,0,'',NULL),
 (32,'ayuda 13','Intro de ejemploiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aisl','','0000-00-00',1,36,'2013-03-26 14:04:49','2013-03-26 14:05:02','causa',0,'0000-00-00 00:00:00','<p>Intro de ejemploiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.</p>\n\n<p>Las temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aisl</p>\n','',0,0,'',NULL),
 (33,'ayuda 14','Intro de ejeiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados','','0000-00-00',1,37,'2013-03-26 14:06:28','2013-06-07 15:16:45','causa',0,'0000-00-00 00:00:00','<p>Intro de ejeiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.</p>\n\n<p>Las temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados</p>\n','',0,0,'',NULL),
 (34,'ayuda 15','Intriempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.\n\nEl pr','','0000-00-00',1,38,'2013-03-26 14:08:29','2013-06-07 15:14:53','causa',0,'0000-00-00 00:00:00','<p>Intriempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.</p>\n\n<p>Las temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aislados.</p>\n\n<p>El pr</p>\n','',0,0,'',NULL),
 (35,'ayuda 16','Intro de ejemploiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aisl','','0000-00-00',1,39,'2013-03-26 14:09:39','2013-06-07 14:59:52','causa',0,'0000-00-00 00:00:00','<p>Intro de ejemploiempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.</p>\n\n<p>Las temperaturas máximas oscilarán en San Miguel de Tucumán entre 26 y 27º, según el Weather Channel, y habrá posibilidades de chubascos aisl</p>\n','',0,0,'',NULL),
 (36,'Titulo de Ejemplo','Intro de ejemplo','','0000-00-00',1,40,'2013-03-26 22:06:58','0000-00-00 00:00:00','mision',0,'0000-00-00 00:00:00','<p>Intro de ejemplo</p>\n','',1,1,'',NULL),
 (37,'Titulo de Ejemplo','Intro de ejemplo','','0000-00-00',1,41,'2013-03-27 10:19:07','0000-00-00 00:00:00','mision',0,'0000-00-00 00:00:00','<p>Intro de ejemplo</p>\n','',1,0,'',NULL),
 (38,'empresa3','La silueta del médico José Gregorio Hernández apareció en una radiografía realizada a un adolescente de 13 años en el ambulatorio del Seguro Social en Cabimas, en Venezuela.\n\nEl muchacho presentaba vómitos, fiebre y dolor por lo que le realizaron la placa para descartar una apendicitis. “Cuando me d','La silueta del médico José Gregorio Hernández apareció en una radiografía realizada a un adolescente de 13 años en el ambulatorio del Seguro Social en Cabimas, en Venezuela.\n\nEl muchacho presentaba vómitos, fiebre y dolor por lo que le realizaron la placa para descartar una apendicitis. “Cuando me dan la placa y la observo, yo estaba en la sala de espera y fue allí donde observé la imagen de José Gregorio Hernández. Todos los que estaban conmigo, unas 10 personas, también la vieron”, aseguró Fabiola Inciarte, ','0000-00-00',1,42,'2013-03-27 10:22:52','2013-03-27 10:23:09','mision',0,'0000-00-00 00:00:00','<p>La silueta del médico José Gregorio Hernández apareció en una radiografía realizada a un adolescente de 13 años en el ambulatorio del Seguro Social en Cabimas, en Venezuela.</p>\n\n<p>El muchacho presentaba vómitos, fiebre y dolor por lo que le realizaron la placa para descartar una apendicitis. “Cuando me d</p>\n','<p>La silueta del médico José Gregorio Hernández apareció en una radiografía realizada a un adolescente de 13 años en el ambulatorio del Seguro Social en Cabimas, en Venezuela.</p>\n\n<p>El muchacho presentaba vómitos, fiebre y dolor por lo que le realizaron la placa para descartar una apendicitis. “Cuando me dan la placa y la observo, yo estaba en la sala de espera y fue allí donde observé la imagen de José Gregorio Hernández. Todos los que estaban conmigo, unas 10 personas, también la vieron”, aseguró Fabiola Inciarte,</p>\n',0,0,'',NULL),
 (39,'Titulo de Ejemplo','Intro de ejemplo','','0000-00-00',1,43,'2013-03-27 10:25:13','0000-00-00 00:00:00','mision',0,'0000-00-00 00:00:00','<p>Intro de ejemplo</p>\n','',0,0,'',NULL),
 (40,'empresa5','Intro de ecioli se encargó de aclarar que durante la reunión se discutirán temas \"de la agenda educativa\" y no salariales debido a que no se trata de una reunión paritaria. Sin embargo, se espera que el gobernador haga el intento por destrabar la situación.\n\nLos sindicatos de los maestros siguen sin','','0000-00-00',1,44,'2013-03-27 13:29:09','2013-03-27 13:29:26','mision',0,'0000-00-00 00:00:00','<p>Intro de ecioli se encargó de aclarar que durante la reunión se discutirán temas \"de la agenda educativa\" y no salariales debido a que no se trata de una reunión paritaria. Sin embargo, se espera que el gobernador haga el intento por destrabar la situación.</p>\n\n<p>Los sindicatos de los maestros siguen sin</p>\n','',1,0,'',NULL),
 (41,'Titulo de Ejemplo','Intro de ejemplo','','0000-00-00',1,45,'2013-03-27 13:31:17','0000-00-00 00:00:00','mision',0,'0000-00-00 00:00:00','<p>Intro de ejemplo</p>\n','',0,0,'',NULL),
 (42,'Titulo de Ejemplo','Intro de ejemplo','','0000-00-00',1,46,'2013-03-27 13:32:25','0000-00-00 00:00:00','mision',0,'0000-00-00 00:00:00','<p>Intro de ejemplo</p>\n','',0,0,'',NULL),
 (43,'Titulo de Ejemplo','Intro de ejemplo','','0000-00-00',1,47,'2013-03-27 13:35:38','0000-00-00 00:00:00','mision',0,'0000-00-00 00:00:00','<p>Intro de ejemplo</p>\n','',0,0,'',NULL),
 (44,'Titulo de Ejemplo','Intro de ejemplo','','0000-00-00',1,48,'2013-03-27 13:36:33','0000-00-00 00:00:00','mision',0,'0000-00-00 00:00:00','<p>Intro de ejemplo</p>\n','',0,0,'',NULL),
 (45,'Titulo de Ejemplo','Intro de ejemplo','','0000-00-00',1,49,'2013-03-27 13:39:55','0000-00-00 00:00:00','mision',0,'0000-00-00 00:00:00','<p>Intro de ejemplo</p>\n','',0,0,'',NULL),
 (46,'Titulo de Ejemplo','Intro de ejemplo','','0000-00-00',1,50,'2013-03-27 13:41:17','0000-00-00 00:00:00','mision',0,'0000-00-00 00:00:00','<p>Intro de ejemplo</p>\n','',0,0,'',NULL),
 (47,'Titulo de Ejemplo','Intro de ejemplo','','0000-00-00',1,73,'2013-04-16 09:50:34','2013-04-16 09:51:56','causa',1.32222e+08,'0000-00-00 00:00:00','<p>Intro de ejemplo</p>\n','',0,0,'',NULL),
 (48,'Titulo de Ejemplo','Intro de ejemplo','','0000-00-00',1,75,'2013-05-09 08:51:48','0000-00-00 00:00:00','causa',0,'0000-00-00 00:00:00','<p>Intro de ejemplo</p>\n','',0,0,'',NULL),
 (49,'Titulo de Ejemplo','Intro de ejemplo','','0000-00-00',1,76,'2013-05-09 12:10:33','2013-06-07 15:12:23','causa',0,'0000-00-00 00:00:00','<p>Intro de ejemplo</p>\n','',0,0,'',NULL),
 (50,'Ayuda en Gral Guemes','El 25 de mayo se llevar a acabo la ayuda a los pobres de la localidad de general guemes - salta','Este evento tiene como fin la participación de la ciudadania para la ayuda de recolección de alimentos para brindarles a las personas mas **necesitadas**.','0000-00-00',1,78,'2013-05-10 12:16:44','2013-06-07 14:57:50','causa',5000,'0000-00-00 00:00:00','<p>El 25 de mayo se llevar a acabo la ayuda a los pobres de la localidad de general guemes - salta</p>\n','<p>Este evento tiene como fin la participación de la ciudadania para la ayuda de recolección de alimentos para brindarles a las personas mas <strong>necesitadas</strong>.</p>\n',4,2,'',NULL),
 (51,'Celebración dia de la Madre','Invitación a toda la ciudadanía a participar de evento organizado por la fundación manos libres para celebrar el día de la madre.','Este evento esta destinado a todas las personas de comunidad de general guemes y alrededores a participar de este dia tan especial para las madres.','2013-05-10',1,78,'2013-05-10 12:21:37','0000-00-00 00:00:00','noticia',0,'0000-00-00 00:00:00','<p>Invitación a toda la ciudadanía a participar de evento organizado por la fundación manos libres para celebrar el día de la madre.</p>\n','<p>Este evento esta destinado a todas las personas de comunidad de general guemes y alrededores a participar de este dia tan especial para las madres.</p>\n',1,1,'',NULL),
 (52,'Ayudar a los pobres','Misión de ayudar a todas las personas mas necesitdas','Esta Misión tiene como objtivo llevar adelante durante el año 2013.','0000-00-00',1,79,'2013-05-10 12:38:59','2013-05-10 12:42:12','mision',0,'1979-05-10 15:04:09','<p>Misión de ayudar a todas las personas mas necesitdas</p>\n','<p>Esta Misión tiene como objtivo llevar adelante durante el año 2013.</p>\n',4,2,'San Martin 585',NULL),
 (53,'Ayuda a la trata de personas','Organización sin fines de lucro para la ayuda a la trata de personas.','Organización sin fines de lucro para la ayuda a la trata de personas.','0000-00-00',1,83,'2013-05-17 12:13:40','2013-06-07 15:09:53','causa',5000,'0000-00-00 00:00:00','<p>Organización sin fines de lucro para la ayuda a la trata de personas.</p>\n','<p>Organización sin fines de lucro para la ayuda a la trata de personas.</p>\n',0,0,'',NULL),
 (54,'Industria Cementos','Construcción del mejor cemento en Argentina','Esta empresa es lider del marcado de materiales de base para construcciones.','0000-00-00',1,84,'2013-05-17 13:44:23','2013-05-17 13:45:35','mision',0,'1954-03-18 06:06:04','<p>Construcción del mejor cemento en Argentina</p>\n','<p>Esta empresa es lider del marcado de materiales de base para construcciones.</p>\n',0,0,'Saavedra 1502',NULL),
 (55,'Titulo de Ejemplo','Intro de ejemplo','','0000-00-00',1,86,'2013-06-01 04:23:48','0000-00-00 00:00:00','mision',0,'0000-00-00 00:00:00','<p>Intro de ejemplo</p>\n','',0,0,'',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `contenidos` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`donaciones`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`donaciones`;
CREATE TABLE  `dugnadin_rsdb`.`donaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `puntos` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ong_id` int(11) NOT NULL,
  `contenido_id` int(11) NOT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dugnadin_rsdb`.`donaciones`
--

/*!40000 ALTER TABLE `donaciones` DISABLE KEYS */;
LOCK TABLES `donaciones` WRITE;
INSERT INTO `dugnadin_rsdb`.`donaciones` VALUES  (349,1,82,'2013-06-07 14:51:31','0000-00-00 00:00:00',83,53,NULL),
 (350,1,82,'2013-06-07 14:52:12','0000-00-00 00:00:00',83,53,NULL),
 (351,1,82,'2013-06-07 14:52:12','0000-00-00 00:00:00',83,53,NULL),
 (352,1,82,'2013-06-07 14:52:53','0000-00-00 00:00:00',83,53,NULL),
 (353,1,82,'2013-06-07 14:52:53','0000-00-00 00:00:00',83,53,NULL),
 (354,1,82,'2013-06-07 14:52:53','0000-00-00 00:00:00',83,53,NULL),
 (355,1,82,'2013-06-07 14:57:50','0000-00-00 00:00:00',78,50,NULL),
 (356,1,82,'2013-06-07 14:58:42','0000-00-00 00:00:00',83,53,NULL),
 (357,1,82,'2013-06-07 14:59:43','0000-00-00 00:00:00',76,49,NULL),
 (358,1,82,'2013-06-07 14:59:52','0000-00-00 00:00:00',39,35,NULL),
 (359,1,82,'2013-06-07 15:09:53','0000-00-00 00:00:00',83,53,NULL),
 (360,1,82,'2013-06-07 15:12:23','0000-00-00 00:00:00',76,49,NULL),
 (361,1,82,'2013-06-07 15:12:45','0000-00-00 00:00:00',73,47,NULL),
 (362,1,82,'2013-06-07 15:14:52','0000-00-00 00:00:00',38,34,NULL),
 (363,1,82,'2013-06-07 15:16:44','0000-00-00 00:00:00',37,33,NULL),
 (364,1,82,'2013-06-07 15:20:17','0000-00-00 00:00:00',35,31,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `donaciones` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`etiqueta_users`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`etiqueta_users`;
CREATE TABLE  `dugnadin_rsdb`.`etiqueta_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `tagger_id` int(11) NOT NULL,
  `etiqueta_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dugnadin_rsdb`.`etiqueta_users`
--

/*!40000 ALTER TABLE `etiqueta_users` DISABLE KEYS */;
LOCK TABLES `etiqueta_users` WRITE;
INSERT INTO `dugnadin_rsdb`.`etiqueta_users` VALUES  (2,12,13,4,'2012-04-10 21:52:41','0000-00-00 00:00:00'),
 (3,14,13,3,'2012-04-11 19:49:30','0000-00-00 00:00:00');
UNLOCK TABLES;
/*!40000 ALTER TABLE `etiqueta_users` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`etiquetas`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`etiquetas`;
CREATE TABLE  `dugnadin_rsdb`.`etiquetas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` enum('ong','empresa') COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `cached_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` enum('gris','verde','amarillo','rojo','celeste','negro') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'gris',
  `minimo` int(11) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dugnadin_rsdb`.`etiquetas`
--

/*!40000 ALTER TABLE `etiquetas` DISABLE KEYS */;
LOCK TABLES `etiquetas` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `etiquetas` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`feedprocesados`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`feedprocesados`;
CREATE TABLE  `dugnadin_rsdb`.`feedprocesados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `feed_id` varchar(255) DEFAULT NULL,
  `feed_message` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `feed_user_id` varchar(255) DEFAULT NULL,
  `sumado` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dugnadin_rsdb`.`feedprocesados`
--

/*!40000 ALTER TABLE `feedprocesados` DISABLE KEYS */;
LOCK TABLES `feedprocesados` WRITE;
INSERT INTO `dugnadin_rsdb`.`feedprocesados` VALUES  (2,74,'1078733970_10200739787671913',NULL,NULL,'1078733970',1,'2013-07-07 00:02:40','2013-07-07 00:02:40'),
 (10,88,'100000295931432_512590215427505',NULL,NULL,'100000295931432',1,'2013-07-08 15:03:20','2013-07-08 15:03:20'),
 (4,74,'1078733970_10200740296884643','testing in appserver',NULL,'1078733970',1,'2013-07-07 02:39:10','2013-07-07 02:39:11'),
 (5,74,'1078733970_10200740236443132','testing..',NULL,'1078733970',1,'2013-07-07 02:39:10','2013-07-07 02:39:11'),
 (6,74,'1078733970_10200740681254252','testing 3 ...',NULL,'1078733970',1,'2013-07-07 02:42:16','2013-07-07 02:42:16'),
 (7,74,'1078733970_10200748502649782','frio en salta!',NULL,'1078733970',1,'2013-07-08 12:58:24','2013-07-08 12:58:24'),
 (11,74,'1078733970_10200749328870437',NULL,NULL,'1078733970',1,'2013-07-08 16:10:25','2013-07-08 16:10:26'),
 (12,74,'1078733970_10200764829977955','jajaj muy bueno Jakeline Mel Flores',NULL,'1078733970',1,'2013-07-10 20:44:35','2013-07-10 20:44:36'),
 (13,74,'1078733970_10200749405352349','jej que loco!\n',NULL,'1078733970',1,'2013-07-10 20:44:36','2013-07-10 20:44:36'),
 (14,88,'100000295931432_623033861049806','fuck!!',NULL,'100000295931432',1,'2013-07-11 03:09:32','2013-07-11 03:09:32'),
 (15,88,'100000295931432_623049011048291','meeting for people today!',NULL,'100000295931432',1,'2013-07-11 03:12:14','2013-07-11 03:12:14'),
 (16,74,'1078733970_10200767596807124','test.',NULL,'1078733970',1,'2013-07-16 18:54:26','2013-07-16 18:54:26'),
 (17,74,'1078733970_10200800846118336','test',NULL,'1078733970',1,'2013-07-17 02:02:25','2013-07-17 02:02:26'),
 (18,74,'1078733970_10200800528350392',':)',NULL,'1078733970',1,'2013-07-17 02:02:25','2013-07-17 02:02:26'),
 (19,74,'1078733970_10200800505669825','first step',NULL,'1078733970',1,'2013-07-17 02:02:26','2013-07-17 02:02:26'),
 (20,74,'1078733970_10200801210647449','testing',NULL,'1078733970',1,'2013-07-17 02:04:16','2013-07-17 02:04:16'),
 (21,74,'1078733970_10200801209487420',NULL,NULL,'1078733970',1,'2013-07-17 02:04:16','2013-07-17 02:04:16'),
 (22,74,'1078733970_10200801221287715','test',NULL,'1078733970',1,'2013-07-17 02:05:50','2013-07-17 02:05:50'),
 (23,74,'1078733970_10200801278769152','testing',NULL,'1078733970',1,'2013-07-17 02:14:43','2013-07-17 02:14:43');
UNLOCK TABLES;
/*!40000 ALTER TABLE `feedprocesados` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`karmas`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`karmas`;
CREATE TABLE  `dugnadin_rsdb`.`karmas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dugnadin_rsdb`.`karmas`
--

/*!40000 ALTER TABLE `karmas` DISABLE KEYS */;
LOCK TABLES `karmas` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `karmas` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`puntos`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`puntos`;
CREATE TABLE  `dugnadin_rsdb`.`puntos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dugnadin_rsdb`.`puntos`
--

/*!40000 ALTER TABLE `puntos` DISABLE KEYS */;
LOCK TABLES `puntos` WRITE;
INSERT INTO `dugnadin_rsdb`.`puntos` VALUES  (28,82,1,'SUMA','2013-06-07 14:47:56','0000-00-00 00:00:00'),
 (29,82,5,'SUMA','2013-06-07 14:50:04','0000-00-00 00:00:00'),
 (30,82,1,'SUMA','2013-06-07 14:50:21','0000-00-00 00:00:00'),
 (31,82,2,'SUMA','2013-06-07 14:57:05','0000-00-00 00:00:00'),
 (32,82,1,'SUMA','2013-06-07 14:57:25','0000-00-00 00:00:00'),
 (33,82,3,'SUMA','2013-06-07 15:09:34','0000-00-00 00:00:00'),
 (34,82,1,'SUMA','2013-06-07 15:14:04','0000-00-00 00:00:00'),
 (35,82,2,'SUMA','2013-06-07 15:14:20','0000-00-00 00:00:00'),
 (36,82,3,'SUMA','2013-06-08 03:05:03','0000-00-00 00:00:00'),
 (37,82,4,'SUMA','2013-06-08 03:06:04','0000-00-00 00:00:00'),
 (38,74,1,'SUMA','2013-07-07 00:02:40','0000-00-00 00:00:00'),
 (39,88,1,'SUMA','2013-07-07 01:24:36','0000-00-00 00:00:00'),
 (40,74,2,'SUMA','2013-07-07 02:39:11','0000-00-00 00:00:00'),
 (41,74,1,'SUMA','2013-07-07 02:42:16','0000-00-00 00:00:00'),
 (42,74,1,'SUMA','2013-07-08 12:58:24','0000-00-00 00:00:00'),
 (43,88,1,'SUMA','2013-07-08 14:25:52','0000-00-00 00:00:00'),
 (44,88,1,'SUMA','2013-07-08 14:30:51','0000-00-00 00:00:00'),
 (45,88,1,'SUMA','2013-07-08 15:03:20','0000-00-00 00:00:00'),
 (46,74,1,'SUMA','2013-07-08 16:10:26','0000-00-00 00:00:00'),
 (47,74,2,'SUMA','2013-07-10 20:44:36','0000-00-00 00:00:00'),
 (48,88,1,'SUMA','2013-07-11 03:09:32','0000-00-00 00:00:00'),
 (49,88,1,'SUMA','2013-07-11 03:12:14','0000-00-00 00:00:00'),
 (50,85,1,'SUMA','2013-07-11 03:21:42','0000-00-00 00:00:00'),
 (51,85,1,'SUMA','2013-07-11 03:22:17','0000-00-00 00:00:00'),
 (52,74,1,'SUMA','2013-07-16 18:54:26','0000-00-00 00:00:00'),
 (53,74,2,'SUMA','2013-07-16 22:25:29','0000-00-00 00:00:00'),
 (54,74,2,'SUMA','2013-07-16 23:02:02','0000-00-00 00:00:00'),
 (55,74,2,'SUMA','2013-07-16 23:09:14','0000-00-00 00:00:00'),
 (56,74,6,'SUMA','2013-07-17 02:02:26','0000-00-00 00:00:00'),
 (57,74,4,'SUMA','2013-07-17 02:04:16','0000-00-00 00:00:00'),
 (58,74,2,'SUMA','2013-07-17 02:05:50','0000-00-00 00:00:00'),
 (59,74,2,'SUMA','2013-07-17 02:14:43','0000-00-00 00:00:00'),
 (60,74,2,'SUMA','2013-07-17 02:19:36','0000-00-00 00:00:00'),
 (61,74,2,'SUMA','2013-07-17 02:20:54','0000-00-00 00:00:00'),
 (62,74,2,'SUMA','2013-07-17 02:29:04','0000-00-00 00:00:00'),
 (63,74,1,'SUMA','2013-07-17 02:46:20','0000-00-00 00:00:00'),
 (64,74,1,'SUMA','2013-07-17 03:03:50','0000-00-00 00:00:00');
UNLOCK TABLES;
/*!40000 ALTER TABLE `puntos` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`roles`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`roles`;
CREATE TABLE  `dugnadin_rsdb`.`roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dugnadin_rsdb`.`roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
LOCK TABLES `roles` WRITE;
INSERT INTO `dugnadin_rsdb`.`roles` VALUES  (3,'login','Necesario para loguearse'),
 (4,'admin','Administrador');
UNLOCK TABLES;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`roles_users`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`roles_users`;
CREATE TABLE  `dugnadin_rsdb`.`roles_users` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`),
  CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dugnadin_rsdb`.`roles_users`
--

/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
LOCK TABLES `roles_users` WRITE;
INSERT INTO `dugnadin_rsdb`.`roles_users` VALUES  (2,3),
 (32,3),
 (33,3),
 (34,3),
 (35,3),
 (36,3),
 (37,3),
 (38,3),
 (39,3),
 (40,3),
 (41,3),
 (42,3),
 (43,3),
 (44,3),
 (45,3),
 (46,3),
 (47,3),
 (48,3),
 (49,3),
 (50,3),
 (51,3),
 (52,3),
 (53,3),
 (54,3),
 (55,3),
 (56,3),
 (57,3),
 (58,3),
 (59,3),
 (60,3),
 (61,3),
 (62,3),
 (63,3),
 (64,3),
 (67,3),
 (71,3),
 (72,3),
 (73,3),
 (74,3),
 (76,3),
 (78,3),
 (79,3),
 (80,3),
 (82,3),
 (83,3),
 (84,3),
 (85,3),
 (86,3),
 (88,3),
 (2,4),
 (32,4),
 (33,4),
 (34,4),
 (35,4),
 (36,4),
 (37,4),
 (38,4),
 (39,4),
 (40,4),
 (41,4),
 (42,4),
 (43,4),
 (44,4),
 (45,4),
 (46,4),
 (47,4),
 (48,4),
 (49,4),
 (50,4),
 (51,4),
 (52,4),
 (53,4),
 (54,4),
 (55,4),
 (56,4),
 (57,4),
 (58,4),
 (59,4),
 (60,4),
 (61,4),
 (62,4),
 (63,4),
 (64,4),
 (67,4),
 (71,4),
 (72,4),
 (73,4),
 (74,4),
 (76,4),
 (78,4),
 (79,4),
 (80,4),
 (82,4),
 (83,4),
 (84,4),
 (85,4),
 (86,4),
 (88,4);
UNLOCK TABLES;
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`status`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`status`;
CREATE TABLE  `dugnadin_rsdb`.`status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `statusgroup_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dugnadin_rsdb`.`status`
--

/*!40000 ALTER TABLE `status` DISABLE KEYS */;
LOCK TABLES `status` WRITE;
INSERT INTO `dugnadin_rsdb`.`status` VALUES  (1,'Sumar todas mis publicaciones.',1,NULL,NULL),
 (2,'Sumar las publicaciones que mencionan a la plataforma.',1,NULL,NULL),
 (3,'Sumar las publicaciones que mencionan a una ong de la plataforma.',1,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`statusgroups`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`statusgroups`;
CREATE TABLE  `dugnadin_rsdb`.`statusgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dugnadin_rsdb`.`statusgroups`
--

/*!40000 ALTER TABLE `statusgroups` DISABLE KEYS */;
LOCK TABLES `statusgroups` WRITE;
INSERT INTO `dugnadin_rsdb`.`statusgroups` VALUES  (1,'Config twitter de usuarios',NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `statusgroups` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`tweetprocesados`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`tweetprocesados`;
CREATE TABLE  `dugnadin_rsdb`.`tweetprocesados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `tweet_id` varchar(255) NOT NULL,
  `tweet_message` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `twitter_user_id` varchar(255) NOT NULL,
  `retweet_count` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `sumado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1485 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dugnadin_rsdb`.`tweetprocesados`
--

/*!40000 ALTER TABLE `tweetprocesados` DISABLE KEYS */;
LOCK TABLES `tweetprocesados` WRITE;
INSERT INTO `dugnadin_rsdb`.`tweetprocesados` VALUES  (1452,82,'343033304146120704','probando 3','web','370537861','0','2013-06-07 14:47:56','2013-06-07 14:47:56',1),
 (1453,82,'343062312514617344','probando 8','web','370537861','0','2013-06-07 14:50:04','2013-06-07 14:50:04',1),
 (1454,82,'343062289538236416','probando 7','web','370537861','0','2013-06-07 14:50:04','2013-06-07 14:50:04',1),
 (1455,82,'343062260706598912','probando 6','web','370537861','0','2013-06-07 14:50:04','2013-06-07 14:50:04',1),
 (1456,82,'343062232021745665','probando 5','web','370537861','0','2013-06-07 14:50:04','2013-06-07 14:50:04',1),
 (1457,82,'343062201034211328','probando 4','web','370537861','0','2013-06-07 14:50:04','2013-06-07 14:50:04',1),
 (1458,82,'343062334547320833','probando 9','web','370537861','0','2013-06-07 14:50:21','2013-06-07 14:50:21',1),
 (1459,82,'343064085648261120','probando 11','web','370537861','0','2013-06-07 14:57:05','2013-06-07 14:57:05',1),
 (1460,82,'343064069084950528','prbando 10','web','370537861','0','2013-06-07 14:57:05','2013-06-07 14:57:05',1),
 (1461,82,'343064113003507716','probando 12','web','370537861','0','2013-06-07 14:57:25','2013-06-07 14:57:25',1),
 (1462,82,'343067199059161089','probando 15','web','370537861','0','2013-06-07 15:09:34','2013-06-07 15:09:34',1),
 (1463,82,'343067178762911745','prbando 14','web','370537861','0','2013-06-07 15:09:34','2013-06-07 15:09:34',1),
 (1464,82,'343067157845921792','probando 13','web','370537861','0','2013-06-07 15:09:34','2013-06-07 15:09:34',1),
 (1465,82,'343068337569427456','probando 16','web','370537861','0','2013-06-07 15:14:04','2013-06-07 15:14:04',1),
 (1466,82,'343068398290358272','probando 18','web','370537861','0','2013-06-07 15:14:20','2013-06-07 15:14:20',1),
 (1467,82,'343068373774659584','probando 17','web','370537861','0','2013-06-07 15:14:20','2013-06-07 15:14:20',1),
 (1468,82,'343247254846570496','prbando 22','web','370537861','0','2013-06-08 03:05:03','2013-06-08 03:05:03',1),
 (1469,82,'343247224920231936','probando 21','web','370537861','0','2013-06-08 03:05:03','2013-06-08 03:05:03',1),
 (1470,82,'343247179210686465','probando 20','web','370537861','0','2013-06-08 03:05:03','2013-06-08 03:05:03',1),
 (1471,82,'343247405233364992','probando 28','web','370537861','0','2013-06-08 03:06:04','2013-06-08 03:06:04',1),
 (1472,82,'343247361390297088','probando 26','web','370537861','0','2013-06-08 03:06:04','2013-06-08 03:06:04',1),
 (1473,82,'343247322957889536','probando 25','web','370537861','0','2013-06-08 03:06:04','2013-06-08 03:06:04',1),
 (1474,82,'343247291991355394','probando 24','web','370537861','0','2013-06-08 03:06:04','2013-06-08 03:06:04',1),
 (1475,85,'355208302247948288','probando 1','web','1442885886','0','2013-07-11 03:21:42','2013-07-11 03:21:42',1),
 (1476,85,'355210358950084608','probando algo jje','web','1442885886','0','2013-07-11 03:22:17','2013-07-11 03:22:17',1),
 (1477,74,'335437286667857920','six test with @miguelponce01  and with #dugnading','web','82947228','0','2013-07-16 22:25:28','2013-07-16 22:25:29',1),
 (1478,74,'357311129304834049','testing','web','82947228','0','2013-07-16 23:02:02','2013-07-16 23:02:02',1),
 (1479,74,'357321004768432128','first step','web','82947228','0','2013-07-16 23:09:13','2013-07-16 23:09:14',1),
 (1480,74,'357368868357939200','2:19','web','82947228','0','2013-07-17 02:19:36','2013-07-17 02:19:36',1),
 (1481,74,'357369263209725952','02:20','web','82947228','0','2013-07-17 02:20:54','2013-07-17 02:20:54',1),
 (1482,74,'357371267772448770','02:29','web','82947228','0','2013-07-17 02:29:04','2013-07-17 02:29:04',1),
 (1483,74,'357375590292131840','genial me salio #ILUSIONCONVOS','web','82947228','0','2013-07-17 02:46:20','2013-07-17 02:46:20',1),
 (1484,74,'357377009606852609','vi una camioneta del vecino :D #ILUSIONCONVOSl','web','82947228','0','2013-07-17 03:03:50','2013-07-17 03:03:50',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `tweetprocesados` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`user_badges`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`user_badges`;
CREATE TABLE  `dugnadin_rsdb`.`user_badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dugnadin_rsdb`.`user_badges`
--

/*!40000 ALTER TABLE `user_badges` DISABLE KEYS */;
LOCK TABLES `user_badges` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_badges` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`userfeeds`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`userfeeds`;
CREATE TABLE  `dugnadin_rsdb`.`userfeeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `max_date` varchar(255) DEFAULT NULL,
  `raw_json` text,
  `procesado` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dugnadin_rsdb`.`userfeeds`
--

/*!40000 ALTER TABLE `userfeeds` DISABLE KEYS */;
LOCK TABLES `userfeeds` WRITE;
INSERT INTO `dugnadin_rsdb`.`userfeeds` VALUES  (5,74,'1373163942','[{\"id\":\"1078733970_10200739787671913\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"created_time\":1373163942,\"updated_time\":1373163942}]',1,'2013-07-07 00:02:40','2013-07-07 00:02:40'),
 (15,88,'1373518766','[{\"id\":\"100000295931432_623033861049806\",\"from\":{\"name\":\"Cesar Guerrero\",\"id\":\"100000295931432\"},\"message\":\"fuck!!\",\"created_time\":1373518766,\"updated_time\":1373518766}]',1,'2013-07-11 03:09:32','2013-07-11 03:09:32'),
 (7,74,'1373167637','[{\"id\":\"1078733970_10200740296884643\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"message\":\"testing in appserver\",\"created_time\":1373167637,\"updated_time\":1373167637},{\"id\":\"1078733970_10200740236443132\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"message\":\"testing..\",\"created_time\":1373166664,\"updated_time\":1373166664}]',1,'2013-07-07 02:39:10','2013-07-07 02:39:10'),
 (8,74,'1373175730','[{\"id\":\"1078733970_10200740681254252\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"message\":\"testing 3 ...\",\"created_time\":1373175730,\"updated_time\":1373175730}]',1,'2013-07-07 02:42:16','2013-07-07 02:42:16'),
 (9,74,'1373299079','[{\"id\":\"1078733970_10200748502649782\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"message\":\"frio en salta!\",\"created_time\":1373299079,\"updated_time\":1373299079}]',1,'2013-07-08 12:58:24','2013-07-08 12:58:24'),
 (13,74,'1373310540','[{\"id\":\"1078733970_10200749328870437\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"name\":\"Timeline Photos\",\"caption\":\"Ing. Vanesa Salinas\",\"created_time\":1373310540,\"updated_time\":1373310540}]',1,'2013-07-08 16:10:25','2013-07-08 16:10:25'),
 (14,74,'1373487409','[{\"id\":\"1078733970_10200764829977955\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"message\":\"jajaj muy bueno Jakeline Mel Flores\",\"name\":\"Timeline Photos\",\"caption\":\"Ing. Vanesa Salinas\",\"created_time\":1373487409,\"updated_time\":1373487409},{\"id\":\"1078733970_10200749405352349\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"message\":\"jej que loco!\\n\",\"name\":\"Timeline Photos\",\"caption\":\"Toca formatear!\",\"created_time\":1373311344,\"updated_time\":1373311344}]',1,'2013-07-10 20:44:35','2013-07-10 20:44:36'),
 (16,88,'1373523124','[{\"id\":\"100000295931432_623049011048291\",\"from\":{\"name\":\"Cesar Guerrero\",\"id\":\"100000295931432\"},\"message\":\"meeting for people today!\",\"created_time\":1373523124,\"updated_time\":1373523124}]',1,'2013-07-11 03:12:14','2013-07-11 03:12:14'),
 (17,74,'1373524300','[{\"id\":\"1078733970_10200767596807124\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"message\":\"test.\",\"created_time\":1373524300,\"updated_time\":1373524300}]',1,'2013-07-16 18:54:26','2013-07-16 18:54:26'),
 (18,74,'1374032384','[{\"id\":\"1078733970_10200800846118336\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"message\":\"test\",\"created_time\":1374032384,\"updated_time\":1374032384},{\"id\":\"1078733970_10200800528350392\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"message\":\":)\",\"name\":\"Timeline Photos\",\"created_time\":1374027349,\"updated_time\":1374027349},{\"id\":\"1078733970_10200800505669825\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"message\":\"first step\",\"created_time\":1374026943,\"updated_time\":1374026943}]',1,'2013-07-17 02:02:25','2013-07-17 02:02:26'),
 (19,74,'1374037409','[{\"id\":\"1078733970_10200801210647449\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"message\":\"testing\",\"created_time\":1374037409,\"updated_time\":1374037409},{\"id\":\"1078733970_10200801209487420\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"created_time\":1374037394,\"updated_time\":1374037394}]',1,'2013-07-17 02:04:16','2013-07-17 02:04:16'),
 (20,74,'1374037536','[{\"id\":\"1078733970_10200801221287715\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"message\":\"test\",\"created_time\":1374037536,\"updated_time\":1374037536}]',1,'2013-07-17 02:05:50','2013-07-17 02:05:50'),
 (21,74,'1374038013','[{\"id\":\"1078733970_10200801278769152\",\"from\":{\"name\":\"Johnny Guzman\",\"id\":\"1078733970\"},\"message\":\"testing\",\"created_time\":1374038013,\"updated_time\":1374038013}]',1,'2013-07-17 02:14:43','2013-07-17 02:14:43');
UNLOCK TABLES;
/*!40000 ALTER TABLE `userfeeds` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`users`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`users`;
CREATE TABLE  `dugnadin_rsdb`.`users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar_file_name` varchar(255) NOT NULL,
  `avatar_file_type` varchar(255) NOT NULL,
  `avatar_file_size` varchar(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `webpage` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `ocupacion` varchar(255) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `lugar_trabajo` varchar(255) NOT NULL,
  `razon_social` varchar(255) NOT NULL,
  `personeria_juridica` varchar(255) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `localidad` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `cuit` varchar(11) NOT NULL,
  `tipo` enum('persona','ong','empresa','admin') NOT NULL,
  `email_contacto` varchar(255) NOT NULL,
  `email_contact` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `monto` float DEFAULT NULL,
  `equivalencia` float DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dugnadin_rsdb`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `dugnadin_rsdb`.`users` VALUES  (2,'admin@dugnading.com','admin','',20,1368111971,'2012-03-03 21:12:59','2013-05-09 12:06:11','','','','Administrador','Dugnading','','','','','','0000-00-00','','','','','','','','','','','','admin','','',1,NULL,NULL,NULL),
 (32,'ong9@hotmail.com','ong9','f5211acf52838744d1fd27c063df8742',1,1364317192,'2013-03-26 13:59:51','2013-03-26 13:59:52','UtPRmq06.jpg','image/jpeg','8.168945','Sanchez Falkowsky','sanchez','','','','iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en','543814344889','0000-00-00','','','','ong9','','','','tucuman','tucuman','','','ong','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (33,'ong10@hotmail.com','ong10','e0449bf327b33fdbacfea0a5a71c388d964e12d9b4fa7935f36f7ff5b75e608d',7,1369927788,'2013-03-26 14:01:01','2013-05-30 12:29:48','A1bksatD.jpg','image/jpeg','8.168945','Sanchez Falkowsky','sanchez','','','','iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en','543814344889','0000-00-00','','','','ong10','','','','tucuman','tucuman','','','ong','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (34,'ong11@hotmail.com','ong11','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364317331,'2013-03-26 14:02:11','2013-03-26 14:02:11','G9oH8t1h.jpg','image/jpeg','8.168945','Sanchez Falkowsky','sanchez','','','','iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en','543814344889','0000-00-00','','','','ong11','','','','tucuman','tucuman','','','ong','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (35,'ong12@hotmail.com','ong12','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364317416,'2013-03-26 14:03:36','2013-03-26 14:03:36','ikR4jLeY.jpg','image/jpeg','8.168945','Sanchez Falkowsky','sanchez','','','','iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en','543814344889','0000-00-00','','','','ong12','','','','tucuman','tucuman','','','ong','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (36,'ong13@hotmail.com','ong13','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364317489,'2013-03-26 14:04:49','2013-03-26 14:04:49','1CmS8PaC.jpg','image/jpeg','8.168945','Sanchez Falkowsky','sanchez','','','','iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en','543814344889','0000-00-00','','','','ong13','','','','tucuman','tucuman','','','ong','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (37,'ong14@hotmail.com','ong14','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364317588,'2013-03-26 14:06:28','2013-03-26 14:06:28','jDVcDRd2.jpg','image/jpeg','8.168945','Sanchez Falkowsky','sDVsdvsdv','','','','iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en','543814344889','0000-00-00','','','','ong14','','','','tucuman','tucuman','','','ong','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (38,'ong15@hotmail.com','ong15','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364317709,'2013-03-26 14:08:29','2013-03-26 14:08:29','6tup3hO0.jpg','image/jpeg','8.168945','Sanchez Falkowsky','sanchez','','','','iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en','543814344889','0000-00-00','','','','ong15','','','','tucuman','tucuman','','','ong','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (39,'ong16@hotmail.com','ong16','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364317779,'2013-03-26 14:09:39','2013-03-26 14:09:39','fU9Q0h5C.jpg','image/jpeg','8.168945','Sanchez Falkowsky','sanchez','','','','iempo inestable, fresco, con cielo nublado es el pronóstico para el largo feriado de Semana Santa, que se prolongará hasta el lunes y martes.\n\nLas temperaturas máximas oscilarán en','543814344889','0000-00-00','','','','ong16','','','','tucuman','tucuman','','','ong','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (40,'emp1@hotmail.com','empresa1','a24df02d86e0f2c0c70c1423a90837a8',2,1364573981,'2013-03-26 22:06:58','2013-03-29 13:19:41','B8SnUJTS.jpeg','image/jpeg','5.943359','Roxana','Sanchez Falkowsky','','','','El director ejecutivo de la Asociación de Supermercados, Juan Vasco Martínez, informó que finalmente serán las propias cadenas las que emitirán un nuevo plástico para que sus clien','543814344889','0000-00-00','','','','empresa1','','','','tucuman','tucuman','','','empresa','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (41,'emp2@hotmail.com','emp2','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',2,1364390764,'2013-03-27 10:19:07','2013-03-27 10:26:04','SspSJ0Wj.jpg','image/jpeg','8.168945','Roxana','Sanchez Falkowsky','','','','La silueta del médico José Gregorio Hernández apareció en una radiografía realizada a un adolescente de 13 años en el ambulatorio del Seguro Social en Cabimas, en Venezuela.\n\nEl mu','543814344889','0000-00-00','','','','empresa2','','','','tucuman','tucuman','','','empresa','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (42,'emp3@hotmail.com','emp3','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364390572,'2013-03-27 10:22:52','2013-03-27 10:22:52','CL6DFzVf.jpg','image/jpeg','8.168945','Roxana','Sanchez Falkowsky','','','','La silueta del médico José Gregorio Hernández apareció en una radiografía realizada a un adolescente de 13 años en el ambulatorio del Seguro Social en Cabimas, en Venezuela.\n\nEl mu','543814344889','0000-00-00','','','','empresa3','','','','tucuman','tucuman','','','empresa','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (43,'emp4@hotmail.com','emp4','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364390713,'2013-03-27 10:25:12','2013-03-27 10:25:13','K8JdXLLP.jpg','image/jpeg','8.168945','Roxana','Sanchez Falkowsky','','','','La silueta del médico José Gregorio Hernández apareció en una radiografía realizada a un adolescente de 13 años en el ambulatorio del Seguro Social en Cabimas, en Venezuela.\n\nEl mu','543814344889','0000-00-00','','','','empresa4','','','','tucuman','tucuman','','','empresa','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (44,'emp5@hotmail.com','emp5','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364401749,'2013-03-27 13:29:09','2013-03-27 13:29:09','3hFRv3X1.jpg','image/jpeg','8.168945','Roxana','Sanchez Falkowsky','','','','cioli se encargó de aclarar que durante la reunión se discutirán temas \"de la agenda educativa\" y no salariales debido a que no se trata de una reunión paritaria. Sin embargo, se e','543814344889','0000-00-00','','','','empresa5','','','','tucuman','tucuman','','','empresa','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (45,'emp6@hotmail.com','emp6','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364401877,'2013-03-27 13:31:17','2013-03-27 13:31:17','m49vTIFE.jpg','image/jpeg','8.168945','Roxana','Sanchez Falkowsky','','','','cioli se encargó de aclarar que durante la reunión se discutirán temas \"de la agenda educativa\" y no salariales debido a que no se trata de una reunión paritaria. Sin embargo, se e','543814344889','0000-00-00','','','','empresa6','','','','tucuman','tucuman','','','empresa','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (46,'emp7@hotmail.com','emp7','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364401945,'2013-03-27 13:32:25','2013-03-27 13:32:25','9IfysIJz.jpg','image/jpeg','8.168945','Roxana','Sanchez Falkowsky','','','','cioli se encargó de aclarar que durante la reunión se discutirán temas \"de la agenda educativa\" y no salariales debido a que no se trata de una reunión paritaria. Sin embargo, se e','543814344889','0000-00-00','','','','empresa7','','','','tucuman','tucuman','','','empresa','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (47,'emp8@hotmail.com','emp8','e2b496549ffd3c0fa7ac3ab527a809228c9698acbe5393dd5033d14f1ea2465e',1,1364402138,'2013-03-27 13:35:38','2013-03-27 13:35:38','g7kufYcu.jpg','image/jpeg','8.168945','Roxana','Sanchez Falkowsky','','','','cioli se encargó de aclarar que durante la reunión se discutirán temas \"de la agenda educativa\" y no salariales debido a que no se trata de una reunión paritaria. Sin embargo, se e','543814344889','0000-00-00','','','','ong8','','','','tucuman','tucuman','','','empresa','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (48,'emp9@hotmail.com','emp9','e2b496549ffd3c0fa7ac3ab527a809228c9698acbe5393dd5033d14f1ea2465e',1,1364402193,'2013-03-27 13:36:33','2013-03-27 13:36:33','TX9OnU0V.jpg','image/jpeg','8.168945','Roxana','Sanchez Falkowsky','','','','cioli se encargó de aclarar que durante la reunión se discutirán temas \"de la agenda educativa\" y no salariales debido a que no se trata de una reunión paritaria. Sin embargo, se e','543814344889','0000-00-00','','','','ong7','','','','tucuman','tucuman','','','empresa','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (49,'emp10@hotmail.com','emp10','e2b496549ffd3c0fa7ac3ab527a809228c9698acbe5393dd5033d14f1ea2465e',1,1364402395,'2013-03-27 13:39:55','2013-03-27 13:39:55','THy21LfB.jpg','image/jpeg','8.168945','Roxana','Sanchez Falkowsky','','','','cioli se encargó de aclarar que durante la reunión se discutirán temas \"de la agenda educativa\" y no salariales debido a que no se trata de una reunión paritaria. Sin embargo, se e','543814344889','0000-00-00','','','','ong15','','','','tucuman','tucuman','','','empresa','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (50,'emp11@hotmail.com','emp11','e2b496549ffd3c0fa7ac3ab527a809228c9698acbe5393dd5033d14f1ea2465e',1,1364402477,'2013-03-27 13:41:16','2013-03-27 13:41:17','MWec5k7Y.jpg','image/jpeg','8.168945','Roxana','Sanchez Falkowsky','','','','cioli se encargó de aclarar que durante la reunión se discutirán temas \"de la agenda educativa\" y no salariales debido a que no se trata de una reunión paritaria. Sin embargo, se e','543814344889','0000-00-00','','','','empresa11','','','','tucuman','tucuman','','','empresa','roxanadsf@hotmail.com','',1,NULL,NULL,NULL),
 (51,'per1@hotmail.com','persona1','53b30b1ed0322ca042efa087d4c5b628db312a3752753d2a0d278a8d3741e166',1,1364477077,'2013-03-28 10:24:36','2013-03-28 10:24:37','3SvleGzo.jpg','image/jpeg','8.168945','persona1','sanchez','','','','','','2013-03-28','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (52,'per2@hotmail.com','persona2','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364477128,'2013-03-28 10:25:28','2013-03-28 10:25:28','SzOhE8tZ.jpg','image/jpeg','8.168945','persona2','sanchez','','','','','','2013-03-28','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (53,'per3@hotmail.com','persona3','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364477174,'2013-03-28 10:26:14','2013-03-28 10:26:14','BH9fRrVF.jpg','image/jpeg','8.168945','persona3','sanchez','','','','','','2013-03-28','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (54,'per4@hotmail.com','persona4','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364477216,'2013-03-28 10:26:55','2013-03-28 10:26:56','1zlPITRf.jpg','image/jpeg','8.168945','persona4','sanchez','','','','','','2013-03-28','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (55,'per5@hotmail.com','persona5','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364477258,'2013-03-28 10:27:38','2013-03-28 10:27:38','vKPHXse3.jpg','image/jpeg','8.168945','persona5','sanchez','','','','','','2013-03-28','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (56,'per6@hotmail.com','persona6','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364477302,'2013-03-28 10:28:22','2013-03-28 10:28:22','I8iuDGRB.jpg','image/jpeg','8.168945','persona6','sanchez','','','','','','2013-03-28','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (57,'per7@hotmail.com','persona7','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364477352,'2013-03-28 10:29:12','2013-03-28 10:29:12','A9WrXI9d.jpg','image/jpeg','8.168945','persona7','sanchez','','','','','','2013-03-28','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (58,'per8@hotmail.com','persona8','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364477391,'2013-03-28 10:29:51','2013-03-28 10:29:51','YN478Mun.jpg','image/jpeg','8.168945','persona8','sanchez','','','','','','2013-03-28','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (59,'per9@hotmail.com','persona9','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364477438,'2013-03-28 10:30:38','2013-03-28 10:30:38','Ko0bGduD.jpg','image/jpeg','8.168945','persona1','sanchez','','','','','','2013-03-28','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (60,'per10@hotmail.com','persona10','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364477484,'2013-03-28 10:31:24','2013-03-28 10:31:24','8FOBC1SN.jpg','image/jpeg','8.168945','persona1','sanchez','','','','','','2013-03-28','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (61,'per110@hotmail.com','persona11','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',3,1364769749,'2013-03-28 10:32:12','2013-03-31 19:42:29','uDPS0UqJ.jpg','image/jpeg','8.168945','persona1','sanchez','','','','','','2013-03-28','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (62,'per100@hotmail.com','persona12','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364477570,'2013-03-28 10:32:50','2013-03-28 10:32:50','7ZlwEd4f.jpg','image/jpeg','8.168945','persona1','sanchez','','','','','','2013-03-28','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (63,'per103@hotmail.com','persona13','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364477614,'2013-03-28 10:33:34','2013-03-28 10:33:34','BIAzlH6U.jpg','image/jpeg','8.168945','persona1','sanchez','','','','','','2013-03-28','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (64,'per1004@hotmail.com','persona14','2b072819be828a73355e878070137973e4d4a74372e807dbc17053bbe565a704',1,1364477655,'2013-03-28 10:34:15','2013-03-28 10:34:15','e0sVTAOs.jpg','image/jpeg','8.168945','persona1','sanchez','','','','','','2013-03-28','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (67,'per30@hotmail.com','persona30','e2b496549ffd3c0fa7ac3ab527a809228c9698acbe5393dd5033d14f1ea2465e',2,1364847224,'2013-04-01 08:24:25','2013-04-01 17:13:44','pe6l7mMg.jpg','image/jpeg','102.397461','ro','sanchez','','','','','','2013-04-01','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (71,'pablo.moreiramora@gmail.com','pablito','7c9d5051694536ca0fdcfee01ea0c55611bf478d711c50d750803858e806553d',3,1367865962,'2013-04-15 14:59:57','2013-05-06 15:46:02','WvcqjT5S.jpg','image/jpeg','40.269531','Pablo','Moreira Mora','','','','','','1984-07-13','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (72,'ro@hotmail.com','roxana','e2b496549ffd3c0fa7ac3ab527a809228c9698acbe5393dd5033d14f1ea2465e',1,1366110052,'2013-04-16 08:00:51','2013-04-16 08:00:52','yX7rPGLF.jpg','image/jpeg','83.531250','Roxana','Sanchez Falkowsky','','','','','','2013-04-16','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (73,'ong142@hotmail.com','ong22','e2b496549ffd3c0fa7ac3ab527a809228c9698acbe5393dd5033d14f1ea2465e',1,1366116634,'2013-04-16 09:50:34','2013-04-16 09:50:34','mt6DVqiW.gif','image/gif','59.938477','Sanchez Falkowsky','sanchez','','','','sgbsfgbsf f f f gf','543814344889','0000-00-00','','','','ong1534','','','','tucuman','tucuman','','','ong','','',1,NULL,NULL,NULL),
 (74,'guzmanjhonny@gmail.com','jhonnyguzman','f9dc4dde6bcf850c60cfd7731bd62e2ae267203a4f0518327c93a3412c2f89bd',190,1374041028,'2013-05-06 15:40:23','2013-07-17 03:03:48','6IpVnPGx.png','image/png','0.995117','Johnny','Guzman','jhonnyguzman','Johnny189','','','','1988-02-16','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (76,'ong14ww@hotmail.com','ong211','e2b496549ffd3c0fa7ac3ab527a809228c9698acbe5393dd5033d14f1ea2465e',1,1368112233,'2013-05-09 12:10:33','2013-05-09 12:10:33','H2j8vnXz.gif','image/gif','59.938477','Sanchez Falkowsky','sanchez','','','','','543814344889','0000-00-00','','','','ong15dff','','','','tucuman','tucuman','','','ong','dugnading@gmail.com','',1,NULL,NULL,NULL),
 (78,'ong100@hotmail.com','ong100','e0449bf327b33fdbacfea0a5a71c388d964e12d9b4fa7935f36f7ff5b75e608d',33,1371109246,'2013-05-10 12:16:43','2013-06-13 04:40:46','WmRwhw6l.png','image/png','20.824219','Pedro','Arnaz','','','','Fundacion de ayuda a los pobres','3874585225','0000-00-00','','','','Manos Libres','','','','Salta','Salta','','','admin','ong100_admin@hotmail.com','',1,NULL,NULL,NULL),
 (79,'empresa100@hotmail.com','empresa100','e9eb79837416083333f1b4dc72f3361bb9319e2e7992462b5110d7fae9c5aebb',11,1371167402,'2013-05-10 12:38:58','2013-06-13 20:50:02','rWnugl9J.png','image/png','10.667969','Pablo','Gomez','','','http://infosys.com.ar','Empresa de tecnologías de información','0387-4585455','0000-00-00','','','','Infosys','','','','Salta','Salta','','','empresa','contacto@infosys.com.ar','',1,NULL,NULL,NULL),
 (80,'pepe@gmail.com','pepe','88d221f9768ccb9c88f66ed5d62dc0aa585ebf53d65399deb631ffa03c59ce7c',0,NULL,'2013-05-10 22:26:04','0000-00-00 00:00:00','mcnch9JQ.png','image/png','0.995117','Pepe','Farias','','','','','','2013-05-10','','M','','','','','','','','','','admin','','',1,NULL,NULL,NULL),
 (81,'dsdsy@gmail.com','sasas','88d221f9768ccb9c88f66ed5d62dc0aa585ebf53d65399deb631ffa03c59ce7c',0,NULL,'2013-05-11 19:30:25','0000-00-00 00:00:00','','','','Johnny','sasas','','','','','','2013-05-11','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (82,'jhonnyguzman@hotmail.com','juan','f9dc4dde6bcf850c60cfd7731bd62e2ae267203a4f0518327c93a3412c2f89bd',79,1372986074,'2013-05-16 12:07:53','2013-07-04 22:01:14','nW1zVrrm.png','image/png','9.554688','Juan','Guzman','jguzmannn','','','','','1988-05-16','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (83,'marcosalvarez1000@gmail.com','marcosalvarez','e5a16084fa07a269f904efdbcc442c3ea06362f4e52e05050ceaca3d93785831',2,1369933785,'2013-05-17 12:13:39','2013-05-30 14:09:45','wv7wJgd0.png','image/png','14.420898','Sebastian','Capriel','marcosalvarez01','','','Organizacion de ayuda a la trata de personas','0387-4925545','0000-00-00','','','','Marcos Alvarez','','','','Salta','Salta','','','ong','contacto@marcosalvarez.com.ar','',1,NULL,NULL,NULL),
 (84,'miguelponce1000@gmail.com','Miguel Ponce','e5a16084fa07a269f904efdbcc442c3ea06362f4e52e05050ceaca3d93785831',1,1368809063,'2013-05-17 13:44:23','2013-06-07 15:20:17','PthJKuf9.png','image/png','0.384766','Miguel','Alvarez','miguelponce01','','http://www.miguelponce.com.ar','Industria cementos','0387-4585545','0000-00-00','','','','Miguel Ponce','','','','Salta','Salta','','','empresa','contacto@miguelponce.com.ar','',1,NULL,NULL,NULL),
 (85,'marcosmeriles@gmail.com','marcos','efd4aa97038932e36d57165622162dd6dfb2aedfdea2130dbf3a3d26dd72e04a',12,1373523735,'2013-05-20 02:12:49','2013-07-11 03:22:15','mpJMQl6o.png','image/png','12.425781','Marcos','Martines','marcosmartines0','','','','','2007-05-20','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL),
 (86,'fitis@gmail.com','fitis','d12f75f68e425b74453875d98426e02d0b697e11fa7ba12a5795816e39564783',1,1370071428,'2013-06-01 04:23:47','2013-06-07 15:09:53','1DivDzgW.png','image/png','15.057617','Alfredo','Guzman','','','http://fitis.com.ar','Empresa de producción de caramelos','387495585','0000-00-00','','','','Fitis S.A','','','','Salta','Salta','','','empresa','contacto@fitis.com.ar','',1,NULL,NULL,NULL),
 (88,'guzmanjhonny123@gmail.com','guzmanjhonny','f9dc4dde6bcf850c60cfd7731bd62e2ae267203a4f0518327c93a3412c2f89bd',40,1374023816,'2013-07-07 01:23:22','2013-07-16 22:16:56','XvmHww1q.png','image/png','1.447266','Juan','Guzman','','','','','','2013-07-02','','M','','','','','','','','','','persona','','',1,NULL,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`usertokens`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`usertokens`;
CREATE TABLE  `dugnadin_rsdb`.`usertokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `usertokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dugnadin_rsdb`.`usertokens`
--

/*!40000 ALTER TABLE `usertokens` DISABLE KEYS */;
LOCK TABLES `usertokens` WRITE;
INSERT INTO `dugnadin_rsdb`.`usertokens` VALUES  (31,74,NULL,'82947228-C2WAKKHpb4oW3l6jPFXUEPfNv8C5apCYKUPuZ641E//qiRFTKx5B0dXO1GlHbaZGKAzwV5PNMq9gxZ5AHiKPE0','twitter','2013-07-16 22:25:27',NULL),
 (32,74,NULL,'CAAFl5Wk64ckBAFLQjNWjbXWeKsWUTncAhu6ZCIhJfEndNfO2ZCBZAJ1Vnz8d0RLmDMmlwfbVcJbguvpADWxQIsZAlTs7ICagKPSC6nUSa0lnek2Vhn6dCFcW46ODmLoz7bTmTPuCny0WVb9EPKgZB','facebook','2013-07-17 00:38:28',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `usertokens` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`usertweets`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`usertweets`;
CREATE TABLE  `dugnadin_rsdb`.`usertweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `max_id` varchar(255) NOT NULL,
  `raw_json` mediumtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `procesado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dugnadin_rsdb`.`usertweets`
--

/*!40000 ALTER TABLE `usertweets` DISABLE KEYS */;
LOCK TABLES `usertweets` WRITE;
INSERT INTO `dugnadin_rsdb`.`usertweets` VALUES  (53,85,'355208302247948288','[{\"created_at\":\"Thu Jul 11 06:13:53 +0000 2013\",\"id\":355208302247948288,\"id_str\":\"355208302247948288\",\"text\":\"probando 1\",\"source\":\"web\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":1442885886,\"id_str\":\"1442885886\"},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":0,\"favorite_count\":0,\"favorited\":false,\"retweeted\":false,\"lang\":\"pt\"}]','2013-07-11 03:21:42','2013-07-11 03:21:42',1),
 (54,85,'355210358950084608','[{\"created_at\":\"Thu Jul 11 06:22:03 +0000 2013\",\"id\":355210358950084608,\"id_str\":\"355210358950084608\",\"text\":\"probando algo jje\",\"source\":\"web\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":1442885886,\"id_str\":\"1442885886\"},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":0,\"favorite_count\":0,\"favorited\":false,\"retweeted\":false,\"lang\":\"es\"}]','2013-07-11 03:22:17','2013-07-11 03:22:17',1),
 (55,74,'335437286667857920','[{\"created_at\":\"Fri May 17 16:50:55 +0000 2013\",\"id\":335437286667857920,\"id_str\":\"335437286667857920\",\"text\":\"six test with @miguelponce01  and with #dugnading\",\"source\":\"web\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":82947228,\"id_str\":\"82947228\"},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":0,\"favorite_count\":0,\"favorited\":false,\"retweeted\":false,\"lang\":\"en\"}]','2013-07-16 22:25:28','2013-07-16 22:25:28',1),
 (56,74,'357311129304834049','[{\"created_at\":\"Wed Jul 17 01:29:46 +0000 2013\",\"id\":357311129304834049,\"id_str\":\"357311129304834049\",\"text\":\"testing\",\"source\":\"web\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":82947228,\"id_str\":\"82947228\"},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":0,\"favorite_count\":0,\"favorited\":false,\"retweeted\":false,\"lang\":\"et\"}]','2013-07-16 23:02:02','2013-07-16 23:02:02',1),
 (57,74,'357321004768432128','[{\"created_at\":\"Wed Jul 17 02:09:00 +0000 2013\",\"id\":357321004768432128,\"id_str\":\"357321004768432128\",\"text\":\"first step\",\"source\":\"web\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":82947228,\"id_str\":\"82947228\"},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":0,\"favorite_count\":0,\"favorited\":false,\"retweeted\":false,\"lang\":\"en\"}]','2013-07-16 23:09:13','2013-07-16 23:09:13',1),
 (58,74,'357368868357939200','[{\"created_at\":\"Wed Jul 17 05:19:12 +0000 2013\",\"id\":357368868357939200,\"id_str\":\"357368868357939200\",\"text\":\"2:19\",\"source\":\"web\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":82947228,\"id_str\":\"82947228\"},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":0,\"favorite_count\":0,\"favorited\":false,\"retweeted\":false,\"lang\":\"und\"}]','2013-07-17 02:19:36','2013-07-17 02:19:36',1),
 (59,74,'357369263209725952','[{\"created_at\":\"Wed Jul 17 05:20:46 +0000 2013\",\"id\":357369263209725952,\"id_str\":\"357369263209725952\",\"text\":\"02:20\",\"source\":\"web\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":82947228,\"id_str\":\"82947228\"},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":0,\"favorite_count\":0,\"favorited\":false,\"retweeted\":false,\"lang\":\"pt\"}]','2013-07-17 02:20:54','2013-07-17 02:20:54',1),
 (60,74,'357371267772448770','[{\"created_at\":\"Wed Jul 17 05:28:44 +0000 2013\",\"id\":357371267772448770,\"id_str\":\"357371267772448770\",\"text\":\"02:29\",\"source\":\"web\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":82947228,\"id_str\":\"82947228\"},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":0,\"favorite_count\":0,\"favorited\":false,\"retweeted\":false,\"lang\":\"pt\"}]','2013-07-17 02:29:04','2013-07-17 02:29:04',1),
 (61,74,'357375590292131840','[{\"created_at\":\"Wed Jul 17 05:45:55 +0000 2013\",\"id\":357375590292131840,\"id_str\":\"357375590292131840\",\"text\":\"genial me salio #ILUSIONCONVOS\",\"source\":\"web\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":82947228,\"id_str\":\"82947228\"},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":0,\"favorite_count\":0,\"favorited\":false,\"retweeted\":false,\"lang\":\"es\"}]','2013-07-17 02:46:20','2013-07-17 02:46:20',1),
 (62,74,'357377009606852609','[{\"created_at\":\"Wed Jul 17 05:51:33 +0000 2013\",\"id\":357377009606852609,\"id_str\":\"357377009606852609\",\"text\":\"vi una camioneta del vecino :D #ILUSIONCONVOSl\",\"source\":\"web\",\"truncated\":false,\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"user\":{\"id\":82947228,\"id_str\":\"82947228\"},\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"retweet_count\":0,\"favorite_count\":0,\"favorited\":false,\"retweeted\":false,\"lang\":\"es\"}]','2013-07-17 03:03:50','2013-07-17 03:03:50',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `usertweets` ENABLE KEYS */;


--
-- Definition of table `dugnadin_rsdb`.`usertwitters`
--

DROP TABLE IF EXISTS `dugnadin_rsdb`.`usertwitters`;
CREATE TABLE  `dugnadin_rsdb`.`usertwitters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dugnadin_rsdb`.`usertwitters`
--

/*!40000 ALTER TABLE `usertwitters` DISABLE KEYS */;
LOCK TABLES `usertwitters` WRITE;
INSERT INTO `dugnadin_rsdb`.`usertwitters` VALUES  (114,NULL,74,1,'2013-07-17 00:38:25',NULL,'facebook'),
 (111,NULL,74,1,'2013-07-16 22:25:20',NULL,'twitter'),
 (112,NULL,74,2,'2013-07-16 23:11:44',NULL,'twitter'),
 (113,NULL,74,3,'2013-07-16 23:11:50',NULL,'twitter');
UNLOCK TABLES;
/*!40000 ALTER TABLE `usertwitters` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
