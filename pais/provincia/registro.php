<?php
try {
    define ("MODULO", "Pais");
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

  leerClase('Provincia');
  leerClase("Departamento");
  leerClase("Pais");
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['provincia_id']) && is_numeric($_GET['provincia_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['provincia_id'];
  }
  
  $provincia    = new Provincia($id);
 
$iddepartamento='';
  if(isset($_GET['departamento_id']) && is_numeric($_GET['departamento_id']))
  {
      $iddepartamento= $_GET['departamento_id'];
      
  }
  
 $departamneto= new Departamento($iddepartamento);
 $pais= new Pais($departamneto->pais_id);
 
  
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $provincia->objBuidFromPost();
    $provincia->estado           = Objectbase::STATUS_AC;
    $provincia->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php?departamento_id=$provincia->departamento_id";
     header($ir);
      exit();
    }

  $smarty->assign("provincia", $provincia);
  $smarty->assign("departamento", $departamneto);
  $smarty->assign("pais", $pais);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'provincia/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>