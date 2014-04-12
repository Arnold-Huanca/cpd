<?php
try {
 define ("MODULO", "Datos Familiares");
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
    $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
    
  //$CSS[]  = URL_CSS . "pg.css";
 // $smarty->assign('CSS',$CSS);

  
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
          //Datepicker UI
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

$ERROR = ''; 

  leerClase('Datos_familiares');
  $id     = '';
  $editar = FALSE;
  $ver='';
  if ( isset($_GET['id']) && is_numeric($_GET['id']) )
  {
    $editar = TRUE;
    $id     = $_GET['id'];
  }
  
  $datos    = new Datos_familiares($id);
 
  
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
   $datos->objBuidFromPost();
   $datos->estado           = Objectbase::estado_pendiente;
    $datos->funcionario_id=  getSessionUser()->getFuncionario()->id;
   $datos->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("ver",$ver);
  $smarty->assign("datos", $datos);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
        echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'datos_familiares/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>