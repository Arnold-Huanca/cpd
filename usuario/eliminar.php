<?php
try {
 define ("MODULO", "Usuario");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 


    leerClase('Usuario');
 //  $cliente_id=$_GET['id'];
if(isset($_GET['id']) && is_numeric($_GET['id']) )
  {
       
      $usuario= new Usuario($_GET['id']);
      $usuario->delete();
     
  }
   
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>