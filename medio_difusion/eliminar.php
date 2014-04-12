<?php
try {
 define ("MODULO", "Medio Difusion");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Medio_difunsion');
   
if(isset($_GET['eliminar']) && isset($_GET['medio_difunsion_id']) && is_numeric($_GET['medio_difunsion_id']) )
  {
       
      $medio_difunsion= new Medio_difunsion($_GET['medio_difunsion_id']);
      $medio_difunsion->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>