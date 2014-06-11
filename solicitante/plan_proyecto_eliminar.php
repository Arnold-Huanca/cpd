<?php
try {
  define ("MODULO", "Solicitante");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php");  



    leerClase('Plan_proyecto_programa');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $plan_proyecto_programa= new Plan_proyecto_programa($_GET['id']);
      $plan_proyecto_programa->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>