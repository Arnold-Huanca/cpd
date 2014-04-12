<?php
try {
 define ("MODULO", "Solicitante");
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
   leerClase("Funcionario");
   leerClase("Universidad");
    leerClase("Unidad_tiempo");
	 leerClase("Grado_academico");
	  leerClase("Subarea");
	   leerClase("Pais");
	   
  $menuizquierda = new Menu('');
  
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());
  
$ERROR = ''; 

  leerClase('Formacion_pregrado');
  $id     = '';

  $editar = FALSE;
  if ( isset($_GET['formacion_pregrado_id']) && is_numeric($_GET['formacion_pregrado_id']))
  {
    $editar = TRUE;
    $id     = $_GET['formacion_pregrado_id'];
  }
  
 // echo  "holas".$id;

 
  $formacion_pregrado   = new Formacion_pregrado($id);
  //var_dump($formacion_pregrado);
   $funcionario= new Funcionario($formacion_pregrado->funcionario_id);
  $universidad= new Universidad($formacion_pregrado->universidad_id);
  $unidad_tiempo= new Unidad_tiempo($formacion_pregrado->unidad_tiempo_id);
  $grado_academico= new  Grado_academico($formacion_pregrado->grado_academico_id);
  $subarea  = new Subarea($formacion_pregrado->subarea_id);
  $pasis = new Pais($formacion_pregrado->pais_id);
  
  $smarty->assign("funcionario",$funcionario);
  $smarty->assign("universidad",$universidad);
  $smarty->assign("unidad_tiempo",$unidad_tiempo);
  $smarty->assign("grado_academico",$grado_academico);
  $smarty->assign("subarea",$subarea);
  $smarty->assign("pais",$pasis);
  
  
  
  
  
 
  
 //echo $usuario->nombre;
  $menus='';
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
	$menus="mostrar";
    mysql_query("BEGIN");
    $formacion_pregrados= new Formacion_pregrado($_POST['formacion_pregrado_id']);
    $formacion_pregrados->estado=$_POST['valora'];
    $formacion_pregrados->fecha_visado= date();
    $formacion_pregrados->observacion= $_POST['observacion']; 
    $formacion_pregrados->save();
    mysql_query("COMMIT");
    $ir = "Location: formacion_pregrado.php?menus=mostrar&funcionario_id=$formacion_pregrados->funcionario_id";
     header($ir);
     exit();
    }
  $smarty->assign("menus", $menus);
  $smarty->assign("formacion_pregrado", $formacion_pregrado);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'solicitante/formacion_pregrado_detalle.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>