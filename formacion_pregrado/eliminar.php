<?php
try {
  define ("MODULO", "Formación Pregrado");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Formacion_pregrado');
   
if(isset($_GET['formacion_pregrado_id']) && is_numeric($_GET['formacion_pregrado_id']) )
  {
       
      $departamento= new Departamento($_GET['formacion_pregrado_id']);
      $departamento->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>