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
    
  //$CSS[]  = URL_CSS . "pg.css";
 // $smarty->assign('CSS',$CSS);

  
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
    $JS[]  = URL_JS . "validator.min.js";
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);
   leerClase('Menu');
   leerClase("Funcionario");
   leerClase("Universidad");
   leerClase("Tipo_distincion");
   leerClase("Pais");

  leerClase('Distincion');	   
   
  $menuizquierda = new Menu('');
  
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());
  
$ERROR = ''; 

  $id     = ''; 
  if ( isset($_GET['distincion_id']) && is_numeric($_GET['distincion_id']))
  {
 
    $id     = $_GET['distincion_id'];
  }
 
   $distincion= new Distincion($id);
   
   
     $funcionario= new Funcionario($distincion->funcionario_id);
  
  $smarty->assign("funcionario",$funcionario);
  
  
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
  
        //combo box universidad
  leerClase('Universidad');
  $universidad    = new Universidad();
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
  
          //combo box tipo_distincion
  leerClase('Tipo_distincion');
  $tipo_distincion   = new Tipo_distincion();
  $tipo_distinciones   = $tipo_distincion->getAll();  ///retorna todas las clases
  $tipo_distinciones_values[] = '';
  $tipo_distinciones_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($tipo_distinciones[0])) 
  {
    $tipo_distinciones_values[] = $row['id'];
    $tipo_distinciones_output[] = $row['sigla'];
  }
  $smarty->assign("tipo_distinciones_values", $tipo_distinciones_values);
  $smarty->assign("tipo_distinciones_output", $tipo_distinciones_output);
 
  
  $ambitos_values[] = '';
 $ambitos_output[] = '- Seleccione -';
 
    $ambitos_values[] = 'Regional';
   $ambitos_output[] = 'Regional';
     $ambitos_values[] = 'Nacional';
   $ambitos_output[] = 'Nacional';
     $ambitos_values[] = 'Internacional';
   $ambitos_output[] = 'Internacional';
  
  $smarty->assign("ambitos_values", $ambitos_values);
  $smarty->assign("ambitos_output", $ambitos_output);
  
  
  
  
 
  
 //echo $usuario->nombre;
  $menus='';
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
      
      
       leerClase("Upload");
    mysql_query("BEGIN");
     $distincion->objBuidFromPost();
    
             
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
						  $distincion->archivo = "uploads/".$name.".".$upload->ext;
					}
				}
			}
		}
		
        
     $distincion->save();
    mysql_query("COMMIT");
   $ir = "Location: distincion.php?menus=mostrar&funcionario_id=  $distincion->funcionario_id";
    header($ir);
     exit();
   
    }
  $smarty->assign("menus", $menus);
  $smarty->assign("distincion", $distincion);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'solicitante/distincion_detalle.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>