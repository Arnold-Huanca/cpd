<?php
try {
  define ("MODULO", "Evento");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Evento');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $evento= new Evento($_GET['id']);
      $evento->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>