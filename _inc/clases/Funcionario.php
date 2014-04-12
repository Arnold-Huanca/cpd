<?php

/**
 * Esta clase es para guardar los datos tipo Usuario
 */
class Funcionario extends Objectbase 
{

 /**
  * Nombre del usuario
  * @var VARCHAR(100)
  */
    
   var $ci_f;
   
   var $apellido_p;
   
   var $apellido_m;
   
   var $nombre;
   
   var $fecha_nac;
   
   var $sexo;
   
   var $estado_civil;
   
   var $email;
   
   var $numero_hijos;
   
   var $direccion_domicilio;
   
   var $numero_domicilio;
   
   var $telefono_domicilio;
   
   var $casilla_correo;
   
   var $colegio_egreso;
   
   var $fecha_titulo_bachiller;
   
   var $departamento_id;
   
   var $municipio_id;
   
   var $area_colegio_id;
   
   var $dependencia_colegio_id;
   
   var $pais_id;
   
   var $usuario_id;
   
   var $descripcion;
   
  

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
  
 /**
  * 
  * @return boolean|\Grupo
  * retorna lista de formacion pregrado
  */
  function getFormacionPregrado()
  {
      
      
    leerClase('Formacion_pregrado');
    $activo = Objectbase::STATUS_AC;

    $sql = "select * from " . $this->getTableName('Formacion_pregrado') . " where funcionario_id = '{$this->id}' AND estado = '$activo'";
    //echo $sql;
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $formacion = array();
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {
      $formacion[] = new Formacion_pregrado($fila['id']);
    }
    return  $formacion;
  }
  
  /**
  * 
  * @return boolean|\Grupo
  * retorna lista de formacion postgrado
  */
  function getFormacionPosgrado()
  {
      
      
    leerClase('Formacion_postgrado');
    $activo = Objectbase::STATUS_AC;

    $sql = "select * from " . $this->getTableName('Formacion_postgrado') . " where funcionario_id = '{$this->id}' AND estado = '$activo'";
    //echo $sql;
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $formacion = array();
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {
      $formacion[] = new Formacion_pregrado($fila['id']);
    }
    return  $formacion;
  }

}

?>