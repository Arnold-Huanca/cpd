SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `departamento` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `departamento` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre_depto` VARCHAR(100) NULL DEFAULT NULL ,
  `sigla_depto` VARCHAR(100) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `provincia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `provincia` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `provincia` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre_provincia` VARCHAR(105) NULL DEFAULT NULL ,
  `sigla_provincia` VARCHAR(105) NULL DEFAULT NULL ,
  `departamento_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `municipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `municipio` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `municipio` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre_municipio` VARCHAR(100) NULL DEFAULT NULL ,
  `sigla_municipio` VARCHAR(105) NULL ,
  `estado` VARCHAR(10) NULL ,
  `provinvia_id` INT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `dependencia_colegio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dependencia_colegio` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `dependencia_colegio` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `tipo_colegio` VARCHAR(100) NULL DEFAULT NULL ,
  `sigla` VARCHAR(105) NULL DEFAULT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pais` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `pais` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre_pais` VARCHAR(105) NULL DEFAULT NULL ,
  `sigla_pais` VARCHAR(105) NULL DEFAULT NULL ,
  `gentilicio_pais` VARCHAR(105) NULL DEFAULT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuario` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `usuario` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(100) NULL ,
  `apellido_p` VARCHAR(100) NULL ,
  `apellido_m` VARCHAR(100) NULL ,
  `email` VARCHAR(100) NULL ,
  `login` VARCHAR(100) NULL ,
  `password` VARCHAR(100) NULL ,
  `fecha_inscripcion` DATE NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `funcionario` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `funcionario` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(105) NULL ,
  `apellido_p` VARCHAR(105) NULL DEFAULT NULL ,
  `apellido_m` VARCHAR(105) NULL ,
  `ci` VARCHAR(100) NULL ,
  `extendido_ci` VARCHAR(45) NULL ,
  `estado_civil` VARCHAR(45) NULL DEFAULT NULL ,
  `num_libreta_militar` VARCHAR(45) NULL ,
  `grupo_sanguineo` VARCHAR(45) NULL ,
  `factor` VARCHAR(45) NULL ,
  `pais_id` INT NULL ,
  `nacionalidad` VARCHAR(45) NULL ,
  `sexo` VARCHAR(45) NULL DEFAULT NULL ,
  `fecha_nac` DATE NULL DEFAULT NULL ,
  `email1` VARCHAR(105) NULL DEFAULT NULL ,
  `email2` VARCHAR(45) NULL ,
  `departamento_id` INT NULL ,
  `numero_hijos` INT NULL DEFAULT NULL ,
  `usuario_id` INT NULL ,
  `hobbies` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(255) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `laboral_external_actual`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laboral_external_actual` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `laboral_external_actual` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `institucion_actividad` VARCHAR(105) NULL DEFAULT NULL ,
  `direccion` VARCHAR(105) NULL DEFAULT NULL ,
  `cargo` VARCHAR(105) NULL DEFAULT NULL ,
  `fecha_inicio` DATE NULL DEFAULT NULL ,
  `fecha_fin` DATE NULL DEFAULT NULL ,
  `casilla_correo` VARCHAR(45) NULL DEFAULT NULL ,
  `telefono` INT NULL DEFAULT NULL ,
  `fax` VARCHAR(45) NULL DEFAULT NULL ,
  `email` VARCHAR(105) NULL DEFAULT NULL ,
  `vb` VARCHAR(45) NULL DEFAULT NULL ,
  `funcionario_id` INT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `idioma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idioma` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `idioma` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre_idioma` VARCHAR(100) NULL DEFAULT NULL ,
  `sigla_idioma` VARCHAR(5) NULL DEFAULT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `dominio_idioma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dominio_idioma` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `dominio_idioma` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `id_idioma` INT NULL ,
  `funcionario_id` INT NULL ,
  `habla` VARCHAR(105) NULL DEFAULT NULL ,
  `lee` VARCHAR(45) NULL DEFAULT NULL ,
  `escribe` VARCHAR(45) NULL DEFAULT NULL ,
  `dominio_idioma` VARCHAR(100) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `dedicacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dedicacion` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `dedicacion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre_dedicacion` VARCHAR(105) NULL DEFAULT NULL ,
  `dedicacioncol` VARCHAR(105) NULL DEFAULT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `laboral_umss_actual`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laboral_umss_actual` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `laboral_umss_actual` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `cargo` VARCHAR(105) NULL DEFAULT NULL ,
  `fecha_inicio` DATE NULL DEFAULT NULL ,
  `dedicacion` VARCHAR(100) NULL DEFAULT NULL ,
  `vb` VARCHAR(45) NULL DEFAULT NULL ,
  `funcionario_id` INT NULL ,
  `dedicacion_id` INT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `universidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `universidad` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `universidad` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre_uni` VARCHAR(100) NULL DEFAULT NULL ,
  `sigla_uni` VARCHAR(100) NULL DEFAULT NULL ,
  `sistema_nacional` VARCHAR(100) NULL DEFAULT NULL ,
  `pais_id_pais` INT NULL ,
  `pais_funcionario_id` INT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `area` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `area` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `area` VARCHAR(105) NULL DEFAULT NULL ,
  `nombre_area` VARCHAR(105) NULL DEFAULT NULL ,
  `sigla_area` VARCHAR(85) NULL DEFAULT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `subarea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `subarea` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `subarea` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre_subarea` VARCHAR(100) NULL DEFAULT NULL ,
  `sigla_subarea` VARCHAR(105) NULL DEFAULT NULL ,
  `subareacol` VARCHAR(105) NULL DEFAULT NULL ,
  `area_id` INT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `unidad_tiempo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `unidad_tiempo` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `unidad_tiempo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre_unidad_tiempo` VARCHAR(100) NULL ,
  `sigla_unidad_tiempo` VARCHAR(100) NULL DEFAULT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `nivel_formacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nivel_formacion` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `nivel_formacion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre_nivel_formacion` VARCHAR(100) NULL ,
  `sigla_nivel_formacion` VARCHAR(100) NULL DEFAULT NULL ,
  `descripcion` VARCHAR(500) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `grado_academico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grado_academico` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `grado_academico` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre_grado_academico` VARCHAR(100) NULL DEFAULT NULL ,
  `sigla_grado_academico` VARCHAR(100) NULL DEFAULT NULL ,
  `id_nivel_formacion` INT NULL ,
  `descripcion` VARCHAR(500) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `formacion_postgrado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `formacion_postgrado` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `formacion_postgrado` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `fecha_titulo_post` VARCHAR(100) NULL DEFAULT NULL ,
  `tesis_post` VARCHAR(100) NULL DEFAULT NULL ,
  `titulo_post` VARCHAR(105) NULL DEFAULT NULL ,
  `duracion_curso_post` VARCHAR(105) NULL DEFAULT NULL ,
  `otra_institucion_post` VARCHAR(105) NULL DEFAULT NULL ,
  `ciudad_post` VARCHAR(105) NULL DEFAULT NULL ,
  `vb` VARCHAR(45) NULL DEFAULT NULL ,
  `hrs_presenciales_post` VARCHAR(45) NULL DEFAULT NULL ,
  `hrs_no_presenciales_post` VARCHAR(45) NULL DEFAULT NULL ,
  `creditos_post` VARCHAR(45) NULL DEFAULT NULL ,
  `universidad_id_universidad` INT NULL ,
  `funcionario_id_f` INT NULL ,
  `pais_id_pais` INT NULL ,
  `pais_funcionario_id_f` INT NULL ,
  `subarea_id_subarea` INT NULL ,
  `unidad_tiempo_id_unidad_tiempo` INT NULL ,
  `grado_academico_id_grado_academico` INT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `modalidad_graduacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `modalidad_graduacion` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `modalidad_graduacion` (
  `id` INT NOT NULL ,
  `modalidad` VARCHAR(50) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `modalidad_curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `modalidad_curso` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `modalidad_curso` (
  `id` INT NOT NULL ,
  `modalidad` VARCHAR(50) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `formacion_pregrado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `formacion_pregrado` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `formacion_pregrado` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `grado_academico_id` INT NULL ,
  `modalidad_curso_id` INT NOT NULL ,
  `titulo_otorgado` VARCHAR(100) NULL DEFAULT NULL ,
  `fecha_titulo` DATE NULL DEFAULT NULL ,
  `fecha_titulo_academico` DATE NULL DEFAULT NULL ,
  `nomero_titulo` INT NULL DEFAULT NULL ,
  `hrs_presenciales` VARCHAR(45) NULL ,
  `hrs_no_presenciaes` VARCHAR(45) NULL ,
  `creditos` VARCHAR(45) NULL ,
  `modalidad_graduacion_id` INT NOT NULL ,
  `modalidad_graduacion` VARCHAR(45) NULL ,
  `tesis_pregrado` VARCHAR(105) NULL DEFAULT NULL ,
  `titulo_de_modalidad_graduacion` VARCHAR(105) NULL ,
  `ciudad_pregrado` VARCHAR(105) NULL DEFAULT NULL ,
  `universidad_id` INT NULL ,
  `funcionario_id` INT NULL ,
  `pais_id` INT NULL ,
  `estado` VARCHAR(10) NULL ,
  `descripcion` VARCHAR(50) NULL ,
  `observacion` VARCHAR(45) NULL ,
  `fecha_visado` DATE NULL ,
  `archivo` VARCHAR(45) NULL ,
  `estado` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tipo_gestion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipo_gestion` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `tipo_gestion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(105) NULL ,
  `sigla` VARCHAR(105) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `docencia_auxiliatura_umss`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `docencia_auxiliatura_umss` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `docencia_auxiliatura_umss` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `materia` VARCHAR(105) NULL ,
  `fecha_inicio` DATE NULL ,
  `numero_gestiones` VARCHAR(45) NULL ,
  `carrera` VARCHAR(100) NULL ,
  `departamento` VARCHAR(100) NULL ,
  `facultad` VARCHAR(100) NULL ,
  `condicion` VARCHAR(100) NULL ,
  `vb` VARCHAR(45) NULL ,
  `subarea_id` INT NULL ,
  `tipo_gestion_id` INT NULL ,
  `nivel_formacion_id` INT NULL ,
  `funcionario_id` INT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ambito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ambito` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `ambito` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre_ambito` VARCHAR(100) NULL ,
  `descripcion_sigla` VARCHAR(255) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `dedecacion_exclusiva`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dedecacion_exclusiva` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `dedecacion_exclusiva` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `tipo_gestion_id` INT NULL ,
  `ambito_id` INT NULL ,
  `funcionario_id` INT NULL ,
  `fecha_inicio` DATE NULL ,
  `fecha_fin` DATE NULL ,
  `numero_gestiones` VARCHAR(45) NULL ,
  `unidad_academica` VARCHAR(105) NULL ,
  `vb` VARCHAR(45) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `facultad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facultad` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `facultad` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(100) NULL ,
  `sigla` VARCHAR(105) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `documento_titularidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `documento_titularidad` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `documento_titularidad` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre_facultad` VARCHAR(100) NULL ,
  `descripcion` VARCHAR(200) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `titularizacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `titularizacion` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `titularizacion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `fecha_resolucion` VARCHAR(105) NULL ,
  `materia_doc` VARCHAR(105) NULL ,
  `carrera_doc` VARCHAR(105) NULL ,
  `departamento_doc` VARCHAR(105) NULL ,
  `facultad_doc` VARCHAR(105) NULL ,
  `vb` VARCHAR(45) NULL ,
  `nro_documento` BLOB NULL ,
  `facultad_id` INT NULL ,
  `documento_titularidad_id` INT NULL ,
  `funcionario_id` INT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tipo_participacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipo_participacion` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `tipo_participacion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `sigla` VARCHAR(100) NOT NULL ,
  `descripcion` VARCHAR(255) NULL ,
  `dominio_participacion` VARCHAR(100) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`, `sigla`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `plan_proyecto_programa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plan_proyecto_programa` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `plan_proyecto_programa` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `tipo` VARCHAR(100) NULL ,
  `titulo` VARCHAR(100) NULL ,
  `fecha_inicio` DATE NULL ,
  `beneficiario` VARCHAR(100) NULL ,
  `duracion` VARCHAR(45) NULL ,
  `unidad_ejecutora` VARCHAR(100) NULL ,
  `otra_universidad` VARCHAR(100) NULL ,
  `vb` VARCHAR(45) NULL ,
  `tipo_participacion_id` INT NULL ,
  `funcionario_id` INT NULL ,
  `unidad_tiempo_id_unidad_tiempo` INT NULL ,
  `universidad_id` INT NULL ,
  `ambito_id` INT NULL ,
  `subarea_id` INT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `docencia_axuliar_externa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `docencia_axuliar_externa` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `docencia_axuliar_externa` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `materia` VARCHAR(105) NULL ,
  `fecha_inicio` VARCHAR(100) NULL ,
  `duracion` VARCHAR(100) NULL ,
  `carrera` VARCHAR(105) NULL ,
  `departamento` VARCHAR(105) NULL ,
  `facultad` VARCHAR(105) NULL ,
  `otra_universidad` VARCHAR(105) NULL ,
  `condision` VARCHAR(105) NULL ,
  `vb` VARCHAR(45) NULL ,
  `universidad_id` INT NULL ,
  `pais_id` INT NULL ,
  `unidad_tiempo_id_unidad_tiempo` INT NULL ,
  `nivel_formacion_id` INT NULL ,
  `subarea_id` INT NULL ,
  `funcionario_id` INT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `desemp_prof_externo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desemp_prof_externo` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `desemp_prof_externo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `funcionario_id` INT NULL ,
  `subarea_id` INT NULL ,
  `pais_id` INT NULL ,
  `institucion` VARCHAR(100) NULL ,
  `cargo` VARCHAR(105) NULL ,
  `nivel_cargo` VARCHAR(105) NULL ,
  `fecha_inicio` DATE NULL ,
  `fecha_conclusion` DATE NULL ,
  `vb` VARCHAR(45) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ejercicio_liberal_prof`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ejercicio_liberal_prof` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `ejercicio_liberal_prof` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `institucion_actividad` VARCHAR(100) NULL ,
  `cargo_actividad` VARCHAR(100) NULL ,
  `tipo` VARCHAR(100) NULL ,
  `fecha_inicio` DATE NULL ,
  `duracion` VARCHAR(45) NULL ,
  `funcionario_id` INT NULL ,
  `pais_id` INT NULL ,
  `subarea_id` INT NULL ,
  `unidad_tiempo_id` INT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tipo_evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipo_evento` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `tipo_evento` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(100) NULL ,
  `sigla` VARCHAR(55) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evento` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `evento` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre_evento` VARCHAR(45) NULL ,
  `tema_expocicion` VARCHAR(45) NULL ,
  `fecha_inicio` DATE NULL ,
  `duracion` VARCHAR(45) NULL ,
  `entidad_organizadora` VARCHAR(45) NULL ,
  `organizado_por_instacia_univ` VARCHAR(45) NULL ,
  `tipo_evento_id` INT NOT NULL ,
  `ambito_id` INT NOT NULL ,
  `unidad_tiempo_id_unidad_tiempo` INT NOT NULL ,
  `subarea_id` INT NOT NULL ,
  `funcionario_id` INT NOT NULL ,
  `pais_id` INT NOT NULL ,
  `tipo_participacion_id` INT NOT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tipo_certificado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipo_certificado` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `tipo_certificado` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(100) NULL ,
  `sigla` VARCHAR(100) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `asistencia_evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `asistencia_evento` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `asistencia_evento` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre_evento` VARCHAR(100) NULL ,
  `fecha_inicio` DATE NULL ,
  `duracion` VARCHAR(100) NULL ,
  `entidad_organizadora` VARCHAR(100) NULL ,
  `del_programa_formacion_doc` VARCHAR(100) NULL ,
  `vb` VARCHAR(45) NULL ,
  `tipo_evento_id` INT NULL ,
  `tipo_certificado_id` INT NULL ,
  `funcionario_id` INT NULL ,
  `subarea_id` INT NULL ,
  `unidad_tiempo_id` INT NULL ,
  `pais_id` INT NULL ,
  `ambito_id` INT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tipo_perfeccionamiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipo_perfeccionamiento` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `tipo_perfeccionamiento` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `sigla` VARCHAR(100) NULL ,
  `descripcion` VARCHAR(250) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `perfeccionamiento_profecional`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `perfeccionamiento_profecional` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `perfeccionamiento_profecional` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `tipo_perfeccionamiento_id` INT NULL ,
  `funcionario_id` INT NULL ,
  `unidad_tiempo_id` INT NULL ,
  `pais_id` INT NULL ,
  `universidad_id` INT NULL ,
  `subarea_id` INT NULL ,
  `fecha_certificado` DATE NULL ,
  `certificado` VARCHAR(100) NULL ,
  `titulo` VARCHAR(100) NULL ,
  `diplona` VARCHAR(100) NULL ,
  `titulo_trabajo_final` VARCHAR(100) NULL ,
  `mencion` VARCHAR(100) NULL ,
  `duracion_curso` VARCHAR(100) NULL ,
  `hrs_presenciales` VARCHAR(50) NULL ,
  `hrs_no_presenciales` VARCHAR(45) NULL ,
  `creditos` VARCHAR(45) NULL ,
  `otra_institucion` VARCHAR(100) NULL ,
  `vb` VARCHAR(45) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tipo_organizacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipo_organizacion` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `tipo_organizacion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `sigla` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(100) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `membresia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `membresia` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `membresia` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `tipo_organizacion_id` INT NULL ,
  `funcionario_id` INT NULL ,
  `investigacion` VARCHAR(45) NULL ,
  `fecha_inicio` DATE NULL ,
  `fecha_fin` DATE NULL ,
  `otra_organizacion` VARCHAR(45) NULL ,
  `miembro` VARCHAR(45) NULL ,
  `vb` VARCHAR(45) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `instancia_universitaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instancia_universitaria` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `instancia_universitaria` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `sigla` VARCHAR(100) NULL ,
  `descripcion` VARCHAR(255) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `vida_universitaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vida_universitaria` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `vida_universitaria` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `otro_tip_participacion` VARCHAR(105) NULL ,
  `otra_instancia_univ` VARCHAR(100) NULL ,
  `fecha_inicio` DATE NULL ,
  `duracion` VARCHAR(100) NULL ,
  `condicion` VARCHAR(100) NULL ,
  `funcionario_id` INT NULL ,
  `instancia_universitaria_id` INT NULL ,
  `universidad_id` INT NULL ,
  `unidad_tiempo_id` INT NULL ,
  `tipo_participacion_id` INT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `vida_universitaria_externa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vida_universitaria_externa` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `vida_universitaria_externa` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `funcionario_id` INT NULL ,
  `tipo_participacion_id` INT NULL ,
  `universidad_id` INT NULL ,
  `unidad_tiempo_id` INT NULL ,
  `pais_id` INT NULL ,
  `otro_tipo_participacion` VARCHAR(100) NULL ,
  `fecha_inicio` DATE NULL ,
  `duracion` VARCHAR(45) NULL ,
  `condicion` VARCHAR(45) NULL ,
  `otra_universidad` VARCHAR(100) NULL ,
  `descripcion_actividad` VARCHAR(255) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `medio_difunsion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medio_difunsion` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `medio_difunsion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `sigla` VARCHAR(100) NULL ,
  `descripcion` VARCHAR(100) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tipo_produccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipo_produccion` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `tipo_produccion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(100) NULL ,
  `sigla` VARCHAR(100) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `produccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `produccion` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `produccion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `titulo_tema` VARCHAR(100) NULL ,
  `tipo_circulacion` VARCHAR(100) NULL ,
  `institucion_entrega` VARCHAR(100) NULL ,
  `fecha_conclucion` DATE NULL ,
  `vb` VARCHAR(45) NULL ,
  `subarea_id` INT NULL ,
  `funcionario_id` INT NULL ,
  `ambito_id` INT NULL ,
  `medio_difunsion_id` INT NULL ,
  `tipo_produccion_id` INT NULL ,
  `produccioncol` VARCHAR(100) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tipo_distincion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipo_distincion` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `tipo_distincion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `sigla` VARCHAR(50) NULL ,
  `descripcion` VARCHAR(255) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `distincion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `distincion` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `distincion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `funcionario_id` INT NULL ,
  `pais_id` INT NULL ,
  `universidad_id` INT NULL ,
  `tipo_distincion_id` INT NULL ,
  `nombre_distincion` VARCHAR(100) NULL ,
  `otra_institucion` VARCHAR(100) NULL ,
  `fecha` DATE NULL ,
  `universitaria` VARCHAR(100) NULL ,
  `ambitodistincion` VARCHAR(100) NULL ,
  `vb` VARCHAR(45) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `patente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `patente` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `patente` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `numero_patente` VARCHAR(105) NULL ,
  `titulo_descripcion` VARCHAR(105) NULL ,
  `fecha` DATE NULL ,
  `vb` INT NULL ,
  `funcionario_id` INT NULL ,
  `subarea_id` INT NULL ,
  `pais_id` INT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `modulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `modulo` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `modulo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(50) NULL ,
  `nombre` VARCHAR(50) NULL ,
  `url` VARCHAR(100) NULL ,
  `descripcion` VARCHAR(200) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `grupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grupo` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `grupo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(100) NULL ,
  `descripcion` VARCHAR(155) NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `permiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `permiso` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `permiso` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `ver` VARCHAR(45) NULL ,
  `crear` VARCHAR(45) NULL ,
  `editar` VARCHAR(45) NULL ,
  `eliminar` VARCHAR(45) NULL ,
  `modulo_id` INT NULL ,
  `grupo_id` INT NULL ,
  `estado` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pertenece`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pertenece` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `pertenece` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `grupo_id` INT NULL ,
  `usuario_id` INT NULL ,
  `estado` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `datos_familiares`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datos_familiares` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `datos_familiares` (
  `id` INT NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `apellido_p` VARCHAR(45) NULL ,
  `apellido_m` VARCHAR(45) NULL ,
  `parenteso` VARCHAR(45) NULL ,
  `sexo` VARCHAR(20) NULL ,
  `fecha_nacimiento` DATE NULL ,
  `profecion` VARCHAR(45) NULL ,
  `lugar_residencia` VARCHAR(45) NULL ,
  `lugar_de_trabajo` VARCHAR(100) NULL ,
  `funcionario_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `lugar_de_trabajo_UNIQUE` ON `datos_familiares` (`lugar_de_trabajo` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `vivienda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vivienda` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `vivienda` (
  `id` INT NOT NULL ,
  `tipo_vivienda` VARCHAR(45) NULL ,
  `zona` VARCHAR(45) NULL ,
  `nombre_hurbanizacion` VARCHAR(45) NULL ,
  `ubicaion_vivienda` VARCHAR(45) NULL ,
  `viviendacol` VARCHAR(45) NULL ,
  `funcionario_id` INT NOT NULL ,
  `departamento_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `datos_comunicacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datos_comunicacion` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `datos_comunicacion` (
  `id` INT NOT NULL ,
  `tipo` VARCHAR(45) NULL ,
  `numero` INT NULL ,
  `lugar` VARCHAR(45) NULL ,
  `funcionario_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `id_UNIQUE` ON `datos_comunicacion` (`id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `colegio_egreso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `colegio_egreso` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `colegio_egreso` (
  `id` INT NOT NULL ,
  `nombre_colegio` VARCHAR(100) NULL ,
  `tipo_colegio` VARCHAR(50) NULL COMMENT 'particular , fiscal,convenio,comunitario, otro' ,
  `area_colegio` VARCHAR(45) NULL COMMENT 'runal,urbano,frontera' ,
  `fecha_titulo_bachiller` DATE NULL ,
  `pais_id` INT NOT NULL ,
  `departamento_id` INT NOT NULL ,
  `provincia_id` INT NOT NULL ,
  `municipio_id` INT NOT NULL ,
  `funcionario_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `secuencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `secuencia` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `secuencia` (
  `id` INT NOT NULL ,
  `modulo_id` INT NOT NULL ,
  `importancia` VARCHAR(45) NULL ,
  `nivel` INT NULL ,
  `estado` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `titulo_provicion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `titulo_provicion` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `titulo_provicion` (
  `id` INT NOT NULL ,
  `funcionario_id` INT NOT NULL ,
  `titulo_otorgado` VARCHAR(45) NULL ,
  `fecha_titulo` DATE NULL ,
  `numero_titulo` INT NULL ,
  `universidad_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
