<?php
try {
 define ("MODULO", "Vida Universitaria Externa");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 


    leerClase('Vida_universitaria_externa');
   
if( isset($_GET['vida_universitaria_externa_id']) && is_numeric($_GET['vida_universitaria_externa_id']) )
  {
       
      $vida_universitaria_externa= new Vida_universitaria_externa($_GET['vida_universitaria_externa_id']);
      $vida_universitaria_externa->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>