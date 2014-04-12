<?php
try {
 define ("MODULO", "Tipo Evento");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 


    leerClase('Tipo_evento');
   
if(isset($_GET['tipo_evento_id']) && is_numeric($_GET['tipo_evento_id']) )
  {
       
      $tipo_evento= new Tipo_evento($_GET['tipo_evento_id']);
      $tipo_evento->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>