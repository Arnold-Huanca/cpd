<?php
try {
 define ("MODULO", "Permiso");
  require('../_start.php');
  if(!isUserSession())
    header("Location: ../index.php");  

  leerClase("Grupo");
  leerClase("Usuario");
  leerClase("Pertenece");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Asignar grupos a Usuarios');
  $smarty->assign('description','Asignar grupos a Usuarios');
  $smarty->assign('keywords','Gestion,Usuarios');

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
  
   $smarty->assign('JS',$JS);
  
  
  //grabamos un usario en un determinado grupo
  if (isset($_GET['permisos_id'])    && 
        isset($_GET['asignar_permiso'])   && 
        isset($_GET['modulo_id'])      && 
        isset($_GET['grupo_id']) ) {
     $id = '';
   
      $id = ($_GET['permisos_id']);
   // echo $id;
    $permiso = new Permiso($id);
    $modulo   = new Modulo($_GET['modulo_id']);
    $grupo     = new Grupo($_GET['grupo_id']);
    if ($_GET['asignar_permiso'] == 0 )
    {
         $permiso->grupo_id= $grupo->id;
         $permiso->modulo_id=$modulo->id;
         $permiso->ver="1";
         $permiso->estado=  Objectbase::STATUS_AC;
         $permiso->save();
      
    }
    else
      $permiso->delete();
  }

  //No hay ERROR
  $smarty->assign("ERROR",'');
  $smarty->assign("URL",URL);  

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}  

$smarty->display('permiso/gestion.tpl');

?>