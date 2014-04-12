<?php
try {
define ("MODULO", "Grado Academico");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Grado_academico');
   
if(isset($_GET['eliminar']) && isset($_GET['grado_academico_id']) && is_numeric($_GET['grado_academico_id']) )
  {
       
      $grado_academico= new Grado_academico($_GET['grado_academico_id']);
      $grado_academico->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>