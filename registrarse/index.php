
<?php
try {
  require('../_start.php');
 // if(!isUserSession())
   // header("Location: ../index.php");  

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
    $CSS[]  = URL_CSS . "css.css";
    
  //$CSS[]  = URL_CSS . "pg.css";
 // $smarty->assign('CSS',$CSS);

  
   $JS[]  = URL_JS . "script/jquery.js";
   $JS[]  = URL_JS . "script/script.js";
   $JS[]  = URL_JS . "script/script.responsive.js";
   $JS[]  = URL_JS . "validator.min.js";
         

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS', $JS);

$ERROR = ''; 

  leerClase('Usuario');
  leerClase("Grupo");
  leerClase("Pertenece");
  leerClase("Funcionario");
    $id     = '';
  $editar = FALSE;
  if ( isset($_GET['usuario_id']) && is_numeric($_GET['usuario_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['usuario_id'];
  }
  
  $usuario    = new Usuario($id);
 //echo $usuario->nombre;
  $errorlogin="";
  $erroremail="";
  $mensaje="";
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
      $vandera=false;
      mysql_query("BEGIN");
    $validado= new  Usuario();
    
     $usuario->objBuidFromPost();
     if($validado->getByEmil($_POST["email"]) )
    
     {
           if($validado->getByLogin($_POST["login"]) )   
         {
             
            $usuario->estado           = Objectbase::STATUS_AC;
            $usuario->save();
            
            $grupos= new Grupo();
            
            $perteneces= new Pertenece();
            $perteneces->grupo_id=$grupos->getActivo()->id;
            $perteneces->usuario_id=$usuario->id;
            $perteneces->estado=  Objectbase::STATUS_AC;
            $perteneces->save();
            
            $funicionarios= new Funcionario();
            $funicionarios->usuario_id=$usuario->id;
            $funicionarios->nombre=$usuario->nombre;
            $funicionarios->apellido_p=$usuario->apellido_p;
            $formacion_postgrado->email= $usuario->email;
            $funicionarios->estado=  Objectbase::STATUS_AC;
            $funicionarios->save();
            
            leerClase("Procedimiento");
        
        $sqlr="    select s.* from  secuencia  s ORDER BY   s.nivel ASC;";
       $resultado = mysql_query($sqlr);
       $var =0;
        while ($row = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
        {
            
         $procedimiento = new Procedimiento();
         $procedimiento->funcionario_id= $funicionarios->id;
         $procedimiento->secuencia_id=$row["id"];
         if($var==0)
         {
         $procedimiento->llenado="si";
         }else
         {
           $procedimiento->llenado="no";   
         }
         $procedimiento->estado=  Objectbase::STATUS_AC;
         $procedimiento->save();
                    
     $var++;
        }
            
            
            $vandera=true;
         }else
         {
              $errorlogin="El Nombre de Usuario  No esta Disponible?";
           
             
         }
   
    
     }else
     {
           $erroremail="El email no esta Disponible";
         
     }
    
    mysql_query("COMMIT");
    
    if($vandera)
    {
echo "<script>alert('Su Registro  fue Satisfactorio Inicie Sesion');</script>";
       
    $ir = "Location: ../index.php";
     header($ir);
      exit();
    }
   
    }

  $smarty->assign("usuario", $usuario);
  $smarty->assign("email", $erroremail);
  $smarty->assign("login", $errorlogin);
  $smarty->assign("mensaje", $mensaje);
    
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
    echo $e;
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'registrarse/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>