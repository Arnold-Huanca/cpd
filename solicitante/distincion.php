<?php
try {
  require('../_start.php');
  define ("MODULO", "Solicitante");
 if(!isUserSession())
  header("Location: index.php");  

  $CSS[]  = URL_CSS . "style.css";
  $CSS[]  = URL_CSS . "style.responsive.css";
 $CSS[]  = URL_CSS . "tables.css";
    
  $CSS[]  = URL_CSS . "demo_table.css";
  $CSS[]  = URL_CSS . "style_table.css";

  
  $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
   $JS[]  =URL_JS . 'table/jquery.dataTables.js';

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
  
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

$ERROR = ''; 

  leerClase('Funcionario');
  $id     = '';
  $menus='';
  $editar = FALSE;
  if ( isset($_GET['menus']) && $_GET['menus']== "mostrar" && isset($_GET['funcionario_id']) && is_numeric($_GET['funcionario_id']) )
  {
    $menus="mostrar";
    $id     = $_GET['funcionario_id'];
  }
  $funcionarios   = new Funcionario($id);
 
 //$datosgenerales= $funcionario->getDatosGenerales();
   $smarty->assign("menus", $menus);
  
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $ambito->objBuidFromPost();
    $ambito->estado           = Objectbase::STATUS_AC;
    $ambito->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }
    

  $smarty->assign("funcionario",  $funcionarios);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'solicitante/distincion.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>