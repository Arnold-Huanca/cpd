<?php
try {
  define ("MODULO", "Solicitante");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Docencia_auxiliatura_umss');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $docencia_auxiliatura_umss= new Docencia_auxiliatura_umss($_GET['id']);
      $docencia_auxiliatura_umss->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>