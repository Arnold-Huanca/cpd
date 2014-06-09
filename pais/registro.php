<?php
try {
    require('../_start.php');
  define ("MODULO", "Pais");
  
  if(!isUserSession())
    header("Location: ../index.php"); 
  /** HEADER */
  $smarty->assign('title', '');
  $smarty->assign('description', '');
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
     $JS[]  = URL_JS . "validator.min.js";
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

$ERROR = ''; 

  leerClase('Pais');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['pais_id']) && is_numeric($_GET['pais_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['pais_id'];
  }
  
  $pais    = new Pais($id);
 
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $pais->objBuidFromPost();
    $pais->estado           = Objectbase::STATUS_AC;
    $pais->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("pais", $pais);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'pais/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>