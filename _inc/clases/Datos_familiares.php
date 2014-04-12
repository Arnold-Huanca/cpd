<?php

/**
 * Esta clase es para guardar los datos tipo Usuario
 */
class Datos_familiares  extends Objectbase 
{
 var $funcionario_id;
 /**
  * Nombre del usuario
  * @var VARCHAR(100)
  */
  var $nombre;

 /**
  * Apellidos paterno 
  * @var VARCHAR(100)
  */
  var $apellido_p;  

  /**
  * Apellidos materno
  * @var VARCHAR(100)
  */
  var $apellido_m;
  
  var $parentesco;
  var $sexo;
  
  var $fecha_nacimiento;
  
  var $profesion;
  
  var $lugar_residencia;
  var $lugar_de_trabajo;




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