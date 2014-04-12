<?php
try {
  define ("MODULO", "Vivienda");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Vivienda');
   
if(isset($_GET['vivienda_id']) && is_numeric($_GET['vivienda_id']) )
  {
       
      $vivienda= new Vivienda($_GET['vivienda_id']);
      $vivienda->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>