<?php
try {
  define ("MODULO", "Solicitante");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 


    leerClase('Perfeccionamiento_profesional');
   
if(isset($_GET['perfeccionamiento_profesional_id']) && is_numeric($_GET['perfeccionamiento_profesional_id']) )
  {
       
      $perfeccionamiento= new Perfeccionamiento_profecional($_GET['perfeccionamiento_profesional_id']);
    //  $perfeccionamiento->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>