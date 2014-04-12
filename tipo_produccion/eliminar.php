<?php
try {
 define ("MODULO", "Tipo Producción");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 


    leerClase('Tipo_produccion');
   
if(isset($_GET['tipo_produccion_id']) && is_numeric($_GET['tipo_produccion_id']) )
  {
       
      $tipo_produccion= new Tipo_produccion($_GET['tipo_produccion_id']);
      $tipo_produccion->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>