<?php
try {
   define ("MODULO", "Area Colegio");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Area_colegio');
   
if(isset($_GET['area_colegio_id']) && is_numeric($_GET['area_colegio_id']) )
  {
      $area_colegio= new Area_colegio($_GET['area_colegio_id']);
      $area_colegio->delete();

  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>