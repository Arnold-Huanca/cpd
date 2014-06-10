<?php
try {
  define ("MODULO", "Datos Personales");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 


    leerClase('Funcionario');
   
if(isset($_GET['funcionario_id']) && is_numeric($_GET['funcionario_id']) )
  {
       
      $funcionario= new Funcionario($_GET['funcionario_id']);
      $funcionario->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>