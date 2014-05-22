<?php
try {
   define ("MODULO", "Area");
  require('../../_start.php');
  if(!isUserSession())
    header("Location: index.php");  


    leerClase('Subarea');
   
if( isset($_GET['subarea_id']) && is_numeric($_GET['subarea_id']) )
  {
       
      $subarea= new Subarea($_GET['subarea_id']);
      $subarea->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>