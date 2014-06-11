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
    $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $CSS[]  = URL_CSS . "style.default.css";
    
  //$CSS[]  = URL_CSS . "pg.css";
 // $smarty->assign('CSS',$CSS);

  
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
    $JS[]  = URL_JS . "validator.min.js";
    $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
    $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

$ERROR = ''; 

  leerClase('Docencia_axuliar_externa');
  leerClase('Funcionario');
  
  $id     = '';
  $editar = FALSE;
   $menus='';
  if ( isset($_GET['docencia_axuliar_externa_id']) && is_numeric($_GET['docencia_axuliar_externa_id']) )
  {
        $menus="mostrar";
    $editar = TRUE;
    $id     = $_GET['docencia_axuliar_externa_id'];
  }
  
  $docencia_axuliar_externa    = new Docencia_axuliar_externa($id);
   $funcionario= new Funcionario($docencia_axuliar_externa->funcionario_id);
  
  $smarty->assign("funcionario",$funcionario);
  $smarty->assign("menus", $menus);
      // combo box universidad
  leerClase('Universidad');
  $universidad   = new Universidad();
  $universidades   = $universidad->getAll();  ///retorna todas las clases
  $universidades_values[] = '';
  $universidades_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($universidades[0])) 
  {
   $universidades_values[] = $row['id'];
   $universidades_output[] = $row['nombre_uni'];
  }
  $smarty->assign("universidades_values", $universidades_values);
  $smarty->assign("universidades_output", $universidades_output);
  
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
   $condicion_values[] = '';
  $condicion_output[] = '- Seleccione -';
  
    $condicion_values[] = 'Docente';
   $condicion_output[] = 'Docente';
     $condicion_values[] = 'Auxiliar';
   $condicion_output[] = 'Auxiliar';
  
  $smarty->assign("condicion_values", $condicion_values);
  $smarty->assign("condicion_output", $condicion_output);
  // combo box unidad_tiempo
  leerClase('Unidad_tiempo');
  $unidad_tiempo   = new Unidad_tiempo();
  $unidad_tiempos   = $unidad_tiempo->getAll();  ///retorna todas las clases
  $unidad_tiempos_values[] = '';
  $unidad_tiempos_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($unidad_tiempos[0])) 
  {
    $unidad_tiempos_values[] = $row['id'];
    $unidad_tiempos_output[] = $row['nombre_unidad_tiempo'];
  }
  $smarty->assign("unidad_tiempos_values", $unidad_tiempos_values);
  $smarty->assign("unidad_tiempos_output", $unidad_tiempos_output);
  
  $duracion_values[] = '';
  $duracion_output[] = '- Seleccione -';

   
 
    for ($index = 1; $index < 100; $index++){
         $duracion_values[] = $index;
         $duracion_output[] =$index;
    }
  $smarty->assign("duracion_values", $duracion_values);
  $smarty->assign("duracion_output", $duracion_output);
    // combo box nivel_formacion
  leerClase('Nivel_formacion');
  $nivel_formacion   = new Nivel_formacion();
  $nivel_formaciones   = $nivel_formacion->getAll();  ///retorna todas las clases
  $nivel_formaciones_values[] = '';
  $nivel_formaciones_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($nivel_formaciones[0])) 
  {
    $nivel_formaciones_values[] = $row['id'];
    $nivel_formaciones_output[] = $row['sigla_nivel_formacion'];
  }
  $smarty->assign("nivel_formaciones_values", $nivel_formaciones_values);
  $smarty->assign("nivel_formaciones_output", $nivel_formaciones_output);
  
  // combo box subarea
  leerClase('Subarea');
  $subarea   = new Subarea();
  $subareas   = $subarea->getAll();  ///retorna todas las clases
  $subareas_values[] = '';
  $subareas_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($subareas[0])) 
  {
    $subareas_values[] = $row['id'];
    $subareas_output[] = $row['nombre_subarea'];
  }
  $smarty->assign("subareas_values", $subareas_values);
  $smarty->assign("subareas_output", $subareas_output);
 
  // combo box funcionario
  leerClase('Funcionario');
  $funcionario  = new Funcionario();
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
    leerClase("Upload");
    mysql_query("BEGIN");
    $docencia_axuliar_externa->objBuidFromPost();
    
             
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
						$docencia_axuliar_externa->archivo = "uploads/".$name.".".$upload->ext;
					}
				}
			}
		}
		
        
    $docencia_axuliar_externa->save();
    mysql_query("COMMIT");
   $ir = "Location: docencia_auxiliar_externa.php?menus=mostrar&funcionario_id=$docencia_axuliar_externa->funcionario_id";
    header($ir);
     exit();
       
    }

  $smarty->assign("docencia_axuliar_externa", $docencia_axuliar_externa);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'solicitante/docencia_auxiliar_externa_detalle.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>