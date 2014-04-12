<?php
try {
define ("MODULO", "Patente");
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
   $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $CSS[]  = URL_CSS . "style.css";
  $CSS[]  = URL_CSS . "style.responsive.css";
   $CSS[]  = URL_CSS . "styleform.css";
    
  //$CSS[]  = URL_CSS . "pg.css";
 // $smarty->assign('CSS',$CSS);

  
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
    $JS[]  = URL_JS . "validator.min.js";
      $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";


  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());
$ERROR = ''; 

  leerClase('Patente');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['patente_id']) && is_numeric($_GET['patente_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['patente_id'];
  }
  
  $patente    = new Patente($id);
 
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $patente->objBuidFromPost();
    $patente->estado           = Objectbase::estado_pendiente;
    $patente->funcionario_id =getSessionUser()->getFuncionario()->id;
    $patente->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
    exit();
    }

  $smarty->assign("patente", $patente);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'patente/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>