-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2014 a las 15:54:52
-- Versión del servidor: 5.6.14
-- Versión de PHP: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `dpa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambito`
--

CREATE TABLE IF NOT EXISTS `ambito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ambito` varchar(100) DEFAULT NULL,
  `descripcion_sigla` varchar(255) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `ambito`
--

INSERT INTO `ambito` (`id`, `nombre_ambito`, `descripcion_sigla`, `estado`) VALUES
(2, 'Interacción  Social', 'S', 'AC'),
(3, 'Investigación Cientifica y Tecnológica', 'C', 'AC'),
(4, 'Academico (Enseñanza Aprendizaje)', 'A', 'AC'),
(5, 'Administración Universitaria', 'M', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(105) DEFAULT NULL,
  `sigla` varchar(105) DEFAULT NULL,
  `descripcion` varchar(85) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id`, `nombre`, `sigla`, `descripcion`, `estado`) VALUES
(1, 'Logica', 'AL', NULL, 'ac'),
(2, 'Matematicas', 'LD', NULL, 'AC'),
(3, 'Astronomia y Astrofisica', 'LD', NULL, 'AC'),
(4, 'Fisica', 'LD', NULL, 'AC'),
(5, 'Quimica', 'LD', NULL, 'AC'),
(6, 'Ciencias De La Vida', 'LD', NULL, 'AC'),
(7, 'Ciencias De La Tierra y el Espacio', 'LD', NULL, 'AC'),
(8, 'Ciencias Agrarias', 'LD', NULL, 'AC'),
(9, 'Ciencas Medicas', 'LD', NULL, 'AC'),
(10, 'Ciencias Tegnologicas', 'LD', NULL, 'AC'),
(11, 'Antropologia', 'LD', NULL, 'AC'),
(12, 'Demografia', 'LD', NULL, 'AC'),
(13, 'Ciencias Economicas', 'LD', NULL, 'AC'),
(14, 'Geografia', 'LD', NULL, 'AC'),
(15, 'Historia', 'LD', NULL, 'AC'),
(16, 'Ciencias Juridicas y Derecho', 'LD', NULL, 'AC'),
(17, 'Linguistica', 'LD', NULL, 'AC'),
(18, 'Pedagogia', 'LD', NULL, 'AC'),
(19, 'Ciencia Politica', 'LD', NULL, 'AC'),
(20, 'Psicologia', 'LD', NULL, 'AC'),
(21, 'Ciencias De Las Artes y Las Letras', 'LD', NULL, 'AC'),
(22, 'Sociologia', 'LD', NULL, 'AC'),
(23, 'Etica', 'LD', NULL, 'AC'),
(24, 'Filosofia', 'LD', NULL, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_evento`
--

CREATE TABLE IF NOT EXISTS `asistencia_evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_evento` varchar(100) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `duracion` varchar(100) DEFAULT NULL,
  `entidad_organizadora` varchar(100) DEFAULT NULL,
  `del_programa_formacion_doc` varchar(100) DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `tipo_evento_id` int(11) DEFAULT NULL,
  `tipo_certificado_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `unidad_tiempo_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `ambito_id` int(11) DEFAULT NULL,
  `fecha_visado` date DEFAULT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  `archivo` varchar(200) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `asistencia_evento`
--

INSERT INTO `asistencia_evento` (`id`, `nombre_evento`, `fecha_inicio`, `duracion`, `entidad_organizadora`, `del_programa_formacion_doc`, `vb`, `tipo_evento_id`, `tipo_certificado_id`, `funcionario_id`, `area_id`, `subarea_id`, `unidad_tiempo_id`, `pais_id`, `ambito_id`, `fecha_visado`, `observacion`, `archivo`, `estado`) VALUES
(2, 'fadsf', '2014-05-14', '3', 'adf', 'fasdfs', '', 4, 0, 7, NULL, 0, 0, 2, 4, '0000-00-00', 'gsgfd', NULL, 'Pendiente'),
(5, 'hola', '2014-06-18', '', 'fdf', 'dfds', '', 4, 2, 5, 1, 5, 4, 2, 4, '0000-00-00', 'gsdfsdfgsd', 'uploads/41402430001.jpg', 'Aceptado'),
(6, 'holas', '2014-06-11', '2', 'fdf', 'fasdf', '', 3, 1, 1, 1, 5, 3, 2, 5, '0000-00-00', '', 'uploads/41402430317.jpg', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colegio_egreso`
--

CREATE TABLE IF NOT EXISTS `colegio_egreso` (
  `id` int(11) NOT NULL,
  `nombre_colegio` varchar(100) DEFAULT NULL,
  `tipo_colegio` varchar(50) DEFAULT NULL COMMENT 'particular , fiscal,convenio,comunitario, otro',
  `area_colegio` varchar(45) DEFAULT NULL COMMENT 'runal,urbano,frontera',
  `pais_id` int(11) NOT NULL,
  `departamento_id` int(11) NOT NULL,
  `provincia_id` int(11) NOT NULL,
  `municipio_id` int(11) NOT NULL,
  `funcionario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_comunicacion`
--

CREATE TABLE IF NOT EXISTS `datos_comunicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario_id` int(11) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `lugar` varchar(45) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_familiares`
--

CREATE TABLE IF NOT EXISTS `datos_familiares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_id` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido_p` varchar(45) DEFAULT NULL,
  `apellido_m` varchar(45) DEFAULT NULL,
  `parentesco` varchar(45) DEFAULT NULL,
  `sexo` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `profesion` varchar(45) DEFAULT NULL,
  `lugar_residencia` varchar(45) DEFAULT NULL,
  `lugar_de_trabajo` varchar(100) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `datos_familiares`
--

INSERT INTO `datos_familiares` (`id`, `funcionario_id`, `nombre`, `apellido_p`, `apellido_m`, `parentesco`, `sexo`, `fecha_nacimiento`, `profesion`, `lugar_residencia`, `lugar_de_trabajo`, `estado`) VALUES
(1, 0, 'werhdfgfdhdfhdhdfh', 'rwqer', 'rqwer', 'rqwer', 'Hombre', '2014-04-10', 'rwqer', 'rwqer', 'rqwer', 'Pendiente'),
(2, 1, 'fkasdjklj', 'jkljlk', 'ljkljkl', 'Primo', 'Hombre', '2014-05-15', 'kafjsd', 'jfklsdjf', 'gsdfg', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dedicacion`
--

CREATE TABLE IF NOT EXISTS `dedicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_dedicacion` varchar(105) DEFAULT NULL,
  `dedicacioncol` varchar(105) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `dedicacion`
--

INSERT INTO `dedicacion` (`id`, `nombre_dedicacion`, `dedicacioncol`, `estado`) VALUES
(1, '547', '7654', 'AC'),
(2, 'sdfg', 'gsdfg', 'AC'),
(3, 'sfdg', 'sdfg', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dedicacion_exclusiva`
--

CREATE TABLE IF NOT EXISTS `dedicacion_exclusiva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_gestion_id` int(11) DEFAULT NULL,
  `ambito_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `numero_gestiones` varchar(45) DEFAULT NULL,
  `unidad_academica` varchar(105) DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `archivo` varchar(100) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `dedicacion_exclusiva`
--

INSERT INTO `dedicacion_exclusiva` (`id`, `tipo_gestion_id`, `ambito_id`, `funcionario_id`, `fecha_inicio`, `fecha_fin`, `numero_gestiones`, `unidad_academica`, `vb`, `observacion`, `archivo`, `estado`) VALUES
(2, 1, 5, 1, '2014-05-08', '2014-05-31', '34', 'Facultad de Tecnologia', '', NULL, NULL, 'Pendiente'),
(3, 2, 5, 1, '2014-06-12', '2014-06-11', '2', 'Tecnologia', '', 'gsdfgter', 'uploads/41402433576.jpg', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pais_id` int(11) DEFAULT NULL,
  `nombre_depto` varchar(100) DEFAULT NULL,
  `sigla_depto` varchar(100) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `pais_id`, `nombre_depto`, `sigla_depto`, `estado`) VALUES
(1, NULL, 'fasd', 'fasdf', 'AC'),
(2, NULL, 'fasd', 'fasd', 'AC'),
(3, NULL, 'afwqer', 'rqwe', 'AC'),
(4, 1, 'afd', 'fasd', 'AC'),
(5, 1, 'fasdf', 'fasd', 'AC'),
(6, 1, 'fasd', 'fasd', 'AC'),
(7, 2, 'Cochabamba', 'fkjasdlf', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desemp_prof_externo`
--

CREATE TABLE IF NOT EXISTS `desemp_prof_externo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `institucion` varchar(100) DEFAULT NULL,
  `cargo` varchar(105) DEFAULT NULL,
  `nivel_cargo` varchar(105) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_conclusion` date DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `archivo` varchar(100) DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `desemp_prof_externo`
--

INSERT INTO `desemp_prof_externo` (`id`, `funcionario_id`, `area_id`, `subarea_id`, `pais_id`, `institucion`, `cargo`, `nivel_cargo`, `fecha_inicio`, `fecha_conclusion`, `vb`, `archivo`, `observacion`, `estado`) VALUES
(1, 1, 24, 243, 2, 'gdf', 'gds', 'Operativo', '2014-06-18', '2014-06-20', '', 'uploads/41402494606.jpg', 'sdfgsdgsdgsfg', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distincion`
--

CREATE TABLE IF NOT EXISTS `distincion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `universidad_id` int(11) DEFAULT NULL,
  `universidad` varchar(100) DEFAULT NULL,
  `tipo_distincion_id` int(11) DEFAULT NULL,
  `nombre_distincion` varchar(100) DEFAULT NULL,
  `institucion` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `universitaria` varchar(100) DEFAULT NULL,
  `ambitodistincion` varchar(100) DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `archivo` varchar(100) DEFAULT NULL,
  `observacion` varchar(500) DEFAULT NULL,
  `fecha_visado` date DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `distincion`
--

INSERT INTO `distincion` (`id`, `funcionario_id`, `pais_id`, `universidad_id`, `universidad`, `tipo_distincion_id`, `nombre_distincion`, `institucion`, `fecha`, `universitaria`, `ambitodistincion`, `vb`, `archivo`, `observacion`, `fecha_visado`, `estado`) VALUES
(1, 1, 2, 0, NULL, 1, 'fads', 'fgdd', '0000-00-00', 'Si', 'Nacional', '', '', '', '0000-00-00', 'Pendiente'),
(2, 1, 2, 0, NULL, 1, 'ja', 'umss', '0000-00-00', '', 'Internacional', '', 'uploads/41402503987.jpg', 'sfgsdg', '0000-00-00', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docencia_auxiliatura_umss`
--

CREATE TABLE IF NOT EXISTS `docencia_auxiliatura_umss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `materia` varchar(105) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `numero_gestiones` varchar(45) DEFAULT NULL,
  `carrera` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `facultad` varchar(100) DEFAULT NULL,
  `condicion` varchar(100) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `tipo_gestion_id` int(11) DEFAULT NULL,
  `nivel_formacion_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  `archivo` varchar(200) DEFAULT NULL,
  `vb` varchar(20) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `docencia_auxiliatura_umss`
--

INSERT INTO `docencia_auxiliatura_umss` (`id`, `materia`, `fecha_inicio`, `numero_gestiones`, `carrera`, `departamento`, `facultad`, `condicion`, `area_id`, `subarea_id`, `tipo_gestion_id`, `nivel_formacion_id`, `funcionario_id`, `observacion`, `archivo`, `vb`, `estado`) VALUES
(1, '', '0000-00-00', 'gsdfg', '', 'gsd', 'gsdg', 'gsdg', NULL, 0, 0, 1, 0, 'gsef', NULL, NULL, 'Pendiente'),
(2, 'fisica', '2014-05-15', '2', '', '', '', '', NULL, 0, 0, 1, 0, 'Aprobaciónfsadf', NULL, NULL, 'Pendiente'),
(3, 'Electronica', '2014-06-11', 'fasdf', 'fasdf', 'fasdf', 'fasdf', 'Docente', 1, 5, 2, 1, 0, '', '', '', 'Pendiente'),
(4, '', '0000-00-00', '', '', '', '', '', 0, 0, 0, 0, 0, '', '', '', 'Pendiente'),
(5, '', '0000-00-00', '', '', '', '', '', 0, 0, 0, 0, 0, '', '', '', 'Pendiente'),
(6, 'gsdfg', '2014-06-20', '56', 'fasd', 'fasd', 'fasd', 'Auxiliar', 1, 5, 2, 1, 0, '', '', '', 'Pendiente'),
(7, 'fasdf', '2014-06-04', '34', 'fasdf', 'fasdf', 'fasdf', 'Docente', 1, 5, 1, 1, 1, 'sdfgfgd', 'uploads/41402439026.jpg', '', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docencia_axuliar_externa`
--

CREATE TABLE IF NOT EXISTS `docencia_axuliar_externa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `materia` varchar(105) DEFAULT NULL,
  `fecha_inicio` varchar(100) DEFAULT NULL,
  `duracion` varchar(100) DEFAULT NULL,
  `carrera` varchar(105) DEFAULT NULL,
  `departamento` varchar(105) DEFAULT NULL,
  `facultad` varchar(105) DEFAULT NULL,
  `otra_universidad` varchar(105) DEFAULT NULL,
  `condicion` varchar(105) DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `universidad_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `unidad_tiempo_id` int(11) DEFAULT NULL,
  `nivel_formacion_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `archivo` varchar(200) DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `docencia_axuliar_externa`
--

INSERT INTO `docencia_axuliar_externa` (`id`, `materia`, `fecha_inicio`, `duracion`, `carrera`, `departamento`, `facultad`, `otra_universidad`, `condicion`, `vb`, `universidad_id`, `pais_id`, `unidad_tiempo_id`, `nivel_formacion_id`, `area_id`, `subarea_id`, `funcionario_id`, `archivo`, `observacion`, `estado`) VALUES
(1, 'zxvczx', '2014-06-26', '4', 'fasdf', 'fasf', 'fasdf', 'fasdf', 'Docente', '', 1, 2, 4, 1, 23, 239, 0, 'uploads/41402451071.jpg', 'jaaaaaaa', 'Aceptado'),
(3, 'sdfg', '2014-06-11', '4', 'sdfg', 'gfsdg', 'gsdfg', 'gsdfg', 'Docente', '', 1, 2, 2, 1, 21, 220, 0, 'uploads/41402451347.jpg', 'jaaaaaaaaaaaa', 'Aceptado'),
(4, 'sdg', '2014-06-11', '9', 'dfg', 'gsdfg', 'gsgsd', 'gsdfg', 'Auxiliar', '', 1, 1, 3, 1, 21, 220, 0, 'uploads/41402451485.jpg', 'dfsafg', 'Aceptado'),
(5, 'rwe', '2014-06-12', '4', 'sfgs', 'gsdfg', 'gsdfg', 'gsdfg', 'Docente', '', 1, 2, 2, 1, 23, 238, 1, 'uploads/41402451764.jpg', 'gsdfgsdfg', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento_titularidad`
--

CREATE TABLE IF NOT EXISTS `documento_titularidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_facultad` varchar(100) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dominio_idioma`
--

CREATE TABLE IF NOT EXISTS `dominio_idioma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_idioma` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `habla` varchar(105) DEFAULT NULL,
  `lee` varchar(45) DEFAULT NULL,
  `escribe` varchar(45) DEFAULT NULL,
  `dominio_idioma` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `observacion` varchar(500) DEFAULT NULL,
  `fecha_visado` date DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `dominio_idioma`
--

INSERT INTO `dominio_idioma` (`id`, `id_idioma`, `funcionario_id`, `habla`, `lee`, `escribe`, `dominio_idioma`, `descripcion`, `observacion`, `fecha_visado`, `estado`) VALUES
(19, 3, 1, 'regular', 'regular', 'bien', '', '', '', '0000-00-00', NULL),
(21, 1, 1, 'regular', 'bien', 'bien', '', '', '', '0000-00-00', NULL),
(22, 2, 1, 'regular', 'bien', 'bien', '', '', '', '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio_liberal_prof`
--

CREATE TABLE IF NOT EXISTS `ejercicio_liberal_prof` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institucion_actividad` varchar(100) DEFAULT NULL,
  `cargo_actividad` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `duracion` varchar(45) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `unidad_tiempo_id` int(11) DEFAULT NULL,
  `archivo` varchar(200) DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ejercicio_liberal_prof`
--

INSERT INTO `ejercicio_liberal_prof` (`id`, `institucion_actividad`, `cargo_actividad`, `tipo`, `fecha_inicio`, `duracion`, `funcionario_id`, `pais_id`, `area_id`, `subarea_id`, `unidad_tiempo_id`, `archivo`, `observacion`, `estado`) VALUES
(1, 'dfg', 'gdf', 'Otro', '2014-05-08', '55', 5, 1, 1, 5, 0, NULL, NULL, 'Aceptado'),
(2, 'Umss', 'Encargado', 'Asesor', '2014-06-18', '', 1, 2, 21, 220, 3, 'uploads/41402496330.jpg', 'fdsfgfdafdsdf', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE IF NOT EXISTS `evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_evento` varchar(45) DEFAULT NULL,
  `tema_expocicion` varchar(45) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `duracion` varchar(45) DEFAULT NULL,
  `entidad_organizadora` varchar(45) DEFAULT NULL,
  `organizado_por_instacia_univ` varchar(45) DEFAULT NULL,
  `tipo_evento_id` int(11) DEFAULT NULL,
  `ambito_id` int(11) DEFAULT NULL,
  `unidad_tiempo_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) NOT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `tipo_participacion_id` int(11) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `archivo` varchar(100) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id`, `nombre_evento`, `tema_expocicion`, `fecha_inicio`, `duracion`, `entidad_organizadora`, `organizado_por_instacia_univ`, `tipo_evento_id`, `ambito_id`, `unidad_tiempo_id`, `area_id`, `subarea_id`, `funcionario_id`, `pais_id`, `tipo_participacion_id`, `descripcion`, `archivo`, `estado`) VALUES
(5, 'fasd', 'fasd', '2014-05-14', '445', 'dfasf', 'fasdf', 3, 5, 0, 0, 0, 0, 2, 4, NULL, NULL, 'Pendiente'),
(6, 'fasdf', 'fasdf', '2014-05-13', 'fasdf', 'fasdf', 'fasdf', 4, 5, 0, 0, 0, 1, 1, 2, NULL, NULL, 'Aceptado'),
(7, 'capacitacion', 'informatica forence', '2014-05-07', '4', 'sdsd', 'sdssd', 4, 4, 0, 0, 0, 1, 2, 3, NULL, NULL, 'Pendiente'),
(8, 'informatica', 'Nuevos tecnologias', '2014-05-22', '122', '112', '', 3, 4, 0, 0, 0, 5, 2, 3, NULL, NULL, 'Pendiente'),
(9, 'Ciencias de la computacion', 'redes neuroales', '2014-05-01', '3', 'umss', 'Ciencias de Tecnologia', 4, 3, 0, 0, 0, 1, 2, 1, NULL, NULL, 'Pendiente'),
(10, '', '', '2014-05-22', '', 'fasd', 'fasdf', 0, 5, 0, 1, 4, 5, 2, 3, NULL, NULL, 'Pendiente'),
(11, 'jaaaaaaaaaaaaaa', '', '0000-00-00', '', '', '', 2, 0, 0, 0, 3, 1, 0, 0, '', 'uploads/41401940716.jpg', 'Aceptado'),
(12, '', '', '2014-06-19', '', '', '', 0, 5, 0, 1, 4, 1, 1, 4, 'xcbsdfgsdg', 'uploads/41401938609.jpg', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE IF NOT EXISTS `facultad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `sigla` varchar(105) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formacion_postgrado`
--

CREATE TABLE IF NOT EXISTS `formacion_postgrado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_titulo_post` varchar(100) DEFAULT NULL,
  `tesis_post` varchar(100) DEFAULT NULL,
  `titulo_post` varchar(105) DEFAULT NULL,
  `duracion_curso_post` varchar(105) DEFAULT NULL,
  `institucion_post` varchar(200) DEFAULT NULL,
  `ciudad_post` varchar(105) DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `hrs_presenciales_post` varchar(45) DEFAULT NULL,
  `hrs_no_presenciales_post` varchar(45) DEFAULT NULL,
  `creditos_post` varchar(45) DEFAULT NULL,
  `universidad_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `unidad_tiempo_id` int(11) DEFAULT NULL,
  `grado_academico_id` int(11) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `observacion` varchar(500) DEFAULT NULL,
  `archivo` varchar(100) DEFAULT NULL,
  `fecha_visado` date DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `formacion_postgrado`
--

INSERT INTO `formacion_postgrado` (`id`, `fecha_titulo_post`, `tesis_post`, `titulo_post`, `duracion_curso_post`, `institucion_post`, `ciudad_post`, `vb`, `hrs_presenciales_post`, `hrs_no_presenciales_post`, `creditos_post`, `universidad_id`, `funcionario_id`, `pais_id`, `area_id`, `subarea_id`, `unidad_tiempo_id`, `grado_academico_id`, `descripcion`, `observacion`, `archivo`, `fecha_visado`, `estado`) VALUES
(2, '2014-06-21', 'asfsd', 'sgs', '', 'Umss', '', '', '5', '5', '6', 0, 5, 2, 10, 128, 2, 1, '', 'fasdfasf', 'uploads/41402627255.jpg', '0000-00-00', 'Pendiente'),
(5, '2014-06-20', 'gssssssssssssssssssdf', 'dsafddddddddddddd', 'fdsaaaaaaaaaaaaa', 'dfgh', '', '', '78', '77', 'f', 0, 1, 2, 20, 207, 0, 0, '', '', 'uploads/41402627725.jpg', '0000-00-00', 'Pendiente'),
(6, '2014-06-13', '', '', '', 'Umss', '', '', '2', '3', '5', 0, 1, 2, 20, 207, 4, 0, '', 'rfqwerw', 'uploads/41402627962.jpg', '0000-00-00', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formacion_pregrado`
--

CREATE TABLE IF NOT EXISTS `formacion_pregrado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_diploma` date DEFAULT NULL,
  `fecha_titulo` date DEFAULT NULL,
  `nombre_titulo` varchar(105) DEFAULT NULL,
  `tesis_pregrado` varchar(105) DEFAULT NULL,
  `titulo_tesis_pregrado` varchar(105) DEFAULT NULL,
  `duracion_curso_pregrado` varchar(45) DEFAULT NULL,
  `otra_institucion` varchar(45) DEFAULT NULL,
  `ciudad_pregrado` varchar(105) DEFAULT NULL,
  `vb_pregrado` varchar(45) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `universidad_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `pais_funcionario_id` int(11) DEFAULT NULL,
  `unidad_tiempo_id` int(11) DEFAULT NULL,
  `grado_academico_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `observacion` varchar(500) DEFAULT NULL,
  `fecha_visado` date DEFAULT NULL,
  `archivo` varchar(200) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `formacion_pregrado`
--

INSERT INTO `formacion_pregrado` (`id`, `fecha_diploma`, `fecha_titulo`, `nombre_titulo`, `tesis_pregrado`, `titulo_tesis_pregrado`, `duracion_curso_pregrado`, `otra_institucion`, `ciudad_pregrado`, `vb_pregrado`, `funcionario_id`, `universidad_id`, `pais_id`, `pais_funcionario_id`, `unidad_tiempo_id`, `grado_academico_id`, `area_id`, `subarea_id`, `descripcion`, `observacion`, `fecha_visado`, `archivo`, `estado`) VALUES
(1, '0000-00-00', '0000-00-00', 'ildfihj', 'hhjjh', 'hjhjhj', 'hjhj', '', 'hjhj', '', 3, 0, 0, 0, 0, 0, NULL, 0, '', NULL, NULL, NULL, 'AC'),
(3, '0000-00-00', '0000-00-00', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL, 0, '', '			\r\n			afdsfasf', '0000-00-00', NULL, 'mala'),
(4, '0000-00-00', '0000-00-00', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL, 0, '', '			\r\n		lkl	', '0000-00-00', NULL, 'mala'),
(6, '0000-00-00', '0000-00-00', 'fasdf', 'fasdf', 'fasdf', '', '', 'fasdf', '', 1, 1, 2, 0, 0, 1, 0, 0, '', 'erw', '0000-00-00', 'uploads/41402596863.jpg', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido_p` varchar(105) DEFAULT NULL,
  `apellido_m` varchar(105) DEFAULT NULL,
  `ci` int(11) DEFAULT NULL,
  `extendido_ci` varchar(20) DEFAULT NULL,
  `run` int(11) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `num_libreta_militar` int(11) DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `sexo` varchar(20) DEFAULT NULL,
  `estado_civil` varchar(50) DEFAULT NULL,
  `numero_hijos` int(11) DEFAULT NULL,
  `grupo_sanguineo` varchar(200) DEFAULT NULL,
  `factor` varchar(30) DEFAULT NULL,
  `email1` varchar(105) DEFAULT NULL,
  `email2` varchar(100) DEFAULT NULL,
  `direccion_domicilio` varchar(100) DEFAULT NULL,
  `numero_domicilio` int(11) DEFAULT NULL,
  `telefono_domicilio` int(11) DEFAULT NULL,
  `casilla_correo` varchar(45) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `departamento_id` int(11) DEFAULT NULL,
  `provincia_id` int(11) DEFAULT NULL,
  `municipio_id` int(11) DEFAULT NULL,
  `colegio_egreso` varchar(100) DEFAULT NULL,
  `tipo_colegio` varchar(50) DEFAULT NULL,
  `area_colegio` varchar(50) DEFAULT NULL,
  `fecha_titulo_bachiller` date DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `funcionario`
--

INSERT INTO `funcionario` (`id`, `nombre`, `apellido_p`, `apellido_m`, `ci`, `extendido_ci`, `run`, `fecha_nac`, `num_libreta_militar`, `nacionalidad`, `sexo`, `estado_civil`, `numero_hijos`, `grupo_sanguineo`, `factor`, `email1`, `email2`, `direccion_domicilio`, `numero_domicilio`, `telefono_domicilio`, `casilla_correo`, `pais_id`, `departamento_id`, `provincia_id`, `municipio_id`, `colegio_egreso`, `tipo_colegio`, `area_colegio`, `fecha_titulo_bachiller`, `usuario_id`, `descripcion`, `estado`) VALUES
(1, 'Pedro', 'ppaapp', 'fgsdgf', 766757, '', 0, '2014-05-16', 455666, 'Boliviana', 'Masculino', 'Soltero', 0, '', '', 'pedro@mail.com', 'pedrito@gmail.com', '', 0, 0, '', 0, 7, 0, 0, 'Jaaaaaaaaa', 'Particular', 'Urbano', '2014-05-16', 3, '', 'AC'),
(2, NULL, 'funcionario', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', 0, 0, '', NULL, 0, NULL, 0, NULL, NULL, '0', NULL, 4, '', 'AC'),
(3, NULL, 'jkjkjk', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', 0, 0, '', NULL, 0, NULL, 0, NULL, NULL, '0', NULL, 5, '', 'AC'),
(4, NULL, 'fasdf', 'fasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', 0, 0, '', NULL, 7, NULL, 0, NULL, NULL, '0', NULL, 0, '', 'AC'),
(5, NULL, 'fasdffadsf', 'fads', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', 0, 0, '', NULL, 6, NULL, 0, NULL, NULL, '2', NULL, 4, 'fadsf', 'AC'),
(6, NULL, 'perez', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', 0, 0, '', NULL, 0, NULL, 0, NULL, NULL, '0', NULL, 6, '', 'AC'),
(7, NULL, 'predros', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', 0, 0, '', NULL, 0, NULL, 0, NULL, NULL, '0', NULL, 7, '', 'AC'),
(8, NULL, 'afsda', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', 0, 0, '', NULL, 0, NULL, 0, NULL, NULL, '0', NULL, 8, '', 'AC'),
(9, NULL, 'vzxcv', '', 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 11, '', 'AC'),
(10, NULL, 'hjsakdfahs', '', 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 12, '', 'AC'),
(11, NULL, 'fasdf', '', 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 13, '', 'AC'),
(12, NULL, 'ely', '', 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 14, '', 'AC'),
(13, NULL, 'jenny', '', 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 15, '', 'AC'),
(14, NULL, 'Huna', '', 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, '', 'AC'),
(15, 'miranda', 'tmasnnn', '', 0, '', 0, '0000-00-00', 0, '', '', '', 0, '', '', '', '', '', 0, 0, '', 0, 0, 0, 0, '', '', '', '0000-00-00', 17, '', 'AC'),
(16, 'Juan', 'Perez', 'Mendoza', 5566767, '', 0, '0000-00-00', 0, '', '', '', 0, '', '', 'juansperez@gmail.com', '', '', 0, 0, '', 0, 0, 0, 0, '', '', '', '0000-00-00', 19, '', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado_academico`
--

CREATE TABLE IF NOT EXISTS `grado_academico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_grado_academico` varchar(100) DEFAULT NULL,
  `sigla_grado_academico` varchar(100) DEFAULT NULL,
  `id_nivel_formacion` int(11) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `grado_academico`
--

INSERT INTO `grado_academico` (`id`, `nombre_grado_academico`, `sigla_grado_academico`, `id_nivel_formacion`, `descripcion`, `estado`) VALUES
(1, 'twe', 'wert', 1, 'twertrwe', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE IF NOT EXISTS `grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(155) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id`, `codigo`, `descripcion`, `estado`) VALUES
(1, 'Admin', 'Administrador', 'AC'),
(2, 'Funcionario', 'El funcionario o jefes', 'AC'),
(3, 'Secretaria', 'secretaria', 'AC'),
(4, 'Registrado', 'Registrado', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idioma`
--

CREATE TABLE IF NOT EXISTS `idioma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_idioma` varchar(100) DEFAULT NULL,
  `sigla_idioma` varchar(5) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `idioma`
--

INSERT INTO `idioma` (`id`, `nombre_idioma`, `sigla_idioma`, `estado`) VALUES
(1, 'Ingles', '', 'AC'),
(2, 'Frances', 'fs', 'AC'),
(3, 'Español', 'fsd', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instancia_universitaria`
--

CREATE TABLE IF NOT EXISTS `instancia_universitaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboral_external_actual`
--

CREATE TABLE IF NOT EXISTS `laboral_external_actual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institucion_actividad` varchar(105) DEFAULT NULL,
  `direccion` varchar(105) DEFAULT NULL,
  `cargo` varchar(105) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `casilla_correo` varchar(45) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `email` varchar(105) DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboral_umss_actual`
--

CREATE TABLE IF NOT EXISTS `laboral_umss_actual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(105) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `dedicacion` varchar(100) DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `dedicacion_id` int(11) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medio_difusion`
--

CREATE TABLE IF NOT EXISTS `medio_difusion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `medio_difusion`
--

INSERT INTO `medio_difusion` (`id`, `sigla`, `descripcion`, `estado`) VALUES
(1, 'Medio electronico', 'M', 'AC'),
(2, 'Periódico Internacional', 'E', 'AC'),
(3, 'Libro', 'L', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresia`
--

CREATE TABLE IF NOT EXISTS `membresia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_organizacion_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `investigacion` varchar(45) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `otra_organizacion` varchar(45) DEFAULT NULL,
  `miembro` varchar(45) DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `membresia`
--

INSERT INTO `membresia` (`id`, `tipo_organizacion_id`, `funcionario_id`, `investigacion`, `fecha_inicio`, `fecha_fin`, `otra_organizacion`, `miembro`, `vb`, `estado`) VALUES
(1, 0, 0, 'gsdfg', '0000-00-00', '0000-00-00', 'gsdfg', 'sdfg', '', 'Pendiente'),
(2, 0, 1, 'gsdfg', '0000-00-00', '0000-00-00', 'gsdfg', 'gsdfg', 'gsdfg', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE IF NOT EXISTS `modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id`, `codigo`, `nombre`, `url`, `descripcion`, `estado`) VALUES
(10, 'Ambito', 'Ámbito', '', 'M&oacute;dulo: Ambito', 'AC'),
(11, 'Area', 'Área ', '', 'M&oacute;dulo: Area', 'AC'),
(12, 'Area Colegio', NULL, NULL, 'M&oacute;dulo: Area Colegio', 'AC'),
(13, 'Asistencia Evento', NULL, NULL, 'M&oacute;dulo: Asistencia Evento', 'AC'),
(14, 'Dedicacion', NULL, NULL, 'M&oacute;dulo: Dedicación', 'AC'),
(15, 'Dedicacion Exclusiva', NULL, NULL, 'M&oacute;dulo: Dedicación Exclusiva', 'AC'),
(17, 'Distincion', NULL, NULL, 'M&oacute;dulo: Distinción', 'AC'),
(18, 'Docencia Auxiliatura Umss', NULL, NULL, 'M&oacute;dulo: Docencia Auxiliatura Umss', 'AC'),
(19, 'Documento Titularidad', NULL, NULL, 'M&oacute;dulo: Documento Titularidad', 'AC'),
(20, 'Dominio Idioma', NULL, NULL, 'M&oacute;dulo: Dominio Idioma', 'AC'),
(21, 'Evento', NULL, NULL, 'M&oacute;dulo: Evento', 'AC'),
(22, 'Facultad', NULL, NULL, 'M&oacute;dulo: Facultad', 'AC'),
(23, 'Formacion Postgrado', NULL, NULL, 'M&oacute;dulo: Formación Postgrado', 'AC'),
(24, 'Formacion Pregrado', NULL, NULL, 'M&oacute;dulo: Formación Pregrado', 'AC'),
(25, 'Datos Personales', NULL, NULL, 'M&oacute;dulo: Datos Personales', 'AC'),
(26, 'Grado Academico', NULL, NULL, 'M&oacute;dulo: Grado Academico', 'AC'),
(27, 'Grupo', NULL, NULL, 'M&oacute;dulo: Grupo', 'AC'),
(28, 'Idioma', NULL, NULL, 'M&oacute;dulo: Idioma', 'AC'),
(29, 'Instancia Universitaria', NULL, NULL, 'M&oacute;dulo: Instancia Universitaria', 'AC'),
(30, 'Medio Difusion', NULL, NULL, 'M&oacute;dulo: Medio Difusion', 'AC'),
(31, 'Membresia', NULL, NULL, 'M&oacute;dulo: Membresia', 'AC'),
(32, 'Modulo', NULL, NULL, 'M&oacute;dulo: Modulo', 'AC'),
(34, 'Nivel Formacion', NULL, NULL, 'M&oacute;dulo: Nivel Formación', 'AC'),
(35, 'Pais', NULL, NULL, 'M&oacute;dulo: Pais', 'AC'),
(36, 'Patente', NULL, NULL, 'M&oacute;dulo: Patente', 'AC'),
(37, 'Plan Proyecto Programa', NULL, NULL, 'M&oacute;dulo: Plan Proyecto Programa', 'AC'),
(38, 'Produccion', NULL, NULL, 'M&oacute;dulo: Producción', 'AC'),
(41, 'Tipo Certificado', NULL, NULL, 'M&oacute;dulo: Tipo Certificado', 'AC'),
(42, 'Tipo Distincion', NULL, NULL, 'M&oacute;dulo: Tipo Distinción', 'AC'),
(43, 'Tipo Evento', NULL, NULL, 'M&oacute;dulo: Tipo Evento', 'AC'),
(44, 'Tipo Gestion', NULL, NULL, 'M&oacute;dulo: Tipo Gestión', 'AC'),
(45, 'Tipo Organizacion', NULL, NULL, 'M&oacute;dulo: Tipo Organización', 'AC'),
(46, 'Tipo Participacion', NULL, NULL, 'M&oacute;dulo: Tipo Participación', 'AC'),
(47, 'Tipo Perfeccionamiento', NULL, NULL, 'M&oacute;dulo: Tipo Perfeccionamiento', 'AC'),
(48, 'Tipo Produccion', NULL, NULL, 'M&oacute;dulo: Tipo Producción', 'AC'),
(49, 'Titularizacion', NULL, NULL, 'M&oacute;dulo: Titularización', 'AC'),
(50, 'Unidad Tiempo', NULL, NULL, 'M&oacute;dulo: Unidad Tiempo', 'AC'),
(51, 'Universidad', NULL, NULL, 'M&oacute;dulo: Universidad', 'AC'),
(52, 'Usuario', NULL, NULL, 'M&oacute;dulo: Usuario', 'AC'),
(53, 'Vida Universitaria', NULL, NULL, 'M&oacute;dulo: Vida Universitaria', 'AC'),
(54, 'Vida Universitaria Externa', NULL, NULL, 'M&oacute;dulo: Vida Universitaria Externa', 'AC'),
(55, 'Permiso', NULL, NULL, 'M&oacute;dulo: Permiso', 'AC'),
(56, 'Pertenece', NULL, NULL, 'M&oacute;dulo: Pertenece', 'AC'),
(57, 'Docencia Auxiliar Externa', '', '', 'M&oacute;dulo: Docencia Auxiliatua Externa', 'AC'),
(58, 'Solicitante', '', '', 'M&oacute;dulo: Solicitante', 'AC'),
(59, 'VISITA', '', '', 'M&oacute;dulo: VISITA', 'AC'),
(60, 'Secuencia', '', '', 'M&oacute;dulo: Secuencia', 'AC'),
(61, 'Vivienda', '', '', 'M&oacute;dulo: Vivienda', 'AC'),
(62, 'Datos Familiares', '', '', 'M&oacute;dulo: Datos Familiares', 'AC'),
(63, 'Ejercicio liberal profesion', '', '', 'M&oacute;dulo: Ejercicio liberal profesion', 'AC'),
(64, 'Perfeccionamiento Profesional', '', '', 'M&oacute;dulo: Perfeccionamiento Profesional', 'AC'),
(65, 'Desempeño Profesional Externo', '', '', 'M&oacute;dulo: Desempeño Profesional Externo', 'AC'),
(68, 'Jefe', '', '', 'M&oacute;dulo: Jefe', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE IF NOT EXISTS `municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_municipio` varchar(100) DEFAULT NULL,
  `sigla_municipio` varchar(105) DEFAULT NULL,
  `provinvia_id` int(11) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_formacion`
--

CREATE TABLE IF NOT EXISTS `nivel_formacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_nivel_formacion` varchar(100) DEFAULT NULL,
  `sigla_nivel_formacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `nivel_formacion`
--

INSERT INTO `nivel_formacion` (`id`, `nombre_nivel_formacion`, `sigla_nivel_formacion`, `descripcion`, `estado`) VALUES
(1, 'dsg', 'gsdfg', 'gfd', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(105) DEFAULT NULL,
  `sigla_pais` varchar(105) DEFAULT NULL,
  `gentilicio_pais` varchar(105) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `nombre_pais`, `sigla_pais`, `gentilicio_pais`, `estado`) VALUES
(1, 'argentina', 'fsad', '', 'AC'),
(2, 'Bolivia', 'blo', 'fasd', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patente`
--

CREATE TABLE IF NOT EXISTS `patente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_patente` varchar(105) DEFAULT NULL,
  `titulo_descripcion` varchar(105) DEFAULT NULL,
  `fechas` date DEFAULT NULL,
  `vb` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `archivo` varchar(100) DEFAULT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `patente`
--

INSERT INTO `patente` (`id`, `numero_patente`, `titulo_descripcion`, `fechas`, `vb`, `funcionario_id`, `area_id`, `subarea_id`, `pais_id`, `archivo`, `observacion`, `estado`) VALUES
(3, 'sgsd', 'hsdfh', NULL, 0, 3, NULL, 0, 0, NULL, '', 'AC'),
(4, 'fgjd', 'fghf', '0000-00-00', 0, 1, 22, 227, 2, 'uploads/41402500795.jpg', 'fgssf', 'Aceptado'),
(8, '555', 'afasd', '0000-00-00', 0, 1, 23, 239, 2, 'uploads/41402500676.jpg', 'wertwe', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfeccionamiento_profecional`
--

CREATE TABLE IF NOT EXISTS `perfeccionamiento_profecional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_perfeccionamiento_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `unidad_tiempo_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `universidad_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `fecha_certificado` date DEFAULT NULL,
  `certificado` varchar(100) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `diploma` varchar(100) DEFAULT NULL,
  `titulo_trabajo_final` varchar(100) DEFAULT NULL,
  `mencion` varchar(100) DEFAULT NULL,
  `duracion_curso` varchar(100) DEFAULT NULL,
  `hrs_presenciales` varchar(50) DEFAULT NULL,
  `hrs_no_presenciales` varchar(45) DEFAULT NULL,
  `creditos` varchar(45) DEFAULT NULL,
  `otra_institucion` varchar(100) DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `archivo` varchar(200) DEFAULT NULL,
  `observacion` varchar(500) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `perfeccionamiento_profecional`
--

INSERT INTO `perfeccionamiento_profecional` (`id`, `tipo_perfeccionamiento_id`, `funcionario_id`, `unidad_tiempo_id`, `pais_id`, `universidad_id`, `area_id`, `subarea_id`, `fecha_certificado`, `certificado`, `titulo`, `diploma`, `titulo_trabajo_final`, `mencion`, `duracion_curso`, `hrs_presenciales`, `hrs_no_presenciales`, `creditos`, `otra_institucion`, `vb`, `archivo`, `observacion`, `estado`) VALUES
(3, 3, 1, 3, 2, 0, 1, 5, '2014-06-19', 'Si', 'No', 'Si', 'twert', 'twert', '97', '556', '56', 'dgfd', 'hdfghd', '', 'uploads/41402425782.jpg', 'gsdfgsdg', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE IF NOT EXISTS `permiso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ver` varchar(45) DEFAULT NULL,
  `crear` varchar(45) DEFAULT NULL,
  `editar` varchar(45) DEFAULT NULL,
  `eliminar` varchar(45) DEFAULT NULL,
  `modulo_id` int(11) DEFAULT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=115 ;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`id`, `ver`, `crear`, `editar`, `eliminar`, `modulo_id`, `grupo_id`, `estado`) VALUES
(19, '1', '1', '1', '1', 9, 1, 'AC'),
(20, '1', '1', '1', '1', 10, 1, 'AC'),
(21, '1', '1', '1', '1', 11, 1, 'AC'),
(22, '1', '1', '1', '1', 12, 1, 'AC'),
(24, '1', '1', '1', '1', 14, 1, 'AC'),
(29, '1', '1', '1', '1', 19, 1, 'AC'),
(32, '1', '1', '1', '1', 22, 1, 'AC'),
(36, '1', '1', '1', '1', 26, 1, 'AC'),
(37, '1', '1', '1', '1', 27, 1, 'AC'),
(38, '1', '1', '1', '1', 28, 1, 'AC'),
(39, '1', '1', '1', '1', 29, 1, 'AC'),
(40, '1', '1', '1', '1', 30, 1, 'AC'),
(42, '1', '1', '1', '1', 32, 1, 'AC'),
(44, '1', '1', '1', '1', 34, 1, 'AC'),
(45, '1', '1', '1', '1', 35, 1, 'AC'),
(50, '1', '1', '1', '1', 40, 1, 'AC'),
(51, '1', '1', '1', '1', 41, 1, 'AC'),
(52, '1', '1', '1', '1', 42, 1, 'AC'),
(53, '1', '1', '1', '1', 43, 1, 'AC'),
(54, '1', '1', '1', '1', 44, 1, 'AC'),
(55, '1', '1', '1', '1', 45, 1, 'AC'),
(56, '1', '1', '1', '1', 46, 1, 'AC'),
(57, '1', '1', '1', '1', 47, 1, 'AC'),
(58, '1', '1', '1', '1', 48, 1, 'AC'),
(60, '1', '1', '1', '1', 50, 1, 'AC'),
(61, '1', '1', '1', '1', 51, 1, 'AC'),
(62, '1', '1', '1', '1', 52, 1, 'AC'),
(65, '1', '1', '1', '1', 55, 1, 'AC'),
(66, '1', '', '', '', 23, 4, 'AC'),
(67, '1', '', '', '', 24, 4, 'AC'),
(68, '1', '', '', '', 13, 4, 'AC'),
(69, '1', '', '', '', 18, 4, 'AC'),
(70, '1', '', '', '', 49, 4, 'AC'),
(71, '1', '', '', '', 38, 4, 'AC'),
(72, '1', '', '', '', 36, 4, 'AC'),
(73, '1', '', '', '', 17, 4, 'AC'),
(74, '1', '', '', '', 17, 4, 'AC'),
(75, '1', '1', '1', '1', 56, 1, 'AC'),
(77, '1', '', '', '', 57, 4, 'AC'),
(78, '1', '', '', '', 57, 4, 'AC'),
(79, '1', '', '', '', 53, 4, 'AC'),
(80, '1', '', '', '', 54, 4, 'AC'),
(81, '1', '', '', '', 25, 4, 'AC'),
(82, '1', '', '', '', 31, 4, 'AC'),
(83, '1', '', '', '', 21, 4, 'AC'),
(87, '1', '', '', '', 20, 4, 'AC'),
(88, '1', '1', '1', '1', 59, 1, 'AC'),
(89, '1', '1', '1', '1', 60, 1, 'AC'),
(92, '1', '', '', '', 62, 4, 'AC'),
(93, '1', '', '', '', 61, 4, 'AC'),
(95, '1', '', '', '', 14, 4, 'AC'),
(96, '1', '', '', '', 14, 4, 'AC'),
(97, '1', '', '', '', 14, 4, 'AC'),
(98, '1', '', '', '', 14, 4, 'AC'),
(99, '1', '', '', '', 15, 4, 'AC'),
(100, '1', '', '', '', 37, 4, 'AC'),
(101, '1', '1', '1', '1', 63, 1, 'AC'),
(102, '1', '', '', '', 63, 4, 'AC'),
(104, '1', '', '', '', 64, 4, 'AC'),
(106, '1', '', '', '', 65, 4, 'AC'),
(108, '1', '', '', '', 66, 2, 'AC'),
(109, '1', '', '', '', 66, 2, 'AC'),
(110, '1', '1', '1', '1', 67, 1, 'AC'),
(112, '1', '', '', '', 68, 2, 'AC'),
(114, '1', '', '', '', 58, 3, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pertenece`
--

CREATE TABLE IF NOT EXISTS `pertenece` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Volcado de datos para la tabla `pertenece`
--

INSERT INTO `pertenece` (`id`, `grupo_id`, `usuario_id`, `estado`) VALUES
(21, 2, 1, 'AC'),
(23, 4, 3, 'AC'),
(24, 1, 1, 'AC'),
(25, 1, 1, 'AC'),
(28, 4, 5, 'AC'),
(29, 4, 6, 'AC'),
(30, 4, 7, 'AC'),
(31, 4, 8, 'AC'),
(35, 4, 12, 'AC'),
(36, 4, 13, 'AC'),
(37, 4, 14, 'AC'),
(38, 4, 15, 'AC'),
(39, 2, 15, 'AC'),
(41, 4, 17, 'AC'),
(42, 2, 19, 'AC'),
(43, 3, 4, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_proyecto_programa`
--

CREATE TABLE IF NOT EXISTS `plan_proyecto_programa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `beneficiario` varchar(100) DEFAULT NULL,
  `duracion` varchar(45) DEFAULT NULL,
  `unidad_ejecutora` varchar(100) DEFAULT NULL,
  `otra_universidad` varchar(100) DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `tipo_participacion_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `unidad_tiempo_id` int(11) DEFAULT NULL,
  `universidad_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `ambito_id` int(11) DEFAULT NULL,
  `archivo` varchar(100) DEFAULT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `plan_proyecto_programa`
--

INSERT INTO `plan_proyecto_programa` (`id`, `tipo`, `titulo`, `fecha_inicio`, `beneficiario`, `duracion`, `unidad_ejecutora`, `otra_universidad`, `vb`, `tipo_participacion_id`, `funcionario_id`, `unidad_tiempo_id`, `universidad_id`, `area_id`, `subarea_id`, `ambito_id`, `archivo`, `observacion`, `estado`) VALUES
(1, 'Planes', 'sdfg', '2014-06-18', 'sfgsd', '7', 'gsdfg', 'gsdf', '', 3, 0, 0, 0, 7, 85, 4, '', '', 'AC'),
(2, 'Planes', 'twert', '2014-06-12', 'twert', '7', 'twert', 'twert', '', 4, 1, 0, 0, 22, 227, 5, 'uploads/41402461580.jpg', '', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procedimiento`
--

CREATE TABLE IF NOT EXISTS `procedimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `secuencia_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `llenado` varchar(10) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

--
-- Volcado de datos para la tabla `procedimiento`
--

INSERT INTO `procedimiento` (`id`, `secuencia_id`, `funcionario_id`, `llenado`, `estado`) VALUES
(1, 10, 10, 'si', 'AC'),
(2, 11, 10, 'no', 'AC'),
(3, 13, 10, 'no', 'AC'),
(4, 14, 10, 'no', 'AC'),
(5, 15, 10, 'no', 'AC'),
(6, 16, 10, 'no', 'AC'),
(7, 17, 10, 'no', 'AC'),
(8, 18, 10, 'no', 'AC'),
(9, 19, 10, 'no', 'AC'),
(10, 20, 10, 'no', 'AC'),
(11, 21, 10, 'no', 'AC'),
(12, 22, 10, 'no', 'AC'),
(13, 23, 10, 'no', 'AC'),
(14, 24, 10, 'no', 'AC'),
(15, 25, 10, 'no', 'AC'),
(16, 10, 11, 'si', 'AC'),
(17, 11, 11, 'no', 'AC'),
(18, 13, 11, 'no', 'AC'),
(19, 14, 11, 'no', 'AC'),
(20, 15, 11, 'no', 'AC'),
(21, 16, 11, 'no', 'AC'),
(22, 17, 11, 'no', 'AC'),
(23, 18, 11, 'no', 'AC'),
(24, 19, 11, 'no', 'AC'),
(25, 20, 11, 'no', 'AC'),
(26, 21, 11, 'no', 'AC'),
(27, 22, 11, 'no', 'AC'),
(28, 23, 11, 'no', 'AC'),
(29, 24, 11, 'no', 'AC'),
(30, 25, 11, 'no', 'AC'),
(31, 10, 12, 'si', 'AC'),
(32, 11, 12, 'no', 'AC'),
(33, 13, 12, 'no', 'AC'),
(34, 14, 12, 'no', 'AC'),
(35, 15, 12, 'no', 'AC'),
(36, 16, 12, 'no', 'AC'),
(37, 17, 12, 'no', 'AC'),
(38, 18, 12, 'no', 'AC'),
(39, 19, 12, 'no', 'AC'),
(40, 20, 12, 'no', 'AC'),
(41, 21, 12, 'no', 'AC'),
(42, 22, 12, 'no', 'AC'),
(43, 23, 12, 'no', 'AC'),
(44, 24, 12, 'no', 'AC'),
(45, 25, 12, 'no', 'AC'),
(46, 10, 13, 'si', 'AC'),
(47, 11, 13, 'no', 'AC'),
(48, 13, 13, 'no', 'AC'),
(49, 14, 13, 'no', 'AC'),
(50, 15, 13, 'no', 'AC'),
(51, 16, 13, 'no', 'AC'),
(52, 39, 13, 'no', 'AC'),
(53, 17, 13, 'no', 'AC'),
(54, 18, 13, 'no', 'AC'),
(55, 19, 13, 'no', 'AC'),
(56, 20, 13, 'no', 'AC'),
(57, 21, 13, 'no', 'AC'),
(58, 22, 13, 'no', 'AC'),
(59, 23, 13, 'no', 'AC'),
(60, 24, 13, 'no', 'AC'),
(61, 25, 13, 'no', 'AC'),
(62, 10, 15, 'si', 'AC'),
(63, 11, 15, 'no', 'AC'),
(64, 13, 15, 'no', 'AC'),
(65, 14, 15, 'no', 'AC'),
(66, 15, 15, 'no', 'AC'),
(67, 16, 15, 'no', 'AC'),
(68, 39, 15, 'no', 'AC'),
(69, 17, 15, 'no', 'AC'),
(70, 18, 15, 'no', 'AC'),
(71, 19, 15, 'no', 'AC'),
(72, 20, 15, 'no', 'AC'),
(73, 21, 15, 'no', 'AC'),
(74, 22, 15, 'no', 'AC'),
(75, 23, 15, 'no', 'AC'),
(76, 24, 15, 'no', 'AC'),
(77, 25, 15, 'no', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE IF NOT EXISTS `produccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_tema` varchar(100) DEFAULT NULL,
  `tipo_circulacion` varchar(100) DEFAULT NULL,
  `institucion_entrega` varchar(100) DEFAULT NULL,
  `fecha_conclucion` date DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `ambito_id` int(11) DEFAULT NULL,
  `medio_difunsion_id` int(11) DEFAULT NULL,
  `tipo_produccion_id` int(11) DEFAULT NULL,
  `archivo` varchar(100) DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`id`, `titulo_tema`, `tipo_circulacion`, `institucion_entrega`, `fecha_conclucion`, `vb`, `area_id`, `subarea_id`, `funcionario_id`, `ambito_id`, `medio_difunsion_id`, `tipo_produccion_id`, `archivo`, `observacion`, `estado`) VALUES
(1, '', 'fasdfasdf', 'asdf', '0000-00-00', '', NULL, 0, 0, 0, 0, 0, '', NULL, 'AC'),
(2, 'sgfds', 'ggsdfg', 'gsdfg', '0000-00-00', 'gsdfg', NULL, 0, 0, 0, 0, 0, '', NULL, 'AC'),
(3, 'gdsfg', '', 'gsdfg', '0000-00-00', '', 0, 0, 5, 5, 0, 0, 'gdsf', NULL, 'Pendiente'),
(5, 'Juan Morales', '', 'umss', '2014-05-23', '', 0, 0, 1, 5, 3, 3, '', NULL, 'Aceptado'),
(6, 'fgsdgsdfg', '', 'gsdfg', '2014-05-09', '', 0, 0, 1, 3, 2, 3, '', NULL, 'Aceptado'),
(7, 'sdffd', 'Publicado', 'gsdfg', '2014-05-23', '', 1, 4, 1, 4, 3, 3, '', NULL, 'Aceptado'),
(8, '', 'Publicado', '', '2014-06-05', '', 24, 243, 1, 5, 2, 3, 'uploads/41402497581.jpg', 'sdfgsdggfdg', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE IF NOT EXISTS `provincia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departamento_id` int(11) DEFAULT NULL,
  `nombre_provincia` varchar(105) DEFAULT NULL,
  `sigla_provincia` varchar(105) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id`, `departamento_id`, `nombre_provincia`, `sigla_provincia`, `estado`) VALUES
(1, 7, 'uiui', 'ioio', 'AC'),
(2, 7, 'fasd', 'fasd', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secuencia`
--

CREATE TABLE IF NOT EXISTS `secuencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo_id` int(11) DEFAULT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `importancia` varchar(45) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- Volcado de datos para la tabla `secuencia`
--

INSERT INTO `secuencia` (`id`, `modulo_id`, `grupo`, `importancia`, `nivel`, `estado`) VALUES
(10, 25, 'Datos Generales', 'si', 1, 'AC'),
(11, 61, 'Datos Generales', 'si', 2, 'AC'),
(13, 62, 'Datos Generales', 'si', 3, 'AC'),
(14, 20, 'Datos Generales', 'si', 4, 'AC'),
(15, 24, 'Formación Pregrado', 'si', 6, 'AC'),
(16, 23, 'Formación Postgrado', 'si', 7, 'AC'),
(17, 21, 'Evento', 'si', 9, 'AC'),
(18, 18, 'Docencia Auxiliatura Umss', 'si', 12, 'AC'),
(19, 15, 'Dedicación Exclusiva', 'si', 11, 'AC'),
(20, 49, 'Titularizacion en Umss', 'si', 14, 'AC'),
(21, 37, 'Plan Proyecto Y Programa', 'si', 15, 'AC'),
(23, 36, 'Patentes', 'si', 19, 'AC'),
(24, 17, 'Distinciones', 'si', 20, 'AC'),
(25, 31, 'Membresia', 'si', 23, 'AC'),
(26, 10, 'Ambito', 'no', 0, 'AC'),
(27, 11, 'Area', 'no', 0, 'AC'),
(28, 28, 'Idioma', 'no', 0, 'AC'),
(29, 35, 'Pais', 'no', 0, 'AC'),
(30, 41, 'Tipo Certificado', 'no', 0, 'AC'),
(31, 42, 'Tipo Difusion', 'no', 0, 'AC'),
(32, 50, 'Unidad Tiempo', 'no', 0, 'AC'),
(33, 52, 'Usuario', 'no', -1, 'AC'),
(34, 55, 'Permiso', 'no', -1, 'AC'),
(35, 51, 'Universidad', 'no', 0, 'AC'),
(36, 56, 'Pertenece', 'no', -1, 'AC'),
(37, 60, 'Secuencia', 'no', -1, 'AC'),
(38, 27, 'Grupo', 'no', -1, 'AC'),
(39, 14, 'Datos Generales', 'si', 5, 'AC'),
(40, 58, 'Solicitudes', '1', 1, 'AC'),
(41, 13, 'Asistencia Evento', '1', 10, 'AC'),
(42, 57, 'Docencia Auxiliar Externa', '1', 13, 'AC'),
(43, 63, 'Ejercicio Liberal Profesion', '', 17, 'AC'),
(44, 38, 'Investigación y Producción', '', 18, 'AC'),
(45, 48, 'Tipo Producción', '', 1, 'AC'),
(46, 30, 'Medio Difusion', '', 1, 'AC'),
(47, 64, 'Perfeccionamiento Profesional', '1', 8, 'AC'),
(48, 32, 'Modulos', 'no', 19, 'AC'),
(49, 53, 'Vida Universitaria Nacional', 'si', 21, 'AC'),
(50, 54, 'Vida Universitaria Extranjera', 'si', 22, 'AC'),
(51, 65, 'Desempeño Profesional Externo', 'si', 16, 'AC'),
(52, 66, 'jefe', 'no', 30, 'AC'),
(53, 68, 'jefe', 'no', 34, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subarea`
--

CREATE TABLE IF NOT EXISTS `subarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_subarea` varchar(100) DEFAULT NULL,
  `sigla_subarea` varchar(105) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=249 ;

--
-- Volcado de datos para la tabla `subarea`
--

INSERT INTO `subarea` (`id`, `nombre_subarea`, `sigla_subarea`, `area_id`, `estado`) VALUES
(1, 'Aplicaciones de la lógica', 'AL', 1, 'ac'),
(2, 'Lógica deductiva', 'LD', 1, 'ac'),
(3, 'Lógica general', 'LD', 1, 'ac'),
(4, 'Lógica inductiva', 'LD', 1, 'ac'),
(5, 'Metodologia', 'LD', 1, 'ac'),
(6, 'Otras especialidades relativas a la lógica (especificar)', 'LD', 1, 'ac'),
(7, 'Algebra', 'LD', 2, 'ac'),
(8, 'Análisis y análisis funcicnal', 'LD', 2, 'ac'),
(9, 'Ciencia de los ordenadores ', 'LD', 2, 'ac'),
(10, 'Geometría', 'LD', 23, 'ac'),
(11, 'Teoría de números ', 'LD', 2, 'ac'),
(12, 'Análisis numérico', 'LD', 2, 'ac'),
(13, 'Investigación operativa', 'LD', 2, 'ac'),
(14, 'Probabilidad', 'LD', 2, 'ac'),
(15, 'Estadística', 'LD', 2, 'ac'),
(16, 'Topología', 'LD', 2, 'ac'),
(17, 'Otras especialidades matemáticas (especificar)', 'LD', 2, 'ac'),
(18, 'Cosmología y cosmogonía', 'LD', 3, 'ac'),
(19, 'Medio interplanetario', 'LD', 3, 'ac'),
(20, 'Astronomía óptica', 'LD', 3, 'ac'),
(21, 'Planetología', 'LD', 3, 'ac'),
(22, 'Radioastronomía', 'LD', 3, 'ac'),
(23, 'Sistema solar', 'LD', 3, 'ac'),
(24, 'Otras especialidades astronómicas (especificar)', 'LD', 3, 'ac'),
(25, 'Acústica', 'LD', 4, 'ac'),
(26, 'Electromagnetismo', 'LD', 4, 'ac'),
(27, 'Electrónica', 'LD', 4, 'ac'),
(28, 'Física de los fluidos', 'LD', 4, 'ac'),
(29, 'Mecánica', 'LD', 4, 'ac'),
(30, 'Física molecular', 'LD', 4, 'ac'),
(31, 'Física atómica y nuclear ', 'LD', 4, 'ac'),
(32, 'Nucleónica', 'LD', 4, 'ac'),
(33, 'Optica', 'LD', 4, 'ac'),
(34, 'Química física', 'LD', 4, 'ac'),
(35, 'Física del estado sólido', 'LD', 4, 'ac'),
(36, 'Física teórica', 'LD', 4, 'ac'),
(37, 'Termodinámica', 'LD', 4, 'ac'),
(38, 'Unidades y constantes', 'LD', 4, 'ac'),
(39, 'Fisica Altas Energías', 'LD', 4, 'ac'),
(40, 'Otras especialidades físicas (especificar)', 'LD', 4, 'ac'),
(41, 'Química analítica', 'LD', 5, 'ac'),
(42, 'Bioquímica', 'LD', 5, 'ac'),
(43, 'Química inorgánica', 'LD', 5, 'ac'),
(44, 'Química macromolecular', 'LD', 5, 'ac'),
(45, 'Química nuclear', 'LD', 5, 'ac'),
(46, 'Química orgánica', 'LD', 5, 'ac'),
(47, 'Química física ', 'LD', 5, 'ac'),
(48, 'Química Farmacéutica', 'LD', 5, 'ac'),
(49, 'Química ambiental', 'LD', 5, 'ac'),
(50, 'Otras especialidades (especificar)', 'LD', 5, 'ac'),
(51, ' Biología animal (Zoología)', 'LD', 6, 'ac'),
(52, 'Antropología (Física)', 'LD', 6, 'ac'),
(53, 'Antropología (Física)', 'LD', 6, 'ac'),
(54, 'Biomatemáticas', 'LD', 6, 'ac'),
(55, 'Biometría', 'LD', 6, 'ac'),
(56, 'Biofísica', 'LD', 6, 'ac'),
(57, 'Biología celular', 'LD', 6, 'ac'),
(58, 'Etología', 'LD', 6, 'ac'),
(59, 'Genética', 'LD', 6, 'ac'),
(60, 'Biología humana ', 'LD', 6, 'ac'),
(61, 'Fisiología humana', 'LD', 6, 'ac'),
(62, 'Inmunología', 'LD', 6, 'ac'),
(63, 'Biología de insectos (Entomología) ', 'LD', 6, 'ac'),
(64, 'Microbiología', 'LD', 6, 'ac'),
(65, 'Biología molecular', 'LD', 6, 'ac'),
(66, 'Paleontología', 'LD', 6, 'ac'),
(67, 'Biología Vegetal (Botánica)', 'LD', 6, 'ac'),
(68, 'Radiobiología', 'LD', 6, 'ac'),
(69, 'Simbiosis', 'LD', 6, 'ac'),
(70, 'Virología', 'LD', 6, 'ac'),
(71, 'Neurociencias', 'LD', 6, 'ac'),
(72, 'Otras especialidades biológicas (especificar )', 'LD', 6, 'ac'),
(73, 'Clencias de la atmósfera ', 'LD', 7, 'ac'),
(74, 'Climatología', 'LD', 7, 'ac'),
(75, 'Geoquímica', 'LD', 7, 'ac'),
(76, 'Geodesla', 'LD', 7, 'ac'),
(77, 'Geografía', 'LD', 7, 'ac'),
(78, 'Geología', 'LD', 7, 'ac'),
(79, 'Geofísica', 'LD', 7, 'ac'),
(80, 'Hidrologia', 'LD', 7, 'ac'),
(81, 'Meteorologia', 'LD', 7, 'ac'),
(82, 'Oceanografia', 'LD', 7, 'ac'),
(83, 'Ciencias del suelo (Edafología)', 'LD', 7, 'ac'),
(84, 'Ciencias del espacio', 'LD', 7, 'ac'),
(85, 'Otras especialidades de la tierra, espacio o entorno', 'LD', 7, 'ac'),
(86, 'Agroquímica', 'LD', 8, 'ac'),
(87, 'Ingeniería Agrícola', 'LD', 8, 'ac'),
(88, 'Agronomía', 'LD', 8, 'ac'),
(89, 'Producción animal', 'LD', 8, 'ac'),
(90, 'Peces y fauna silvestre', 'LD', 8, 'ac'),
(91, 'Ciencia forestal', 'LD', 8, 'ac'),
(92, 'Horticultura', 'LD', 8, 'ac'),
(93, 'Fitopatología', 'LD', 8, 'ac'),
(94, 'Ciencias veterinarias ', 'LD', 8, 'ac'),
(95, 'Otras especialidades agrarias (especificar)', 'LD', 8, 'ac'),
(96, 'Ciencias clínicas', 'LD', 9, 'ac'),
(97, 'Epidemología', 'LD', 9, 'ac'),
(98, 'Medicina Forense ', 'LD', 9, 'ac'),
(99, 'Medicina del trabajo', 'LD', 9, 'ac'),
(100, 'Medicina interna', 'LD', 9, 'ac'),
(101, 'Ciencias de la Nutrición', 'LD', 9, 'ac'),
(102, 'Patología', 'LD', 9, 'ac'),
(103, 'Farmacodinámica', 'LD', 9, 'ac'),
(104, 'Farmacología', 'LD', 9, 'ac'),
(105, 'Medicina preventiva', 'LD', 9, 'ac'),
(106, 'Psiquiatría', 'LD', 9, 'ac'),
(107, 'Salud pública', 'LD', 9, 'ac'),
(108, 'Cirugía', 'LD', 9, 'ac'),
(109, 'Toxicología', 'LD', 9, 'ac'),
(110, 'Otras especialidades médicas (especificar)', 'LD', 9, 'ac'),
(111, 'Ingeniería y tecnología aeronáuticas', 'LD', 10, 'ac'),
(112, 'Tecnología bioquímica', 'LD', 10, 'ac'),
(113, 'Ingeniería y tecnología químicas', 'LD', 10, 'ac'),
(114, 'Tecnologla de los ordenadores', 'LD', 10, 'ac'),
(115, 'Tecnología de la construcion', 'LD', 10, 'ac'),
(116, 'Ingeniería y tecnología eléctricas', 'LD', 10, 'ac'),
(117, 'Tecnología electrónica', 'LD', 10, 'ac'),
(118, 'Ingeniería y tecnología del medio ambiente', 'LD', 10, 'ac'),
(119, 'Tecnología de los alimentos ', 'LD', 10, 'ac'),
(120, 'Tecnología industrial', 'LD', 10, 'ac'),
(121, 'Tecnología de la instrumentación', 'LD', 10, 'ac'),
(122, 'Tecnología de materiales', 'LD', 10, 'ac'),
(123, 'Tecnología e ingeniería mecánicas', 'LD', 10, 'ac'),
(124, 'Tecnología médica ', 'LD', 10, 'ac'),
(125, 'Tecnología metalúrgica', 'LD', 10, 'ac'),
(126, 'Tecnología de productos metálicos', 'LD', 10, 'ac'),
(127, 'Tecnología de vehículos de motor', 'LD', 10, 'ac'),
(128, 'Tecnología minera', 'LD', 10, 'ac'),
(129, 'Tecnología naval', 'LD', 10, 'ac'),
(130, 'Tecnología nuclear', 'LD', 10, 'ac'),
(131, 'Tecnología del carbón y del petróleo', 'LD', 10, 'ac'),
(132, 'Tecnología energética', 'LD', 10, 'ac'),
(133, 'Tecnología de los ferrocarriles', 'LD', 10, 'ac'),
(134, 'Tecnología del espacio', 'LD', 10, 'ac'),
(135, 'Tecnología de las telecomunicaciones', 'LD', 10, 'ac'),
(136, 'Tecnología textil ', 'LD', 10, 'ac'),
(137, 'Tecnología de los sistemas de transporte', 'LD', 10, 'ac'),
(138, 'Procesos tecnológicos', 'LD', 10, 'ac'),
(139, 'Planificación urbana', 'LD', 10, 'ac'),
(140, 'Otras especialidades tecnológicas (especificar)', 'LD', 10, 'ac'),
(141, 'Antropología cultural', 'LD', 11, 'ac'),
(142, 'Etnografía y etnología', 'LD', 11, 'ac'),
(143, 'Antropología social', 'LD', 11, 'ac'),
(144, 'Otras especialidades (especificar)', 'LD', 11, 'ac'),
(145, 'Fertilidad', 'LD', 12, 'ac'),
(146, 'Demografía general', 'LD', 12, 'ac'),
(147, 'Demografía geográfica', 'LD', 12, 'ac'),
(148, 'Demografía histórica', 'LD', 12, 'ac'),
(149, 'Mortalidad', 'LD', 12, 'ac'),
(150, 'Características de la población', 'LD', 12, 'ac'),
(151, 'Tamaño de la población y evolución demográfica', 'LD', 12, 'ac'),
(152, 'Otras especialidades demograficas (especificar)', 'LD', 12, 'ac'),
(153, 'Política fiscal y hacienda públlca nacionales', 'LD', 13, 'ac'),
(154, 'Econometría', 'LD', 13, 'ac'),
(155, 'Contabilidad económica', 'LD', 13, 'ac'),
(156, 'Actividad económica', 'LD', 13, 'ac'),
(157, 'Sistemas económicos', 'LD', 13, 'ac'),
(158, 'Economía del cambio tecnológico', 'LD', 13, 'ac'),
(159, 'Teoría económica', 'LD', 13, 'ac'),
(160, 'Economía general', 'LD', 13, 'ac'),
(161, 'Organización industrial y politicas gubernamentales', 'LD', 13, 'ac'),
(162, 'Economía internacional tecnología', 'LD', 13, 'ac'),
(163, 'Organización y dirección de empresas', 'LD', 13, 'ac'),
(164, 'Economía sectorial', 'LD', 13, 'ac'),
(165, 'Otras especialidades económicas (especificar)', 'LD', 13, 'ac'),
(166, 'Geografía económica', 'LD', 14, 'ac'),
(167, 'Geografía histórica', 'LD', 14, 'ac'),
(168, 'Geografía humana', 'LD', 14, 'ac'),
(169, 'Geografía regional', 'LD', 14, 'ac'),
(170, 'Otras especialidades geográficas (especificar)', 'LD', 14, 'ac'),
(171, 'Biografías', 'LD', 15, 'ac'),
(172, 'Historia general', 'LD', 15, 'ac'),
(173, 'Historia de países', 'LD', 15, 'ac'),
(174, 'Historia por épocas', 'LD', 15, 'ac'),
(175, 'Ciencias auxiliares de la historia', 'LD', 15, 'ac'),
(176, 'Historia por especialidades', 'LD', 15, 'ac'),
(177, 'Otras especialidades históricas (especificar)', 'LD', 15, 'ac'),
(178, 'Derecho canónico', 'LD', 16, 'ac'),
(179, 'Teoría y métodos generales', 'LD', 16, 'ac'),
(180, 'Derecho internacional', 'LD', 16, 'ac'),
(181, 'Organización jurídica', 'LD', 16, 'ac'),
(182, 'Derecho y legislación nacionales', 'LD', 16, 'ac'),
(183, 'Otras especialidades jurídicas (especificar)', 'LD', 16, 'ac'),
(184, 'Linguística aplicada', 'LD', 17, 'ac'),
(185, 'Linguística diacrónica', 'LD', 17, 'ac'),
(186, 'Geografia linguística', 'LD', 17, 'ac'),
(187, 'Teoria linguística', 'LD', 17, 'ac'),
(188, 'Linguística sincrónica', 'LD', 17, 'ac'),
(189, 'Otras especialidades linguísticas (especificar)', 'LD', 17, 'ac'),
(190, 'Teoria y métodos educativos', 'LD', 18, 'ac'),
(191, 'Organización y planificación', 'LD', 18, 'ac'),
(192, 'Preparación y empleo de profesores', 'LD', 18, 'ac'),
(193, 'Otras especialidades pedagógicas (especificar)', 'LD', 18, 'ac'),
(194, 'Relaciones internacionales', 'LD', 19, 'ac'),
(195, 'Ciencias políticas', 'LD', 19, 'ac'),
(196, 'Ideologías políticas', 'LD', 19, 'ac'),
(197, 'Vida política', 'LD', 19, 'ac'),
(198, 'Sociología política', 'LD', 19, 'ac'),
(199, 'Sistemas políticos', 'LD', 19, 'ac'),
(200, 'Teoría política', 'LD', 19, 'ac'),
(201, 'Administración pública', 'LD', 19, 'ac'),
(202, 'Opinión pública', 'LD', 19, 'ac'),
(203, 'Otras especialidades políticas (especificar)', 'LD', 19, 'ac'),
(204, 'Patología', 'LD', 20, 'ac'),
(205, 'Psicología del niño y del adolescente', 'LD', 20, 'ac'),
(206, 'Asesoramiento y orientación', 'LD', 20, 'ac'),
(207, 'Psicopedagogía', 'LD', 20, 'ac'),
(208, 'Evaluación y diagnóstico en psicología', 'LD', 20, 'ac'),
(209, 'Psicología experimental', 'LD', 20, 'ac'),
(210, 'Psicología general', 'LD', 20, 'ac'),
(211, 'Psicología de la vejez', 'LD', 20, 'ac'),
(212, 'Psicología industrial', 'LD', 20, 'ac'),
(213, 'Parapsicología', 'LD', 20, 'ac'),
(214, 'Personalidad', 'LD', 20, 'ac'),
(215, 'Estudio psicológico detemas sociales', 'LD', 20, 'ac'),
(216, 'Psicofarmacologia', 'LD', 20, 'ac'),
(217, 'Psicologia social', 'LD', 20, 'ac'),
(218, 'Otras especialidades psicológicas (especificar)', 'LD', 20, 'ac'),
(219, 'Arquitectura', 'LD', 21, 'ac'),
(220, 'Teoría, análisis y crítica literarias', 'LD', 21, 'ac'),
(221, 'Teoria, análisis y critica de las Bellas Artes', 'LD', 21, 'ac'),
(222, 'Otras especialidades artisticas (especificar)', 'LD', 21, 'ac'),
(223, 'Sociologia cultural', 'LD', 22, 'ac'),
(224, 'Sociología experimental', 'LD', 22, 'ac'),
(225, 'Sociologia general', 'LD', 22, 'ac'),
(226, 'Problemas internacionale', 'LD', 22, 'ac'),
(227, 'Sociologia matemática', 'LD', 22, 'ac'),
(228, 'Sociologia del trabajo', 'LD', 22, 'ac'),
(229, 'Cambio y desarrollo social', 'LD', 22, 'ac'),
(230, 'Comunicaciones sociales', 'LD', 22, 'ac'),
(231, 'Grupos sociales', 'LD', 22, 'ac'),
(232, 'Problemas sociales', 'LD', 22, 'ac'),
(233, 'Sociología de los asentamientos humanos', 'LD', 22, 'ac'),
(234, 'Otras especialidades sociológicas (especificar)', 'LD', 22, 'ac'),
(235, 'Etica clasica', 'LD', 23, 'ac'),
(236, 'Etica de individuos', 'LD', 23, 'ac'),
(237, 'Etica de grupo', 'LD', 23, 'ac'),
(238, 'La ética en perspeciva (especificar)', 'LD', 23, 'ac'),
(239, 'Otras especialidades relacionadas con la ética', 'LD', 23, 'ac'),
(240, 'Filosofía del conocimiento', 'LD', 24, 'ac'),
(241, 'Antropología filosófica', 'LD', 24, 'ac'),
(242, 'Filosofía general', 'LD', 24, 'ac'),
(243, 'Sistemas filosóficos', 'LD', 24, 'ac'),
(244, 'Filosofía de la ciencia', 'LD', 24, 'ac'),
(245, 'Filosofía de la naturaleza', 'LD', 24, 'ac'),
(246, 'Filosofía social', 'LD', 24, 'ac'),
(247, 'Doctrinas filosóficas', 'LD', 24, 'ac'),
(248, 'Otras especialidades filosóficas (especificar)', 'LD', 24, 'ac');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_certificado`
--

CREATE TABLE IF NOT EXISTS `tipo_certificado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `sigla` varchar(100) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tipo_certificado`
--

INSERT INTO `tipo_certificado` (`id`, `descripcion`, `sigla`, `estado`) VALUES
(1, 'Asistencia', '0', 'AC'),
(2, 'Aprobación', '1', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_distincion`
--

CREATE TABLE IF NOT EXISTS `tipo_distincion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(50) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tipo_distincion`
--

INSERT INTO `tipo_distincion` (`id`, `sigla`, `descripcion`, `estado`) VALUES
(1, 'Doctor', '', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_evento`
--

CREATE TABLE IF NOT EXISTS `tipo_evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `sigla` varchar(55) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tipo_evento`
--

INSERT INTO `tipo_evento` (`id`, `descripcion`, `sigla`, `estado`) VALUES
(1, 'charla', 'CH', 'AC'),
(2, 'Conferencia', 'CO', 'AC'),
(3, 'Cursillo', 'CU', 'AC'),
(4, 'Encuentro', 'EN', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_gestion`
--

CREATE TABLE IF NOT EXISTS `tipo_gestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(105) DEFAULT NULL,
  `sigla` varchar(105) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tipo_gestion`
--

INSERT INTO `tipo_gestion` (`id`, `descripcion`, `sigla`, `estado`) VALUES
(1, 'Semestral', 'S', 'AC'),
(2, 'Anual', 'A', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_organizacion`
--

CREATE TABLE IF NOT EXISTS `tipo_organizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tipo_organizacion`
--

INSERT INTO `tipo_organizacion` (`id`, `sigla`, `descripcion`, `estado`) VALUES
(1, 'Otra Aclarar', NULL, NULL),
(2, 'Sociedad de Beneficencia', NULL, NULL),
(3, 'Institucion Civia', NULL, NULL),
(4, 'Socieda Profecional', NULL, NULL),
(5, 'Sociedad Cientifica', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_participacion`
--

CREATE TABLE IF NOT EXISTS `tipo_participacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `dominio_participacion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`,`sigla`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Volcado de datos para la tabla `tipo_participacion`
--

INSERT INTO `tipo_participacion` (`id`, `sigla`, `descripcion`, `dominio_participacion`, `estado`) VALUES
(1, 'ASE', 'Asesor', NULL, NULL),
(2, 'COE', 'Consejero Elegido', NULL, NULL),
(3, 'COG', 'Consejero Gremial', NULL, NULL),
(4, 'COO', 'Coordinador', NULL, NULL),
(5, 'DEC', 'Decano o Director de Escuela', NULL, NULL),
(6, 'DIA', 'Director Acadmico de Facultad o Escuela', NULL, NULL),
(7, 'DIC', 'Director de Carrera', NULL, NULL),
(8, 'DII', 'Diretcor de Instituto de Investigaciones', NULL, NULL),
(9, 'DIU', 'Director Universitario', NULL, NULL),
(10, 'JEF', 'Jefe de Departamento Facultativo', NULL, NULL),
(11, 'JEU', 'Jefe de Departamento Univesitario', NULL, NULL),
(12, 'JPP', 'Jefe de Programa, Proyecto o Laboratorio', NULL, NULL),
(13, 'GT', 'Miembro De Tribunal de Grado', NULL, NULL),
(14, 'PRE', 'Presidente', NULL, NULL),
(15, 'REC', 'Rector', NULL, NULL),
(16, 'ADS', 'Respresentante/ Delegado de Base adscripto', NULL, NULL),
(17, 'SUP', 'Respresentante/ Delegado de Base suplente', NULL, NULL),
(18, 'TIT', 'Respresentante/ Delegado de Base titular', NULL, NULL),
(19, 'SEI', 'Secretario de Investigacin', NULL, NULL),
(20, 'SEE', 'Secretario Ejecutivo', NULL, NULL),
(21, 'SEC', 'Secretario General', NULL, NULL),
(22, 'VPR', 'Vice-Presidente', NULL, NULL),
(23, 'VRC', 'Vicerrector', NULL, NULL),
(24, 'VOC', 'Vocal', NULL, NULL),
(25, 'OT', 'Otro(Aclarar)', NULL, NULL),
(26, 'TU', 'Tutoria en la Elaboracion de Pryectos de Grado, tesis u otro', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_perfeccionamiento`
--

CREATE TABLE IF NOT EXISTS `tipo_perfeccionamiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tipo_perfeccionamiento`
--

INSERT INTO `tipo_perfeccionamiento` (`id`, `sigla`, `descripcion`, `estado`) VALUES
(2, 'Especialidad', 'E', 'AC'),
(3, 'Diplomado', 'D', 'AC'),
(4, 'Curso de Perficcionamiento', 'P', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_produccion`
--

CREATE TABLE IF NOT EXISTS `tipo_produccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `sigla` varchar(100) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tipo_produccion`
--

INSERT INTO `tipo_produccion` (`id`, `descripcion`, `sigla`, `estado`) VALUES
(1, 'Trabajo de Investigación', 'TI', 'AC'),
(2, 'Trabajo Literario', 'TL', 'AC'),
(3, 'Reseña Bibliográfica', 'RE', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titularizacion`
--

CREATE TABLE IF NOT EXISTS `titularizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_resolucion` varchar(105) DEFAULT NULL,
  `materia_doc` varchar(105) DEFAULT NULL,
  `carrera_doc` varchar(105) DEFAULT NULL,
  `departamento_doc` varchar(105) DEFAULT NULL,
  `facultad_doc` varchar(105) DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `nro_documento` blob,
  `facultad_id` int(11) DEFAULT NULL,
  `documento_titularidad_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `archivo` varchar(200) DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `titularizacion`
--

INSERT INTO `titularizacion` (`id`, `fecha_resolucion`, `materia_doc`, `carrera_doc`, `departamento_doc`, `facultad_doc`, `vb`, `nro_documento`, `facultad_id`, `documento_titularidad_id`, `funcionario_id`, `archivo`, `observacion`, `estado`) VALUES
(3, '2014-06-19', 'vfsdf', 'sdfg', 'gsdfg', 'gsdfg', '', 0x35353636, 0, 0, 1, 'uploads/41402455078.jpg', 'fdddddddddddddddddddddd', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_tiempo`
--

CREATE TABLE IF NOT EXISTS `unidad_tiempo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_unidad_tiempo` varchar(100) DEFAULT NULL,
  `sigla_unidad_tiempo` varchar(100) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `unidad_tiempo`
--

INSERT INTO `unidad_tiempo` (`id`, `nombre_unidad_tiempo`, `sigla_unidad_tiempo`, `estado`) VALUES
(1, 'Dia/s', 'dias', 'AC'),
(2, 'Semana/s', '', 'AC'),
(3, 'Mes/es', '', 'AC'),
(4, 'Año/s', '', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `universidad`
--

CREATE TABLE IF NOT EXISTS `universidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_uni` varchar(100) DEFAULT NULL,
  `sigla_uni` varchar(100) DEFAULT NULL,
  `sistema_nacional` varchar(100) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `universidad`
--

INSERT INTO `universidad` (`id`, `nombre_uni`, `sigla_uni`, `sistema_nacional`, `pais_id`, `funcionario_id`, `estado`) VALUES
(1, 'lllllllllllll', 'lllllllllll', 'llllll', 1, 0, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido_p` varchar(100) DEFAULT NULL,
  `apellido_m` varchar(100) DEFAULT NULL,
  `ci` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `fecha_inscripcion` date DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido_p`, `apellido_m`, `ci`, `email`, `login`, `password`, `fecha_inscripcion`, `estado`) VALUES
(1, 'pedro', 'poveda', 'huanca', NULL, 'nemo_thehacker@hotmail.com', 'admin', 'admin', NULL, 'AC'),
(3, 'pedros', 'ppaapp', 'ppsss', NULL, 'pedro@gmail.com', 'pedro', 'pedro', '0000-00-00', 'AC'),
(4, 'funcionario', 'funcionario', 'funcionario', NULL, 'funcionario@hotmail.com', 'funcionario', 'funcionario', '0000-00-00', 'AC'),
(5, 'jkkj', 'jkjkjk', 'jkkj', NULL, 'jkjk@hotmail.com', 'juans', 'juans', '0000-00-00', 'AC'),
(6, 'juana', 'perez', 'fdsaf', NULL, 'juan@gmail.com', 'juana', 'juana', '0000-00-00', 'AC'),
(7, 'pedro', 'predros', 'pedrito', NULL, 'pedros@gmail.com', 'pedros', 'pedros', '0000-00-00', 'AC'),
(8, 'sdfsdf', 'afsda', 'fasdfasd', NULL, 'sfasd@gmail.com', 'alavifuentes@hotmail.com', 'ssssssssssssssssssssssss', '0000-00-00', 'AC'),
(12, 'fjasdkfh', 'hjsakdfahs', 'hjaksdf', NULL, 'asd@gmail.com', 'fasdffasdf', 'fasdfasdf', '0000-00-00', 'AC'),
(13, 'afd', 'fasdf', 'fasd', NULL, 'sss@gmail.com', '123456', '123456', '0000-00-00', 'AC'),
(14, 'ely', 'ely', 'ely', NULL, 'ely@gmail.com', 'elyza', 'bravo', '0000-00-00', 'AC'),
(15, 'jhen', 'jenny', 'jjjj', NULL, 'jheny@hotmail.com', 'jhenny', 'jhenny', '0000-00-00', 'AC'),
(17, 'miranda', 'tmasnnn', 'fsadff', NULL, 'miranda@hotmail.com', 'miranda', 'miranda', '0000-00-00', 'AC'),
(19, 'Juan', 'Perez', 'Mendoza', 5566767, 'juansperez@gmail.com', 'juanperes', 'juanperes', '0000-00-00', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vida_universitaria`
--

CREATE TABLE IF NOT EXISTS `vida_universitaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `otro_tip_participacion` varchar(105) DEFAULT NULL,
  `otra_instancia_univ` varchar(100) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `duracion` varchar(100) DEFAULT NULL,
  `condicion` varchar(100) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `instancia_universitaria_id` int(11) DEFAULT NULL,
  `universidad_id` int(11) DEFAULT NULL,
  `unidad_tiempo_id` int(11) DEFAULT NULL,
  `tipo_participacion_id` int(11) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `vida_universitaria`
--

INSERT INTO `vida_universitaria` (`id`, `otro_tip_participacion`, `otra_instancia_univ`, `fecha_inicio`, `duracion`, `condicion`, `funcionario_id`, `instancia_universitaria_id`, `universidad_id`, `unidad_tiempo_id`, `tipo_participacion_id`, `estado`) VALUES
(1, '', '', '0000-00-00', '', '', 0, 0, 0, 0, 0, 'Pendiente'),
(2, 'gsdgsd', 'gsdfg', '0000-00-00', 'gsdfgg', 'gsdfg', 0, 0, 0, 0, 0, 'Pendiente'),
(3, 'asgsdf', 'gsdfgs', '0000-00-00', '', '', 0, 0, 0, 0, 0, 'Pendiente'),
(4, 'df', 'hdfgh', '0000-00-00', '', '', 0, 0, 0, 0, 0, 'Pendiente'),
(5, 'gsdfg', 'sdffff', '0000-00-00', '', '', 0, 0, 0, 0, 0, 'Pendiente'),
(6, 'fasdf', 'fasdf', '0000-00-00', 'fasdf', '', 1, 0, 0, 0, 0, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vida_universitaria_externa`
--




CREATE TABLE IF NOT EXISTS `vida_universitaria_externa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario_id` int(11) DEFAULT NULL,
  `tipo_participacion_id` int(11) DEFAULT NULL,
  `universidad_id` int(11) DEFAULT NULL,
  `unidad_tiempo_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `otro_tipo_participacion` varchar(100) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `duracion` varchar(45) DEFAULT NULL,
  `condicion` varchar(45) DEFAULT NULL,
  `otra_universidad` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `vida_universitaria_externa`
--

INSERT INTO `vida_universitaria_externa` (`id`, `funcionario_id`, `tipo_participacion_id`, `universidad_id`, `unidad_tiempo_id`, `pais_id`, `otro_tipo_participacion`, `fecha_inicio`, `duracion`, `condicion`, `otra_universidad`, `descripcion`, `estado`) VALUES
(1, 1, 0, 0, 0, 0, '', '0000-00-00', 'gsdfgg', 'gsdfg', '', '', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vivienda`
--

CREATE TABLE IF NOT EXISTS `vivienda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departamento_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `tipo_vivienda` varchar(45) DEFAULT NULL,
  `zona` varchar(45) DEFAULT NULL,
  `nombre_hurbanizacion` varchar(45) DEFAULT NULL,
  `ubicacion_vivienda` varchar(45) DEFAULT NULL,
  `viviendacol` varchar(45) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `vivienda`
--

INSERT INTO `vivienda` (`id`, `departamento_id`, `funcionario_id`, `tipo_vivienda`, `zona`, `nombre_hurbanizacion`, `ubicacion_vivienda`, `viviendacol`, `estado`) VALUES
(1, 7, 0, '', 'gsdf', 'gsdf', 'gdfg', 'dfsg', 'Pendiente'),
(2, 7, 1, '', 'sadf', 'fasdf', 'fasdf', 'fasdf', 'Pendiente'),
(4, 7, 12, '', 'fdasf', 'fasdf', 'fasdf', 'fasdf', 'Pendiente');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
