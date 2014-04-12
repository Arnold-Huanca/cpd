<?php
try {
  define ("MODULO", "Datos Familiares");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Datos_familiares');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $datos= new Datos_familiares($_GET['id']);
      $datos->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>