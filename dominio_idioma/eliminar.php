<?php
try {
  define ("MODULO", "Dominio Idioma");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Dominio_idioma');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $dominio_idioma= new Dominio_idioma($_GET['id']);
      $dominio_idioma->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>