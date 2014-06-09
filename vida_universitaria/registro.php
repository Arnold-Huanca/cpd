<?php
try {
 define ("MODULO", "Vida Universitaria");
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

  leerClase('Vida_universitaria');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['vida_universitaria_id']) && is_numeric($_GET['vida_universitaria_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['vida_universitaria_id'];
  }
   $vida_universitaria   = new Vida_universitaria($id);
  
      // combo box funcionario
  leerClase('Funcionario');
  $funcionario  = new Funcionario();
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
       
// combo box instancia_universitaria
  leerClase('Instancia_universitaria');
  $instancia_universitaria  = new Instancia_universitaria();
  $instancia_universitarias   = $instancia_universitaria->getAll();  ///retorna todas las clases
  $instancia_universitarias_values[] = '';
  $instancia_universitarias_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($instancia_universitarias[0])) 
  {
    $instancia_universitarias_values[] = $row['id'];
    $instancia_universitarias_output[] = $row['sigla'];
  }
  $smarty->assign("instancia_universitarias_values", $instancia_universitarias_values);
  $smarty->assign("instancia_universitarias_output", $instancia_universitarias_output);
  
  // combo box universidad
  leerClase('Universidad');
  $universidad  = new Universidad();
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
  
    // combo box unidad tiempo
  leerClase('Unidad_tiempo');
  $unidad_tiempo  = new Unidad_tiempo();
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
  
   // combo box tipo_participacion
   leerClase('Tipo_participacion');
  $tipo_participacion  = new Tipo_participacion();
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
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $vida_universitaria->objBuidFromPost();
    $vida_universitaria->estado           = Objectbase::estado_pendiente;
    $vida_universitaria->funcionario_id   =  getSessionUser()->getFuncionario()->id;
  
    $vida_universitaria->save();
    
    
    mysql_query("COMMIT");
    $ir = "Location: index.php";
    header($ir);
     exit();
    }

  $smarty->assign("vida_universitaria", $vida_universitaria);   
  $smarty->assign("ERROR",$ERROR);
  
} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'vida_universitaria/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>