<?php

/**
 * Esta clase es para guardar los datos tipo Usuario
 */
class Area_colegio extends Objectbase 
{

 /**
  * Nombre del usuario
  * @var VARCHAR(100)
  */
  var $nombre_area;
  
  var $sigla_area;
 
   /**
   * get user if exist else return 0
   * @param type $login
   * @param type $clave
   * @return object 
   */
  public function issetUser($login, $clave) {
    if ($login == "" || $clave == "")
      return false;
    $activo = Objectbase::STATUS_AC;
    $sql = "select * , u.id as usuario_id  from " . $this->getTableName('usuario') . " as u   where u.login = '$login' and u.password = '$clave'  and u.estado = '$activo'  ";
    //echo $sql; 
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $user = mysql_fetch_object($resultado);
    return $user;
  }

  public function getByLogin ($login, $verSifueTomado = false ) {
    $sql       = "select * from ".$this->getTableName()." where login = '$login'";
    $result = mysql_query($sql);
    if ($result === false)
      throw new Exception("?".$this->getTableName ()."&m=Cant getByEmail <br />$sql<br /> ".$this->getTableName() . ' -> '. mysql_error() );

    if ($verSifueTomado)
    {
      if (mysql_num_rows($result))
        throw new Exception("?login&m=Este login ya fue tomado");
      return;
    }

    $usuario = mysql_fetch_array($result,MYSQL_BOTH);
    self::__construct($usuario['id']);
    return true;
  }
  
  /**
   * Obtenemos los nombres y apellidos del usuario de una cadena 
   * @param string $nombreyapellidos cadena con el nombre y los appellidos ejemplo BASTO RODRIGUEZ PEDRO EDUARDO
   * @param string $delimiter un spacio por lo general
   * @return boolean
   */
  function parserNombreApellidos($nombreyapellidos = false,$delimiter = ' ') 
  {
    if (!$nombreyapellidos)
      return false;
    $array = explode($delimiter, $nombreyapellidos);
    switch (count($array)) {
      case 0:
        return false;
        break;
      case 3://BASTO RODRIGUEZ EDUARDO 
        $this->apellidos = $array[0] . ' ' . $array[1];
        $this->nombre    = $array[2];
        break;
      case 4://BASTO RODRIGUEZ PEDRO EDUARDO 
        $this->apellidos = $array[0] . ' ' . $array[1];
        $this->nombre    = $array[2] . ' ' . $array[3];
        break;
      default: //odos los otros casos
        $this->nombre    = $nombreyapellidos;
        break;
    }
    
  }

  /**
   * Validamos al usuario ya sea para actualizar o para crear uno nuevo
   * @param type $es_nuevo
   */
  function validar($es_nuevo = true) {
    leerClase('Formulario');
    Formulario::validar('ci'                ,$this->ci          ,'texto','El CI');
    Formulario::validar('nombre'            ,$this->nombre      ,'texto','El Nombre');
    Formulario::validar('apellidos'         ,$this->apellidos   ,'texto','Los Apellidos',TRUE);
    Formulario::validar('login'             ,$this->login      ,'texto','El Login');
    if ( $es_nuevo ) // nuevo
    {
      $this->getByLogin($this->login,true);
      Formulario::validarPassword('clave',$this->clave, isset($_POST['clave2'])?$_POST['clave2']:false ,TRUE);
    }
    else
    {
      $pas1 = isset($_POST['password1'])?$_POST['password1']:false;
      $pas2 = isset($_POST['password2'])?$_POST['password2']:false;
      $pas3 = isset($_POST['password3'])?$_POST['password3']:false;
      Formulario::validarCambioPassword('password',$this->clave,$pas1,$pas2,$pas3,true,'texto','La Clave de acceso',FALSE);
      $this->password = $pas2;
    }
    Formulario::validar_fecha('fecha_cumple',$this->fecha_cumple,TRUE);
  }
  
  
}

?>