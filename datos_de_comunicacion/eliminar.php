<?php
try {
  define ("MODULO", "Datos de Comunicacion");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Datos_Comunicacion');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $datos= new Datos_Comunicacion($_GET['id']);
      $datos->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>