<?php
try {
  define ("MODULO", "Tipo Producción");
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
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

$ERROR = ''; 

  leerClase('Tipo_produccion');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['tipo_produccion_id']) && is_numeric($_GET['tipo_produccion_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['tipo_produccion_id'];
  }
  $tipo_produccion    = new Tipo_produccion($id);
  
  echo "esto es un mensaje .......".$id."!!!!!!!!!!!!";
  var_dump($id);
  
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $tipo_produccion->objBuidFromPost();
    $tipo_produccion->estado         = Objectbase::STATUS_AC;
    $tipo_produccion->save();
    
    //var_dump($tipo_produccion);
    mysql_query("COMMIT");
    
    //$ir = "Location: index.php";
    //header($ir);
    //exit();
    }

  $smarty->assign("tipo_produccion",$tipo_produccion);
    
  $smarty->assign("ERROR",$ERROR);
  var_dump($tipo_produccion);  //  es pa
} catch (Exception $e) {
  echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'tipo_produccion/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>