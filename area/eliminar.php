<?php
try {
  define ("MODULO", "Area");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Area');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $area= new Area($_GET['id']);
      $area->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>