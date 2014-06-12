<?php
try {
  define ("MODULO", "Solicitante");
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
  $CSS[]  = URL_CSS . "style.default.css";
 // $CSS[] = '../css/editablegrid.css';
 
  //JS
  //
  
   
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
   $JS[]  =URL_JS . 'table/jquery.dataTables.js';


  
   $smarty->assign('CSS',$CSS);

  $smarty->assign('JS',$JS);
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
  
  
  $smarty->assign("funcionario",  $funcionarios);
  
  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{

  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('solicitante/datos_familiares.tpl');
?>