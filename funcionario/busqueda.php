<?php
 define ("MODULO", "Funcionario");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 
$B_BUSCAR= mysql_query ("SELECT * FROM departamento where pais_id='".$_POST["idnumero"]."' order by nombre_depto asc");
$R_BUSCAR=mysql_fetch_assoc($B_BUSCAR);
$C_BUSCAR=mysql_num_rows($B_BUSCAR);
if($C_BUSCAR){
do{
if($_POST["idpobla"]==$R_BUSCAR['id']){
    $TRUE=" selected='TRUE'";
    
}else{
    $TRUE="";
    
    }
echo "<option value='".$R_BUSCAR['id']."' $TRUE>".htmlentities($R_BUSCAR['nombre_depto'])."</option>";

 }while($R_BUSCAR=mysql_fetch_assoc($B_BUSCAR));
}else{
echo "<option value=''>".htmlentities("Seleccione Departamento")."</option>";
}
?>
