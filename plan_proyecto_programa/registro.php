<?php
try {
 define ("MODULO", "Plan Proyecto Programa");
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

  leerClase('Plan_proyecto_programa');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['plan_proyecto_programa_id']) && is_numeric($_GET['plan_proyecto_programa_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['plan_proyecto_programa_id'];
  }
  
  $plan_proyecto_programa    = new Plan_proyecto_programa($id);
  
  // combo box tipo_participacion
  leerClase('Tipo_participacion');
  $tipo_participacion   = new Tipo_participacion();
  $tipo_participaciones   = $tipo_participacion->getAll();  ///retorna todas las clases
  $tipo_participaciones_values[] = '';
  $tipo_participaciones_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($tipo_participaciones[0])) 
  {
    $tipo_participaciones_values[] = $row['id'];
    $tipo_participaciones_output[] = $row['sigla'];
  }
  $smarty->assign("tipo_participaciones_values", $tipo_participaciones_values);
  $smarty->assign("tipo_participaciones_output", $tipo_participaciones_output);
  
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
  
  // combo box unidad_tiempo
  leerClase('Unidad_tiempo');
  $unidad_tiempo   = new Unidad_tiempo();
  $unidad_tiempos   = $unidad_tiempo->getAll();  ///retorna todas las clases
  $unidad_tiempos_values[] = '';
  $unidad_tiempos_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($unidad_tiempos[0])) 
  {
    $unidad_tiempos_values[] = $row['id'];
    $unidad_tiempos_output[] = $row['nombre_unidad_tiempo'];
  }
  $smarty->assign("unidad_tiempos_values", $unidad_tiempos_values);
  $smarty->assign("unidad_tiempos_output", $unidad_tiempos_output);
  
  // combo box universidad
  leerClase('Universidad');
  $universidad   = new Universidad();
  $universidades   = $universidad->getAll();  ///retorna todas las clases
  $universidades_values[] = '';
  $universidades_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($universidades[0])) 
  {
    $universidades_values[] = $row['id'];
    $universidades_output[] = $row['nombre_uni'];
  }
  $smarty->assign("universidades_values", $universidades_values);
  $smarty->assign("universidades_output", $universidades_output);
  
  // combo box ambito
  leerClase('Ambito');
  $ambito   = new Ambito();
  $ambitos   = $ambito->getAll();  ///retorna todas las clases
  $ambitos_values[] = '';
  $ambitos_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($ambitos[0])) 
  {
    $ambitos_values[] = $row['id'];
    $ambitos_output[] = $row['nombre_ambito'];
  }
  $smarty->assign("ambitos_values", $ambitos_values);
  $smarty->assign("ambitos_output", $ambitos_output);
  
  // combo box subarea
  leerClase('Subarea');
  $subarea   = new Subarea();
  $subareas   = $subarea->getAll();  ///retorna todas las clases
  $subareas_values[] = '';
  $subareas_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($subareas[0])) 
  {
    $subareas_values[] = $row['id'];
    $subareas_output[] = $row['nombre_subarea'];
  }
  $smarty->assign("subareas_values", $subareas_values);
  $smarty->assign("subareas_output", $subareas_output);
  
  
 
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $plan_proyecto_programa->objBuidFromPost();
    $plan_proyecto_programa->estado           = Objectbase::STATUS_AC;
    $plan_proyecto_programa->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("plan_proyecto_programa", $plan_proyecto_programa);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'plan_proyecto_programa/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>