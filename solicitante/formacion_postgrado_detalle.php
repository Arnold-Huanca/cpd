<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
<?php
try {
 define ("MODULO", "Solicitante");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 

  /** HEADER */
  $smarty->assign('title', 'Registro de Usuario');
  $smarty->assign('description', 'P&aacute;gina de Registro de Usuario');
   /**
   * Menu superior
   */
  
    
  //CSS
  $CSS[]  = URL_CSS . "style.css";
  $CSS[]  = URL_CSS . "style.responsive.css";
   $CSS[]  = URL_CSS . "styleform.css";
    
  //$CSS[]  = URL_CSS . "pg.css";
 // $smarty->assign('CSS',$CSS);

  
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
    $JS[]  = URL_JS . "validator.min.js";
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
   leerClase('Menu');
   leerClase("Funcionario");
   leerClase("Universidad");
   leerClase("subarea");
   leerClase("Pais");
   leerClase("Unidad_tiempo");
   leerClase("Grado_academico");
   leerClase('Formacion_postgrado');	   
   
  $menuizquierda = new Menu('');
  
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());
  
$ERROR = ''; 

  $id     = ''; 
  if ( isset($_GET['formacion_postgrado_id']) && is_numeric($_GET['formacion_postgrado_id']))
  {
    $id     = $_GET['formacion_postgrado_id'];
  }
 
   $formacion_postgrado= new Formacion_postgrado($id);
   
   $universidad= new Universidad( $formacion_postgrado->universidad_id);
   $pasis = new Pais($formacion_postgrado->pais_id);
   $subarea= new Subarea($formacion_postgrado->subarea_id);
   $unidadtiempo= new Unidad_tiempo($formacion_postgrado->unidad_tiempo_id);
   $funcionario= new Funcionario($formacion_postgrado->funcionario_id);
   $grado_academico= new Grado_academico($formacion_postgrado->grado_academico_id);
  
  $smarty->assign("funcionario",$funcionario);
  $smarty->assign("universidad",$universidad);
  
   $smarty->assign("pais",$pasis);
    $smarty->assign("subarea",$subarea);
    $smarty->assign("unidadtiempo",$unidadtiempo);
     $smarty->assign("gradoacademico",$grado_academico);
  
  
  
  
  
 
  
 //echo $usuario->nombre;
  $menus='';
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
   $menus="mostrar";
    mysql_query("BEGIN");
    $formacion_postgrados= new Formacion_pregrado($_POST['formacionpostgrado_id']);
    $formacion_postgrados->estado=$_POST['valora'];
    $formacion_postgrados->fecha_visado= date();
    $formacion_postgrados->observacion= $_POST['observacion'];
    $formacion_postgrados->save();
    mysql_query("COMMIT");
    $ir = "Location: formacion_postgrado.php?menus=mostrar&funcionario_id=$formacion_postgrados->funcionario_id";
    header($ir);
    exit();
    }
  $smarty->assign("menus", $menus);
  $smarty->assign("formacion_postgrado", $formacion_postgrado);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'solicitante/formacion_postgrado_detalle.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>