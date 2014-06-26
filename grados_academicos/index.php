<?php
try {
  define ("MODULO", "Formación Pregrado");
  require('../_start.php');
  if(!isUserSession())
  header("Location: ../index.php");  
  leerClase('Formacion_pregrado');
 
  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','');
  $smarty->assign('description','');
    $smarty->assign('keywords','');
  

    //CSS
  $CSS[]  = URL_CSS . "style.css";
  $CSS[]  = URL_CSS . "style.responsive.css";
  $CSS[]  = URL_CSS . "tables.css";
    
  $CSS[]  = URL_CSS . "demo_table.css";
  $CSS[]  = URL_CSS . "style_table.css";
  $CSS[]  = URL_CSS . "style.default.css"; 
 // $smarty->assign('CSS',$CSS);
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

  //JS
  //
  
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
   $JS[]  = URL_JS . "validator.min.js";
   $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
 
   $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
   $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
 
  
  $smarty->assign('JS',$JS);
  $smarty->assign('CSS',$CSS);
  
 
  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('grados_academicos/gestion.tpl');
?>