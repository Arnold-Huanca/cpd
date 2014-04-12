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
   leerClase("Tipo_distincion");
   leerClase("Pais");

  leerClase('Distincion');	   
   
  $menuizquierda = new Menu('');
  
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());
  
$ERROR = ''; 

  $id     = ''; 
  if ( isset($_GET['distincion_id']) && is_numeric($_GET['distincion_id']))
  {
 
    $id     = $_GET['distincion_id'];
  }
 
   $distincion= new Distincion($id);
   $universidad= new Universidad($distincion->universidad_id);
   $pasis = new Pais($distincion->pais_id);
   $tipodistincion= new Tipo_distincion($distincion->tipo_distincion_id);
   $funcionario= new Funcionario($distincion->funcionario_id);
  
  $smarty->assign("funcionario",$funcionario);
  $smarty->assign("universidad",$universidad);
   $smarty->assign("tipodistincion",$tipodistincion);
   $smarty->assign("pais",$pasis);
  
  
  
  
  
 
  
 //echo $usuario->nombre;
  $menus='';
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
   $menus="mostrar";
    mysql_query("BEGIN");
    $distincion->estado=$_POST['valora'];
    $distincion->fecha_visado= date();
    $distincion->observacion= $_POST['observacion'];
    $distincion->save();
    mysql_query("COMMIT");
    $ir = "Location: distincion.php?menus=mostrar&funcionario_id=$distincion->funcionario_id";
    header($ir);
    exit();
    }
  $smarty->assign("menus", $menus);
  $smarty->assign("distincion", $distincion);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'solicitante/distincion_detalle.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>