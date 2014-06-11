<?php
try {
 define ("MODULO", "Solicitante");
  require('../_start.php');
  if(!isUserSession())
 header("Location: index.php"); 


    leerClase('Desemp_prof_externo');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $desemp_prof_externo= new Desemp_prof_externo($_GET['id']);
      $desemp_prof_externo->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>