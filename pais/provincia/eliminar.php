<?php
try {
     define ("MODULO", "Pais");
  require('../../_start.php');
  if(!isUserSession())
    header("Location: index.php");  

    leerClase('Provincia');
   
if(isset($_GET['eliminar']) && isset($_GET['provincia_id']) && is_numeric($_GET['provincia_id']) )
  {
       
      $provincia= new Provincia($_GET['provincia_id']);
      $provincia->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>