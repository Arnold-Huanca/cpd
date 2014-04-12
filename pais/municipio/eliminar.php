<?php
try {
    define ("MODULO", "Pais");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Municipio');
   
if(isset($_GET['municipio_id']) && is_numeric($_GET['municipio_id']) )
  {
       
      $municipio= new Municipio($_GET['municipio_id']);
      $municipio->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>