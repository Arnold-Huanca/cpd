<?php
try {
define ("MODULO", "Tipo Gestión");
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
 $CSS[]  = URL_CSS . "style.default.css";   
  //$CSS[]  = URL_CSS . "pg.css";
 // $smarty->assign('CSS',$CSS);

  
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
    $JS[]  = URL_JS . "validator.min.js";
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

$ERROR = ''; 

  leerClase('Tipo_gestion');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['tipo_gestion_id']) && is_numeric($_GET['tipo_gestion_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['tipo_gestion_id'];
  }
  
  $tipo_gestion    = new Tipo_gestion($id);
 
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $tipo_gestion->objBuidFromPost();
    $tipo_gestion->estado           = Objectbase::STATUS_AC;
    $tipo_gestion->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("tipo_gestion", $tipo_gestion);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'tipo_gestion/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>