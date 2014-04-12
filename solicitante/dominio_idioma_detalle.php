<?php
try {
 define ("MODULO", "Solicitante");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 

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
   leerClase("Idioma");  
  leerClase('Dominio_idioma');	   
   
  $menuizquierda = new Menu('');
  
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());
  
$ERROR = ''; 

  $id     = ''; 
  if ( isset($_GET['dominio_idioma_id']) && is_numeric($_GET['dominio_idioma_id']))
  {
 
    $id     = $_GET['dominio_idioma_id'];
  }
 
   $dominio_idioma= new Dominio_idioma($id);
   $idioma= new Idioma($dominio_idioma->id_idioma);
   $funcionario= new Funcionario($dominio_idioma->funcionario_id);
  
  $smarty->assign("funcionario",$funcionario);
  $smarty->assign("dominio_idioma",$dominio_idioma);
   $smarty->assign("idioma",$idioma);
   
 
  
 //echo $usuario->nombre;
  $menus='';
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
   $menus="mostrar";
    mysql_query("BEGIN");
    $dominio_idiomas= new Dominio_idioma($_POST['dominio_idioma_id']);
   $dominio_idiomas->estado=$_POST['valora'];
    $dominio_idiomas->fecha_visado= date();
    $dominio_idiomas->observacion= $_POST['observacion'];
    $dominio_idiomas->save();
    mysql_query("COMMIT");
    $ir = "Location: dominio_idioma.php?menus=mostrar&funcionario_id=$dominio_idiomas->funcionario_id";
    header($ir);
    exit();
    }
  $smarty->assign("menus", $menus);

  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'solicitante/dominio_idioma_detalle.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>