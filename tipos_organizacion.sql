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