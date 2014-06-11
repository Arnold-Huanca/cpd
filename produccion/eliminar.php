<?php
try {
 define ("MODULO", "Producción");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php");  

    leerClase('Produccion');
   
if(isset($_GET['produccion_id']) && is_numeric($_GET['produccion_id']) )
  {
       
      $produccion= new Produccion($_GET['produccion_id']);
      $produccion->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>