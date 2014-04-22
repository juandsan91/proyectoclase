-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 07-03-2014 a las 16:15:08
-- Versión del servidor: 5.1.44
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `consultorio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE IF NOT EXISTS `cita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profesional_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipohora_id` int(11) DEFAULT NULL,
  `cancelada` int(11) DEFAULT NULL,
  `creado_at` datetime DEFAULT NULL,
  `historia_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profesional_id` (`profesional_id`),
  KEY `tipohora_id` (`tipohora_id`),
  KEY `historia_id` (`historia_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `cita`
--

INSERT INTO `cita` (`id`, `profesional_id`, `fecha`, `tipohora_id`, `cancelada`, `creado_at`, `historia_id`) VALUES
(1, 2, '2012-11-15', 1, NULL, '2012-11-22 16:39:01', NULL),
(2, 2, '2012-11-15', 3, NULL, '2012-11-22 16:40:26', 10),
(3, 1, '2013-10-12', 2, NULL, '2013-02-22 03:30:00', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta`
--

CREATE TABLE IF NOT EXISTS `consulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `historia_id` int(11) NOT NULL,
  `motivoconsulta` varchar(500) DEFAULT NULL,
  `enfermedadactual` varchar(500) DEFAULT NULL,
  `ef_ta` varchar(45) DEFAULT NULL,
  `ef_fr` varchar(45) DEFAULT NULL,
  `ef_p` varchar(45) DEFAULT NULL,
  `ef_r` varchar(45) DEFAULT NULL,
  `ef_t` varchar(45) DEFAULT NULL,
  `ef_peso` varchar(45) DEFAULT NULL,
  `ef_talla` varchar(45) DEFAULT NULL,
  `ef_pielyfaneras` varchar(500) DEFAULT NULL,
  `ef_cabeza` varchar(500) DEFAULT NULL,
  `ef_ojos` varchar(500) DEFAULT NULL,
  `ef_nariz` varchar(500) DEFAULT NULL,
  `ef_oidos` varchar(500) DEFAULT NULL,
  `ef_boca` varchar(500) DEFAULT NULL,
  `ef_cuello` varchar(500) DEFAULT NULL,
  `ef_torax` varchar(500) DEFAULT NULL,
  `ef_corazon` varchar(500) DEFAULT NULL,
  `ef_pulmones` varchar(500) DEFAULT NULL,
  `ef_abdomen` varchar(500) DEFAULT NULL,
  `ef_extremidades` varchar(500) DEFAULT NULL,
  `ef_genitourinario` varchar(500) DEFAULT NULL,
  `ef_neurologicoelemental` varchar(500) DEFAULT NULL,
  `ef_impresiondiagnostica` varchar(500) DEFAULT NULL,
  `tratamiento` varchar(500) DEFAULT NULL,
  `creado_at` datetime DEFAULT NULL,
  `modificado_in` datetime DEFAULT NULL,
  `diagnostico` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_consulta_historia1` (`historia_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcar la base de datos para la tabla `consulta`
--

INSERT INTO `consulta` (`id`, `historia_id`, `motivoconsulta`, `enfermedadactual`, `ef_ta`, `ef_fr`, `ef_p`, `ef_r`, `ef_t`, `ef_peso`, `ef_talla`, `ef_pielyfaneras`, `ef_cabeza`, `ef_ojos`, `ef_nariz`, `ef_oidos`, `ef_boca`, `ef_cuello`, `ef_torax`, `ef_corazon`, `ef_pulmones`, `ef_abdomen`, `ef_extremidades`, `ef_genitourinario`, `ef_neurologicoelemental`, `ef_impresiondiagnostica`, `tratamiento`, `creado_at`, `modificado_in`, `diagnostico`) VALUES
(7, 10, 'dolor de estomago', 'no tiene', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no comer mas', '2012-11-04 20:02:10', '2013-03-12 05:50:39', 'dolor de estomago causado por mucha comida'),
(8, 11, 'sadfdsafd', 'dsafsd', '0', '0', '0', '0', '0', '0', '0', 'sdafsd', 'dsfasd', 'dasfds', 'adsfds', 'sadfds', 'sdafsd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dsafds', 'safds', '2012-11-06 11:41:55', NULL, 'dsafd'),
(9, 10, 'dolor de cabeza', 'jaqueca', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dolex', '2012-11-13 11:58:46', '2012-11-19 13:43:03', 'jaqueca'),
(11, 11, NULL, NULL, '0', '0', '0', '0', '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-11-19 10:52:11', NULL, NULL),
(12, 11, NULL, NULL, '0', '0', '0', '0', '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-11-19 10:52:19', NULL, NULL),
(13, 10, 'dolor de muelas', 'tiene brakets', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ibuprofeno', '2012-11-19 10:59:01', '2012-11-19 13:43:27', 'dolor simple'),
(14, 10, NULL, NULL, '0', '0', '0', '0', '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-02-26 03:23:18', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia`
--

CREATE TABLE IF NOT EXISTS `historia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipoidentificacion_id` int(11) NOT NULL,
  `identificacion` varchar(45) DEFAULT NULL,
  `tipoprograma_id` int(11) NOT NULL,
  `tipoeps_id` int(11) NOT NULL,
  `nombres` varchar(200) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `procedencia` varchar(200) DEFAULT NULL,
  `residencia` varchar(200) DEFAULT NULL,
  `creado_at` datetime DEFAULT NULL,
  `telefono1` varchar(45) DEFAULT NULL,
  `telefono2` varchar(45) DEFAULT NULL,
  `tipoestadocivil_id` int(11) NOT NULL,
  `acudiente` varchar(200) DEFAULT NULL,
  `telefonoacudiente` varchar(45) DEFAULT NULL,
  `tipogenero_id` int(11) NOT NULL,
  `antecedentesfami` varchar(500) DEFAULT NULL COMMENT 'antecedentesfamiliares',
  `antecedentespersonales` varchar(500) DEFAULT NULL,
  `apellidos` varchar(200) DEFAULT NULL,
  `habitos` varchar(500) DEFAULT NULL,
  `tiporegimen_id` int(11) NOT NULL,
  `carneteps` varchar(45) DEFAULT NULL,
  `tipozona_id` int(11) NOT NULL,
  `menarquia` varchar(200) DEFAULT NULL,
  `ciclosregulares` varchar(45) DEFAULT NULL,
  `escala` varchar(45) DEFAULT NULL,
  `gestaciones` varchar(500) DEFAULT NULL,
  `edadiniciosexual` varchar(45) DEFAULT NULL,
  `nroparejas` varchar(45) DEFAULT NULL,
  `antinfecciones` varchar(500) DEFAULT NULL,
  `citologias` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identificacion` (`identificacion`),
  KEY `fk_historia_tipoidentificacion` (`tipoidentificacion_id`),
  KEY `fk_historia_tipoprograma1` (`tipoprograma_id`),
  KEY `fk_historia_tipoeps1` (`tipoeps_id`),
  KEY `fk_historia_tipoestadocivil1` (`tipoestadocivil_id`),
  KEY `fk_historia_tipogenero1` (`tipogenero_id`),
  KEY `fk_historia_tiporegimen1` (`tiporegimen_id`),
  KEY `fk_historia_tipozona1` (`tipozona_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcar la base de datos para la tabla `historia`
--

INSERT INTO `historia` (`id`, `tipoidentificacion_id`, `identificacion`, `tipoprograma_id`, `tipoeps_id`, `nombres`, `fechanacimiento`, `procedencia`, `residencia`, `creado_at`, `telefono1`, `telefono2`, `tipoestadocivil_id`, `acudiente`, `telefonoacudiente`, `tipogenero_id`, `antecedentesfami`, `antecedentespersonales`, `apellidos`, `habitos`, `tiporegimen_id`, `carneteps`, `tipozona_id`, `menarquia`, `ciclosregulares`, `escala`, `gestaciones`, `edadiniciosexual`, `nroparejas`, `antinfecciones`, `citologias`) VALUES
(10, 2, '546546', 1, 4, 'hola', '2012-11-02', 'PASTO', 'direccion de prueba', '2012-11-02 10:50:22', '3002556985', NULL, 2, 'ninguno', '54654', 1, 'bebo', 'fumo', 'perez', 'disfruto', 1, '23984739', 1, 'sdlkfj', 'sldjf', 'lksjdfldsk', 'lkjdsklfjs', 'lkjsdfklds', 'sdklfj', 'sldkjfld', 'lkjdslkfd'),
(11, 1, '23432432', 1, 4, 'juanita', '2012-11-08', 'as', 'dasfds', '2012-11-06 11:41:20', '32432', '32432', 2, 'sdfd', '324343', 2, 'asf', 'dasfd', 'SUAREZ', 'dssadfds', 2, '23984732894', 2, 'aadsfds', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesional`
--

CREATE TABLE IF NOT EXISTS `profesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `profesional`
--

INSERT INTO `profesional` (`id`, `nombre`) VALUES
(1, 'DOCTORA M'),
(2, 'DOCTOR P');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remision`
--

CREATE TABLE IF NOT EXISTS `remision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado_at` datetime DEFAULT NULL,
  `tipoeps_id` int(11) NOT NULL COMMENT 'epsdestino\n',
  `consulta_id` int(11) NOT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `examenescomplementarios` varchar(500) DEFAULT NULL,
  `evolucion` varchar(500) DEFAULT NULL,
  `resumenhistoria` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_remision_tipoeps1` (`tipoeps_id`),
  KEY `fk_remision_consulta1` (`consulta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcar la base de datos para la tabla `remision`
--

INSERT INTO `remision` (`id`, `creado_at`, `tipoeps_id`, `consulta_id`, `observaciones`, `examenescomplementarios`, `evolucion`, `resumenhistoria`) VALUES
(4, '2012-11-06 11:42:08', 4, 8, 'safds', 'asdfads', 'adsfd', 'safdas'),
(8, '2012-11-19 16:20:17', 4, 7, 'asdf', 'dsafdsaf', 'adsfads', 'asdfdasf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restricciondia`
--

CREATE TABLE IF NOT EXISTS `restricciondia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipodia_id` int(11) DEFAULT NULL,
  `tipocausa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipodia_id` (`tipodia_id`),
  KEY `tipocausa_id` (`tipocausa_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `restricciondia`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restricciondiahora`
--

CREATE TABLE IF NOT EXISTS `restricciondiahora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipodia_id` int(11) DEFAULT NULL,
  `tipohora_id` int(11) DEFAULT NULL,
  `tipocausa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipodia_id` (`tipodia_id`),
  KEY `tipohora_id` (`tipohora_id`),
  KEY `tipocausa_id` (`tipocausa_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `restricciondiahora`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restriccionfecha`
--

CREATE TABLE IF NOT EXISTS `restriccionfecha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `tipocausa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipocausa_id` (`tipocausa_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `restriccionfecha`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restriccionfechahora`
--

CREATE TABLE IF NOT EXISTS `restriccionfechahora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `tipohora_id` int(11) DEFAULT NULL,
  `tipocausa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipohora_id` (`tipohora_id`),
  KEY `tipocausa_id` (`tipocausa_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `restriccionfechahora`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restriccionhora`
--

CREATE TABLE IF NOT EXISTS `restriccionhora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipohora_id` int(11) DEFAULT NULL,
  `tipocausa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipohora_id` (`tipohora_id`),
  KEY `tipocausa_id` (`tipocausa_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcar la base de datos para la tabla `restriccionhora`
--

INSERT INTO `restriccionhora` (`id`, `tipohora_id`, `tipocausa_id`) VALUES
(5, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocausa`
--

CREATE TABLE IF NOT EXISTS `tipocausa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `tipocausa`
--

INSERT INTO `tipocausa` (`id`, `nombre`) VALUES
(2, 'REUNION'),
(3, 'HORA NO LABORAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipociudad`
--

CREATE TABLE IF NOT EXISTS `tipociudad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `tipodepartamento_id` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipociudad_tipodepartamento1` (`tipodepartamento_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `tipociudad`
--

INSERT INTO `tipociudad` (`id`, `nombre`, `tipodepartamento_id`, `codigo`) VALUES
(1, 'PASTO', 1, '52001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodepartamento`
--

CREATE TABLE IF NOT EXISTS `tipodepartamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `tipodepartamento`
--

INSERT INTO `tipodepartamento` (`id`, `nombre`, `codigo`) VALUES
(1, 'NARINO', '52001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodia`
--

CREATE TABLE IF NOT EXISTS `tipodia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `tipodia`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoeps`
--

CREATE TABLE IF NOT EXISTS `tipoeps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `tipociudad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipoeps_tipociudad1` (`tipociudad_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `tipoeps`
--

INSERT INTO `tipoeps` (`id`, `nombre`, `tipociudad_id`) VALUES
(4, 'NUEVA EPS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoestadocivil`
--

CREATE TABLE IF NOT EXISTS `tipoestadocivil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `tipoestadocivil`
--

INSERT INTO `tipoestadocivil` (`id`, `nombre`) VALUES
(1, 'SOLTERO'),
(2, 'CASADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipogenero`
--

CREATE TABLE IF NOT EXISTS `tipogenero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `tipogenero`
--

INSERT INTO `tipogenero` (`id`, `nombre`) VALUES
(1, 'MASCULINO'),
(2, 'FEMENINO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipohora`
--

CREATE TABLE IF NOT EXISTS `tipohora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `tipohora`
--

INSERT INTO `tipohora` (`id`, `nombre`) VALUES
(1, '7:30'),
(2, '8:00'),
(3, '8:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoidentificacion`
--

CREATE TABLE IF NOT EXISTS `tipoidentificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `tipoidentificacion`
--

INSERT INTO `tipoidentificacion` (`id`, `nombre`) VALUES
(1, 'CEDULA'),
(2, 'TARJETA IDENTIDAD'),
(3, 'PASAPORTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoprograma`
--

CREATE TABLE IF NOT EXISTS `tipoprograma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `tipoprograma`
--

INSERT INTO `tipoprograma` (`id`, `nombre`) VALUES
(1, 'ENFERMERIA'),
(2, 'CONTADURIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporegimen`
--

CREATE TABLE IF NOT EXISTS `tiporegimen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL COMMENT 'contributivosubsidiadovinculado',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `tiporegimen`
--

INSERT INTO `tiporegimen` (`id`, `nombre`) VALUES
(1, 'CONTRIBUTIVO'),
(2, 'SUBSIDIADO'),
(3, 'VINCULADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipozona`
--

CREATE TABLE IF NOT EXISTS `tipozona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL COMMENT 'urbanarural\n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `tipozona`
--

INSERT INTO `tipozona` (`id`, `nombre`) VALUES
(1, 'URBANA'),
(2, 'RURAL');

--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `fk_consulta_historia1` FOREIGN KEY (`historia_id`) REFERENCES `historia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `historia`
--
ALTER TABLE `historia`
  ADD CONSTRAINT `fk_historia_tipoeps1` FOREIGN KEY (`tipoeps_id`) REFERENCES `tipoeps` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_historia_tipoestadocivil1` FOREIGN KEY (`tipoestadocivil_id`) REFERENCES `tipoestadocivil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_historia_tipogenero1` FOREIGN KEY (`tipogenero_id`) REFERENCES `tipogenero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_historia_tipoidentificacion` FOREIGN KEY (`tipoidentificacion_id`) REFERENCES `tipoidentificacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_historia_tipoprograma1` FOREIGN KEY (`tipoprograma_id`) REFERENCES `tipoprograma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_historia_tiporegimen1` FOREIGN KEY (`tiporegimen_id`) REFERENCES `tiporegimen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_historia_tipozona1` FOREIGN KEY (`tipozona_id`) REFERENCES `tipozona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `remision`
--
ALTER TABLE `remision`
  ADD CONSTRAINT `fk_remision_consulta1` FOREIGN KEY (`consulta_id`) REFERENCES `consulta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_remision_tipoeps1` FOREIGN KEY (`tipoeps_id`) REFERENCES `tipoeps` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipociudad`
--
ALTER TABLE `tipociudad`
  ADD CONSTRAINT `fk_tipociudad_tipodepartamento1` FOREIGN KEY (`tipodepartamento_id`) REFERENCES `tipodepartamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipoeps`
--
ALTER TABLE `tipoeps`
  ADD CONSTRAINT `fk_tipoeps_tipociudad1` FOREIGN KEY (`tipociudad_id`) REFERENCES `tipociudad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
