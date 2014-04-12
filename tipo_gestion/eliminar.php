<?php
try {
 define ("MODULO", "Tipo Gestión");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 


    leerClase('Tipo_gestion');
   
if( isset($_GET['tipo_gestion_id']) && is_numeric($_GET['tipo_gestion_id']) )
  {
       
      $tipo_gestion= new Tipo_gestion($_GET['tipo_gestion_id']);
      $tipo_gestion->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>