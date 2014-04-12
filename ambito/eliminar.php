<?php
try {
  define ("MODULO", "Ambito");
  require('../_start.php');
  if(!isUserSession())
   header("Location: index.php"); 


    leerClase('Ambito');
    echo "entra a eliminar";
   
if(isset($_GET['ambito_id']) && is_numeric($_GET['ambito_id']) )
  {
       
      $ambito= new Ambito($_GET['ambito_id']);
      $ambito->delete();
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>