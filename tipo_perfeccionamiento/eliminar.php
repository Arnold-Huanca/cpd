<?php
try {
 define ("MODULO", "Tipo Perfeccionamiento");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 


    leerClase('Tipo_perfeccionamiento');
   
if(isset($_GET['eliminar']) && isset($_GET['tipo_perfeccionamiento_id']) && is_numeric($_GET['tipo_perfeccionamiento_id']) )
  {
       
      $tipo_perfeccionamiento= new Tipo_perfeccionamiento($_GET['tipo_perfeccionamiento_id']);
      $tipo_perfeccionamiento->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>