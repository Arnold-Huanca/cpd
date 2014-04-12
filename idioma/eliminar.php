<?php
try {
define ("MODULO", "Idioma");
  require('../_start.php');
if(!isUserSession())
 header("Location: index.php"); 


    leerClase('Idioma');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $idioma= new Idioma($_GET['id']);
      $idioma->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>