-- phpMyAdmin SQL Dump
-- version 2.11.9.6
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-05-2013 a las 19:50:59
-- Versión del servidor: 5.0.95
-- Versión de PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `edne`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Admin`
--

CREATE TABLE IF NOT EXISTS `Admin` (
  `id` int(10) unsigned NOT NULL default '0',
  `Nombre` varchar(60) collate latin1_general_ci default NULL,
  `Email` varchar(60) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcar la base de datos para la tabla `Admin`
--

INSERT INTO `Admin` (`id`, `Nombre`, `Email`) VALUES
(2, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Alumnos`
--

CREATE TABLE IF NOT EXISTS `Alumnos` (
  `id` int(10) unsigned NOT NULL default '0',
  `Nombre` varchar(160) collate latin1_general_ci NOT NULL default '',
  `Apellido` varchar(160) collate latin1_general_ci default NULL,
  `Sexo` char(1) collate latin1_general_ci default NULL,
  `Documento` varchar(24) collate latin1_general_ci default NULL,
  `Email` varchar(160) collate latin1_general_ci default NULL,
  `Tel1` varchar(32) collate latin1_general_ci default NULL,
  `Tel2` varchar(32) collate latin1_general_ci default NULL,
  `Estudios` text collate latin1_general_ci,
  `Direccion1` varchar(255) collate latin1_general_ci default NULL,
  `Ciudad1` varchar(60) collate latin1_general_ci default NULL,
  `Provincia1` varchar(60) collate latin1_general_ci default NULL,
  `CP1` varchar(16) collate latin1_general_ci default NULL,
  `Pais1` varchar(24) collate latin1_general_ci default NULL,
  `Facturar` varchar(160) collate latin1_general_ci default NULL,
  `CIF` varchar(32) collate latin1_general_ci default NULL,
  `Direccion2` varchar(255) collate latin1_general_ci default NULL,
  `Ciudad2` varchar(60) collate latin1_general_ci default NULL,
  `Provincia2` varchar(60) collate latin1_general_ci default NULL,
  `CP2` varchar(16) collate latin1_general_ci default NULL,
  `Pais2` varchar(24) collate latin1_general_ci default NULL,
  `Envio` varchar(24) collate latin1_general_ci default NULL,
  `Fecha_Envio` date NOT NULL default '0000-00-00',
  `Foto` varchar(64) collate latin1_general_ci default NULL,
  `Observaciones` text collate latin1_general_ci,
  `Ingreso` date NOT NULL default '0000-00-00',
  `Ultimo_Ingreso` date NOT NULL default '0000-00-00',
  `Tiempo` time NOT NULL default '00:00:00',
  `Aviso` tinyint(1) NOT NULL default '0',
  `Aviso3` tinyint(1) NOT NULL default '0',
  `Aviso4` tinyint(1) NOT NULL default '0',
  `Aviso2` tinyint(1) NOT NULL default '0',
  `Llave` varchar(38) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcar la base de datos para la tabla `Alumnos`
--

INSERT INTO `Alumnos` (`id`, `Nombre`, `Apellido`, `Sexo`, `Documento`, `Email`, `Tel1`, `Tel2`, `Estudios`, `Direccion1`, `Ciudad1`, `Provincia1`, `CP1`, `Pais1`, `Facturar`, `CIF`, `Direccion2`, `Ciudad2`, `Provincia2`, `CP2`, `Pais2`, `Envio`, `Fecha_Envio`, `Foto`, `Observaciones`, `Ingreso`, `Ultimo_Ingreso`, `Tiempo`, `Aviso`, `Aviso3`, `Aviso4`, `Aviso2`, `Llave`) VALUES
(1, 'Admin', NULL, NULL, NULL, 'hernan@cabezadeserie.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, NULL, '0000-00-00', '0000-00-00', '00:00:00', 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Articulos`
--

CREATE TABLE IF NOT EXISTS `Articulos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `CM` int(11) NOT NULL default '0',
  `Titulo` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  `Fecha` date default NULL,
  `Autor` varchar(120) collate latin1_spanish_ci default NULL,
  `Archivo` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Articulos`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Audio`
--

CREATE TABLE IF NOT EXISTS `Audio` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `CM` int(11) NOT NULL default '0',
  `Modulo` int(11) NOT NULL default '0',
  `Titulo` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  `Archivo` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Audio`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Autoevaluaciones`
--

CREATE TABLE IF NOT EXISTS `Autoevaluaciones` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Modulo` int(11) NOT NULL default '0',
  `Pregunta` text collate latin1_spanish_ci NOT NULL,
  `Num` smallint(2) NOT NULL default '0',
  `VF` tinyint(1) NOT NULL default '0',
  `Justificacion` text collate latin1_spanish_ci,
  `A` varchar(160) collate latin1_spanish_ci default NULL,
  `Av` tinyint(1) NOT NULL default '0',
  `B` varchar(160) collate latin1_spanish_ci default NULL,
  `Bv` tinyint(1) NOT NULL default '0',
  `C` varchar(160) collate latin1_spanish_ci default NULL,
  `Cv` tinyint(1) NOT NULL default '0',
  `D` varchar(160) collate latin1_spanish_ci default NULL,
  `Dv` tinyint(1) NOT NULL default '0',
  `E` varchar(160) collate latin1_spanish_ci default NULL,
  `Ev` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Autoevaluaciones`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Blog`
--

CREATE TABLE IF NOT EXISTS `Blog` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Categoria` int(11) NOT NULL,
  `Fecha` datetime NOT NULL default '0000-00-00 00:00:00',
  `Titulo` varchar(255) collate latin1_general_ci NOT NULL default '',
  `Alias` varchar(255) collate latin1_general_ci NOT NULL,
  `Texto` text collate latin1_general_ci,
  `Imagen` varchar(120) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Blog`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Blog_Comentarios`
--

CREATE TABLE IF NOT EXISTS `Blog_Comentarios` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Blog` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Publi` tinyint(1) NOT NULL default '0',
  `Autor` int(11) NOT NULL default '0',
  `Nombre` varchar(60) collate latin1_general_ci default NULL,
  `Email` varchar(160) collate latin1_general_ci default NULL,
  `Texto` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Blog_Comentarios`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cambio`
--

CREATE TABLE IF NOT EXISTS `Cambio` (
  `Uss` decimal(4,2) NOT NULL default '0.00',
  `Ars` decimal(6,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcar la base de datos para la tabla `Cambio`
--

INSERT INTO `Cambio` (`Uss`, `Ars`) VALUES
(1.40, 5.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Conectados`
--

CREATE TABLE IF NOT EXISTS `Conectados` (
  `id` int(11) NOT NULL default '0',
  `Fecha` int(11) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcar la base de datos para la tabla `Conectados`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cuestionario`
--

CREATE TABLE IF NOT EXISTS `Cuestionario` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Pregunta` text collate latin1_spanish_ci NOT NULL,
  `Cantidad` int(11) NOT NULL default '0',
  `Total` int(11) NOT NULL default '0',
  `Puntaje` tinyint(1) NOT NULL default '0',
  `Orden` int(6) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Cuestionario`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cuestionario_Com`
--

CREATE TABLE IF NOT EXISTS `Cuestionario_Com` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Alumno` int(11) NOT NULL default '0',
  `Comentario` text collate latin1_spanish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Cuestionario_Com`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cuestionario_Resp`
--

CREATE TABLE IF NOT EXISTS `Cuestionario_Resp` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Pregunta` int(11) NOT NULL default '0',
  `Alumno` int(11) NOT NULL default '0',
  `Puntaje` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Cuestionario_Resp`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cursos_Masters`
--

CREATE TABLE IF NOT EXISTS `Cursos_Masters` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Categoria` smallint(1) NOT NULL default '0',
  `Tema` int(11) NOT NULL,
  `Titulo` varchar(255) collate latin1_general_ci NOT NULL default '',
  `Alias` varchar(60) collate latin1_general_ci default NULL,
  `Detalles` tinytext collate latin1_general_ci,
  `Objetivos` text collate latin1_general_ci,
  `Horas` smallint(4) default NULL,
  `Duracion` text collate latin1_general_ci,
  `Modalidad` text collate latin1_general_ci,
  `Titulacion` text collate latin1_general_ci,
  `EUR` decimal(6,2) default NULL,
  `Descuento` tinyint(3) NOT NULL default '0',
  `Promocion` datetime default NULL,
  `Cupos` tinyint(4) default NULL,
  `Mostrar` tinyint(1) NOT NULL default '1',
  `Orden` int(6) NOT NULL,
  `Destacado` tinyint(1) NOT NULL,
  `Nuevo` tinyint(1) NOT NULL default '0',
  `LowCost` tinyint(1) NOT NULL default '0',
  `Tags_Title` varchar(255) collate latin1_general_ci default NULL,
  `Tags_Description` text collate latin1_general_ci,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `Cursos_Masters`
--

INSERT INTO `Cursos_Masters` (`id`, `Categoria`, `Tema`, `Titulo`, `Alias`, `Detalles`, `Objetivos`, `Horas`, `Duracion`, `Modalidad`, `Titulacion`, `EUR`, `Descuento`, `Promocion`, `Cupos`, `Mostrar`, `Orden`, `Destacado`, `Nuevo`, `LowCost`, `Tags_Title`, `Tags_Description`) VALUES
(1, 0, 0, 'Demo Aula', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL),
(2, 0, 3, 'CURSO PRUEBA 1', 'cursos', '', '', 1, '', '', '', 0.00, 0, NULL, NULL, 1, 100, 0, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Doc_Anexa`
--

CREATE TABLE IF NOT EXISTS `Doc_Anexa` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `CM` int(11) NOT NULL default '0',
  `Modulo` int(11) NOT NULL default '0',
  `Titulo` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  `Archivo` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Doc_Anexa`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Envios`
--

CREATE TABLE IF NOT EXISTS `Envios` (
  `id` int(11) NOT NULL default '0',
  `Texto` text collate latin1_spanish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcar la base de datos para la tabla `Envios`
--

INSERT INTO `Envios` (`id`, `Texto`) VALUES
(1, 'Estimado/a  ***nombre***,  le damos la bienvenida al aula virtual de EDNE Business School\r\n\r\nA continuación tienes tus datos de acceso a http://www.edne.es :\r\n \r\nUSUARIO: ***usuario***\r\nPASSWORD: ***clave***\r\n  \r\n\r\nEn cualquier caso, no dudes en ponerte en contacto con nosotros para aclarar cualquier duda.\r\n\r\nRecibe un cordial saludo,\r\nTutorías - EDNE Business School.\r\nwww.edne.es'),
(2, 'Estimado/a  ***nombre*** el envío del Material Nº ***numero***, ha salido hoy por "Correos" ó "MRW" si figura en el número de envío las siglas MRW.  \r\n\r\n\r\nEl número de envío es: ***numero***\r\n\r\nCORREOS:\r\nSi el envío se realizo por Correos, puedes localizar el envío en http://www.correos.es   (En el apartado de Localizador de envios, introduciendo el número de envío)  Generalmente tarda entre 2 y 7 días en recibirlo. Para envíos al extranjero de 7 a 15 días aproximadamente. \r\n\r\nMRW:\r\nSi el envío se realizó por MRW puede consultar el estado en http://www.mrw.es ó por teléfono al 902300400. Generalmente tarda entre 24 y 48hs en recibirlo.\r\n\r\n\r\n\r\n¨Aunque supiera que el mundo se va a acabar mañana yo hoy aún plantaría un árbol¨ (Martin Luther King).\r\n\r\nAgradeciendo la confianza que deposita en nuestra entidad, \r\nDepartamento de Formación - EDNE Business School.\r\nwww.edne.es'),
(3, 'Estimado/a ***nombre***, hemos notado que no has accedido al Aula Virtual de www.edne.es desde que has solicitado la matriculación. Por favor contáctanos si no has recibido el material en la dirección que nos paso en la matricula. Tambien recordarle que puede consultar el estado del envio en la pagina de correos  www.correos.es (localizador de envios) con el numero: ***numero***  \r\n\r\nLa dirección donde fue enviado es la siguiente:\r\n\r\n***datos***\r\n\r\n\r\nSi no ha recibido el material por cualquier otro problema avisarnos para volver a enviarselo. Importante confirmar dirección.\r\n\r\nSi no desea realizar la formación avisarnos para dar de baja su matricula.\r\n\r\n\r\n\r\nUn saludo cordial\r\nDpto. Admisión\r\nEDNE Business School.\r\nwww.edne.es'),
(4, 'Estimado/a ***nombre***, esperamos que el curso sea de su agrado y pueda ir avanzado. Recomendamos establecer un calendario de estudio.\r\n\r\nPara cualquier pregunta puede realizarla desde el aula virtual en el apartado de Tutorias.\r\n\r\n\r\nRecibe un cordial saludo,\r\nTutorías - EDNE Business School.\r\nwww.edne.es'),
(5, 'Estimado/a ***nombre***\r\nMuy bien, vemos que vas avanzando en el ***curso*** , esperamos que sigas este ritmo.\r\n\r\nRecibe un cordial saludo,\r\nTutorías - EDNE Business School.\r\nwww.edne.es'),
(6, 'Estimado/a ***nombre***,\r\n\r\nRecibe un cordial saludo,\r\nTutorías - EDNE Business School.\r\nwww.edne.es'),
(7, 'Estimado/a ***nombre***,\r\n\r\nRecibe un cordial saludo,\r\nTutorías - EDNE Business School.\r\nwww.edne.es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Etiquetas`
--

CREATE TABLE IF NOT EXISTS `Etiquetas` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Alumno` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Etiquetas`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Examen_Final`
--

CREATE TABLE IF NOT EXISTS `Examen_Final` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `CM` int(11) NOT NULL default '0',
  `Pregunta` text collate latin1_spanish_ci NOT NULL,
  `Num` smallint(2) NOT NULL default '0',
  `VF` tinyint(1) NOT NULL default '0',
  `Justificacion` text collate latin1_spanish_ci,
  `A` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  `Av` tinyint(1) NOT NULL default '0',
  `B` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  `Bv` tinyint(1) NOT NULL default '0',
  `C` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  `Cv` tinyint(1) NOT NULL default '0',
  `D` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  `Dv` tinyint(1) NOT NULL default '0',
  `E` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  `Ev` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Examen_Final`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Extra`
--

CREATE TABLE IF NOT EXISTS `Extra` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Rel` char(2) collate latin1_general_ci NOT NULL,
  `Ent1` int(11) NOT NULL,
  `Ent2` int(11) NOT NULL,
  `Tipo` char(2) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Extra`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FAQs`
--

CREATE TABLE IF NOT EXISTS `FAQs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `CM` int(11) NOT NULL,
  `Pregunta` text collate latin1_general_ci NOT NULL,
  `Respuesta` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=13 ;

--
-- Volcar la base de datos para la tabla `FAQs`
--

INSERT INTO `FAQs` (`id`, `CM`, `Pregunta`, `Respuesta`) VALUES
(1, 0, 'Duración de un Curso.', 'La duración del curso la establece el propio alumn@ ya que depende del tiempo que pueda dedicarle, siempre teniendo en cuenta que la duración máxima es de 1 año.\r\n\r\nRecomendamos ver el índice del curso y establecer un calendario con días y  horarios para dedicarle al curso como mínimo recomendamos dedicarle una hora a la semana.\r\n'),
(2, 0, 'Ejercicios y examen', 'A medida que el alumno avanza en el curso tendrá que desarrollar auto evaluaciones y un examen final a online tipo test. \r\n\r\nEn el caso que el alumno no aprobara el examen final dispone de una segunda oportunidad para volver a realizarlo.'),
(3, 8, 'Seminario y Videoteca', 'En el apartado de Videoteca encontrarás videos con temas relacionados con la calidad que serán de gran ayuda.  Tambien encontrarás los seminarios grabados que iremos realizando.\r\n\r\n'),
(4, 8, 'Documentación anexa', 'Encontrarás documentación anexa muy importante en el curso, como por ejemplo articulos, modelos de manuales de calidad, etc.  \r\n\r\nPuedes enviarnos tus aportaciones que consideres importante para otros alumnos.'),
(5, 0, '¿Cómo obtengo la titulación?', 'Cuando el alumno se matricula enviamos un certificado de inscripción. Cuando el alumno realiza las auto evaluaciones y el examen final podrá solicitar el título final del curso que le será enviado por correo postal ó digitalizados para las personas que no residan en España.'),
(6, 8, '¿Es oficial el título?', 'El título que otorgamos es propio de nuestro centro es un master profesional que sirve para trabajar como responsable de calidad en una empresa y para poder realizar auditorias internas, pero no es oficial por universidad.\r\n\r\nPuedo homologarlo mediante el tratado de la haya.'),
(7, 8, 'Exámen Final:  \r\nComo son las preguntas?  Cuantas preguntas?  Tiene un tiempo limite para realizarlo?   Si no suspendo tengo otra oportunidad? ', 'Las preguntas son tipo test.  El exámen final tiene en total 10 preguntas.  \r\nTiene un tiempo límite de 40 minutos por lo tanto tiene que terminarlo antes de los 40 minutos sino este se bloqueará.    \r\n\r\nSi no llegará a aprobar tendría una segunda oportunidad.'),
(8, 8, 'Duración del Máster de Calidad', 'La duración del máster la establece el propio alumn@ ya que depende del tiempo que pueda dedicarle, cada alumno puede llevarlo a su ritmo, siempre teniendo en cuenta que la duración máxima es de 1 año.'),
(9, 8, 'Es necesario contabilizar 500 horas conectado en el aula virtual? Aparece en el apartado de Estadisticas: horas conectado.', 'No, no es necesario estar conectado en el aula virtal 500horas, el dato de horas de conexión es solo un dato informativo para el alumno, no tiene ningún otro uso.'),
(10, 8, 'Cuanto tiempo demora en llegar el titulo?', 'Una vez finalizado los dos examenes finales 1. Máster de Calidad 2. Curso Auditor Interno en un plazo de 15 días aprox. recibirá por correo postal el titulo en su domicilio.  Si reside fuera de España puede demorar hasta 20 días laborables en llegar.\r\n\r\nNota: es importante que tenga sus datos actualizados (Nombre, Apellidos,Dirección) en su perfil antes de realizar los examenes finales ya que se emitirá y se enviará a los datos que figuren en su perfil.'),
(11, 8, 'Que pasa si se me vence el plazo de un año para finalizar el Máster?', 'Una vez superado el año el sistema bloqueará el acceso a los contenidos si no ha finalizado el máster tendrá que contactarnos para pasarle las condiciones para prorrogar el tiempo por un año más.'),
(12, 0, 'Que pasa si suspendo un ejercicio de auto evaluación?', 'Si suspende algún ejercicio y quiere repetirlo debe enviarnos un mensaje inmediatamente desde el apartado de tutorias comunicando que ejercicio a suspendido para poder eliminarlo para que pueda volver a realizarlo. \r\n\r\nNota: Solo se puede repetir si no ha realizado la siguiente auto evaluación, ya que si realizo la auto evaluación del siguiente modulo tendremos que eliminarlo tambien.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Info_Adjuntos`
--

CREATE TABLE IF NOT EXISTS `Info_Adjuntos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Curso_Master` int(11) NOT NULL default '0',
  `Adjunto` varchar(160) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Info_Adjuntos`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Info_Adjuntos_Packs`
--

CREATE TABLE IF NOT EXISTS `Info_Adjuntos_Packs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Pack` int(11) NOT NULL default '0',
  `Adjunto` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Info_Adjuntos_Packs`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Info_Packs`
--

CREATE TABLE IF NOT EXISTS `Info_Packs` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `Pack` int(11) NOT NULL default '0',
  `Texto` text collate latin1_spanish_ci,
  `Imagen` varchar(120) collate latin1_spanish_ci default NULL,
  `Link_Imagen` varchar(255) collate latin1_spanish_ci default NULL,
  `Orden` smallint(3) NOT NULL default '0',
  `Mostrar` smallint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Info_Packs`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Info_Plantillas`
--

CREATE TABLE IF NOT EXISTS `Info_Plantillas` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Curso_Master` int(11) NOT NULL default '0',
  `Texto` text collate latin1_general_ci,
  `Imagen` varchar(120) collate latin1_general_ci default NULL,
  `Link_Imagen` varchar(255) collate latin1_general_ci default NULL,
  `Orden` smallint(3) NOT NULL default '0',
  `Mostrar` smallint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Info_Plantillas`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Info_Solicitudes`
--

CREATE TABLE IF NOT EXISTS `Info_Solicitudes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Nombre` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  `Email` varchar(60) collate latin1_spanish_ci NOT NULL default '',
  `Info_Solicitada` int(11) NOT NULL default '0',
  `Pack` int(11) NOT NULL default '0',
  `Fecha` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Info_Solicitudes`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Matriculas`
--

CREATE TABLE IF NOT EXISTS `Matriculas` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Alumno` int(11) NOT NULL default '0',
  `CM` int(11) NOT NULL default '0',
  `Pack` int(11) NOT NULL default '0',
  `Num` varchar(24) collate latin1_general_ci NOT NULL default '',
  `Fecha` date NOT NULL default '0000-00-00',
  `Finaliza` date NOT NULL default '0000-00-00',
  `Activa` tinyint(1) NOT NULL default '0',
  `Subv` tinyint(1) NOT NULL default '0',
  `Abonado` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci PACK_KEYS=1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Matriculas`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Mensajes`
--

CREATE TABLE IF NOT EXISTS `Mensajes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `De` int(11) NOT NULL default '0',
  `CM` int(11) default NULL,
  `Alumno` int(11) default NULL,
  `Asunto` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  `Mensaje` text collate latin1_spanish_ci NOT NULL,
  `Adjunto` varchar(160) collate latin1_spanish_ci default NULL,
  `Fecha` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Mensajes`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Mensajes_Leidos`
--

CREATE TABLE IF NOT EXISTS `Mensajes_Leidos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Mensaje` int(11) NOT NULL default '0',
  `Alumno` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Mensajes_Leidos`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Modulos`
--

CREATE TABLE IF NOT EXISTS `Modulos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `CM` int(11) NOT NULL default '0',
  `Modulo` smallint(3) NOT NULL default '0',
  `Titulo` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Modulos`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `News`
--

CREATE TABLE IF NOT EXISTS `News` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Fecha` datetime NOT NULL,
  `Asunto` varchar(255) NOT NULL,
  `Mensaje` text character set latin1 collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `News`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `News_Pendientes`
--

CREATE TABLE IF NOT EXISTS `News_Pendientes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `New` int(11) NOT NULL,
  `Alumno` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `News_Pendientes`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Notas`
--

CREATE TABLE IF NOT EXISTS `Notas` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Alumno` int(11) NOT NULL default '0',
  `CM` int(11) NOT NULL default '0',
  `Modulo` int(11) NOT NULL default '0',
  `Nota` smallint(2) NOT NULL default '0',
  `Fecha` date NOT NULL default '0000-00-00',
  `Archivo` text character set latin1 collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Notas`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Noticias`
--

CREATE TABLE IF NOT EXISTS `Noticias` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Fecha` datetime NOT NULL default '0000-00-00 00:00:00',
  `Titulo` varchar(255) character set latin1 collate latin1_general_ci NOT NULL default '',
  `Alias` varchar(255) character set latin1 collate latin1_general_ci NOT NULL,
  `Texto` text character set latin1 collate latin1_general_ci,
  `Imagen` varchar(120) character set latin1 collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Noticias`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Packs`
--

CREATE TABLE IF NOT EXISTS `Packs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Titulo` varchar(160) character set latin1 collate latin1_general_ci NOT NULL default '',
  `Alias` varchar(60) collate latin1_spanish_ci default NULL,
  `Detalles` tinytext collate latin1_spanish_ci,
  `Objetivos` text collate latin1_spanish_ci,
  `Horas` smallint(4) default NULL,
  `Duracion` text collate latin1_spanish_ci,
  `Modalidad` text collate latin1_spanish_ci,
  `Titulacion` text collate latin1_spanish_ci,
  `EUR` decimal(6,2) NOT NULL default '0.00',
  `Descuento` tinyint(3) NOT NULL default '0',
  `Promocion` datetime default NULL,
  `Cupos` tinyint(4) default NULL,
  `Mostrar` tinyint(1) NOT NULL default '1',
  `Destacado` tinyint(1) NOT NULL,
  `Nuevo` tinyint(1) NOT NULL default '0',
  `Orden` int(6) NOT NULL,
  `Tags_Title` varchar(255) collate latin1_spanish_ci default NULL,
  `Tags_Description` text collate latin1_spanish_ci,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Packs`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Packs_CM`
--

CREATE TABLE IF NOT EXISTS `Packs_CM` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Pack` int(11) NOT NULL default '0',
  `CM` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Packs_CM`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pagos`
--

CREATE TABLE IF NOT EXISTS `Pagos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Forma` varchar(160) character set latin1 collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcar la base de datos para la tabla `Pagos`
--

INSERT INTO `Pagos` (`id`, `Forma`) VALUES
(1, 'Contrareembolso'),
(2, 'Transferencia bancaria'),
(3, 'PayPal'),
(4, '3 pagos recibo bancario'),
(5, '4 pagos'),
(6, '6 pagos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pagos_CM`
--

CREATE TABLE IF NOT EXISTS `Pagos_CM` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Tipo` tinyint(1) NOT NULL,
  `CM` int(11) NOT NULL,
  `Pago` tinyint(2) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `Pagos_CM`
--

INSERT INTO `Pagos_CM` (`id`, `Tipo`, `CM`, `Pago`) VALUES
(1, 1, 2, 2),
(2, 1, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Servicios`
--

CREATE TABLE IF NOT EXISTS `Servicios` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Servicio` varchar(160) collate latin1_general_ci NOT NULL,
  `Pais` varchar(24) collate latin1_general_ci default NULL,
  `noPais` varchar(60) collate latin1_general_ci default NULL,
  `EUR` decimal(6,2) NOT NULL,
  `Detalles` text collate latin1_general_ci,
  `Titulo` tinyint(1) NOT NULL,
  `C` tinyint(1) NOT NULL default '0',
  `CG` tinyint(1) NOT NULL default '0',
  `M` tinyint(1) NOT NULL default '0',
  `P` tinyint(1) NOT NULL default '0',
  `S` tinyint(1) NOT NULL default '0',
  `Fijo` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `Servicios`
--

INSERT INTO `Servicios` (`id`, `Servicio`, `Pais`, `noPais`, `EUR`, `Detalles`, `Titulo`, `C`, `CG`, `M`, `P`, `S`, `Fijo`) VALUES
(1, '', 'Todos', '', 0.00, '', 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Servicios_Alumnos`
--

CREATE TABLE IF NOT EXISTS `Servicios_Alumnos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Servicio` int(11) NOT NULL,
  `Alumno` int(11) NOT NULL,
  `CM` int(11) default NULL,
  `Pack` int(11) default NULL,
  `Estado` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Servicios_Alumnos`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Temas`
--

CREATE TABLE IF NOT EXISTS `Temas` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `Tema` varchar(160) character set latin1 collate latin1_general_ci NOT NULL,
  `Imagen` varchar(255) default NULL,
  `Descripcion` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcar la base de datos para la tabla `Temas`
--

INSERT INTO `Temas` (`id`, `Tema`, `Imagen`, `Descripcion`) VALUES
(2, 'Medio Ambiente', 'medioambiente.jpg', 'Master Medio Ambiente, ISO 14001. Gestión de Residuos, Reglamento EMAS, EIA... '),
(3, 'Calidad', 'calidad.jpg', 'Master Calidad, ISO 9001. Auditor Interno. Actualización ISO 9001:2008...'),
(4, 'Prevención de Riesgos Laborales', 'prevencionRiesgos.jpg', 'PRL especificos, Básicos, Evaluación de Riesgos, Ohsas 18001...'),
(5, 'Marketing y Ventas', 'marketing.jpg', 'Master en Marketing y Dirección Comercial, Tecnicas de Ventas...'),
(6, 'Sanidad', 'sanidad.jpg', 'Atención sociosanitaria a personas en el domicilio y dependientes...'),
(7, 'Turismo y Hostelería', 'turismo.jpg', 'Turismo, Protocolo, Gobernanta, Camarero de piso...'),
(8, 'Informatica', 'informatica.jpg', 'Ofimática, Word, Access, Excel, Power Point, Photoshop...'),
(10, 'Idiomas', 'idiomas.jpg', 'Ingles, Frances, Aleman, etc.'),
(11, 'Recursos Humanos', 'recursoshumanos.jpg', 'Selección, administración y gestión de personal, liquidación de sueldos... ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Temp_Acc`
--

CREATE TABLE IF NOT EXISTS `Temp_Acc` (
  `id` int(11) NOT NULL default '0',
  `Acc` varchar(12) collate latin1_spanish_ci NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcar la base de datos para la tabla `Temp_Acc`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Temp_Alumnos`
--

CREATE TABLE IF NOT EXISTS `Temp_Alumnos` (
  `idTemp` bigint(20) unsigned NOT NULL auto_increment,
  `Fecha` date NOT NULL,
  `id` varchar(24) collate latin1_general_ci NOT NULL default '',
  `Nombre` varchar(160) collate latin1_general_ci NOT NULL default '',
  `Apellido` varchar(160) collate latin1_general_ci default NULL,
  `Sexo` char(1) collate latin1_general_ci default NULL,
  `Documento` varchar(24) collate latin1_general_ci default NULL,
  `Email` varchar(160) collate latin1_general_ci default NULL,
  `Tel1` varchar(32) collate latin1_general_ci default NULL,
  `Tel2` varchar(32) collate latin1_general_ci default NULL,
  `Estudios` text collate latin1_general_ci,
  `Direccion1` varchar(255) collate latin1_general_ci default NULL,
  `Dir_num1` varchar(24) collate latin1_general_ci NOT NULL,
  `Dir_piso1` varchar(24) collate latin1_general_ci default NULL,
  `Dir_dpto1` varchar(6) collate latin1_general_ci default NULL,
  `Ciudad1` varchar(60) collate latin1_general_ci default NULL,
  `Provincia1` varchar(60) collate latin1_general_ci default NULL,
  `CP1` varchar(16) collate latin1_general_ci default NULL,
  `OP1` tinyint(1) NOT NULL default '0',
  `Pais1` varchar(24) collate latin1_general_ci default NULL,
  `Facturar` varchar(160) collate latin1_general_ci default NULL,
  `CIF` varchar(32) collate latin1_general_ci default NULL,
  `Direccion2` varchar(255) collate latin1_general_ci default NULL,
  `Dir_num2` varchar(24) collate latin1_general_ci default NULL,
  `Dir_piso2` varchar(24) collate latin1_general_ci default NULL,
  `Dir_dpto2` varchar(6) collate latin1_general_ci default NULL,
  `Ciudad2` varchar(60) collate latin1_general_ci default NULL,
  `Provincia2` varchar(60) collate latin1_general_ci default NULL,
  `CP2` varchar(16) collate latin1_general_ci default NULL,
  `OP2` tinyint(1) NOT NULL default '0',
  `Pais2` varchar(24) collate latin1_general_ci default NULL,
  `Observaciones` text collate latin1_general_ci,
  PRIMARY KEY  (`idTemp`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `Temp_Alumnos`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Temp_CMP`
--

CREATE TABLE IF NOT EXISTS `Temp_CMP` (
  `idTemp` bigint(20) unsigned NOT NULL auto_increment,
  `Fecha` date NOT NULL,
  `id` varchar(24) collate latin1_spanish_ci NOT NULL default '',
  `Tipo` char(2) collate latin1_spanish_ci NOT NULL,
  `Valor` int(11) NOT NULL default '0',
  PRIMARY KEY  (`idTemp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Temp_CMP`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Testimonios`
--

CREATE TABLE IF NOT EXISTS `Testimonios` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `CM` int(11) NOT NULL default '0',
  `Nombre` varchar(60) collate latin1_general_ci NOT NULL default '',
  `Pais` varchar(60) collate latin1_general_ci default NULL,
  `Testimonio` text collate latin1_general_ci NOT NULL,
  `Rank` tinyint(1) NOT NULL default '5',
  `Mostrar` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Testimonios`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tickets`
--

CREATE TABLE IF NOT EXISTS `Tickets` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `Alumno` int(11) NOT NULL,
  `CM` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Tema` tinytext collate latin1_general_ci,
  `Asunto` varchar(255) collate latin1_general_ci NOT NULL,
  `Mensaje` text collate latin1_general_ci NOT NULL,
  `Estado` tinyint(1) NOT NULL default '0',
  `Tutor` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Tickets`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tickets_Mensajes`
--

CREATE TABLE IF NOT EXISTS `Tickets_Mensajes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Ticket` int(11) NOT NULL,
  `Pregunta` text collate latin1_general_ci,
  `Respuesta` text collate latin1_general_ci,
  `De` int(11) default NULL,
  `Fecha` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Tickets_Mensajes`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Unidades`
--

CREATE TABLE IF NOT EXISTS `Unidades` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Modulo` int(11) NOT NULL default '0',
  `Unidad` smallint(3) NOT NULL default '0',
  `Titulo` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  `Archivo` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Unidades`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `ID` smallint(6) unsigned NOT NULL auto_increment,
  `usuario` tinytext NOT NULL,
  `pass` tinytext NOT NULL,
  `nivel_acceso` smallint(4) unsigned NOT NULL default '0',
  `Activo` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 PACK_KEYS=1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `usuario`, `pass`, `nivel_acceso`, `Activo`) VALUES
(1, 'admin_test', 'c817641a2236933b0415c96d390419c9', 0, 1),
(2, 'edne', '0f46ee5545909ea1984188cd32adb1d0', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Videos`
--

CREATE TABLE IF NOT EXISTS `Videos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `CM` int(11) NOT NULL default '0',
  `Modulo` int(11) NOT NULL default '0',
  `Titulo` varchar(160) collate latin1_spanish_ci NOT NULL default '',
  `Archivo` varchar(160) collate latin1_spanish_ci default NULL,
  `Youtube` varchar(255) collate latin1_spanish_ci default NULL,
  `Link` varchar(255) collate latin1_spanish_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `Videos`
--

