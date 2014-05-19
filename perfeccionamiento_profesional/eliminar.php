<?php
try {
 define ("MODULO", "Perfeccionamiento Profesional");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 


    leerClase('Perfeccionamiento_profecional');
   
if( isset($_GET['perfeccionamiento_profecional_id']) && is_numeric($_GET['perfeccionamiento_profecional_id']) )
  {
       
      $perfeccionamiento_profecional= new Perfeccionamiento_profecional($_GET['perfeccionamiento_profecional_id']);
      $perfeccionamiento_profecional->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>