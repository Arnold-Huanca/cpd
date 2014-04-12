<?php
try {
   define ("MODULO", "Tipo Certificado");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php");  


    leerClase('Tipo_certificado');
   
if( isset($_GET['tipo_certificado_id']) && is_numeric($_GET['tipo_certificado_id']) )
  {
       
      $tipo_certificado= new Tipo_certificado($_GET['tipo_certificado_id']);
      $tipo_certificado->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>