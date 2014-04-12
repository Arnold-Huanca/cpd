<?php
try {
  define ("MODULO", "Dedicación Exclusiva");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Dedicacion_exclusiva');
   
if( isset($_GET['dedicacion_exclusiva_id']) && is_numeric($_GET['dedicacion_exclusiva_id']) )
  {
       
      $dedicacion_exclusiva= new Dedicacion_exclusiva($_GET['dedicacion_exclusiva_id']);
      $dedicacion_exclusiva->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>