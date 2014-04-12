<?php
try {
 define ("MODULO", "Laboral Umss Actual");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 



    leerClase('Laboral_umss_actual');
   
if(isset($_GET['eliminar']) && isset($_GET['laboral_umss_actual_id']) && is_numeric($_GET['laboral_umss_actual_id']) )
  {
       
      $laboral_umss_actual= new Laboral_umss_actual($_GET['laboral_umss_actualid']);
      $laboral_umss_actual->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>