<?php
try {
  define ("MODULO", "Tipo Organización");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 


    leerClase('Tipo_organizacion');
   
if(isset($_GET['eliminar']) && isset($_GET['tipo_organizacion_id']) && is_numeric($_GET['tipo_organizacion_id']) )
  {
       
      $tipo_organizacion= new Tipo_organizacion($_GET['tipo_organizacion_id']);
      $tipo_organizacion->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>