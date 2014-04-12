<?php
try {
 define ("MODULO", "Grupo");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Grupo');
   
if(isset($_GET['eliminar']) && isset($_GET['grupo_id']) && is_numeric($_GET['grupo_id']) )
  {
       
      $grupo= new Grupo($_GET['grupo_id']);
      $grupo->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>