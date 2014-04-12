<?php
/**
 * class Conexion_db
 *
 * Clase para realizar la conexion a la DB
 *
 * @subpackage Conexion_db
 * @global recurso $enlace
 * @global objeto $db
 */
class Conexion_db {
	public $enlace;
	public $db;
	
	/**
	 * Constructor
	 */
	public function __construct() {
		//$this->code = $code;
	}

	/**
	 * Realiza la coneccion a la base de datos
	 *
	 * @param <bool> $selecionar_la_db
	 * @return <bool>
	 */
	public function conectar($selecionar_la_db = true) {
		$this->enlace = mysql_connect(DBHOST,DBUSER,BDPASS);
		if (!$this->enlace)
			throw new Exception('Could not connect: ' . mysql_error());
		if (!$selecionar_la_db)
			return true;
		$this->db = mysql_select_db(BDNAME,$this->enlace);
		if (!$this->db)
			throw new Exception('Can\'t use the db: ' . mysql_error());
		//echo 'Connected successfully';
		return true;
	}

	/**
	 * Desconecta de la DB
	 *
	 * @return <bool>
	 */
	public function desconectar() {
		if ($this->enlace)
			mysql_close($this->enlace);
		return true;
  }
}
