<?php
try {
 define ("MODULO", "Secuencia");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Secuencia');
   
if(isset($_GET['secuencia_id']) && is_numeric($_GET['secuencia_id']) )
  {
       
      $secuencia= new Secuencia($_GET['secuencia_id']);
       $secuencia->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>