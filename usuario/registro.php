<?php
try {
   define ("MODULO", "Usuario");
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
  leerClase('Pertenece');
  leerClase('Funcionario');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

$ERROR = ''; 

  leerClase('Usuario');
    $id     = '';
  $editar = FALSE;
  if ( isset($_GET['usuario_id']) && is_numeric($_GET['usuario_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['usuario_id'];
  }
  
  $usuario    = new Usuario($id);
  
  
      // combo box facultad
  leerClase('Grupo');
  $grupo    = new Grupo();
  $grupos   =$grupo->getAll();  ///retorna todas las clases
  $grupos_values[] = '';
  $grupos_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($grupos[0])) 
  {
    $grupos_values[] = $row['id'];
    $grupos_output[] = $row['codigo'];
  }
  $smarty->assign("grupos_values", $grupos_values);
  $smarty->assign("grupos_output", $grupos_output);
  
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    mysql_query("BEGIN");
    $usuario->objBuidFromPost();
    $usuario->estado           = Objectbase::STATUS_AC;
    $usuario->save();
    
      $grupoid= $_POST['grupo_id'];     
             
            $perteneces= new Pertenece();
            $perteneces->grupo_id= $grupoid;
            $perteneces->usuario_id=$usuario->id;
            $perteneces->estado=  Objectbase::STATUS_AC;
            $perteneces->save();
            
            $funicionarios= new Funcionario();
            $funicionarios->usuario_id=$usuario->id;
            $funicionarios->nombre=$usuario->nombre;
            $funicionarios->apellido_p=$usuario->apellido_p;
            $funicionarios->apellido_m=$usuario->apellido_m;
            $funicionarios->ci=$usuario->ci;
            $funicionarios->email1=$usuario->email;
         //   $formacion_postgrado->email= $usuario->email;
            $funicionarios->estado=  Objectbase::STATUS_AC;
            $funicionarios->save();
    
    
    
    
    mysql_query("COMMIT");
    
    $ir = "Location: index.php";
     header($ir);
      exit();
    }

  $smarty->assign("usuario", $usuario);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'usuario/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>