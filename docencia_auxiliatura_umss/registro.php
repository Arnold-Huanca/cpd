<?php
try {
  define ("MODULO", "Docencia Auxiliatura Umss");
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
$CSS[]  = URL_CSS . "style.default.css";    
  //$CSS[]  = URL_CSS . "pg.css";
 // $smarty->assign('CSS',$CSS);

  
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
    $JS[]  = URL_JS . "validator.min.js";
     $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

$ERROR = ''; 

  leerClase('Docencia_auxiliatura_umss');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['id']) && is_numeric($_GET['id']) )
  {
    $editar = TRUE;
    $id     = $_GET['id'];
  }
  
  $docencia_auxiliatura_umss    = new Docencia_auxiliatura_umss($id);
  
  //combo box tipo_gestion
  leerClase('Tipo_gestion');
  $tipo_gestion    = new Tipo_gestion();
  $tipo_gestiones   = $tipo_gestion->getAll();  ///retorna todas las clases
  $tipo_gestiones_values[] = '';
  $tipo_gestiones_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($tipo_gestiones[0])) 
  {
    $tipo_gestiones_values[] = $row['id'];
    $tipo_gestiones_output[] = $row['descripcion'];
  }
  $smarty->assign("tipo_gestiones_values", $tipo_gestiones_values);
  $smarty->assign("tipo_gestiones_output", $tipo_gestiones_output);
  // combo box subarea
  leerClase('Area');
  $area   = new Area();
  $areas   = $area->getAll();  ///retorna todas las clases
  $area_values[] = '';
  $area_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($areas[0])) 
  {
    $area_values[] = $row['id'];
    $area_output[] = $row['nombre'];
  }
  $smarty->assign("area_values", $area_values);
  $smarty->assign("area_output", $area_output);
   $condicion_values[] = '';
  $condicion_output[] = '- Seleccione -';
  
    $condicion_values[] = 'Docente';
   $condicion_output[] = 'Docente';
     $condicion_values[] = 'Auxiliar';
   $condicion_output[] = 'Auxiliar';
  
  $smarty->assign("condicion_values", $condicion_values);
  $smarty->assign("condicion_output", $condicion_output);
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
  
  // combo box nivel_formacion
  leerClase('Nivel_formacion');
  $nivel_formacion   = new Nivel_formacion();
  $nivel_formaciones   = $nivel_formacion->getAll();  ///retorna todas las clases
  $nivel_formaciones_values[] = '';
  $nivel_formaciones_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($nivel_formaciones[0])) 
  {
    $nivel_formaciones_values[] = $row['id'];
    $nivel_formaciones_output[] = $row['sigla_nivel_formacion'];
  }
  $smarty->assign("nivel_formaciones_values", $nivel_formaciones_values);
  $smarty->assign("nivel_formaciones_output", $nivel_formaciones_output);
  
  
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
  
 
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $docencia_auxiliatura_umss->objBuidFromPost();
    
    $docencia_auxiliatura_umss->estado           = Objectbase::estado_pendiente;
     $docencia_auxiliatura_umss->funcionario_id=  getSessionUser()->getFuncionario()->id;
   $docencia_auxiliatura_umss->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
     exit();
    }

  $smarty->assign("docencia_auxiliatura_umss", $docencia_auxiliatura_umss);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'docencia_auxiliatura_umss/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>