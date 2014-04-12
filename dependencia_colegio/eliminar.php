<?php
try {
 //   define ("MODULO", "CONSEJO");
  require('../_start.php');
 // if(!isUserSession())
  //  header("Location: login.php"); 


    leerClase('Dependencia_colegio');
   
if(isset($_GET['dependencia_colegio_id']) && is_numeric($_GET['dependencia_colegio_id']) )
  {
       
      $dependencia_colegio = new Dependencia_colegio($_GET['dependencia_colegio_id']);
      $dependencia_colegio->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>