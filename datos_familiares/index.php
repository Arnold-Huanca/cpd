<?php
try {
  define ("MODULO", "Datos Familiares");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 
  
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
 // $CSS[] = '../css/editablegrid.css';
 
  //JS
  //
  
   
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
   $JS[]  =URL_JS . 'table/jquery.dataTables.js';

$CSS[]  = URL_CSS . "menu_styles.css";
  $JS[]  = URL_JS . "menu_jquery.js";  
  
   $smarty->assign('CSS',$CSS);

  $smarty->assign('JS',$JS);
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());
 
  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{

  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('datos_familiares/gestion.tpl');
?>