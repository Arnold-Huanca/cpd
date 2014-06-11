<?php
try {
 define ("MODULO", "Solicitante");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 

    leerClase('Docencia_axuliar_externa');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $docencia_axuliar_externa= new Docencia_axuliar_externa($_GET['id']);
      $docencia_axuliar_externa->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>