<?php
try {
define ("MODULO", "Universidad");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 


    leerClase('Universidad');
   
if(isset($_GET['universidad_id']) && is_numeric($_GET['universidad_id']) )
  {
       
      $universidad= new Universidad($_GET['universidad_id']);
      $universidad->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>