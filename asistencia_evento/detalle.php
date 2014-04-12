<?php
try {
define ("MODULO", "Asistencia Evento");
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
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

$ERROR = ''; 

  leerClase('Asistencia_evento');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['asistencia_evento_id']) && is_numeric($_GET['asistencia_evento_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['asistencia_evento_id'];
  }
  echo $id;
  $asistencia_evento    = new Asistencia_evento($id);
  //echo "este es la variable  ".var_dump($id);
 //var_dump($asistencia_evento);
  // combo box tipo_evento
  leerClase('Tipo_evento');
  $tipo_evento   = new Tipo_evento();
  $tipo_eventos   = $tipo_evento->getAll();  ///retorna todas las clases
  $tipo_eventos_values[] = '';
  $tipo_eventos_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($tipo_eventos[0])) 
  {
    $tipo_eventos_values[] = $row['id'];
    $tipo_eventos_output[] = $row['sigla'];
  }
  $smarty->assign("tipo_eventos_values", $tipo_eventos_values);
  $smarty->assign("tipo_eventos_output", $tipo_eventos_output);
  
  
  // combo box tipo_certificado
  leerClase('Tipo_certificado');
  $tipo_certificado   = new Tipo_certificado();
  $tipo_certificados   = $tipo_certificado->getAll();  ///retorna todas las clases
  $tipo_certificados_values[] = '';
  $tipo_certificados_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($tipo_certificados[0])) 
  {
    $tipo_certificados_values[] = $row['id'];
    $tipo_certificados_output[] = $row['sigla'];
  }
  $smarty->assign("tipo_certificados_values", $tipo_certificados_values);
  $smarty->assign("tipo_certificados_output", $tipo_certificados_output);
  
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
  
  // combo box pais
  leerClase('Pais');
  $pais   = new Pais();
  $paises   = $pais->getAll();  ///retorna todas las clases
  $paises_values[] = '';
  $paises_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($paises[0])) 
  {
    $paises_values[] = $row['id'];
    $paises_output[] = $row['nombre_pais'];
  }
  $smarty->assign("paises_values", $paises_values);
  $smarty->assign("paises_output", $paises_output);
  
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
  
  
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $asistencia_evento->objBuidFromPost();
    $asistencia_evento->estado           = Objectbase::STATUS_AC;
    $asistencia_evento->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }
  

  $smarty->assign("asistencia_evento", $asistencia_evento);
  $smarty->assign("ERROR",$ERROR);

   
} catch (Exception $e) {
    //echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'asistencia_evento/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>