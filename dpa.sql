-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2014 a las 03:19:31
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id`, `nombre`, `sigla`, `descripcion`, `estado`) VALUES
(1, 'sdfg', 'gsdfg', 'gsdf', 'AC'),
(2, 'Jaaaaaaa', 'jfdsf', 'jfds', 'AC');

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
  `subarea_id` int(11) DEFAULT NULL,
  `unidad_tiempo_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `ambito_id` int(11) DEFAULT NULL,
  `observacion` varchar(500) DEFAULT NULL,
  `fecha_visado` date DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `asistencia_evento`
--

INSERT INTO `asistencia_evento` (`id`, `nombre_evento`, `fecha_inicio`, `duracion`, `entidad_organizadora`, `del_programa_formacion_doc`, `vb`, `tipo_evento_id`, `tipo_certificado_id`, `funcionario_id`, `subarea_id`, `unidad_tiempo_id`, `pais_id`, `ambito_id`, `observacion`, `fecha_visado`, `descripcion`, `estado`) VALUES
(1, 'fasd', '2014-04-10', '', '', '', '', 0, 0, 1, 0, 0, 0, 0, '', '0000-00-00', '', 'AC'),
(2, 'fadsf', '2014-05-14', '3', 'adf', 'fasdfs', '', 4, 0, 7, 0, 0, 2, 4, '', '0000-00-00', 'gsgfd', 'Pendiente');

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
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `dedicacion_exclusiva`
--

INSERT INTO `dedicacion_exclusiva` (`id`, `tipo_gestion_id`, `ambito_id`, `funcionario_id`, `fecha_inicio`, `fecha_fin`, `numero_gestiones`, `unidad_academica`, `vb`, `estado`) VALUES
(2, 1, 5, 1, '2014-05-08', '2014-05-31', '34', 'Facultad de Tecnologia', '', 'Pendiente');

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
  `subarea_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `institucion` varchar(100) DEFAULT NULL,
  `cargo` varchar(105) DEFAULT NULL,
  `nivel_cargo` varchar(105) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_conclusion` date DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distincion`
--

CREATE TABLE IF NOT EXISTS `distincion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `universidad_id` int(11) DEFAULT NULL,
  `tipo_distincion_id` int(11) DEFAULT NULL,
  `nombre_distincion` varchar(100) DEFAULT NULL,
  `otra_institucion` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `universitaria` varchar(100) DEFAULT NULL,
  `ambitodistincion` varchar(100) DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `observacion` varchar(500) DEFAULT NULL,
  `fecha_visado` date DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `distincion`
--

INSERT INTO `distincion` (`id`, `funcionario_id`, `pais_id`, `universidad_id`, `tipo_distincion_id`, `nombre_distincion`, `otra_institucion`, `fecha`, `universitaria`, `ambitodistincion`, `vb`, `observacion`, `fecha_visado`, `estado`) VALUES
(3, 1, 1, 1, 1, 'asfdas', 'fasd', '0000-00-00', '', '', '', '																											\r\n	    afhasdkjlfhhh\r\n	    \r\n	    \r\n	    \r\n	    \r\n	    \r\n	    \r\n	    \r\n	    ', '0000-00-00', 'Observado'),
(4, 1, 2, 1, 1, '', '', '0000-00-00', '', '', '', '', '0000-00-00', 'Pendiente');

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
  `vb` varchar(45) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `tipo_gestion_id` int(11) DEFAULT NULL,
  `nivel_formacion_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `docencia_auxiliatura_umss`
--

INSERT INTO `docencia_auxiliatura_umss` (`id`, `materia`, `fecha_inicio`, `numero_gestiones`, `carrera`, `departamento`, `facultad`, `condicion`, `vb`, `subarea_id`, `tipo_gestion_id`, `nivel_formacion_id`, `funcionario_id`, `descripcion`, `estado`) VALUES
(1, '', '0000-00-00', 'gsdfg', '', 'gsd', 'gsdg', 'gsdg', 'gdsg', 0, 0, 1, 0, 'gsef', 'Pendiente'),
(2, 'fisica', '2014-05-15', '2', '', '', '', '', '', 0, 0, 1, 0, 'Aprobaciónfsadf', 'Pendiente');

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
  `condision` varchar(105) DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `universidad_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `unidad_tiempo_id_unidad_tiempo` int(11) DEFAULT NULL,
  `nivel_formacion_id` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `dominio_idioma`
--

INSERT INTO `dominio_idioma` (`id`, `id_idioma`, `funcionario_id`, `habla`, `lee`, `escribe`, `dominio_idioma`, `descripcion`, `observacion`, `fecha_visado`, `estado`) VALUES
(1, 1, 1, '', '', '', '', '', '			\r\n	    afasdf', '0000-00-00', 'Aceptado'),
(2, 1, 1, 'si', 'si', 'si', 'hablo bien', 'hdfgoo', '									\r\n	    iopupuioppuiop\r\n	    \r\n	    ', '0000-00-00', 'Observado'),
(3, 1, 1, 'fasdf', 'fasd', 'fasd', 'fsadf', 'fasd', '			\r\n	    dasdsa', '0000-00-00', 'Aceptado');

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
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ejercicio_liberal_prof`
--

INSERT INTO `ejercicio_liberal_prof` (`id`, `institucion_actividad`, `cargo_actividad`, `tipo`, `fecha_inicio`, `duracion`, `funcionario_id`, `pais_id`, `area_id`, `subarea_id`, `unidad_tiempo_id`, `estado`) VALUES
(1, 'dfg', 'gdf', 'Otro', '2014-05-08', '55', 5, 1, 1, 5, 0, 'Aceptado');

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
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id`, `nombre_evento`, `tema_expocicion`, `fecha_inicio`, `duracion`, `entidad_organizadora`, `organizado_por_instacia_univ`, `tipo_evento_id`, `ambito_id`, `unidad_tiempo_id`, `area_id`, `subarea_id`, `funcionario_id`, `pais_id`, `tipo_participacion_id`, `estado`) VALUES
(5, 'fasd', 'fasd', '2014-05-14', '445', 'dfasf', 'fasdf', 3, 5, 0, 0, 0, 0, 2, 4, 'Pendiente'),
(6, 'fasdf', 'fasdf', '2014-05-13', 'fasdf', 'fasdf', 'fasdf', 4, 5, 0, 0, 0, 1, 1, 2, 'Aceptado'),
(7, 'capacitacion', 'informatica forence', '2014-05-07', '4', 'sdsd', 'sdssd', 4, 4, 0, 0, 0, 1, 2, 3, 'Pendiente'),
(8, 'informatica', 'Nuevos tecnologias', '2014-05-22', '122', '112', '', 3, 4, 0, 0, 0, 5, 2, 3, 'Pendiente'),
(9, 'Ciencias de la computacion', 'redes neuroales', '2014-05-01', '3', 'umss', 'Ciencias de Tecnologia', 4, 3, 0, 0, 0, 1, 2, 1, 'Pendiente'),
(10, '', '', '2014-05-22', '', 'fasd', 'fasdf', 0, 5, 0, 1, 4, 5, 2, 3, 'Pendiente');

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
  `otra_institucion_post` varchar(105) DEFAULT NULL,
  `ciudad_post` varchar(105) DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `hrs_presenciales_post` varchar(45) DEFAULT NULL,
  `hrs_no_presenciales_post` varchar(45) DEFAULT NULL,
  `creditos_post` varchar(45) DEFAULT NULL,
  `universidad_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `pais_funcionario_id_f` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `unidad_tiempo_id` int(11) DEFAULT NULL,
  `grado_academico_id` int(11) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `observacion` varchar(500) DEFAULT NULL,
  `fecha_visado` date DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `formacion_postgrado`
--

INSERT INTO `formacion_postgrado` (`id`, `fecha_titulo_post`, `tesis_post`, `titulo_post`, `duracion_curso_post`, `otra_institucion_post`, `ciudad_post`, `vb`, `hrs_presenciales_post`, `hrs_no_presenciales_post`, `creditos_post`, `universidad_id`, `funcionario_id`, `pais_id`, `pais_funcionario_id_f`, `subarea_id`, `unidad_tiempo_id`, `grado_academico_id`, `descripcion`, `observacion`, `fecha_visado`, `estado`) VALUES
(2, '', 'asfsd', '', '', '', '', '', '', '', '', 0, 1, 0, NULL, 0, 0, 0, '', '', '0000-00-00', 'Pendiente'),
(3, '', 'jhhhhhhhhhhhhhhh', 'jjjjjjjjjjjjjjj', '', '', '', '', '', '', '', 0, 1, 0, NULL, 0, 0, 0, '', '			\r\n	    ', '0000-00-00', 'Aceptado'),
(4, '', 'twr', 'twert', 'wetrw', 'twer', 'ttwert', '', 'twertr', '', '', 0, 1, 2, NULL, 0, 0, 0, '', '', '0000-00-00', 'Pendiente'),
(5, '', 'gssssssssssssssssssdf', 'dsafddddddddddddd', 'fdsaaaaaaaaaaaaa', '', '', '', '', '', '', 0, 1, 0, NULL, 0, 0, 0, '', '', '0000-00-00', 'Pendiente');

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
  `subarea_id` int(11) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `observacion` varchar(500) DEFAULT NULL,
  `fecha_visado` date DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `formacion_pregrado`
--

INSERT INTO `formacion_pregrado` (`id`, `fecha_diploma`, `fecha_titulo`, `nombre_titulo`, `tesis_pregrado`, `titulo_tesis_pregrado`, `duracion_curso_pregrado`, `otra_institucion`, `ciudad_pregrado`, `vb_pregrado`, `funcionario_id`, `universidad_id`, `pais_id`, `pais_funcionario_id`, `unidad_tiempo_id`, `grado_academico_id`, `subarea_id`, `descripcion`, `observacion`, `fecha_visado`, `estado`) VALUES
(1, '0000-00-00', '0000-00-00', 'ildfihj', 'hhjjh', 'hjhjhj', 'hjhj', '', 'hjhj', '', 3, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 'AC'),
(2, '0000-00-00', '0000-00-00', '', '', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 0, '', '						\r\n			\r\n			kkk', '0000-00-00', 'Aceptado'),
(3, '0000-00-00', '0000-00-00', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', '			\r\n			afdsfasf', '0000-00-00', 'mala'),
(4, '0000-00-00', '0000-00-00', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', '			\r\n		lkl	', '0000-00-00', 'mala'),
(5, '0000-00-00', '0000-00-00', 'trew', 'twer', 'ttrrwe', 'ttwer', '', 'ttrwertr', '', 1, 0, 0, 0, 0, 0, 0, '', '', '0000-00-00', 'Pendiente'),
(6, '0000-00-00', '0000-00-00', 'fasdf', 'fasdf', 'fasdf', 'fasdf', '', 'fasdf', '', 1, 1, 2, 0, 0, 1, 0, '', '', '0000-00-00', 'Pendiente');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `funcionario`
--

INSERT INTO `funcionario` (`id`, `nombre`, `apellido_p`, `apellido_m`, `ci`, `extendido_ci`, `run`, `fecha_nac`, `num_libreta_militar`, `nacionalidad`, `sexo`, `estado_civil`, `numero_hijos`, `grupo_sanguineo`, `factor`, `email1`, `email2`, `direccion_domicilio`, `numero_domicilio`, `telefono_domicilio`, `casilla_correo`, `pais_id`, `departamento_id`, `provincia_id`, `municipio_id`, `colegio_egreso`, `tipo_colegio`, `area_colegio`, `fecha_titulo_bachiller`, `usuario_id`, `descripcion`, `estado`) VALUES
(1, 'Pedro', 'ppaapp', 'fgsdgf', 766757, '', 0, '2014-05-16', 455666, 'Boliviana', 'Masculino', 'Soltero', 0, '', '', 'pedro@mail.com', 'pedrito@gmail.com', '', 0, 0, '', 0, 7, 0, 0, 'Jaaaaaaaaa', 'Particular', 'Urbano', '2014-05-15', 3, '', 'AC'),
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
(15, 'miranda', 'tmasnnn', '', 0, '', 0, '0000-00-00', 0, '', '', '', 0, '', '', '', '', '', 0, 0, '', 0, 0, 0, 0, '', '', '', '0000-00-00', 17, '', 'AC');

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
(2, 'Funcionario', 'El funcionario', 'AC'),
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
(3, 'Espaniol', 'fsd', 'AC');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id`, `codigo`, `nombre`, `url`, `descripcion`, `estado`) VALUES
(10, 'Ambito', NULL, NULL, 'M&oacute;dulo: Ambito', 'AC'),
(11, 'Area', NULL, NULL, 'M&oacute;dulo: Area', 'AC'),
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
(25, 'Funcionario', NULL, NULL, 'M&oacute;dulo: Funcionario', 'AC'),
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
(64, 'Perfeccionamiento Profesional', '', '', 'M&oacute;dulo: Perfeccionamiento Profesional', 'AC');

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
  `fecha` date DEFAULT NULL,
  `vb` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `patente`
--

INSERT INTO `patente` (`id`, `numero_patente`, `titulo_descripcion`, `fecha`, `vb`, `funcionario_id`, `area_id`, `subarea_id`, `pais_id`, `descripcion`, `estado`) VALUES
(3, 'sgsd', 'hsdfh', '0000-00-00', 0, 3, NULL, 0, 0, '', 'AC'),
(4, 'fgjd', 'fghf', '0000-00-00', 0, 1, 0, 3, 2, '', 'Pendiente'),
(5, 'dfdfsgsdfg', 'dfgsd', '0000-00-00', 0, 1, 0, 3, 2, '', 'Pendiente'),
(7, 'fdasf', 'afasdfasf', '0000-00-00', 0, 1, 1, 5, 1, '', 'Pendiente');

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
  `subarea_id` int(11) DEFAULT NULL,
  `fecha_certificado` date DEFAULT NULL,
  `certificado` varchar(100) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `diplona` varchar(100) DEFAULT NULL,
  `titulo_trabajo_final` varchar(100) DEFAULT NULL,
  `mencion` varchar(100) DEFAULT NULL,
  `duracion_curso` varchar(100) DEFAULT NULL,
  `hrs_presenciales` varchar(50) DEFAULT NULL,
  `hrs_no_presenciales` varchar(45) DEFAULT NULL,
  `creditos` varchar(45) DEFAULT NULL,
  `otra_institucion` varchar(100) DEFAULT NULL,
  `vb` varchar(45) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `perfeccionamiento_profecional`
--

INSERT INTO `perfeccionamiento_profecional` (`id`, `tipo_perfeccionamiento_id`, `funcionario_id`, `unidad_tiempo_id`, `pais_id`, `universidad_id`, `subarea_id`, `fecha_certificado`, `certificado`, `titulo`, `diplona`, `titulo_trabajo_final`, `mencion`, `duracion_curso`, `hrs_presenciales`, `hrs_no_presenciales`, `creditos`, `otra_institucion`, `vb`, `estado`) VALUES
(1, 0, 0, 0, 2, 1, 0, '2014-05-22', '', '', '', '', '', '', '', '', '', '', '', 'AC');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

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
(85, '1', '', '', '', 58, 2, 'AC'),
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
(104, '1', '', '', '', 64, 4, 'AC');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Volcado de datos para la tabla `pertenece`
--

INSERT INTO `pertenece` (`id`, `grupo_id`, `usuario_id`, `estado`) VALUES
(21, 2, 1, 'AC'),
(23, 4, 3, 'AC'),
(24, 1, 1, 'AC'),
(25, 1, 1, 'AC'),
(27, 2, 4, 'AC'),
(28, 4, 5, 'AC'),
(29, 4, 6, 'AC'),
(30, 4, 7, 'AC'),
(31, 4, 8, 'AC'),
(35, 4, 12, 'AC'),
(36, 4, 13, 'AC'),
(37, 4, 14, 'AC'),
(38, 4, 15, 'AC'),
(39, 2, 15, 'AC'),
(41, 4, 17, 'AC');

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
  `unidad_tiempo_id_unidad_tiempo` int(11) DEFAULT NULL,
  `universidad_id` int(11) DEFAULT NULL,
  `ambito_id` int(11) DEFAULT NULL,
  `subarea_id` int(11) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`id`, `titulo_tema`, `tipo_circulacion`, `institucion_entrega`, `fecha_conclucion`, `vb`, `area_id`, `subarea_id`, `funcionario_id`, `ambito_id`, `medio_difunsion_id`, `tipo_produccion_id`, `descripcion`, `estado`) VALUES
(1, '', 'fasdfasdf', 'asdf', '0000-00-00', '', NULL, 0, 0, 0, 0, 0, '', 'AC'),
(2, 'sgfds', 'ggsdfg', 'gsdfg', '0000-00-00', 'gsdfg', NULL, 0, 0, 0, 0, 0, '', 'AC'),
(3, 'gdsfg', '', 'gsdfg', '0000-00-00', '', 0, 0, 5, 5, 0, 0, 'gdsf', 'Pendiente'),
(4, 'Redes neoronales', '', 'Umss', '2014-05-16', '', 0, 0, 1, 5, 2, 3, '', 'Aceptado'),
(5, 'Juan Morales', '', 'umss', '2014-05-23', '', 0, 0, 1, 5, 3, 3, '', 'Aceptado'),
(6, 'fgsdgsdfg', '', 'gsdfg', '2014-05-09', '', 0, 0, 1, 3, 2, 3, '', 'Aceptado'),
(7, 'sdffd', 'Publicado', 'gsdfg', '2014-05-23', '', 1, 4, 1, 4, 3, 3, '', 'Aceptado');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Volcado de datos para la tabla `secuencia`
--

INSERT INTO `secuencia` (`id`, `modulo_id`, `grupo`, `importancia`, `nivel`, `estado`) VALUES
(10, 25, 'Datos Generales', 'si', 1, 'AC'),
(11, 61, 'Datos Generales', 'si', 2, 'AC'),
(13, 62, 'Datos Generales', 'si', 3, 'AC'),
(14, 20, 'Datos Generales', 'si', 4, 'AC'),
(15, 24, 'Formación Pregrado', 'si', 5, 'AC'),
(16, 23, 'Formación Postgrado', 'si', 6, 'AC'),
(17, 21, 'Evento', 'si', 7, 'AC'),
(18, 18, 'Docencia Auxiliatura Umss', 'si', 8, 'AC'),
(19, 15, 'Dedicación Exclusiva', 'si', 9, 'AC'),
(20, 49, 'Titularizacion en Umss', 'si', 10, 'AC'),
(21, 37, 'Plan Proyecto Y Programa', 'si', 11, 'AC'),
(23, 36, 'Patentes', 'si', 13, 'AC'),
(24, 17, 'Distinciones', 'si', 14, 'AC'),
(25, 31, 'Membresia', 'si', 15, 'AC'),
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
(39, 14, 'Datos Generales', 'si', 7, 'AC'),
(40, 58, 'Solicitudes', '1', 1, 'AC'),
(41, 13, 'Asistencia Evento', '1', 1, 'AC'),
(42, 57, 'Docencia Auxiliar Externa', '1', 12, 'AC'),
(43, 63, 'Ejercicio Liberal Profesion', '', 1, 'AC'),
(44, 38, 'Investigación y Producción', '', 1, 'AC'),
(45, 48, 'Tipo Producción', '', 1, 'AC'),
(46, 30, 'Medio Difusion', '', 1, 'AC'),
(47, 64, 'Perfeccionamiento Profesional', '1', 1, 'AC');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `subarea`
--

INSERT INTO `subarea` (`id`, `nombre_subarea`, `sigla_subarea`, `area_id`, `estado`) VALUES
(1, 'motin', 'm', 0, 'AC'),
(2, 'fdas', 'fsd', 0, 'AC'),
(3, 'fasdf', 'fasdf', 0, 'AC'),
(4, 'afasd', 'fasdf', 1, 'AC'),
(5, 'afd', 'fasdf', 1, 'AC');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tipo_participacion`
--

INSERT INTO `tipo_participacion` (`id`, `sigla`, `descripcion`, `dominio_participacion`, `estado`) VALUES
(1, 'D', 'Disertante', '', 'AC'),
(2, 'O', 'Organizador', '', 'AC'),
(3, 'A', 'Asesor', '', 'AC'),
(4, 'M', 'Moderador', '', 'AC');

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
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `titularizacion`
--

INSERT INTO `titularizacion` (`id`, `fecha_resolucion`, `materia_doc`, `carrera_doc`, `departamento_doc`, `facultad_doc`, `vb`, `nro_documento`, `facultad_id`, `documento_titularidad_id`, `funcionario_id`, `estado`) VALUES
(2, '--wertwer', 'twertw', 'twert', 'wtwert', 'twert', 'wtwer', 0x747477657274, 0, 0, 1, 'Pendiente');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  `email` varchar(100) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `fecha_inscripcion` date DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido_p`, `apellido_m`, `email`, `login`, `password`, `fecha_inscripcion`, `estado`) VALUES
(1, 'pedro', 'poveda', 'huanca', 'nemo_thehacker@hotmail.com', 'admin', 'admin', NULL, 'AC'),
(3, 'pedros', 'ppaapp', 'ppsss', 'pedro@gmail.com', 'pedro', 'pedro', '0000-00-00', 'AC'),
(4, 'funcionario', 'funcionario', 'funcionario', 'funcionario@hotmail.com', 'funcionario', 'funcionario', '0000-00-00', 'AC'),
(5, 'jkkj', 'jkjkjk', 'jkkj', 'jkjk@hotmail.com', 'juans', 'juans', '0000-00-00', 'AC'),
(6, 'juana', 'perez', 'fdsaf', 'juan@gmail.com', 'juana', 'juana', '0000-00-00', 'AC'),
(7, 'pedro', 'predros', 'pedrito', 'pedros@gmail.com', 'pedros', 'pedros', '0000-00-00', 'AC'),
(8, 'sdfsdf', 'afsda', 'fasdfasd', 'sfasd@gmail.com', 'alavifuentes@hotmail.com', 'ssssssssssssssssssssssss', '0000-00-00', 'AC'),
(12, 'fjasdkfh', 'hjsakdfahs', 'hjaksdf', 'asd@gmail.com', 'fasdffasdf', 'fasdfasdf', '0000-00-00', 'AC'),
(13, 'afd', 'fasdf', 'fasd', 'sss@gmail.com', '123456', '123456', '0000-00-00', 'AC'),
(14, 'ely', 'ely', 'ely', 'ely@gmail.com', 'elyza', 'bravo', '0000-00-00', 'AC'),
(15, 'jhen', 'jenny', 'jjjj', 'jheny@hotmail.com', 'jhenny', 'jhenny', '0000-00-00', 'AC'),
(17, 'miranda', 'tmasnnn', 'fsadff', 'miranda@hotmail.com', 'miranda', 'miranda', '0000-00-00', 'AC');

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
(3, 7, 1, '', 'fasdf', 'fasdf', 'fsad', 'fasd', 'Pendiente'),
(4, 7, 12, '', 'fdasf', 'fasdf', 'fasdf', 'fasdf', 'Pendiente');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
