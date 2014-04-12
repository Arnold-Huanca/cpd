<?php
try {
  define ("MODULO", "Facultad");
  require('../_start.php');
   if(!isUserSession())
   header("Location: index.php"); 


    leerClase('Facultad');
   
if(isset($_GET['eliminar']) && isset($_GET['facultad_id']) && is_numeric($_GET['facultad_id']) )
  {
       
      $facultad= new Facultad($_GET['facultad_id']);
      $facultad->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>