<?php
try {
  define ("MODULO", "Dominio Idioma");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Dominio_idioma');
   
if(isset($_GET['eliminar']) && isset($_GET['dominio_idioma_id']) && is_numeric($_GET['dominio_idioma_id']) )
  {
       
      $dominio_idioma= new Dominio_idioma($_GET['dominio_idioma_id']);
      $dominio_idioma->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>