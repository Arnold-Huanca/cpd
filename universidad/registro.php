<?php
try {
    define ("MODULO", "Universidad");
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
  
  
    // combo box provincia
  leerClase('Pais');
  $pais    = new Pais();
  $paises   = $pais->getAll();  ///retorna todas las clases
  $pais_values[] = '';
  $pais_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($paises[0])) 
  {
    $pais_values[] = $row['id'];
    $pais_output[] = $row['nombre_pais'];
  }
  $smarty->assign("pais_values", $pais_values);
  $smarty->assign("pais_output", $pais_output);
  
  
  

$ERROR = ''; 

  leerClase('Universidad');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['universidad_id']) && is_numeric($_GET['universidad_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['universidad_id'];
  }
  
  $universidad   = new Universidad($id);
  
  
 
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $universidad->objBuidFromPost();
    $universidad->estado           = Objectbase::STATUS_AC;
    $universidad->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("universidad", $universidad);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'universidad/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>