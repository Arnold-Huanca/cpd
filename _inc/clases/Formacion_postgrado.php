<?php

/**
 * Esta clase es para guardar los datos tipo Usuario
 */
class Formacion_postgrado extends Objectbase 
{

 /**
  * Nombre del usuario
  * @var VARCHAR(100)
  */
    
   var $fecha_titulo_post;
   
   var $tesis_post;
   
   var $titulo_post;
   
   var $duracion_curso_post;
   
   var $otra_institucion_post;
   
   var $ciudad_post;
   
   var $vb;
   
   var $hrs_presenciales_post;
   
   var $hrs_no_presenciales_post;
   
   var $creditos_post;
   
   var $universidad_id;
   
   var $funcionario_id;
   
   var $pais_id;
   
   var $subarea_id;
   
   var $unidad_tiempo_id;
   
   var $grado_academico_id;
   
   var $descripcion;
   var $observacion;
  
  var $fecha_visado;
  
  
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
  
  
}

?>