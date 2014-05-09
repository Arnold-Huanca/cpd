<?php

//$challenge = 'unidadtiempo'; 
//echo str_replace(' ', '_', $challenge).'<br>'; 
try {
  require('_start.php');
   /** HEADER */
  
  
  $smarty->assign('title','');
  $smarty->assign('description','');
  $smarty->assign('keywords','');

  //CSS
  $CSS[]  = URL_CSS . "style.css";
  $CSS[]  = URL_CSS . "style.responsive.css";
  
    
  //$CSS[]  = URL_CSS . "pg.css";
 // $smarty->assign('CSS',$CSS);

  
   $JS[]  = URL_JS . "jquery7.js";
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/script.responsive.js";

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);

    
  leerClase('Usuario');
  $usuario= new Usuario();
 
   leerClase('Menu');
  $menuizquierda = new Menu('');
   if(isUserSession())
   {
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());
   }
  // $rolusuario= getSessionUser()->getMisGrupos()->codigo;
  
  
       $smarty->assign("ERRORLOGIN",'');
  if (isset($_POST["username"]) && $_POST["username"] != "" && isset($_POST["passwd"]) && $_POST["passwd"] != "" && isset($_POST['tarea']) && $_SESSION['loginusuario'] == $_POST['token'] )
  {
   
   // $docente = new Docente();
   // $formulario = new Formulario('');
   // $formulario->validar('login'   ,$_POST["login"]   ,'texto','Login ');
   // $formulario->validarPassword('clave',$_POST["clave"], false,TRUE);

    if (!initSession($_POST["username"] ,($_POST["passwd"])))
    {
     //  echo "Hola mundo";
     // throw new Exception("?login&m=El usuario y el password no corresponden a un Usuario registrado.");
    $smarty->assign("ERRORLOGIN",'Error Vuelva a Intentar ');
    }  else {
     //  echo "Hola mundos";
      $ir = "Location: index.php";
     header($ir);
    exit();
    }
      
 
    }
    //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
$_SESSION['loginusuario'] = sha1(URL . time());
$smarty->assign('token',$_SESSION['loginusuario']);

$TEMPLATE_TOSHOW = 'index.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>