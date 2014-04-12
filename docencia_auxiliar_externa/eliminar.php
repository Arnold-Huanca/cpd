<?php
try {
 define ("MODULO", "Docencia Auxiliar Externa");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 

    leerClase('Docencia_axuliar_externa');
   
if(isset($_GET['docencia_axuliar_externa_id']) && is_numeric($_GET['docencia_axuliar_externa_id']) )
  {
       
      $docencia_axuliar_externa= new Docencia_axuliar_externa($_GET['docencia_axuliar_externa_id']);
      $docencia_axuliar_externa->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>