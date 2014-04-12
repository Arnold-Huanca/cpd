<?php
try {
  define ("MODULO", "Tipo Participación");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 


    leerClase('Tipo_participacion');
   
if(isset($_GET['tipo_participacion_id']) && is_numeric($_GET['tipo_participacion_id']) )
  {
       
      $tipo_participacion= new Tipo_participacion($_GET['tipo_participacion_id']);
      $tipo_participacion->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>