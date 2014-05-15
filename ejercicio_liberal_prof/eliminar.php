<?php
try {
   define ("MODULO", "Ejercicio liberal profesion");
  require('../_start.php');
  if(!isUserSession())
   header("Location: index.php"); 


    leerClase('Ejercicio_liberal_prof');
   
if(isset($_GET['ejercicio_liberal_prof_id']) && is_numeric($_GET['ejercicio_liberal_prof_id']) )
  {
       
      $ejercicio_liberal_prof= new Ejercicio_liberal_prof($_GET['ejercicio_liberal_prof_id']);
      $ejercicio_liberal_prof->delete();
     
  }
   
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>