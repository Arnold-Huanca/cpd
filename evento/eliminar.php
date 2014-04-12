<?php
try {
  define ("MODULO", "Evento");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Evento');
   
if(isset($_GET['eliminar']) && isset($_GET['evento_id']) && is_numeric($_GET['evento_id']) )
  {
       
      $evento= new Evento($_GET['evento_id']);
      $evento->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>