<?php
try {
  define ("MODULO", "Titularización");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 


    leerClase('Titularizacion');
   
if(isset($_GET['eliminar']) && isset($_GET['titularizacion_id']) && is_numeric($_GET['titularizacion_id']) )
  {
       
      $titularizacion= new Titularizacion($_GET['titularizacion_id']);
      $titularizacion->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>