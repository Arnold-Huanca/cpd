<?php
try {
  define ("MODULO", "Distinción");
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

  leerClase('Distincion');
  $id     = '';
  $editar = FALSE;
  $ver='';
  if ( isset($_GET['id']) && is_numeric($_GET['id']) )
  {
    $editar = TRUE;
    $id     = $_GET['id'];
  }
  
  $distincion    = new Distincion($id);
 
  
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
  
        //combo box universidad
  leerClase('Universidad');
  $universidad    = new Universidad();
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
  
          //combo box tipo_distincion
  leerClase('Tipo_distincion');
  $tipo_distincion   = new Tipo_distincion();
  $tipo_distinciones   = $tipo_distincion->getAll();  ///retorna todas las clases
  $tipo_distinciones_values[] = '';
  $tipo_distinciones_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($tipo_distinciones[0])) 
  {
    $tipo_distinciones_values[] = $row['id'];
    $tipo_distinciones_output[] = $row['sigla'];
  }
  $smarty->assign("tipo_distinciones_values", $tipo_distinciones_values);
  $smarty->assign("tipo_distinciones_output", $tipo_distinciones_output);
 
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $distincion->objBuidFromPost();
    $distincion->estado           = Objectbase::estado_pendiente;
    $distincion->funcionario_id=  getSessionUser()->getFuncionario()->id;
    $distincion->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("ver",$ver);
  $smarty->assign("distincion", $distincion);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'distincion/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>