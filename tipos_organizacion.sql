INSERT INTO `dpa`.`tipo_organizacion` (`id`, `sigla`, `descripcion`, `estado`)
 VALUES
			('1', 'Otra Aclarar', NULL, NULL), 
			
			('2', 'Sociedad de Beneficencia', NULL, NULL), 
			 
			('3', 'Institucion Civia', NULL, NULL), 
			
                  ('4', 'Socieda Profecional', NULL, NULL),
			('5', 'Sociedad Cientifica', NULL, NULL);
			
			
// isercion de  datos para la tabla tipo participacion

INSERT INTO `dpa`.`tipo_participacion` (`id`, `sigla`, `descripcion`, `dominio_participacion`, `estado`) 
VALUES ('1', 'ASE', 'Asesor', NULL, NULL),
		     ('2', 'COE', 'Consejero Elegido', NULL, NULL),
		     ('3', 'COG', 'Consejero Gremial', NULL, NULL),
		     ('4', 'COO', 'Coordinador', NULL, NULL),
		     ('5', 'DEC', 'Decano o Director de Escuela', NULL, NULL),
		     ('6', 'DIA', 'Director Académico de Facultad o Escuela', NULL, NULL),
		     ('7', 'DIC', 'Director de Carrera', NULL, NULL),
		     ('8', 'DII', 'Diretcor de Instituto de Investigaciones', NULL, NULL),
		     ('9', 'DIU', 'Director Universitario', NULL, NULL),
		     ('10', 'JEF', 'Jefe de Departamento Facultativo', NULL, NULL),
		     ('11', 'JEU', 'Jefe de Departamento Univesitario', NULL, NULL),
		     ('12', 'JPP', 'Jefe de Programa, Proyecto o Laboratorio', NULL, NULL),
		     ('13', 'GT', 'Miembro De Tribunal de Grado', NULL, NULL),
		     ('14', 'PRE', 'Presidente', NULL, NULL),
		     ('15', 'REC', 'Rector', NULL, NULL),
		     ('16', 'ADS', 'Respresentante/ Delegado de Base adscripto', NULL, NULL),
		     ('17', 'SUP', 'Respresentante/ Delegado de Base suplente', NULL, NULL),
		     ('18', 'TIT', 'Respresentante/ Delegado de Base titular', NULL, NULL),
		     ('19', 'SEI', 'Secretario de Investigación', NULL, NULL),
		     ('20', 'SEE', 'Secretario Ejecutivo', NULL, NULL),
		     ('21', 'SEC', 'Secretario General', NULL, NULL),
		     ('22', 'VPR', 'Vice-Presidente', NULL, NULL),
		     ('23', 'VRC', 'Vicerrector', NULL, NULL),
		     ('24', 'VOC', 'Vocal', NULL, NULL),
		     ('25', 'OT', 'Otro(Aclarar)', NULL, NULL),
		     ('26', 'TU', 'Tutoria en la Elaboracion de Pryectos de Grado, tesis u otro', NULL, NULL);
		     
		     
		     // paara  formacion pregrado (grados obtenidos, titulos en  provicion nacional)
		     INSERT INTO `dpa`.`modulo` (`id`, `codigo`, `nombre`, `url`, `descripcion`, `estado`) 
		     VALUES ('71', 'Grados Academicos', 'Grados Academicos', NULL, NULL, NULL), 
					   ('72', 'titulos en provicion nacional', NULL, NULL, NULL, NULL);
					   
					   INSERT INTO `dpa`.`permiso` (`id`, `ver`, `crear`, `editar`, `eliminar`, `modulo_id`, `grupo_id`, `estado`) 
					   VALUES ('117', '1', '1', '1', '1', '71', '4', NULL), ('118', '1', '1', '1', '1', '71', '4', NULL);
					   
					   
		INSERT INTO `dpa`.`secuencia` (`id`, `modulo_id`, `grupo`, `importancia`, `nivel`, `estado`) 
		VALUES ('55', '71', 'Formacion pregrado', 'si', '1', NULL), ('56', '72', 'Formacion Pregrado', 'si', '2', NULL);