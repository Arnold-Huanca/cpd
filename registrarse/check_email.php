<?php
 require('../_start.php');
if($_REQUEST)
{
	$username 	= $_REQUEST['email'];
	$query = "select * from usuario where email = '".strtolower($username)."'";
	$results = mysql_query( $query) or die('ok');
	
	if(mysql_num_rows(@$results) > 0) // not available
	{
		echo '<label id="Error">Email ya existente</label>';
	}
	else
	{
		echo '<label id="Success">Email Disponible</label>';
	}
	
}else
{
     header("Location: ../index.php"); 
}
?>
