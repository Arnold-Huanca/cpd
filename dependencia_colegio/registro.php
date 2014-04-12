<?php
try {
  require('../_start.php');
 // if(!isUserSession())
   // header("Location: ../index.php");  

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
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

$ERROR = ''; 

  leerClase('Dependencia_colegio');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['dependencia_colegio_id']) && is_numeric($_GET['dependencia_colegio_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['dependencia_colegio_id'];
  }
  
  $dependencia_colegio    = new Dependencia_colegio($id);
 
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $dependencia_colegio->objBuidFromPost();
    $dependencia_colegio->estado           = Objectbase::STATUS_AC;
    $dependencia_colegio->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("dependencia_colegio", $dependencia_colegio);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'dependencia_colegio/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>