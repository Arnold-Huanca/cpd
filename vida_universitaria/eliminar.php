<?php
try {
  define ("MODULO", "Vida Universitaria");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 



    leerClase('Vida_universitaria');
   
if(isset($_GET['vida_universitaria_id']) && is_numeric($_GET['vida_universitaria_id']) )
  {
       
      $vida_universitaria= new Vida_universitaria($_GET['vida_universitaria_id']);
      $vida_universitaria->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>