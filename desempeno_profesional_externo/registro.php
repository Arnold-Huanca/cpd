<?php
try {
     define ("MODULO", "Desempeño Profesional Externo");
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
         //Datepicker UI
    
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

$ERROR = ''; 

  leerClase('Desemp_prof_externo');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['desemp_prof_externo_id']) && is_numeric($_GET['desemp_prof_externo_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['desemp_prof_externo_id'];
  }
  
  $desemp_prof_externo    = new Desemp_prof_externo($id);
 
  
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

  
  
  $nivel_values[] = '';
  $nivel_output[] = '- Seleccione -';
  
    $nivel_values[] = 'Ejecutivo';
    $nivel_output[] = 'Ejecutivo';
    $nivel_values[] = 'Operativo';
    $nivel_output[] = 'Operativo';
 
  $smarty->assign("nivel_values", $nivel_values);
  $smarty->assign("nivel_output", $nivel_output);
  
  
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
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $desemp_prof_externo->objBuidFromPost();
     $desemp_prof_externo->estado           = Objectbase::estado_pendiente;
   $desemp_prof_externo->funcionario_id   =  getSessionUser()->getFuncionario()->id;
     $desemp_prof_externo->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("desemp_prof_externo", $desemp_prof_externo);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'desemp_prof_externo/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>