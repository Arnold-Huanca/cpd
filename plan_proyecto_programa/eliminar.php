<?php
try {
 define ("MODULO", "Plan Proyecto Programa");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php");  



    leerClase('Plan_proyecto_programa');
   
if(isset($_GET['plan_proyecto_programa_id']) && is_numeric($_GET['plan_proyecto_programa_id']) )
  {
       
      $plan_proyecto_programa= new Plan_proyecto_programa($_GET['plan_proyecto_programa_id']);
      $plan_proyecto_programa->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>