<?php
try {
  define ("MODULO", "Solicitante");
  require('../_start.php');
  if(!isUserSession())
  header("Location: ../index.php");  
  leerClase('Dominio_idioma');
 
  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','');
  $smarty->assign('description','');
  $smarty->assign('keywords','');

    //CSS
   $CSS[]  = URL_CSS . "style.css";
  $CSS[]  = URL_CSS . "style.responsive.css";
 $CSS[]  = URL_CSS . "tables.css";
    
  $CSS[]  = URL_CSS . "demo_table.css";
  $CSS[]  = URL_CSS . "style_table.css";
  $CSS[]  = URL_CSS . "style.default.css";
   $smarty->assign('CSS',$CSS);
  leerClase('Menu');
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getAdminIndex());

  //JS
  //
  leerClase("Idioma");
  leerClase("Dominio_idioma");
  
    leerClase('Funcionario');
  $id     = '';
  $menus='';
  $editar = FALSE;
  if ( isset($_GET['menus']) && $_GET['menus']== "mostrar" && isset($_GET['funcionario_id']) && is_numeric($_GET['funcionario_id']) )
  {
    $menus="mostrar";
    $id     = $_GET['funcionario_id'];
  }
  $funcionarios   = new Funcionario($id);
 
 //$datosgenerales= $funcionario->getDatosGenerales();
   $smarty->assign("menus", $menus);
     $smarty->assign("funcionario",  $funcionarios);
  
  
  
  
  
  
  if (isset($_GET['dominio'])    && isset($_GET['idioma_id']))
  {
       $dominio= new Dominio_idioma($_GET['dominio']);
      if(isset($_GET['dominio']) && $_GET['dominio']==0)
      {
        
          $dominio->id_idioma=$_GET['idioma_id'];
           $dominio->funcionario_id=  getSessionUser()->getFuncionario()->id;
                 
          if(isset($_GET['habla']))
          {
              $dominio->habla=$_GET['habla'];
          }
          if(isset($_GET['lee']))
          {
           $dominio->lee=   $_GET['lee'];
          }
          if(isset($_GET['escribe']))
          {
              $dominio->escribe=$_GET['escribe'];
          }
          
          $dominio->save();
          
          
      }  else {
          
         
          $dominio->id_idioma=$_GET['idioma_id'];
           $dominio->funcionario_id=  getSessionUser()->getFuncionario()->id;
           if(isset($_GET['habla']))
          {
              $dominio->habla=$_GET['habla'];
          }
          if(isset($_GET['lee']))
          {
           $dominio->lee=   $_GET['lee'];
          }
          if(isset($_GET['escribe']))
          {
              $dominio->escribe=$_GET['escribe'];
          }
          
           $dominio->save();
      }
      $ir = "Location: index.php";
     header($ir);
      exit();
      
  }
  
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
   $JS[]  =URL_JS . 'table/jquery.dataTables.js';
  
  $smarty->assign('JS',$JS);
  
 
  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}


$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);

  $smarty->display('solicitante/dominio_idioma.tpl');
?>