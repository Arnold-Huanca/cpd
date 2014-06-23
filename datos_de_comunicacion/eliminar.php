<?php
try {
  define ("MODULO", "Datos de Comunicacion");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Datos_Comunicacion');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $dominio_idioma= new Datos_Comunicacion($_GET['id']);
      $dominio_idioma->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>