<?php
try {
 define ("MODULO", "Dedicación");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Dedicacion');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $dedicacion= new Dedicacion($_GET['id']);
      $dedicacion->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>