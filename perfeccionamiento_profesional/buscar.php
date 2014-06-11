<?php
 define ("MODULO", "Perfeccionamiento Profesional");
 require('../_start.php');
 if (isset($_POST["idnumero"]) && is_numeric($_POST["idnumero"]))
 {
     $idarea=$_POST["idnumero"];
 $B_BUSCAR= mysql_query ("SELECT * FROM subarea where area_id='".$idarea."' order by nombre_subarea asc");
$R_BUSCAR=mysql_fetch_assoc($B_BUSCAR);
$C_BUSCAR=mysql_num_rows($B_BUSCAR);

if($C_BUSCAR){
do{
    if($idarea==$R_BUSCAR['area_id'])
    {
      
echo "<option value='".$R_BUSCAR['id']."' selected>".htmlentities($R_BUSCAR['nombre_subarea'])."</option>";
  
    }else{
   
echo "<option value='".$R_BUSCAR['id']."'>".htmlentities($R_BUSCAR['nombre_subarea'])."</option>";
     
    }

 }while($R_BUSCAR=mysql_fetch_assoc($B_BUSCAR));
}else{
echo "<option value=''>".htmlentities("Seleccione Sub Area")."</option>";
}
 }
?>
