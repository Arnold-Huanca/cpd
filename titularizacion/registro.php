<?php
try {
  define ("MODULO", "Titularización");
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

  leerClase('Titularizacion');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['titularizacion_id']) && is_numeric($_GET['titularizacion_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['titularizacion_id'];
  }
  
  $titularizacion    = new Titularizacion($id);
  
    // combo box facultad
  leerClase('Facultad');
  $facultad    = new Facultad();
  $facultades   = $facultad->getAll();  ///retorna todas las clases
  $facultades_values[] = '';
  $facultades_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($facultades[0])) 
  {
    $facultades_values[] = $row['id'];
    $facultades_output[] = $row['nombre'];
  }
  $smarty->assign("facultades_values", $facultades_values);
  $smarty->assign("facultades_output", $facultades_output);
 
      // combo box documento_titularidad
  leerClase('Documento_titularidad');
  $documento_titularidad    = new Documento_titularidad();
  $documento_titularidades   = $documento_titularidad ->getAll();  ///retorna todas las clases
  $documento_titularidades_values[] = '';
  $documento_titularidades_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($documento_titularidades[0])) 
  {
    $documento_titularidades_values[] = $row['id'];
    $documento_titularidades_output[] = $row['nombre_facultad'];
  }
  $smarty->assign("documento_titularidades_values", $documento_titularidades_values);
  $smarty->assign("documento_titularidades_output", $documento_titularidades_output);
  

  
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $titularizacion->objBuidFromPost();
    $titularizacion->estado           = Objectbase::estado_pendiente;
    $titularizacion->funcionario_id   =  getSessionUser()->getFuncionario()->id;
    $titularizacion->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("titularizacion", $titularizacion);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'titularizacion/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>