<?php
try {
   define ("MODULO", "Usuario");
  require('../_start.php');
  if(!isUserSession())
    header("Location: ../index.php"); 

  leerClase('Usuario');
  leerClase("Menu");
 
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
   $smarty->assign('CSS',$CSS);
leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());
  //JS
  //

   
   $JS[]  = URL_JS . "script/script.js";

   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
   $JS[]  =URL_JS . 'table/jquery.dataTables.js';
     $JS[]  = URL_JS . "script/validator.min.js";
    $menu = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());
  $smarty->assign('JS',$JS);
  
 
  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('usuario/gestion.tpl');
?>