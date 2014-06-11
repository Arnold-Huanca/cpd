<?php
try {
  define ("MODULO", "Solicitante");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 

    leerClase('Patente');
   
if(isset($_GET['patente_id']) && is_numeric($_GET['patente_id']) )
  {
       
      $patente= new Patente($_GET['patente_id']);
      $patente->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>