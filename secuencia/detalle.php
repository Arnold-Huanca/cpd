<?php
try {
  define ("MODULO", "Distinción");
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
    $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
    
  //$CSS[]  = URL_CSS . "pg.css";
 // $smarty->assign('CSS',$CSS);

  
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
          //Datepicker UI
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

$ERROR = ''; 

  leerClase('Distincion');
  leerClase('Pais');
  leerClase("Universidad");
  leerClase('Tipo_distincion');
  $id     = '';
  $ver='';
  $editar = FALSE;
  if ( isset($_GET['ver']) && isset($_GET['distincion_id']) && is_numeric($_GET['distincion_id']) )
  {
    $editar = TRUE;
     $ver='ver';
    $id     = $_GET['distincion_id'];
  }
  
  $distincion    = new Distincion($id);
  $universidad  = new Universidad($distincion->universidad_id);
  $pais= new Pais($distincion->pais_id);
  $tipodistincion= new Tipo_distincion($distincion->tipo_distincion_id);
 
  
$smarty->assign("ver", $ver);
  $smarty->assign("distincion", $distincion);
  $smarty->assign("universidad", $universidad);
  $smarty->assign("pais", $pais);
  $smarty->assign("tipodistincion", $tipodistincion);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'distincion/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>