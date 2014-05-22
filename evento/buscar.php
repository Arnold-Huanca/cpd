<?php
 define ("MODULO", "Evento");
 require('../_start.php');
 $B_BUSCAR= mysql_query ("SELECT * FROM subarea where area_id='".$_POST["idnumero"]."' order by nombre_subarea asc");
$R_BUSCAR=mysql_fetch_assoc($B_BUSCAR);
$C_BUSCAR=mysql_num_rows($B_BUSCAR);
if($C_BUSCAR){
do{
if($_POST["idpobla"]==$R_BUSCAR['id']){
    $TRUE=" selected='TRUE'";
    
}else{
    $TRUE="";
    
    }
echo "<option value='".$R_BUSCAR['id']."' $TRUE>".htmlentities($R_BUSCAR['nombre_subarea'])."</option>";

 }while($R_BUSCAR=mysql_fetch_assoc($B_BUSCAR));
}else{
echo "<option value=''>".htmlentities("Seleccione Sub Area")."</option>";
}
?>
