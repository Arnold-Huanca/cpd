<?php
try {
  define ("MODULO", "Area");
  require('../../_start.php');
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

  leerClase('Subarea');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['subarea_id']) && is_numeric($_GET['subarea_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['subarea_id'];
  }
  
  $subarea    = new Subarea($id);
  
  //combo box subarea
  leerClase('Area');
  $area    = new Area();
  $areas    = $area->getAll();  ///retorna todas las clases
  $areas_values[] = '';
  $areas_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($areas[0])) 
  {
    $areas_values[] = $row['id'];
    $areas_output[] = $row['nombre_area'];
  }
  $smarty->assign("areas_values", $areas_values);
  $smarty->assign("areas_output", $areas_output);
 
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $subarea->objBuidFromPost();
    $subarea->estado           = Objectbase::STATUS_AC;
    $subarea->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("subarea", $subarea);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'subarea/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>