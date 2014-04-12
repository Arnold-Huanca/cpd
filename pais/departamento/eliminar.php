<?php
try {
   define ("MODULO", "Pais");
  require('../../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 



    leerClase('Departamento');
   
if(isset($_GET['departamento_id']) && is_numeric($_GET['departamento_id']) )
  {
       
      $departamento= new Departamento($_GET['departamento_id']);
      $departamento->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>