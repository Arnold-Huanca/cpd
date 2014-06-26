<?php
try {
  define ("MODULO", "Formación Pregrado");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Formacion_pregrado');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $departamento= new Formacion_pregrado($_GET['id']);
      $departamento->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>