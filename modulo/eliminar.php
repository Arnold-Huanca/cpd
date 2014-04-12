<?php
try {
 define ("MODULO", "Modulo");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Modulo');
   
if(isset($_GET['eliminar']) && isset($_GET['modulo_id']) && is_numeric($_GET['modulo_id']) )
  {
       
      $modulo= new Modulo($_GET['modulo_id']);
      $modulo->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>