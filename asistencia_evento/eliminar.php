<?php
try {
    define ("MODULO", "Asistencia Evento");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 

  leerClase('Asistencia_evento');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $asistencia_evento= new Asistencia_evento($_GET['id']);
      $asistencia_evento->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>