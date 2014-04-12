<?php
try {
   define ("MODULO", "Pais");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 


    leerClase('Pais');
   
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $pais= new Pais($_GET['id']);
      $pais->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>