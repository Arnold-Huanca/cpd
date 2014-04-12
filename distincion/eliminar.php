<?php
try {
 define ("MODULO", "Distinción");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Distincion');
   
if(isset($_GET['distincion_id']) && is_numeric($_GET['distincion_id']) )
  {
       
      $distincion= new Distincion($_GET['distincion_id']);
      $distincion->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>