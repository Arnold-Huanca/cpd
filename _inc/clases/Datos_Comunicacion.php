<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Datos_Comunicacion
 *
 * @author DPA



/**
 * Esta clase es para guardar los datos de comunicacion de un usuario de tipo docente
 */
class Datos_Comunicacion extends Objectbase 
{

 /**
  * Nombre del usuario
  * @var VARCHAR(100)
  */
  var $funcionario_id;
  
  var $tipo;
  
  var $numero;
  
  var $lugar;
  
  var $estado;
  
  

 
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
  

}

?>
