<?php
try {
 define ("MODULO", "Nivel Formación");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Nivel_formacion');
   
if(isset($_GET['nivel_formacion_id']) && is_numeric($_GET['nivel_formacion_id']) )
  {
       
      $nivel_formacion= new Nivel_formacion($_GET['nivel_formacion_id']);
      $nivel_formacion->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>