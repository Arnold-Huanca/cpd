<?php
try {
 define ("MODULO", "Membresia");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Membresia');
   
if(isset($_GET['eliminar']) && isset($_GET['membresia_id']) && is_numeric($_GET['membresia_id']) )
  {
       
      $membresia= new Membresia($_GET['membresia_id']);
      $membresia->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>