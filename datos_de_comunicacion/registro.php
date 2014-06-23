<?php
try {
   define ("MODULO", "Datos de Comunicacion");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php");  

  /** HEADER */
  $smarty->assign('title', 'Registro de Comunicacion');
  $smarty->assign('description', 'P&aacute;gina de Registro de domino idioma');
   /**
   * Menu superior
   */
  
    
  //CSS
  $CSS[]  = URL_CSS . "style.css";
  $CSS[]  = URL_CSS . "style.responsive.css";
   $CSS[]  = URL_CSS . "styleform.css";
 $CSS[]  = URL_CSS . "style.default.css";   
  //$CSS[]  = URL_CSS . "pg.css";
 // $smarty->assign('CSS',$CSS);

  
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
    $JS[]  = URL_JS . "validator.min.js";
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

$ERROR = ''; 

  leerClase('Datos_Comunicacion');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['datos_de_comunicacion']) && is_numeric($_GET['datos_de_comunicacion']) )
  {
    $editar = TRUE;
    $id     = $_GET['datos_de_comunicacion'];
  }
  
  $datos_de_comunicacion   = new Datos_Comunicacion($id);
  
      // combo box idioma
  
 
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $datos_de_comunicacion->objBuidFromPost();
    $datos_de_comunicacion->estado           = Objectbase::estado_pendiente;
    $datos_de_comunicacion->funcionario_id=  getSessionUser()->getFuncionario()->id;
    $datos_de_comunicacion->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("datos_de_comunicacion", $datos_de_comunicacion);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'datos_de_comunicacion/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>