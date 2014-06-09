<?php
try {
  define ("MODULO", "Grado Academico");
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

  leerClase('Grado_academico');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['grado_academico_id']) && is_numeric($_GET['grado_academico_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['grado_academico_id'];
  }
  
  $grado_academico    = new Grado_academico($id);
  
  //combo box
  
  
  leerClase('Nivel_formacion');
  $nivel_formacion    = new Nivel_formacion();
  $nivel_formacions   = $nivel_formacion->getAll();  ///retorna todas las clases
  $nivel_formacion_values[] = '';
  $nivel_formacion_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($nivel_formacions[0])) 
  {
    $nivel_formacion_values[] = $row['id'];
    $nivel_formacion_output[] = $row['nombre_nivel_formacion'];
  }
  $smarty->assign("nivel_formacion_values", $nivel_formacion_values);
  $smarty->assign("nivel_formacion_output", $nivel_formacion_output);
 
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $grado_academico->objBuidFromPost();
    $grado_academico->estado           = Objectbase::STATUS_AC;
    $grado_academico->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("grado_academico", $grado_academico);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'grado_academico/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>