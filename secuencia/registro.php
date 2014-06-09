<?php
try {
 define ("MODULO", "Secuencia");
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
    $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
    $CSS[]  = URL_CSS . "style.default.css";
  //$CSS[]  = URL_CSS . "pg.css";
 // $smarty->assign('CSS',$CSS);

  
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
          //Datepicker UI
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

$ERROR = ''; 

  leerClase('Secuencia');
  leerClase("Modulo");
  $id     = '';
  $editar = FALSE;
  $ver='';
  if ( isset($_GET['secuencia_id']) && is_numeric($_GET['secuencia_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['secuencia_id'];
  }
  
  
  
  $secuencia    = new Secuencia($id);
 
  
       
 $sqlr="select m.*
from  modulo m
where  m.id  not in (select c.modulo_id from secuencia c );";
 $resultado = mysql_query($sqlr);
  $modulo_values[] = '';
  $modulo_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
  {
    $modulo_values[] = $row['id'];
    $modulo_output[] = $row['codigo'];
  }
  if($editar)
  {
      $module= new Modulo($secuencia->modulo_id);
      $modulo_values[] = $module->id;
    $modulo_output[] = $module->codigo;
  }
  
  $smarty->assign("modulo_values", $modulo_values);
  $smarty->assign("modulo_output", $modulo_output);
  
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $secuencia->objBuidFromPost();
    $secuencia->estado           = Objectbase::STATUS_AC;
    $secuencia->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("ver",$ver);
  $smarty->assign("secuencia", $secuencia);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'secuencia/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>