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
    $JS[]  = URL_JS . "validator.min.js";
    $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

$ERROR = ''; 

  leerClase('Titularizacion');
  leerClase('Funcionario');
  $id     = '';
  $editar = FALSE;
    $menus='';
  if ( isset($_GET['titularizacion_id']) && is_numeric($_GET['titularizacion_id']) )
  {
       $menus="mostrar";
    $editar = TRUE;
    $id     = $_GET['titularizacion_id'];
  }
     
  $titularizacion    = new Titularizacion($id);
   $funcionario= new Funcionario( $titularizacion->funcionario_id);
  
  $smarty->assign("funcionario",$funcionario);
 $smarty->assign("menus", $menus);
    // combo box facultad
  leerClase('Facultad');
  $facultad    = new Facultad();
  $facultades   = $facultad->getAll();  ///retorna todas las clases
  $facultades_values[] = '';
  $facultades_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($facultades[0])) 
  {
    $facultades_values[] = $row['id'];
    $facultades_output[] = $row['nombre'];
  }
  $smarty->assign("facultades_values", $facultades_values);
  $smarty->assign("facultades_output", $facultades_output);
 
      // combo box documento_titularidad
  leerClase('Documento_titularidad');
  $documento_titularidad    = new Documento_titularidad();
  $documento_titularidades   = $documento_titularidad ->getAll();  ///retorna todas las clases
  $documento_titularidades_values[] = '';
  $documento_titularidades_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($documento_titularidades[0])) 
  {
    $documento_titularidades_values[] = $row['id'];
    $documento_titularidades_output[] = $row['nombre_facultad'];
  }
  $smarty->assign("documento_titularidades_values", $documento_titularidades_values);
  $smarty->assign("documento_titularidades_output", $documento_titularidades_output);
  

  
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
      
       leerClase("Upload");
    mysql_query("BEGIN");
     $titularizacion->objBuidFromPost();
    
             
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
						 $titularizacion->archivo = "uploads/".$name.".".$upload->ext;
					}
				}
			}
		}
		
        
     $titularizacion->save();
    mysql_query("COMMIT");
   $ir = "Location: titularizacion.php?menus=mostrar&funcionario_id= $titularizacion->funcionario_id";
    header($ir);
     exit();
      
    }

  $smarty->assign("titularizacion", $titularizacion);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'solicitante/titularizacion_detalle.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>