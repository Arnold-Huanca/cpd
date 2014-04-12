<?php
try {
  define ("MODULO", "Producción");
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

  leerClase('Produccion');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['produccion_id']) && is_numeric($_GET['produccion_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['produccion_id'];
  }
  
  $produccion    = new Produccion($id);
  
      // combo box subarea
  leerClase('Subarea');
  $subarea    = new Subarea();
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
        // combo box ambito
  leerClase('Ambito');
  $ambito    = new Ambito();
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
 
        // combo box medio_difunsion
  leerClase('Medio_difunsion');
  $medio_difunsion    = new Medio_difunsion();
  $medio_difunsiones   = $medio_difunsion->getAll();  ///retorna todas las clases
  $medio_difunsiones_values[] = '';
  $medio_difunsiones_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($medio_difunsiones[0])) 
  {
    $medio_difunsiones_values[] = $row['id'];
    $medio_difunsiones_output[] = $row['sigla'];
  }
  $smarty->assign("medio_difunsiones_values", $medio_difunsiones_values);
  $smarty->assign("medio_difunsiones_output", $medio_difunsiones_output);
  
          // combo box tipo_produccion
  leerClase('Tipo_produccion');
  $tipo_produccion    = new Tipo_produccion();
  $tipo_producciones   = $tipo_produccion->getAll();  ///retorna todas las clases
  $tipo_producciones_values[] = '';
  $tipo_producciones_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($tipo_producciones[0])) 
  {
    $tipo_producciones_values[] = $row['id'];
    $tipo_producciones_output[] = $row['sigla'];
  }
  $smarty->assign("tipo_producciones_values", $tipo_producciones_values);
  $smarty->assign("tipo_producciones_output", $tipo_producciones_output);
  
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $produccion->objBuidFromPost();
    $produccion->estado           = Objectbase::estado_pendiente;
     $produccion->funcionario_id   =  getSessionUser()->getFuncionario()->id;
    
    $produccion->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("produccion", $produccion);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'produccion/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>