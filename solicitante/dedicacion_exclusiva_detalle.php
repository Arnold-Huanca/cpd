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
   $CSS[]  = URL_CSS . "style.default.css"; 
  //$CSS[]  = URL_CSS . "pg.css";
 // $smarty->assign('CSS',$CSS);

  
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
   $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
   
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());
$ERROR = ''; 

  leerClase('Dedicacion_exclusiva');
  leerClase('Funcionario');
  $id     = '';
  $editar = FALSE;
$menus='';
  if ( isset($_GET['dedicacion_exclusiva_id']) && is_numeric($_GET['dedicacion_exclusiva_id']) )
  {
      $menus='mostrar';
    $editar = TRUE;
    $id     = $_GET['dedicacion_exclusiva_id'];
  }
  
  
  
  $dedicacion_exclusiva    = new Dedicacion_exclusiva($id);
   $funcionario= new Funcionario($dedicacion_exclusiva ->funcionario_id);
  
  $smarty->assign("funcionario",$funcionario);
  $smarty->assign("menus", $menus);
  //combo box tipo_gestion
  leerClase('Tipo_gestion');
  $tipo_gestion    = new Tipo_gestion();
  $tipo_gestiones   = $tipo_gestion->getAll();  ///retorna todas las clases
  $tipo_gestiones_values[] = '';
  $tipo_gestiones_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($tipo_gestiones[0])) 
  {
    $tipo_gestiones_values[] = $row['id'];
    $tipo_gestiones_output[] = $row['descripcion'];
  }
  $smarty->assign("tipo_gestiones_values", $tipo_gestiones_values);
  $smarty->assign("tipo_gestiones_output", $tipo_gestiones_output);
  
  // combo box ambito
  leerClase('Ambito');
  $ambito   = new Ambito();
  $ambitos   = $ambito->getAll();  ///retorna todas las clases
  $ambitos_values[] = '';
  $ambitos_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($ambitos[0])) 
  {
    $ambitos_values[] = $row['id'];
    $ambitos_output[] = $row['nombre_ambito'];
  }
  $smarty->assign("ambitos_values", $ambitos_values);
  $smarty->assign("ambitos_output", $ambitos_output);
  

 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
      
      
       leerClase("Upload");
    mysql_query("BEGIN");
     $dedicacion_exclusiva->objBuidFromPost();
    
             
		$max_length = (1024*1024)*10;
		$upload = new Upload(); // upload
		$upload -> SetDirectory("../uploads");
		$file = $_FILES['archivo']['name'];
		if ($_FILES['archivo']['name'] != "")
		  {
			$tipo_archivo = $_FILES['archivo']['type'];
		            {
				$tamanio = $_FILES['archivo']['size'];
				if ($tamanio > $max_length) {
					$todoOK = false;
					echo "<script>alert('el archivo  es demasiado grande');</script>";
				} else {
					$name = getSessionUser()->id.time();
					$upload -> SetFile("archivo");
					if ($upload -> UploadFile($name)){
						$dedicacion_exclusiva->archivo = "uploads/".$name.".".$upload->ext;
					}
				}
			}
		}
		
        
   $dedicacion_exclusiva->save();
    mysql_query("COMMIT");
   $ir = "Location: dedicacion_exclusiva.php?menus=mostrar&funcionario_id= $dedicacion_exclusiva->funcionario_id";
    header($ir);
     exit();
     
    
    }

  $smarty->assign("dedicacion_exclusiva", $dedicacion_exclusiva);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'solicitante/dedicacion_exclusiva_detalle.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>