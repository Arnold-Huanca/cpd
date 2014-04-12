<?php
try {
 define ("MODULO", "Funcionario");
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
  // $CSS[]  = URL_CSS . "styleform.css";
    
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

  leerClase('Funcionario');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['funcionario_id']) && is_numeric($_GET['funcionario_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['funcionario_id'];
  }
  
  $funcionario    = new Funcionario($id);
  
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
  
  //combo box departamento
  leerClase('Departamento');
  $departamento    = new Departamento();
 $departamento->pais_id = '%';
  $departamentos   = $departamento->getAll();  ///retorna todas las clases
  $departamentos_values[] = '';
  $departamentos_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($departamentos[0])) 
  {
    $departamentos_values[] = $row['id'];
    $departamentos_output[] = $row['nombre_depto'];
  }
  $smarty->assign("departamentos_values", $departamentos_values);
  $smarty->assign("departamentos_output", $departamentos_output);
  
    //combo box municipio
  leerClase('Municipio');
  $municipio    = new Municipio();
  $municipios   = $municipio->getAll();  ///retorna todas las clases
  $municipios_values[] = '';
  $municipios_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($municipios[0])) 
  {
    $municipios_values[] = $row['id'];
    $municipios_output[] = $row['nombre_municipio'];
  }
  $smarty->assign("municipios_values", $municipios_values);
  $smarty->assign("municipios_output", $municipios_output);

        //combo box usuario
  leerClase('Usuario');
  $usuario    = new Usuario();
  $usuarios   = $usuario->getAll();  ///retorna todas las clases
  $usuarios_values[] = '';
  $usuarios_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($usuarios[0])) 
  {
    $usuarios_values[] = $row['id'];
    $usuarios_output[] = $row['nombre'];
  }
  $smarty->assign("usuarios_values", $usuarios_values);
  $smarty->assign("usuarios_output", $usuarios_output);
  
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $funcionario->objBuidFromPost();
    $funcionario->estado           = Objectbase::STATUS_AC;
    $funcionario->save();
    mysql_query("COMMIT");
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("funcionario", $funcionario);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'funcionario/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>