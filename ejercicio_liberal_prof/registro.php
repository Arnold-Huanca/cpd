<?php
try {
      define ("MODULO", "Ejercicio liberal profesion");
  require('../_start.php');
 if(!isUserSession())
   header("Location: index.php");  

  /** HEADER */
  $smarty->assign('title', 'Registro de Usuario');
  $smarty->assign('description', 'P&aacute;gina de Registro de Usuario');
   /**
   * Menu superior
   */
  
    
  //CSS
  $CSS[]  = URL_CSS . "style.css";
  $CSS[]  = URL_CSS . "style.responsive.css";
   $CSS[]  = URL_CSS . "styleform.css";
    
  //$CSS[]  = URL_CSS . "pg.css";
 // $smarty->assign('CSS',$CSS);

  
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
    $JS[]  = URL_JS . "validator.min.js";
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);

$ERROR = ''; 

  leerClase('Ejercicio_liberal_prof');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['ejercicio_liberal_prof_id']) && is_numeric($_GET['ejercicio_liberal_prof_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['ejercicio_liberal_prof_id'];
  }
  
  $ejercicio_liberal_prof   = new Ejercicio_liberal_prof($id);
 
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $ejercicio_liberal_prof->objBuidFromPost();
    $ejercicio_liberal_prof->estado           = Objectbase::STATUS_AC;
    $ejercicio_liberal_prof->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("ejercicio_liberal_prof", $ejercicio_liberal_prof);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'ejercicio_liberal_prof/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>