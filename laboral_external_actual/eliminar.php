<?php
try {
 define ("MODULO", "Laboral Externa Actual");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Laboral_external_actual');
   
if(isset($_GET['laboral_external_actual_id']) && is_numeric($_GET['laboral_external_actual_id']) )
  {
       
      $laboral_external_actual= new Laboral_external_actual($_GET['laboral_external_actual_id']);
      $laboral_external_actual->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>