<?php
try {
  define ("MODULO", "Area");
  require('../../_start.php');
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

  leerClase('Subarea');
  leerClase("Area");
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['subarea_id']) && is_numeric($_GET['subarea_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['subarea_id'];
  $subarea   = new Subarea($id);
  $area= new Area($subarea->area_id);
  }
    $idarea    = '';
  
  if ( isset($_GET['area_id']) && is_numeric($_GET['area_id']))
  {
     $idarea =  $_GET['area_id']; 
  $subarea   = new Subarea();
  $area= new Area($idarea);

  }
   
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $subarea->objBuidFromPost();
    $subarea->estado           = Objectbase::STATUS_AC;
    $subarea->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php?area_id=$subarea->area_id";
     header($ir);
      exit();
    }

  $smarty->assign("subarea", $subarea);
  $smarty->assign("area",$area );
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'subarea/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>