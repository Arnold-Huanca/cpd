<?php
try {
      define ("MODULO", "Solicitante");
  require('../_start.php');
 if(!isUserSession())
   header("Location: index.php");  

  /** HEADER */
  $smarty->assign('title', 'Registro de Usuario');
  $smarty->assign('description', 'P&aacute;gina de Registro de Usuario');
  
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
   
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);

  $ERROR = ''; 
  
  leerClase("Menu");

  leerClase('Ejercicio_liberal_prof');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['ejercicio_liberal_prof_id']) && is_numeric($_GET['ejercicio_liberal_prof_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['ejercicio_liberal_prof_id'];
  }
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $ejercicio_liberal_prof   = new Ejercicio_liberal_prof($id);
   $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());
  leerClase('Funcionario');
 
  $menus='';
  
  if ( isset($_GET['menus']) && $_GET['menus']== "mostrar" && isset($_GET['funcionario_id']) && is_numeric($_GET['funcionario_id']) )
  {
    $menus="mostrar";
  $id     = $_GET['funcionario_id'];
  }
 
 //$datosgenerales= $funcionario->getDatosGenerales();
   $smarty->assign("menus", $menus);
   
   
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
  
  // combo box subarea
  leerClase('Subarea');
  $subarea   = new Subarea();
  $subareas   = $subarea->getAll();  ///retorna todas las clases
  $subarea_values[] = '';
  $subarea_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($subareas[0])) 
  {
    $subarea_values[] = $row['id'];
    $subarea_output[] = $row['nombre_subarea'];
  }
  $smarty->assign("subarea_values", $subarea_values);
  $smarty->assign("subarea_output", $subarea_output);

  
  $tipo_values[] = '';
  $tipo_output[] = '- Seleccione -';
  
    $tipo_values[] = "Asesor";
    $tipo_output[] =  "Asesor";
    $tipo_values[] = "Consultor";
    $tipo_output[] =  "Consultor";
    $tipo_values[] = "Otro";
    $tipo_output[] =  "Otro";
    
    $smarty->assign("tipo_values", $tipo_values);
  $smarty->assign("tipo_output", $tipo_output);

  
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

  
   $funcionario= new Funcionario( $ejercicio_liberal_prof->funcionario_id);
  
  $smarty->assign("funcionario",$funcionario);
  
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $ejercicio_liberal_prof->objBuidFromPost();
        $ejercicio_liberal_prof->save();
   
        mysql_query("COMMIT");
   $ir = "Location: ejercicio_liberal.php?menus=mostrar&funcionario_id=$ejercicio_liberal_prof->funcionario_id";
     header($ir);
      exit();
    }

  $smarty->assign("ejercicio_liberal_prof", $ejercicio_liberal_prof);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'solicitante/ejercicio_liberal_detalle.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>