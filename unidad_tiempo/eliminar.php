<?php
try {
define ("MODULO", "Unidad Tiempo");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 


    leerClase('Unidad_tiempo');
   
if(isset($_GET['unidad_tiempo_id']) && is_numeric($_GET['unidad_tiempo_id']) )
  {
       
      $unidad_tiempo= new Unidad_tiempo($_GET['unidad_tiempo_id']);
      $unidad_tiempo->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>