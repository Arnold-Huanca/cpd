<?php
try {
 define ("MODULO", "Laboral Umss Actual");
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

  leerClase('Laboral_umss_actual');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['laboral_umss_actual_id']) && is_numeric($_GET['laboral_umss_actual_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['laboral_umss_actual_id'];
  }
  
  $laboral_umss_actual    = new Laboral_umss_actual($id);
  
      //combo box funcionario
  leerClase('Funcionario');
  $funcionario    = new Funcionario();
  $funcionarios   = $funcionario->getAll();  ///retorna todas las clases
  $funcionarios_values[] = '';
  $funcionarios_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($funcionarios[0])) 
  {
    $funcionarios_values[] = $row['id'];
    $funcionarios_output[] = $row['nombre'];
  }
  $smarty->assign("funcionarios_values", $funcionarios_values);
  $smarty->assign("funcionarios_output", $funcionarios_output);
  
        //combo box dedicacion
  leerClase('Dedicacion');
  $dedicacion    = new Dedicacion();
  $dedicaciones   = $dedicacion->getAll();  ///retorna todas las clases
  $dedicaciones_values[] = '';
  $dedicaciones_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($dedicaciones[0])) 
  {
    $dedicaciones_values[] = $row['id'];
    $dedicaciones_output[] = $row['nombre_dedicacion'];
  }
  $smarty->assign("dedicaciones_values", $dedicaciones_values);
  $smarty->assign("dedicaciones_output", $dedicaciones_output);
  
  
 
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $laboral_umss_actual->objBuidFromPost();
    $laboral_umss_actual->estado           = Objectbase::STATUS_AC;
    $laboral_umss_actual->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("laboral_umss_actual", $laboral_umss_actual);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'laboral_umss_actual/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>