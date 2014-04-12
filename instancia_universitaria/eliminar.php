<?php
try {
 define ("MODULO", "Instancia Universitaria");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Instancia_universitaria');
   
if(isset($_GET['instancia_universitaria_id']) && is_numeric($_GET['instancia_universitaria_id']) )
  {
       
      $instancia_universitaria= new Instancia_universitaria($_GET['instancia_universitaria_id']);
      $instancia_universitaria->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>