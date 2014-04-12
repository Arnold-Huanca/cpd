<?php
try {
 define ("MODULO", "Membresia");
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

  leerClase('Membresia');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['membresia_id']) && is_numeric($_GET['membresia_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['membresia_id'];
  }
  
  $membresia    = new Membresia($id);
  
    // combo box tipo_organizacion
  leerClase('Tipo_organizacion');
  $tipo_organizacion    = new Tipo_organizacion();
  $tipo_organizaciones   = $tipo_organizacion->getAll();  ///retorna todas las clases
  $tipo_organizaciones_values[] = '';
  $tipo_organizaciones_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($tipo_organizaciones[0])) 
  {
    $tipo_organizaciones_values[] = $row['id'];
    $tipo_organizaciones_output[] = $row['descripcion'];
  }
  $smarty->assign("tipo_organizaciones_values", $tipo_organizaciones_values);
  $smarty->assign("tipo_organizaciones_output", $tipo_organizaciones_output);
  
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $membresia->objBuidFromPost();
    $membresia->estado           = Objectbase::estado_pendiente;
    $membresia->funcionario_id   =  getSessionUser()->getFuncionario()->id;
    $membresia->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("membresia", $membresia);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'membresia/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>