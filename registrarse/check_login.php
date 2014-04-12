<?php
 require('../_start.php');
if($_REQUEST)
{
	$login 	= $_REQUEST['login'];
	$query = "select * from usuario where login = '".strtolower($login)."'";
	$results = mysql_query( $query) or die('ok');
	
	if(mysql_num_rows(@$results) > 0) // not available
	{
		echo '<label id="Error">Nombre de Usuario ya existente</label>';
	}
	else
	{
		echo '<label id="Success">Nombre de Usuario Disponible</label>';
	}
	
}else
{
     header("Location: ../index.php"); 
}
?>
