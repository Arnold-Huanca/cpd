<?php
try {
  define ("MODULO", "Evento");
  require('../_start.php');
  if(!isUserSession())
  header("Location: ../index.php"); 

  leerClase('Evento');
 
  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','');
  $smarty->assign('description','');
  $smarty->assign('keywords','');
  
  
 
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
    
    $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
         
  
 $CSS[]  = URL_CSS . "tables.css";
    
  $CSS[]  = URL_CSS . "demo_table.css";
  $CSS[]  = URL_CSS . "style_table.css";
  
   $JS[]  =URL_JS . 'table/jquery.dataTables.js';
 
  $smarty->assign('CSS',$CSS);

  $smarty->assign('JS',$JS);
  
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

 
$ERROR = ''; 

  leerClase('Evento');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['evento_id']) && is_numeric($_GET['evento_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['evento_id'];
  }
  
  $evento    = new Evento($id);
  
  // combo box tipo_evento
  leerClase('Tipo_evento');
  $tipo_evento   = new Tipo_evento();
  $tipo_eventos   = $tipo_evento->getAll();  ///retorna todas las clases
  $tipo_eventos_values[] = '';
  $tipo_eventos_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($tipo_eventos[0])) 
  {
    $tipo_eventos_values[] = $row['id'];
    $tipo_eventos_output[] = $row['descripcion'];
  }
  $smarty->assign("tipo_eventos_values", $tipo_eventos_values);
  $smarty->assign("tipo_eventos_output", $tipo_eventos_output);
  
  
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

  
//combo box pais
  leerClase('Pais');
  $pais    = new Pais();
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

// combo box tipo_participacion
  leerClase('Tipo_participacion');
  $tipo_participacion   = new Tipo_participacion();
  $tipo_participaciones   = $tipo_participacion->getAll();  ///retorna todas las clases
  $tipo_participaciones_values[] = '';
  $tipo_participaciones_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($tipo_participaciones[0])) 
  {
    $tipo_participaciones_values[] = $row['id'];
    $tipo_participaciones_output[] = $row['descripcion'];
  }
  $smarty->assign("tipo_participaciones_values", $tipo_participaciones_values);
  $smarty->assign("tipo_participaciones_output", $tipo_participaciones_output);
  
  
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $evento->objBuidFromPost();
    $evento->estado           = Objectbase::estado_pendiente;
    $evento->funcionario_id=  getSessionUser()->getFuncionario()->id;
    $evento->save();
    mysql_query("COMMIT");
   // $ir = "Location: index.php";
   // header($ir);
   //   exit();
    }

  $smarty->assign("evento", $evento);
    
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
      echo $e;
 mysql_query("ROLLBACK");
  $smarty->assign("ERROR", handleError($e));
}


$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);
$smarty->display('evento/gestion.tpl');
?>