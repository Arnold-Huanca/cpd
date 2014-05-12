<?php
try {
  define ("MODULO", "Dedicación Exclusiva");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Dedicacion_exclusiva');
   
if( isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $dedicacion_exclusiva= new Dedicacion_exclusiva($_GET['id']);
      $dedicacion_exclusiva->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>