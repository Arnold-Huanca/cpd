<?php
try {
  define ("MODULO", "Tipo Distinción");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 


    leerClase('Tipo_distincion');
   
if(isset($_GET['eliminar']) && isset($_GET['tipo_distincion_id']) && is_numeric($_GET['tipo_distincion_id']) )
  {
       
      $tipo_distincion= new Tipo_distincion($_GET['tipo_distincion_id']);
      $tipo_distincion->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>