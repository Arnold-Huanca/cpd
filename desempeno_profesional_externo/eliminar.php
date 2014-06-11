<?php
try {
 define ("MODULO", "Desempeño Profesional Externo");
  require('../_start.php');
  if(!isUserSession())
 header("Location: index.php"); 


    leerClase('Desemp_prof_externo');
   
if(isset($_GET['desemp_prof_externo_id']) && is_numeric($_GET['desemp_prof_externo_id']) )
  {
       
      $desemp_prof_externo= new Desemp_prof_externo($_GET['desemp_prof_externo_id']);
      $desemp_prof_externo->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>