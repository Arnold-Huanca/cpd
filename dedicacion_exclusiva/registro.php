<?php
try {
  define ("MODULO", "Dedicación Exclusiva");
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

  leerClase('Dedicacion_exclusiva');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['dedicacion_exclusiva_id']) && is_numeric($_GET['dedicacion_exclusiva_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['dedicacion_exclusiva_id'];
  }
  
  $dedicacion_exclusiva    = new Dedicacion_exclusiva($id);
  
  //combo box tipo_gestion
  leerClase('Tipo_gestion');
  $tipo_gestion    = new Tipo_gestion();
  $tipo_gestiones   = $tipo_gestion->getAll();  ///retorna todas las clases
  $tipo_gestiones_values[] = '';
  $tipo_gestiones_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($tipo_gestiones[0])) 
  {
    $tipo_gestiones_values[] = $row['id'];
    $tipo_gestiones_output[] = $row['sigla'];
  }
  $smarty->assign("tipo_gestiones_values", $tipo_gestiones_values);
  $smarty->assign("tipo_gestiones_output", $tipo_gestiones_output);
  
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
    $dedicacion_exclusiva->objBuidFromPost();
    $dedicacion_exclusiva->estado           = Objectbase::STATUS_AC;
    $dedicacion_exclusiva->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("dedicacion_exclusiva", $dedicacion_exclusiva);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'dedicacion_exclusiva/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>