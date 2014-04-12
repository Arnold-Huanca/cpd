<?php
try {
 define ("MODULO", "Documento Titularidad");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Documento_titularidad');
   
if(isset($_GET['documento_titularidad_id']) && is_numeric($_GET['documento_titularidad_id']) )
  {
       
      $documento_titularidad= new Documento_titularidad($_GET['documento_titularidad_id']);
      $documento_titularidad->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>