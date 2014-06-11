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

  leerClase('Desemp_prof_externo');
  leerClase('Funcionario');
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['desemp_prof_externo_id']) && is_numeric($_GET['desemp_prof_externo_id']) )
  {
    $editar = TRUE;
      $menus="mostrar";
    $id     = $_GET['desemp_prof_externo_id'];
  }
  
  $desemp_prof_externo    = new Desemp_prof_externo($id);
 
  
   $funcionario= new Funcionario( $desemp_prof_externo ->funcionario_id);
  
  $smarty->assign("funcionario",$funcionario);
  $smarty->assign("menus", $menus);
  
  
   leerClase('Area');
  $area   = new Area();
  $areas   = $area->getAll();  ///retorna todas las clases
  $area_values[] = '';
  $area_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($areas[0])) 
  {
    $area_values[] = $row['id'];
    $area_output[] = $row['nombre'];
  }
  $smarty->assign("area_values", $area_values);
  $smarty->assign("area_output", $area_output);

  
  
  $nivel_values[] = '';
  $nivel_output[] = '- Seleccione -';
  
    $nivel_values[] = 'Ejecutivo';
    $nivel_output[] = 'Ejecutivo';
    $nivel_values[] = 'Operativo';
    $nivel_output[] = 'Operativo';
 
  $smarty->assign("nivel_values", $nivel_values);
  $smarty->assign("nivel_output", $nivel_output);
  
  
  // combo box pais
  leerClase('Pais');
  $pais   = new Pais();
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
 //echo $usuario->nombre;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
          
    leerClase("Upload");
    mysql_query("BEGIN");
     $desemp_prof_externo->objBuidFromPost();
    
             
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
						 $desemp_prof_externo->archivo = "uploads/".$name.".".$upload->ext;
					}
				}
			}
		}
		
        
     $desemp_prof_externo->save();
    mysql_query("COMMIT");
   $ir = "Location: desempenio_profesional.php?menus=mostrar&funcionario_id=$desemp_prof_externo->funcionario_id";
    header($ir);
     exit();
    
    }

  $smarty->assign("desemp_prof_externo", $desemp_prof_externo);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'solicitante/desempenio_profesional_detalle.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>