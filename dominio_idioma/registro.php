<?php
try {
   define ("MODULO", "Dominio Idioma");
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

  leerClase('Dominio_idioma');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['dominio_idioma_id']) && is_numeric($_GET['dominio_idioma_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['dominio_idioma_id'];
  }
  
  $dominio_idioma   = new Dominio_idioma($id);
  
      // combo box idioma
  leerClase('Idioma');
  $idioma    = new Idioma();
  $idiomas   = $idioma->getAll();  ///retorna todas las clases
  $idiomas_values[] = '';
  $idiomas_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($idiomas[0])) 
  {
    $idiomas_values[] = $row['id'];
    $idiomas_output[] = $row['nombre_idioma'];
  }
  $smarty->assign("idiomas_values", $idiomas_values);
  $smarty->assign("idiomas_output", $idiomas_output);
  
    // combo box funcionario
  leerClase('Funcionario');
  $funcionario    = new Funcionario();
  $funcionarios   = $funcionario->getAll();  ///retorna todas las clases
  $funcionarios_values[] = '';
  $funcionarios_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($funcionarios[0])) 
  {
    $funcionarios_values[] = $row['id'];
    $funcionarios_output[] = $row['nombre'];
  }
  $smarty->assign("funcionarios_values", $funcionarios_values);
  $smarty->assign("funcionarios_output", $funcionarios_output);
 
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $dominio_idioma->objBuidFromPost();
    $dominio_idioma->estado           = Objectbase::estado_pendiente;
   $dominio_idioma->funcionario_id=  getSessionUser()->getFuncionario()->id;
    $dominio_idioma->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("dominio_idioma", $dominio_idioma);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'dominio_idioma/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>