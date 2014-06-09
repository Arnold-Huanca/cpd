<?php
try {
     define ("MODULO", "Pais");
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

  leerClase('Municipio');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['municipio_id']) && is_numeric($_GET['municipio_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['municipio_id'];
  }
  

  
  
  $municipio    = new Municipio($id);
  
    // combo box provincia
  leerClase('Provincia');
  $provincia   = new Provincia();
  $provincias   = $provincia->getAll();  ///retorna todas las clases
  $provincias_values[] = '';
  $provincias_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($provincias[0])) 
  {
    $provincias_values[] = $row['id'];
    $provincias_output[] = $row['nombre_provincia'];
  }
  $smarty->assign("provincias_values", $provincias_values);
  $smarty->assign("provincias_output", $provincias_output);
 
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $municipio->objBuidFromPost();
    $municipio->estado           = Objectbase::STATUS_AC;
    $municipio->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("municipio", $municipio);
    
  $smarty->assign("ERROR",$ERROR);
  

  

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'municipio/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>