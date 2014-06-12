<?php
try {
 define ("MODULO", "Formación Postgrado");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Formacion_postgrado');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $formacion_postgrado= new Formacion_postgrado($_GET['id']);
      $formacion_postgrado->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>